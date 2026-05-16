#!/usr/bin/env python3
"""
_session61_revert_ch2_v2_sons_of_men.py
----------------------------------------
S61 correction: revert exactly ONE substitution. Jasher 2:2's
"sons of Adam began to multiply" reverts to the source's "sons of
men began to multiply." All other plural substitutions across the
edition hold.

Rationale: the v2 referent is the multiplying multitude in the days
of Enosh — Adam → Seth → Enosh is three souls of the seed of
promise at that hour, too thin to be a multiplying multitude. The
multiplying multitude is therefore the broader peoples-of-the-earth
lineage, not Adam's seed. The math precludes it.

Every other plural occurrence (vv3-6 rebellion, vv19-21 corruption,
ch3+ Enoch reign, ch4-5 pre-flood, ch6 flood, ch7-49 post-flood)
correctly stays as "sons of Adam." Adam's descendants include the
corrupted-tare lines (sons of Belial within the seed) — being a son
of Adam doesn't preclude being unfaithful. The descent is the
relational title; faithfulness is a separate axis.

Operates on:
  - source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt
  - source-texts/parsed/jasher.json

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
BACKUP_TXT = TXT_PATH + ".pre-s61-correction"
BACKUP_JSON = LIVE_PATH + ".pre-s61-correction"

# The exact sentence in ch2 v2 that gets the revert.
# Both halves are uniquely identifying (the phrase "began to multiply"
# only appears once in ch2 v2's text — verified during enumeration).
V2_TARGET = "sons of Adam began to multiply"
V2_REPLACEMENT = "sons of men began to multiply"


def revert_v2_in_txt(txt: str) -> tuple[str, int]:
    """Locate ch2 body and replace the unique v2 phrase. Use both
    space and \\n-wrapped variants because the .txt may wrap the phrase."""
    ch2_match = re.search(r"^Chapter\s+2:\s*[^\n]+\n", txt, re.MULTILINE)
    ch3_match = re.search(r"^Chapter\s+3:\s*[^\n]+\n", txt, re.MULTILINE)
    if not ch2_match or not ch3_match:
        raise RuntimeError("could not locate ch2 / ch3 heading boundaries")
    ch2_start, ch2_end = ch2_match.start(), ch3_match.start()
    body = txt[ch2_start:ch2_end]

    # The phrase may wrap, e.g., "sons of\n    Adam began to multiply" or
    # "sons of Adam began\n    to multiply". Use \s+ to tolerate any
    # internal whitespace.
    pat = re.compile(r"sons\s+of\s+Adam\s+began\s+to\s+multiply")
    matches = list(pat.finditer(body))
    if len(matches) != 1:
        raise RuntimeError(f"expected exactly 1 v2 phrase in ch2, found {len(matches)}")
    m = matches[0]
    # The replacement preserves the original whitespace structure by
    # re-using the captured whitespace via re.sub's reconstruction.
    new_body = body[:m.start()] + "sons of men began to multiply" + body[m.end():]
    return txt[:ch2_start] + new_body + txt[ch2_end:], 1


def revert_v2_in_json(live: dict) -> tuple[dict, int]:
    """Revert the one v2 substitution in jasher.json's ch2 verse 2."""
    for ch in live["books"][0]["chapters"]:
        if ch["number"] != 2:
            continue
        for v in ch["verses"]:
            if v["number"] != 2:
                continue
            old = v["text"]
            new = old.replace(V2_TARGET, V2_REPLACEMENT)
            if new == old:
                raise RuntimeError("v2 phrase not found in live JSON ch2 v2")
            count = old.count(V2_TARGET)
            v["text"] = new
            return live, count
    raise RuntimeError("ch2 v2 not located in JSON")


def main(dry_run: bool = False):
    print(f"TXT  = {TXT_PATH}", file=sys.stderr)
    print(f"LIVE = {LIVE_PATH}", file=sys.stderr)

    with open(TXT_PATH, encoding="utf-8") as f:
        txt = f.read()
    with open(LIVE_PATH, encoding="utf-8") as f:
        live = json.load(f)

    new_txt, txt_count = revert_v2_in_txt(txt)
    new_live, json_count = revert_v2_in_json(live)

    print(f"\n=== revert counts (ch2 v2 only) ===", file=sys.stderr)
    print(f"  .txt:  {txt_count} (expected 1)", file=sys.stderr)
    print(f"  .json: {json_count} (expected 1)", file=sys.stderr)

    # Byte-equal proof
    parsed = parse_jasher(new_txt)
    parsed_str = json.dumps(asdict(parsed), ensure_ascii=False, indent=2)
    live_str = json.dumps(new_live, ensure_ascii=False, indent=2)

    if parsed_str == live_str:
        print(f"\n=== BYTE-EQUAL PROOF (post-correction): PASS ===", file=sys.stderr)
        print(f"  parsed JSON ({len(parsed_str)} bytes) == corrected jasher.json ({len(live_str)} bytes)", file=sys.stderr)
    else:
        print(f"\n=== BYTE-EQUAL PROOF: FAIL ===", file=sys.stderr)
        print(f"  parsed: {len(parsed_str)} bytes", file=sys.stderr)
        print(f"  live:   {len(live_str)} bytes", file=sys.stderr)
        import difflib
        sm = difflib.SequenceMatcher(None, parsed_str, live_str)
        for tag, i1, i2, j1, j2 in sm.get_opcodes():
            if tag == "equal":
                continue
            print(f"  first divergence {tag}: parsed[{i1}:{i2}]={parsed_str[i1:i2][:60]!r} vs live[{j1}:{j2}]={live_str[j1:j2][:60]!r}", file=sys.stderr)
            break
        sys.exit(1)

    if dry_run:
        print("\n=== DRY RUN — not writing ===", file=sys.stderr)
        return

    if not os.path.exists(BACKUP_TXT):
        shutil.copy2(TXT_PATH, BACKUP_TXT)
        print(f"backed up .txt -> {BACKUP_TXT}", file=sys.stderr)
    if not os.path.exists(BACKUP_JSON):
        shutil.copy2(LIVE_PATH, BACKUP_JSON)
        print(f"backed up .json -> {BACKUP_JSON}", file=sys.stderr)

    with open(TXT_PATH, "w", encoding="utf-8") as f:
        f.write(new_txt)
    with open(LIVE_PATH, "w", encoding="utf-8") as f:
        json.dump(new_live, f, ensure_ascii=False, indent=2)

    print(f"\nwrote corrected .txt and .json", file=sys.stderr)


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    main(dry_run=args.dry_run)
