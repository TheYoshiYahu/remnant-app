import json,re
pages=json.load(open('jub1917_pages.json'))
ROM={'i':1,'ii':2,'iii':3,'iv':4,'v':5,'vi':6,'vii':7,'viii':8,'ix':9,'x':10,'xi':11,'xii':12,'xiii':13,'xiv':14,'xv':15,'xvi':16,'xvii':17,'xviii':18,'xix':19,'xx':20,'xxi':21,'xxii':22,'xxiii':23,'xxiv':24,'xxv':25,'xxvi':26,'xxvii':27,'xxviii':28,'xxix':29,'xxx':30,'xxxi':31,'xxxii':32,'xxxiii':33,'xxxiv':34,'xxxv':35,'xxxvi':36,'xxxvii':37,'xxxviii':38,'xxxix':39,'xl':40,'xli':41,'xlii':42,'xliii':43,'xliv':44,'xlv':45,'xlvi':46,'xlvii':47,'xlviii':48,'xlix':49,'l':50}
chapters={}; notes=[]; gaps=[]; prologue=None
def fixrange(h):
    return re.sub(r'\((?P<r>[ivxl]+)\.\s*(?P<a>[\di]+)(?:-(?P<b>[\di]+))?', lambda m: f"({m['r']}. {m['a'].replace('i','1')}" + (f"-{m['b'].replace('ii','11').replace('i','1')}" if m['b'] else ''), h)
START=re.compile(r'^(\[?\d{1,2}[.:]\s|[IVXL1]+\.\s)')
for p in pages:
    if p['n']=='11':
        prologue=re.sub(r'^THE BOOK OF JUBILEES\s*Prologue\s*','',p['text']).replace('\n',' ').strip(); continue
    hdr=fixrange(p['title']+' '+p['range'])
    # the range is the LAST (roman. a-b) group in the header (titles may cite Gen. first)
    ms=re.findall(r'\(([ivxl]+)\.\s*(\d+)(?:-(\d+))?',hdr)
    ms=[m for m in ms if m[0] in ROM and ROM[m[0]]>= (max(chapters) if chapters else 1)]
    if p['n']=='39': ms=[('xvii','15','18')]   # site header says xvi; the text is Jubilees 17:15-18 (Mastema before God)
    if not ms: notes.append(('NO RANGE',p['n'],hdr)); continue
    m=ms[-1]; ch=ROM[m[0]]; v0=int(m[1]); v1=int(m[2] or m[1])
    lines=[l.strip() for l in p['text'].split('\n')]
    while lines and not START.search(lines[0]): lines.pop(0)
    body=' '.join(lines).replace('[paragraph continues]','')
    body=re.sub(r'\s+',' ',body).strip()
    body=re.sub(r'^[IVXL1]+\.\s','1. ',body)
    body=re.sub(r'(?<=[.!?"”\)\]]) \. (?=[A-Z])',' 0. ',body)
    parts=re.split(r'(?:^|(?<=[\s"”\'’\)\]]))\[?(\d{1,2})[.:]\s(?=\S)',body)
    if parts[0].strip(): notes.append(('LEAD TEXT',ch,p['n'],parts[0][:80]))
    cands=[(int(parts[i]),parts[i+1].strip()) for i in range(1,len(parts),2)]
    exp=v0; cur=None; got=[]
    def put(n,txt):
        chapters.setdefault(ch,{})
        if n in chapters[ch]: notes.append(('DUP',ch,n,txt[:60])); chapters[ch][n]+=' '+txt
        else: chapters[ch][n]=txt
    for k,(n,txt) in enumerate(cands):
        nxt=cands[k+1][0] if k+1<len(cands) else None
        if n==exp or n==0:
            if n==0: notes.append(('bare marker ->',ch,exp,txt[:50]))
            put(exp,txt); cur=exp; got.append(exp); exp+=1
        elif n==exp+1 and (nxt is None or nxt==n+1 or nxt<n):
            gaps.append((ch,exp,p['n'])); put(n,txt); cur=n; got.append(n); exp=n+1
        elif n>exp+1 and nxt==exp+1:
            notes.append(('typo marker',ch,p['n'],'printed',n,'->',exp,txt[:50])); put(exp,txt); cur=exp; got.append(exp); exp+=1
        else:
            # stray digit inside the verse text: glue back
            notes.append(('stray',ch,p['n'],n,txt[:40]))
            if cur is not None: chapters[ch][cur]+=' '+txt
    if got and (got[0]!=v0 or got[-1]!=v1): notes.append(('RANGE',ch,p['n'],f'{got[0]}-{got[-1]}','expected',f'{v0}-{v1}'))
# markers the source printed without a period (or with a typo) and my splitter left glued to the verse before
FIX={(2,19,20):r' 20 \. ',(6,14,15):r' 15 ',(9,8,9):r' 9 ',(13,12,13):r' 11 ',(13,24,25):r' 25 (?=\. \. )',(22,20,21):r' 21, ',(42,2,3):r' 3 \. '}
for (ch,v,nv),pat in FIX.items():
    t=chapters[ch][v]; m=re.search(pat,t); assert m, (ch,v)
    chapters[ch][v]=t[:m.start()].strip(); 
    assert nv not in chapters[ch]
    chapters[ch][nv]=t[m.end():].strip()
out={'source':'R.H. Charles, The Book of Jubilees (SPCK 1917), via sacred-texts mirror neonvagabond.xyz/mirrors/sacred-texts/bib/jub/','prologue':prologue,'chapters':{str(c):{str(v):t for v,t in sorted(chapters[c].items())} for c in sorted(chapters)}}
json.dump(out,open('jubilees-charles-1917.json','w'),ensure_ascii=False,indent=1)
counts={c:len(chapters[c]) for c in sorted(chapters)}
print('chapters',len(chapters),'verses',sum(counts.values()))
print(' '.join(f'{c}:{n}' for c,n in counts.items()))
print('GAPS (marker missing in source; verse merged into the one before):',gaps)
print('notes:',len(notes))
for x in notes: print(x)
