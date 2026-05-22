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
