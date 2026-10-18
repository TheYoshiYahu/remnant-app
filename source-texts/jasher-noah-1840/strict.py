import re,difflib,json,sys
sys.argv=[sys.argv[0]]
exec(open('diff_edition.py').read().split('base=load_base()')[0])
base=load_base(); ed=load_edition_txt()
rat=[]
for c in base:
    for v in base[c]:
        a=norm(base[c][v]); b=norm(ed[c][v])
        r=1.0 if a==b else difflib.SequenceMatcher(None,a,b,autojunk=False).ratio()
        rat.append((r,c,v))
rat.sort()
import collections
bins=collections.Counter('1.00' if r==1 else ('0.99' if r>=.99 else '0.97' if r>=.97 else '0.95' if r>=.95 else '0.90' if r>=.9 else '<0.90') for r,_,_ in rat)
print(bins)
low=[x for x in rat if x[0]<0.97]
print('under 0.97:',len(low))
for r,c,v in low[:40]:
    print(f"\n{c}:{v} {r:.2f}\n 1840: {base[c][v]}\n ed  : {ed[c][v]}")
