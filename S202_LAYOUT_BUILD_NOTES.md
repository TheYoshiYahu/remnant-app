# S202 — Reader layout built (dividers + chapter-end aesthetic pass)

The S201 "perfect the layout" job, built. Proof was shown and signed off
BEFORE wiring (earned after the S199 maps miss). `tsc -b --force` clean.

## Decisions settled this session (transcribed per the skill rule)
- **Botanical divider size: C — full column width** (Yoshi sign-off, ~twice
  the first mock). Wired at the chapter→apparatus seam.
- **Frame / box-border idea: parked.** Explored pulling an ornamental frame
  off a book cover (Jasher, then Jubilees) for a CSS `border-image` box
  border. Yoshi's call: "going overboard, stick to what we got and build it."
  No frame this session. If revisited later, the Jubilees floral cover frame
  is the candidate (same vocabulary as the botanical divider) — would need a
  clean frame-ring crop + 9-slice `border-image`.
- **Aleph-bet divider: horizontal section break** at book-start (chapter 1,
  above the book heading). NOT made into a frame. Open to narrowing to
  witness-category transitions only if every-book-start feels too frequent —
  one-line change in App.tsx.

## What shipped
- `app/src/components/ReaderDivider.tsx` (NEW) — renders the two PNGs from
  `app/public/dividers/`. Botanical = full column width; aleph-bet = section
  break with optional label. Decorative (aria-hidden). Hidden in light mode
  until parchment variants exist (`.reader-divider` rule in index.css).
- `app/src/App.tsx` — aleph-bet at book-start (chapter 1, above heading);
  botanical at the chapter→apparatus seam (shown exactly when study aids are
  on AND the chapter carries a chapter_intro, so it never dangles).
- `app/src/index.css` — `.reader-divider` light-mode hide + overflow guard.
- `app/src/components/ChapterEndCard.tsx` — the chapter-end aesthetic pass:
  - header techelet `#1A6FE5` → spectral blue `var(--reader-accent)` (S127
    drift fix — techelet is divine-names-only).
  - quoted scripture as left-ruled serif blockquotes, rule = spectral blue
    (NOT techelet).
  - balanced default-3 cross-ref pills (one Tanakh + one extra-canonical +
    one NT when present) + metallic-blue "more for this verse" expander
    (border `#9FD0FF`, gradient `#0E2C50`→`#2E7BD6`→`#0E2C50`, text `#EAF4FF`).
  - thread cards lifted as the jewel: register-colored top border (by anchor
    source class) + elevation + larger radius + hover lift.
  - NO greyed-out text: retired the S140 40%-opacity locked baseline rows AND
    the locked-thread teaser fade. Locked targets stay full-opacity with a
    tier chip; locked threads show the full first paragraph at full opacity,
    register border + tier chip + Unlock pill doing the signaling.
- `app/src/components/ChapterCommentary.tsx` — header + sub-heading techelet
  `#1A6FE5` → spectral blue. Titles/bodies already inherit Lora serif; labels
  already sans.
- `app/src/components/ToolAnnotationBand.tsx` — sans on the chrome eyebrow +
  footer (serif substance untouched); argaman band + spectral-blue eyebrow
  already correct.

## Build status
- `tsc -b --force` → exit 0 (clean). This is the Render-strictness gate
  (the S199 lesson). 
- `vite build` could NOT run in the sandbox — `node_modules` holds macOS
  native binaries, so rolldown's Linux binding is absent. Run
  `npm run build` on the Mac to confirm the full bundle before pushing
  (Render runs it on deploy regardless).

## Still to confirm at open (couldn't from sandbox)
- The `remnant-bible.apk` GitHub Release is the new build — GitHub API was not
  reachable from the sandbox (egress). S201 checkpoint records it confirmed on
  device (153 books + TSK). `dbe96c1` + the S201 commit `f2cdd14` ARE on
  `origin/main` (verified).

## Commit from the Mac (NOT the sandbox)
NOTE: package.json lives in the `app/` subfolder — run the build there.
```
cd ~/Desktop/App/app && npm run build   # vite bundle check (Mac, correct dir)
```

Git runs from the repo root:
```
cd ~/Desktop/App
# rm -f .git/index.lock   # only if a stale lock blocks it
git add app/src/components/ReaderDivider.tsx \
        app/src/App.tsx app/src/index.css \
        app/src/components/ChapterEndCard.tsx \
        app/src/components/ChapterCommentary.tsx \
        app/src/components/ToolAnnotationBand.tsx \
        S202_LAYOUT_BUILD_NOTES.md
git commit -m "S202: wire dividers + chapter-end aesthetic pass (S201 layout)"
git push origin main
```
The divider PNGs are already committed (`f2cdd14`). Web fix reaches the
installed app via the Render deploy — no APK rebuild needed.
