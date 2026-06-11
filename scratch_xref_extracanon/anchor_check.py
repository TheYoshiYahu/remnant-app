#!/usr/bin/env python3
"""Verify every thread's anchor verses (anchor_start_v / anchor_end_v) actually EXIST in the
parsed source chapter. A thread anchored on a non-existent verse silently fails to insert
(its INSERT...SELECT matches no row) — resolve_check only validates member src/tgt, NOT the
thread anchors, so this is the complementary gate. Run it on every pack BEFORE folding/applying.

Usage: anchor_check.py <edition_file> <book> <json1> [json2 ...]
  e.g. anchor_check.py jubilees jubilees json_jubilees_*.json
       anchor_check.py enoch 1-enoch json_1enoch_*.json
"""
import json, sys, os
BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')

def present_verses(edfile, book, chap):
    d = json.load(open(os.path.join(BASE, edfile + '.json')))
    for b in d['books']:
        if b.get('book_id') == book or b.get('slug') == book:
            for c in b['chapters']:
                if (c.get('number') or c.get('chapter_number')) == chap:
                    return set(v['number'] for v in c.get('verses', []))
    return set()

edfile, book = sys.argv[1], sys.argv[2]
bad = 0
for f in sys.argv[3:]:
    d = json.load(open(f))
    if not d.get('threads'):
        continue
    ch = d['chapter']
    pres = present_verses(edfile, book, ch)
    for t in d['threads']:
        for key in ('anchor_start_v', 'anchor_end_v'):
            v = t.get(key)
            if v not in pres:
                print(f"BAD ANCHOR  {os.path.basename(f)}  {t['slug']}  {key}={v} NOT in ch{ch} (present: {sorted(pres)[:20]}...)")
                bad += 1
print(f"\n=== BAD THREAD ANCHORS: {bad} ===")
sys.exit(1 if bad else 0)
