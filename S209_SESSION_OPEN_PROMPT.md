# S209 — App Store: iOS shell build + enrollment shepherding

Mount `~/Desktop/App`. Load yoshi-voice. Read
`S209_APPSTORE_SUBMISSION_RUNBOOK.md` FIRST (tracks A/B/C + the
fee/waiver decision), then `CAPACITOR_SETUP.md` §§1–4, then
`S206_PLAY_SUBMISSION_RUNBOOK.md` LISTING COPY (reuse for Apple).

Settled — do NOT re-litigate
* Apple posture: enroll as ORGANIZATION, PAY the 99 USD (no IRS
  determination letter exists; waiver deferred to a future renewal —
  details in the runbook A3).
* Consumption-only store build on iOS, same as Play. No Apple IAP, no
  Paid Applications Agreement, ever. The S206 Pricing gate detects the
  Capacitor bridge — same code path covers the iOS shell.
* Xcode is installed on the Mac (Yoshi, S208). Verify at open:
  `xcodebuild -version`.
* Play state: all 11 changes SENT FOR REVIEW at S208 close (open
  testing release 12 (1.1.1) + full listing w/ 8 screenshot assets +
  all declarations). Check Console for verdict; typical ≤ 7 days.

Session shape
1. Account check-in (Yoshi by hand; Claude guides, never types
   credentials): D-U-N-S status → org enrollment → pay → wait for
   verification. If still pending, proceed — Track B needs no account.
2. Track B on the Mac (paste-blocks, commands only):
   `npx cap add ios` → `npx cap sync ios` → icons/splash via
   capacitor-assets (sources in brand-assets/) → open in Xcode,
   confirm it builds to the simulator unsigned.
3. apple-app-site-association file written + deployed per
   CAPACITOR_SETUP.md §3 (TEAMID slot left blank until enrollment
   clears; entitlements + Associated Domains staged in Xcode).
4. Apple-size screenshot assets: re-run the S208 collage builder at
   Apple dimensions (6.9" 1290×2796 + 6.5" 1242×2688). Same 8 assets,
   same banners; sources in `play-store-screenshots/` + script pattern
   in the S208 transcript (PIL collage builder, outputs to
   `appstore-screenshots/final/`).
5. If enrollment clears in-session: Track C — App ID, App Store
   Connect app, archive → TestFlight internal, reviewer notes (texas
   account), privacy nutrition labels mirroring the Play data-safety
   answers.
6. Transcribe every decision back into the runbook.

Play follow-ups (do whichever unblocks first)
* If Play review APPROVED: copy app-signing-key SHA-256 from Console →
  App integrity → add as second fingerprint in
  `app/public/.well-known/assetlinks.json` (keep D2:E0:F7:...),
  rebuild web, push. Then the S206 §10 on-device walk.
* If rejected: read the reasons, fix, resubmit — this jumps the queue.

Hard constraints (unchanged)
* Build/sign/upload from the Mac ONLY. Terminal blocks: COMMANDS ONLY.
* `tsc -b` / `npm run build` in `~/Desktop/App/app` before bundling.
* Apple ID, payment, and credentials are Yoshi's; Claude never creates
  accounts, enters passwords, or touches payment screens.
* Stale `.git/index.lock`: `rm -f .git/index.lock`.

Backlog behind this
Mark extras xref pass (`NEXT_SESSION_MARK_EXTRAS_XREF_SPEC.md`) ·
Maps rebuild (`NEXT_SESSION_MAPS_REBUILD_SPEC.md`) · Red pill wave 2 ·
Luke · John · Kingdom wave 4 · Witness wave 2 · Timeline.
