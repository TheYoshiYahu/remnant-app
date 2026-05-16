#!/usr/bin/env python3
"""Session 50: OCR-clean + reflow the Box 1918 Apocalypse of Abraham body.

Input : box_body.txt  (translation body only, footnotes/headers already stripped)
Output: box_chapters_draft.txt  (front matter + 32 chapters of reflowed prose)

This does the SAFE mechanical cleanup. Residual issues (multi-char floating
punctuation, ~dozen word-order scrambles from pdftotext -layout justified
lines, stray ref-quotes) are hand-fixed in the review pass that follows.

box_body.txt line numbers are stable (produced by extract_box_body.py v3).
"""
import re

# --- editorial section-heading line ranges to DROP (1-indexed, inclusive) ---
# identified by reading box_body.txt in full; every block ends in '(Chapter...)'
# except the book-title block (1-5).
HEADING_RANGES = [
    (1, 5),       # THE APOCALYPSE OF / ABRAHAM / PART I / The Legend... / Title
    (13, 14),     # Abraham's Conversion from Idolatry (Chapters I.-VIII.)
    (312, 316),   # The Apocalypse... / Abraham receives a Divine Command...
    (353, 356),   # Abraham, under the Direction of the Angel Jaoel...
    (482, 485),   # Abraham accomplishes the Sacrifice...
    (576, 577),   # Abraham and the Angel ascend...
    (615, 617),   # Abraham, taught by the Angel, utters the Celestial Song...
    (687, 688),   # Abraham's Vision of the Divine Throne
    (735, 736),   # God discloses to Abraham the Powers of Heaven
    (774, 774),   # The Promise of a Seed
    (805, 807),   # A Vision of Sin and Paradise...
    (838, 839),   # The Fall of Man and its Sequel
    (997, 997),   # Why Sin is permitted
    (1028, 1029), # A Vision of Judgement and Salvation
    (1081, 1081), # How long?
    (1196, 1197), # The Punishment of the Heathen and the Ingathering of Israel
    (1269, 1269), # Conclusion
]
FRONT_MATTER_RANGE = (6, 11)   # the incipit / genealogy superscription

# --- chapter marker: OCR-mangled roman numerals at line start ----------------
# maps the OCR'd token -> chapter number
CHAP_TOKENS = {
    "I": 1, "n": 2, "II": 2, "III": 3, "IV": 4, "V": 5, "VI": 6, "VII": 7,
    "Vni": 8, "VIII": 8, "VIIL": 8, "IX": 9, "X": 10, "XI": 11, "XIL": 12,
    "XII": 12, "XIII": 13, "XIV": 14, "XV": 15, "XVI": 16, "XVII": 17,
    "XVIII": 18, "XIX": 19, "XX": 20, "XXL": 21, "XXI": 21, "XXII": 22,
    "XXIII": 23, "XXIV": 24, "XXV": 25, "XXVI": 26, "XXVn": 27, "XXVII": 27,
    "XXVin": 28, "XXVIII": 28, "XXIX": 29, "XXX": 30, "XXXI": 31, "XXXII": 32,
}
# regex: optional indent, a token, a period, then (space|EOL|capital). For
# 'XI L' (=XII) and 'XI.And' we normalise first below.
CHAP_RE = re.compile(r"^\s{0,8}([A-Za-z]{1,6})\.\s*(.*)$")

# --- OCR word-fix map (whole-word / substring; applied to reflowed text) -----
OCR_SUBS = [
    # ligature / scan damage
    ("Abrahaffl", "Abraham"),
    ("inteUigence", "intelligence"),
    ("Uttleness", "littleness"),
    ("ashfes", "ashes"),
    ("tihe", "the"),
    ("fallenbackwards", "fallen backwards"),
    ("inmy heart", "in my heart"),
    ("itsmen", "its men"),
    ("beforemy", "before my"),
    ("ofthem", "of them"),
    ("theTemple", "the Temple"),
    ("distressinthe", "distress in the"),
    ("speakihg", "speaking"),
    ("lieight", "height"),
    ("terrestial", "terrestrial"),
    ("accomphshed", "accomplished"),
    ("mortahty", "mortality"),
    ("li^'ing", "living"),
    ("li\\'ing", "living"),
    ("\\'as", "was"),
    ("\\'ith", "with"),
    ("witlufhe", "with the"),
    ("iiery", "fiery"),
    ("IdIcss", "bless"),
    ("whoift-my", "whom my"),
    ("coining Age", "coming Age"),
    ("(t.e.Barisat)", "(i.e. Barisat)"),
    ("{i.e.", "(i.e."),
    ("{i. e.", "(i. e."),
    ("Usten", "listen"),
    ("hght", "light"),
    ("dwelhng", "dwelling"),
    ("dwelHng", "dwelling"),
    ("hfe", "life"),
    ("hoUness", "holiness"),
    ("re-modelled", "remodelled"),
    # archaic/long-s 'h'-for-'li' fixes that are safe as whole words
    (" hke ", " like "),
    (" Hke ", " like "),
    # genealogy (per Session 49 manifest OCR list)
    ("Roog (Reu )", "Reu"),
    ("Roog (Reu)", "Reu"),
    ("Tared", "Jared"),
    # OCR digit-for-letter
    ('"0 ', '"O '),
    ("0 Eternal", "O Eternal"),
    ("it is 1;", "it is I;"),
    ("becometh i day", "becometh a day"),
    # brace-for-paren
    ("{", "("), ("}", ")"),
    ("[sic)", "(sic)"),
    # spacing
    ("( ?)", "(?)"),
]


def is_chapter_line(stripped):
    """Return (chapter_number, rest_of_line) or None."""
    s = stripped
    # normalise the awkward OCR'd chapter-marker forms before matching
    s = s.replace("XI L", "XII.").replace("XI.And", "XI. And")
    if s.startswith("XXL "):        # ch21: OCR ate the period ('XXI.' -> 'XXL')
        s = "XXI. " + s[4:]
    m = CHAP_RE.match(s)
    if not m:
        return None
    tok, rest = m.group(1), m.group(2)
    if tok in CHAP_TOKENS:
        return CHAP_TOKENS[tok], rest
    return None


def is_floating_punct(stripped):
    return bool(stripped) and all(c in ":;!,.\"'=*^-()?~ " for c in stripped)


def strip_refs(text):
    """Remove inline footnote-reference markers from reflowed text."""
    t = text
    t = t.replace("\\", "")            # stray backslashes
    t = t.replace("^", "")             # carets are never English text here
    t = t.replace("*", "")             # asterisks here are all ref markers
    t = re.sub(r"\d+", "", t)          # no legitimate digits in the AoA body
    t = re.sub(r"\s+'\s+", " ", t)     # isolated single-quote ref markers
    t = re.sub(r"(?<=[.,;:!?])'(?=\s)", "", t)  # ' ref right after punctuation
    return t


def reflow(lines):
    """Join body lines into one string, attaching floating punctuation and
    repairing hyphenated line breaks."""
    out = ""
    for ln in lines:
        s = ln.strip()
        if not s:
            continue
        if is_floating_punct(s):
            # reattach floating punctuation to the running text
            out = out.rstrip() + s.replace(" ", "")
            continue
        if out.endswith("-"):
            out = out[:-1] + s          # hyphenated line break -> join word
        else:
            out = (out + " " + s) if out else s
    return out


def cleanup(text):
    t = text
    for a, b in OCR_SUBS:
        t = t.replace(a, b)
    t = strip_refs(t)
    # collapse whitespace, tidy spaces before punctuation
    t = re.sub(r"\s+", " ", t)
    t = re.sub(r"\s+([.,;:!?])", r"\1", t)
    t = re.sub(r"\(\s+", "(", t)
    t = re.sub(r"\s+\)", ")", t)
    t = re.sub(r'"\s+', '"', t)         # tidy spaces after open-quote (rough)
    t = re.sub(r"\s+", " ", t).strip()
    return t


def main():
    raw = open("box_body.txt", encoding="utf-8").read().split("\n")
    # box_body.txt: index i -> line number i+1
    drop = set()
    for a, b in HEADING_RANGES:
        drop.update(range(a, b + 1))
    fm_lines = [raw[i - 1] for i in range(FRONT_MATTER_RANGE[0],
                                          FRONT_MATTER_RANGE[1] + 1)]
    drop.update(range(FRONT_MATTER_RANGE[0], FRONT_MATTER_RANGE[1] + 1))

    # walk lines, splitting into chapters. The 32 chapter markers appear
    # strictly in order 1..32 -- so a line is a marker ONLY if its token
    # equals the next expected number. This rejects false positives like
    # 'I."' (end of '...Here am I.' wrapping to a new line inside ch 20).
    chapters = {}           # num -> list of raw lines
    cur = None
    expected = 1
    for idx, ln in enumerate(raw, start=1):
        if idx in drop:
            continue
        s = ln.strip()
        ch = is_chapter_line(s) if s else None
        if ch is not None and ch[0] == expected:
            num, rest = ch
            cur = num
            chapters[num] = [rest]
            expected += 1
        elif cur is not None:
            chapters[cur].append(ln)

    front = cleanup(reflow(fm_lines))

    with open("box_chapters_draft.txt", "w", encoding="utf-8") as fh:
        fh.write("# FRONT MATTER\n")
        fh.write(front + "\n\n")
        for n in range(1, 33):
            if n not in chapters:
                fh.write(f"## Chapter {n}\n[!! MISSING !!]\n\n")
                continue
            body = cleanup(reflow(chapters[n]))
            fh.write(f"## Chapter {n}\n{body}\n\n")

    found = sorted(chapters)
    missing = [n for n in range(1, 33) if n not in chapters]
    print(f"chapters found : {len(found)}  -> {found}")
    print(f"missing        : {missing if missing else 'none'}")
    print(f"front matter   : {front[:90]}...")


if __name__ == "__main__":
    main()
