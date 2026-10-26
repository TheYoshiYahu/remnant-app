# S473 — open prompt

Load my voice skill and mount my Desktop. Read the bottom of ~/Desktop/App/S451_APP_FEATURE_ROADMAP.md
(S470–S472 notes) before proposing anything. Tiers already exist (Free / Study Notes / Library / Companion) —
never propose new ones. Look things up in the code before asking me.

State at close of S472 (2026-10-26):
- People & places is BUILT but only live once Yoshi runs `bash ~/Desktop/App/_session472_people_places_deploy.sh`
  and then `git push`. First thing: check `git log -3` / `git status` to see whether that happened; if not, remind him.
- Verify report: people-places/S472_VERIFY_REPORT.md. Builder: _s472_people_places_build.py (re-runnable).
- S470 offline-shell changes still uncommitted on purpose (App.tsx offline tier fallback, DownloadsSettings.tsx,
  capacitor.config.ts). The S472 deploy stages only its own App.tsx lines via people-places/s472_app_tsx_only.patch.
- Store billing plan settled in S472 (bottom of roadmap) — build with the offline store release.

Next on the roadmap, in order: tribe & nation pages (where the 4,429 held tribe/nation verses go) → extra-book
people → passage guide. Ask Yoshi which, one short question.
