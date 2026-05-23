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

**Commentary architecture (locked S88, scope refined S89).** Each chapter's commentary surface is layered. The short-form layer is a focused paragraph commentary (the 1 Corinthians 11 STRUCTURAL model on the live site — framework-bearing prose, walks the reader through the chapter's most weight-bearing moments, lands without going book-length) with the chapter-end cross-reference card tables underneath. The long-form layer is the book-style deep commentary (the §1-§N stand-alone-italics-every-scripture-quoted Logos-killer treatment, like the post-S88 john-1.md rewrite) accessed via a *Deeper Dive* button. Same progressive-disclosure pattern as the Statement of Faith: the short-form is what reads by default; the deep-form opens when the reader clicks the button. The two layers are authored separately per chapter but share the same chapter-end card data underneath.

**Important S89 refinement of the 1 Corinthians 11 reference.** The "1 Corinthians 11 model" names the STRUCTURAL pattern (focused paragraph commentary + chapter-end card tables under it). The PROSE execution currently shipped on the live site is not yet at the come-and-see standard locked in the voice skill at S88 — the visible commentary cites *(2 Samuel 15:30, Esther 6:12, Jeremiah 14:4)*, *(Exodus 28, Leviticus 8, Ezekiel 44)*, *(Acts 18:18)* and other passages without quoting them in stand-alone italics. The 1 Corinthians 11 commentary file goes on the audit list alongside the Matthew rebuild and gets its body rewritten to the same standard before it again serves as the prose-execution model. Until then, the post-S88 john-1.md is the prose-execution proof-of-concept; 1 Corinthians 11 is the structural pattern only.

### Free
- Restored sacred names (the canon as Yahuah names it)
- Apocrypha + pseudepigrapha library (Enoch, Jubilees, Jasher, Charles vol 1 + 2, Josephus, Sonnini disputed witness)
- **Strong's reference lookup** — tap any word to see its Strong's number + brief lexicon entry
- **Chapter-end cross-reference card — two framework-distinctive threads visible at free tier on every chapter** (architectural anchor: `api/CHAPTER_END_CARD_CONTRACT.md`; rows with `tier_required = 'free'`):
  - **The Kingdom Gospel / Good News of the Gathering** — the framework's central thesis (the gospel is the news of the gathering of the scattered seed) made visible through curated cross-references drawing from the full restored library. Every chapter that touches the gathering surfaces the framework reading through scripture itself.
  - **Grace and the Opportunity That Can Be Lost** — anchored on Hosea 7:13 (*"Woe unto them! for they have fled from me: destruction unto them! because they have transgressed against me: though I have redeemed them, yet they have spoken lies against me"*); every passage that teaches the gift can be lost (Heb 6:4-6, Heb 10:26-29, Matt 7:21-23, 2 Pet 2:20-22, James 5:19-20, Rev 3:5, Rev 22:19, Gal 5:4, 1 Cor 9:27, Rom 11:20-22, John 15:1-6, 1 Cor 10:1-12, 2 Pet 1:5-10) cross-referenced back to its source (Hosea 7:13, Ezekiel 18, Ezekiel 33:12-13, Exodus 32:33, Psalm 69:28, Deuteronomy 28, Jeremiah 18:7-10, Numbers 14, 1 Samuel 15, Ezekiel 20:33-38). Counters institutional Christianity's "once saved, always saved" lie at the data layer.
- **Commentary on author-curated key chapters only** — Yoshi designates a hand-picked set of *key chapters* (the chapters where the framework's diagnostic hits hardest and a new reader walks away with the inherited lie taken off — candidates include John 1, Romans 11, Hosea 1, Galatians 3, Matthew 5, Matthew 23, Acts 2, Hebrews 8, Revelation 7; final set is Yoshi's editorial call once the commentary sweep is closer to complete). On those key chapters, the full short-form layered commentary displays for free as the funnel sample. On all other chapters, commentary is locked behind $4.99. The free reader hits a key chapter, the commentary lands, the upgrade lands.
- 1 highlight color: neon yellow `#FFE600`, fill style only
- Single global notepad with verse-anchor support (tap verse → Add note → opens the one notepad with verse reference auto-inserted at cursor)
- Search across canon + extras
- Reading history (last position, recently read)
- Basic bookmarks (favorite a verse without coloring it)
- Share / send verse with subtle "Remnant of Promise Official Study Bible" watermark — every share is a viral acquisition channel
- Offline downloads (canon-only default, additional content downloadable from settings within tier permissions)
- Pull-down refresh for content updates

### $1.99
Everything in free, plus:
- All 12 tribe-palette colors
- All 3 mark styles (fill, underline, border outline)
- Separate notes per book / chapter / verse — distinct, named, scoped notes
- Note central hub — single screen showing all notes, organized by color category, by book/chapter, with filter and search
- Free-form color-meaning dictionary — user assigns whatever label they want to each color (e.g., "rose = the Father's love"); label propagates through picker, note central, study views, anywhere the color is referenced
- Bookmark-by-color topical study view — all passages marked in a given color gathered into a thematic study collection
- Tease of $4.99 features (small affordance showing what's available at the next tier)

### $4.99
Everything in $1.99, plus:
- Notes export to PDF (full notes content, formatted, downloadable)
- **Short-form layered commentary on every chapter** — the focused paragraph commentary (the 1 Corinthians 11 STRUCTURAL model: framework-bearing prose, walks the reader through the chapter's most weight-bearing moments, lands without going book-length; with every scripture invoked quoted in full in stand-alone italics on its own line per the voice skill's come-and-see posture — the post-S88 john-1.md rewrite is the prose-execution proof-of-concept until the 1 Corinthians 11 commentary itself is rebuilt to the same standard) PLUS the chapter-end cross-reference card tables underneath. Every chapter has this; the locked-only-for-key-chapters gate at the free tier is removed.
- **Full cross-reference apparatus unlocked** — the chapter-end cross-reference card expands beyond the free-tier Kingdom-Gospel + Grace-That-Can-Be-Lost threads to surface every curated thread plus all per-verse curated cross-references. Both layers of the chapter-end card per `api/CHAPTER_END_CARD_CONTRACT.md`. Cross-reference data is drawn from the full restored library bidirectionally — canon, apocrypha, pseudepigrapha, 1 Enoch, Jubilees, Jasher, Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah, Havoth, Shamayim, Cepher additions, Sonnini's *Acts of Paul,* and every other restored-and-treated-as-canonical text in the library (see §17 for the architecture).
- **Live-UI fixes for chapter-end card rendering (locked S88, refined S89):**
  - **Snippet truncation retires.** Verse snippets render in full — no mid-sentence `…` truncation. There's no paper to save on a screen.
  - **"MEMBERS IN THIS CHAPTER" sub-header retires entirely (locked S89).** Originally captured at S88 as "retires-as-DB-jargon, replaced with reader-facing language or just the verse rows without a header." Yoshi's S89 question — *why is that even a label?* — landed the cleaner answer: the sub-header was the API field name `members_in_chapter` leaking into UI copy. The reader is already on the chapter-end card; the thread card is nested inside it; the rows shown are obviously the ones in this chapter. The sub-header adds no information the reader doesn't already have. Drop it. The thread card becomes: thread title → anchor → summary → list of verse-pair rows directly. Each row is self-describing under the established thread context.
  - **"TANAKH SOURCES FOR [CHAPTER]" panel header — naming OPEN.** Current live label frames the cross-reference panel as Tanakh-only when §17 locks the pool as the full restored library bidirectionally. Replacement naming is deferred until Romans is in active scope (Yoshi's S89 instruction). Engineering work uses a placeholder until then.
  - **Paragraph-style lead-in option.** Cards may carry a short paragraph-style lead-in that orients the reader before listing the verse-by-verse connections — the post-rebuild short-form commentary paragraph is the prose-flow model. Where a thread carries a summary, surface it as a lead-in. Where no summary exists, fall back to the verse list directly.
- **Verse-highlight recommendations engine** — when user highlights a verse, the app surfaces related passages from Yoshi's curated thematic cross-reference threads (the same curated data as the chapter-end card, surfaced through the marks UI). **100% curated theological data, AI-free at every stage including preprocessing** — no LLM inference at runtime, no AI-generated similarity. The engine grows as Yoshi authors more threads.
- Full public domain reference library:
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

### $9.99
Everything in $4.99, plus:
- **Deeper Dive button on every chapter** — unlocks the long-form book-style commentary on every chapter (the §1-§N stand-alone-italics-every-scripture-quoted Logos-killer treatment, the kind of work the post-S88 john-1.md rewrite represents). Click the button on any chapter's commentary panel and the full book-style exposition opens. Where the $4.99 reader gets the framework on every chapter, the $9.99 reader gets the *book-on-every-chapter.* The depth that displaces Logos sits behind this button.
- **Yoshi's pre-loaded keys** — the canon comes pre-marked with Yoshi's highlights, underlines, and outlines, each tied to an end-of-chapter note and a deeper teaching expansion. Read the Bible alongside the teacher who walked it.
- **Chronological order toggle** — read the canon in the historical sequence of events rather than book order. Job in Genesis-era; Psalms interleaved with David's life; Paul's epistles aligned with Acts; prophets positioned alongside the kings they prophesied to. **Mapping reflects Yoshi's framework dating, not generic scholarly chronology** — a value-add other apps cannot replicate.

### $14.99 (V2 build)
Spec deferred. Likely direct-access elements (members-only forum, monthly group call, Q&A surface), early-access (preview new books/threads before public release), family-plan / multi-seat, or founder/patron tier with named acknowledgment.

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
| **Share** | verse | Copy verse | Share with watermark + verse-range selection (Wheel 6) |

Empty sections drop out of the render (no header at all when a section has zero items in the current partner's view). Future wheels append `MenuItem` objects to the appropriate section in App.tsx's `buildMenuSections` helper without touching the `VerseActionMenu` component. **The S121 default behavior — empty sections drop — has been narrowed at S122: sections drop only if they have zero items across all states (live, tier-locked, coming-soon). Once any stub is added, the section header renders and the stubs sit dimmed inside it.** See *Disabled-state stubs and tier-locked surfaces* below for the locked S122 stub catalog + visual register.

The scopeLabel header at the top of the modal reads the surface English word ("God", "created") when scope is word, and "Verse actions" when scope is verse. Each section header renders in §5 spectral-blue accent at small uppercase-tracked register so partners scan sections as visual chunks.

**Modal sizing for the S122 fuller menu.** Modal max-width grows from `max-w-sm` (S121 lock when the menu carried 1-3 live items) to `max-w-md` to accommodate the full stub catalog without horizontal cramping. Modal also gets `max-h-[85vh]` + `overflow-y-auto` so the bottom-sheet on mobile scrolls cleanly when the menu runs tall (word-scope on a Hebrew word can carry 15 items at S122 lock). Scope-label register stays as the S121 uppercase-tracked spectral-blue treatment.

**Copy implementation note (locked S121).** Copy uses `navigator.clipboard.writeText(formattedText)` directly with the verse text + reference. Bypasses DOM selection entirely — no fight with the long-press picker, no whitespace artifacts from selecting across the W3 word-tappable span structure. Format: `"{Book} {Chapter}:{Verse} — {Verse text}\n\n— Remnant of Promise Official Study Bible"`. The watermark line is the same brand-mark watermark that Wheel 6 will overlay on the visual share — every Copy is a viral surface even before W6 ships.

**Verse-range Copy + Share deferred to Wheel 6 — no Cepher-style cap.** V1 Copy is single-verse. Yoshi flagged at S121 that social-media-debate use cases need multi-verse range (the Cepher's 5-verse limit was named as bad UX). The range-selection mechanic (tap first verse → "Start range here" → tap last verse → "Copy/Share range") is its own UX surface and ships with Wheel 6's share-with-watermark work. **No cap.** Partners can range any size they want — single verse to entire chapter to multi-chapter spans. The framework's diagnostic often runs across passages the Reformation traditions truncate; the app should never reproduce that truncation in its sharing affordances.

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

**Locked stub catalog (S122).** Each section carries the live item(s) from S121 + every future-wheel item from the §20 table as a state-typed stub. Word-study stubs are language-conditional (BDB + Nikkudot only fire on Hebrew words; Thayer's only on Greek words). Other stubs are scope-conditional only (verse-scope or word-scope, no language filter).

| Section | Item | State | Wheel | Tier when shipped |
|---|---|---|---|---|
| **Word study** *(word scope)* | Strong's lookup | Live | — | Free |
|  | BDB | Tier-locked (Hebrew only) | W9 | Library |
|  | Thayer's | Tier-locked (Greek only) | W9 | Library |
|  | Vine's expository | Tier-locked | W9 | Library |
|  | Hebrew/Greek interlinear | Tier-locked | W10 | Library |
|  | Nikkudot siblings | Tier-locked (Hebrew only) | W11 | Library |
| **Marking** *(verse scope)* | Highlight verse | Live | — | Free |
|  | Bookmark | Coming soon | W5 | Free |
| **Notes** *(verse scope)* | Add note | Coming soon | W5 | Free |
|  | Open notes for this verse | Tier-locked | W5 | Notes |
| **Cross-references** *(verse scope)* | Treasury (TSK) | Tier-locked | W9 | Library |
|  | Nave's topical | Tier-locked | W9 | Library |
|  | Related passages | Tier-locked | W12 | Library |
| **Share** *(verse scope)* | Copy verse | Live | — | Free |
|  | Share with watermark | Coming soon | W6 | Free |
|  | Multi-verse range | Coming soon | W6 | Free |

For a Hebrew word in word scope at S122 lock, the menu shows 15 items (5 Word-study + 2 Marking + 2 Notes + 3 Cross-references + 3 Share). For a Greek word, 14 items (Nikkudot drops; BDB swaps to Thayer's). For verse scope, 10 items (no Word-study section). Bottom-sheet on mobile scrolls cleanly via the new max-h + overflow-y-auto from above.

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
