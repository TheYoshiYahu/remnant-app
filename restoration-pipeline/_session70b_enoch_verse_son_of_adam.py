#!/usr/bin/env python3
"""
_session70b_enoch_verse_son_of_adam.py
---------------------------------------
S70 wheel #2: restore the 15 bare `Son of Man` / `son of man` instances
in enoch VERSES (the named Son of Man / Elect One of 1 Enoch 46–71's
Parables) to `Son of Adam` / `son of Adam` per Red Line #12 absolute.

DESIGN (settled at the S70 audit gate):

  Audit surfaced 30 total bare `(S|s)on of (M|m)an` cases in enoch:
    3  chapter titles (chs 46/48/71)      — OUT per S70 Section III
                                            Locked Decision (chapter-title
                                            convention extended edition-wide)
    9  commentary MENTIONs (ch37/46/71)   — OUT per S57(b) preservation
                                            (etymology + Charles-redirect +
                                            scare-quoted title-as-term)
    3  front_matter MENTIONs              — OUT per same MENTION discipline
                                            (front matter is meta-discussion)
   15  verse-side named-figure cases      — REAL DEFECT, never swept;
                                            Red Line #12 absolute applies

  The 15 verse-side cases:
    ch46 v2, v3, v4    (3)  "concerning that Son of Man" / "This is the
                            Son of Man who hath righteousness" / "this
                            Son of Man whom thou hast seen"
    ch48 v2            (1)  "that Son of Man was named"
    ch60 v10           (1)  "Thou son of man, herein thou dost seek"
                            (vocative to Enoch — parallel to Ezekiel)
    ch62 v7, v8, v9    (3)  "This is the Son of Man" / "this Son of Man
                            whom thou hast seen"
    ch63 v3, v6, v8    (3)  "that Son of Man" / "the Son of Man shall
                            cause" / "that Son of Man Sitting on the
                            throne"
    ch69 v30, v31,
        v33×2          (4)  "the name of that son of man" / "given unto
                            the son of man" / "that son of man has
                            appeared" / "the word of that son of man"

  Capitalization preserved as the original capitalized (Red Line #12 rule):
    "Son of Man" → "Son of Adam" (11 cases)
    "son of man" → "son of Adam" (4 cases: ch60 v10 + ch69 ×4 — wait,
                                  ch60 is 1 + ch69 is 4 = 5 lowercase)

    Recount: 15 total = 11 cap + 4 lowercase. Let's verify:
    cap:  ch46 v2 ("Son of Man"), v3, v4 = 3
          ch48 v2 = 1
          ch62 v7, v8, v9 = 3
          ch63 v3, v6, v8 = 3
          Subtotal cap = 10
    lc:   ch60 v10 = 1
          ch69 v30, v31, v33×2 = 4
          Subtotal lc = 5
    Total = 15. (Cap = 10, lc = 5 — not 11/4.)

  Verse-zone targeting: substitution runs ONLY on the .txt slice that
  sits between each `Chapter N:` heading line and the matching
  `Commentary on Chapter N` marker line. Chapter titles, commentary,
  front_matter, back_matter all preserved verbatim — verse zones are
  the only mutable surface.

Wheel pattern (S70 wheel #1 lineage):
  1. Read enoch.txt
  2. Walk line-by-line tracking verse-zone state (between
     "Chapter N: ..." and "Commentary on Chapter N")
  3. Pre-flight: count bare matches in verse-zones only (GATE 1)
  4. Apply substitutions inside verse-zones only
  5. Re-parse the updated .txt via parse_enoch
  6. Compare against live JSON (GATE 2 — structural diffs)
  7. Write updated .txt + .json
  8. Durability proof: re-parse written .txt, byte-equal to written .json
     (GATE 3)
  9. Residual gates:
     - Verse-zone bare count post-sub == 0
     - Carve-out bare count post-sub == 15 (3 chapter titles + 9
       commentary + 3 front_matter — UNCHANGED from pre)

Defensive backups (.pre-s70b sidecars):
  enoch only (other 3 editions had defensive .pre-s70 from wheel #1).
  Idempotent acceptance: if .pre-s70b already exists with content
  matching current pre-state, accept; refuse on mismatch.

Idempotent: re-running finds 0 verse-zone matches (post-sub form has
no "son of man" in verse-zone tokens).
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
    for candidate in (
        "/sessions/beautiful-optimistic-hawking/mnt/Desktop/App",
    ):
        if os.path.isdir(candidate):
            return candidate
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ.setdefault("APP_ROOT", APP)

from parse_published_editions import parse_enoch  # noqa: E402

TXT_PATH = os.path.join(APP,
    "source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt")
JSON_PATH = os.path.join(APP, "source-texts/parsed/enoch.json")
TXT_BACKUP = TXT_PATH + ".pre-s70b"
JSON_BACKUP = JSON_PATH + ".pre-s70b"

# Patterns — \s+-tolerant for line-wrap (the .txt wraps verse lines, so
# `son\nof man` is a legitimate match the JSON-walk audit found but a
# literal-space regex on .txt misses). Whitespace captured and preserved
# in replacement so line breaks aren't collapsed.
CAP_PAT = re.compile(r"\bSon(\s+)of(\s+)Man\b")
LC_PAT = re.compile(r"\bson(\s+)of(\s+)man\b")
CAP_REPL = r"Son\1of\2Adam"
LC_REPL = r"son\1of\2Adam"

# Verse-zone state transitions
CHAPTER_HEAD_RE = re.compile(r"^Chapter \d+:")
COMMENTARY_HEAD_RE = re.compile(r"^Commentary on Chapter \d+\s*$")


def safe_backup(src_path: str, backup_path: str) -> str:
    if os.path.exists(backup_path):
        with open(src_path, "rb") as f:
            src_bytes = f.read()
        with open(backup_path, "rb") as f:
            bkp_bytes = f.read()
        if src_bytes == bkp_bytes:
            return f"backup already exists and matches current pre-state — accepted"
        else:
            raise RuntimeError(
                f"REFUSE: existing backup {backup_path} differs from "
                f"current source. Wheel cannot overwrite a different backup."
            )
    shutil.copy2(src_path, backup_path)
    return f"wrote new backup to {backup_path}"


def split_verse_zones(text: str) -> list[tuple[str, str]]:
    """Walk lines and produce a list of (zone_type, content) segments.
    zone_type is one of: 'pre_first_chapter', 'verse', 'commentary',
    'between_chapters'.

    Verse zones start at the line AFTER a `Chapter N:` heading and end
    at the line BEFORE the matching `Commentary on Chapter N` marker.
    Commentary zones start at the `Commentary on Chapter N` line and
    end before the next `Chapter N+1:` heading (or end of doc).
    """
    lines = text.split("\n")
    segments: list[tuple[str, str]] = []
    current_type = "pre_first_chapter"
    current_lines: list[str] = []

    def flush():
        if current_lines:
            segments.append((current_type, "\n".join(current_lines)))

    for line in lines:
        if CHAPTER_HEAD_RE.match(line):
            # Flush previous segment; start a verse zone (with the chapter
            # heading attached to the PREVIOUS segment so we don't modify
            # the heading line in the verse pass).
            current_lines.append(line)
            flush()
            current_lines = []
            current_type = "verse"
        elif COMMENTARY_HEAD_RE.match(line):
            # End verse zone, start commentary zone (with the marker line
            # attached to the commentary segment).
            flush()
            current_lines = [line]
            current_type = "commentary"
        else:
            current_lines.append(line)
    flush()
    return segments


def count_bare_in_zones(segments: list[tuple[str, str]],
                        zone_type: str) -> tuple[int, int]:
    """Return (capitalized_count, lowercase_count) of bare matches in the
    named zone type."""
    cap = 0
    lc = 0
    for ztype, content in segments:
        if ztype != zone_type:
            continue
        cap += len(CAP_PAT.findall(content))
        lc += len(LC_PAT.findall(content))
    return cap, lc


def apply_substitution_in_verse_zones(segments: list[tuple[str, str]]
                                      ) -> tuple[list[tuple[str, str]],
                                                  int, int]:
    """Apply CAP_PAT and LC_PAT substitutions to verse zones only.
    Returns (new_segments, cap_subs, lc_subs)."""
    new_segments = []
    cap_subs = 0
    lc_subs = 0
    for ztype, content in segments:
        if ztype == "verse":
            new_content, n_cap = CAP_PAT.subn(CAP_REPL, content)
            new_content, n_lc = LC_PAT.subn(LC_REPL, new_content)
            cap_subs += n_cap
            lc_subs += n_lc
            new_segments.append((ztype, new_content))
        else:
            new_segments.append((ztype, content))
    return new_segments, cap_subs, lc_subs


def reassemble(segments: list[tuple[str, str]]) -> str:
    return "\n".join(content for _, content in segments)


def main(dry_run: bool = False) -> dict:
    print(f"APP = {APP}", file=sys.stderr)
    print(f"\n{'='*70}\nS70 wheel #2: enoch verse Son-of-Adam sweep\n{'='*70}",
          file=sys.stderr)

    with open(TXT_PATH, encoding="utf-8") as f:
        original = f.read()
    orig_size = len(original.encode("utf-8"))
    print(f"original size: {orig_size:>9d} bytes", file=sys.stderr)

    # Pre-flight structural check
    pre = parse_enoch(original)
    if len(pre.books) != 1:
        raise RuntimeError(f"expected 1 book, got {len(pre.books)}")

    # Split into segments
    segments = split_verse_zones(original)
    seg_counts = {}
    for ztype, _ in segments:
        seg_counts[ztype] = seg_counts.get(ztype, 0) + 1
    print(f"segment counts: {seg_counts}", file=sys.stderr)

    # Count bare cases per zone type
    print(f"\nBare counts BEFORE:", file=sys.stderr)
    for ztype in ('pre_first_chapter', 'verse', 'commentary'):
        cap, lc = count_bare_in_zones(segments, ztype)
        print(f"  {ztype:>20s}: cap={cap}, lc={lc}, total={cap+lc}",
              file=sys.stderr)

    # ---- GATE 1: pre-flight ----
    cap_pre, lc_pre = count_bare_in_zones(segments, "verse")
    expected_cap = 10
    expected_lc = 5
    expected_total = 15
    print(f"\n--- GATE 1: verse-zone bare count ---", file=sys.stderr)
    print(f"  capitalized: {cap_pre} (expected {expected_cap})  "
          f"[{'OK' if cap_pre == expected_cap else 'MISMATCH'}]",
          file=sys.stderr)
    print(f"  lowercase:   {lc_pre} (expected {expected_lc})  "
          f"[{'OK' if lc_pre == expected_lc else 'MISMATCH'}]",
          file=sys.stderr)
    print(f"  total:       {cap_pre + lc_pre} (expected {expected_total})  "
          f"[{'OK' if (cap_pre + lc_pre) == expected_total else 'MISMATCH'}]",
          file=sys.stderr)
    if cap_pre != expected_cap or lc_pre != expected_lc:
        raise RuntimeError("GATE 1 FAIL: pre-flight count mismatch — "
                          "anchors drifted")

    # Apply substitution to verse zones only
    new_segments, cap_subs, lc_subs = apply_substitution_in_verse_zones(segments)
    updated = reassemble(new_segments)
    print(f"\nsubstitution counts:", file=sys.stderr)
    print(f"  cap subs: {cap_subs}", file=sys.stderr)
    print(f"  lc subs:  {lc_subs}", file=sys.stderr)
    print(f"  total:    {cap_subs + lc_subs}", file=sys.stderr)

    # Residual gate: verse-zone bare count after sub == 0
    new_segments_check = split_verse_zones(updated)
    cap_after, lc_after = count_bare_in_zones(new_segments_check, "verse")
    print(f"\n--- RESIDUAL GATE: verse-zone bare count post-sub ---",
          file=sys.stderr)
    print(f"  cap: {cap_after}, lc: {lc_after}, total: {cap_after + lc_after}"
          f"  [{'OK' if (cap_after + lc_after) == 0 else 'MISMATCH'}]",
          file=sys.stderr)
    if cap_after + lc_after != 0:
        raise RuntimeError("RESIDUAL GATE FAIL: verse-zone bare count != 0")

    # Carve-out residual gate: commentary + pre_first_chapter bare counts
    # unchanged from pre
    pre_cap_comm, pre_lc_comm = count_bare_in_zones(segments, "commentary")
    post_cap_comm, post_lc_comm = count_bare_in_zones(new_segments_check, "commentary")
    pre_cap_pre, pre_lc_pre = count_bare_in_zones(segments, "pre_first_chapter")
    post_cap_pre, post_lc_pre = count_bare_in_zones(new_segments_check, "pre_first_chapter")
    print(f"\n--- CARVE-OUT GATE: non-verse bare counts UNCHANGED ---",
          file=sys.stderr)
    print(f"  commentary:        pre cap={pre_cap_comm} lc={pre_lc_comm}, "
          f"post cap={post_cap_comm} lc={post_lc_comm}  "
          f"[{'OK' if (pre_cap_comm, pre_lc_comm) == (post_cap_comm, post_lc_comm) else 'MISMATCH'}]",
          file=sys.stderr)
    print(f"  pre_first_chapter: pre cap={pre_cap_pre} lc={pre_lc_pre}, "
          f"post cap={post_cap_pre} lc={post_lc_pre}  "
          f"[{'OK' if (pre_cap_pre, pre_lc_pre) == (post_cap_pre, post_lc_pre) else 'MISMATCH'}]",
          file=sys.stderr)
    if (pre_cap_comm, pre_lc_comm) != (post_cap_comm, post_lc_comm):
        raise RuntimeError("CARVE-OUT GATE FAIL: commentary bare count changed")
    if (pre_cap_pre, pre_lc_pre) != (post_cap_pre, post_lc_pre):
        raise RuntimeError("CARVE-OUT GATE FAIL: pre_first_chapter bare count changed")

    # Re-parse updated .txt
    new_parsed = parse_enoch(updated)
    new_parsed_dict = asdict(new_parsed)
    if len(new_parsed_dict["books"]) != 1:
        raise RuntimeError(
            f"post-sub re-parse produced {len(new_parsed_dict['books'])} "
            f"books, expected 1 — structural regression")

    # ---- GATE 2: diffs vs live JSON ----
    with open(JSON_PATH, encoding="utf-8") as f:
        live = json.load(f)
    diffs = 0
    for pb, lb in zip(new_parsed_dict["books"], live["books"]):
        for pc, lc in zip(pb.get("chapters", []), lb.get("chapters", [])):
            for pv, lv in zip(pc.get("verses", []), lc.get("verses", [])):
                if pv.get("text") != lv.get("text"):
                    diffs += 1
            if pc.get("commentary") != lc.get("commentary"):
                diffs += 1
    sub_total = cap_subs + lc_subs
    print(f"\n--- GATE 2: structural diffs vs live JSON: {diffs} ---",
          file=sys.stderr)
    print(f"  (substitution total: {sub_total})", file=sys.stderr)

    if dry_run:
        print(f"\n=== DRY RUN — not writing ===", file=sys.stderr)
        return {
            "cap_subs": cap_subs, "lc_subs": lc_subs,
            "diffs": diffs, "size_before": orig_size,
        }

    # Backups (idempotent)
    print(f"\n--- Backups ---", file=sys.stderr)
    print(f"  .txt:  {safe_backup(TXT_PATH, TXT_BACKUP)}", file=sys.stderr)
    print(f"  .json: {safe_backup(JSON_PATH, JSON_BACKUP)}", file=sys.stderr)

    # Write
    with open(TXT_PATH, "w", encoding="utf-8") as f:
        f.write(updated)
    new_size = len(updated.encode("utf-8"))
    print(f"wrote .txt ({orig_size} → {new_size}, +{new_size - orig_size})",
          file=sys.stderr)

    with open(JSON_PATH, "w", encoding="utf-8") as f:
        json.dump(new_parsed_dict, f, ensure_ascii=False, indent=2)
        f.write("\n")
    print(f"wrote .json", file=sys.stderr)

    # ---- GATE 3: durability proof ----
    with open(TXT_PATH, encoding="utf-8") as f:
        written_txt = f.read()
    reparse = asdict(parse_enoch(written_txt))
    with open(JSON_PATH, encoding="utf-8") as f:
        written_json = json.load(f)
    reparse_str = json.dumps(reparse, ensure_ascii=False, indent=2)
    written_str = json.dumps(written_json, ensure_ascii=False, indent=2)
    if reparse_str == written_str:
        print(f"\n--- GATE 3: DURABILITY PROOF: PASS ---", file=sys.stderr)
        print(f"  reparse({len(reparse_str)}) == written_json({len(written_str)})",
              file=sys.stderr)
    else:
        raise RuntimeError("GATE 3 FAIL: re-parse of written .txt != written .json")

    print(f"\n{'='*70}\nS70 wheel #2 SUMMARY\n{'='*70}", file=sys.stderr)
    print(f"  capitalized substitutions: {cap_subs}", file=sys.stderr)
    print(f"  lowercase substitutions:   {lc_subs}", file=sys.stderr)
    print(f"  total:                     {sub_total}", file=sys.stderr)
    print(f"  size delta:                +{new_size - orig_size} bytes",
          file=sys.stderr)
    print(f"  carve-outs preserved:      commentary {post_cap_comm + post_lc_comm}, "
          f"front+back-matter {post_cap_pre + post_lc_pre}", file=sys.stderr)

    return {
        "cap_subs": cap_subs, "lc_subs": lc_subs,
        "diffs": diffs, "size_before": orig_size, "size_after": new_size,
    }


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    main(dry_run=args.dry_run)
