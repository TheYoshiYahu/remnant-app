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
> and Eve** (`adam-eve-conflict` edition — 2 books / 101 ch / 1,242 vv). The
> genuinely-still-unsourced items are now: Apocalypse of Abraham (Box 1918),
> Alphabet of Ben Sirach, and the Bucket A items. `web_fetch` is dead for
> sacred-texts.com *and* gutenberg.org (returns empty) — Chrome browser tools
> are the working path. Brit HaTorah and Alphabet of David remain
> source-unresolved (Q5, Q6). A full row-by-row reconciliation of this manifest
> against `seed.py` and `parsed/` is a pending follow-up task.

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
| Chizayon Avraham (Apocalypse of Abraham) | G.H. Box 1918 | https://archive.org/details/AbrahamBOX1918 ; https://www.marquette.edu/maqom/box.pdf | NOT FETCHED |
| Aleph Beyt Davidiy (Alphabet of David) | UNCERTAIN — research needed | (no clean PD source confirmed) | RESEARCH NEEDED |
| Aleph Beyt Siram (Alphabet of Ben Sirach) | 19th c. PD; possibly M. Steinschneider, or Eisenstein *Otzar Midrashim* | TBD | RESEARCH NEEDED |
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
