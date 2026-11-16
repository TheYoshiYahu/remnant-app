"""S506 — prep506.py <slug>: before build503c, pin the prose of (a) cards whose live note is already clean (packet note_clean: prose := the live
note's prose) and (b) cards already built for another thread in fix/sweep506 (prose := that fix's prose) — a card's note is ONE text on its verse pair;
only the member line is per thread. Edits out/sweep506/<slug>.json in place. Model: Claude Fable 5.1."""
import json, sys, glob
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
slug = sys.argv[1]; P = {c['id']: c for c in json.load(open(W3 / 'out' / 'packet506' / f'{slug}.json'))['cards']}
dp = W3 / 'out' / 'sweep506' / f'{slug}.json'; d = json.load(open(dp)); built = {}
for f in glob.glob(str(W3 / 'fix' / 'sweep506' / '*.json')):
    if Path(f).stem == slug or f.endswith('_report.md'): continue
    for c in json.load(open(f))['cards']: built[c['id']] = (Path(f).stem, c['prose'])
n = 0
for cid, card in d['cards'].items():
    pc = P.get(int(cid))
    if pc and pc.get('note_clean') and pc.get('live_prose'): card['prose'] = pc['live_prose']; n += 1; print(f"card {cid}: prose pinned to the live note")
    elif int(cid) in built: card['prose'] = built[int(cid)][1]; n += 1; print(f"card {cid}: prose pinned to `{built[int(cid)][0][:40]}`")
json.dump(d, open(dp, 'w'), ensure_ascii=False, indent=1); print(f"prep506 {slug}: {n} pinned of {len(d['cards'])}")
