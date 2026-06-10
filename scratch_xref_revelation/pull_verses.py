#!/usr/bin/env python3
"""Pull exact verse text for a list of (book, chapter, verse[, edition]) refs.
Usage: python3 pull_verses.py < refs.txt
Each line: edition book chapter verse   (edition 'canon' default if 3 cols)
Prints: edition book chapter:verse \t <text>  (or MISSING)."""
import json, os, sys
BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')
cache = {}
def load(ed):
    if ed not in cache:
        cache[ed] = json.load(open(os.path.join(BASE, ed + '.json')))
    return cache[ed]
def get(ed, book, chap, verse):
    d = load(ed)
    for b in d['books']:
        if b.get('book_id') == book or b.get('slug') == book:
            for c in b['chapters']:
                if (c.get('number') or c.get('chapter_number')) == chap:
                    for v in c.get('verses', []):
                        if v['number'] == verse:
                            return v['text']
    return None
for line in sys.stdin:
    parts = line.split()
    if not parts: continue
    if len(parts) == 3:
        ed, book, chap, verse = 'canon', parts[0], int(parts[1]), int(parts[2])
    else:
        ed, book, chap, verse = parts[0], parts[1], int(parts[2]), int(parts[3])
    t = get(ed, book, chap, verse)
    print(f"{ed} {book} {chap}:{verse}\t{t if t else 'MISSING'}")
