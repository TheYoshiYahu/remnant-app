# S215 — open prompt (short)

Load `yoshi-voice` first. Mount `~/Desktop/App` (and `~/Downloads` only if the
re-parse comes up).

## Primary task — get the app into the Apple App Store
Apple Developer account is **APPROVED** (the enrollment block in S209 is cleared).
Walk `S209_APPSTORE_SUBMISSION_RUNBOOK.md` top to bottom and drive the iOS
submission to "Waiting for Review." Org details are captured in that runbook:
- Legal entity: **Remnant of Promise**, 393 County Road 3987, Winnsboro, TX 75494-5862
- **D-U-N-S 145570661**, **EIN 42-1878892**, org phone +1 430 260 9988
- Verification contact: Edith Pack, Secretary

Steps: confirm App Store Connect access → create the app record (bundle id,
name, primary language, SKU) → app privacy + content rating → pricing (free) →
screenshots (reuse `appstore-screenshots/`) → build upload via Xcode/`cap:ios`
(Capacitor) → fill the version listing → submit for review. Stop and ask before
any irreversible "Submit" / payment / agreement-acceptance click.

## Carry-forward queue (was set up in S214 — don't lose it)
1. **Edge-to-edge Android 15 inset fix** (Play flagged it as a *recommendation*,
   non-blocking for release 12 (1.1.1), which is *in review*). Capacitor + Android:
   `env(safe-area-inset-*)` padding on reader top/bottom + `StatusBar`/theme or
   `enableEdgeToEdge()`. Needs a native AAB rebuild. Do for the next Android build.
2. **charles-vol2 re-parse** — approach proven (layout-aware pdfplumber from the
   PDF); held behind a CCEL verification gate before swapping the production JSON
   and re-pointing any xref verse ids. See `S214_CHARLES_VOL2_DEGRADATION_REPORT.md`
   + `S214_S212_JOHN_TESTAMENTS_XII_REVERIFY.md`.
3. **John NT-to-NT cross-references** — canon Tanakh coverage is complete across
   all 21 chapters; the NT-to-NT pairings (27 of 265 targets) are thin. New
   FULL-LIBRARY `john_nt_to_nt` migration, minions per chapter-range. See
   `S214_JOHN_CANON_XREF_DIAGNOSIS.md`.

## Confirm at open (from S214)
- Git push of S214 + S212 work landed on `main`.
- DB migrations applied (S181 + S194 canon John = the render fix; S212 mark/luke/john
  extras). Eyeball a Gospel chapter: canon Tanakh+NT cross-refs now showing, and the
  new chapter-end order (pills → Kingdom → Witness → Commentary → Cross-references).
