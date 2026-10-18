#!/usr/bin/env python3
"""S449 step F — every '1 Enoch c:v' citation on the Desktop (md/txt/html/srt/docx) and every
live cross-reference touching Enoch, graded by what happened to that verse in the rebuild."""
import re,json,os,zipfile,csv,html,sys
from pathlib import Path
D=Path.home()/'mnt/Desktop'; HERE=D/'App/source-texts/enoch-charles-1917'
status=json.load(open(HERE/'enoch-verse-status.json'))
old={ (int(c['number']),int(v['number'])):v['text'] for c in json.load(open(D/'App/source-texts/parsed/enoch.json.pre-s449'))['books'][0]['chapters'] for v in c['verses']}
new={ (int(c['number']),int(v['number'])):v['text'] for c in json.load(open(D/'App/source-texts/parsed/enoch.json'))['books'][0]['chapters'] for v in c['verses']}
PAT=re.compile(r'\b(?:1\s?)?Enoch\s+(\d{1,3}):(\d{1,3})(?:[–-](\d{1,3}))?',re.I)
SKIP=('App/source-texts','App/_scratch','App/node_modules','App/app/','App/.claude','_book_backups','App/scratch_','App/audio','App/tts','App/data-schema','App/api','App/restoration-pipeline','App/commentaries/_','Claude - Saved Docs','.git')
hits=[]
def grade(c,v):
    return status.get(f"{c}:{v}", 'not-in-either')
def scan_text(path,text):
    for m in PAT.finditer(text):
        c,v,v2=int(m.group(1)),int(m.group(2)),m.group(3)
        rng=range(v,int(v2)+1) if v2 else [v]
        g=[grade(c,x) for x in rng]
        worst=max(g,key=lambda s:['same','reworded','different','removed','new','not-in-either'].index(s))
        hits.append((str(path.relative_to(D)),f"{c}:{v}"+(f"-{v2}" if v2 else ""),worst))
for p in D.rglob('*'):
    rp=str(p.relative_to(D))
    if any(s in rp for s in SKIP) or not p.is_file(): continue
    try:
        if p.suffix.lower() in ('.md','.txt','.html','.srt','.json' if False else '.md'):
            scan_text(p,p.read_text(encoding='utf-8',errors='ignore'))
        elif p.suffix.lower() in ('.txt','.html','.srt'):
            scan_text(p,p.read_text(encoding='utf-8',errors='ignore'))
        elif p.suffix.lower()=='.docx':
            with zipfile.ZipFile(p) as z:
                xml=z.read('word/document.xml').decode('utf-8','ignore')
            scan_text(p,html.unescape(re.sub(r'<[^>]+>','',xml)))
    except Exception as e: pass
# live cards (remaining after 449c = not in retired list)
retired={l.split('\t')[0] for l in open(HERE/'enoch-xrefs-retired.tsv',encoding='utf-8').read().split('\n')[1:] if l}
plan=json.load(open(HERE/'enoch-xref-plan.json')); moved={r[0] for r in plan['repoint']}
cards=[]
for r in csv.DictReader(open(HERE/'enoch-xrefs-live.tsv',encoding='utf-8'),delimiter='\t'):
    if r['xref_id'] in retired: continue
    refs=[x for x in (r['source'],r['target']) if x.startswith('1-enoch ')]
    gs=[]
    for x in refs:
        c,v=x.split(' ')[1].split(':'); gs.append(grade(int(c),int(v)))
    worst=max(gs,key=lambda s:['same','reworded','different','removed','new','not-in-either'].index(s)) if gs else 'same'
    if r['xref_id'] in moved: worst='moved'
    cards.append((r['xref_id'],r['source'],r['target'],worst))
from collections import Counter
fc=Counter(h[2] for h in hits); cc=Counter(c[3] for c in cards)
with open(HERE/'enoch-citation-sweep.md','w',encoding='utf-8') as f:
    f.write("# 1 Enoch citation sweep after the S449 rebuild\n\nGrades: **same** = the verse reads as before (names aside) — citation stands; **reworded** = same verse, wording changed 15–45% — re-quote; **different** = that chapter:verse now carries other text — the citation points at the wrong words, find the true verse; **removed** = that verse number no longer exists in 1 Enoch; **moved** = card re-pointed by 449c (note citation rewritten; wording needs a read).\n\n")
    f.write(f"## Files on the Desktop — {len(hits)} citations: {dict(fc)}\n\n| file | cites | grade | old text (first 90) | new text at that address |\n|---|---|---|---|---|\n")
    for fn,ref,g in sorted(hits,key=lambda h:(['different','removed','reworded','same','not-in-either','new'].index(h[2]),h[0])):
        c,v=ref.split('-')[0].split(':'); k=(int(c),int(v))
        f.write(f"| {fn} | {ref} | {g} | {old.get(k,'—')[:90]} | {new.get(k,'—')[:90]} |\n")
    f.write(f"\n## Live cross-reference cards touching Enoch — {len(cards)}: {dict(cc)}\n\nFull list: enoch-xrefs-live.tsv (minus enoch-xrefs-retired.tsv). Cards graded **different**/**reworded** quote the OLD verse in their note and need a content pass in a later session (the notes carry your voice — not mechanical).\n\n")
    for g in ('different','reworded','moved'):
        f.write(f"### {g} ({cc.get(g,0)})\n")
        for x in [c for c in cards if c[3]==g][:400]: f.write(f"- #{x[0]} {x[1]} → {x[2]}\n")
        f.write("\n")
print("files:",dict(fc)); print("cards:",dict(cc))
print("\nfiles with 'different' or 'removed' citations:")
for fn,ref,g in hits:
    if g in ('different','removed'): print(f"  {g:9s} {ref:9s} {fn}")
