#!/usr/bin/env python3
"""Session 50: isolate the Box 1918 Apocalypse of Abraham translation body. (v3 - definitive)

The footnote apparatus in Box 1918 is long discursive scholarly commentary that
quotes scripture, so content-heuristics can't reliably separate it from the
narrative body. Instead: the page-header lines ARE reliable anchors, and the
footnote block is always the page suffix. Session 50 hand-verified the
body/footnote split for every page against the raw `pdftotext -layout` output.

BODY_RANGES below = inclusive raw line numbers of box_layout.txt that are
translation body (chapters I-XXXII). Everything else (running headers, page
folios, footnote apparatus, the post-text 'ADDITIONAL NOTES' section) is dropped.

Output: box_body.txt -- raw body lines only (still needs OCR cleanup + reflow)
"""

SRC = "box_layout.txt"

# (start, end) inclusive, raw 1-indexed line numbers of box_layout.txt
BODY_RANGES = [
    (1443, 1461),  # title page 35: title, genealogy, opening of ch I
    (1491, 1532),  # p36
    (1567, 1611),  # p37
    (1637, 1676),  # p38
    (1703, 1758),  # p39
    (1773, 1828),  # p40
    (1858, 1904),  # p41
    (1929, 1953),  # p42
    (1986, 2029),  # p43
    (2068, 2104),  # PART II opening page
    (2125, 2129),  # p44 (near-empty section-divider page)
    (2131, 2155),  # p45
    (2181, 2211),  # p46
    (2253, 2263),  # p47
    (2318, 2324),  # p48
    (2385, 2427),  # p49
    (2463, 2515),  # p50
    (2552, 2587),  # p51
    (2615, 2642),  # p52
    (2679, 2701),  # p53
    (2763, 2789),  # p54
    (2842, 2874),  # p55
    (2915, 2945),  # p56
    (2997, 3019),  # p57
    (3068, 3099),  # p58
    (3139, 3157),  # p59
    (3231, 3246),  # p60
    (3315, 3339),  # p61
    (3367, 3395),  # p62
    (3442, 3471),  # p63
    (3518, 3548),  # p64
    (3581, 3616),  # p65
    (3646, 3683),  # p66
    (3729, 3744),  # p67
    (3793, 3823),  # p68
    (3871, 3899),  # p69
    (3928, 3953),  # p70
    (4005, 4063),  # p71
    (4093, 4127),  # p72
    (4171, 4218),  # p73
    (4238, 4270),  # p74
    (4320, 4357),  # p75
    (4399, 4439),  # p76
    (4480, 4493),  # p77
    (4549, 4571),  # p78
    (4620, 4639),  # p79
    (4681, 4693),  # p80
    (4753, 4769),  # p81
    (4817, 4861),  # p82
    (4901, 4926),  # p83
    (5002, 5026),  # p84
    (5083, 5099),  # p85
    (5153, 5172),  # p86 (ends ch XXXII; line 5173 = 'ADDITIONAL NOTES', dropped)
]

with open(SRC, encoding="utf-8", errors="replace") as fh:
    all_lines = fh.read().split("\n")

out = []
for (a, b) in BODY_RANGES:
    for n in range(a, b + 1):
        out.append(all_lines[n - 1])

# collapse runs of 2+ blank lines to a single blank
clean = []
prev_blank = False
for ln in out:
    blank = (ln.strip() == "")
    if blank and prev_blank:
        continue
    clean.append(ln)
    prev_blank = blank

with open("box_body.txt", "w", encoding="utf-8") as fh:
    fh.write("\n".join(clean) + "\n")

nb = [l for l in clean if l.strip()]
print(f"body ranges          : {len(BODY_RANGES)}")
print(f"raw body lines        : {len(out)}")
print(f"after blank-collapse  : {len(clean)}")
print(f"non-blank body lines  : {len(nb)}")
