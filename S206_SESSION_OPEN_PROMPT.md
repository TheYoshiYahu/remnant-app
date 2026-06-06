# S206 — Play Store submission

Mount `~/Desktop`. Load yoshi-voice. Read
`NEXT_SESSION_PLAY_STORE_SPEC.md` FIRST (billing verdict + session
shape), then `CAPACITOR_SETUP.md`, then `S205_BUILD_NOTES.md` for
what's live.

Settled — do NOT re-litigate
* Play Console org account EXISTS (Remnant of Promise). Go straight
  to app creation.
* Billing: CONSUMPTION-ONLY store build (lean — Yoshi confirms in
  one word at open). Shell hides Stripe checkout; Pricing says tiers
  are managed from your account on the web; PWA checkout untouched.
* The Kingdom + Witness are live (244 + 33 cards). The shell is thin;
  content rides the web.

This session's one job: app on the INTERNAL TESTING track, installed
on Yoshi's phone.
1. Capacitor Android build — app id, icons/splash, target API per
   current Play requirement. Keystore generated ON THE MAC and backed
   up before anything else.
2. Shell gating: hide checkout in native build; verify sign-in +
   subscription-tier reads inside the shell.
3. Listing essentials: descriptions (voice register), screenshots,
   privacy policy URL, data-safety form, content rating.
4. Upload to internal testing → Yoshi installs and walks it.
5. Transcribe every decision back into the spec.

Hard constraints (unchanged)
* Build/sign/upload from the Mac ONLY. Terminal blocks: COMMANDS
  ONLY — no comments, no parentheses.
* `tsc -b` / `npm run build` in `~/Desktop/App/app` before bundling.
* Keystore + Play credentials are Yoshi's; never stored by Claude.
* Stale `.git/index.lock`: `rm -f .git/index.lock`.

Backlog behind this
App Store (once Apple org account exists) · Mark extras xref pass
(`NEXT_SESSION_MARK_EXTRAS_XREF_SPEC.md`) · Luke · John · Kingdom
wave 4 concordance scans · Witness wave 2 · Maps · Timeline.
