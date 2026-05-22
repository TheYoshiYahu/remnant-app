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
    is mirrored from the JWT payload (or left NULL if the WP-side filter
    hasn't shipped it yet). Returns the ``users.id`` UUID as a str.
    """
    wp_user_id = int(current_user.id)
    user_uuid = await conn.fetchval(
        "INSERT INTO users (wordpress_user_id, display_name, last_seen_at) "
        "VALUES ($1, $2, now()) "
        "ON CONFLICT (wordpress_user_id) DO UPDATE SET "
        "  display_name = COALESCE(EXCLUDED.display_name, users.display_name), "
        "  last_seen_at = now() "
        "RETURNING id::text",
        wp_user_id,
        current_user.display_name,
    )
    return user_uuid
