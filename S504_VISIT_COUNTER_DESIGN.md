# S504 — The visit counter (design, one page; read before any code lands)

**The question (Yoshi, Nov 15):** how many different people come each day, and how many times each.

**What the database can tell today.** Two things, not one. `users.last_seen_at` is one timestamp per account, overwritten each visit — useless for the past. But S467 (Oct) already added **`user_activity_days`**: one row per signed-in person per Central-time day — first and last time, `visits` (a new visit begins after 30 quiet minutes), `active_seconds`, `hits`. It is written on every request that carries a valid `rop_jwt`, in `upsert_user` (api/db.py), and `python -m jobs.activity_report --days 30` prints people-per-day, days-per-person, and a per-person table. **For signed-in readers your question has been answerable since S467b deployed.** Paste 1 below shows whether it has been counting and since when.

**What is missing.** (1) Anonymous readers — the free canon in the PWA and the whole walk site need no sign-in, so nothing is written for them. (2) Which surface a visit was on (app or walk). (3) A raw log, so a question we have not thought of yet can still be asked of the past. (4) One report that puts signed-in and anonymous side by side.

## The design

**One new table, `visit_events`** — the raw log. `ts timestamptz`, `user_id uuid null` (FK users, ON DELETE SET NULL), `anon_id text null` (see privacy), `surface text` ('app' | 'walk'), `path text`, `edition text null`, `book text null`, `chapter int null`. Index on `(ts)`, on `(user_id, ts)`, on `(anon_id, ts)`. One row per **visit**, not per request: for signed-in readers, written in `upsert_user` only when the S467 activity upsert opened a new visit (row inserted, or `last_at` more than 30 minutes ago) — so the two tables agree by construction; `user_activity_days` stays exactly as it is. For anonymous readers, written by a beacon.

**The beacon.** `POST /v1/visit` `{anon_id, surface, path}`, 204, no body back, never raises to the client. Called once per page load from `app/src` (PWA) and from the small script `walk/build.mjs` already writes into every page (it already calls `/v1/subscriptions/me` with credentials, so the cookie reaches the API). If the request carries a valid `rop_jwt` the server stores `user_id` and drops the `anon_id`; the same person signed in and signed out is not double-counted on the day the two rows join by `user_id`. Rate limit: one row per `anon_id` per surface per 30 minutes (an `INSERT … WHERE NOT EXISTS` on the last 30 minutes, same quiet-window rule as S467).

**Privacy — no cookie, no IP, nothing a third party sees.** `anon_id` is a random UUID made in the browser and kept in `localStorage` (not a cookie, so the WordPress policy needs no cookie line; one sentence under "The study Bible app and the walk site" saying a random identifier is stored in your browser to count visits, no address, no name, removed when you clear site data). The server never stores an IP, a user agent, or the id itself: it stores `sha256(ANON_SALT + anon_id)`, with `ANON_SALT` a Render env var (`sync: false`), so the database cannot be walked back to a browser even by us. Reader-page `edition/book/chapter` is kept for signed-in and anonymous alike — it is what the beacon's `path` already carries; nothing about notes, highlights or search is logged (S467's rule kept).

**Rollup and report.** A view `visit_days` — per Central day and surface: `people` (distinct `user_id`), `anons` (distinct `anon_id`), `visits`, and a per-person line (visits per user) — union of `user_activity_days` (signed-in, back to S467b) and `visit_events`. Report: `_s503/tools/visits_report504.py`, read-only, same shape as `users_baseline503.py` (terminal + `_s503/out/visits_<date>.txt`, never git-added), with the Nov 15 baseline (78 accounts / 22 in 30 days / 8 in 7 days / 7 paying) printed at the top for comparison.

**Retention.** Raw `visit_events` kept 400 days; a line in the existing trial-reminders cron (`jobs/trial_reminders.py` runs daily on the same image) deletes older rows. `user_activity_days` is small (one row per person-day) and is kept.

**Migration and deploy.** `data-schema/migrations/session504_visit_events.sql` through `apply_migration.py` (idempotent: `CREATE TABLE IF NOT EXISTS`, view `CREATE OR REPLACE`). API: `api/visits.py` router + ~8 lines in `upsert_user`. PWA: `app/src/lib/visit.ts`, one call in `main.tsx`. Walk: six lines in the page script in `walk/build.mjs`. Render: one env var (`ANON_SALT`). Order: migration first (the API must find the table), then **your** `git push` (Render auto-deploys api, pwa, walk). Nothing deleted. Free — Postgres and the API already run; no third party.

## Housekeeping in a sibling migration (`session504_housekeeping.sql`) — needs your word

- **assemblyofrop** — two `everything/active` subscription rows. Keep one; which: the older (earliest `started_at`) or the one Stripe knows about (has `stripe_subscription_id`)? Default proposal: keep the Stripe-backed row, `ended_at = now(), status='canceled'` on the other — nothing deleted.
- **Jeni** — two `complete_study/active` rows. Same rule proposed.
- **Goshen24** — two accounts (joined 2026-06-02 both; one `everything/active`, last seen Oct 28; one free, never returned). Proposal: keep the paying one; the free duplicate gets its WordPress id cleared only if WordPress has a single user — nothing deleted; I will show both rows and the WordPress id first.

Paste 1 (read-only, shows what S467 has counted so far) is `_s503/tools/visits_report504.py` once written; until then: `cd ~/Desktop/App/api && python3 -m jobs.activity_report --days 30`.

*Model: Claude Fable 5.1. Design only — no code written until Yoshi reads this.*
