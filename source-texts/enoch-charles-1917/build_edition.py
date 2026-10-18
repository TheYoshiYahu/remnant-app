#!/usr/bin/env python3
"""S449 step C — rebuild Enoch-Restored-Names-Edition.txt verse text from the
clean Charles 1917 base through restore.py.  Keeps the existing front matter,
chapter titles, every 'Commentary on Chapter N' block, and the back matter
verbatim.  Writes over the original (one .pre-s449 backup kept as audit
evidence of the corrupt text)."""
import re, sys, json, textwrap, shutil
from pathlib import Path
HERE=Path(__file__).parent
APP=HERE.parent.parent
sys.path.insert(0,str(APP/'restoration-pipeline'))
from restore import Restorer
ED=HERE.parent/'existing-restored-editions'/'Enoch-Restored-Names-Edition.txt'

base={}; sections={}
for l in open(HERE/'enoch-charles-1917.txt',encoding='utf-8'):
    m=re.match(r'(\d+):(\d+) (.*)',l)
    if m: base.setdefault(int(m.group(1)),{})[int(m.group(2))]=m.group(3).strip()
assert len(base)==108 and sum(len(v) for v in base.values())==1063

old=open(ED,encoding='utf-8').read()
front=old[:old.index('\nChapter 1: ')+1]
parts=re.split(r'(?m)^Chapter (\d+): (.*)$(?=\n\n1 )', old)
titles={}; comm={}
for i in range(1,len(parts),3):
    n=int(parts[i]); titles[n]=parts[i+1].strip(); body=parts[i+2]
    k=body.find('Commentary on Chapter ')
    comm[n]=body[k:].rstrip('\n') if k>=0 else ''
assert len(titles)==108, len(titles)

def clean(t):
    t=re.sub(r'[⌈⌉〈〉†]','',t)          # Charles's critical marks: keep the words, drop the marks
    t=t.replace('--','—')
    t=re.sub(r'\s+([,.;:!?])',r'\1',t)
    t=re.sub(r'\s{2,}',' ',t).strip()
    return t
R=Restorer()
out=[front.rstrip('\n')+'\n']
stats={}
for n in range(1,109):
    out.append(f"\nChapter {n}: {titles[n]}\n\n")
    for v in sorted(base[n]):
        txt=R.restore_text(clean(base[n][v]))
        for w in range(72,60,-1):
            wrapped=textwrap.fill(f"{v} {txt}", width=w)
            if not any(re.match(r'\d', ln) for ln in wrapped.split('\n')[1:]): break
        else:
            raise SystemExit(f"could not wrap {n}:{v} without a digit-leading continuation line")
        out.append(wrapped+"\n\n")
    out.append(comm[n]+"\n")
    stats[n]=len(base[n])
new=''.join(out)
if not new.endswith('\n'): new+='\n'
if not Path(str(ED)+'.pre-s449').exists(): shutil.copy(ED, str(ED)+'.pre-s449')
open(ED,'w',encoding='utf-8').write(new)
print("written", ED.name, "chapters", len(stats), "verses", sum(stats.values()), "lines", new.count('\n'))
