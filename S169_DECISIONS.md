S169 — Carried Yoshi-question resolutions + §28 live-walk redline scaffold

# Status check (verified at session open)

- S168 sanity: **53/53 passes** (`node _s168_interlinear_layer_sanity.mjs`).
- S167 sanity (carried): **76/76 passes** per S168_CHECKPOINT.md, unchanged.
- `tsc -b` on `app/`: **clean** (no errors at session open).
- §29 BookmarksIndex + bookmark state wired in App.tsx (lines 51, 436–469, 660–673, 1145+). First-walk still pending Yoshi-side per S167 carry.
- S167 prod-apply stats: **not on disk.** Yoshi ran `psql ... -f _s167_morph_updates.sql` in his terminal; the SELECT output never landed in `restoration-pipeline/validation-reports/`. Q5 needs the paste (see below).

# Five-question resolutions

## Q1 — Settings → Reader preferences page: **single sweep, AND keep chrome-strip**

Recommend the both-surfaces split.

- **Chrome strip stays canonical for §144 / §27 / §28** — the three reader-text toggles. Moment-of-need affordance; the partner is reading the verse text right now and wants to flip the layer right now.
- **Add `/settings/reader` route** carrying mirrors of those three + the theme toggle + the `hideCommentary` toggle. All five point at the existing shared `rop_*_v1` hooks — no duplicate state, no sync drift.

Why both:
- Five toggles in the chrome strip starts crowding the verse-reading surface. Theme + hideCommentary are *set-once* preferences, not *flip-while-reading* preferences — they belong in Settings.
- Settings page also gives a discoverability surface for a first-time partner who wonders *can I tune this?* — the answer is one menu tap away from the chrome cluster.
- Voice-skill *proclaimer steps aside / come and see*: the reading surface stays uncluttered; the partner finds their toggles where toggles live.

Cost: ~80 lines for `Settings.tsx`, one route table entry, one nav-cluster icon. Modest. Defer to S170 as its own focused wheel (don't bundle with the live-walk redlines).

## Q2 — Compound Hebrew morph register: **full compound on default**

Confirm the current S168 ship. `HR/Ncfsa` decodes to **"prep. + n. com. f. sg. abs."** on the default morph cell; long-press swaps to fully-expanded **"preposition + noun common feminine singular absolute"**.

Source-data grounding (counted from `_s167_morph_updates.sql`):
- Hebrew rows with compound morphs (prefix+base): **~80,000** out of 282,218 total Hebrew rows (~28%).
- `HR/` prefix: 31,741 rows. `HC/` prefix: 26,864. `HTd/` prefix: 21,203.

Hiding the prefix on default would erase morphological substance on **roughly 1 in 4 Hebrew tokens.** The bet-prefix in `בְּרֵאשִׁית` ("in [the] beginning") and the article-prefix in `הָאָרֶץ` ("the earth") are theologically real in the text — they belong in the surface view, not buried in a long-press.

Voice-skill *come and see / proclaimer steps aside*: the partner sees what the text actually has. The long-press is reserved for register depth (compact academic vs verbose academic), not for revealing/hiding content the reader should see.

## Q3 — Hebrew-prefix-only verse_words: **non-issue in actual data; no action needed**

Audited the source SQL. The "noisy prefix-only column" worry was hypothetical; the data says it shouldn't fire:

- Standalone `HTd` (article alone): **0 rows** across all 282,218 Hebrew rows.
- Standalone `HC` (conj alone): **392 rows** (0.14%) — and on inspection these are content words like H3863 לוּ ("if/oh that") and H0176 אוֹ ("or"), not prefix particles.
- Standalone `HR` (prep alone): 8,900 rows (2.1%) — real preposition lexemes (`לִפְנֵי` "before", `בֵּין` "between"), not prefix particles.

STEPBible's loader doesn't split orthographic Hebrew words into separate prefix-rows. Prefixes ship inside the compound, on the same row. The InterlinearLayer already renders ONE column per orthographic Hebrew word with the compound morph stored together. There's nothing to collapse.

V1 is correct. If the live walk surfaces a specific verse where this feels off, we revisit — but the data says it shouldn't.

## Q4 — SBL font bundling: **defer to S170 wheel; ship the live walk with system fallback**

Recommend the publish-then-edit posture.

- No woff2 files in `app/public/fonts/` yet (no directory at all). Need to source SBL Hebrew + SBL BibLit from sbl-site.org and Yoshi-eye the license before bundling on Render's CDN.
- System-font fallback chain (SBL Hebrew → Ezra SIL → Times New Roman / SBL BibLit → Cardo → Times New Roman) covers macOS / iOS / most Linux desktops cleanly. The likely-affected partner is **Windows-without-Cardo** — they'll see Times New Roman for Greek glyphs (readable but suboptimal).
- The wiring seam is already live in `preloadInterlinearFonts()` — just commented out. Drop-in is ~15 min once the woff2 files exist and the `@font-face` declarations land in `index.css`.

Recommendation: ship S168 / live-walk on the fallback chain, watch for a partner glyph report. If any signal comes in, S170 bundles. If no signal in two walks, defer further.

If Yoshi wants this NOW: I can do the work this session — needs the two woff2 files + a license review confirmation. Roughly 30 min including the sanity-test for the font-stack switch.

## Q5 — strong_no_morph stats: **need the SELECT output from prod**

Status: blocked. The S167 SQL ends with `SELECT (SELECT COUNT(*) FROM verse_words) AS total_verse_words, ... morph_populated, ... strong_no_morph;` — the post-apply stats only exist on the prod DB after Yoshi runs the apply. No log on disk.

Yoshi: please paste the SELECT row from your `psql ... -f _s167_morph_updates.sql` run.

Decision framework once the numbers land:
- `strong_no_morph / morph_populated < 1%` → likely Strong's-homonym edge cases (STEPBible's H1697A/B/C suffixes not matching our 4-digit `strong_number`). Tolerable in V1; defer.
- `1–5%` → soft threshold. Open a one-pass homonym-disambiguation enrichment in S170 — not a S169 blocker.
- `> 5%` → real coverage shortfall. Open a S169 enrichment pass before the live-walk-validation commit, since the §28 surface needs the morph data to render the column.

# §28 live-walk redline scaffold

Yoshi performs the walk in his browser (bible.remnantofpromise.org, hard-refresh per S166 SW rule). Watchpoints per step:

## Companion-tier partner

| Step | What to verify | Voice-check |
| 1 | Default-OFF: verse text renders inline as before. | No visual change pre-tap. |
| 2 | Chrome strip: `Show Interlinear` pill present, metallic argaman gradient (`#3D1B5C → #8E4FB3 → #3D1B5C`), adjacent to `Show Strong's`. NO Companion-badge chip. | Pill register matches §27 visually — reads as the §27/§28 pair. |
| 3 | Tap → label flips to `Hide Interlinear`. Verse renders as column-stacks: lemma (SBL Hebrew/BibLit) → translit (italic muted) → morph short (small-caps muted) → gloss (italic muted) → English surface (top-rule, baseline). Paren-text like ` (LORD)` still visible at baseline. | Column order = English flow (LTR), not Hebrew-source order (RTL). Hebrew lemma RTL within the cell only. |
| 4 | Long-press the morph cell on a Hebrew column (Gen 1:1 `בְּרֵאשִׁית` = `HR/Ncfsa`). Register swaps **"prep. + n. com. f. sg. abs." → "preposition + noun common feminine singular absolute"** for 500ms hold. Release → snaps back to short. | Confirms Q2 = full-compound on default. The bet-prefix shows in both registers, never hidden. |
| 5 | Tap a column's English word → §20 StrongsLookup modal opens. Same as before. | §20 grammar preserved — column doesn't break tap-to-modal. |
| 6 | Long-press a column's English word → §20 VerseActionMenu opens. | The morph-cell long-press and the surface long-press are two distinct gesture targets; verify both still fire correctly. |
| 7 | Navigate to next chapter → toggle state persists. Columns render. | `localStorage` `rop_interlinear_v1` carries across navigation. |
| 8 | Hard-refresh the page → toggle state persists. | Carries across SW cache-bust. |
| 9 | Open §20 menu on any word → Word-study section reads: Strong's (live, Free) → BDB or LSJ (live or stub by tier) → Vine's (stub, Library). **NO** Hebrew/Greek interlinear stub. | §20 menu-stub deprecation lock confirmed. |
| 10 | Walk Gen 1:1 (`בְּרֵאשִׁית`) + Gen 1:5 (`וַיִּקְרָא` `HC/Vqw3ms`) for compound-prefix samples. Yoshi-eye on the prose density — does the full-compound register read clean or feel too dense at column-stack width? | If feels too dense, revisit Q2 (but I bet it reads fine). |
| 11 | Walk Acts 1:1 (Greek). Confirm SBL BibLit fallback font fires for the lemma cell, italic translit, small-caps `t-asm`/`prt`/`a-asm` morphs decode cleanly. | Q4 watchpoint — if Greek glyphs render in Times New Roman (no Cardo), the fallback chain is still working; just the visual register isn't optimal. |

## Free-tier partner

| Step | What to verify | Voice-check |
| 1 | Chrome strip: `Interlinear` pill + small `Companion` badge chip (`#1A0E2C` bg, white text, border `#F5E6FA/40`). | Visible-not-hidden gate per §20 stub-catalog convention. |
| 2 | Tap → routes to `/pricing`. | Tier-locked-stub routing. |
| 3 | Verse text renders as before (no layer mounted). | Default-OFF state, gate-side. |
| 4 | DevTools network panel → load any chapter → `GET /v1/books/.../words` payload. Every verse_word row shows `morphology: null, lemma: null, transliteration: null, short_definition: null, language: null`. | Server-side tier-gate confirmed (`_is_at_companion_tier(None) == False` → all five fields nulled out, base tri-tuple preserved). |

## §29 first-walk (if pending)

| Step | What to verify |
| 1 | Reload landing page on a fresh partner (no existing bookmarks). |
| 2 | Chrome cluster: `⚑ Bookmarks` button visible **left of** Notes button. |
| 3 | Tap → empty-state copy renders. |
| 4 | Long-press a verse → bookmark via sheet. After save: ⚑ inline-glyph visible after verse number; sheet closes cleanly. |
| 5 | Tap `⚑ Bookmarks` again → bookmark appears in list, chronological newest-first. |
| 6 | Tap row → navigates to verse; ⚑ inline-glyph visible post-nav. |

# Carried forward to S170 (open as needed)

- Settings → Reader preferences page (Q1) — own wheel.
- SBL font bundling (Q4) — when license + woff2 files ready.
- Strong's-homonym disambiguation pass — gated on Q5 stats.
- 9 long-tail S161 Group B singletons.
- Yahuah → Adonai vocatives addressing Yahusha — restoration-pipeline pass.
- v1.1+: apocrypha book-slug map, Gesenius source investigation, Thayer's 1889 clean dump, system-wide Library → Companion lockedTier Literal rename.
