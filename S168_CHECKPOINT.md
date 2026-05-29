S168 — §28 Phase 9.2 (Hebrew-Greek interlinear) — steps 5–7 landed

# What shipped this session

Closes §28 Phase 9.2 — the §28 InterlinearLayer + chrome-strip toggle + API tier-gate are end-to-end. S167's helpers + sanity + loader carry forward unchanged. tsc clean on `app/`; S167 76/76 morph-helper sanity intact; S168 53/53 integration sanity passes.

## Step 5 — useInterlinearToggle hook

**File:** `app/src/lib/useInterlinearToggle.ts` (NEW)

Mirrors `useStrongsSuperscriptsToggle` / `useParentheticalsToggle` (the §27 / §144 precedents) — `{ show, toggle, set }`, SSR-safe `localStorage` read+persist, default OFF. Storage key `rop_interlinear_v1` (matches the `rop_X_v1` convention; the §28 spec's draft `reader-prefs.interlinear` naming sketch was superseded by the ship-canonical form so DevTools recipes + the boot script index against one prefix). Tier-gate intentionally lives OUTSIDE the hook — a lapsed Companion partner retains their preference and the layer auto-restores when the subscription re-engages.

Also exports `isAtCompanionTier(partnerTier)` — single source of truth for the `complete_study | everything` check, replacing the inline literal-string compare scattered through App.tsx S164 BDB/LSJ path. The Python side has the symmetric `_is_at_companion_tier(user)` in `api/main.py` (above the `get_verse_words` endpoint).

## Step 6 — InterlinearLayer.tsx

**File:** `app/src/components/InterlinearLayer.tsx` (NEW, ~370 lines)

Three exports:

- `InterlinearLayer` — verse-scoped wrapper. Takes `verseWords` directly + handlers + an optional `leadingBaseline` (verse-number sup + bookmark glyph). Renders the full column-stack flow for one verse. Available for future-wheel use; **NOT** the V1 integration seam (V1 uses the per-column wrapper inline so paren-text + range-mode + highlights all still work).
- `InterlinearColumnView` — internal column-stack render. Owns the long-press morph-register swap (500ms hold; matches §20 long-press timing for muscle-memory continuity). The morph cell's own pointer handlers stopPropagation so the §20 verse-action-menu long-press path stays usable on the surface row.
- `InterlinearWordColumn` — **the App.tsx integration seam**. Takes one extended `VerseWord` + handlers; builds the synthetic `InterlinearVerseWord` + `InterlinearStrongEntry` from the inline-extended payload and feeds `buildInterlinearColumn`. Surface column carries an optional `surfaceOverride` so the punctuation-bearing rendered text (e.g. `"beginning,"`) survives instead of the canonical-surface form from `verse_words.surface`.
- `preloadInterlinearFonts()` — wiring seam, no-op in V1. Comments document the drop-in path for SBL Hebrew + SBL BibLit woff2 files once they land in `app/public/fonts/`; until then the system-font fallback chain (SBL Hebrew → Ezra SIL → Times New Roman / SBL BibLit → Cardo → Times New Roman) covers Hebrew + Greek glyph coverage on macOS / iOS / most Linux desktops and Windows installs with Cardo present.

Column shape per §28 spec — lemma (original-script font) → translit (italic muted) → morph (small-caps muted; long-press swaps short ↔ expanded) → gloss (italic muted) → surface (top-rule + larger text, baseline). Hebrew/Aramaic lemma carries the FSI/PDI bidi isolation via `wrapHebrewBidi` so within-cell RTL doesn't bleed into the LTR column-flow.

## Step 7a — Chrome-strip toggle + Settings + §20 stub removal

**File:** `app/src/App.tsx` (MODIFIED, ~80 lines added / 9 removed)

- New `useInterlinearToggle` import + `partnerAtCompanion` derived from `me?.tier`.
- New `Interlinear` chrome-strip pill, adjacent to the §27 `Show/Hide Strong's` button. Same metallic-argaman gradient (`#3D1B5C → #8E4FB3 → #3D1B5C` + border `#D4B0E0` + text `#F5E6FA`) per §28 register lock. Companion+ partners see `Show Interlinear` / `Hide Interlinear` and tap-toggles the layer. Below-tier partners see `Interlinear` + a `Companion` badge chip and tapping routes to `/pricing`.
- Per-segment branch in the verse render loop: when `showInterlinear && partnerAtCompanion`, the tappable segment renders as `<InterlinearWordColumn>` (column-stack above the English word). Falls through to inline-tappable render when the matched VerseWord doesn't carry the S168 fields (defensive — preserves the surface render unconditionally). Plain segments (parens, punctuation, supplied italics) still render at the baseline via the existing path so §144 English-helpers strip, highlights, range mode, and §20 long-press all continue to work alongside the interlinear surface.
- §20 *Hebrew/Greek interlinear* menu stub **REMOVED** from `buildMenuSections` per the §28 deprecation lock (DESIGN_LANGUAGE.md §28 "§20 menu-stub deprecation locked A"). Same pattern §26 set for Vine's. The Word-study section is now: Strong's (live, Free) → BDB or LSJ (live, Companion / stub below-tier) → Vine's (stub, Library) → Nikkudot siblings on Hebrew (stub, Library). The `interlinear` `makeTierStub` call is gone; the chrome-strip toggle is the canonical interlinear affordance.

**Settings entry deferred.** The §28 spec at line 1528 names "Settings → Reader preferences page carries the same toggle as the canonical default-state surface", but the §144 and §27 ships before this never created a Settings route — the chrome-strip toggle is the canonical surface for all three (`hideParentheticals`, `showStrongsSuperscripts`, `showInterlinear`). Adding a Settings page in S168 would be a separate scope-creep wheel (touching `App.tsx` route table, a new `Settings.tsx` route, navigation entry). Carried as a Yoshi-decision item below.

## Step 7b — API tier-gate (chapter-words + verse-words)

**Files:** `api/main.py` + `api/models.py` (MODIFIED)

Both word endpoints (`GET /v1/books/:slug/chapters/:n/words` and `GET /v1/verses/:verse_id/words`) extended with the §28 four-field payload + language:

```python
class VerseWord(BaseModel):
    position: int
    surface: str
    strong_number: Optional[str] = None
    morphology: Optional[str] = None         # NEW S168
    lemma: Optional[str] = None              # NEW S168
    transliteration: Optional[str] = None    # NEW S168
    short_definition: Optional[str] = None   # NEW S168
    language: Optional[StrongLanguage] = None  # NEW S168 (drives PWA font-stack)
```

SQL extended with `LEFT JOIN strong_entries se ON se.strong_number = vw.strong_number` (LEFT so un-tagged tokens + lexicon-miss tokens still surface). Tier-gate per row via `_is_at_companion_tier(current_user)` (Companion = `complete_study` or `everything`; below-tier or anonymous → all five new fields → `None`). Both endpoints now take `current_user: Optional[User] = Depends(get_current_user_optional)` — same JWT-cookie / Authorization decode path as the `/v1/books` routes; anonymous callers (no JWT, invalid JWT, expired JWT) resolve to `None` and receive the below-Companion payload.

The base tri-tuple (`position`, `surface`, `strong_number`) stays Free for every caller per the §9 promise. The §20 tap-modal surface (`GET /v1/strongs/:n`) is unchanged — Free-tier partners keep the casual-reading depth.

**No DB migration, no ALTER, no new column.** `verse_words.morphology` exists from S120 V2-deferred + populated in S167. `strong_entries.{lemma, transliteration, short_definition, language}` exist from S120 / S159 / S164 lexicon loads.

**TypeScript client (`app/src/lib/api.ts`):** `VerseWord` interface extended with the five optional fields (all `?: ... | null` — optional + nullable to match the Python `Optional[...]` shape with a Companion+ gate the client can branch on).

## Step 8 — Sanity additions

**File:** `_s168_interlinear_layer_sanity.mjs` at app root.

**Result: 53/53 sanity cases pass.** Coverage:

- `isAtCompanionTier` Companion-gate predicate (8 cases) — null, undefined, free, study_notes, extras, complete_study (→true), everything (→true), nonsense.
- API tier-gate shape contract (13 cases) — JS replica of the per-row gate inside `get_chapter_words`; verifies free-tier gates morph/lemma/translit/gloss/language to null, Companion+ preserves them, base tri-tuple always survives.
- `InterlinearWordColumn` integration path (20 cases) — Hebrew full column (HR/Ncfsa morph decoded to `prep. + n. ...`; SBL Hebrew font stack; FSI/PDI-wrapped lemma), Greek full column (N-NSM morph decoded; SBL BibLit font stack; unwrapped lemma), degraded below-Companion column (surface-only, body fallback font), `surfaceOverride` punctuation pass-through.
- `groupVerseColumns` end-to-end from new payload (3 cases) — 2-column verse, position ordering.
- Font-stack + bidi regression guards (9 cases) — hebrew/aramaic → SBL Hebrew; greek → SBL BibLit; null → inherit; wrapHebrewBidi non-empty wraps; empty/null guards.

**S167 76/76 helper sanity STILL PASSES** unchanged — no regression in the morphology decoders.

**`tsc -b` clean** on `app/`. Python `ast.parse` clean on `api/main.py` + `api/models.py`.

# Push verification (per S166 rule)

**edited-not-committed:**
- `api/main.py` — `_is_at_companion_tier` helper + tier-aware payload + JWT dep on both word endpoints.
- `api/models.py` — `VerseWord` extended with 5 §28 fields.
- `app/src/App.tsx` — `useInterlinearToggle` import + `partnerAtCompanion` flag + chrome-strip Interlinear pill + per-segment InterlinearWordColumn branch + §20 interlinear stub removal.
- `app/src/lib/api.ts` — `VerseWord` TS interface extended.
- `app/src/lib/useInterlinearToggle.ts` — NEW (~110 lines).
- `app/src/components/InterlinearLayer.tsx` — NEW (~370 lines).
- `_s168_interlinear_layer_sanity.mjs` — NEW (~220 lines, 53/53).
- `S168_CHECKPOINT.md` — NEW (this file).

**not in git (intentional — large source data, S167 carry-forward):**
- `source-texts/stepbible-data/Translators Amalgamated OT+NT/` — 156 MB sparse-checkout artifacts. Add to `.gitignore` if not already.
- `source-texts/stepbible-data/Morphology codes/` — 848 KB legend files. Keep or `.gitignore`.

**committed-not-pushed:** none.
**pushed:** none new this session (sandbox can't push; awaiting Yoshi's terminal).

**Suggested Yoshi commit flow:**
```bash
cd ~/Desktop/app
git add app/src/lib/useInterlinearToggle.ts \
        app/src/components/InterlinearLayer.tsx \
        app/src/App.tsx \
        app/src/lib/api.ts \
        api/main.py \
        api/models.py \
        _s168_interlinear_layer_sanity.mjs \
        S168_CHECKPOINT.md S167_CHECKPOINT.md
git commit -m "S168 §28 Phase 9.2 — InterlinearLayer + chrome-strip toggle + API tier-gate"
git push
```

Render rebuilds the frontend + API. Per the S166 PWA rule, **hard-refresh** the live site to bust the service-worker cache before walking the new surface.

# Live walk script (post-deploy, Yoshi's terminal)

Hard-refresh https://bible.remnantofpromise.org per S166 SW rule, then walk:

**§28 — Companion-tier test partner.**
1. Verse text renders inline as before (no visual change, default OFF).
2. Chrome strip carries the new `Show Interlinear` pill — metallic argaman, adjacent to `Show Strong's`. **NO** Companion-badge chip (you're at Companion+).
3. Tap → label flips to `Hide Interlinear` and the verse renders as column-stacks: lemma (original script, SBL Hebrew / BibLit) → translit (italic) → morph short (small-caps) → gloss (italic) → English surface (top-rule, baseline). One column per tagged word; parens like ` (LORD)` still visible at the baseline.
4. Long-press the morph cell — register swaps short → expanded ("prep. + n. com. f. sg. abs." vs "prep. + noun common feminine singular absolute"). Release → back to short.
5. Tap a column's English word → §20 StrongsLookup modal opens (interaction grammar preserved).
6. Long-press a column's English word → §20 VerseActionMenu opens (interaction grammar preserved).
7. Navigate to next chapter — toggle state persists, columns render across the new chapter.
8. Reload (hard-refresh) — toggle state persists across the reload.
9. Verify §20 word-action menu's *Word study* section no longer carries the `Hebrew interlinear` / `Greek interlinear` stub (per the deprecation lock).
10. Walk a verse with compound Hebrew prefixes (Gen 1:1 `בְּרֵאשִׁית` is `HR/Ncfsa`) and confirm the morph reads as the compound `prep. + n. ...` register. Yoshi-eye on whether the full compound or primary-only is the better default (open question carried below).

**§28 — Free-tier test partner.**
1. Chrome strip carries the `Interlinear` pill + a small `Companion` badge chip (`#1A0E2C` bg, white text).
2. Tap → routes to `/pricing`.
3. Verse text renders as before (no layer).
4. Open DevTools network panel + load a chapter; `GET /v1/books/.../words` payload should show `morphology: null, lemma: null, transliteration: null, short_definition: null, language: null` on every verse_word row (server-side tier-gate confirmed).

**§29 first-walk (still pending per S167 — run if not done).**
1. Reload landing page on a fresh partner (no bookmarks).
2. Chrome cluster carries `⚑ Bookmarks` button **left of** the Notes button.
3. Tap → empty-state copy renders.
4. Bookmark a verse via long-press → ⚑ inline-glyph visible after verse number; bookmark sheet closes cleanly.
5. Tap `⚑ Bookmarks` → bookmark appears in list, chronological newest-first.
6. Tap row → navigates to the verse; ⚑ inline-glyph visible post-nav.

# Open Yoshi-questions carried forward

1. **Settings → Reader preferences page** — §28 spec names this surface; §144 + §27 + §28 chrome-strip toggles are the canonical default-state surfaces today. Add the Settings route in a future-wheel sweep (single-add covers all three toggles + the theme-toggle + the `hideCommentary` toggle) or stay chrome-strip-only? Defensible either way; chrome-strip discoverability is fine, Settings page is the conventional "where preferences live" surface.

2. **Compound Hebrew morph display register** — *carried from S167*. `formatMorphology` decodes `HR/Ncfsa` as full compound `prep. + n. com. f. sg. abs.`. Defensible alternative: render only the primary (`n. com. f. sg. abs.`) and surface the prefix on long-press. Yoshi's eye on Gen 1:1 + a few sample compound-prefix verses once the live walk lands.

3. **§28 surface scope on Hebrew-prefix-only words** — words like Hebrew `הָ֖` (definite article, `HTd`) ship as their own verse_word in some loaders' splits. If the §28 layer renders these as standalone columns (article-only morph, no lemma proper), the verse may look "noisier" than expected. Yoshi-eye during the live walk; if the read is too noisy, a future-wheel surface-only path could collapse article/conj prefixes back into the following content word's column.

4. **SBL font assets** — V1 uses the system-font fallback chain (SBL Hebrew → Ezra SIL → Times New Roman for Hebrew/Aramaic; SBL BibLit → Cardo → Times New Roman for Greek). macOS / iOS / most Linux desktops cover the Hebrew + Greek glyph range; Windows partners without Cardo installed may see Times New Roman fallback. Drop the SBL Hebrew + SBL BibLit woff2 files into `app/public/fonts/` and uncomment the preload block in `InterlinearLayer.tsx::preloadInterlinearFonts` to ship licensed fonts with the bundle. Out-of-scope for S168; surfaces if a partner reports glyph-display issues on the walk.

5. **Verse-coverage shortfall reporting** — *carried from S167*. The S167 SQL emits `morph_populated` vs `strong_no_morph` stats after apply. If `strong_no_morph` is materially > 0 in prod, a one-pass enrichment pass should land in S169 to address Strong's-homonym disambiguation. Check the prod stats from the S167 SQL apply before opening S169.

# Standing residuals (carried)

- 9 long-tail S161 Group B singletons (malachi 4:4, matthew 5:33, mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians 2:5, hebrews 11:37, revelation 1:10) — restoration-pipeline work, not in §28 scope.
- Yahuah → Adonai vocatives addressing Yahusha — restoration-pipeline pass.
- v1.1+ candidates: apocrypha book-slug map, Gesenius source investigation, Thayer's 1889 clean dump, system-wide Library → Companion lockedTier Literal rename.

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

# What S169 opens against

Yoshi-decision items from the live walk (S168 redlines) plus any of the five open questions above. Likely fast-follow tracks: Settings page consolidation (single add covers §144/§27/§28 + theme + hideCommentary), compound-Hebrew display register decision, strong-no-morph one-pass enrichment if the S167 stats flag it.
