#!/usr/bin/env python3
"""Orchestrator authoritative gate-runner for an assembled book migration.
Runs: (2) fidelity over fragment glob, (3) pglast grammar, (1) full-library audit
line for this migration, + dup-slug check. Prints a compact PASS/FAIL summary.

Usage:
  .venv/bin/python gate_check.py <migration.sql> "<scratch_glob of minion_*.sql>"
"""
import sys, re, glob, json, os
from urllib.parse import urlparse

mig_path = sys.argv[1]
frag_glob = sys.argv[2]
ROOT = "/Users/mtm/Desktop/App"
PARSED = os.path.join(ROOT, "source-texts", "parsed")

# ---- fidelity (inline; same logic as verify_fidelity.py) --------------------
EDFILES = {'canon':'canon','enoch':'enoch','jubilees':'jubilees','jasher':'jasher',
 'apocrypha':'apocrypha','apocrypha-charles-vol1':'apocrypha-charles-vol1',
 'pseudepigrapha':'pseudepigrapha-charles-vol2','adam-eve-conflict':'adam-eve-conflict',
 'apocalypse-of-abraham':'apocalypse-of-abraham','ascension-isaiah':'ascension-isaiah',
 'sonnini-acts-29':'sonnini-acts-29'}
VERSE={}
for es,fn in EDFILES.items():
    p=os.path.join(PARSED,fn+'.json')
    if not os.path.exists(p): continue
    d=json.load(open(p))
    for b in d['books']:
        bid=b.get('book_id') or b.get('slug')
        for c in b['chapters']:
            cn=c.get('number') or c.get('chapter_number')
            for v in c.get('verses',[]):
                VERSE[(es,bid,cn,v['number'])]=v['text']
def norm(s):
    s=s.lower(); s=re.sub(r"\(([^)]*)\)"," ",s); s=re.sub(r"[^a-z0-9 ]"," ",s)
    return re.sub(r"\s+"," ",s).strip()
def shing(s,n=4):
    t=norm(s).split(); return set(" ".join(t[i:i+n]) for i in range(len(t)-n+1)) if len(t)>=n else {norm(s)}
def toks(block):
    out=[];i=0;n=len(block)
    while i<n:
        c=block[i]
        if c=="'":
            i+=1;buf=[]
            while i<n:
                if block[i]=="'":
                    if i+1<n and block[i+1]=="'": buf.append("'");i+=2;continue
                    i+=1;break
                buf.append(block[i]);i+=1
            out.append(('s',''.join(buf)))
        elif c.isdigit():
            j=i
            while j<n and block[j].isdigit(): j+=1
            out.append(('i',int(block[i:j])));i=j
        else: i+=1
    return out
checked=ok=flagged=0; flags=[]
for f in sorted(glob.glob(frag_glob)):
    sql=open(f,encoding='utf-8',errors='replace').read()
    for hm in re.finditer(r"\(VALUES(.*?)\)\s*(?:INSERT\b|AS\s+\w+\s*\()",sql,re.DOTALL|re.IGNORECASE):
        region=hm.group(1);depth=0;start=None
        for idx,ch in enumerate(region):
            if ch=='(' and depth==0: depth=1;start=idx+1
            elif ch=='(': depth+=1
            elif ch==')':
                depth-=1
                if depth==0 and start is not None:
                    tup=region[start:idx];tk=toks(tup)
                    strs=[v for k,v in tk if k=='s'];ints=[v for k,v in tk if k=='i']
                    if len(strs)>=5 and len(ints)>=4:
                        te,tb=strs[2],strs[3];note=strs[-1];tc,tv=ints[2],ints[3]
                        actual=VERSE.get((te,tb,tc,tv))
                        if actual and len(note)>30:
                            checked+=1
                            if shing(actual)&shing(note): ok+=1
                            else: flagged+=1; flags.append(f"{os.path.basename(f)} {te}/{tb} {tc}:{tv}")
                    start=None
fid = f"GATE2 fidelity: checked {checked} faithful {ok} FLAGGED {flagged}" + (" -> "+";".join(flags[:6]) if flags else "")

# ---- pglast grammar ---------------------------------------------------------
try:
    import pglast
    clean="\n".join(l for l in open(mig_path,encoding='utf-8').read().splitlines() if not l.lstrip().startswith('\\'))
    n=len(pglast.parse_sql(clean)); g3=f"GATE3 pglast: PARSE OK ({n} statements)"
except Exception as e:
    g3=f"GATE3 pglast: FAIL {type(e).__name__}: {e}"

# ---- dup-slug ---------------------------------------------------------------
slugs=re.findall(r"INSERT INTO cross_reference_threads[^;]*?SELECT\s+'([a-z0-9][a-z0-9\-]+)'",open(mig_path,encoding='utf-8').read(),re.DOTALL)
dups=sorted(set(s for s in slugs if slugs.count(s)>1))
gslug=f"slugs: {len(slugs)} total, dups={dups or 'NONE'}"

# ---- full-library audit (run the real audit, grab this migration's line) ----
import subprocess
base=os.path.basename(mig_path)
au=subprocess.run([sys.executable, os.path.join(ROOT,'data-schema','migrations','_xref_audit.py')],
                  capture_output=True,text=True)
line=[l for l in au.stdout.splitlines() if base in l]
g1=f"GATE1 audit: {line[0].strip() if line else 'migration line not found'}"

# ---- GATE5 arity (VALUES row column-count consistency; catches apply-time errors) ----
ar=subprocess.run([sys.executable, os.path.join(os.path.dirname(os.path.abspath(__file__)),'arity_check.py')]
                  + sorted(glob.glob(frag_glob)), capture_output=True, text=True)
arity_ok = ar.returncode==0
g5=f"GATE5 arity: {'OK' if arity_ok else 'BAD ROWS -> '+ar.stdout.strip().splitlines()[-1] if ar.stdout else 'FAIL'}"

allpass = (flagged==0) and ("PARSE OK" in g3) and (not dups) and ("[PASS] FULL-LIBRARY" in g1) and arity_ok
print(g1); print(fid); print(g3); print(gslug); print(g5)
if not arity_ok: print(ar.stdout.strip())
print("ALLGATES:", "PASS" if allpass else "FAIL")
sys.exit(0 if allpass else 1)
