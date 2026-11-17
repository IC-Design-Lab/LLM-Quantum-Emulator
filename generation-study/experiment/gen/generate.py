"""One isolated Gemini call per invocation: system = prompt variant text,
user = variant-appropriate circuit JSON payload. No chat/session object is
used anywhere, so there is never shared history between calls -- each call
to generate_verilog() is a fresh, independent request.
"""
import os
import time

from google import genai
from google.genai import errors, types

import prompt_variants as pv


class DailyQuotaExceeded(RuntimeError):
    """This model's free-tier requests-per-day cap is hit; retrying today is pointless."""
    def __init__(self, model):
        super().__init__(f"daily free-tier quota exhausted for model {model!r}")
        self.model = model


class ModelUnavailable(RuntimeError):
    """This model isn't callable at all on this account (404) -- not a rate limit."""
    def __init__(self, model, detail):
        super().__init__(f"model {model!r} is not callable: {detail}")
        self.model = model

DEFAULT_MODEL = "gemini-3.5-flash"

# gemini-2.5-flash / gemini-2.5-flash-lite are blocked for new accounts as of
# 2026-07, and gemini-2.0-flash-001 has a 0 free-tier quota on new accounts --
# confirmed empirically against this key. gemini-3.5-flash is the stable
# (non-alias, non-preview) model that actually works. Exact current free-tier
# RPM for it isn't confirmed -- keep this conservative; loosen if no 429s.
MIN_SECONDS_BETWEEN_CALLS = 4.5

_client = None
_last_call_ts = 0.0


def _get_client() -> genai.Client:
    global _client
    if _client is None:
        api_key = os.environ.get("GEMINI_API_KEY") or os.environ.get("GOOGLE_API_KEY")
        if not api_key:
            raise RuntimeError(
                "Set GEMINI_API_KEY (or GOOGLE_API_KEY) in the environment before running."
            )
        _client = genai.Client(api_key=api_key)
    return _client


def _throttle():
    global _last_call_ts
    elapsed = time.monotonic() - _last_call_ts
    wait = MIN_SECONDS_BETWEEN_CALLS - elapsed
    if wait > 0:
        time.sleep(wait)


def generate_verilog(circuit: str, variant: str, model: str = DEFAULT_MODEL, retries: int = 2) -> str:
    """Makes one isolated Gemini call and returns the extracted Verilog text."""
    system_prompt = pv.load_system_prompt(variant)
    user_payload = pv.build_user_payload(variant, circuit)

    client = _get_client()
    config = types.GenerateContentConfig(system_instruction=system_prompt)

    last_err = None
    for attempt in range(retries + 1):
        _throttle()
        try:
            response = client.models.generate_content(
                model=model,
                contents=user_payload,
                config=config,
            )
            _last_call_ts_set()
            return pv.extract_verilog(response.text)
        except errors.ClientError as e:
            _last_call_ts_set()
            msg = str(e)
            # Permanent failures -- retrying burns quota for nothing, fail fast instead.
            if "RESOURCE_EXHAUSTED" in msg and "PerDay" in msg:
                raise DailyQuotaExceeded(model) from e
            if "NOT_FOUND" in msg or " 404 " in msg or msg.startswith("404"):
                raise ModelUnavailable(model, msg) from e
            last_err = e  # e.g. per-minute 429 -- worth a backoff and retry
            if attempt < retries:
                time.sleep(15)
        except Exception as e:  # transient network/5xx -- back off and retry once or twice
            last_err = e
            _last_call_ts_set()
            if attempt < retries:
                time.sleep(15)
    raise RuntimeError(f"Gemini generation failed for {circuit}/{variant} after retries") from last_err


def _last_call_ts_set():
    global _last_call_ts
    _last_call_ts = time.monotonic()
