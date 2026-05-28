# Remnant of Promise Official Study Bible — Design Language & Tier Matrix

The consolidated record of all design and product decisions for the V1 app build, settled across S77 and S78. This file is the authoritative starting point for any future build session — every visual decision, every tier feature, every architectural commitment lives here.

---

## 1. Theme

- **Default theme:** black background (`#000`) with white serif body text (`#FFF`). The signature aesthetic; brand-defining; not equally weighted with the alternate.
- **Alternate theme:** parchment / sepia background for bright-light reading. Available in settings; the off-ramp from default, not a co-default.

The black-default theme is what the app looks like in screenshots, marketing material, the App Store / Play Store listing images, and every external surface.

**Reader chrome — navigation and affordances stay in the same minimal register.** Picker selects, theme toggle, subscription CTAs, and the chapter-navigation arrows (§19) all use the same bordered-chrome button family on the surface tier — they read as control affordances rather than primary content. Primary CTAs (Become a partner, Resubscribe) invert to filled-primary so the call-to-action sits visually above the navigation chrome. The navigation chrome never competes with the reading surface; it sits at the picker row above the chapter and at the chapter-end continuation row below it, both in the same surface register as the rest of the chrome.

---

## 2. Outline Technique — 4-Direction `text-shadow`

All colored exterior outlines on letterforms (sacred names, user mark outline style, chapter header chrome) use the same CSS technique: `text-shadow` at cardinal-only offsets (top, bottom, left, right) — **not 8-direction**, which was the original S77 spec and was corrected at S78 after rendering showed the diagonal offsets filling letter corners instead of tracing them.

**Why not `-webkit-text-stroke`:** renders inside the letterform bounding box, creating a tint/blur effect rather than a crisp exterior trace.

**Why not 8-direction:** the diagonal offsets at 1px reach ~1.4px diagonally, over-extending and filling letter corners. At lighter colors against black, this reads as halo bloom rather than clean trace.

**4-direction at the right pixel weight per surface:**

| Surface | Weight | CSS form |
|---|---|---|
| Body text (verse text, ~17px) | 1px | `text-shadow: 1px 0 0 COLOR, -1px 0 0 COLOR, 0 1px 0 COLOR, 0 -1px 0 COLOR` |
| Chrome (chapter headers, display, ~32px) | 2px | `text-shadow: 2px 0 0 COLOR, -2px 0 0 COLOR, 0 2px 0 COLOR, 0 -2px 0 COLOR` |

The chrome reads slightly thinner proportionally (2px on 32px = ~6% letter height vs 1px on 17px = ~6%) which gives consistent visual weight across both surfaces.

---

## 3. Sacred-Name Colors

The protected color register used by the canon's restored-name rendering. User-mark colors are always visibly distinct from these so a user-mark never reads as a sacred-name treatment.

- **Techelet (divinity)** — `#1A6FE5`. Saturated bright blue. Applied as 4-direction outline (1px body, 2px chrome) on:
  - Single divine names: Yahuah, Yahusha, Elohim, El, Adonai, Yah, Messiah, Ruach HaKodesh
  - Compound divine names: Yahuah Elohim, Yahuah Tseva'ot, Yahuah Elohayka / Elohaychem / Eloheinu / Elohai / Elohav, Yahuah Yireh, Yahuah Nissi, Yahuah Shalom, Yahuah Tsidkenu, Yahuah Shammah, Yahuah Rapha, Yahuah Ra'ah, Adonai Yahuah, El Shaddai, El Elyon, El Olam, El Roi, El Gibbor, Avi-ad, Sar Shalom, Yahusha HaMashiach, HaMashiach Yahusha, Ehyeh asher Ehyeh, Melek Tsadiq

- **Argaman (covenant body)** — `#8E4FB3`. Saturated deep purple. Applied as 4-direction outline (1px body, 2px chrome) on:
  - Yashar'el (Israel), Yahudah (Judah), Yahudim (Jews), Yahudi (Jew / Jewish)

- **Parentheticals**: always plain white, no outline. `(LORD)`, `(Israel)`, `(Spirit)`, `(God)` etc. The Hebrew name carries the outline; the parenthetical is informational support.

---

## 4. Speech-Mode Bracket Markers

Left-margin ornamental bracket marking divine speech blocks. S-curve path (chained quadratic with single direction-flip), metallic gradient, stroke 4 with round linecap, top + bottom curl SVGs 18×18 with line width 5.

**Top curl path:** `M 14 2 Q 16 6 10 9 Q 4 12 5.5 18`
**Bottom curl path:** `M 5.5 0 Q 4 6 10 9 Q 16 12 14 16`

Two color registers:

- **Bright emerald (promise / blessing)** — gradient `#04321E → #15A86A → #2EFFA1 → #80FFC9 → #2EFFA1 → #15A86A → #04321E`, outer glow `rgba(46,255,161,0.6)` near + `rgba(46,255,161,0.25)` far.

- **Royal purple (warning / judgment)** — gradient `#3A0A60 → #7C20BD → #C77FE8 → #7C20BD → #3A0A60`, outer glow `rgba(150,60,220,0.45)` near + `rgba(150,60,220,0.18)` far.

**V1 ships with emerald only for ALL divine speech** (no mode-split yet). Yahuah's direct speech in the OT and Yahusha's direct speech in the NT both carry the emerald marker — they are the same Voice per the framework's nature-of-God reading (the God who spoke at the burning bush is the God who spoke at the Sermon on the Mount). Christian readers used to "Jesus's words in red" open the app and see the marker starting at Genesis 1.

**V2 adds the purple warning marker** after an editorial tagging pass classifies speech runs into promise / warning / mixed.

---

## 5. Chrome Accents — Spectral Blue (S115 swap from gold)

`#0084FF` — 470nm spectral blue, elected by Yoshi at S115 in place of the original gold (`#D4AF37`) spec. The blue holds visible-accent presence against the pure-black reader pane more cleanly than gold did at small typographic sizes. The CSS variable is `--reader-accent`. Applied to:

- **Verse numbers**: small superscript via `.verse-number` (font-family ui-sans-serif, font-size 0.7em, font-weight 600, opacity 0.85, vertical-align super)
- **Chapter-header divider line**: 1px solid border-bottom on the header element
- **Chapter-navigation arrow glyphs (§19)**: the chevron itself carries the accent color inside the bordered-chrome button shell so the directional cue reads cleanly; the button shell uses the surface-tier chrome register so the affordance doesn't compete with the reading surface
- **Small ornamental accents** as needed

**Carrier-forward observation (S115, deferred).** Yoshi observed at S115 that the 470nm blue reads pastel rather than vivid in deployed conditions; second-opinion check pending before any saturation re-pick. The current `#0084FF` is what ships; a saturation-tuned candidate is on the table as a possible follow-up wheel if confirmed.

---

## 6. Highlight Color Palette — 12 Tribes

The 12-color palette unlocked at the $1.99 tier. Each color sits in its own hue family — no two colors close enough to be confused; all visibly distinct from techelet and argaman so user marks never read as sacred-name treatment.

Going around the wheel: red → orange → yellow → yellow-green → green → blue-green → blue → blue-violet → violet → pink-violet → pink → neutral.

| Color | Hex | Hue family |
|---|---|---|
| Crimson | `#D14555` | True red |
| Tangerine | `#F0A050` | Orange |
| Honey | `#E8C04A` | Yellow |
| Sage | `#97C459` | Yellow-green |
| Emerald | `#4DAE7F` | Green |
| Teal | `#5FB8B0` | Blue-green |
| Sky blue | `#87C5E8` | Pale blue |
| Periwinkle | `#9F9FE0` | Blue-violet |
| Lilac | `#D4B0E0` | Light violet |
| Magenta | `#E060A5` | Pink-violet |
| Rose | `#D17BA4` | Soft pink |
| Parchment | `#C5B795` | Warm neutral |

Symbolic mapping to the 12 tribes is open as a V2 enrichment (tribe + breastplate gemstone per color) but not required for V1.

---

## 7. Free-Tier Mark Color

**Neon highlighter yellow** — `#FFE600`. Sits deliberately outside the 12-tribe palette. The free user's marks read as obviously transactional — "highlighter on Bible" rather than "curated mark in a designed system." Every mark hits the upgrade trigger visually. The 12 tribes become a coherent unlocked-by-upgrade set with theological framing intact.

---

## 8. Three Mark Styles

- **Fill highlight** — translucent tinted background (~30-34% alpha for chromatic colors, ~22% for parchment). White text stays fully readable; the colored "pane" lets the light (white text) through. Stained-glass logic.

- **Underline** — solid colored line below the marked text, 3px body / 4px chrome, no transparency needed (the line itself is thin enough that full saturation reads as a clean accent).

- **Border outline** — same 4-direction `text-shadow` exterior outline technique as the sacred names, in the chosen color. 1px body / 2px chrome. The outline style is the most coherent with the existing design language because it uses the exact same typographic move as the sacred names — same family, different semantic register.

User selects style AND color at the moment of marking. Free tier: fill only. $1.99+: all three styles available across all 12 colors (3 × 12 = 36 mark configurations).

**Multi-mark per verse (S117 lock).** Up to **three marks** can coexist on a single verse — the schema unique is `(user_id, verse_id, color, style)`, and the PWA picker enforces the 3-mark cap. The three (color, style) combos render layered: a verse can carry crimson fill + emerald underline + sky_blue outline at the same time, and the framework's intended use case — *multiple underlines in different colors on the same verse* — is supported by stacking the underline marks via nested PWA spans with `text-underline-offset` increments (2px, 7px, 12px). The same exact (color, style) tuple can't double-stack on a verse (the schema unique prevents it). Re-applying an exact duplicate is a no-op; applying a new (color, style) inserts a new mark alongside existing ones; the picker shows existing marks as chips at the top with × to remove each. The 3-mark cap is a PWA-side rule for readability ("2-3 stack reads clean; beyond that gets muddy") — schema doesn't enforce it. If the cap ever needs to change, it's a single constant in `HighlightPicker.tsx` (`MAX_MARKS_PER_VERSE`) and a paragraph update here. Earlier sessions (S77/S78/S113) didn't explicitly say "one mark per verse" — that was an S113 implementation choice, not a locked decision. S117 lifts it.

---

## 9. Tier-Feature Matrix

The V1 ladder, ordered by tier. Each tier's `tier_satisfies` covers everything below per the existing schema pattern.

**Tier display names + bundle reconciliation (locked S140).** The four paid tiers ship with the display names **Study Notes** ($1.99 / `study_notes` slug), **Library** ($4.99 / `extras` slug), **Companion** ($9.99 / `complete_study` slug), and **Scribe** ($14.99 / `everything` slug). The CTA convention across the Bible app is *"Unlock in [Name] tier"*; every reader-facing surface uses the tier name, never a price, except the Pricing surface (`app/src/routes/Pricing.tsx`) where prices live. Backend `content_tier` enum slugs are unchanged.

The S140 reconciliation aligns the feature bundles below against `Pricing.tsx` as the canonical truth for what each tier actually delivers. The headline features per tier come from the Pricing surface's blurbs and bullets; ancillary features previously documented here (lexicons, interlinear, mark styles, notes hub, Deeper Dive long-form commentary, Yoshi's preloaded keys, chronological toggle, Nikkudot strip, color-meaning dictionary, verse-highlight recommendations engine) are preserved at their best-fit tier. Where a previously-documented feature's tier assignment shifted in the reconciliation, the move is called out inline. Four headline shifts the reconciliation makes:

1. **Framework commentary on the canon** moves from $4.99 down to $1.99 (the Study Notes tier) per the live Pricing copy.
2. **The restored extras-library editions** move from free up to $4.99 (the Library tier) per the live Pricing copy.
3. **Strong's reference lookup stays free** (a Pricing.tsx draft mis-listed it at $1.99; corrected in the same pass).
4. **Cross-edition search runs across the full restored library at free tier** — the *advanced search across canon and library* feature is NOT a Companion-tier gate. Every reader, regardless of tier, can search across canon + every restored edition the corpus carries. Hits from paid-tier editions surface in the result list with a tier-lock badge + locked-preview + upgrade affordance. Search becomes the upgrade funnel: a free reader who searches *"Watchers"* or *"Sheol"* or *"Lo-Ammi"* sees the canonical hits open AND a list of hits from 1 Enoch / Jubilees / the Apocrypha with the Library badge, and reads the locked-preview-result list as discovery. Curiosity does the selling without the gate ever doing it.
5. **Chapter-end card layer split** — the two layers of the chapter-end card gate independently at different tiers. **Layer 1 (per-verse cross-references) → Library tier** ($4.99) since the cross-refs point into the restored library editions Library opens. **Layer 2 (framework thread callouts with title + summary_md + member_notes) → Companion tier** ($9.99) since the threads are Yoshi's framework reading of how canon and library answer each other — the *hidden detail expand* that synthesizes the cross-references. A Library reader sees the verse-to-verse pairings; a Companion reader gets the framework synthesis layered on top. The two free funnel threads (Kingdom Gospel + Grace That Can Be Lost) stay free at both layers.

The free tier holds the canon (restored names) + Strong's lookup + cross-edition search (with locked-preview funnel) + the two framework-bearing free chapter-end threads + the funnel-sample commentary on key chapters + the basic reading-and-marking experience.

**Commentary architecture (locked S88, scope refined S89).** Each chapter's commentary surface is layered. The short-form layer is a focused paragraph commentary (the 1 Corinthians 11 STRUCTURAL model on the live site — framework-bearing prose, walks the reader through the chapter's most weight-bearing moments, lands without going book-length) with the chapter-end cross-reference card tables underneath. The long-form layer is the book-style deep commentary (the §1-§N stand-alone-italics-every-scripture-quoted Logos-killer treatment, like the post-S88 john-1.md rewrite) accessed via a *Deeper Dive* button. Same progressive-disclosure pattern as the Statement of Faith: the short-form is what reads by default; the deep-form opens when the reader clicks the button. The two layers are authored separately per chapter but share the same chapter-end card data underneath.

**Important S89 refinement of the 1 Corinthians 11 reference.** The "1 Corinthians 11 model" names the STRUCTURAL pattern (focused paragraph commentary + chapter-end card tables under it). The PROSE execution currently shipped on the live site is not yet at the come-and-see standard locked in the voice skill at S88 — the visible commentary cites *(2 Samuel 15:30, Esther 6:12, Jeremiah 14:4)*, *(Exodus 28, Leviticus 8, Ezekiel 44)*, *(Acts 18:18)* and other passages without quoting them in stand-alone italics. The 1 Corinthians 11 commentary file goes on the audit list alongside the Matthew rebuild and gets its body rewritten to the same standard before it again serves as the prose-execution model. Until then, the post-S88 john-1.md is the prose-execution proof-of-concept; 1 Corinthians 11 is the structural pattern only.

### Free
- Restored sacred names (the canon as Yahuah names it) — the 66-book canon stays open to anyone
- **Strong's reference lookup** — tap any word to see its Strong's number + brief lexicon entry. Free for every reader, every word, every chapter.
- **Chapter-end cross-reference card — two framework-distinctive threads visible at free tier on every chapter** (architectural anchor: `api/CHAPTER_END_CARD_CONTRACT.md`; rows with `tier_required = 'free'`):
  - **The Kingdom Gospel / Good News of the Gathering** — the framework's central thesis (the gospel is the news of the gathering of the scattered seed) made visible through curated cross-references drawing from the full restored library. Every chapter that touches the gathering surfaces the framework reading through scripture itself.
  - **Grace and the Opportunity That Can Be Lost** — anchored on Hosea 7:13 (*"Woe unto them! for they have fled from me: destruction unto them! because they have transgressed against me: though I have redeemed them, yet they have spoken lies against me"*); every passage that teaches the gift can be lost (Heb 6:4-6, Heb 10:26-29, Matt 7:21-23, 2 Pet 2:20-22, James 5:19-20, Rev 3:5, Rev 22:19, Gal 5:4, 1 Cor 9:27, Rom 11:20-22, John 15:1-6, 1 Cor 10:1-12, 2 Pet 1:5-10) cross-referenced back to its source (Hosea 7:13, Ezekiel 18, Ezekiel 33:12-13, Exodus 32:33, Psalm 69:28, Deuteronomy 28, Jeremiah 18:7-10, Numbers 14, 1 Samuel 15, Ezekiel 20:33-38). Counters institutional Christianity's "once saved, always saved" lie at the data layer.
- **Commentary on author-curated key chapters only** — Yoshi designates a hand-picked set of *key chapters* (the chapters where the framework's diagnostic hits hardest and a new reader walks away with the inherited lie taken off — candidates include John 1, Romans 11, Hosea 1, Galatians 3, Matthew 5, Matthew 23, Acts 2, Hebrews 8, Revelation 7; final set is Yoshi's editorial call once the commentary sweep is closer to complete). On those key chapters, the full short-form layered commentary displays for free as the funnel sample. On all other chapters, commentary is locked behind the Study Notes tier. The free reader hits a key chapter, the commentary lands, the upgrade lands.
- 1 highlight color: neon yellow `#FFE600`, fill style only
- Single global notepad with verse-anchor support (tap verse → Add note → opens the one notepad with verse reference auto-inserted at cursor)
- **Search across the full library** — canon, Apocrypha, 1 Enoch, Jubilees, Jasher, Pseudepigrapha, Apostolic Fathers, M.R. James apocryphal NT, Ascension of Isaiah, Josephus, every restored edition. Free readers see hits from every edition the corpus carries. Hits from paid-tier editions render with the source-class badge (Tanakh emerald / NT gold / Extras argaman) AND a tier-lock badge (*"Library"* / *"Companion"*) AND a brief preview + locked-treatment + upgrade affordance. The free reader who searches *"Watchers"* sees the canonical hits open, sees a list of hits from 1 Enoch with the Library badge, and learns by reading the result list that the framework reaches further into the library than the canon alone carries. Curiosity does the selling. (Architectural note: cross-edition search universal at free tier — Locked hits surface as discovery + upgrade-pull, not as content-walled-off-from-search.)
- Reading history (last position, recently read)
- Basic bookmarks (favorite a verse without coloring it)
- Share / send verse with subtle "Remnant of Promise Official Study Bible" watermark — every share is a viral acquisition channel
- Offline downloads (canon-only default, additional content downloadable from settings within tier permissions)
- Pull-down refresh for content updates

### Study Notes — $1.99
Everything in free, plus:
- **Yoshi's framework commentary on every chapter of the 66 books** — the focused paragraph commentary (the 1 Corinthians 11 STRUCTURAL model: framework-bearing prose, walks the reader through the chapter's most weight-bearing moments, lands without going book-length; with every scripture invoked quoted in full in stand-alone italics on its own line per the voice skill's come-and-see posture — the post-S88 john-1.md rewrite is the prose-execution proof-of-concept until the 1 Corinthians 11 commentary itself is rebuilt to the same standard). The free reader gets commentary only on key chapters as a funnel sample; Study Notes opens commentary on every chapter. (Moved here from $4.99 in the S140 reconciliation per Pricing.tsx.)
- **Curated cross-reference threads** — every passage grounded in its Tanakh source. The chapter-end card expands beyond the two free-tier threads (Kingdom Gospel + Grace That Can Be Lost) to surface every curated thread plus all per-verse curated cross-references. Both layers of the chapter-end card per `api/CHAPTER_END_CARD_CONTRACT.md`. Cross-reference data is drawn from the full restored library bidirectionally — canon, apocrypha, pseudepigrapha, 1 Enoch, Jubilees, Jasher, Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah, Havoth, Shamayim, Cepher additions, Sonnini's *Acts of Paul,* and every other restored-and-treated-as-canonical text in the library (see §17 for the architecture). (Moved here from $4.99 in the S140 reconciliation per Pricing.tsx.)
- All 12 tribe-palette colors
- All 3 mark styles (fill, underline, border outline)
- Separate notes per book / chapter / verse — distinct, named, scoped notes
- Note central hub — single screen showing all notes, organized by color category, by book/chapter, with filter and search
- Free-form color-meaning dictionary — user assigns whatever label they want to each color (e.g., "rose = the Father's love"); label propagates through picker, note central, study views, anywhere the color is referenced
- Bookmark-by-color topical study view — all passages marked in a given color gathered into a thematic study collection
- **Verse-highlight recommendations engine** — when user highlights a verse, the app surfaces related passages from Yoshi's curated thematic cross-reference threads (the same curated data as the chapter-end card, surfaced through the marks UI). **100% curated theological data, AI-free at every stage including preprocessing** — no LLM inference at runtime, no AI-generated similarity. The engine grows as Yoshi authors more threads.
- Tease of Library tier features (small affordance showing what's available at the next tier)

### Library — $4.99
Everything in Study Notes, plus:
- **Layer 1 of the chapter-end card unlocks — per-verse cross-references into the restored library.** The reader who's just unlocked 1 Enoch / Jubilees / the Apocrypha sees the verse-to-verse pairings linking canon to those editions. (Layer 2 of the card — the framework thread callouts that synthesize what those cross-refs mean — stays gated at Companion. See §9 reconciliation note #5.)
- **The full restored library beyond the canon** (moved here from free in the S140 reconciliation per Pricing.tsx):
  - Apocrypha (KJV-1611, restored)
  - 1 Enoch, Jubilees, Jasher — already-published Restored Names editions
  - Charles vol 1 apocrypha
  - Apostolic Fathers (Lightfoot)
  - M.R. James apocryphal NT
  - Ascension of Isaiah
  - Josephus's *Wars of the Jews* and *Antiquities of the Jews*
- Notes export to PDF (full notes content, formatted, downloadable)
- **Live-UI fixes for chapter-end card rendering (locked S88, refined S89, extended S140 with Option C tier-locked thread rendering):**
  - **Snippet truncation retires.** Verse snippets render in full — no mid-sentence `…` truncation. There's no paper to save on a screen.
  - **"MEMBERS IN THIS CHAPTER" sub-header retires entirely (locked S89).** Originally captured at S88 as "retires-as-DB-jargon, replaced with reader-facing language or just the verse rows without a header." Yoshi's S89 question — *why is that even a label?* — landed the cleaner answer: the sub-header was the API field name `members_in_chapter` leaking into UI copy. The reader is already on the chapter-end card; the thread card is nested inside it; the rows shown are obviously the ones in this chapter. The sub-header adds no information the reader doesn't already have. Drop it. The thread card becomes: thread title → anchor → summary → list of verse-pair rows directly. Each row is self-describing under the established thread context.
  - **"TANAKH SOURCES FOR [CHAPTER]" panel header — naming OPEN.** Current live label frames the cross-reference panel as Tanakh-only when §17 locks the pool as the full restored library bidirectionally. Replacement naming is deferred until Romans is in active scope (Yoshi's S89 instruction). Engineering work uses a placeholder until then.
  - **Paragraph-style lead-in option.** Cards may carry a short paragraph-style lead-in that orients the reader before listing the verse-by-verse connections — the post-rebuild short-form commentary paragraph is the prose-flow model. Where a thread carries a summary, surface it as a lead-in. Where no summary exists, fall back to the verse list directly.
  - **Option C tier-locked thread rendering (S140).** Tier-locked thread callouts render with title + anchor + ~70-word teaser of the summary + linear-gradient fade-to-surface + locked-count line + a single *"Unlock in [Name] tier"* CTA. Members hidden. Replaces the prior greyed-out-but-readable policy. See `api/CHAPTER_END_CARD_CONTRACT.md` for the full render contract.
- **Full public domain reference library** (paid tier per S140 reconciliation — preserved at Library since these are companion-text resources to the restored library):
  - Brown-Driver-Briggs (BDB) Hebrew lexicon
  - Thayer's Greek lexicon
  - Vine's Expository Dictionary
  - ATS Bible Dictionary
  - Easton's Bible Dictionary
  - Smith's Bible Dictionary
  - Nave's Topical Bible
  - Treasury of Scripture Knowledge
- **Hebrew/Greek interlinear** — word-by-word original-language alignment with English, with lexicon entries inline. Public domain data (Westcott-Hort Greek + BDB Hebrew alignments).
- **Nikkudot-strip feature** — when looking up a Hebrew word, see the alternate-reading sibling list (other Hebrew words sharing the same consonantal form but different vowel points). Surfaces the interpretive layer the Masoretes added; aligns with the framework's posture of letting the text say what it says.

### Companion — $9.99
Everything in Study Notes and Library, combined. Plus:
- **Layer 2 of the chapter-end card unlocks — framework thread callouts.** The thread callout with title + anchor + multi-paragraph summary + per-member framework notes that synthesize how canon and the restored library answer each other. Library readers see the verse-to-verse pairings (Layer 1); Companion readers get Yoshi's reading of what those pairings mean (Layer 2) — the *hidden detail expand* that the threads are. The framework's cross-edition synthesis lives here.
- **Framework commentary extended to the restored library** — Yoshi's chapter commentary doesn't stop at the canon. Every chapter of 1 Enoch, Jubilees, Jasher, the Apocrypha, the Pseudepigrapha, the Ascension of Isaiah, the Apocrypha of Abraham, and the other restored editions gets the same framework-bearing prose treatment. Where the Study Notes reader gets framework commentary on the 66 books, the Companion reader gets framework commentary on the whole restored library.
- **Deeper-dive Statement of Faith sections surfaced inline** — the long-form Statement of Faith depth (the doctrine treatments behind the front-page §VII-style summaries) opens inline at relevant verses.
- **Deeper Dive button on every chapter** — unlocks the long-form book-style commentary on every chapter (the §1-§N stand-alone-italics-every-scripture-quoted Logos-killer treatment, the kind of work the post-S88 john-1.md rewrite represents). Click the button on any chapter's commentary panel and the full book-style exposition opens. Where the Study Notes reader gets the framework on every chapter, the Companion reader gets the *book-on-every-chapter.* The depth that displaces Logos sits behind this button.
- **Yoshi's pre-loaded keys** — the canon comes pre-marked with Yoshi's highlights, underlines, and outlines, each tied to an end-of-chapter note and a deeper teaching expansion. Read the Bible alongside the teacher who walked it.
- **Chronological order toggle** — read the canon in the historical sequence of events rather than book order. Job in Genesis-era; Psalms interleaved with David's life; Paul's epistles aligned with Acts; prophets positioned alongside the kings they prophesied to. **Mapping reflects Yoshi's framework dating, not generic scholarly chronology** — a value-add other apps cannot replicate.

### Scribe — $14.99
Everything in Companion, plus the live sermons feed, courses platform (when launched), full Teaching Corpus access, early access to new books and chapters, video integration with the assembly's YouTube channel, and partner-only Sabbath teachings. Naming anchor: *"Every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old"* (Matthew 13:52) — the kingdom-scribe pulls from the treasury of new-and-old, which is exactly what this tier opens.

---

## 10. Free-Tier Acquisition + Conversion Mechanics

**Acquisition surface (V1 focus):**
- Free-only app in App Store + Play Store, no in-app purchases (no commission, anti-steering compliant by design)
- App Store + Play Store discoverability via "Bible app" / "study Bible" / "restored names" search
- Accessibility nutrition labels properly filled at launch (WCAG 2.1 AA — see Section 12)
- Listing copy carefully written to avoid objectionable-content review flags
- Screenshot strategy on store pages — 5-8 images that sell the app at first glance (restored names verse rendering, the speech-mode bracket, the marking system, the Apocrypha library, the Strong's lookup, the offline-download UX)
- Cross-channel funnel from YouTube teaching corpus → app

**Conversion surface (free → $1.99 → $4.99):**
- Upgrade modal points to `remnantofpromise.org/account` via system browser — "Check Your Account" framing, anti-steering compliant
- Free user feels the limitation at every interaction: neon-yellow fill-only on every mark, single global notepad, commentary either basic or off
- Each upgrade gate teases ONLY the next tier (free → $1.99 modal; $1.99 → $4.99 modal)
- Open considerations (decide post-launch based on data): free trial period for $1.99 tier (7 days → auto-charge), annual pricing discount (e.g., $19.99/year vs $1.99/month), launch/founder pricing (first 100 subscribers locked at lower rate forever for seed testimonials)

---

## 11. Distribution Model (locked S77)

- **App Store + Play Store:** free app, no in-app purchases. Apple charges $99/year developer fee (waived if Apple's nonprofit fee waiver application succeeds — Remnant of Promise as 501(c)(3) qualifies). Google Play charges $25 one-time developer registration. Both per-developer-account, not per-app.
- **Native shell stack:** Capacitor for iOS, PWABuilder / Trusted Web Activity for Android. PWA runs inside each native shell.
- **All paid tiers transact via Stripe via the website** — `remnantofpromise.org/account` is the upgrade destination. 94%-margin Stripe path stays alive; app stores get nothing because nothing is sold in-app. Apple's April 2025 Epic-ruling enforcement loosening gives even more latitude than the conservative "Check Your Account" framing.
- **WordPress JWT identity** handles sign-in across the website and the app.
- **Developer accounts open under Remnant of Promise** (the nonprofit's legal entity name), not under MTM Ministries (the personal author imprint, books only).

---

## 12. Offline-First Download Architecture (locked S77)

- **Client-side cache:** IndexedDB or SQLite plugin (Capacitor exposes both). All content downloadable to device for offline reading; no network required after initial download.
- **Tier-gated server-side check** on download — uses existing `tier_satisfies` in the schema. Only content the user's tier permits gets served to their device.
- **Lapse handling:** when subscription lapses, downloaded content stays on device but re-gates (locks, doesn't wipe). On re-subscribe, instant unlock without re-download.
- **Version-manifest sync:** content updates pushed via manifest endpoint; client checks for updates and pulls deltas only.
- **First-launch UX:** small default download (canon only with restored names, ~50-100 MB) so reading happens immediately. Settings → Downloads exposes granular per-content toggles for everything else in tier (Apocrypha library, reference library, commentary, etc.) with size indicators.
- **Per-book on-demand:** tap a book that isn't downloaded → background pull while user starts reading first chapter. Progressive load.
- **Storage management:** user can free space per book without losing notes, marks, or color settings (those stay on device + sync to account).

---

## 13. Accessibility — WCAG 2.1 AA at the PWA Layer (locked S77)

- Semantic HTML, ARIA labels on icon buttons / dialogs / custom widgets
- Alt text on images
- Logical tab and focus order
- Color contrast at AA ratios (white-on-black body text is ~21:1, far above the 4.5:1 floor)
- Proper heading hierarchy
- Touch target sizes: 44pt iOS, 48dp Android
- Captions / transcripts for any audio or video content
- Keyboard navigation throughout
- OS-provided screen readers (VoiceOver on iOS, TalkBack on Android) and braille displays (paired via Bluetooth) handle the actual reading — no custom accessibility code needed in the app, only metadata exposure
- App Store + Play Store accessibility nutrition labels filled out properly at launch

---

## 14. Imprint Architecture (refined S78)

**More Than Milk Ministries** = Yoshi's personal author imprint. The publishing identity carrying his individual teaching voice. Books in the series publish under MTM. Body text, front matter, and the unified theological voice stay anchored in this imprint with no Remnant of Promise mention threaded through them.

**Remnant of Promise** = the church nonprofit organization. The legal entity holding the broader ministry's work — the website (remnantofpromise.org), the study Bible app, the digital infrastructure, and any future ministry programs. Apple/Google developer accounts, Stripe accounts, and all software/digital infrastructure publish under Remnant of Promise.

**Cross-pollination in book back matter (the S78 refinement):** every book includes an "About the Ministry" page after the existing About the Author page, naming Remnant of Promise as the broader church nonprofit, pointing to remnantofpromise.org, and surfacing the study Bible app ("our restored-names study Bible") as an extension of the same ministry. Cross-pollination is intentional in back matter only — never in body, never in front matter, never threaded into theological copy.

Suggested back-matter wording (refinable per book):

> *More Than Milk Ministries is the author imprint of [Yoshi's name]'s personal teaching work. The broader ministry is **Remnant of Promise**, a nonprofit church organization carrying this work into community, study, and accessible Scripture. Visit remnantofpromise.org for the full body of teaching, ongoing study, and our restored-names study Bible.*

---

## 15. What V1 Still Needs Before Ship

Bounded list of what's between "design locked" (done at S78) and "in stores."

**Content track:**
- Commentary writing for canon + extra-canonical books — the largest remaining track, editorial work that grows with each chapter Yoshi authors
- Curated cross-reference thread library expansion (S73-S74 v1 set already landed; more threads = richer recommendations engine at $4.99)

**Engineering track:**
- Native app wrap — Capacitor (iOS), PWABuilder TWA (Android); developer account setup; store listing prep
- Design system implementation — code the locked visual language above (4-direction outline technique, sacred-name colors, S-curve bracket markers with metallic gradients, gold chrome, 12-color palette, three mark styles with their alpha/weight values, neon-yellow free-tier color, parchment alternate theme)
- Offline-first client architecture — bulk-download endpoints, IndexedDB/SQLite cache, lapse handling, version-manifest sync, settings download UX
- Recommendations engine wiring — pure DB lookup against curated cross-reference threads
- Strong's reference lookup wiring (free-tier feature)
- Hebrew/Greek interlinear data alignment ($4.99-tier feature)
- Public domain reference library ingestion (BDB, Thayer's, Vine's, ATS/Easton's/Smith's, Nave's, Treasury of Scripture Knowledge — all public domain data, needs to be parsed and indexed)
- Nikkudot-strip feature (consonantal-form index derived from Hebrew lexicon entries)
- Note system V1 (free single notepad + $1.99 multi-note with categorization)
- Color-meaning dictionary data model + UI
- Share / send verse with watermark
- Search V1 (full-text across canon + extras)

**Compliance / launch track:**
- Apple nonprofit fee waiver application (Remnant of Promise as 501(c)(3))
- App Store + Play Store listing copy + screenshots + accessibility nutrition labels
- App Store + Play Store submission and review process

V2 build (funded cycle, post-V1-launch):
- Yoshi's keys system ($9.99 tier — pre-loaded marks + end-of-chapter notes + teaching expansions, mined from teaching corpus)
- Chronological order toggle reflecting framework dating ($9.99 tier)
- Speech-mode warning-bracket purple split (editorial tagging pass to classify divine speech into promise/warning/mixed)
- $14.99 tier spec + build
- Semantic similarity expansion of recommendations engine (still AI-free at runtime — build-time pre-compute is itself off the table per the 100%-curated stance)
- Improvements to free / $1.99 / $4.99 driven by post-launch data

---

## 16. The Strategic Frame

Per S77's audience correction: Yoshi has NO existing audience. The app and the ministry infrastructure ARE the funnel being built to acquire one. Every V1 decision serves two strategic goals:

1. **Drive traffic** — cold-installer acquisition through App Store and Play Store discovery, organic word-of-mouth via the share/send watermarked feature, and cross-channel funneling from YouTube teaching corpus into the app.

2. **Convert payers** — free → $1.99 → $4.99 progression. Free tier is functional but obviously limited (neon-yellow fill marks, single notepad, off/basic commentary). Each upgrade gate teases the next tier. $1.99 is the psychological barrier-breaker — cheap enough to be an impulse buy, valuable enough to be sticky. $4.99 is the serious-study unlock. V2 builds higher tiers after V1 proves the funnel.

V1 launch is the foundation. Publish-then-edit: ship V1 when the foundation is right, iterate on real user data, build V2 features once funding from $1.99 + $4.99 conversions supports the cycle.

---

## 17. Cross-Reference Architecture (locked S88)

The cross-reference apparatus is the load-bearing surface that distinguishes this study Bible from every Reformation-derived study Bible on the market. The architecture below is the spec for what cross-references draw from, in which direction, and to what end. Together with the commentary architecture in §9, it defines what makes this Bible the Logos-killer Yoshi has been building toward.

**Pool composition — all-library bidirectional.** The cross-reference pool is not *Tanakh → New Testament,* the way most study Bibles default. It is *all-of-the-library ↔ all-of-the-library.* Every text Yoshi has restored and the editorial pipeline treats as scripture-level participates bidirectionally — canon (KJV-restored-names), the Apocrypha (Charles Vol 1), the Pseudepigrapha (Charles Vol 2), 1 Enoch, Jubilees, Jasher, Adam-Eve Conflict, Apocalypse of Abraham, Ascension of Isaiah, Havoth, Shamayim, Cepher additions, Sonnini's *Acts of Paul,* and any future restored-and-treated-as-canonical text in the library. Canon cross-references apocrypha, apocrypha cross-references pseudepigrapha, pseudepigrapha cross-references canon, in every direction the framework-bearing connection runs.

**Why bidirectional matters — the credentializing move.** The Reformation cut these texts out of the Protestant canon by editorial decision; four centuries of Protestant readers have been trained to dismiss them as *apocryphal* in the bad sense. The cross-reference apparatus doesn't argue for the credence of the extra-canonical scriptures by editorial assertion — it lays out the connections side by side and lets the canon's own treatment of these books make the case. Jude 14-15 quotes 1 Enoch 1:9 as prophecy. Joshua 10:13 and 2 Samuel 1:18 both name *the book of Jasher* as a source the canon defers to. 2 Peter 2:4 and Jude 6 both reference the Watcher-rebellion architecture that lives in 1 Enoch 6-16. The Protestant reader sees Jude quoting 1 Enoch, sees the connection, and the question *why was this book cut out?* answers itself. The bidirectional cross-reference work is one of the principal ways the four-costume antichrist diagnostic (institutional Christianity's canon-cutting authority) gets dismantled at the text level — the reader watches the canon read itself and the cut becomes visible as the editorial move it always was.

**Historical-witness one-way rule (deferred V1).** Texts that sit *outside* the scripture-level library — Josephus, the Apostolic Fathers (1 Clement, Didache, Ignatius, Polycarp, Shepherd of Hermas), M.R. James's apocryphal-NT collection, and similar historical-and-devotional witnesses post-dating the apostolic writings — are not in the bidirectional pool. When the cross-reference work eventually extends to them, the rule is directional: cross-references can run *from* a passage in the historical-witness text *out to* scripture (where the historical witness corroborates what scripture says), but scripture never points *into* the historical-witness text, because the historical witness does not carry scriptural weight. **The whole historical-witness cross-reference layer is deferred from V1 entirely.** Neither direction lands in the V1 build. The framework-bearing cross-reference work in V1 stays inside the scripture-level library.

**Layering against the commentary architecture from §9.** Cross-references surface at the $4.99 tier (every chapter shows the full cross-reference apparatus underneath the short-form commentary) and at the free tier (the two framework-distinctive threads — Kingdom Gospel + Grace-That-Can-Be-Lost — render on every chapter as the framework-visible surface even when commentary is locked). The free tier's two-thread visibility is itself a credentializing move: a free reader sees the framework reading the canon, sees the connections, and the upgrade is the door to the rest.

**Authoring discipline.** When commentary at either layer cites a framework-bearing passage from anywhere in the restored library, the passage gets *quoted in full in stand-alone italics on its own line,* per the voice skill's authoring posture. The reader doesn't go anywhere to verify. The cross-reference card data on the database side carries the same discipline: the snippet field holds enough text that the connection lands without forcing the reader to leave the card (which retires the mid-sentence `…` truncation that hit on the live UI before S88).

---

## 18. Cross-promotion of Yoshi's books (carry-forward, deferred)

The S87 design-spec carry-forward to write a cross-promotion-of-Yoshi's-books design specification (the back-matter-zones-only architecture surfaced in S87) remains open. Seven specific patterns were named in S87; the write-up still awaits. Deferred from S88 (which focused on the John 1 sweep + the commentary-architecture restructure). To be picked up in a future session when the more pressing architecture decisions have landed.

---

## 19. Chapter Navigation — Swipe, Arrow Keys, and Visible Arrow Buttons (locked S121, Wheel 2 of the pre-launch sweep)

The reader navigates chapter-to-chapter through three coordinated affordances that all converge on the same `(bookSlug, chapter)` setter — they're three input surfaces over one navigation model. All tiers, all surfaces, all editions. PWA-only (no API changes, no server work); integrates transparently with the §9 free-tier reading-position persistence (S116) because the position-save effect fires on `selectedBookSlug` / `selectedChapter` / `currentVerse` changes regardless of what triggered them.

### Three input surfaces, one navigation model

- **Touch swipe (mobile, tablet, Capacitor wraps).** Horizontal swipe-left advances to the next chapter; swipe-right returns to the previous chapter. Listener attached to the article element so vertical-only swipes (the normal reading scroll) never trigger horizontal navigation. Threshold and angle constraints below.

- **Arrow keys (desktop, web).** `←` previous chapter, `→` next chapter. Window-level keydown listener. Skipped when focus is in an `<input>`, `<select>`, `<textarea>`, or `contenteditable` element so typing in the picker doesn't navigate the chapter. Skipped when any modifier key (`Cmd` / `Ctrl` / `Alt` / `Meta`) is held so the browser's own keyboard shortcuts (back, forward, history) are unaffected.

- **Visible arrow buttons in chrome (desktop, web, PWA-on-mobile).** A pair of bordered-chrome buttons in the picker row — `[←] Book ▾ Chapter ▾ [→]` — always visible at every tier on every surface. Glyph carries the §5 spectral-blue accent; button shell uses the surface-tier bordered-chrome register (same family as the theme toggle and the picker selects). 44pt+ minimum hit target per §13 accessibility floor.

- **Bottom-of-chapter continuation row (all surfaces).** A duplicate prev/next pair renders after the chapter-end cross-reference card, before the footer, as the natural reading-flow continuation. Larger affordance than the chrome arrows; shows the destination chapter's label as a preview when known (e.g., `← Genesis 1` / `Genesis 3 →`). The reader who finishes a chapter does not have to scroll back up to the picker.

### Swipe gesture spec

- **Horizontal threshold:** 60px. A swipe shorter than 60px is ignored.
- **Angle constraint:** `|deltaX| > |deltaY| * 1.5`. A diagonal swipe with significant vertical motion is treated as a scroll, not a navigation. This protects the reader's normal vertical-scrolling motion from accidentally pulling the chapter sideways.
- **Pointer source:** Pointer Events API with `pointerType === "touch"` only. Mouse drag and stylus drag do not trigger navigation (those interactions are reserved for text selection and the future $9.99 keys system).
- **Single-touch only:** multi-finger gestures (pinch-zoom, two-finger pan) are passed through to the browser.
- **Long-press protected:** the existing 500ms long-press picker (S113) takes precedence — a long-press that becomes a swipe still opens the picker; the picker tap-out closes it without navigating.

### Book-boundary behavior

- **Within a book:** prev decrements `chapter`; next increments `chapter`. No bookSlug change.
- **At end of book N within the same witness_category:** next advances to book N+1 (per `canonical_order` within the category), chapter 1.
- **At chapter 1 of book N within the same witness_category:** prev returns to book N-1's last chapter. Requires a one-shot `listChapters(prevBookSlug)` fetch to learn the chapter count; the request is fired in the navigation handler and resolves before the state setters fire.
- **At edition edges (Genesis 1 prev; Revelation 22 next in canon; the equivalent edges in any other witness_category):** bounce. The chapter does not change. The chrome arrow corresponding to the unavailable direction renders in a `disabled` state with reduced opacity, and a brief 200ms shake animation fires on the disabled arrow to confirm the input was registered. The keyboard arrow at an edge fires the same shake on the corresponding chrome button.
- **Within witness_category only.** The canon's 66 books form one continuous swipe sequence; the apocrypha (KJV-1611), the apocrypha (Charles vol 1), the pseudepigrapha, and the other witness categories each form their own continuous sequences. Crossing from canon into apocrypha (or any other category boundary) is a deliberate picker action, not a swipe. This keeps the reader's mental model anchored on the edition they chose.
- **Genesis 1 prev = bounce, Revelation 22 next = bounce (locked S121).** Honors the canon's directionality (creation → new creation). A wrap-to-the-other-end alternative was considered and declined — wrapping flattens the canon's narrative arc, and the bounce affordance gives a clearer signal at the edges. If the reader's expectation drifts toward wrap behavior over time, this is one constant in `lib/chapter-nav.ts` and a paragraph update here.

### Reading-position integration (S116)

Every navigation action — swipe, arrow-key, chrome button, bottom-of-chapter button — calls the same `navigateToChapter(targetBookSlug, targetChapter)` handler, which sets `selectedBookSlug` + `selectedChapter` + resets `currentVerse` to 1 (mirroring the existing book / chapter picker handlers from S116). The position-save effect already fires on those state changes, so the saved position lands at the new chapter without any nav-specific glue. The 1500ms debounce holds; rapid nav (a reader who arrow-keys through five chapters quickly) collapses to one API write at the end of the burst.

### Accessibility

- Chrome arrow buttons carry `aria-label="Previous chapter"` / `aria-label="Next chapter"` and `title` attributes for hover affordance.
- Disabled-edge state is communicated via `aria-disabled="true"` plus visual opacity reduction.
- Keyboard navigation works without the chrome buttons being focused — the global keydown listener captures `←` / `→` at the window level.
- Touch target meets the §13 44pt iOS / 48dp Android floor.
- Focus order: picker selects come first, then the prev/next arrows after them in tab order, so a keyboard-only navigator reaches the same controls a touch reader does, in a natural left-to-right reading order.

### What this section deliberately does NOT prescribe

- **Cross-edition swipe (canon → apocrypha → pseudepigrapha as one continuous sequence).** Considered and declined for V1 — the witness-category boundary is the natural mental model and the picker handles cross-edition jumps. If user research after launch shows readers wanting one continuous swipe across editions, this is a single change in `lib/chapter-nav.ts`.
- **Edge-of-canon wrap.** Considered and declined per the bounce lock above.
- **Swipe-velocity prediction / inertia.** The threshold + angle constraints are sufficient for V1. Velocity-based prediction is a refinement available if the static threshold reads heavy in practice.
- **Hover-revealed arrows on desktop.** The brief explicitly calls for *visible* arrow buttons — always-visible in the chrome and at the bottom-of-chapter continuation row, not hover-revealed.

---

## 20. Tap-on-Word + Contextual Verse Action Menu (locked S121, Wheel 3 of the pre-launch sweep)

Per-word interaction surface for the free-tier Strong's lookup (§9), plus the menu architecture that scales as Wheels 5-13 add more per-verse tools (Notes, Bookmarks, Share-with-watermark, Hebrew/Greek interlinear, verse-highlight recommendations). Replaces the S113 single-purpose "long-press → HighlightPicker" model with a routed-via-menu model — partners learn one interaction grammar across the whole tool surface.

### Two input paths, three modal surfaces

- **Quick-tap on a tappable word.** Fast path — bypasses the menu and opens the **StrongsLookup** modal directly. Highest-frequency action gets the lightest interaction. Quick-tap is defined as `pointerdown → pointerup` within 500ms with less than 10px of horizontal movement (the same long-press timer used at S113; movement budget shared with the S121 W2 swipe handler).

- **Long-press or right-click anywhere on a verse.** Opens the **VerseActionMenu** with items scoped to where the gesture landed. Long-press on a tappable word → word scope (Strong's lookup at the top + divider + verse-scoped actions below). Long-press on plain text between words (or on a word without a Strong's tag) → verse scope (verse-scoped actions only). The menu routes to the right modal when a menu item is selected.

The three modal surfaces all share the same visual register — fixed-position overlay with a `bg-black/40` backdrop, bottom-sheet on mobile (`items-end`), centered on desktop (`sm:items-center`), bordered-chrome panel using `bg-[var(--reader-surface)]`. Same shape as S113 HighlightPicker so partners learn one modal layout.

### VerseActionMenu — extensible section-grouped architecture

Menu items group into named sections so the menu stays scannable as the tool catalog grows. Yoshi's S121 lock: five sections in render order, each carrying word-scope OR verse-scope items, future wheels appending to the appropriate section without changing the component.

| Section | Scope | Wheel 3 (now) | Future wheels |
|---|---|---|---|
| **Word study** | word | Strong's lookup | BDB / Thayer's / Vine's / interlinear / nikkudot consonantal-form siblings (Wheels 9-11; $4.99-gated) |
| **Marking** | verse | Highlight verse | Bookmark (Wheel 5) |
| **Notes** | verse | — | Add note + Open notes for this verse (Wheel 5) |
| **Cross-references** | verse | — | Treasury (TSK) + Nave's topical + Related passages recommendations (Wheels 9, 12; $4.99-gated) |
| **Share** | verse | Copy verse | Share with watermark |

Empty sections drop out of the render (no header at all when a section has zero items in the current partner's view). Future wheels append `MenuItem` objects to the appropriate section in App.tsx's `buildMenuSections` helper without touching the `VerseActionMenu` component. **The S121 default behavior — empty sections drop — has been narrowed at S122: sections drop only if they have zero items across all states (live, tier-locked, coming-soon). Once any stub is added, the section header renders and the stubs sit dimmed inside it.** See *Disabled-state stubs and tier-locked surfaces* below for the locked S122 stub catalog + visual register.

The scopeLabel header at the top of the modal reads the surface English word ("God", "created") when scope is word, and "Verse actions" when scope is verse. Each section header renders in §5 spectral-blue accent at small uppercase-tracked register so partners scan sections as visual chunks.

**Modal sizing for the S122 fuller menu.** Modal max-width grows from `max-w-sm` (S121 lock when the menu carried 1-3 live items) to `max-w-md` to accommodate the full stub catalog without horizontal cramping. Modal also gets `max-h-[85vh]` + `overflow-y-auto` so the bottom-sheet on mobile scrolls cleanly when the menu runs tall (word-scope on a Hebrew word can carry 15 items at S122 lock). Scope-label register stays as the S121 uppercase-tracked spectral-blue treatment.

**Copy implementation note (locked S121).** Copy uses `navigator.clipboard.writeText(formattedText)` directly with the verse text + reference. Bypasses DOM selection entirely — no fight with the long-press picker, no whitespace artifacts from selecting across the W3 word-tappable span structure. Format: `"{Book} {Chapter}:{Verse} — {Verse text}\n\n— Remnant of Promise Official Study Bible"`. The watermark line is the same brand-mark watermark that Wheel 6 will overlay on the visual share — every Copy is a viral surface even before W6 ships.

**Verse-range Copy + Share deferred to Wheel 7 — no Cepher-style cap; ride on the §21 shared range-selection mechanic landing at Wheel 4.** V1 Copy is single-verse. Yoshi flagged at S121 that social-media-debate use cases need multi-verse range (the Cepher's 5-verse limit was named as bad UX). The S122 sweep re-sequence pulled the range mechanic forward to its own architectural wheel (W4) ahead of the share/copy consumers — the mechanic is locked at §21 below with multi-verse highlight as the first consumer; W7's Copy + Share with watermark become two additional Live items in the §21 post-capture action picker as they ship. **No cap.** Partners can range any size they want — single verse to entire chapter, and (when W7 lands cross-chapter) to multi-chapter spans. The framework's diagnostic often runs across passages the Reformation traditions truncate; the app should never reproduce that truncation in its sharing affordances.

### Disabled-state stubs and tier-locked surfaces (locked S122)

S121 shipped the menu architecture with three live items (Strong's, Highlight, Copy) and two empty sections that dropped out of the render. S122 fills the menu with stubs for every future-wheel item so partners see the full tool catalog up front. **The menu becomes a visible roadmap of what's coming, what they have, and what an upgrade unlocks.** Honest catalog rendering paired with the §16 strategic-frame principle: trust is built by showing the real product trajectory, not by hiding it.

**Three item states with differentiated treatment.** Every menu item is in exactly one of these three states at render time, computed per-partner from current tier + ship status:

| State | Visual | Right-side hint | Tap behavior | Cursor |
|---|---|---|---|---|
| **Live** | full opacity | item-specific (e.g., book reference for Copy, Strong's number for Strong's) | invokes the item's `onSelect` + closes menu | `pointer` |
| **Tier-locked** | 40% opacity | tier-name chip badge (`Notes` or `Library`, name not price per the S117 lesson against inline-priced surfaces) | routes to `/pricing` + closes menu | `pointer` |
| **Coming soon** | 40% opacity | `Coming soon` in italic muted register | no-op (closes menu) | `not-allowed` |

**Partner-tier-aware rendering.** A tier-locked stub renders as *Coming soon* (NOT as locked) when the partner is already at or above the required tier. A free-tier partner sees BDB as `Library`-badged + tappable-to-pricing; a Library-tier partner sees BDB as `Coming soon` because they don't need to upgrade — they're just waiting for it to ship. The /pricing route is reserved for partners who genuinely need to upgrade to use the eventual feature.

**Tier badge chip — visual register.** Small rounded pill on the right of the item label. Border 1px `var(--reader-rule)`, background `var(--reader-bg)` (matches the outer reader chrome), text 11px sans in `var(--reader-muted)`, padding `px-1.5 py-0.5`. Two badge values: `Notes` (for $1.99 Notes-tier features) and `Library` (for $4.99 Library-tier features). Higher tiers ($9.99 / $14.99) stay invisible per the S118 product-surface decision until those tiers are scoped.

**Coming-soon hint — visual register.** Italic right-aligned text, 11px sans, `var(--reader-muted)`. Reads simply `Coming soon` — no wheel-number, no ship-date promise (those leak roadmap-internal vocabulary that doesn't translate to partner mental models).

**Locked stub catalog (S122, Greek stub renamed S159 — Thayer's → LSJ per §26 Greek-source swap).** Each section carries the live item(s) from S121 + every future-wheel item from the §20 table as a state-typed stub. Word-study stubs are language-conditional (BDB + Nikkudot only fire on Hebrew words; LSJ only on Greek words). Other stubs are scope-conditional only (verse-scope or word-scope, no language filter).

| Section | Item | State | Wheel | Tier when shipped |
|---|---|---|---|---|
| **Word study** *(word scope)* | Strong's lookup | Live | — | Free |
|  | BDB | Tier-locked (Hebrew only) | W9 | Library |
|  | LSJ | Tier-locked (Greek only) | W9 | Library |
|  | Vine's expository | Tier-locked | W9 | Library |
|  | Hebrew/Greek interlinear | Tier-locked | W10 | Library |
|  | Nikkudot siblings | Tier-locked (Hebrew only) | W11 | Library |
| **Marking** *(verse scope)* | Highlight verse | Live | — | Free |
|  | Bookmark | Coming soon | W5 | Free |
| **Notes** *(verse scope)* | Add note | Coming soon | W5 | Free |
|  | Open notes for this verse | Tier-locked | W8 | Notes |
| **Cross-references** *(verse scope)* | Treasury (TSK) | Tier-locked | W9 | Library |
|  | Nave's topical | Tier-locked | W9 | Library |
|  | Related passages | Tier-locked | W12 | Library |
| **Share** *(verse scope)* | Copy verse | Live | — | Free |
|  | Share with watermark | Live | — | Free |
| **Range** *(verse scope, added S123)* | Start range here | Live | W4 | Free |

For a Hebrew word in word scope at S123 lock (updated from S122 — Share's "Multi-verse range" stub promoted to its own Range section as a Live "Start range here" item per §21), the menu shows 15 items (5 Word-study + 2 Marking + 2 Notes + 3 Cross-references + 2 Share + 1 Range). For a Greek word, 14 items (Nikkudot drops; BDB swaps to LSJ — renamed S159 from Thayer's per §26). For verse scope, 10 items (no Word-study section). Bottom-sheet on mobile scrolls cleanly via the new max-h + overflow-y-auto from above.

**MenuItem interface (S122 extension).** Two optional fields added to the S121 shape so the helper in App.tsx can declare an item's state cleanly:

- `lockedTier?: "notes" | "library"` — when set, item is tier-locked. The component reads partner tier from a new `partnerTier` prop on `VerseActionMenu`; if partner is below the locked tier, render with tier badge + /pricing-route tap; if at or above, render as Coming soon.
- `comingSoon?: boolean` — when true, item is not-yet-shipped (regardless of tier). Renders dimmed + Coming soon hint + no-op tap.
- The existing `disabled?: boolean` stays as the catchall no-op flag for any future use; `lockedTier` and `comingSoon` are the two named S122 states that supersede it for partner-visible reasons.

**App.tsx `buildMenuSections` is the single source of truth for the stub catalog.** Component changes stay tiny — just the new render branches for the three states. Future wheels mutate `buildMenuSections` only: when W5 ships Bookmark, the `comingSoon: true` flag on the Bookmark item gets removed and an `onSelect` handler gets wired up. The menu shape never changes; items just promote across states as their wheels land.

### StrongsLookup modal contents

Header: surface English word + Strong's badge (`H####` / `G####`, badge background in the §5 spectral-blue accent register) + language tag (Hebrew / Greek / Aramaic).

Body:

- **Lemma** — original-script form rendered at 2xl with a Hebrew or Greek font stack (`'SBL Hebrew', 'Ezra SIL', 'Times New Roman'` for Hebrew with `direction: rtl`; `'SBL Greek', 'GFS Didot', 'Times New Roman'` for Greek). Falls back to system serif if the SBL fonts aren't installed (most browsers will still render Hebrew/Greek codepoints via the OS font fallback chain).
- **Transliteration** — inline italic next to the lemma.
- **Pronunciation** — small sans-serif `/.../` notation when present, else hidden.
- **Gloss (short_definition)** — bolded "Gloss:" label + short phrase, when present.
- **Definition** — the full Strong's body, in body register.
- **Derivation** — small sans-serif "Derivation:" label + etymology, when present.

Close affordances: tap-outside-to-close, ✕ button in the header, `Escape` key on desktop.

### Strong's concordance (S121 W3 iteration — locked after Yoshi's "kinda weak" call on lexicon-card-only)

Below the lexicon entry, the modal renders an "Other verses using this word" section listing every verse where the Strong's number appears, in canonical book → chapter → verse order. Powered by the new `GET /v1/strongs/{strong_number}/occurrences?limit=&offset=` endpoint (paginated because common words have thousands of occurrences — H0430 Elohim ~2600, H3068 Yahuah ~6800). First page (25 occurrences) loads in parallel with the lexicon entry; "Show more" button paginates 25 at a time.

Each row renders: reference (Genesis 1:1) in §5 spectral-blue accent + verse snippet. Tap-to-navigate: tapping a row sets `selectedBookSlug` + `selectedChapter` + `currentVerse` (mirroring the W2 nav handlers' state-reset contract), closes the modal, and the partner lands at the chosen verse with the S116 reading-position save firing automatically. The concordance becomes a study driver — partner walks the canon's pattern of usage one tap at a time, with the framework's diagnostic emerging from the repetition pattern itself.

Concordance failure is non-fatal — if the endpoint 404s or the network drops, the modal still renders the lexicon entry alone. The "Other verses" section just doesn't appear. Graceful degradation per the publish-then-edit posture.

Without the concordance, the modal is a vocab card. With it, it's a real study tool. Yoshi's call at S121: lexicon-card-only is "kinda weak"; the canon's usage-pattern is where the framework's diagnostic lands. Concordance is now part of the locked tap-on-word baseline.

### Verse-render alignment

The verse renderer splits the restored verse text into a mix of plain runs and tappable spans via `lib/verse-align.ts`. Alignment respects the restored sacred-name register from §3 — `"Elohim (God)"` renders as a tappable `Elohim` (→ H0430) + a plain `(God)` orientation half; `"Yahuah Elohim (the LORD God)"` renders as `Yahuah` (→ H3068) + `Elohim` (→ H0430) + plain `(the LORD God)`. The parenthetical English equivalent is always non-tappable — it's the orientation half of the source-echo, not a separate word with its own Strong's number.

The alignment is computed client-side at render time using the position-ordered `verse_words` data from the new batched chapter-level endpoint (`GET /v1/books/{slug}/chapters/{n}/words`). One round trip per chapter loads alignment for every verse, fired alongside the existing chapter endpoint so tap-on-word becomes available shortly after the verse text renders (progressive enrichment — verse text shows instantly via the existing chapter endpoint; tap-ability lights up when the words endpoint resolves). The per-verse endpoint stays alive for single-verse needs (search result hover, share-verse preview, etc.).

### Visual register for tappable words

Per §1's clean reading-surface principle, tappable words are **invisible at rest**. The reading surface stays pure prose — no underlines, no color tints, no markers competing with the §3 sacred-name register or the §6 user highlights. A faint dotted underline in the §5 spectral-blue accent fires on hover (`@media (hover: hover)`), confirming the affordance to mouse users without breaking visual density. Touch-only surfaces (no hover state) discover tap-ability through use — same pattern as how partners learned the S113 long-press picker.

This is a deliberate trade against an always-visible underline or color tint. Partners who haven't yet learned the tap surface lose nothing visually; partners who have learned it know any word can be probed. The §16 strategic-frame principle — *the reading surface is the brand-defining signature* — wins over teach-by-affordance for V1. Discovery copy at first-time-install (the §10 conversion-surface work) can mention "tap any word for its Strong's entry" so partners who would never explore on their own get told.

### Interaction-conflict resolution with prior wheels

- **S113 long-press picker.** Now routed through the menu — long-press fires the menu, partner picks "Highlight verse," HighlightPicker opens as before. No behavior changed inside HighlightPicker; the only change is the entry path. Partners who learned "long-press → picker" at S113 hit one extra tap in V1; the menu's clarity benefit (especially as Wheels 5-13 land) outweighs the one-tap regression.
- **S121 W2 swipe nav.** The 10px horizontal-movement check in the swipe handler kills the long-press timer if the user is swiping. Tap-on-word's quick-tap path is also protected — `longPressFiredRef` gates click suppression so a quick-tap that became a swipe doesn't open Strong's mid-swipe.
- **S113 verse-level pointer events.** The word-tappable spans use `e.stopPropagation()` on all pointer events so the verse-level handler doesn't also fire when a word is tapped. Quick-tap on plain text between words still uses the verse-level handler (currently a no-op except for menu-suppression-on-long-press; future wheels may add a "verse info" or default action).

### Accessibility

- StrongsLookup modal: `role="dialog"`, `aria-label="Strong's lexicon entry"`, `Escape`-to-close, ✕ button with `aria-label="Close"`.
- VerseActionMenu: `role="menu"`, items with `role="menuitem"`, `Escape`-to-close, dividers with `role="separator"`.
- Word-tappable spans: inherit the parent verse-interactive's keyboard accessibility (the verse is keyboard-reachable via tab; word-level keyboard activation is a future-wheel refinement).
- Hit targets: menu items meet the §13 44pt iOS / 48dp Android floor (`minHeight: 2.75rem`). Word-tappable spans inherit verse-text size — at the S116-locked Lora 18px / 1.7 line-height, body word targets are ~16-24px tall × variable width; comfortable for thumb taps on common-length words, harder for one-letter words. Edge case captured for post-launch refinement if reports surface.

### What this section deliberately does NOT prescribe

- **Always-visible tappability affordance.** Considered (faint underline at rest on every tappable word) and declined — the §1 clean reading-surface principle wins. If discovery becomes a real adoption blocker post-launch, a `Settings → Highlight tappable words` toggle is the future-wheel refinement.
- **Hover preview of the Strong's entry.** A tooltip-on-hover showing the short_definition was considered for desktop and declined — opens a different UX register (passive vs intentional) and creates a teach-them-two-things problem. Quick-tap stays the one path.
- **Tap-and-hold for full definition; quick-tap for gloss only.** Considered (gradient depth of interaction) and declined — adds a third gesture and the modal isn't heavy enough to justify a "preview" intermediate.
- **Per-word bookmark / mark-this-word-as-studied.** Word-scoped highlights are a meaningful future feature but are NOT in V1 — verse-scoped highlights (S113) remain the only highlight surface. The menu architecture leaves room to add word-scoped highlight at a later wheel without rework.
- **Cross-references from a tapped word.** A "see other verses with this Strong's number" action would be powerful but requires the Wheel 12 recommendations engine + a word-anchored thread store. Deferred.

---

## 21. Range-Selection Mechanic — Shared Across Multi-verse Highlight, Copy, and Share (locked S123, Wheel 4 of the pre-launch sweep)

The shared mechanic for capturing a range of verses, plus its first consumer — multi-verse highlight. Three known consumers across the pre-launch sweep route through one capture flow: Wheel 4 multi-verse highlight (ships with this section), Wheel 7 multi-verse Copy, and Wheel 7 range Share-with-watermark. The architecture-now-beats-retrofit-later forward standard governs the wheel — third instance after the S121 W3 menu architecture and the S122 partner-tier resolution. The mechanic is the wheel; multi-verse highlight is the verification surface.

### One shared menu entry, one capture flow, one branching action picker

Yoshi's S123 lock: one menu item across all three consumers, one capture flow that does not differentiate by destination action, one small action picker that branches at commit time. Rationale (verbal-answers-transcribe from the S123 spec-then-build gate): *"why wouldnt we have the same shared click, unless we can explain to users the different gestures."* The alternative considered — three separate menu items ("Highlight range" / "Copy range" / "Share range") — was declined because there's no clean story for why range-selection would be three different gestures rather than one mechanic with three destinations. The shared-click answer is the architectural cleaner read, and it matches the post-S121 menu-routing grammar partners already learned.

**The menu item: "Start range here"** lives in a new **Range** section at the bottom of the VerseActionMenu (verse scope; one item; Live tier-Free this wheel). The S122-locked Share-section "Multi-verse range" Coming-soon stub is removed — its placeholder role is fulfilled by the new Range section. Future wheels do NOT add new top-level menu items for range-Copy or range-Share; instead they add Live items to the post-capture action picker (described below).

**The capture flow:**

1. Partner long-presses verse N → VerseActionMenu opens.
2. Partner taps "Start range here" → menu closes, app enters **range mode** with verse N anchored as the start verse.
3. Partner taps any other verse M in the currently-loaded chapter → range captured as `[min(N, M), max(N, M)]` (auto-normalized; see *Reversed-range handling* below).
4. Post-capture **action picker** opens (small modal in the bordered-chrome family) with the destination actions: Highlight range (Live this wheel) + Copy range with watermark (Coming soon, W7) + Share range with watermark (Coming soon, W7). The same Coming-soon visual register from §20's S122 stub catalog applies — 40% opacity + `Coming soon` italic muted hint + no-op tap on the Coming-soon entries.
5. Partner taps an action → action's modal opens (HighlightPicker for the Live path) applied to all N verses in the captured range → on commit, action fires N times (one API write per verse) → range mode exits.

**Cancel paths.** Range mode can exit at any time without commit via: (a) tap-outside on the range-mode banner, (b) explicit Cancel button in the range-mode banner, (c) Escape key on desktop. Chapter navigation (W2 swipe, arrow keys, picker, bottom-of-chapter continuation row) also cancels range mode silently per the same-chapter-only scope below.

### Same-chapter scope for Wheel 4 UX; helper is fully general

W4 UX confines range selection to the currently-loaded chapter — entering range mode in Genesis 50 means the end verse must also be in Genesis 50. If partner navigates away (W2 surfaces or the picker), range mode silently cancels. This is a UX scope decision, not an architecture limit.

**The helper itself** (`app/src/lib/range-selection.ts`) is built fully general from W4 — state machine + pure functions that accept verse references and produce ordered verse_id lists across any boundary. W7's Copy + Share consumers will inherit cross-chapter (and cross-book within a witness category — same boundary rule as §19 chapter navigation) without extending the helper. The architecture-now win: when W7 lands, the only new work is the action picker rendering Copy/Share as Live + the consumer wiring; the capture flow + the range math + the verse-id resolution all already exist.

### Visual register — range mode

- **Range-mode banner** at the top of the reader: small bordered-chrome panel with a left-aligned label *"Range mode — tap an end verse"* and a right-aligned Cancel button (using the same bordered-chrome button family per §1). Banner uses `bg-[var(--reader-surface)]` and a 1px `var(--reader-rule)` border; text in body register, Cancel chip in the affordance register. Sticks below the chrome header at all times while range mode is active.
- **Start anchor verse** rendered with a 2px left-border accent in §5 spectral-blue and a faint `bg-[var(--reader-accent)]` tint at ~8% alpha. The accent reads as "this is your anchor" without competing with the existing S113/S117 highlight marks (which live on the verse text itself, not the verse container).
- **Captured-range verses** (after end verse tapped, briefly before action picker opens) get the same low-alpha spectral-blue tint to confirm the range visually. The tint clears on action commit or cancel.
- **No hover preview** of the prospective range — touch-first surface, no hover register to spend complexity on. Partners learn the range by committing to it; if the commit was wrong, cancel and start over.

### Action picker — the post-capture modal

Reuses the §20 bordered-chrome modal family — fixed-position overlay with `bg-black/40` backdrop, bottom-sheet on mobile (`items-end`), centered on desktop (`sm:items-center`), `max-w-md` width matching the S122-locked VerseActionMenu.

**Header:** `"Range captured — {N} verses"` with the verse-reference span underneath in §5 spectral-blue accent register (e.g., *Genesis 1:3–1:5*). Where the helper supports cross-chapter ranges (W7+), the reference span carries the cross-chapter format (e.g., *Genesis 50:26 → Exodus 1:1*).

**Body:** three action items in the S122-locked menu-item visual register — Highlight range (Live), Copy range with watermark (Coming soon, W7), Share range with watermark (Coming soon, W7). Same state-rendering rules as §20's S122 stub catalog (40% opacity for Coming-soon; tap behavior per state).

**Close affordances:** ✕ in the header, tap-outside-to-close, Escape on desktop, explicit Cancel button at the bottom of the picker. Any close path exits range mode entirely (captured state cleared, banner removed, anchor + range visual treatment cleared). The simpler "close = cancel" model was chosen over "close keeps captured state" during S123 build because the alternative needed an explicit re-engage affordance (long-press → "Re-pick end verse" menu item or similar) that didn't justify its complexity in V1 — partners who mis-tap the end verse start over via long-press → "Start range here." If reports surface that mis-tap recovery is a real friction point post-launch, the sticky-captured model is a future-wheel refinement.

### HighlightPicker multi-target mode (the W4 Live consumer)

The S117 HighlightPicker gets a multi-target rendering mode. When invoked from the range-selection action picker with `targetVerseIds: number[]` of length > 1, the picker renders:

- **Title:** `"Mark {N} verses"` instead of `"Mark verse"`. Same chip register.
- **Existing-marks chips at top:** disabled / hidden. Multi-target highlight is a fresh apply, not a per-verse edit — the existing-marks UI from S117 stays only for single-verse highlighting where the partner is iterating on one verse's marks.
- **Color + style picker:** unchanged from S117. Free tier locked to (neon_yellow, fill); $1.99+ unlocks all 39 (color, style) configurations.
- **Mark verse → "Mark {N} verses"** button. On tap, the picker fires POST /v1/highlights N times (one per verse_id in `targetVerseIds`) in parallel via `Promise.all`, with optimistic UI updating `highlightsByVerse` for all N verses before the requests complete. Per-verse failures are logged + the optimistic entry rolled back for that verse only (the other N-1 commits stand) — partial-failure is acceptable for a non-critical free-tier feature. If the partner already has 3 marks on any verse in the range, that verse's commit is skipped silently (the 3-mark cap per §8 applies per-verse, not per-range).
- **No bulk-remove from the multi-target picker.** Bulk-removal is a future-wheel surface (W5 Notes-tier or beyond); multi-target apply is the V1 scope.

### Schema — no migration needed

Multi-verse highlight uses the existing `verse_highlights` table (S113 schema + S117 multi-mark constraint update) with N rows — one (user_id, verse_id, color, style) row per verse in the range. The `verse_highlights_user_verse_color_style_unique` constraint from S117 still applies per-verse — re-applying the same (color, style) to a verse already carrying it is a no-op via `ON CONFLICT DO NOTHING`. No schema changes for this wheel.

### Interaction-conflict resolution with prior wheels

- **S113 / S117 single-verse highlight.** Untouched. Single-verse highlight still fires via long-press → menu → "Highlight verse" → HighlightPicker (single-target mode). Range mode is a parallel path entered via long-press → menu → "Start range here." Partners who never use range mode see no behavior change.
- **S121 W2 chapter navigation.** Chapter nav (swipe, arrow keys, picker, bottom-of-chapter continuation row) silently cancels range mode if active. Range mode is intentionally same-chapter-scope for W4 per the gate, so a chapter-change implies the partner abandoned the range.
- **S121 W3 quick-tap on word + StrongsLookup.** Quick-tap on a tappable word during range mode is treated as the end-verse tap (the verse the word lives in is the end verse) rather than opening StrongsLookup. Word-level Strong's tap is suppressed inside range mode so partners can use words as range-end targets without accidentally opening a lexicon modal. Quick-tap on words outside range mode behaves as S121 W3.
- **S121 W3 VerseActionMenu.** The new Range section appears at the bottom of every verse-scope long-press, regardless of partner tier (Free-tier feature). The S122 partner-tier-aware rendering rule does not apply to "Start range here" since it's Live for all tiers — same treatment as Highlight verse + Copy verse.
- **S122 menu stub catalog.** The Share-section "Multi-verse range" Coming-soon stub is removed (its placeholder role is fulfilled by the actual Range section + action picker). The §20 stub catalog table above reflects the S123 update.

### Accessibility

- Range-mode banner: `role="status"` with `aria-live="polite"` so screen readers announce range mode entry / verse-anchor changes. Cancel button: `aria-label="Cancel range selection"`.
- Anchor verse + captured-range verses: `aria-selected="true"` on the verse container; `aria-roledescription="Range start"` on the anchor verse.
- Action picker: `role="dialog"`, `aria-label="Range action picker"`, Escape-to-close.
- Hit targets: anchor + range-tappable verse containers meet the §13 44pt iOS / 48dp Android floor (`minHeight: 2.75rem`); the existing verse-row padding from the S113 long-press surface already satisfies this — no new minHeight rule needed.
- Keyboard navigation: Tab cycles between range-mode banner Cancel button + the verses in the chapter (verse containers are tab-reachable via the existing S113 pointer-event handlers' `tabIndex={0}`). Enter on a focused verse during range mode commits as end-verse.

### Helper API surface (lib/range-selection.ts)

Pure state machine + pure functions. No React imports; no global state. Consumers (App.tsx for W4; future Copy/Share consumers at W7) hold the state in their own component state and call the helper functions to advance the state machine.

The state shape carries the minimum needed for the same-chapter case and the cross-chapter case (W7+) uniformly — start verse-ref + end verse-ref + a status enum. The helper exposes pure functions for: starting a selection from an anchor verse-ref; committing an end verse-ref to a selecting state (auto-normalizing direction); canceling to idle; resolving the captured range to an ordered verse_id list given a chapter's verse table (same-chapter optimized path) or a cross-chapter lookup (W7+ via an injected resolver). Boundary cases — same-chapter, cross-chapter (deferred test surface but covered by the helper), cross-book (witness-category boundary rule from §19 honored), range-of-one (start === end → 1-verse range, treated identically to single-verse highlight), range-reversed (end < start → auto-normalized to [end, start]) — all covered by node sanity tests per the post-S121/S122 forward standard.

### What this section deliberately does NOT prescribe

- **Drag-to-extend gesture.** A pointerdown-on-verse → drag-to-other-verse → pointerup-to-commit gesture was considered (mirrors text-selection UX) and declined for V1 — too easy to trigger accidentally while scrolling on touch surfaces, and the long-press → menu → "Start range here" → tap-end flow is the deliberate-intent path that matches partner mental models post-S121/S122. Drag-to-extend is a future-wheel refinement if reports surface that the menu-routed path feels too heavy.
- **Cap on range size.** Per the §20 *no Cepher-style cap* lock — partners can range any size they want. The framework's diagnostic often runs across passages the Reformation traditions truncate (Matthew 23-24 unity, Romans 9-11 unity, the gospel-fulfilling structure of Isaiah 53-55 with Hosea 1-2); the app should never reproduce that truncation.
- **Persistent "saved ranges" surface.** Saving a captured range as a named reusable object (e.g., "My Romans 9-11 study range") was considered and declined for V1 — pushes into the same surface as Bookmarks (W5) and Notes (W5+W8); range-as-mechanism stays ephemeral for now. If partners want to refer to a passage repeatedly, the bookmark-with-short-description surface (W5) is the right place.
- **Range-aware verse-actions across modal surfaces.** The Strong's lookup, the chapter-end card, and the future reference-library cards (W9) stay single-verse / single-word in their action surfaces. Range applies only to the verse-render → menu → range mode → action picker path; the modals don't carry their own range affordances. Simpler mental model; one place range lives.
- **Visual range preview during the selecting phase.** Hover-preview of the prospective range (anchor verse → mouse-hover verse → show what the range WOULD be if committed here) was considered for desktop and declined — touch-first surface, no hover register to spend complexity on, and the captured-range tint right before the action picker opens gives partners the confirmation moment they need.
- **Multi-anchor / non-contiguous selection.** Selecting verses 3, 7, and 12 (skipping 4-6, 8-11) was considered and declined for V1 — the use cases that surfaced for it (color-coding a thematic argument across non-contiguous verses) are better served by single-verse highlight in repeated taps. Range mode is for contiguous passages; non-contiguous selection is a future-wheel question if it surfaces as a real need.

---

## 22. Bookmarks + Notes V1 — Two Distinct Surfaces Sharing the Session (locked S124, Wheel 5 of the pre-launch sweep)

The W5 ship: two §9 Free-tier surfaces — **Bookmarks** (single-verse flag with rich metadata) and **Notes V1** (single global notepad with verse-anchor injection). Both are auth-required, both Free-tier (no upgrade gate per §9). A verse can carry BOTH a bookmark AND a note — distinct schemas, distinct intents (bookmark = "find this again, here's why"; note = study content). Per the S122 architecture-lock conversation: bookmarks and notes are NOT the same surface with two doors; they are two surfaces, distinct enough that the partner picks the right one without confusion.

The S121/S122/S123 spec-then-build discipline holds — both surfaces' UX is locked here at wheel-open before any code. Yoshi's three S124 gates settle the UX shape (verbal-answers-transcribe from the AskUserQuestion settled at wheel-open):

1. **Bookmark commit surface = richer card with metadata** (chosen over a simple short_description-only sheet) — partners want the bookmark to carry meaningful context, not just a flag.
2. **Notes V1 placement = bottom slide-up panel** (chosen over full-screen overlay or split-pane drawer) — matches the established §20/§21 bordered-chrome modal family.
3. **Verse-anchor injection = header per entry** (chosen over at-cursor or top-of-notepad) — turns the single global notepad into a chronological study journal that self-organizes without a hub. **Amends the §9 line that previously said "auto-inserted at cursor."**

### Bookmark — the richer card

Modal in the bordered-chrome family (same register as HighlightPicker / RangeActionPicker / StrongsLookup / VerseActionMenu) — fixed-position overlay with `bg-black/40` backdrop, bottom-sheet on mobile (`items-end`), centered on desktop (`sm:items-center`), `max-w-md` width. Opens when partner taps the **Bookmark** item in the verse-scope Marking section of the VerseActionMenu (S122 catalog row promoted from Coming-soon to Live this wheel).

**Card composition, top to bottom:**

- **Header.** Verse reference in §5 spectral-blue accent register (e.g., *Hosea 1:10*) + ✕ close button. Same header treatment as the §20 StrongsLookup modal.
- **Verse preview.** The verse text rendered in muted italic register, 2-3 line clamp via `line-clamp-3 italic text-[var(--reader-muted)]`. Confirms which verse is being bookmarked without competing with the form below.
- **Short_description field.** Multi-line auto-expanding textarea (1 line minimum, expands to 6 lines), placeholder *"Why are you saving this verse?"*. Body register (Lora 18/1.7 to match the reader). Pre-fills when editing an existing bookmark.
- **Tags row.** Chip-style multi-tag input — partner types tag text and presses Enter to add a chip; tap chip `×` to remove. Existing tags from the partner's prior bookmarks surface as autocomplete suggestions in a small dropdown below the input. Tags are partner-defined free text; no preset taxonomy. Empty by default; optional throughout.
- **Color tint row.** Small swatch picker reusing the §6 13-color palette (12 tribe colors + neon_yellow) plus the §6 parchment off-ramp, with an explicit "no tint" affordance as the leftmost option (selected by default). Locked spec — partners learn one color vocabulary across highlights and bookmarks, and the $1.99 free-form color-meaning dictionary (§9) carries forward (rose still means whatever the partner said rose means, whether on a highlight or a bookmark). Free tier has access to all 13 colors here because color on a bookmark is a personal-organization affordance, not a highlight-marking one — tier-locking would invert the §9 Free-tier intent for bookmarks.
- **Footer.** *Saved {date}* in muted small text (only when editing an existing bookmark; hidden on new-bookmark commit). Save button (primary filled, right-aligned). Remove button (secondary outlined, left-aligned, only when editing).

**Behavior:**

- Tap Save → optimistic UI updates `bookmarksByVerse` immediately + closes modal; API call to `POST /v1/bookmarks` fires in background with `ON CONFLICT (user_id, verse_id) DO UPDATE` semantics; failure rolls back the optimistic entry + surfaces an inline error toast at chrome level.
- Tap Remove → optimistic delete + closes modal; API call to `DELETE /v1/bookmarks/{id}`; failure rolls back.
- Tap-outside / ✕ / Escape → discards unsaved changes with no confirm prompt (V1 forgives the mis-tap; partner re-opens and re-types if they wanted to commit). Future-wheel refinement if partners report lost-work pain.

### Bookmark visibility on the reading surface

A bookmarked verse renders a small bookmark glyph (final SVG choice during build — leaning bookmark-ribbon shape over emoji 🔖 for consistency with §5's clean register) immediately after the verse number, in §5 spectral-blue accent at ~0.85 opacity (matching the verse-number opacity treatment). The glyph is the visible marker partners use to spot their bookmarks while reading without needing a separate list view.

If the bookmark carries a `color_tint`, the glyph renders in that color instead of spectral-blue — the partner's color-vocabulary surfaces inline. If no tint, the glyph stays in spectral-blue (consistent with the verse-number accent register per §5).

The glyph is NOT a separate tap target in V1 — partner accesses the bookmark sheet via the standard long-press → menu → Bookmark path (which, on a verse that already has a bookmark, opens the sheet in edit mode with all fields pre-filled). Single-purpose glyph: visibility only, no tap behavior. Keeps the §1 clean-reading-surface principle intact (one tap surface per visual element) and avoids the S121 W3 word-tappable-vs-verse-tap interaction-conflict surface.

### Notes V1 — the bottom slide-up panel

Modal in the bordered-chrome family, taller than the picker modals to give the notepad room — `max-h-[70vh]` on mobile (vs the `max-h-[85vh]` cap for the §20 fuller menu), centered with `max-w-2xl` on desktop. Body region scrolls; the input area at the bottom stays pinned (text input is the primary action; partner shouldn't have to scroll to reach the cursor when typing).

**Panel composition, top to bottom:**

- **Header.** Title *"Notes"* + ✕ close. Single title — no per-verse scoping at Free V1 (per-verse-named notes is W8 / $1.99 Notes tier).
- **Saved-entries body region.** The single global notepad rendered as a vertical scroll of entry blocks (see *Verse-anchor injection* below for the entry structure). Empty-state placeholder when the partner has no entries: muted text *"Tap any verse → Add note to start a thread here."* Default scroll position on open is bottom (most recent entry visible).
- **Pending-anchor strip** (only shown when the panel was opened via the verse-scope Add note path). A small horizontal-rule-separated strip directly above the input region carrying the verse reference in §5 spectral-blue accent (e.g., **Adding to: Hosea 1:10**) — orients the partner to which verse the in-progress entry will anchor to. Strip is hidden when the panel was opened via the chrome-level Notes button without an anchor.
- **Input region.** Multi-line auto-expanding textarea pinned to panel footer (3 lines min, 8 lines max), placeholder *"Add to your notes…"*. Save button to the right of the textarea. Body register (Lora 18/1.7).

### Verse-anchor injection — header per entry

When the partner taps the **Add note** item in the verse-scope Notes section of the VerseActionMenu (S122 catalog row promoted from Coming-soon to Live this wheel), the Notes panel opens with that verse_id set as the **pending anchor** (carried in panel state, surfaced in the pending-anchor strip above the input region). The partner types into the textarea; on Save, the API persists a new entry row with `{verse_id: pendingAnchor, body: typedContent}`. The saved-entries body region updates optimistically to include the new entry at the bottom of the scroll, rendered with:

- **A bold verse-reference header** in §5 spectral-blue accent register (e.g., **Hosea 1:10** on its own line, body register weight 600).
- **The entry body** below the header, in body register prose.
- **A horizontal rule** above the new header, separating it from prior entries.

Each subsequent Add-note tap on a different verse creates another entry row on Save — the notepad self-organizes into a chronological study journal. Same verse tapped twice creates two separate entries (intentional: the partner's second visit is its own moment, not necessarily an edit of the first).

**The textarea is the single write surface.** It only commits new entries; saved entries are read-only in the V1 panel. Editing past entries is a W8 / Notes-tier affordance (the per-verse notes hub at $1.99 carries the full per-entry edit/delete surface). If a Free partner wants to revisit an old entry, they tap the verse again → Add note → a new entry block commits with the same verse reference; the partner writes the addendum there.

This is a deliberate V1 simplification — single-write surface keeps the Free notepad cleanly a "stream of consciousness with verse anchors," and reserves the full edit/delete UX for the $1.99 tier where per-verse named notes (W8) actually need it.

### Notepad access without an anchor entry

Partners need a way to **read** their notes without anchoring a new entry. New chrome-level **Notes button** placed in the App.tsx chrome header to the left of the ThemeToggle: text-only "Notes" label with a small leading glyph (✎) — tap opens the Notes panel scrolled to bottom (most recent entry visible). The pending-anchor strip is hidden on this path; the textarea is empty and ready for free-form input. A Save on free-form input (no anchor) commits an entry row with `verse_id NULL` — the entry surfaces in the chronological scroll without a verse-reference header (rendered with a muted *Free-form note* label or just the body, final visual treatment at build).

Chrome layout becomes: `[Notes button] [ThemeToggle] [Subscription CTA]` — three-element cluster on the right of the chrome header. All three in the bordered-chrome button family per §1. The Notes button uses the same affordance register as the ThemeToggle "Theme" label that landed at S117 (glyph + word label) — discoverable without expanding the chrome's visual footprint.

### Schema implications

**NEW `bookmarks` table** (this wheel's migration):

- `id BIGSERIAL PRIMARY KEY`
- `user_id BIGINT NOT NULL REFERENCES users(id)`
- `verse_id BIGINT NOT NULL REFERENCES verses(id)`
- `short_description TEXT` (multi-line, no length cap per §1's no-truncation principle; nullable per "optional" intent)
- `tags TEXT[]` (Postgres array; nullable; GIN index for future W8 hub queries — junction table considered and declined for V1 since per-tag cross-bookmark queries don't ship until W8 and the array form is simpler to read/write from a single endpoint)
- `color_tint VARCHAR` (nullable; CHECK constraint matches the §6 13-color enum: `neon_yellow`, `crimson`, `tangerine`, `honey`, `sage`, `emerald`, `teal`, `sky_blue`, `periwinkle`, `lilac`, `magenta`, `rose`, `parchment`)
- `created_at TIMESTAMPTZ NOT NULL DEFAULT now()`
- `updated_at TIMESTAMPTZ NOT NULL DEFAULT now()`
- `UNIQUE (user_id, verse_id)` — one bookmark per verse per partner; re-bookmarking edits the existing row

**Existing `study_notes` table reused for Notes V1.** Current schema TBD until shape is read at build-time per the brief's "read its current shape FIRST" gate. Free-tier single-global mode requires per-entry rows ordered by `created_at` (one row per Add-note commit), with `verse_id` nullable to support the chrome-button free-form path. If the existing schema is close (`id, user_id, verse_id, body, created_at, updated_at` shape), V1 ships with no or near-no delta. If `verse_id` is currently NOT NULL or the schema is per-user-singleton, a small migration relaxes the constraint / decomposes the singleton row into per-entry rows. The Free-tier rows coexist with the future W8 $1.99 named-scope rows — same table, schema accommodates both modes via nullable scope columns.

**Two-surface deploy per the S117 three-artifacts-in-lockstep standard:** SQL under `data-schema/migrations/session124_bookmarks_and_notes_v1.sql` + Python loader at `restoration-pipeline/_session124_bookmarks_and_notes_v1.py` (asyncpg + argparse + dry-run + verify, per the established pattern) + matching `COPY restoration-pipeline/_session124_bookmarks_and_notes_v1.py /restoration-pipeline/` line in `api/Dockerfile`. Migration runs from Render Shell per the S117/S120 pattern (sidesteps external-Postgres SSL/IP rejection).

### API surface

All endpoints auth-required, all Free-tier (no tier gate per §9).

- `GET /v1/bookmarks?book_slug=&chapter_number=` — list bookmarks for a chapter; returns flat array with `verse_id` + `short_description` + `tags` + `color_tint` + `created_at` + `updated_at`. Mirrors the S113 highlights `GET` shape.
- `POST /v1/bookmarks` — create-or-replace bookmark `{verse_id, short_description?, tags?, color_tint?}`. UNIQUE (user_id, verse_id) means re-POST on an existing bookmark uses `ON CONFLICT (user_id, verse_id) DO UPDATE SET short_description = EXCLUDED.short_description, tags = EXCLUDED.tags, color_tint = EXCLUDED.color_tint, updated_at = now() RETURNING *`. Returns the row.
- `DELETE /v1/bookmarks/{id}` — delete bookmark; 204 on success; 404 if not the requesting user's bookmark.
- `GET /v1/notes` — return all entries for the partner ordered by `created_at ASC`. Returns array of `{id, verse_id, body, created_at, updated_at}` rows. (Free V1 returns all rows; W8 per-verse-hub adds query params for filtering.)
- `POST /v1/notes` — append a new entry: `{verse_id?, body}`. `verse_id` is nullable (chrome-button free-form path). Returns the saved row.

Existing `verse_highlights` and `reading_positions` endpoints stay untouched.

### Menu stub promotions in `buildMenuSections`

Two S122 catalog rows promote from Coming-soon to Live this wheel:

- **Marking → Bookmark.** `comingSoon: true` flag removed; `onSelect` wired to `openBookmarkSheet(verseId)` handler in App.tsx. State carries the bookmark for the targeted verse (lookup against `bookmarksByVerse` map); sheet renders in create-mode if no bookmark exists, edit-mode if one does.
- **Notes → Add note.** `comingSoon: true` flag removed; `onSelect` wired to `openNotesPanelWithAnchor(verseId)` handler which opens the Notes panel + sets the pending anchor to that verse.

**Notes → Open notes for this verse stays Tier-locked at Notes tier.** The per-verse hub is W8, not W5. The §20 catalog table previously showed this row as wheel W5 (drift carried since the S122 catalog lock — was correct when bookmarks-and-notes was one combined W5 in the original sweep; the S122 re-sequence pulled the per-verse-hub work to its own W8 wheel but the catalog wasn't updated). **Fixed in the same edit that promotes the W5 Live items — fifth drift-caught-while-editing-the-doc instance after S88 john-1 names, S120 product-name-three-files, S121 §5 gold→blue, S122 duplicate Wheel-3 placeholder, S123 §20 Multi-verse-range-stub removal.**

### Interaction-conflict resolution with prior wheels

- **S113 / S117 highlights.** Highlights and bookmarks are independent surfaces on the same verse — a verse can carry up to 3 highlight marks (§8 cap) AND a bookmark AND any number of note entries simultaneously. The bookmark glyph renders to the right of the verse number; highlight marks render on the verse text itself; both visible at once without competing.
- **S121 W2 chapter navigation.** Notes panel + bookmark sheet stay open across chapter changes (they're modal-on-reader, not coupled to chapter state). Useful for the partner who opens Notes mid-read and navigates while the notepad is up. The pending anchor (if set) survives chapter nav — partner can pick up the typing in the new chapter without losing the verse target.
- **S121 W3 / S122 menu stubs.** Two stubs promote (Bookmark, Add note). Open notes for this verse stays Tier-locked at Notes tier with wheel attribution fixed from W5 to W8 in the §20 catalog drift fix.
- **S123 W4 range mode.** Bookmark and Add note are single-verse actions in W5 — range-mode bookmark and range-mode notes are NOT V1 scope. Range mode + open menu → only Live "Highlight range" item in the action picker remains; no Bookmark-range or Note-range items added at W5. If range-mode bookmark surfaces as a partner ask post-launch, it's a future-wheel refinement; for now, range mode is highlight-only at the action picker.

### Accessibility

- Bookmark sheet: `role="dialog"`, `aria-label="Edit bookmark"` (editing) / `aria-label="Create bookmark"` (creating), Escape-to-close.
- Notes panel: `role="dialog"`, `aria-label="Notes"`, Escape-to-close. Textarea has `aria-label="Note input"`. Pending-anchor strip has `role="status"` + `aria-live="polite"` so screen readers announce the verse anchor.
- Bookmark glyph on verse: `aria-label="Verse bookmarked"` so screen readers announce the state; not focusable since the glyph carries no tap behavior at V1.
- Chrome Notes button: `aria-label="Open notes"`.
- Hit targets: bookmark sheet form elements + Notes panel textarea + Save / Remove buttons meet the §13 44pt iOS / 48dp Android floor.
- Tab order in bookmark sheet: short_description → tag input → color swatch picker (left-to-right) → Save → Remove.
- Color swatch picker: each swatch is a button with `aria-label="Color tint: {name}"`; selected swatch has `aria-pressed="true"`.

### What this section deliberately does NOT prescribe

- **Bookmark hub / list view at Free V1.** Partners discover bookmarks by (a) the glyph on the verse while reading, or (b) the long-press → menu → Bookmark path which opens the existing bookmark for that verse. The cross-bookmark hub view organized by tag or color is a $1.99 W8 feature per §9 ("Bookmark-by-color topical study view"). If partners report "I have lots of bookmarks and can't find them" post-launch, a simple Free-tier bookmarks-by-book list is a small future-wheel refinement before W8.
- **Per-entry edit / delete in Notes V1.** The single global notepad is append-only at Free V1. Edit/delete per-entry surfaces with the W8 / Notes tier per-verse notes hub. Free partners who want to revisit an old entry tap the verse again — a new entry block commits and they can write their addendum there.
- **Tagging on notes.** Tags belong to bookmarks at V1 — they're the bookmark's "find this again, in this group" affordance. Notes carry verse anchors as their structural grouping; tags would duplicate the affordance without adding clarity. If W8 surfaces note-tagging as needed for the per-verse hub, it's that wheel's call.
- **Cross-device sync conflict resolution.** Standard last-write-wins per the existing S116 reading-position pattern. No vector clocks, no merge UI, no offline-edit-conflict surfaces — if the partner edits a bookmark on phone and laptop simultaneously, the later write wins. Acceptable for V1 single-user surfaces.
- **Export / import.** Bookmarks-and-notes export to PDF is a $4.99 Library tier feature per §9 ("Notes export to PDF" → W14). Free V1 has no export path; partners are bookmarked/noted within the app only.
- **Bookmark color tint as a sortable index at Free V1.** Color tint is a personal organization affordance at V1 — partners can see their tints inline (glyph color on the verse) but can't sort or filter by color at Free tier. The $1.99 W8 bookmark-by-color topical study view is where color becomes a sortable index.
- **Auto-save / draft preservation on Notes input.** V1 commits on explicit Save tap only; Escape / tap-outside / panel close discards unsaved input without confirm. Auto-save-as-draft (preserve typed-but-uncommitted text across panel close) was considered and declined for V1 simplicity. Future-wheel refinement if partners report lost-work pain.

## 23. Search V1 UI — Pop-up Entry, Grouped-by-Book Results, Tier-aware Snippet (locked S125, Wheel 6 of the pre-launch sweep)

The W6 ship: the §9 Free-tier *"Search across canon + extras"* line finally has a partner-facing surface. Server-side `/v1/verses/search` shipped at Phase-4 wheel #6 (Session 36) — pg_trgm trigram + ILIKE fallback against `verses.text` with a `gin_trgm_ops` index, returning book_slug + book_title + chapter_number + verse_number + text + similarity per hit. This wheel adds the PWA-side entry surface, results rendering, tap-to-navigate path, and the tier-aware snippet card that closes the *"search reveals content the partner can't otherwise read"* concern the original endpoint docstring flagged as a follow-up. Search is chrome-scope (not verse-scope) — it does NOT live in the §20 VerseActionMenu; it lives in the top chrome alongside the Notes button and ThemeToggle.

The S121/S122/S123/S124 spec-then-build discipline holds — fifth consecutive wheel locking UX before code. Yoshi's three S125 gates settled the shape (verbal-answers-transcribe from the AskUserQuestion settled at wheel-open):

1. **Search entry = pop-up modal** (chosen over an expanding chrome-bar or a separate /search page) — partner's reading position never disappears; matches the §20/§21/§22 bordered-chrome modal family so partners use one interaction grammar across the tool surface.
2. **Results layout = grouped by book, collapsible** (chosen over a single best-matches-first list or canon-ordered list) — a common-word search ("shepherd", "spirit", "law") commonly returns 100+ hits across many books; grouping turns the result panel into a topical-coverage map by book rather than a flat dump. Within each group, hits stay ranked by `similarity DESC` so the strongest match within a book sits at top.
3. **Tier-aware snippet = locked-book hits show ref + short preview + upgrade card** (chosen over either full snippets across all tiers or hiding locked-book hits entirely) — the partner discovers the content exists (search becomes a top-of-funnel acquisition surface for the $4.99 Library tier reference apparatus) without the V1 endpoint's current "leaks paid content" gap. **At V1 ship there are essentially zero tier-locked rows in `verses` itself** (canon is Free, apocrypha/pseudepigrapha books also currently `tier_required = 'free'` per the Session 73 schema flip); the rule is baked into W6 code but only visibly triggers when the tier-gated reference library lands at W10 (BDB lemma headwords, Thayer's, Vine's, the dictionaries — those are the rows that will fire the locked-snippet card). Documenting this divergence inline (per the S124 forward standard: name-divergence-and-justification inline, not "see §X" reference) so future wheels don't reread the gate as dead code.

### Search pop-up modal — the entry surface

Modal in the bordered-chrome family (same register as HighlightPicker / RangeActionPicker / StrongsLookup / VerseActionMenu / BookmarkSheet / NotesPanel) — fixed-position overlay with `bg-black/40` backdrop, bottom-sheet on mobile (`items-end`), centered on desktop (`sm:items-center`), `max-w-2xl` width (matching NotesPanel — the results region needs room to breathe), `max-h-[85vh] overflow-y-auto` so the results scroll cleanly when a common-word search runs tall. Opens via two paths described below in *Chrome integration*. **Reading view stays mounted behind the backdrop** — the partner's chapter, verse position, and any open marks stay exactly where they were; closing the search returns the reader to the same scroll position without re-fetching the chapter.

**Modal composition, top to bottom:**

- **Header.** Title *"Search"* + ✕ close button. No per-search-state title swap — the title stays *"Search"* across the empty, typing, results, and zero-results states; the body region carries the state-specific copy.
- **Query input.** Single-line text input pinned at the top, full-width inside the panel padding. Auto-focused on open. Placeholder *"Search the canon and extras…"*. Body register (Lora 18/1.7) so typed text matches the reader's prose register; the magnifying-glass glyph sits inside the input on the left at `var(--reader-muted)` opacity. ✕ clear-input button appears on the right of the input when query is non-empty; tap clears the field and refocuses (not the modal close — that's the header ✕). Cmd/Ctrl+A selects all text inside the field for fast re-typing.
- **Results region.** Below the input. Empty by default (state: idle); shows the appropriate empty / typing / results / zero-results / error treatment as the partner types (see *Result states* below). Vertical scroll inside the modal; input region stays pinned at the top so it's always accessible without scrolling.
- **Footer hint** (only when results are visible). Muted small text on the right: *"N hits across M books"* — counts populated from the response. Hidden on the empty / typing / zero-results states.

### Search input — debounce, minimum query length, request lifecycle

- **Minimum query length = 2 characters** matching the server-side `min_length=2` on the endpoint's `q` query param. Below 2 chars the results region renders an idle hint (*"Type to search the canon and extras."*). At ≥ 2 chars the fetch fires after debounce.
- **Debounce = 250ms** since last keystroke before fetching. Matches the typical "slow typist" pause without making fast typists feel sluggish. Implemented in the same shape as the S116 reading-position debounce (immediate state update + delayed network call). Rapid typing collapses to one fetch per typing-pause, not one per keystroke.
- **In-flight request cancellation.** Each fetch carries an `AbortController.signal`; a new query keystroke fires `abort()` on the previous in-flight request before issuing the next. Prevents the late-arriving response from a stale query overwriting the current results. Aborted requests are silent (the catch branch ignores `AbortError` and surfaces nothing).
- **Loading affordance** between debounce fire and response. Small spinner glyph appears in the input's right-side area (replacing the ✕ clear button while loading); results region keeps the previous render so the panel doesn't flash empty between queries. On response, spinner clears and results region updates.
- **Server-side limit kept at `limit=25`** (the default in the endpoint signature) for V1. Common-word queries returning 25 grouped-by-book hits across 8-12 books fit comfortably in the modal without paging. Pagination ("Show more results" → `limit=50`/`limit=100`) is a future-wheel refinement once usage data shows partners hitting the cap.

### Result states — empty / typing / results / zero / error

- **Idle (< 2 chars):** muted body-register text — *"Type to search the canon and extras."* Single-line, centered, no extra chrome.
- **Typing (debounce window):** results region keeps showing the previous render (avoiding flicker); spinner replaces the input's clear button. First query of a session shows the idle hint with the spinner overlaid in the input.
- **Results (≥ 1 hit returned):** the grouped-by-book list rendered as collapsible book groups (see *Results — grouped by book* below).
- **Zero results:** muted body-register text — *"No verses match '{query}'."* The query value renders in quotes so the partner sees what was actually sent. No suggestion engine at V1 (no "did you mean"); zero-results just reports the truth and lets the partner re-type.
- **Error:** muted body-register text — *"Search is temporarily unavailable. Try again in a moment."* Triggered by a non-AbortError fetch failure. The previous results render is replaced (errors aren't transient overlays on stale data — they declare current state). No retry button at V1; the partner re-types or waits.

### Results — grouped by book, collapsible

Hits arrive flat from the endpoint already ordered by `sim DESC, b.canonical_order ASC, c.chapter_number ASC, v.verse_number ASC`. The client groups them by `book_slug` (preserving the first occurrence of each book in the flat order — which, since the server-side order is similarity-first across all books, gives a per-book ordering that mirrors how strongly each book matched). **Within each group, rows stay in the server's order** (similarity-first); the client does NOT re-sort within a group.

**Per-book group rendering:**

- **Group header.** Collapsible row showing `▼` (expanded) or `▶` (collapsed) glyph + book title + per-book hit count in muted register. Examples: *"▼ Psalms (4 hits)"*, *"▼ John (3 hits)"*. Header is the full-width tap target — partner taps anywhere on the header to toggle expand/collapse. Header text in body register (no chrome-shrunk treatment — these are reading-surface labels, not toolbar chips). The `▼`/`▶` glyph in §5 spectral-blue accent at ~0.85 opacity matching the verse-number register.
- **Initial expansion state.** All book groups start expanded on first render of a results set. Partners can collapse groups they don't want to scan; the collapsed state of any given group does NOT persist across new queries (each new query re-expands everything — new search, new look).
- **Group separators.** Each group ends with a 1px horizontal rule in `var(--reader-rule)`, except the last group which has no trailing rule. Mirrors the §22 NotesPanel per-entry rule register.

**Per-result row rendering (inside an expanded group):**

- **Reference + snippet on the same row** for narrow viewports (mobile) — verse reference in §5 spectral-blue accent register (e.g., *Psalm 23:1*) on the left, verse snippet in italic muted register (`italic text-[var(--reader-muted)]`) to the right of the reference, no truncation per the §1 no-truncation principle. On desktop the reference + snippet still share a row but with more breathing room (`md:gap-3 md:items-baseline`).
- **Snippet text = the full verse text** as returned by the endpoint (`v.text`). No client-side truncation, no `…` ellipsis on long verses — the §1 no-truncation principle applies here as it does on the chapter-end cross-reference card snippets after the S88 truncation-retires lock. A long verse may wrap to multiple lines; that's correct.
- **Query-match highlighting.** The substring(s) inside the snippet matching the query render with a `<mark>`-style background using `var(--reader-accent)` at 25% alpha — same spectral-blue family as the rest of the chrome accents, distinct from highlight marks (which are user-applied) so partners read the search-match emphasis as transient/render-time rather than persistent. Case-insensitive substring matching against the typed query. Multi-token queries (e.g., *"living water"*) match each token independently inside the snippet rather than the whole-phrase contiguous match — covers the trigram-similarity case where the endpoint returned a hit but the literal phrase isn't contiguous in the verse.
- **Row interaction.** Whole row is a single tap target (the reference half + snippet half resolve to one click handler). Tap = jump to that verse (see *Tap behavior* below).
- **Hover treatment** (desktop only via `@media (hover: hover)`): row background lifts to `var(--reader-surface)` at 50% alpha so the partner sees the tap affordance without it crowding the row at rest.

### Tier-aware snippet — locked-book hits (gate c)

When a hit's source book has `tier_required` above the partner's current tier (per the response's new `tier_required` field — see *API surface* below), the row swaps the snippet half for a small upgrade card:

- **Reference half stays unchanged** — partner still sees *"Genesis 1:1"* or wherever the hit landed, so the search remains a top-of-funnel acquisition surface for tier discovery (the partner sees the content exists in books they don't yet have access to).
- **Snippet half is replaced by an upgrade card** — small bordered chip (`border var(--reader-rule)`, `bg-[var(--reader-surface)]` at 60% alpha, `px-3 py-1.5`, rounded) with text *"Read this book — {Tier} tier"* in body register + a right-chevron glyph in §5 spectral-blue accent. Tap routes to `/pricing` via the same `window.location.href` pattern as the §20 tier-locked menu stubs (browser-native routing — no react-router dependency added).
- **Tier name register matches §20** — *Notes* for $1.99-gated content, *Library* for $4.99-gated content. The S118 lesson on the inline-priced impression carries forward (tier *name*, not price, so the partner doesn't read every search hit as an individually-priced item).
- **Query-match highlighting is suppressed** on tier-locked rows — partner sees the reference + upgrade affordance only, not a teaser-snippet that leaks the content. The upgrade-card replacement IS the snippet.
- **Partner-tier-aware rendering.** A row whose `tier_required` is at or below the partner's current tier renders as a normal snippet row (no upgrade card). Same `partnerAtOrAboveTier()` helper used in §20's stub catalog determines the swap. Anonymous partners are treated as `free` tier per the established auth.py path.

**At V1 ship, the locked-snippet card is dormant for verse search results** since `verses.text` rows all carry `tier_required = 'free'` from the Session 73 flip. The W10 reference library wheel ships BDB / Thayer's / Vine's lemma headwords with `tier_required = 'extras'` ($4.99), which is when this card visibly triggers. Inline divergence justification per the S124 forward standard.

### Tap-result behavior — jump-to-verse, close modal, scroll

Tap on a Live (non-tier-locked) result row:

1. Set `selectedBookSlug`, `selectedChapter`, `currentVerse` via the existing W2 navigation handlers' state-reset contract (same path the StrongsLookup concordance rows use — single source of truth for jump-to-verse).
2. Close the search modal.
3. The S116 reading-position effect fires automatically on the state change, persisting the new position.
4. The S116 scroll-to-saved-verse effect (50ms after chapter load) scrolls the destination verse into view; the partner lands at the searched verse, reader chrome and chapter context intact.

Tap on a Tier-locked result row routes to `/pricing` and closes the modal (same `window.location.href = "/pricing"` path as §20's locked stubs). No jump-to-verse fires for locked rows; the partner converts (or doesn't) at /pricing and re-opens search if needed.

### Chrome integration — Search glyph + Cmd-K/Ctrl-K shortcut

**New chrome Search button** placed in the App.tsx chrome header. Chrome cluster on the right of the header becomes: `[Search button] [Notes button] [Theme toggle] [Subscription CTA]` — four-element cluster in the bordered-chrome button family per §1. The Search button uses the same affordance register as the §22 Notes button — glyph + word label (magnifying-glass glyph + *"Search"* label), discoverable without expanding the chrome's visual footprint. Tap opens the pop-up modal.

**Keyboard shortcut on desktop:** `Cmd+K` (macOS) / `Ctrl+K` (Windows / Linux) opens the same pop-up. Window-level keydown listener, scoped narrowly: fires only when the modal is closed; ignores when focus is in an input/select/textarea/contenteditable (so a partner typing in a Notes textarea can use Ctrl+K for whatever the OS routes it to without intercepting). Matches the S121 W2 keyboard-listener discipline (modifier-key passthrough, focus-aware skip). `Escape` closes the modal when open — handled inside the modal's own keydown listener, no global Escape catch.

Cmd-K / Ctrl-K is the de-facto search shortcut across Notion / Linear / Slack / VS Code; partners coming from those apps will try it instinctively. No formal documentation surface in V1 — partners discover it by guess-and-confirm; visible hint inside the input (`*Tip: Cmd+K opens search anywhere*`) considered and declined for V1 to keep the panel clean. Future-wheel refinement if partners report not finding the shortcut.

### Schema implications

**None this wheel.** No new tables, no new columns, no migration. The existing `books.tier_required` column (§9-driven, populated since the seed) is read on the server side; the existing `verses.text` and `pg_trgm` GIN index (`idx_verses_text_trgm` per schema.sql) carry the search load. **Three-artifacts-in-lockstep-now-FOUR rule** from the S124 forward standard doesn't fire — no loader, no Dockerfile COPY, no `.dockerignore` negate-pattern needed because no schema-shape change ships.

### API surface — one small additive change

The existing endpoint stays; one field gets added to the response:

- `GET /v1/verses/search?q=&limit=` — unchanged shape and behavior; addition is the new `tier_required` field on each `VerseSearchHit` (Pydantic model in `api/models.py`). Pulled by the existing SELECT via a JOIN to `books.tier_required` (already in the query path through `JOIN books b ON b.id = c.book_id`); one column added to the SELECT list, one field added to the model, no new index, no new round trip. The endpoint stays public (no auth) — search itself doesn't tier-gate (anonymous partners can search and see references); the tier-aware rendering happens client-side via the new field + the existing `partnerAtOrAboveTier()` helper, mirroring how §20 menu stubs resolve.

**No JWT-aware tier filter on the endpoint at V1.** The original Session 36 docstring noted *"search hits could surface verses from books the caller can't normally read. Tracked as a follow-up; not part of the Session 36 wheel scope."* W6 closes that gap CLIENT-side via the locked-snippet card rather than server-side via response filtering. **Justification (inline per the S124 forward standard):** server-side filtering would hide the *existence* of tier-locked content from the partner, which kills the search-as-acquisition-surface intent of gate (c); client-side rendering with the upgrade-card swap preserves discovery while preventing snippet leak. If a future wheel needs server-side filtering (e.g., for partners who explicitly opt into "hide content I can't read"), it lands as a query-param `?show_locked=false` toggle defaulting to true rather than a hardcoded filter behavior change.

Server-side `verse_ref` resolution is NOT needed here (the S124 forward standard on server-side ref resolution beating N+1 client round trips applies to opaque-id lists; the existing endpoint already returns `book_slug + chapter_number + verse_number` flat in the response, so the PWA composes the human-readable reference locally — no extra round trip, no opaque-id surface).

### Pure-helper extraction — `app/src/lib/search-helpers.ts`

Per the S121 W2 / W3 / S122 / S123 forward standard (extract pure logic to helpers + write node sanity tests), W6 surfaces the following pure helpers:

- `groupResultsByBook(hits): BookGroup[]` — flat array → ordered list of `{bookSlug, bookTitle, hits: VerseSearchHit[]}` preserving first-occurrence order of books in the input array. The load-bearing helper for gate (b) — testable against fixtures covering single-book, multi-book, ordered/unordered input, and empty arrays.
- `highlightQueryMatches(text, query): Segment[]` — splits the snippet into `{type: 'plain' | 'match', text}` segments for `<mark>`-rendering inside the result row. Case-insensitive; multi-token queries split on whitespace and each token matches independently. Returns the original text wrapped in a single `plain` segment when the query is empty or has no matches.
- `isResultLocked(hit, partnerTier): boolean` — wraps the `partnerAtOrAboveTier()` tier-ladder helper (already exists in App.tsx from §20) and inverts the answer. Trivial wrap, but tested explicitly to lock the inversion semantics for future wheels.
- `formatHitCount(group): string` — *"{N} hit"* / *"{N} hits"* depending on group size. Trivial, but the pluralization off-by-one is exactly the kind of drift the sanity tests catch.
- `formatTotalSummary(groups): string` — *"{N} hits across {M} books"* footer text with correct singular/plural handling across both axes. Same drift surface as `formatHitCount`.

Node sanity tests at `/Users/mtm/Desktop/App/_s125_search_sanity.mjs` covering: empty hit array; single-hit single-book; multi-hit single-book preserves order; multi-book preserves first-occurrence order; hits arriving out of order get grouped without re-sorting (server's order wins); empty query produces no match segments; single-token query case-insensitive match; multi-token query independent matching; overlapping multi-token tokens (e.g., *"the the"*) handled without infinite-loop; tier-lock resolution at anonymous / free / study_notes / extras / complete_study / everything tiers crossed with rows tier_required at free / study_notes / extras / everything; pluralization at 0 / 1 / 2 / N hits; footer summary across 0 / 1 / 2 / N books.

### §20 menu deliberately untouched + §20 catalog drift fix

**Search is chrome-scope, not verse-scope.** The §20 stub catalog (line 444-463) does NOT gain a Search item — partners reach search via the chrome glyph, not the long-press verse menu. The §20 architecture is for word- or verse-scoped tools (Strong's, Highlight, Bookmark, Add note, Copy verse, Start range here); chrome-scope tools (Theme toggle, Notes button, Search button, Subscription CTA) belong in the App.tsx header chrome cluster per §1. Confirmed at-read-time — no new section added to §20, no new MenuItem entry in `buildMenuSections`.

**§20 line-412 drift caught + fixed in the same edit.** The S121-lock summary table at line 406-412 carried `**Share** | verse | Copy verse | Share with watermark + verse-range selection (Wheel 6)` — wheel-number drift (Share-with-watermark is W7 since the S122 re-sequence; the S122 locked stub catalog at line 459-460 already had the corrected W7 attribution) compounded with content drift (verse-range selection shipped at W4 / S123 — it's not future work). Fixed in-place to `**Share** | verse | Copy verse | Share with watermark (Wheel 7)`. **Seventh drift-caught-while-editing-the-doc instance** after S88 john-1 names, S120 product-name-three-files, S121 §5 gold→blue, S122 duplicate Wheel-3 placeholder, S123 §20 Multi-verse-range-stub removal, S124 §20 Open-notes-for-this-verse W5→W8 attribution.

### Interaction-conflict resolution with prior wheels

- **§19 chapter swipe + arrow keys.** Search modal open = window-level ArrowLeft / ArrowRight listener is suppressed (the modal owns keyboard focus). On modal close the listener resumes. Swipe gestures on the modal backdrop or inside the modal panel are NOT interpreted as chapter-nav swipes (the gesture handler checks `event.target.closest('[role="dialog"]')` and bails when inside a modal — same pattern as the S121 W2 swipe-vs-long-press resolution).
- **§20 long-press / right-click menu.** No conflict — search opens from chrome, menus open from verse-render. The two interaction surfaces don't share gesture territory.
- **§21 range mode.** Opening search while in range-mode `selecting` state implicitly cancels the range (same as §19 chapter nav cancels range mode per the §21 "close = cancel" model). Range-mode partner who searches mid-capture loses the captured anchor; this is the right behavior — the search surface is their new intent. Range mode `captured` + RangeActionPicker open: the search shortcut is suppressed by the same in-input-focus check as Cmd-K / Ctrl-K, but if the partner explicitly clicks the chrome Search button, the RangeActionPicker closes via its own tap-outside path (the search modal's `bg-black/40` backdrop counts as tap-outside) and search opens cleanly.
- **§22 BookmarkSheet / NotesPanel.** Same as above — opening search while a sheet/panel is open closes the sheet/panel (the chrome Search button is outside the modal stack; tapping it is a tap-outside on whichever modal was open). Partner intent reads cleanly: "I'm done with that surface, going to search."
- **S116 reading-position persistence.** Search-and-jump fires the same state-update path as picker selection and W2 nav arrows — `currentVerse` resets to 1 before the new chapter loads, then the S116 scroll-to-saved-verse effect lands the partner at the searched verse. The reading-position write happens on the destination verse (not the search-source verse) — searching from Genesis 50:20 to Psalm 23:1 saves Psalm 23:1 as the partner's position, matching their stated intent (they navigated to it).

### Accessibility

- Search modal: `role="dialog"`, `aria-modal="true"`, `aria-label="Search the canon and extras"`, Escape-to-close. Focus traps inside the modal while open (Tab cycles through input → result rows → close button → back to input).
- Search input: `aria-label="Search query"`, `type="search"` (gives mobile keyboards the search-action button), `autocomplete="off"`, `spellcheck="false"` (theological vocabulary trips spellcheck more often than it helps; partner can correct via the existing OS-level keyboard).
- Loading spinner: `role="status"` + `aria-live="polite"` so screen readers announce *"Loading results"* during fetch; *"Results loaded"* on completion.
- Results region: `role="list"` wrapping the book groups; each book group is a `role="listitem"` with the group header in an `aria-expanded`-toggling button (`aria-expanded="true"` / `aria-expanded="false"` per current state). Result rows inside each group are buttons (`role="button"`) with `aria-label="{Book} {chapter}:{verse}"` so screen readers announce the destination cleanly. Snippet text is inside the button's child content and gets read after the aria-label.
- Tier-locked rows: `aria-label="{Book} {chapter}:{verse} — upgrade to {Tier} tier to read"` so screen readers announce the locked state without reading the (suppressed) snippet. Tap announces routing to /pricing via the same path as §20 stubs.
- Chrome Search button: `aria-label="Open search"`, `aria-keyshortcuts="Meta+K Control+K"` (announces the shortcut to assistive tech that surfaces it).
- Hit targets: search input, result rows, group headers, ✕ close, Search chrome button — all meet the §13 44pt iOS / 48dp Android floor. The book-group header is intentionally the full row width so a partner tapping near the chevron expands/collapses without missing.
- Color contrast: the §5 spectral-blue accent on `var(--reader-bg)` clears WCAG AA 4.5:1 (verified at S115 lock); the `<mark>`-style query-match background at 25% alpha keeps the underlying text contrast intact because the text color doesn't change — only the background tints.
- Keyboard nav: Arrow keys do NOT move selection inside the results list at V1 (the page chrome's arrow-key listener for chapter nav stays suppressed while the modal is open; introducing arrow-key result selection would compete for the same keystrokes mid-future-wheel if chapter nav within the modal becomes a thing). Tab + Enter handle full navigation. Future-wheel refinement: ↑/↓ within results if partner feedback requests it.

### What this section deliberately does NOT prescribe

- **Search history.** No recent-searches list, no saved-searches surface. V1 is fire-and-forget; the modal opens empty every time. A history surface raises persistence (which device? which account? clear-history affordance?) that's not worth scoping for V1 when the typed query is two characters from being re-typed. Future-wheel refinement if partners report repeat-searches.
- **"Did you mean" suggestion engine.** Zero-results just reports zero. Trigram similarity is already a fuzzy match (a partner typing *"shephard"* will still get *"shepherd"* hits via pg_trgm's similarity threshold), so the most common typo class is covered by the existing endpoint. Building a typo-correction layer on top requires either a curated misspellings dictionary or an LLM call at runtime; the latter violates the §9 *"100% curated theological data, AI-free at every stage including preprocessing"* lock on the verse-highlight recommendations engine, and the spirit of that lock extends to search.
- **Strong's-aware concept search.** The existing endpoint docstring flags *"richer ranking lands when the Strong's-aware concordance and the Teaching-Corpus-aware concept search land in Phase 5/6."* Strong's concordance shipped at S121 W3 as the standalone modal (StrongsLookup → "Other verses using this word"); it isn't merged into the trigram search at V1. A partner who wants to walk a word's usage taps the word in the reader; a partner who wants to find a phrase or fragment uses search. Two distinct entry surfaces, two distinct mental models, both Free-tier per §9.
- **Cross-reference / commentary / notes / bookmarks in search scope.** V1 search is `verses.text` only. The chapter-end card data, the matt-N commentary corpus, partner-written notes, partner-set bookmarks — none of those are searchable from this surface at V1. **Notes search** is a $1.99 W8 Notes-tier feature per §9; **commentary search** is a possible W14-and-beyond refinement; **bookmark search** falls under the W8 bookmark hub. The V1 search surface stays focused on the canon and extras body text.
- **Highlighting query matches inside the reader after a jump.** When the partner taps a search result, the reader scrolls to the destination verse but does NOT visually pre-highlight the matched word(s) inside the verse text. The verse renders in its standard register; the partner reads contextually. A "match-the-search-term while you read" visual treatment was considered and declined for V1 because it would compete visually with the §6 highlight marks and the §20 word-tappable underline-on-hover register, and because the partner already saw the matched substring inside the snippet in the search results panel. Future-wheel refinement if partners report wanting it.
- **Per-book / per-tier filter pills on the search input.** *"Search canon only"*, *"Search apocrypha only"*, *"Search complete library only"* filter chips above the input were considered and declined for V1 — the grouped-by-book result panel already makes the per-book distribution visible at a glance, and collapsing groups the partner doesn't want gives the same filtering outcome without a separate UI surface. The pills add chrome footprint without unlocking new capability at the V1 result-set size.
- **Server-side tier filtering of search results.** As described under *API surface* above, the V1 endpoint returns all hits regardless of partner tier and the PWA renders the tier-aware snippet card client-side. A `?show_locked=false` query-param toggle is the future-wheel landing pattern if partners explicitly opt into hiding content they can't read; the default stays show-locked-with-upgrade-card to preserve search as an acquisition surface.
- **Boolean operators, exact-phrase quoting, field-scoped search.** No `AND` / `OR` / `NOT` / `"exact phrase"` / `book:Genesis` syntax at V1. pg_trgm's substring-and-similarity matching covers the common case (a partner typing *"living water"* gets verses containing both words, with the strongest matches first). Power-user search syntax is a future-wheel refinement; the V1 surface stays a natural-language typing surface for the partner who isn't running a Boolean query in their head.

---

## 24. Share-and-Copy-with-Watermark — Canvas-PNG Render, Reserved-Footer-Band Layout (locked S126, Wheel 7 of the pre-launch sweep)

The shared render path for every watermark-bearing export from the app — single-verse Share, single-verse Copy, multi-verse range Share, multi-verse range Copy. Closes the §9 Free-tier *"Share verse with watermark"* promise, promotes the §21 RangeActionPicker Copy/Share items from Coming-soon to Live, and upgrades the §20 single-verse Copy path from text-only-clipboard to canvas-PNG (with text-only fallback). Built on the locked S123 range-selection helper for any multi-verse case — the share/copy consumers are the second and third Live consumers of the same captured-state pipeline after S123's multi-verse highlight. The same brand-mark asset doubles as the locked App Store / Play Store listing image surface per §1.

### The brand-mark — locked asset (S126, v4 argaman-tribes upgrade)

`~/Desktop/App/brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-share-card-watermark-240x360.png` (240×360, PNG-24, ~120 KB). Source-of-truth lives in the project's `brand-assets/` directory; the PWA bundle imports the same file via Vite's static-asset pipeline so the bytes ship into the deployed app at a content-hashed URL and survive aggressive CDN caching. The full-size `brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` is the same composition rendered at hero scale for marketing / App Store / landing-page use (see §1 cross-reference + the S118 landing-page spec). The pre-v4 gold-accents-with-blue-tribes variant (`brand-mark-blue-on-black-v3-gold-accents-*`) stays in `brand-assets/` as an alternate but is NOT the share-card watermark; v3 is also preserved in `brand-assets/_pre-v4/` for rollback.

**Composition (locked S126, v4 upgrade).** Stencil-style render against pure black, using all three locked §3 sacred-color registers: **techelet `#1A6FE5` (divinity)** carries the title text *The Remnant of Promise* + the base text *Official Study Bible* in deep-blue Lombardic letterforms and the blue olive-branch motif with silver-blue leaves; **argaman `#8E4FB3` (covenant body)** carries the **JUDAH** label on the left and the **EPHRAIM** label on the right in saturated purple Lombardic letterforms; **gold** anchors the menorahs flanking the central trunk and the central light/trunk itself. The brand-mark thus reads as a complete summary of the §3 sacred-color palette in one image — the same color registers the reader encounters inside the app body text, present on the cover. The composition reads at corner-of-share-card scale and at App Store thumbnail scale.

**Theological reading of the three-register composition.** Techelet on the title carries the divine-name register — the brand-voice speaks in the same color the canon's divine names render in. Argaman on JUDAH + EPHRAIM carries the covenant-body register per §3's lock on *Yahudah (Judah)*, *Yashar'el (Israel)*, *Yahudim (Jews)*, *Yahudi*. JUDAH-in-argaman is a direct §3 sacred-color hit; EPHRAIM-in-argaman is a slight extension of the strict §3 list (Ephraim isn't named in the §3 word list) but treating JUDAH + EPHRAIM as one matched argaman pair reads them as the Ezekiel 37 two-sticks restoration — the two houses of Israel rejoined. The extension is theologically grounded, not arbitrary. Gold on the menorahs + central trunk carries the priestly-witness register and the divine-presence motif — the menorahs are the covenant witnesses, the central light is Yahuah's presence at the joining of the branches.

**Saturation lock (locked S126).** 25% saturation lift baked into the PNG via PIL.ImageEnhance.Color from the Grok-delivered source, pre-saturation original preserved at `brand-assets/_pre-saturation/` (v3) and `brand-assets/_pre-v4/` (v3 itself preserved when v4 superseded it). The lift is baked into the pixels rather than applied via CSS filter at render time, so the lifted version travels with the asset across every surface (PWA share renderer, landing-page hero, App Store image, future Capacitor wraps) without per-surface CSS coordination. Post-lift sampled medians: techelet title `~#0a2d84` (much deeper than the §3 reader-text techelet `#1A6FE5`); argaman tribe labels `~#670faf` (JUDAH) / `~#6a0fb2` (EPHRAIM) — both deeper than the §3 reader-text argaman `#8E4FB3`. The hex divergence from §3 is intentional and acceptable — the brand-mark is its own surface register, the §3 colors are the body-text outline register, and what matters is each color in the brand-mark reads cleanly as its §3 register (blue → techelet, purple → argaman, gold → priestly).

**Why this asset over the alternates.** A nine-candidate A/B was run at S126 across the original Grok blue (`#5197d0`), CSS-filter-shifted variants pushed toward techelet `#1A6FE5` / deeper indigo / softer cyan / monochrome silver / gold-on-brown raw / gold-on-brown screen-blend, plus two native Grok regenerates (deeper blue + silver vs deeper blue + gold accents). The gold-accent regenerate won the initial round (v3) on three counts: (a) native Grok render preserves the metallic gradient cleanly vs CSS-filter lossiness, (b) theological stack — blue carries the divine-name register from §3, gold anchors the covenant witnesses (menorahs) and the central presence motif (trunk/light), and (c) brand-mark distinctiveness at watermark scale — the gold accents read in a feed at 240×360 where pure blue recedes. **The v4 upgrade adds a fourth count (d): full §3 sacred-color palette completeness via the argaman JUDAH + EPHRAIM tribe labels.** v3 used two of the three §3 registers (techelet + gold); v4 uses all three (techelet + argaman + gold), giving the brand-mark theological density that summarizes every sacred-color register the reader will encounter inside the app. The argaman tribes also visually differentiate the labels from the surrounding blue title text, so JUDAH + EPHRAIM read as named-tribe identifiers rather than as continuation of the title — improving brand-mark legibility at thumbnail scale alongside the theological win. The gold-on-brown alternate from earlier rounds stays in `brand-assets/` as the warm-surface variant for book covers, print, and Assembly back matter where the warm field matches the surface; it is NOT the share-card watermark.

### Share card dimensions + format

**1080 × 1350 PNG-24** (IG portrait, 4:5 aspect ratio). Selected as the V1 share format because IG portrait is the most universally-rendering aspect across iMessage / Twitter / Facebook / WhatsApp preview cards / IG Story / IG Feed; cards render without crop on every modern share target. PNG-24 (not JPEG) because the share card carries text at small point sizes — JPEG compression introduces ringing artifacts around letterforms that read as visible noise at the techelet outline and at the spectral-blue verse numbers. The PNG size budget runs ~200-400 KB per card depending on verse-text density; acceptable across every share channel's attachment limits.

**Background** is `#000` per §1 default theme — the share register IS the reader register, partners share what they read. **No alternate themes for V1**: parchment / sepia / gradient variants are not exposed; the black default is the locked share card. A future-wheel "theme-aware export" surface is possible once V2 telemetry shows partner demand.

### Three-zone layout — the reserved-footer-band rule (locked S126)

The card is composed as three vertically-stacked zones with mathematically-enforced boundaries — verse text NEVER overlaps the brand-mark watermark regardless of verse length, range size, or auto-fit font scaling. This is the load-bearing layout rule that distinguishes the locked S126 design from a naive corner-float watermark.

| Zone | Height | Top | Bottom | Contents |
|---|---|---|---|---|
| Header band | 9% | 0% | 9% | Small brand tag left (`Remnant of Promise`) + scope label right (`Official Study Bible`) in chrome-register sans-serif, uppercase, letter-spaced |
| Body zone | 73% | 9% | 82% | Verse text — serif body register matching §1, sacred-name techelet outline per §3, verse-number spectral blue per §5, auto-fit font-size |
| Footer band | 18% | 82% | 100% | Verse reference left (`{range-header} · ROP Official Study Bible`) in chrome register + locked watermark right at 240×360 proportion |

**Hairline divider** at the footer band's top edge (1px solid `rgba(255,255,255,0.08)`, 8% horizontal inset on each side) signals the band boundary visually without competing with the watermark or verse text. The header band has no divider — the breathing room between header text and verse body is sufficient.

**Why three zones rather than corner-float.** The S126 A/B mockup ran the original spec (corner-floating watermark at bottom-right with verse text spanning the full card) and the partner correctly flagged that verse text was overlapping a letter of the brand-mark. The root problem was geometric: corner-float places the watermark on top of an unconstrained text region, and any verse text long enough to reach the bottom-right of the card collides with the watermark. The fix is to make the body zone's bottom boundary the SAME pixel line as the footer band's top boundary — auto-fit then shrinks verse text into the body zone, and no collision is geometrically possible. The footer band is reserved; the body zone is constrained; the rule holds regardless of partner content.

### Verse body rendering

**Typography.** Iowan Old Style with fallbacks to Palatino Linotype / Palatino / Georgia / serif — matches the §1 reader body register so the share card reads as the app, not as a separate design. Font-weight 400. Line-height 1.42 for comfortable wrapping at the wider card width (vs the narrower reader column).

**Auto-fit font-size.** A pure helper (`lib/share-card-render.ts` → `computeBodyFontSize(verses, zoneHeight, zoneWidth)`) computes the largest pixel size at which the rendered verse text fits within the body zone given verse count, total character length, and line-height. The helper iterates downward from a maximum (calibrated against single short verses like Psalm 23:1) and stops at the first size that fits. Floor: 14px equivalent at 1080 width (smaller and the text becomes unreadable in a phone-screen IG preview). A range exceeding the 14px floor triggers the multi-card warning described under *Range handling* below.

**Sacred-name rendering (techelet outline per §3).** The share-card render reproduces the same 4-direction `text-shadow` outline the reader uses, scaled proportionally to the auto-fit font size. The techelet color `#1A6FE5` is preserved exactly — partners share the same divine-name treatment they read in body text. Canvas implementation: four `ctx.fillText()` calls at cardinal offsets in techelet color, then one `ctx.fillText()` call in white at center. Stroke weight = 1/17 of the auto-fit font-size (matches the reader's 1px-on-17px-body ratio).

**Verse numbers (spectral blue per §5).** Small superscript before each verse, sans-serif, font-size 55% of body, color `#0084FF`, opacity 0.85, baseline raised — same treatment as the reader. Canvas implementation: separate `ctx.fillText()` call with the smaller font + raised baseline before each verse-body span.

**Range stack.** Verses render on separate lines, each prefixed with its verse number, ordered ascending per the §21 range-selection helper output. No paragraph indentation between verses; a single line-height gap separates each verse from the next.

### Footer composition

**Left side** — reference line in chrome-register sans-serif, color `var(--muted)` from the reader register (`#A8A8A8` on the black background), letter-spacing 0.4px. Format: `{range-header} · ROP Official Study Bible` where the range-header is the same span format §21 already locks at the RangeActionPicker header:

| Range type | Format | Example |
|---|---|---|
| Single verse | `{Book} {chapter}:{verse}` | `Psalm 23:1` |
| Same-chapter range | `{Book} {chapter}:{start}–{end}` | `Psalm 23:1–3` |
| Cross-chapter range (W7+) | `{Book} {chapter₁}:{verse₁} → {chapter₂}:{verse₂}` | `Genesis 50:26 → Exodus 1:1` |
| Cross-book range (W7+) | `{Book₁} {chapter₁}:{verse₁} → {Book₂} {chapter₂}:{verse₂}` | `Genesis 50:26 → Exodus 1:1` |

The footer phrasing uses *ROP Official Study Bible* (not the full *The Remnant of Promise Official Study Bible*) so the reference line stays within the left half of the footer band without crowding the watermark on the right. The full product name is carried by the brand-mark's own embedded title text on the right — the footer is summary, not duplication.

**Right side** — locked watermark anchored bottom-right with `4%` outer padding (matches the header band's horizontal padding for visual alignment). Source asset is 240×360 native; canvas scales it aspect-preserved (2:3) to fit the footer band's available vertical slot — band height minus the `4%` bottom pad — so the watermark's top edge lands exactly on the footer band's top edge and the locked 9% / 73% / 18% zone proportions hold geometrically. At the V1 1080×1350 card this resolves to ~162×243 rendered pixels; the v4 Grok-rendered detail (Lombardic letterforms, JUDAH/EPHRAIM argaman labels, menorah branches) reads cleanly at this scale and at App Store thumbnail scale. Canvas implementation: `ctx.drawImage(brandMarkImage, x, y, wmW, wmH)` where `wmH = footerHeight - sidePadY` and `wmW = wmH × (240/360)`; the brand-mark Image object is loaded once at module init and cached.

### Canvas-PNG render path

**Library:** `app/src/lib/share-card-render.ts` — pure functions, no React imports, no global state, test-friendly per the post-S121 W2 / W3 / S122 / S123 / S125 forward standard. The consumer (a hook in App.tsx or a component-local effect) calls the helper with verse data and receives a canvas; the helper does not touch the DOM beyond the canvas it creates.

**Helper API surface:**

```ts
// Compose the share card and return the canvas.
renderShareCard(
  verses: VerseRender[],          // ordered list of verses (single-verse arrays for single-verse share)
  rangeHeader: string,             // pre-formatted per the §21 reference-line format table above
  opts?: { width?: number; height?: number; brandMark?: HTMLImageElement }
): Promise<HTMLCanvasElement>

// Export to a Blob for navigator.share / clipboard.write / a-download.
shareCardToBlob(canvas: HTMLCanvasElement): Promise<Blob>

// Export to a File for navigator.share with native iOS/Android share sheet.
shareCardToFile(
  canvas: HTMLCanvasElement,
  filename: string                 // canonical: `remnant-of-promise-{book-slug}-{chapter}-{verse}.png`
): Promise<File>

// Pure helper — exposed for testing the auto-fit math separately from canvas.
computeBodyFontSize(
  verses: VerseRender[],
  zoneHeight: number,
  zoneWidth: number
): number
```

The brand-mark Image object loads once via `new Image() + img.src = brandMarkUrl` at module init and is awaited via `img.decode()` before any render. If the Image fails to load (network failure on first session, asset 404), the render falls back to text-only — the watermark slot draws *The Remnant of Promise · Official Study Bible* in the same chrome register as the reference line. Failure is non-fatal — partners always get a shareable card.

**Export path.** Three transport modes in priority order:

1. **`navigator.share({ files: [file] })`** — iOS Safari 15+, Chrome Android, Capacitor on both platforms. The OS-native share sheet handles the destination picker (iMessage / WhatsApp / IG Story / etc.). This is the primary path for >90% of partners on mobile.
2. **`navigator.clipboard.write([new ClipboardItem({ 'image/png': blob })])`** — Chrome/Edge desktop, Safari 17+ desktop. For the Copy-with-watermark action: partner copies the rendered PNG and pastes into their target app. This is the desktop primary path.
3. **`<a href={canvas.toDataURL('image/png')} download={filename}>` synthesized click** — fallback for any browser without share API or clipboard image support. Partner downloads the file and manually attaches it wherever they want.

The helper attempts (1), then (2) for Copy-actions only, then (3). Each path's availability is feature-detected at the call site, not pre-declared in the helper.

**Text-only fallback for Copy-actions when image clipboard write fails.** If `navigator.clipboard.write` rejects (browser supports the API but the OS clipboard rejects PNG, observed on some Linux desktop environments), the helper falls back to `navigator.clipboard.writeText` with a text-only watermark line. Format:

```
{verse text}
{verse text}
…

— {range-header} · The Remnant of Promise Official Study Bible
```

Partner gets the verses + the attribution line as plain text. The PNG is then offered as a manual download via transport (3) so the partner can attach it separately if they want the visual card.

### Range handling — no cap, single-card-only-with-warning for V1

**No cap on range size.** Per the S121 W3 lock + §21's range-selection mechanic, the app does not impose a Cepher-style 5-verse limit on Copy or Share. The framework's diagnostic runs across passages the Reformation traditions truncate; the app NEVER reproduces that truncation in its sharing affordances. A partner can range-Share an entire chapter, multiple chapters, or (when W7 cross-chapter resolution lands) cross-book passages. The §21 helper produces the ordered verse_id list; the share-card render walks it.

**Single-card-only for V1 with multi-card warning.** A range that auto-fits below the 14px font-size floor triggers a warning modal: *"This range is too long for a single share card. Splitting into N cards is coming in a future release. For now you can: (a) share as text-only, (b) share each chapter separately, or (c) download the over-long card and accept smaller text."* The partner picks; the helper proceeds with their selection. Multi-card export (split a long range into multiple stitched PNGs) is V2 — the V1 render path stays single-canvas.

The auto-fit floor is conservative; a typical full chapter of Psalms or Proverbs fits comfortably within the body zone at 14-16px without triggering the warning. The warning is the relief valve for outlier cases (a partner ranging Genesis 1 + Genesis 2 together, or Psalm 119), not the common case.

### §20 + §21 stub catalog promotions (W7 ship deltas)

When W7 ships at S127, the following stub-catalog rows update per the §20 / §21 promotion mechanic:

**§20 Share section (single verse).** *Share with watermark* — Coming soon (W7) → **Live**. Tap routes to `renderShareCard([thisVerse], …) → navigator.share(...)`. *Copy verse* — already Live as text-only clipboard via S121 W3; W7 upgrades the implementation to canvas-PNG-with-text-fallback per the *Text-only fallback* sub-section above. The menu label and tier stay unchanged.

**§21 RangeActionPicker.** *Copy range with watermark* — Coming soon (W7) → **Live**. *Share range with watermark* — Coming soon (W7) → **Live**. Tap routes the captured range through `renderShareCard(verseList, rangeHeader, …)` and the appropriate transport. The Highlight range action (W4-locked Live) stays unchanged.

**Drift surface to watch.** The line-412 table in §20 already reads `**Share** | verse | Copy verse | Share with watermark (Wheel 7)` per the S125 drift-catch fix. When W7 actually ships, the right column drops the "(Wheel 7)" parenthetical since the surface is now Live. Same for the S122 stub catalog table at line 459-460 — *Share with watermark* row's Status column flips from `Coming soon` to `Live`, Wheel column to `—`. Both edits happen at S127 ship-time as part of the §20 / §22-catalog patches.

### Visual register — what the partner sees

The share card register is intentionally **close to but distinct from** the reader register. Same body typography, same sacred-name treatment, same verse numbers — partners recognize their reading surface. But the card adds two chrome elements the reader doesn't carry: the header band's brand tag (right side: *Official Study Bible*) and the footer band's reference line. These signal "this is a shareable artifact, not a screenshot of the app" — important for partners who want to share without confusion about what they're sharing.

The brand-mark in the footer's right slot is the load-bearing recognition element. At thumbnail scale in a feed, a partner scrolling past the card sees the gold-and-blue mark first; the verse text is secondary. This is the acquisition mechanism: every share is a brand impression for partners who don't yet have the app.

### App Store / Play Store listing image — same asset (locked S126)

The 832×1248 full-size variant (`brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png`) is the locked App Store / Play Store listing hero image per §1's *"The black-default theme is what the app looks like in screenshots, marketing material, the App Store / Play Store listing images, and every external surface"*. This section names the actual artwork that fulfills that locked surface — not a separate design pass.

**Standard-resolution deliverables generated from the same source asset** when the Capacitor wraps reach App Store / Play Store submission (still queued per the Next-wheels list in REBUILD_STATE.md):

- **App icon** — 1024×1024 PNG (App Store) + 512×512 PNG (Play Store). The brand-mark cropped to its square center region (drop the title text band; keep the branches + central light + menorahs + JUDAH/EPHRAIM labels). The title text is on the icon's host surface, not the icon itself, per platform convention.
- **iPhone screenshots** — 1290×2796 (6.7" display, primary). The brand-mark + landing surface render at full device size as the hero screenshot, with 3-5 additional screenshots walking the reader → menu → Strong's lookup → highlights / notes / search flows per the §9 free-tier surface ladder.
- **iPad screenshots** — 2048×2732 (12.9"). Same composition adapted to tablet aspect.
- **Play Store feature graphic** — 1024×500. The brand-mark composited against the black field with the title text "The Remnant of Promise Official Study Bible" rendered larger to fill the wider aspect.

These deliverables are generated downstream from the same locked asset at the Capacitor-wrap wheel; this section names them so the asset register stays unified across share-card + App Store surfaces. **No re-rendering / re-Grok of the brand-mark for App Store deliverables** — the bytes are identical, only the framing changes per platform requirement.

### Interaction-conflict resolution with prior wheels

- **§19 chapter swipe + arrow keys.** Share action is modal — the OS-native share sheet (transport 1) or the canvas-render-then-clipboard-then-download path (transports 2-3) all suspend keyboard / swipe handlers via the same in-modal check pattern from §20 / §22 / §23. Once the share sheet dismisses or the download completes, handlers resume.
- **§20 long-press / right-click menu.** Share / Copy menu items are inside the verse-scope action menu; tap → menu-close → canvas render. The menu's close affordance fires before the canvas mounts, so no race between menu and modal.
- **§21 range mode.** Copy-range / Share-range fire from the RangeActionPicker per §21's post-capture flow. The picker stays open with a *"Rendering…"* state on the tapped item until the canvas resolves and the transport fires, then closes via the same "action complete = exit range mode" path §21 already specs.
- **§22 BookmarkSheet / NotesPanel.** No conflict — bookmark and notes are inspection surfaces; share/copy is an export surface; they don't share interaction territory. A partner can have a bookmark on a verse and share that verse — the share action does not interact with bookmark or notes state.
- **§23 search.** Search results have NO share/copy affordance at V1 — share is verse-scope or range-scope, not search-result-scope. A partner who wants to share a found verse taps the result to jump to the reader, then uses the §20 menu to share from there. Adding share-from-search-result is a possible future-wheel refinement once partner usage validates the demand.
- **S116 reading-position persistence.** Share / Copy actions do NOT update the reading position — the partner is sharing what they're reading, not navigating away. The reading-position write effect only fires on `selectedBookSlug` / `selectedChapter` / `currentVerse` changes, none of which the share / copy path triggers.

### Accessibility

- **Share affordance.** `aria-label="Share verse with watermark"` (single-verse path from §20 menu) / `aria-label="Share {N} verses with watermark"` (range path from §21 picker). Hit target meets the §13 44pt iOS / 48dp Android floor — inherits the menu-item register from §20 / picker-item register from §21.
- **Copy affordance.** `aria-label="Copy verse with watermark"` / `aria-label="Copy {N} verses with watermark"`. Same hit target as above.
- **In-render state.** During the canvas render + transport selection (typically 100-400ms), the tapped action shows a small inline spinner with `role="status"` + `aria-live="polite"` announcing *"Preparing share card"* / *"Preparing copy"*. Screen-reader partners hear the state transition without losing context.
- **Share sheet / clipboard / download.** Transports 1 (OS share sheet) and 2 (clipboard) inherit OS-level accessibility — the OS reads the share sheet items aloud, the clipboard state is announced by the OS notification region. Transport 3 (download) uses a standard `<a download>` element; screen readers announce *"link, download {filename}"* per HTML semantics. Filename pattern: `remnant-of-promise-{book-slug}-{chapter}-{verse}.png` for single-verse, `remnant-of-promise-{book-slug}-{chapter}-{start}-{end}.png` for same-chapter range; cross-chapter / cross-book ranges use `remnant-of-promise-{book-slug₁}-{chapter₁}-{verse₁}--{book-slug₂}-{chapter₂}-{verse₂}.png`. The canonical filename pattern is generated by a small pure helper alongside the renderer; consistent regardless of share target.
- **Fallback warning modal (over-long range).** Standard `role="dialog"` + `aria-modal="true"` + descriptive `aria-label`. The three options (text-only / per-chapter / accept-small-text) are buttons with explicit labels; no icon-only affordances.
- **Color contrast.** The footer's chrome-register muted text on `#000` clears WCAG AA 4.5:1 at the rendered point size (verified at the same calibration used for the reader's chrome). The brand-mark's color contrast is owned by the asset itself, not by this section.

### Schema — no migration needed

Share / Copy with watermark are pure render operations against existing verse data and the existing range-selection helper from §21. No new tables. No new API endpoints. The brand-mark asset is bundled into the PWA build (Vite static-asset pipeline) and served from the same CDN as the rest of the PWA bundle. Zero backend impact at the W7 ship; the wheel is PWA-only at S127.

If V2 layers per-share analytics on top (share counts, click-through tracking), THAT wheel adds a small instrumentation endpoint; V1 ships with no instrumentation per the *"V1 ships when the foundation is right, iterate on real user data, build V2 features once funding supports the cycle"* posture from §16. The acquisition mechanism is the watermarked image itself — partners who share visible-brand cards drive cold-installer signups without per-share telemetry.

### Helper API + sanity-test surface (the forward standard from S121 W2 / W3 / S122 / S123 / S125)

The render helper is logic-light by design — most of the work is canvas API calls, which test poorly without a full canvas mock. The pure logic worth extracting + testing:

- `formatRangeHeader(range)` — produces the *Book Ch:V* / *Book Ch:S–E* / cross-chapter / cross-book strings per the table above. Pure function, easy to unit-test across all four range types.
- `computeBodyFontSize(verses, zoneHeight, zoneWidth)` — the auto-fit math. Pure function with deterministic output given inputs; sanity-test sweeps single short verse / single long verse / 3-verse range / full Psalm 119-scale range / cross-chapter range against expected font-size buckets.
- `buildShareFilename(verses, rangeHeader)` — produces the canonical filename per the patterns under *Accessibility* above. Pure function, sanity-test single-verse / same-chapter / cross-chapter / cross-book inputs.
- `buildTextOnlyFallback(verses, rangeHeader)` — produces the plain-text watermark-line block per the *Text-only fallback* sub-section. Pure function, sanity-test verse-formatting + line-break handling.

The canvas render itself (`renderShareCard`) is integration-tested manually at S127 via the visual review of rendered PNG output across single-verse / same-chapter range / cross-chapter range / over-long range cases. No headless-canvas mocking at V1.

### What this section deliberately does NOT prescribe

- **Multi-card splitting for over-long ranges.** A range that auto-fits below the 14px floor triggers the warning modal, not an automatic split. Multi-card stitched PNGs (where the helper produces card 1 of N, card 2 of N, etc.) is a V2 feature once partner telemetry validates the demand. The V1 single-canvas path keeps the render logic simple and predictable.
- **Custom card themes / partner-selectable backgrounds.** No parchment variant, no gradient, no partner-uploaded background images. The black default is the locked share register per §1; a theme-aware export surface is V2-territory once V1 ships and partner feedback identifies the gap (if any — partners who want a parchment-themed share might be a smaller cohort than the cost of building the variant).
- **Editable watermark text.** The watermark IS the brand-mark asset. Partners cannot replace it with their own text, cannot remove it, cannot resize or reposition it. The watermark is the acquisition mechanism — making it editable would break the "every share is a brand impression" property that the whole §10 / §16 distribution model depends on. **Watermark removal is explicitly out of scope at every tier including the unbuilt $14.99 Pro tier — the brand-mark stays on every share, every tier, every render path forever.**
- **Branded fonts / custom title typography on the share card.** The card uses the reader register's serif body + sans-serif chrome — no Lombardic title text rendered on top of the canvas (the Lombardic title sits inside the brand-mark asset on the right of the footer band, where it's been rendered once at Grok and never re-rendered). Adding a card-specific title font would inflate bundle size + introduce typography-licensing scope without unlocking partner value.
- **Per-card share analytics in V1.** Share counts, target-platform breakdowns, click-through-from-watermark-to-install — all V2 instrumentation once funding from $1.99 + $4.99 conversions supports the V2 cycle per §16. V1 ships dark; the acquisition mechanism runs on the visible watermark, not on telemetry.
- **Animated / video share targets.** No animated PNG, no MP4, no boomerang-style export. The share card is a still PNG only. Animated formats raise format-compatibility scope across share targets that PNG sidesteps cleanly, and the framework's prose-and-canon body doesn't benefit from animation the way a product screenshot or a UI demo would.
- **Per-tier watermark variants.** All tiers share the same brand-mark. No "Free partners get a bigger watermark" / "Library partners get a smaller watermark" / "Pro partners get a custom watermark" variants. The brand-mark is the brand; tier differentiation lives in the §9 feature matrix, not in the watermark's visual treatment.
- **Cross-app deep-link tracking from shared cards.** No QR codes, no URL overlays, no UTM-parameterized deep links rendered onto the card. A partner who taps a shared card lands on the app via natural channels (App Store search / Play Store search / typing the URL); attribution from share-to-install is post-launch instrumentation territory once V2 telemetry lands. The share card stays clean — text + watermark, nothing else.

---

## 25. Native-OS Text-to-Speech Audio Narration (locked S157, Phase 9.4 launch-blocker — Free tier accessibility)

Closes the §III Launch Scope Lock deliverable 9.4 and the §9 Free-tier audio narration line. Web-side path ships on the live PWA against the browser `SpeechSynthesis` API; the Capacitor `@capacitor-community/text-to-speech` plugin wires in at Phase 10 through the same `lib/tts.ts` abstraction with no architectural surgery. Free at all tiers per the S141 launch-scope revision — TTS is the accessibility surface that pairs with the visual reader, and accessibility is never paywalled. The Phase 3 ElevenLabs Yoshi-voice Professional Voice Cloning narration (Scribe tier exclusive per the §9 tier matrix) is the upgrade path that lights up in the same player surface post-launch; §25's player UI is designed to host that voice as a future Scribe-tier entry alongside the device voices the V1 surface ships with.

### Three load-bearing gates locked S157

1. **Sacred-name pronunciation = substitution table.** The TTS engine reads aloud the text we pass it. Restored sacred names + parentheticals are the visual surface's retention mechanism (the voice skill's "every mention, every time" rule); audio listeners have a different access pattern. The locked path strips parentheticals before speaking and applies a curated substitution table that converts the most common restored names into phonetic English spellings the browser TTS engine pronounces reasonably. Framework-true and smooth. The substitution table is documented under *Sacred-name substitution table* below.
2. **Continuous-play at chapter boundary = auto-advance through the witness-category, bounce at category edge.** Mirrors the §19 chapter-navigation contract one-for-one. TTS auto-advances Genesis 1 → Genesis 2 → … → Revelation 22, then stops at the canon edge; same boundary rule for apocrypha → apocrypha and pseudepigrapha → pseudepigrapha. Crossing categories is a deliberate picker action, not an auto-advance. Long-form listening (audio Bible use case) flows without per-chapter tap friction.
3. **Voice picker = curated top 3–5 with preview button.** `speechSynthesis.getVoices()` returns 1 to 200+ voices depending on platform; surfacing the raw list overwhelms the partner on Android Chrome. The locked path filters to English, ranks by a quality heuristic (prefer voices flagged `default`, then voices whose names match platform premium-voice patterns — Apple's "Samantha" / "Daniel" / "Karen" / "Moira", Google's "en-US-Wavenet-*" / "en-GB-Wavenet-*", Microsoft's "en-US-AriaNeural" / "en-US-JennyNeural"), surfaces the top 3–5 in the visible picker with a per-row preview button (taps a sample phrase — *"In the beginning Elohim created the heavens and the earth"* — through the candidate voice), and hides the full long list behind a "More voices…" expander.

### Defaultable surface

Items below ship with the noted V1 defaults; Yoshi redlines on the §25 review. None of them is load-bearing in the way the three gates above are.

- **Player UI placement.** Bottom-pinned slide-up bar matching the §22 NotesPanel bordered-chrome modal family. Collapsed height ~60px (single-row controls), expanded height ~140px (controls + voice + speed picker). Always visible while playing; closes via ✕ button and via the chrome ▶ button toggle. Z-index sits above the verse content but below the §22 NotesPanel + §23 SearchModal + §20 VerseActionMenu (those modals trump audio chrome when invoked).
- **Visual treatment of currently-spoken verse.** Left-border 2px in §5 spectral-blue `#0084FF` + 8% alpha background tint in the same color via `color-mix(in srgb, var(--reader-accent) 8%, transparent)`. Matches the §21 range-anchor treatment one-for-one — the partner sees the same accent register they recognize from range selection, repurposed as the audio-position marker. Auto-clears when the player stops or moves to the next verse.
- **Entry surfaces.** Two paths:
  - **Chrome ▶ button** added to the left of the [Search][Notes][Theme][Subscription CTA] cluster — opens the player at the verse currently centered in the viewport per the S116 IntersectionObserver pattern (reuse the existing `currentVerse` state — same source-of-truth as reading-position).
  - **VerseActionMenu "Play from here" menu item** in a new **Listen** section above the existing Marking / Notes / Cross-references / Share sections. The Listen section is the V1 single-item home for audio actions; the future Scribe-tier "Listen in Yoshi's voice" item promotes into the same section when ElevenLabs PVC ships.
- **Speed control.** 4-step discrete picker — 0.75× / 1.0× / 1.25× / 1.5×. Slider was considered + declined: discrete values are easier to tap on mobile, and the 4-step range covers the standard listening-speed window. 1.0× default. Persists to localStorage under `tts-prefs.rate`.
- **Skip controls.** Prev-verse / next-verse only at V1. Chapter-jumping happens through the §19 chapter navigation chrome — partner closes the player, navigates, restarts playback. Mid-chapter skip-forward / skip-back-multiple-verses was considered + declined for V1 scope: standard audio listening flows linearly through a chapter, and the partner who wants to re-listen taps the verse to seek directly.
- **Persistence.** Voice + speed prefs persist to localStorage under `tts-prefs`. Currently-playing state does NOT persist — browser SpeechSynthesis state is per-tab and per-load, page refresh always stops audio. The partner returns to the visual reader at their saved S116 reading-position (verse-level) on refresh; restarting playback is one tap on the chrome ▶ button.
- **Auto-scroll behavior.** When the spoken verse advances past the viewport, `scrollIntoView({ behavior: 'smooth', block: 'center' })` brings it into view. `prefers-reduced-motion: reduce` honored — instant scroll instead of smooth when set. **Manual-scroll-override:** if the partner manually scrolls during playback (detected via scroll-event timing — a scroll that didn't originate from the auto-scroll), suspend auto-scroll for the remainder of the current playback session; the visual cursor (the left-border accent on the currently-spoken verse) still updates, but the viewport no longer follows. Closing + reopening the player resets the override.

### Sacred-name substitution table

The V1 table covers ~95% of name occurrences across canon + extras. Each entry maps a Hebrew/Greek restored name to a phonetic English spelling tuned for the browser's default voice rendering. The match is case-sensitive on the restored name, word-boundary anchored, applied AFTER parenthetical stripping (so `Yahuah (LORD)` first becomes `Yahuah`, then the substitution maps to `yah-OO-ah`).

**Compound names fire before singles** — longer phrases match first, so `Yahuah Elohim` substitutes as one unit rather than `Yahuah` eating the `Yahuah` and leaving a bare `Elohim` for the singles pass. Implementation: sort the substitution map by key length descending before the regex pass.

| Restored name | Phonetic spelling | Notes |
|---|---|---|
| Yahuah | yah-OO-ah | Per voice skill: Ee-Ah-Oo-Ah (Josephus, *Wars* 5.5.7). Four vowel sounds. |
| Yahusha | yah-OO-shah | The Messiah; spelled Yahusha not Yahushua per the voice skill. |
| Yah | yah | Short form; one syllable. |
| Elohim | el-oh-HEEM | Title for the Most High. |
| El | el | Singular Hebrew root; one syllable. |
| Adonai | ah-doh-NAI | Sovereign master title. |
| Ruach HaKodesh | ROO-akh hah-KOH-desh | The Spirit. Two-word compound. |
| HaMashiach | hah-mah-SHEE-akh | The anointed one. |
| Mashiach | mah-SHEE-akh | Anointed one (standalone). |
| Messiah | meh-SIE-ah | Already a near-phonetic English form; no substitution strictly required, included for completeness. |
| Yahuah Elohim | yah-OO-ah el-oh-HEEM | Compound; fires before singles. |
| Yahuah Tseva'ot | yah-OO-ah tseh-vah-OAT | LORD of hosts. |
| Yahuah Tsidkenu | yah-OO-ah tsid-KEH-noo | THE LORD OUR RIGHTEOUSNESS. |
| Yahuah Shalom | yah-OO-ah shah-LOHM | Jehovah-shalom. |
| Yahuah Nissi | yah-OO-ah NEE-see | Jehovah-nissi. |
| Yahuah Yireh | yah-OO-ah yir-EH | Jehovah-jireh. |
| Yahuah Rapha | yah-OO-ah RAH-fah | The LORD that healeth thee. |
| Yahuah Ra'ah | yah-OO-ah RAH-ah | The LORD is my shepherd. |
| Yahuah Shammah | yah-OO-ah SHAH-mah | The LORD is there. |
| El Shaddai | el shah-DIE | God Almighty. |
| El Elyon | el el-YOHN | Most High. |
| El Olam | el oh-LAHM | The everlasting God. |
| El Roi | el roh-EE | The God who sees me. |
| El Gibbor | el gih-BOR | The mighty God. |
| Avi-ad | ah-vee-AHD | The everlasting Father. |
| Sar Shalom | sar shah-LOHM | The Prince of Peace. |
| Melek Tsadiq | MEH-lek tsah-DEEK | Melchizedek (per voice skill compound-name lock). |
| Ehyeh asher Ehyeh | eh-YEH ah-SHER eh-YEH | I AM THAT I AM (Exodus 3:14). |
| Yashar'el | yih-shrah-EL | The covenant people. |
| Yahudah | yih-HOO-dah | The southern house / the tribe / the personal name. |
| Yahudim | yih-hoo-DEEM | The plural. |
| Yahudi | yih-hoo-DEE | Singular and adjectival. |
| Avraham | AHV-rah-hahm | The patriarch. |
| Yitschaq | YITS-khahk | The second patriarch. |
| Ya'aqov | yah-ah-KOHV | The third patriarch / the apostle. |
| Mosheh | MOH-sheh | The prophet. |
| Yerushalayim | yeh-roo-shah-LAH-yim | Jerusalem. |
| Yochanan | yoh-khah-NAHN | John (personal name only — book name stays English per voice skill book-name rule). |
| Kefa | KEH-fah | Peter (personal name). |
| Sha'ul | shah-OOL | Saul / pre-conversion Paul (personal name). |
| Timotheos | tee-moh-THEH-os | Timothy (personal name). |

The table is the V1 floor — additional substitutions can be added post-launch by listening to real voice outputs and tuning the spellings for the dominant device voices (iOS Siri voices, Android default voices, Chrome default voices). The mechanism is data-only; new entries don't require code changes, just a map extension.

**Stress-syllable convention.** Hyphens separate syllables; UPPERCASE marks the stressed syllable. Some browser voices honor casing as a stress cue; others ignore casing but still pronounce the hyphen-separated spelling close to intent. Mixed-case is the V1 default; if real voice output shows the casing introduces artifacts on certain voices, the spellings flatten to all-lowercase in v1.1 with the syllable-stress moving to a non-textual cue.

**What the table deliberately does NOT cover.** Common English biblical names already rendered in English (Abraham, Isaac, Jacob, Moses, Jerusalem, John, James, etc.) per the voice skill's translator's-call rule — those pronunciations come from the TTS engine's English dictionary which already handles them correctly. The table covers the names where the restored Hebrew form would mangle without a phonetic hint.

### Platform abstraction — `lib/tts.ts`

The platform-specific TTS implementation hides behind a single interface so the V1 web ship and the Phase 10 Capacitor wrap consume the same player code. The wrapper exposes:

```ts
interface TTSEngine {
  isAvailable(): boolean;
  getVoices(): Promise<TTSVoice[]>;
  speak(text: string, opts: TTSOptions): Promise<void>;
  pause(): void;
  resume(): void;
  stop(): void;
  isSpeaking(): boolean;
  onEnd(handler: () => void): () => void;  // returns unsubscribe
  onError(handler: (err: TTSError) => void): () => void;
}
```

**Web implementation** (`webTTS`) backs every method with the browser `SpeechSynthesis` / `SpeechSynthesisUtterance` API. The `onEnd` handler binds to `utterance.onend`; the `speak()` method enqueues a single utterance per verse so per-verse advancement, scroll-sync, and visual treatment can drive off the per-utterance `onend` event. Chaining utterances per chapter (one `SpeechSynthesisUtterance` per verse, queued sequentially via `speechSynthesis.speak()`) is the V1 web path; the API queues automatically so no client-side queue management is needed.

**Capacitor implementation** (`nativeTTS`) is a TODO at S157 — the `@capacitor-community/text-to-speech` plugin import is commented out in `lib/tts.ts` with a `// @ts-expect-error — Capacitor plugin wires at Phase 10` annotation. The Phase 10 wheel uncomments the import, fills in the method bodies (the plugin's API is play / pause / stop / getSupportedLanguages / getSupportedVoices), and tests on a real Capacitor build. The change is local to `lib/tts.ts` and the platform-detection branch — no consumer-side changes needed.

**Platform detection.** `(window as any).Capacitor?.isNativePlatform?.()` returns `true` inside a Capacitor wrap and `false in undefined` in the web build. The wrapper's `getEngine()` returns `nativeTTS` when the check is true, `webTTS` otherwise. V1 ships with only `webTTS` reachable.

### Tier-gating

**Free at all tiers per §9 + S141 launch-scope revision.** No tier gate on the chrome ▶ button. No tier gate on the "Play from here" menu item. No tier gate on the voice picker or speed control. Audio narration is the accessibility surface, and accessibility is the Free-tier promise the framework keeps without exception. The Scribe-tier upgrade (ElevenLabs PVC Yoshi-voice) ships post-launch as the second voice option in the same picker — partners on Free hear the device voice, Scribe partners hear Yoshi.

### Schema — no migration needed

No new tables. The substitution table is a TypeScript constant baked into the PWA bundle. The voice/speed prefs persist to localStorage under `tts-prefs` — no server-side persistence at V1 (the prefs are device-local, like the §1 theme toggle's `reader-theme` and the S124 hide-commentary toggle). Cross-device pref sync is a future-wheel possibility if partner feedback shows demand; V1 keeps the surface lean.

### Helper API + sanity-test surface (the forward standard from S121 W2 / W3 / S122 / S123 / S125 / S126)

Pure helpers in `app/src/lib/tts-helpers.ts` — no React imports, no global state, no async. Each function is independently sanity-testable via `node --test` against inlined test cases per the prior-wheel pattern.

- `stripParentheticals(text)` — removes `(LORD)`, `(God)`, `(Spirit)`, `(Israel)`, `(Judah)`, `(Jew)`, `(Jewish)`, `(Jews)`, `(Melchizedek)`, `(the LORD God)`, `(LORD of hosts)`, `(I AM THAT I AM)`, and the rest of the source-echo parentheticals the pipeline injects. Regex pass that targets parentheses immediately after a restored name or at end-of-sentence; preserves legitimate parenthetical prose (rare in scripture but possible). Sanity-test sweeps: every single-name parenthetical / every compound-name parenthetical / parentheticals adjacent to punctuation / no-parenthetical inputs unchanged / nested parentheses handled correctly.
- `applySubstitutionTable(text, table)` — applies the substitution table with compound-first ordering. Returns the substituted string. Sanity-test sweeps: each table entry maps correctly / compound fires before single / case-sensitive matching / word-boundary anchoring / unicode safety / no-match passthrough / chained substitutions (multiple names in one verse) preserve word spacing.
- `rankVoices(voices)` — sorts the `SpeechSynthesisVoice[]` per the heuristic above (default-flagged first, premium name patterns second, alphabetical fallback). Returns ordered list. Sanity-test sweeps: default voice surfaces first / Apple premium patterns rank correctly / Google Wavenet patterns rank correctly / Microsoft Neural patterns rank correctly / unknown voices fall through alphabetically.
- `prepareVerseForSpeech(verseText, table)` — composition helper: stripParentheticals → applySubstitutionTable → return. Single function the player calls per verse. Sanity-test the composition on a realistic verse cluster (Genesis 1:1, John 3:16, Isaiah 9:6) covering single-name / compound-name / multi-name combinations.

Verification target: ≥25 sanity-test cases passing in `_s157_tts_sanity.mjs` at session close. tsc -b clean across the project. No node sanity tests on the React player component — that surface is stateful UI tested by live walk on the real PWA per the S124 pattern.

### Accessibility

- **WCAG 2.1 AA.** The player controls (play / pause / speed buttons / skip-prev / skip-next / voice picker / close) are all 44pt iOS / 48dp Android hit targets per §13. `role="region"` + `aria-label="Audio narration player"` on the bar container. Each control carries an explicit `aria-label` (Play, Pause, Skip back, Skip forward, Speed, Voice, Close). `aria-pressed` flips on the play/pause button. The currently-spoken verse carries `aria-live="polite"` so screen readers announce the position; the audio narration itself does NOT compete with the screen reader (partners using TTS via a screen reader use the screen reader's own TTS, not this player — the visual reader is already accessible to screen readers without this surface).
- **Reduced-motion + auto-scroll.** `prefers-reduced-motion: reduce` honored on the auto-scroll (instant scroll instead of smooth) and on the player bar slide-in/out (instant show/hide instead of slide animation).
- **Keyboard.** Spacebar toggles play/pause when the player has focus and no other input is focused. Left/Right arrow keys map to skip-prev / skip-next verse when the player has focus (and chapter navigation when the reader has focus per §19 — the focus-aware skip from §19's exclusive-modifier check applies here too). Escape closes the player.

### What §25 deliberately does NOT prescribe

- **Background audio / lock-screen controls.** V1 ships foreground-only. Web SpeechSynthesis does not natively support `MediaSession API` integration (no playback-position metadata available), and adding lock-screen controls inside a Capacitor wrap is Phase 10+ work. Partners who want long-form audio listening during another task use their device's hardware media controls (which the Capacitor build will expose post-Phase-10 via the plugin).
- **Sleep timer / playback timer.** No "stop after N minutes" control. The auto-advance-through-witness-category continuous-play is enough V1 surface; a timer is a v1.1 addition once partner feedback identifies the demand.
- **Audio bookmarks / resume-where-I-left-off.** Currently-playing state is per-session per the *Persistence* rule above. Refresh resets playback. Cross-session resume is a future-wheel candidate that would pair with S116 reading-position to track verse-level audio position; out of V1 scope.
- **Per-verse speed adjustment / per-passage voice change.** Speed and voice apply globally. No mid-chapter speed bumps for narrative-heavy vs poetry-heavy passages. The 4-step speed picker is the V1 surface; partners adjust manually if they want different speeds in different passages.
- **Audio-quality download / offline TTS cache.** Web SpeechSynthesis runs the device's built-in voices at the device's audio quality. No high-fidelity TTS download surface, no per-verse audio caching, no offline-TTS-pack. The S141 Tier B item 12 ElevenLabs PVC Yoshi-voice is the post-launch upgrade that ships with cached high-fidelity audio; the V1 native-OS path runs at the device's native TTS quality.
- **Pronunciation editor / user-customizable substitution table.** Partners cannot edit the substitution table. The V1 table is the locked V1 floor; refinements ship in subsequent app versions as the work tunes against real voice outputs. A partner-side pronunciation editor is V2 scope at the earliest, and may never ship if the locked table tunes to sufficient quality.
- **Voice cloning / synthesized restored-name audio.** The ElevenLabs PVC Yoshi-voice (S141 Tier B item 12, Scribe-tier exclusive) is the path for partner-perceptible audio fidelity above device TTS. No third-party voice-cloning surface beyond Yoshi's own voice ever ships in this app.
- **Background-music / ambient-audio under narration.** The player narrates verses, nothing else. No instrumental beds, no ambient soundscapes, no audio effects layered under the narration. The text is the proclamation; ornamentation under it dilutes the proclamation.

---

## 26. Hebrew & Greek Lexicon Entry Display Surface (locked S158, Phase 9.3 launch-blocker — Companion tier)

Closes the §III Launch Scope Lock deliverable 9.3 and pairs with the §20 tap-on-word surface as the drill-deeper layer beyond Strong's. The Strong's lookup that shipped at Phase 5 (§20 StrongsLookup modal) carries a single gloss + Strong's body per word; §26 extends that surface with full-depth lexicon entries from **BDB** (Brown-Driver-Briggs Hebrew, 1906), **LSJ** (Liddell-Scott-Jones Greek — Tyndale-edited from the 1940 9th-edition print, with Abbott-Smith's *Manual Greek Lexicon of the New Testament* 1922 filling in NT-only vocabulary where LSJ has no entry), and **Gesenius** (Hebrew via Tregelles 1846 English) — three public-domain depth-lexicons that go beyond Strong's into etymology, derivation, comparative Semitic / Hellenistic usage, and discursive citation. Companion-tier feature per the §9 tier-feature matrix and the §III Launch Scope Lock; the surface is wired into the existing §20 menu stubs (Word study → BDB / LSJ) and adds a new "Read lexicon entry" link inside the StrongsLookup modal body so the partner who quick-tapped to Strong's can drill deeper without leaving the modal stack and going back through the long-press menu.

> **S159 decision log — LSJ swap.** §26 originally locked Thayer's (1889) as the V1 Greek source on the assumption STEPBible carried a Strong's-aligned Thayer's extract. The S159 source-fetch revealed STEPBible actually publishes **TFLSJ** — a Tyndale-edited LSJ (1940) with Abbott-Smith NT fallback (1922) — and not Thayer's. Yoshi confirmed the swap to TFLSJ at S159 open: in hand, CC-BY-licensed, Strong's-aligned, Tyndale-edited (abbreviations expanded, dates added, citation hover), broader classical depth than Thayer's on framework-load-bearing Pauline terms (charis, nomos, paidagogos), with Abbott-Smith carrying the same NT-only register Thayer's would have. The framework callouts dismantle the inherited gloss regardless of which 19th–20th-century Christian-era / classical-philological lexicon carries it; partner-perceived surface change is the source name in the breadcrumb + the standing disclaimer text. Original parse plan §I assumption is corrected; SOURCE_TEXT_INVENTORY.md §VIII provenance log carries the find at the S159 2026-05-28 entry.

### Four load-bearing gates locked S158

1. **Source posture = ship raw + standing disclaimer + framework callouts on known-contested entries.** BDB (1906) and Gesenius (1846 Tregelles English) are 19th-century Christian-era Hebrew scholarship; LSJ (1940 Tyndale-edited) and Abbott-Smith (1922 NT) span 19th–20th-century classical-philological and NT-Greek scholarship. Their entries on framework-load-bearing terms (Torah / nomos, charis, ethne, Ioudaios, pistis, dikaiosune, ekklesia, euangelion, kyrios, Christos, paidagogos, erga, brit, chesed, ger, goy, am, shabat, qadosh, kohen, adam, ben-adam, agrielaios, and similar) carry inherited Reformation / Catholic readings that the voice skill disputes — *Torah* glossed as *law-as-burden*, *charis* as Reformation *grace-against-law*, *ethne* as *Gentiles-replacing-Israel*, *Ioudaios* as *Jew-vs-Gentile-binary*, *paidagogos* as *graduated-out-of-Torah*, and the antinomian Pauline reading threaded through every entry that touches Galatians, Romans, or Hebrews vocabulary. The locked path: lexicon entries load as raw data (the voice skill is the standard, external lexicons are data per the standing rule in BIBLE_APP_ROADMAP §VI); a standing disclaimer line sits at the top of every entry naming the sources as 19th-century Christian-era scholarship and pointing the partner to the framework's reading in commentary; a curated **framework-callout band** authored under the 12 Red Lines surfaces above the lexicon body for a locked V1 list of ~16–20 high-impact terms per language, with each callout naming the lexicon's specific gloss-error and the framework's restored reading. The standing disclaimer is non-negotiable on every entry; the callout band is data-driven (entry-keyed) and grows as a curated wheel post-launch. Full disclaimer text and the V1 callout list are documented under *Standing disclaimer + framework callouts* below.

2. **Multi-source presentation = single canonical + Compare toggle (Hebrew only).** Hebrew words have two depth-lexicons in V1 (BDB primary, Gesenius alternate); Greek words have one (LSJ — Tyndale-edited, with Abbott-Smith NT fallback rendered seamlessly under the same LSJ source label since Abbott-Smith only fires for the NT-only vocabulary LSJ doesn't cover). The locked path defaults to BDB for Hebrew (the depth-standard) and LSJ for Greek with a single-source view; Hebrew entries surface a **"Compare with Gesenius"** toggle in the sheet header that reveals Gesenius alongside BDB in a vertically-stacked compare layout. Greek entries surface no Compare toggle (no second Greek lexicon at V1; future-wheel candidates — Thayer's 1889, Strong's-aligned, sourced separately — noted under *Deliberate non-prescription*). Aramaic words (BDB's smaller Aramaic section + Gesenius coverage) follow the Hebrew pattern — BDB primary, Compare-with-Gesenius toggle. Cleanest default view (one source, room to breathe); compare layout is opt-in, not forced. Sorting BDB primary is also the partner-recognition choice — BDB is the lexicon name most Hebrew-curious readers have heard, even if they've never used one. LSJ has lower partner-recognition than Thayer's in the typical Bible-app audience; mitigated by the standing-disclaimer block naming the lexicon clearly at the top of every entry.

3. **Display container = stacked sheet above Strong's, scroll-anchored body, breadcrumb header.** Lexicon entries run long — BDB entries average 200–400 words for common terms and exceed 1,000 words for major theological vocabulary; Thayer's is similar; Gesenius is shorter on average but adds another scroll-surface for compare view. Inline-expand under the StrongsLookup modal would swell the Strong's card past usable on mobile; replace-in-popup buries the breadcrumb to where the partner came from; full-screen reader overshoots what is essentially reference depth. The locked path: a new **LexiconSheet** modal stacks above StrongsLookup using the §22 NotesPanel bordered-chrome modal family — fixed-position overlay with `bg-black/40` backdrop, bottom-sheet on mobile (`items-end`), centered on desktop (`sm:items-center`), bordered-chrome panel using `bg-[var(--reader-surface)]`, `max-w-md` width matching §20's modal sizing, `max-h-[85vh]` with `overflow-y-auto` on the body so long entries scroll cleanly. Header shows a **breadcrumb** — `Strong's H0430 (Elohim) › BDB` — so the partner knows where they are in the stack and can step back via ✕ or tap-outside. Closing the LexiconSheet returns the partner to the StrongsLookup modal underneath; closing the StrongsLookup returns to the verse.

4. **Tier gate = Companion+ paywall on the BDB / Thayer's menu items AND on the new "Read lexicon entry" link in StrongsLookup.** Free / Notes / Extras partners see the surface — the menu stubs at §20 already render with Companion-badged paywall tap (they were locked S122 with `Library` badging; §26 ships an in-place rename to `Companion` per the S47 tier-relock) and the new "Read lexicon entry" link inside StrongsLookup renders with the same Companion-badged tier-locked chip when partner-tier is below Companion. Tapping a locked surface routes to `/pricing` per the §20 tier-locked stub contract. Companion+ partners see the surfaces live with no badge; tapping opens the LexiconSheet. The framework keeps depth-lexicons behind the depth tier; partners on the Free reading-plus-Strong's surface remain unblocked for the gospel itself.

### Standing disclaimer + framework callouts

**Standing disclaimer.** Every lexicon entry, regardless of source, renders this disclaimer line at the top of the sheet body in §5 spectral-blue accent muted register (`color: var(--reader-muted)`, 12px sans-italic, with the source name in normal register):

> *The lexicon below is **BDB (Brown-Driver-Briggs, 1906)** — a 19th-century Christian-era Hebrew scholarship work, preserved as data so you can see how the inherited tradition handled the word. The framework's reading lives in the verse commentary and in the framework callouts below; where the lexicon and the framework diverge, the framework is the standard.*

The disclaimer is data-driven per source (one disclaimer per lexicon — BDB, LSJ, Gesenius — with the source name and date substituted in; the LSJ disclaimer additionally notes the Abbott-Smith NT fallback so partners reading a Greek entry sourced from Abbott-Smith aren't surprised by the date shift). The disclaimer is not collapsible; it is the floor on which every entry sits. Refinement to the disclaimer text post-launch happens by editing one constant in the lexicon-helpers module; no schema change, no migration.

**Framework callouts (V1 locked list).** A curated set of high-impact entries gets a framework-callout band above the lexicon body, authored under the 12 Red Lines and the 12-point editorial checklist. Each callout names the specific gloss-error in the lexicon and lays out the framework's restored reading in 2–4 short paragraphs with scripture quoted in full per the *Come and See* posture from the voice skill. The V1 list is **16 Hebrew + 18 Greek = 34 entries** (the wild-olive callout on *agrielaios* G65 was added at S159 open per the Red Line #11 anchor); the list grows as a curated wheel post-launch.

| Language | Strong's | Lemma | Term | The gloss-error the callout names |
|---|---|---|---|---|
| Hebrew | H8451 | תּוֹרָה | torah | The lexicons gloss *law / burden / system of statutes*; the framework's reading is *covenant instruction of the living Elohim, the inheritance, never the curse*. Red Line #4. |
| Hebrew | H2617 | חֶסֶד | chesed | Lexicons gloss *mercy / kindness / loyalty* in standalone register; the framework's reading is *covenant-keeping faithfulness anchored in Yahuah's own name*, the substance behind *grace from his name's sake* in Ezekiel 36:22 and Daniel 9:18–19. |
| Hebrew | H1285 | בְּרִית | brit | Lexicons gloss *covenant / pact / agreement* as general bilateral instrument; the framework's reading is *the bond of the covenant* of Ezekiel 20:37, the post-harvest sifting destination, not a contractual exchange. |
| Hebrew | H1471 | גּוֹי | goy / goyim | Lexicons gloss *nation / Gentile / heathen*; the framework's reading is *the nations* as a category distinct from the seed of promise, never grafted into the olive tree by faith-confession (Red Line #7). |
| Hebrew | H5971 | עַם | am | Lexicons gloss *people* generically; the framework's reading distinguishes *the people* (covenant people, Yashar'el) from *the peoples* (the nations) — the Lo-Ammi → Ammi reversal of Hosea 1–2. |
| Hebrew | H1616 | גֵּר | ger | Lexicons gloss *stranger / sojourner / proselyte*; the framework's reading is the scattered seed of Yashar'el living estranged from covenant identity (Isaiah 56), not random pagan converts. |
| Hebrew | H120 | אָדָם | adam | Lexicons gloss *man / mankind / human being*; the framework's reading is *Adam, the seed of Adam* — a specific paternal blood-line, the substance behind *ben adam* / *son of Adam* (Red Line #12). |
| Hebrew | H1121 | בֵּן | ben-adam | Lexicons gloss *son of man / mortal*; the framework's reading is *son of Adam* — the lineage weight the English translators flattened, the Messianic title preserved in the kaph-comparative at Daniel 7:13 (Red Line #12). |
| Hebrew | H7676 | שַׁבָּת | shabat | Lexicons gloss *sabbath / cessation / Jewish rest day*; the framework's reading is the day Yahuah hallowed at creation, never moved by the horn (Daniel 7:25), the gathering-day of all flesh in the new heavens (Isaiah 66:23). |
| Hebrew | H6918 | קָדוֹשׁ | qadosh | Lexicons gloss *holy / sacred / set apart* in generic register; the framework's reading is set-apart-unto-Yahuah, the covenant-people register of Exodus 19:6 and 1 Peter 2:9. |
| Hebrew | H3548 | כֹּהֵן | kohen | Lexicons gloss *priest / Aaronic priest / officiant*; the framework's reading is the priesthood that the gathered remnant becomes for the nations in the millennial reign (Isaiah 61:6; Revelation 5:10) — the destination, not the inherited ecclesiastical category. |
| Hebrew | H6662 | צַדִּיק | tsadiq | Lexicons gloss *just / righteous / pious*; the framework's reading is the Melek-Tsadiq line of priesthood (Genesis 14, Psalm 110, Hebrews 5–7) — the named-figure preserved per the voice skill compound rule. |
| Hebrew | H7307 | רוּחַ | ruach | Lexicons gloss *spirit / breath / wind*; the framework's reading is the Ruach HaKodesh who spoke at Sinai and lives in the believer, the same Spirit, never separated from Torah (Red Line #6). |
| Hebrew | H530 | אֱמוּנָה | emunah | Lexicons gloss *faith / faithfulness / fidelity*; the framework's reading is covenant-faithfulness, never the Reformation's standalone *sola fide* — the *the just shall live by his faith* of Habakkuk 2:4 that Paul quotes is faithfulness, not bare belief. |
| Hebrew | H6664 | צֶדֶק | tsedek | Lexicons gloss *righteousness / justice*; the framework's reading is covenant-rightness, the Yahuah-Tsidkenu (Jeremiah 23:6, 33:16) of the restored remnant. |
| Hebrew | H4941 | מִשְׁפָּט | mishpat | Lexicons gloss *judgment / justice / ordinance*; the framework's reading is the rod of Ezekiel 20:37, the sifting that purges the rebels at the bond of the new covenant. |
| Greek | G3551 | νόμος | nomos | Lexicons gloss *law / Mosaic law / legal system*; the framework's reading is *Torah* — covenant instruction, the inheritance, never the curse. The antinomian reading of Paul that treats *nomos* as the bondage Christ delivered the believer from is the antichrist reading (Red Lines #4 + #5). |
| Greek | G2041 | ἔργον | erga (works) | Lexicons gloss *works / deeds / labor*, and the standard reading collapses *erga nomou* (works of the law) into Torah-observance broadly; the framework's reading restores *erga nomou* as the circumcision party's flesh-performance system Paul argued against, never a synonym for Torah-keeping. |
| Greek | G5485 | χάρις | charis | Lexicons gloss *grace / unmerited favor* in standalone register; the framework's reading is grace as the means of return to Yahuah and his ways, never grace-against-Torah (Red Line #10). |
| Greek | G1484 | ἔθνος | ethne | Lexicons gloss *Gentiles / nations / heathen* and collapse the term to the Jew-vs-Gentile binary; the framework's reading is *the nations* as a category, with the scattered seed of Yashar'el often the actual audience of Paul's "Gentile" missions (Hosea 1:10 quoted at Romans 9:25–26; Red Line #1). |
| Greek | G2453 | Ἰουδαῖος | Ioudaios | Lexicons gloss *Jew / Jewish / Judean*; the framework's reading restores *Yahudi / Yahudah* as one house of a two-house covenant people, never the whole of the covenant (Red Lines #1 + #7). |
| Greek | G4102 | πίστις | pistis | Lexicons gloss *faith / belief / trust*; the framework's reading is the Spirit-empowered faithfulness that responds to Yahuah's call — never the *sola fide* truncation that severs faith from the covenant life Torah names (Red Lines #5 + #10). |
| Greek | G1343 | δικαιοσύνη | dikaiosune | Lexicons gloss *righteousness / justification* with the Reformation forensic register often hanging on the entry; the framework's reading is covenant-rightness, the substance behind Yahuah-Tsidkenu (Jeremiah 23:6) and the imputed-rightness reading is one Reformation lens, not the term's settled meaning. |
| Greek | G1577 | ἐκκλησία | ekklesia | Lexicons gloss *church / assembly / congregation* with the institutional-Christian *church* hanging on the entry; the framework's reading is *the called-out assembly* of Yashar'el, the congregation in the wilderness (Acts 7:38), never the horn's Daniel-7 institution. |
| Greek | G2098 | εὐαγγέλιον | euangelion | Lexicons gloss *good news / gospel*; the framework's reading is the news of the gathering of the scattered seed of Yashar'el, the kingdom proclamation Yahusha brought (Matthew 4:23, 15:24) — not the Reformation's *justification-by-faith-alone* summary. |
| Greek | G2962 | κύριος | kyrios | Lexicons gloss *Lord / master / sir*; the framework's reading restores the Hebrew underneath — Yahuah where the LXX rendered the tetragrammaton as *kyrios*, Adonai where the underlying was *adonai*, and the source-echo parenthetical convention of the voice skill (every mention, every time). |
| Greek | G5547 | Χριστός | Christos | Lexicons gloss *Christ / Messiah / anointed one*; the framework's reading restores *Mashiach / HaMashiach* and surfaces the Yahusha (Jesus) identification with the Formed One — the cloud-rider of Daniel 7:13 and Revelation 1:13, with the kaph-comparative honored (Red Line #12). |
| Greek | G3807 | παιδαγωγός | paidagogos | Lexicons gloss *tutor / schoolmaster / pedagogue* and the inherited reading treats the *paidagogos* as the Torah that the believer graduated out of; the framework's reading restores the *paidagogos* as the circumcision party's flesh-performance schoolmaster, with the inheritance Paul names including the Torah (the Galatians outlook in the voice skill). |
| Greek | G40 | ἅγιος | hagios | Lexicons gloss *holy / saint / sacred*; the framework's reading is set-apart-unto-Yahuah, the *qadosh* register restored — the saints are the gathered remnant, not the inherited Catholic-ecclesiastical category. |
| Greek | G2222 | ζωή | zoe | Lexicons gloss *life / eternal life / vitality*; the framework's reading is the life that flows from covenant-keeping in the Spirit-empowered new heart of Ezekiel 36:26–27, never the *fire-insurance* truncation of the inherited evangelical reading. |
| Greek | G4561 | σάρξ | sarx | Lexicons gloss *flesh / body / human nature* with the dualistic Greek-philosophy-tinted reading often hanging on the entry; the framework's reading is the flesh-performance register Paul argued against, not the body itself as evil. |
| Greek | G4151 | πνεῦμα | pneuma | Lexicons gloss *spirit / breath / wind* with the Spirit-vs-Torah Reformation reading often threaded through the *spirit-of-the-law / letter-of-the-law* glosses; the framework's reading is the Ruach HaKodesh who lives in the believer and leads to Torah, not away from it (Red Line #6). |
| Greek | G932 | βασιλεία | basileia | Lexicons gloss *kingdom / royal power / sovereignty*; the framework's reading is the kingdom of Yahuah — the millennial reign, the gathered remnant as a kingdom of priests, the destination of the journey home (Exodus 19:6, Revelation 5:10). |
| Greek | G65 | ἀγριέλαιος | agrielaios | Lexicons gloss *wild olive tree / branch grafted in by faith* and the inherited reading collapses Romans 11:17–24 into *Gentiles spliced into the covenant tree*; the framework's reading restores *agrielaios* as the natural descendants of the broken-off — the scattered seed of Yashar'el grown wild among the nations through the Assyrian exile, gathered home through the journey the prophets named (Red Line #11). The wild-olive word itself, the verse the false-inclusion gospel is built on, restored to the gathering it actually names. |

The callout band renders above the lexicon body inside the LexiconSheet — bordered-chrome card register matching the §22 NotesPanel inner-card pattern (1px border `var(--reader-rule)`, `bg-[var(--reader-surface-elev)]`, `rounded-md`, 12px padding), with the callout text in body register and the framework-anchor scripture quoted in stand-alone italics per the *Come and See* posture from the voice skill. The card carries a small spectral-blue accent badge in the top-right reading `Framework reading` so the partner sees the difference between the lexicon body and the curated framework layer.

**Authoring discipline.** Every callout is authored by Yoshi or drafted by Claude under explicit voice-skill load, with the 12 Red Lines and the 12-point editorial checklist applied before it lands. The callout text is data — stored in the new `lexicon_callouts` table (see *Schema* below) — and reviewed at session close per the voice-skill operating discipline. The V1 list above is the locked floor; additions and edits happen via curated migration sweeps, not by content-generation at runtime.

### Defaultable surface

Items below ship with the noted V1 defaults; Yoshi redlines on the §26 review. None of them is load-bearing in the way the four gates above are.

- **LexiconSheet placement and chrome.** Stacked above StrongsLookup using the §22 NotesPanel bordered-chrome modal family. Z-index above StrongsLookup (`z-50` for StrongsLookup at present; LexiconSheet at `z-60`). Backdrop `bg-black/40` (same as StrongsLookup, layered on top — backdrop click closes LexiconSheet only, not the whole stack). Bottom-sheet on mobile with `items-end`; centered on desktop with `sm:items-center`. Width `max-w-md` matching §20's modal sizing; `max-h-[85vh]` with `overflow-y-auto` on the body so long entries scroll cleanly.
- **Header — breadcrumb + source picker.** Top row of the LexiconSheet renders the breadcrumb in §5 spectral-blue accent muted register: `Strong's H0430 (Elohim) › BDB`. For Hebrew entries the breadcrumb's source segment (`BDB`) is interactive — a small inline toggle that opens the **"Compare with Gesenius"** view. The ✕ close button sits at the right end of the header at §20 sizing parity. The breadcrumb back-navigates on tap (tap `Strong's H0430 (Elohim)` segment to close LexiconSheet and return to StrongsLookup with the partner's prior scroll position preserved).
- **Body layout — single-source mode.** Standing disclaimer band at top, framework-callout card next (when one is present for this Strong's number), then the lexicon body proper. Lexicon body renders the lemma in original-script form (Hebrew or Greek font stack per §20), transliteration, pronunciation, **part-of-speech tag**, **derivation chain** (BDB carries comparative Semitic derivations; LSJ carries Greek etymology + Tyndale-formatted classical attestation with citation hover-on-date and abbreviations expanded — see *Cross-link affordances* below), **glosses** (numbered when the lexicon presents multiple senses; BDB and LSJ both do this systematically, with LSJ using Roman-numeral major senses + Arabic-numeral sub-senses + lettered sub-sub-senses), **citations** (the lexicon's verse citations rendered as tap-to-navigate links per §20's concordance pattern), and **discursive notes** at the entry tail.
- **Body layout — compare mode (Hebrew only).** Compare toggle activated → body renders two stacked panels separated by a §5 spectral-blue 1px divider rule. Top panel: BDB (with its disclaimer + callout band). Bottom panel: Gesenius (with its disclaimer; framework-callout band suppressed in the bottom panel to avoid duplicating the framework reading — the framework callout is the same regardless of which Christian-era lexicon the partner is reading, so it sits once at the top of the BDB panel and the Gesenius panel just gets the raw entry). Each panel carries its own scroll behavior so the partner can compare in-place; the outer sheet does not scroll in compare mode.
- **Entry points — two paths.**
  - **VerseActionMenu Word-study section.** The S122 stub `BDB` (Hebrew word) and the S122 stub `Thayer's` (Greek word, renamed at S159 to **`LSJ`** to match the actual source data Yoshi locked) promote from `Tier-locked (Library)` to `Tier-locked (Companion)` for partners below Companion, and to `Live` for Companion+ partners. The label rename + badge rename happen via the same `buildMenuSections` edit S122 used; no `VerseActionMenu` component change required. The §20 stub catalog (locked S122) carries the rename — see §20 *Locked stub catalog* row updated S159.
  - **"Read lexicon entry" link inside StrongsLookup modal body.** New link, rendered below the Strong's body and above the §20-locked concordance section. Single-line affordance reading `→ Read full lexicon entry (BDB / LSJ)` in §5 spectral-blue accent. Below-Companion partners see the link with the same Companion-badge chip rendering pattern from §20's tier-locked stubs and routes-to-pricing on tap. Companion+ partners see it without the badge and tap opens LexiconSheet. For Hebrew words, the link text reads `→ Read full lexicon entry (BDB · Compare with Gesenius)`; for Greek words, `→ Read full lexicon entry (LSJ)`.
- **Coverage fallback — entries without lexicon data.** Some Strong's numbers will have no BDB / LSJ / Gesenius coverage (uncommon proper-name entries, certain Aramaic words, late additions). When a tap lands on a Strong's number with no lexicon coverage in the chosen source, the LexiconSheet renders a single empty-state line in muted register: *No depth-lexicon entry available for this word at V1. The Strong's body above is the canonical reference for this term.* Closes via ✕ same as the populated state. For Hebrew words where BDB has no entry but Gesenius does, the breadcrumb defaults to Gesenius and the Compare toggle becomes *Compare with BDB* (label inversion); this is a rare case and the default-source-flip prevents an empty BDB sheet from greeting the partner.
- **Cross-link affordances inside the entry.** Lexicons routinely cross-reference other lexical entries (BDB's *derivation chain* links to Semitic-cognate Strong's numbers; LSJ's etymology + see-also section links to Greek root entries via Tyndale's `<a href="javascript:void(0)" title="...">` hover-citation pattern, normalized at parse time to `<a data-strong>` / `<a data-verse>`). The locked path renders these as tap-to-navigate links inside the LexiconSheet body — tapping the link replaces the current LexiconSheet content with the new entry's content (same sheet, same stack — the breadcrumb updates to reflect the new path: `Strong's H0430 (Elohim) › BDB › Strong's H0410 (El) › BDB`). The breadcrumb becomes a back-stack — each ›-separator is a tap-back-target — so the partner can navigate lexicographic chains without losing their place. Three-segment cap on the breadcrumb visible at once; deeper chains render the leftmost segment as `…` with the full chain available on tap for advanced partners. Lexicons' verse citations also tap-navigate — tapping `Genesis 1:1` inside a BDB citation closes the entire modal stack (LexiconSheet → StrongsLookup → verse) and navigates to that verse per §20's concordance pattern.
- **Persistence.** Compare-toggle preference (Hebrew words only) persists to localStorage under `lexicon-prefs.compare-default` as boolean — partners who turn compare on once get compare-on every subsequent Hebrew entry until they turn it off. Currently-open lexicon entry does NOT persist — modal stack state is per-session.

### Schema — new tables (additive migration)

Two new tables. Both additive; no existing schema touched.

```sql
-- =====================================================================
-- Section 5 — Depth lexicons (Phase 9.3 deliverable; locked S158)
-- =====================================================================

-- Public-domain depth-lexicon entry. One row per (source, strong_number)
-- pair. BDB and Gesenius both cover Hebrew + Aramaic so a Hebrew strong
-- can have 1, 2, or 3 rows here (BDB, Gesenius, and rarely both); Greek
-- strongs have at most 1 row (LSJ at V1, with Abbott-Smith NT entries
-- rendered under the same 'lsj' source enum; the second-Greek-lexicon
-- slot — likely Thayer's 1889 if sourced separately — is reserved for
-- a future wheel).
CREATE TABLE lexicon_entries (
    id                  BIGSERIAL PRIMARY KEY,
    source              TEXT NOT NULL CHECK (source IN ('bdb','lsj','gesenius')),
    strong_number       TEXT NOT NULL REFERENCES strong_entries(strong_number),
    lemma               TEXT NOT NULL,            -- original-script form (matches strong_entries.lemma when present)
    transliteration     TEXT,
    pronunciation       TEXT,
    part_of_speech      TEXT,                     -- 'noun masc.', 'verb qal', 'adj.', etc. (source-native register)
    short_definition    TEXT,                     -- single-phrase gloss; falls back to strong_entries.short_definition if NULL
    body_html           TEXT NOT NULL,            -- the lexicon's full entry rendered as semantic HTML (one <p> per paragraph, <ol>/<li> for numbered glosses, <a data-strong="H0410"> for cross-links, <a data-verse="genesis-1:1"> for citation tap-navigate)
    derivation          TEXT,                     -- comparative Semitic / Greek etymology chain in source-native register
    citations_count     INT NOT NULL DEFAULT 0,   -- number of verse citations inside body_html; for UI footer chip "X citations"
    UNIQUE (source, strong_number)
);

CREATE INDEX idx_lexicon_strong ON lexicon_entries(strong_number);
CREATE INDEX idx_lexicon_source ON lexicon_entries(source);

COMMENT ON TABLE lexicon_entries IS
    'BDB / LSJ / Gesenius depth-lexicon entries. Public domain. Loaded from STEPBible / OpenScriptures public-domain dumps per source-texts/SOURCE_TEXT_INVENTORY.md. LSJ rows include Abbott-Smith NT-only fallback entries under the same source enum. The voice skill is the standard; these entries are data. Framework callouts are stored in lexicon_callouts and rendered above the entry body per DESIGN_LANGUAGE.md §26.';

-- Curated framework-callout authored under the 12 Red Lines, surfaced
-- above the lexicon body when a Strong's number matches. One row per
-- strong_number (the callout applies to all sources for that word).
-- Authored by Yoshi or by Claude under explicit voice-skill load and
-- reviewed at session close.
CREATE TABLE lexicon_callouts (
    strong_number       TEXT PRIMARY KEY REFERENCES strong_entries(strong_number),
    term_display        TEXT NOT NULL,            -- 'torah', 'charis', 'paidagogos' — the term as the callout names it
    gloss_error_summary TEXT NOT NULL,            -- one-line summary of what the lexicons get wrong; surfaces as the callout title
    body_md             TEXT NOT NULL,            -- the framework callout in markdown; 2-4 short paragraphs with scripture in stand-alone italics per the Come-and-See posture; the same Red Lines and 12-point editorial checklist apply
    red_lines_cited     TEXT[] NOT NULL,          -- e.g. ARRAY['1','4','5'] — which Red Lines this callout draws from; for editorial sweeps and voice-skill audit
    last_reviewed_at    TIMESTAMPTZ,              -- when Yoshi last reviewed and approved this callout text
    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE lexicon_callouts IS
    'Framework reading-callouts surfaced above the lexicon body in the §26 LexiconSheet when a Strong''s number matches. Locked V1 list per DESIGN_LANGUAGE.md §26 (16 Hebrew + 18 Greek = 34 high-impact terms). Grows as a curated wheel post-launch; never generated at runtime.';
```

**Migration filename.** `data-schema/migrations/sessionNN_lexicon_tables.sql` (filename gets the session number when the loader skeleton wheel lands; placeholder `NN` here per the spec-then-build standard).

**Tier-gating on the API.** Both tables' read endpoints (`GET /v1/lexicon/{source}/{strong_number}` and `GET /v1/lexicon/{strong_number}/callout`) enforce Companion-tier server-side via the JWT entitlement check that already gates §III tier-locked endpoints. Below-Companion JWTs receive 403 with the `tier_required: "companion"` payload the PWA already knows how to render as the tier-locked card.

### Helper API + sanity-test surface (the forward standard from S121 W2 / W3 / S122 / S123 / S125 / S126 / S157)

Pure helpers in `app/src/lib/lexicon-helpers.ts` — no React imports, no global state, no async. Each function is independently sanity-testable via `node --test` against inlined test cases per the prior-wheel pattern.

- `buildBreadcrumb(stack)` — given an ordered list of `{strong_number, lemma, source}` segments, returns the rendered breadcrumb string with three-segment cap and leading-… elision for deeper stacks. Sanity-test sweeps: 1-segment / 2-segment / 3-segment / 4+-segment-with-elision / empty-stack defensive / source-segment vs strong-segment formatting.
- `formatDisclaimer(source)` — given a source enum (`bdb` / `thayers` / `gesenius`), returns the standing-disclaimer string with source name and date substituted. Sanity-test sweeps: each source returns the right disclaimer / unknown source returns the generic-disclaimer fallback / disclaimer never returns empty.
- `parseLexiconBodyLinks(html)` — given the `body_html` string from a `lexicon_entries` row, parses out the `<a data-strong>` and `<a data-verse>` link targets and returns an enriched render-ready structure for the PWA. Sanity-test sweeps: data-strong link extracted with correct strong number / data-verse link extracted with correct book/chapter/verse / mixed-content paragraphs preserve text outside links / nested links handled safely (lexicons occasionally have a citation that also contains a cross-lemma reference) / malformed HTML defensive.
- `selectDefaultSource(language, available)` — given a language enum (`hebrew` / `greek` / `aramaic`) and the set of available sources for the requested Strong's number, returns the default source to render. Sanity-test sweeps: Hebrew with BDB+Gesenius available returns BDB / Hebrew with only Gesenius returns Gesenius (BDB-missing fallback) / Greek returns LSJ / Aramaic with BDB available returns BDB / no available sources returns null (empty-state).
- `formatCalloutHeader(callout)` — given a `lexicon_callouts` row, returns the rendered header string (`Framework reading · charis · The Reformation grace-against-law reading`). Sanity-test sweeps: term-display + gloss-error-summary composed correctly / empty gloss-error-summary defensive / unicode-safe Hebrew/Greek lemmas in term-display.

Verification target: ≥30 sanity-test cases passing in `_sNN_lexicon_sanity.mjs` at session close where NN is the loader-skeleton session number. tsc -b clean across the project. No node sanity tests on the React LexiconSheet component — that surface is stateful UI tested by live walk on the real PWA per the §22 / §23 / §24 / §25 pattern.

### Accessibility

- **WCAG 2.1 AA per §13.** LexiconSheet carries `role="dialog"`, `aria-label="Lexicon entry for {lemma}"`, `Escape`-to-close, ✕ button with `aria-label="Close lexicon entry"`. Breadcrumb segments are `<button>` elements with `aria-label` reading `Back to {previous segment}` for keyboard navigation. Tab order: ✕ → breadcrumb segments (left-to-right) → Compare toggle (when present) → disclaimer (focusable for screen-reader announcement) → callout card (focusable) → lexicon body interactive elements (cross-links, verse citations) → bottom of sheet.
- **Compare toggle.** Renders as a `<button>` with `aria-pressed` reflecting current state; `aria-label="Compare with Gesenius"` (or "Compare with BDB" in the inverted-default case). Screen-reader announcement on toggle confirms the new state.
- **Long entries.** The `overflow-y-auto` body sets `tabindex="0"` on the scroll container so keyboard users can scroll with arrow keys per the §22 NotesPanel pattern. Each cross-link target inside the body carries an `aria-label` that surfaces the target term (`Cross-reference to Strong's H0410 (El)`).
- **Hit targets.** Cross-link tap targets meet the §13 44pt iOS / 48dp Android floor where possible. Compact word-level cross-links inside body prose are smaller and rely on the reader-zoom feature of the OS for partners who need larger targets; this is a known WCAG-AA-edge limitation called out in the §13 closing line ("post-launch refinement candidate"). Verse citations and section-level interactive elements (Compare toggle, ✕, breadcrumb segments) always meet the full hit-target floor.
- **Reduced motion.** Sheet open/close animation honors `prefers-reduced-motion: reduce` (instant show/hide rather than slide-up).

### What §26 deliberately does NOT prescribe

- **Vine's Expository Dictionary.** Vine's is a popular drill-deeper resource and the §20 stub catalog originally listed it alongside BDB and the Greek depth-lexicon. **Vine's is copyrighted until ~2030+** (W.E. Vine, 1940; copyright on derivative editions extends further); ingesting it would require licensing fees that don't fit a public-domain extras model per the BIBLE_APP_ROADMAP §VI standing rule. §26 deprecates the Vine's stub in the §20 table — `buildMenuSections` removes the `Vine's expository` item from the Word-study stub catalog. If a public-domain Vine's-class resource surfaces post-launch, it slots in as a v1.1+ alternate-Greek lexicon under the same multi-source UX the Hebrew side carries.

- **Thayer's Greek-English Lexicon (1889).** Public domain; widely recognized as the standard 19th-century NT Greek lexicon. NOT in V1 because the assumed STEPBible Strong's-aligned Thayer's extract turned out not to exist (S159 source-fetch finding); §26 ships with LSJ (Tyndale-edited, with Abbott-Smith NT fallback) as the V1 Greek source per the S159 LSJ-swap decision logged above. Thayer's becomes a v1.1+ alternate-Greek lexicon candidate, sourced separately from a clean Strong's-aligned public-domain dump if and when one is identified. Adding Thayer's at v1.1+ would extend Gate #2's *single canonical Greek source* lock to a *single canonical + Compare toggle* posture on the Greek side, matching what Hebrew carries with Gesenius — see Gate #2 above for the architecture.
- **TDNT (Theological Dictionary of the New Testament — Kittel / Bromiley).** The gold standard for Greek NT theological depth; copyrighted, not eligible for V1 or any near-term wheel. Permanently out of scope unless Anchor Yale or a successor publishes a public-domain release. Mentioned here so a future Claude doesn't read "depth Greek lexicon" and reach for Kittel.
- **HALOT (Hebrew and Aramaic Lexicon of the Old Testament — Koehler-Baumgartner).** Modern academic-standard Hebrew lexicon; copyrighted, out of scope. BDB is the V1 depth-Hebrew standard.
- **Concordance integration inside the LexiconSheet.** The §20 StrongsLookup modal already carries the concordance section ("Other verses using this word") below the lexicon entry. §26 does NOT duplicate that section inside LexiconSheet — the partner can close LexiconSheet to return to StrongsLookup and access the concordance there. Doubling the concordance into LexiconSheet would inflate the sheet and create a *which-concordance-is-canonical* confusion. The single canonical concordance lives in StrongsLookup.
- **AI-generated lexicon-entry summaries.** No model-generated content in the lexicon surface. The lexicon entries are public-domain primary sources, rendered as-is. The framework callouts are authored under voice-skill load and reviewed by Yoshi. No LLM is in the rendering loop. This rules out "summarize this BDB entry," "explain this Greek root in modern English," "compare BDB vs Gesenius on this word for me" — all of which would be model-generated and would smuggle the antichrist Pauline reading back into the surface where the framework callouts are doing the work of correcting it. The same standing rule that bars AI-generated commentary in §17 / §22 applies here.
- **Per-partner lexicon notes / annotation surface.** Partners cannot mark up lexicon entries. Notes live on verses, not on lexicon entries — a partner who wants to record a thought about *charis* writes it on the verse where *charis* surfaced (Romans 5:2 or wherever) via the §22 NotesPanel, with the verse context attached. This keeps the notes surface anchored to scripture rather than to scholarship.
- **Audio narration of lexicon entries.** The §25 TTS player narrates scripture, not reference material. Lexicons read silently; partners who want audio-listening exit the LexiconSheet, return to the verse, and use the player. Narrating lexicon entries would mix the proclamation (scripture) with the apparatus (scholarship) and dilute the §25 reading-rhythm contract.
- **Lexicon search.** No search inside the LexiconSheet. The §23 SearchModal already handles full-text search across verses; lexicon-entry text is not indexed in V1 and is not a partner-facing search target. Search for a Hebrew or Greek term reaches the partner the same way the §20 concordance does — through scripture, with the Strong's link surfacing the lexicon entry when the partner taps the word in the verse.
- **Print / share-lexicon-entry surface.** Lexicon entries do not get the §24 share-with-watermark treatment. The watermark is for scripture as proclamation; lexicons are reference scaffolding, and sharing a BDB entry as a stand-alone image doesn't carry the same surface-as-proclamation register. Partners who want to share what a lexicon says about a word screenshot the LexiconSheet themselves via OS-level screenshot, with the breadcrumb visible in the image so the source is named — that's their call, not a §26 affordance.
- **Multiple Strong's numbers per word / homograph handling.** Some words (rare Hebrew and Greek terms) have multiple Strong's numbers for distinct senses; the §20 tap-on-word surface picks the canonical Strong's number per the `verse_words` row. §26 does NOT add a *show me alternate Strong's numbers for this word* affordance — the partner who wants alternate senses uses the §20 concordance to find related occurrences. Disambiguation across homographs is a future-wheel candidate but not V1 scope.
- **Lexicon-entry version comparison across editions of the same source.** Some lexicons have multiple public-domain editions (Gesenius 1846 Tregelles vs Gesenius 1851 expanded). §26 ships one canonical edition per source, named in the disclaimer. Cross-edition comparison is permanently out of scope — adds complexity without partner-perceptible value.
- **Editable framework callouts in-product.** Partners cannot edit or propose edits to framework callouts in V1. The voice skill is the standard; the callouts are authored by Yoshi (or Claude under voice-skill load, reviewed by Yoshi). Reader-reported errors flow through the same partner-feedback mechanism the rest of the editorial surface uses; the post-launch SLA in §VIII Phase 8 applies. A reader-side proposal-and-review surface is V2+ scope at earliest and may never ship if the curated wheel sustains accuracy.
