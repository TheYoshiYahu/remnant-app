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

    # ---- Session 37: Stripe + WordPress sync env vars ------------------
    # All four are sync: false in render.yaml (set in dashboard, never
    # in git). Empty default = the corresponding feature degrades
    # gracefully (checkout 503s, webhook 503s, WP-sync logs and skips).

    stripe_secret_key: str = Field(
        default="",
        description="Stripe secret API key (sk_test_... or sk_live_...).",
    )
    stripe_webhook_secret: str = Field(
        default="",
        description="Stripe webhook signing secret (whsec_...).",
    )
    wp_api_base: str = Field(
        default="",
        description=(
            "Base URL for the WordPress REST API "
            "(e.g. https://remnantofpromise.org/wp-json)."
        ),
    )
    wp_api_user: str = Field(
        default="",
        description="WordPress admin username for partner_tier sync.",
    )
    wp_api_app_password: str = Field(
        default="",
        description="WordPress Application Password for partner_tier sync.",
    )

    # ---- Session 42: bible-companion HMAC partner_tier sync ------------
    # When set, _sync_partner_tier_to_wp uses the HMAC-signed
    # POST /wp-json/rop/v1/partner-tier path exposed by the
    # `bible-companion` WP plugin (wp-companion/bible-companion/), which
    # only writes the one user-meta key and never holds admin-scope
    # credentials. When unset, the sync falls back to the Session 37
    # Application Password path (wp_api_user + wp_api_app_password).
    # Both unset = log-and-skip (existing degrade-gracefully shape).
    wp_companion_secret: str = Field(
        default="",
        description=(
            "HMAC shared secret for the bible-companion WP plugin. "
            "Same string that lives in wp-config.php as "
            "ROP_COMPANION_SECRET. When set, this path takes "
            "precedence over the Application Password path."
        ),
    )

    # ---- Session 163: Phase 9.3 lexicon kill-switch --------------------
    # When False, /v1/lexicon/{strong_number} returns 404 as if the route
    # doesn't exist. Flipped to True from the Render dashboard after the
    # schema migration, lexicon_entries bulk load, and callout migration
    # have all applied cleanly and Yoshi has completed the staging-walk
    # verification per the S163 trajectory. Per Path 3 staging path
    # decision: production-with-API-env-var-gate.
    lexicon_enabled: bool = Field(
        default=False,
        description=(
            "Master kill-switch for the §26 LexiconSheet API. False = "
            "/v1/lexicon/{strong_number} returns 404. True = enforces "
            "the Companion-tier gate and serves the combined response."
        ),
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
