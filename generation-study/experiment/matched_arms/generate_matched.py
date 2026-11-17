"""One isolated Gemini call per invocation for the matched-arms grid. Same
isolation guarantee as experiment/gen/generate.py (no chat/session object
anywhere -- system_instruction + contents are rebuilt fresh from disk on
every call, so there is never shared history between runs).
"""
import os
import re
import sys
import time

from google import genai
from google.genai import errors, types

sys.path.insert(0, os.path.dirname(__file__))
import assemble


class DailyQuotaExceeded(RuntimeError):
    def __init__(self, model):
        super().__init__(f"daily free-tier quota exhausted for model {model!r}")
        self.model = model


class ModelUnavailable(RuntimeError):
    def __init__(self, model, detail):
        super().__init__(f"model {model!r} is not callable: {detail}")
        self.model = model


DEFAULT_MODEL = "gemini-3.5-flash"
MIN_SECONDS_BETWEEN_CALLS = 4.5

_client = None
_last_call_ts = 0.0


def _get_client() -> genai.Client:
    global _client
    if _client is None:
        api_key = os.environ.get("GEMINI_API_KEY") or os.environ.get("GOOGLE_API_KEY")
        if not api_key:
            raise RuntimeError("Set GEMINI_API_KEY (or GOOGLE_API_KEY) in the environment before running.")
        # Explicit timeout. 20s (tuned for gemini-3.1-flash-lite) was too tight
        # for gemini-3.5-flash: sparse-level calls (no attachments, no guidance)
        # consistently hit 504 DEADLINE_EXCEEDED at 20s while medium_strict
        # calls (gate library attached) succeeded fine. 180s was in turn too
        # tight for gemini-3.1-pro-preview on Shor/full specifically (confirmed
        # 504 at 280s in a direct test) -- Pro's reasoning tokens run notably
        # longer than Flash's on the harder/larger QFT/Shor circuits. Bumped to
        # 300s, matching the practical ceiling for a single foreground call.
        _client = genai.Client(api_key=api_key, http_options=types.HttpOptions(timeout=300000))
    return _client


def _throttle():
    global _last_call_ts
    elapsed = time.monotonic() - _last_call_ts
    wait = MIN_SECONDS_BETWEEN_CALLS - elapsed
    if wait > 0:
        time.sleep(wait)


def _mark_call():
    global _last_call_ts
    _last_call_ts = time.monotonic()


def extract_verilog(response_text: str) -> str:
    m = re.search(r"```(?:verilog|systemverilog|sv)?\s*\n(.*?)```", response_text, re.DOTALL)
    return m.group(1).strip() + "\n" if m else response_text.strip() + "\n"


# Exponential backoff for retryable errors (429 per-minute rate limit, 503
# high-demand/unavailable). 3 total attempts, growing delay between them.
_BACKOFF_SECONDS = (5, 15, 45)


def generate_verilog_matched(circuit: str, input_format: str, level: str,
                              model: str = DEFAULT_MODEL, retries: int = 2):
    """Assembles the Slot1+Slot2+Slot3 payload (with pre-flight assertions),
    makes one isolated call, and returns (verilog_text, attachment_names).
    """
    system_instruction, contents, attachment_names = assemble.build_payload(circuit, input_format, level)

    client = _get_client()
    config = types.GenerateContentConfig(system_instruction=system_instruction)

    last_err = None
    for attempt in range(retries + 1):
        _throttle()
        try:
            response = client.models.generate_content(model=model, contents=contents, config=config)
            _mark_call()
            return extract_verilog(response.text), attachment_names
        except errors.ClientError as e:
            _mark_call()
            msg = str(e)
            if "RESOURCE_EXHAUSTED" in msg and "PerDay" in msg:
                raise DailyQuotaExceeded(model) from e
            if "NOT_FOUND" in msg or " 404 " in msg or msg.startswith("404"):
                raise ModelUnavailable(model, msg) from e
            # per-minute 429 or similar -- retryable, exponential backoff
            last_err = e
            if attempt < retries:
                time.sleep(_BACKOFF_SECONDS[min(attempt, len(_BACKOFF_SECONDS) - 1)])
        except errors.ServerError as e:
            # 503 UNAVAILABLE / high demand -- retryable, exponential backoff
            last_err = e
            _mark_call()
            if attempt < retries:
                time.sleep(_BACKOFF_SECONDS[min(attempt, len(_BACKOFF_SECONDS) - 1)])
        except Exception as e:
            last_err = e
            _mark_call()
            if attempt < retries:
                time.sleep(_BACKOFF_SECONDS[min(attempt, len(_BACKOFF_SECONDS) - 1)])
    raise RuntimeError(f"Gemini generation failed for {circuit}/{input_format}/{level} after retries") from last_err
