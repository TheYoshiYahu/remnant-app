# S127 — Wheel 7 code build (share-and-copy-with-watermark)

Spec + assets locked at S126. This session is the code build half.

**Read first:**
- `DESIGN_LANGUAGE.md` §24 — locked spec, full implementation contract
- `REBUILD_STATE.md` — sweep state (W7 is the next un-shipped wheel)
- `S118_READ_THE_SCRIPTURES_PAGE_SPEC.md` — landing-page spec (Yoshi-side WP build, separate from this code work)

**Locked v4 brand-mark asset:**
- `~/Desktop/App/brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-share-card-watermark-240x360.png` (canvas watermark)
- `~/Desktop/App/brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` (hero / App Store)

**Build scope (PWA-only — no schema, no API):**

1. `app/src/lib/share-card-render.ts` — pure helpers + canvas render per §24 *Helper API surface*. Four pure functions worth sanity-testing: `formatRangeHeader`, `computeBodyFontSize`, `buildShareFilename`, `buildTextOnlyFallback`.
2. Three-zone canvas layout per §24 *Three-zone layout* (header 9% / body 73% / footer band 18% — reserved-band rule is load-bearing).
3. Three-transport export: `navigator.share` → `clipboard.write` (Copy only) → `<a download>` fallback. Text-only fallback if `clipboard.write` rejects PNG.
4. Promote §20 menu *Share with watermark* (single verse) from Coming-soon → Live.
5. Promote §21 RangeActionPicker *Copy range with watermark* + *Share range with watermark* from Coming-soon → Live.
6. Upgrade §20 *Copy verse* from text-only `clipboard.writeText` to canvas-PNG-with-text-fallback (same renderer).
7. Brand-mark import via Vite static-asset pipeline; preload + `img.decode()` at module init.

**Verification:** `tsc -b` clean + node sanity tests on the four pure helpers per the post-S121 forward standard. Vite build skipped in sandbox per rolldown architecture mismatch (Render rebuilds cleanly).

**Drift-catch deltas at ship:** §20 line-412 table drops `(Wheel 7)` parenthetical from the Share row; §20 S122 stub catalog flips *Share with watermark* row Status → Live + Wheel → —. Both edits as part of the §20 / §22-catalog patches per the drift-caught-while-editing convention.

**Out of scope at V1:** multi-card splitting for over-long ranges (warning modal instead), custom themes, editable watermark, per-tier variants, share analytics. All deferred per §24 *What this section deliberately does NOT prescribe*.
