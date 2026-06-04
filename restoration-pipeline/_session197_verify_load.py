#!/usr/bin/env python3
"""S197 — load-verify the new tooling migrations into a real userland Postgres.

Boots a pgserver instance, applies base schema.sql + the S196 tool_annotations
migration + seed, then the five S197 base loads + the vincents annotation rekey,
and asserts the row counts. No sudo; pgserver ships a userland binary.
"""
from __future__ import annotations
import sys, tempfile, pathlib, subprocess
import pgserver

PSQL = str(pathlib.Path(pgserver.__file__).resolve().parent / "pginstall" / "bin" / "psql")


def run_file(uri: str, path: pathlib.Path) -> None:
    subprocess.run([PSQL, uri, "-v", "ON_ERROR_STOP=1", "-q", "-f", str(path)], check=True)


def scalar(uri: str, sql: str) -> str:
    return subprocess.check_output([PSQL, uri, "-tAc", sql]).decode().strip()

REPO = pathlib.Path(__file__).resolve().parent.parent
MIG = REPO / "data-schema" / "migrations"
SCHEMA = REPO / "data-schema" / "schema.sql"

# Minimal prerequisite stand-in for schema.sql — the full schema requires the
# pgcrypto extension (gen_random_uuid on the user tables) which this userland
# pgserver build doesn't bundle. The S197 base tables are standalone; only the
# S196 tool_annotations migration needs content_tier + tier_satisfies +
# schema_version. This recreates exactly those three from schema.sql verbatim.
PREREQ_SQL = """
CREATE TYPE content_tier AS ENUM ('free','study_notes','extras','complete_study','everything');
CREATE OR REPLACE FUNCTION tier_satisfies(user_tier content_tier, required_tier content_tier)
RETURNS BOOLEAN LANGUAGE SQL IMMUTABLE AS $$
  SELECT (CASE user_tier WHEN 'free' THEN 0 WHEN 'study_notes' THEN 1 WHEN 'extras' THEN 2
            WHEN 'complete_study' THEN 3 WHEN 'everything' THEN 4 END)
       >=(CASE required_tier WHEN 'free' THEN 0 WHEN 'study_notes' THEN 1 WHEN 'extras' THEN 2
            WHEN 'complete_study' THEN 3 WHEN 'everything' THEN 4 END);
$$;
CREATE TABLE schema_version (
    id INT PRIMARY KEY DEFAULT 1 CHECK (id = 1),
    version TEXT NOT NULL, landed_at TIMESTAMPTZ NOT NULL DEFAULT now(), notes TEXT);
INSERT INTO schema_version (version, notes) VALUES ('1.0.0-phase4-session173', 'prereq stand-in');
"""

APPLY = [
    MIG / "session196_tool_annotations.sql",
    MIG / "session196_tool_annotations_seed_v1.sql",
    MIG / "session197_vincents_load.sql",
    MIG / "session197_naves_load.sql",
    MIG / "session197_tsk_load.sql",
    MIG / "session197_maps_load.sql",
    MIG / "session197_nikkudot_load.sql",
    MIG / "session197_vincents_annotation_rekey.sql",
]

CHECKS = {
    "vincents_entries": 4501,
    "naves_topical": 5000,
    "tsk_pairs": 340000,
    "maps_places": 1300,
    "nikkudot_verses": 19000,
}


def main() -> int:
    tmp = tempfile.mkdtemp(prefix="pg197_")
    db = pgserver.get_server(tmp)
    uri = db.get_uri()
    try:
        subprocess.run([PSQL, uri, "-v", "ON_ERROR_STOP=1", "-q", "-c", PREREQ_SQL], check=True)
        print("applied prereq (content_tier + tier_satisfies + schema_version)")
        for p in APPLY:
            if not p.exists():
                print(f"MISSING {p}", file=sys.stderr); return 1
            run_file(uri, p)
            print(f"applied {p.name}")
        ok = True
        for tbl, floor in CHECKS.items():
            n = int(scalar(uri, f"SELECT COUNT(*) FROM {tbl};"))
            flag = "OK" if n >= floor else "LOW"
            if n < floor:
                ok = False
            print(f"  {tbl:18} = {n:>7}  (>= {floor})  {flag}")
        bad = int(scalar(uri,
            "SELECT COUNT(*) FROM tool_annotations WHERE tool='vincents' AND entry_key LIKE '%:%';"))
        vlive = int(scalar(uri,
            "SELECT COUNT(*) FROM tool_annotations WHERE tool='vincents' AND is_punch_list_only=FALSE;"))
        print(f"  vincents annotation lemma-keys remaining = {bad} (want 0); live verse rows = {vlive}")
        sample = scalar(uri,
            "SELECT string_agg(entry_key, ', ') FROM (SELECT entry_key FROM tool_annotations WHERE tool='vincents' ORDER BY entry_key) s;")
        print("  vincents annotation keys:", sample)
        nyhwh = int(scalar(uri, "SELECT COUNT(*) FROM nikkudot_verses WHERE has_tetragrammaton;"))
        print(f"  nikkudot verses w/ tetragrammaton = {nyhwh}")
        # cross-join sanity: a vincents verse that also has an annotation
        joined = int(scalar(uri,
            "SELECT COUNT(DISTINCT v.verse_key) FROM vincents_entries v "
            "JOIN tool_annotations a ON a.tool='vincents' AND a.entry_key=v.verse_key;"))
        print(f"  vincents verses with a live framework band = {joined}")
        if bad != 0:
            ok = False
        print("RESULT:", "PASS" if ok else "FAIL")
        return 0 if ok else 1
    finally:
        try:
            db.cleanup()
        except Exception:
            pass


if __name__ == "__main__":
    raise SystemExit(main())
