# api/jobs — runnable backend jobs (not part of the web request path).
#
# Inside the runtime image (Dockerfile: COPY api/ /app/, WORKDIR /app) this
# package imports as `jobs.*`. The trial-reminder job is run by a Render Cron
# Job with:  python -m jobs.trial_reminders   (working dir /app).
