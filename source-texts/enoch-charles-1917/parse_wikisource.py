#!/usr/bin/env python3
"""S449 — parse enoch-wikisource-charles-1917.raw.txt (Charles 1917 via
Wikisource) into N:V one-verse-per-line.  Section titles (e.g. 'VI-XI. The Fall
of the Angels...') are kept aside as section headings, not verses."""
import re, json
from pathlib import Path
HERE=Path(__file__).parent
raw=open(HERE/'enoch-wikisource-charles-1917.raw.txt',encoding='utf-8').read()
chunks=re.split(r'(?m)^CHAPTER (\d+)\s*$', raw)
out=[]; counts={}; notes=[]; sections={}
for i in range(1,len(chunks),2):
    ch=int(chunks[i]); body=chunks[i+1]
    lines=[]
    for l in body.split('\n'):
        s=l.strip()
        if not s: lines.append(''); continue
        if ch==106 and s.startswith('1 Factum est'): break   # Latin fragment follows the English
        if s in ('Ethiopic','Greek'): continue                   # parallel-column markers (22, 27, 32, 89)
        if s.startswith('Greek fragment from Vatican') or re.search(r'[\u0370-\u03ff]', s): continue  # Greek-language fragment (89)
        if (re.match(r'^(Section [IVX]+\.|Introduction$|The Parables\.|Book of Noah|Fragment of the Book|Latin Fragment|The Book of the Heavenly|The Dream-Visions|A Book of Exhortation|Ethiopic$|Greek$)', s)
            or re.match(r'^[IVXLC]+(\.|[-–—,])', s)):
            sections.setdefault(ch,[]).append(s); continue
        lines.append(s)
    txt='\n'.join(lines)
    pieces=[]; seen=set(); hi=0
    for mm in re.finditer(r'(?:(?<=\s)|^)(\d{1,3})[a-j]?\.\s', txt):
        n=int(mm.group(1))
        if n>hi+4:
            # Charles prints some verses out of order (51:5a, 60:25, 106:17). Accept an
            # unseen number only when it is a real marker: 'N. ' followed by a capital.
            after=txt[mm.end():mm.end()+1]
            if n in seen or n>90 or not after.isupper(): continue
            notes.append(f"ch {ch}: out-of-order verse marker {n} accepted after verse {hi}")
        pieces.append((n,mm.start(),mm.end())); seen.add(n); hi=max(hi,n)
    verses={}; dup=[]
    for k,(n,s,e) in enumerate(pieces):
        end=pieces[k+1][1] if k+1<len(pieces) else len(txt)
        t=re.sub(r'\s+',' ',txt[e:end]).strip()
        t=re.sub(r'(?:(?<=\s)|^)[a-j]\.\s', '', t)      # inner sub-verse letters (b. c. d.) once merged
        if n in verses:
            dup.append(n)
            if ch in (22,27,32): continue      # second occurrence = Greek column; keep the Ethiopic (first)
            verses[n]+=' '+t; continue          # lettered sub-verse (6a/6d, 48/48b): merge in printed order
        verses[n]=t
    if pieces and txt[:pieces[0][1]].strip():
        notes.append(f"ch {ch}: text before first verse: {txt[:pieces[0][1]].strip()[:70]!r}")
    if not pieces:
        verses[1]=re.sub(r'\s+',' ',txt).strip(); notes.append(f"ch {ch}: no verse numbers, whole chapter as v1")
    if dup: notes.append(f"ch {ch}: " + ("Greek-column duplicates dropped" if ch in (22,27,32) else "lettered sub-verses merged") + f" for verses {sorted(set(dup))}")
    gaps=[x for x in range(1,max(verses)+1) if x not in verses]
    if gaps: notes.append(f"ch {ch}: missing verse numbers {gaps}")
    counts[ch]=len(verses)
    for n in sorted(verses): out.append((ch,n,verses[n]))
with open(HERE/'enoch-wikisource-charles-1917.txt','w',encoding='utf-8') as f:
    f.write("THE BOOK OF ENOCH — R.H. Charles 1917 (Wikisource transcription)\nOne verse per line, chapter:verse.\n\n")
    last=None
    for ch,n,t in out:
        if ch!=last:
            f.write(f"\nCHAPTER {ch}\n")
            for s in sections.get(ch,[]): f.write(f"# {s}\n")
            last=ch
        f.write(f"{ch}:{n} {t}\n")
json.dump({'verse_counts':counts,'notes':notes,'sections':sections},open(HERE/'enoch-wikisource-charles-1917.counts.json','w'),indent=1)
print('chapters',len(counts),'verses',sum(counts.values()))
print('NOTES:'); print('\n'.join(notes))
