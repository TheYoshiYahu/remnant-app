"""S463f — build the fix map from regrade.json / regrade_members.json / regrade_threads.json + the live dump.
Mechanical fixes are APPLIED here (into out/mechanical.json); everything that needs a reader goes to packets/.
Model: scripted (no model).  Output: s463f-sweep-map.md, fix_plan.json, out/mechanical.json, packets/*.json
"""
import json, re, collections, unicodedata, difflib
from pathlib import Path
HERE = Path(__file__).resolve().parent
d = json.load(open(HERE / 'af-cards-live.json')); L = d['live']
R = json.load(open(HERE / 'regrade.json')); M = json.load(open(HERE / 'regrade_members.json')); T = json.load(open(HERE / 'regrade_threads.json'))
canon = json.load(open(HERE / 'in' / 'canon.json')); CL = {}; CTITLE = {}
for b in canon['books']:
    CTITLE[b['book_id']] = b['book_title']
    for c in b['chapters']:
        for v in c['verses']: CL[f"{b['book_id']}|{c['number']}:{v['number']}"] = v['text']
CARD = {c['id']: c for c in d['cards']}
MEMB = {(m['thread_id'], m['xref_id']): m for m in d['members']}
THR = {t['id']: t for t in d['threads']}

def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\((?:[^()]{1,40})\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower(); s = re.sub(r"[^a-z0-9 ]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()
def pieces(q): return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
def contains(text, q):
    t = norm(text); pos = 0
    for p in pieces(q):
        i = t.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True

ENGLISH = {'1-clement': '1 Clement', '2-clement': '2 Clement', 'ignatius-ephesians': 'Ignatius to the Ephesians', 'ignatius-magnesians': 'Ignatius to the Magnesians',
           'ignatius-trallians': 'Ignatius to the Trallians', 'ignatius-romans': 'Ignatius to the Romans', 'ignatius-philadelphians': 'Ignatius to the Philadelphians',
           'ignatius-smyrnaeans': 'Ignatius to the Smyrnaeans', 'ignatius-polycarp': 'Ignatius to Polycarp', 'martyrdom-polycarp': 'Martyrdom of Polycarp',
           'didache': 'Didache', 'barnabas': 'Epistle of Barnabas', 'hermas': 'Hermas', 'sonnini-acts-29': 'Acts 29'}
HEB = {'Bereshit': 'Genesis', 'Shemot': 'Exodus', 'Vayikra': 'Leviticus', 'Bamidbar': 'Numbers', 'Devarim': 'Deuteronomy', 'Tehillim': 'Psalm', 'Mishlei': 'Proverbs',
       'Yeshayahu': 'Isaiah', 'Yirmeyahu': 'Jeremiah', "Yechezk'el": 'Ezekiel', 'Yechezkel': 'Ezekiel', 'Hoshea': 'Hosea', "Yo'el": 'Joel', 'Mattityahu': 'Matthew',
       'Hitgalut': 'Revelation', 'Ivrim': 'Hebrews', 'Galatim': 'Galatians'}
# Hermas thread summaries were written against an older chapter numbering: Sim 8 = live 25, Sim 9 = live 26, Sim 10 = live 27
HERMAS_OLD = {('23', lambda v: v <= 11): '25', ('23', lambda v: v >= 12): '26', ('24', lambda v: True): '27'}
def hermas_recite(text):
    def rep(m):
        c, v = m.group(1), int(m.group(2))
        for (oc, test), nc in HERMAS_OLD.items():
            if c == oc and test(v): return f"Hermas {nc}:{v}"
        return m.group(0)
    return re.sub(r"\bHermas (2[34]):(\d+)", rep, text)

def canon_requote(text, book_slug):
    """Re-quote the labelled canon italic(s) — 'Name c:v — *…*' and '*…* (Name c:v)' — verbatim from canon.json.
    A quotation whose pieces span two verses is re-cited as c:v–v and both verses quoted."""
    names = {t.lower(): s for s, t in CTITLE.items()}; names.update({'psalm': 'psalms'})
    NM = '|'.join(sorted((re.escape(n) for n in names), key=len, reverse=True))
    changed = []
    def fix(name, ch, vn, q):
        slug = names[name.lower()]; a = f"{slug}|{ch}:{vn}"
        if a not in CL: return None
        live = CL[a]
        if contains(live, q): return None
        nxt = f"{slug}|{ch}:{int(vn)+1}"; prv = f"{slug}|{ch}:{int(vn)-1}"
        if nxt in CL and contains(live + ' ' + CL[nxt], q): return (live + ' ' + CL[nxt], f"{name} {ch}:{vn}–{int(vn)+1}")
        if prv in CL and contains(CL[prv] + ' ' + live, q): return (CL[prv] + ' ' + live, f"{name} {ch}:{int(vn)-1}–{vn}")
        r = difflib.SequenceMatcher(None, norm(q).split(), norm(live).split(), autojunk=False).ratio()
        return (live, f"{name} {ch}:{vn}") if r >= 0.6 else ('??', f"{name} {ch}:{vn}")
    def rep_lead(m):
        name, ch, vn, q = m.group(1), m.group(2), m.group(3), m.group(4)
        f = fix(name, ch, vn, q)
        if not f or f[0] == '??': return m.group(0)
        changed.append((q, f[0])); return f"{f[1]} — *{f[0]}*"
    def rep_trail(m):
        q, name, ch, vn = m.group(1), m.group(2), m.group(3), m.group(4)
        f = fix(name, ch, vn, q)
        if not f or f[0] == '??': return m.group(0)
        changed.append((q, f[0])); return f"*{f[0]}* ({f[1]})"
    text = re.sub(rf"\b({NM})\.?\s+(\d+):(\d+)(?:\s*[–-]\s*\d+)?\s*[—–-]+\s*\*([^*]+)\*", rep_lead, text, flags=re.I)
    text = re.sub(rf"\*([^*]+)\*\s*\(({NM})\.?\s+(\d+):(\d+)(?:\s*[–-]\s*\d+)?\)", rep_trail, text, flags=re.I)
    return text, changed

def name_fixes(text, book):
    """English book names in citations: slug cites, 'Ignatius 1:n' → the letter, 'Ignatius-Polycarp', bare '(1:n)' in one-chapter books."""
    eng = ENGLISH[book]
    text = re.sub(r"\bhermas (\d+:\d+)", r"Hermas \1", text)
    for sl, en in ENGLISH.items(): text = re.sub(rf"\b{re.escape(sl)} (\d+:\d+)", rf"{en} \1", text)
    text = text.replace('Ignatius-Polycarp', 'Ignatius to Polycarp')
    if book.startswith('ignatius-'): text = re.sub(r"\bIgnatius (\d+:\d+)", rf"{eng} \1", text)
    if book != 'hermas' and book != 'sonnini-acts-29':
        text = re.sub(r"\((\d+:\d+)\)", rf"({eng} \1)", text)                     # (1:20) → (Martyrdom of Polycarp 1:20)
        text = re.sub(r"\b(in|at|of|from|by) (1:\d+)\b(?! [—–-])", rf"\1 {eng} \2", text)   # 'guards in 1:8'
    if book == 'sonnini-acts-29': text = re.sub(r"(?<!Sonnini )\bActs 29:(\d+)", r"Acts 29:\1", text)
    for h, e in HEB.items(): text = re.sub(rf"\b{re.escape(h)}\b", e, text)
    return text

plan = []; mech = {'cards': {}, 'members': {}, 'threads': {}, 'verses': {}}
# ---- live text typo (Hermas 15:3 'Cod' twice) — fixed with a guard; summaries re-quoted after
for a, t in L.items():
    if re.search(r"\bCod\b", t):
        mech['verses'][a] = dict(old=t, new=re.sub(r"\bCod\b", "Elohim (God)", t)); L[a] = mech['verses'][a]['new']
# ---- CARDS
for o in R:
    if o['verdict'] == 'MENTION_ONLY': continue
    c = CARD[o['id']]; book = o['book'].split('|')[1]; note = o['note']; why = []
    new, ch = canon_requote(note, book)
    if ch: why.append(f"canon re-quote ×{len(ch)}")
    new2 = name_fixes(new, book)
    if new2 != new: why.append('citation names')
    new = new2
    needs_reader = []
    if o['degraded'] or o['hyphen_chain']: needs_reader.append('degraded/chain prose')
    for p in o['phrases']:
        if p['verdict'] != 'STAND': needs_reader.append(f"phrase {p['verdict']}: {p['quote'][:60]}")
    if o['side'] == 'T': needs_reader.append('old-era card on the canon side (S1xx) — rebuild Come-and-See')
    if re.search(r"\b(The|the) (Lord|LORD)\b(?! Yahusha)(?!\))", re.sub(r"\*[^*]+\*", " ", new)): needs_reader.append("bare 'the Lord' in prose")
    if why: mech['cards'][o['id']] = dict(old=note, new=new, why=why)
    plan.append(dict(kind='card', id=o['id'], book=book, addr=o['addr'], side=o['side'], mechanical=why, reader=needs_reader))
# ---- MEMBERS
for m in M:
    if m.get('verdict') == 'MENTION_ONLY': continue
    key = (m['thread'], m['xref']); mm = MEMB[key]; book = m['book'].split('|')[1]; note = mm['member_note'] or ''; why = []
    new, ch = canon_requote(note, book)
    if ch: why.append(f"canon re-quote ×{len(ch)}")
    new2 = name_fixes(new, book)
    if new2 != new: why.append('citation names')
    new = hermas_recite(new2) if book == 'hermas' else new2
    if new != new2: why.append('Hermas numbering')
    needs_reader = []
    if m['degraded'] or m['hyphen_chain']: needs_reader.append('degraded/chain prose')
    for p in m['phrases']:
        if p['verdict'] != 'STAND': needs_reader.append(f"phrase {p['verdict']}: {p['quote'][:60]}")
    if why: mech['members'][f"{key[0]}|{key[1]}"] = dict(old=note, new=new, why=why)
    plan.append(dict(kind='member', thread=key[0], xref=key[1], book=book, addr=m['addr'], mechanical=why, reader=needs_reader))
# ---- THREADS
for t in T:
    if not t['anchored']: continue
    th = THR[t['id']]; book = t['book'].split('|')[1]; s = th['summary_md'] or ''; why = []
    new, ch = canon_requote(s, book)
    if ch: why.append(f"canon re-quote ×{len(ch)}")
    new2 = name_fixes(new, book)
    if new2 != new: why.append('citation names')
    new3 = hermas_recite(new2) if book == 'hermas' else new2
    if new3 != new2: why.append('Hermas numbering')
    new = new3
    title = th['title'] or ''; t2 = name_fixes(title, book)
    if t2 != title: why.append('title names')
    # extra-book quotes still off after the re-cite?
    still_off = []
    for q, a in [(q, a) for q, a in [(x['quote'], x['addr']) for x in t['off']]]:
        a2 = a
        if book == 'hermas':
            mm = re.match(r"(.*\|)(2[34]):(\d+)$", a)
            if mm:
                c_, v_ = mm.group(2), int(mm.group(3))
                nc = '25' if (c_ == '23' and v_ <= 11) else ('26' if c_ == '23' else '27'); a2 = f"{mm.group(1)}{nc}:{v_}"
        if not (a2 in L and contains(L[a2], q)): still_off.append(dict(quote=q, addr=a2, live=L.get(a2)))
    needs_reader = []
    if still_off: needs_reader.append(f"extra quotes off ×{len(still_off)}")
    if t['degraded'] or t['hyphen_chain']: needs_reader.append('degraded/chain prose')
    if any(x.get('verdict') == 'NO_SUCH_VERSE' for x in t['canon_off']): needs_reader.append('canon cite to no such verse')
    if why: mech['threads'][t['id']] = dict(old=s, new=new, old_title=title, new_title=t2, why=why)
    plan.append(dict(kind='thread', id=t['id'], slug=t['slug'], book=book, mechanical=why, reader=needs_reader, still_off=still_off))

json.dump(plan, open(HERE / 'fix_plan.json', 'w'), ensure_ascii=False, indent=1)
(HERE / 'out').mkdir(exist_ok=True); json.dump(mech, open(HERE / 'out' / 'mechanical.json', 'w'), ensure_ascii=False, indent=1)
# ---- packets for readers
(HERE / 'packets').mkdir(exist_ok=True)
pk_cards = []
for p in plan:
    if p['kind'] == 'card' and p['reader']:
        c = CARD[p['id']]; cur = mech['cards'].get(p['id'], {}).get('new', c['note'])
        side = p['side']; ext = c if side == 'S' else c
        ea = p['addr']; eb = p['book']
        other = dict(cite=(f"{CTITLE.get(c['t_book'], c['t_book'])} {c['t_ch']}:{c['t_vn']}" if side == 'S' else f"{CTITLE.get(c['s_book'], c['s_book'])} {c['s_ch']}:{c['s_vn']}"),
                     text_canon=(CL.get(f"{c['t_book']}|{c['t_ch']}:{c['t_vn']}") if side == 'S' else CL.get(f"{c['s_book']}|{c['s_ch']}:{c['s_vn']}")),
                     text_db=(c['t_text'] if side == 'S' else c['s_text']))
        ed_, bk_, cv_ = ea.split('|'); ch_, vn_ = cv_.split(':')
        nb = {f"{ENGLISH[eb]} {ch_}:{int(vn_)+k}": L.get(f"{ed_}|{bk_}|{ch_}:{int(vn_)+k}") for k in (-1, 1) if L.get(f"{ed_}|{bk_}|{ch_}:{int(vn_)+k}")}
        pk_cards.append(dict(id=p['id'], side=side, extra=dict(book=ENGLISH[eb], cite=f"{ENGLISH[eb]} {ea.split('|')[2]}", text=L.get(ea), neighbours=nb), other=other,
                             note=cur, member_note=next((mm['member_note'] for (tid, xid), mm in MEMB.items() if xid == p['id']), None),
                             member_key=next((f"{tid}|{xid}" for (tid, xid), mm in MEMB.items() if xid == p['id']), None),
                             why=p['reader']))
json.dump(pk_cards, open(HERE / 'packets' / 'cards.json', 'w'), ensure_ascii=False, indent=1)
pk_thr = []
for p in plan:
    if p['kind'] == 'thread' and p['reader']:
        th = THR[p['id']]; cur = mech['threads'].get(p['id'], {}).get('new', th['summary_md'])
        # live text of every extra verse the summary cites (after re-cite)
        cites = sorted(set(re.findall(rf"{re.escape(ENGLISH[p['book']])} (\d+:\d+)", cur)))
        anchor = f"{th['a_ch']}:{th['a_vn']}"
        ed = p['book'] if p['book'] == 'sonnini-acts-29' else 'lightfoot-apostolic-fathers'
        chs = {cv.split(':')[0] for cv in set(cites) | {anchor}}
        verses = {f"{ENGLISH[p['book']]} {k.split('|')[2]}": v for k, v in L.items() if k.startswith(f"{ed}|{p['book']}|") and k.split('|')[2].split(':')[0] in chs}
        verses = dict(sorted(verses.items(), key=lambda kv: tuple(int(x) for x in kv[0].rsplit(' ', 1)[1].split(':'))))
        pk_thr.append(dict(id=p['id'], slug=p['slug'], title=mech['threads'].get(p['id'], {}).get('new_title', th['title']), anchor=f"{ENGLISH[p['book']]} {anchor}",
                           summary=cur, live=verses, still_off=p['still_off'], why=p['reader']))
json.dump(pk_thr, open(HERE / 'packets' / 'threads.json', 'w'), ensure_ascii=False, indent=1)

# ---- map
cards = [p for p in plan if p['kind'] == 'card']; mems = [p for p in plan if p['kind'] == 'member']; ths = [p for p in plan if p['kind'] == 'thread']
def cnt(items, key): return collections.Counter(w.split(' ×')[0].split(':')[0] for p in items for w in p[key])
lines = ["# S463f sweep map — Apostolic Fathers (Lightfoot) + Sonnini Acts 29", "",
         f"Live: 373 verses (all identical to the Desktop parse) · cards anchored {len(cards)} (+4 mention-only) · member notes {len(mems)} · threads anchored {len(ths)} (+2 name a book only)", "",
         "Every card here is a canon-first gloss (the canon verse quoted in full, then a sentence tying it to the Apostolic-Fathers text the card sits on); the reader has the extra text on the page. "
         "Three cards on the canon side (Matthew 10 → Sonnini) are S1xx-era framework prose and get rebuilt Come-and-See.", "",
         "## Mechanical (scripted, verified by content)",
         f"- cards: {dict(cnt(cards, 'mechanical'))}", f"- member notes: {dict(cnt(mems, 'mechanical'))}", f"- thread summaries: {dict(cnt(ths, 'mechanical'))}",
         f"- live text: {len(mech['verses'])} verse(s) with the OCR typo 'Cod' → 'Elohim (God)' (Hermas 15:3), guarded on the exact old text",
         "", "## For a reader (packets/)",
         f"- cards: {len(pk_cards)} — {dict(cnt(cards, 'reader'))}", f"- member notes riding with them: {sum(1 for p in pk_cards if p['member_key'])}",
         f"- threads: {len(pk_thr)} — {dict(cnt(ths, 'reader'))}", "",
         "## Coverage gaps seen in the dump (phase 2, not this sweep)",
         "- Hermas chapters 23 (Similitude 6, 5 verses) and 24 (Similitude 7, 1 verse) carry no card; Barnabas carries none (by rule?) — see the library inventory.", ""]
(HERE / 's463f-sweep-map.md').write_text("\n".join(lines))
print("\n".join(lines))
