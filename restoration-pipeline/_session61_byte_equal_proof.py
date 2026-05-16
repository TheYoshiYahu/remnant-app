#!/usr/bin/env python3
"""
_session61_byte_equal_proof.py
------------------------------
Runs the S61 sync (in-memory) against the current Jasher .txt, writes
the result to a sidecar path, re-parses via parse_jasher, and diffs
the resulting JSON against live parsed/jasher.json.

Reports:
  * structural counts match (chapters, verses)
  * per-chapter byte-equal status (verses + commentary)
  * first N divergences with context

Does NOT modify the on-disk .txt or live JSON.
"""

from __future__ import annotations

import json
import os
import sys
from dataclasses import asdict

APP = "/sessions/modest-nice-darwin/mnt/Desktop/App"
if not os.path.isdir(APP):
    APP = os.path.expanduser("~/Desktop/App")
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
sys.path.insert(0, "/sessions/modest-nice-darwin/mnt/outputs")
os.environ.setdefault("APP_ROOT", APP)

# Import sync module
import importlib.util
SYNC_PATH = "/sessions/modest-nice-darwin/mnt/outputs/_session61_sync_jasher_to_txt.py"
if not os.path.exists(SYNC_PATH):
    SYNC_PATH = os.path.expanduser("~/Library/Application Support/Claude/local-agent-mode-sessions/61443ce6-d3d5-4973-81a2-3a7524837756/30ff66bc-04c3-4461-9108-d05f72019368/local_bd8d2827-4ad5-4255-9793-90adab1540ff/outputs/_session61_sync_jasher_to_txt.py")
spec = importlib.util.spec_from_file_location("sync_mod", SYNC_PATH)
sync_mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sync_mod)

from parse_published_editions import parse_jasher  # noqa: E402


def main():
    # Step 1: read current .txt
    with open(sync_mod.TXT, encoding="utf-8") as f:
        original = f.read()

    # Step 2: run sync (dry-run, returns updated text)
    updated, stats = sync_mod.main(dry_run=True)

    # Step 3: parse updated text in-memory
    parsed = parse_jasher(updated)
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
    print(f"delta: {len(parsed_str) - len(live_str)} bytes")
    print()

    # Per-chapter diff
    p_chs = parsed_dict["books"][0]["chapters"]
    l_chs = live["books"][0]["chapters"]
    print(f"chapter counts: parsed={len(p_chs)} live={len(l_chs)}")

    mismatches = []
    for pc, lc in zip(p_chs, l_chs):
        if pc["number"] != lc["number"]:
            mismatches.append((pc["number"], "chapter number mismatch", lc["number"]))
            continue
        ch = pc["number"]
        # title
        if pc.get("title") != lc.get("title"):
            mismatches.append((ch, "title", (pc.get("title"), lc.get("title"))))
        # verses
        for pv, lv in zip(pc["verses"], lc["verses"]):
            if pv["text"] != lv["text"]:
                mismatches.append((ch, f"v{pv['number']}", (pv["text"], lv["text"])))
        if len(pc["verses"]) != len(lc["verses"]):
            mismatches.append((ch, "verse count", (len(pc["verses"]), len(lc["verses"]))))
        # commentary
        if pc["commentary"] != lc["commentary"]:
            mismatches.append((ch, "commentary", (pc["commentary"], lc["commentary"])))

    print(f"total mismatches: {len(mismatches)}")
    print()
    print("=== first 12 mismatches with context ===")
    import difflib
    for ch, what, val in mismatches[:12]:
        print(f"  ch{ch} {what}:")
        if isinstance(val, tuple) and len(val) == 2 and isinstance(val[0], str) and isinstance(val[1], str):
            a, b = val
            # Find first diff position
            sm = difflib.SequenceMatcher(None, a, b)
            opcodes = sm.get_opcodes()
            for tag, i1, i2, j1, j2 in opcodes:
                if tag == "equal":
                    continue
                ctx_a = a[max(0, i1-30):i2+30]
                ctx_b = b[max(0, j1-30):j2+30]
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
