# Dockerfile — FastAPI skeleton image for The Remnant of Promise Official Study Bible.
#
# Phase 4 wheel #3 (hosting decision). Host-agnostic by design: builds and runs
# identically on Render, Fly.io, Railway, and DigitalOcean App Platform. Render is
# the picked launch host (see ~/Desktop/App/hosting/HOSTING_DECISION.md), but
# nothing in this image is Render-specific.
#
# Build context expectation: this Dockerfile sits at ~/Desktop/App/api/Dockerfile
# and the build context is ~/Desktop/App/api/ (the api/ directory itself). The
# parsed Restored Names JSONs and the schema.sql are deliberately NOT bundled into
# the runtime image — they're seed-time artifacts, run from the operator's machine
# pointing at the production DATABASE_URL via `python seed.py --bootstrap` /
# `--seed-only`. This keeps the image small and the deploy fast.

FROM python:3.12-slim AS base

# Standard runtime hardening + python cache hygiene.
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Working directory inside the image.
WORKDIR /app

# Install dependencies first so the layer caches across code-only edits.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the API source. The .dockerignore controls what does and doesn't ship.
COPY . .

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
