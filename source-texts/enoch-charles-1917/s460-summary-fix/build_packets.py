import json, re, collections
from pathlib import Path as _P
HERE = str(_P(__file__).resolve().parent); HERE_UP = str(_P(HERE).parent)
from pathlib import Path
SRC = Path(HERE_UP + '')
live = json.load(open(SRC / 'enoch-cards-live.json')); L = live['enoch_live']
RG = json.load(open(SRC / 's460-summary-fix/summary-regrade.json'))
RQ = json.load(open(HERE + '/requote.json'))
VS = json.load(open(SRC / 'enoch-verse-status.json'))
# verse index of every non-Enoch verse the Enoch cards touch (live app text) — the only pool for NEW canon quotes
idx = {}
for c in live['cards']:
    for side in ('s', 't'):
        if c[f'{side}_ed'] != 'enoch':
            idx[f"{c[f'{side}_book']} {c[f'{side}_ch']}:{c[f'{side}_vn']}"] = c[f'{side}_text']
json.dump(idx, open(HERE + '/packets/verse_index.json', 'w'), ensure_ascii=False, indent=0)
by_ch = collections.defaultdict(dict)
for a, t in L.items(): by_ch[int(a.split(':')[0])][a] = t

def chapters_for(s):
    chs = set()
    for a in s['verse_state']: chs.add(int(a.split(':')[0]))
    if s['anchor']: chs.add(int(s['anchor']['start'].split(':')[0])); chs.add(int(s['anchor']['end'].split(':')[0]))
    return sorted(chs)

items = []
# 10 un-cited mentions
UNCITED = ['magi-astronomical-tradition', 'the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream', 'unclean-spirits-recognize-the-holy-one-of-elohim', 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras', '1-enoch-52-stone-kingdom-without-hands', 'jasher-3-enoch-prophesied-judgment', 'jasher-6-yahuah-shut-him-in', 'jasher-7-garments-enoch-terah-abram', 'wisdom-of-solomon-4-righteous-dead-condemns-ungodly', 'testaments-xii-88-sodom-and-the-watchers-changed-the-order-of-nature']
for t in live['threads']:
    if t['slug'] in UNCITED:
        items.append(dict(task='READ', id=t['id'], slug=t['slug'], title=t['title'], old=t['summary_md'], draft=t['summary_md'],
                          why='mentions 1 Enoch without a chapter:verse — check what it says against the live book',
                          anchor=None, verse_state={}, quotes=[], live_chapters={}))
for s in RG:
    v = s['verdict']
    if v == 'STAND': continue
    changed = [a for a, st in s['verse_state'].items() if st != 'same']
    if v == 'CITATION_ONLY' and not changed: continue
    if v == 'RE_QUOTE' and not RQ.get(str(s['id']), {}).get('review_words'): continue
    draft = RQ.get(str(s['id']), {}).get('new', s['summary_md'])
    task = {'REWRITE': 'REWRITE', 'RE_QUOTE': 'CHECK', 'CITATION_ONLY': 'READ'}[v]
    quotes = [dict(quote=d['quote'][:120], cited=d['cited'], verdict=d['verdict'], proposed=d['proposed'], live_cited=d['live_cited'], live_proposed=d['live_proposed']) for d in s['det']]
    items.append(dict(task=task, id=s['id'], slug=s['slug'], title=s['title'], old=s['summary_md'], draft=draft,
                      why=', '.join(s['reasons']) or v, review_words=RQ.get(str(s['id']), {}).get('review_words', []),
                      anchor=s['anchor'], verse_state=s['verse_state'], quotes=quotes,
                      live_chapters={str(c): by_ch[c] for c in chapters_for(s) if c in by_ch}))
print(collections.Counter(i['task'] for i in items), len(items))
# batches: chapter threads in chapter order, then the rest
def key(i):
    m = re.match(r'1-enoch-(\d+)-', i['slug']); return (0, int(m.group(1))) if m else (1, i['slug'])
items.sort(key=key)
N = 10; size = -(-len(items) // N)
for b in range(N):
    chunk = items[b * size:(b + 1) * size]
    json.dump(chunk, open(f'{HERE}/packets/batch_{b+1:02d}.json', 'w'), ensure_ascii=False, indent=1)
    print(f'batch_{b+1:02d}: {len(chunk)} items', collections.Counter(i['task'] for i in chunk), chunk[0]['slug'], '…', chunk[-1]['slug'])
