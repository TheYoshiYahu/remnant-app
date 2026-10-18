#!/usr/bin/env python3
"""S450 step C — surgical fix of Jasher-Restored-Names-Edition.txt.

The S450 content audit (jasher-damage-table.md, worddiff-txt.log) found the
published Jasher text FAITHFUL to Noah 1840 on all 3,910 verses — no invented
verses, nothing misplaced — so there is nothing to rebuild through restore.py.
What it carries is scrape debris and a handful of slips, fixed here in place:

  1. 90 stray "«" lines after the last verse of a chapter (the sacred-texts
     page-navigation glyph, scraped into the book) — removed.
  2. Printed page numbers glued to a verse: 7:18 "…men. 15", 9:7 "…stone. 20",
     20:13 "…sword? 52" — removed. (These are what made the app parser merge
     7:19–51, 9:8–39 and 20:14–30 into the preceding verse: 85 verses lost.)
  3. 91:17 trailing "THE END" — removed (the book's own ending stays Jasher's).
  4. "from from there" (a double "from" left when "from thence" was
     modernized) at 24:31, 24:34, 34:69, 44:52, 45:9, 80:62 — "from there".
  5. 12:35 "The Elohim of heaven in whom I trust" — 1840 reads "The God of
     heaven and earth": restored as "The Elohim (God) of heaven and earth".
  6. 47:5 "the Elohim (God) of my fathers bless you" — 1840: "your fathers".
  7. 78:10 "the Elohim (God) of your fathers was my help" — 1840: "my fathers".
  8. "the El Shaddai (Almighty God)" at 2:24, 29:28, 52:23 — the article was
     left in front of the Hebrew name: "El Shaddai (the Almighty God)".
  10. 23:63 "the will of the Yahuah our Elohim" — stray article removed (the
     app JSON already had this right since S69; the text file had drifted).
  9. Chapter titles that wrapped onto a second line are joined onto the
     heading line, so the app parser (which drops the continuation) keeps
     the whole title — e.g. "…the First Blood on the Ground".

usage: fix_edition.py <in.txt> <out.txt>
Every edit is counted and asserted, so a silent miss fails loudly.
"""
import re, sys
from pathlib import Path

src = Path(sys.argv[1]); dst = Path(sys.argv[2])
t = src.read_text(encoding='utf-8')
report = []

def sub(pat, rep, expect, label, flags=0):
    global t
    t, n = re.subn(pat, rep, t, flags=flags)
    report.append(f"{label}: {n}")
    assert n == expect, f"{label}: expected {expect} edits, made {n}"


def phrase(old, new, expect, label):
    """Replace a phrase even when the file wraps it across lines (pandoc wraps at
    72 cols with a 4-space indent). The line break is kept at the same word
    position so the file stays readable."""
    global t
    words = old.split(' ')
    pat = re.compile(r'(?<![A-Za-z])' + r'(\s+)'.join(re.escape(w) for w in words) + r'(?![A-Za-z])')
    n = 0
    def rep(m):
        nonlocal n; n += 1
        seps = [m.group(i) for i in range(1, len(words))]
        nw = new.split(' ')
        out = [nw[0]]
        for i, w in enumerate(nw[1:]):
            sep = seps[i] if i < len(seps) else ' '
            out.append(sep + w)
        return ''.join(out)
    t = pat.sub(rep, t)
    report.append(f"{label}: {n}")
    assert n == expect, f"{label}: expected {expect} edits, made {n}"

# 1. stray « lines (standalone line, surrounded by blank lines)
sub(r'\n\n«\n', '\n', 90, '1. stray « lines removed')
# 2. page numbers
sub(r'(about three hundred men\.\n)\n15\n', r'\1', 1, '2. page number after 7:18')
sub(r'(gods of wood and stone\.\n)\n20\n', r'\1', 1, '2. page number after 9:7')
sub(r'(slay me with your sword\?\n)\n52\n', r'\1', 1, '2. page number after 20:13')
# 3. THE END
sub(r'(be of good courage\.) THE END\n', r'\1\n', 1, '3. THE END after 91:17')
# 4. from from there
phrase('from from there', 'from there', 6, '4. "from from there"')
# 5. 12:35
phrase('The Elohim of heaven in whom I trust', 'The Elohim (God) of heaven and earth in whom I trust', 1, '5. 12:35 "and earth" restored')
# 6. 47:5
phrase('May the Elohim (God) of my fathers bless you and increase', 'May the Elohim (God) of your fathers bless you and increase', 1, '6. 47:5 your fathers')
# 7. 78:10
phrase('Because the Elohim (God) of your fathers was my help', 'Because the Elohim (God) of my fathers was my help', 1, '7. 78:10 my fathers')
# 8. the El Shaddai
phrase('the El Shaddai (Almighty God)', 'El Shaddai (the Almighty God)', 3, '8. "the El Shaddai"')
# 10. 23:63 stray "the" before the Name: "the will of the Yahuah our Elohim"
#     (the app's JSON was already corrected in S69; the text file was not)
phrase('the will of the Yahuah our Elohim', 'the will of Yahuah our Elohim', 1, '10. 23:63 stray "the"')
# 9. wrapped chapter titles: "Chapter N: first line\nsecond line\n\n1.  "
def join_title(m):
    return f"Chapter {m.group(1)}: {m.group(2).strip()} {m.group(3).strip()}\n\n"
t, n9 = re.subn(r'(?m)^Chapter (\d+): (.+)\n([^\n]+)\n\n(?=1\.  )', join_title, t)
report.append(f"9. wrapped chapter titles joined: {n9}")
assert n9 > 0

dst.write_text(t, encoding='utf-8')
print('\n'.join(report))
print(f"wrote {dst} ({len(t):,} chars; was {len(src.read_text(encoding='utf-8')):,})")
