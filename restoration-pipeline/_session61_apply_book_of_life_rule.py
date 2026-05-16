#!/usr/bin/env python3
"""
_session61_apply_book_of_life_rule.py
--------------------------------------
S61 correction wheel (broader): apply the strict book-of-life rule
to plural sons-of-Adam in Jasher.

Rule (from Yoshi): "sons of Adam" stays only where the passage in
context is obviously about those whose names are written in the
Book of Life — the seed of promise, the elect lineage. The title
is spiritual, not biological — Cain's line, sons of Belial, the
wicked generation are NOT sons of Adam even though they trace
through Adam. Context is paragraph- or chapter-level reading, not
grammar.

Default: sons of men. KEEP "sons of Adam" only in specific named
passages where the elect is obviously the referent.

KEEP cases (8 substitutions + 4 Yoshi originals):

  ch3 v7 (×2): "all the sons of Adam then assembled to him" /
               "Enoch reigned over the sons of Adam" — the faithful
               gathering and Enoch's reign over the assembled elect
  ch3 v8:     "the sons of Adam served Yahuah all the days of Enoch"
               — explicit serving = book of life by definition
  ch3 v12:    "Enoch reigned over the sons of Adam two hundred and
               forty-three years" — same righteous reign over the
               faithful community
  ch3 v27:    "the sons of Adam were with Enoch" — ascension witnesses
  ch3 v29:    "all the sons of Adam that were with Enoch saw him"
               — same faithful witnesses
  ch3 v31:    "all the sons of Adam assembled and came to Enoch"
               — final gathering of the faithful

  Yoshi originals (pre-S60, never wheel-substituted; preserved):
  ch2 com:    "sons of Adam walk under a mercy that has been patient
               from Adam"
  ch7 com:    Deuteronomy 32:8 (older / DSS reading) — "separated
               the sons of Adam, set the bounds of the peoples
               according to the number of the sons of Elohim"
  ch61 com:   Deuteronomy 32:8 (Masoretic) — "separated the sons of
               Adam, set the bounds of the people according to the
               number of the children of Israel"
  ch91 com:   "The sons of Adam are the seed of the woman" —
               framework statement of the lineage of promise

All other plural "sons of Adam" reverts to "sons of men". Singular
"son of Adam" (Red Line #12 — Messianic title + prophetic vocative)
is untouched.

Verification: re-parsing the corrected .txt produces JSON byte-equal
to the corrected jasher.json.
"""
from __future__ import annotations
import json, os, re, sys, shutil
from dataclasses import asdict

APP = "/sessions/modest-nice-darwin/mnt/Desktop/App"
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ["APP_ROOT"] = APP

from parse_published_editions import parse_jasher

TXT_PATH = os.path.join(APP, "source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt")
LIVE_PATH = os.path.join(APP, "source-texts/parsed/jasher.json")
BACKUP_TXT = TXT_PATH + ".pre-s61-bol"
BACKUP_JSON = LIVE_PATH + ".pre-s61-bol"

# Phrases to PRESERVE as "sons of Adam" (the 11 keep cases).
# Each phrase is uniquely identifying within the corpus — verified by
# searching the live JSON. Patterns use \s+ to tolerate line-wrapping
# in the .txt source.
KEEP_PHRASE_PATTERNS = [
    # ch3 v7a: gathering of the faithful
    (r"all\s+the\s+sons\s+of\s+Adam\s+then\s+assembled\s+to\s+him",
     "all the sons of Adam then assembled to him"),
    # ch3 v7b: Enoch's reign over the gathered faithful
    (r"Enoch\s+reigned\s+over\s+the\s+sons\s+of\s+Adam\s+according\s+to\s+the\s+word",
     "Enoch reigned over the sons of Adam according to the word"),
    # ch3 v8: explicit serving of Yahuah
    (r"sons\s+of\s+Adam\s+served\s+Yahuah\s+all\s+the\s+days\s+of\s+Enoch",
     "sons of Adam served Yahuah all the days of Enoch"),
    # ch3 v12: 243-year reign over the faithful
    (r"Enoch\s+reigned\s+over\s+the\s+sons\s+of\s+Adam\s+two\s+hundred",
     "Enoch reigned over the sons of Adam two hundred"),
    # ch3 v27: ascension scene witnesses
    (r"at\s+that\s+time\s+the\s+sons\s+of\s+Adam\s+were\s+with\s+Enoch",
     "at that time the sons of Adam were with Enoch"),
    # ch3 v29: those with Enoch saw the horse
    (r"all\s+the\s+sons\s+of\s+Adam\s+that\s+were\s+with\s+Enoch\s+saw",
     "all the sons of Adam that were with Enoch saw"),
    # ch3 v31: final gathering on the day of ascension
    (r"all\s+the\s+sons\s+of\s+Adam\s+assembled\s+and\s+came\s+to\s+Enoch",
     "all the sons of Adam assembled and came to Enoch"),
    # Yoshi original ch2 commentary
    (r"sons\s+of\s+Adam\s+walk\s+under\s+a\s+mercy",
     "sons of Adam walk under a mercy"),
    # Yoshi original ch7 commentary (Deut 32:8 older reading "peoples / sons of Elohim").
    # Pattern truncated at "peoples" word boundary so it doesn't depend on
    # post-S60 substitutions further downstream ("Elohim" -> "Elohim (God)").
    (r"separated\s+the\s+sons\s+of\s+Adam,\s+he\s+set\s+the\s+bounds\s+of\s+the\s+peoples\b",
     "separated the sons of Adam, he set the bounds of the peoples"),
    # Yoshi original ch61 commentary (Deut 32:8 Masoretic "people / children of Israel").
    # Pattern truncated at "people" word boundary (not "peoples"). Same robustness:
    # downstream substitutions of "Israel" -> "Yashar'el (Israel)" don't break the match.
    (r"separated\s+the\s+sons\s+of\s+Adam,\s+he\s+set\s+the\s+bounds\s+of\s+the\s+people\b(?!s)",
     "separated the sons of Adam, he set the bounds of the people"),
    # Yoshi original ch91 commentary (seed-of-the-woman framework)
    (r"The\s+sons\s+of\s+Adam\s+are\s+the\s+seed\s+of\s+the\s+woman",
     "The sons of Adam are the seed of the woman"),
]


def transform(text: str, stats: dict) -> str:
    """Apply the book-of-life rule to a text region.

    1. Mask each KEEP phrase with a placeholder (so it survives the
       global revert below).
    2. Globally substitute remaining "sons of Adam" -> "sons of men"
       and "Sons of Adam" -> "Sons of men".
    3. Restore placeholders to their original phrases.
    """
    placeholders: dict[str, str] = {}
    for i, (pat, _label) in enumerate(KEEP_PHRASE_PATTERNS):
        regex = re.compile(pat)
        for j, m in enumerate(list(regex.finditer(text))):
            ph = f"\x00KEEP{i}_{j}\x00"
            placeholders[ph] = m.group(0)
            text = text[:m.start()] + ph + text[m.end():]
            stats.setdefault(f"keep_{i}", 0)
            stats[f"keep_{i}"] += 1

    # Now global revert
    text, lc_count = re.subn(r"\bsons\s+of\s+Adam\b", "sons of men", text)
    text, uc_count = re.subn(r"\bSons\s+of\s+Adam\b", "Sons of men", text)
    stats.setdefault("revert_lc", 0)
    stats["revert_lc"] += lc_count
    stats.setdefault("revert_uc", 0)
    stats["revert_uc"] += uc_count

    # Restore placeholders
    for ph, original in placeholders.items():
        text = text.replace(ph, original)

    return text


def main(dry_run: bool = False):
    print(f"TXT  = {TXT_PATH}", file=sys.stderr)
    print(f"LIVE = {LIVE_PATH}", file=sys.stderr)

    with open(TXT_PATH, encoding="utf-8") as f:
        txt = f.read()
    with open(LIVE_PATH, encoding="utf-8") as f:
        live = json.load(f)

    # Transform the .txt's chapter body only (preserve front + back matter)
    ch1_match = re.search(r"^Chapter 1:", txt, re.MULTILINE)
    back_marker = "The commentary for the Book of Jasher is now complete."
    if not ch1_match or back_marker not in txt:
        raise RuntimeError("chapter / back-matter markers not found")
    body_start = ch1_match.start()
    body_end = txt.index(back_marker)

    txt_stats: dict = {}
    new_body = transform(txt[body_start:body_end], txt_stats)
    new_txt = txt[:body_start] + new_body + txt[body_end:]

    # Transform each chapter's verse texts and commentary in the JSON
    json_stats: dict = {}
    for ch in live["books"][0]["chapters"]:
        for v in ch["verses"]:
            v["text"] = transform(v["text"], json_stats)
        ch["commentary"] = transform(ch["commentary"], json_stats)

    print(f"\n=== .txt transform stats ===", file=sys.stderr)
    print(f"  revert_lc = {txt_stats.get('revert_lc', 0)}", file=sys.stderr)
    print(f"  revert_uc = {txt_stats.get('revert_uc', 0)}", file=sys.stderr)
    for i in range(len(KEEP_PHRASE_PATTERNS)):
        print(f"  keep_{i} = {txt_stats.get(f'keep_{i}', 0)}", file=sys.stderr)

    print(f"\n=== .json transform stats ===", file=sys.stderr)
    print(f"  revert_lc = {json_stats.get('revert_lc', 0)}", file=sys.stderr)
    print(f"  revert_uc = {json_stats.get('revert_uc', 0)}", file=sys.stderr)
    for i in range(len(KEEP_PHRASE_PATTERNS)):
        print(f"  keep_{i} = {json_stats.get(f'keep_{i}', 0)}", file=sys.stderr)

    # Byte-equal proof
    parsed = parse_jasher(new_txt)
    parsed_str = json.dumps(asdict(parsed), ensure_ascii=False, indent=2)
    live_str = json.dumps(live, ensure_ascii=False, indent=2)

    if parsed_str == live_str:
        print(f"\n=== BYTE-EQUAL PROOF: PASS ({len(parsed_str)} bytes) ===", file=sys.stderr)
    else:
        print(f"\n=== BYTE-EQUAL PROOF: FAIL ===", file=sys.stderr)
        print(f"  parsed: {len(parsed_str)} bytes, live: {len(live_str)} bytes", file=sys.stderr)
        import difflib
        sm = difflib.SequenceMatcher(None, parsed_str, live_str)
        for tag, i1, i2, j1, j2 in sm.get_opcodes():
            if tag == "equal":
                continue
            print(f"  divergence {tag}: parsed[{i1}:{i2}]={parsed_str[i1:i2][:120]!r}", file=sys.stderr)
            print(f"               live[{j1}:{j2}]={live_str[j1:j2][:120]!r}", file=sys.stderr)
            break
        sys.exit(1)

    if dry_run:
        print("\n=== DRY RUN — not writing ===", file=sys.stderr)
        return

    if not os.path.exists(BACKUP_TXT):
        shutil.copy2(TXT_PATH, BACKUP_TXT)
    if not os.path.exists(BACKUP_JSON):
        shutil.copy2(LIVE_PATH, BACKUP_JSON)
    with open(TXT_PATH, "w", encoding="utf-8") as f:
        f.write(new_txt)
    with open(LIVE_PATH, "w", encoding="utf-8") as f:
        json.dump(live, f, ensure_ascii=False, indent=2)
    print(f"\nwrote corrected .txt and .json", file=sys.stderr)


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    main(dry_run=args.dry_run)
