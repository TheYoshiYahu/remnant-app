#!/usr/bin/env python3
"""S69 — Sample-surfacing pass per Yoshi's design gate."""

from __future__ import annotations
import json, re
from pathlib import Path

APP = Path("/sessions/brave-keen-dijkstra/mnt/App")
PARSED = APP / "source-texts" / "parsed"
LB = r"(?<![A-Za-z'’])"
RB = r"(?![A-Za-z'’])"
PAREN_RE = re.compile(r"\([^()]*\)")

JEW_GENTILE_BINARY_RE = re.compile(r"Jew[- ]?and[- ]?Gentile[- ]?binary", re.IGNORECASE)


def mask_parens(text):
    return PAREN_RE.sub(lambda m: "_" * len(m.group(0)), text)


def surfaces(j):
    if j.get("front_matter"): yield ("front_matter", j["front_matter"])
    if j.get("back_matter"): yield ("back_matter", j["back_matter"])
    if "books" in j:
        for bk in j["books"]:
            bn = bk.get("name") or "book"
            for ch in bk.get("chapters", []):
                cn = ch.get("number", "?")
                if ch.get("commentary"): yield (f"{bn} ch{cn} commentary", ch["commentary"])
                if ch.get("title"): yield (f"{bn} ch{cn} title", ch["title"])
    elif "chapters" in j:
        for ch in j["chapters"]:
            cn = ch.get("number", "?")
            if ch.get("commentary"): yield (f"ch{cn} commentary", ch["commentary"])
            if ch.get("title"): yield (f"ch{cn} title", ch["title"])


def ctx(text, s, e, span=140):
    lo = max(0, s - span)
    hi = min(len(text), e + span)
    snip = text[lo:hi].replace("\n", " ")
    return f"…{snip}…"


def classify(label, surface, ctx_full, window):
    if label in ("Jew", "Jews", "Jewish") and JEW_GENTILE_BINARY_RE.search(ctx_full):
        return "carve_jew_binary"
    em = window.count("—")
    has_ref = bool(re.search(r"\b[A-Z][a-z]+(?:\s+[A-Z][a-z]+)?\s+\d+(?::\d+)?", window))
    if surface == "back_matter" and em >= 2 and has_ref:
        return "carve_crossref_index"
    return "real_gap"


def collect(name, pat):
    j = json.loads((PARSED / "jasher.json").read_text())
    rx = re.compile(pat)
    out = {"real_gap": [], "carve_crossref_index": [], "carve_jew_binary": []}
    for surf, text in surfaces(j):
        masked = mask_parens(text)
        for m in rx.finditer(masked):
            cf = ctx(text, m.start(), m.end(), span=140)
            window = text[max(0, m.start() - 40): min(len(text), m.end() + 40)]
            k = classify(name, surf, cf, window)
            out[k].append((surf, cf))
    return out


def main():
    NAMES = [
        ("Israel", rf"{LB}Israel{RB}"),
        ("Judah", rf"{LB}Judah{RB}"),
        ("Jews", rf"{LB}Jews{RB}"),
        ("Jewish", rf"{LB}Jewish{RB}"),
        ("Jew", rf"{LB}Jew{RB}"),
    ]

    print("=" * 88)
    print("REAL-GAP SAMPLES (10 per name) — these are the wheel's intended fire-set")
    print("=" * 88)
    for label, pat in NAMES:
        r = collect(label, pat)
        gaps = r["real_gap"]
        print(f"\n### {label} — {len(gaps)} real-gap candidates")
        for surf, c in gaps[:10]:
            print(f"  [{surf}]\n  {c}\n")

    print("\n" + "=" * 88)
    print("CROSS-REF INDEX-LINE SAMPLES (10 across all names) — design call: restore or preserve?")
    print("=" * 88)
    j = json.loads((PARSED / "jasher.json").read_text())
    bm = j.get("back_matter", "")
    masked = mask_parens(bm)
    shown = 0
    seen_positions = set()
    for label, pat in NAMES:
        if shown >= 10:
            break
        rx = re.compile(pat)
        for m in rx.finditer(masked):
            window = bm[max(0, m.start() - 40): min(len(bm), m.end() + 40)]
            em = window.count("—")
            has_ref = bool(re.search(r"\b[A-Z][a-z]+(?:\s+[A-Z][a-z]+)?\s+\d+(?::\d+)?", window))
            if em >= 2 and has_ref and m.start() not in seen_positions:
                seen_positions.add(m.start())
                c = ctx(bm, m.start(), m.end(), span=140)
                print(f"\n  [back_matter, {label}]\n  {c}\n")
                shown += 1
                if shown >= 10:
                    break


if __name__ == "__main__":
    main()
