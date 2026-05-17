#!/usr/bin/env python3
"""
_session71_elohei_x_close.py
----------------------------
S71 compliance wheel — close the bare-`God` follow-on family across the
4 published extras editions (apocrypha + jasher + enoch + jubilees) +
defensive zero-fire pass against canon.

DESIGN (settled at the S71 design gate, 2026-05-17):
  Rule: bare `God` (capital G, USE context, not preceded by an existing
  restoration paren / compound prefix, not inside a documented MENTION
  carve-out) → `Elohim (God)`. Mixed-case `(God)` parenthetical per the
  voice skill's singles convention (same form S66 used 32× and canon
  pipeline uses 279×).

  Yoshi's S71 call: "restore everywhere thats not like a quoting what
  christians say type of thing." Default = fire. Carve-out = MENTION
  cases where Yoshi is quoting Christian/atheist categorization rhetoric
  or discussing the source/convention itself.

  CARVE-OUTS (7 total — 3 inherited from S66, 4 new at S71 gate):

    INHERITED FROM S66:
    (1) "the God of the Old/New (Testament)" — Christian-categorization
        rhetoric Yoshi is critiquing. Enoch ch46 commentary, 1 instance.
    (2) "singular God of X" — S66 MENTION carve-out for the plurality-
        majesty grammar discussion. 2 Macc 15 commentary, 2 instances.

    NEW AT S71:
    (3) Apocrypha front_matter typography note — "...the Lord in standard
        typography for the formal title, and God for the plural-majesty
        Elohim. This edition restores the sacred names at every..."
        MENTION case discussing the convention itself.
    (4) Apocrypha 2 Macc 15 commentary typography discussion — "...at
        every occurrence of the Lord and of God in any context where the
        text refers to the covenant deity..." MENTION discussing source
        typography rules.
    (5) Jasher ch9 commentary Nietzsche reference — "...Nietzschean
        'death of God'..." MENTION quoting Christian/atheist framework.
    (6) Jubilees front_matter typography repair note — "...broke the
        compound name the Lord my God across chapter 45 verse 3 were
        repaired..." MENTION discussing source-form typography.

  EXPECTED FIRES PER EDITION:
    apocrypha: 203 (USE) + 2 (carve-out #3, #4) + 2 (S66 plurality) = 207 audit hits
    jasher: 9 (USE) + 1 (carve-out #5) = 10 audit hits
    enoch: 18 (USE) + 1 (S66 OT/NT) = 19 audit hits
    jubilees: 3 (USE) + 1 (carve-out #6) = 4 audit hits
    canon: 0 (defensive zero-fire pass)
    --------
    TOTAL USE fires: 233 substitutions
    TOTAL audit hits: 240 (233 USE + 7 carve-outs)

Wheel architecture (cloned from S69's classifier-driven pattern):
  1. For each edition:
     a. Read .txt from disk
     b. finditer all P_BARE_GOD positions
     c. For each position, classify USE / SKIP via the context window
     d. Apply USE substitutions in descending byte position order
        (per-fire byte-range substitution per S69 lesson — overlapping
        anchors safe because each fire touches only the 3 bytes of "God")
     e. Re-parse the updated .txt
     f. Diff vs live JSON, verify count matches USE expected
     g. Write .txt + .json (real run) or skip (dry-run)
     h. GATE 3: byte-equal durability proof
     i. Residual gate: count post-sub bare-God USE positions == 0
  2. Defensive canon pass: verify 0 USE positions; no .txt edit.

Idempotency: re-running on the updated .txt finds 0 USE positions because
the substituted forms are `Elohim (God)` — preceded by `(` which the
P_BARE_GOD lookbehind `(?<![A-Za-z(/])` excludes.

Backups: .txt.pre-s71 + <edition>.json.pre-s71. Idempotent backup overwrite
acceptance per S69 lesson (accept-as-existing if content matches current
pre-state; refuse only if content differs).
"""

from __future__ import annotations

import json
import os
import re
import shutil
import sys
from dataclasses import asdict


def _resolve_app() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    sandbox = "/sessions/keen-lucid-fermi/mnt/App"
    if os.path.isdir(sandbox):
        return sandbox
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ.setdefault("APP_ROOT", APP)

from parse_published_editions import (  # noqa: E402
    parse_apocrypha, parse_jasher, parse_enoch, parse_jubilees,
)

# Edition config: (name, .txt_path, .json_path, parse_fn, expected_use_fires)
EDITIONS = [
    (
        "apocrypha",
        "source-texts/existing-restored-editions/Apocrypha-Restored-Names-Edition.txt",
        "source-texts/parsed/apocrypha.json",
        parse_apocrypha,
        202,
    ),
    (
        "jasher",
        "source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt",
        "source-texts/parsed/jasher.json",
        parse_jasher,
        3,
    ),
    (
        "enoch",
        "source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt",
        "source-texts/parsed/enoch.json",
        parse_enoch,
        18,
    ),
    (
        "jubilees",
        "source-texts/existing-restored-editions/Jubilees-Restored-Names-Edition.txt",
        "source-texts/parsed/jubilees.json",
        parse_jubilees,
        2,
    ),
]


# ---------------------------------------------------------------------------
# Pattern + classifier
# ---------------------------------------------------------------------------

# Bare-God pattern: capital G, not preceded by alpha/( //, not followed by
# alpha or possessive
P_BARE_GOD = re.compile(r"(?<![A-Za-z(/])\bGod\b(?![A-Za-z)’'])")

# Restoration-prefix detector (broader than S66's lookahead — covers all
# voice-skill compound expansions plus the singles rule prefix)
PRECEDING_RESTORED = re.compile(
    r"(?:Elohim\s*\(|Yahuah\s+Elohim\s*\(|El\s+Shaddai\s*\(|"
    r"Elohayka\s*\(|Eloheinu\s*\(|Elohaychem\s*\(|Elohai\s*\(|"
    r"Elohav\s*\(|El\s+Elyon\s*\(|El\s+Olam\s*\(|El\s+Gibbor\s*\(|"
    r"El\s+Roi\s*\(|Avi-ad\s*\(|Sar\s+Shalom\s*\(|"
    r"the\s+Elohim\s*\(God\)\s+of\s+|Elohim\s*\(God\)\s+of\s+|"
    r"Yahuah\s+Elohim\s*\([^)]+\)\s+of\s+|"
    r"a\s+Elohim\s*\(God\)\s+of\s+|One\s+Elohim\s*\(God\)\s+of\s+|"
    r"you\s+Elohim\s*\(God\)\s+of\s+)"
)


def classify_match(text: str, start: int, end: int) -> str:
    """Return USE / SKIP_xxx for the match position."""
    pre = text[max(0, start - 80):start]
    post = text[end:end + 80]
    window = text[max(0, start - 80):end + 80]

    # SKIP: existing restoration prefix
    if PRECEDING_RESTORED.search(pre[-50:]):
        return "SKIP_RESTORED"

    # SKIP: S66 OT/NT carve-out — "the God of the Old/New"
    if re.search(r"\bthe\s*$", pre) and re.match(r"\s+of\s+the\s+(?:Old|New)\b", post):
        return "SKIP_S66_OT_NT"

    # SKIP: S66 plurality-majesty MENTION — "singular God"
    if re.search(r"\bsingular\s*$", pre):
        return "SKIP_S66_PLURALITY"

    # SKIP: S71 carve-out (3a) — Apocrypha FM typography note: "and God for
    # the plural-majesty Elohim"
    if re.search(r"\band\s*$", pre) and re.match(r"\s+for\s+the\s+plural[\s-]?majesty\b", post):
        return "SKIP_S71_APOCRYPHA_FM_TYPO_1"

    # SKIP: S71 carve-out (3b — NEW) — Apocrypha FM typography note 2:
    # "the Lord, and God in places where"
    if re.search(r"the\s+Lord,\s+and\s*$", pre) and re.match(r"\s+in\s+places\s+where\b", post):
        return "SKIP_S71_APOCRYPHA_FM_TYPO_2"

    # SKIP: S71 carve-out (4) — Apocrypha 2 Macc 15 typography discussion
    if re.search(r"\bthe\s+Lord\s+and\s+of\s*$", pre) and re.match(r"\s+in\s+any\s+context\b", post):
        return "SKIP_S71_APOCRYPHA_2M15_TYPO"

    # SKIP: S71 carve-out (5) — Jasher ch9 Nietzsche reference
    if re.search(r"death\s+of\s*$", pre):
        if re.search(r"Nietzsche|militant\s+atheism", text[max(0, start - 200):start], re.IGNORECASE):
            return "SKIP_S71_JASHER_NIETZSCHE"

    # SKIP: S71 carve-out (6) — Jubilees FM typography repair note:
    # "the Lord my God across chapter 45 verse 3"
    if re.search(r"\bthe\s+Lord\s+my\s*$", pre) and re.match(r"\s+across\s+chapter\b", post):
        return "SKIP_S71_JUBILEES_FM_TYPO_1"

    # SKIP: S71 carve-out (7 — NEW) — Jasher FM #1: "the Lord and God that hide"
    if re.search(r"the\s+Lord\s+and\s*$", pre) and re.match(r"\s+that\s+hide\b", post):
        return "SKIP_S71_JASHER_FM_HIDE"

    # SKIP: S71 carve-out (8 — NEW) — Jasher FM #2: "and God for the plural majesty"
    # Variant of carve-out (3a) — same content, different edition, "plural majesty"
    # (without hyphen) instead of "plural-majesty"
    if re.search(r"covenant\s+name,?\s+and\s*$", pre) and re.match(r"\s+for\s+the\s+plural\b", post):
        return "SKIP_S71_JASHER_FM_PLURAL_MAJ"

    # SKIP: S71 carve-out (9 — NEW) — Jasher FM #3: "Elohim where it has God."
    if re.search(r"where\s+it\s+has\s*$", pre) and re.match(r"\.\s|\.$", post):
        return "SKIP_S71_JASHER_FM_HAS"

    # SKIP: S71 carve-out (10 — NEW) — Jasher FM #4: "the word God as an expletive"
    if re.search(r"the\s+word\s*$", pre) and re.match(r"\s+as\s+an\s+expletive\b", post):
        return "SKIP_S71_JASHER_FM_EXPLETIVE"

    # SKIP: S71 carve-out (11 — NEW) — Jasher FM #5: "the Lord, God, Adonai"
    if re.search(r"the\s+Lord,\s*$", pre) and re.match(r",\s+Adonai\b", post):
        return "SKIP_S71_JASHER_FM_SUBSTITUTE_LIST"

    # SKIP: S71 carve-out (12 — NEW) — Jasher BM: "sons-of-God language"
    # Discussion of the Genesis 6 term-as-term
    if re.search(r"sons-of-$", pre) and re.match(r"\s+language\b", post):
        return "SKIP_S71_JASHER_BM_SONS_OF_GOD_TERM"

    # SKIP: S71 carve-out (13 — NEW) — Jubilees FM restoration-rule note:
    # "God was restored to Elohim (God)"
    if re.search(r"every\s+mention\.\s*$", pre) and re.match(r"\s+was\s+restored\s+to\s+Elohim\s*\(God\)", post):
        return "SKIP_S71_JUBILEES_FM_RESTORE_RULE"

    return "USE"


def safe_backup(src: str, dst: str, name: str):
    """Idempotent backup: write if missing, accept-as-existing if matches src pre-state."""
    if not os.path.exists(dst):
        shutil.copy2(src, dst)
        print(f"  backed up {name} to {dst}", file=sys.stderr)
        return
    # Compare content — if matches, accept as existing backup
    with open(src, "rb") as f:
        src_bytes = f.read()
    with open(dst, "rb") as f:
        dst_bytes = f.read()
    if src_bytes == dst_bytes:
        print(f"  backup {dst} already exists and matches (idempotent re-run OK)",
              file=sys.stderr)
    else:
        raise RuntimeError(
            f"backup {dst} exists but content differs from current {src}; "
            "manual review required"
        )


def process_edition(
    name: str,
    txt_rel: str,
    json_rel: str,
    parse_fn,
    expected_use: int,
    dry_run: bool = False,
) -> dict:
    """Process one edition. Returns a result dict for the aggregate report."""
    txt_path = os.path.join(APP, txt_rel)
    json_path = os.path.join(APP, json_rel)
    txt_backup = txt_path + ".pre-s71"
    json_backup = json_path + ".pre-s71"

    print(f"\n========== {name} ==========", file=sys.stderr)
    print(f"  TXT  = {txt_path}", file=sys.stderr)
    print(f"  JSON = {json_path}", file=sys.stderr)

    with open(txt_path, encoding="utf-8") as f:
        original = f.read()

    # Find all bare-God positions and classify
    positions = []
    cls_counts = {}
    for m in P_BARE_GOD.finditer(original):
        cls = classify_match(original, m.start(), m.end())
        cls_counts[cls] = cls_counts.get(cls, 0) + 1
        if cls == "USE":
            positions.append((m.start(), m.end()))

    print(f"  classification counts:", file=sys.stderr)
    for cls, cnt in sorted(cls_counts.items()):
        print(f"    {cls}: {cnt}", file=sys.stderr)

    use_count = len(positions)
    print(f"  USE fires: {use_count} (expected {expected_use})", file=sys.stderr)

    # GATE 1: pre-flight USE count == expected
    if use_count != expected_use:
        raise RuntimeError(
            f"{name}: USE count {use_count} != expected {expected_use} — anchor drift"
        )
    print(f"  === GATE 1: pre-flight USE count PASS ===", file=sys.stderr)

    # Apply substitutions in descending position order (safe overlap)
    updated = original
    for start, end in sorted(positions, reverse=True):
        # Each match is exactly "God" (3 bytes). Substitute with "Elohim (God)".
        if updated[start:end] != "God":
            raise RuntimeError(
                f"{name}: position {start}:{end} no longer 'God' after prior subs "
                f"(got {updated[start:end]!r}) — overlap bug"
            )
        updated = updated[:start] + "Elohim (God)" + updated[end:]

    # Verify byte delta
    expected_delta = use_count * (len("Elohim (God)") - len("God"))  # 9 bytes per fire
    actual_delta = len(updated) - len(original)
    if actual_delta != expected_delta:
        raise RuntimeError(
            f"{name}: byte delta {actual_delta} != expected {expected_delta}"
        )
    print(f"  byte delta: +{actual_delta} ({len(original)} → {len(updated)})",
          file=sys.stderr)

    # Re-parse the updated .txt
    new_parsed = parse_fn(updated)
    new_parsed_dict = asdict(new_parsed)

    # Load live JSON for diff
    with open(json_path, encoding="utf-8") as f:
        live = json.load(f)

    # Structural integrity check
    if len(new_parsed_dict["books"]) != len(live["books"]):
        raise RuntimeError(
            f"{name}: book-count drift "
            f"({len(live['books'])} → {len(new_parsed_dict['books'])})"
        )

    # GATE 2: count diffs
    diffs = []
    for pb, lb in zip(new_parsed_dict["books"], live["books"]):
        if pb.get("book_intro") != lb.get("book_intro"):
            diffs.append((pb["book_title"], "book_intro"))
        for pc, lc in zip(pb.get("chapters", []), lb.get("chapters", [])):
            for pv, lv in zip(pc.get("verses", []), lc.get("verses", [])):
                if pv.get("text") != lv.get("text"):
                    diffs.append((pb["book_title"], f"ch{pc['number']}/v{pv.get('number','?')}"))
            if pc.get("commentary") != lc.get("commentary"):
                diffs.append((pb["book_title"], f"ch{pc['number']}/commentary"))
            if pc.get("title") != lc.get("title"):
                diffs.append((pb["book_title"], f"ch{pc['number']}/title"))
    # Front/back matter diffs
    if new_parsed_dict.get("front_matter") != live.get("front_matter"):
        diffs.append(("[edition]", "front_matter"))
    if new_parsed_dict.get("back_matter") != live.get("back_matter"):
        diffs.append(("[edition]", "back_matter"))

    print(f"  === GATE 2: {len(diffs)} zone-level diffs ===", file=sys.stderr)
    for book, loc in diffs[:5]:
        print(f"    {book} {loc}", file=sys.stderr)
    if len(diffs) > 5:
        print(f"    ... and {len(diffs) - 5} more", file=sys.stderr)

    # Residual gate: post-sub USE count must be 0
    residual_use = 0
    for m in P_BARE_GOD.finditer(updated):
        cls = classify_match(updated, m.start(), m.end())
        if cls == "USE":
            residual_use += 1
    if residual_use != 0:
        raise RuntimeError(
            f"{name}: residual USE count = {residual_use}, expected 0"
        )
    print(f"  === residual gate: post-sub USE count == 0 PASS ===", file=sys.stderr)

    if dry_run:
        print(f"  === DRY RUN — not writing ===", file=sys.stderr)
        return {
            "name": name,
            "use_count": use_count,
            "byte_delta": actual_delta,
            "diff_count": len(diffs),
        }

    # Backups (idempotent)
    safe_backup(txt_path, txt_backup, ".txt")
    safe_backup(json_path, json_backup, ".json")

    # Write updated .txt
    with open(txt_path, "w", encoding="utf-8") as f:
        f.write(updated)
    print(f"  wrote updated .txt ({len(updated)} bytes)", file=sys.stderr)

    # Write updated .json (canonical form)
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(new_parsed_dict, f, ensure_ascii=False, indent=2)
        f.write("\n")
    new_json_size = os.path.getsize(json_path)
    print(f"  wrote updated .json ({new_json_size} bytes)", file=sys.stderr)

    # GATE 3: byte-equal durability proof
    with open(txt_path, encoding="utf-8") as f:
        written_txt = f.read()
    reparse = asdict(parse_fn(written_txt))
    with open(json_path, encoding="utf-8") as f:
        written_json = json.load(f)
    reparse_str = json.dumps(reparse, ensure_ascii=False, indent=2)
    written_str = json.dumps(written_json, ensure_ascii=False, indent=2)
    if reparse_str != written_str:
        raise RuntimeError(f"{name}: GATE 3 durability proof FAIL")
    print(f"  === GATE 3: durability PASS ({len(reparse_str)} bytes byte-equal) ===",
          file=sys.stderr)

    return {
        "name": name,
        "use_count": use_count,
        "byte_delta": actual_delta,
        "diff_count": len(diffs),
        "json_size": new_json_size,
        "txt_size": len(updated),
    }


def canon_defensive_pass() -> dict:
    """Defensive zero-fire pass against canon.json. Confirm USE count == 0."""
    print(f"\n========== canon (defensive) ==========", file=sys.stderr)
    json_path = os.path.join(APP, "source-texts/parsed/canon.json")
    with open(json_path, encoding="utf-8") as f:
        data = json.load(f)

    use_count = 0
    for b in data.get("books", []):
        for ch in b.get("chapters", []):
            for v in ch.get("verses", []):
                t = v.get("text", "")
                for m in P_BARE_GOD.finditer(t):
                    if classify_match(t, m.start(), m.end()) == "USE":
                        use_count += 1
            comm = ch.get("commentary") or ""
            for m in P_BARE_GOD.finditer(comm):
                if classify_match(comm, m.start(), m.end()) == "USE":
                    use_count += 1
    if use_count != 0:
        raise RuntimeError(f"canon defensive pass: USE count {use_count} != 0")
    print(f"  USE count: 0 — defensive pass PASS (no .txt edit)", file=sys.stderr)
    return {"name": "canon", "use_count": 0, "byte_delta": 0}


def main(dry_run: bool = False):
    print(f"=== Session 71: Elohei-X family closure wheel ===", file=sys.stderr)
    print(f"APP = {APP}", file=sys.stderr)
    print(f"dry_run = {dry_run}", file=sys.stderr)

    results = []
    for ed in EDITIONS:
        r = process_edition(*ed, dry_run=dry_run)
        results.append(r)

    canon_result = canon_defensive_pass()
    results.append(canon_result)

    print(f"\n\n=== Aggregate ===", file=sys.stderr)
    total_use = sum(r["use_count"] for r in results)
    total_delta = sum(r["byte_delta"] for r in results)
    print(f"  Total USE fires across 5 editions: {total_use}", file=sys.stderr)
    print(f"  Total byte delta: +{total_delta}", file=sys.stderr)
    for r in results:
        print(f"  {r['name']:>12s}: {r['use_count']:>3} fires, +{r['byte_delta']:>4} bytes",
              file=sys.stderr)


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    main(dry_run=args.dry_run)
