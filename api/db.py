"""
asyncpg pool lifecycle. One pool per process; opened at app startup,
closed at shutdown. Exposed to route handlers via the FastAPI lifespan
dependency in main.py.

S113 — adds the shared ``upsert_user`` helper. Lazily mirrors the WP
user row into the local ``users`` table on first write-route call so
every per-user surface (subscriptions, highlights, notes, reading-
positions) reaches the same local UUID. Extracted from subscriptions.py
where it lived as ``_upsert_user`` since Session 37.
"""

from __future__ import annotations

from typing import TYPE_CHECKING

import asyncpg

from config import settings

if TYPE_CHECKING:
    from auth import User


_pool: asyncpg.Pool | None = None


async def open_pool() -> asyncpg.Pool:
    """Open the global asyncpg pool. Idempotent."""
    global _pool
    if _pool is None:
        _pool = await asyncpg.create_pool(
            dsn=settings.database_url,
            min_size=1,
            max_size=10,
            command_timeout=30,
        )
    return _pool


async def close_pool() -> None:
    """Close the global asyncpg pool. Idempotent."""
    global _pool
    if _pool is not None:
        await _pool.close()
        _pool = None


def get_pool() -> asyncpg.Pool:
    """Return the active pool. Raises if not opened."""
    if _pool is None:
        raise RuntimeError(
            "Database pool not initialised. Did the FastAPI lifespan run?"
        )
    return _pool


async def upsert_user(
    conn: asyncpg.Connection, current_user: "User"
) -> str:
    """Lazy-upsert the WP user into the local ``users`` table; return UUID.

    Every per-user write surface (subscriptions, highlights, notes,
    reading-positions) calls this on the partner's first hit so the
    local row exists for foreign-key references. The schema declares
    ``users.wordpress_user_id`` UNIQUE; we conflict on it. ``display_name``
    and ``email`` are mirrored from the JWT payload (or left NULL if an
    older token omits them). Both use COALESCE on update so a token missing
    the value never blanks an existing column — ``email`` backfills the
    first time a token carrying it is presented (the rop-sso-bridge cookie
    path adds it) and stays put thereafter. Returns the ``users.id`` UUID
    as a str.
    """
    wp_user_id = int(current_user.id)
    # email is Optional on the User model; older tokens omit it -> NULL ->
    # COALESCE keeps any previously-cached value.
    email = getattr(current_user, "email", None)
    user_uuid = await conn.fetchval(
        "INSERT INTO users (wordpress_user_id, email, display_name, last_seen_at) "
        "VALUES ($1, $2, $3, now()) "
        "ON CONFLICT (wordpress_user_id) DO UPDATE SET "
        "  email = COALESCE(EXCLUDED.email, users.email), "
        "  display_name = COALESCE(EXCLUDED.display_name, users.display_name), "
        "  last_seen_at = now() "
        "RETURNING id::text",
        wp_user_id,
        email,
        current_user.display_name,
    )
    # S467: daily activity log. Never allowed to break the request.
    try:
        await conn.execute(_ACTIVITY_UPSERT, user_uuid)
    except Exception:
        pass
    return user_uuid


# S467 — one row per person per day (Central time). visits = separate stretches
# of use (a new visit starts after 30 quiet minutes); active_seconds = time
# between requests inside a visit (approximate time in the app); hits = requests.
ACTIVITY_SCHEMA_SQL = [
    "CREATE TABLE IF NOT EXISTS user_activity_days ("
    "  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,"
    "  day DATE NOT NULL,"
    "  first_at TIMESTAMPTZ NOT NULL,"
    "  last_at TIMESTAMPTZ NOT NULL,"
    "  visits INT NOT NULL DEFAULT 1,"
    "  active_seconds INT NOT NULL DEFAULT 0,"
    "  hits INT NOT NULL DEFAULT 1,"
    "  PRIMARY KEY (user_id, day))",
    "CREATE INDEX IF NOT EXISTS idx_activity_day ON user_activity_days(day)",
]

_ACTIVITY_UPSERT = (
    "INSERT INTO user_activity_days (user_id, day, first_at, last_at) "
    "VALUES ($1::uuid, (now() AT TIME ZONE 'America/Chicago')::date, now(), now()) "
    "ON CONFLICT (user_id, day) DO UPDATE SET "
    "  visits = user_activity_days.visits + "
    "    CASE WHEN now() - user_activity_days.last_at > interval '30 minutes' THEN 1 ELSE 0 END, "
    "  active_seconds = user_activity_days.active_seconds + "
    "    CASE WHEN now() - user_activity_days.last_at <= interval '30 minutes' "
    "         THEN extract(epoch FROM now() - user_activity_days.last_at)::int ELSE 0 END, "
    "  last_at = now(), "
    "  hits = user_activity_days.hits + 1"
)
