Mount `~/Desktop`. Load yoshi-voice. Read `S201_CHECKPOINT.md` first (then
`S127_AESTHETIC_DECISIONS_LOG.md` S201 section + `NEXT_SESSION_MAPS_REBUILD_SPEC.md`).
This session's one job: **perfect the layout of the reader.** Don't refight what's settled.

## Settled — do NOT re-litigate
- The native 66-book / TSK bug is FIXED + SHIPPED + confirmed on Yoshi's phone.
  Root cause was the bundled shell serving frozen web code. Fix: `capacitor.config.ts`
  now loads the live URL (`server.url = https://bible.remnantofpromise.org`), and
  `loadInitialPosition` + `listNotes` await the native JWT (committed `dbe96c1`).
  New signed APK is on GitHub Releases as `remnant-bible.apk`. Going forward, web
  fixes reach the installed app via Render deploy — NO app rebuild needed.
- Divider assets are already made + cropped, in `app/public/dividers/`:
  `divider-botanical.png` (chapter→apparatus seam) and `divider-alephbet.png`
  (major section break), each with a `-transparent.png`. Grok originals in `source/`.
  Both are near-black-background (dark reader only — light-theme variants are later).

## The job — perfect the layout
1. **Wire in the two dividers.** Botanical at the chapter→apparatus seam (replaces the
   gold-diamond placeholder); aleph-bet as the major section break. **Open with a proof
   (screenshot/render) for Yoshi's sign-off BEFORE wiring** — earned after the S199 maps miss.
2. **Implement the chapter-end aesthetic pass** per `S127_AESTHETIC_DECISIONS_LOG.md` (S201):
   - Serif for substance (thread titles, quoted scripture), sans for chrome.
   - Quoted scripture as left-ruled blockquotes — rule color SPECTRAL BLUE (#0084FF) or
     argaman, NOT techelet (#1A6FE5 is divine-names-only). Also fix the existing
     `ChapterEndCard.tsx` header drift (it's coded techelet — wrong per S127 lock).
   - Cross-ref pills: balanced default 3 (one Tanakh + one extra-canonical + one NT when
     each exists), then a metallic-blue **"more for this verse"** expander
     (border #9FD0FF, gradient #0E2C50→#2E7BD6→#0E2C50, text #EAF4FF).
   - Thread cards lifted as the jewel (register-colored top border, subtle elevation).
   - Consistent vertical rhythm per block.
   - **NO greyed-out text anywhere** (hard rule) — locked content stays fully readable,
     set apart by border/box/tier-chip, never by opacity. Retire the S140 40%-opacity
     rows AND the locked-thread teaser fade.
   - Touches `ChapterEndCard.tsx`, `ChapterCommentary.tsx`, `ToolAnnotationBand.tsx`.

## Hard constraints (unchanged)
- Verify the frontend with `tsc -b` / `npm run build`, NOT `tsc --noEmit` (Render is
  stricter — S199 lesson).
- Commit + push from the Mac only. Do NOT run index-touching git from the sandbox
  (leaves an undeletable `.git/index.lock`). `rm -f ~/Desktop/App/.git/index.lock` if stale.
- The divider PNGs + the S201 docs must be committed/pushed to reach the live app.

## Confirm at open
- That `dbe96c1` (the live-URL + token-race fix) and the S201 divider/doc commit actually
  reached `main`, and that the live `remnant-bible.apk` GitHub Release is the new build.

## Backlog (after the layout is perfected)
- **Maps rebuild** — real AE/north-centered map (PD), the gathering routed through the
  WILDERNESS and the sifting under the rod (NOT a round-trip to the land), proof render
  first. Then the sectioned regional atlas (Egypt, the Aqaba crossing, Sinai-in-Arabia
  per Galatians 4:25, Assyria, Babylon, the land) + the all-public-domain imagery library
  (clay pots, altars, Mt Sinai, artifacts — the app as THE source). Full spec in
  `NEXT_SESSION_MAPS_REBUILD_SPEC.md`.
- Light-theme divider variants (parchment-background Grok gen).
- Session C — notes/bookmarks (`APP_BUILDOUT_ROADMAP.md`).
- Timeline ("most complete in existence," anchored to Yoshi's chronology) — Yoshi
  reprioritized from Session-D-out-of-scope; his call on sequencing.
- Out of scope: the xref sweep.
