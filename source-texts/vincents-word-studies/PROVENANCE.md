# Vincent's Word Studies in the New Testament — provenance

- **Author:** Marvin R. Vincent, D.D. (1834–1922). Charles Scribner's Sons (copyright 1887; this set
  1900 printing).
- **License:** Public domain. Pre-1929 publication; author d. 1922. The Cornell scan states verbatim:
  *"There are no known copyright restrictions in the United States on the use of the text."*
- **Approved (Yoshi, S195)** as the PD replacement for the copyrighted Vine's Expository Dictionary.

## On disk — COMPLETE 4-volume set (S195, 2026-06-03)

| File | Volume | Coverage | Lines | SHA256 (first 16) | Source item |
|---|---|---|---|---|---|
| `vol1-synoptics-acts-peter-james-jude_cu31924092322522_djvu.txt` | I | Synoptic Gospels, Acts, Peter/James/Jude | 42,341 | `447f4631199ccad7` | archive.org `cu31924092322522` (Cornell) |
| `vol2-writings-of-john_wordstudiesinne01vincgoog_djvu.txt` | II | Gospel, Epistles & Apocalypse of John | 31,573 | `026cc46c18edcfd0` | archive.org `wordstudiesinne01vincgoog` |
| `vol3-epistles-of-paul_wordstudiesinne03vincgoog_djvu.txt` | III | Romans, Corinthians, Ephesians, Philippians, Colossians, Philemon | 31,944 | `dede1ab896b02e83` | archive.org `wordstudiesinne03vincgoog` |
| `vol4-thess-gal-pastorals-hebrews_wordstudiesinne02vincgoog_djvu.txt` | IV | Thessalonians, Galatians, Pastorals, Hebrews | 30,989 | `baba277cb063e3da` | archive.org `wordstudiesinne02vincgoog` |

Total ~5.6 MB. All four are archive.org full-text OCR (`_djvu.txt`), pulled via the browser (the
`wordstudiesinnew000Nmarv` set is borrow-restricted/401; the Google-digitized `...vincgoog` set is
open — verified `access-restricted-item: no`). Each file was mapped to its volume by its title page,
not by the (offset, unreliable) archive volume tag. A 5th download (`wordstudiesinne04vincgoog`) was a
duplicate of Vol II and discarded.

## Quality / integration note
Raw OCR — typos, broken hyphenation, page furniture, bibliography pages. Usable PD source to clean +
structure at integration. If a cleaner verse-keyed copy is wanted later, the CrossWire SWORD
"Vincent" module or StudyLight's structured edition are alternatives. Framework-conflict points
(grace/law, church/Gentile, justification entries) are logged in `SOURCE_TEXT_INVENTORY.md` §III as
the annotation-layer punch list.

## Structured output (S196, 2026-06-04)
`vincents-structured.json` — 4,501 verse-keyed entries across 21 NT books, parsed from
the 4-vol OCR by `restoration-pipeline/_session196_structure_vincents.py`. 0 key
collisions; verse numbers ascend-validated; Romans bounded to its 16 chapters. Stats +
known long-tail gaps (2 Thess, Titus, Philemon, 2/3 John, Jude) in
`vincents-structured.stats.txt`. Greek is lossy OCR; the load-bearing field is the
verse-keyed English exposition (the annotated-foil base). Framework corrections ride
the `tool_annotations` overlay (migration session196), keyed by verse + headword.
