# Dockerfile — FastAPI skeleton image for The Remnant of Promise Official Study Bible.
#
# Phase 4 wheel #3 (hosting decision). Host-agnostic by design: builds and runs
# identically on Render, Fly.io, Railway, and DigitalOcean App Platform. Render is
# the picked launch host (see ~/Desktop/App/hosting/HOSTING_DECISION.md), but
# nothing in this image is Render-specific.
#
# Build context: REPO ROOT (~/Desktop/App/). The Dockerfile itself lives at
# ~/Desktop/App/api/Dockerfile but the build is invoked from the repo root so it
# can reach api/, data-schema/, and source-texts/parsed/ in a single COPY pass.
# `render.yaml` sets `dockerfilePath: ./api/Dockerfile` and leaves rootDir at the
# repo default.
#
# What's bundled and why:
#   - api/                       → /app/         (FastAPI source + seed.py)
#   - data-schema/schema.sql     → /data-schema/ (one-time bootstrap from Shell)
#   - source-texts/parsed/*.json → /source-texts/parsed/ (extras seed data)
#
# Original design (session 11) was to ship a slim runtime image and run seed.py
# from the operator's laptop against the external Postgres URL. Session 12 hit
# the wall that Render's external Postgres requires an explicit IP allowlist
# entry — running the seed via the Render dashboard Shell against the internal
# hostname is cleaner. That makes seed.py a first-class part of the image.

FROM python:3.12-slim AS base

# Standard runtime hardening + python cache hygiene.
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Working directory for the API at runtime.
WORKDIR /app

# Install Python dependencies first so the layer caches across code-only edits.
COPY api/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the API source. The .dockerignore at the repo root keeps __pycache__,
# .env, editor noise, and the rest of the repo's non-runtime tree out.
COPY api/ /app/

# Seed-time artifacts. seed.py's defaults (config.py) resolve schema_sql_path to
# <repo_root>/data-schema/schema.sql and parsed_json_dir to
# <repo_root>/source-texts/parsed. Inside the container, _REPO_ROOT computes to
# `/` (the parent of /app), so these COPY targets must sit at `/data-schema/`
# and `/source-texts/parsed/` respectively.
COPY data-schema/ /data-schema/
COPY source-texts/parsed/ /source-texts/parsed/

# Session 112 — post-seed loader artifacts. The tiered-commentary loader and
# its source .md files ship in the image so they can be run from Render Shell
# (internal-network DB connection — sidesteps the external-Postgres SSL/IP
# issues that blocked Path A at S112). Same pattern any future loader can use:
# drop the script under /restoration-pipeline/ and the source data wherever
# the script's APP_ROOT resolution expects (here, /commentaries/).
COPY restoration-pipeline/_session112_*.py /restoration-pipeline/
COPY commentaries/ /commentaries/

# Session 114 — partner-tier reconciliation script. One-time historical
# drift cleanup paired with the auth.py DB-wins-over-JWT fix. Reads from
# the subscriptions table and re-fires _sync_partner_tier_to_wp for every
# non-terminal row. Idempotent. Runs from Render Shell on the API service
# so it has both DATABASE_URL and the WP companion-plugin env vars in scope.
COPY restoration-pipeline/_session114_*.py /restoration-pipeline/

# Session 117 — multi-mark highlights schema migration loader. Applies
# data-schema/migrations/session117_multi_mark.sql via asyncpg (the API
# image doesn't carry the postgres client tools, so psql can't run from
# Render Shell — this loader is the pattern). Idempotent migration SQL +
# idempotent loader, so re-runs are safe. Establishes the per-session
# COPY line as the canonical pattern: every future migration loader needs
# its own COPY here, or it doesn't ship in the image.
COPY restoration-pipeline/_session117_*.py /restoration-pipeline/

# Session 120 — Strong's tap-on-word data ingestion (Wheel 1 of the
# pre-launch sweep). Two loaders, run in order from Render Shell:
#   _session120_load_strong_entries.py — Hebrew + Greek lexicon entries
#     from OpenScriptures XML (source-texts/strongs-hebrew/ +
#     source-texts/strongs-greek/).
#   _session120_load_verse_words.py — Strong's-tagged token alignment
#     parsed from source-texts/kjv/eng-kjv_usfx.xml (already on disk,
#     fully <w s="H/G####"> tagged).
# Both loaders need their source-text XML files inside the image, so the
# three source-texts/ subdirectories below also COPY in. They were
# previously excluded by .dockerignore for build-context size; the
# exclusions are removed at S120 so the loaders can run.
COPY restoration-pipeline/_session120_*.py /restoration-pipeline/
COPY source-texts/strongs-hebrew/ /source-texts/strongs-hebrew/
COPY source-texts/strongs-greek/ /source-texts/strongs-greek/
COPY source-texts/kjv/ /source-texts/kjv/

# Session 124 — Bookmarks + Notes V1 schema migration loader (Wheel 5
# of the pre-launch sweep). Creates the new `bookmarks` table per
# DESIGN_LANGUAGE.md §22 + relaxes the legacy study_notes CHECK that
# blocks the Free-tier single-global-notepad free-form path. Idempotent
# loader + idempotent migration SQL; re-runs are safe. Runs from Render
# Shell after deploy per the S117 / S120 pattern.
COPY restoration-pipeline/_session124_*.py /restoration-pipeline/

# Liveness / DB-reachability check. Render (and any other host) can hit this
# directly to determine whether to route traffic; matches the route registered
# in main.py.
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
    CMD python -c "import urllib.request,sys; \
import os; port=os.environ.get('PORT','8000'); \
sys.exit(0 if urllib.request.urlopen(f'http://127.0.0.1:{port}/v1/health',timeout=3).status==200 else 1)"

# Render injects PORT at runtime; default to 8000 for local docker-run.
ENV PORT=8000
EXPOSE 8000

# uvicorn binds 0.0.0.0 so the container is reachable from outside.
# Single worker is correct for the launch tier — Render Starter is 0.5 CPU and
# more workers would just contend. When we move to Standard / Pro, bump --workers.
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT}"]
