"""S463c — Re-grade every live card touching the Apocrypha / 3 Maccabees by the words its note quotes
(S463b regrade.py adapted to a 15-book edition; addresses are 'book-slug|c:v').
An italic span counts as an Apocrypha quote only if
 (a) it is labelled '<Book> c:v — *…*' with one of the Apocrypha/3 Macc book names, or
 (b) it is the LEAD italic of the note, no other-book label precedes it, and the card's Apocrypha end is
     the one the lead quote is about (target 'T' or source 'S').
Output: regrade.json (per card: lead quote, verdict, current addr, proposed addr, live text both).
"""
import json, re, unicodedata, difflib, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent          # …/apocrypha-kjv-ebible/s463c-sweep
UP = HERE.parent                                # …/apocrypha-kjv-ebible (the S463c read-back lives here)
live = json.load(open(UP / 'apocrypha-cards-live.json')); L = live['live']
SLUGS = {b['slug'] for b in live['books']}
# how notes name these books → live slug
ALIAS = {
 '1 esdras':'1-esdras','3 ezra':'1-esdras','1 esdras (3 ezra)':'1-esdras',
 '2 esdras':'2-esdras','4 ezra':'2-esdras','2 esdras (4 ezra)':'2-esdras',
 'tobit':'tobit','judith':'judith',
 'the rest of esther':'the-rest-of-esther','rest of esther':'the-rest-of-esther','additions to esther':'the-rest-of-esther','esther (additions)':'the-rest-of-esther',
 'the wisdom of solomon':'the-wisdom-of-solomon','wisdom of solomon':'the-wisdom-of-solomon','wisdom':'the-wisdom-of-solomon',
 'ecclesiasticus':'ecclesiasticus','sirach':'ecclesiasticus','ecclesiasticus (sirach)':'ecclesiasticus','sirach (ecclesiasticus)':'ecclesiasticus',
 'baruch':'baruch-with-the-letter-of-jeremiah','baruch with the letter of jeremiah':'baruch-with-the-letter-of-jeremiah',
 'epistle of jeremy':'baruch-with-the-letter-of-jeremiah','letter of jeremiah':'baruch-with-the-letter-of-jeremiah',
 'the song of the three holy children':'the-song-of-the-three-holy-children','song of the three holy children':'the-song-of-the-three-holy-children','song of the three':'the-song-of-the-three-holy-children',
 'the history of susanna':'the-history-of-susanna','history of susanna':'the-history-of-susanna','susanna':'the-history-of-susanna',
 'bel and the dragon':'bel-and-the-dragon',
 'the prayer of manasseh':'the-prayer-of-manasseh','prayer of manasseh':'the-prayer-of-manasseh','prayer of manasses':'the-prayer-of-manasseh',
 '1 maccabees':'1-maccabees','2 maccabees':'2-maccabees','3 maccabees':'3-maccabees',
}
NAME_RE = '|'.join(sorted((re.escape(k) for k in ALIAS), key=len, reverse=True))
LABEL = re.compile(rf"(?<!\d )(?<!\d)\b({NAME_RE}) (\d+):(\d+)\s*[—–-]\s*\*([^*]+)\*", re.I)
# Come-and-See shape: *quote* (Book c:v) — citation AFTER the italics (how S463a/b rebuilt notes and the thread summaries cite)
TRAIL = re.compile(rf"\*([^*]+)\*\s*\((?!\d )({NAME_RE}) (\d+):(\d+)(?:\s*[–-]\s*\d+)?\)", re.I)
SLUG_CITE = re.compile(r"\b(1-esdras|2-esdras|the-rest-of-esther|the-wisdom-of-solomon|baruch-with-the-letter-of-jeremiah|the-song-of-the-three-holy-children|the-history-of-susanna|bel-and-the-dragon|the-prayer-of-manasseh|[123]-maccabees|ecclesiasticus|tobit|judith) \d+:\d+")
def apoc_quotes(text):
    """(quote, 'slug|c:v') for every labelled or trailing-cited Apocrypha quotation, in note order"""
    found = [(m.start(), m.group(4), f"{ALIAS[m.group(1).lower()]}|{m.group(2)}:{m.group(3)}") for m in LABEL.finditer(text)]
    found += [(m.start(), m.group(1), f"{ALIAS[m.group(2).lower()]}|{m.group(3)}:{m.group(4)}") for m in TRAIL.finditer(text)]
    return [(q, a) for _, q, a in sorted(found)]
OTHER_LABEL = re.compile(r"^\s*([A-Z0-9][\w' .()\-]{1,40}?)\s\d+:\d+\s*[—–-]\s*\*")
DEGRADED = re.compile(r'wisdom-stream|the framework reads|Red Line #|apparatus|\bsubstance\b|FRAMEWORK-MAJOR|\blocked\b|S\d{2,3}\b|Yoshi', re.I)
HYPHEN_CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")   # the-devil-as-source-of-death (S463b: markers missed 19 of these)

def norm(s):
    s = unicodedata.normalize('NFKD', s or '')
    s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s)
    s = re.sub(r"[\[\]‘’'“”\"]", "", s)
    s = s.lower()
    s = re.sub(r"[^a-z0-9 ]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()

NL = {a: norm(t) for a, t in L.items()}
ADDRS = list(NL.keys()); IDX = {a: i for i, a in enumerate(ADDRS)}
def bookch(a):
    b, cv = a.split('|'); return b, cv.split(':')[0]
BY_BOOK = collections.defaultdict(list)
for a in ADDRS: BY_BOOK[a.split('|')[0]].append(a)

def span_text(a, n=4):
    i = IDX[a]; parts = []; bc = bookch(a)
    for j in range(i, min(i+n, len(ADDRS))):
        b = ADDRS[j]
        if j > i and bookch(b) != bc: break
        parts.append(NL[b])
    return ' '.join(parts)
def win_ratio(qw, tw):
    if not tw: return 0.0
    n = len(qw); best = 0.0; step = max(1, n//4)
    for i in range(0, max(1, len(tw)-n+1), step):
        r = difflib.SequenceMatcher(None, qw, tw[i:i+n+2], autojunk=False).ratio()
        if r > best: best = r
    return best
def pieces(q): return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
def contains_from(a, q, n=6):
    t = span_text(a, n); pos = 0
    for p in pieces(q):
        i = t.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True
def covered(a, q, n=6):
    ps = pieces(q); i = IDX[a]; acc = ''; k = 0; bc = bookch(a)
    for j in range(i, min(i+n, len(ADDRS))):
        if j > i and bookch(ADDRS[j]) != bc: break
        acc = (acc+' '+NL[ADDRS[j]]).strip(); k += 1
        if all(acc.find(p) >= 0 for p in ps): return k
    return k
def start_addr(q, books):
    hits = [a for b in books for a in BY_BOOK[b] if contains_from(a, q)]
    return hits[-1] if hits else None
def grade_at(q, a):
    qn = norm(q); qw = qn.split()
    if a not in NL or not qw: return 0.0
    if qn in span_text(a): return 1.0
    return win_ratio(qw, span_text(a).split())
def best_match(q, books):
    qn = norm(q); qw = qn.split()
    if len(qw) < 4: return None, 0.0
    best = (None, 0.0); qs = set(qw)
    for b in books:
        for a in BY_BOOK[b]:
            tw = span_text(a, 2).split()
            if len(qs & set(tw))/len(qs) < 0.5: continue
            r = win_ratio(qw, tw)
            if r > best[1]: best = (a, r)
    return best

def in_scope(ed, book): return ed == 'apocrypha' or (ed == 'pseudepigrapha' and book == '3-maccabees')

out = []
for c in live['cards']:
    note = c['note'] or ''
    side = 'T' if in_scope(c['t_ed'], c['t_book']) else ('S' if in_scope(c['s_ed'], c['s_book']) else None)
    book = c['t_book'] if side == 'T' else (c['s_book'] if side == 'S' else None)
    addr = f"{book}|{c['t_ch']}:{c['t_vn']}" if side == 'T' else (f"{book}|{c['s_ch']}:{c['s_vn']}" if side == 'S' else None)
    other_text = norm(c['s_text'] if side == 'T' else c['t_text']) if side else ''
    def is_other(q):
        qn = norm(q)
        if not qn or not other_text: return False
        if qn in other_text: return True
        return difflib.SequenceMatcher(None, qn.split(), other_text.split(), autojunk=False).ratio() >= 0.8
    quotes = apoc_quotes(note)
    short_unmatched = []
    om = OTHER_LABEL.match(note)
    other_labelled_first = bool(om) and om.group(1).strip().lower() not in ALIAS
    if not quotes and side and not other_labelled_first:
        for m in re.finditer(r"\*([^*]+)\*", note):
            q = m.group(1)
            if is_other(q): continue
            if len(norm(q).split()) < 6: short_unmatched.append(q); continue
            quotes.append((q, None)); break
    slug_cite = bool(SLUG_CITE.search(note))
    chains = [h for h in HYPHEN_CHAIN.findall(note) if not SLUG_CITE.match(h + ' 1:1')]
    flags = dict(degraded=bool(DEGRADED.search(note)), hyphen_chain=bool(chains), slug_cite=slug_cite)
    base = dict(id=c['id'], side=side, book=book, addr=addr, src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}", tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}",
                note=note, short_unmatched=short_unmatched, **flags)
    if not quotes:
        out.append(dict(base, verdict='NO_APOC_QUOTE' if side else 'MENTION_ONLY')); continue
    q, labelled = quotes[0]
    at = labelled or addr
    books_first = [at.split('|')[0]] if at else []
    books_rest = [b for b in BY_BOOK if b not in books_first]
    sa = start_addr(q, books_first) or start_addr(q, books_rest) if norm(q) else None
    if sa is not None:
        k = covered(sa, q)
        if at in IDX and IDX[sa] <= IDX[at] < IDX[sa]+k: v, prop, ratio = 'STAND', at, 1.0
        else: v, prop, ratio = 'RE_ANCHOR', sa, 1.0
    else:
        r_here = grade_at(q, at) if at in NL else 0.0
        ma, mr = best_match(q, books_first)
        if not (ma and mr >= 0.6): ma, mr = best_match(q, books_rest)
        if ma and mr >= 0.6 and mr > r_here + 0.1: v, prop, ratio = 'RE_ANCHOR_REWORDED', ma, mr
        elif r_here >= 0.6: v, prop, ratio = 'REWORDED', at, r_here
        else: v, prop, ratio = 'NOT_FOUND', (ma if ma else None), (mr if ma else 0)
    out.append(dict(base, labelled=labelled, quote=q, verdict=v, proposed=prop, ratio=round(ratio, 2),
                    live_here=L.get(at), live_proposed=L.get(prop) if prop else None, extra_quotes=quotes[1:]))
json.dump(out, open(HERE / 'regrade.json', 'w'), ensure_ascii=False, indent=1)
print(collections.Counter(o['verdict'] for o in out))
print('degraded-marker notes:', sum(1 for o in out if o['degraded']), '| hyphen-chain notes:', sum(1 for o in out if o['hyphen_chain']),
      '| either:', sum(1 for o in out if o['degraded'] or o['hyphen_chain']))
print('slug-citation notes (book slug printed as the citation):', sum(1 for o in out if o['slug_cite']))
print('by verdict, either flag:', collections.Counter(o['verdict'] for o in out if o['degraded'] or o['hyphen_chain']))
print('per book (anchored cards):', collections.Counter(o['book'] for o in out if o['book']).most_common())
