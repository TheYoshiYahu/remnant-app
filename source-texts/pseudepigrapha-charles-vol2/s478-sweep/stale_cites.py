"""S478 — stale citations of the OLD adam-eve / 4 Maccabees numbering inside card notes, member notes and thread
summaries (the S477 merge renumbered verses 1..n per chapter; cards were re-pointed by content, prose was not).
Rule: a citation 'c:v' to one of the two books is
  - IMPOSSIBLE  if v > the live chapter's last verse (certainly old numbering) → mapped by s477_map old_to_new;
  - OWN_OLD     if it equals the card's OLD address per s477_cards_map and old != new (the note names its own
                 anchor by the old number) → the new address;
  - AMBIGUOUS   otherwise (v exists in both numberings) → resolved by content where the note quotes words
                (quote found at live address X → cite X), else listed for a reader.
Output: stale_cites.json + a printed summary."""
import json, re, collections, unicodedata
from pathlib import Path
HERE = Path(__file__).resolve().parent
live = json.load(open(HERE/'in'/'pseud-cards-live.json')); L = live['live']
m477 = json.load(open(HERE.parent/'s477-text-lane'/'s477_map.json'))
cmap = json.load(open(HERE.parent/'s477-text-lane'/'s477_cards_map.json'))
card_old = {c['xid']: c for c in cmap['cards']}
anchor_old = {a['thread_id']: a for a in cmap['anchors']}
BOOKS = {'4-maccabees': ['4 Maccabees', 'IV Maccabees', 'Fourth Maccabees'],
         'adam-eve': ['Adam and Eve', 'Adam & Eve', 'Apocalypse of Moses', 'Vita Adae', 'Vita Adae et Evae', 'Life of Adam and Eve', 'Books of Adam and Eve', 'Book of Adam and Eve']}
# exclude '1 Adam and Eve' / '2 Adam and Eve' (the Conflict, other edition)
NAME = {b: re.compile(r"(?<![12] )(?<![12]\s)\b(" + '|'.join(re.escape(n) for n in ns) + r")(?:\s*\([^)]*\))?\s+(\d+):(\d+)(?:\s*[–-]\s*(\d+)(?::(\d+))?)?", re.I) for b, ns in BOOKS.items()}
maxv = collections.defaultdict(int)
for a in L:
    ed, bk, cv = a.split('|'); c, v = cv.split(':')
    if bk in BOOKS: maxv[(bk, int(c))] = max(maxv[(bk, int(c))], int(v))
def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\((?:[^()]{1,40})\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower()
    return re.sub(r"\s+", " ", re.sub(r"[^a-z0-9 ]+", " ", s)).strip()
NL = {a: norm(t) for a, t in L.items()}
ORDER = sorted(NL)   # dump order = book order
IDX = {a: i for i, a in enumerate(ORDER)}
def pieces(q):
    q = re.sub(r"\[[^\]]{1,3}\]", "", q)      # editorial [d] / [s]
    return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
def find_quote(bk, q):
    """address where the quotation (with … gaps) begins; the pieces must sit in order within a 3-verse span of one chapter"""
    ps = pieces(q)
    if not ps or len(' '.join(ps).split()) < 4: return None
    hits = []
    for a in ORDER:
        if a.split('|')[1] != bk: continue
        i = IDX[a]; ch = a.split('|')[2].split(':')[0]; acc = ''; pos = 0; ok = True
        span = [x for x in ORDER[i:i+3] if x.split('|')[1] == bk and x.split('|')[2].split(':')[0] == ch]
        text = ' '.join(NL[x] for x in span)
        for p in ps:
            j = text.find(p, pos)
            if j < 0: ok = False; break
            pos = j + len(p)
        if ok and text.find(ps[0]) < len(NL[a]) + 1: hits.append(a)
    return hits[0].split('|')[2] if len(hits) == 1 else (hits[0].split('|')[2] if hits else None)
def adjacent_quote(text, mm):
    """the italic quotation bound to this citation: 'Name c:v — *q*' (label) or '*q* (Name c:v)' (trailing)"""
    after = text[mm.end():mm.end()+6]; before = text[max(0, mm.start()-3):mm.start()]
    m2 = re.match(r"\s*[—–-]\s*\*([^*]+)\*", text[mm.end():])
    if m2: return m2.group(1)
    if before.rstrip().endswith('('):
        m3 = re.search(r"\*([^*]+)\*\s*\($", text[:mm.start()])
        if m3: return m3.group(1)
    return None
def classify(bk, c, v, own_old, own_new, text, q):
    key = f"{c}:{v}"
    if q:
        at = find_quote(bk, q)
        if at and at != key: return 'CONTENT_OFF', at
        if at == key: return 'CONTENT_OK', key
        if at is None and len(norm(q).split()) >= 4: return 'QUOTE_NOT_FOUND', m477[bk]['old_to_new'].get(key)
    if v > maxv.get((bk, c), 0) or maxv.get((bk, c), 0) == 0:
        return 'IMPOSSIBLE', m477[bk]['old_to_new'].get(key)
    if own_old and key == own_old and own_old != own_new:
        return 'OWN_OLD', own_new
    return 'AMBIGUOUS', m477[bk]['old_to_new'].get(key)
out = []
def scan(kind, ident, text, own_old=None, own_new=None, extra=None):
    for bk, rx in NAME.items():
        for mm in rx.finditer(text or ''):
            c, v = int(mm.group(2)), int(mm.group(3))
            q = adjacent_quote(text, mm); verdict, new = classify(bk, c, v, own_old, own_new, text, q)
            out.append(dict(kind=kind, id=ident, book=bk, cite=mm.group(0), c=c, v=v, v_end=mm.group(4), verdict=verdict, proposed=new, quote=(q[:60] if q else None), **(extra or {})))
for c in live['cards']:
    co = card_old.get(c['id'])
    own_old = co['old'] if co else None; own_new = co['new'] if co else None
    scan('card', c['id'], c['note'], own_old, own_new, dict(src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}", tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}"))
for mem in live['members']:
    co = card_old.get(mem['xref_id'])
    scan('member', f"{mem['thread_id']}/{mem['xref_id']}", mem.get('member_note'), co['old'] if co else None, co['new'] if co else None)
for t in live['threads']:
    ao = anchor_old.get(t['id'])
    scan('thread', t['id'], t.get('summary_md') or '', None, None, dict(slug=t.get('slug'), anchor_old=(f"{ao['old_start']}–{ao['old_end']}" if ao else None), anchor_new=(f"{ao['new_start']}–{ao['new_end']}" if ao else None)))
json.dump(out, open(HERE/'stale_cites.json', 'w'), ensure_ascii=False, indent=1)
cnt = collections.Counter((o['book'], o['kind'], o['verdict']) for o in out)
for k in sorted(cnt): print(k, cnt[k])
print('total citations found', len(out), '| distinct cards/members/threads', len({(o['kind'], o['id']) for o in out}))
