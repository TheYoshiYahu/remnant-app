#!/usr/bin/env python3
"""Dump a chapter's verses from any parsed edition.
Usage:
  python3 dump_canon.py <book_id> <chapter>                # canon
  python3 dump_canon.py <book_id> <chapter> <edition_file> # e.g. enoch, apocrypha, jubilees, jasher,
                                                           #      pseudepigrapha-charles-vol2, sonnini-acts-29,
                                                           #      apocalypse-of-abraham, ascension-isaiah,
                                                           #      adam-eve-conflict, apocrypha-charles-vol1
"""
import json, sys, os
BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')
book_id = sys.argv[1]
chap = int(sys.argv[2])
edfile = sys.argv[3] if len(sys.argv) > 3 else 'canon'
d = json.load(open(os.path.join(BASE, edfile + '.json')))
print(f"# edition_slug={d.get('edition_id')}  book_id={book_id}  chapter={chap}")
for b in d['books']:
    if b.get('book_id') == book_id or b.get('slug') == book_id:
        for c in b['chapters']:
            if (c.get('number') or c.get('chapter_number')) == chap:
                for v in c.get('verses', []):
                    print(f"{v['number']}\t{v['text']}")
                sys.exit(0)
print("NOT FOUND", file=sys.stderr); sys.exit(1)
