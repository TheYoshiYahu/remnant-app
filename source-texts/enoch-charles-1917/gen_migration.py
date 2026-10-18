#!/usr/bin/env python3
"""S449 — generate data-schema/migrations/session449_enoch_full_rebuild.sql from parsed/enoch.json."""
import json
from pathlib import Path
APP=Path(__file__).resolve().parents[2]
d=json.load(open(APP/'source-texts/parsed/enoch.json',encoding='utf-8'))
chs=d['books'][0]['chapters']
def esc(s): return "E'"+s.replace('\\','\\\\').replace("'","\\'")+"'"
vals=[]; maxes=[]
for c in chs:
    n=int(c['number']); maxes.append((n,max(int(v['number']) for v in c['verses'])))
    for v in c['verses']: vals.append("    (%d, %d, %s)"%(n,int(v['number']),esc(v['text'])))
total=len(vals)
VALS=',\n'.join(vals); MAXES=', '.join('(%d,%d)'%(n,h) for n,h in maxes)
tpl=open(Path(__file__).parent/'migration_template.sql',encoding='utf-8').read()
sql=tpl.replace('{{VALS}}',VALS).replace('{{MAXES}}',MAXES).replace('{{TOTAL}}',str(total))
open(APP/'data-schema/migrations/session449_enoch_full_rebuild.sql','w',encoding='utf-8').write(sql)
print("rows",total,"bytes",len(sql))
