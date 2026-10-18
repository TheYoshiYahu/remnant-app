"""S453 — put the 276 missing verse markers back into the published Jubilees txt
(existing-restored-editions/Jubilees-Restored-Names-Edition.txt). Every insert asserted."""
import json,re
txt=open('edition.txt',encoding='utf-8').read()
new=json.load(open('jubilees.fixed.json'))['books'][0]['chapters']
ins=json.load(open('jubilees-changed-verses.json'))['inserted']
# chapter spans
heads=[(m.start(),int(m.group(1))) for m in re.finditer(r'(?m)^Chapter (\d+) — ',txt)]
assert len(heads)==50
spans={}
for i,(pos,c) in enumerate(heads):
    end=heads[i+1][0] if i+1<len(heads) else len(txt)
    cm=txt.find('\nCommentary\n',pos,end)
    spans[c]=(pos,cm if cm!=-1 else end)   # verse body only — the commentary quotes verses too
out=txt; done=0; offset=0; log=[]
# process in document order so offsets stay simple: collect (pos, marker) then insert from the end
inserts=[]
for key in ins:
    c,v=map(int,key.split(':'))
    t=next(x['text'] for x in new[c-1]['verses'] if x['number']==v)
    words=re.findall(r"\S+",t)[:7]
    pat=r'\s+'.join(re.escape(w) for w in words)
    s,e=spans[c]
    ms=list(re.finditer(pat,txt[s:e]))
    assert len(ms)>=1, (key,words)
    if len(ms)>1:
        # disambiguate with 12 words
        words=re.findall(r"\S+",t)[:14]; pat=r'\s+'.join(re.escape(w) for w in words)
        ms=list(re.finditer(pat,txt[s:e])); assert len(ms)==1,(key,len(ms))
    pos=s+ms[0].start()
    # the marker must not already be there
    m=re.search(r'(\d+)\.\s*$',txt[max(0,pos-6):pos])
    if m:   # a marker is already there with the wrong number (3:23 is printed "32." — the same slip as the 1917 source)
        if int(m.group(1))==v: log.append(f'{key}: marker already present ("{txt[pos-8:pos].strip()}") — nothing inserted'); continue
        start=max(0,pos-6)+m.start(1); end=max(0,pos-6)+m.end(1)
        inserts.append((start,end,str(v))); log.append(f'{key}: marker "{m.group(1)}." corrected to "{v}."'); continue
    inserts.append((pos,pos,f'{v}. '))
for a,b_,mark in sorted(inserts,reverse=True):
    out=out[:a]+mark+out[b_:]
for l in log: print(l)
open('Jubilees-Restored-Names-Edition.fixed.txt','w',encoding='utf-8').write(out)
print('markers inserted:',len(inserts))
# verify: parse the fixed txt's chapter bodies and count markers per chapter
for c in range(1,51):
    s,e=spans[c]; body=out[s+ (0):]  # approximate
import collections
cnt=collections.Counter()
for m in re.finditer(r'(?m)^Chapter (\d+) — ',out): pass
