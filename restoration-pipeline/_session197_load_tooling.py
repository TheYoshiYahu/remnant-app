#!/usr/bin/env python3
"""
S197 — Session B (part 2) tooling loader.

Reads the five public-domain tool corpora gathered in S195 and emits one
re-runnable migration SQL file per tool (CREATE TABLE IF NOT EXISTS + batched
INSERT ... ON CONFLICT DO UPDATE + a verify block), plus the vincents seed
re-key migration. The base tables are the untouched PD bases; the framework
correction layer rides separately in tool_annotations (S196).

This follows the S163 loader precedent: a Python script that reads source-texts
directly and emits an idempotent migration the apply step runs into Postgres.
No DB connection here — the script is pure read-source / emit-SQL.

Sources (per SOURCE_TEXT_INVENTORY §III):
  vincents : source-texts/vincents-word-studies/vincents-structured.json (S196)
  naves    : source-texts/naves-topical/NavesTopicalDictionary.csv (29,007 rows)
  tsk      : source-texts/tsk-cross-references/cross_references.txt (344,799 pairs)
  maps     : source-texts/maps-openbible/data/ancient.jsonl (1,341 verse-indexed)
  nikkudot : source-texts/stepbible-data/.../TAHOT *.txt (pointed Hebrew OT)

Outputs (data-schema/migrations/):
  session197_vincents_load.sql
  session197_naves_load.sql
  session197_tsk_load.sql
  session197_maps_load.sql
  session197_nikkudot_load.sql
  session197_vincents_annotation_rekey.sql   (verse-level entry_key per checkpoint)

Run from the host or sandbox:
  python3 restoration-pipeline/_session197_load_tooling.py
"""

from __future__ import annotations

import csv
import json
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SOURCE = REPO_ROOT / "source-texts"
MIG = REPO_ROOT / "data-schema" / "migrations"

BATCH = 500


# ── shared book-abbrev → slug map (lifted from S163 loader) ──────────────────
BOOK_ABBREV: dict[str, str] = {
    "Gen": "genesis", "Exod": "exodus", "Ex": "exodus", "Exo": "exodus",
    "Lev": "leviticus", "Num": "numbers", "Nu": "numbers",
    "Deut": "deuteronomy", "Dt": "deuteronomy", "Deu": "deuteronomy",
    "Josh": "joshua", "Jos": "joshua", "Judg": "judges", "Jdg": "judges",
    "Ruth": "ruth", "Rut": "ruth", "Ru": "ruth",
    "1Sam": "1-samuel", "1Sa": "1-samuel", "2Sam": "2-samuel", "2Sa": "2-samuel",
    "1Kgs": "1-kings", "1Ki": "1-kings", "2Kgs": "2-kings", "2Ki": "2-kings",
    "1Chr": "1-chronicles", "1Ch": "1-chronicles",
    "2Chr": "2-chronicles", "2Ch": "2-chronicles",
    "Ezra": "ezra", "Ezr": "ezra", "Neh": "nehemiah", "Esth": "esther", "Est": "esther",
    "Job": "job", "Ps": "psalms", "Psa": "psalms", "Pss": "psalms",
    "Prov": "proverbs", "Pro": "proverbs", "Pr": "proverbs",
    "Eccl": "ecclesiastes", "Ecc": "ecclesiastes", "Ec": "ecclesiastes",
    "Song": "song-of-solomon", "Sng": "song-of-solomon", "Cant": "song-of-solomon",
    "Isa": "isaiah", "Is": "isaiah", "Jer": "jeremiah", "Je": "jeremiah",
    "Lam": "lamentations", "La": "lamentations",
    "Ezek": "ezekiel", "Eze": "ezekiel", "Ez": "ezekiel",
    "Dan": "daniel", "Dn": "daniel",
    "Hos": "hosea", "Joel": "joel", "Jol": "joel", "Joe": "joel",
    "Amos": "amos", "Amo": "amos", "Am": "amos",
    "Obad": "obadiah", "Oba": "obadiah", "Ob": "obadiah",
    "Jonah": "jonah", "Jon": "jonah", "Mic": "micah", "Mi": "micah",
    "Nah": "nahum", "Na": "nahum", "Hab": "habakkuk",
    "Zeph": "zephaniah", "Zep": "zephaniah", "Hag": "haggai",
    "Zech": "zechariah", "Zec": "zechariah", "Mal": "malachi",
    "Matt": "matthew", "Mat": "matthew", "Mt": "matthew",
    "Mark": "mark", "Mrk": "mark", "Mk": "mark",
    "Luke": "luke", "Luk": "luke", "Lk": "luke",
    "John": "john", "Jhn": "john", "Jn": "john",
    "Acts": "acts", "Act": "acts", "Rom": "romans",
    "1Cor": "1-corinthians", "1Co": "1-corinthians",
    "2Cor": "2-corinthians", "2Co": "2-corinthians",
    "Gal": "galatians", "Eph": "ephesians", "Phil": "philippians",
    "Php": "philippians", "Col": "colossians",
    "1Thess": "1-thessalonians", "1Thes": "1-thessalonians", "1Th": "1-thessalonians",
    "2Thess": "2-thessalonians", "2Thes": "2-thessalonians", "2Th": "2-thessalonians",
    "1Tim": "1-timothy", "1Ti": "1-timothy", "2Tim": "2-timothy", "2Ti": "2-timothy",
    "Tit": "titus", "Phm": "philemon", "Phlm": "philemon", "Heb": "hebrews",
    "Jas": "james", "Jam": "james", "Ja": "james",
    "1Pet": "1-peter", "1Pe": "1-peter", "2Pet": "2-peter", "2Pe": "2-peter",
    "1Jn": "1-john", "1John": "1-john", "2Jn": "2-john", "2John": "2-john",
    "3Jn": "3-john", "3John": "3-john", "Jude": "jude", "Jud": "jude",
    "Rev": "revelation",
}


def q(val) -> str:
    """SQL-quote a value (str/int/None) for inline VALUES."""
    if val is None:
        return "NULL"
    if isinstance(val, bool):
        return "TRUE" if val else "FALSE"
    if isinstance(val, (int, float)):
        return str(val)
    return "'" + str(val).replace("'", "''") + "'"


def slug_topic(subject: str) -> str:
    s = subject.strip().lower()
    s = re.sub(r"[^a-z0-9]+", "-", s).strip("-")
    return s or "untitled"


def emit_batches(f, table: str, columns: str, rows: list[str], conflict: str) -> None:
    """Write batched multi-row INSERT ... ON CONFLICT statements."""
    for i in range(0, len(rows), BATCH):
        chunk = rows[i : i + BATCH]
        f.write(f"INSERT INTO {table} ({columns}) VALUES\n")
        f.write(",\n".join("  " + r for r in chunk))
        f.write("\n" + conflict + ";\n\n")


# ── 1. Vincent's ─────────────────────────────────────────────────────────────
def load_vincents() -> int:
    data = json.loads((SOURCE / "vincents-word-studies" / "vincents-structured.json").read_text())
    rows = []
    for e in data:
        book = e["book"]
        ch = int(e["chapter"])
        v = int(e["verse"])
        verse_key = f"{book}.{ch}.{v}"
        rows.append(
            f"({q(e['entry_key'])}, {q(book)}, {ch}, {v}, {q(verse_key)}, "
            f"{q(e.get('headword'))}, {q(e['body'])}, {q(e.get('source_vol'))})"
        )
    out = MIG / "session197_vincents_load.sql"
    with out.open("w") as f:
        f.write(
            "-- S197 — Vincent's Word Studies (NT expository) base load.\n"
            "-- Source: source-texts/vincents-word-studies/vincents-structured.json (S196).\n"
            "-- PD base (Marvin R. Vincent, 1886–1900, d.1922). Framework correction rides\n"
            "-- in tool_annotations (tool='vincents'); this is the untouched annotated-foil base.\n"
            "-- Re-runnable: ON CONFLICT (entry_key) DO UPDATE.\n\n"
            "BEGIN;\n\n"
            "CREATE TABLE IF NOT EXISTS vincents_entries (\n"
            "    id          BIGSERIAL PRIMARY KEY,\n"
            "    entry_key   TEXT NOT NULL UNIQUE,         -- '<book>.<ch>.<v>:<headword-slug>'\n"
            "    book_slug   TEXT NOT NULL,\n"
            "    chapter     INT  NOT NULL,\n"
            "    verse       INT  NOT NULL,\n"
            "    verse_key   TEXT NOT NULL,                -- '<book>.<ch>.<v>' (annotation lookup key)\n"
            "    headword    TEXT,\n"
            "    body        TEXT NOT NULL,\n"
            "    source_vol  TEXT\n"
            ");\n"
            "CREATE INDEX IF NOT EXISTS idx_vincents_verse ON vincents_entries(book_slug, chapter, verse);\n"
            "CREATE INDEX IF NOT EXISTS idx_vincents_verse_key ON vincents_entries(verse_key);\n\n"
        )
        emit_batches(
            f, "vincents_entries",
            "entry_key, book_slug, chapter, verse, verse_key, headword, body, source_vol",
            rows,
            "ON CONFLICT (entry_key) DO UPDATE SET "
            "book_slug=EXCLUDED.book_slug, chapter=EXCLUDED.chapter, verse=EXCLUDED.verse, "
            "verse_key=EXCLUDED.verse_key, headword=EXCLUDED.headword, body=EXCLUDED.body, "
            "source_vol=EXCLUDED.source_vol",
        )
        f.write(
            "DO $v$ DECLARE n INT; BEGIN\n"
            "  SELECT COUNT(*) INTO n FROM vincents_entries;\n"
            "  RAISE NOTICE 'session197 vincents: % rows', n;\n"
            f"  IF n < {len(rows)} THEN RAISE EXCEPTION 'vincents load short: %', n; END IF;\n"
            "END $v$;\n\nCOMMIT;\n"
        )
    return len(rows)


# ── 2. Nave's ────────────────────────────────────────────────────────────────
def load_naves() -> int:
    path = SOURCE / "naves-topical" / "NavesTopicalDictionary.csv"
    rows = []
    seen: dict[str, int] = {}
    with path.open(encoding="utf-8-sig") as fh:
        reader = csv.DictReader(fh)
        for r in reader:
            subject = (r.get("subject") or "").strip()
            entry = (r.get("entry") or "").strip()
            section = (r.get("section") or "").strip()
            if not subject:
                continue
            base = slug_topic(subject)
            # de-collide repeated subjects
            n = seen.get(base, 0)
            seen[base] = n + 1
            slug = base if n == 0 else f"{base}~{n}"
            rows.append(f"({q(slug)}, {q(section)}, {q(subject)}, {q(entry)})")
    out = MIG / "session197_naves_load.sql"
    with out.open("w") as f:
        f.write(
            "-- S197 — Nave's Topical Bible base load (subordinate labeled foil).\n"
            "-- Source: source-texts/naves-topical/NavesTopicalDictionary.csv (BradyStephenson CC-BY).\n"
            "-- The taxonomy IS the inherited reading; framework corrections ride in\n"
            "-- tool_annotations (tool='naves') on the gentiles/church/law/israel headings.\n"
            "-- Re-runnable: ON CONFLICT (topic_slug) DO UPDATE.\n\n"
            "BEGIN;\n\n"
            "CREATE TABLE IF NOT EXISTS naves_topical (\n"
            "    id          BIGSERIAL PRIMARY KEY,\n"
            "    topic_slug  TEXT NOT NULL UNIQUE,\n"
            "    section     TEXT,                         -- A–Z index letter\n"
            "    subject     TEXT NOT NULL,                -- the heading as published\n"
            "    entry       TEXT NOT NULL                 -- the topical body w/ verse refs\n"
            ");\n"
            "CREATE INDEX IF NOT EXISTS idx_naves_subject ON naves_topical(lower(subject));\n"
            "CREATE INDEX IF NOT EXISTS idx_naves_section ON naves_topical(section);\n\n"
        )
        emit_batches(
            f, "naves_topical", "topic_slug, section, subject, entry", rows,
            "ON CONFLICT (topic_slug) DO UPDATE SET "
            "section=EXCLUDED.section, subject=EXCLUDED.subject, entry=EXCLUDED.entry",
        )
        f.write(
            "DO $v$ DECLARE n INT; BEGIN\n"
            "  SELECT COUNT(*) INTO n FROM naves_topical;\n"
            "  RAISE NOTICE 'session197 naves: % rows', n;\n"
            f"  IF n < {int(len(rows) * 0.9)} THEN RAISE EXCEPTION 'naves load short: %', n; END IF;\n"
            "END $v$;\n\nCOMMIT;\n"
        )
    return len(rows)


# ── 3. TSK ───────────────────────────────────────────────────────────────────
_REF_RE = re.compile(r"^([1-3]?[A-Za-z]+)\.(\d+)\.(\d+)")


def _parse_ref(ref: str):
    m = _REF_RE.match(ref)
    if not m:
        return None
    book, ch, v = m.group(1), int(m.group(2)), int(m.group(3))
    slug = BOOK_ABBREV.get(book)
    if slug is None:
        return None
    return slug, ch, v


def load_tsk() -> int:
    path = SOURCE / "tsk-cross-references" / "cross_references.txt"
    rows = []
    skipped = 0
    with path.open(encoding="utf-8") as fh:
        header = True
        for line in fh:
            if header:
                header = False
                continue
            line = line.rstrip("\n")
            if not line or line.startswith("#"):
                continue
            parts = line.split("\t")
            if len(parts) < 3:
                continue
            from_ref, to_ref, votes_raw = parts[0], parts[1], parts[2]
            # votes column may carry a trailing '#...' comment on row 1
            vm = re.match(r"-?\d+", votes_raw.strip())
            votes = int(vm.group(0)) if vm else 0
            src = _parse_ref(from_ref)
            if src is None:
                skipped += 1
                continue
            slug, ch, v = src
            rows.append(
                f"({q(from_ref)}, {q(slug)}, {ch}, {v}, {q(to_ref)}, {votes})"
            )
    out = MIG / "session197_tsk_load.sql"
    with out.open("w") as f:
        f.write(
            "-- S197 — Treasury of Scripture Knowledge (TSK) base load (standalone foil).\n"
            "-- Source: source-texts/tsk-cross-references/cross_references.txt (openbible.info CC-BY).\n"
            "-- Distortion-class gate passed S196 (S196_TSK_DISTORTION_SWEEP.md); the four\n"
            "-- sweep:<class> notes ride in tool_annotations (tool='tsk'). Opt-in, subordinate.\n"
            "-- Re-runnable: TRUNCATE-free — ON CONFLICT on the (from,to) natural key.\n\n"
            "BEGIN;\n\n"
            "CREATE TABLE IF NOT EXISTS tsk_pairs (\n"
            "    id              BIGSERIAL PRIMARY KEY,\n"
            "    from_ref        TEXT NOT NULL,            -- raw osis source verse, e.g. 'Gen.1.1'\n"
            "    from_book_slug  TEXT NOT NULL,            -- resolved canon slug\n"
            "    from_chapter    INT  NOT NULL,\n"
            "    from_verse      INT  NOT NULL,\n"
            "    to_ref          TEXT NOT NULL,            -- raw osis target (may be a range)\n"
            "    votes           INT  NOT NULL DEFAULT 0,\n"
            "    UNIQUE (from_ref, to_ref)\n"
            ");\n"
            "CREATE INDEX IF NOT EXISTS idx_tsk_source ON tsk_pairs(from_book_slug, from_chapter, from_verse);\n\n"
        )
        emit_batches(
            f, "tsk_pairs",
            "from_ref, from_book_slug, from_chapter, from_verse, to_ref, votes", rows,
            "ON CONFLICT (from_ref, to_ref) DO UPDATE SET votes=EXCLUDED.votes, "
            "from_book_slug=EXCLUDED.from_book_slug, from_chapter=EXCLUDED.from_chapter, "
            "from_verse=EXCLUDED.from_verse",
        )
        f.write(
            "DO $v$ DECLARE n INT; BEGIN\n"
            "  SELECT COUNT(*) INTO n FROM tsk_pairs;\n"
            "  RAISE NOTICE 'session197 tsk: % rows', n;\n"
            f"  IF n < {int(len(rows) * 0.99)} THEN RAISE EXCEPTION 'tsk load short: %', n; END IF;\n"
            "END $v$;\n\nCOMMIT;\n"
        )
    print(f"  tsk: {skipped} pairs skipped (unmapped source book)", file=sys.stderr)
    return len(rows)


# ── 4. Maps ──────────────────────────────────────────────────────────────────
def load_maps() -> int:
    path = SOURCE / "maps-openbible" / "data" / "ancient.jsonl"
    rows = []
    seen_ids = set()
    with path.open(encoding="utf-8") as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue
            try:
                d = json.loads(line)
            except json.JSONDecodeError:
                continue
            pid = d.get("id")
            if not pid or pid in seen_ids:
                continue
            friendly = d.get("friendly_id")
            # representative lon/lat from the first resolution that has one
            lon = lat = None
            for ident in d.get("identifications", []):
                for res in ident.get("resolutions", []):
                    ll = res.get("lonlat")
                    if ll and "," in ll:
                        try:
                            lo, la = ll.split(",")
                            lon, lat = float(lo), float(la)
                        except ValueError:
                            lon = lat = None
                        break
                if lon is not None:
                    break
            if lon is None:
                continue  # no coordinate → can't plot
            # osis refs + a representative class from the extra blob
            osises = []
            klass = None
            extra = d.get("extra")
            if extra:
                try:
                    ex = json.loads(extra)
                    osises = ex.get("osises", []) or []
                except json.JSONDecodeError:
                    pass
            for ident in d.get("identifications", []):
                if ident.get("class"):
                    klass = ident["class"]
                    break
            seen_ids.add(pid)
            osis_arr = "ARRAY[" + ",".join(q(o) for o in osises[:40]) + "]::TEXT[]" if osises else "'{}'::TEXT[]"
            rows.append(
                f"({q(pid)}, {q(friendly)}, {lon}, {lat}, {q(klass)}, {osis_arr})"
            )
    out = MIG / "session197_maps_load.sql"
    with out.open("w") as f:
        f.write(
            "-- S197 — OpenBible ancient places base load (own-tile map render).\n"
            "-- Source: source-texts/maps-openbible/data/ancient.jsonl (openbible.info CC-BY).\n"
            "-- We ship coordinates only and render on our own SVG/canvas tiles — no\n"
            "-- copyrighted atlas plate. The dispersion/gathering overlay rides in\n"
            "-- tool_annotations (tool='maps', 'dispersion-overlay' + 'region:israel').\n"
            "-- Re-runnable: ON CONFLICT (place_id) DO UPDATE.\n\n"
            "BEGIN;\n\n"
            "CREATE TABLE IF NOT EXISTS maps_places (\n"
            "    id         BIGSERIAL PRIMARY KEY,\n"
            "    place_id   TEXT NOT NULL UNIQUE,         -- openbible ancient id\n"
            "    name       TEXT,                         -- friendly_id\n"
            "    lon        DOUBLE PRECISION NOT NULL,\n"
            "    lat        DOUBLE PRECISION NOT NULL,\n"
            "    kind       TEXT,                         -- settlement / natural / region / ...\n"
            "    osis_refs  TEXT[] NOT NULL DEFAULT '{}'  -- verses that name this place\n"
            ");\n"
            "CREATE INDEX IF NOT EXISTS idx_maps_kind ON maps_places(kind);\n\n"
        )
        emit_batches(
            f, "maps_places", "place_id, name, lon, lat, kind, osis_refs", rows,
            "ON CONFLICT (place_id) DO UPDATE SET name=EXCLUDED.name, lon=EXCLUDED.lon, "
            "lat=EXCLUDED.lat, kind=EXCLUDED.kind, osis_refs=EXCLUDED.osis_refs",
        )
        f.write(
            "DO $v$ DECLARE n INT; BEGIN\n"
            "  SELECT COUNT(*) INTO n FROM maps_places;\n"
            "  RAISE NOTICE 'session197 maps: % places', n;\n"
            f"  IF n < {int(len(rows) * 0.95)} THEN RAISE EXCEPTION 'maps load short: %', n; END IF;\n"
            "END $v$;\n\nCOMMIT;\n"
        )
    return len(rows)


# ── 5. Nikkudot (pointed Hebrew per verse, from TAHOT) ───────────────────────
TAHOT_DIR = SOURCE / "stepbible-data" / "Translators Amalgamated OT+NT"
_TAHOT_REF = re.compile(r"^([1-3]?[A-Za-z]+)\.(\d+)\.(\d+)#")


def load_nikkudot() -> int:
    verses: dict[str, dict] = {}  # verse_key -> {slug,ch,v,words[],yhwh}
    order: list[str] = []
    for fp in sorted(TAHOT_DIR.glob("TAHOT *.txt")):
        with fp.open(encoding="utf-8") as fh:
            for line in fh:
                if not line or "\t" not in line:
                    continue
                m = _TAHOT_REF.match(line)
                if not m:
                    continue
                book, ch, v = m.group(1), int(m.group(2)), int(m.group(3))
                slug = BOOK_ABBREV.get(book)
                if slug is None:
                    continue
                cols = line.split("\t")
                if len(cols) < 5:
                    continue
                pointed = cols[1].strip()
                strongs = cols[4] if len(cols) > 4 else ""
                if not pointed:
                    continue
                key = f"{slug}.{ch}.{v}"
                if key not in verses:
                    verses[key] = {"slug": slug, "ch": ch, "v": v, "words": [], "yhwh": False}
                    order.append(key)
                verses[key]["words"].append(pointed)
                if "H3068" in strongs:
                    verses[key]["yhwh"] = True
    rows = []
    for key in order:
        e = verses[key]
        pointed_text = " ".join(e["words"])
        rows.append(
            f"({q(key)}, {q(e['slug'])}, {e['ch']}, {e['v']}, "
            f"{q(pointed_text)}, {q(e['yhwh'])})"
        )
    out = MIG / "session197_nikkudot_load.sql"
    with out.open("w") as f:
        f.write(
            "-- S197 — Nikkudot (pointed Hebrew per verse) base load — interlinear sibling.\n"
            "-- Source: STEPBible TAHOT (Tyndale Amalgamated Hebrew OT, CC-BY).\n"
            "-- The pointing is trustworthy except the one deliberate masking of the Name;\n"
            "-- that single conflict rides in tool_annotations (tool='nikkudot',\n"
            "-- 'tetragrammaton'). has_tetragrammaton flags verses that contain יהוה (H3068)\n"
            "-- so the surface attaches the Name-pointing note exactly where it belongs.\n"
            "-- Re-runnable: ON CONFLICT (verse_key) DO UPDATE.\n\n"
            "BEGIN;\n\n"
            "CREATE TABLE IF NOT EXISTS nikkudot_verses (\n"
            "    id                 BIGSERIAL PRIMARY KEY,\n"
            "    verse_key          TEXT NOT NULL UNIQUE,  -- '<book>.<ch>.<v>'\n"
            "    book_slug          TEXT NOT NULL,\n"
            "    chapter            INT  NOT NULL,\n"
            "    verse              INT  NOT NULL,\n"
            "    pointed_text       TEXT NOT NULL,         -- space-joined pointed Hebrew words\n"
            "    has_tetragrammaton BOOLEAN NOT NULL DEFAULT FALSE\n"
            ");\n"
            "CREATE INDEX IF NOT EXISTS idx_nikkudot_verse ON nikkudot_verses(book_slug, chapter, verse);\n\n"
        )
        emit_batches(
            f, "nikkudot_verses",
            "verse_key, book_slug, chapter, verse, pointed_text, has_tetragrammaton", rows,
            "ON CONFLICT (verse_key) DO UPDATE SET pointed_text=EXCLUDED.pointed_text, "
            "has_tetragrammaton=EXCLUDED.has_tetragrammaton",
        )
        f.write(
            "DO $v$ DECLARE n INT; BEGIN\n"
            "  SELECT COUNT(*) INTO n FROM nikkudot_verses;\n"
            "  RAISE NOTICE 'session197 nikkudot: % verses', n;\n"
            f"  IF n < {int(len(rows) * 0.95)} THEN RAISE EXCEPTION 'nikkudot load short: %', n; END IF;\n"
            "END $v$;\n\nCOMMIT;\n"
        )
    return len(rows)


# ── 6. Vincent's annotation re-key (lemma → verse-level) ─────────────────────
def emit_rekey() -> None:
    out = MIG / "session197_vincents_annotation_rekey.sql"
    out.write_text(
        "-- S197 — re-key the 5 vincents tool_annotations rows from lemma-level\n"
        "-- ('romans.10.4:telos') to verse-level ('romans.10.4'), per the S196\n"
        "-- checkpoint decision: the band attaches per verse regardless of which\n"
        "-- head-phrase the reader is on. None of the 5 share a verse, so no\n"
        "-- collisions on the UNIQUE(tool, entry_key). Idempotent: split_part is a\n"
        "-- no-op on rows already at verse level.\n\n"
        "BEGIN;\n\n"
        "UPDATE tool_annotations\n"
        "   SET entry_key = split_part(entry_key, ':', 1)\n"
        " WHERE tool = 'vincents' AND entry_key LIKE '%:%';\n\n"
        "DO $v$ DECLARE bad INT; BEGIN\n"
        "  SELECT COUNT(*) INTO bad FROM tool_annotations WHERE tool='vincents' AND entry_key LIKE '%:%';\n"
        "  IF bad > 0 THEN RAISE EXCEPTION 'vincents rekey left % lemma keys', bad; END IF;\n"
        "  RAISE NOTICE 'session197 vincents annotation rekey: all rows verse-level.';\n"
        "END $v$;\n\nCOMMIT;\n"
    )


def main() -> None:
    print("S197 tooling loader — emitting migrations…", file=sys.stderr)
    nv = load_vincents(); print(f"  vincents_entries : {nv}", file=sys.stderr)
    nn = load_naves();    print(f"  naves_topical    : {nn}", file=sys.stderr)
    nt = load_tsk();      print(f"  tsk_pairs        : {nt}", file=sys.stderr)
    nm = load_maps();     print(f"  maps_places      : {nm}", file=sys.stderr)
    nk = load_nikkudot(); print(f"  nikkudot_verses  : {nk}", file=sys.stderr)
    emit_rekey()
    print("  vincents annotation rekey migration emitted", file=sys.stderr)
    print("done.", file=sys.stderr)


if __name__ == "__main__":
    main()
