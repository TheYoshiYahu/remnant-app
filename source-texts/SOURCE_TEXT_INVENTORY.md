# Source Text Inventory

The complete list of every text the Remnant of Promise Official Study Bible app needs, where each comes from in the public domain, the licensing posture, and the validation strategy. Updated as sources are pulled and verified.

---

## I. The Canon (Protestant 66) — free tier

### Base verse text
**King James Version (1769 Blayney revision).** Public domain in the United States and most of the world (Crown copyright in the UK is irrelevant outside the UK). This is the base text the deterministic restoration pipeline runs against. Choice rationale: Yoshi's existing Restored Names editions are KJV-based; the voice skill quotes KJV throughout; the audience is at home with KJV English.

Candidate sources (need verification on completeness and Strong's tagging):
- **The SWORD Project's KJV module** — KJV2006 includes Strong's numbers tagged on every word, plus Robinson's Morphology. Curated by CrossWire Bible Society. Distributed under public domain notice. This is the gold standard for tagged biblical text.
- **Zefania XML Bible Markup Language project** (SourceForge) — clean XML KJV, less tagging but easy to parse.
- **Bible Super Search** — JSON KJV available with Strong's tags.
- **Open Scriptures (openscriptures.org)** — KJV with Strong's, Greek/Hebrew text alignment.

Recommended source: SWORD Project KJV2006 module. Pull, parse, normalize into our schema. Document the exact module version and SHA in the provenance log.

### Strong's lexicons
**Strong's Hebrew and Chaldee Dictionary** (1890). Public domain.
**Strong's Greek Dictionary** (1890). Public domain.

Candidate sources:
- **OpenScriptures' strongs repository** (github.com/openscriptures/strongs) — Strong's Hebrew and Greek as structured XML/JSON. Actively maintained.
- **The SWORD Project lexicon modules** — StrongsHebrew, StrongsGreek modules.

Recommended source: OpenScriptures strongs repo on GitHub. Public domain. Clean structured data. Use directly.

### Strong's tag-to-verse mapping
Bundled into the SWORD KJV2006 module above. Every word in the KJV is tagged with its underlying Strong's number (H#### for Hebrew, G#### for Greek). This is what powers tap-on-word lookup in Phase 5.

### Cross-references (for in-app cross-reference suggestions)
**Curated framework-bearing pairs, authored under the 12 Red Lines.** Not an ingested third-party corpus. Sessions 73 and 74 seeded the v1 apparatus: five framework-diagnostic threads (post-harvest-sifting, grace-from-names-sake, new-heart, scattered-seed-gathering, false-inclusion-rebuttal) with 47 cross-reference pairs total, every pair voice-gated against the Red Lines and the 12-point editorial checklist before it landed.

The Treasury of Scripture Knowledge (R.A. Torrey, 1880, public domain) was scoped as a v1.1 comprehensive-baseline ingestion candidate at the original S73 contract, then rolled back at Session 75 on framework grounds (Red Line #2 / #10): TSK is the codified cross-reference grammar of the inherited Reformation reading, and a ~340k-pair TSK baseline underneath ~50 curated framework pairs makes the inherited grammar the page and the framework the footnote — the volume-ratio inversion Red Line #2 forbids. The apparatus grows by curated threads on Yoshi's design call, not by ingestion of any Christian-corpus cross-reference work.

---

## II. The Extras (paid tier — $4.99) — public domain English bases

Each extras book gets two columns in the inventory: the public-domain English source we'll restore from, and the existing Yoshi-published Restored Names edition we'll validate against (where one exists).

### Already-restored by Yoshi (validation targets exist)

These four books have a published Restored Names edition on KDP. The deterministic pipeline gets validated by running it on the public-domain base and confirming the output matches Yoshi's published edition (within documented intentional variances).

> **⚠ Session 52 finding — the validated restoration was never landed in `parsed/`.** `parse_published_editions.py` parses the published editions straight into `parsed/{enoch,jasher,jubilees}.json` *without* running `restore.py`. The Phase-3 validation run (`restoration-pipeline/INTENTIONAL_VARIANCES.md`) diffed pipeline output against the published parse and logged the gaps as "published-edition gaps" — but the corrected pipeline output was validated, not written back into `parsed/`. So `enoch.json` (and almost certainly `jasher.json` / `jubilees.json`) still carry the documented sweep list un-restored: `Lord of Spirits` ×13, `Lord of the sheep` ×33, `Lord of lords`, bare `Lord` 81:3, 18 son-of-Adam verses, `Israel` in 56:4. **Restoration-pass wheel opened (Yoshi, Session 52) — sequenced ahead of the resumed Q39 fix.** See `DOWNLOAD_MANIFEST.md` Session 52 log + `_LORD_OF_SPIRITS_VOICE_SCREEN_SESSION52.md`.
>
> **✅ Session 53 update — restoration pass landed in full.** All three pre-restoration parses are now **fully restored** in `verses[].text` and idempotent under `restore.py` (`validate_verse_diff.py` = 0 diffs each): `enoch.json` (64 verses), `jasher.json` (668), `jubilees.json` (10). `restore.py`'s `Lord` parenthetical was reconciled to `(God)`, and three pre-existing Enoch missing-space typos were fixed. Jasher and Jubilees keep their commentary **embedded inside the `verses[].text` field** (`chapter.commentary` is empty) — so the commentary parser pass (item d) is still needed to separate it; restoring the text in place does not. The Jasher/Jubilees sweep landed in two steps: pure scripture verses first, then (Yoshi's call) the commentary-embedded set with the current flat construct — reversible, to be re-run when the fuller Sacred Names construct is built. Yoshi's caution, transcribed and still standing as of Session 53 close: *not every time "Lord" is mentioned is Yahuah* — the flat map did not honor this; the fuller construct (the El / El Shaddai / Elohim / Yahuah / Yahuah Tseva'ot / Adonai breadth, opened for discussion at Session 53 close) is where the `Lord`/`God` cases get proper treatment.
>
> **✅ Session 54 update — the Sacred Names construct expansion landed; the standing caution is RESOLVED.** Yoshi's Q1–Q5 settled the design (21 new compound names elevated to pipeline-enforced; universal source-echo on every parenthetical). `restore.py` reworked: 23 new rules (the 21 compounds + canon-only `adonai_yahuah` + el_elyon_with_god/el_elyon_high pair); base singles flipped to source-echo; `_HEBREW_HEADS` extended. **Self-tests: 108/108 passing** (up from 83/83). Voice skill `SKILL.md` rewritten to match and installed. **Phase D is queued for Session 55+:** re-parse every edition from raw sources (trash existing `parsed/*.json` first), preserve `<nd>` tagging on the canon re-parse, then re-restore the whole corpus under the new construct. The Session-53 restorations of Enoch / Jasher / Jubilees are deterministically reversible — every original is in git at `HEAD` — and explicitly slated for re-run under the new construct in Phase D. The flat-construct cases that flattened distinctions (Jasher 91:18 / Psalm 110:1 *David's Lord* being the canonical example) will be re-handled when each new compound rule fires on its specific English signal, with the `Adonai Yahuah` rule activating in canon once `<nd>` is preserved. See `DOWNLOAD_MANIFEST.md` Session 54 log + `INTENTIONAL_VARIANCES.md` Session 53 section (caution now marked resolved).

| Book | Public-domain base | Yoshi's published edition (validation target) |
|---|---|---|
| The Apocrypha (KJV 1611 set: Tobit, Judith, Wisdom of Solomon, Sirach / Ecclesiasticus, Baruch, 1-2 Maccabees, 1-2 Esdras, additions to Esther, Prayer of Azariah, Susanna, Bel and the Dragon, Prayer of Manasseh) | KJV 1611 Apocrypha — public domain | `~/Desktop/Claude the Apocrypha/The-Apocrypha-Restored-Names-Edition.docx` |
| Jasher | M.M. Noah 1840 English translation — public domain | `~/Desktop/docx claude finished/The-Book-of-Jasher-Restored-Names-Edition.docx` |
| Enoch (1 Enoch) | R.H. Charles 1912 translation — public domain (Charles died in 1931, copyright expired in most jurisdictions; the 1912 text is widely treated as public domain) | `~/Desktop/docx claude finished/The-Book-of-Enoch-Restored-Names-Edition.docx` |
| Jubilees | R.H. Charles 1902 translation — public domain | `~/Desktop/Claude Jubilees/The-Book-of-Jubilees-Restored-Names-Edition.docx` |

### Cepher catalog books — Shamayim collection (cepher.net "The Heavens")

Confirmed via Yoshi's screenshots of cepher.net's Shamayim publication (2026-05-09). Approximately 16 books; the Gospel of John and Revelation already live in the canon, so 14 net-new books for the extras tier:

| Book (cepher Hebrew name) | English title | Public-domain base |
|---|---|---|
| Brit HaTorah | The Covenant Torah | Source needs confirming — possibly the Aleppo / Leningrad Hebrew text in English transliteration; needs research |
| Chizayon Kepha | Apocalypse of Peter | M.R. James 1924 *Apocryphal New Testament* — public domain |
| Machazeh Pa'al | Vision of Paul (Apocalypse of Paul) | M.R. James 1924 — public domain |
| Chanok Sheniy | 2 Enoch (Slavonic Enoch) | R.H. Morfill / R.H. Charles 1896 — public domain |
| Chizayon Mosheh | Apocalypse of Moses (Greek Life of Adam and Eve) | R.H. Charles 1913 vol. — public domain |
| Chizayon Avraham | Apocalypse of Abraham | G.H. Box 1918 — public domain |
| Aleph Beyt Davidiy | Alphabet of David | Source needs research |
| ~~Aleph Beyt Siram~~ | ~~Alphabet of Ben Sirach~~ | **DROPPED 2026-05-15 (session 51).** Yoshi cut the entry after a voice-skill pre-screen. The medieval *Alphabet of Ben Sira* (c. 700–1000 CE) is a satirical frame-tale, not a covenant witness; its premise degrades the prophet Yirmeyahu (Jeremiah), its Lilith narrative is a rival origin myth contradicting the framework's Adam reading, and its content is crude/bawdy and unfit for the study-Bible surface. No clean public-domain English translation was confirmed either. See `DOWNLOAD_MANIFEST.md` Session 51 log + `_ALPHABET_BEN_SIRA_VOICE_PRESCREEN_SESSION51.md`. |
| Ayduth Shenayim Asar Abathiy | Testaments of the Twelve Patriarchs | R.H. Charles 1908 — public domain |
| Baruk Sheniy | 2 Baruch (Syriac Apocalypse of Baruch) | R.H. Charles 1896 — public domain |
| Baruk Shelliyshiy | 3 Baruch (Greek Apocalypse) | H.M. Hughes in Charles vol. — public domain |
| H'Alah Yesha'yahu | Ascension of Isaiah | R.H. Charles 1900 — public domain |

(Baruk Ri'shon = 1 Baruch is in the Apocrypha already. Besorah Yochanan = Gospel of John and Chizayon Yahusha HaMashiach = Revelation are in the Protestant canon already.)

### Cepher catalog books — Ha'avoth collection (cepher.net "The Fathers")

Confirmed via Yoshi's screenshots of cepher.net's Ha'avoth publication (2026-05-09). Approximately 21 books — the Apostolic Fathers and adjacent early-assembly writings:

| Book (cepher Hebrew name) | English title | Public-domain base |
|---|---|---|
| YARAH H'ASGAR SHENIYM | The Didache | J.B. Lightfoot *Apostolic Fathers* 1885 — public domain |
| ~~BESORAH TOLDAH MIRYAM~~ | ~~Gospel of Mary~~ | **DROPPED 2026-05-12 (session 32).** Cepher's attribution to M.R. James 1924 is a cataloguing error; the Berlin Codex Gnostic text is not in James 1924. Voice-skill pre-screen surfaced an explicit anti-Torah teaching ("do not give a law like the lawgiver") and a salvation-by-gnosis architecture (same family as Gospel of Thomas). Yoshi cut from manifest. |
| BESORAH YA'AQOV | Gospel of James (Protoevangelium) | M.R. James 1924 — public domain |
| BESORAH NIQODYMON | Gospel of Nicodemus (Acts of Pilate) | M.R. James 1924 — public domain |
| BESORAH KEPHA | Gospel of Peter | M.R. James 1924 — public domain |
| AGRA BAR-NAVIY | Epistle of Barnabas | Lightfoot 1885 — public domain |
| CHIZAYON HERMAS | Shepherd of Hermas: Visions | Lightfoot 1885 — public domain |
| MITSVOTH HERMAS | Shepherd of Hermas: Commands (Mandates) | Lightfoot 1885 — public domain |
| DERMAH HERMAS | Shepherd of Hermas: Similitudes | Lightfoot 1885 — public domain |
| CLEMENT QORINTEM RI'SHON | 1 Clement to the Corinthians | Lightfoot 1885 — public domain |
| CLEMENT QORINTEM SHENIY | 2 Clement to the Corinthians | Lightfoot 1885 — public domain |
| MARTYRDOM OF POLYCARP | Martyrdom of Polycarp | Lightfoot 1885 — public domain |
| IGNATIUS AGRA EPHYSEM | Ignatius to the Ephesians | Lightfoot 1885 — public domain |
| IGNATIUS AGRA MAGNESEM | Ignatius to the Magnesians | Lightfoot 1885 — public domain |
| IGNATIUS AGRA TRALL'EM | Ignatius to the Trallians | Lightfoot 1885 — public domain |
| IGNATIUS AGRA ROMAYIM | Ignatius to the Romans | Lightfoot 1885 — public domain |
| IGNATIUS AGRA FILADELFYIM | Ignatius to the Philadelphians | Lightfoot 1885 — public domain |
| IGNATIUS AGRA SMYRNAEM | Ignatius to the Smyrnaeans | Lightfoot 1885 — public domain |
| IGNATIUS AGRA POLYCARP | Ignatius to Polycarp | Lightfoot 1885 — public domain |

(CHIZAYON KEPHA: Apocalypse of Peter is already in the Shamayim list above; count once.)

### Adam and Eve material

| Book | Public-domain base |
|---|---|
| The First Book of Adam and Eve (also called The Conflict of Adam and Eve with Satan, Ethiopian) | S.C. Malan 1882 English translation — public domain |
| The Second Book of Adam and Eve | S.C. Malan 1882 — public domain |
| Apocalypse of Moses / Greek Life of Adam and Eve | R.H. Charles 1913 vol. — public domain |
| Latin Life of Adam and Eve (Vita Adae et Evae) | L.S.A. Wells in Charles vol. — public domain |

### Testament of the Twelve Patriarchs

| Book | Public-domain base |
|---|---|
| Testaments of the Twelve Patriarchs (Reuben, Simeon, Levi, Judah, Issachar, Zebulun, Dan, Naphtali, Gad, Asher, Joseph, Benjamin) | R.H. Charles 1908 translation — public domain |

### Possible additional pseudepigrapha (Phase 2 future expansion — beyond locked extras manifest)

These are NOT in the current locked extras manifest (Yoshi's call to add them or hold them for a future tier expansion). All have public-domain English translations from the Charles 1913 vol. or earlier:

3 Enoch (Hebrew Apocalypse), Testament of Abraham, Testament of Job, Testament of Solomon, Joseph and Aseneth, Lives of the Prophets, Apocalypse of Sedrach, Vision of Ezra, Apocalypse of Elijah, Sibylline Oracles, Psalms of Solomon, Letter of Aristeas, Assumption of Moses, Pirke Aboth, 4 Baruch / Paraleipomena Jeremiou, 3 Maccabees, 4 Maccabees, 4 Ezra (already in KJV Apocrypha as 2 Esdras).

### Josephus — added 2026-05-09

Yoshi's note on Josephus: *"i dont put as much trust into josephus as some do, but i think we should provide it anyways."* Included in extras tier; will be presented under a *Historical Witnesses* sub-category in the UI so readers know it's not the same kind of witness as scripture or pseudepigrapha. The complete works of Flavius Josephus in William Whiston's 1737 English translation — the standard, fully public domain. About 1.2 million words total.

| Work | Books | Public-domain base |
|---|---|---|
| Antiquities of the Jews | 20 | Whiston 1737 — public domain |
| Wars of the Jews | 7 | Whiston 1737 — public domain |
| Against Apion | 2 | Whiston 1737 — public domain |
| Life of Flavius Josephus (autobiography) | 1 | Whiston 1737 — public domain |

### Acts 29 / Sonnini Manuscript — added 2026-05-09

Yoshi's call to include. The "Lost Chapter of Acts" published in 1801, claimed to have been recovered by C.S. Sonnini from the Constantinople archives, narrating Paul's journey to Spain and Britain after Acts 28. Most academy scholars consider it pseudepigraphic. Public domain. **Will be marked clearly in the UI as *Acts 29 (Sonnini Manuscript) — disputed authenticity, included for study and discernment*** so we present the witness honestly rather than dismissing it or overclaiming it.

| Book | Public-domain base |
|---|---|
| Acts 29 (Sonnini Manuscript) | 1801 publication — public domain |

---

## III. Reference materials (lookup data, not displayed verse text)

### Place names and geography
**Cepher Names and Places Key** at `~/Desktop/Cepher-Names-and-Places-Key-03.22.pdf`. Use as a cross-check for sacred name spelling decisions during the restoration pipeline build. NOT a source of authority — we do not adopt Cepher's choice to omit parentheticals. This is a sanity-check reference only.

### Lexical references beyond Strong's
**Brown-Driver-Briggs Hebrew Lexicon** (1906). Public domain. Goes deeper than Strong's. Available at OpenScriptures.
**Thayer's Greek-English Lexicon** (1889). Public domain. Goes deeper than Strong's. Available at openbible.com.

These are nice-to-haves for the Phase 5 Strong's lookup surface — the user taps a word, sees Strong's, and can drill deeper into BDB or Thayer for richer treatment. Not critical for launch but cheap to include.

---

## IV. Yoshi's commentary and study notes (sourced from already-built corpus)

### The Statement of Faith (live at remnantofpromise.org/statement-of-faith/)
Twenty-three sections. Sections I–VII are the doorway gospel; section VIII is the foundational lie; sections IX–XXIII are the diagnostic and the framework. **Mirror this content into the app's onboarding flow and into the deeper-dive layer behind any commentary entry that touches its themes.** Local capture pending — easiest path is to fetch each of the 23 section URLs, save the body content as markdown into `~/Desktop/App/source-texts/statement-of-faith/`, and project from there.

### The Teaching Corpus
Forty concept folders at `~/Desktop/Teaching Corpus/concepts/`. Each folder has the per-concept structure (`summary.md`, `from-books.md`, `from-videos.md`, `verses.md`, `yoshi-clarifications.md`, `open-questions.md`). The `verses.md` file in each folder is the join key — it lists every verse that touches that concept, which is exactly what the in-app commentary surface needs to project a verse to its concept treatment.

### Yoshi's published books (17 titles)
Indexed at `~/Desktop/Teaching Corpus/source-index.md`. The Teaching Corpus extracts framework-relevant passages from each book into the per-concept `from-books.md` files; those extracts are what gets projected into the app commentary, not the full books.

### Yoshi's teaching videos (13 catalogued, 1 transcript saved)
Indexed at `~/Desktop/Teaching Corpus/source-index.md`. The remaining 12 transcripts need to be saved (separate workstream — out of scope for Phase 2, in scope for the Teaching Corpus's own ongoing work).

---

## V. Validation Strategy

The deterministic restoration pipeline (Phase 3) has to be trustworthy. The validation method is byte-equivalence (or documented intentional variance) against Yoshi's already-published Restored Names editions.

For each of the four books with a published Restored Names edition (Apocrypha, Jasher, Enoch, Jubilees):
1. Extract the public-domain base (KJV 1611 Apocrypha for the Apocrypha; Charles 1912 for Enoch; Noah 1840 for Jasher; Charles 1902 for Jubilees).
2. Run the deterministic pipeline on the base.
3. Diff the output against Yoshi's published Restored Names edition (extracted from the .docx via pandoc to plain text).
4. Investigate every diff. Either the diff is an intentional improvement (Yoshi made a manual judgment that the pipeline didn't capture), or the pipeline has a bug. Bugs get fixed. Intentional variances get documented in `restoration-pipeline/INTENTIONAL_VARIANCES.md` so future runs of the pipeline produce the corrected output.

Once the pipeline matches Yoshi's published work on all four validation targets, it's trusted enough to run on the rest of the canon and the rest of the extras.

---

## VI. Licensing Posture

Every text in this app is either:
1. **Public domain** (canon base, Strong's, all extras' public-domain English translations, cross-references, lexicons), or
2. **Yoshi's own work** (the Restored Names editions, the Statement of Faith, the Teaching Corpus, the books, the commentary).

We will not include any text under copyright unless we have explicit permission. No NIV, no NASB, no ESV, no NKJV — those are all under active copyright and would require licensing fees that don't fit a free-canon model. KJV is the right base for legal, theological, and audience-fit reasons all at once.

A CONTENT_LICENSING.md file in the app's root will spell this out for any future contributor who needs to know the rules.

---

## VII. Open Items (need confirmation before Phase 2 closes)

1. **Brit HaTorah source** — the first book in the Shamayim collection. Need to research what specific text this names; possibly the Aleppo / Leningrad Hebrew text in English transliteration, possibly something else specific to cepher.net's editorial choice. If Yoshi knows the source he was reading from, that resolves it; otherwise this gets researched.
2. **Alphabet of David source** — uncommon text; need to research the public-domain English translation. May not have a clean public-domain source, in which case it gets dropped from the manifest or replaced.
3. **Whether to mirror the Statement of Faith locally for the app's onboarding** — recommended yes; awaiting go-ahead to fetch and store all 23 section URLs from remnantofpromise.org.

**Resolved this session:** All four validation targets located on disk (Apocrypha, Jasher, Enoch, Jubilees). Pipeline can be validated against them in Phase 3. Extras manifest locked with the Shamayim and Ha'avoth collections from cepher.net plus Books of Adam and Eve I & II — about 50 books beyond the canon, all public domain.

**Resolved this session (later):** First-pass parser written at `restoration-pipeline/parse_published_editions.py`, run against all four extractions. Output at `source-texts/parsed/*.json`. Results:

- **Apocrypha** — 14 books, 187 chapters, 5,711 verses. Matches canonical KJV Apocrypha structure essentially exactly. ✅ Ready for Phase 3/4 work.
- **Enoch** — 1 book, 108 chapters, 1,367 verses. Matches Charles 1912 standard exactly on chapter count. ✅
- **Jasher** — 1 book, 91 chapters, 3,903 verses. Matches Noah 1840 standard exactly on chapter count. ✅
- **Jubilees** — 1 book, 46 of 50 chapters, 266 verses (heavy under-count; actual is ~1,300+). ⚠ KNOWN ISSUE — the published Jubilees edition interleaves commentary with scripture in a way that breaks the monotonic verse-number chain after a handful of verses, and chapters 1, 3, 18, 25 don't have an explicit verse-2 marker my detector requires. Needs a more sophisticated scripture-vs-commentary separator. Tracking as a Phase 3 concern; the other three editions are enough to start Phase 4 schema work.

---

## VIII. Provenance Log

Sources actually pulled, dated, with version/SHA identifier. (To be populated as sources are downloaded.)

| Date | Source | URL / Identifier | SHA / Version | Stored at |
|---|---|---|---|---|
| 2026-05-09 | Apocrypha — Restored Names Edition (Yoshi, published) | `~/Desktop/Claude the Apocrypha/The-Apocrypha-Restored-Names-Edition.docx` | 616,499 bytes | `existing-restored-editions/Apocrypha-Restored-Names-Edition.txt` (305,815 words plain text via pandoc) |
| 2026-05-09 | Jasher — Restored Names Edition (Yoshi, published) | `~/Desktop/docx claude finished/The-Book-of-Jasher-Restored-Names-Edition.docx` | located | `existing-restored-editions/Jasher-Restored-Names-Edition.txt` (315,453 words plain text via pandoc) |
| 2026-05-09 | Enoch — Restored Names Edition (Yoshi, published) | `~/Desktop/docx claude finished/The-Book-of-Enoch-Restored-Names-Edition.docx` | located | `existing-restored-editions/Enoch-Restored-Names-Edition.txt` (109,458 words plain text via pandoc) |
| 2026-05-09 | Jubilees — Restored Names Edition (Yoshi, published) | `~/Desktop/Claude Jubilees/The-Book-of-Jubilees-Restored-Names-Edition.docx` | 230,509 bytes | `existing-restored-editions/Jubilees-Restored-Names-Edition.txt` (112,639 words plain text via pandoc) |
| 2026-05-09 | Apocrypha source (KJV 1611 modernized, 14 .txt files) | `~/Desktop/Claude the Apocrypha/source/01-1_Esdras.txt` through `14-2_Maccabees.txt` | located on disk | not duplicated; referenced in place |
| 2026-05-09 | Apocrypha modernization script (existing reference) | `~/Desktop/Claude the Apocrypha/working/modernize.py` | 21,857 bytes, ~600 lines of regex rules | `restoration-pipeline/_reference_modernize_from_apocrypha.py` |
| 2026-05-09 | Apocrypha compile-to-docx script (existing reference) | `~/Desktop/Claude the Apocrypha/working/compile.py` | 17,724 bytes | `restoration-pipeline/_reference_compile_from_apocrypha.py` |
| 2026-05-12 | Ascension of Isaiah (Charles 1900, full composite ch 1–11) | https://www.earlychristianwritings.com/text/ascension.html | session 32 fetch | `ascension-isaiah/_charles1900_raw.md` → `ascension-isaiah/ascension-isaiah.txt` (45,932 bytes) → `ascension-isaiah/ascension-isaiah-restored.txt` (after `restore.py`) → `parsed/ascension-isaiah.json` (1 book, 11 chapters, 296 verses). Replaces the previous Charles vol 2 martyrdom-isaiah entry. |
| 2026-05-28 | OpenScriptures HebrewLexicon — BrownDriverBriggs.xml (BDB 1906, TEI XML, Strong's-aligned) | https://github.com/openscriptures/HebrewLexicon | SHA `21c9add13bc727d3a951361778e97e3ff7afd1ce` | `openscriptures-hebrewlexicon/BrownDriverBriggs.xml` (2,911,253 bytes). Public-domain BDB body; primary BDB source for Phase 9.3 lexicon ingestion per `_scratch/S158_LEXICON_PARSE_PLAN.md` §I. |
| 2026-05-28 | OpenScriptures HebrewLexicon — AugIndex.xml (Gesenius alignment via Tregelles 1846) | https://github.com/openscriptures/HebrewLexicon | SHA `21c9add13bc727d3a951361778e97e3ff7afd1ce` | `openscriptures-hebrewlexicon/AugIndex.xml` (213,975 bytes). Strong's → Gesenius pointer entries; body content lives in the same repo's BrownDriverBriggs.xml + LexicalIndex.xml — verify at parse time per parse plan §II. |
| 2026-05-28 | OpenScriptures HebrewLexicon — HebrewStrong.xml (Strong's 1890 Hebrew, supplementary) | https://github.com/openscriptures/HebrewLexicon | SHA `21c9add13bc727d3a951361778e97e3ff7afd1ce` | `openscriptures-hebrewlexicon/HebrewStrong.xml` (2,749,042 bytes). Cross-check against existing local `strongs-hebrew/StrongHebrewG.xml`. |
| 2026-05-28 | STEPBible-Data — TBESH (Tyndale Brief Lexicon of Extended Strongs for Hebrew, CC-BY) | https://github.com/STEPBible/STEPBible-Data | SHA `0753f2506dd2f8e4b56d76e5215fbd06c9ac2e32` | `stepbible-data/Lexicons/TBESH - Translators Brief lexicon of Extended Strongs for Hebrew - STEPBible.org CC BY.txt` (3,288,045 bytes). Hebrew enrichment data — transliteration + pronunciation + POS + gloss; fills gaps in BDB/Gesenius rows. Sparse-checkout. |
| 2026-05-28 | STEPBible-Data — TBESG (Tyndale Brief Lexicon of Extended Strongs for Greek, CC-BY) | https://github.com/STEPBible/STEPBible-Data | SHA `0753f2506dd2f8e4b56d76e5215fbd06c9ac2e32` | `stepbible-data/Lexicons/TBESG - Translators Brief lexicon of Extended Strongs for Greek - STEPBible.org CC BY.txt` (4,736,912 bytes). Greek enrichment data. |
| 2026-05-28 | STEPBible-Data — TFLSJ (Tyndale Formatted full LSJ Bible lexicon, CC-BY) | https://github.com/STEPBible/STEPBible-Data | SHA `0753f2506dd2f8e4b56d76e5215fbd06c9ac2e32` | `stepbible-data/Lexicons/TFLSJ  0-5624 - Translators Formatted full LSJ Bible lexicon - STEPBible.org CC BY.txt` (23,831,837 bytes) + `TFLSJ extra ...txt` (8,377,070 bytes). **Note:** Hybrid lexicon — Liddell-Scott-Jones (9th ed., 1940, public domain) for classical Greek with NT meaning, falling back to Abbott-Smith (Manual Greek Lexicon of NT, 1922, public domain) for NT-only vocabulary. Tyndale House Cambridge editing: abbreviations expanded, dates added, hover-on-citation. **Parse-plan adjustment:** STEPBible does NOT carry Thayer's; TFLSJ is the Greek depth-lexicon STEPBible publishes. Greek-source decision (Thayer's-separate vs LSJ+Abbott-Smith) surfaced to Yoshi at S159 open. |
