"""S453 — remove the sacred-texts footnote digits and marker remnants the published
Jubilees text inherited from its source (26 lone numbers found; 2 are real numbers and stay).
Edits jubilees.fixed.json AND Jubilees-Restored-Names-Edition.fixed.txt; every edit asserted."""
import json,re
J='jubilees.fixed.json'; T='Jubilees-Restored-Names-Edition.fixed.txt'
d=json.load(open(J)); chs=d['books'][0]['chapters']; txt=open(T,encoding='utf-8').read()
V={(c['number'],v['number']):v for c in chs for v in c['verses']}
KEEP={(10,21),(48,14)}   # "5433 cubits and 2 palms", "1,000,000" — real numbers
def tx(c,v,old,new,count=1,tnew=None):
    """replace in the verse text and the SAME string in the txt verse body (whitespace-flexible)."""
    t=V[(c,v)]['text']; assert t.count(old)==count,(c,v,old,t.count(old)); V[(c,v)]['text']=t.replace(old,new).strip()
    pat=r'\s+'.join(re.escape(w) for w in old.split()); 
    global txt
    ms=list(re.finditer(pat,txt)); assert len(ms)>=1,(c,v,old)
    # keep the line-wrap: substitute new, re-using the first whitespace char found
    m=ms[0]; txt=txt[:m.start()]+(new if tnew is None else tnew)+txt[m.end():]
log=[]
# 1. trailing marker remnants on the first piece: "... 2 18." -> drop "2 18."; "...11" (13:12); "...25…" (13:24 -> dots open 13:25)
tx(17,17,' 2 18.','',tnew=' 18.'); log.append('17:17 stray "2" + marker remnant "18." removed from the verse (txt keeps the 18. marker)')
tx(19,9,' 1 10.','',tnew=' 10.'); log.append('19:9 stray "1" + marker remnant "10." removed')
tx(40,10,' 3 11.','',tnew=' 11.'); log.append('40:10 stray "3" + remnant "11." removed')
tx(45,15,' 3 16.','',tnew=' 16.'); log.append('45:15 stray "3" + remnant "16." removed')
tx(46,10,' 1. 11.','',tnew=' 11.'); log.append('46:10 stray "1." + remnant "11." removed')
tx(13,12,' 11',''); log.append('13:12 remnant "11" (source typo for 13) removed')
tx(22,20,' 21,',''); log.append('22:20 remnant "21," removed')
t=V[(13,24)]['text']; assert t.endswith('servants. 25………….'),t[-30:]
V[(13,24)]['text']=t[:-len(' 25………….')]; V[(13,25)]['text']='…………. '+V[(13,25)]['text']
i=txt.find('servants. 25………….'); assert i>0; txt=txt[:i]+'servants. '+txt[i+len('servants. 25………….'):]
i=txt.find('25. for Abram, and for his seed'); assert i>0; txt=txt[:i]+'25. …………. for Abram, and for his seed'+txt[i+len('25. for Abram, and for his seed'):]
log.append('13:24 remnant "25" removed; the lacuna dots now open 13:25 (as Charles prints them)')
# 2. stray footnote digits inside verses
for (c,v,old,new) in [(10,17,' world, 1 so',' world, so'),(13,5,' mountain… 3 Bethel',' mountain… Bethel'),(17,16,'Mastêmâ 1 came','Mastêmâ came'),
    (28,26,'wages 1, and','wages, and'),(28,27,'white, 2 (these)','white, (these)'),(28,28,'marked, 3 and','marked, and'),(28,29,'sheep 4 and','sheep and'),
    (40,9,'Satan 1 and','Satan and'),(40,10,'Sĕphânṭîphâns, 2 and','Sĕphânṭîphâns, and'),(45,14,'everything 1 that','everything that'),(45,14,'portions 2 in','portions in'),
    (45,16,'this day. 4','this day.'),(46,14,'strong 2 cities','strong cities'),(49,21,'cities, 1 nor','cities, nor'),(49,22,'and 2 the festival','and the festival'),
    (49,23,'haste 3 when','haste when'),(49,23,'Shur; 4 for','Shur; for')]:
    tx(c,v,old,new); log.append(f'{c}:{v} stray footnote digit removed: "{old}" -> "{new}"')

# 4. json-only remnants (the txt marker was already corrected by fix_txt.py)
for (c,v,old) in [(3,22,' 32.'),(25,9,' 19.')]:
    t=V[(c,v)]['text']; assert t.endswith(old),(c,v,t[-20:]); V[(c,v)]['text']=t[:-len(old)].strip(); log.append(f'{c}:{v} typo-marker remnant "{old.strip()}" removed')
# 5. markers the txt printed without a period (the app parser coped; make the txt regular)
for old,new in [(r'rooted out\. 15(\s+)And He gave',r'rooted out. 15.\1And He gave'),(r'Mê’at\. 9(\s+)And for Madai',r'Mê’at. 9.\1And for Madai')]:
    assert len(re.findall(old,txt))==1,old; txt=re.sub(old,new,txt); log.append(f'txt marker regularised: {old}')
# 6. 17:2/17:3 — the stray footnote "3" after "his sons" was taken as the verse marker; Charles: v.2 ends "...and had not died childless." and v.3 begins "And he remembered"
t2=V[(17,2)]['text']; t3=V[(17,3)]['text']; assert t2.endswith('seen his sons') and t3.startswith('and had not died childless. . And he remembered'),(t2[-30:],t3[:60])
V[(17,2)]['text']=t2+' and had not died childless.'; V[(17,3)]['text']=t3[len('and had not died childless. . '):]
m=re.search(r'seen his sons 3\s+and had not died childless\. \. And he remembered',txt); assert m
txt=txt[:m.start()]+'seen his sons\nand had not died childless. 3. And he remembered'+txt[m.end():]
log.append('17:2/17:3 split moved to where Charles has it; stray "3" removed')
# 3. nothing left
left=[(c,v,V[(c,v)]['text'][max(0,m.start()-20):m.end()+10]) for (c,v) in V for m in re.finditer(r'(?<![\w:.,])(\d{1,2})(?![\w:,])',V[(c,v)]['text']) if (c,v) not in KEEP]
assert not left, left
json.dump(d,open(J,'w'),ensure_ascii=False,indent=2); open(T,'w',encoding='utf-8').write(txt)
print('\n'.join(log)); print(len(log),'edits')
