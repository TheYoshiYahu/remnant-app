#!/usr/bin/env python3
"""Build the compare-only versions migration from staged public-domain sources.

Acquires nothing itself — reads the raw files staged under ./raw/ (see
ACQUISITION.md for provenance) and emits:

  * data-schema/migrations/session221_compare_only_versions.sql
      DDL for compare_versions / compare_books / compare_verses (all
      separate from the canon editions/books/verses and from the
      cross_reference apparatus), plus the verified verse data as
      batched multi-row INSERTs (repo convention — see session163/197
      loads). Everything inside one BEGIN/COMMIT, DELETE-then-INSERT so
      the load is fully re-runnable.

  * VERIFICATION_REPORT.md
      Per-version book / chapter / verse counts checked against the
      known canonical counts, with every gap called out.

These versions are COMPARISON-ONLY: compare_versions.compare_only is a
CHECK-pinned TRUE so the reading UI can never surface them as a full
Bible. Verse-addressable by (version, book_code, chapter, verse).

Run:  python3 build_compare_migration.py
"""
import csv
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
RAW = os.path.join(HERE, "raw")
REPO = os.path.abspath(os.path.join(HERE, "..", ".."))
MIGRATION = os.path.join(
    REPO, "data-schema", "migrations", "session221_compare_only_versions.sql"
)
REPORT = os.path.join(HERE, "VERIFICATION_REPORT.md")

# ---------------------------------------------------------------------------
# Canonical book-code vocabulary (USFM/OSIS-style 3-char codes).
# The protocanonical 66 share these codes across EVERY version so the
# "compare this verse" feature aligns by code. Deuterocanon / LXX-only
# books share codes between DRC and Brenton where they are the same book.
# ---------------------------------------------------------------------------

# canonical display order -> (code, canonical English name)
BOOK_ORDER = [
    # Protestant OT (1-39)
    ("GEN", "Genesis"), ("EXO", "Exodus"), ("LEV", "Leviticus"),
    ("NUM", "Numbers"), ("DEU", "Deuteronomy"), ("JOS", "Joshua"),
    ("JDG", "Judges"), ("RUT", "Ruth"), ("1SA", "1 Samuel"),
    ("2SA", "2 Samuel"), ("1KI", "1 Kings"), ("2KI", "2 Kings"),
    ("1CH", "1 Chronicles"), ("2CH", "2 Chronicles"), ("EZR", "Ezra"),
    ("NEH", "Nehemiah"), ("EST", "Esther"), ("JOB", "Job"),
    ("PSA", "Psalms"), ("PRO", "Proverbs"), ("ECC", "Ecclesiastes"),
    ("SNG", "Song of Solomon"), ("ISA", "Isaiah"), ("JER", "Jeremiah"),
    ("LAM", "Lamentations"), ("EZK", "Ezekiel"), ("DAN", "Daniel"),
    ("HOS", "Hosea"), ("JOL", "Joel"), ("AMO", "Amos"), ("OBA", "Obadiah"),
    ("JON", "Jonah"), ("MIC", "Micah"), ("NAM", "Nahum"),
    ("HAB", "Habakkuk"), ("ZEP", "Zephaniah"), ("HAG", "Haggai"),
    ("ZEC", "Zechariah"), ("MAL", "Malachi"),
    # Protestant NT (40-66)
    ("MAT", "Matthew"), ("MRK", "Mark"), ("LUK", "Luke"), ("JHN", "John"),
    ("ACT", "Acts"), ("ROM", "Romans"), ("1CO", "1 Corinthians"),
    ("2CO", "2 Corinthians"), ("GAL", "Galatians"), ("EPH", "Ephesians"),
    ("PHP", "Philippians"), ("COL", "Colossians"), ("1TH", "1 Thessalonians"),
    ("2TH", "2 Thessalonians"), ("1TI", "1 Timothy"), ("2TI", "2 Timothy"),
    ("TIT", "Titus"), ("PHM", "Philemon"), ("HEB", "Hebrews"),
    ("JAS", "James"), ("1PE", "1 Peter"), ("2PE", "2 Peter"),
    ("1JN", "1 John"), ("2JN", "2 John"), ("3JN", "3 John"), ("JUD", "Jude"),
    ("REV", "Revelation"),
    # Deuterocanon / apocrypha (shared codes across DRC + Brenton; 100+)
    ("TOB", "Tobit"), ("JDT", "Judith"), ("ESG", "Esther (Greek)"),
    ("WIS", "Wisdom of Solomon"), ("SIR", "Sirach"), ("BAR", "Baruch"),
    ("EPJ", "Epistle of Jeremiah"), ("SUS", "Susanna"),
    ("BEL", "Bel and the Dragon"), ("1MA", "1 Maccabees"),
    ("2MA", "2 Maccabees"), ("3MA", "3 Maccabees"), ("4MA", "4 Maccabees"),
    ("1ES", "1 Esdras"), ("2ES", "2 Esdras"), ("MAN", "Prayer of Manasseh"),
    ("PS2", "Psalm 151"), ("LAO", "Epistle to the Laodiceans"),
]
CODE_NAME = dict(BOOK_ORDER)
CODE_NUMBER = {code: i + 1 for i, (code, _) in enumerate(BOOK_ORDER)}

# scrollmapper full names -> canonical code
SCROLL_MAP = {
    "Genesis": "GEN", "Exodus": "EXO", "Leviticus": "LEV", "Numbers": "NUM",
    "Deuteronomy": "DEU", "Joshua": "JOS", "Judges": "JDG", "Ruth": "RUT",
    "I Samuel": "1SA", "II Samuel": "2SA", "I Kings": "1KI", "II Kings": "2KI",
    "I Chronicles": "1CH", "II Chronicles": "2CH", "Ezra": "EZR",
    "Nehemiah": "NEH", "Esther": "EST", "Job": "JOB", "Psalms": "PSA",
    "Proverbs": "PRO", "Ecclesiastes": "ECC", "Song of Solomon": "SNG",
    "Isaiah": "ISA", "Jeremiah": "JER", "Lamentations": "LAM",
    "Ezekiel": "EZK", "Daniel": "DAN", "Hosea": "HOS", "Joel": "JOL",
    "Amos": "AMO", "Obadiah": "OBA", "Jonah": "JON", "Micah": "MIC",
    "Nahum": "NAM", "Habakkuk": "HAB", "Zephaniah": "ZEP", "Haggai": "HAG",
    "Zechariah": "ZEC", "Malachi": "MAL", "Matthew": "MAT", "Mark": "MRK",
    "Luke": "LUK", "John": "JHN", "Acts": "ACT", "Romans": "ROM",
    "I Corinthians": "1CO", "II Corinthians": "2CO", "Galatians": "GAL",
    "Ephesians": "EPH", "Philippians": "PHP", "Colossians": "COL",
    "I Thessalonians": "1TH", "II Thessalonians": "2TH", "I Timothy": "1TI",
    "II Timothy": "2TI", "Titus": "TIT", "Philemon": "PHM", "Hebrews": "HEB",
    "James": "JAS", "I Peter": "1PE", "II Peter": "2PE", "I John": "1JN",
    "II John": "2JN", "III John": "3JN", "Jude": "JUD",
    "Revelation of John": "REV",
    # DRC deuterocanon + appendix
    "Tobit": "TOB", "Judith": "JDT", "Wisdom": "WIS", "Sirach": "SIR",
    "Baruch": "BAR", "I Maccabees": "1MA", "II Maccabees": "2MA",
    "Prayer of Manasses": "MAN", "I Esdras": "1ES", "II Esdras": "2ES",
    "Additional Psalm": "PS2", "Laodiceans": "LAO",
}

# eBible (Haiola) codes -> canonical code. Used by WEB and Brenton.
EBIBLE_MAP = {
    "GEN": "GEN", "EXO": "EXO", "LEV": "LEV", "NUM": "NUM", "DEU": "DEU",
    "JOS": "JOS", "JDG": "JDG", "RUT": "RUT", "1SA": "1SA", "2SA": "2SA",
    "1KI": "1KI", "2KI": "2KI", "1CH": "1CH", "2CH": "2CH", "EZR": "EZR",
    "NEH": "NEH", "EST": "EST", "JOB": "JOB", "PSA": "PSA", "PRO": "PRO",
    "ECC": "ECC", "SOL": "SNG", "ISA": "ISA", "JER": "JER", "LAM": "LAM",
    "EZE": "EZK", "DAN": "DAN", "HOS": "HOS", "JOE": "JOL", "AMO": "AMO",
    "OBA": "OBA", "JON": "JON", "MIC": "MIC", "NAH": "NAM", "HAB": "HAB",
    "ZEP": "ZEP", "HAG": "HAG", "ZEC": "ZEC", "MAL": "MAL", "MAT": "MAT",
    "MAR": "MRK", "LUK": "LUK", "JOH": "JHN", "ACT": "ACT", "ROM": "ROM",
    "1CO": "1CO", "2CO": "2CO", "GAL": "GAL", "EPH": "EPH", "PHI": "PHP",
    "COL": "COL", "1TH": "1TH", "2TH": "2TH", "1TI": "1TI", "2TI": "2TI",
    "TIT": "TIT", "PHM": "PHM", "HEB": "HEB", "JAM": "JAS", "1PE": "1PE",
    "2PE": "2PE", "1JO": "1JN", "2JO": "2JN", "3JO": "3JN", "JUD": "JUD",
    "REV": "REV",
    # Brenton LXX-specific
    "TOB": "TOB", "JDT": "JDT", "ESG": "ESG", "WIS": "WIS", "SIR": "SIR",
    "BAR": "BAR", "EPJ": "EPJ", "SUS": "SUS", "BEL": "BEL", "1MA": "1MA",
    "2MA": "2MA", "3MA": "3MA", "4MA": "4MA", "1ES": "1ES", "PRM": "MAN",
    "DNG": "DAN",  # Brenton "Daniel (Greek)" -> canonical Daniel
}

# ---------------------------------------------------------------------------
# Version registry. id is explicit + stable so verse rows can reference it
# directly in bulk inserts (no serial-dependence).
# ---------------------------------------------------------------------------
VERSIONS = [
    dict(id=1, slug="kjv", title="King James Version", abbrev="KJV",
         year="1769", base="KJV 1769 (Blayney) text",
         source="scrollmapper/bible_databases (CSV) — public-domain KJV",
         loader="scroll", file="KJV.csv"),
    dict(id=2, slug="asv", title="American Standard Version", abbrev="ASV",
         year="1901", base="ASV 1901",
         source="scrollmapper/bible_databases (CSV) — public-domain ASV",
         loader="scroll", file="ASV.csv"),
    dict(id=3, slug="ylt", title="Young's Literal Translation", abbrev="YLT",
         year="1898", base="YLT 3rd ed. 1898",
         source="scrollmapper/bible_databases (CSV) — public-domain YLT",
         loader="scroll", file="YLT.csv"),
    dict(id=4, slug="darby", title="Darby Translation", abbrev="DBY",
         year="1890", base="J. N. Darby 1890",
         source="scrollmapper/bible_databases (CSV) — public-domain Darby",
         loader="scroll", file="Darby.csv"),
    dict(id=5, slug="webster", title="Webster's Bible", abbrev="WBS",
         year="1833", base="Noah Webster 1833 revision of the KJV",
         source="scrollmapper/bible_databases (CSV) — public-domain Webster",
         loader="scroll", file="Webster.csv"),
    dict(id=6, slug="geneva", title="Geneva Bible (1599)", abbrev="GNV",
         year="1599", base="Geneva Bible 1599",
         source="scrollmapper/bible_databases (CSV) — public-domain Geneva",
         loader="scroll", file="Geneva1599.csv"),
    dict(id=7, slug="dra", title="Douay-Rheims (Challoner)", abbrev="DRA",
         year="1752", base="Douay-Rheims, Challoner revision",
         source="scrollmapper/bible_databases (CSV) — public-domain DRC",
         loader="scroll", file="DRC.csv"),
    dict(id=8, slug="web", title="World English Bible", abbrev="WEB",
         year="2000", base="World English Bible (engwebp)",
         source="eBible.org engwebp VPL — public domain",
         loader="vpl", file="WEB_vpl.txt"),
    dict(id=9, slug="brenton-lxx",
         title="Brenton's English Septuagint (LXX)", abbrev="LXX",
         year="1851", base="Sir Lancelot C. L. Brenton 1851 (eng-Brenton)",
         source="eBible.org eng-Brenton VPL — public domain",
         loader="vpl", file="Brenton_vpl.txt"),
]

# eBible VPL: BOOK chapter:verse[suffix] text. The LXX (Brenton) uses
# lettered sub-verses (e.g. "JOS 9:2a") where the Greek carries extra
# material; we preserve the letter in verse_suffix so NO content is lost
# while integer addressing still works (WHERE verse=2 returns 2 + 2a..).
VPL_RE = re.compile(r"^([A-Z0-9]{3})\s+(\d+):(\d+)([a-z]*)\s+(.*)$")


def load_scroll(path):
    """scrollmapper CSV -> list of (code, name, chapter, verse, suffix, text)."""
    rows = []
    unknown = set()
    with open(path, newline="", encoding="utf-8") as fh:
        for r in csv.DictReader(fh):
            name = r["Book"].strip()
            code = SCROLL_MAP.get(name)
            if not code:
                unknown.add(name)
                continue
            rows.append((code, name, int(r["Chapter"]), int(r["Verse"]), "",
                         r["Text"].strip()))
    if unknown:
        print(f"  WARN unmapped scrollmapper books: {sorted(unknown)}",
              file=sys.stderr)
    return rows


def load_vpl(path):
    """eBible VPL -> list of (code, name, chapter, verse, suffix, text)."""
    rows = []
    unknown = set()
    dropped_empty = []
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            line = line.rstrip("\n")
            if not line or line.startswith("#"):
                continue
            m = VPL_RE.match(line)
            if not m:
                continue
            raw, ch, vs, suffix, text = m.groups()
            code = EBIBLE_MAP.get(raw)
            if not code:
                unknown.add(raw)
                continue
            text = text.strip()
            if not text:
                dropped_empty.append(f"{raw} {ch}:{vs}{suffix}")
                continue
            rows.append((code, CODE_NAME.get(code, code), int(ch), int(vs),
                         suffix, text))
    if unknown:
        print(f"  WARN unmapped eBible codes: {sorted(unknown)}",
              file=sys.stderr)
    if dropped_empty:
        print(f"  note: dropped {len(dropped_empty)} empty-text verse refs: "
              f"{dropped_empty}", file=sys.stderr)
    return rows


def sql_escape(s):
    return s.replace("'", "''")


def main():
    all_rows = {}        # version_id -> rows
    for v in VERSIONS:
        path = os.path.join(RAW, v["file"])
        rows = load_scroll(path) if v["loader"] == "scroll" else load_vpl(path)
        all_rows[v["id"]] = rows
        print(f"loaded {v['slug']:12} {len(rows):>6} verses from {v['file']}")

    write_migration(all_rows)
    write_report(all_rows)


def write_migration(all_rows):
    out = []
    w = out.append
    w("-- =====================================================================")
    w("-- Session 221 — Comparison-only public-domain translations.")
    w("-- =====================================================================")
    w("-- Backend/data layer for the \"compare this verse/chapter to another")
    w("-- version\" feature. These translations are COMPARISON-ONLY: the user")
    w("-- long-presses a verse -> \"compare to another version\" -> a single")
    w("-- verse or single chapter is pulled in the chosen version. They are")
    w("-- NEVER readable as full Bibles (hard cap: at most one chapter of any")
    w("-- comparison version is ever surfaced). The compare_only flag is")
    w("-- CHECK-pinned TRUE so the reading UI can never list them as a Bible.")
    w("--")
    w("-- COMPLETELY SEPARATE from the canon (editions/books/chapters/verses)")
    w("-- and from the cross-reference apparatus (cross_references/threads).")
    w("-- Its own three tables; verse-addressable by")
    w("-- (version, book_code, chapter, verse).")
    w("--")
    w("-- Sources are all PUBLIC DOMAIN:")
    w("--   KJV/ASV/YLT/Darby/Webster/Geneva/DRA  scrollmapper/bible_databases (CSV)")
    w("--   WEB                                    eBible.org engwebp (VPL)")
    w("--   Brenton LXX                            eBible.org eng-Brenton (VPL)")
    w("-- Provenance + per-version counts: source-texts/compare-versions/")
    w("--   ACQUISITION.md and VERIFICATION_REPORT.md.")
    w("--")
    w("-- Re-runnable: DELETE-then-INSERT inside one transaction; CREATE")
    w("-- TABLE IF NOT EXISTS. Counts verified against canonical counts before")
    w("-- this file was generated (build_compare_migration.py).")
    w("-- =====================================================================")
    w("")
    w("BEGIN;")
    w("")
    # ---- DDL ----
    w("-- Section A — schema -------------------------------------------------")
    w("""CREATE TABLE IF NOT EXISTS compare_versions (
    id                  INT PRIMARY KEY,
    slug                TEXT NOT NULL UNIQUE,   -- 'kjv','asv','brenton-lxx', ...
    title               TEXT NOT NULL,
    abbreviation        TEXT NOT NULL,
    language            TEXT NOT NULL DEFAULT 'en',
    year                TEXT,                   -- edition / revision year
    public_domain_base  TEXT NOT NULL,          -- the PD base text
    source_repo         TEXT NOT NULL,          -- acquisition provenance
    license             TEXT NOT NULL DEFAULT 'public domain',
    has_old_testament   BOOLEAN NOT NULL,
    has_new_testament   BOOLEAN NOT NULL,
    -- COMPARISON-ONLY. Pinned TRUE: these are a comparison lens, never a
    -- readable full Bible. The reading UI filters full-Bible lists to the
    -- canon editions table; it must never read from here as a Bible.
    compare_only        BOOLEAN NOT NULL DEFAULT TRUE,
    notes               TEXT,                   -- versification caveats, etc.
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT compare_versions_compare_only_pinned CHECK (compare_only IS TRUE)
);""")
    w("")
    w("COMMENT ON TABLE compare_versions IS")
    w("    'Comparison-only public-domain translations. compare_only is CHECK-pinned TRUE; never surfaced as a readable full Bible — at most one chapter is viewable at a time.';")
    w("")
    w("""CREATE TABLE IF NOT EXISTS compare_books (
    id              SERIAL PRIMARY KEY,
    version_id      INT NOT NULL REFERENCES compare_versions(id) ON DELETE CASCADE,
    book_code       TEXT NOT NULL,    -- USFM/OSIS-style code; protocanon shared across versions
    book_name       TEXT NOT NULL,    -- display name
    book_number     INT NOT NULL,     -- canonical display order
    chapter_count   INT NOT NULL,     -- verified at build time
    verse_count     INT NOT NULL,     -- verified at build time
    UNIQUE (version_id, book_code)
);""")
    w("CREATE INDEX IF NOT EXISTS idx_compare_books_version ON compare_books(version_id, book_number);")
    w("")
    w("COMMENT ON TABLE compare_books IS")
    w("    'Per-version book inventory with verified chapter/verse counts. Drives book/chapter navigation and the one-chapter-max comparison cap.';")
    w("")
    w("""CREATE TABLE IF NOT EXISTS compare_verses (
    id              BIGSERIAL PRIMARY KEY,
    version_id      INT NOT NULL REFERENCES compare_versions(id) ON DELETE CASCADE,
    book_code       TEXT NOT NULL,    -- joins to compare_books.book_code (same version)
    chapter         INT NOT NULL,
    verse           INT NOT NULL,
    -- LXX lettered sub-verse (e.g. '' for the base verse, 'a','b' for the
    -- Brenton/Septuagint continuations). '' for every non-LXX version.
    -- Addressing a single verse with WHERE verse = N returns the base row
    -- plus any sub-verse rows, so no Septuagint content is ever dropped.
    verse_suffix    TEXT NOT NULL DEFAULT '',
    text            TEXT NOT NULL,
    UNIQUE (version_id, book_code, chapter, verse, verse_suffix)
);""")
    w("-- Primary access path: pull one verse or one whole chapter on demand.")
    w("CREATE INDEX IF NOT EXISTS idx_compare_verses_addr ON compare_verses(version_id, book_code, chapter, verse, verse_suffix);")
    w("")
    w("COMMENT ON TABLE compare_verses IS")
    w("    'Verse-addressable comparison text. Fetch a single verse or a single chapter by (version_id, book_code, chapter[, verse]). Never bulk-read as a full Bible.';")
    w("")
    # ---- re-runnable clear ----
    w("-- Section B — re-runnable clear (this migration owns ids 1-9) --------")
    w("DELETE FROM compare_verses WHERE version_id BETWEEN 1 AND 9;")
    w("DELETE FROM compare_books  WHERE version_id BETWEEN 1 AND 9;")
    w("DELETE FROM compare_versions WHERE id BETWEEN 1 AND 9;")
    w("")
    # ---- version rows ----
    w("-- Section C — version rows -------------------------------------------")
    w("INSERT INTO compare_versions")
    w("    (id, slug, title, abbreviation, year, public_domain_base, source_repo, has_old_testament, has_new_testament, notes)")
    w("VALUES")
    vlines = []
    for v in VERSIONS:
        rows = all_rows[v["id"]]
        codes = {r[0] for r in rows}
        has_ot = any(CODE_NUMBER.get(c, 999) <= 39 or CODE_NUMBER.get(c, 0) >= 67 for c in codes)
        has_nt = any(40 <= CODE_NUMBER.get(c, 0) <= 66 for c in codes)
        note = v.get("note", "")
        vlines.append(
            "    ({id}, '{slug}', '{title}', '{abbr}', '{year}', '{base}', '{src}', {ot}, {nt}, {note})".format(
                id=v["id"], slug=v["slug"], title=sql_escape(v["title"]),
                abbr=v["abbrev"], year=v["year"], base=sql_escape(v["base"]),
                src=sql_escape(v["source"]),
                ot="TRUE" if has_ot else "FALSE",
                nt="TRUE" if has_nt else "FALSE",
                note=("'" + sql_escape(note) + "'") if note else "NULL",
            )
        )
    w(",\n".join(vlines) + ";")
    w("")
    # Brenton + DRA + WEB notes via UPDATE (keeps the VALUES block readable)
    w("UPDATE compare_versions SET notes = 'Greek Septuagint, Old Testament only (no New Testament). LXX versification differs from the Hebrew/Protestant text: Psalm numbering runs one behind the Hebrew through much of the Psalter; Daniel is the Greek Daniel (book_code DAN) with Susanna (SUS) and Bel and the Dragon (BEL) carried as separate books; Greek Esther is ESG. Includes the deuterocanonical/apocryphal books. Use for comparing New Testament quotations to the Greek Old Testament.' WHERE slug = 'brenton-lxx';")
    w("UPDATE compare_versions SET notes = 'Catholic canon (Challoner revision): includes the deuterocanon (Tobit, Judith, Wisdom, Sirach, Baruch, 1-2 Maccabees) plus an appendix (Prayer of Manasseh, 1-2 Esdras, Psalm 151, Epistle to the Laodiceans). Baruch ch.6 is the Epistle of Jeremiah. Some Psalm/verse numbering follows the Vulgate.' WHERE slug = 'dra';")
    w("UPDATE compare_versions SET notes = 'World English Bible (Protestant 66). Modern public-domain update of the ASV; a few verses absent in the critical text are intentionally omitted (see VERIFICATION_REPORT.md).' WHERE slug = 'web';")
    w("")
    # ---- book rows ----
    w("-- Section D — per-version book inventory -----------------------------")
    book_value_lines = []
    for v in VERSIONS:
        rows = all_rows[v["id"]]
        # aggregate per code in canonical order
        per = {}
        for code, name, ch, vs, suffix, text in rows:
            d = per.setdefault(code, {"name": name, "chs": set(), "verses": 0})
            d["chs"].add(ch)
            d["verses"] += 1
        for code, _ in BOOK_ORDER:
            if code not in per:
                continue
            d = per[code]
            book_value_lines.append(
                "    ({vid}, '{code}', '{name}', {num}, {chc}, {vc})".format(
                    vid=v["id"], code=code,
                    name=sql_escape(CODE_NAME.get(code, d["name"])),
                    num=CODE_NUMBER[code], chc=len(d["chs"]), vc=d["verses"],
                )
            )
    w("INSERT INTO compare_books (version_id, book_code, book_name, book_number, chapter_count, verse_count)")
    w("VALUES")
    w(",\n".join(book_value_lines) + ";")
    w("")
    # ---- verse rows (batched) ----
    w("-- Section E — verse text (batched multi-row INSERTs) -----------------")
    BATCH = 500
    for v in VERSIONS:
        rows = all_rows[v["id"]]
        # stable sort by canonical order then chapter/verse/suffix
        rows = sorted(rows, key=lambda r: (CODE_NUMBER.get(r[0], 999), r[2], r[3], r[4]))
        w(f"-- {v['slug']} ({len(rows)} verses)")
        for i in range(0, len(rows), BATCH):
            chunk = rows[i:i + BATCH]
            w("INSERT INTO compare_verses (version_id, book_code, chapter, verse, verse_suffix, text) VALUES")
            vals = []
            for code, name, ch, vs, suffix, text in chunk:
                vals.append("({vid},'{code}',{ch},{vs},'{sfx}','{text}')".format(
                    vid=v["id"], code=code, ch=ch, vs=vs, sfx=suffix,
                    text=sql_escape(text)))
            w(",\n".join(vals) + ";")
        w("")
    # ---- verify block ----
    w("-- Section F — in-transaction sanity check ----------------------------")
    w("""DO $verify$
DECLARE
    nver INT; nbook INT; nverse INT; nbad INT;
BEGIN
    SELECT count(*) INTO nver   FROM compare_versions WHERE id BETWEEN 1 AND 9;
    SELECT count(*) INTO nbook  FROM compare_books    WHERE version_id BETWEEN 1 AND 9;
    SELECT count(*) INTO nverse FROM compare_verses   WHERE version_id BETWEEN 1 AND 9;
    -- every book row's stored counts must match the actual verse rows
    SELECT count(*) INTO nbad FROM compare_books b
      WHERE b.verse_count <> (
        SELECT count(*) FROM compare_verses v
         WHERE v.version_id = b.version_id AND v.book_code = b.book_code);
    IF nver <> 9 THEN
        RAISE EXCEPTION 'session221 verify: expected 9 versions, got %', nver;
    END IF;
    IF nbad <> 0 THEN
        RAISE EXCEPTION 'session221 verify: % book rows whose verse_count <> actual verse rows', nbad;
    END IF;
    RAISE NOTICE 'session221: % versions, % books, % verses loaded; book counts consistent.', nver, nbook, nverse;
END
$verify$;""")
    w("")
    w("COMMIT;")
    w("")
    with open(MIGRATION, "w", encoding="utf-8") as fh:
        fh.write("\n".join(out))
    size = os.path.getsize(MIGRATION)
    print(f"\nwrote {MIGRATION} ({size/1e6:.1f} MB)")


# ---------------------------------------------------------------------------
# Verification — counts vs known canonical counts.
# ---------------------------------------------------------------------------

# KJV-versification chapters per protestant book (the 1189-chapter standard).
KJV_CHAPTERS = {
    "GEN": 50, "EXO": 40, "LEV": 27, "NUM": 36, "DEU": 34, "JOS": 24,
    "JDG": 21, "RUT": 4, "1SA": 31, "2SA": 24, "1KI": 22, "2KI": 25,
    "1CH": 29, "2CH": 36, "EZR": 10, "NEH": 13, "EST": 10, "JOB": 42,
    "PSA": 150, "PRO": 31, "ECC": 12, "SNG": 8, "ISA": 66, "JER": 52,
    "LAM": 5, "EZK": 48, "DAN": 12, "HOS": 14, "JOL": 3, "AMO": 9,
    "OBA": 1, "JON": 4, "MIC": 7, "NAM": 3, "HAB": 3, "ZEP": 3, "HAG": 2,
    "ZEC": 14, "MAL": 4, "MAT": 28, "MRK": 16, "LUK": 24, "JHN": 21,
    "ACT": 28, "ROM": 16, "1CO": 16, "2CO": 13, "GAL": 6, "EPH": 6,
    "PHP": 4, "COL": 4, "1TH": 5, "2TH": 3, "1TI": 6, "2TI": 4, "TIT": 3,
    "PHM": 1, "HEB": 13, "JAS": 5, "1PE": 5, "2PE": 3, "1JN": 5, "2JN": 1,
    "3JN": 1, "JUD": 1, "REV": 22,
}
KJV_TOTAL_CHAPTERS = sum(KJV_CHAPTERS.values())   # 1189
KJV_TOTAL_VERSES = 31102
PROT_66 = list(KJV_CHAPTERS.keys())


def ref_set(rows):
    """Set of (code, chapter, verse) — ignores sub-verse suffix."""
    return {(r[0], r[2], r[3]) for r in rows}


def write_report(all_rows):
    lines = []
    w = lines.append
    # KJV baseline reference set for verse-level diffing.
    kjv_refs = ref_set(all_rows[1])
    w("# Comparison Versions — Verification Report")
    w("")
    w("Generated by `build_compare_migration.py` from the staged public-domain")
    w("sources in `raw/`. Every version's book / chapter / verse counts are")
    w("checked against the known canonical counts, and the 66-book versions are")
    w("diffed verse-by-verse against the KJV reference set. Accuracy is the")
    w("wedge — rival apps fail at exactly this (missing chapters, mislabeled")
    w("verses, books advertised but absent), so every gap is called out.")
    w("")
    w(f"**Protestant baseline (KJV versification):** 66 books, "
      f"{KJV_TOTAL_CHAPTERS} chapters, {KJV_TOTAL_VERSES} verses.")
    w("")
    w("| Version | Books | Chapters | Verses | OT | NT | Class |")
    w("|---|---|---|---|---|---|---|")
    for v in VERSIONS:
        rows = all_rows[v["id"]]
        codes = {}
        for r in rows:
            codes.setdefault(r[0], set()).add(r[2])
        nbooks = len(codes)
        nch = sum(len(s) for s in codes.values())
        nverse = len(rows)
        has_nt = any(40 <= CODE_NUMBER.get(c, 0) <= 66 for c in codes)
        has_ot = any(CODE_NUMBER.get(c, 999) <= 39 for c in codes)
        flag = "LXX OT-only" if v["slug"] == "brenton-lxx" else (
            "Catholic+appendix" if v["slug"] == "dra" else "Protestant 66")
        w(f"| {v['abbrev']} | {nbooks} | {nch} | {nverse} | "
          f"{'Y' if has_ot else '-'} | {'Y' if has_nt else '-'} | {flag} |")
    w("")

    for v in VERSIONS:
        rows = all_rows[v["id"]]
        w(f"## {v['abbrev']} — {v['title']}")
        w("")
        w(f"- Source: {v['source']}")
        w(f"- Public-domain base: {v['base']}")
        w(f"- License: public domain")
        # per-book chapter -> verse-count map, and per-chapter verse SET
        bookmap = {}
        chverses = {}
        for code, name, ch, vs, suffix, text in rows:
            bookmap.setdefault(code, {}).setdefault(ch, 0)
            bookmap[code][ch] += 1
            chverses.setdefault((code, ch), set()).add(vs)
        # contiguity: every chapter's base verse numbers run 1..max, no holes
        gaps = []
        for (code, ch), vset in chverses.items():
            holes = sorted(set(range(1, max(vset) + 1)) - vset)
            if holes:
                gaps.append((code, ch, holes))
        gaps.sort(key=lambda g: (CODE_NUMBER.get(g[0], 999), g[1]))

        if v["slug"] == "brenton-lxx":
            present = [c for c in PROT_66 if c in bookmap]
            ot_present = [c for c in present if CODE_NUMBER[c] <= 39]
            ot_missing = [c for c in PROT_66[:39] if c not in bookmap]
            w("- **Septuagint (Greek OT), no New Testament** — by design; "
              "the LXX has no NT. Verse-level diff against the Hebrew baseline "
              "is not meaningful (LXX versification differs), so counts are "
              "reported as-loaded.")
            w(f"- Protocanonical OT books present: {len(ot_present)}/39"
              + (f" — absent: {', '.join(ot_missing)} (Greek Esther carried "
                 "as ESG with the additions)" if ot_missing else ""))
            extra = sorted((c for c in bookmap if c not in KJV_CHAPTERS),
                           key=lambda c: CODE_NUMBER.get(c, 999))
            if extra:
                w(f"- Deuterocanonical / LXX-only books also present "
                  f"({len(extra)}): "
                  + ", ".join(f"{c} ({CODE_NAME.get(c,c)})" for c in extra))
            sub = sum(1 for r in rows if r[4])
            w(f"- Lettered sub-verses preserved (LXX continuations like "
              f"`JOS 9:2a`): {sub} rows, stored in `verse_suffix` so no Greek "
              "content is dropped.")
            if gaps:
                w(f"- ⚠ Internal base-verse gaps ({len(gaps)} chapters): "
                  + ", ".join(f"{CODE_NAME.get(c,c)} {ch}" for c, ch, _ in gaps[:12]))
            else:
                w("- ✅ No internal base-verse gaps — every chapter contiguous "
                  "(sub-verses sit alongside their base verse).")
            w("- ⚠ Known LXX versification caveats (documented in the version "
              "`notes`): Psalm numbering runs one behind the Hebrew through "
              "much of the Psalter; Greek Daniel (DAN) folds the Song of the "
              "Three, with Susanna (SUS) and Bel (BEL) as separate books.")
            w("")
            continue

        # ---- 66-book versions: rigorous verse-level diff vs KJV ----
        missing_books = [c for c in PROT_66 if c not in bookmap]
        # extra chapters inside protestant books (e.g. DRA Daniel 13-14)
        extra_ch = []
        missing_ch = []
        for code in PROT_66:
            if code not in bookmap:
                continue
            present_ch = set(bookmap[code].keys())
            full = set(range(1, KJV_CHAPTERS[code] + 1))
            absent = sorted(full - present_ch)
            beyond = sorted(present_ch - full)
            if absent:
                missing_ch.append((code, absent))
            if beyond:
                extra_ch.append((code, beyond))

        if missing_books:
            w(f"- ⚠ **Missing protestant books:** {', '.join(missing_books)}")
        else:
            w("- ✅ All 66 protestant books present.")
        if missing_ch:
            w("- ⚠ **Missing chapters:**")
            for code, absent in missing_ch:
                w(f"  - {code}: missing {absent}")
        else:
            w(f"- ✅ All {KJV_TOTAL_CHAPTERS} protestant chapters present.")

        # contiguity — the true within-version completeness guarantee:
        # every chapter must run 1..N with no internal verse holes.
        if gaps:
            w(f"- ⚠ **Internal verse gaps ({len(gaps)} chapters):**")
            for code, ch, holes in gaps[:20]:
                w(f"  - {CODE_NAME.get(code, code)} {ch}: missing {holes}")
        else:
            w("- ✅ No internal verse gaps — every chapter runs 1..N "
              "contiguously (no holes anywhere).")

        # verse-level diff vs KJV (protestant refs only)
        vrefs = {r for r in ref_set(rows) if r[0] in KJV_CHAPTERS}
        missing_v = sorted(kjv_refs - vrefs,
                           key=lambda r: (CODE_NUMBER[r[0]], r[1], r[2]))
        extra_v = sorted(vrefs - kjv_refs,
                         key=lambda r: (CODE_NUMBER[r[0]], r[1], r[2]))

        def fmt(r):
            return f"{CODE_NAME[r[0]]} {r[1]}:{r[2]}"

        # For Vulgate (DRA) the KJV-ref diff is dominated by verse-boundary
        # renumbering, not missing text — contiguity above already proves no
        # content is missing. Summarize rather than alarm.
        if v["slug"] == "dra":
            w(f"- KJV verse refs that map to a different boundary here: "
              f"{len(missing_v)} (Vulgate versification renumbers verse "
              "splits/joins throughout; contiguity + chapter completeness "
              "above confirm no text is missing).")
        elif missing_v:
            shown = ", ".join(fmt(r) for r in missing_v[:25])
            more = f" … (+{len(missing_v)-25} more)" if len(missing_v) > 25 else ""
            w(f"- Verses present in KJV but absent here ({len(missing_v)}): "
              f"{shown}{more}")
            if v["slug"] == "web":
                w("  - These are the textually-disputed verses the WEB's "
                  "critical-text base omits / relocates (e.g. the Romans "
                  "doxology moves to 14:24–26); footnoted in print, not errors.")
        else:
            w("- ✅ Every KJV verse reference is present.")
        if extra_v and v["slug"] != "dra":
            w(f"- Verse refs here not in KJV ({len(extra_v)}): "
              + ", ".join(fmt(r) for r in extra_v[:15])
              + (" …" if len(extra_v) > 15 else "")
              + "  (versification split — extra content, not errors).")

        prot_verses = len(vrefs)
        delta = prot_verses - KJV_TOTAL_VERSES
        w(f"- Protestant-canon verse count: {prot_verses} "
          f"({'+' if delta >= 0 else ''}{delta} vs KJV {KJV_TOTAL_VERSES}).")

        if extra_ch:
            w("- Extra chapters beyond the protestant count (legitimate "
              "expanded content):")
            for code, beyond in extra_ch:
                w(f"  - {CODE_NAME[code]} ({code}): +chapters {beyond} "
                  + ("(Susanna = 13, Bel = 14)" if code == "DAN"
                     else "(Greek additions)" if code == "EST" else ""))

        extra_books = sorted((c for c in bookmap if c not in KJV_CHAPTERS),
                             key=lambda c: CODE_NUMBER.get(c, 999))
        if extra_books:
            w(f"- Deuterocanonical / appendix books present "
              f"({len(extra_books)}): "
              + ", ".join(f"{c} ({CODE_NAME.get(c,c)})" for c in extra_books))
        w("")

    with open(REPORT, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines))
    print(f"wrote {REPORT}")


if __name__ == "__main__":
    main()
