S170 — §30 V1 implementation + §24 watermark back-edit + NT morph residual spec

# What shipped this session

Closes the §30 V1 implementation wheel (html2canvas + Share buttons live in StrongsLookup, LexiconSheet BDB, LexiconSheet LSJ), applies the §24 watermark back-edit to match the §30 spec (18% → 20% footer, new icon + wordmark composition), and writes the deferred NT morph residual lexeme-based fuzzy-join strategy spec. tsc -b clean across the project. New S170 sanity suite at 52/52; S127 still 21/21; all other suites unchanged.

Two-phone live walk on phones is **pending** as of this checkpoint write — runs from Yoshi's end with the new code deployed (sandbox can't drive iOS share sheets). Code is ready; ship-or-redline gate is the phone walk.

## §30 V1 implementation

Three modal surfaces each get a Share button right of close ✕:

- **StrongsLookup** (`app/src/components/StrongsLookup.tsx`) — Share calls `executeStudyShare` with `{ strongNumber, transliteration, source: "strongs" }`.
- **LexiconSheet BDB** (`app/src/components/LexiconSheet.tsx` with `activeSource === "bdb"`) — Share uses the active entry's transliteration + `source: "bdb"`.
- **LexiconSheet LSJ** (same component, `activeSource === "lsj"`) — Share uses `source: "lsj"`.

Share button is disabled until the modal's entry has resolved (no html2canvas capture of a loading spinner). Both close ✕ and the Share button carry `data-export-suppress` so they get removed from the cloned modal before html2canvas runs — the export image shows lexicon content only, no chrome UI.

The "Read full lexicon entry" affordance carries `data-export-replace="lexicon-deeplink"`. At export time the §30 helper walks the cloned DOM and swaps that button for a non-clickable text line per spec:

> Full BDB entry at bible.remnantofpromise.org/strongs/H7225
> Full LSJ entry at bible.remnantofpromise.org/strongs/G3056

URL doubles as paste-and-go discovery (the V1.1 `GET /strongs/{N}` route is still deferred — text-only in V1).

### Render pipeline

`app/src/lib/study-share-render.ts` (NEW, ~360 lines):

- `executeStudyShare(modalEl, meta)` — top-level entry point. Renders the card via `renderStudyShareCard`, then runs the transport chain.
- `renderStudyShareCard(modalEl, meta)` — clones modal off-screen at `position:fixed; left:-99999px`, applies the two DOM transformations (deeplink button → URL text, suppress nodes removed), runs `html2canvas` at 2× DPR, composites into a 1080×1920 canvas: upper 80% (1536px) = captured modal with object-fit:contain centering on a surface-color background, lower 20% (384px) = shared watermark footer per §170.
- Pure helpers: `slugifyTransliteration`, `buildStudyShareFilename`, `buildLexiconDeeplinkText` — all node-testable.
- Transport chain (same as §24): `navigator.share` → `clipboard.write(ClipboardItem)` → `<a download>` blob URL. AbortError treated as normal flow exit.
- Filename pattern: `{strong}-{slug}-rop-study.png` — e.g., `H7225-reshith-rop-study.png`, `G3056-logos-rop-study.png`. Transliteration slug strips diacritics via NFD + combining-mark removal, lowercases, collapses whitespace/hyphens.

### html2canvas dependency

`npm install html2canvas` — version-pinned in `app/package.json`. Bundle cost ~50KB gzipped per §30 spec; observed cost in vite build went from ~530KB → 577KB total JS (+47KB gzipped), in spec range.

## §24 watermark back-edit (per Yoshi's wife's iMessage thumbnail redline)

Refactored `app/src/lib/share-card-render.ts` to consume the new shared watermark painter. Net changes:

- **Footer band: 18% → 20%** of card height. On the 1080×1350 card, footer height bumps from 243px to 270px.
- **Body zone shrinks 73% → 71%** (header stays at 9%).
- **Header band content changed** — the old left-aligned "REMNANT OF PROMISE" + right-aligned "OFFICIAL STUDY BIBLE" chrome migrated to the new footer wordmark stack (which now carries the full brand text). To avoid duplication, the header band now centers the verse reference (e.g., "Genesis 1:1") in the chrome-muted register. Reference no longer lives in the footer-left position because the new footer is fully owned by the shared watermark.
- **Old per-file brand-mark singleton dropped** (lines 365-404). Replaced by a thin re-export `preloadBrandMark = preloadFooterBrandMark` so the App.tsx app-init preload continues to work without modification.
- **Inline watermark + divider + footer-reference paint deleted** (~60 lines). Replaced by a single `await paintWatermarkFooter(ctx, W, H, { brandMark, theme: "dark" })` call.

The watermark composition (icon left + wordmark stack centered) is now identical pixel-for-pixel between §24 verse-share (1080×1350) and §30 study-share (1080×1920). Brand reads consistently at messaging-app thumbnail size across both surfaces — closes the redline.

### Header reading note for Yoshi at live walk

The §24 header band now reads as a centered "Genesis 1:1" instead of the prior "REMNANT OF PROMISE | OFFICIAL STUDY BIBLE" chrome flanking. This is a visible change beyond the spec's literal "Apply the same correction" language — flagged here for your visual sign-off. If you prefer the chrome flanking back (with the reference moving somewhere else, or just dropped since the footer wordmark carries the brand), redline at the walk and I'll revise.

## Shared watermark painter (the §170 architectural change)

`app/src/lib/watermark-footer-render.ts` (NEW, ~270 lines):

Exports:
- `FOOTER_PCT` (0.20) — the single source of truth for both §24 and §30 footer math.
- `computeFooterGeometry(W, H)` — pure helper returning band rect, divider, icon rect (incl. centered-square source crop), wordmark line positions.
- `preloadFooterBrandMark()` — singleton lazy-loader for the v4 brand-mark Image. Returns null on failure (non-fatal — painter renders without the icon).
- `paintWatermarkFooter(ctx, W, H, opts)` — paints divider + icon + wordmark stack onto the caller's canvas. Theme-aware (`dark` / `light`).

### Brand-mark icon — auto-crop decision (S170)

Per S170 Q1 (Yoshi): the spec'd new asset `brand-mark-blue-on-black-v4-share-footer-icon-200x200.png` will NOT be produced. Instead the painter computes a centered-square crop of the existing `brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` at draw time — source rect `(0, 208, 832, 832)`, captures the central 2/3 of the full v4 mark, rendered at 120×120 px in the footer. 7× upsample headroom from the 832-tall source down to the 120-tall rendered icon keeps render quality high.

**Note on bundle**: importing the 832×1248 full mark instead of the 240×360 crop pushes the bundled PNG from ~80KB to 989KB. The asset still ships as a single network round-trip via Vite's content-hashed asset URL (browser caches across sessions), and the share-card render is the only consumer that touches it — so the bundle-size impact is "one extra 900KB asset that loads on first Share click." If that's not OK at V1, the workaround is to keep using the 240×360 crop (or create a separate 832×832 pre-cropped asset to drop the unused top/bottom rows). Flagged for your call at the live walk; current ship is the full-mark import.

### Watermark composition (per §30 spec, applied to both §24 and §30)

```
┌──────────────────────────────────────────────────────────┐
│ ────────  (hairline divider, 1px white/0.12 alpha,       │
│            6% horizontal inset, sits on band top)        │
│                                                          │
│  [ICON]    Remnant of Promise         (36pt Lora 600)    │
│  120×120   Official Study Bible       (24pt Lora 400 it.)│
│            bible.remnantofpromise.org (22pt Lora 500,    │
│  (5% left   centered horizontally     #1A6FE5 techelet)  │
│   inset)                                                 │
└──────────────────────────────────────────────────────────┘
```

Absolute pixel sizes (icon 120×120, fonts 36/24/22pt) are CONSTANT across §24's 1080×1350 and §30's 1080×1920 cards. Footer band height is 20% of card height (270px for §24, 384px for §30).

## NT morph residual — lexeme-based fuzzy-join strategy spec drafted

`S170_NT_MORPH_RESIDUAL_SPEC.md` (NEW). Sketches:

- Root cause (structural KJV USFX over-tagging vs TAGNT token count, not data quality).
- Lexeme + Strong's-base second-pass match strategy with homonym safety as a hard requirement.
- Recovery estimate: ~80% of residual recoverable (~6,500 real-content NT rows from the 20,361 residual), projected post-fuzzy-join coverage ~98%.
- Ship-at-V1.1 vs defer analysis.
- **Recommendation: defer.** Open the fuzzy-join wheel only after the §28 surface has been exposed to real partners and the residual is explicitly flagged as a usability complaint (gate: ≥1/week morph-data-missing reports). Until then, strict-occurrence join + the §28 "[no morph]" cell is the right trade-off — honest about the gap, no risk of incorrect data, zero engineering burn before partner signal.
- Four open questions tee'd up for V1.1 open (homonym disambiguation source, edit-distance threshold, per-verse pre-pass aggregate, schema flag for fuzzy-matched morphology).

## Settings → Reader preferences page (optional Q1 carry from S168)

Did NOT open this session. §30 + §24 back-edit + morph spec consumed the wheel cleanly; opening Settings as a parallel track would have stretched the close without visible upside. Carried forward to S171.

# Verification

## tsc -b
Exit 0 across the project. No type errors introduced by §30 study-share-render.ts, watermark-footer-render.ts, or the StrongsLookup / LexiconSheet share-button wiring.

## Sanity suites
All node sanity files passing:

  - `_s123_range_selection_sanity.mjs` → 18 passed
  - `_s125_search_sanity.mjs`           → clean
  - `_s127_share_card_sanity.mjs`       → 21 passed (unchanged — §24 refactor preserved the pure-helper public API)
  - `_s129_additive_body_sanity.mjs`    → 11 passed
  - `_s140_search_teaser_sanity.mjs`    →  6 passed
  - `_s157_tts_sanity.mjs`              → clean
  - `_s163_lexicon_sanity.mjs`          → clean
  - `_s166_bookmarks_index_sanity.mjs`  → 34 passed
  - `_s167_interlinear_sanity.mjs`      → clean
  - `_s168_interlinear_layer_sanity.mjs`→ clean
  - **`_s170_study_share_sanity.mjs`**  → **52 passed (NEW)**

S170 suite covers: `computeFooterGeometry` at 4 card sizes + footer-pct invariant + wordmark non-overlap + divider span; `slugifyTransliteration` across 11 transliteration cases (Hebrew, Greek, Latin diacritics, empty, whitespace-only, hyphens, mixed runs); `buildStudyShareFilename` across 4 strong-number/translit combos; `buildLexiconDeeplinkText` across 4 source modes.

## vite build
Compiles 56 modules cleanly when redirected to /tmp (sandbox dist/ permission glitch only — code itself builds). Bundle size: 577KB JS / 39KB CSS / 989KB brand-mark PNG.

## Live walk
**Pending Yoshi.** Two-phone walk per the §30 V1 ship-gate:

  1. Run the dev server (`npm run dev` from `app/`) or deploy to staging.
  2. On Yoshi's phone (iOS Safari, Companion+ signed in):
     - Tap any verse word → StrongsLookup opens → tap Share → native iOS share sheet fires with 1080×1920 PNG attached.
     - Confirm filename matches `{strong}-{slug}-rop-study.png`.
     - Send via iMessage to wife's phone.
     - Confirm watermark icon + wordmark + URL legible at iMessage thumbnail compression.
     - Open LexiconSheet from "Read full lexicon entry" → tap Share → repeat. Confirm "Read full lexicon entry" button replaced with text URL in the exported PNG.
  3. On wife's phone: redline the watermark at thumbnail size. The whole point of S170's 18→20% bump + new composition was her redline at S169 close.
  4. On §24 verse-share: tap any verse → VerseActionMenu → Share → confirm the verse-share watermark now matches the §30 watermark exactly (same icon, same wordmark stack, same URL line). Confirm the new header-centered "Genesis 1:1" reads OK (or redline if you want the brand-chrome flanking back).

If the walk passes, S170 closes clean. If wife flags any watermark issue (icon crop, text size, URL color), open S171 with a paired §24/§30 watermark tweak commit.

## Optional: pre-phone-walk desktop Chrome MCP smoke test
Available if you want to validate the wiring before going to phones — I can drive Claude in Chrome MCP through:

  - Sign in as Companion+ (community SSO)
  - Tap a Genesis 1:1 word → StrongsLookup mounts
  - Confirm Share button visible right of ✕
  - Click Share → confirm executeStudyShare runs without throwing
  - Inspect downloaded PNG (chrome download → file → dimensions check)

That validates the React + html2canvas + clipboard path on desktop. iOS native share sheet itself can only be tested on a real phone.

# Push verification (S166 standard)

**edited-not-committed:**
- `app/package.json` — `html2canvas` added under dependencies
- `app/package-lock.json` — html2canvas + transitive deps
- `app/src/lib/watermark-footer-render.ts` — NEW (~270 lines)
- `app/src/lib/study-share-render.ts` — NEW (~360 lines)
- `app/src/lib/share-card-render.ts` — §24 back-edit (imports new helper, drops local watermark code, header centers verse reference, footer % bumped to 20%)
- `app/src/components/StrongsLookup.tsx` — Share button + ref + handler + `data-export-*` attrs
- `app/src/components/LexiconSheet.tsx` — Share button + ref + handler propagated through `LexiconSheetBody` props + `data-export-*` attrs
- `S170_NT_MORPH_RESIDUAL_SPEC.md` — NEW
- `S170_CHECKPOINT.md` — NEW (this file)
- `_s170_study_share_sanity.mjs` — NEW (52 cases, all pass)

**committed-not-pushed:** none.

**pushed (Yoshi's terminal during the session):** none.

**Suggested Yoshi commit + push to unblock the phone walk:**

Per S170 mid-session call (path A — push first, walk on prod): the walk
needs HTTPS to exercise the native iOS share sheet, so deploy must
precede the walk. tsc + 52/52 S170 sanity + 21/21 S127 sanity + all
prior suites green; the Share button is additive (gated on `entry`
loaded, no break to existing surfaces); bad-state-on-prod window is
short. If the walk surfaces redlines, S171 opens with a paired
follow-up commit.

```bash
cd ~/Desktop/App
git add app/package.json app/package-lock.json \
        app/src/lib/watermark-footer-render.ts \
        app/src/lib/study-share-render.ts \
        app/src/lib/share-card-render.ts \
        app/src/components/StrongsLookup.tsx \
        app/src/components/LexiconSheet.tsx \
        S170_NT_MORPH_RESIDUAL_SPEC.md \
        S170_CHECKPOINT.md \
        _s170_study_share_sanity.mjs
git commit -m "S170 — §30 V1 study-share + §24 watermark back-edit + NT morph residual spec"
git push
```

Then: Render auto-deploy → hard-refresh + SW cache clear on both phones
(per S166 standing rule) → run the two-phone walk steps below.

# Open Yoshi-questions carried forward to S171

1. **Two-phone live walk outcome.** Did §30 V1 ship clean, or did the phone walk surface redlines? Specifically: native iOS share sheet behavior on first call, watermark legibility on wife's phone at iMessage thumbnail, exported PNG color fidelity (the modal background → study-share body background hand-off can produce a visible boundary on some color configs).

2. **§24 header band change.** Did the live walk confirm the new centered verse reference reads OK in the header, or do you want the brand chrome flanking back?

3. **Brand-mark bundle weight.** The 832×1248 v4 full mark adds ~900KB to the bundled asset graph (replacing the 240×360 ~80KB watermark crop). On first Share click the asset loads (then cached). If that's not OK for V1, two workarounds: (a) keep both assets and have `watermark-footer-render` import the existing 240×360 crop, computing a centered-square sub-crop instead of the centered 832×832 — same composition, much smaller asset; (b) pre-crop a dedicated 832×832 asset and bundle that.

4. **V1.1 `/strongs/{N}` deep-link route.** Open the server-side route + Open Graph metadata wheel? Spec'd in §30; this is the second growth layer beyond the watermark — messaging-app link previews render the share-card automatically when partners paste the URL.

5. **NT morph residual** — defer recommendation stands per `S170_NT_MORPH_RESIDUAL_SPEC.md`. Reopen at first ≥1/week morph-missing partner complaint or at any session you greenlight.

6. **Settings → Reader preferences page** (Q1 carry from S168) — still deferred. Modest scope; can land as a parallel S171 track if no other §30 / §24 redlines surface.

7. **§28 InterlinearLayer column-stack as standalone card share** — V1.1 stretch goal per §30 surfaces-NOT-getting-Share. Reopen if partner feedback flags demand.

8. **§17 Chapter-end cross-reference card export** — same V1.1 stretch logic.

9. **9 long-tail S161 Group B singletons** — standing residual carried.

10. **Yahuah → Adonai vocatives addressing Yahusha** — restoration-pipeline pass, standing.

# Standing residuals (carried)

- 9 long-tail S161 Group B singletons (malachi 4:4, matthew 5:33, mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians 2:5, hebrews 11:37, revelation 1:10) — restoration-pipeline work, not in any §28 / §29 / §30 scope.
- Yahuah → Adonai vocatives addressing Yahusha — restoration-pipeline pass.
- v1.1+ candidates: apocrypha book-slug map, Gesenius source investigation, Thayer's 1889 clean dump, system-wide Library → Companion lockedTier Literal rename.
- §28 InterlinearLayer column-stack share — V1.1 stretch goal per §30.
- §17 Chapter-end cross-reference card share — V1.1 stretch goal per §30.
- V1.1 `GET /strongs/{N}` deep-link route + Open Graph metadata.

# Standing efficiency rules (carried)

- Voice-gate batch pattern for authored content
- Local files first before web-fetch
- Self-sufficient application of skill + source
- Sandbox-git limitation — commits + Render dashboard changes run from Yoshi's terminal
- Spec-then-build
- Verbal-answers-transcribe to the file before close
- Render artifacts persist
- Publish-then-edit
- S166 — Service-worker hard-refresh verification at every PWA deploy
- S166 — Push verification at every session close (named: pushed / committed-not-pushed / edited-not-committed)
- S169 — Chrome MCP for live-walk verification: when Yoshi has Claude in Chrome enabled, the live walk happens in-session via browser automation rather than as a back-and-forth Yoshi-walks-and-reports loop. Same hard-refresh + SW-clear discipline; Yoshi-eye still owns final visual judgment for aesthetic redlines (color register, density, watermark scale) the DOM inspection can't catch.
- S170 — Shared painter discipline: when two surfaces render the same canonical visual register (e.g., the watermark band across §24 and §30), the paint code lives in ONE module imported by both consumers. Prevents drift, keeps spec-then-build literal. Apply forward to any cross-surface visual element (e.g., the future §17 cross-ref card watermark, §28 column-stack share watermark).

# What S171 opens against

1. **Phone-walk redlines from Yoshi + wife** — triage at session open.
2. **§24 header band visual call** — reference-centered vs brand-chrome flanking. Decide at walk.
3. **Brand-mark bundle weight** — 832×1248 v4 import vs sub-crop of 240×360 vs new dedicated 832×832 asset. Decide based on V1 bundle-size tolerance.
4. **`/strongs/{N}` deep-link route + Open Graph** — open as V1.1 wheel if §30 V1 ships clean on the phone walk.
5. **Settings → Reader preferences page** — optional parallel track from S168 Q1 carry.
6. **NT morph residual fuzzy-join** — gated on partner feedback per S170 spec.
