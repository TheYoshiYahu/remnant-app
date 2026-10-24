"""S463d — Re-grade every live card touching the Book of Jasher by the words its note quotes
(S463c regrade.py adapted to the single-book edition `jasher`; addresses are 'jasher|c:v').
An italic span counts as a Jasher quote only if
 (a) it is labelled 'Jasher c:v — *…*', or
 (b) it is cited Come-and-See style '*…* (Jasher c:v)', or
 (c) it is the LEAD italic of the note, no other-book label precedes it, it is not the other end's text,
     and the card has a Jasher end.
EVERY Jasher quotation in a note is graded (S463c lesson: the first-only grade missed 8 second quotations).
Output: regrade.json (per card: every quote with its verdict, flags, addresses, live text).
"""
import json, re, unicodedata, difflib, collections, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
LIVE_PATH = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE.parent / 'jasher-cards-live.json'
live = json.load(open(LIVE_PATH)); L = live['live']
LABEL = re.compile(r"\b(?:Jasher|Yashar) (\d+):(\d+)\s*[—–-]\s*\*([^*]+)\*", re.I)
TRAIL = re.compile(r"\*([^*]+)\*\s*\((?:Jasher|Yashar) (\d+):(\d+)(?:\s*[–-]\s*(\d+))?\)", re.I)
SLUG_CITE = re.compile(r"\b(jasher|genesis|exodus|leviticus|numbers|deuteronomy|joshua|judges|ruth|[12]-samuel|[12]-kings|[12]-chronicles|ezra|nehemiah|esther|job|psalms?|proverbs|ecclesiastes|song-of-solomon|isaiah|jeremiah|lamentations|ezekiel|daniel|hosea|joel|amos|obadiah|jonah|micah|nahum|habakkuk|zephaniah|haggai|zechariah|malachi|matthew|mark|luke|john|acts|romans|[12]-corinthians|galatians|ephesians|philippians|colossians|[12]-thessalonians|[12]-timothy|titus|philemon|hebrews|james|[12]-peter|[123]-john|jude|revelation|jubilees|1-enoch|enoch|adam-eve-conflict|apocalypse-of-abraham|[123]-maccabees|tobit|judith|ecclesiasticus|the-wisdom-of-solomon|[12]-esdras|baruch-with-the-letter-of-jeremiah) \d+:\d+")
OTHER_LABEL = re.compile(r"^\s*([A-Z0-9][\w' .()\-]{1,40}?)\s\d+(?::\d+)?(?:\s*[–-]\s*\d+(?::\d+)?)?\s*[—–-]\s*\*")
DEGRADED = re.compile(r'wisdom-stream|the framework reads|the framework|Red Line #|apparatus|\bsubstance\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{2,3}\b|Yoshi|voice skill|teaching corpus|verbal-anchor', re.I)
HYPHEN_CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
NUMERIC_CHAIN = re.compile(r"^(?:(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fifteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|threescore|fourscore|and|by|year|years|old|day|days|cubit|cubits|fold)-?)+$", re.I)
HEBREW_BOOK = re.compile(r"\b(Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Yehoshua \d|Shoftim|Tehillim|Mishlei|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Yochanan \d|Hitgalut|Ivrim|Galatim)\b")

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
def ch_of(a): return a.split('|')[1].split(':')[0]
def span_text(a, n=4):
    i = IDX[a]; parts = []; c = ch_of(a)
    for j in range(i, min(i+n, len(ADDRS))):
        b = ADDRS[j]
        if j > i and ch_of(b) != c: break
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
    ps = pieces(q); i = IDX[a]; acc = ''; k = 0; c = ch_of(a)
    for j in range(i, min(i+n, len(ADDRS))):
        if j > i and ch_of(ADDRS[j]) != c: break
        acc = (acc+' '+NL[ADDRS[j]]).strip(); k += 1
        if all(acc.find(p) >= 0 for p in ps): return k
    return k
def start_addr(q, near=None):
    """prefer a hit in the same chapter as `near`; else anywhere"""
    hits = [a for a in ADDRS if contains_from(a, q)]
    if near and near in IDX:
        same = [a for a in hits if ch_of(a) == ch_of(near)]
        if same: return min(same, key=lambda a: abs(IDX[a]-IDX[near]))
    return hits[0] if hits else None
def grade_at(q, a):
    qn = norm(q); qw = qn.split()
    if a not in NL or not qw: return 0.0
    if qn in span_text(a): return 1.0
    return win_ratio(qw, span_text(a).split())
def best_match(q):
    qn = norm(q); qw = qn.split()
    if len(qw) < 4: return None, 0.0
    best = (None, 0.0); qs = set(qw)
    for a in ADDRS:
        tw = span_text(a, 2).split()
        if len(qs & set(tw))/len(qs) < 0.5: continue
        r = win_ratio(qw, tw)
        if r > best[1]: best = (a, r)
    return best

def jasher_quotes(text):
    found = [(m.start(), m.group(3), f"jasher|{m.group(1)}:{m.group(2)}", None) for m in LABEL.finditer(text)]
    found += [(m.start(), m.group(1), f"jasher|{m.group(2)}:{m.group(3)}", m.group(4)) for m in TRAIL.finditer(text)]
    return [(q, a, rng) for _, q, a, rng in sorted(found)]

def grade_quote(q, at):
    """-> (verdict, proposed_addr, ratio, k_verses_covered)"""
    if not norm(q): return 'EMPTY', None, 0.0, 0
    sa = start_addr(q, near=at)
    if sa is not None:
        k = covered(sa, q)
        if at in IDX and IDX[sa] <= IDX[at] < IDX[sa]+k: return 'STAND', at, 1.0, k
        return 'RE_ANCHOR', sa, 1.0, k
    r_here = grade_at(q, at) if at in NL else 0.0
    ma, mr = best_match(q)
    if ma and mr >= 0.6 and mr > r_here + 0.1: return 'RE_ANCHOR_REWORDED', ma, mr, 1
    if r_here >= 0.6: return 'REWORDED', at, r_here, 1
    return 'NOT_FOUND', ma, mr, 0

def is_jasher(ed): return ed == 'jasher'

out = []
for c in live['cards']:
    note = c['note'] or ''
    sj, tj = is_jasher(c['s_ed']), is_jasher(c['t_ed'])
    if not (sj or tj):
        out.append(dict(id=c['id'], verdict='MENTION_ONLY', note=note, src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}", tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}")); continue
    side = 'S' if sj else 'T'           # the 2 Jasher↔Jasher cards grade from the source end
    addr = f"jasher|{c['s_ch']}:{c['s_vn']}" if side == 'S' else f"jasher|{c['t_ch']}:{c['t_vn']}"
    other_text = norm(c['t_text'] if side == 'S' else c['s_text'])
    def is_other(q):
        qn = norm(q)
        if not qn: return False
        if qn in other_text: return True
        return difflib.SequenceMatcher(None, qn.split(), other_text.split(), autojunk=False).ratio() >= 0.8
    quotes = jasher_quotes(note)
    om = OTHER_LABEL.match(note)
    other_labelled_first = bool(om) and not re.match(r'(?i)jasher|yashar', om.group(1).strip())
    short_unmatched = []
    if not quotes and not other_labelled_first:
        for m in re.finditer(r"\*([^*]+)\*", note):
            q = m.group(1)
            if is_other(q): continue
            if len(norm(q).split()) < 6: short_unmatched.append(q); continue
            quotes.append((q, None, None)); break
    prose = re.sub(r"\*[^*]+\*", " ", note)          # markers and chains are judged in the PROSE only, never inside a quotation
    chains = [h for h in HYPHEN_CHAIN.findall(prose) if not SLUG_CITE.match(h + ' 1:1') and not NUMERIC_CHAIN.match(h)]
    flags = dict(degraded=bool(DEGRADED.search(prose)), hyphen_chain=bool(chains), chains=chains,
                 slug_cite=bool(SLUG_CITE.search(note)), hebrew_book=bool(HEBREW_BOOK.search(note)))
    base = dict(id=c['id'], side=side, addr=addr, src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}", tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}",
                other_ed=(c['t_ed'] if side == 'S' else c['s_ed']), note=note, short_unmatched=short_unmatched, **flags)
    if not quotes:
        out.append(dict(base, verdict='NO_JASHER_QUOTE', quotes=[])); continue
    graded = []
    for q, labelled, rng in quotes:
        at = labelled or addr
        v, prop, ratio, k = grade_quote(q, at)
        graded.append(dict(quote=q, labelled=labelled, cited_range=rng, at=at, verdict=v, proposed=prop, ratio=round(ratio, 2), k=k,
                           live_here=L.get(at), live_proposed=L.get(prop) if prop else None))
    worst_order = ['NOT_FOUND', 'RE_ANCHOR_REWORDED', 'RE_ANCHOR', 'REWORDED', 'STAND', 'EMPTY']
    worst = min(graded, key=lambda g: worst_order.index(g['verdict']))['verdict']
    out.append(dict(base, verdict=worst, first_verdict=graded[0]['verdict'], quotes=graded))
json.dump(out, open(HERE / 'regrade.json', 'w'), ensure_ascii=False, indent=1)
anch = [o for o in out if o['verdict'] != 'MENTION_ONLY']
print('cards in dump', len(out), '| anchored in Jasher', len(anch), '| mention-only (other books; out of scope)', len(out)-len(anch))
print('card verdict (worst quote):', collections.Counter(o['verdict'] for o in anch))
print('quotations graded:', collections.Counter(g['verdict'] for o in anch for g in o.get('quotes', [])), '| notes with 2+ Jasher quotes:', sum(1 for o in anch if len(o.get('quotes', [])) > 1))
print('degraded-marker notes:', sum(1 for o in anch if o['degraded']), '| hyphen-chain notes:', sum(1 for o in anch if o['hyphen_chain']),
      '| either:', sum(1 for o in anch if o['degraded'] or o['hyphen_chain']))
print('slug-citation notes:', sum(1 for o in anch if o['slug_cite']), '| Hebrew book-name notes:', sum(1 for o in anch if o['hebrew_book']))
print('by other edition:', collections.Counter(o['other_ed'] for o in anch))
