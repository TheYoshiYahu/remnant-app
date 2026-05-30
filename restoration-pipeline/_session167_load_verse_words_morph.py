#!/usr/bin/env python3
"""
Session 167 — verse_words.morphology loader (§28 Phase 9.2 interlinear).

Parses STEPBible's TAHOT (Translators Amalgamated Hebrew OT) and TAGNT
(Translators Amalgamated Greek NT) per-word data files and emits a SQL
transaction that populates `verse_words.morphology` for the entire
Protestant canon.

Per DESIGN_LANGUAGE.md §28 "Schema impact":
  - `verse_words.morphology` already exists as a nullable TEXT column
    (S120 loader marked V2-deferred). No ALTER TABLE; no migration.
  - Single-column population; lemma + transliteration + gloss are joined
    at API-render time from `strong_entries` (already loaded S120).
  - Loader emits SQL for Yoshi to apply against prod via psql; the
    sandbox runs locally where the source files live, prod runs against
    Render-managed Postgres.

Matching strategy: per-verse strong-occurrence index.

The TAHOT/TAGNT source files enumerate per-word morph in original-
language order (Hebrew flows right-to-left; Greek left-to-right). Our
`verse_words` rows enumerate KJV-English-flow positions (S120 loader
parsed eng-kjv_usfx.xml in source order). English word count ≠ original
word count, and order can diverge — so a position-to-position join is
unreliable.

The reliable join is `(verse_id, primary_strong, occurrence_index)`:
for each strong_number in a verse, the N-th English-order occurrence
in verse_words maps to the N-th original-order occurrence in the source
file. This handles the common cases (a verse with three "the"s in
English and three definite articles in the source, in any internal
order) and degrades gracefully on count mismatches (extra English
filler → morphology stays NULL on the unmatched verse_word; extra
source token → ignored).

Compound Hebrew morphemes (prefix + base, slash-separated) are stored
as the FULL compound morph code. The interlinear-helpers.ts
`formatMorphology` decoder splits on `/` and joins decoded morphemes
with ` + ` so the partner sees the full morphological composition.

Output: `restoration-pipeline/validation-reports/_s167_morph_updates.sql`.

Modes:
  --dry-run     Parse + summary, no SQL emitted.
  --emit-sql    Default. Write the SQL file.
  --limit N     Cap rows parsed to N (for fast local testing).

Idempotent under a re-run: the emitted SQL is a single transaction that
UPDATEs verse_words rows by computed match keys. Re-running emits the
same SQL; re-applying produces no net change (UPDATE to the same value).

Run:
  # Dry-run from app root:
  python3 restoration-pipeline/_session167_load_verse_words_morph.py --dry-run

  # Default — emit the SQL file:
  python3 restoration-pipeline/_session167_load_verse_words_morph.py

  # Apply (from Yoshi's terminal, with prod DATABASE_URL):
  psql "$DATABASE_URL" -f restoration-pipeline/validation-reports/_s167_morph_updates.sql
"""

from __future__ import annotations

import argparse
import os
import re
import sys
from collections import Counter
from pathlib import Path
from typing import Iterator

APP_ROOT = Path(os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent)
SOURCE_DIR = APP_ROOT / "source-texts" / "stepbible-data" / "Translators Amalgamated OT+NT"
OUT_DIR = APP_ROOT / "restoration-pipeline" / "validation-reports"
OUT_SQL = OUT_DIR / "_s167_morph_updates.sql"

# STEPBible book-code → DB slug. STEPBible uses 3-char codes (Gen, Exo, Mat,
# Mrk, Jhn, etc.); our DB uses lowercase hyphenated slugs (S120 convention).
STEP_TO_SLUG: dict[str, str] = {
    # OT (39)
    "Gen": "genesis", "Exo": "exodus", "Lev": "leviticus", "Num": "numbers",
    "Deu": "deuteronomy", "Jos": "joshua", "Jdg": "judges", "Rut": "ruth",
    "1Sa": "1-samuel", "2Sa": "2-samuel", "1Ki": "1-kings", "2Ki": "2-kings",
    "1Ch": "1-chronicles", "2Ch": "2-chronicles", "Ezr": "ezra",
    "Neh": "nehemiah", "Est": "esther", "Job": "job", "Psa": "psalms",
    "Pro": "proverbs", "Ecc": "ecclesiastes", "Sng": "song-of-solomon",
    "Isa": "isaiah", "Jer": "jeremiah", "Lam": "lamentations",
    "Ezk": "ezekiel", "Dan": "daniel", "Hos": "hosea", "Jol": "joel",
    "Amo": "amos", "Oba": "obadiah", "Jon": "jonah", "Mic": "micah",
    "Nam": "nahum", "Hab": "habakkuk", "Zep": "zephaniah", "Hag": "haggai",
    "Zec": "zechariah", "Mal": "malachi",
    # NT (27)
    "Mat": "matthew", "Mrk": "mark", "Luk": "luke", "Jhn": "john",
    "Act": "acts", "Rom": "romans", "1Co": "1-corinthians",
    "2Co": "2-corinthians", "Gal": "galatians", "Eph": "ephesians",
    "Php": "philippians", "Col": "colossians", "1Th": "1-thessalonians",
    "2Th": "2-thessalonians", "1Ti": "1-timothy", "2Ti": "2-timothy",
    "Tit": "titus", "Phm": "philemon", "Heb": "hebrews", "Jas": "james",
    "1Pe": "1-peter", "2Pe": "2-peter", "1Jn": "1-john", "2Jn": "2-john",
    "3Jn": "3-john", "Jud": "jude", "Rev": "revelation",
}

# Per-word data row regex. Captures: book code, chapter, verse, source-
# position (#NN), editions tag (=NKO / =L / etc.).
#
# S169 fix: STEPBible writes references in TWO modes. Most rows are
# *aligned* — KJV and BHS verse numbers agree, and the row reads
# ``Book.CH.V#POS=ED\t...``. A subset (17,632 rows in the canon dump)
# are *divergent* — KJV and BHS disagree on the verse number, and
# STEPBible writes the KJV-aligned number as primary with the
# BHS-aligned number in parens, e.g. ``Psa.3.0(3.1)#01=L\t...``
# (KJV ch.3 v.0 = superscription, BHS ch.3 v.1) or
# ``Jol.2.28(3.1)#01=L\t...`` (KJV Joel 2:28 = BHS Joel 3:1) or
# ``Mal.4.1(3.19)#01=L\t...`` (KJV Mal 4:1 = BHS Mal 3:19). The S167
# loader's regex required ``#`` to come directly after the verse
# number, so it silently dropped every divergent-mode row — accounting
# for Psalms 42.6% null, Joel 2:28+ entirely missing, Mal 4 entirely
# missing, and most of the canon's 10.5% morph shortfall.
#
# The optional ``(?:\(\d+\.\d+\))?`` swallows the parenthetical BHS-
# reference when present; the primary reference STAYS KJV-aligned, so
# the join against ``verse_words`` (already KJV-numbered) works without
# any translation table.
#
# Example matches:
#   "Mat.1.1#06=NKO\t..."          (TAGNT, aligned)
#   "Gen.1.1#01=L\t..."            (TAHOT, aligned)
#   "Psa.3.0(3.1)#01=L\t..."       (TAHOT, divergent — KJV v.0 = superscription)
#   "Jol.2.28(3.1)#01=L\t..."      (TAHOT, divergent — Joel KJV/BHS chapter shift)
#   "Mal.4.1(3.19)#01=L\t..."      (TAHOT, divergent — Malachi KJV/BHS chapter shift)
DATA_ROW_RE = re.compile(
    r"^([A-Za-z0-9]+)\.(\d+)\.(\d+)(?:\(\d+\.\d+\))?#(\d+)=([A-Za-z]+)\t"
)

# Hebrew compound-strong primary extraction: braced {H####X?} marks the
# lexical/primary morpheme; unbraced segments (H9001/H9002/H9003/...) are
# prefixes / punctuation. Strip the trailing single-letter homonym
# disambiguator so the strong_number matches our `verse_words.strong_number`
# (S120 normalize did 4-digit zero-pad with no homonym preservation).
HEBREW_BRACED_RE = re.compile(r"\{(H\d{4,5})[A-Z]?\}")

# Greek strong+morph cell (TAGNT format): "G1138=N-GSM-P". OT-alignment
# prefixes (rare in per-word rows but possible) — strip everything before
# the last "«".
GREEK_STRONG_MORPH_RE = re.compile(r"(G\d{4,5})[A-Z]?=([A-Z0-9\-]+)")


def _normalize_strong_for_join(raw: str) -> str | None:
    """Normalize a raw Strong's number to the 4-digit zero-padded form
    used in `verse_words.strong_number` (no homonym suffix). Returns None
    if no recognizable Strong's pattern is found.
    """
    m = re.match(r"([HG])(\d{1,5})[A-Z]?$", raw)
    if not m:
        return None
    letter, digits = m.group(1), m.group(2)
    return f"{letter}{int(digits):04d}"


def _extract_primary_hebrew_strong(strongs_field: str) -> str | None:
    """From a TAHOT dStrong cell like 'H9003/{H7225G}' or '{H1254A}', return
    the primary Strong's in normalized form ('H7225', 'H1254'). Falls back
    to the last segment if no braces are present (rare).
    """
    braced = HEBREW_BRACED_RE.findall(strongs_field)
    if braced:
        # Take the FIRST braced primary (TAHOT convention: one primary per
        # word; the brace marks it unambiguously).
        return _normalize_strong_for_join(braced[0])
    # No braces — punctuation-only rows like '\H9016' (sof-pasuq) which
    # we skip; or rare rows with unbraced single Strong's.
    segments = [
        s.strip("\\{}")
        for s in re.split(r"[\\/]", strongs_field)
        if s.strip("\\{}").startswith("H")
    ]
    if not segments:
        return None
    return _normalize_strong_for_join(segments[-1])


def _extract_greek_strong_morph(field: str) -> tuple[str, str] | None:
    """From a TAGNT field 4 cell like 'G1138=N-GSM-P', return (strong,
    morph). Strips homonym suffix on the Strong's before normalize.
    Handles rare OT-alignment cells 'H0085|G0011«G0011=N-NSM-P' by taking
    the segment after the last '«'.
    """
    # Drop OT-alignment prefix if present.
    if "«" in field:
        field = field.rsplit("«", 1)[-1]
    m = GREEK_STRONG_MORPH_RE.match(field.strip())
    if not m:
        return None
    raw_strong, morph = m.group(1), m.group(2)
    norm = _normalize_strong_for_join(raw_strong)
    if norm is None:
        return None
    return norm, morph


def parse_tagnt_row(line: str) -> tuple[str, int, int, int, str, str] | None:
    """Parse one TAGNT per-word data row.
    Returns (book_slug, chapter, verse, source_position, strong, morph)
    or None on parse failure / non-data row.
    """
    m = DATA_ROW_RE.match(line)
    if not m:
        return None
    book_code, ch_str, v_str, pos_str, _edition = m.groups()
    slug = STEP_TO_SLUG.get(book_code)
    if not slug:
        return None
    parts = line.rstrip("\n").split("\t")
    if len(parts) < 4:
        return None
    sm = _extract_greek_strong_morph(parts[3])
    if sm is None:
        return None
    strong, morph = sm
    return slug, int(ch_str), int(v_str), int(pos_str), strong, morph


def parse_tahot_row(line: str) -> tuple[str, int, int, int, str, str] | None:
    """Parse one TAHOT per-word data row.
    Returns (book_slug, chapter, verse, source_position, strong, morph)
    or None on parse failure / non-data row.
    """
    m = DATA_ROW_RE.match(line)
    if not m:
        return None
    book_code, ch_str, v_str, pos_str, _edition = m.groups()
    slug = STEP_TO_SLUG.get(book_code)
    if not slug:
        return None
    parts = line.rstrip("\n").split("\t")
    if len(parts) < 6:
        return None
    strongs_field = parts[4]
    morph_field = parts[5]
    if not morph_field or morph_field.startswith("\\"):
        return None
    strong = _extract_primary_hebrew_strong(strongs_field)
    if strong is None:
        return None
    return slug, int(ch_str), int(v_str), int(pos_str), strong, morph_field


def iter_source_rows(
    limit: int | None = None,
) -> Iterator[tuple[str, int, int, int, str, str]]:
    """Yield (book_slug, chapter, verse, source_position, primary_strong,
    morphology) tuples across all TAHOT + TAGNT source files.
    """
    if not SOURCE_DIR.is_dir():
        raise FileNotFoundError(
            f"STEPBible source dir not found: {SOURCE_DIR}\n"
            f"Run the S167 sparse-checkout clone first (see the open-prompt)."
        )
    files = sorted(p for p in SOURCE_DIR.iterdir() if p.is_file() and p.suffix == ".txt")
    if not files:
        raise FileNotFoundError(f"No .txt source files in {SOURCE_DIR}")

    count = 0
    for path in files:
        is_tagnt = path.name.startswith("TAGNT")
        is_tahot = path.name.startswith("TAHOT")
        if not (is_tagnt or is_tahot):
            continue
        parser = parse_tagnt_row if is_tagnt else parse_tahot_row
        with path.open("r", encoding="utf-8") as f:
            for line in f:
                row = parser(line)
                if row is None:
                    continue
                yield row
                count += 1
                if limit is not None and count >= limit:
                    return


def _escape_copy_field(s: str) -> str:
    """Escape a string for Postgres COPY ... FROM STDIN text format.
    Backslash, tab, newline, and carriage return need escaping per the
    Postgres text COPY contract.
    """
    return (
        s.replace("\\", "\\\\")
        .replace("\t", "\\t")
        .replace("\n", "\\n")
        .replace("\r", "\\r")
    )


SQL_HEADER = """\
-- S167 (§28 Phase 9.2) — verse_words.morphology population from STEPBible
-- TAHOT (Hebrew OT) + TAGNT (Greek NT).
--
-- S169 patch: divergent-mode regex bug fix. The original S167 regex
-- required ``#`` to come directly after the verse number, silently
-- dropping 17,632+ rows where STEPBible writes the BHS reference in
-- parens (e.g. ``Psa.3.0(3.1)#01=L``). This SQL is from the patched
-- loader and recovers the 10.5% morph shortfall (Psalms 42.6% → near-
-- zero; Joel 2:28+ / Malachi 4 fully populated; etc.). Safe to re-run
-- over an existing populated DB — idempotent UPDATE, NULLs become
-- populated, populated rows rewrite to the same value.
--
-- Apply with: psql "$DATABASE_URL" -f _s167_morph_updates.sql
--
-- Idempotent: the UPDATE writes the same morphology code on re-run.
-- Single transaction; safe to abort with no partial-state risk.
--
-- Strategy: temp table loads (book_slug, chapter, verse, source_position,
-- primary_strong, morphology) per source row. A CTE pair ranks both the
-- source rows and the verse_words rows by per-verse strong-number
-- occurrence index; the UPDATE joins on
-- (verse, primary_strong, occurrence_index).
--
-- For verses where the English (KJV) and original (TAHOT/TAGNT) word
-- counts differ on a given strong_number, the smaller count wins
-- (extra English words → morphology stays NULL; extra source rows →
-- ignored). The InterlinearLayer (S168) renders the blank-but-present
-- morphology cell when null per §28's "Empty-state for verses without
-- morph data" gate.

BEGIN;

CREATE TEMP TABLE _s167_morph_src (
  book_slug          TEXT NOT NULL,
  chapter_number     INT  NOT NULL,
  verse_number       INT  NOT NULL,
  source_position    INT  NOT NULL,
  primary_strong     TEXT NOT NULL,
  morphology         TEXT NOT NULL
);

COPY _s167_morph_src
  (book_slug, chapter_number, verse_number, source_position, primary_strong, morphology)
  FROM STDIN;
"""

SQL_FOOTER = """\
\\.

CREATE INDEX _s167_morph_src_lookup
  ON _s167_morph_src (book_slug, chapter_number, verse_number, primary_strong);

WITH source_ranked AS (
  SELECT
    s.*,
    ROW_NUMBER() OVER (
      PARTITION BY s.book_slug, s.chapter_number, s.verse_number, s.primary_strong
      ORDER BY s.source_position
    ) AS strong_occ
  FROM _s167_morph_src s
),
vw_resolved AS (
  SELECT
    vw.id          AS vw_id,
    b.slug         AS book_slug,
    c.chapter_number,
    v.verse_number,
    vw.strong_number,
    ROW_NUMBER() OVER (
      PARTITION BY vw.verse_id, vw.strong_number
      ORDER BY vw.position
    ) AS strong_occ
  FROM verse_words vw
  JOIN verses v   ON v.id = vw.verse_id
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b    ON b.id = c.book_id
  WHERE vw.strong_number IS NOT NULL
)
UPDATE verse_words vw
SET morphology = sr.morphology
FROM vw_resolved vwr
JOIN source_ranked sr
  ON sr.book_slug      = vwr.book_slug
 AND sr.chapter_number = vwr.chapter_number
 AND sr.verse_number   = vwr.verse_number
 AND sr.primary_strong = vwr.strong_number
 AND sr.strong_occ     = vwr.strong_occ
WHERE vw.id = vwr.vw_id;

-- Quick post-apply stats.
SELECT
  (SELECT COUNT(*) FROM verse_words)                          AS total_verse_words,
  (SELECT COUNT(*) FROM verse_words WHERE morphology IS NOT NULL) AS morph_populated,
  (SELECT COUNT(*) FROM verse_words WHERE strong_number IS NOT NULL AND morphology IS NULL) AS strong_no_morph;

COMMIT;
"""


def emit_sql(rows: list[tuple[str, int, int, int, str, str]]) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    with OUT_SQL.open("w", encoding="utf-8") as out:
        out.write(SQL_HEADER)
        for slug, ch, v, pos, strong, morph in rows:
            out.write(
                f"{_escape_copy_field(slug)}\t{ch}\t{v}\t{pos}\t"
                f"{_escape_copy_field(strong)}\t{_escape_copy_field(morph)}\n"
            )
        out.write(SQL_FOOTER)
    print(f"  → wrote {OUT_SQL.relative_to(APP_ROOT)} "
          f"({OUT_SQL.stat().st_size:,} bytes)")


def summarize(rows: list[tuple[str, int, int, int, str, str]]) -> dict[str, int]:
    book_counter: Counter[str] = Counter()
    morph_counter: Counter[str] = Counter()
    strong_counter: Counter[str] = Counter()
    hebrew_rows = 0
    greek_rows = 0
    compound_hebrew = 0
    for slug, _ch, _v, _pos, strong, morph in rows:
        book_counter[slug] += 1
        morph_counter[morph[:8]] += 1  # top-K coarse bucket
        strong_counter[strong[0]] += 1
        if strong.startswith("H"):
            hebrew_rows += 1
            if "/" in morph:
                compound_hebrew += 1
        else:
            greek_rows += 1
    return {
        "total_rows": len(rows),
        "hebrew_rows": hebrew_rows,
        "greek_rows": greek_rows,
        "compound_hebrew_rows": compound_hebrew,
        "books_covered": len(book_counter),
        "distinct_morph_buckets": len(morph_counter),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Parse + report summary; do not write the SQL file.",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Cap rows parsed (for fast local testing).",
    )
    args = parser.parse_args()

    print(f"[s167] source dir: {SOURCE_DIR}")
    if not SOURCE_DIR.is_dir():
        print(
            f"[s167] ERROR: source dir not found.\n"
            f"       Run the S167 sparse-checkout clone first."
        )
        return 1

    print(f"[s167] parsing TAHOT + TAGNT files...")
    rows = list(iter_source_rows(limit=args.limit))
    if not rows:
        print(f"[s167] ERROR: zero rows parsed from {SOURCE_DIR}.")
        return 1

    stats = summarize(rows)
    print(f"[s167] parsed {stats['total_rows']:>8,} per-word data rows")
    print(f"         Hebrew (TAHOT): {stats['hebrew_rows']:>8,}")
    print(f"         Greek  (TAGNT): {stats['greek_rows']:>8,}")
    print(f"         compound Hebrew (slash-codes): {stats['compound_hebrew_rows']:>8,}")
    print(f"         books covered:                 {stats['books_covered']:>3}/66")
    print(f"         distinct morph buckets:        {stats['distinct_morph_buckets']:>5,}")

    if args.dry_run:
        print(f"[s167] DRY-RUN — no SQL emitted.")
        return 0

    print(f"[s167] emitting SQL...")
    emit_sql(rows)
    print(f"[s167] DONE.")
    print(
        f"\nTo apply against prod:\n"
        f"  psql \"$DATABASE_URL\" -f {OUT_SQL.relative_to(APP_ROOT)}\n"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
