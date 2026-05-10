"""
Configuration for the API. Reads from environment / .env file.

Phase 4 wheel #2 (FastAPI skeleton). Settings are deliberately lean —
just what main.py and seed.py need today. As more wheels land
(SSO with WordPress, Stripe, etc.) more keys join here.
"""

from __future__ import annotations

from pathlib import Path
from typing import List

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


_API_DIR = Path(__file__).resolve().parent
_REPO_ROOT = _API_DIR.parent  # ~/Desktop/App


class Settings(BaseSettings):
    """Runtime settings. Pulled from environment / .env file."""

    database_url: str = Field(
        default="postgres://localhost:5432/remnant_app",
        description="asyncpg connection string for the Postgres instance.",
    )
    parsed_json_dir: Path = Field(
        default=_REPO_ROOT / "source-texts" / "parsed",
        description="Directory containing the four parsed Restored Names JSON files.",
    )
    schema_sql_path: Path = Field(
        default=_REPO_ROOT / "data-schema" / "schema.sql",
        description="Path to schema.sql for `seed.py --bootstrap`.",
    )
    cors_origins: str = Field(
        default="http://localhost:5173,https://bible.remnantofpromise.org",
        description="Comma-separated list of allowed CORS origins.",
    )

    model_config = SettingsConfigDict(
        env_file=str(_API_DIR / ".env"),
        env_file_encoding="utf-8",
        case_sensitive=False,
        extra="ignore",
    )

    @property
    def cors_origin_list(self) -> List[str]:
        return [o.strip() for o in self.cors_origins.split(",") if o.strip()]


settings = Settings()
