#!/usr/bin/env python3
"""Verify each extras cross-ref tuple's quoted note actually matches the parsed
target verse text. Flags tuples whose note shares little/no wording with the
real target verse (i.e. quoted from memory / wrong versification)."""
import json, re, glob, os, sys

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')
EDFILES = {'canon':'canon','enoch':'enoch','jubilees':'jubilees','jasher':'jasher',
 'apocrypha':'apocrypha','apocrypha-charles-vol1':'apocrypha-charles-vol1',
 'pseudepigrapha':'pseudepigrapha-charles-vol2','adam-eve-conflict':'adam-eve-conflict',
 'apocalypse-of-abraham':'apocalypse-of-abraham','ascension-isaiah':'ascension-isaiah',
 'sonnini-acts-29':'sonnini-acts-29'}
VERSE = {}
for es, fn in EDFILES.items():
    d = json.load(open(os.path.join(BASE, fn + '.json')))
    for b in d['books']:
        bid = b.get('book_id') or b.get('slug')
        for c in b['chapters']:
            cn = c.get('number') or c.get('chapter_number')
            for v in c.get('verses', []):
                VERSE[(es, bid, cn, v['number'])] = v['text']

def norm(s):
    s = s.lower()
    s = re.sub(r"\(([^)]*)\)", " ", s)        # drop parentheticals like (god)
    s = re.sub(r"[^a-z0-9 ]", " ", s)
    return re.sub(r"\s+", " ", s).strip()

def shingles(s, n=4):
    t = norm(s).split()
    return set(" ".join(t[i:i+n]) for i in range(len(t)-n+1)) if len(t) >= n else {norm(s)}

def tokenize_strings_and_ints(block):
    """Yield ordered tokens (str literals and ints) from a VALUES region line-tuple."""
    out = []
    i, n = 0, len(block)
    while i < n:
        c = block[i]
        if c == "'":
            i += 1; buf = []
            while i < n:
                if block[i] == "'":
                    if i+1 < n and block[i+1] == "'":
                        buf.append("'"); i += 2; continue
                    i += 1; break
                buf.append(block[i]); i += 1
            out.append(('s', ''.join(buf)))
        elif c.isdigit():
            j = i
            while j < n and block[j].isdigit(): j += 1
            out.append(('i', int(block[i:j]))); i = j
        else:
            i += 1
    return out

flagged = []
ok = 0
total = 0
for f in sorted(glob.glob(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'minion_*.sql'))):
    sql = open(f, encoding='utf-8', errors='replace').read()
    for hm in re.finditer(r"\(VALUES(.*?)\)\s*(?:INSERT\b|AS\s+\w+\s*\()", sql, re.DOTALL|re.IGNORECASE):
        region = hm.group(1)
        # each tuple starts with ('  ... split on lines beginning optional spaces + ('
        # Walk tuples: find '(' ... ')' top-level groups containing a note.
        depth = 0; start = None
        for idx, ch in enumerate(region):
            if ch == '(' and depth == 0:
                depth = 1; start = idx+1
            elif ch == '(':
                depth += 1
            elif ch == ')':
                depth -= 1
                if depth == 0 and start is not None:
                    tup = region[start:idx]
                    toks = tokenize_strings_and_ints(tup)
                    strs = [v for k,v in toks if k=='s']
                    ints = [v for k,v in toks if k=='i']
                    # expect strs: src_ed, src_slug, tgt_ed, tgt_slug, note ; ints: src_ch,src_v,tgt_ch,tgt_v
                    if len(strs) >= 5 and len(ints) >= 4:
                        tgt_ed, tgt_slug = strs[2], strs[3]
                        note = strs[-1]
                        tgt_ch, tgt_v = ints[2], ints[3]
                        actual = VERSE.get((tgt_ed, tgt_slug, tgt_ch, tgt_v))
                        if actual and len(note) > 30:
                            total += 1
                            inter = shingles(actual) & shingles(note)
                            if not inter:
                                flagged.append((os.path.basename(f), tgt_ed, tgt_slug, tgt_ch, tgt_v,
                                                actual[:90], note[:90]))
                            else:
                                ok += 1
                    start = None

print(f"checked {total} extras tuples | faithful {ok} | FLAGGED {len(flagged)}\n")
by_ed = {}
for f, te, tb, tc, tv, act, note in flagged:
    by_ed.setdefault(te, 0); by_ed[te]+=1
print("flagged by edition:", by_ed, "\n")
for f, te, tb, tc, tv, act, note in flagged:
    print(f"[{f}] {te}/{tb} {tc}:{tv}")
    print(f"    ACTUAL: {act}")
    print(f"    NOTE  : {note}")
