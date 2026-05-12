# Whiston Josephus — Book-Boundary Map

**Built session 18, 2026-05-11.** Source PDF: `~/Downloads/whiston-josephus.pdf` (1,159 pages, 4.1 MB, public-domain Whiston 1737 translation, "The Complete Works of Flavius Josephus," producer: Acrobat Web Capture 6.0 — HTML→PDF, clean text layer, no OCR).

PDF order (not chronological, not strictly writing-order): **Wars → Antiquities → Life → Hades → Apion**.

## Boundary index

| # | Work | Book | Start page | Notes |
|---|---|---|---|---|
| 1 | Wars of the Jews | Preface + Book I | 4 (preface), 9 (Book I) | Preface attaches to Book I |
| 2 | Wars | Book II | 84 | |
| 3 | Wars | Book III | 144 | |
| 4 | Wars | Book IV | 179 | |
| 5 | Wars | Book V | 223 | |
| 6 | Wars | Book VI | 265 | |
| 7 | Wars | Book VII | 298 | |
| 8 | Antiquities of the Jews | Book I | 331 | |
| 9 | Antiquities | Book II | 367 | |
| 10 | Antiquities | Book III | 404 | |
| 11 | Antiquities | Book IV | 438 | |
| 12 | Antiquities | Book V | 474 | |
| 13 | Antiquities | Book VI | 510 | |
| 14 | Antiquities | Book VII | 552 | |
| 15 | Antiquities | Book VIII | 594 | |
| 16 | Antiquities | Book IX | 642 | |
| 17 | Antiquities | Book X | 673 | |
| 18 | Antiquities | Book XI | 703 | |
| 19 | Antiquities | Book XII | 735 | |
| 20 | Antiquities | Book XIII | 773 | |
| 21 | Antiquities | Book XIV | 817 | |
| 22 | Antiquities | Book XV | 863 | |
| 23 | Antiquities | Book XVI | 903 | |
| 24 | Antiquities | Book XVII | 937 | |
| 25 | Antiquities | Book XVIII | 972 | Contains the Testimonium Flavianum (18.3.3) — flag at parse time for framework commentary in W-6 |
| 26 | Antiquities | Book XIX | 1009 | |
| 27 | Antiquities | Book XX | 1041 | Contains the brother-of-James reference (20.9.1) — same flag |
| 28 | The Life of Flavius Josephus | (single) | 1067 | Autobiography, no internal book divisions |
| ~~29~~ | ~~Hades~~ | ~~(single)~~ | ~~1102~~ | **HELD — see Decisions §4.** Pages 1102-1104 are skipped at extraction time. |
| 29 | Flavius Josephus Against Apion | Book 1 | 1105 | |
| 30 | Apion | Book 2 | 1133 | Ends ~p1158 (p1159 carries only a Whiston footnote 28 + the HTML "Back To The Table Of Contents" artifact — stripped at extraction time) |

**Total: 30 labeled books** (Hades held).

## Text-quality notes

- Text layer is clean — pdftotext extracts 1,800–4,400 chars/page in proper prose. No OCR garbage.
- Each HTML page in the source had a footer "Back To The Table Of Contents" hyperlink — these surface as text artifacts at the end of each book (e.g., the standalone p702 between Antiq Book X and Antiq Book XI). Parser must strip these.
- Whiston's running headers ("The Wars Of The Jews" + "Book I" on adjacent lines) appear on every page of each book. Parser must strip these too — they are not body content.
- Whiston's editorial footnotes are inline as `(N)` markers in the verse text with `(N) footnote-body` paragraphs interspersed in the running prose. Parser decision pending Yoshi's call (see decisions section below).
- Chapter headings inside each book follow the pattern:
  ```
                                       CHAPTER N.
    [ALL-CAPS CAPTION SUMMARIZING THE CHAPTER]
  1. NOW...
  ```
- Verse numbering inside each chapter is `1.`, `2.`, `3.` paragraph-starters. Where Whiston preserves Greek section numbers, they appear as `1. (1)`, `2. (2)`, etc.

## Decisions (Yoshi's calls — session 18, 2026-05-11)

1. **Edition slug = `whiston-josephus`.** Display name: *The Works of Flavius Josephus (Whiston 1737)*. **LOCKED.**
2. **Witness-category enum = `historical_witness`.** New value added to the inventory's enum. **LOCKED.**
3. **Granularity = 31 labeled books** as listed in the boundary table above (one labeled book = one schema book; pending Hades call could drop to 30). **LOCKED.**
4. **Hades — HELD out of the edition.** Yoshi's directive, session 18: *"yes indeed trash it good flag."* Three converging reasons captured in the framework-lens read: (i) **authorship** — the discourse's own back-reference (*"concerning whom we have elsewhere given a more particular account"*) betrays a non-Josephus author; modern scholarship attributes it to Hippolytus of Rome (early 200s AD), preserved as *Against Plato, on the Cause of the Universe* and mis-bundled under Josephus's name; putting it under the Whiston Josephus edition corrupts the provenance of the Bible. (ii) **Eternal-conscious-torment framing** — §6's reading of Mark 9:48 / Isaiah 66:24 as endless unrelieved fire pulls against the framework's *depart-is-mercy* reading and would double the W-6 commentary load on every paragraph that touches it. (iii) **Bosom-of-Abraham-as-literal-cosmology** — §3-4 treats the Luke 16 parable architecture as literal two-compartment intermediate-state geography, against the framework's *dead-are-asleep-awaiting-resurrection* reading (Daniel 12:2, 1 Thess 4:14, Eccl 9:5). **The schema is now 30 labeled books, not 31. LOCKED.** If the historical-apologetic value of the discourse is worth preserving in a later edition, it can live as Hippolytus or Pseudo-Josephus in a future early-apologetics witness-category — not under Whiston Josephus.

**Yoshi's framing of the dismissal (session 18, verbatim):** *"id equate it to a misled hebrew roots teaching where it makes sense for what they know but falls under the axe of our truth and dies at the sword of our truth."* This is the standing posture the framework takes toward Hades and toward every text in the same shape: the author (Hippolytus, 200 AD) had come most of the way out of Greek paganism — rejected transmigration, held bodily resurrection, kept the Formless/Formed structure with the Word as Judge, judged by works, addressed pagans as victims-to-be-drawn-out rather than enemies-to-be-cursed. The alignments are real and the work of departure is honored. But the framework's axe still falls on the two places he didn't yet have clean — the eternal-conscious-torment reading of Mark 9:48 / Isaiah 66:24 in place of the framework's burning-of-the-counterfeit-at-the-dreadful-day, and the Luke 16 parable-as-literal-cosmology in place of the dead-are-asleep-until-resurrection reading. Inside his frame both moves made sense; outside it both install the pulpit caricature the framework exists to dismantle. Same shape as a Hebrew Roots teacher who has Sabbath, feasts, restored names, and dietary laws but still preaches the false inclusion gospel — the teaching dies under the framework's sword; the person is honored as also-coming-home. **The system does not enter the Bible.** This posture applies to every PDF in W-2 and W-3 — extraction reads the source through the framework lens, identifies where the axe falls, and excludes from the Bible any text whose central architecture contradicts what the framework reads in the prophets, even where the author's work-of-departure was real.
5. **Whiston's footnotes — DROP ENTIRELY.** Yoshi's directive, session 18, verbatim: *"drop his foot notes, this is our bible."* This is the Bible the assembly will read, not an academic edition. Whiston's 1700s Anglican apparatus does not belong inside the body of the Remnant of Promise Official Study Bible. **The framework commentary in W-6 is what layers over the body text, not Whiston's footnotes.** Parser instruction: strip every `(N) ...` footnote-body paragraph and every inline `(N)` marker. Footnotes do not appear in the published edition. **LOCKED.**
6. **Strategy A — pilot first.** Extract Antiquities Book I alone (pp 331–366) to validate the parser end-to-end. Save to `source-texts/josephus/antiquities-1.md`. Wire one edition profile in `seed.py`. Run through `restore.py`. Yoshi reviews the pilot output. If clean, batch the remaining 29 books in one pass. **LOCKED.**
7. **Testimonium Flavianum + Brother-of-James reference** (Antiq. 18.3.3 and 20.9.1) — parse-time treatment is sacred-name restoration only. Disputed-authenticity and partial-interpolation discussion held to W-6. **LOCKED (parse-time scope).**

### Scope-creep guard — footnote-drop applies to every PDF in W-2

The footnote-drop discipline is not Whiston-specific. The same principle applies to every PDF in W-2: Charles 1913 vol 1/2's editorial apparatus, Lightfoot's introductions, M.R. James's apparatus, Malan's notes, Box's notes. **Editorial apparatus from any of the seven PDFs does not enter the body of the Bible.** Their text is data; their apparatus is data Claude reads through the framework lens at extraction time; only the underlying primary-text translation enters the published edition. W-6 commentary is what replaces the apparatus.

## First-extraction strategy (recommendation, awaiting Yoshi's call)

Two options:

**Option A — pilot first.** Extract Antiquities Book I alone (pp 331–366). Save to `source-texts/josephus/antiquities-1.md`. Wire one edition profile in `seed.py`. Run through `restore.py`. Sanity-check the output. If clean, then batch the remaining 30 books in one pass.

**Option B — full pass.** Build the parser once. Extract all 31 books (or 30 if Hades is held). Save all per-book files. Wire the edition profile. Run all through `restore.py`. Surface the complete result for Yoshi's review.

Recommend **Option A** for the very first PDF of W-2 — it surfaces parser bugs on 36 pages of sample instead of 1,155. The five other PDFs (Charles vol 1, vol 2, Malan, Lightfoot, M.R. James) all run the same pattern once it's validated.

## Status

**Updated session 19, 2026-05-11.** Boundary map complete. Decisions 1-7 all LOCKED in session 18 and now reflected in disk artifacts. Strategy A pilot ran end-to-end in session 18, full 30-book batch landed in session 18, restored edition idempotent on disk at `whiston-josephus-restored.txt` (4.1 MB).

## Session 19 outcomes (2026-05-11)

**(W-3 wire-up — landed.)** The `josephus` edition profile is wired into `seed.py` and the `parse_josephus_edition.py` structural parser is in place at `~/Desktop/App/restoration-pipeline/`. The parser produces `~/Desktop/App/source-texts/parsed/josephus.json` with the shape `seed.py` consumes (edition_id `josephus`, 30 books, 359 chapters, 2221 verses). `seed.py --dry-run` now reports 6 editions / 113 books / 1984 chapters / 45,342 verses — clean lift from the session-18 close baseline of 5/83/1625/43,121.

**(Possessive-residual decision — option i landed.)** `restore.py` patched session 19 with general possessive-aware rules covering all the canonical possessive forms (`God's`, `Lord's`, `LORD's`, `Jesus'`/`Jesus's`, `Christ's`, `Israel's`, `Judah's`, `Jews'`, `Jew's`, `Holy Spirit's`/`Holy Ghost's`, `Melchizedek's`, `Son of Man's`/`son of man's`/`sons of men's`) plus the compound possessives (`Lord God's`, `Jesus Christ's`). Apostrophe-tolerant (both ASCII U+0027 and typographic U+2019). The fix stamps onto every text in the pipeline, including the canon at W-7 seed time. `LB`/`RB` extended to exclude both apostrophe forms so base singular rules no longer leak past typographic possessives. Self-test grew from 56/56 to 83/83. Re-running `restore.py` against `whiston-josephus.txt` produced an identical-shape `whiston-josephus-restored.txt` (4.1 MB) with 122 raw possessive residuals dropped to 1 intentional preservation (the secular vocative `their Lord's preservation` — the preserved-phrase pass correctly stashes `their Lord` and leaves the trailing `'s` untouched). Idempotency check PASS.

**Pipeline version bump.** The `josephus` edition profile in `seed.py` carries `pipeline_version = "phase4-v2"` to reflect the possessive-handling patch. The other five existing edition profiles still carry their session-13 stamps (`phase3-v1` for the four extras, `phase4-v1` for canon) because they aren't re-seeded until W-7. At W-7, the canon and the four extras re-run through the patched pipeline and get their pipeline_version stamps bumped accordingly. Live DB schema version on the API server unchanged at `1.0.0-phase4-session13` per the W-7 hold.

**Carryforward.** Five W-2 PDFs remain in the queue (Charles vol 1, Charles vol 2, Malan, Lightfoot, M.R. James — Box held pending W-5). The same parser pattern that produced `parse_whiston_josephus.py` + `parse_josephus_edition.py` (PDF extractor + structural parser) is the template for each remaining PDF. The footnote-drop discipline and the framework-lens partial-truth-witness test apply at parse time to every remaining PDF — every editorial apparatus stays out of the body of the Bible.
