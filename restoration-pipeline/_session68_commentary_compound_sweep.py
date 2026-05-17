#!/usr/bin/env python3
"""
_session68_commentary_compound_sweep.py
----------------------------------------
S68 compliance wheel: apply missed compound-rule restorations in the
commentary surfaces of the four published extras editions.

DESIGN (settled at the S68 design gate after audit-then-triage):

  Audit (audit_compound_misses.py, run from outputs/) scanned commentary
  surfaces (front_matter + chapter.commentary + back_matter) across all
  five parsed editions (canon, apocrypha, enoch, jasher, jubilees) for
  every active compound rule in restore.py (28 rules; adonai_yahuah is
  dormant). The audit produced 125 raw hits. After Yoshi's
  convention-call gates the real scope is:

    canon     :  0 fires (already swept clean)
    apocrypha :  0 fires (32 audit hits all preserved per edition
                          convention — front_matter EXPLICITLY says
                          "Most High — preserved as a title without
                          sacred-name restoration"; the 8-hit
                          1-Maccabees/2-Maccabees scripture-quote
                          cluster falls under the same edition posture)
    enoch     :  0 fires (28 audit hits — 27 el_elyon_high preserved
                          per the same de-facto edition convention
                          (apocrypha/enoch family); 1 holy_spirit hit
                          in ch106 commentary is inside a citation paren
                          and stays bare per the S67 cross-ref-paren
                          carve-out precedent — nested parens would
                          read badly)
    jasher    : 35 fires (34 melchizedek in commentary + back_matter,
                          excluding the ch16 chapter title (pre-stashed)
                          and 2 possessives "Melchizedek's" which the
                          restore.py rule pattern already excludes; +
                          1 holy_spirit in ch88 commentary)
    jubilees  :  8 fires (8 melchizedek in commentary; 2 front_matter
                          MENTION carve-outs preserved — el_elyon_high
                          "Most High was restored to El Elyon (Most
                          High)" and yahuah_elohai "broke the compound
                          name the Lord my God across chapter 45 verse
                          3" — both describe what was restored rather
                          than using the names themselves)

  Carve-outs encoded:
    * jasher ch16 chapter title "The War of the Kings, Melchizedek, and
      Hagar" — pre-stashed under a placeholder before the global
      melchizedek pattern fires, restored after. The jasher chapter-title
      convention uses conventional English (Abram, Isaac, Pharaoh, etc.)
      throughout the 91 chapters, and this one Melchizedek-in-title case
      stays consistent with that convention.
    * jasher possessives "Melchizedek's order" (×2) — restore.py's
      melchizedek pattern includes `(?![A-Za-z'’])` which already
      excludes possessive forms; no special handling needed.
    * apocrypha el_elyon_high family (Most High, mighty God, everlasting
      Father, Prince of Peace, Almighty God, the Lord God, most high
      God) — edition convention; no rules applied.
    * enoch el_elyon_high family — same posture.
    * enoch ch106 (Holy Spirit) inside citation paren — same posture as
      S67 cross-ref-paren carve-out.
    * jubilees front_matter MENTION lines describing the restoration
      convention itself — bare names stay bare in meta-discussion.

  Rules (3 total across 2 modifying editions):
    R_JASHER_MELCHIZEDEK : `Melchizedek` → `Melek Tsadiq (Melchizedek)`
                           using restore.py's exact rule pattern (which
                           guards `(?<![A-Za-z'’])...(?![A-Za-z'’])` for
                           possessive exclusion and `(?!\))` for
                           idempotency on inner-Melchizedek of restored
                           form). Pre-stash carve-out for ch16 title.
    R_JASHER_HOLY_SPIRIT : `Holy Spirit|Holy Ghost` → `Ruach HaKodesh
                           (Holy <Spirit|Ghost>)` using a custom
                           HaKodesh-guarded pattern (restore.py's rule
                           has no lookbehind for already-restored cases;
                           we add `(?<!HaKodesh \()` to prevent the
                           wheel from re-substituting the 9 existing
                           `Ruach HaKodesh (Holy Spirit)` instances in
                           jasher .txt that would otherwise double-fire).
    R_JUBILEES_MELCHIZEDEK : same melchizedek rule, jubilees has no
                             possessives and no chapter-title hits, so
                             no pre-stash required.

Wheel pattern (same shape as S67, S65, S66):
  1. Read each .txt
  2. Pre-stash any per-edition carve-out fragments (jasher ch16 title)
  3. Pre-flight: each rule's anchor matches expected count (GATE 1)
  4. Apply substitutions in firing order
  5. Restore any pre-stashed fragments
  6. Re-parse the updated .txt via the matching parser
  7. Compare against live JSON (GATE 2)
  8. Write updated .txt + .json
  9. Durability proof: re-read .txt, re-parse, byte-equal to written
     .json (GATE 3)
  10. Defensive .pre-s68 backups for ALL four editions (including the
      two with zero substitutions — durability flag per S67 pattern).

Idempotent: re-running finds zero matches (melchizedek's `(?!\))`
guards the inner of restored form; holy_spirit's `(?<!HaKodesh \()`
guards the same on its restored form).
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
        "/sessions/stoic-admiring-davinci/mnt/App",
        "/sessions/tender-peaceful-cannon/mnt/App",
        "/sessions/serene-jolly-fermat/mnt/App",
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

from parse_published_editions import (  # noqa: E402
    parse_apocrypha, parse_enoch, parse_jasher, parse_jubilees
)


# ---------------------------------------------------------------------------
# Edition specs
# ---------------------------------------------------------------------------

EDITIONS = {
    "jasher": {
        "txt":   "source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/jasher.json",
        "parser": parse_jasher,
        "expected_book_count": 1,
    },
    "jubilees": {
        "txt":   "source-texts/existing-restored-editions/Jubilees-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/jubilees.json",
        "parser": parse_jubilees,
        "expected_book_count": 1,
    },
    "apocrypha": {
        "txt":   "source-texts/existing-restored-editions/Apocrypha-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/apocrypha.json",
        "parser": parse_apocrypha,
        "expected_book_count": 14,
    },
    "enoch": {
        "txt":   "source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/enoch.json",
        "parser": parse_enoch,
        "expected_book_count": 1,
    },
}


# ---------------------------------------------------------------------------
# Pre-stash carve-outs (per-edition)
# ---------------------------------------------------------------------------
# Map: edition -> [(original_fragment, placeholder), ...]
# Applied via plain str.replace BEFORE substitution; restored via the
# inverse str.replace AFTER substitution. Placeholders use a control-char
# wrapping so they cannot collide with content.

_PH_PREFIX = "\x01S68PH\x01"

PRESTASH = {
    "jasher": [
        # Jasher ch16 chapter title — preserve Melchizedek per the
        # jasher chapter-title convention (English forms).
        ("Chapter 16: The War of the Kings, Melchizedek, and Hagar",
         f"{_PH_PREFIX}JASHER_CH16_TITLE{_PH_PREFIX}"),
    ],
    "jubilees":  [],
    "apocrypha": [],
    "enoch":     [],
}


# ---------------------------------------------------------------------------
# Substitution rules per edition
# ---------------------------------------------------------------------------
#
# Each rule: (name, pattern, replacement, expected_count). Rules apply in
# the order listed.
#
# Melchizedek: uses restore.py's exact rule pattern (guarded for
# possessives, guarded for idempotency on inner-of-restored).
#
# Holy Spirit: custom-guarded variant that adds `(?<!HaKodesh \()` to
# restore.py's pattern. Necessary because restore.py's holy_spirit rule
# has no lookbehind for already-restored cases — without the guard, a
# wheel-pass on jasher .txt would double-fire on the 9 existing
# `Ruach HaKodesh (Holy Spirit)` instances and produce
# `Ruach HaKodesh (Ruach HaKodesh (Holy Spirit))`.
#
# Note on line-wrapped restorations: jasher .txt is wrapped at ~80
# columns, which means existing restorations can span a newline like
# `Ruach \n HaKodesh (Holy Spirit)`. A 16-char fixed-width lookbehind
# `(?<!Ruach HaKodesh \()` would miss the wrapped case. The shorter
# `(?<!HaKodesh \()` is unique enough (HaKodesh never appears outside
# the Ruach HaKodesh restoration) and tolerates the wrap.

MEL_PATTERN = re.compile(
    r"(?<!Melek Tsadiq \()"
    r"(?<![A-Za-z'’])"
    r"Melchi[zs]ede[ck]h?"
    r"(?![A-Za-z'’])"
    r"(?!\))"
)

HS_PATTERN = re.compile(
    r"(?<!HaKodesh \()"
    r"(?<![A-Za-z'’])"
    r"Holy\s+(Spirit|Ghost)"
    r"(?![A-Za-z'’])"
)

R_MELCHIZEDEK = ("melchizedek", MEL_PATTERN, r"Melek Tsadiq (Melchizedek)")
R_HOLY_SPIRIT = ("holy_spirit", HS_PATTERN, r"Ruach HaKodesh (Holy \1)")


# Per-edition rules + pre-flight expected counts (after pre-stash applied).
RULES_BY_EDITION = {
    "jasher": [
        (*R_MELCHIZEDEK, 34),   # 35 raw - 1 ch16 title (pre-stashed) = 34
        (*R_HOLY_SPIRIT, 1),    # ch88 commentary
    ],
    "jubilees": [
        (*R_MELCHIZEDEK, 8),    # all in commentary, no possessives, no titles
    ],
    "apocrypha": [],   # no rules — edition convention preserved
    "enoch":     [],   # no rules — edition convention preserved
}


# Expected residual matches AFTER substitution. The substitution patterns
# are idempotent (guarded), so any post-wheel matches are the preserved
# carve-outs. For Jasher the title placeholder is restored AFTER the
# substitution pass, so the post-substitution count of restore.py's mel
# pattern against the restored .txt should equal 1 (the preserved title).
EXPECTED_RESIDUAL = {
    "jasher":    {"melchizedek": 1, "holy_spirit": 0},
    "jubilees":  {"melchizedek": 0},
    # apocrypha and enoch: nothing modified, so no residual gate.
}


# ---------------------------------------------------------------------------
# Per-edition wheel
# ---------------------------------------------------------------------------

def _apply_prestash(text: str, items):
    out = text
    for original, ph in items:
        if original not in out:
            raise RuntimeError(f"pre-stash fragment not found in text: {original[:60]!r}…")
        if out.count(original) != 1:
            raise RuntimeError(
                f"pre-stash fragment is not unique (count={out.count(original)}): {original[:60]!r}…"
            )
        out = out.replace(original, ph)
    return out


def _restore_prestash(text: str, items):
    out = text
    for original, ph in items:
        if ph not in out:
            raise RuntimeError(f"placeholder missing on restore: {ph!r}")
        out = out.replace(ph, original)
    return out


def run_edition(name: str, dry_run: bool = False) -> dict:
    spec = EDITIONS[name]
    txt_path  = os.path.join(APP, spec["txt"])
    json_path = os.path.join(APP, spec["json"])
    txt_backup  = txt_path  + ".pre-s68"
    json_backup = json_path + ".pre-s68"
    rules = RULES_BY_EDITION[name]
    prestash = PRESTASH[name]

    print(f"\n{'='*70}\nEDITION: {name}\n{'='*70}", file=sys.stderr)
    print(f"txt:  {txt_path}",  file=sys.stderr)
    print(f"json: {json_path}", file=sys.stderr)

    with open(txt_path, encoding="utf-8") as f:
        original = f.read()
    orig_size = len(original.encode("utf-8"))
    print(f"original size: {orig_size:>9d} bytes", file=sys.stderr)

    # Pre-flight structural check
    pre = spec["parser"](original)
    if len(pre.books) != spec["expected_book_count"]:
        raise RuntimeError(
            f"{name}: expected {spec['expected_book_count']} books, "
            f"got {len(pre.books)}"
        )

    # ---- Pre-stash carve-outs ----
    if prestash:
        print(f"\n--- pre-stash ({name}): {len(prestash)} fragment(s) ---", file=sys.stderr)
        for original_frag, ph in prestash:
            print(f"  stash: {original_frag[:80]!r}", file=sys.stderr)
    staged = _apply_prestash(original, prestash)

    # ---- GATE 1: pre-flight anchor counts ----
    print(f"\n--- GATE 1: pre-flight anchor counts ({name}) ---", file=sys.stderr)
    if not rules:
        print(f"  (no rules for {name} — defensive backup pass only)", file=sys.stderr)
    else:
        all_ok = True
        for rname, pat, _repl, expected in rules:
            actual = len(pat.findall(staged))
            ok = (actual == expected)
            marker = "OK" if ok else "MISMATCH"
            print(
                f"  {rname:>20s}: {actual} matches (expected {expected}) [{marker}]",
                file=sys.stderr,
            )
            if not ok:
                all_ok = False
        if not all_ok:
            raise RuntimeError(f"{name}: pre-flight count mismatch — anchors drifted")

    # Apply substitutions
    updated_staged = staged
    counts = {}
    for rname, pat, repl, _ in rules:
        new_text, count = pat.subn(repl, updated_staged)
        counts[rname] = count
        updated_staged = new_text

    if counts:
        print(f"\nsubstitution counts ({name}):", file=sys.stderr)
        for rname, n in counts.items():
            print(f"  {rname:>20s}: {n}", file=sys.stderr)

    # ---- Restore pre-stashed carve-outs ----
    updated = _restore_prestash(updated_staged, prestash)

    # ---- Residual carve-out gate ----
    if name in EXPECTED_RESIDUAL:
        print(f"\n--- residual carve-out gate ({name}) ---", file=sys.stderr)
        expected_res = EXPECTED_RESIDUAL[name]
        for rname, pat, _repl, _ in rules:
            actual_res = len(pat.findall(updated))
            exp = expected_res.get(rname, 0)
            ok = (actual_res == exp)
            marker = "OK" if ok else "MISMATCH"
            print(
                f"  residual {rname:>20s}: {actual_res} (expected {exp}) [{marker}]",
                file=sys.stderr,
            )
            if not ok:
                raise RuntimeError(
                    f"{name}: post-wheel residual {rname}={actual_res} != expected {exp}"
                )

    # Re-parse the updated .txt
    new_parsed = spec["parser"](updated)
    new_parsed_dict = asdict(new_parsed)

    if len(new_parsed_dict["books"]) != spec["expected_book_count"]:
        raise RuntimeError(
            f"{name}: post-substitution re-parse produced "
            f"{len(new_parsed_dict['books'])} books, expected "
            f"{spec['expected_book_count']} — structural regression"
        )

    # ---- GATE 2: diffs vs live JSON ----
    with open(json_path, encoding="utf-8") as f:
        live = json.load(f)

    diffs = 0
    for pb, lb in zip(new_parsed_dict["books"], live["books"]):
        for pc, lc in zip(pb.get("chapters", []), lb.get("chapters", [])):
            for pv, lv in zip(pc.get("verses", []), lc.get("verses", [])):
                if pv.get("text") != lv.get("text"):
                    diffs += 1
            if pc.get("commentary") != lc.get("commentary"):
                diffs += 1

    sub_total = sum(counts.values())
    print(f"\n--- GATE 2: structural diffs vs live JSON: {diffs} ---", file=sys.stderr)
    print(f"  (substitution total: {sub_total})", file=sys.stderr)

    if dry_run:
        print(f"\n=== DRY RUN — not writing {name} ===", file=sys.stderr)
        return {
            "edition": name,
            "sub_total": sub_total,
            "counts": counts,
            "diffs": diffs,
        }

    # Defensive backups for ALL editions (incl. zero-sub passes — S67 pattern)
    if not os.path.exists(txt_backup):
        shutil.copy2(txt_path, txt_backup)
        print(f"backed up .txt to {txt_backup}", file=sys.stderr)
    if not os.path.exists(json_backup):
        shutil.copy2(json_path, json_backup)
        print(f"backed up .json to {json_backup}", file=sys.stderr)

    # Skip writes if no changes
    if sub_total == 0 and diffs == 0:
        print(f"no changes for {name} — skipping write (defensive backup tagged)",
              file=sys.stderr)
        return {
            "edition": name,
            "sub_total": 0,
            "counts": counts,
            "diffs": 0,
        }

    # Write updated .txt
    with open(txt_path, "w", encoding="utf-8") as f:
        f.write(updated)
    new_size = len(updated.encode("utf-8"))
    print(f"wrote updated .txt to {txt_path} ({orig_size} → {new_size} bytes, "
          f"+{new_size-orig_size})", file=sys.stderr)

    # Write new .json (canonical form: ensure_ascii=False, indent=2)
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(new_parsed_dict, f, ensure_ascii=False, indent=2)
        f.write("\n")
    print(f"wrote updated .json to {json_path}", file=sys.stderr)

    # ---- GATE 3: Durability proof ----
    with open(txt_path, encoding="utf-8") as f:
        written_txt = f.read()
    reparse = asdict(spec["parser"](written_txt))
    with open(json_path, encoding="utf-8") as f:
        written_json = json.load(f)
    reparse_str = json.dumps(reparse, ensure_ascii=False, indent=2)
    written_str = json.dumps(written_json, ensure_ascii=False, indent=2)
    if reparse_str == written_str:
        print(f"\n--- GATE 3: DURABILITY PROOF ({name}): PASS ---", file=sys.stderr)
        print(f"  reparse({len(reparse_str)}) == written_json({len(written_str)})",
              file=sys.stderr)
    else:
        raise RuntimeError(
            f"{name}: DURABILITY PROOF FAIL — re-parse of written .txt "
            f"doesn't equal written .json"
        )

    return {
        "edition": name,
        "sub_total": sub_total,
        "counts": counts,
        "diffs": diffs,
        "size_before": orig_size,
        "size_after": new_size,
    }


def main(dry_run: bool = False, editions=None):
    print(f"APP = {APP}", file=sys.stderr)
    targets = editions or list(EDITIONS.keys())
    results = []
    for name in targets:
        try:
            r = run_edition(name, dry_run=dry_run)
            results.append(r)
        except Exception as e:
            print(f"\n!!! ERROR processing {name}: {e}", file=sys.stderr)
            raise

    print(f"\n\n{'='*70}\nS68 SUMMARY (dry_run={dry_run})\n{'='*70}", file=sys.stderr)
    print(f"{'edition':>10s}  {'subs':>5s}  {'diffs':>5s}", file=sys.stderr)
    for r in results:
        print(f"{r['edition']:>10s}  {r['sub_total']:>5d}  {r['diffs']:>5d}",
              file=sys.stderr)
    total_subs = sum(r["sub_total"] for r in results)
    print(f"\ntotal substitutions: {total_subs}", file=sys.stderr)
    return results


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--editions", nargs="*", default=None,
                    help="subset of editions to run (default: all)")
    args = ap.parse_args()
    main(dry_run=args.dry_run, editions=args.editions)
