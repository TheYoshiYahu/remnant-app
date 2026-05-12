#!/usr/bin/env python3
"""
patch_bensly_into_apocrypha.py
-------------------------------
W-3b inline-restoration of the Bensly fragment into the existing apocrypha
edition's 2 Esdras chapter 7.

Per _CHARLES_VOL2_BOUNDARIES.md Decisions §3(a) (Yoshi's call session 20,
locked): lift Charles 1913 vol 2's 4 Ezra chapter 7 verses 36-105 (the
Bensly fragment, recovered from the 1875 Codex Sangermanensis after the
Latin-text omission in the medieval transmission stream that produced the
KJV 1611 Apocrypha's 2 Esdras 7 v35 → v36 jump) and slot them between
v35 and the existing v36 of the parsed apocrypha edition's 2 Esdras
chapter 7. Renumber existing v36-70 → v106-140 to match canonical 2 Esdras
numbering.

This script is intentionally one-shot and reproducible: it always reads
the canonical source files (apocrypha.json and pseudepigrapha-charles-vol2.json)
and writes apocrypha.json. Running it more than once is idempotent — the
v36-v105 slot already containing Bensly verses indicates the patch has been
applied, and the script skips the renumber + slot step.

The Bensly verses come from charles-pseudepigrapha-restored.txt — already
restore.py-stamped session 22 (idempotency PASS). Sacred-name parentheticals
are present on the new verses; no additional restore.py pass is needed.

Reads:
  ~/Desktop/App/source-texts/parsed/apocrypha.json
  ~/Desktop/App/source-texts/parsed/pseudepigrapha-charles-vol2.json
Writes:
  ~/Desktop/App/source-texts/parsed/apocrypha.json   (in place; backs up to .pre-bensly first)
"""

from __future__ import annotations
import json
import os
import shutil
import sys


def _resolve_root() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    script_dir = os.path.dirname(os.path.abspath(__file__))
    candidate = os.path.dirname(script_dir)
    if os.path.isdir(os.path.join(candidate, "source-texts")):
        return candidate
    return host


ROOT = _resolve_root()
APOCRYPHA_PATH = os.path.join(ROOT, "source-texts", "parsed", "apocrypha.json")
PSEUDEPIGRAPHA_PATH = os.path.join(ROOT, "source-texts", "parsed", "pseudepigrapha-charles-vol2.json")
BACKUP_PATH = APOCRYPHA_PATH + ".pre-bensly"


def find_book(edition: dict, book_id: str) -> dict:
    for b in edition["books"]:
        if b["book_id"] == book_id:
            return b
    raise KeyError(f"book_id={book_id!r} not found in edition_id={edition['edition_id']!r}")


def find_chapter_by_number(book: dict, number: int) -> dict:
    for ch in book["chapters"]:
        if ch["number"] == number:
            return ch
    raise KeyError(f"chapter.number={number} not found in book_id={book['book_id']!r}")


def find_chapter_by_title(book: dict, title: str) -> dict:
    for ch in book["chapters"]:
        if ch["title"] == title:
            return ch
    raise KeyError(f"chapter.title={title!r} not found in book_id={book['book_id']!r}")


def already_patched(ch7: dict) -> bool:
    """
    Detect whether 2 Esdras chapter 7 already carries the Bensly fragment.
    Heuristic: any verse with number in the canonical Bensly range (36-105)
    AND a max verse number ≥ 106 = already patched. Pre-patch state has
    35 verses 1-35 then a v36 (KJV-style — Nathan's vision answer) and tops
    out at v70.
    """
    nums = [v["number"] for v in ch7["verses"]]
    if not nums:
        return False
    has_bensly_range = any(36 <= n <= 105 for n in nums)
    has_post_106 = max(nums) >= 106
    return has_bensly_range and has_post_106


def main() -> int:
    if not os.path.exists(APOCRYPHA_PATH):
        print(f"[error] apocrypha.json not found: {APOCRYPHA_PATH}", file=sys.stderr)
        return 2
    if not os.path.exists(PSEUDEPIGRAPHA_PATH):
        print(
            f"[error] pseudepigrapha-charles-vol2.json not found: {PSEUDEPIGRAPHA_PATH}",
            file=sys.stderr,
        )
        return 2

    with open(APOCRYPHA_PATH, "r", encoding="utf-8") as fh:
        apocrypha = json.load(fh)
    with open(PSEUDEPIGRAPHA_PATH, "r", encoding="utf-8") as fh:
        pseudepigrapha = json.load(fh)

    # Locate the donor: pseudepigrapha 4-ezra Chapter 7 (canonical chapter
    # number 7, indexed as chapter.title="Chapter 7" in the structural
    # parser's sequential-numbering scheme).
    four_ezra = find_book(pseudepigrapha, "4-ezra")
    donor_ch7 = find_chapter_by_title(four_ezra, "Chapter 7")

    # Locate the recipient: apocrypha 2-esdras chapter 7.
    two_esdras = find_book(apocrypha, "2-esdras")
    recipient_ch7 = find_chapter_by_number(two_esdras, 7)

    pre_count = len(recipient_ch7["verses"])
    if already_patched(recipient_ch7):
        print(
            f"[skip] 2 Esdras chapter 7 already carries the Bensly fragment "
            f"(verse count={pre_count}, top verse={max(v['number'] for v in recipient_ch7['verses'])})"
        )
        return 0

    # Extract Bensly verses (canonical 4 Ezra 7:36-105) from the donor.
    bensly_verses = [
        v for v in donor_ch7["verses"] if 36 <= int(v["number"]) <= 105
    ]
    bensly_count = len(bensly_verses)
    bensly_expected_max = 70  # canonical 36..105 inclusive
    print(
        f"[donor] 4 Ezra chapter 7: extracted {bensly_count} Bensly verses "
        f"(canonical range 36-105; expected {bensly_expected_max} if no OCR loss)"
    )

    # Partition the recipient: pre-Bensly v1-v35 vs. post-Bensly v36-v70
    # (which renumber to v106-v140 with +70 offset).
    pre_bensly = [v for v in recipient_ch7["verses"] if int(v["number"]) <= 35]
    post_bensly_old = [v for v in recipient_ch7["verses"] if int(v["number"]) >= 36]

    pre_count_a = len(pre_bensly)
    post_count_a = len(post_bensly_old)
    print(
        f"[recipient] 2 Esdras chapter 7 pre-patch: {pre_count} verses "
        f"({pre_count_a} pre-Bensly v1-v35 + {post_count_a} post-Bensly v36-v70 to renumber)"
    )

    # Renumber the post-Bensly tail: v36 → v106, v37 → v107, ..., v70 → v140.
    # Offset is +70 (105 - 35 = 70, matching the Bensly fragment's canonical span).
    OFFSET = 70
    post_bensly_new = [
        {"number": int(v["number"]) + OFFSET, "text": v["text"]}
        for v in post_bensly_old
    ]

    # Assemble: pre-Bensly + Bensly + renumbered post-Bensly.
    # Sort by verse number for safety against any OCR-induced ordering
    # quirks in the donor verses.
    merged = pre_bensly + bensly_verses + post_bensly_new
    merged.sort(key=lambda v: int(v["number"]))
    recipient_ch7["verses"] = merged

    post_count = len(recipient_ch7["verses"])
    delta = post_count - pre_count
    top_num = max(int(v["number"]) for v in recipient_ch7["verses"])
    print(
        f"[result] 2 Esdras chapter 7 post-patch: {post_count} verses "
        f"(top verse={top_num}; delta=+{delta})"
    )

    # Back up the original before writing.
    if not os.path.exists(BACKUP_PATH):
        shutil.copy2(APOCRYPHA_PATH, BACKUP_PATH)
        print(f"[backup] {BACKUP_PATH}")

    with open(APOCRYPHA_PATH, "w", encoding="utf-8") as fh:
        json.dump(apocrypha, fh, ensure_ascii=False, indent=2)
    print(f"[write] {APOCRYPHA_PATH}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
