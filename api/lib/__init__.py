# api/lib — small reusable helpers shared across the FastAPI backend.
#
# Inside the runtime image the api/ directory is the working tree root
# (Dockerfile: COPY api/ /app/, WORKDIR /app), so this package imports as
# `lib.*` (e.g. `from lib.email import send_email`), matching the flat,
# bare-import convention the rest of the backend uses (`from db import ...`).
