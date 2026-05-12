#!/usr/bin/env python3
"""
_session32_strip_abominations.py
--------------------------------
SESSION 32 ONE-OFF (2026-05-12, Yoshi-directed corpus cleanup).

The mrjames, lightfoot, and charles-pseudepigrapha extractors emitted
source .txt files containing books beyond Yoshi's approved
SOURCE_TEXT_INVENTORY.md scope. Session 32 stripped the parser BOOKS_IN_ORDER
tables to approved-only, but the .txt files still hold the unapproved content
as dead text — and the edition parsers were absorbing it into adjacent books'
bodies (e.g. book-of-james-protevangelium picking up 187 chapters when the
Protoevangelium has 25, because Gospel of Thomas / Pseudo-Matthew / etc.
lived between Protevangelium and Gospel of Peter in source order).

This script reads each source's existing -restored.txt, slices out ONLY the
approved-book sections (between each approved opener and the next opener
from the ORIGINAL full list — approved or not, so we stop at the right
boundary), and writes a clean -restored.txt. The old .txt and -restored.txt
files are moved to ~/.Trash for the macOS user to empty when they're
satisfied.

Run once. Do not re-run after a fresh PDF extraction — the extracted .txt
will already be clean (the parser BOOKS tables are stripped).
"""
from __future__ import annotations
import os
import shutil
import re
import sys
from datetime import datetime

def _resolve_desktop() -> str:
    """Resolve the Desktop root whether running on host or in sandbox.

    Probe for the presence of App/source-texts as a disambiguator — an
    empty Desktop directory would resolve as 'exists' but not be the
    right one.
    """
    candidates = [
        "/Users/mtm/Desktop",
        os.path.expanduser("~/Desktop"),
    ]
    # Also try common sandbox mount paths.
    import glob as _g
    for p in _g.glob("/sessions/*/mnt/Desktop"):
        candidates.append(p)
    for p in candidates:
        if os.path.exists(os.path.join(p, "App", "source-texts")):
            return p
    return candidates[0]

DESKTOP = _resolve_desktop()
ROOT = os.path.join(DESKTOP, "App", "source-texts")
# Quarantine folder on Desktop — Yoshi can drag this to Trash manually
# after reviewing. The bash sandbox can't reach the real ~/.Trash but
# CAN reach the Desktop mount, so this is the safe path.
TRASH = os.path.join(DESKTOP, "_abominations-removed-2026-05-12")
TS = datetime.now().strftime("%Y%m%d-%H%M%S")


# ---------------------------------------------------------------------------
# Per-source configuration: all openers (original full list, used as
# boundary markers) and approved openers (subset to keep).
# ---------------------------------------------------------------------------

MRJAMES_ALL = [
    "# The Gospel according to the Hebrews",
    "# The Gospel of the Ebionites",
    "# The Gospel according to the Egyptians",
    "# The Gospel of Philip",
    "# The Gospel or Traditions of Matthias",
    "# The Gospel of Peter (ancient testimonies)",
    "# The Gospel of Thomas (ancient testimonies)",
    "# The Preaching of Peter",
    "# The Birth of Mary",
    "# The Lesser Questions of Mary",
    "# The Ascents of James and other lost books",
    "# The Memoria of the Apostles",
    "# The Gelasian Decree",
    "# The List of the Sixty Books",
    "# The Stichometry of Nicephorus",
    "# The Synopsis of Pseudo-Athanasius",
    "# The Fayoum Gospel-fragment",
    "# The Oxyrhynchus Sayings of Yahusha (Jesus)",
    "# Fragment of a Gospel",
    "# Fragment of another Gospel",
    "# The Strasburg papyrus",
    "# Fragment preserved with the Pistis Sophia",
    "# Fragment preserved with the Acts of Paul",
    "# Agrapha found as additions to the text of the Gospels",
    "# The Freer-logion",
    "# Agrapha preserved in quotations",
    "# The Book of James, or Protevangelium",
    "# The Gospel of Thomas, Greek text A",
    "# The Gospel of Thomas, Greek text B",
    "# The Gospel of Thomas, Latin text",
    "# Appendix to the Gospel of Thomas (Pistis Sophia)",
    "# Appendix to the Gospel of Thomas (Miracles)",
    "# The Gospel of Pseudo-Matthew",
    "# The Gospel of the Birth of Mary",
    "# The Arabic Gospel of the Infancy",
    "# The Armenian Gospel of the Infancy",
    "# The History of Joseph the Carpenter",
    "# Coptic Lives of the Virgin",
    "# The Gospel of Peter",
    "# The Gospel of Nicodemus, or Acts of Pilate",
    "# The Acts of John",
    "# The Acts of Thomas",
    "# The Letters of Messiah (Christ) and Abgarus",
    "# The Apocalypse of Peter",
    "# The Apocalypse of Paul",
    "# The Apocalypse of Thomas",
]
MRJAMES_APPROVED = {
    "# The Book of James, or Protevangelium",
    "# The Gospel of Peter",
    "# The Gospel of Nicodemus, or Acts of Pilate",
    "# The Apocalypse of Peter",
    "# The Apocalypse of Paul",
}

LIGHTFOOT_ALL = [
    "# The First Epistle of S. Clement to the Corinthians",
    "# An Ancient Homily by an Unknown Author (Second Clement)",
    "# The Epistle of S. Ignatius to the Ephesians",
    "# The Epistle of S. Ignatius to the Magnesians",
    "# The Epistle of S. Ignatius to the Trallians",
    "# The Epistle of S. Ignatius to the Romans",
    "# The Epistle of S. Ignatius to the Philadelphians",
    "# The Epistle of S. Ignatius to the Smyrnaeans",
    "# The Epistle of S. Ignatius to S. Polycarp",
    "# The Epistle of S. Polycarp to the Philippians",
    "# The Martyrdom of S. Polycarp",
    "# The Teaching of the Twelve Apostles (Didache)",
    "# The Epistle of Barnabas",
    "# The Shepherd of Hermas",
    "# The Epistle to Diognetus",
    "# The Fragments of Papias",
    "# Reliques of the Elders Preserved in Irenaeus",
]
LIGHTFOOT_APPROVED = {
    "# The First Epistle of S. Clement to the Corinthians",
    "# An Ancient Homily by an Unknown Author (Second Clement)",
    "# The Epistle of S. Ignatius to the Ephesians",
    "# The Epistle of S. Ignatius to the Magnesians",
    "# The Epistle of S. Ignatius to the Trallians",
    "# The Epistle of S. Ignatius to the Romans",
    "# The Epistle of S. Ignatius to the Philadelphians",
    "# The Epistle of S. Ignatius to the Smyrnaeans",
    "# The Epistle of S. Ignatius to S. Polycarp",
    "# The Martyrdom of S. Polycarp",
    "# The Teaching of the Twelve Apostles (Didache)",
    "# The Epistle of Barnabas",
    "# The Shepherd of Hermas",
}

CHARLES_ALL = [
    "# The Letter of Aristeas",
    "# The Books of Adam and Eve",
    "# The Martyrdom of Isaiah",
    "# The Testaments of the XII Patriarchs",
    "# The Sibylline Oracles",
    "# The Assumption of Moses",
    "# 2 Enoch (The Book of the Secrets of Enoch)",
    "# 2 Baruch (The Syriac Apocalypse)",
    "# 3 Baruch (The Greek Apocalypse)",
    "# 4 Ezra",
    "# The Psalms of Solomon",
    "# 4 Maccabees",
    "# Pirké Aboth (Sayings of the Fathers)",
    "# The Story of Ahikar",
    "# The Fragments of a Zadokite Work",
]
CHARLES_APPROVED = {
    "# The Books of Adam and Eve",
    "# The Martyrdom of Isaiah",
    "# The Testaments of the XII Patriarchs",
    "# 2 Enoch (The Book of the Secrets of Enoch)",
    "# 2 Baruch (The Syriac Apocalypse)",
    "# 3 Baruch (The Greek Apocalypse)",
    "# 4 Maccabees",
}


def slice_approved(text: str, all_openers: list[str], approved: set[str]) -> str:
    """Slice text to contain ONLY sections opened by an approved opener.

    Walk through the text in sequence. For each opener position found,
    record (position, opener). Then for each approved opener, emit from
    its position to the next opener's position (whichever it is — the
    boundary is what matters, not whether the NEXT is approved). Drop
    front matter (text before the first found opener).
    """
    # Find each opener's first occurrence after the cursor (in source order).
    cursor = 0
    found: list[tuple[int, str]] = []
    for opener in all_openers:
        # Match opener at line start (preceded by \n or BOF).
        needle = "\n" + opener + "\n"
        idx = text.find(needle, cursor)
        if idx == -1:
            if cursor == 0 and text.startswith(opener + "\n"):
                idx = 0
            else:
                # Opener not present in this text — skip (parser is tolerant).
                continue
        else:
            idx += 1  # skip the leading newline
        found.append((idx, opener))
        cursor = idx + len(opener)

    if not found:
        return ""

    # For each found opener, the boundary is the NEXT found opener's start
    # (or end of file if none). Emit only approved openers' sections.
    out_parts: list[str] = []
    for i, (pos, opener) in enumerate(found):
        end = found[i + 1][0] if i + 1 < len(found) else len(text)
        if opener in approved:
            out_parts.append(text[pos:end])

    return "".join(out_parts)


def process_source(folder: str, base: str, all_openers: list[str], approved: set[str]) -> dict:
    src_dir = os.path.join(ROOT, folder)
    raw_path = os.path.join(src_dir, f"{base}.txt")
    restored_path = os.path.join(src_dir, f"{base}-restored.txt")

    result = {"source": base, "actions": []}

    # Process -restored.txt (this is what the edition parser reads).
    if os.path.exists(restored_path):
        with open(restored_path, "r", encoding="utf-8") as f:
            old_text = f.read()
        old_size = len(old_text)
        new_text = slice_approved(old_text, all_openers, approved)
        new_size = len(new_text)

        # Move old to Trash with a timestamped name.
        trash_name = f"{base}-restored.txt.session32-pre-strip.{TS}"
        trash_path = os.path.join(TRASH, trash_name)
        shutil.move(restored_path, trash_path)
        result["actions"].append(f"trashed: {trash_name} ({old_size} bytes)")

        # Write clean new file.
        with open(restored_path, "w", encoding="utf-8") as f:
            f.write(new_text)
        result["actions"].append(f"wrote clean -restored.txt ({new_size} bytes, "
                                 f"kept {len(approved)} of {len(all_openers)} books)")

    # Move the un-restored .txt to Trash too. The PDF/HTML extractor will
    # regenerate it from the (now-stripped) BOOKS table if Yoshi wants
    # to rebuild from source later.
    if os.path.exists(raw_path):
        with open(raw_path, "r", encoding="utf-8") as f:
            old_text = f.read()
        old_size = len(old_text)
        # We also slice this one in case Yoshi or future tooling reads it.
        new_text = slice_approved(old_text, all_openers, approved)
        new_size = len(new_text)

        trash_name = f"{base}.txt.session32-pre-strip.{TS}"
        trash_path = os.path.join(TRASH, trash_name)
        shutil.move(raw_path, trash_path)
        result["actions"].append(f"trashed: {trash_name} ({old_size} bytes)")

        with open(raw_path, "w", encoding="utf-8") as f:
            f.write(new_text)
        result["actions"].append(f"wrote clean .txt ({new_size} bytes)")

    return result


def trash_unapproved_per_book_mds(folder: str, unapproved_basenames: list[str]) -> list[str]:
    """Move per-book .md files for unapproved books to Trash."""
    src_dir = os.path.join(ROOT, folder)
    actions = []
    for stem in unapproved_basenames:
        # Match stem.md and stem-restored.md
        for suffix in (".md", "-restored.md"):
            p = os.path.join(src_dir, stem + suffix)
            if os.path.exists(p):
                trash_name = f"{folder}__{stem}{suffix}.session32-pre-strip.{TS}"
                trash_path = os.path.join(TRASH, trash_name)
                shutil.move(p, trash_path)
                actions.append(f"trashed: {trash_name}")
    return actions


def main():
    os.makedirs(TRASH, exist_ok=True)
    results = []

    # mrjames
    results.append(process_source(
        "mrjames-apocryphal-nt", "mrjames-apocryphal-nt",
        MRJAMES_ALL, MRJAMES_APPROVED,
    ))

    # lightfoot
    results.append(process_source(
        "lightfoot-apostolic-fathers", "lightfoot-apostolic-fathers",
        LIGHTFOOT_ALL, LIGHTFOOT_APPROVED,
    ))

    # charles
    charles_result = process_source(
        "pseudepigrapha-charles-vol2", "charles-pseudepigrapha",
        CHARLES_ALL, CHARLES_APPROVED,
    )
    # Also trash per-book .md files for unapproved Charles books.
    unapproved_charles_stems = [
        "aristeas", "sibylline", "assumption-moses", "4-ezra",
        "psalms-solomon", "pirke-aboth", "ahikar", "zadokite-fragments",
    ]
    charles_result["actions"].extend(
        trash_unapproved_per_book_mds("pseudepigrapha-charles-vol2",
                                       unapproved_charles_stems)
    )
    results.append(charles_result)

    print("=" * 72)
    print("SESSION 32 ABOMINATION STRIP — SUMMARY")
    print("=" * 72)
    for r in results:
        print(f"\n{r['source']}:")
        for action in r["actions"]:
            print(f"  • {action}")
    print()


if __name__ == "__main__":
    main()
