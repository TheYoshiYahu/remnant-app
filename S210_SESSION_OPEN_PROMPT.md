# S210 — open prompt (short)

Load `yoshi-voice` first. Mount `~/Desktop/App`.

## Primary task — rename the two Esdras books
Change **1 Esdras → 3 Ezra** and **2 Esdras → 4 Ezra** everywhere they
surface to the reader in the Bible app.

CONFIRM FORMATTING AT OPEN (Yoshi wrote "3rd Ezra" and "4 Ezra" —
inconsistent): pick one style and apply it uniformly. Recommended:
**"3 Ezra" / "4 Ezra"** (matches the bare-number style of the other
book names). Decide before editing.

Scope to hit (book DISPLAY name + any slug/citation keys), in order:
1. App reader book list / metadata — `app/src/App.tsx` and any book-name
   map in `app/src/` (this is what the reader sees).
2. API book names — `api/main.py`, `api/seed.py`.
3. Parsed source JSON — `source-texts/parsed/apocrypha.json`,
   `source-texts/parsed/apocrypha-charles-vol1.json` (book labels).
4. DB seed / schema book labels — `data-schema/schema.sql`,
   relevant `data-schema/migrations/`.
5. Cross-reference thread keys / data slugs that embed the old names
   (search `esdras`, case-insensitive) — update reader-facing labels;
   leave historical migration files that are already-applied alone
   unless they drive current display.
6. Restored-edition source txt is the publication record — change only
   if it drives the app; otherwise note and leave.

Method: grep `esdras` (case-insensitive) across the repo (172 hits at
S209 — most are OCR cache + already-applied migrations + lexicon dumps,
which are NOT reader-facing; filter to display/label/slug paths). After
edits: `tsc -b` / `npm run build` in `~/Desktop/App/app`, verify the
reader shows the new names, then commit + push (Render auto-deploys).
A DB migration (UPDATE, not reseed — Rule 10) is likely needed for the
production book labels; write it, don't reseed canon.

Note on naming truth: in the KJV/Charles Apocrypha these two ARE the
books variously numbered 3 Ezra / 4 Ezra (Vulgate) — the rename is
historically correct, not a relabel-for-taste. Keep conventional
English book-name rule (voice skill) — these stay English, just
renumbered.

## Secondary task — reorder the reader's study layers
Yoshi wants the chapter-bottom reading order changed to:
**cross-references → the Witness (red pill) → the Kingdom (kingdom
pill) → commentary.** Commentary moves to LAST (he likes it after the
cross-references / pills visually).

Currently commentary renders before the cross-reference apparatus —
move the COMMENTARY block to render after the xref + Witness +
Kingdom end-cards. This is the chapter-end render order in
`app/src/App.tsx` (the section that lays out commentary, the
ChapterEndCard / xref apparatus, WitnessEndCard, KingdomEndCard).
Confirm the exact current order on screen at open, then reorder to:
xref → Witness end-card → Kingdom end-card → commentary. Keep each
block's existing toggle gating (commentary rides hideCommentary;
Witness/Kingdom ride their own toggles). `tsc -b`, build, eyeball,
commit, push.

## Carried-over open items (from S209 runbook — read it)
- **Apple enrollment BLOCKED:** both the personal Apple ID and a fresh
  info@ Apple Account got auto-locked (same device + phone, multiple
  verification runs in one night). FIRST: iforgot.apple.com to unlock,
  or call Apple Developer Support Mon–Fri **1-800-633-2152**. Then
  enroll ORGANIZATION on the iPhone app. All form answers (D-U-N-S
  145570661, Tax ID 421878892, address, Edith Pack contact, waiver
  OFF, $98.99) are in `S209_APPSTORE_SUBMISSION_RUNBOOK.md`.
- **Play PRODUCTION:** submitted for review at S209 close (release 12
  (1.1.1), 177 countries, managed publishing off → auto-publishes on
  approval). Check the verdict; expect a "published" email to info@.
  Open-testing track showed "paused/Inactive" — sanity-check after.
- **Track B (iOS shell):** simulator build (⌘B) not yet confirmed.
  Shell scaffolded, icons/splash generated, iOS 26.5 SDK installed,
  project opens in Xcode. Needs no Apple account.
- **Post-Play-approval:** S206 §10 on-device walk (pricing surface in
  shell shows no prices, deep link, native share, cold launch).

## Backlog behind this
Mark extras xref pass · Maps rebuild · Red pill wave 2 · Luke · John ·
Kingdom wave 4 · Witness wave 2 · Timeline.
