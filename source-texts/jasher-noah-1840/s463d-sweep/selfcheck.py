"""S463d — self-check an agent's rebuild output against its packet, by content.
usage: python3 -I selfcheck.py packets/rebuild_NN.json out/rebuild_NN.json"""
import json, re, sys
pk = {x['id']: x for x in json.load(open(sys.argv[1]))}
out = json.load(open(sys.argv[2]))
JARGON = re.compile(r'wisdom-stream|the framework|Red Line|apparatus|\bsubstance\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{2,3}\b|Yoshi|verbal-anchor|\bmotif\b|\bprototype\b|\bmarkers?\b', re.I)
CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
NUMERIC = re.compile(r"^(?:(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fifteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|threescore|fourscore|and|by|year|years|old|day|days|cubit|cubits|fold)-?)+$", re.I)
SLUG = re.compile(r"\b[a-z0-9]+(?:-[a-z0-9]+)+ \d+:\d+")
HEB = re.compile(r"\b(Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Tehillim|Mishlei|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Yochanan|Hitgalut|Ivrim|Galatim|Romim) \d+")
BARE = re.compile(r"\b(Yahuah|Yahusha|Elohim|Yashar'el|Yahudah|Yahudim|Messiah)(?:['’]s)?(?!['’]s)(?!\s*\()(?!\s+(?:his|my|your|our|their|thy|the|of|Elohim|Elohayka|Elohaychem|Eloheinu|Elohai|Elohav|Tseva'ot|HaMashiach|Yireh|Nissi|Shalom|Rapha|Ra'ah|Shammah|Tsidkenu)\b)")
def prose(s): return re.sub(r"\*[^*]+\*", " ", s)
bad = 0
if [o['id'] for o in out] != list(pk): print('ORDER/IDS differ from packet'); bad += 1
for o in out:
    it = pk.get(o['id']);
    if not it: print(o['id'], 'not in packet'); bad += 1; continue
    note = o['new_note']; p = []
    addr = o.get('move') or f"jasher|{it['jasher']['ch']}:{it['jasher']['vn']}"
    jt = it['jasher']['text'] if not o.get('move') else None
    if jt and jt not in note: p.append('Jasher verse not verbatim')
    ot = it['other']['text_canon'] if it['other']['ed'] == 'canon' else it['other']['text_db']
    if ot and ot not in note: p.append('other verse not verbatim')
    if f"({it['jasher']['cite']})" not in note and not re.search(r"\(Jasher \d+:\d+[–-]\d+\)", note): p.append('Jasher cite missing')
    if f"({it['other']['cite']})" not in note: p.append(f"other cite missing: ({it['other']['cite']})")
    if it['side'] == 'S' and jt and ot and note.find(jt) > note.find(ot): p.append('side S should lead with Jasher')
    if it['side'] == 'T' and jt and ot and note.find(ot) > note.find(jt): p.append('side T should lead with the other verse')
    pr = prose(note)
    j = JARGON.findall(pr)
    if j: p.append('jargon: ' + ','.join(j[:3]))
    ch = [c for c in CHAIN.findall(pr) if not NUMERIC.match(c)]
    if ch: p.append('hyphen-chain: ' + ','.join(ch[:3]))
    if SLUG.search(note): p.append('slug citation')
    if HEB.search(note): p.append('hebrew book name')
    b = BARE.findall(pr)
    if b: p.append('sacred name without parenthetical in prose: ' + ','.join(b[:3]))
    sents = [s for s in re.split(r"(?<=[.!?])\s+", pr.strip()) if len(s.split()) > 2]
    if len(sents) < 2: p.append('prose under 2 sentences')
    mn = o.get('member_note') or ''
    phs = [q.strip().rstrip('.').strip() for q in re.findall(r"\*([^*]+)\*", mn)]
    span = ' '.join(x for x in [it['jasher']['text'], it['jasher']['next'] or ''] if x)
    if not phs: p.append('member note has no italic phrase')
    elif not any(ph in span for ph in phs): p.append('member phrase not verbatim in the live verse')
    elif not any(6 <= len(ph.split()) <= 20 for ph in phs): p.append('member phrase not 6–20 words')
    if not mn.startswith(f"Jasher {it['jasher']['ch']}:{it['jasher']['vn']}"): p.append('member note should open "Jasher c:v — "')
    if JARGON.findall(prose(mn)) or [c for c in CHAIN.findall(prose(mn)) if not NUMERIC.match(c)]: p.append('member jargon/chain')
    if BARE.findall(prose(mn)): p.append('member sacred name without parenthetical')
    if p: bad += 1; print(o['id'], '|', '; '.join(p))
print('selfcheck:', 'OK — all', len(out), 'pass' if not bad else f'{bad} item(s) need fixing')
