"""S455 — content diff: eBible KJV 1769 canon (kjv-canon.json) vs the app's parsed/canon.json (= live DB).
Restored names are mapped back to the KJV wording they echo ("Yahuah Ra'ah (The LORD is my shepherd)" -> "The LORD is my shepherd";
"Elohim (God)" -> "God"; son of Adam -> son of man). Verse-by-verse by CONTENT. Verses Yoshi rendered on purpose
(source_type = yoshi-rendering, per restoration-pipeline/YOSHI_RENDERED_PASSAGES.md) are listed apart, not counted as damage.
Writes canon-damage-table.md, canon-diff-detail.json, canon-worddiff.log."""
import re,json,difflib,sys
base=json.load(open('kjv-canon.json')); app=json.load(open(sys.argv[1]))
A={b['book_id']:{c['number']:{v['number']:v for v in c['verses']} for c in b['chapters']} for b in app['books']}
VOC=r"(?:Yahuah|Elohim|Elohai|Elohav|Elohayka|Elohaychem|Eloheinu|El|Tseva'ot|Shaddai|Elyon|Olam|Roi|Gibbor|Avi-ad|Sar|Shalom|Yireh|Nissi|Tsidkenu|Shammah|Rapha|Ra'ah|Adonai|Yahusha|HaMashiach|Messiah|Ruach|HaKodesh|Yashar'el|Yahudah|Yahudim|Yahudi|Melek|Tsadiq|Ehyeh|asher|Yah)"
V1=VOC+r"(?:[’']s)?"
# "Lord Yahusha (Lord Jesus)" / "Lord and Messiah (Lord and Christ)": the title stays outside and is echoed inside
PAT=re.compile(r"\b(?:Lord\s(?:and\s)?)?("+V1+r"(?:[\s\-]+(?:"+V1+r"|asher))*)\s\(([^()]+)\)")
def unrestore(s):
    s=PAT.sub(lambda m:m.group(2),s)
    s=re.sub(r"\bYah\b","JAH",s)
    return s
def restore_base(s):   # Red Line 12 applied to the KJV side: son of man -> son of Adam (so KJV's own "son of Adam" at Luke 3:38 stays untouched)
    s=re.sub(r"\b([Ss])on of man\b",r"\1on of Adam",s)   # plural "sons of men" stays (Book-of-Life rule, YOSHI_RENDERED_PASSAGES.md Deut 32:8 entry)
    return s
def norm(s):
    s=s.replace('¶','').lower()
    # the pipeline's echo conventions (not text changes): "the LORD" -> "Yahuah (LORD)"; "Holy Ghost" -> "Ruach HaKodesh (Holy Spirit)"; NT Melchisedec -> (Melchizedek)
    s=re.sub(r"\bthe (lord|god)\b",r"\1",s); s=s.replace('holy ghost','holy spirit'); s=re.sub(r'melchisedec|melchizedec|melchisedech','melchizedek',s)
    s=re.sub(r"[‘’'“”\"\-–—.,:;!?()\[\]]",' ',s)
    return re.sub(r'\s+',' ',s).strip()
R=lambda a,b: difflib.SequenceMatcher(None,a,b,autojunk=False).ratio()
rows=["| book | KJV vv | app vv | identical | differs (read) | yoshi-rendering | missing | extra |","|---|---|---|---|---|---|---|---|"]
tot=dict(base=0,app=0,ident=0,diff=0,yoshi=0,missing=0,extra=0); log=[]; ylog=[]; detail={}
for bk in base['books']:
    bid=bk['app_book_id']; ident=diff=yoshi=0; miss=[]; extra=[]; notes=[]
    achs=A.get(bid,{})
    for c,bvs in bk['chapters'].items():
        c=int(c); av=achs.get(c,{})
        bvs={int(k):t for k,t in bvs.items()}
        for v in sorted(set(bvs)-set(av)): miss.append(f"{c}:{v}")
        for v in sorted(set(av)-set(bvs)): extra.append(f"{c}:{v}")
        for v in sorted(set(bvs)&set(av)):
            b=norm(restore_base(bvs[v])); a=norm(unrestore(av[v]['text']))
            if a==b: ident+=1; continue
            r=R(b,a); d=' '.join(t for t in difflib.ndiff(b.split(),a.split()) if t[0] in '+-')
            entry=f"{bid} {c}:{v}  ratio={r:.3f}\n  KJV: {bvs[v]}\n  APP: {av[v]['text']}\n  DIFF: {d}\n"
            if av[v].get('source_type')=='yoshi-rendering': yoshi+=1; ylog.append(entry)
            else: diff+=1; log.append(entry); notes.append(f"{c}:{v} ({r:.2f}) {d[:120]}")
    for c in set(achs)-set(int(k) for k in bk['chapters']): extra.append(f"ch {c} ({len(achs[c])} vv)")
    nb=sum(len(v) for v in bk['chapters'].values()); na=sum(len(v) for v in achs.values())
    rows.append(f"| {bid} | {nb} | {na} | {ident} | {diff} | {yoshi} | {len(miss)} {' '.join(miss[:6])} | {len(extra)} {' '.join(extra[:6])} |")
    for k,x in zip(tot,(nb,na,ident,diff,yoshi,len(miss),len(extra))): tot[k]+=x
    if notes: detail[bid]=notes
md=("# Canon (KJV) damage table — S455\n\nBase: eBible eng-kjv_usfx.xml (KJV 1769 Blayney, public domain). App: parsed/canon.json (= live DB).\n"
    "Restored names mapped back to the KJV words they echo before comparing; 'differs (read)' = every verse whose words differ from the KJV after that and that Yoshi did NOT render on purpose — each one is read at word level in canon-worddiff.log. 'yoshi-rendering' = verses marked as his deliberate rendering (canon-yoshi-renderings.log).\n\n"
    +'\n'.join(rows)+f"\n\n**Totals:** {tot}\n")
open('canon-damage-table.md','w').write(md); open('canon-worddiff.log','w').write('\n'.join(log)); open('canon-yoshi-renderings.log','w').write('\n'.join(ylog))
json.dump(detail,open('canon-diff-detail.json','w'),indent=1,ensure_ascii=False); print(md)
