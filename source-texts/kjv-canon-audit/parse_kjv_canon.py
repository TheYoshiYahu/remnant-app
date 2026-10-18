"""S455 — parse the 66 canon books out of eBible's eng-kjv_usfx.xml (local, public domain; KJV 1769 Blayney text).
Template: source-texts/apocrypha-kjv-ebible/parse_kjv_apoc.py. Output: kjv-canon.json {books:[{usfx, app_book_id, chapters:{c:{v:text}}, titles:{c:psalm-superscription}}]}
+ kjv-canon.txt (one verse per line). Psalm superscriptions (<d>) are kept separately — the KJV prints them as unnumbered text before v.1."""
import re,json,html,sys
X=open(sys.argv[1],encoding='utf-8').read()
BOOKS=[('GEN','genesis'),('EXO','exodus'),('LEV','leviticus'),('NUM','numbers'),('DEU','deuteronomy'),('JOS','joshua'),('JDG','judges'),('RUT','ruth'),
('1SA','1-samuel'),('2SA','2-samuel'),('1KI','1-kings'),('2KI','2-kings'),('1CH','1-chronicles'),('2CH','2-chronicles'),('EZR','ezra'),('NEH','nehemiah'),('EST','esther'),
('JOB','job'),('PSA','psalms'),('PRO','proverbs'),('ECC','ecclesiastes'),('SNG','song-of-solomon'),('ISA','isaiah'),('JER','jeremiah'),('LAM','lamentations'),('EZK','ezekiel'),
('DAN','daniel'),('HOS','hosea'),('JOL','joel'),('AMO','amos'),('OBA','obadiah'),('JON','jonah'),('MIC','micah'),('NAM','nahum'),('HAB','habakkuk'),('ZEP','zephaniah'),
('HAG','haggai'),('ZEC','zechariah'),('MAL','malachi'),('MAT','matthew'),('MRK','mark'),('LUK','luke'),('JHN','john'),('ACT','acts'),('ROM','romans'),('1CO','1-corinthians'),
('2CO','2-corinthians'),('GAL','galatians'),('EPH','ephesians'),('PHP','philippians'),('COL','colossians'),('1TH','1-thessalonians'),('2TH','2-thessalonians'),('1TI','1-timothy'),
('2TI','2-timothy'),('TIT','titus'),('PHM','philemon'),('HEB','hebrews'),('JAS','james'),('1PE','1-peter'),('2PE','2-peter'),('1JN','1-john'),('2JN','2-john'),('3JN','3-john'),
('JUD','jude'),('REV','revelation')]
def clean(s):
    s=re.sub(r'<f .*?</f>','',s,flags=re.S)                     # footnotes
    s=re.sub(r'<x .*?</x>','',s,flags=re.S)                     # cross refs
    s=re.sub(r'<(s|mt|r|d)\b[^>]*>.*?</\1>','',s,flags=re.S)    # section heads / superscriptions inside a verse span
    s=re.sub(r'</?w\b[^>]*>','',s)                             # eBible <w> tags split words ("He tha</w>t") — remove without a space
    s=re.sub(r'<[^>]+>',' ',s); s=html.unescape(s)
    s=re.sub(r'\s+([,.;:!?])',r'\1',s)                          # eBible puts the <w> break before punctuation
    return re.sub(r'\s+',' ',s).strip()
out=[]; lines=[]; tot=0
for bid,app in BOOKS:
    i=X.index(f'<book id="{bid}"'); j=X.index('</book>',i); seg=X[i:j]
    chs={}; titles={}
    for cm in re.finditer(r'<c id="(\d+)"\s*/>(.*?)(?=<c id="\d+"\s*/>|$)',seg,flags=re.S):
        c=int(cm.group(1)); body=cm.group(2); vs={}
        dm=re.search(r'<d\b[^>]*>(.*?)</d>',body,flags=re.S)
        if dm: titles[c]=clean(dm.group(1))
        for vm in re.finditer(r'<v id="(\d+)"[^>]*/>(.*?)<ve\s*/>',body,flags=re.S):
            v=int(vm.group(1)); t=clean(vm.group(2))
            assert v not in vs,(bid,c,v); vs[v]=t; lines.append(f"{app} {c}:{v} {t}")
        chs[c]=vs
    n=sum(len(v) for v in chs.values()); tot+=n
    out.append(dict(usfx=bid,app_book_id=app,chapters=chs,titles=titles))
    print(f"{app:18} ch={len(chs):3} vv={n:5}")
json.dump(dict(source='eBible.org eng-kjv_usfx.xml (KJV 1769 Blayney, public domain)',books=out),open('kjv-canon.json','w'),indent=0,ensure_ascii=False)
open('kjv-canon.txt','w').write('\n'.join(lines)+'\n')
print('total verses',tot,'(KJV = 31,102)')
