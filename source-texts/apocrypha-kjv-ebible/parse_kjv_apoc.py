"""S454 — parse the 14 KJV 1611 Apocrypha books out of eBible's eng-kjv_usfx.xml (local, public domain).
Output: apocrypha-kjv-ebible.json {books:[{usfx, app_book_id, title, chapters:{c:{v:text}}}]} + .txt (one verse per line)."""
import re,json,html
X=open('../kjv/eng-kjv_usfx.xml',encoding='utf-8').read()
BOOKS=[('1ES','1-esdras'),('2ES','2-esdras'),('TOB','tobit'),('JDT','judith'),('ESG','the-rest-of-esther'),
 ('WIS','the-wisdom-of-solomon'),('SIR','ecclesiasticus'),('BAR','baruch-with-the-letter-of-jeremiah'),
 ('S3Y','the-song-of-the-three-holy-children'),('SUS','the-history-of-susanna'),('BEL','bel-and-the-dragon'),
 ('MAN','the-prayer-of-manasseh'),('1MA','1-maccabees'),('2MA','2-maccabees')]
def clean(s):
    s=re.sub(r'<f .*?</f>','',s,flags=re.S)          # footnotes
    s=re.sub(r'<x .*?</x>','',s,flags=re.S)          # cross refs
    s=re.sub(r'<(s|mt|d|r)\b[^>]*>.*?</\1>','',s,flags=re.S) # section heads inside verse spans
    s=re.sub(r'<[^>]+>',' ',s); s=html.unescape(s)
    return re.sub(r'\s+',' ',s).strip()
out=[]; lines=[]
for bid,app in BOOKS:
    i=X.index(f'<book id="{bid}"'); j=X.index('</book>',i); seg=X[i:j]
    m=re.search(r"<p sfm=\"mt\"[^>]*>(.*?)</p>",seg,flags=re.S); title=(m.group(1) if m else re.search(r"<h>(.*?)</h>",seg,flags=re.S).group(1)).strip()
    chs={}
    for cm in re.finditer(r'<c id="(\d+)"\s*/>(.*?)(?=<c id="\d+"\s*/>|$)',seg,flags=re.S):
        c=int(cm.group(1)); body=cm.group(2); vs={}
        for vm in re.finditer(r'<v id="(\d+)"[^>]*/>(.*?)<ve\s*/>',body,flags=re.S):
            v=int(vm.group(1)); t=clean(vm.group(2))
            assert v not in vs,(bid,c,v); vs[v]=t; lines.append(f"{app} {c}:{v} {t}")
        chs[c]=vs
    out.append(dict(usfx=bid,app_book_id=app,title=title,chapters=chs))
    print(f"{app:38} ch={len(chs):3} vv={sum(len(v) for v in chs.values()):5} | "+' '.join(f"{c}:{len(v)}" for c,v in chs.items()))
json.dump(dict(source='eBible.org eng-kjv_usfx.xml (KJV 1611 with Apocrypha, public domain)',books=out),open('apocrypha-kjv-ebible.json','w'),indent=0,ensure_ascii=False)
open('apocrypha-kjv-ebible.txt','w').write('\n'.join(lines)+'\n')
print('total verses',len(lines))
