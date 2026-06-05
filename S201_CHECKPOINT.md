# S201 Checkpoint — app fix shipped; reader aesthetic + maps teed up

Mounted `~/Desktop` (+ `~/Downloads`), loaded yoshi-voice, read S199_CHECKPOINT
first. Two things happened this session: the reported native-app bug was
fixed and shipped, and a large design conversation produced settled
decisions + production assets for the reading surface. Next session's job
(Yoshi): **perfect the layout.**

## 1. THE BUG — FIXED + SHIPPED + CONFIRMED ON DEVICE
Native app showed only the 66-book canon and TSK was gone; web was fine.
Root cause: the Capacitor shell shipped **bundled** (`webDir:"dist"`, no
`server` block) so it ran frozen baked-in web code — every Render deploy
(S178/S199/S200) never reached the phone, and its API calls went out
unauthenticated → anonymous/free → 66 + no TSK.

Fixes (committed `dbe96c1`, on `main`):
- `app/capacitor.config.ts` — added `server.url =
  "https://bible.remnantofpromise.org"` (the by-URL posture Yoshi set in
  early sessions). Now every web deploy reaches the installed app; no more
  per-release rebuilds for web fixes.
- `app/src/App.tsx` — `loadInitialPosition` + `listNotes` now await the
  native JWT before firing (same proven fix as `/me` S178, `listBooks`
  S200). These two were mount-once, never-self-healing token races.
- Deleted a stray `config 2.xml` (macOS dup) that broke the release build.
- Verified `tsc -b` + `vite build` clean. New signed APK built
  (`./gradlew assembleRelease`) and uploaded to GitHub Releases as
  `remnant-bible.apk` (the live download is GitHub Releases, NOT
  public/download — that README is stale). **Confirmed working on Yoshi's
  phone: 153 books + TSK present.**
- Rebuild steps: `S201_REBUILD_STEPS.md`. Going forward web fixes reach
  the app via Render deploys; only native changes need a shell rebuild.

## 2. DIVIDER ASSETS — created this session, ready to wire in
Two production-quality page-break ornaments, generated in Grok Imagine
(painterly quality beyond Claude's own plotting), cropped + cleaned by
Claude. Saved to **`app/public/dividers/`**:
- `divider-botanical.png` (+ `-transparent.png`) — gold vine, white
  blossoms, olive, grapes, pomegranates, center menorah; in the spirit of
  the Jubilees book cover. For the chapter→apparatus seam.
- `divider-alephbet.png` (+ `-transparent.png`) — the 22 paleo-Hebrew
  letters (ʾaleph→taw) in a metallic spectrum. For the major section
  break. (Solved Grok's duplicate problem via image-to-image FROM an
  accurate 22-letter reference Claude rendered, with a count-lock prompt.)
- Grok originals preserved in `app/public/dividers/source/`.
- ⚠ Light-theme caveat: both are built on near-black; on the light/parchment
  reader the white blossoms vanish. Light-theme variants = a future Grok
  gen with a parchment background.
- ⚠ These PNGs must be committed + pushed from the Mac to reach the live app.

## 3. CHAPTER-END AESTHETIC PASS — decisions settled (see S127 log)
Full settled design in `S127_AESTHETIC_DECISIONS_LOG.md` (S201 section).
Summary of what next session builds:
1. Ornament at the chapter→apparatus seam — now the **botanical divider**
   (replaces the gold-diamond placeholder).
2. Serif for substance (thread titles, scripture), sans for chrome.
3. Quoted scripture as left-ruled blockquotes — rule color SPECTRAL BLUE
   (#0084FF) or argaman, NOT techelet (#1A6FE5 is divine-names-only;
   current ChapterEndCard header is drift — fix in same pass).
4. Cross-ref pills: balanced default 3 (one Tanakh + one extra-canonical +
   one NT when each exists) → then a metallic-blue **"more for this verse"**
   expander.
5. Thread cards lifted as the jewel (register-colored top border).
6. Consistent vertical rhythm per block.
7. **NO greyed-out text anywhere** (new hard rule) — locked content stays
   fully readable, separated by border/box/tier-chip, never by opacity.
   Retires the S140 40%-opacity rows + the teaser fade.

## 4. MAPS REBUILD + ALL-PD IMAGERY — see NEXT_SESSION_MAPS_REBUILD_SPEC.md
The S199 Maps surface is NOT viable (abstract arcs, not a map). Rebuild as
a real map. Key doctrine correction Yoshi taught this session: the
gathering is NOT a round-trip to the land — it routes through the
WILDERNESS and SIFTS (Ezekiel 20:34-38: into the wilderness of the people,
under the rod, the rebels purged out; only the purified remnant enters).
Plus: sectioned regional atlas (Egypt, the Aqaba crossing, Sinai-in-Arabia
per Galatians 4:25, Assyria, Babylon, the land), all from public-domain
imagery (clay pots, altars, Mt Sinai, artifacts) — the app as THE source.
Full spec + guardrails in that file.

## NEXT SESSION — "perfect the layout" (Yoshi's words)
1. Wire the two dividers into the reader (botanical at chapter seam,
   aleph-bet as section break); open with a proof for sign-off.
2. Implement the full chapter-end aesthetic pass (items 1-7 above),
   checking each against the S127 locks (techelet reservation, etc.).
3. Then the maps rebuild (proof render first) + the PD imagery library.

## Commit before closing (from the Mac)
New/changed files to commit + push: `app/public/dividers/*`,
`S201_CHECKPOINT.md`, `S201_REBUILD_STEPS.md`,
`NEXT_SESSION_MAPS_REBUILD_SPEC.md`, `S127_AESTHETIC_DECISIONS_LOG.md`,
`S200_SESSION_OPEN_PROMPT.md`. (Sandbox can't write `.git`; commit on the
Mac. `rm -f ~/Desktop/App/.git/index.lock` if a stale lock blocks it.)
