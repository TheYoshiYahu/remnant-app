# S214 — `pseudepigrapha-charles-vol2` OCR degradation report (re-parse step 1)

**Task:** quantify how degraded the current parse is before re-parsing (per
`SESSION212_CLOSE.md` → "Quantify degradation extent as step 1 so the re-parse
scope is known").

**Measured against:** `source-texts/parsed/pseudepigrapha-charles-vol2.json`
(edition_id `pseudepigrapha`, 6 books, built from
`source-texts/pseudepigrapha-charles-vol2/charles-pseudepigrapha-restored.txt`).

## Root cause — it is the SOURCE TEXT, not the parser

The degradation is not a parser bug. The source `.txt`/`.md` themselves have
**R. H. Charles's critical apparatus interleaved directly into the verse text**:
manuscript sigla (`B-d APS`, `bdg`, `Aa`, `α`), footnote bodies, Greek-glyph
footnote fragments (`ἁπλόtης`, `πάθei`), and cross-reference notes (`Cf. Isa.
v.14`, `Rev. xvi. 9`) sit inline between and inside verses. The original
extraction (`restoration-pipeline/parse_charles_pseudepigrapha.py`) ran on
**pypdf**, which returns text with no coordinate/geometry information — so the
footnote zone at the bottom of each Clarendon-Press page could not be separated
from the body block by position, and the OCR'd apparatus flowed straight into
the verses. The heroic header/footnote-stripping heuristics in that parser
recover some of it, but cannot win against coordinate-blind extraction.

Re-parsing from the *same* `.txt` will therefore not fix it. A cleaner source is
required (see re-parse plan below).

## Degradation signals per book (current parse)

| Book | Verses parsed | Mid-sentence starts (lowercase v.1 char) | Apparatus fragments | Scan-artifact hits | Merged/overlong (>700ch) | **Missing verse numbers (gaps)** |
|---|---:|---:|---:|---:|---:|---:|
| **testaments-xii** | 515 | 314 (60%) | 15 | 31 | 23 | **161** |
| **2-baruch** | 245 | 128 (52%) | 14 | 46 (18%) | 34 | **166** |
| 2-enoch | 107 | 45 (42%) | 11 | 18 | 25 | 56 |
| 3-baruch | 69 | 59 (85%) | 1 | 2 | 0 | 16 |
| 4-maccabees | 163 | 123 (75%) | 1 | 12 | 16 | 139 |
| adam-eve | 20 | 9 | 13 (65%) | 15 (75%) | 12 | 9 |

**Reading the numbers:**

- **"Missing verse numbers (gaps)"** is the most damaging signal. For the two
  in-scope books, the parser emitted 515 (Testaments XII) and 245 (2 Baruch)
  verses, but the internal numbering implies ~676 and ~411 true verses
  respectively. **~24% of Testaments XII verses and ~40% of 2 Baruch verses are
  missing or fused into their neighbours.**
- **"Mid-sentence starts"** (verse begins with a lowercase letter → it was split
  mid-sentence from the prior verse): 60% of Testaments XII verses, 52% of
  2 Baruch verses. Verse boundaries are unreliable.
- **Concrete examples** confirmed in `SESSION212_CLOSE.md`: Test. Gad 62:2 begins
  mid-sentence (`your hearts, love one another…`); Test. Benjamin 89:5 has a
  next-verse fragment wedged into its middle. Adam-eve ch.1 v.10 is a giant blob
  containing Charles-note text (`'Conflict of A. and E.' says 'five'`), scan junk
  (`a//`, `XXVi. XXVii, XXViii`), and content from a different section entirely;
  v.2 is missing.

## Scope of the re-parse

Both in-scope books (**Testaments XII** and **2 Baruch**) are severely degraded
and both must be fully re-parsed. The other four books in the edition (2 Enoch,
3 Baruch, 4 Maccabees, Adam-Eve) carry the same class of damage and should be
re-parsed in the same pass while the clean-source pipeline is stood up — but the
S212 deferred xref work only touches Testaments XII (shipped, John 13–17) and
2 Baruch (deferred adds), so those two are the priority and the gating items for
re-verifying the S212 rows.

**Target quality bar:** parity with the clean editions
(`Apocrypha-Restored-Names-Edition`, `Enoch`, `Jubilees`, `Jasher`) — one verse
per line, intact boundaries, no apparatus, restored sacred names applied through
`restoration-pipeline`.

## Re-parse plan (faithful path)

The faithful fix keeps Charles's translation and versification and re-extracts
from the **original source PDF** (`~/Downloads/charles-1913-vol2.pdf`) using a
**layout-aware extractor** (pdfplumber word-coordinates) that drops the footnote
zone by vertical position on each page rather than trying to scrub it out of a
flat text stream. This is the same edition, just extracted with the page
geometry the first pass threw away. Requires the `~/Downloads` folder to be
mounted. (Clean web mirrors of Charles — CCEL, earlychristianwritings — were
tested and are not reliably fetchable from this environment: CCEL's reader is
JavaScript-rendered, the others time out.)
