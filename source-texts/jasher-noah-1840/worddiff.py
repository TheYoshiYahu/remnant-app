import re,difflib,json,sys,collections
sys.argv=[sys.argv[0]]
exec(open('diff_edition.py').read().split('base=load_base()')[0])
# richer name map: compounds the pipeline renders
MAP2=[(r"\byahuah (his|her|our|your|their|my|thy) elohim\b",r"the lord \1 god"),(r"\bo yahuah elohim\b","o lord god"),
      (r"\byahuah's\b","the lord's"),(r"\byahuah’s\b","the lord's"),(r"\bel shaddai\b","the almighty")]
def norm2(s):
    s=s.lower()
    s=re.sub(r"\((?:[^()]*)\)","",s)   # drop every parenthetical
    for a,b in MAP2: s=re.sub(a,b,s)
    return norm(s)
base=load_base(); ed=(load_edition_json() if len(sys.argv)>1 else load_edition_txt())
kinds=collections.Counter(); out=[]
for c in base:
    for v in base[c]:
        a=norm2(base[c][v]).split(); b=norm2(ed[c][v]).split()
        if a==b: continue
        sm=difflib.SequenceMatcher(None,a,b,autojunk=False)
        ops=[(t,' '.join(a[i1:i2]),' '.join(b[j1:j2])) for t,i1,i2,j1,j2 in sm.get_opcodes() if t!='equal']
        out.append((c,v,ops))
print(len(out),'verses differ after normalization')
for c,v,ops in out: print(f"{c}:{v}  "+' | '.join(f"[{t}] '{x}' -> '{y}'" for t,x,y in ops))
