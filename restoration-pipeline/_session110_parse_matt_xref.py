#!/usr/bin/env python3
"""Parse Cross-Reference Apparatus sections — v2 with bug fixes."""
import json
import re
from pathlib import Path
from typing import Any, Optional

XREF_DIR = Path("/tmp/matt_xref")
OUT = Path("/tmp/matt_xref_parsed.json")

RE_LANDED_THREAD = re.compile(r"^\*\*Thread:\s*`([^`]+)`\*\*\s*\*\(LANDED")
RE_PROPOSED_A    = re.compile(r"^\*\*PROPOSED new thread:\s*`([^`]+)`\*\*")
RE_PROPOSED_B    = re.compile(r"^\*\*`([^`]+)`\*\*\s*—")
RE_LAYER1        = re.compile(r"^\*\*Matt\s+([\d:,\-]+)\*\*\s*—")
RE_TABLE_HEADER  = re.compile(r"^\|")
RE_TABLE_SEP     = re.compile(r"^\|\s*[-:|\s]+\|\s*$")
RE_SECTION_H3    = re.compile(r"^### ")
RE_SECTION_H2    = re.compile(r"^## ")


def is_block_start(line):
    """Does this line start a new block, meaning we should stop searching for a table?"""
    return bool(
        RE_LANDED_THREAD.match(line) or
        RE_PROPOSED_A.match(line) or
        RE_PROPOSED_B.match(line) or
        RE_LAYER1.match(line) or
        RE_SECTION_H3.match(line) or
        RE_SECTION_H2.match(line)
    )


def find_next_table(lines, start):
    """Advance from `start` until we either hit a table header or a new block.
    Returns the index of the table header, or -1 if no table before next block.
    """
    i = start
    while i < len(lines):
        ln = lines[i]
        if RE_TABLE_HEADER.match(ln):
            return i
        if ln.strip() and is_block_start(ln):
            return -1
        i += 1
    return -1


def parse_table(lines, start):
    if start < 0 or start >= len(lines) or not RE_TABLE_HEADER.match(lines[start]):
        return [], start
    idx = start + 1
    if idx < len(lines) and RE_TABLE_SEP.match(lines[idx]):
        idx += 1
    rows = []
    while idx < len(lines) and RE_TABLE_HEADER.match(lines[idx]):
        cells = [c.strip() for c in lines[idx].split("|")[1:-1]]
        rows.append(cells)
        idx += 1
    return rows, idx


def extract_anchor(blob):
    m = re.search(r"[Aa]nchor[:s]?\s+(?:at\s+)?([^.;—–]+)", blob)
    return m.group(1).strip() if m else ""


def extract_summary(blob):
    m = re.search(r"Summary:\s*\*?(.+?)\*?\s*$", blob, re.DOTALL)
    if m:
        return m.group(1).strip().rstrip("*").strip()[:3000]
    return blob[:3000]


def parse_int_or_none(s):
    try:
        return int(s.strip())
    except (ValueError, AttributeError):
        return None


def consume_block_paragraph(lines, start):
    """Return (paragraph_blob, next_index_to_search_from).
    Reads from `start` until a blank line or a new block start.
    """
    parts = []
    i = start
    while i < len(lines):
        ln = lines[i]
        if not ln.strip():
            i += 1
            break
        if i != start and is_block_start(ln):
            break
        parts.append(ln.rstrip())
        i += 1
    return " ".join(parts), i


def parse_chapter(chapter_n, lines, warnings):
    out = {"landed_thread_additions": [], "proposed_threads": [], "layer1_rows": []}
    i, n = 0, len(lines)
    while i < n:
        line = lines[i].rstrip()
        if not line:
            i += 1
            continue

        # LANDED thread addition (Format A)
        m = RE_LANDED_THREAD.match(line)
        if m:
            slug = m.group(1)
            blob, next_i = consume_block_paragraph(lines, i)
            table_idx = find_next_table(lines, next_i)
            if table_idx < 0:
                warnings.append(f"ch{chapter_n}: LANDED thread {slug!r} has no table — block has no members")
                out["landed_thread_additions"].append({"slug": slug, "members": []})
                i = next_i
                continue
            rows, i = parse_table(lines, table_idx)
            members = []
            for r in rows:
                if len(r) >= 3:
                    members.append({"source": r[0], "target": r[1], "note": r[2]})
                else:
                    warnings.append(f"ch{chapter_n}: LANDED {slug!r} row malformed: {r}")
            out["landed_thread_additions"].append({"slug": slug, "members": members})
            continue

        # PROPOSED new thread (Format A — explicit "PROPOSED new thread" marker)
        m = RE_PROPOSED_A.match(line)
        if m:
            slug = m.group(1)
            blob, next_i = consume_block_paragraph(lines, i)
            anchor = extract_anchor(blob)
            summary = extract_summary(blob)
            fm = "FRAMEWORK-MAJOR" in blob
            table_idx = find_next_table(lines, next_i)
            if table_idx < 0:
                # PROPOSED with no inline table — note for design-call follow-up
                warnings.append(f"ch{chapter_n}: PROPOSED-A {slug!r} deferred (no inline members)")
                out["proposed_threads"].append({"slug": slug, "anchor": anchor, "summary": summary,
                                                "framework_major": fm, "format": "A-deferred",
                                                "members": []})
                i = next_i
                continue
            rows, i = parse_table(lines, table_idx)
            members = []
            for r in rows:
                if len(r) == 4:
                    members.append({"sort": parse_int_or_none(r[0]), "source": r[1], "target": r[2], "note": r[3]})
                elif len(r) == 3:
                    members.append({"sort": None, "source": r[0], "target": r[1], "note": r[2]})
                else:
                    warnings.append(f"ch{chapter_n}: PROPOSED-A {slug!r} row malformed: {r}")
            out["proposed_threads"].append({"slug": slug, "anchor": anchor, "summary": summary,
                                            "framework_major": fm, "format": "A", "members": members})
            continue

        # PROPOSED new thread (Format B — `**`slug`** — anchor at ...`)
        m = RE_PROPOSED_B.match(line)
        if m:
            slug = m.group(1)
            blob, next_i = consume_block_paragraph(lines, i)
            anchor = extract_anchor(blob)
            summary = extract_summary(blob)
            fm = "FRAMEWORK-MAJOR" in blob
            table_idx = find_next_table(lines, next_i)
            if table_idx < 0:
                warnings.append(f"ch{chapter_n}: PROPOSED-B {slug!r} no inline table")
                out["proposed_threads"].append({"slug": slug, "anchor": anchor, "summary": summary,
                                                "framework_major": fm, "format": "B-deferred",
                                                "members": []})
                i = next_i
                continue
            rows, i = parse_table(lines, table_idx)
            members = []
            for sort_idx, r in enumerate(rows, start=1):
                if len(r) == 2:
                    is_primary = "Primary anchor" in r[1]
                    members.append({"sort": sort_idx,
                                    "source": anchor if not is_primary else r[0],
                                    "target": r[0], "note": r[1], "is_primary": is_primary})
                elif len(r) == 3:
                    members.append({"sort": sort_idx, "source": r[0], "target": r[1], "note": r[2]})
                else:
                    warnings.append(f"ch{chapter_n}: PROPOSED-B {slug!r} row malformed: {r}")
            out["proposed_threads"].append({"slug": slug, "anchor": anchor, "summary": summary,
                                            "framework_major": fm, "format": "B", "members": members})
            continue

        # Layer 1 per-verse row
        m = RE_LAYER1.match(line)
        if m:
            source_ref = f"matt {m.group(1)}"
            blob, next_i = consume_block_paragraph(lines, i)
            table_idx = find_next_table(lines, next_i)
            if table_idx < 0:
                warnings.append(f"ch{chapter_n}: Layer1 {source_ref} has no table")
                i = next_i
                continue
            rows, i = parse_table(lines, table_idx)
            targets = []
            for r in rows:
                if len(r) >= 2:
                    targets.append({"target": r[0], "note": r[1]})
                else:
                    warnings.append(f"ch{chapter_n}: Layer1 {source_ref} row malformed: {r}")
            out["layer1_rows"].append({"source": source_ref, "targets": targets})
            continue

        i += 1
    return out


def main():
    warnings = []
    chapters = {}
    for n in range(1, 29):
        path = XREF_DIR / f"matt-{n}.txt"
        lines = path.read_text(encoding="utf-8").splitlines()
        chapters[str(n)] = parse_chapter(n, lines, warnings)
    OUT.write_text(json.dumps({"chapters": chapters, "warnings": warnings},
                              indent=2, ensure_ascii=False), encoding="utf-8")
    total_landed = sum(len(c["landed_thread_additions"]) for c in chapters.values())
    total_landed_members = sum(len(t["members"]) for c in chapters.values() for t in c["landed_thread_additions"])
    total_proposed = sum(len(c["proposed_threads"]) for c in chapters.values())
    total_proposed_members = sum(len(t["members"]) for c in chapters.values() for t in c["proposed_threads"])
    total_l1_sources = sum(len(c["layer1_rows"]) for c in chapters.values())
    total_l1_targets = sum(len(s["targets"]) for c in chapters.values() for s in c["layer1_rows"])
    distinct_proposed = sorted({t["slug"] for c in chapters.values() for t in c["proposed_threads"]})
    distinct_landed = sorted({t["slug"] for c in chapters.values() for t in c["landed_thread_additions"]})
    print(f"Wrote {OUT}")
    print(f"LANDED-thread additions: {total_landed} blocks across {len(distinct_landed)} distinct slugs, {total_landed_members} member rows.")
    print(f"  distinct LANDED slugs: {distinct_landed}")
    print(f"PROPOSED threads: {total_proposed} blocks across {len(distinct_proposed)} distinct slugs, {total_proposed_members} member rows.")
    print(f"Layer 1: {total_l1_sources} source-verse blocks, {total_l1_targets} target rows.")
    if warnings:
        print(f"\n{len(warnings)} warnings (first 25):")
        for w in warnings[:25]:
            print(f"  - {w}")
    return 0


main()
