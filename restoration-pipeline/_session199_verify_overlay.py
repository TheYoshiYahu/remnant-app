#!/usr/bin/env python3
"""S199 — load-verify the Maps overlay rewrite into a real userland Postgres.

Boots a pgserver instance, applies the minimal prereq (content_tier +
tier_satisfies + schema_version) + the S196 tool_annotations table + the S196
seed, then the S199 maps/dispersion-overlay rewrite, and asserts the live row
carries the worldwide scattering/gathering language and the quoted prophets.
No sudo; pgserver ships a userland binary. Mirrors _session197_verify_load.py.
"""
from __future__ import annotations
import sys, tempfile, pathlib, subprocess
import pgserver

PSQL = str(pathlib.Path(pgserver.__file__).resolve().parent / "pginstall" / "bin" / "psql")
REPO = pathlib.Path(__file__).resolve().parent.parent
MIG = REPO / "data-schema" / "migrations"

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
    MIG / "session199_maps_overlay_rewrite.sql",
]

# Phrases that MUST be present in the rewritten overlay (worldwide reading +
# the quoted prophets). Their absence means the wrong/old copy is loaded.
MUST_CONTAIN = [
    "ends of the earth",
    "four corners",
    "islands of the sea",
    "Deuteronomy 28:64",
    "Amos 9:9",
    "Hosea 1:10",
    "Isaiah 11:11",
    "Isaiah 11:12",
    "Jeremiah 31:8",
    "Jeremiah 31:10",
    "Ezekiel 37:21",
    "Yashar''el (Israel)",
    "second recovery",
]
# Phrases that must NOT survive (the old ANE-confined framing).
MUST_NOT_CONTAIN = [
    "back from them",
]


def psql_c(uri, sql):
    subprocess.run([PSQL, uri, "-v", "ON_ERROR_STOP=1", "-q", "-c", sql], check=True)


def run_file(uri, path):
    subprocess.run([PSQL, uri, "-v", "ON_ERROR_STOP=1", "-q", "-f", str(path)], check=True)


def scalar(uri, sql):
    return subprocess.check_output([PSQL, uri, "-tAc", sql]).decode()


def main() -> int:
    tmp = tempfile.mkdtemp(prefix="pg199_")
    db = pgserver.get_server(tmp)
    uri = db.get_uri()
    try:
        psql_c(uri, PREREQ_SQL)
        print("applied prereq (content_tier + tier_satisfies + schema_version)")
        for p in APPLY:
            if not p.exists():
                print(f"MISSING {p}", file=sys.stderr); return 1
            run_file(uri, p)
            print(f"applied {p.name}")

        ok = True
        n_live = int(scalar(uri,
            "SELECT COUNT(*) FROM tool_annotations "
            "WHERE tool='maps' AND entry_key='dispersion-overlay' AND is_punch_list_only=FALSE;").strip())
        print(f"  maps/dispersion-overlay live rows = {n_live} (want 1)")
        if n_live != 1:
            ok = False

        body = scalar(uri,
            "SELECT conflict_summary || ' ' || annotation_md FROM tool_annotations "
            "WHERE tool='maps' AND entry_key='dispersion-overlay';")
        for phrase in MUST_CONTAIN:
            present = phrase.replace("''", "'") in body
            print(f"  contains {phrase!r:32} {'OK' if present else 'MISSING'}")
            if not present:
                ok = False
        for phrase in MUST_NOT_CONTAIN:
            gone = phrase not in body
            print(f"  absent   {phrase!r:32} {'OK' if gone else 'STILL PRESENT'}")
            if not gone:
                ok = False

        # red lines preserved
        rl = scalar(uri,
            "SELECT array_to_string(red_lines_cited, ',') FROM tool_annotations "
            "WHERE tool='maps' AND entry_key='dispersion-overlay';").strip()
        print(f"  red_lines_cited = [{rl}]")

        print("RESULT:", "PASS" if ok else "FAIL")
        return 0 if ok else 1
    finally:
        try:
            db.cleanup()
        except Exception:
            pass


if __name__ == "__main__":
    raise SystemExit(main())
