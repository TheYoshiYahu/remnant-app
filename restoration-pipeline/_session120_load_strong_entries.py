#!/usr/bin/env python3
"""
Session 120 — Strong's lexicon entries loader.

Parses the OpenScriptures Strong's Hebrew + Greek dictionary XML files at
source-texts/strongs-hebrew/StrongHebrewG.xml and
source-texts/strongs-greek/strongsgreek.xml, normalizes each entry, and
upserts into the strong_entries table.

Public domain — Strong's Hebrew and Chaldee Dictionary (1894) + Strong's
Greek Dictionary (1894), James Strong LL.D., S.T.D. Hebrew sourced from
the OpenScriptures repo's OSIS-format StrongHebrewG.xml (Troidl + Instone-
Brewer 2010 cleanup pass). Greek sourced from the openscriptures/strongs
repo's strongsgreek.xml inside the StrongsGreekDictionaryXML_1.4.zip
delivery (2007 single-file consolidation).

Per the v1 tier matrix (DESIGN_LANGUAGE.md §9), Strong's tap-on-word lookup
is a FREE-tier feature — every partner gets the Strong's number + brief
lexicon entry on every word of every verse, no auth required, no tier gate.
This loader populates the lexicon side of that surface; the verse-word
alignment side is in _session120_load_verse_words.py.

Schema columns (data-schema/schema.sql lines 231-240):
  strong_number    TEXT PRIMARY KEY   'H0001', 'G3056' (4-digit zero-padded)
  language         TEXT NOT NULL      'hebrew' | 'greek' | 'aramaic'
  lemma            TEXT NOT NULL      original-script lemma (אָב, λόγος)
  transliteration  TEXT NOT NULL      'ʼâb', 'logos'
  pronunciation    TEXT NULL          'awb', 'log'-os'
  short_definition TEXT NULL          single-phrase gloss for tooltip
  definition       TEXT NOT NULL      full Strong's entry text
  derivation       TEXT NULL          etymology / root info

The two source files have COMPLETELY DIFFERENT XML schemas. Each gets its
own parser; both produce dicts matching the schema columns above.

Hebrew OSIS schema (parse_hebrew_osis):

  <div type="entry" n="1">
    <w gloss="4a" lemma="אָב" morph="n-m" POS="awb" xlit="ʼâb" ID="H1"
       xml:lang="heb">אב</w>
    <foreign xml:lang="grc"> ... cross-refs to Greek ... </foreign>
    <list>
      <item>1) father of an individual</item>
      <item>2) of God as father of his people</item>
      ...
    </list>
    <note type="explanation"> ... optional derivation ... </note>
  </div>

  In this OSIS variant POS= is the simplified pronunciation, not the
  part-of-speech (morph= carries the POS like 'n-m' = noun masculine).
  ID= carries the Strong's number without zero-padding.

Greek 2007 schema (parse_greek_strongsdictionary):

  <entry strongs="1">
    <strongs>1</strongs>
    <greek BETA="A" unicode="α" translit="alpha" />
    <pronunciation>al'-fah</pronunciation>
    <latin>...</latin>
    <strongs_def>...full definition...</strongs_def>
    <kjv_def>...KJV usage glosses...</kjv_def>
    <strongs_derivation>...etymology...</strongs_derivation>
    <see ... /> ... cross-refs ...
  </entry>

Modes:
  --dry-run    Parse XML + print summary; touch nothing.
  --no-confirm Skip the final apply-confirmation prompt.
  (default)    Apply with a confirmation prompt.

Run:
  # Dry-run locally:
  DATABASE_URL=postgres://localhost/remnant_app \\
    python3 _session120_load_strong_entries.py --dry-run

  # Apply against prod from Render Shell (per S112 future-loader pattern):
  python3 /restoration-pipeline/_session120_load_strong_entries.py --no-confirm

Idempotent. Re-runs upsert by strong_number PK; any field change updates,
unchanged rows no-op.
"""

from __future__ import annotations

import argparse
import asyncio
import os
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Iterator

APP_ROOT = Path(os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent)
HEBREW_XML = APP_ROOT / "source-texts" / "strongs-hebrew" / "StrongHebrewG.xml"
GREEK_XML = APP_ROOT / "source-texts" / "strongs-greek" / "strongsgreek.xml"


def _strip_ns(elem: ET.Element) -> None:
    """Recursively strip namespace prefixes from every element tag in-place."""
    for e in elem.iter():
        if "}" in e.tag:
            e.tag = e.tag.split("}", 1)[1]


def _normalize_strong_number(prefix: str, raw: str) -> str:
    """'1' -> 'H0001', 'H1' -> 'H0001', '1234' -> 'H1234'."""
    digits = "".join(c for c in raw if c.isdigit())
    if not digits:
        raise ValueError(f"no digits in strong_number raw value: {raw!r}")
    return f"{prefix}{int(digits):04d}"


def _element_text(elem: ET.Element | None) -> str:
    """Joined text of an element (own text + descendants' text + tails), trimmed."""
    if elem is None:
        return ""
    return "".join(elem.itertext()).strip()


# ----- Hebrew OSIS parser --------------------------------------------------


def parse_hebrew_osis(xml_path: Path) -> Iterator[dict]:
    """Parse OpenScriptures StrongHebrewG.xml (OSIS format). Yield row dicts."""
    if not xml_path.is_file():
        raise FileNotFoundError(
            f"missing Hebrew XML at {xml_path} — run "
            f"source-texts/download-strongs.sh first"
        )
    tree = ET.parse(xml_path)
    root = tree.getroot()
    _strip_ns(root)

    for entry_div in root.iter("div"):
        if entry_div.get("type") != "entry":
            continue
        # The headword <w> is the first <w> child whose ID starts with H.
        head_w = None
        for w in entry_div.iter("w"):
            wid = w.get("ID") or ""
            if wid.startswith("H"):
                head_w = w
                break
        if head_w is None:
            continue

        wid = head_w.get("ID") or ""
        try:
            strong_number = _normalize_strong_number("H", wid)
        except ValueError:
            n_attr = entry_div.get("n") or ""
            if not n_attr:
                continue
            strong_number = _normalize_strong_number("H", n_attr)

        # Lemma — prefer the vowel-pointed lemma= attribute; fall back to
        # the <w>'s text content (unpointed consonantal form).
        lemma = head_w.get("lemma") or _element_text(head_w)
        if not lemma:
            continue

        transliteration = head_w.get("xlit") or ""
        if not transliteration:
            # Schema requires NOT NULL — fall back to lemma for completeness.
            transliteration = lemma

        # In this OSIS variant POS= carries the simplified pronunciation;
        # morph= carries the part-of-speech grammar.
        pronunciation = head_w.get("POS") or None

        # Definition: gather all <item> texts under <list>.
        items = []
        for item in entry_div.iter("item"):
            t = _element_text(item)
            if t:
                items.append(t)
        if not items:
            # Some entries may have no <list> — fall back to any <note>
            # body, or the lemma alone (schema requires NOT NULL).
            note_text = ""
            for note in entry_div.iter("note"):
                note_text = _element_text(note)
                if note_text:
                    break
            definition = note_text or lemma
        else:
            definition = "\n".join(items)

        # short_definition: first item's text (numbered gloss), or first
        # comma-segment of the full definition.
        short_definition = items[0] if items else (
            definition.split(",", 1)[0].strip()[:140] or None
        )

        # derivation: an <etym> or <note type="explanation"> if present.
        derivation: str | None = None
        etym = entry_div.find("etym")
        if etym is not None:
            derivation = _element_text(etym) or None
        if derivation is None:
            for note in entry_div.iter("note"):
                if note.get("type") in ("explanation", "etymology", "derivation"):
                    derivation = _element_text(note) or None
                    if derivation:
                        break

        # Aramaic detection: morph attribute may start with 'a' (Aramaic
        # particle) or contain 'aramaic' in text. Conservative — if
        # unclear, default to hebrew.
        morph = (head_w.get("morph") or "").lower()
        xml_lang = (head_w.get("{http://www.w3.org/XML/1998/namespace}lang")
                    or head_w.get("lang") or "").lower()
        if xml_lang.startswith("arc") or morph.startswith("a-"):
            language = "aramaic"
        else:
            language = "hebrew"

        yield {
            "strong_number": strong_number,
            "language": language,
            "lemma": lemma,
            "transliteration": transliteration,
            "pronunciation": pronunciation,
            "short_definition": short_definition,
            "definition": definition,
            "derivation": derivation,
        }


# ----- Greek 2007 <strongsdictionary> parser ------------------------------


def parse_greek_strongsdictionary(xml_path: Path) -> Iterator[dict]:
    """Parse openscriptures/strongs strongsgreek.xml. Yield row dicts."""
    if not xml_path.is_file():
        raise FileNotFoundError(
            f"missing Greek XML at {xml_path} — run "
            f"source-texts/download-strongs.sh first"
        )
    tree = ET.parse(xml_path)
    root = tree.getroot()
    _strip_ns(root)

    for entry in root.iter("entry"):
        strongs_raw = entry.get("strongs") or ""
        if not strongs_raw:
            continue
        try:
            strong_number = _normalize_strong_number("G", strongs_raw)
        except ValueError:
            continue

        # <greek BETA="..." unicode="λόγος" translit="logos" />
        greek_el = entry.find("greek")
        if greek_el is None:
            continue
        lemma = greek_el.get("unicode") or ""
        if not lemma:
            continue
        transliteration = greek_el.get("translit") or lemma

        pronunciation_el = entry.find("pronunciation")
        pronunciation = (pronunciation_el.get("strongs")
                         if pronunciation_el is not None and
                         pronunciation_el.get("strongs") is not None
                         else _element_text(pronunciation_el)) or None

        # strongs_def is the full Strong's entry; kjv_def is the KJV
        # usage gloss list (good for short_definition).
        strongs_def_el = entry.find("strongs_def")
        kjv_def_el = entry.find("kjv_def")
        derivation_el = entry.find("strongs_derivation")

        full_def = _element_text(strongs_def_el)
        kjv_def = _element_text(kjv_def_el)
        derivation = _element_text(derivation_el) or None

        # The schema requires definition NOT NULL — pick best available.
        if full_def:
            definition = full_def
        elif kjv_def:
            definition = kjv_def
        else:
            definition = lemma  # last-resort fallback

        # short_definition: kjv_def (compact gloss list) preferred; else
        # the first comma-segment of strongs_def.
        if kjv_def:
            short_definition = kjv_def[:140]
        elif full_def:
            short_definition = full_def.split(",", 1)[0].strip()[:140] or None
        else:
            short_definition = None

        yield {
            "strong_number": strong_number,
            "language": "greek",
            "lemma": lemma,
            "transliteration": transliteration,
            "pronunciation": pronunciation,
            "short_definition": short_definition,
            "definition": definition,
            "derivation": derivation,
        }


def parse_all() -> list[dict]:
    """Parse Hebrew (OSIS) + Greek (2007); return combined list."""
    out: list[dict] = []
    out.extend(parse_hebrew_osis(HEBREW_XML))
    out.extend(parse_greek_strongsdictionary(GREEK_XML))
    return out


# ----- DB apply path -------------------------------------------------------


async def plan_and_apply(
    entries: list[dict],
    database_url: str,
    *,
    dry_run: bool,
) -> dict[str, int]:
    """
    Plan + optionally apply strong_entries upserts.

    Returns counts: {'inserted': N, 'updated': N, 'unchanged': N}.
    """
    import asyncpg
    import ssl as ssl_lib
    from urllib.parse import urlparse, unquote

    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

    parsed = urlparse(database_url)
    conn = await asyncpg.connect(
        host=parsed.hostname,
        port=parsed.port or 5432,
        user=unquote(parsed.username) if parsed.username else None,
        password=unquote(parsed.password) if parsed.password else None,
        database=parsed.path.lstrip("/") if parsed.path else None,
        ssl=ssl_ctx,
        timeout=30,
    )
    try:
        counts = {"inserted": 0, "updated": 0, "unchanged": 0}

        existing_rows = {
            row["strong_number"]: dict(row)
            for row in await conn.fetch(
                "SELECT strong_number, language, lemma, transliteration, "
                "pronunciation, short_definition, definition, derivation "
                "FROM strong_entries"
            )
        }

        if dry_run:
            for e in entries:
                cur = existing_rows.get(e["strong_number"])
                if cur is None:
                    counts["inserted"] += 1
                elif all(
                    (cur.get(k) or "") == (e.get(k) or "")
                    for k in ("language", "lemma", "transliteration",
                              "pronunciation", "short_definition",
                              "definition", "derivation")
                ):
                    counts["unchanged"] += 1
                else:
                    counts["updated"] += 1
            return counts

        existing_pks = set(existing_rows.keys())
        BATCH = 500

        to_insert = [e for e in entries if e["strong_number"] not in existing_pks]
        for i in range(0, len(to_insert), BATCH):
            chunk = to_insert[i : i + BATCH]
            await conn.executemany(
                """
                INSERT INTO strong_entries
                    (strong_number, language, lemma, transliteration,
                     pronunciation, short_definition, definition, derivation)
                VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
                """,
                [
                    (e["strong_number"], e["language"], e["lemma"],
                     e["transliteration"], e["pronunciation"],
                     e["short_definition"], e["definition"], e["derivation"])
                    for e in chunk
                ],
            )
            counts["inserted"] += len(chunk)

        to_update = []
        for e in entries:
            cur = existing_rows.get(e["strong_number"])
            if cur is None:
                continue
            if all(
                (cur.get(k) or "") == (e.get(k) or "")
                for k in ("language", "lemma", "transliteration",
                          "pronunciation", "short_definition",
                          "definition", "derivation")
            ):
                counts["unchanged"] += 1
            else:
                to_update.append(e)

        for i in range(0, len(to_update), BATCH):
            chunk = to_update[i : i + BATCH]
            await conn.executemany(
                """
                UPDATE strong_entries
                   SET language = $2,
                       lemma = $3,
                       transliteration = $4,
                       pronunciation = $5,
                       short_definition = $6,
                       definition = $7,
                       derivation = $8
                 WHERE strong_number = $1
                """,
                [
                    (e["strong_number"], e["language"], e["lemma"],
                     e["transliteration"], e["pronunciation"],
                     e["short_definition"], e["definition"], e["derivation"])
                    for e in chunk
                ],
            )
            counts["updated"] += len(chunk)

        return counts
    finally:
        await conn.close()


def confirm(prompt: str) -> bool:
    print(prompt, end=" ", flush=True)
    try:
        return input().strip().lower() in {"y", "yes"}
    except EOFError:
        return False


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--no-confirm", action="store_true")
    args = ap.parse_args()

    print(f"==> parsing {HEBREW_XML.name}")
    print(f"==> parsing {GREEK_XML.name}")
    entries = parse_all()
    by_lang: dict[str, int] = {}
    for e in entries:
        by_lang[e["language"]] = by_lang.get(e["language"], 0) + 1
    print(f"Parsed {len(entries)} Strong's entries:")
    for lang in sorted(by_lang):
        print(f"  {lang:>8}: {by_lang[lang]:>6}")
    print()

    if not entries:
        print("error: no entries parsed; check XML paths", file=sys.stderr)
        return 2

    database_url = os.environ.get("DATABASE_URL", "")
    if not database_url:
        print("error: DATABASE_URL is not set", file=sys.stderr)
        return 2

    print("==> dry-run plan against current DB")
    plan = asyncio.run(plan_and_apply(entries, database_url, dry_run=True))
    print(f"Plan: insert={plan['inserted']}  update={plan['updated']}  "
          f"unchanged={plan['unchanged']}")
    print()

    if args.dry_run:
        print("Dry-run complete; no changes applied.")
        return 0

    if plan["inserted"] == 0 and plan["updated"] == 0:
        print("Nothing to apply.")
        return 0

    if not args.no_confirm:
        if not confirm("Apply? [y/N]"):
            print("Aborted.")
            return 1

    print("==> applying")
    result = asyncio.run(plan_and_apply(entries, database_url, dry_run=False))
    print(f"Applied: insert={result['inserted']}  update={result['updated']}  "
          f"unchanged={result['unchanged']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
