#!/usr/bin/env python3
"""
_session64_jubilees_byte_equal_proof.py
---------------------------------------
Runs the S64 Jubilees sync (in-memory dry-run) against the current .txt,
re-parses the result via parse_jubilees, and diffs the resulting JSON
against the live parsed/jubilees.json.

Reports:
  * structural counts match (chapters)
  * per-chapter byte-equal status (verses + commentary)
  * first N divergences with context

Does NOT modify the on-disk .txt or live JSON. Pair with
_session64_sync_jubilees_to_txt.py.

Clone of S63's enoch byte-equal proof — same shape, swapped parser
and sync module, swapped chapter count assertion (108 → 50).
"""

from __future__ import annotations

import importlib.util
import json
import os
import sys
import difflib
from dataclasses import asdict


def _resolve_app() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    sandbox = "/sessions/practical-intelligent-wright/mnt/App"
    if os.path.isdir(sandbox):
        return sandbox
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ.setdefault("APP_ROOT", APP)

# Load the sync module (sibling file)
SYNC_PATH = os.path.join(APP, "restoration-pipeline", "_session64_sync_jubilees_to_txt.py")
spec = importlib.util.spec_from_file_location("s64_sync", SYNC_PATH)
sync_mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sync_mod)

from parse_published_editions import parse_jubilees  # noqa: E402


def main():
    # Step 1: read current .txt
    with open(sync_mod.TXT, encoding="utf-8") as f:
        original = f.read()

    # Step 2: run sync (dry-run, returns updated text)
    updated, stats = sync_mod.main(dry_run=True)

    # Step 3: parse updated text in-memory
    parsed = parse_jubilees(updated)
    parsed_dict = asdict(parsed)

    # Step 4: load live JSON
    with open(sync_mod.LIVE, encoding="utf-8") as f:
        live = json.load(f)

    # Step 5: serialize both to canonical JSON, compare byte-equal
    parsed_str = json.dumps(parsed_dict, ensure_ascii=False, indent=2)
    live_str = json.dumps(live, ensure_ascii=False, indent=2)

    if parsed_str == live_str:
        print("=== BYTE-EQUAL PROOF: PASS ===")
        print(f"parsed JSON ({len(parsed_str)} bytes) == live JSON ({len(live_str)} bytes)")
        return 0

    print("=== BYTE-EQUAL PROOF: FAIL ===")
    print(f"parsed JSON: {len(parsed_str)} bytes")
    print(f"live   JSON: {len(live_str)} bytes")
    print(f"delta:       {len(parsed_str) - len(live_str):+d} bytes")
    print()

    # Per-chapter diff
    p_chs = parsed_dict["books"][0]["chapters"]
    l_chs = live["books"][0]["chapters"]
    print(f"chapter counts: parsed={len(p_chs)} live={len(l_chs)}")

    mismatches = []
    for pc, lc in zip(p_chs, l_chs):
        if pc.get("number") != lc.get("number"):
            mismatches.append((pc.get("number"), "chapter number mismatch", lc.get("number")))
            continue
        ch = pc["number"]
        if pc.get("title") != lc.get("title"):
            mismatches.append((ch, "title", (pc.get("title"), lc.get("title"))))
        for pv, lv in zip(pc.get("verses", []), lc.get("verses", [])):
            if pv.get("text") != lv.get("text"):
                mismatches.append((ch, f"v{pv.get('number')}", (pv.get("text"), lv.get("text"))))
        if len(pc.get("verses", [])) != len(lc.get("verses", [])):
            mismatches.append((ch, "verse count", (len(pc.get("verses", [])), len(lc.get("verses", [])))))
        if pc.get("commentary") != lc.get("commentary"):
            mismatches.append((ch, "commentary", (pc.get("commentary"), lc.get("commentary"))))

    print(f"total mismatches: {len(mismatches)}")
    bad_chs = sorted({m[0] for m in mismatches if isinstance(m[0], int)})
    print(f"chapters still diverging: {len(bad_chs)}  {bad_chs[:30]}{'...' if len(bad_chs)>30 else ''}")
    print()
    print("=== first 12 mismatches with context ===")
    for ch, what, val in mismatches[:12]:
        print(f"  ch{ch} {what}:")
        if (
            isinstance(val, tuple)
            and len(val) == 2
            and isinstance(val[0], str)
            and isinstance(val[1], str)
        ):
            a, b = val
            sm = difflib.SequenceMatcher(None, a, b)
            for tag, i1, i2, j1, j2 in sm.get_opcodes():
                if tag == "equal":
                    continue
                ctx_a = a[max(0, i1 - 60):i2 + 60]
                ctx_b = b[max(0, j1 - 60):j2 + 60]
                print(f"    PARSED-{tag}: ...{ctx_a!r}...")
                print(f"    LIVE___-{tag}: ...{ctx_b!r}...")
                print(f"    A[{i1}:{i2}]={a[i1:i2]!r}  ->  B[{j1}:{j2}]={b[j1:j2]!r}")
                break
        else:
            print(f"    {val}")
        print()

    return 1


if __name__ == "__main__":
    sys.exit(main())
