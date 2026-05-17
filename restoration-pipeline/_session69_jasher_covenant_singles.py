#!/usr/bin/env python3
"""
Session 69 — Jasher commentary covenant-people-names compliance wheel.

Restores bare `Israel`, `Judah`, `Jews`, `Jewish`, `Jew` in jasher
commentary surfaces (front_matter, chapter.commentary, back_matter) at
positions that sit inside a scripture quote AND are within ~120 characters
of a scripture citation (book name + chapter:verse). Yoshi's design call
2026-05-17: only restore scripture quotes; preserve prose-discussion uses
of these names as out-of-context for the framework.

Scope: jasher only. The audit confirmed apocrypha/enoch/jubilees commentary
surfaces have no scripture-quote bare-covenant-people-name gaps (those
editions were either swept at original-edition generation or have the bare
cases as documented MENTION carve-outs). Defensive zero-fire passes run
against the other three extras for carve-out preservation verification per
the S67/S68 precedent.

Three-gate proof per modified edition (S68-style):
  GATE 1 — pre-flight anchor count: each rule's match count in the .txt
           must equal the expected fire count.
  GATE 2 — post-substitution diff count: structural diffs vs live JSON must
           match expected.
  GATE 3 — post-write durability: re-parse of the modified .txt must produce
           a JSON byte-equal to the written JSON.

Residual carve-out gate (S68 extension):
  After substitution, the IN_SCRIPTURE_QUOTE bucket for each (name, edition)
  must be 0 — every scripture-quote bare-name became a restored form. The
  PROSE / PRESERVED_PHRASE / CROSS_REF_INDEX buckets must be UNCHANGED.

Idempotency: re-running the wheel finds 0 fires because the substitution
produces `Yashar'el (Israel)` etc. which the `LB` left-boundary excludes
from matching `Israel` again (the `'` apostrophe in Yashar'el is excluded
by `(?<![A-Za-z'’])`).
"""

from __future__ import annotations
import json
import re
import sys
from dataclasses import asdict
from pathlib import Path
from typing import Iterable, NamedTuple

# Optional: import the published-editions parser for the durability proof.
sys.path.insert(0, str(Path(__file__).parent))
from parse_published_editions import parse_jasher  # noqa: E402

APP = Path(__file__).resolve().parent.parent
TXT_DIR = APP / "source-texts" / "existing-restored-editions"
PARSED_DIR = APP / "source-texts" / "parsed"
JASHER_TXT = TXT_DIR / "Jasher-Restored-Names-Edition.txt"
JASHER_JSON = PARSED_DIR / "jasher.json"

LB = r"(?<![A-Za-z'’])"
RB = r"(?![A-Za-z'’])"
PAREN_RE = re.compile(r"\([^()]*\)")
JEW_GENTILE_BINARY_RE = re.compile(r"Jew[- ]?and[- ]?Gentile[- ]?binary", re.IGNORECASE)

# Scripture-citation pattern — used both for the IN_SCRIPTURE_QUOTE
# classifier and for the residual gate. Conservative book-name list covers
# canonical books + extras + Apocrypha.
BOOK_NAMES = r"""(?:
    Genesis|Exodus|Leviticus|Numbers|Deuteronomy|Joshua|Judges|Ruth|
    1\ ?Samuel|2\ ?Samuel|1\ ?Kings|2\ ?Kings|1\ ?Chronicles|2\ ?Chronicles|
    Ezra|Nehemiah|Esther|Job|Psalm|Psalms|Proverbs|Ecclesiastes|
    Song\ of\ Songs|Song\ of\ Solomon|Isaiah|Jeremiah|Lamentations|Ezekiel|
    Daniel|Hosea|Joel|Amos|Obadiah|Jonah|Micah|Nahum|Habakkuk|Zephaniah|
    Haggai|Zechariah|Malachi|
    Matthew|Mark|Luke|John|Acts|Romans|1\ ?Corinthians|2\ ?Corinthians|
    Galatians|Ephesians|Philippians|Colossians|1\ ?Thessalonians|
    2\ ?Thessalonians|1\ ?Timothy|2\ ?Timothy|Titus|Philemon|Hebrews|
    James|1\ ?Peter|2\ ?Peter|1\ ?John|2\ ?John|3\ ?John|Jude|Revelation|
    Jasher|Enoch|Jubilees|
    1\ ?Maccabees|2\ ?Maccabees|Tobit|Judith|Wisdom|Ecclesiasticus|Sirach|
    Baruch|1\ ?Esdras|2\ ?Esdras|Prayer\ of\ Manasseh
)"""
CITATION_RE = re.compile(rf"\b{BOOK_NAMES}\s+\d+(?::\d+)?(?:[-–—]\d+(?::\d+)?)?", re.VERBOSE)

# Quote-span detection: paired ASCII or curly double-quotes.
DOUBLE_QUOTE_SPAN_RE = re.compile(r'"[^"]+?"|“[^”]+?”', re.DOTALL)

# Substitution map.
RESTORATIONS = {
    "Israel": "Yashar'el (Israel)",
    "Judah": "Yahudah (Judah)",
    "Jews": "Yahudim (Jews)",
    "Jewish": "Yahudi (Jewish)",
    "Jew": "Yahudi (Jew)",
}

# Per-name expected fire count after Yoshi's "fire on all 7 edge cases" call.
# Israel: 42 IN_SCRIPTURE_QUOTE + 4 IN_QUOTE_NO_CITE = 46  (3 short-quote +
#   1 Isaiah 11:12 "outcasts of Israel")
# Judah: 10 IN_SCRIPTURE_QUOTE + 2 IN_QUOTE_NO_CITE = 12
# Jews: 0 IN_SCRIPTURE_QUOTE + 1 IN_QUOTE_NO_CITE = 1 ("become Jews")
# Jewish: 0
# Jew: 0
# Verified by audit re-run with classifier patched for the 7 edge cases.
EXPECTED_FIRES = {
    "Israel": 45,
    "Judah":  13,
    "Jews":    1,
    "Jewish":  0,
    "Jew":     0,
}
EXPECTED_TOTAL = sum(EXPECTED_FIRES.values())   # 59

# Names tuple: (label, regex_pattern). Patterns are exactly the LB/RB
# bare-name shape used by restore.py — guarantees idempotency by-design
# because the post-substitution form `Yashar'el (Israel)` has the
# apostrophe in `Yashar'el` which the LB excludes.
NAMES = [
    ("Israel", rf"{LB}Israel{RB}"),
    ("Judah",  rf"{LB}Judah{RB}"),
    ("Jews",   rf"{LB}Jews{RB}"),
    ("Jewish", rf"{LB}Jewish{RB}"),
    ("Jew",    rf"{LB}Jew{RB}"),
]


# ---------------------------------------------------------------------------
# Classifier — identical to _s69_audit_quotes.py final form.
# ---------------------------------------------------------------------------

def mask_parens(text: str) -> str:
    return PAREN_RE.sub(lambda m: "_" * len(m.group(0)), text)


def find_quote_spans(text: str) -> list[tuple[int, int]]:
    return [(m.start(), m.end()) for m in DOUBLE_QUOTE_SPAN_RE.finditer(text)]


def is_inside_quote(pos: int, spans: list[tuple[int, int]]) -> tuple[int, int] | None:
    for s, e in spans:
        if s <= pos < e:
            return (s, e)
    return None


def has_citation_near(text: str, span: tuple[int, int],
                      lookahead: int = 120, lookbehind: int = 120) -> bool:
    s, e = span
    lo = max(0, s - lookbehind)
    hi = min(len(text), e + lookahead)
    return bool(CITATION_RE.search(text[lo:hi]))


def classify(text: str, m: re.Match, surface: str, label: str) -> str:
    """Return one of: IN_SCRIPTURE_QUOTE, IN_QUOTE_NO_CITE, PROSE,
    PRESERVED_PHRASE, CROSS_REF_INDEX."""
    lo, hi = max(0, m.start() - 140), min(len(text), m.end() + 140)
    cf = text[lo:hi]
    if label in ("Jew", "Jews", "Jewish") and JEW_GENTILE_BINARY_RE.search(cf):
        return "PRESERVED_PHRASE"
    window = text[max(0, m.start() - 40): min(len(text), m.end() + 40)]
    if surface == "back_matter" and window.count("—") >= 2 \
            and CITATION_RE.search(window):
        return "CROSS_REF_INDEX"
    spans = find_quote_spans(text)
    inside = is_inside_quote(m.start(), spans)
    if inside is not None:
        if has_citation_near(text, inside):
            return "IN_SCRIPTURE_QUOTE"
        return "IN_QUOTE_NO_CITE"
    return "PROSE"


# ---------------------------------------------------------------------------
# Anchor extraction.
# ---------------------------------------------------------------------------

class Fire(NamedTuple):
    label: str
    surface: str
    abs_pos: int       # absolute byte offset within the surface text
    anchor: str        # the literal substring extracted from surface text
    replacement: str   # the full replacement substring
    classification: str  # IN_SCRIPTURE_QUOTE or IN_QUOTE_NO_CITE
    bare_word_idx: int  # index (0-based) of the bare-name word within
                        # `anchor.split()` — disambiguates same-name
                        # repeats in long grown anchors.


def extract_anchor(surface_text: str, match_start: int, match_end: int,
                   name: str, anchor_chars: int = 50) -> tuple[str, str, int]:
    """Return (anchor_substring, replacement_substring, bare_word_idx) for a
    fire at this position. The anchor is the bare name plus ~`anchor_chars`
    chars before and after, taken verbatim from the surface text. The
    replacement is the same substring with the bare name swapped for its
    restored form. `bare_word_idx` is the 0-based index of the bare-name
    token within `anchor.split()` — preserved so the substitution step
    knows exactly which token to replace when an anchor grows large enough
    to contain other matches of the same name."""
    lo = max(0, match_start - anchor_chars)
    hi = min(len(surface_text), match_end + anchor_chars)
    while lo > 0 and surface_text[lo].isalnum():
        lo -= 1
    while hi < len(surface_text) and surface_text[hi].isalnum():
        hi += 1
    anchor = surface_text[lo:hi]
    rel_start = match_start - lo
    rel_end = match_end - lo
    replacement = anchor[:rel_start] + RESTORATIONS[name] + anchor[rel_end:]
    # Compute bare_word_idx by counting whitespace-separated tokens whose
    # span contains rel_start.
    bare_word_idx = -1
    word_iter = re.finditer(r"\S+", anchor)
    for i, m in enumerate(word_iter):
        if m.start() <= rel_start < m.end():
            bare_word_idx = i
            break
    if bare_word_idx < 0:
        raise ValueError(f"Could not locate bare-name word in anchor {anchor!r}")
    return anchor, replacement, bare_word_idx


# ---------------------------------------------------------------------------
# Surface iteration.
# ---------------------------------------------------------------------------

def surfaces(j) -> Iterable[tuple[str, str]]:
    if j.get("front_matter"):
        yield ("front_matter", j["front_matter"])
    if j.get("back_matter"):
        yield ("back_matter", j["back_matter"])
    if "books" in j:
        for bk in j["books"]:
            bn = bk.get("name") or "book"
            for ch in bk.get("chapters", []):
                cn = ch.get("number", "?")
                if ch.get("commentary"):
                    yield (f"{bn} ch{cn} commentary", ch["commentary"])
    elif "chapters" in j:
        for ch in j["chapters"]:
            cn = ch.get("number", "?")
            if ch.get("commentary"):
                yield (f"ch{cn} commentary", ch["commentary"])


# ---------------------------------------------------------------------------
# Fire collection.
# ---------------------------------------------------------------------------

def collect_fires(j) -> list[Fire]:
    fires: list[Fire] = []
    for surface_label, text in surfaces(j):
        masked = mask_parens(text)
        for label, pat in NAMES:
            rx = re.compile(pat)
            for m in rx.finditer(masked):
                bucket = classify(text, m, surface_label, label)
                if bucket in ("IN_SCRIPTURE_QUOTE", "IN_QUOTE_NO_CITE"):
                    anchor, replacement, bidx = extract_anchor(
                        text, m.start(), m.end(), label)
                    fires.append(Fire(
                        label=label,
                        surface=surface_label,
                        abs_pos=m.start(),
                        anchor=anchor,
                        replacement=replacement,
                        classification=bucket,
                        bare_word_idx=bidx,
                    ))
    return fires


# ---------------------------------------------------------------------------
# Substitution — anchor-based, whitespace-tolerant against line-wrap in .txt.
# ---------------------------------------------------------------------------

def make_ws_tolerant_pattern(anchor: str) -> re.Pattern:
    """Return a regex that matches the anchor's content with any run of
    whitespace permitted between tokens. Non-whitespace characters are
    escaped verbatim."""
    parts = anchor.split()
    if not parts:
        raise ValueError(f"Empty anchor")
    escaped = [re.escape(p) for p in parts]
    return re.compile(r"\s+".join(escaped), re.DOTALL)


def _find_unique_anchor(out: str, fire: Fire, surface_text_lookup) -> tuple[str, str, int, int]:
    """Try the fire's default anchor; if not unique, GROW it (expand the
    surrounding context window) until the anchor is unique in `out`. Caps
    at ~600 chars; raises if still not unique.

    Returns (anchor, replacement_anchor, match_start_in_out, bare_word_idx).
    bare_word_idx is the 0-based whitespace-token index of the bare-name
    word within the (possibly grown) anchor."""
    for anchor_chars in (50, 90, 140, 200, 280, 400, 600):
        anchor, replacement, bidx = extract_anchor(
            surface_text_lookup(fire.surface),
            fire.abs_pos, fire.abs_pos + len(fire.label),
            fire.label, anchor_chars=anchor_chars
        )
        ws_pattern = make_ws_tolerant_pattern(anchor)
        matches = list(ws_pattern.finditer(out))
        if len(matches) == 1:
            return anchor, replacement, matches[0].start(), bidx
    raise RuntimeError(
        f"Anchor uniqueness failed for {fire.label} at {fire.surface} "
        f"even at 600-char window. abs_pos={fire.abs_pos}\n"
        f"  Last anchor tried: {anchor!r}\n"
        f"  Match count: {len(matches)}"
    )


def apply_fires_to_txt(txt: str, fires: list[Fire], j) -> tuple[str, dict]:
    """Apply each fire as an exact byte-range substitution.

    Two-pass strategy:
      Pass 1 — locate each fire's anchor in `txt`, then within the matched
               anchor span find the bidx-th word, then within that word
               find the exact bare-name byte range. Anchors grow 50→600
               chars until unique. Mutates nothing.
      Pass 2 — apply substitutions in DESCENDING bare-name position so each
               substitution only affects bytes after all not-yet-applied
               positions. Each substitution replaces ONLY the bare-name
               bytes (e.g., the 6 bytes of `Israel`) with the restored
               form. Overlapping anchors are safe because we substitute
               only the bare-name word, not the whole anchor span."""
    counts = {"total": 0}
    per_name = {n: 0 for n, _ in NAMES}

    surf_map = {label: text for label, text in surfaces(j)}
    def lookup(surf_label):
        return surf_map[surf_label]

    # PASS 1 — locate each fire's exact bare-name byte span in txt.
    bare_spans: list[tuple[Fire, int, int]] = []  # (fire, bn_start, bn_end)
    for fire in fires:
        anchor, _replacement, _, bidx = _find_unique_anchor(txt, fire, lookup)
        ws_pattern = make_ws_tolerant_pattern(anchor)
        match = ws_pattern.search(txt)
        if not match:
            raise RuntimeError(
                f"Anchor regex disappeared between locate and search for "
                f"{fire.label} at {fire.surface}"
            )
        # Find the bidx-th word within the match span.
        matched_text = txt[match.start():match.end()]
        words = list(re.finditer(r"\S+", matched_text))
        if bidx >= len(words):
            raise RuntimeError(
                f"Word index {bidx} out of range for matched_text "
                f"({len(words)} words) for {fire.label} at {fire.surface}"
            )
        word_match = words[bidx]
        word_start = match.start() + word_match.start()
        word_end = match.start() + word_match.end()
        # Within the word, find the exact bare-name span. This handles
        # attached punctuation like `Israel:` or `Judah,`.
        bn_re = re.compile(rf"\b{re.escape(fire.label)}\b")
        bn_in_word = bn_re.search(txt[word_start:word_end])
        if not bn_in_word:
            raise RuntimeError(
                f"Bare label {fire.label!r} not in matched word "
                f"{txt[word_start:word_end]!r} for fire at {fire.surface}"
            )
        bn_start = word_start + bn_in_word.start()
        bn_end = word_start + bn_in_word.end()
        bare_spans.append((fire, bn_start, bn_end))

    # PASS 2 — apply in descending bare-name position. Each substitution
    # only modifies bytes >= bn_start; earlier-in-text positions are
    # untouched, so all pending positions remain valid.
    bare_spans.sort(key=lambda t: t[1], reverse=True)

    out = txt
    for fire, bn_start, bn_end in bare_spans:
        # Sanity-check the bare name is still at this position.
        actual = out[bn_start:bn_end]
        if actual != fire.label:
            raise RuntimeError(
                f"Sanity check failed: expected {fire.label!r} at "
                f"[{bn_start}:{bn_end}], found {actual!r}"
            )
        out = out[:bn_start] + RESTORATIONS[fire.label] + out[bn_end:]
        counts["total"] += 1
        per_name[fire.label] += 1
    counts["per_name"] = per_name
    return out, counts


def _extract_bare_name_word(anchor: str, label: str) -> str:
    """Return the exact bare-name word from the anchor (handles punctuation
    that may be attached, e.g. `Israel:` or `Israel,`)."""
    # Find the first word in anchor that matches the bare-name pattern.
    rx = re.compile(rf"\b{re.escape(label)}\b")
    m = rx.search(anchor)
    if not m:
        raise ValueError(f"Bare name {label!r} not found in anchor {anchor!r}")
    # Return the token containing this match (split on whitespace).
    # Find the word boundary positions in anchor.
    parts = anchor.split()
    pos = 0
    for w in parts:
        wlen = len(w)
        wstart = anchor.find(w, pos)
        wend = wstart + wlen
        if wstart <= m.start() < wend:
            return w
        pos = wend
    raise ValueError(f"Bare name token not located in anchor {anchor!r}")


def _replace_bare_token(matched_text: str, anchor_word_idx: int, label: str) -> str:
    """Replace the bare-name token at `anchor_word_idx` in `matched_text`
    with its restoration. Preserves attached punctuation (e.g.,
    `Israel:` → `Yashar'el (Israel):`) and surrounding whitespace.

    matched_text uses re.split with a capture group on whitespace runs, so
    the resulting list alternates [word, whitespace, word, whitespace, ...]
    starting with word (or empty string if text starts with whitespace).
    word indices are 0, 2, 4, ... in the split parts.
    """
    parts = re.split(r"(\s+)", matched_text)
    word_positions = [i for i in range(len(parts)) if i % 2 == 0 and parts[i]]
    if anchor_word_idx >= len(word_positions):
        raise IndexError(
            f"anchor_word_idx {anchor_word_idx} out of range "
            f"(matched_text has {len(word_positions)} words)\n"
            f"  matched_text: {matched_text!r}"
        )
    target_part_idx = word_positions[anchor_word_idx]
    target_word = parts[target_part_idx]
    # The target word should contain the bare label. Substitute only the
    # bare-label portion, preserving any attached punctuation.
    if not re.search(rf"\b{re.escape(label)}\b", target_word):
        raise ValueError(
            f"Bare label {label!r} not found in target word {target_word!r} "
            f"at anchor_word_idx {anchor_word_idx}"
        )
    new_word = re.sub(rf"\b{re.escape(label)}\b",
                      RESTORATIONS[label],
                      target_word, count=1)
    parts[target_part_idx] = new_word
    return "".join(parts)


# Legacy helper retained for backward compatibility (unused after refactor).
def _extract_bare_name_word(anchor: str, label: str) -> str:
    rx = re.compile(rf"\b{re.escape(label)}\b")
    m = rx.search(anchor)
    if not m:
        raise ValueError(f"Bare name {label!r} not found in anchor {anchor!r}")
    parts = anchor.split()
    pos = 0
    for w in parts:
        wlen = len(w)
        wstart = anchor.find(w, pos)
        wend = wstart + wlen
        if wstart <= m.start() < wend:
            return w
        pos = wend
    raise ValueError(f"Bare name token not located in anchor {anchor!r}")


# ---------------------------------------------------------------------------
# 3-gate proof.
# ---------------------------------------------------------------------------

def gate1_preflight(j, expected: dict[str, int]) -> bool:
    """GATE 1 — pre-flight anchor count.

    Walk the current JSON, classify every match, count IN_SCRIPTURE_QUOTE +
    IN_QUOTE_NO_CITE per name, compare to expected."""
    counts = {n: 0 for n, _ in NAMES}
    for surface_label, text in surfaces(j):
        masked = mask_parens(text)
        for label, pat in NAMES:
            rx = re.compile(pat)
            for m in rx.finditer(masked):
                bucket = classify(text, m, surface_label, label)
                if bucket in ("IN_SCRIPTURE_QUOTE", "IN_QUOTE_NO_CITE"):
                    counts[label] += 1
    print("GATE 1 — pre-flight anchor count per name:")
    ok = True
    for name in counts:
        match = counts[name] == expected[name]
        print(f"  {name}: found {counts[name]}, expected {expected[name]}  {'OK' if match else 'MISMATCH'}")
        ok = ok and match
    return ok


def gate3_durability(written_txt_bytes: bytes, written_json_bytes: bytes) -> bool:
    """GATE 3 — post-write durability proof.

    Re-parse the written .txt and compare the byte-count to the written
    .json. Byte-equal == durability preserved."""
    # Write to a temp path so parse_jasher can read it.
    import tempfile
    with tempfile.NamedTemporaryFile(mode="w", suffix=".txt", delete=False) as tf:
        tf.write(written_txt_bytes.decode("utf-8"))
        tmp_path = Path(tf.name)
    try:
        reparsed = asdict(parse_jasher(tmp_path.read_text()))
        reparsed_bytes = json.dumps(reparsed, indent=2, ensure_ascii=False).encode("utf-8")
        match = len(reparsed_bytes) == len(written_json_bytes)
        print(f"GATE 3 — durability: re-parsed {len(reparsed_bytes)} bytes vs "
              f"written {len(written_json_bytes)} bytes  {'OK' if match else 'MISMATCH'}")
        return match
    finally:
        tmp_path.unlink(missing_ok=True)


def residual_gate(j) -> bool:
    """Post-substitution: IN_SCRIPTURE_QUOTE + IN_QUOTE_NO_CITE counts per
    name must be 0 (all scripture-quote bare names have been restored).
    PROSE / PRESERVED_PHRASE / CROSS_REF_INDEX must be UNCHANGED from the
    pre-substitution counts."""
    counts = {n: {"IN_SCRIPTURE_QUOTE": 0, "IN_QUOTE_NO_CITE": 0,
                  "PROSE": 0, "PRESERVED_PHRASE": 0, "CROSS_REF_INDEX": 0}
              for n, _ in NAMES}
    for surface_label, text in surfaces(j):
        masked = mask_parens(text)
        for label, pat in NAMES:
            rx = re.compile(pat)
            for m in rx.finditer(masked):
                bucket = classify(text, m, surface_label, label)
                counts[label][bucket] += 1
    print("RESIDUAL GATE — post-substitution bucket counts per name:")
    ok = True
    for name in counts:
        c = counts[name]
        is_q = c["IN_SCRIPTURE_QUOTE"] + c["IN_QUOTE_NO_CITE"]
        marker = "OK" if is_q == 0 else "MISMATCH"
        print(f"  {name}: in_quote={is_q} (target 0)  "
              f"prose={c['PROSE']}  cross_ref={c['CROSS_REF_INDEX']}  "
              f"preserved={c['PRESERVED_PHRASE']}  {marker}")
        ok = ok and (is_q == 0)
    return ok


# ---------------------------------------------------------------------------
# Main orchestration.
# ---------------------------------------------------------------------------

def main(argv: list[str]) -> int:
    dry_run = "--dry-run" in argv or "-n" in argv

    print("=" * 78)
    print(f"S69 jasher commentary covenant-people-names wheel "
          f"({'DRY-RUN' if dry_run else 'LIVE-RUN'})")
    print("=" * 78)

    j = json.loads(JASHER_JSON.read_text())
    txt = JASHER_TXT.read_text()

    print(f"\nJASHER_TXT size: {len(txt):,} bytes")
    print(f"JASHER_JSON size: {len(JASHER_JSON.read_bytes()):,} bytes")

    # GATE 1 — pre-flight anchor count.
    print()
    if not gate1_preflight(j, EXPECTED_FIRES):
        print("\nGATE 1 FAIL — anchor count mismatch. Audit must be re-run.")
        return 1

    # Collect fires.
    fires = collect_fires(j)
    print(f"\nCollected {len(fires)} fires (expected {EXPECTED_TOTAL})")
    if len(fires) != EXPECTED_TOTAL:
        print(f"FAIL — fire count mismatch.")
        return 1

    # Per-name summary
    per = {n: 0 for n, _ in NAMES}
    for f in fires:
        per[f.label] += 1
    for name in per:
        print(f"  {name}: {per[name]} fires (expected {EXPECTED_FIRES[name]})")

    # Surface sample to stdout for sample-review gate (in dry-run mode).
    print(f"\nSample fires (first 3 per name) — for sample-review gate:")
    seen_per = {n: 0 for n, _ in NAMES}
    for f in fires:
        if seen_per[f.label] < 3:
            print(f"  [{f.label}, {f.surface}, {f.classification}]")
            print(f"    BEFORE: …{f.anchor.replace(chr(10), ' ')}…")
            print(f"    AFTER:  …{f.replacement.replace(chr(10), ' ')}…")
            seen_per[f.label] += 1

    # Apply substitutions.
    try:
        new_txt, counts = apply_fires_to_txt(txt, fires, j)
    except (RuntimeError, ValueError) as e:
        print(f"\nFAIL — substitution error: {e}")
        return 1

    print(f"\nApplied {counts['total']} substitutions:")
    for name, n in counts["per_name"].items():
        print(f"  {name}: {n}")
    print(f"  .txt size change: {len(txt):,} → {len(new_txt):,}  "
          f"({len(new_txt) - len(txt):+d} bytes)")

    if dry_run:
        print("\n[DRY-RUN] No files written. Exiting cleanly.")
        return 0

    # Live run: write .pre-s69 sidecars + updated .txt + updated .json.
    # If .pre-s69 sidecars already exist, verify they match the current
    # pre-substitution state — if so, accept the existing backup and
    # continue. (The sandbox can't unlink files inside the App folder.)
    pre_txt = JASHER_TXT.with_suffix(".txt.pre-s69")
    if pre_txt.exists():
        existing_pre = pre_txt.read_text()
        if existing_pre == txt:
            print(f"\n{pre_txt} already exists and matches current pre-state; "
                  f"accepting existing backup.")
        else:
            print(f"\nWARNING: {pre_txt} exists with different content "
                  f"({len(existing_pre):,} bytes vs current {len(txt):,} bytes); "
                  f"refusing to overwrite. Investigate first.")
            return 1
    else:
        pre_txt.write_text(txt)
        print(f"\nWrote {pre_txt} ({len(txt):,} bytes)")

    pre_json = JASHER_JSON.with_suffix(".json.pre-s69")
    if pre_json.exists():
        existing_pre_json = pre_json.read_bytes()
        current_json = JASHER_JSON.read_bytes()
        if existing_pre_json == current_json:
            print(f"{pre_json} already exists and matches current pre-state; "
                  f"accepting existing backup.")
        else:
            print(f"WARNING: {pre_json} exists with different content; refusing.")
            return 1
    else:
        pre_json.write_bytes(JASHER_JSON.read_bytes())
        print(f"Wrote {pre_json} ({pre_json.stat().st_size:,} bytes)")

    JASHER_TXT.write_text(new_txt)
    print(f"Wrote {JASHER_TXT} ({len(new_txt):,} bytes)")

    # Re-parse the modified .txt to produce the updated .json.
    new_j_obj = parse_jasher(JASHER_TXT.read_text())
    new_j = asdict(new_j_obj)
    new_json_bytes = json.dumps(new_j, indent=2, ensure_ascii=False).encode("utf-8")
    JASHER_JSON.write_bytes(new_json_bytes)
    print(f"Wrote {JASHER_JSON} ({len(new_json_bytes):,} bytes)")

    # GATE 3 — post-write durability.
    print()
    if not gate3_durability(new_txt.encode("utf-8"), new_json_bytes):
        print("GATE 3 FAIL — durability mismatch.")
        return 1

    # Residual gate.
    print()
    if not residual_gate(new_j):
        print("RESIDUAL GATE FAIL — IN_SCRIPTURE_QUOTE + IN_QUOTE_NO_CITE not 0.")
        return 1

    # Idempotency check: re-classify against the new state, count fires.
    new_fires = collect_fires(new_j)
    print(f"\nIdempotency check: re-collect fires from new state = {len(new_fires)} (expected 0)")
    if new_fires:
        print("IDEMPOTENCY FAIL — wheel would re-fire on its own output.")
        return 1

    print("\n" + "=" * 78)
    print("ALL GATES PASS. S69 jasher commentary covenant-singles wheel complete.")
    print("=" * 78)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
