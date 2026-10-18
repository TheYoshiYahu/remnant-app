import re,difflib,json,sys
sys.argv=[sys.argv[0],'jasher.fixed.json']
exec(open('diff_edition.py').read().split('base=load_base()')[0])
MAP2=[(r"\byahuah (his|her|our|your|their|my|thy) elohim\b",r"the lord \1 god"),(r"\bo yahuah elohim\b","o lord god"),
      (r"\byahuah's\b","the lord's"),(r"\byahuah’s\b","the lord's"),(r"\bel shaddai\b","the almighty")]
def norm2(s):
    s=s.lower(); s=re.sub(r"\((?:[^()]*)\)","",s)
    for a,b in MAP2: s=re.sub(a,b,s)
    return norm(s)
base=load_base(); ed=load_edition_json()
n=0
for c in base:
    for v in base[c]:
        a=norm2(base[c][v]).split(); b=norm2(ed[c][v]).split()
        if a==b: continue
        sm=difflib.SequenceMatcher(None,a,b,autojunk=False)
        ops=[(t,' '.join(a[i1:i2]),' '.join(b[j1:j2])) for t,i1,i2,j1,j2 in sm.get_opcodes() if t!='equal']
        # ignore pure modernization artifacts of the normalizer (-eth/-est stripping, thence/hither/whereby/thereon)
        real=[o for o in ops if not (o[0]=='replace' and (re.sub(r'(s|e|es)$','',o[1])==re.sub(r'(s|e|es)$','',o[2]) or o[1] in ('thence','hither','whereby','thereon','sons','men','whilst')))]
        if real: n+=1; print(f"{c}:{v}  "+' | '.join(f"[{t}] '{x}' -> '{y}'" for t,x,y in real))
print(n,'verses with a non-modernization difference')
