"""One-call sanity check: confirms which API key is active (masked) and makes
a minimal isolated Gemini call, so you can verify the lab key is live before
running anything real. Run this AFTER closing and reopening VS Code/terminal.

Usage:
    python test_active_key.py
"""
import os
import sys

key = os.environ.get("GEMINI_API_KEY") or os.environ.get("GOOGLE_API_KEY")
source = "GEMINI_API_KEY" if os.environ.get("GEMINI_API_KEY") else "GOOGLE_API_KEY"

if not key:
    print("No GEMINI_API_KEY or GOOGLE_API_KEY set in this shell. Did you reopen VS Code?")
    sys.exit(1)

print(f"active var:  {source}")
print(f"active key:  ...{key[-4:]}  (masked, last 4 chars only)")

from google import genai
from google.genai import types

client = genai.Client(api_key=key, http_options=types.HttpOptions(timeout=20000))
response = client.models.generate_content(
    model="gemini-3.1-flash-lite",
    contents="Reply with exactly one word: OK",
)
print(f"call result: {response.text.strip()!r}")
print("If that printed OK, the key is live. Check AI Studio on the LAB account next.")
