# Deploy & Test Checklist — Trial-Ending Email Flow

Everything below is **staged only**. Nothing here has been built, deployed, run
against a live system, or pushed. Work through it in order. Steps that touch
production are called out.

Branch (App repo): `compliance/remove-inapp-payment-links`
WordPress plugin file is **not** in a git repo (it lives under `App/wp-companion/`);
deploy it the same way you deploy the other companion plugins.

---

## What was built (summary)

A no-card trial currently lapses silently. This adds a once-per-user email on
day 6→7 of the 7-day trial, for users who haven't converted to paid.

Data path: every WordPress login token (web cookie, native App-Link callback,
and native credential login) now carries `email` → FastAPI caches it in
`users.email` on login → a daily Render cron reads the exact trial clock
(`users.created_at`) + subscription status and sends via Resend → stamps
`users.trial_reminder_sent_at` so no one is emailed twice.

---

## Step 1 — Redeploy the WordPress SSO plugin (adds the email claim)

File: `App/wp-companion/rop-sso-bridge/rop-sso-bridge.php`. Two additive changes,
covering **all three** login paths:
- `rop_sso_generate_jwt` payload gains `'email' => (string) $user->user_email`
  — covers the **web SSO cookie** path and the **native App-Link callback**
  (both call this function).
- New `rop_sso_add_email_to_native_jwt` callback hooked on `jwt_auth_payload`
  **and** `jwt_auth_token_before_sign` — covers the **native credential
  login** (`lib/native-auth.ts` → `…/wp-json/jwt-auth/v1/token`, the
  third-party JWT plugin). It injects `data.user.email` into that plugin's
  token. Both filter names are registered so it works whether the installed
  plugin is Useful Team "JWT Auth" (`jwt_auth_payload`) or Tmeister "JWT
  Authentication for WP REST API" (`jwt_auth_token_before_sign`); the
  non-matching one is simply never called.

1. Upload the updated `rop-sso-bridge` plugin to `remnantofpromise.org`
   (WP Engine) the way you normally update it (SFTP/Git/zip — same as before).
2. No activation change needed; it's the same plugin, additive only.
3. **Verify (web):** log into the site, then in browser devtools copy the
   `rop_jwt` cookie value and paste it into https://jwt.io — confirm
   `data.user.email` is present.
4. **Verify (native):** confirm which JWT plugin is active under WP Admin →
   Plugins (it serves `jwt-auth/v1`). Then sign in from the native app (or
   `POST /wp-json/jwt-auth/v1/token` with valid credentials), decode the
   returned token at https://jwt.io, and confirm `data.user.email` is present.
   If it isn't, the active plugin uses a different filter name — tell me the
   exact plugin name/version and I'll add that hook. (Step 3 also catches this
   end-to-end: a native sign-in should populate `users.email`.)

## Step 2 — Apply the DB migration (adds `users.trial_reminder_sent_at`)

File: `data-schema/migrations/trial_reminders_add_sent_at.sql` (and the column
is also reflected in `data-schema/schema.sql` for fresh installs).

The API image has no `psql`; apply via asyncpg from the Render Web Shell, the
same pattern as past migrations. Quick one-off:

1. Render dashboard → `remnant-app-api` service → **Shell**.
2. Run:
   ```sh
   python -c "import asyncio,asyncpg,os; \
   asyncio.run((lambda: None)()) or \
   asyncio.run(asyncpg.connect(os.environ['DATABASE_URL']).__await__().__next__())" 2>/dev/null; \
   python - <<'PY'
   import asyncio, asyncpg, os
   async def main():
       conn = await asyncpg.connect(os.environ["DATABASE_URL"])
       await conn.execute(open("/data-schema/migrations/trial_reminders_add_sent_at.sql").read())
       print("migration applied")
       await conn.close()
   asyncio.run(main())
   PY
   ```
   (Or, simpler, paste the `ALTER TABLE users ADD COLUMN IF NOT EXISTS
   trial_reminder_sent_at TIMESTAMPTZ;` statement through whatever migration
   runner you used for `session124`/`session117`.)
3. **Verify:** `SELECT column_name FROM information_schema.columns WHERE
   table_name='users' AND column_name='trial_reminder_sent_at';` returns one row.

> The migration ships in the image automatically because the Dockerfile already
> does `COPY data-schema/ /data-schema/`. Rebuild/redeploy the API (Step 4) is
> what puts the file in the container; you can also just paste the ALTER.

## Step 3 — Deploy the API code & confirm email capture

The backend changes (`api/auth.py`, `api/db.py`, `api/lib/email.py`,
`api/jobs/*`) deploy with the normal API deploy.

1. Merge/deploy the branch to whatever Render builds `remnant-app-api` from.
2. After deploy, log into the app on the web as a test user.
3. **Verify capture:** Render Web Shell →
   ```sh
   python - <<'PY'
   import asyncio, asyncpg, os
   async def main():
       c = await asyncpg.connect(os.environ["DATABASE_URL"])
       print(await c.fetch("SELECT wordpress_user_id, email, created_at, trial_reminder_sent_at FROM users ORDER BY last_seen_at DESC NULLS LAST LIMIT 5"))
       await c.close()
   asyncio.run(main())
   PY
   ```
   Confirm your test user's `email` is now populated.

## Step 4 — Verify Resend domain + set env vars

1. In **Resend**: add and verify the sending domain `remnantofpromise.org` —
   add the SPF and DKIM DNS records Resend gives you at your DNS host and wait
   for "Verified." Sends from an unverified domain are rejected.
2. Create a Resend **API key** (`re_...`).
3. In the Render dashboard, on the **`remnant-app-trial-reminders` cron service**
   → Environment, set:
   - `RESEND_API_KEY` = the `re_...` key (secret).
   - `RESEND_FROM` = `Remnant of Promise <hello@remnantofpromise.org>`
     (already defaulted in `render.yaml`; only override if you want a different
     address — it must be on the verified domain).
   - `DATABASE_URL` is wired automatically from the blueprint.

## Step 5 — Deploy the cron (blueprint sync)

`hosting/render.yaml` now defines a `type: cron` service
`remnant-app-trial-reminders`, daily at `0 16 * * *` UTC (~9am Pacific PDT),
command `python -m jobs.trial_reminders`.

1. Render dashboard → Blueprints → **Sync** (or "Apply") the updated
   `render.yaml`. Approve the new cron service when prompted.
2. Confirm the service appears and its next-run time looks right.

## Step 6 — Test: dry run, then a real send to yourself

1. **Dry run (no send, no DB writes):** Render → `remnant-app-trial-reminders`
   → **Run** (manual trigger) — but first temporarily set the command, OR run
   from the API service's Shell (same image):
   ```sh
   python -m jobs.trial_reminders --dry-run
   ```
   Read the log: it prints how many users are in the day-6→7 window and
   `[dry-run] WOULD send to …` lines. Nothing is sent or written.

2. **Real send to yourself:** create (or use) a test WordPress account whose
   trial is in the window. Quickest way to force eligibility for your own test
   row (Render Web Shell on the API service):
   ```sh
   python - <<'PY'
   import asyncio, asyncpg, os
   WP_ID = 12345  # <-- your test user's wordpress_user_id
   async def main():
       c = await asyncpg.connect(os.environ["DATABASE_URL"])
       # Put created_at 6.5 days back and clear any prior reminder.
       await c.execute(
           "UPDATE users SET created_at = now() - interval '6 days 12 hours', "
           "trial_reminder_sent_at = NULL WHERE wordpress_user_id = $1", WP_ID)
       print("test row primed"); await c.close()
   asyncio.run(main())
   PY
   ```
   Then run the job live:
   ```sh
   python -m jobs.trial_reminders
   ```
   Confirm: you receive the email; the log shows `sent + marked`; and a second
   immediate run reports `sent=0` for that user (idempotency holds).

3. **Restore** your test row's `created_at` if it was a real account you care
   about.

---

## Rollback

- WordPress: redeploy the previous `rop-sso-bridge.php` (the email claim is
  additive; leaving it is harmless).
- API: redeploy the previous build.
- Cron: delete the `remnant-app-trial-reminders` service (or set its schedule
  to a far-future date) and re-sync.
- DB: the column is harmless to leave; `ALTER TABLE users DROP COLUMN
  trial_reminder_sent_at;` if you truly want it gone.

## Notes / decisions deferred to you

- **Send time:** `0 16 * * *` is 9am PDT / 8am PST. Change the cron expression
  if you want fixed year-round Pacific.
- **Copy:** email wording is in `api/jobs/trial_reminder_template.py` — edit
  freely; it's isolated from the job logic.
- **Window:** keyed to `TRIAL_DAYS` in `auth.py` (currently 7). If you change
  the trial length, the reminder window follows automatically (day
  `TRIAL_DAYS-1` → `TRIAL_DAYS`).
- **In-app Manage/Pricing wording** (the `remnantofpromise.org` vs
  `bible.remnantofpromise.org` question) was left untouched this build, per your
  instruction.

---

# Addendum — Soft sign-in reminder, email consent & account deletion

This addendum covers a later build on the same branch: a **soft, recurring
sign-in reminder** (NOT a hard gate — anonymous users keep full reader access),
the **email-updates consent checkbox** at account creation, and the **in-app
account-deletion** path Apple requires. App-side code is staged on the branch;
the items below are the WordPress-side / submission follow-ups.

## A1 — Soft sign-in reminder (app-side only; nothing to deploy server-side)

What shipped in the app: a dismissible reminder modal shown once per app-open
while signed out (`app/src/components/SigninReminderModal.tsx`,
`app/src/lib/signin-reminder.ts`), mounted from `App.tsx` alongside the existing
welcome modal. Signed-in users never see it. Reading is never blocked
("Maybe later" always dismisses).

- **Cadence tuning:** one constant — `REMINDER_COOLDOWN_HOURS` in
  `app/src/lib/signin-reminder.ts`. `0` = once per app-open (default). Set e.g.
  `24` to show at most once per 24h across launches.
- Nothing to deploy beyond the normal PWA build. Verify after deploy: open the
  app signed out → reminder appears once; tap "Maybe later" → dismissed;
  navigate around in the same session → does not re-nag; sign in → never shows.

## A2 — WordPress registration: store the email-updates consent (REQUIRED)

The app now shows an opt-in checkbox ("Send me occasional updates and
encouragement…") at the Create-account step and appends
`rop_email_updates_optin=1` (or `0`) to the WordPress registration URL
(`…/goshen/?action=register&source=bible&rop_email_updates_optin=1`). Account
creation is WP-hosted, so **WordPress must read that param and store it**:

1. In the registration handler (the `/goshen/` register flow), read
   `$_GET['rop_email_updates_optin']` (or `$_REQUEST`), coerce to `'1'`/`'0'`.
2. On `user_register`, save it: `update_user_meta($user_id,
   'rop_email_updates_optin', $optin ? '1' : '0');`
3. Default when the param is absent: `'0'` (opt-out) — consent must be explicit.
4. (Optional, nice) surface the checkbox on the WP registration form itself too,
   for users who register directly on the website rather than from the app.

**Transactional vs marketing — important:** the trial-reminder job
(`api/jobs/trial_reminders.py`) is **transactional** and must **always send**,
regardless of `rop_email_updates_optin`. It does NOT check this flag (verified)
— do not add a check. The opt-in governs only **marketing/newsletter** sends. A
future newsletter send is where you'd filter on
`rop_email_updates_optin = '1'` (e.g., query WP users by that meta, or mirror
the flag into `users` if the sender lives in FastAPI).

## A3 — Account deletion (REQUIRED before App Store submission)

Apple Guideline 5.1.1(v): an app offering account creation must offer in-app
account deletion. There was **none** in the app before this build. Added: a
"Delete account" section on the Manage screen
(`app/src/routes/Manage.tsx`) with a "Delete my account" button that opens
`ACCOUNT_DELETION_URL` (system browser on native, new tab on web).

**The URL is a placeholder that 404s today** —
`https://remnantofpromise.org/goshen/?action=delete-account`. Before
submission, do ONE of:

1. **Implement the WP deletion route** at that URL: a logged-in self-service
   page that (a) cancels any active Stripe subscription, (b) deletes the WP user
   + their personal data, and (c) deletes/anonymizes the FastAPI `users` row
   (join key `wordpress_user_id`). Then this button works as-is. — Recommended.
2. **Repoint the constant** `ACCOUNT_DELETION_URL` in `app/src/routes/Manage.tsx`
   at whatever real deletion page exists.

Until one of those is done, the button opens a 404 — fine for staging, NOT for
submission. (The current privacy policy describes deletion-by-email with a
30-day window; an in-app *initiated* path is still required by Apple even if the
backend process is manual, so at minimum the URL must resolve to a real
deletion-request page.)

## A5 — Tier model, skeleton lens & voice journal (later build)

These shipped as their own commits on the same branch. DB + native steps:

**Migrations to apply** (asyncpg Render-Shell pattern, same as A2; idempotent):
- `data-schema/migrations/consonantal_skeleton.sql` — skeleton column + near-match table.
- `data-schema/migrations/voice_journal.sql` — `journal_entries` + `devotional_library` (+ placeholder seeds).

**Build step (skeleton lens):** after the skeleton migration, run
`python3 /restoration-pipeline/_build_consonantal_skeleton.py` from the API
Render Shell to populate `consonantal_skeleton` (strips Hebrew points) and the
single-consonant-swap near-match map. Idempotent. Until it runs, the partner
lens returns empty groups (the free sample card is hardcoded and works regardless).

**Devotional library:** the seeded rows are PLACEHOLDERS — Yoshi replaces the
`reflection`/`passage_text` copy (voice-gated) before relying on it.

**Voice journal — native dictation (binary-dependent, NOT wired):** the web
path uses the browser Web Speech API and works in the PWA. The NATIVE on-device
engine is `@capacitor-community/speech-recognition`:
1. `npm i @capacitor-community/speech-recognition` in `app/`, then `npx cap sync`.
2. iOS `Info.plist`: add `NSMicrophoneUsageDescription` and
   `NSSpeechRecognitionUsageDescription` (user-facing reason strings).
3. Android `AndroidManifest.xml`: add `<uses-permission android:name="android.permission.RECORD_AUDIO" />`.
4. Rebuild the shells. Until then, native falls back to Web Speech where the
   webview supports it, and to type-only where it doesn't. All dictation is
   on-device; no audio leaves the device.

**Crisis-safety (privacy invariant):** the watchlist match runs entirely
on-device (`app/src/lib/crisis-safety.ts`); journal text is never sent for that
check and NO crisis flag is stored (client or server). Care screen leads with
988, then the ministry. Tune the watchlist/resources in that one file.

## A4 — What was reverted (FYI)

An earlier pass of this build started a **hard gate** (redirect unauthenticated
users to `/sign-in`). That was fully backed out per the change of direction:
the `App.tsx` redirect/auth-check logic was removed and
`app/src/lib/auth-gate.ts` was neutralized to an empty, unimported module (the
environment wouldn't allow deleting the file — it's safe to delete from the repo
manually). Anonymous users retain full reader access.
