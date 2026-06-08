#!/usr/bin/env python3
"""
S211 — Build the draft chronological reading sequence for the Arranged
Reading overlay.

DESIGN (Yoshi, S211): this does NOT change the canonical order of any book.
It produces a SEPARATE ordered sequence — an "arranged reading" playlist —
that the reader can follow chapter-by-chapter. The app reads the emitted
JSON; the canonical book order in the DB is untouched.

Granularity: chapter-level. Books are interleaved (Job in the patriarchal
era, the prophets dropped into the Kings narrative, the Gospels grouped at
the life of Messiah, Paul's letters ordered after Acts). Within a book,
chapters stay contiguous EXCEPT the few well-established splits below
(Genesis around Job, Kings/Chronicles parallels). Finer intra-book splitting
(individual Psalms by occasion, Jeremiah by date, a true Gospel harmony) is
deliberately deferred to Yoshi's redline — flagged in the spec.

Extras = the framework's SCRIPTURE-LEVEL library only (Enoch, Jubilees,
Jasher, Adam & Eve, Apocalypse of Abraham, Ascension of Isaiah, Testaments
of the XII, 2 Enoch, 2/3 Baruch, the Apocrypha, Sonnini's Acts 29). Josephus,
the Apostolic Fathers, and M.R. James are one-way historical witnesses per the
voice skill and are NOT part of the reading plan.

Every entry carries source = "canon" | "extra" so the reader's
"include extra-canonical books" toggle can filter the extras out and leave a
clean canon-only chronological read.

Outputs:
  app/src/data/chronological-reading.json   (machine-readable; UI consumes)
  CHRONOLOGICAL_READING_PLAN_DRAFT.md        (human-readable; Yoshi redlines)

Re-run after editing SEGMENTS to regenerate both.
"""
from __future__ import annotations
import json, glob, os, sys
from pathlib import Path

ROOT = Path(__file__).parent
PARSED = ROOT / "source-texts" / "parsed"

# ---- load real chapter counts so every reference is validated -------------
def load_counts():
    counts = {}   # (edition_id, book_id) -> chapter_count
    titles = {}   # (edition_id, book_id) -> book_title
    for f in sorted(glob.glob(str(PARSED / "*.json"))):
        if os.path.basename(f) == "canon.modernized.json":
            continue  # same slugs as canon; skip to avoid dup keys
        try:
            d = json.load(open(f))
        except Exception:
            continue
        if not isinstance(d, dict) or "books" not in d:
            continue
        ed = d.get("edition_id") or d.get("edition_slug") or Path(f).stem
        for b in d["books"]:
            key = (ed, b["book_id"])
            counts[key] = len(b.get("chapters", []))
            titles[key] = b["book_title"]
    return counts, titles

COUNTS, TITLES = load_counts()

# ---- the draft sequence ---------------------------------------------------
# A segment = (edition, book, ch_start, ch_end, note)
#   ch_end = None  -> through the last chapter of the book
#   note   = short redline-facing rationale (optional)
# Eras are ordered; segments within an era are ordered.
C = "canon"
SEGMENTS = [
 ("I. Creation & the Watchers", [
   (C, "genesis", 1, 11, "Primeval history: creation to Babel"),
   ("enoch", "1-enoch", 1, 36, "The Watchers — the Genesis 6 sons of Elohim"),
   ("jubilees", "jubilees", 1, 10, "Creation to Babel retold; the calendar"),
   ("adam-eve-conflict", "1-adam-eve", 1, None, "After the fall — first generations"),
   ("adam-eve-conflict", "2-adam-eve", 1, None, None),
   ("pseudepigrapha", "2-enoch", 1, None, "Enoch's ascent (Secrets of Enoch)"),
   ("jasher", "jasher", 1, 9, "Adam to Babel"),
   ("enoch", "1-enoch", 37, None, "Enoch's parables, luminaries, dream-visions"),
 ]),
 ("II. The Patriarchs", [
   (C, "job", 1, None, "Set in the patriarchal age (placement debated — redline)"),
   (C, "genesis", 12, 50, "Abraham to Joseph"),
   ("jubilees", "jubilees", 11, 45, "Abraham through the sojourn"),
   ("jasher", "jasher", 10, None, "Abraham through the conquest"),
   ("apocalypse-of-abraham", "apocalypse-of-abraham", 1, None, "Abraham's call out of idolatry"),
   ("pseudepigrapha", "testaments-xii", 1, None, "Deathbed testaments of Jacob's twelve sons"),
 ]),
 ("III. Bondage & the Exodus", [
   (C, "exodus", 1, None, None),
   ("jubilees", "jubilees", 46, 50, "Exodus, Passover, Sinai"),
   (C, "leviticus", 1, None, None),
   (C, "numbers", 1, None, None),
   (C, "deuteronomy", 1, None, None),
 ]),
 ("IV. Conquest & the Judges", [
   (C, "joshua", 1, None, None),
   (C, "judges", 1, None, None),
   (C, "ruth", 1, None, "In the days of the judges"),
 ]),
 ("V. The United Kingdom", [
   (C, "1-chronicles", 1, 9, "The chronicler's genealogies — Adam to the tribes"),
   (C, "1-samuel", 1, None, "Saul; David's rise"),
   (C, "2-samuel", 1, None, "David's reign"),
   (C, "1-chronicles", 10, None, "David's reign — woven parallel to 2 Samuel"),
   (C, "psalms", 1, None, "The Psalter — mostly Davidic. Era-level placement; per-occasion scatter of individual psalms is the DEEPEST redline (150 uncertain slots)"),
   (C, "1-kings", 1, 11, "Solomon"),
   (C, "2-chronicles", 1, 9, "Solomon — woven parallel"),
   (C, "proverbs", 1, None, "Solomon"),
   (C, "ecclesiastes", 1, None, "Solomon"),
   (C, "song-of-solomon", 1, None, "Solomon"),
 ]),
 ("VI. The Divided Kingdom & the Prophets", [
   (C, "1-kings", 12, None, "The split through the fall of the north"),
   (C, "2-chronicles", 10, None, "Parallel of the southern kings"),
   (C, "jonah", 1, None, "8th c. — to Nineveh"),
   (C, "amos", 1, None, "8th c. — the north"),
   (C, "hosea", 1, None, "8th c. — the north"),
   (C, "isaiah", 1, None, "8th c. — Judah"),
   (C, "micah", 1, None, "8th c. — Judah"),
   ("ascension-isaiah", "ascension-isaiah", 1, None, "Isaiah's martyrdom under Manasseh"),
   (C, "2-kings", 1, None, "To the Babylonian exile"),
   (C, "nahum", 1, None, "7th c. — against Nineveh"),
   (C, "zephaniah", 1, None, "7th c."),
   (C, "habakkuk", 1, None, "7th c."),
   (C, "jeremiah", 1, None, "Fall of Judah"),
   (C, "lamentations", 1, None, "Over fallen Jerusalem"),
   (C, "obadiah", 1, None, "Against Edom (dating debated — redline)"),
   (C, "joel", 1, None, "Dating debated — redline"),
 ]),
 ("VII. The Exile", [
   (C, "ezekiel", 1, None, "Among the captives by the Chebar"),
   (C, "daniel", 1, None, "In Babylon and Persia"),
   ("pseudepigrapha", "2-baruch", 1, None, "After Jerusalem's fall"),
   ("pseudepigrapha", "3-baruch", 1, None, None),
 ]),
 ("VIII. The Return & Second Temple", [
   (C, "ezra", 1, None, "Return and the rebuilt temple"),
   (C, "haggai", 1, None, "Rebuilding the temple"),
   (C, "zechariah", 1, None, "Rebuilding the temple"),
   (C, "esther", 1, None, "In Persia"),
   (C, "nehemiah", 1, None, "The wall rebuilt"),
   (C, "malachi", 1, None, "Last of the writing prophets"),
   ("apocrypha", "1-esdras", 1, None, "Return narrative retold"),
   ("apocrypha", "tobit", 1, None, None),
   ("apocrypha", "judith", 1, None, None),
   ("apocrypha", "the-rest-of-esther", 1, None, None),
   ("apocrypha", "ecclesiasticus", 1, None, "Sirach — wisdom"),
   ("apocrypha", "the-wisdom-of-solomon", 1, None, None),
   ("apocrypha", "baruch-with-the-letter-of-jeremiah", 1, None, None),
   ("apocrypha", "the-song-of-the-three-holy-children", 1, None, None),
   ("apocrypha", "the-history-of-susanna", 1, None, None),
   ("apocrypha", "bel-and-the-dragon", 1, None, None),
   ("apocrypha", "the-prayer-of-manasseh", 1, None, None),
   ("apocrypha", "1-maccabees", 1, None, "The Maccabean revolt"),
   ("apocrypha", "2-maccabees", 1, None, None),
   ("apocrypha-charles-vol1", "3-maccabees", 1, None, None),
   ("pseudepigrapha", "4-maccabees", 1, None, None),
   ("apocrypha", "2-esdras", 1, None, "4 Ezra — apocalyptic visions"),
 ]),
 ("IX. The Messiah — the Gospels woven", [
   # Chapter-level harmony of the four Gospels into one life of the Messiah.
   # Approximate at the seams (a verse-level harmony is a later lift); follows
   # the standard harmony order. All 89 Gospel chapters appear exactly once.
   (C, "luke", 1, 1, "Births of John and Yahusha foretold"),
   (C, "matthew", 1, 1, "Genealogy; the birth"),
   (C, "luke", 2, 2, "Birth, shepherds, the temple, the boyhood"),
   (C, "matthew", 2, 2, "The magi; Egypt; Nazareth"),
   (C, "john", 1, 1, "The Word made flesh; John's witness; first disciples"),
   (C, "matthew", 3, 3, "John the Immerser; the baptism"),
   (C, "mark", 1, 1, "John; baptism; temptation; early Galilee"),
   (C, "luke", 3, 3, "John; baptism; the genealogy"),
   (C, "matthew", 4, 4, "Temptation; the ministry begins"),
   (C, "luke", 4, 4, "Temptation; Nazareth; Capernaum"),
   (C, "john", 2, 2, "Cana; the temple cleansed"),
   (C, "john", 3, 3, "Nicodemus"),
   (C, "john", 4, 4, "The Samaritan woman"),
   (C, "luke", 5, 5, "Call of the first disciples"),
   (C, "matthew", 5, 5, "Sermon on the mount"),
   (C, "matthew", 6, 6, None),
   (C, "matthew", 7, 7, None),
   (C, "matthew", 8, 8, "Miracles"),
   (C, "matthew", 9, 9, None),
   (C, "mark", 2, 2, None),
   (C, "mark", 3, 3, "The twelve appointed"),
   (C, "luke", 6, 6, "Sermon on the plain; the twelve"),
   (C, "luke", 7, 7, "The centurion; the widow's son; John's question"),
   (C, "matthew", 11, 11, None),
   (C, "matthew", 12, 12, "Sabbath; the unforgivable sin"),
   (C, "mark", 4, 4, "Parables; the storm stilled"),
   (C, "matthew", 13, 13, "Parables of the kingdom"),
   (C, "luke", 8, 8, None),
   (C, "mark", 5, 5, "The Gadarene; Jairus' daughter"),
   (C, "matthew", 10, 10, "The twelve sent out"),
   (C, "mark", 6, 6, "John beheaded; feeding the five thousand"),
   (C, "matthew", 14, 14, "Feeding the 5,000; walking on the water"),
   (C, "john", 5, 5, "Bethesda; the Son and the Father"),
   (C, "john", 6, 6, "The bread of life"),
   (C, "matthew", 15, 15, "Tradition; the Canaanite woman; feeding the 4,000"),
   (C, "mark", 7, 7, None),
   (C, "mark", 8, 8, "Feeding the 4,000; Peter's confession"),
   (C, "matthew", 16, 16, "Peter's confession; the passion foretold"),
   (C, "matthew", 17, 17, "The transfiguration"),
   (C, "mark", 9, 9, None),
   (C, "luke", 9, 9, "Transfiguration; toward Jerusalem"),
   (C, "matthew", 18, 18, "Forgiveness and humility"),
   (C, "john", 7, 7, "At the feast of tabernacles"),
   (C, "john", 8, 8, "The light of the world"),
   (C, "john", 9, 9, "The man born blind"),
   (C, "john", 10, 10, "The good shepherd"),
   (C, "luke", 10, 10, "The seventy; the good Samaritan; Mary and Martha"),
   (C, "luke", 11, 11, None),
   (C, "luke", 12, 12, None),
   (C, "luke", 13, 13, None),
   (C, "luke", 14, 14, None),
   (C, "luke", 15, 15, "Lost sheep, coin, son"),
   (C, "luke", 16, 16, None),
   (C, "luke", 17, 17, None),
   (C, "john", 11, 11, "Lazarus raised"),
   (C, "luke", 18, 18, None),
   (C, "matthew", 19, 19, None),
   (C, "matthew", 20, 20, None),
   (C, "mark", 10, 10, None),
   (C, "luke", 19, 19, "Zacchaeus; toward the entry"),
   (C, "matthew", 21, 21, "The triumphal entry; the temple"),
   (C, "mark", 11, 11, None),
   (C, "john", 12, 12, "The anointing; the entry; the Greeks"),
   (C, "matthew", 22, 22, None),
   (C, "matthew", 23, 23, "Woes on the Pharisees"),
   (C, "mark", 12, 12, None),
   (C, "luke", 20, 20, None),
   (C, "luke", 21, 21, "The Olivet discourse"),
   (C, "matthew", 24, 24, "The Olivet discourse"),
   (C, "matthew", 25, 25, None),
   (C, "mark", 13, 13, None),
   (C, "john", 13, 13, "The supper; the washing of feet"),
   (C, "john", 14, 14, "The farewell discourse"),
   (C, "john", 15, 15, None),
   (C, "john", 16, 16, None),
   (C, "john", 17, 17, "The high-priestly prayer"),
   (C, "matthew", 26, 26, "Supper; Gethsemane; arrest; trial"),
   (C, "mark", 14, 14, None),
   (C, "luke", 22, 22, None),
   (C, "john", 18, 18, "The arrest and the trials"),
   (C, "matthew", 27, 27, "The crucifixion and burial"),
   (C, "mark", 15, 15, None),
   (C, "luke", 23, 23, None),
   (C, "john", 19, 19, None),
   (C, "matthew", 28, 28, "The resurrection"),
   (C, "mark", 16, 16, None),
   (C, "luke", 24, 24, "Resurrection; the ascension"),
   (C, "john", 20, 20, None),
   (C, "john", 21, 21, "By the sea — the epilogue"),
 ]),
 ("X. The Assembly & the Letters — woven", [
   # The letters interleaved into the Acts timeline at their writing-points.
   # General-epistle dates and the Galatians dating are debated — redline.
   (C, "acts", 1, 12, "Pentecost; the assembly; Stephen; Saul's turning; Cornelius"),
   (C, "james", 1, None, "Earliest letter, from Jerusalem (dating debated — redline)"),
   (C, "acts", 13, 14, "The first journey"),
   (C, "galatians", 1, None, "After the first journey (South-Galatian dating — redline)"),
   (C, "acts", 15, 18, "The Jerusalem council; the second journey; Corinth"),
   (C, "1-thessalonians", 1, None, "From Corinth"),
   (C, "2-thessalonians", 1, None, "From Corinth"),
   (C, "acts", 19, 19, "Ephesus (the third journey)"),
   (C, "1-corinthians", 1, None, "From Ephesus"),
   (C, "acts", 20, 20, "Macedonia and Greece"),
   (C, "2-corinthians", 1, None, "From Macedonia"),
   (C, "romans", 1, None, "From Corinth"),
   (C, "acts", 21, 28, "Arrest; Caesarea; the voyage; Rome"),
   (C, "ephesians", 1, None, "Prison epistle, from Rome"),
   (C, "philippians", 1, None, "Prison epistle"),
   (C, "colossians", 1, None, "Prison epistle"),
   (C, "philemon", 1, None, "Prison epistle"),
   ("sonnini-acts-29", "sonnini-acts-29", 1, None, "Paul beyond Acts 28 — the Sonnini manuscript"),
   (C, "1-timothy", 1, None, "After the release"),
   (C, "titus", 1, None, "After the release"),
   (C, "hebrews", 1, None, None),
   (C, "1-peter", 1, None, None),
   (C, "2-peter", 1, None, None),
   (C, "2-timothy", 1, None, "Paul's last letter"),
   (C, "jude", 1, None, "Dating debated — redline"),
   (C, "1-john", 1, None, None),
   (C, "2-john", 1, None, None),
   (C, "3-john", 1, None, None),
 ]),
 ("XI. The Revelation", [
   (C, "revelation", 1, None, "The unveiling — last"),
 ]),
]

# ---- expand to per-chapter entries, validating against real counts --------
def build():
    entries = []
    errors = []
    seq = 0
    plan_md = []   # (era, list of segment dicts)
    for era, segs in SEGMENTS:
        era_rows = []
        for (ed, book, start, end, note) in segs:
            key = (ed, book)
            if key not in COUNTS:
                errors.append(f"UNKNOWN book: edition={ed} book={book}")
                continue
            total = COUNTS[key]
            last = total if end is None else end
            if start < 1 or last > total or start > last:
                errors.append(f"BAD range {ed}/{book} {start}-{end} (book has {total})")
                continue
            source = "canon" if ed == C else "extra"
            for ch in range(start, last + 1):
                seq += 1
                entries.append({
                    "seq": seq,
                    "era": era,
                    "edition_id": ed,
                    "book_id": book,
                    "book_title": TITLES[key],
                    "chapter": ch,
                    "source": source,
                })
            era_rows.append({
                "edition_id": ed, "book_id": book, "book_title": TITLES[key],
                "start": start, "end": last, "total": total,
                "source": source, "note": note,
            })
        plan_md.append((era, era_rows))
    return entries, plan_md, errors

def main():
    entries, plan_md, errors = build()
    if errors:
        print("VALIDATION ERRORS:")
        for e in errors:
            print("  -", e)
        return 1

    canon_n = sum(1 for e in entries if e["source"] == "canon")
    extra_n = sum(1 for e in entries if e["source"] == "extra")

    out = {
        "schema": "arranged-reading/chronological/v1-draft",
        "status": "DRAFT — pending Yoshi redline",
        "generated_by": "_s211_build_chronological_order.py",
        "extras_toggle_default": False,
        "counts": {"total": len(entries), "canon": canon_n, "extra": extra_n},
        "entries": entries,
    }
    data_path = ROOT / "app" / "src" / "data" / "chronological-reading.json"
    data_path.write_text(json.dumps(out, ensure_ascii=False, indent=1))
    print(f"wrote {data_path}  ({len(entries)} chapters: {canon_n} canon + {extra_n} extra)")

    # human-readable redline plan
    md = []
    md.append("# Chronological Reading Plan — DRAFT for redline\n")
    md.append("> Generated by `_s211_build_chronological_order.py`. This is a "
              "**separate arranged-reading sequence** — it does not change the "
              "canonical order of any book. Chapter-level; books interleaved. "
              "**Extras** (marked ⟡) are the framework's scripture-level library "
              "and can be toggled off for a canon-only read.\n")
    md.append(f"\n**{len(entries)} chapters total** — {canon_n} canon + {extra_n} extra-canonical.\n")
    md.append("\nRedline freely: reorder lines, change ranges, move extras, "
              "split blocks. Re-running the generator after editing `SEGMENTS` "
              "rebuilds both this file and the JSON.\n")
    for era, rows in plan_md:
        md.append(f"\n## {era}\n")
        for r in rows:
            mark = "⟡ " if r["source"] == "extra" else ""
            rng = f"{r['start']}" if r["start"] == r["end"] else f"{r['start']}–{r['end']}"
            if r["start"] == 1 and r["end"] == r["total"]:
                rng = f"1–{r['total']} (whole)"
            note = f"  — *{r['note']}*" if r["note"] else ""
            md.append(f"- {mark}**{r['book_title']}** {rng}{note}")
        md.append("")
    md_path = ROOT / "CHRONOLOGICAL_READING_PLAN_DRAFT.md"
    md_path.write_text("\n".join(md))
    print(f"wrote {md_path}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
