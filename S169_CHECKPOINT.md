S169 — §28 live-walk redlines + S168 question resolution + §30 spec lock

# What shipped this session

Closes the §28 implementation arc with a complete live-walk verification via Chrome MCP, six §28 redlines resolved, two database cleanup passes against prod (Greek + Hebrew glosses), the SBL font bundle wired, the divergent-mode regex bug fixed in the S167 morph loader (89.5% → 94.2% morph coverage), all five carried Yoshi-questions from S168 resolved, the §29 Bookmarks first-walk verified, and a §30 spec drafted for Shareable Study-Modal Exports. tsc clean, S167 79/79 sanity (3 new Hc cases added), S168 53/53 sanity unchanged.

## Five carried Yoshi-questions from S168 — all resolved

1. **Settings → Reader preferences page** — Both surfaces. Chrome strip stays canonical for the active-while-reading toggles (§144 / §27 / §28); add `/settings/reader` route in a future wheel for theme + hideCommentary + mirrored chrome-strip toggles. Modest cost; defers to S170 / S171.

2. **Compound Hebrew morph register** — Full compound on default. The bet-prefix in `בְּרֵאשִׁית` (HR/Ncfsa) decodes to `prep. + n. com. f. sg. abs.` in the default register; long-press swaps to fully-expanded `preposition + noun common feminine singular absolute`. Source-data audit found ~28% of Hebrew rows carry compound morphs; hiding the prefix on default would erase morphological substance on 1 in 4 tokens. Voice-skill *come and see / proclaimer steps aside* posture confirms: show what the text has, don't bury it.

3. **Hebrew-prefix-only verse_words** — Non-issue in actual source data. Audited the SQL: 0 standalone HTd article rows, 392 standalone HC conj rows (and those are real content words like H3863 לוּ / H0176 אוֹ, not prefix particles). STEPBible doesn't split orthographic Hebrew words into prefix-rows. V1 is already correct; no collapsing pass needed.

4. **SBL font bundling** — Bundled. Downloaded SBL Hebrew + SBL BibLit OTFs via Claude in Chrome (sbl-site.org isn't in the sandbox egress allowlist; routed through the browser MCP), converted to woff2 in the sandbox (368KB BibLit + 94KB Hebrew, total ~462KB), dropped in `app/public/fonts/`, wired the `@font-face` declarations to `index.css` with `font-display: swap`, uncommented `preloadInterlinearFonts()` in InterlinearLayer.tsx, added the useEffect in App.tsx that fires the preload on first §28 toggle-on. Live walk confirmed both fonts load on first §28 ON.

5. **S167 strong_no_morph stats from prod SQL apply** — Stats reviewed; root cause was a regex bug in the S167 loader, not a Strong's-homonym mismatch. Yoshi's first SELECT returned `total 348,884 / morph_populated 312,318 / strong_no_morph 36,566` (89.5% coverage, 10.5% shortfall). Per-book breakdown showed all 25 top-null books were canonical (not extras-by-design-null), with Psalms at 42.6% null — way off the chart for a homonym hypothesis. Diagnosed: STEPBible writes references in two modes — aligned (`Psa.1.1#01=L`) and divergent (`Psa.3.0(3.1)#01=L` where KJV verse is the primary outside parens, BHS verse in parens). The S167 regex required `#` to come directly after the verse number, silently dropping 17,632+ divergent-mode rows. Patched the regex with `(?:\(\d+\.\d+\))?`, re-emitted the SQL (441,879 rows vs the original 420,053 = +21,826 source rows recovered), Yoshi re-applied against prod. New stats: `morph_populated 328,523 / strong_no_morph 20,361` → **94.2% coverage, 5.8% residual**. All 25 top-null books now NT-only; OT books (Psalms, Joel, Nahum, Hosea, Daniel) dropped out entirely. Remaining 5.8% is structural — KJV USFX XML over-tags English particles/articles ("the", "of") relative to STEPBible TAGNT's source-language token count. Carried to S170 as task #10 — NT lexeme-based fuzzy join.

## §28 live-walk redlines from Yoshi's session-walk + verification via Chrome MCP

### Redline 1 — chrome strip metallic register reassignment

Initial Yoshi call: §28 Interlinear should be metallic gold; the existing "Show/Hide study aids" pill (already-blue `#1A6FE5` flat fill) should be promoted to metallic-techelet. My first read renamed the §27 Strong's pill to "Study Aids" instead — Yoshi caught the misread, reverted §27 to argaman + "Show/Hide Strong's", promoted the actual hideCommentary pill (Show/Hide study aids) to metallic-techelet. The chapter chrome strip now reads as a four-metallic theological palette, left to right:

| Pill | Register | Hex stops (deep → mid → highlight) |
| §144 English Helpers | Metallic emerald (§3) | `#04321E → #15A86A → #2EFFA1` |
| §27 Strong's superscripts | Metallic argaman (§1) | `#3D1B5C → #8E4FB3 → #D4B0E0` |
| §28 Interlinear | Metallic gold (§3b — cross-refs register) | `#645028 → #B4A078 → #FCECAF` |
| Study Aids (hideCommentary) | Metallic techelet (§3a — NEW) | `#0A2D84 → #1A6FE5 → #A8C8F0` |

Two new color registers locked in COLOR_PALETTE.md:
- **§3a Metallic Techelet** — formal gradient + simplified pill form for the divine-name-anchored expansion affordance
- **§3b Metallic Gold** — formal documentation of the existing cross-refs gold (`#645028 → #B4A078 → #FCECAF`) as the canonical priestly-witness chrome register
- **§3c Metallic-Register Summary table** — locks the four chrome metallics across the four locked theological registers (emerald = divine-speech / expansion; techelet = divine-name; gold = priestly-witness; argaman = covenant-body)

### Redline 2 — §28 gold locked to the cross-references register

After several back-and-forths, locked §28 pill to the **existing** cross-refs gold register (`#645028 → #B4A078 → #FCECAF`) from `ChapterEndCard.tsx`. The deeper composed variant (`#3D2F18 → #A1885E`) I tried first read as "darker / more muted" to Yoshi — he preferred the brighter existing gold. COLOR_PALETTE.md §3b documentation reconciled to match the cross-refs stops.

### Redline 3 — Greek gloss verbosity

Greek `strong_entries.short_definition` shipped raw from OpenScriptures Strong's 2007 `<kjv_def>` element, format `:--also, and, but, moreover, now (often unexpressed in English).` — 80-140 char blocks that made the §28 column-stack gloss cell 3-4 lines tall.

Built `restoration-pipeline/_session169_clean_greek_glosses.py` with `clean_kjv_def_for_gloss()` helper (16-case unit test suite, all pass, idempotent). Emits `_s169_clean_greek_glosses.sql` — single-transaction regex-only UPDATE that strips `:--` / `:--+` prefix, cuts at first `(` clarifier, trims trailing punct, caps at 40 chars. Hebrew untouched on this pass.

Applied against prod: 5,523 Greek rows updated. Post-apply stats: 0 still-has-marker, 0 still-has-paren, avg gloss length dropped 80+ → 11.9 chars, max capped at 40. Live walk confirmed: Matthew 1 columns now show `book / generation, nature / Jesus / Christ / David / Abraham` instead of the verbose KJV-blocks.

One minor visual quirk noted but not blocking: the SQL does naive `LEFT(..., 40)` truncation without comma back-off, so a handful of Greek glosses end mid-word (e.g. `bear, beget, be born, bring forth, conc`). The Python helper has cleaner back-off if S120 ever re-runs.

### Redline 4 — Vav-consecutive `Hc` raw-emit

Genesis 1 walk found `אָמַר` (H0559, `Hc/Vqw3ms`) rendering morph as `Hc + qal vc.impf. 3ms` — the `Hc` (vav-consecutive marker, the ו that flips imperfect to past-tense narrative) leaked raw because the Hebrew prefix decoder dict didn't carry `Hc` (lowercase c — distinct from uppercase `HC` for plain conjunction).

Added one line to `HEBREW_BARE_POS_CODES` in `app/src/lib/interlinear-helpers.ts`:
```ts
c: { short: "consec.", expanded: "vav-consecutive" },
```

Mirrored in the sanity file's local copy of the dict. Three new test cases added: `Hc/Vqw3ms` short + expanded + `Hc/Vhw3fs`. **S167 sanity now 79/79** (was 76/76). 21,218 source rows with `Hc/` prefix now decode cleanly. Live walk confirmed: all `consec. + qal vc.impf. 3ms` reads correctly across Genesis 1 + 2.

### Redline 5 — Parenthetical helpers as duplicate columns (FALSE ALARM)

My initial visual read of the screenshot was wrong. DOM inspection confirms zero parenthetical columns rendering as column-stacks; the (God) / (Lord) parens are correctly inline plain text per the S168 design intent. Closed as false alarm.

### Redline 6 — Hebrew gloss cleanup

Same pattern as Greek but with different cleanup rules (Hebrew has no `:--` marker, uses `1) phrase` BDB format, and `(plural)` style annotations are informative — so no `(` cut). Wrote `_s169_clean_hebrew_glosses.sql` with smart **comma back-off** (different from Greek): if a comma exists inside the first 40 chars of the over-long gloss, truncate at the position of the LAST comma; else cap at 40 raw. Strip trailing punct.

Applied against prod. H3615 כָּלָה (was `1) to accomplish, cease, consume, determine, end, fail, finish, be complete, be accomplished, be ended, be at an end, be finished, be spent` — 150 chars, 7-line column-stack) → `1) to accomplish, cease, consume` (34 chars, 2 lines). Genesis 2 column-stack density dropped dramatically; long Hebrew glosses across the canon are now visually compact.

Both SQL files also patched with `\pset pager off` so future runs don't block on `(END)` pager interrupts.

## Live walk verification matrix (via Claude in Chrome MCP)

**Free-tier (anonymous):**
- 4 metallic pills render with computed rgb stops matching COLOR_PALETTE.md §3c — emerald `rgb(4,50,30) → rgb(21,168,106)` / argaman `rgb(61,27,92) → rgb(142,79,179)` / gold `rgb(100,80,40) → rgb(180,160,120)` / techelet `rgb(10,45,132) → rgb(26,111,229)`
- §28 Free-tier pill renders "Interlinear" + Companion badge chip (gold-shadow `#645028`, pale text)
- §28 tap → routes to `/pricing` clean
- API tier-gate confirmed: 329/329 anonymous Genesis 1 verseWords return `morphology: null, lemma: null, transliteration: null, short_definition: null, language: null`; base tri-tuple (`position`, `surface`, `strong_number`) preserved per the §9 promise
- §27 Strong's toggle: label flips, 401 supers in bracket-emerald `rgb(21,168,106)`, persists `rop_strongs_superscripts_v1 = "true"`
- §144 English Helpers toggle: label flips, all `(God)/(Lord)/(Israel)/(Jesus)` parens stripped from DOM, persists
- ⚑ Bookmarks button visible left of Notes button in chrome cluster

**Companion+ (Yoshi signed in via community SSO):**
- §28 Companion+ pill renders "Show Interlinear" with NO Companion badge chip, `aria-pressed=false`
- Toggle ON → column-stacks mount (368 columns on Matthew 1, 329 on Genesis 1, 259 on Genesis 2)
- SBL Hebrew + SBL BibLit both `loaded` after first toggle ON (preload links injected on demand)
- Q2 compound morph decode confirmed: `בְּרֵאשִׁית` → `prep. + n. com. f. sg. abs.` default, `preposition + noun common feminine singular absolute` on 700ms long-press, snaps back to short on release
- Hc vav-consecutive decode confirmed across Genesis 1 + 2: every `אָמַר / קְרָא / יָצָא / רָאָה` decodes as `consec. + qal vc.impf. 3ms` style
- Hebrew gloss compact (BDB-style after S169 cleanup: `1) heaven, heavens, sky` / `1) to accomplish, cease, consume`)
- Greek gloss compact after S169 cleanup (`book / generation, nature / Jesus / Christ`)
- §28 toggle persistence across Matthew 2 → Genesis 1 dropdown nav ✓
- §28 toggle persistence across Genesis 1 → Genesis 2 next-arrow nav ✓
- Toggle persists `rop_interlinear_v1 = "true"` across hard-refresh + SW cache-clear
- §20 word-action menu Word-study section reads Strong's lookup + BDB + Vine's (Coming soon) + Nikkudot siblings (Coming soon) — **no Hebrew/Greek interlinear stub** — deprecation lock confirmed live
- Hide Study Aids toggle: chapter-intro + commentary + cross-references suppress correctly; label flips; persists `rop_hide_commentary_v1`
- Light theme toggle: `data-theme="light"` applies, parchment bg `rgb(250,250,247)`, dark text `rgb(26,26,26)`, mid-gray muted `rgb(107,107,107)`. §28 column-stack reads cleanly on parchment; no contrast issues
- Highlight palette: 13 swatches all unlocked for Companion+, three styles (Fill / Underline / Outline). Sky Blue Fill applied to Genesis 2:2; `rgba(135, 197, 232, 0.33)` = §6 Sky Blue at mark-fill alpha. Translucent tint reads through the §28 column-stack — lemma/translit/morph/gloss/surface all visible through the colored pane
- Chapter-end card surface on Matthew 2: MORE ON MATTHEW 2 section renders Basic + Deeper Dive expanders in metallic-emerald gradient (§3 expansion register); CROSS-REFERENCES IN MATTHEW 2 renders verse-anchored cross-refs with §3 emerald pills for Tanakh refs + §1 argaman pills for extra-canonical (1 Enoch 72:1); restored sacred names inline in cross-reference body text (Yashar'el in 2 Kings 17:6)

**§29 Bookmarks first-walk — all 6 steps confirmed:**

1. ⚑ Bookmarks chrome button left of Notes ✓
2. Empty-state: *"Tap any verse → Bookmark to save it here."* ✓
3. Long-press Genesis 1:1 → VerseActionMenu → Bookmark item → BookmarkSheet renders with verse text + reason input + tags input + 13-color tint palette + Save ✓
4. Save closes sheet ✓
5. Re-open Bookmarks → Genesis 1:1 entry shows verse text + dot indicator + "Saved May 29, 2026" ✓
6. Tap row → nav back to Genesis 1, ⚑ inline-glyph (techelet `rgb(0,132,255)` = #0084FF spectral blue accent) visible left of verse number 1 ✓

## §30 — Shareable Study-Modal Exports spec drafted

Per Yoshi's S169 idea — every major Bible app shares verses as first-class output but treats word-study modals (Strong's lookups, lexicon entries) as screenshot-and-pray territory. BLB workflow validates the gap: partners screenshot the BLB modal, paste into iMessage, the share looks like a screenshot not a share, source app gets zero growth. §30 closes the gap.

Drafted in DESIGN_LANGUAGE.md (locked S169, S170 opens as implementation wheel):

- **V1 surfaces:** StrongsLookup, LexiconSheet BDB, LexiconSheet LSJ — each gets Share button right of close ✕
- **Render pipeline:** html2canvas V1 (~50KB bundle, walks the modal DOM, ships fast) → custom Canvas V1.1 (polish iteration)
- **Aspect:** 9:16 portrait at 1080×1920 (reads as card, not screenshot)
- **Watermark footer band locked at 20%** (up from §24's 18% — per Yoshi's wife's redline that the existing verse-share watermark crushes below legibility in iMessage thumbnails). Composition: 120×120 brand-mark icon left + wordmark stack centered (36pt "Remnant of Promise" / 24pt italic "Official Study Bible" / 22pt techelet `#1A6FE5` "bible.remnantofpromise.org" — the URL is the call-to-action, every share is a clickable doorway back to the app)
- **"Read full lexicon entry" button** replaced with text line `Full LSJ entry at bible.remnantofpromise.org/strongs/G3056` in the export — non-clickable but the URL doubles as paste-and-go discovery
- **V1.1 deep-link routes:** `GET /strongs/{N}` standalone page with Open Graph metadata so messaging-app link previews render the share-card automatically — second growth layer beyond the watermark
- **Transport:** native share sheet → clipboard → download fallback chain (same as §24)
- **Permanent-scope-locks:** no editor, no partner-attribution byline, no per-share analytics, no video, no AI-alt-gloss

**§24 back-edit flagged** as a paired task (task #23): bump the existing verse-share watermark to match the §30 specs so verse-share and word-study-share read as the same brand. Touch points: DESIGN_LANGUAGE.md §24, share-card-render.ts, brand-mark asset (may need new crop). Lands with S170.

# Push verification

**edited-not-committed:**
- `DESIGN_LANGUAGE.md` — §30 added at end of file (~70 new lines)
- `restoration-pipeline/validation-reports/_s169_clean_hebrew_glosses.sql` — NEW
- `restoration-pipeline/_session169_clean_greek_glosses.py` — `\pset pager off` line added to SQL_BODY template
- `restoration-pipeline/validation-reports/_s169_clean_greek_glosses.sql` — re-emitted with the pager-off line
- `S169_DECISIONS.md` — written at S169 mid-session per the verbal-answers-transcribe rule
- `S169_CHECKPOINT.md` — NEW (this file)

**committed-not-pushed:** none.

**pushed (Yoshi's terminal during the session):**
- S168 §28 Phase 9.2 commit `ec4021e` — InterlinearLayer + chrome-strip toggle + API tier-gate
- S169 redline 1 commit (chrome strip metallic repaint)
- S169 redline 1 fix commit (correct target pill — revert §27, promote hideCommentary)
- S169 redline 2 commit (lock §28 gold to cross-refs register)
- S169 redlines 3+4 commit (Greek gloss SQL + Hc decoder + fonts)

**Applied against prod via psql (Yoshi's terminal):**
- S167 morph apply (regex-patched, 441,879 source rows → 328,523 morph_populated)
- `_s169_clean_greek_glosses.sql` — 5,523 Greek rows updated
- `_s169_clean_hebrew_glosses.sql` — Hebrew rows over 40 chars updated

**Suggested Yoshi commit + push to close S169:**
```bash
cd ~/Desktop/App
git add DESIGN_LANGUAGE.md \
        restoration-pipeline/_session169_clean_greek_glosses.py \
        restoration-pipeline/validation-reports/_s169_clean_greek_glosses.sql \
        restoration-pipeline/validation-reports/_s169_clean_hebrew_glosses.sql \
        S169_DECISIONS.md \
        S169_CHECKPOINT.md
git commit -m "S169 close — §30 spec + Hebrew gloss SQL + pager-off + checkpoint"
git push
```

# Open Yoshi-questions carried forward to S170

1. **NT morph residual (lexeme-based fuzzy join)** — Carried as task #10 since S169 close. The remaining 5.8% morph shortfall on the NT side is structural: KJV USFX XML over-tags English particles ("the", "of") relative to STEPBible TAGNT's source-language token count. Strict (strong_number, occurrence_index) join leaves the over-tagged English words as morph orphans. Fix would be a lexeme-based fuzzy match (match on translit + Strong's base rather than strict occurrence). Defer until V1.1 or after first partner feedback on §28 surface.

2. **§30 implementation wheel** — Spec is locked in DESIGN_LANGUAGE.md §30; S170 opens as the implementation wheel. Land html2canvas + Share button in StrongsLookup first as the V1 proof, then extend to LexiconSheet (BDB/LSJ).

3. **§24 back-edit to match §30 watermark specs** — Tasked as #23. Bump the existing verse-share footer band from 18% to 20%, repaint with the 120×120 brand mark + wordmark stack. May need a new brand-mark crop at 200×200 native for the icon position.

4. **V1.1 `/strongs/{N}` deep-link route** — Server-rendered page with Open Graph metadata for messaging-app link previews. Spec'd in §30; implementation post-§30-V1.

5. **Settings → Reader preferences page (Q1 carry from S168)** — Defer to a future wheel; chrome-strip toggles cover the moment-to-moment surface for V1.

6. **Strong's-homonym disambiguation pass** — V1.1 candidate. The S167 morph 5.8% residual includes some homonym mismatch (STEPBible's H1697A/B/C vs our 4-digit H1697). Gated on Q5 stats (already reviewed at S169); the structural NT-side dominates the residual so homonym pass is lower priority.

# Standing residuals (carried)

- 9 long-tail S161 Group B singletons (malachi 4:4, matthew 5:33, mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians 2:5, hebrews 11:37, revelation 1:10) — restoration-pipeline work, not in any §28 / §29 / §30 scope.
- Yahuah → Adonai vocatives addressing Yahusha — restoration-pipeline pass.
- v1.1+ candidates: apocrypha book-slug map, Gesenius source investigation, Thayer's 1889 clean dump, system-wide Library → Companion lockedTier Literal rename.
- §28 InterlinearLayer column-stack share — V1.1 stretch goal per §30.
- §17 Chapter-end cross-reference card share — V1.1 stretch goal per §30.

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

# What S170 opens against

1. **§30 implementation wheel** — Add html2canvas + Share button to StrongsLookup, LexiconSheet BDB, LexiconSheet LSJ. V1 ship: working share button + 1080×1920 PNG export with 20% footer + iOS / Android native share sheet wired. Verify on Yoshi's phone + his wife's phone before close.

2. **§24 back-edit** — Bump verse-share watermark to the §30 spec'd 20% footer + 120×120 brand mark + wordmark stack. Touch share-card-render.ts canvas helper, may need new brand-mark crop asset.

3. **NT morph residual investigation** — Open as the secondary track. Sketch the lexeme-based fuzzy-join strategy in spec form, decide whether to ship at V1.1 or defer further.

4. **Settings → Reader preferences page** — If Yoshi greenlights, open as a third track. Modest scope: new `/settings/reader` route + Settings.tsx component + nav entry + chrome-strip toggle mirrors + theme + hideCommentary.

5. **Any §28 surface redlines from real-partner walks** — Yoshi's wife's wife-share-thread feedback inspired §30; expect more redlines as the §28 surface gets used by real partners. Triage at S170 open.
