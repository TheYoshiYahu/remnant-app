"""
asyncpg pool lifecycle. One pool per process; opened at app startup,
closed at shutdown. Exposed to route handlers via the FastAPI lifespan
dependency in main.py.
"""

from __future__ import annotations

import asyncpg

from config import settings


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
