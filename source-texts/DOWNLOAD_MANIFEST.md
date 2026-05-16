# Source-Text Download Manifest

**Started Session 16, 2026-05-11.**

> **⚠ DRIFT NOTICE — added Session 48, 2026-05-14.** This manifest is stale and
> should not be trusted row-by-row until rewritten. Many items still labeled
> "NOT FETCHED" below were in fact fetched, parsed, and wired into `seed.py`
> across Sessions 19–34 — including all of Josephus, the Lightfoot Apostolic
> Fathers, the M.R. James Apocryphal NT pilot, the Charles vol 1 + vol 2
> editions, and the Ascension of Isaiah. As of Session 48 the corpus has
> **12 seed-wired editions / 154 books / 50,561 verses** (`seed.py --dry-run`);
> the authoritative current state is the `JSON_FILE_FOR_EDITION` map in
> `api/seed.py` and the files in `source-texts/parsed/`, not this manifest.
> Sonnini Acts 29 was parsed and wired Session 48. **Session 49 (2026-05-15)
> sourced, restored, parsed, and seed-wired the First and Second Books of Adam
> and Eve** (`adam-eve-conflict` edition — 2 books / 101 ch / 1,242 vv).
> **Session 50 (2026-05-15) parsed, restored, and seed-wired the Apocalypse of
> Abraham** (`apocalypse-of-abraham` edition — 1 book / 32 ch / 293 vv) from the
> Box 1918 PDF already on disk; `seed.py --dry-run` now lifts **14 editions /
> 157 books / 2,569 chapters / 52,096 verses**. **Session 51 (2026-05-15)
> voice-skill pre-screened the Alphabet of Ben Sirach and Yoshi dropped it from
> the manifest** — a medieval satirical frame-tale, not a covenant witness (see
> the struck B-1 row and the Session 51 log entry). **Session 53 (2026-05-15) ran
> the restoration-pass wheel** — landed the validated `restore.py` sweep into
> all three pre-restoration parses: `enoch.json` (64 verses), `jasher.json` (668),
> `jubilees.json` (10) — all three now 100% pipeline-matched and idempotent — and
> reconciled `restore.py`'s `Lord` parenthetical to `(God)`. Jasher/Jubilees keep
> their commentary embedded inside the verse-text field, so the commentary parser
> pass (item d) is still pending. Yoshi also opened a discussion to expand the
> flat Sacred Names construct to the full breadth (`El`, `El Shaddai`, `Elohim`,
> `Yahuah`, `Yahuah Tseva'ot`, `Adonai`) — pending his decisions, with a
> corpus-wide re-run to follow. The genuinely-still-unsourced
> items are now the Bucket A items. `web_fetch` is dead for sacred-texts.com
> *and* gutenberg.org (returns empty) — Chrome browser tools are the working
> path. Brit HaTorah and Alphabet of David remain source-unresolved (Q5, Q6). A
> full row-by-row reconciliation of this manifest against `seed.py` and
> `parsed/` is a pending follow-up task.

The discipline (locked session 16): the canon and extras manifest needs to be COMPLETE on disk before the seed runs and before commentary is written. This file tracks every source we need to pull, the public-domain English base for each, the URL, and the status. Each future session reads this on open and resumes where the prior session left off.

The work splits into three buckets:
- **(A) Cepher Hidden Gems** — extra Psalms, missing fragments, additions to existing books, identified 2026-05-11 by walking cepher.net's 87-book TOC against our existing parsed editions
- **(B) Inventory Manifest Items Never Sourced** — the Shamayim collection, Ha'avoth collection, Adam-Eve books, Josephus, Sonnini Acts 29, all committed to in SOURCE_TEXT_INVENTORY.md but never pulled
- **(C) Future-Expansion Basket** — 17 pseudepigrapha in the inventory's "Phase 2 future expansion" list, Yoshi's call to include or hold

---

## Bucket A — Cepher Hidden Gems

### A-1. Psalms 151–155 (the five additional psalms)

| Psalm | Source family | Public-domain English | URL | Status |
|---|---|---|---|---|
| 151 (David anointing / Goliath) | LXX Greek + 11QPs-a DSS | Brenton 1851 LXX, Ψαλμός 151 / Psalm 151 | https://www.ccel.org/ccel/brenton/lxx/Psalm/151 (TBD verify) | NOT FETCHED |
| 152 (Hezekiah's prayer) | Syriac Peshitta | Wright 1887 *Some Apocryphal Psalms in Syriac*, PSBA 9:257-266 | https://archive.org/details/sim_proceedings-society-biblical-archaeology_1887 (TBD) | NOT FETCHED |
| 153 (return from Cyrus) | Syriac Peshitta | Wright 1887 | (same) | NOT FETCHED |
| 154 (David vs. lion-wolf) | Syriac + 11QPs-a DSS | Wright 1887 + DSS public-domain English | (same) | NOT FETCHED |
| 155 (thanks after deliverance) | Syriac + 11QPs-a DSS | Wright 1887 + DSS public-domain English | (same) | NOT FETCHED |

**Cepher reference text saved at:** `~/Desktop/App/source-texts/cepher-additions/psalms-151-155/cepher-text-reference.md` (Cepher's English, for theology-fit cross-check only; NOT republished)

### A-2. The Bensly missing fragment in 2 Esdras (4 Ezra) chapter 7 — 70 verses

| Source | Public-domain English | URL | Status |
|---|---|---|---|
| Bensly 1875 Latin original | (Latin; not what we need) | https://archive.org/details/missingfragmento00bens | LATIN, REFERENCE ONLY |
| RV 1894 Apocrypha (Anglican revised version, restored fragment) | 2 Esdras 7 with restored vv 35-106 | TBD locate cleanly | NOT FETCHED |
| Charles 1913 vol 1 (4 Ezra, restored) | English with fragment | https://archive.org/details/apocryphapseudep01char (OCR=gibberish; use CCEL alt) | NOT FETCHED (Charles OCR bad; need alt path) |
| CCEL Charles 4 Ezra | English with fragment | https://www.ccel.org/c/charles/otpseudepig/ (TBD specific chapter URLs) | NOT FETCHED |

**Confirmed gap in our current parsed apocrypha:** 2 Esdras ch 7 has 70 verses (verses 1-70). The Bensly fragment slots in between v 35 and the current v 36. Need to restore as verses 35a-35cv or renumber to canonical 36-105 + shift existing 36-70 to 106-140.

### A-3. 3 Maccabees

| Source | Public-domain English | URL | Status |
|---|---|---|---|
| Charles 1913 vol 1, "3 Maccabees" by Cyril W. Emmet | Full English | https://www.ccel.org/c/charles/otpseudepig/ (TBD specific chapter URLs) | NOT FETCHED |
| sacred-texts.com | Possible mirror | https://sacred-texts.com/chr/apo/ (TBD specific) | NOT FETCHED |

### A-4. 4 Maccabees

| Source | Public-domain English | URL | Status |
|---|---|---|---|
| Charles 1913 vol 2, "4 Maccabees" by R.B. Townshend | Full English | (Charles vol 2 path TBD) | NOT FETCHED |
| sacred-texts.com | Possible mirror | (TBD) | NOT FETCHED |

### A-5. Psalm 145 missing nun-verse + acrostic markers

| Source | Public-domain English | URL | Status |
|---|---|---|---|
| 11QPs-a (Sanders 1965) | Hebrew + English; DSS publication | (Sanders' English is under copyright; use raw Hebrew + render fresh in pipeline) | RESEARCH NEEDED |
| LXX Brenton 1851 | Psalm 144:13 LXX = Ps 145:13a Heb | https://www.ccel.org/ccel/brenton/lxx/Psalm/144 (TBD) | NOT FETCHED |
| Hebrew letter markers for acrostic Psalms 25, 34, 37, 111, 112, 119, 145 | (no external source needed; these are presentational markers we add at the verse level) | N/A | N/A — pipeline work |

---

## Bucket B — Inventory Manifest Items Never Sourced

### B-1. Cepher Shamayim Collection (12 net-new books)

| Book (Cepher Hebrew name) | Public-domain base | URL | Status |
|---|---|---|---|
| Chizayon Kepha (Apocalypse of Peter) | M.R. James 1924 *Apocryphal NT* | https://archive.org/details/apocryphalnewtes0000unse_r1h9 (TBD specific) | NOT FETCHED |
| Machazeh Pa'al (Vision of Paul / Apocalypse of Paul) | M.R. James 1924 | (same) | NOT FETCHED |
| Chanok Sheniy (2 Enoch / Slavonic Enoch) | Morfill / Charles 1896 | https://www.pseudepigrapha.com/pseudepigrapha/enochs2.htm | NOT FETCHED |
| Chizayon Mosheh (Apocalypse of Moses / Greek Life of Adam and Eve) | Charles 1913 vol 2 | https://sacred-texts.com/bib/fbe/index.htm (Forgotten Books of Eden) | NOT FETCHED |
| Chizayon Avraham (Apocalypse of Abraham) | G.H. Box 1918 | https://archive.org/details/AbrahamBOX1918 ; https://www.marquette.edu/maqom/box.pdf | **FETCHED + PARSED + SEED-WIRED Session 50** — `apocalypse-of-abraham` edition, 1 book / 32 ch / 293 vv. PDF on disk at `~/Downloads/box-1918-apoc-abraham.pdf`. |
| Aleph Beyt Davidiy (Alphabet of David) | UNCERTAIN — research needed | (no clean PD source confirmed) | RESEARCH NEEDED |
| ~~Aleph Beyt Siram (Alphabet of Ben Sirach)~~ | ~~19th c. PD; possibly M. Steinschneider, or Eisenstein *Otzar Midrashim*~~ | — | **DROPPED 2026-05-15 (session 51)** — Yoshi cut the entry after a voice-skill pre-screen. The medieval *Alphabet of Ben Sira* (c. 700–1000 CE) is a satirical frame-tale, not a covenant witness; its premise degrades the prophet Yirmeyahu (Jeremiah); its signature Lilith narrative is a rival origin myth contradicting the framework's Adam reading; and its body content is crude/bawdy, unfit for the study-Bible surface. No clean public-domain English translation was confirmed to exist either (the standard Bronznick translation is copyrighted; the 19th-c. editions are Hebrew). Pre-screen report: `_ALPHABET_BEN_SIRA_VOICE_PRESCREEN_SESSION51.md`. Not sourced. |
| Ayduth Shenayim Asar Abathiy (Testaments of the Twelve Patriarchs) | Charles 1908 / 1913 vol 2 | https://www.ccel.org/c/charles/otpseudepig/ (TBD specific) | NOT FETCHED |
| Baruk Sheniy (2 Baruch / Syriac Apocalypse) | Charles 1896 / 1913 vol 2 | (same) | NOT FETCHED |
| Baruk Shelliyshiy (3 Baruch / Greek Apocalypse) | Hughes in Charles 1913 vol 2 | (same) | NOT FETCHED |
| H'Alah Yesha'yahu (Ascension of Isaiah) | Charles 1900 | https://www.earlychristianwritings.com/text/ascension.html | **FETCHED 2026-05-12 (session 32)** — full composite ch 1-11, parsed as ascension-isaiah edition, 296 verses. Charles vol 2 martyrdom-isaiah entry retired (full text now sourced from Charles 1900). |
| Brit HaTorah | UNCERTAIN — possibly Hebrew transliteration; research needed | (no clean PD source confirmed) | RESEARCH NEEDED |

### B-2. Cepher Ha'avoth Collection (19 books — Apostolic Fathers + early-assembly writings)

| Book | Public-domain base | URL | Status |
|---|---|---|---|
| Didache (Yarah H'asgar Sheniym) | Roberts-Donaldson 1867 (Ante-Nicene Fathers vol 7) | http://www.earlychristianwritings.com/text/didache-roberts.html | NOT FETCHED |
| ~~Gospel of Mary~~ | ~~M.R. James 1924~~ | — | **DROPPED 2026-05-12 (session 32)** — Cepher's attribution to M.R. James 1924 is a cataloguing error; the Berlin Codex Gnostic text isn't in James 1924. Yoshi cut the entry after voice-skill review (Gnostic salvation-by-gnosis fails the contrary-to-Torah test, same family as Gospel of Thomas). Not sourced. |
| Gospel of James (Protoevangelium) | M.R. James 1924 | (same) | NOT FETCHED |
| Gospel of Nicodemus (Acts of Pilate) | M.R. James 1924 | (same) | NOT FETCHED |
| Gospel of Peter | M.R. James 1924 | (same) | NOT FETCHED |
| Epistle of Barnabas | Lightfoot 1885 | https://archive.org/details/apostolicfathep2v1clemuoft | NOT FETCHED |
| Shepherd of Hermas: Visions | Lightfoot 1885 | (same) | NOT FETCHED |
| Shepherd of Hermas: Mandates | Lightfoot 1885 | (same) | NOT FETCHED |
| Shepherd of Hermas: Similitudes | Lightfoot 1885 | (same) | NOT FETCHED |
| 1 Clement to the Corinthians | Lightfoot 1885 | (same) | NOT FETCHED |
| 2 Clement to the Corinthians | Lightfoot 1885 | (same) | NOT FETCHED |
| Martyrdom of Polycarp | Lightfoot 1885 | (same) | NOT FETCHED |
| Ignatius to the Ephesians | Lightfoot 1885 | (same) | NOT FETCHED |
| Ignatius to the Magnesians | Lightfoot 1885 | (same) | NOT FETCHED |
| Ignatius to the Trallians | Lightfoot 1885 | (same) | NOT FETCHED |
| Ignatius to the Romans | Lightfoot 1885 | (same) | NOT FETCHED |
| Ignatius to the Philadelphians | Lightfoot 1885 | (same) | NOT FETCHED |
| Ignatius to the Smyrnaeans | Lightfoot 1885 | (same) | NOT FETCHED |
| Ignatius to Polycarp | Lightfoot 1885 | (same) | NOT FETCHED |

### B-3. Adam and Eve material (4 books)

| Book | Public-domain base | URL | Status |
|---|---|---|---|
| 1 Adam and Eve (Conflict of Adam and Eve with Satan, book I) | Malan 1882 | https://sacred-texts.com/bib/fbe/index.htm | NOT FETCHED |
| 2 Adam and Eve (Conflict, book II) | Malan 1882 | (same) | NOT FETCHED |
| Apocalypse of Moses (Greek Life of Adam and Eve) | Charles 1913 vol 2 | (same as Shamayim Chizayon Mosheh row) | NOT FETCHED |
| Latin Life of Adam and Eve (Vita Adae et Evae) | L.S.A. Wells in Charles 1913 vol 2 | (Charles vol 2 path TBD) | NOT FETCHED |

### B-4. Josephus — 30 volumes

| Work | Books | Public-domain base | URL | Status |
|---|---|---|---|---|
| Antiquities of the Jews | 20 | Whiston 1737 | https://sacred-texts.com/jud/josephus/index.htm | NOT FETCHED |
| Wars of the Jews | 7 | Whiston 1737 | (same) | NOT FETCHED |
| Against Apion | 2 | Whiston 1737 | (same) | NOT FETCHED |
| Life of Flavius Josephus | 1 | Whiston 1737 | (same) | NOT FETCHED |

### B-5. Acts 29 / Sonnini Manuscript

| Source | URL | Status |
|---|---|---|
| 1801 publication interleaved in Sonnini's Travels (London: Longman & Rees) | https://archive.org/details/LongLostChapterOfActs | NOT FETCHED |
| Multiple online mirrors of the 26-verse English text | https://israelect.com/ChildrenOfYahweh/Campbell/lost_chapter.htm ; https://straighttalkaboutgod.com/britain/acts29.html | ALT SOURCE OPTIONS |

---

## Bucket C — Future-Expansion Basket (17 books — Yoshi's call)

These are named in SOURCE_TEXT_INVENTORY.md section II "Possible additional pseudepigrapha (Phase 2 future expansion — beyond locked extras manifest)." All have public-domain Charles 1913 vol 2 English. Yoshi has not yet resolved add-or-hold.

| Book | PD source | Status |
|---|---|---|
| 3 Enoch (Hebrew Apocalypse) | Odeberg 1928 | HOLD pending Yoshi decision |
| Testament of Abraham | Box 1927 | HOLD |
| Testament of Job | Charles 1913 vol 2 | HOLD |
| Testament of Solomon | Conybeare 1898 | HOLD |
| Joseph and Aseneth | Brooks 1918 | HOLD |
| Lives of the Prophets | Hare in Charlesworth (PD English unclear) | HOLD |
| Apocalypse of Sedrach | Charles vol 2 | HOLD |
| Vision of Ezra | Charles vol 2 | HOLD |
| Apocalypse of Elijah | Charles vol 2 | HOLD |
| Sibylline Oracles | Charles 1913 vol 2 | HOLD |
| Psalms of Solomon | Charles 1913 vol 2 | HOLD |
| Letter of Aristeas | Charles 1913 vol 2 | HOLD |
| Assumption of Moses | Charles 1913 vol 2 | HOLD |
| Pirke Aboth | Charles 1913 vol 2 (Travers Herford) | HOLD |
| 4 Baruch / Paraleipomena Jeremiou | Kraft & Purintun 1972 (PD older alt: Harris 1889) | HOLD |
| 3 Maccabees | (already in Bucket A) | — |
| 4 Maccabees | (already in Bucket A) | — |
| 4 Ezra | (already in apocrypha; just need fragment restore per Bucket A) | — |

---

## Operating Notes

**Sourcing rules.**
- Prefer per-book HTML on sacred-texts.com or earlychristianwritings.com or pseudepigrapha.com over archive.org djvu (which often has OCR gibberish on serif-fonted pre-1930 academic books).
- CCEL.org has clean Charles 1913 chapter-level HTML — preferred path for the Charles texts.
- Never republish Cepher's English. Cepher is a theology-fit cross-check, not an authorization. The voice skill is the standard.

**Web-fetch operational note.**
- `mcp__workspace__web_fetch` has a provenance restriction: URLs have to appear in a prior message or search result. To fetch a new URL, search for it first to enter provenance.
- Response size limit ~75-95k chars per fetch; large djvu.txt files fail. Per-chapter HTML works.

**Pipeline / DB schema implications (carried as Q12 in BIBLE_APP_ROADMAP Section IX).**
- New editions: `cepher_additions` (Psalms 151-155, Bensly fragment, 3 Macc, 4 Macc, Psalm 145 nun-verse, acrostic markers); `shamayim`; `havoth`; `adam_eve`; `josephus`; `sonnini`.
- Each gets a `witness_category` in the schema's existing enum.
- The Bensly fragment is a special case: it's a chapter-level inline restoration into an existing apocrypha book, not a new book.
- The acrostic markers and Psalm 145 nun-verse are verse-level restorations into the canon, similar to the Yoshi-rendered passages substitution layer built session 15.

**Total scope.**
- Bucket A: 5 sub-items, all small fetches.
- Bucket B: 38 books across 5 collections, mid-sized to large per-book fetches.
- Bucket C: 17 books, deferred pending Yoshi decision.
- Estimated total raw English text: 7-10 MB across roughly 60 books.

---

## Session-by-Session Progress

### Session 16 (2026-05-11)

**Done this session:**
- Cepher TOC walked. Hidden gems identified vs. our current parsed editions.
- Folder structure created under `~/Desktop/App/source-texts/`: `cepher-additions/`, `shamayim/`, `havoth/`, `adam-eve/`, `josephus/`, `sonnini-acts-29/`.
- Master manifest written (this file).
- **Cepher Psalms 151-155 reference text** saved at `cepher-additions/psalms-151-155/cepher-text-reference.md` (Cepher's English, for theological-fit cross-check; NOT republished).
- **Sonnini Acts 29** complete: 26 verses landed at `sonnini-acts-29/sonnini-manuscript-1801.md` with framework commentary anchors. Public-domain 1801 text, ready for pipeline restoration.
- **Didache** complete (16 chapters, Roberts-Donaldson 1867) at `havoth/didache-roberts-donaldson.md`. Pipeline-ready.
- **Confirmed pipeline gap:** 4 Ezra / 2 Esdras chapter 7 in our parsed apocrypha has 70 verses (numbered 1-70). The Bensly fragment goes between verse 35 and current verse 36. The fragment is genuinely missing.
- **Operational lesson logged:** archive.org djvu.txt files for pre-1930 academic books often come back as Greek-letter mis-OCR (the original serif font misread by the OCR engine). The Charles 1913 vol 1 BYU scan is unusable for our pipeline. Pivot per-fetch to chapter-level HTML from CCEL, sacred-texts, earlychristianwritings, pseudepigrapha.com.
- **Operational lesson logged:** `mcp__workspace__web_fetch` has both a provenance restriction (URLs must appear in a prior message or search result) AND a per-fetch size ceiling (~75-95k chars). Very large djvu.txt files exceed the ceiling; per-book HTML pages on minimal-wrapping sites work. Heavy-navigation pages (earlychristianwritings.com) push close to the ceiling because of the giant left-nav footer; sacred-texts.com and pseudepigrapha.com are lighter.

**Still open (carries to next session):**

*Bucket A — Cepher Hidden Gems still to source:*
- Psalms 151–155 public-domain English (Wright 1887 PSBA; Brenton 1851 LXX for Ps 151)
- 4 Ezra 7 Bensly fragment in English (Charles 1913 vol 1 via CCEL chapter pages; or RV 1894 Apocrypha)
- 3 Maccabees (Emmet in Charles 1913 vol 1)
- 4 Maccabees (Townshend in Charles 1913 vol 2)
- Psalm 145 missing nun-verse + acrostic markers (LXX Brenton 1851 + DSS 11QPs-a)

*Bucket B — Inventory items still to source (38 books):*
- Shamayim (12 books — Apocalypse of Peter, Vision of Paul, 2 Enoch, Apocalypse of Moses, Apocalypse of Abraham, Alphabet of David, Alphabet of Ben Sirach, Testaments of 12 Patriarchs, 2 Baruch, 3 Baruch, Ascension of Isaiah, Brit HaTorah)
- Ha'avoth — remaining 18 books beyond Didache (1 Clement, 2 Clement, Martyrdom of Polycarp, 7 Ignatius letters, Epistle of Barnabas, Shepherd of Hermas Visions/Mandates/Similitudes, Gospel of Mary, Gospel of James, Gospel of Nicodemus, Gospel of Peter)
- Adam and Eve (4 books — Malan 1882 from sacred-texts.com/bib/fbe/; Latin Life from Charles vol 2)
- Josephus (30 volumes — Whiston 1737 from sacred-texts.com/jud/josephus/)

*Bucket C — Future-Expansion Basket (17 books):*
- All HOLD pending Yoshi's resolution.

**Operating recommendations for next session continuing this work:**

1. **Fetch one book per turn from sacred-texts.com or pseudepigrapha.com** — those sites have lighter HTML wrapping than earlychristianwritings.com, so the per-fetch ceiling is less of a constraint. Per-chapter URLs (e.g. sacred-texts.com/bib/fbe/fbe005.htm for chapter 1 of 1 Adam and Eve) work cleanly.
2. **For Charles 1913 material specifically** — use CCEL chapter URLs (pattern: ccel.org/c/charles/otpseudepig/<book>/<chapter>.HTM). Avoid archive.org djvu for these.
3. **For Whiston's Josephus** — sacred-texts.com/jud/josephus/ indexes the works book-by-book and chapter-by-chapter. Will take many fetches but each is small.
4. **For Wright 1887 (Psalms 151-155)** — try archive.org for Proceedings of the Society of Biblical Archaeology vol 9 (1887), or use Charles 1913 vol 2 which incorporates Wright's translations.
5. **Stay tactical on the order** — Bucket A first (the Cepher hidden gems Yoshi specifically named), then Shamayim, then Ha'avoth, then Adam-Eve, then Josephus last (largest single payload).
6. **Hold Bucket C** until Yoshi resolves add-or-hold on each item.

**Files this session put on disk for the source library:**

- `~/Desktop/App/source-texts/DOWNLOAD_MANIFEST.md` (this file)
- `~/Desktop/App/source-texts/cepher-additions/psalms-151-155/cepher-text-reference.md`
- `~/Desktop/App/source-texts/havoth/didache-roberts-donaldson.md`
- `~/Desktop/App/source-texts/sonnini-acts-29/sonnini-manuscript-1801.md`

### Session 32 (2026-05-12)

**Corpus realignment to manifest scope (Yoshi-directed).**

Sessions 17–31 ran parser work against mrjames-apocryphal-nt, lightfoot-apostolic-fathers, and pseudepigrapha-charles-vol2 source families but drifted beyond what `SOURCE_TEXT_INVENTORY.md` actually authorizes. Session 32 audited each parser against the inventory and stripped out-of-scope content.

**Stripped from corpus this session (53 books removed):**

- **mrjames-apocryphal-nt: 46 → 5 books.** Kept only the five books named in the inventory's Cepher Ha'avoth (Protoevangelium of James, Gospel of Peter, Gospel of Nicodemus) and Cepher Shamayim (Apocalypse of Peter, Apocalypse of Paul) lists. Stripped: Gospel of Thomas in all three forms with both appendixes, Pseudo-Matthew, the Arabic and Armenian Infancy Gospels, Coptic Lives of the Virgin, History of Joseph the Carpenter, the Birth-of-Mary / Lesser-Questions-of-Mary / Gospel-of-the-Birth-of-Mary cluster, the entire fragment-and-list apparatus (Hebrews, Ebionites, Egyptians, Philip, Matthias, Preaching of Peter, Ascents of James, Memoria of Apostles, Gelasian Decree, List of Sixty, Stichometry of Nicephorus, Synopsis of Pseudo-Athanasius, Fayoum, Oxyrhynchus Sayings, two unnamed gospel fragments, Strasburg, Pistis Sophia fragment, Acts-of-Paul fragment), all three agrapha clusters, Acts of John, Acts of Thomas, Letters of Christ and Abgarus, and Apocalypse of Thomas.
- **lightfoot-apostolic-fathers: 17 → 13 books.** Stripped Polycarp's own Letter to the Philippians (only Martyrdom of Polycarp is in the manifest), Epistle to Diognetus, Fragments of Papias, Reliques of the Elders.
- **pseudepigrapha-charles-vol2: 15 → 6 books** (down from 15, then 7 after the first pass dropped Bucket C HOLDs, then 6 after the second pass retired martyrdom-isaiah in favor of the full Ascension of Isaiah from Charles 1900). Stripped Bucket C HOLDs (Aristeas, Sibylline, Assumption of Moses, Psalms of Solomon, Pirké Aboth), off-manifest entries (Ahikar, Zadokite Fragments), 4 Ezra (duplicates apocrypha 2 Esdras — Bensly fragment will land there), and martyrdom-isaiah (now part of the unified ascension-isaiah edition).

**Sourced this session (1 book added):**

- **ascension-isaiah (Cepher Shamayim H'Alah Yesha'yahu).** Full Charles 1900 composite (chapters 1–11) fetched from earlychristianwritings.com. Parsed as new `ascension-isaiah` edition: 1 book, 11 chapters, 296 verses. The Martyrdom (ch 1–5), the Testament of Hezekiah insert (3:13–4:22), and the Vision of Isaiah (ch 6–11) all live in one source/parse rather than splicing two Charles print editions. Replaces the Charles vol 2 martyrdom-isaiah entry retired this session.

**Voice-skill pre-screen decisions:**

- **Gospel of Mary — DROPPED from manifest.** Cepher's attribution to M.R. James 1924 turned out to be a cataloguing error (the Berlin Codex Gnostic text isn't in James 1924). On voice-skill pre-screen, the surviving fragments contain a salvation-by-gnosis frame plus an explicit anti-Torah line in the farewell teaching ("do not give a law like the lawgiver"). Same Gnostic family as Gospel of Thomas. Yoshi cut it from manifest after re-screen.
- **Ascension of Isaiah — KEPT.** Full composite from Charles 1900. The Vision of Isaiah's seventh-heaven hierarchy (Great Glory / Lord / submission / right hand of the Great Glory in ch 9–10) is the first external witness Yoshi has encountered that structurally aligns with his Formless / Formed teaching. Friction points to read with eyes open: angel of the Holy Spirit as a third figure (9:35–40), the Lord changing form to be like the angels in each heaven (10:16, docetic flavor or strategic concealment), and chapter 11:8–9 in partu birth narrative.

**Quarantine folder:** `~/Desktop/_abominations-removed-2026-05-12/` holds all stripped source `.txt` and per-book `.md` files with timestamped suffixes for safe deletion when Yoshi has verified.

**Corpus state at session 32 close:**

| Edition | Books | Chapters | Verses |
|---|---:|---:|---:|
| canon (Protestant 66) | 66 | 1,189 | 31,102 |
| apocrypha (KJV 1611) | 14 | 187 | 5,760 |
| apocrypha-charles-vol1 | 15 | 160 | 3,288 |
| enoch | 1 | 108 | 1,367 |
| jasher | 1 | 91 | 3,903 |
| jubilees | 1 | 50 | 1,038 |
| pseudepigrapha-charles-vol2 | 6 | 202 | 1,119 |
| josephus | 30 | 359 | 2,221 |
| lightfoot-apostolic-fathers | 13 | 36 | 307 |
| mrjames-apocryphal-nt | 5 | 42 | 134 |
| **ascension-isaiah** | **1** | **11** | **296** |
| **TOTAL** | **153** | **2,435** | **50,535** |

The honest corpus floor for the locked manifest is ~50–53k verses once remaining items are sourced (Bucket A Cepher Hidden Gems, Sonnini Acts 29 parse, remaining Shamayim and Ha'avoth, Adam-Eve, Bucket C decisions). Seed.py held for explicit gate — no live-DB writes this session.

### Session 49 (2026-05-15)

**Chrome-sourcing wheel — First and Second Books of Adam and Eve landed.**

**Source-base decision (Yoshi, Session 49) — recorded here per the verbal-answers-transcribe discipline.** Asked whether to use the modernized Gutenberg/mirror Platt text or the archaic-register sacred-texts text for the Adam-Eve books (and the same call for Apocalypse of Abraham). Yoshi: *"we are restoring the language and sacred names, so you choose, we are going to have it modernized either way."* Decision applied: the modernized Platt register is the accepted base for these editions; restore.py runs on top regardless. This is an edition-base decision, not a corpus-wide rule — it is recorded, not elevated.

**Operational note — web_fetch.** `web_fetch` returns empty for *both* sacred-texts.com and gutenberg.org. The Claude-in-Chrome browser tools are the working path. Large-page extraction through the JS bridge is output-capped at ~1 KB per call (impractical for book-length text); the working mechanism is an in-page `fetch()` + Blob download with `application/octet-stream` MIME (a `text/plain` Blob does not reliably download) into `~/Downloads`, then read off disk.

**Done this session — `adam-eve-conflict` edition (NEW):**
- **Book I** sourced from Project Gutenberg #398 (`~/Downloads/pg398_first_book_adam_eve.txt`) — the modernized Platt text. 79 chapters / 920 verses. The Dennis Hawkins 1995 editorial "Prologue" is NOT republished (it describes the 1995 electronic conversion itself — same standing practice the Sonnini parser applies to the Covenant Publishing introduction).
- **Book II** sourced from the reluctant-messenger.com single-page mirror of the same modernized Platt text (`~/Downloads/eden_2_raw.html`). 22 chapters / 322 verses. One verse-marker typo in the mirror corrected and logged: Chapter 13's final verse was labelled "18" where sacred-texts' FBE shows "13" for the same verse text (cross-checked against `sacred-texts.com/bib/fbe/fbe097.htm`); verse text is faithful, only the marker was renumbered.
- Pipeline: `restoration-pipeline/_session49_build_adam_eve_source.py` (one-off source builder) → `source-texts/adam-eve/{1,2}-adam-eve.txt` → `restore.py` → `{1,2}-adam-eve-restored.txt` → `restoration-pipeline/parse_adam_eve_edition.py` → `source-texts/parsed/adam-eve-conflict.json`.
- Wired into `api/seed.py`: `EDITION_PROFILES["adam-eve-conflict"]` (witness_category `pseudepigrapha`, tier `extras`, sort_offset 340, pipeline phase4-v2) + `JSON_FILE_FOR_EDITION`. `seed.py --dry-run` lifts clean: **13 editions / 156 books / 2,537 chapters / 51,803 verses** (Adam-Eve delta: +1 edition, +2 books, +101 chapters, +1,242 verses).
- The Malan 1882 scan `~/Downloads/malan-1882-adam-and-eve.pdf` (already on disk from a prior session) was checked — its OCR text layer is unusable; kept as a reference scan only.

**Still open after Session 49:**
- **Apocalypse of Abraham (Box 1918).** The attributed public-domain source is on disk: `~/Downloads/box-1918-apoc-abraham.pdf` (176 pp; the translation runs chapters I–XXXII after a long introduction). Session 49 assessment, for whoever picks this up:
  - **Use `pdftotext -layout`, not plain `pdftotext`.** Plain mode scrambles footnotes and body text together unrecoverably. `-layout` mode gives clean, readable, properly-ordered text (extracted to `outputs/box_layout.txt` Session 49 — 8,949 lines; the translation is lines ~1447–5301, before `APPENDIX I`).
  - **Footnotes still need stripping.** In `-layout` output each page is `[body text][footnote block][page-header line(s)]`. Footnote blocks sit at the page tail, start with a marker (`1`, then OCR'd symbols `^ ' * °`), and end at the next page-header line (a lone page number, or `NN  APOCALYPSE OF ABRAHAM  [chap, x]`, or `CHAP. N]  PART I/II  NN`). A page-tail heuristic should separate them.
  - **OCR cleanup needed.** Systematic artifacts: "Abrahaffl"→"Abraham", "APOCALYfeE"→"APOCALYPSE", "Tared"→"Jared", "Roog (Reu)"→"Reu", chapter markers mangled ("n."→"II.", "VIIL"→"VIII"). A correction map handles most.
  - **OPEN DECISION FOR YOSHI — verse division.** Box 1918 divides the text into 32 chapters of continuous prose with **no verse numbers**. Every other corpus edition is verse-numbered. Options: (a) one chapter = one verse; (b) sentence-split into verses; (c) adopt the standard modern AoA versification (the verse divisions carried by Cepher / the Rubinkiewicz line). This is a corpus-structural call — it should be Yoshi's, not invented in the parser.
  - The pseudepigrapha.com page carries two clean verse-numbered translations but both are "Translator unknown" (likely the copyrighted Rubinkiewicz OTP text) — not safe to republish.
  - **Recommend:** a focused Box-1918 parse wheel, opened with the verse-division decision.
- **Alphabet of Ben Sirach.** Still source-unresolved AND carries a voice-skill content concern: the medieval *Alphabet of Ben Sira* is a satirical/legendary text with crude and bawdy content (the Lilith narrative, scatological humour). It should get a Yoshi voice-skill pre-screen — like the Gospel of Mary pre-screen in Session 32 — *before* any sourcing, not after.

### Session 50 (2026-05-15)

**Chrome-sourcing wheel — Apocalypse of Abraham landed.** This finishes the second of the three Chrome-wheel books (Adam & Eve I & II landed Session 49; the Apocalypse of Abraham source PDF was already on disk from a prior session, so no Chrome fetch was needed this session — local-files-first).

**Done this session — `apocalypse-of-abraham` edition (NEW):** 1 book / 32 chapters / 293 verses.
- **Source:** G. H. Box's 1918 translation (*The Apocalypse of Abraham*, SPCK "Translations of Early Documents"), public domain. PDF on disk at `~/Downloads/box-1918-apoc-abraham.pdf` (176 pp). Extracted with `pdftotext -layout` per the Session 49 assessment.
- **Body/footnote split — hand-verified.** Box's footnote apparatus is *discursive scholarly commentary* (manuscript variants, scripture cross-refs, citations of Lueken/Bonwetsch/etc.), not terse apparatus — content-density heuristics could not separate it reliably, and footnote blocks frequently continue from the previous page with no marker on the current page. The body/footnote split was therefore **hand-verified against the `-layout` output for all 51 pages** of the translation (lines 1443–5172; line 5173 onward is the editorial "Additional Notes" section). The split table lives in `outputs/extract_box_body.py` (`BODY_RANGES`).
- **Not republished:** Box's running headers, page folios, the full textual-critical footnote apparatus, his editorial section sub-headings (chapter-group labels), his square-bracket manuscript-variant markers (text inside the brackets is *retained*), and the post-text editorial sections (Additional Notes, Appendix I/II/III, the long Introduction). Same standing practice as the Sonnini and Adam-Eve parsers with their editorial front/back matter.
- **OCR cleanup** applied per the Session 49 assessment list plus what the full read surfaced (Abrahaffl→Abraham, hght→light, inteUigence→intelligence, tihe→the, -ccst→seest, Tared→Jared, Roog (Reu)→Reu, mangled chapter markers `n.`→II, `XI L`→XII, `XXL`→XXI, `Vni`→VIII, `XXVn`→XXVII, etc.); footnote-reference carets/asterisks/digits stripped; ~16 floating-punctuation lines and ~12 word-order scrambles (a pdftotext `-layout` artifact of justified lines) hand-repaired.
- **Pipeline:** `pdftotext -layout` → `_session50_extract_box_body.py` (footnote/header strip — carries the hand-verified 51-page `BODY_RANGES` split table) → `_session50_clean_box_body.py` + hand pass → `box-1918-cleaned-prose.txt` → `_session50_split_apocalypse_abraham.py` (sentence-split) → `source-texts/apocalypse-of-abraham/apocalypse-of-abraham.txt` → `restore.py` → `apocalypse-of-abraham-restored.txt` → `restoration-pipeline/parse_apocalypse_abraham_edition.py` → `source-texts/parsed/apocalypse-of-abraham.json`. The three `_session50_*` build scripts are preserved in `restoration-pipeline/` (the Session-49 `_session49_` pattern) and the hand-cleaned prose intermediate at `source-texts/apocalypse-of-abraham/box-1918-cleaned-prose.txt`, so the build is reproducible; the permanent parser `parse_apocalypse_abraham_edition.py` is committed.
- Wired into `api/seed.py`: `EDITION_PROFILES["apocalypse-of-abraham"]` (witness_category `pseudepigrapha`, tier `extras`, sort_offset 350, pipeline phase4-v2) + `JSON_FILE_FOR_EDITION`. `seed.py --dry-run` lifts clean: **14 editions / 157 books / 2,569 chapters / 52,096 verses** (AoA delta: +1 edition, +1 book, +32 chapters, +293 verses).

**Versification decision (Session 50) — recorded here per the verbal-answers-transcribe discipline.** The verse-division question was surfaced to Yoshi (the three Session-49 options: chapter-as-verse / sentence-split / standard AoA versification). Yoshi: *"you decide the best for us."* Investigation found that **option (c), the standard AoA versification, is not cleanly executable** — it belongs to the copyrighted Cepher / OTP / Rubinkiewicz editions, no public-domain versified AoA exists, and this manifest's own discipline bars republishing Cepher's English; mapping Box's 32-chapter prose onto a guessed scheme would be neither truly "standard" nor clean. **Decision applied (Claude, on Yoshi's explicit delegation): sentence-split** — each sentence of Box's prose becomes one verse. It is honest (does not fake a standard), granular, fully reproducible (the split is mechanical), and consistent with the verse-numbered corpus. This is an edition-versification decision, not a corpus-wide rule — it is recorded, not elevated. **Reversible** if Yoshi prefers chapter-as-verse or wants standard versification sourced via Chrome in a future wheel.

**Christian-interpolation passage in Chapter 29 — surfaced to Yoshi, decided.** Box prints part of Chapter 29 (verses 5–14 in this edition — the vision of "the man... insulted and beaten... worshipped by the heathen with Azazel," whom Box's footnote identifies as intended to be Jesus) in italic type, and his footnote calls it "a Christian interpolation (probably a Jewish-Christian one)" — attested in the A and K manuscripts, absent from S. It is carried in the edition as part of Box's text (the italics could not be detected from the PDF text layer). **Decision (Yoshi, Session 50): keep.** Reviewed and decided — Chapter 29:5–14 stays in the edition as part of Box's text, unaltered. Edition-content decision, recorded not elevated.

**Source typo caught and logged.** None this session — Box 1918 is a clean printed edition; the only damage was OCR-layer noise in the PDF, all mechanical.

**Still open after Session 50:**
- **Alphabet of Ben Sirach** — unchanged from Session 49: still source-unresolved AND needs a Yoshi voice-skill pre-screen before sourcing (crude/bawdy medieval content). This is the third Chrome-wheel book and remains blocked on both a source decision and a voice screen.
- The live seed (`seed.py --seed-only`) remains an un-run deploy gate — Sonnini Acts 29, Adam & Eve I & II, and now the Apocalypse of Abraham are all parsed and seed-wired but not serving; the live API still serves the pre-Sonnini corpus.

### Session 51 (2026-05-15)

**Chrome-sourcing wheel — Alphabet of Ben Sirach screened out. The three-book Chrome wheel is now complete: two landed (Adam & Eve I & II, Session 49; Apocalypse of Abraham, Session 50), one screened out (Alphabet of Ben Sirach, this session).**

This wheel opened, per the locked screen-first discipline, with a voice-skill pre-screen of the text's content — the same screen the Gospel of Mary received in Session 32 — *before* any sourcing. The full voice skill (`SKILL.md` + all three reference files) was read before the screen. Full pre-screen report: `_ALPHABET_BEN_SIRA_VOICE_PRESCREEN_SESSION51.md`.

**Pre-screen findings.** The *Alphabet of Ben Sira* ("Aleph Beyt Siram") is an anonymous medieval frame-tale anthology (c. 700–1000 CE, Islamic world) — **not** the canonical Wisdom of Sirach / Ecclesiasticus, which the corpus already carries (KJV apocrypha edition + `apocrypha-charles-vol1/sirach.md`). Four screen concerns: (1) it is a different *category* of text — medieval satire, condemned as obscene within its own tradition, not a covenant or revelatory witness like everything else in the extras tier; (2) its frame-narrative premise degrades the prophet Yirmeyahu (Jeremiah) with a crude parody-conception — and Jeremiah 16:19 is a named anchor scripture of the series; (3) its signature Lilith narrative is a rival origin myth (Adam's "first wife" formed from the earth as his equal) that directly contradicts the voice skill's load-bearing Adam reading — the woman made from Adam's body, not from the earth/the nations; (4) its body content is structurally crude and bawdy, unfit for a reader-facing study-Bible surface under the ministry voice. Outcome profile sits closer to the Gospel of Mary drop than the Ascension of Isaiah keep — though for different reasons (not Gnostic heresy, but a non-witness category + a degrading premise + a contradicting origin myth + unfit content).

**Source-availability picture (secondary).** No clean complete public-domain English translation was confirmed to exist. The standard English translation (Norman Bronznick, in Stern & Mirsky, *Rabbinic Fantasies*, Yale Judaica Series) is under copyright; the 19th-century editions (Steinschneider 1854/1858; Eisenstein, *Otzar Midrashim*, 1915) are Hebrew. One unverified PD possibility — Charles Taylor, "The Alphabet of Ben Sira," *Journal of Philology* 30 (1907) — could not be confirmed as a full translation. So even a "keep" would not have landed this wheel; it would only have converted the block from "screen + source" to "source."

**Decision (Yoshi, Session 51) — recorded here per the verbal-answers-transcribe discipline.** Asked, with the pre-screen recommendation leaning Drop, how to handle the Alphabet of Ben Sirach. Yoshi: *"trash it."* **Decision applied: DROPPED from the manifest.** The B-1 Cepher Shamayim row is struck (the same way the Gospel of Mary row was struck in Session 32), and the inventory row in `SOURCE_TEXT_INVENTORY.md` is struck to match. This is a corpus-structural call made by Yoshi, not authored by Claude — recorded, not elevated.

**Still open after Session 51:**
- The live seed (`seed.py --seed-only`) remains an un-run deploy gate — Sonnini Acts 29, Adam & Eve I & II, and the Apocalypse of Abraham are all parsed and seed-wired but not serving; the live API still serves the pre-Sonnini corpus.
- Q39 commentary fix (the Enoch commentary; report at `commentaries/_Q39_VOICE_RECHECK_SESSION48.md`), the Jasher/Jubilees commentary parser pass, tier wiring, the FRIENDS_FAMILY reactivation flow, and the row-by-row reconciliation of this manifest against `seed.py` and `parsed/` all remain pending.
- Brit HaTorah and Alphabet of David remain source-unresolved (Q5, Q6) — both, like the Alphabet of Ben Sirach, were flagged in the inventory as possibly having no clean PD source.

### Session 52 (2026-05-15)

**Wheel: "Lord of Spirits" voice screen + corpus-structural finding.** Session 52 opened on the Q39 commentary fix + live seed wheel (Yoshi's pick at the wheel gate, Option C — the full gate). Scoping Option C against `parsed/enoch.json` surfaced two things the Q39 report did not have in view; Yoshi paused the Q39 wheel and made the "Lord of Spirits" investigation the session's wheel. Full report: `_LORD_OF_SPIRITS_VOICE_SCREEN_SESSION52.md`. The full voice skill (`SKILL.md` + all three reference files) was read before the screen.

**Corpus-structural finding — `parsed/enoch.json` is the pre-restoration parse.** `restoration-pipeline/parse_published_editions.py` parses `existing-restored-editions/*.txt` straight into `parsed/*.json` and does **not** invoke `restore.py`. `enoch.json` / `jasher.json` / `jubilees.json` are all timestamped May 10 07:02 — raw published parses. The newer PD editions each carry a real `-restored.txt` artifact; Enoch/Jasher/Jubilees have none. The Phase-3 validation run (`INTENTIONAL_VARIANCES.md`) diffed *what `restore.py` would produce* against the published parse, found 64/1,367 Enoch verses divergent (all "published-edition gap"), and logged the conclusion *"Pipeline output for the app is already correct"* — but that pipeline output was **validated, not landed**. The whole Session-48 sweep list is still un-restored in the live corpus file: `Lord of Spirits` ×13 (11 verses), `Lord of the sheep` ×33, `Lord of lords` (9:4), bare `Lord` (81:3), 18 son-of-Adam verses, `Israel` in the 56:4 subheading (which still carries Charles's embedded editorial subheading text). This is why the Q39 report's premise — that Red Line #12 was already applied to the verse text — was wrong.

**Lord of Spirits render — decision (Yoshi, Session 52) — recorded here per the verbal-answers-transcribe discipline.** Yoshi's question was whether 1 Enoch's "Lord of Spirits" should carry the canonical **Yahuah Tseva'oth (Yahuah of Hosts)**. The screen laid out the canon data (*YHWH Tseva'ot*, ~235–285 occurrences, absent from the Torah, first at 1 Samuel 1:3, KJV "LORD of hosts," NT preserves "Sabaoth") and the 1 Enoch data (the title is widely paralleled to *Yahuah Tseva'oth* by scholars, but the Book of Parables is the one section of 1 Enoch absent from Qumran — so the equation is inference, not a documented original), through the voice-skill lens (external editions are *data*, not authority; the convention is *name restoration, not retranslation*; `Yahuah Tseva'oth` would be a deliberate Melek-Tsadiq-style elevation, not a default). Asked, with the recommendation leaning name-restoration: **Yoshi chose `Yahuah (God) of Spirits` — name restoration.** Decision applied as the convention: the 13 verse + 1 commentary `Lord of Spirits` stragglers are missed restorations to be swept to `Yahuah (God) of Spirits`, matching the 145/218 already in the file. Edition-render decision, recorded not elevated. (`(Lord)` vs `(God)` parenthetical: the `restore.py` self-tests expect `Yahuah (Lord) of Spirits`; the edition file and the spine convention use `(God)` — reconcile to `(God)`.)

**Next-wheel decision (Yoshi, Session 52).** Asked what the next wheel should be given the corpus-structural finding. **Yoshi chose: the restoration-pass wheel first** — open a wheel that runs the validated `restore.py` sweep into `parsed/enoch.json` (and checks `jasher.json` / `jubilees.json` for the same gap), landing the full Session-48 sweep list, so the resumed Q39 commentary fix then runs on a corpus that is actually restored underneath it. Q39 + live seed are sequenced *after* the restoration pass.

**Git state.** Unchanged from the Session 51 close — Sessions 50 and 51 were still uncommitted at the Session 52 open (`HEAD` at `025d3a1 Session 49`), confirming neither was pushed from the Mac. Session 52 adds: `M source-texts/DOWNLOAD_MANIFEST.md`, `M source-texts/SOURCE_TEXT_INVENTORY.md`; untracked `source-texts/_LORD_OF_SPIRITS_VOICE_SCREEN_SESSION52.md`. No `parsed/` or `seed.py` or pipeline code was modified this session — the screen surfaces and stops; no edit lands until the restoration-pass wheel runs.

**Still open after Session 52:**
- **The restoration-pass wheel (Session 53 opener).** Run the validated `restore.py` sweep into `parsed/enoch.json`; check `jasher.json` / `jubilees.json` for the same pre-restoration gap. This is now sequenced ahead of the resumed Q39 fix.
- Q39 commentary fix (Option C — the full gate; Yoshi's pick) resumes *after* the restoration pass, on the restored corpus. The Q39 report's finding #1 should be re-read against the restored verse text.
- The live seed (`seed.py --seed-only`) remains an un-run deploy gate — Sonnini Acts 29, Adam & Eve I & II, and the Apocalypse of Abraham parsed and seed-wired but not serving.
- Jasher/Jubilees commentary parser pass, tier wiring, FRIENDS_FAMILY reactivation flow, and the row-by-row manifest/`seed.py`/`parsed/` reconciliation all remain pending.
- Brit HaTorah and Alphabet of David remain source-unresolved (Q5, Q6).

### Session 53 (2026-05-15)

**Wheel: the restoration-pass wheel — Yoshi's locked Session-52 pick.** Ran the validated `restore.py` sweep into `parsed/enoch.json`, checked `jasher.json` / `jubilees.json` for the same pre-restoration gap, and landed what was cleanly landable. The full voice skill (`SKILL.md` + all three reference files) was read before any edit — the Sacred Names Convention and Red Line #12 are load-bearing for this wheel. Git state at open confirmed the Session-52 caveat exactly: `HEAD` still at `025d3a1 Session 49`, Sessions 50/51/52 all still uncommitted/untracked (none pushed from the Mac).

**Mechanism (decided honestly, per the handoff).** Verified first that the current `restore.py` reproduces the May-10 validated Enoch diff byte-for-byte (it does — `restore.py` has not drifted on Enoch since the Phase-3 validation), so the validated pipeline output is reproducible. Then ran `restore.py` (default mode, the mode `validate_verse_diff.py` uses for these editions) over the `verses[].text` strings of each parsed JSON and wrote the result back. `front_matter` and the `chapter.commentary` field were never touched. Landing scripts: `restoration-pipeline/_session53_land_enoch_restoration.py` and `restoration-pipeline/_session53_land_jasher_jubilees.py`.

**`(Lord)` → `(God)` reconciliation applied (Yoshi's Session-52 decision 2).** `restore.py`'s `Lord_mixed` rule produced `Yahuah (Lord)`; the voice-skill Sacred Names Convention restores both *the LORD* and *the Lord* to `Yahuah (God)`, the published editions use `(God)`, and `restore.py`'s own module docstring already said `(God)`. The `Lord_mixed` rule and the five affected self-tests were reconciled to `Yahuah (God)`. `restore.py` self-tests: **83/83 pass.** The possessive-form rule (`Lord's` → `Yahuah's (Lord's)`) was left as-is — different rule, echo-the-input convention, not in scope for the Session-52 decision; flagged here as an open consistency question for Yoshi.

**Enoch — landed and verified.** 64 verses restored in `parsed/enoch.json` (45 `Lord of X` → `Yahuah (God) of X`, 18 son-of-Adam verses, 1 `Israel` 56:4 subheading), matching the validated `validation-reports/enoch-verse-diff.md` exactly with the `(God)` reconciliation. Re-running `validate_verse_diff.py enoch` against the written file now reports **0/1,367 diffs (100%)** — the parsed JSON now matches validated pipeline output and is idempotent under `restore.py`. Only `verses[].text` changed; `front_matter` and `chapter.commentary` untouched.

**Typo fixes — decision (Yoshi, Session 53) — recorded per the verbal-answers-transcribe discipline.** Three pre-existing missing-space typos were surfaced (`sheepbrought` in verse 89:16; `Spiritsand` in ch.48 commentary; `Spiritscommanded` in ch.54 commentary) — all three also present in the published Enoch edition `.txt`, so fixing them in the app JSON creates a new intentional variance from the published `.docx`. Asked how to handle them: **Yoshi chose "fix all three now."** Applied to `parsed/enoch.json`; logged in `INTENTIONAL_VARIANCES.md` as Session-53 intentional variances for the next `.docx` revision pass.

**Corpus-structural finding — Jasher and Jubilees have commentary embedded in the verse-text field.** Unlike Enoch (whose commentary lives in a populated, separate `chapter.commentary` field), `jasher.json` and `jubilees.json` have `chapter.commentary` **empty** — Yoshi's inline commentary is embedded inside `verses[].text`. The pattern: each chapter's `verses[]` array holds genuine short scripture verses (~50–450 chars) plus a few entries carrying a large appended commentary blob (2,000–184,000 chars; Jasher ch.91 also carries a cross-reference apparatus). This is open handoff item (d), the commentary parser pass. Consequence: the raw verse-text sweep splits — **Jasher: 562 pure scripture-verse diffs + 106 that touch embedded commentary prose; Jubilees: 3 pure verse diffs + 7 that touch embedded commentary.** Several commentary-embedded diffs are genuine voice-judgment calls, not mechanical gaps (e.g. Jasher 91:18 restores Psalm 110:1's *David's Lord* → *David's Yahuah (God)*, flattening the very distinction that commentary teaches) — the kind of nuance the Q39 commentary wheel exists to gate.

**Jasher/Jubilees landing — decisions (Yoshi, Session 53) — recorded per the verbal-answers-transcribe discipline.** First asked (before the embedded-commentary finding was fully scoped): Yoshi chose "land both." Re-surfaced with the corpus-structural finding and the recommended split; Yoshi's answer: **"ok, but not every time Lord is mentioned is Yahuah."** Step 1 applied: **landed the pure scripture-verse restorations** — 562 Jasher + 3 Jubilees (criterion: `len(text) ≤ 600` and no `« • • •` commentary marker), verified to contain **zero** `Lord` → `Yahuah` restorations (only `Israel`/`Judah`/`sons of men`/`Melchizedek`). Then asked how to finish the held set; **Yoshi chose "land all of it now, flat construct."** Step 2 applied: **landed the previously-held 106 Jasher + 7 Jubilees commentary-embedded restorations** with the current flat `restore.py`. This resolves the `Lord`/`God` cases in commentary by the flat map for now — including Jasher 91:18's Psalm 110:1 *David's Lord* → *David's Yahuah (God)* — and is **fully reversible** (`restore.py` is deterministic, every original is in git at `HEAD`); those cases get re-run when the fuller Sacred Names construct is built. **Yoshi's caution still stands and is transcribed:** *not every time "Lord" is mentioned is Yahuah* — the flat map does not honor this; the fuller construct (the El / El Shaddai / Elohim / Yahuah / Yahuah Tseva'ot / Adonai breadth, under discussion) is where the `Lord`/`God` cases get proper case-by-case treatment, and the whole corpus including the canon gets re-run under it. The commentary parser pass (item d) is still needed — restoring the text in place does not separate commentary from verse.

**Validation reports regenerated** (`restoration-pipeline/validation-reports/`): all three editions now report **0 diffs (100%)** — `enoch` 0/1,367, `jasher` 0/3,903, `jubilees` 0/1,038. Every edition's `verses[].text` now matches deterministic pipeline output and is idempotent under `restore.py`.

**Git state at close.** `HEAD` still `025d3a1 Session 49` — Sessions 50/51/52 remain uncommitted underneath (the sandbox has no GitHub credentials; Yoshi commits/pushes from the Mac — confirm with him which of 50–52 were pushed before treating the tree as clean). Session 53 adds: `M restoration-pipeline/restore.py`, `M restoration-pipeline/validation-reports/{enoch,jasher,jubilees}-verse-diff.md`, `M source-texts/parsed/{enoch,jasher,jubilees}.json` (all three editions fully restored in `verses[].text`), `M source-texts/DOWNLOAD_MANIFEST.md`, `M restoration-pipeline/INTENTIONAL_VARIANCES.md`, `M source-texts/SOURCE_TEXT_INVENTORY.md`; untracked `restoration-pipeline/_session53_land_enoch_restoration.py`, `_session53_land_jasher_jubilees.py`, `_session53_land_jasher_jubilees_full.py`. Suggested commit from the Mac, on top of the 50–52 stack: `Session 53: restoration pass landed — Enoch/Jasher/Jubilees verse text fully restored; (Lord)→(God) reconciled`.

**Still open after Session 53:**
- **The fuller Sacred Names construct — opened for discussion this session.** Yoshi flagged that `restore.py` is a flat 1:1 map (`Lord`/`LORD` → `Yahuah (God)`, `God` → `Elohim (God)`) and wants the full breadth used — `El`, `El Shaddai`, `Elohim`, `Yahuah`, `Yahuah Tseva'ot`, `Adonai`. `El Shaddai`/`El Elyon` are currently *protected but not produced*; `Yahuah Tseva'ot`/`Adonai`/`El` are absent entirely. Decisions pending from Yoshi: the name list + parentheticals, and the canon-vs-extras split (the KJV canon encodes most distinctions in its typography; the Charles/Noah extras mostly do not). This is a voice-skill `SKILL.md` change + a `restore.py` rework + a re-run of the whole corpus (canon included, and the Session-53 restorations) under the new construct.
- **Jasher/Jubilees commentary parser pass (item d).** The restoration is now landed in `verses[].text`, but the commentary is still embedded there rather than separated into `chapter.commentary`. The parser pass still needs to separate them.
- Q39 commentary fix (Option C — the full gate; Yoshi's pick) resumes now, on the restored Enoch corpus. The Q39 report's finding #1 (the 83 commentary son-of-man instances) should be re-read against the now-restored verse text; Yoshi's Session-52 convention answers carry (Head of Days; include the 15 verse-text son-of-man restorations).
- The live seed (`seed.py --seed-only`) remains an un-run deploy gate — Sonnini Acts 29, Adam & Eve I & II, and the Apocalypse of Abraham parsed and seed-wired but not serving.
- `restore.py` possessive-form `(Lord's)` vs `(God's)` consistency — flagged this session, not decided (likely folds into the Sacred Names construct rework). Tier wiring, FRIENDS_FAMILY reactivation flow, and the row-by-row manifest/`seed.py`/`parsed/` reconciliation all remain pending.
- Roadmap drift (`BIBLE_APP_ROADMAP.md` Section X stops at Session 48; Sessions 49–53 logged here instead) — Yoshi's call whether to back-fill.
- Brit HaTorah and Alphabet of David remain source-unresolved (Q5, Q6).

### Session 54 (2026-05-15) — Sacred Names construct expansion landed; Phase D queued

**Wheel: the Sacred Names construct expansion — Yoshi's locked Session-53 close pick.** Resolved the standing caution from Session 53 (*not every time "Lord" is mentioned is Yahuah*) and elevated 21 new compound divine names from translator's-call to pipeline-enforced status. Voice skill loaded and verified at session open (Operating Disciplines, ⚠ WARNING TO CLAUDE, Red Lines #11–12 layered, Sacred Names Convention section). Git state at open confirmed the handoff caveat: `HEAD` still `025d3a1 Session 49`; Sessions 50/51/52/53 all stacked uncommitted on the Mac.

**Phase A — current construct surfaced.** Re-read `restore.py` (lines ~110–460) and presented the pipeline-enforced state to Yoshi: flat `LORD`/`Lord` → `Yahuah (God)`, `God` → `Elohim (God)`, with `El Shaddai`/`El Elyon` protected-but-not-produced and `El`/`Yahuah Tseva'ot`/`Adonai`/`Yah` absent entirely. Surfaced the canon vs extras typography asymmetry (canon's `<nd>` carries typography; extras flatten it) and the possessive parenthetical inconsistency.

**Phase B — five Q's settled** (Yoshi's decisions, transcribed per Verbal-Answers-Transcribe):

- **Q1 (name list):** all 21 compound names elevated — `El`, `El Elyon`, `El Shaddai`, `El Olam`, `El Roi`, `El Gibbor`, `Elohim`, `Yah`, `Yahuah`, the seven Yahuah-place / Yahuah-construct names (`Yireh`, `Nissi`, `Shalom`, `Tsidkenu`, `Shammah`, `Rapha`, `Ra'ah`), `Yahuah Tseva'ot`, the five Yahuah-Eloh-possessive names (`Elohayka` 2nd-sg, `Elohaychem` 2nd-pl, `Eloheinu` 1st-pl, `Elohai` 1st-sg, `Elohav` 3rd-sg), `Adonai`, `Avi-ad`, `Sar Shalom`, `Ehyeh asher Ehyeh`. Plus the existing `Melek Tsadiq`, `Yahusha`, `Messiah`, `Ruach HaKodesh`.
- **Q2 (spellings):** `Tseva'ot` (not Tseva'oth) and `Ra'ah` (not Ro'eh). Other spellings as Claude proposed.
- **Q3 (base singles):** unchanged from current pipeline rules — the new compound rules layer on top and fire first (longer phrases win).
- **Q4 (canon vs extras):** one construct, applied to both. English-phrase signals work without typography. The `<nd>` flattening doesn't block this wheel.
- **Q5 (parenthetical convention):** universal source-echo. Every parenthetical reflects source casing exactly — reverses Session 52/53 normalization for the base singles and locks the whole pipeline to one consistent convention.

Two clarifier calls Yoshi delegated to Claude (per Self-Sufficient Application discipline: decide, document, note reversibility, move): (a) Adonai's English signal — option (ii), fires only on the typography-signaled `Adonai Yahuah` compound (`the Lord GOD` — mixed-case Lord + small-caps GOD). Canon-only; dormant in the current flat-canon parse until Phase D re-parse preserves `<nd>`. Standalone mixed-case `Lord` defaults to `Yahuah (Lord)`. (b) The Yahuah Elohayka family extends the construct because the English-phrase signals (`the Lord thy God` / `your God` / `our God` / `my God` / `his God`) are unambiguous regardless of typography — fires in both canon and extras.

**Phase C — landed in this session.** `SKILL.md` Sacred Names Convention section rewritten: source-echo principle added; singles split into 8 (added `El` and `Adonai`); compound divine names new sub-section organized by family (YHWH constructions, El constructions, Isaiah 9:6 titles, Adonai construction, Messianic and personal); translator's-call note shortened; Scripture Quotations sub-section rewritten compounds-first. Patriarch names + Son of Adam absolute + kaph-comparative carveout unchanged. Bookcraft-mechanics procedure followed: extract → edit → grep-verify → rebuild zip → archive outgoing → install new → present for Save click. Archived: `~/Desktop/_yoshi-voice-old-versions/yoshi-voice_2026-05-15_pre-session54-sacred-names-expansion.skill`.

`restore.py` rework: 23 new pipeline rules (the 21 from Q1 + canon-only `adonai_yahuah` + `el_elyon_with_god`/`el_elyon_high` pair for "most high God" vs standalone "most High"). Source-echo applied to `LORD_caps`, `Lord_mixed` (reverses Session 53), `lord_god_compound` / `lord_god_naked` (capture source casing for both `the` and `LORD`/`Lord`), plus matching possessive variants. `_HEBREW_HEADS` extended with all new Hebrew names. **Self-tests: 108/108 passing** (up from 83/83 — 25 new tests added, 14 existing updated for source-echo + behavior changes). Idempotency verified.

**Phase D queued — does NOT land this session.** Scope agreed with Yoshi: re-parse everything from raw sources (trash all existing `parsed/*.json` files first to prevent duplicates), re-run every `parse_*.py` with parser improvements (`<nd>` preservation for canon from `eng-kjv_usfx.xml` — 6,957 `<nd>` tags currently flattened; commentary separation for Jasher/Jubilees — handoff item d); then re-restore under the new construct end-to-end. The pipeline-as-rebuilt becomes reusable infrastructure for fixing the published `.docx` books after the app ships (Yoshi's note).

**Tier-content note (Yoshi, Session 54) — recorded per the verbal-answers-transcribe discipline.** Yoshi flagged a tier-content decision mid-wheel so it would not be lost: Free tier gets Strong's concordance; the $1.99 tier gets BDB (Brown-Driver-Briggs Hebrew lexicon) and other advanced lexical tools. Open question: whether the $1.99 tier maps to the existing "Notes" tier from the Session 47 Free/Notes/Library lock, or is a new distinct tier. Confirm at Session 55 open and update `BIBLE_APP_ROADMAP.md` tier-wiring section to match.

**Git state at close.** `HEAD` still `025d3a1 Session 49`. Sessions 50–54 all stacked uncommitted (sandbox has no GitHub credentials; Yoshi commits/pushes from the Mac). Session 54 adds: `M restoration-pipeline/restore.py`, `M source-texts/DOWNLOAD_MANIFEST.md`, `M restoration-pipeline/INTENTIONAL_VARIANCES.md`, `M source-texts/SOURCE_TEXT_INVENTORY.md`. Bundle update outside the `App/` git repo: `M ~/Desktop/Remnant of Promise (official documents)/yoshi-voice.skill` (active) and `+ ~/Desktop/_yoshi-voice-old-versions/yoshi-voice_2026-05-15_pre-session54-sacred-names-expansion.skill` (archived). Suggested commit from the Mac, on top of the 50–53 stack: `Session 54: Sacred Names construct expansion — 23 new compound rules, source-echo locked, voice skill updated`.

**Still open after Session 54:**
- **Phase D (the big work).** Re-parse all editions from raw sources + re-restore under the new construct. Multi-session arc starting Session 55.
- **Adonai Yahuah rule activation.** Rule is in `restore.py` but dormant against the current `canon.json` because `<nd>` was flattened. Activates after Phase D re-parses canon with `<nd>` preservation.
- **Jasher/Jubilees commentary parser pass (item d).** Still embedded in `verses[].text`. Folds into Phase D's re-parse work.
- **Q39 commentary fix (Option C — the full gate).** Resumes after Phase D delivers the restored corpus.
- **Live seed (`seed.py --seed-only`).** Un-run deploy gate; runs after Phase D.
- **Tier wiring + tier-content map.** Free = Strong's, $1.99 = BDB lexicon and similar (Yoshi's Session 54 call); confirm $1.99 maps to Notes tier or a new tier; transcribe into `BIBLE_APP_ROADMAP.md`. FRIENDS_FAMILY reactivation still pending since Session 43.
- **Row-by-row reconciliation** of `DOWNLOAD_MANIFEST.md` against `seed.py` and `parsed/`.
- **Roadmap drift.** `BIBLE_APP_ROADMAP.md` Section X stops at Session 48; Sessions 49–54 logged here. Yoshi's call whether to back-fill.
- **Brit HaTorah and Alphabet of David** remain source-unresolved (Q5, Q6).
