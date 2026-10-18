"""S454 — surgical patch of the KJV Apocrypha edition (every edit counted and asserted).
Writes apocrypha.fixed.json (staged) + Apocrypha-Restored-Names-Edition.fixed.txt (staged) + apocrypha-changed-verses.json."""
import json,re,copy
src=json.load(open('../parsed/apocrypha.json')); d=copy.deepcopy(src)
B={b['book_id']:b for b in d['books']}
def ch(bid,n): return next(c for c in B[bid]['chapters'] if c['number']==n)
def verse(bid,c,v): return next(x for x in ch(bid,c)['verses'] if x['number']==v)
changed=[]; inserted=[]
# 1. Rest of Esther 10: one row (numbered 1) holding KJV 10:4-13 with inline digits -> ten rows 4..13
c10=ch('the-rest-of-esther',10); assert len(c10['verses'])==1 and c10['verses'][0]['number']==1
row=c10['verses'][0]; t=row['text']
parts=re.split(r'(?:^|\s)(\d{1,2}) (?=[A-Z])',t)   # ['', '4', 'Then…', '5', 'For…', …]
assert parts[0]=='' and [int(x) for x in parts[1::2]]==list(range(4,14)),parts[1::2]
pieces=[p.strip() for p in parts[2::2]]; assert len(pieces)==10 and all(pieces)
new=[]
for n,p in zip(range(4,14),pieces):
    r=dict(row); r['number']=n; r['text']=p; new.append(r)
    (changed if n==4 else inserted).append(('the-rest-of-esther',10,n))
c10['verses']=new
# 2. 1611 marginal notes -> footnote field
for (c,v) in [(11,1),(13,7)]:
    x=verse('the-rest-of-esther',c,v); m=re.search(r'\s*\[(PLACED IN THE GREEK[^\]]*)\]\s*$',x['text']); assert m,(c,v)
    x['footnote']=(x.get('footnote') or '')+m.group(1).capitalize().replace('Chap.','chap.').replace('greek','Greek').replace('hebrew','Hebrew'); x['text']=x['text'][:m.start()].rstrip(); changed.append(('the-rest-of-esther',c,v))
# 3. 2 Esdras 14:48 stray chapter-rule glyph
x=verse('2-esdras',14,48); assert x['text'].rstrip().endswith('⸻'); x['text']=x['text'].rstrip(' ⸻'); changed.append(('2-esdras',14,48))
# 4. 1 Maccabees 5:35 doubled "and"
x=verse('1-maccabees',5,35); assert x['text'].count(' and and ')==1; x['text']=x['text'].replace(' and and ',' and '); changed.append(('1-maccabees',5,35))
json.dump(d,open('apocrypha.fixed.json','w'),indent=2,ensure_ascii=False)
json.dump(dict(changed=changed,inserted=inserted),open('apocrypha-changed-verses.json','w'),indent=1)
# diff count vs old
old=[(b['book_id'],c['number'],v['number'],v['text'],v.get('footnote')) for b in src['books'] for c in b['chapters'] for v in c['verses']]
nw =[(b['book_id'],c['number'],v['number'],v['text'],v.get('footnote')) for b in d['books'] for c in b['chapters'] for v in c['verses']]
print('rows old',len(old),'new',len(nw),'rows differing',len(set(nw)-set(old)),'| changed',len(changed),'inserted',len(inserted))
# everything else byte-identical?
s2=copy.deepcopy(src); d2=copy.deepcopy(d)
for D in (s2,d2):
    for b in D['books']:
        for c in b['chapters']: c['verses']=[]
assert json.dumps(s2,sort_keys=True)==json.dumps(d2,sort_keys=True), 'non-verse content changed!'
print('front/back matter, titles, commentaries: identical')
# --- txt
T=open('../existing-restored-editions/Apocrypha-Restored-Names-Edition.txt',encoding='utf-8').read()
n0=T.count('[PLACED IN THE GREEK'); assert n0==2
T2=re.sub(r'\s*\[PLACED IN THE GREEK[^\]]*\]','',T,flags=re.S); assert T2.count('[PLACED')==0
assert T2.count('thereof and and burnt')==1; T2=T2.replace('thereof and and burnt','thereof and burnt')
open('Apocrypha-Restored-Names-Edition.fixed.txt','w',encoding='utf-8').write(T2)
print('txt: 2 bracket notes removed, 1 "and and" fixed; chars',len(T),'->',len(T2))
