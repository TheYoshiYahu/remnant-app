#!/usr/bin/env python3
"""S475 — Extra-book people (1 Enoch, 2 Enoch, Jubilees, Jasher), checked against the text only.

A name in an extra book links to a canon person only when exactly ONE person on file with that
name appears in the canon era that book covers (and the name is in the verse). Everything else is
held with a reason. Names that appear only in the extra books are listed as candidates for their
own pages (not built yet). Nothing here is written to the database or the app.
Outputs: people-places/s475_extra_people.json, people-places/S475_EXTRA_PEOPLE_REPORT.md
"""
import json, re, collections
from pathlib import Path
R = Path(__file__).resolve().parent
pp = json.load(open(R/'people-places/people_places.json'))
ch = json.load(open(R/'tts/chapters_all.json'))
ERA = {  # book -> canon books (and max Genesis chapter) the extra book covers
 'enoch/1-enoch': ({'genesis'}, 11), 'pseudepigrapha/2-enoch': ({'genesis'}, 11),
 'jubilees/jubilees': ({'genesis','exodus'}, 99),
 'jasher/jasher': ({'genesis','exodus','leviticus','numbers','deuteronomy','joshua','judges'}, 99)}
def in_era(p, book):
    books, gmax = ERA[book]
    for r in p['refs']:
        b, c, _ = r.split('.')
        if b in books and (b != 'genesis' or int(c) <= gmax) and (b != 'judges' or int(c) <= 2): return True
    return False
idx = collections.defaultdict(list)
for p in pp['people']:
    for n in set(p['names'] + [p['name']]): idx[n].append(p)
placenames = {n for pl in pp['places'] for n in pl.get('names', [pl.get('name')]) if n}
placerefs = collections.Counter()
for pl in pp['places']:
    for n in set(pl.get('names', []) + [pl['name']]): placerefs[n] += len(pl.get('refs', []))
PLACE_WORDS = r"(land|city|cities|country|wilderness|plain|valley|mount|mountain|border|borders|king|kings|gate) of |\b(in|at|from|toward|towards|near) "
TITLE = re.compile(r"\b(the|that|this|a) Son of Adam\b")   # 1 Enoch's title of the Elect One, never Adam the man
names = sorted((n for n in idx if len(n) > 2), key=len, reverse=True)
rx = re.compile(r"\b(" + "|".join(map(re.escape, names)) + r")\b")
links = collections.defaultdict(set); held = collections.defaultdict(list)
slugp = {p['slug']: p for p in pp['people']}
fam = collections.defaultdict(set)   # slug -> names of parents/children/siblings/partners
for l in pp['links']:
    a, b = slugp.get(l['slug']), slugp.get(l['other'])
    if a and b:
        fam[a['slug']].update(b['names'] + [b['name']]); fam[b['slug']].update(a['names'] + [a['name']])
chtext = {(c['book'], c['chapter']): ' '.join(v['raw'] for v in c['verses']) for c in ch if c['book'] in ERA}
booktext = collections.defaultdict(str)
for (b, cn), txt in chtext.items(): booktext[b] += ' ' + txt
def near(book, cn):
    return ' '.join(chtext.get((book, k), '') for k in range(cn - 2, cn + 3))
def settle(era, verse, chapter, n, book=None, cn=None):
    scopes = [('verse', verse), ('chapter', chapter)]
    if chapter and book: scopes.append(('nearby chapters', near(book, cn)))
    if chapter and book in ('enoch/1-enoch', 'pseudepigrapha/2-enoch'): scopes.append(('the book itself', booktext[book]))
    for scope, txt in scopes:
        if scope == 'the book itself':
            cnt = sorted(((sum(len(re.findall(r'\b' + re.escape(f) + r'\b', txt)) for f in fam[p['slug']] - {n}), i) for i, p in enumerate(era)), reverse=True)
            if cnt[0][0] > 0 and (cnt[1][0] == 0 or cnt[0][0] >= 3 * cnt[1][0]): return era[cnt[0][1]], scope
            continue
        hits = [p for p in era if any(re.search(r'\b' + re.escape(f) + r'\b', txt) for f in fam[p['slug']] - {n})]
        if len(hits) == 1: return hits[0], scope
    return None, None
settled = collections.Counter()
# Per-verse corrections, checked by hand against the text.
OVERRIDE = {('jasher.5.1', 'Enoch'): 'enosh-gen-4-26-luk'}   # "Enoch the son of Seth ... 905 years" = Enosh (Gen 5:11)
cand = collections.defaultdict(lambda: collections.Counter())
STOP = set("""And His Him The That This What Who Why When For But Behold Surely You Your Thy One Son Great High
Mount Lord God Elohim Yahuah Yahuah's Yashar Yahudah Elyon Spirits Sabbath Satan Then Now Let Thou Thee How All Because
Who Where Which These Those They There Their Our Wherefore Therefore Blessed Holy Lo O Oh I My We Ye""".split())
for c in ch:
    book = c['book']
    if book not in ERA: continue
    for v in c['verses']:
        ref = f"{book.split('/')[-1]}.{c['chapter']}.{v['n']}"; t = TITLE.sub('the Son of ~', v['raw'])
        seen = set()
        for m in rx.finditer(t):
            n = m.group(1)
            if n in seen: continue
            seen.add(n)
            if (ref, n) in OVERRIDE: links[OVERRIDE[(ref, n)]].add(ref); continue
            era = [p for p in idx[n] if in_era(p, book)]
            isplace = n in placenames
            if isplace and len(era) == 1 and len(era[0]['refs']) >= 3 * placerefs[n] \
               and not re.search(r"(" + PLACE_WORDS + r")" + re.escape(n) + r"\b", t):
                isplace = False   # mostly a person in the canon, and no place wording here
            if len(era) == 1 and not isplace: links[era[0]['slug']].add(ref); continue
            if era:
                p1, scope = settle(era, t, '' if isplace else chtext[(book, c['chapter'])], n, book, c['chapter'])
                if isplace and scope != 'verse': p1 = None
                if isplace and not p1 and len(era) == 1 and re.search(r'\b' + re.escape(n) + r",? (the son of|son of|said|spake|lived|died|begat|knew|took|went|answered|called|rose|sent|heard|saw|blessed|commanded)\b", t):
                    p1, scope = era[0], 'verse'
                if p1: links[p1['slug']].add(ref); settled[scope] += 1; continue
            if True: held[n].append((ref, 'no one by this name in the canon era' if not era else ('also a place or people name; the verse does not settle it' if isplace else f'{len(era)} people by this name in the era')))
        for w in re.findall(r"(?<=[a-z,;:] )([A-Z][a-z']{2,})", t):
            if w not in idx and w not in placenames and w not in STOP and not w.endswith(('ites','ians')):
                cand[w][book.split('/')[-1]] += 1
out = {'links': {k: sorted(v) for k, v in links.items()},
       'held': {k: v for k, v in held.items()},
       'extra_only_candidates': {k: dict(v) for k, v in cand.items()}}
json.dump(out, open(R/'people-places/s475_extra_people.json', 'w'), ensure_ascii=False, indent=1)
slug2 = {p['slug']: p for p in pp['people']}
L = ['# S475 — Extra-book people: report', '',
     f"Linked: {sum(len(v) for v in links.values())} verse occurrences across {len(links)} canon people.",
     f"Held: {sum(len(v) for v in held.values())} occurrences of {len(held)} names.",
     f"Names found only in the extra books (candidates, not built): {len(cand)}.", '',
     '## Most-linked people', '']
for s, v in sorted(links.items(), key=lambda x: -len(x[1]))[:40]: L.append(f"- {slug2[s]['name']} ({s}): {len(v)}")
L += ['', '## Held names (why)', '']
for n, v in sorted(held.items(), key=lambda x: -len(x[1])): L.append(f"- {n}: {len(v)} — {v[0][1]}")
L += ['', '## Extra-only name candidates (by count)', '']
for n, v in sorted(cand.items(), key=lambda x: -sum(x[1].values())): L.append(f"- {n}: " + ", ".join(f"{b} {k}" for b, k in v.items()))
open(R/'people-places/S475_EXTRA_PEOPLE_REPORT.md', 'w').write("\n".join(L) + "\n")
print('settled by family names:', dict(settled)); print("\n".join(L[:5])); print('held top:', [(n, len(v), v[0][1]) for n, v in sorted(held.items(), key=lambda x: -len(x[1]))[:20]]); print('candidates', len(cand))
