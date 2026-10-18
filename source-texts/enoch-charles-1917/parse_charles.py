#!/usr/bin/env python3
"""S449 — parse the sacred-texts.com R.H. Charles 1917 chapter pages
(enoch-charles-1917.json, fetched through the browser pane) into one clean
text file, one verse per line:  N:V text.  Chapter from the CHAPTER heading,
never from the page number."""
import json, re, html, sys
from pathlib import Path

HERE = Path(__file__).parent
data = json.load(open(HERE / "enoch-charles-1917.json", encoding="utf-8"))
ROMAN = {'i':1,'v':5,'x':10,'l':50,'c':100}
def roman(s):
    s=s.lower(); t=0
    for i,ch in enumerate(s):
        v=ROMAN[ch]
        if i+1<len(s) and ROMAN[s[i+1]]>v: t-=v
        else: t+=v
    return t

def clean(h):
    h = re.sub(r'<!--.*?-->', '', h, flags=re.S)
    h = re.sub(r'<a>\s*p\.\s*\d+\s*</a>', '', h)                 # page markers
    h = re.sub(r'<span>\[paragraph continues\]</span>', '', h)
    h = re.sub(r'<sup>.*?</sup>', '', h)
    h = re.sub(r'<br\s*/?>', '\n', h)
    h = re.sub(r'</p>|</td>|</tr>|</table>|</h\d>', '\n', h)
    h = re.sub(r'<[^>]+>', '', h)
    h = html.unescape(h)
    h = h.replace(' ', ' ')
    return h

out_lines = []
report = {}
notes = []
for slug in data["slugs"]:
    h = data["pages"][slug]
    # chapter number from the CHAPTER heading
    m = re.search(r'<h3>\s*CHAPTER\s+([IVXLC]+)\.?\s*</h3>', h, flags=re.I)
    if not m:
        notes.append(f"{slug}: no CHAPTER heading"); continue
    ch = roman(m.group(1))
    slug_ch = roman(re.sub(r'-\d+$','',slug.replace('chapter-','')))
    if ch in report and slug_ch != ch:
        notes.append(f"{slug}: heading says CHAPTER {ch} but that chapter is already parsed; using slug number {slug_ch} (sacred-texts heading typo)")
        ch = slug_ch
    body = h[m.end():]
    # ch 22 / 27 carry Ethiopic (E) and Greek (G^g) parallel columns: keep E, drop G^g
    txt = clean(body)
    lines = [l.strip() for l in txt.split('\n')]
    lines = [l for l in lines if l and l not in ('E','G','Gg')]
    txt = '\n'.join(lines)
    # transcription typos on verse numbers: 'l.' for '1.', '1 .' for '1.', '[1.' bracket
    txt = re.sub(r'^\[?(l|1)\s?\.\s*', '1. ', txt)
    txt = re.sub(r'(?m)^\[(\d{1,3})\.', r'\1.', txt)
    # drop the G^g duplicate blocks for 22 and 27 (they begin after a line 'G' marker)
    # handled below by verse-sequence: a repeated verse number restarts; we keep first occurrence
    # verse split: "N." anywhere, or "N " at line start; sequence-aware
    verses = {}
    cur = None; buf = []
    expected = 1 if ch not in report else 0
    tokens = re.split(r'(?:(?<=\s)|^)(\d{1,3})(?:[a-j]?\.|(?=\s)(?<=\n\d)|(?=\s)(?<=\n\d\d))\s', txt)
    # simpler robust approach: iterate matches
    pos = 0
    pieces = []
    for mm in re.finditer(r'^(\d{1,3})\s+(?=[A-Z⌈\[(\'"†〈])|(?:(?<=\s)|^)(\d{1,3})[a-j]?\.\s', txt, flags=re.M):
        n = int(mm.group(1) or mm.group(2))
        if expected == 0:
            if n < 2 or n > 40: continue
        elif n < expected or n > expected + 3:   # not a verse number (e.g. 364 days)
            continue
        pieces.append((n, mm.start(), mm.end()))
        expected = n + 1
    for i,(n,s,e) in enumerate(pieces):
        end = pieces[i+1][1] if i+1 < len(pieces) else len(txt)
        text = txt[e:end]
        text = re.sub(r'\s+', ' ', text).strip()
        if n in verses:
            verses[n] += ' ' + text
        else:
            verses[n] = text
    if pieces and pieces[0][1] > 0:
        pre = re.sub(r'\s+',' ', txt[:pieces[0][1]]).strip()
        if pre: notes.append(f"ch {ch} ({slug}): text before first verse number: {pre[:80]!r}")
    if not pieces:
        text = re.sub(r'\s+',' ', txt).strip()
        verses[1] = text
        notes.append(f"ch {ch} ({slug}): no verse numbers; whole chapter as v1")
    key = ch
    if key in report:   # chapter 91 is split over two pages
        prev = report[key]
        for n,t in verses.items():
            out_lines.append((ch, n, t))
        report[key] = prev + len(verses)
        notes.append(f"ch {ch}: second page {slug} added verses {sorted(verses)}")
    else:
        for n in sorted(verses):
            out_lines.append((ch, n, verses[n]))
        report[key] = len(verses)
    nums = sorted(verses)
    gaps = [x for x in range(1, max(nums)+1) if x not in verses] if nums else []
    if gaps: notes.append(f"ch {ch}: verse numbers absent in source transcription: {gaps} (text stays with preceding verse)")

out_lines.sort(key=lambda t:(t[0],t[1]))
with open(HERE / "enoch-charles-1917.txt", "w", encoding="utf-8") as f:
    f.write("THE BOOK OF ENOCH — R.H. Charles 1917 (sacred-texts.com transcription)\n")
    f.write("One verse per line, chapter:verse, chapters from the CHAPTER headings.\n\n")
    last = None
    for ch, n, t in out_lines:
        if ch != last:
            f.write(f"\nCHAPTER {ch}\n"); last = ch
        f.write(f"{ch}:{n} {t}\n")
json.dump({"verse_counts": report, "notes": notes}, open(HERE / "enoch-charles-1917.counts.json","w"), indent=1)
print("chapters:", len(report), " verses:", sum(report.values()))
print("counts:", ' '.join(f"{c}={report[c]}" for c in sorted(report)))
print("\nNOTES:"); print('\n'.join(notes))
