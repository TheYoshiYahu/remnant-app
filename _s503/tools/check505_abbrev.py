"""S505 — check505_abbrev.py: after session505_abbrev_book_names.sql, on fresh dumps of 2 Baruch and Testaments XII — every card in fix/abbrev505.json
carries its new note and member note, and no card of either book still opens with an abbreviated book name. Exit 1 on FAIL. Model: Claude Fable 5.1."""
import json, re, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
LEAD = re.compile(r"^([123] )?(Matt|Mk|Lk|Jn|Gen|Exod?|Lev|Num|Deut|Isa|Jer|Ezek|Dan|Hos|Zech|Mal|Ps|Prov|Rom|Gal|Heb|Rev)\.? \d")
fx = {r['id']: r for r in json.load(open(W3 / 'fix' / 'abbrev505.json'))}; bad = 0; seen = 0
for ed, bk in (('pseudepigrapha', '2-baruch'), ('pseudepigrapha', 'testaments-xii')):
    D = load503(ed, bk); M = {m['xref_id']: m for m in D['members']}
    for c in D['cards']:
        if c['s_book'] != bk: continue
        if LEAD.match(c['note']): print(f"FAIL card {c['id']}: note still abbreviated: {c['note'][:50]}"); bad += 1
        m = M.get(c['id'])
        if m and LEAD.match(m['member_note'] or ''): print(f"FAIL card {c['id']}: member note still abbreviated"); bad += 1
        r = fx.get(c['id'])
        if r:
            seen += 1
            if c['note'] != r['new_note']: print(f"FAIL card {c['id']}: note is not the new note"); bad += 1
            if not m or m['member_note'] != r['new_mnote']: print(f"FAIL card {c['id']}: member note is not the new member note"); bad += 1
print(f"check505_abbrev: {seen} of {len(fx)} fixed cards seen on the fresh dumps — {'PASS' if bad == 0 and seen == len(fx) else 'FAIL'} ({bad} problem(s))")
sys.exit(0 if bad == 0 and seen == len(fx) else 1)
