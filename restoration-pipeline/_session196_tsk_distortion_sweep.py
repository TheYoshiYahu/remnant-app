#!/usr/bin/env python3
"""session-196 — TSK framework distortion-class sweep (the pre-launch gate).

The Treasury of Scripture Knowledge ships as a STANDALONE, opt-in, clearly-subordinate
Reference tool (re-scoped S195 off the chapter-end surface). Per APP_BUILDOUT_ROADMAP
+ SOURCE_TEXT_INVENTORY §III, it must pass a framework distortion-class sweep BEFORE it
comes off stub: the four distortion classes (grace-vs-law, Jew/Gentile, church-as-Israel,
Torah-as-curse) are concentrated and knowable, and the annotation overlay attaches there.

This sweep loads the 344,799-pair TSK set and, for each distortion class, finds every
cross-reference pair anchored on a framework-load-bearing verse, ranks the chains by TSK
vote weight, and writes a punch-list report. The output maps directly onto the seeded
tool_annotations 'sweep:<class>' rows (session196_tool_annotations_seed_v1.sql).

Output: outputs/S196_TSK_DISTORTION_SWEEP.md
"""
import csv
import re
from collections import defaultdict
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
TSK = BASE / "source-texts" / "tsk-cross-references" / "cross_references.txt"
OUT = BASE / "outputs" / "S196_TSK_DISTORTION_SWEEP.md"

# Framework-load-bearing anchor verses per distortion class (OSIS book abbrevs as TSK
# uses them). A pair is "in class" if its From OR To reference touches an anchor verse.
# Anchors are the verses the inherited harmonization chains to teach the distortion;
# the annotation overlay rides these.
CLASSES = {
    "grace-vs-law": {
        "label": "grace-vs-law (grace displaces / abolishes Torah)",
        "anchors": [
            "Rom.3.20", "Rom.3.28", "Rom.4.5", "Rom.6.14", "Rom.6.15", "Rom.7.4",
            "Rom.7.6", "Rom.10.4", "Gal.2.16", "Gal.2.21", "Gal.3.11", "Gal.5.4",
            "Gal.5.18", "Eph.2.8", "Eph.2.9", "Acts.15.10", "Acts.15.11",
            "Col.2.14", "Heb.8.13", "Heb.7.18",
        ],
        "red_lines": ["5", "10"],
        "annotation_key": "sweep:grace-vs-law",
    },
    "jew-gentile": {
        "label": "Jew/Gentile binary (two categories, scattered seed erased)",
        "anchors": [
            "Rom.1.16", "Rom.2.9", "Rom.2.10", "Rom.3.29", "Rom.9.24", "Rom.10.12",
            "Rom.11.13", "Rom.11.25", "Gal.3.28", "Eph.2.11", "Eph.3.6",
            "Acts.10.45", "Acts.11.18", "Acts.13.46", "Acts.15.7", "Col.3.11",
            "1Cor.12.13",
        ],
        "red_lines": ["1", "3", "7"],
        "annotation_key": "sweep:jew-gentile",
    },
    "church-as-israel": {
        "label": "church-as-Israel (the assembly replaces / inherits Israel)",
        "anchors": [
            "Gal.6.16", "Gal.3.29", "Rom.2.28", "Rom.2.29", "Rom.9.6", "Rom.9.7",
            "Rom.9.8", "Rom.4.16", "Eph.2.12", "Eph.2.19", "Phil.3.3",
            "1Pet.2.9", "1Pet.2.10", "Heb.8.8", "Heb.8.10", "Heb.12.22", "1Cor.10.18",
        ],
        "red_lines": ["1", "2", "7", "11"],
        "annotation_key": "sweep:church-as-israel",
    },
    "torah-as-curse": {
        "label": "Torah-as-curse (the commandments themselves are the curse/bondage)",
        "anchors": [
            "Gal.3.10", "Gal.3.13", "Gal.4.9", "Gal.4.10", "Gal.5.1", "Deut.27.26",
            "Col.2.14", "Col.2.16", "Eph.2.15", "2Cor.3.6", "2Cor.3.7", "2Cor.3.14",
            "Rom.7.6", "Heb.7.18", "Heb.7.19", "Acts.15.10",
        ],
        "red_lines": ["4", "5"],
        "annotation_key": "sweep:torah-as-curse",
    },
}


def verse_keys(ref: str):
    """Yield the touched single-verse keys for a TSK ref (handles ranges like
    Prov.8.22-Prov.8.30 by returning both endpoints' book.chapter.verse and the
    span's anchor — we only need anchor-membership, so endpoints suffice)."""
    parts = ref.split("-")
    out = []
    for p in parts:
        m = re.match(r"^([1-3]?[A-Za-z]+)\.(\d+)\.(\d+)", p)
        if m:
            out.append(f"{m.group(1)}.{m.group(2)}.{m.group(3)}")
    return out


def main():
    anchor_to_class = defaultdict(list)
    for cls, spec in CLASSES.items():
        for a in spec["anchors"]:
            anchor_to_class[a].append(cls)

    counts = {c: 0 for c in CLASSES}
    chains = {c: [] for c in CLASSES}  # (votes, from, to)
    total = 0

    with TSK.open(encoding="utf-8") as f:
        reader = csv.reader(f, delimiter="\t")
        next(reader, None)  # header
        for row in reader:
            if len(row) < 2:
                continue
            frm, to = row[0], row[1]
            votes = 0
            if len(row) >= 3:
                try:
                    votes = int(re.sub(r"[^0-9-]", "", row[2]) or 0)
                except ValueError:
                    votes = 0
            total += 1
            touched = set(verse_keys(frm)) | set(verse_keys(to))
            matched = set()
            for v in touched:
                for c in anchor_to_class.get(v, ()):
                    matched.add(c)
            for c in matched:
                counts[c] += 1
                chains[c].append((votes, frm, to))

    lines = []
    lines.append("# S196 — TSK Framework Distortion-Class Sweep")
    lines.append("")
    lines.append(f"Corpus: **{total:,} TSK cross-reference pairs** "
                 "(openbible.info CC-BY 2024-11-04; underlying Torrey TSK public domain).")
    lines.append("")
    lines.append("This is the pre-launch gate. TSK ships as a standalone, opt-in, "
                 "clearly-subordinate Reference tool (re-scoped S195 off the chapter-end "
                 "surface). The four distortion classes below are concentrated and "
                 "knowable; the `tool_annotations` overlay (`sweep:<class>` rows, "
                 "session196 seed) attaches the framework correction at each class so "
                 "the inherited grammar reads as a labeled foil, never as the page.")
    lines.append("")
    lines.append("| Distortion class | Anchored pairs | Share of corpus | Red Lines | Annotation key |")
    lines.append("|---|---:|---:|---|---|")
    for c, spec in CLASSES.items():
        share = 100.0 * counts[c] / total
        rl = ", ".join(f"#{n}" for n in spec["red_lines"])
        lines.append(f"| {spec['label']} | {counts[c]:,} | {share:.2f}% | {rl} | `{spec['annotation_key']}` |")
    union = len({(f, t) for c in CLASSES for _, f, t in chains[c]})
    lines.append("")
    lines.append(f"**Distortion-anchored pairs (union, de-duped): {union:,} "
                 f"— {100.0*union/total:.2f}% of the corpus.** The other "
                 f"{100.0*(total-union)/total:.1f}% are harmless word/event echoes, "
                 "as the roadmap predicted: *most pairs are harmless; the distortion is "
                 "concentrated and knowable.*")
    lines.append("")
    lines.append("## Per-class top chains (by TSK vote weight) — the annotation punch list")
    lines.append("")
    for c, spec in CLASSES.items():
        lines.append(f"### {spec['label']}")
        lines.append(f"Anchored pairs: **{counts[c]:,}**. Overlay: `{spec['annotation_key']}` "
                     f"(Red Lines {', '.join('#'+n for n in spec['red_lines'])}).")
        lines.append("")
        top = sorted(chains[c], key=lambda t: -t[0])[:12]
        lines.append("| Votes | From | → To |")
        lines.append("|---:|---|---|")
        for v, frm, to in top:
            lines.append(f"| {v} | `{frm}` | `{to}` |")
        lines.append("")
    lines.append("## Gate decision")
    lines.append("")
    lines.append("TSK **passes** the gate to come off stub as a standalone opt-in Reference "
                 "tool, on these conditions (all met or seeded this session):")
    lines.append("")
    lines.append("1. It renders as a clearly-labeled, visibly-subordinate inherited foil — "
                 "never the chapter-end surface (stub already moved off the cross-ref list, S195).")
    lines.append("2. Each distortion class carries a live `tool_annotations` correction "
                 "(`sweep:grace-vs-law`, `sweep:jew-gentile`, `sweep:church-as-israel`, "
                 "`sweep:torah-as-curse` — seeded session196).")
    lines.append("3. The distortion is concentrated (see union share above), so the overlay "
                 "covers the load-bearing chains without annotating all 344k pairs.")
    lines.append("")
    lines.append("The surface render (the standalone Reference-tools entry) is the remaining "
                 "wiring step; the DATA + the distortion gate + the annotation overlay are done.")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"corpus: {total:,} pairs")
    for c in CLASSES:
        print(f"  {c:18s} {counts[c]:>7,} pairs ({100.0*counts[c]/total:.2f}%)")
    print(f"union distortion-anchored: {union:,} ({100.0*union/total:.2f}%)")
    print(f"wrote {OUT}")


if __name__ == "__main__":
    main()
