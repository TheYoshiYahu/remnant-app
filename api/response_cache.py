"""
S444 — in-process response cache for anonymous public reading requests.

Why: every first-time visitor opening a chapter makes the same handful of
public, read-only calls (books list, chapter text, witness / kingdom / words /
cross-reference layers, content-version). For anonymous readers those answers
are identical for everyone, yet each one hit Postgres. Under a traffic spike
(a video going wide) that is what tips a 0.5-CPU web service and a 256 MB
database over. This middleware answers repeats from memory for a short window.

Safety rules (deliberately narrow):
  * GET only, and only for the public reading prefixes in CACHEABLE_PREFIXES.
  * Only when the request carries NO credentials — no ``rop_jwt`` cookie and
    no Authorization header. Signed-in partners always go to the database,
    so tier-gated content can never leak from a cache.
  * Only 200 responses without Set-Cookie are stored.
  * CORS headers are never stored; the CORS middleware (which wraps this one)
    adds them fresh per request.
  * TTL defaults to 60 s (env RESPONSE_CACHE_TTL; 0 disables). Every deploy
    restarts the process and empties the cache, so a deploy is visible at once;
    a curated database edit made without a deploy shows within one minute.
"""

from __future__ import annotations

import os
import time
from collections import OrderedDict

CACHEABLE_PREFIXES = (
    b"/v1/books",
    b"/v1/content-version",
    b"/v1/strongs/",
)

_TTL = float(os.environ.get("RESPONSE_CACHE_TTL", "60"))
_MAX_ENTRIES = int(os.environ.get("RESPONSE_CACHE_MAX_ENTRIES", "4000"))
_MAX_BODY = 2 * 1024 * 1024  # never cache a body larger than 2 MB


def _has_credentials(headers) -> bool:
    for name, value in headers:
        if name == b"authorization":
            return True
        if name == b"cookie" and b"rop_jwt=" in value:
            return True
    return False


class AnonymousReadCache:
    def __init__(self, app):
        self.app = app
        self._store: "OrderedDict[bytes, tuple[float, int, list, bytes]]" = OrderedDict()

    async def __call__(self, scope, receive, send):
        if (
            _TTL <= 0
            or scope["type"] != "http"
            or scope["method"] != "GET"
            or not scope["path"].encode().startswith(CACHEABLE_PREFIXES)
            or _has_credentials(scope["headers"])
        ):
            await self.app(scope, receive, send)
            return

        key = scope["path"].encode() + b"?" + scope.get("query_string", b"")
        now = time.monotonic()
        hit = self._store.get(key)
        if hit is not None and hit[0] > now:
            self._store.move_to_end(key)
            _, status, headers, body = hit
            await send({"type": "http.response.start", "status": status,
                        "headers": headers + [(b"x-rop-cache", b"hit")]})
            await send({"type": "http.response.body", "body": body})
            return

        captured: dict = {"status": None, "headers": [], "chunks": [], "ok": True}

        async def capture(message):
            if message["type"] == "http.response.start":
                captured["status"] = message["status"]
                captured["headers"] = [
                    (k, v) for k, v in message.get("headers", [])
                    if not k.startswith(b"access-control-")
                ]
                if message["status"] != 200 or any(
                    k == b"set-cookie" for k, _ in captured["headers"]
                ):
                    captured["ok"] = False
            elif message["type"] == "http.response.body":
                captured["chunks"].append(message.get("body", b""))
            await send(message)

        await self.app(scope, receive, capture)

        if captured["ok"] and captured["status"] == 200:
            body = b"".join(captured["chunks"])
            if len(body) <= _MAX_BODY:
                self._store[key] = (now + _TTL, 200, captured["headers"], body)
                self._store.move_to_end(key)
                while len(self._store) > _MAX_ENTRIES:
                    self._store.popitem(last=False)
