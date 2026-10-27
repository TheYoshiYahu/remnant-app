"""S463e — Re-grade every live card touching the pseudepigrapha editions by the words its note quotes
(S463d regrade.py generalized to many books across three editions; addresses are 'ed|book|c:v').

For every card anchored in one of the books, EVERY quotation is graded:
  (1) extra-book italics — labelled 'Name c:v — *…*', trailing '*…* (Name c:v)', or the lead italic when no
      other-book label precedes it and the card has an extra-book end;
  (2) short quoted phrases in the prose ("…" / '…' / *…*, 3+ words) that are not the other end's text — read
      against the live extra-book verse span at the card's address (these cards are mostly canon-first glosses
      whose extra-book words sit in quotation marks, not italics);
  (3) the CANON lead quotation ('Book c:v — *…*') against source-texts/parsed/canon.json.
Also: degraded markers and hyphen-chains judged in the PROSE only (outside italics), slug citations, Hebrew book
names, and — new for this edition — a Testaments XII chapter-range check: 'Testament of <name> c:v' must have c
inside that testament's live chapter range (the S212 cards were written against the pre-Track-B numbering).
Output: regrade.json (per card: every quote with its verdict, flags, addresses, live text).
"""
import json, re, unicodedata, difflib, collections, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
LIVE_PATH = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE / 'in' / 'pseud-cards-live.json'
CANON_PATH = HERE / 'in' / 'canon.json'
if not CANON_PATH.exists(): CANON_PATH = HERE.parent.parent / 'parsed' / 'canon.json'   # on the Mac: source-texts/parsed/canon.json
live = json.load(open(LIVE_PATH)); L = live['live']
EDS = {'pseudepigrapha', 'adam-eve-conflict', 'apocalypse-of-abraham', 'ascension-isaiah'}
HELD = {'adam-eve', '4-maccabees', '3-maccabees'}      # text lane first (S476) / closed S463c

# ---- book name aliases (English, as the notes cite them) → 'ed|book'
BOOK_OF = {}
def alias(names, key):
    for n in names: BOOK_OF[n.lower()] = key
alias(['2 Enoch', 'II Enoch', 'Secrets of Enoch', 'The Book of the Secrets of Enoch', '2-enoch'], 'pseudepigrapha|2-enoch')
alias(['2 Baruch', 'II Baruch', '2-baruch'], 'pseudepigrapha|2-baruch')
alias(['3 Baruch', 'III Baruch', '3-baruch'], 'pseudepigrapha|3-baruch')
alias(['4 Maccabees', 'IV Maccabees', '4-maccabees'], 'pseudepigrapha|4-maccabees')
alias(['3 Maccabees', '3-maccabees'], 'pseudepigrapha|3-maccabees')
alias(['Adam & Eve', 'Adam and Eve', 'adam-eve', 'Apocalypse of Moses', 'Vita Adae', 'Life of Adam and Eve', 'Books of Adam and Eve'], 'pseudepigrapha|adam-eve')
alias(['1 Adam and Eve', '1 Adam & Eve', '1-adam-eve', '1 Adam-Eve', 'First Book of Adam and Eve', 'First Adam and Eve'], 'adam-eve-conflict|1-adam-eve')
alias(['2 Adam and Eve', '2 Adam & Eve', '2-adam-eve', '2 Adam-Eve', 'Second Book of Adam and Eve', 'Second Adam and Eve'], 'adam-eve-conflict|2-adam-eve')
alias(['Apocalypse of Abraham', 'Apoc. Abraham', 'Apoc. of Abraham', 'apocalypse-of-abraham'], 'apocalypse-of-abraham|apocalypse-of-abraham')
alias(['Ascension of Isaiah', 'Asc. Isaiah', 'Asc. of Isaiah', 'ascension-isaiah', 'Martyrdom of Isaiah'], 'ascension-isaiah|ascension-isaiah')
TESTS = ['Reuben', 'Simeon', 'Levi', 'Judah', 'Yahudah', 'Issachar', 'Zebulun', 'Dan', 'Naphtali', 'Gad', 'Asher', 'Joseph', 'Benjamin']
alias(['Testaments of the Twelve Patriarchs', 'Testaments of the XII Patriarchs', 'Testaments of the Twelve', 'Testaments XII', 'Testaments of the XII',
       'T. XII', 'T.XII', 'testaments-xii'] + [f'Testament of {t}' for t in TESTS] + [f'T. {t}' for t in TESTS], 'pseudepigrapha|testaments-xii')
NAME_RE = '|'.join(sorted((re.escape(n) for n in BOOK_OF), key=len, reverse=True))
LABEL = re.compile(rf"\b({NAME_RE})(?:\s*\([^)]*\))?\s+(\d+):(\d+)(?:\s*[–-]\s*(\d+))?\s*[—–-]\s*\*([^*]+)\*", re.I)
TRAIL = re.compile(rf"\*([^*]+)\*\s*\(({NAME_RE})(?:\s*\([^)]*\))?\s+(\d+):(\d+)(?:\s*[–-]\s*(\d+))?\)", re.I)
CITE_ANY = re.compile(rf"\b({NAME_RE})(?:\s*\([^)]*\))?\s+(\d+):(\d+)", re.I)

# Testaments XII live chapter ranges per testament (from the live chapter titles is not in the dump; derive from counts)
T_RANGES = {}
_start = 1
for t, n in zip(['Reuben', 'Simeon', 'Levi', 'Judah', 'Issachar', 'Zebulun', 'Dan', 'Naphtali', 'Gad', 'Asher', 'Joseph', 'Benjamin'],
                [7, 9, 19, 26, 7, 10, 7, 9, 8, 8, 20, 12]):
    T_RANGES[t] = (_start, _start + n - 1); _start += n
T_RANGES['Yahudah'] = T_RANGES['Judah']
assert _start - 1 == 142

CANON_NAMES = {}
canon = json.load(open(CANON_PATH)); CL = {}
for b in canon['books']:
    CANON_NAMES[b['book_title'].lower()] = b['book_id']
    for c in b['chapters']:
        for v in c['verses']: CL[f"{b['book_id']}|{c['number']}:{v['number']}"] = v['text']
CANON_ALIAS = {'psalm': 'psalms', 'matt': 'matthew', 'song of songs': 'song-of-solomon', 'canticles': 'song-of-solomon', 'rev': 'revelation',
               'gen': 'genesis', 'ex': 'exodus', 'exod': 'exodus', 'lev': 'leviticus', 'num': 'numbers', 'deut': 'deuteronomy', 'isa': 'isaiah',
               'jer': 'jeremiah', 'ezek': 'ezekiel', 'dan': 'daniel', 'zech': 'zechariah', 'mal': 'malachi', 'rom': 'romans', 'heb': 'hebrews',
               'eph': 'ephesians', 'gal': 'galatians', 'col': 'colossians', 'phil': 'philippians', '1 cor': '1-corinthians', '2 cor': '2-corinthians',
               '1 thess': '1-thessalonians', '2 thess': '2-thessalonians', '1 pet': '1-peter', '2 pet': '2-peter', '1 tim': '1-timothy', '2 tim': '2-timothy',
               '1 sam': '1-samuel', '2 sam': '2-samuel', '1 kgs': '1-kings', '2 kgs': '2-kings', '1 chr': '1-chronicles', '2 chr': '2-chronicles', 'prov': 'proverbs',
               'eccl': 'ecclesiastes', 'hos': 'hosea', 'mic': 'micah', 'hab': 'habakkuk', 'zeph': 'zephaniah', 'hag': 'haggai', 'neh': 'nehemiah', 'josh': 'joshua', 'judg': 'judges'}
CANON_NAMES.update(CANON_ALIAS)
CANON_RE = '|'.join(sorted((re.escape(n) for n in CANON_NAMES), key=len, reverse=True))
CANON_LEAD = re.compile(rf"^\s*({CANON_RE})\.?\s+(\d+):(\d+)(?:\s*[–-]\s*(\d+)(?::(\d+))?)?\s*[—–-]\s*\*([^*]+)\*", re.I)

SLUG_CITE = re.compile(r"\b(jasher|genesis|exodus|leviticus|numbers|deuteronomy|joshua|judges|ruth|[12]-samuel|[12]-kings|[12]-chronicles|ezra|nehemiah|esther|job|psalms?|proverbs|ecclesiastes|song-of-solomon|isaiah|jeremiah|lamentations|ezekiel|daniel|hosea|joel|amos|obadiah|jonah|micah|nahum|habakkuk|zephaniah|haggai|zechariah|malachi|matthew|mark|luke|john|acts|romans|[12]-corinthians|galatians|ephesians|philippians|colossians|[12]-thessalonians|[12]-timothy|titus|philemon|hebrews|james|[12]-peter|[123]-john|jude|revelation|jubilees|1-enoch|2-enoch|enoch|[12]-adam-eve|adam-eve|adam-eve-conflict|apocalypse-of-abraham|ascension-isaiah|testaments-xii|[23]-baruch|[1234]-maccabees|tobit|judith|ecclesiasticus|the-wisdom-of-solomon|[12]-esdras|baruch-with-the-letter-of-jeremiah) \d+:\d+")
OTHER_LABEL = re.compile(r"^\s*([A-Z0-9][\w' .&()\-]{1,45}?)\s\d+(?::\d+)?(?:\s*[–-]\s*\d+(?::\d+)?)?\s*[—–-]\s*\*")
DEGRADED = re.compile(r'wisdom-stream|the framework reads|the framework|Red Line #|apparatus|\bsubstance\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{2,3}\b|Yoshi|voice skill|teaching corpus|verbal-anchor|-register\b|the-[a-z]+-[a-z]+-(?:substance|register)', re.I)
HYPHEN_CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
NUMERIC_CHAIN = re.compile(r"^(?:(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fifteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|threescore|fourscore|and|by|year|years|old|day|days|cubit|cubits|fold)-?)+$", re.I)
HEBREW_BOOK = re.compile(r"\b(Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Yehoshua \d|Shoftim|Tehillim|Mishlei|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Yochanan \d|Hitgalut|Ivrim|Galatim)\b")

def norm(s):
    s = unicodedata.normalize('NFKD', s or '')
    s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\((?:[^()]{1,40})\)", " ", s)   # short name-glosses like (God), (Lord), (Israel) — never a long parenthesis that opens a verse
    s = re.sub(r"[\[\]‘’'“”\"]", "", s)
    s = s.lower()
    s = re.sub(r"[^a-z0-9 ]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()

NL = {a: norm(t) for a, t in L.items()}
ADDRS = list(NL.keys()); IDX = {a: i for i, a in enumerate(ADDRS)}
BOOK_ADDRS = collections.defaultdict(list)
for a in ADDRS: BOOK_ADDRS[a.rsplit('|', 1)[0]].append(a)
def bk_of(a): return a.rsplit('|', 1)[0]
def ch_of(a): return a.rsplit('|', 1)[1].split(':')[0]
def span_text(a, n=4):
    i = IDX[a]; parts = []; c = ch_of(a); b = bk_of(a)
    for j in range(i, min(i+n, len(ADDRS))):
        x = ADDRS[j]
        if j > i and (ch_of(x) != c or bk_of(x) != b): break
        parts.append(NL[x])
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
    ps = pieces(q); i = IDX[a]; acc = ''; k = 0; c = ch_of(a); b = bk_of(a)
    for j in range(i, min(i+n, len(ADDRS))):
        if j > i and (ch_of(ADDRS[j]) != c or bk_of(ADDRS[j]) != b): break
        acc = (acc+' '+NL[ADDRS[j]]).strip(); k += 1
        if all(acc.find(p) >= 0 for p in ps): return k
    return k
def start_addr(q, book, near=None):
    hits = [a for a in BOOK_ADDRS[book] if contains_from(a, q)]
    if near and near in IDX:
        same = [a for a in hits if ch_of(a) == ch_of(near)]
        if same: return min(same, key=lambda a: abs(IDX[a]-IDX[near]))
    return hits[0] if hits else None
def grade_at(q, a):
    qn = norm(q); qw = qn.split()
    if a not in NL or not qw: return 0.0
    if qn in span_text(a): return 1.0
    return win_ratio(qw, span_text(a).split())
def best_match(q, book):
    qn = norm(q); qw = qn.split()
    if len(qw) < 4: return None, 0.0
    best = (None, 0.0); qs = set(qw)
    for a in BOOK_ADDRS[book]:
        tw = span_text(a, 2).split()
        if len(qs & set(tw))/len(qs) < 0.5: continue
        r = win_ratio(qw, tw)
        if r > best[1]: best = (a, r)
    return best

def key_of(name): return BOOK_OF[name.lower()]
def extra_quotes(text):
    found = [(m.start(), m.group(5), f"{key_of(m.group(1))}|{m.group(2)}:{m.group(3)}", m.group(4), m.group(1)) for m in LABEL.finditer(text)]
    found += [(m.start(), m.group(1), f"{key_of(m.group(2))}|{m.group(3)}:{m.group(4)}", m.group(5), m.group(2)) for m in TRAIL.finditer(text)]
    return [(q, a, rng, nm) for _, q, a, rng, nm in sorted(found)]

def grade_quote(q, at, book):
    if not norm(q): return 'EMPTY', None, 0.0, 0
    sa = start_addr(q, book, near=at)
    if sa is not None:
        k = covered(sa, q)
        if at in IDX and IDX[sa] <= IDX[at] < IDX[sa]+k: return 'STAND', at, 1.0, k
        return 'RE_ANCHOR', sa, 1.0, k
    r_here = grade_at(q, at) if at in NL else 0.0
    ma, mr = best_match(q, book)
    if ma and mr >= 0.6 and mr > r_here + 0.1: return 'RE_ANCHOR_REWORDED', ma, mr, 1
    if r_here >= 0.6: return 'REWORDED', at, r_here, 1
    return 'NOT_FOUND', ma, mr, 0

def canon_lead(note):
    m = CANON_LEAD.match(note)
    if not m: return None
    slug = CANON_NAMES[m.group(1).lower()]; ch, vn = m.group(2), m.group(3)
    a = f"{slug}|{ch}:{vn}"; q = m.group(6)
    if a not in CL: return dict(cite=f"{m.group(1)} {ch}:{vn}", verdict='NO_SUCH_VERSE', quote=q)
    span = ' '.join(norm(CL.get(f"{slug}|{ch}:{int(vn)+i}", '')) for i in range(4))
    qn = norm(q); pos = 0; ok = True
    for p in pieces(q):
        i = span.find(p, pos)
        if i < 0: ok = False; break
        pos = i + len(p)
    if ok: return dict(cite=f"{m.group(1)} {ch}:{vn}", verdict='STAND', quote=q)
    r = win_ratio(qn.split(), span.split())
    return dict(cite=f"{m.group(1)} {ch}:{vn}", verdict='REWORDED' if r >= 0.6 else 'OFF', ratio=round(r, 2), quote=q, live=CL[a])

def phrase_quotes(note, other_text):
    """short quoted phrases in the prose (not italics): "…", '…', “…”"""
    res = []
    prose = re.sub(r"\*[^*]+\*", " ", note)
    for m in re.finditer(r"[\"“]([^\"”]{6,}?)[\"”]|(?<![A-Za-z])'([^']{6,}?)'(?![A-Za-z])", prose):
        q = m.group(1) or m.group(2)
        if len(norm(q).split()) < 3: continue
        qn = norm(q)
        if qn in other_text: continue
        res.append(q)
    return res

def t_range_check(note):
    """'Testament of <name> c:v' — c must sit inside that testament's live chapter range"""
    bad = []
    for m in re.finditer(r"\bTestament of (Reuben|Simeon|Levi|Judah|Yahudah|Issachar|Zebulun|Dan|Naphtali|Gad|Asher|Joseph|Benjamin)(?:\s*\([^)]*\))?\s+(\d+):(\d+)", note):
        lo, hi = T_RANGES[m.group(1)]; c = int(m.group(2))
        if not lo <= c <= hi: bad.append(dict(cite=m.group(0), range=f"{lo}–{hi}"))
    return bad

# ---- CARDS ----
out = []
for c in live['cards']:
    note = c['note'] or ''
    sj, tj = c['s_ed'] in EDS, c['t_ed'] in EDS
    if not (sj or tj):
        out.append(dict(id=c['id'], verdict='MENTION_ONLY', note=note, src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}", tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}")); continue
    side = 'S' if sj else 'T'
    book = f"{c['s_ed']}|{c['s_book']}" if side == 'S' else f"{c['t_ed']}|{c['t_book']}"
    addr = f"{book}|{c['s_ch']}:{c['s_vn']}" if side == 'S' else f"{book}|{c['t_ch']}:{c['t_vn']}"
    other_text = norm(c['t_text'] if side == 'S' else c['s_text'])
    other_book = f"{c['t_ed']}|{c['t_book']}" if side == 'S' else f"{c['s_ed']}|{c['s_book']}"
    def is_other(q):
        qn = norm(q)
        if not qn: return False
        if qn in other_text: return True
        return difflib.SequenceMatcher(None, qn.split(), other_text.split(), autojunk=False).ratio() >= 0.8
    quotes = extra_quotes(note)
    om = OTHER_LABEL.match(note)
    other_labelled_first = bool(om) and (om.group(1).strip().lower() not in BOOK_OF)
    short_unmatched = []
    if not quotes and not other_labelled_first:
        for m in re.finditer(r"\*([^*]+)\*", note):
            q = m.group(1)
            if is_other(q): continue
            if len(norm(q).split()) < 6: short_unmatched.append(q); continue
            quotes.append((q, None, None, None)); break
    prose = re.sub(r"\*[^*]+\*", " ", note)
    chains = [h for h in HYPHEN_CHAIN.findall(prose) if not SLUG_CITE.match(h + ' 1:1') and not NUMERIC_CHAIN.match(h)]
    flags = dict(degraded=bool(DEGRADED.search(prose)), hyphen_chain=bool(chains), chains=chains,
                 slug_cite=bool(SLUG_CITE.search(note)), hebrew_book=bool(HEBREW_BOOK.search(note)),
                 t_range_bad=t_range_check(note))
    lead = canon_lead(note) if other_book.startswith('canon|') else None
    # phrase quotes read against the live extra verse (chapter-local span from the card's address)
    phr = []
    for q in phrase_quotes(note, other_text):
        ok = addr in NL and contains_from(addr, q, n=3)
        if ok: phr.append(dict(quote=q, verdict='STAND')); continue
        sa = start_addr(q, book, near=addr)
        if sa: phr.append(dict(quote=q, verdict='ELSEWHERE', found_at=sa, live_found=L.get(sa)))
        else:
            r = grade_at(q, addr) if addr in NL else 0.0
            phr.append(dict(quote=q, verdict='REWORDED' if r >= 0.6 else 'NOT_FOUND', ratio=round(r, 2)))
    base = dict(id=c['id'], side=side, book=book, held=(book.split('|')[1] in HELD), addr=addr, src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}", tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}",
                other_ed=(c['t_ed'] if side == 'S' else c['s_ed']), other_book=other_book, note=note, live_here=L.get(addr), short_unmatched=short_unmatched,
                canon_lead=lead, phrases=phr, **flags)
    if not quotes:
        out.append(dict(base, verdict='NO_EXTRA_QUOTE', quotes=[])); continue
    graded = []
    for q, labelled, rng, nm in quotes:
        at = labelled or addr
        qbook = bk_of(at)
        v, prop, ratio, k = grade_quote(q, at, qbook)
        graded.append(dict(quote=q, labelled=labelled, label_name=nm, cited_range=rng, at=at, verdict=v, proposed=prop, ratio=round(ratio, 2), k=k,
                           live_here=L.get(at), live_proposed=L.get(prop) if prop else None))
    worst_order = ['NOT_FOUND', 'RE_ANCHOR_REWORDED', 'RE_ANCHOR', 'REWORDED', 'STAND', 'EMPTY']
    worst = min(graded, key=lambda g: worst_order.index(g['verdict']))['verdict']
    out.append(dict(base, verdict=worst, first_verdict=graded[0]['verdict'], quotes=graded))
json.dump(out, open(Path(sys.argv[2]) if len(sys.argv) > 2 else HERE / 'regrade.json', 'w'), ensure_ascii=False, indent=1)

anch = [o for o in out if o['verdict'] != 'MENTION_ONLY']
print('cards in dump', len(out), '| anchored in these editions', len(anch), '| mention-only', len(out)-len(anch))
def row(label, items):
    q = collections.Counter(g['verdict'] for o in items for g in o.get('quotes', []))
    ph = collections.Counter(p['verdict'] for o in items for p in o['phrases'])
    cl = collections.Counter((o['canon_lead'] or {}).get('verdict', 'none') for o in items)
    print(f"\n[{label}] cards {len(items)}  held={items[0]['held'] if items else '-'}")
    print('  card verdict (worst italic extra quote):', dict(collections.Counter(o['verdict'] for o in items)))
    print('  italic extra quotations graded:', dict(q), '| notes with 2+:', sum(1 for o in items if len(o.get('quotes', [])) > 1))
    print('  prose phrase quotes vs live extra verse:', dict(ph))
    print('  canon lead quote vs canon.json:', dict(cl))
    print('  degraded-marker notes:', sum(1 for o in items if o['degraded']), '| hyphen-chain:', sum(1 for o in items if o['hyphen_chain']),
          '| either:', sum(1 for o in items if o['degraded'] or o['hyphen_chain']), '| slug cites:', sum(1 for o in items if o['slug_cite']),
          '| Hebrew book names:', sum(1 for o in items if o['hebrew_book']), '| T.XII chapter out of range:', sum(1 for o in items if o['t_range_bad']))
for book in sorted({o['book'] for o in anch}):
    row(book, [o for o in anch if o['book'] == book])
row('ALL (incl. held)', anch)
