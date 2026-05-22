# Remnant of Promise Study Bible — Design Language & Tier Matrix

The consolidated record of all design and product decisions for the V1 app build, settled across S77 and S78. This file is the authoritative starting point for any future build session — every visual decision, every tier feature, every architectural commitment lives here.

---

## 1. Theme

- **Default theme:** black background (`#000`) with white serif body text (`#FFF`). The signature aesthetic; brand-defining; not equally weighted with the alternate.
- **Alternate theme:** parchment / sepia background for bright-light reading. Available in settings; the off-ramp from default, not a co-default.

The black-default theme is what the app looks like in screenshots, marketing material, the App Store / Play Store listing images, and every external surface.

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

## 5. Chrome Accents — Gold

`#D4AF37` — subtle gold for:

- **Verse numbers**: small superscript, font-size 11px, vertical-align: super, opacity 0.85
- **Section divider lines** under chapter headers: 1px solid, opacity 0.7
- **Chapter header label** color: matches divider gold, letter-spaced sans-serif
- **Small ornamental accents** as needed

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
- Share / send verse with subtle "Remnant of Promise Study Bible" watermark — every share is a viral acquisition channel
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
