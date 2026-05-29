#!/usr/bin/env python3
"""
S163 — Phase 9.3 full-corpus lexicon loader.

Reads BDB (Brown-Driver-Briggs 1906, OpenScriptures TEI XML), LSJ (Tyndale-edited
1940 LSJ + Abbott-Smith 1922 NT-fallback via STEPBible TFLSJ), TBESH/TBESG (Tyndale
Strong's-keyed enrichment), normalizes citations + cross-refs against the canonical
book-slug map + a lexicon-internal Strong's set, and emits a bulk-INSERT migration
re-runnable via ON CONFLICT DO UPDATE.

Spec: DESIGN_LANGUAGE.md §26.
Parse plan: _scratch/S158_LEXICON_PARSE_PLAN.md.
Loader skeleton: _scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md.

Extends the S160 sample-render parsers:
  restoration-pipeline/_session160_bdb_sample_render.py
  restoration-pipeline/_session160_lsj_sample_render.py

S163 decisions (locked at session open, per S163_SESSION_OPEN_PROMPT.md):
  Q1 Citation normalization aggressiveness: graceful (log + wrap unresolved in
     <span class="lexicon-unresolved-cite">) — never abort the load, never emit
     broken links. Matches publish-then-edit.
  Q2 Body size cap: store full body. PWA's Companion-tier gate keeps it off
     the free surface; collapse-toggle is a v1.1 PWA-side refinement if reads
     feel heavy on the walk.
  Q3 API endpoint shape (downstream): single combined GET /v1/lexicon/{strong}
     returning { entries, callout }. Loader emits per-(source, strong) rows;
     the endpoint composes.
  Q4 Tier gate location (downstream): at the API endpoint (server-side 403).

Outputs:
  data-schema/migrations/session163_lexicon_entries_load.sql
  _scratch/lexicon_load_report_s163.md

Run from the host (not sandbox — the source-texts/ files are read directly):
  cd ~/Desktop/App
  python3 restoration-pipeline/_session163_load_lexicon_entries.py

Idempotent. Same source → same SQL file → same migration apply outcome.
"""

from __future__ import annotations

import html
import json
import re
import sys
import xml.etree.ElementTree as ET
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable, Optional

# ──────────────────────────────────────────────────────────────────────────────
# Paths
# ──────────────────────────────────────────────────────────────────────────────

REPO_ROOT = Path(__file__).resolve().parent.parent
SOURCE_TEXTS = REPO_ROOT / "source-texts"
OS_BDB_DIR = SOURCE_TEXTS / "openscriptures-hebrewlexicon"
LEXICAL_INDEX_XML = OS_BDB_DIR / "LexicalIndex.xml"
BDB_XML = OS_BDB_DIR / "BrownDriverBriggs.xml"
STEPBIBLE_DIR = SOURCE_TEXTS / "stepbible-data" / "Lexicons"
TFLSJ_FILES = sorted(STEPBIBLE_DIR.glob("TFLSJ*.txt"))
TBESH_FILES = sorted(STEPBIBLE_DIR.glob("TBESH*.txt"))
TBESG_FILES = sorted(STEPBIBLE_DIR.glob("TBESG*.txt"))
CANON_JSON = SOURCE_TEXTS / "parsed" / "canon.json"
STRONG_HEBREW_XML = SOURCE_TEXTS / "strongs-hebrew" / "StrongHebrewG.xml"
STRONG_GREEK_XML = SOURCE_TEXTS / "strongs-greek" / "strongsgreek.xml"
MIGRATIONS_DIR = REPO_ROOT / "data-schema" / "migrations"
OUTPUT_SQL = MIGRATIONS_DIR / "session163_lexicon_entries_load.sql"
OUTPUT_REPORT = REPO_ROOT / "_scratch" / "lexicon_load_report_s163.md"

NS_HB = {"hb": "http://openscriptures.github.com/morphhb/namespace"}
HB_NS_PREFIX = "{" + NS_HB["hb"] + "}"

BATCH_SIZE = 500  # rows per INSERT statement


# ──────────────────────────────────────────────────────────────────────────────
# Book-abbreviation → canonical-slug maps
# ──────────────────────────────────────────────────────────────────────────────
#
# Built from empirical scan of BDB <ref r="..."> + TFLSJ NT./LXX./AbbSmith.
# title prefixes (see S163 open log for frequency counts). Canonical slugs
# match source-texts/parsed/canon.json book_id values. Abbreviations not in
# this map fall through to the unresolved-cite span per Q1 graceful default.

# BDB uses unprefixed abbreviations. Includes typo-tolerant aliases caught
# during the scan (Ho, Hosea, Is, Erz, Jb, Jos, Jugd, Ez, Zec, Zp, iKgs, 1cHR).
BDB_BOOK_ABBREV: dict[str, str] = {
    # Torah
    "Gen": "genesis", "Exod": "exodus", "Ex": "exodus", "Lev": "leviticus",
    "Num": "numbers", "Nu": "numbers", "Deut": "deuteronomy", "Dt": "deuteronomy",
    # Former prophets
    "Josh": "joshua", "Jos": "joshua", "Judg": "judges", "Jugd": "judges",
    "Jdg": "judges", "Ju": "judges", "Ruth": "ruth", "Ru": "ruth",
    "1Sam": "1-samuel", "2Sam": "2-samuel",
    "1Kgs": "1-kings", "iKgs": "1-kings", "2Kgs": "2-kings",
    "1Chr": "1-chronicles", "1cHR": "1-chronicles", "2Chr": "2-chronicles",
    "Ezra": "ezra", "Erz": "ezra", "Neh": "nehemiah", "Esth": "esther",
    # Wisdom / poetry
    "Job": "job", "Jb": "job", "Ps": "psalms", "Pss": "psalms", "Psa": "psalms",
    "Prov": "proverbs", "Pr": "proverbs",
    "Eccl": "ecclesiastes", "Ec": "ecclesiastes", "Qoh": "ecclesiastes",
    "Song": "song-of-solomon", "Cant": "song-of-solomon", "Ca": "song-of-solomon",
    # Major prophets
    "Isa": "isaiah", "Is": "isaiah", "Jer": "jeremiah", "Je": "jeremiah",
    "Lam": "lamentations", "La": "lamentations",
    "Ezek": "ezekiel", "Ez": "ezekiel", "Eze": "ezekiel",
    "Dan": "daniel", "Dn": "daniel",
    # Minor prophets
    "Hos": "hosea", "Ho": "hosea", "Hosea": "hosea",
    "Joel": "joel", "Jl": "joel",
    "Amos": "amos", "Am": "amos",
    "Obad": "obadiah", "Ob": "obadiah",
    "Jonah": "jonah", "Jon": "jonah",
    "Mic": "micah", "Mi": "micah",
    "Nah": "nahum", "Na": "nahum",
    "Hab": "habakkuk", "Hb": "habakkuk",
    "Zeph": "zephaniah", "Zp": "zephaniah",
    "Hag": "haggai", "Hg": "haggai",
    "Zech": "zechariah", "Zec": "zechariah", "Zc": "zechariah",
    "Mal": "malachi",
    # NT (rare in BDB)
    "Matt": "matthew", "Mt": "matthew",
    "Mark": "mark", "Mk": "mark", "Mrk": "mark",
    "Luke": "luke", "Lk": "luke", "Luk": "luke",
    "John": "john", "Jn": "john", "Jhn": "john",
    "Acts": "acts", "Act": "acts",
    "Rom": "romans",
    "1Cor": "1-corinthians", "2Cor": "2-corinthians",
    "Gal": "galatians", "Eph": "ephesians", "Phil": "philippians", "Col": "colossians",
    "1Thes": "1-thessalonians", "1Thess": "1-thessalonians",
    "2Thes": "2-thessalonians", "2Thess": "2-thessalonians",
    "1Tim": "1-timothy", "1Ti": "1-timothy",
    "2Tim": "2-timothy", "2Ti": "2-timothy",
    "Tit": "titus", "Phm": "philemon", "Phlm": "philemon",
    "Heb": "hebrews",
    "Jam": "james", "Jas": "james", "Ja": "james",
    "1Pet": "1-peter", "1Pe": "1-peter",
    "2Pet": "2-peter", "2Pe": "2-peter",
    "1Jn": "1-john", "1John": "1-john",
    "2Jn": "2-john", "2John": "2-john",
    "3Jn": "3-john", "3John": "3-john",
    "Jud": "jude", "Jude": "jude",
    "Rev": "revelation",
}

# LSJ uses NT./LXX./OT.-prefixed Tyndale citation hovers; Abbott-Smith uses
# <ref='Abbrev.C.V'> markup. The abbreviation alphabet overlaps BDB but
# Tyndale leans toward 3-letter forms (Mat, Mrk, Jhn, Luk) for AbbSmith and
# 4-letter forms (Matt, Mark, John, Luke) for NT. Build a unified map.
# Apocrypha abbreviations (1Mac, 2Mac, Sir, Wis, Tob, Bar, Jud-extra, 4Mac,
# 3Ki = LXX numbering for 1 Kings, 4Ki = 2 Kings) are not in canon.json's
# 66-book scope; they fall through to the unresolved-cite span per Q1.
LSJ_BOOK_ABBREV: dict[str, str] = dict(BDB_BOOK_ABBREV)  # start from BDB
LSJ_BOOK_ABBREV.update({
    # NT prefix-stripped (after "NT." removal)
    "Matt": "matthew", "Mat": "matthew",
    "Mark": "mark", "Mrk": "mark",
    "Luke": "luke", "Luk": "luke",
    "John": "john", "Jhn": "john",
    "Act": "acts", "Acts": "acts",
    "1Cor": "1-corinthians", "2Cor": "2-corinthians",
    "1Co": "1-corinthians", "2Co": "2-corinthians",  # Tyndale short variants
    "Gal": "galatians", "Eph": "ephesians",
    "Phil": "philippians", "Phl": "philippians", "Col": "colossians",
    "1Thes": "1-thessalonians", "2Thes": "2-thessalonians",
    "1Th": "1-thessalonians", "2Th": "2-thessalonians",  # short variants
    "1Tim": "1-timothy", "2Tim": "2-timothy",
    "1Ti": "1-timothy", "2Ti": "2-timothy",  # short variants (Abbott-Smith)
    "Tit": "titus", "Phm": "philemon",
    "Heb": "hebrews", "Jam": "james",
    "1Pet": "1-peter", "2Pet": "2-peter",
    "1Pe": "1-peter", "2Pe": "2-peter",  # short variants
    "1Jn": "1-john", "2Jn": "2-john", "3Jn": "3-john",
    "1Jo": "1-john", "2Jo": "2-john", "3Jo": "3-john",  # Tyndale variants
    "Jud": "jude",
    "Rev": "revelation",
    # LXX prefix-stripped (after "LXX." removal)
    "Gen": "genesis", "Exo": "exodus", "Lev": "leviticus",
    "Num": "numbers", "Deu": "deuteronomy", "Josh": "joshua",
    "Judg": "judges", "Ruth": "ruth",
    "1Ki": "1-samuel",     # LXX numbering: 1 Kings = 1 Samuel
    "2Ki": "2-samuel",     # LXX numbering: 2 Kings = 2 Samuel
    "3Ki": "1-kings",      # LXX numbering: 3 Kings = 1 Kings (KJV)
    "4Ki": "2-kings",      # LXX numbering: 4 Kings = 2 Kings (KJV)
    "1Ch": "1-chronicles", "2Ch": "2-chronicles",
    "Ezr": "ezra", "Neh": "nehemiah", "Esth": "esther",
    "Job": "job", "Psa": "psalms", "Pro": "proverbs",
    "Eccl": "ecclesiastes", "Song": "song-of-solomon",
    "Isa": "isaiah", "Jer": "jeremiah", "Lam": "lamentations",
    "Eze": "ezekiel", "Dan": "daniel",
    "Hos": "hosea", "Joel": "joel", "Amos": "amos", "Obad": "obadiah",
    "Jonah": "jonah", "Mic": "micah", "Nah": "nahum", "Hab": "habakkuk",
    "Zeph": "zephaniah", "Hag": "haggai", "Zech": "zechariah", "Mal": "malachi",
})


# ──────────────────────────────────────────────────────────────────────────────
# Disclaimer text (mirrors DESIGN_LANGUAGE §26 "Standing disclaimer + framework
# callouts" section; loader writes it as a property-comment but the actual
# rendering happens in the PWA's LexiconSheet via formatDisclaimer helper).
# ──────────────────────────────────────────────────────────────────────────────

DISCLAIMER_BDB = (
    "The lexicon below is BDB (Brown-Driver-Briggs, 1906) — a 19th-century "
    "Christian-era Hebrew scholarship work, preserved as data so you can see "
    "how the inherited tradition handled the word. The framework's reading "
    "lives in the verse commentary and in the framework callouts below; where "
    "the lexicon and the framework diverge, the framework is the standard."
)
DISCLAIMER_LSJ = (
    "The lexicon below is LSJ (Liddell-Scott-Jones, 1940 — Tyndale-edited from "
    "the 9th edition), with Abbott-Smith's Manual Greek Lexicon of the New "
    "Testament (1922) filling in NT-only vocabulary where LSJ has no entry. "
    "Preserved as data so you can see how the inherited 19th–20th-century "
    "classical-philological and NT-Greek scholarship handled the word. The "
    "framework's reading lives in the verse commentary and in the framework "
    "callouts below; where the lexicon and the framework diverge, the framework "
    "is the standard."
)


# ──────────────────────────────────────────────────────────────────────────────
# Validation context
# ──────────────────────────────────────────────────────────────────────────────

@dataclass
class LoaderContext:
    """Tracks valid Strong's numbers (lexicon-internal union), valid canonical
    book-slugs, and the running tally of resolutions / downgrades for the
    coverage report."""
    valid_strongs: set[str] = field(default_factory=set)
    valid_book_slugs: set[str] = field(default_factory=set)

    # Citation outcomes per record (resolved / downgraded). Keyed (source, strong).
    resolved_cites_per_record: dict[tuple[str, str], int] = field(default_factory=lambda: defaultdict(int))
    downgraded_cites_per_record: dict[tuple[str, str], int] = field(default_factory=lambda: defaultdict(int))

    # Unresolved-citation samples for the coverage report (book-abbrev → list of (source, strong, raw_cite)).
    unresolved_cite_samples: dict[str, list[tuple[str, str, str]]] = field(default_factory=lambda: defaultdict(list))

    # Unresolved cross-ref samples (target → list of (source, strong, raw_target)).
    unresolved_xref_samples: dict[str, list[tuple[str, str, str]]] = field(default_factory=lambda: defaultdict(list))

    def note_resolved_cite(self, source: str, strong: str) -> None:
        self.resolved_cites_per_record[(source, strong)] += 1

    def note_downgraded_cite(self, source: str, strong: str, raw: str, abbrev_key: str) -> None:
        self.downgraded_cites_per_record[(source, strong)] += 1
        if len(self.unresolved_cite_samples[abbrev_key]) < 8:
            self.unresolved_cite_samples[abbrev_key].append((source, strong, raw))

    def note_unresolved_xref(self, source: str, strong: str, target: str) -> None:
        if len(self.unresolved_xref_samples[target]) < 8:
            self.unresolved_xref_samples[target].append((source, strong, target))


# ──────────────────────────────────────────────────────────────────────────────
# Helpers
# ──────────────────────────────────────────────────────────────────────────────

def pad_strong(raw: str) -> Optional[str]:
    """H1 → H0001, G65 → G0065. Returns None if raw doesn't match the
    Strong's-number shape (handles homograph suffixes a-z)."""
    m = re.match(r"^([HG])(\d+)([a-z]?)$", raw)
    if not m:
        return None
    letter, num, suffix = m.group(1), m.group(2), m.group(3)
    padded = f"{letter}{int(num):04d}"
    return padded if suffix in ("", "a") else f"{padded}{suffix}"


def sql_escape(s: Optional[str]) -> str:
    """Postgres single-quoted string literal. NULL for None."""
    if s is None:
        return "NULL"
    escaped = s.replace("'", "''")
    return f"'{escaped}'"


def sql_escape_array(arr: list[str]) -> str:
    """Postgres text-array literal. ARRAY[]::TEXT[] for empty."""
    if not arr:
        return "ARRAY[]::TEXT[]"
    items = ", ".join(sql_escape(x) for x in arr)
    return f"ARRAY[{items}]"


def escape_html_text(s: str) -> str:
    """HTML-escape text content (preserves Unicode Hebrew/Greek + diacritics)."""
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def safe_attr(s: str) -> str:
    """HTML attribute escape."""
    return s.replace("&", "&amp;").replace('"', "&quot;").replace("<", "&lt;").replace(">", "&gt;")


def load_canon_book_slugs() -> set[str]:
    """Return the 66 canonical book_id slugs from source-texts/parsed/canon.json."""
    with CANON_JSON.open(encoding="utf-8") as f:
        canon = json.load(f)
    return {b["book_id"] for b in canon["books"]}


def load_strong_entries_set() -> set[str]:
    """Parse the OpenScriptures Strong's Hebrew + Greek XMLs to derive the
    exact set of Strong's-numbers present in the strong_entries table (loaded
    at S120 from the same sources). The lexicon_entries.strong_number FK
    targets this set; any LSJ row with strong_number > G5624 (TFLSJ-extra's
    extended Tyndale numbering) would violate the FK and abort the whole
    transaction on apply.

    Returns a set of canonical 4-digit-padded strong_numbers
    (H0001 … H8674, G0001 … G5624).
    """
    out: set[str] = set()

    # Hebrew — OSIS format `<div type="entry" n="N">`
    if STRONG_HEBREW_XML.exists():
        text = STRONG_HEBREW_XML.read_text(encoding="utf-8")
        for raw_n in re.findall(r'<div\s+type="entry"\s+n="(\d+)"', text):
            out.add(f"H{int(raw_n):04d}")

    # Greek — strongsgreek.xml format `<entry strongs="N">`
    if STRONG_GREEK_XML.exists():
        text = STRONG_GREEK_XML.read_text(encoding="utf-8")
        for raw_n in re.findall(r'<entry\b[^>]*\bstrongs="(\d+)"', text):
            out.add(f"G{int(raw_n):04d}")

    return out


def lexicon_citation_to_slug(
    raw: str,
    abbrev_map: dict[str, str],
    valid_slugs: set[str],
) -> tuple[Optional[str], Optional[int], Optional[int], str]:
    """Parse a Tyndale/BDB citation like 'Gen.1.1' / 'NT.Matt.22.5' / '1Cor.13.4-7'
    and return (slug, chapter, verse, abbrev_key_for_logging).

    Returns (None, None, None, abbrev) when:
      - abbreviation isn't in the map (raises through to graceful-downgrade)
      - chapter/verse can't be parsed
      - slug is not in valid_slugs (e.g., apocrypha abbreviations like Sir / 2Mac
        that LSJ cites but canon.json doesn't carry)
    """
    if not raw:
        return None, None, None, ""

    # Strip LSJ-side prefixes: NT./LXX./OT./AbbSmith.
    s = raw.strip()
    for prefix in ("NT.", "LXX.", "OT.", "AbbSmith."):
        if s.startswith(prefix):
            s = s[len(prefix):]
            break

    # Split on dots, hyphens, colons, commas, semicolons. First token is book
    # abbreviation; second is chapter; third is verse (may be verse-range).
    parts = re.split(r"[.:,;\s]+", s, maxsplit=2)
    if not parts:
        return None, None, None, ""

    abbrev = parts[0]
    slug = abbrev_map.get(abbrev)
    if slug is None:
        return None, None, None, abbrev
    if slug not in valid_slugs:
        return None, None, None, abbrev

    chapter = None
    verse = None
    if len(parts) >= 2:
        m_ch = re.match(r"^(\d+)", parts[1])
        if m_ch:
            chapter = int(m_ch.group(1))
    if len(parts) >= 3:
        m_v = re.match(r"^(\d+)", parts[2])
        if m_v:
            verse = int(m_v.group(1))

    return slug, chapter, verse, abbrev


def slug_to_verse_anchor(slug: str, chapter: Optional[int], verse: Optional[int]) -> str:
    """Build the data-verse attribute value: 'genesis-1:1' or 'genesis-1' or 'genesis'."""
    if chapter is None:
        return slug
    if verse is None:
        return f"{slug}-{chapter}"
    return f"{slug}-{chapter}:{verse}"


# ──────────────────────────────────────────────────────────────────────────────
# BDB pipeline (extends _session160_bdb_sample_render.py)
# ──────────────────────────────────────────────────────────────────────────────

SKIP_TAGS_BDB = {"status", "page"}


def parse_lexical_index(path: Path) -> tuple[dict[str, str], dict[str, ET.Element], dict[str, ET.Element], dict[str, str]]:
    """Returns:
      strong_to_bdb     : { 'H0001': 'a.ae.ab', ... }
      bdb_to_index      : { 'a.ac.aa': <ET.Element>, ... }
      index_id_to_entry : { 'aaf': <ET.Element>, ... }
      bdb_to_strong     : { 'a.ae.aa': 'H0410', ... } (reverse map for cross-lemma resolution)
    """
    tree = ET.parse(str(path))
    root = tree.getroot()

    strong_to_bdb: dict[str, str] = {}
    bdb_to_index: dict[str, ET.Element] = {}
    index_id_to_entry: dict[str, ET.Element] = {}
    bdb_to_strong: dict[str, str] = {}

    for entry in root.iter(HB_NS_PREFIX + "entry"):
        eid = entry.get("id")
        if eid:
            index_id_to_entry[eid] = entry
        xref = entry.find(HB_NS_PREFIX + "xref")
        if xref is None:
            continue
        bdb_id = xref.get("bdb")
        strong = xref.get("strong")
        if bdb_id and strong:
            m = re.match(r"^(\d+)([a-z]?)$", strong)
            if m:
                num, suffix = m.group(1), m.group(2)
                padded = f"H{int(num):04d}"
                if suffix in ("", "a"):
                    strong_to_bdb.setdefault(padded, bdb_id)
                    bdb_to_strong.setdefault(bdb_id, padded)
                else:
                    key = f"{padded}{suffix}"
                    strong_to_bdb.setdefault(key, bdb_id)
                    bdb_to_strong.setdefault(bdb_id, key)
        if bdb_id:
            bdb_to_index.setdefault(bdb_id, entry)

    return strong_to_bdb, bdb_to_index, index_id_to_entry, bdb_to_strong


def parse_bdb_xml(path: Path) -> dict[str, ET.Element]:
    """Returns { 'a.ac.aa': <ET.Element>, ... } keyed by entry/@id."""
    tree = ET.parse(str(path))
    root = tree.getroot()
    entries: dict[str, ET.Element] = {}
    for entry in root.iter(HB_NS_PREFIX + "entry"):
        eid = entry.get("id")
        if eid:
            entries[eid] = entry
    return entries


def resolve_sub_to_root(
    index_entry: ET.Element,
    index_id_to_entry: dict[str, ET.Element],
) -> tuple[Optional[str], Optional[ET.Element]]:
    """If LexicalIndex entry is etym type='sub', return (root_bdb_id, root_index_entry)."""
    etym = index_entry.find(HB_NS_PREFIX + "etym")
    if etym is None or etym.get("type") != "sub":
        return None, None
    root_idx_id = (etym.text or "").strip()
    if not root_idx_id:
        return None, None
    root_entry = index_id_to_entry.get(root_idx_id)
    if root_entry is None:
        return None, None
    root_xref = root_entry.find(HB_NS_PREFIX + "xref")
    if root_xref is None:
        return None, None
    return root_xref.get("bdb"), root_entry


def render_bdb_element(
    elem: ET.Element,
    ctx: LoaderContext,
    bdb_to_strong: dict[str, str],
    source: str,
    strong: str,
) -> str:
    """TEI BDB <entry> → semantic HTML. Citation + cross-lemma normalization
    against ctx.valid_book_slugs + ctx.valid_strongs; unresolved targets
    downgrade to <span class="lexicon-unresolved-cite">."""
    if elem is None:
        return ""

    tag = elem.tag.split("}", 1)[-1] if "}" in elem.tag else elem.tag
    if tag in SKIP_TAGS_BDB:
        return escape_html_text(elem.tail or "")

    children_html = "".join(
        render_bdb_element(child, ctx, bdb_to_strong, source, strong) for child in elem
    )
    text_before = escape_html_text(elem.text or "")
    tail = escape_html_text(elem.tail or "")

    if tag == "entry":
        return f"{text_before}{children_html}{tail}"

    if tag == "w":
        src = elem.get("src")
        mod = elem.get("mod")
        classes = ["bdb-hebrew"]
        if mod:
            classes.append(f"bdb-mod-{mod}")
        cls_attr = " ".join(classes)
        if src:
            # Cross-lemma reference. Resolve src (BDB internal id) → Strong's
            # number when possible; fall back to data-bdb for root entries
            # without their own Strong's-number alignment.
            target_strong = bdb_to_strong.get(src)
            if target_strong:
                return (
                    f'<a class="bdb-cross-lemma" data-strong="{target_strong}">'
                    f'<span class="{cls_attr}">{text_before}{children_html}</span>'
                    f"</a>{tail}"
                )
            else:
                ctx.note_unresolved_xref(source, strong, src)
                return (
                    f'<a class="bdb-cross-lemma" data-bdb="{safe_attr(src)}">'
                    f'<span class="{cls_attr}">{text_before}{children_html}</span>'
                    f"</a>{tail}"
                )
        return f'<span class="{cls_attr}">{text_before}{children_html}</span>{tail}'

    if tag == "def":
        return f'<em class="bdb-def">{text_before}{children_html}</em>{tail}'

    if tag == "ref":
        raw_r = elem.get("r", "")
        slug, ch, v, abbrev = lexicon_citation_to_slug(
            raw_r, BDB_BOOK_ABBREV, ctx.valid_book_slugs
        )
        if slug:
            ctx.note_resolved_cite(source, strong)
            anchor = slug_to_verse_anchor(slug, ch, v)
            return (
                f'<a class="bdb-citation" data-verse="{anchor}">'
                f"{text_before}{children_html}</a>{tail}"
            )
        else:
            ctx.note_downgraded_cite(source, strong, raw_r, abbrev or "(empty)")
            return (
                f'<span class="lexicon-unresolved-cite" title="{safe_attr(raw_r)}">'
                f"{text_before}{children_html}</span>{tail}"
            )

    if tag == "sense":
        n = elem.get("n")
        if n:
            return (
                f'<li class="bdb-sense" data-sense="{safe_attr(n)}">'
                f'<span class="bdb-sense-num">{escape_html_text(n)}.</span> '
                f"{text_before}{children_html}</li>{tail}"
            )
        return f'<div class="bdb-sense-block">{text_before}{children_html}</div>{tail}'

    if tag == "pos":
        return f'<span class="bdb-pos">{text_before}{children_html}</span>{tail}'
    if tag == "stem":
        return f'<span class="bdb-stem">{text_before}{children_html}</span>{tail}'
    if tag == "asp":
        return f'<span class="bdb-aspect">{text_before}{children_html}</span>{tail}'
    if tag == "foreign":
        lang = elem.get("{http://www.w3.org/XML/1998/namespace}lang", "")
        return f'<span class="bdb-foreign" data-lang="{safe_attr(lang)}">{text_before}{children_html}</span>{tail}'
    if tag == "em":
        return f"<em>{text_before}{children_html}</em>{tail}"
    if tag == "pron":
        return f'<span class="bdb-pron">{text_before}{children_html}</span>{tail}'

    return f"{text_before}{children_html}{tail}"


SENSE_OL_WRAP_RE = re.compile(
    r"((?:<li class=\"bdb-sense\".*?</li>\s*)+)",
    re.DOTALL,
)


def render_bdb_entry_body(
    entry: ET.Element,
    ctx: LoaderContext,
    bdb_to_strong: dict[str, str],
    source: str,
    strong: str,
) -> str:
    """Render an entry's body and wrap contiguous numbered <li class="bdb-sense">
    chunks in <ol class="bdb-senses">."""
    body = render_bdb_element(entry, ctx, bdb_to_strong, source, strong)
    return SENSE_OL_WRAP_RE.sub(
        lambda m: f'<ol class="bdb-senses">{m.group(1)}</ol>',
        body,
    )


def build_bdb_body_html(
    strong: str,
    bdb_id: str,
    bdb_entries: dict[str, ET.Element],
    lexical_index: dict[str, ET.Element],
    bdb_to_index: dict[str, ET.Element],
    index_id_to_entry: dict[str, ET.Element],
    bdb_to_strong: dict[str, str],
    ctx: LoaderContext,
) -> Optional[tuple[str, ET.Element]]:
    """Returns (body_html, primary_index_entry) or None if entry isn't on disk."""
    sub_entry = bdb_entries.get(bdb_id)
    if sub_entry is None:
        return None

    index_entry = bdb_to_index.get(bdb_id)
    root_bdb_id, _ = (None, None)
    if index_entry is not None:
        root_bdb_id, _ = resolve_sub_to_root(index_entry, index_id_to_entry)

    root_entry = bdb_entries.get(root_bdb_id) if root_bdb_id else None

    # If sub IS the root (etym main, not sub), render root alone.
    if root_entry is None and index_entry is not None:
        etym = index_entry.find(HB_NS_PREFIX + "etym")
        if etym is not None and etym.get("type") == "main":
            root_entry, sub_entry = sub_entry, None

    sub_html = (
        render_bdb_entry_body(sub_entry, ctx, bdb_to_strong, "bdb", strong)
        if sub_entry is not None
        else ""
    )
    root_html = ""
    if (
        root_entry is not None
        and sub_entry is not None
        and root_entry.get("id") != sub_entry.get("id")
    ):
        root_body = render_bdb_entry_body(root_entry, ctx, bdb_to_strong, "bdb", strong)
        root_html = (
            '<hr class="lexicon-sub-root-divider" />'
            '<div class="bdb-root-analysis">'
            '<h4 class="bdb-root-header">Root analysis</h4>'
            f'<div class="bdb-root-body">{root_body}</div>'
            '</div>'
        )
    elif sub_entry is None and root_entry is not None:
        root_html = render_bdb_entry_body(root_entry, ctx, bdb_to_strong, "bdb", strong)

    body_html = f'<div class="bdb-body">{sub_html}{root_html}</div>'
    return body_html, (index_entry or root_entry)


def extract_bdb_lemma(index_entry: Optional[ET.Element]) -> tuple[str, Optional[str], Optional[str]]:
    """Pull (lemma, transliteration, short_def_from_index) from LexicalIndex
    entry's <w xlit=...> + <def>. Returns ('', None, None) when no index entry."""
    if index_entry is None:
        return "", None, None
    w = index_entry.find(HB_NS_PREFIX + "w")
    lemma = (w.text or "").strip() if w is not None else ""
    xlit = w.get("xlit", "") if w is not None else ""
    d = index_entry.find(HB_NS_PREFIX + "def")
    short_def = (d.text or "").strip() if d is not None else None
    pos = index_entry.find(HB_NS_PREFIX + "pos")
    pos_text = (pos.text or "").strip() if pos is not None else None
    return lemma, xlit or None, short_def


def extract_bdb_pos(index_entry: Optional[ET.Element]) -> Optional[str]:
    if index_entry is None:
        return None
    pos = index_entry.find(HB_NS_PREFIX + "pos")
    return (pos.text or "").strip() if pos is not None else None


def walk_bdb(
    strong_to_bdb: dict[str, str],
    bdb_entries: dict[str, ET.Element],
    bdb_to_index: dict[str, ET.Element],
    index_id_to_entry: dict[str, ET.Element],
    bdb_to_strong: dict[str, str],
    ctx: LoaderContext,
) -> Iterable[dict]:
    """Yield one record per Strong's-number with a BDB entry on disk."""
    for strong, bdb_id in sorted(strong_to_bdb.items()):
        out = build_bdb_body_html(
            strong, bdb_id, bdb_entries, bdb_to_index, bdb_to_index, index_id_to_entry,
            bdb_to_strong, ctx,
        )
        if out is None:
            continue
        body_html, index_entry = out
        lemma, xlit, short_def = extract_bdb_lemma(index_entry)
        pos = extract_bdb_pos(index_entry)

        cites = ctx.resolved_cites_per_record[("bdb", strong)] + \
                ctx.downgraded_cites_per_record[("bdb", strong)]

        yield {
            "source": "bdb",
            "strong_number": strong,
            "lemma": lemma or strong,
            "transliteration": xlit,
            "pronunciation": None,
            "part_of_speech": pos,
            "short_definition": short_def,
            "body_html": body_html,
            "derivation": None,
            "citations_count": cites,
        }


# ──────────────────────────────────────────────────────────────────────────────
# LSJ pipeline (extends _session160_lsj_sample_render.py)
# ──────────────────────────────────────────────────────────────────────────────

CITATION_HOVER_RE = re.compile(
    r'<a\s+href="javascript:void\(0\)"\s+title="([^"]*)">([^<]*)</a>',
    re.IGNORECASE,
)
ABBOTT_REF_RE = re.compile(r"<ref='([^']+)'>([^<]+)</ref>")


def parse_tflsj_files(paths: list[Path]) -> dict[str, dict]:
    """Returns { 'G0065': { 'lemma', 'translit', 'morph', 'gloss', 'body' }, ... }"""
    entries: dict[str, dict] = {}
    for fp in paths:
        with fp.open(encoding="utf-8") as f:
            for line in f:
                line = line.rstrip("\n")
                if not line.startswith(("G", "H")):
                    continue
                parts = line.split("\t")
                if len(parts) < 8:
                    continue
                e_strong = parts[0].strip()
                m = re.match(r"^([GH])(\d+)([a-z]?)$", e_strong)
                if not m:
                    continue
                letter, num, suffix = m.group(1), m.group(2), m.group(3)
                padded = f"{letter}{int(num):04d}"
                key = padded if suffix in ("", "a") else f"{padded}{suffix}"
                if key in entries:
                    continue
                entries[key] = {
                    "lemma": parts[3].strip(),
                    "translit": parts[4].strip(),
                    "morph": parts[5].strip(),
                    "gloss": parts[6].strip(),
                    "body": parts[7] if len(parts) > 7 else "",
                }
    return entries


def transform_lsj_body(
    raw_html: str,
    ctx: LoaderContext,
    source: str,
    strong: str,
) -> str:
    """Convert Tyndale's LSJ HTML to display HTML with citation normalization."""
    if not raw_html:
        return ""

    def repl_hover(m: re.Match) -> str:
        title = m.group(1).strip()
        label = m.group(2).strip()
        # Biblical detection: title's FIRST ref-token must start with NT./LXX./OT.
        # (titles that mix classical-first + biblical-appended are classical —
        # the partner-facing surface is the first ref the citation points at).
        first_ref = re.split(r"[;,]", title, maxsplit=1)[0].strip()
        m_bib = re.match(r"^(NT|LXX|OT)\.", first_ref)
        if m_bib:
            slug, ch, v, abbrev = lexicon_citation_to_slug(
                first_ref, LSJ_BOOK_ABBREV, ctx.valid_book_slugs
            )
            if slug:
                ctx.note_resolved_cite(source, strong)
                anchor = slug_to_verse_anchor(slug, ch, v)
                return (
                    f'<a class="lsj-citation" data-verse="{anchor}" '
                    f'title="{safe_attr(title)}">{html.escape(label)}</a>'
                )
            else:
                ctx.note_downgraded_cite(source, strong, first_ref, abbrev or "(empty)")
                return (
                    f'<span class="lexicon-unresolved-cite" title="{safe_attr(title)}">'
                    f'{html.escape(label)}</span>'
                )
        # Classical (non-biblical) attestation — preserve as hover-span.
        return (
            f'<span class="lsj-classical-cite" title="{safe_attr(title)}">'
            f'{html.escape(label)}</span>'
        )

    out = CITATION_HOVER_RE.sub(repl_hover, raw_html)

    def repl_abbott(m: re.Match) -> str:
        ref = m.group(1).strip()
        label = m.group(2).strip()
        # Abbott-Smith refs are biblical only; parse + normalize.
        first_ref = ref.split(";")[0].strip()
        slug, ch, v, abbrev = lexicon_citation_to_slug(
            first_ref, LSJ_BOOK_ABBREV, ctx.valid_book_slugs
        )
        if slug:
            ctx.note_resolved_cite(source, strong)
            anchor = slug_to_verse_anchor(slug, ch, v)
            return f'<a class="lsj-citation" data-verse="{anchor}">{html.escape(label)}</a>'
        else:
            ctx.note_downgraded_cite(source, strong, first_ref, abbrev or "(empty)")
            return f'<span class="lexicon-unresolved-cite">{html.escape(label)}</span>'

    out = ABBOTT_REF_RE.sub(repl_abbott, out)

    return f'<div class="lsj-prose">{out}</div>'


def walk_lsj(
    tflsj_entries: dict[str, dict],
    ctx: LoaderContext,
) -> Iterable[dict]:
    """Yield one record per Greek Strong's-number with a TFLSJ row."""
    for strong, entry in sorted(tflsj_entries.items()):
        if not strong.startswith("G"):
            continue  # TFLSJ extra file has some H-numbered xrefs but those go to BDB
        body_transformed = transform_lsj_body(entry["body"], ctx, "lsj", strong)

        # Build a lemma-block + body wrapper
        lemma_block = (
            f'<div class="lsj-lemma-block">'
            f'<span class="lsj-lemma">{html.escape(entry["lemma"])}</span>'
            f'<span class="lsj-translit">{html.escape(entry["translit"])}</span>'
            f'<span class="lsj-morph">{html.escape(entry["morph"])}</span>'
            f'<span class="lsj-gloss">— {html.escape(entry["gloss"])}</span>'
            f"</div>"
        )

        full_body = f'<div class="lsj-body">{lemma_block}{body_transformed}</div>'

        cites = ctx.resolved_cites_per_record[("lsj", strong)] + \
                ctx.downgraded_cites_per_record[("lsj", strong)]

        yield {
            "source": "lsj",
            "strong_number": strong,
            "lemma": entry["lemma"] or strong,
            "transliteration": entry["translit"] or None,
            "pronunciation": None,
            "part_of_speech": entry["morph"] or None,
            "short_definition": entry["gloss"] or None,
            "body_html": full_body,
            "derivation": None,
            "citations_count": cites,
        }


# ──────────────────────────────────────────────────────────────────────────────
# TBESH / TBESG enrichment
# ──────────────────────────────────────────────────────────────────────────────
#
# Tab-delimited Strong's-keyed tables: lemma + transliteration + part-of-speech
# + short gloss. Used to fill missing fields in BDB / LSJ records (depth-lexicon
# values win where present).

def parse_tyndale_enrichment(paths: list[Path]) -> dict[str, dict]:
    """Returns { 'H0001': { 'translit', 'pos', 'gloss' }, ... }"""
    out: dict[str, dict] = {}
    for fp in paths:
        with fp.open(encoding="utf-8") as f:
            for line in f:
                line = line.rstrip("\n")
                if not line.startswith(("G", "H")):
                    continue
                parts = line.split("\t")
                if len(parts) < 4:
                    continue
                strong_raw = parts[0].strip()
                m = re.match(r"^([HG])(\d+)([a-z]?)$", strong_raw)
                if not m:
                    continue
                letter, num, suffix = m.group(1), m.group(2), m.group(3)
                padded = f"{letter}{int(num):04d}"
                key = padded if suffix in ("", "a") else f"{padded}{suffix}"
                if key in out:
                    continue
                # Tyndale TBESH/TBESG columns vary by file; the consistent
                # subset across both is: [Strong] [Lemma?] [Translit?] [Morph?]
                # [Gloss] ... Build defensively.
                row: dict[str, Optional[str]] = {"translit": None, "pos": None, "gloss": None}
                if len(parts) > 2:
                    row["translit"] = parts[2].strip() or None
                if len(parts) > 3:
                    row["pos"] = parts[3].strip() or None
                if len(parts) > 4:
                    row["gloss"] = parts[4].strip() or None
                out[key] = row
    return out


def enrich_record(record: dict, tbesh: dict[str, dict], tbesg: dict[str, dict]) -> dict:
    """Fill missing transliteration / part_of_speech / short_definition from
    Tyndale tables. Existing depth-lexicon values win."""
    strong = record["strong_number"]
    enrichment = tbesh.get(strong) if strong.startswith("H") else tbesg.get(strong)
    if not enrichment:
        return record
    if not record.get("transliteration") and enrichment.get("translit"):
        record["transliteration"] = enrichment["translit"]
    if not record.get("part_of_speech") and enrichment.get("pos"):
        record["part_of_speech"] = enrichment["pos"]
    if not record.get("short_definition") and enrichment.get("gloss"):
        record["short_definition"] = enrichment["gloss"]
    return record


# ──────────────────────────────────────────────────────────────────────────────
# SQL emission
# ──────────────────────────────────────────────────────────────────────────────

SQL_HEADER = """\
-- session-163 — lexicon_entries bulk load (Phase 9.3 full-corpus loader output).
-- Spec: DESIGN_LANGUAGE.md §26. Parse plan: _scratch/S158_LEXICON_PARSE_PLAN.md.
-- Loader: restoration-pipeline/_session163_load_lexicon_entries.py.
-- Sources: OpenScriptures BDB (SHA 21c9add1...) + STEPBible TFLSJ (SHA 0753f250...)
--          + STEPBible TBESH/TBESG for transliteration/POS/gloss enrichment.
-- Re-runnable: every INSERT uses ON CONFLICT (source, strong_number) DO UPDATE.
-- Apply after session162_lexicon_tables.sql (the schema must exist first).

BEGIN;

"""

SQL_FOOTER = """\

UPDATE schema_version
   SET version   = '1.0.0-phase9.3-session163',
       landed_at = NOW(),
       notes     = 'Session 163 (Phase 9.3) — lexicon_entries bulk-loaded. '
                || 'BDB Hebrew/Aramaic + LSJ Greek (Tyndale-edited 1940 + Abbott-Smith 1922 NT fallback). '
                || 'Re-runnable via ON CONFLICT DO UPDATE on (source, strong_number) unique constraint. '
                || 'Unresolved citations gracefully downgraded to <span class="lexicon-unresolved-cite"> '
                || 'per S163 loader Q1 graceful-default decision. Prior version: 1.0.0-phase9.3-session162.'
 WHERE id = 1;

COMMIT;
"""

INSERT_COLUMNS = (
    "source, strong_number, lemma, transliteration, pronunciation, "
    "part_of_speech, short_definition, body_html, derivation, citations_count"
)


def format_row(rec: dict) -> str:
    """Build a Postgres VALUES tuple for one record."""
    return (
        f"({sql_escape(rec['source'])}, "
        f"{sql_escape(rec['strong_number'])}, "
        f"{sql_escape(rec['lemma'])}, "
        f"{sql_escape(rec.get('transliteration'))}, "
        f"{sql_escape(rec.get('pronunciation'))}, "
        f"{sql_escape(rec.get('part_of_speech'))}, "
        f"{sql_escape(rec.get('short_definition'))}, "
        f"{sql_escape(rec['body_html'])}, "
        f"{sql_escape(rec.get('derivation'))}, "
        f"{rec.get('citations_count', 0)})"
    )


CONFLICT_CLAUSE = (
    "ON CONFLICT (source, strong_number) DO UPDATE SET "
    "lemma = EXCLUDED.lemma, "
    "transliteration = EXCLUDED.transliteration, "
    "pronunciation = EXCLUDED.pronunciation, "
    "part_of_speech = EXCLUDED.part_of_speech, "
    "short_definition = EXCLUDED.short_definition, "
    "body_html = EXCLUDED.body_html, "
    "derivation = EXCLUDED.derivation, "
    "citations_count = EXCLUDED.citations_count"
)


def emit_migration_sql(records: list[dict], out_path: Path) -> int:
    """Write the bulk-INSERT migration. Returns number of INSERT statements emitted."""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    insert_count = 0

    # Group records into per-source blocks so the migration reads cleanly:
    # all BDB rows, then all LSJ rows, sorted by Strong's number within each.
    bdb_records = sorted(
        (r for r in records if r["source"] == "bdb"),
        key=lambda r: r["strong_number"],
    )
    lsj_records = sorted(
        (r for r in records if r["source"] == "lsj"),
        key=lambda r: r["strong_number"],
    )

    with out_path.open("w", encoding="utf-8") as f:
        f.write(SQL_HEADER)

        for source_label, recs in [("BDB Hebrew / Aramaic", bdb_records), ("LSJ Greek", lsj_records)]:
            if not recs:
                continue
            f.write(f"-- ─── {source_label}: {len(recs):,} rows ───\n\n")
            for i in range(0, len(recs), BATCH_SIZE):
                batch = recs[i : i + BATCH_SIZE]
                values_lines = ",\n  ".join(format_row(r) for r in batch)
                f.write(f"INSERT INTO lexicon_entries ({INSERT_COLUMNS}) VALUES\n  ")
                f.write(values_lines)
                f.write(f"\n{CONFLICT_CLAUSE};\n\n")
                insert_count += 1
            f.write("\n")

        f.write(SQL_FOOTER)

    return insert_count


# ──────────────────────────────────────────────────────────────────────────────
# Coverage report
# ──────────────────────────────────────────────────────────────────────────────

def emit_coverage_report(
    records: list[dict],
    ctx: LoaderContext,
    insert_count: int,
    out_path: Path,
) -> None:
    """Markdown coverage report for Yoshi review before apply."""
    out_path.parent.mkdir(parents=True, exist_ok=True)

    bdb_recs = [r for r in records if r["source"] == "bdb"]
    lsj_recs = [r for r in records if r["source"] == "lsj"]

    total_resolved = sum(ctx.resolved_cites_per_record.values())
    total_downgraded = sum(ctx.downgraded_cites_per_record.values())
    total_cites = total_resolved + total_downgraded
    pct_resolved = (100.0 * total_resolved / total_cites) if total_cites else 0.0

    avg_bdb_body = (sum(len(r["body_html"]) for r in bdb_recs) // len(bdb_recs)) if bdb_recs else 0
    avg_lsj_body = (sum(len(r["body_html"]) for r in lsj_recs) // len(lsj_recs)) if lsj_recs else 0
    max_bdb = max((len(r["body_html"]) for r in bdb_recs), default=0)
    max_lsj = max((len(r["body_html"]) for r in lsj_recs), default=0)

    # Find the outlier entries for the report
    bdb_outliers = sorted(bdb_recs, key=lambda r: -len(r["body_html"]))[:5]
    lsj_outliers = sorted(lsj_recs, key=lambda r: -len(r["body_html"]))[:5]

    lines: list[str] = []
    lines.append("# S163 — Phase 9.3 Lexicon Load Report\n")
    lines.append("Generated by `restoration-pipeline/_session163_load_lexicon_entries.py`.")
    lines.append("Pairs with the migration file at `data-schema/migrations/session163_lexicon_entries_load.sql`.\n")
    lines.append("---\n")
    lines.append("## Coverage gate\n")
    lines.append(f"| Source | Records emitted | Avg body size | Max body size |")
    lines.append(f"|---|---:|---:|---:|")
    lines.append(f"| BDB (Hebrew/Aramaic) | {len(bdb_recs):,} | {avg_bdb_body:,} chars | {max_bdb:,} chars |")
    lines.append(f"| LSJ Greek (+ Abbott-Smith NT) | {len(lsj_recs):,} | {avg_lsj_body:,} chars | {max_lsj:,} chars |")
    lines.append(f"| **Total** | **{len(records):,}** | — | — |\n")
    lines.append(f"INSERT statements emitted (batched at {BATCH_SIZE} rows): **{insert_count}**\n")

    lines.append("### Expected ranges (per parse plan §V)\n")
    lines.append("- BDB: ~8,600 entries (every Hebrew + Aramaic Strong's with a BDB treatment; ~96% of H-numbers)")
    lines.append("- LSJ + Abbott-Smith: ~5,624 entries (TFLSJ 0-5624 scope)\n")

    lines.append("---\n")
    lines.append("## Link-integrity gate\n")
    lines.append(f"- Citations resolved → `<a data-verse>`: **{total_resolved:,}**")
    lines.append(f"- Citations downgraded → `<span class=\"lexicon-unresolved-cite\">`: **{total_downgraded:,}**")
    lines.append(f"- Resolution rate: **{pct_resolved:.1f}%**\n")

    if ctx.unresolved_cite_samples:
        lines.append("### Top unresolved citation abbreviations\n")
        lines.append("| Abbreviation | Samples (source, strong, raw cite) |")
        lines.append("|---|---|")
        by_count = sorted(
            ((abbrev, samples) for abbrev, samples in ctx.unresolved_cite_samples.items()),
            key=lambda kv: -len(kv[1]),
        )[:20]
        for abbrev, samples in by_count:
            sample_str = "; ".join(f"`{s[1]}` → `{s[2]}`" for s in samples[:3])
            lines.append(f"| `{abbrev}` | {sample_str} |")
        lines.append("")
        lines.append(
            "_Apocrypha abbreviations (Sir, Wis, Tob, Bar, 1Mac–4Mac) are expected to appear here at V1 — "
            "canon.json carries 66 books only. v1.1+ wheel can extend the slug map to apocrypha + restored "
            "texts as those land in the verses table._\n"
        )

    if ctx.unresolved_xref_samples:
        lines.append("### Unresolved cross-lemma BDB targets (BDB internal id without Strong's-number alignment)\n")
        lines.append(f"Total distinct unresolved targets: **{len(ctx.unresolved_xref_samples):,}**\n")
        lines.append("These BDB internal ids don't carry their own Strong's-number alignment in LexicalIndex.xml")
        lines.append("(they're verbal roots or sub-forms BDB cross-refs but Strong's didn't number separately).")
        lines.append("The loader preserves them as `<a data-bdb=\"…\">` so future BDB-id navigation can wire them up.\n")

    lines.append("---\n")
    lines.append("## Outlier entries (largest body_html)\n")
    if bdb_outliers:
        lines.append("**BDB:**")
        for r in bdb_outliers:
            lines.append(f"- `{r['strong_number']}` *{r['lemma']}* — {len(r['body_html']):,} chars")
        lines.append("")
    if lsj_outliers:
        lines.append("**LSJ:**")
        for r in lsj_outliers:
            lines.append(f"- `{r['strong_number']}` *{r['lemma']}* — {len(r['body_html']):,} chars")
        lines.append("")

    lines.append("Per S163 Q2 decision: outlier bodies stored full (no truncation, no storage-time")
    lines.append("paginate). The Companion-tier API gate keeps these off the free surface. PWA-side")
    lines.append("collapse-toggle is a v1.1 refinement if reads feel heavy on Yoshi's walk.\n")

    lines.append("---\n")
    lines.append("## Apply order\n")
    lines.append("1. Schema migration must be applied first:")
    lines.append("   ```")
    lines.append("   psql \"$DATABASE_URL\" -f data-schema/migrations/session162_lexicon_tables.sql")
    lines.append("   ```\n")
    lines.append("2. Then this loader's output:")
    lines.append("   ```")
    lines.append("   psql \"$DATABASE_URL\" -f data-schema/migrations/session163_lexicon_entries_load.sql")
    lines.append("   ```\n")
    lines.append("3. Then the callout migration:")
    lines.append("   ```")
    lines.append("   psql \"$DATABASE_URL\" -f data-schema/migrations/session162_lexicon_callouts_v1.sql")
    lines.append("   ```\n")
    lines.append("All three are gated on Yoshi per the S163 one-way doors.\n")

    out_path.write_text("\n".join(lines), encoding="utf-8")


# ──────────────────────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────────────────────

def main() -> int:
    print("S163 lexicon loader starting…", file=sys.stderr)

    # 1. Verify sources on disk
    missing = []
    for p, label in [
        (LEXICAL_INDEX_XML, "LexicalIndex.xml"),
        (BDB_XML, "BrownDriverBriggs.xml"),
        (CANON_JSON, "canon.json"),
    ]:
        if not p.exists():
            missing.append(f"{label} ({p})")
    if not TFLSJ_FILES:
        missing.append(f"TFLSJ files in {STEPBIBLE_DIR}")
    if not TBESH_FILES:
        missing.append(f"TBESH files in {STEPBIBLE_DIR}")
    if not TBESG_FILES:
        missing.append(f"TBESG files in {STEPBIBLE_DIR}")
    if missing:
        print("FATAL — missing source files:", file=sys.stderr)
        for m in missing:
            print(f"  - {m}", file=sys.stderr)
        return 1

    # 2. Load canonical book slugs
    valid_slugs = load_canon_book_slugs()
    print(f"  Canonical book slugs loaded: {len(valid_slugs)}", file=sys.stderr)

    # 3. Parse BDB pipeline
    print("  Parsing LexicalIndex.xml…", file=sys.stderr)
    strong_to_bdb, bdb_to_index, index_id_to_entry, bdb_to_strong = parse_lexical_index(LEXICAL_INDEX_XML)
    print(f"    {len(strong_to_bdb):,} Strong's → BDB-id mappings", file=sys.stderr)
    print(f"    {len(bdb_to_strong):,} BDB-id → Strong's reverse mappings", file=sys.stderr)

    print("  Parsing BrownDriverBriggs.xml…", file=sys.stderr)
    bdb_entries = parse_bdb_xml(BDB_XML)
    print(f"    {len(bdb_entries):,} BDB entries on disk", file=sys.stderr)

    # 4. Parse LSJ pipeline
    print(f"  Parsing TFLSJ ({len(TFLSJ_FILES)} files)…", file=sys.stderr)
    tflsj_entries = parse_tflsj_files(TFLSJ_FILES)
    print(f"    {len(tflsj_entries):,} TFLSJ rows indexed", file=sys.stderr)

    # 5. Build validation context
    ctx = LoaderContext(
        valid_book_slugs=valid_slugs,
        valid_strongs=set(strong_to_bdb.keys()) | set(tflsj_entries.keys()),
    )
    print(f"  Lexicon-internal Strong's validation set: {len(ctx.valid_strongs):,}", file=sys.stderr)

    # 6. Parse TBESH / TBESG enrichment
    print("  Parsing TBESH/TBESG enrichment tables…", file=sys.stderr)
    tbesh = parse_tyndale_enrichment(TBESH_FILES)
    tbesg = parse_tyndale_enrichment(TBESG_FILES)
    print(f"    TBESH: {len(tbesh):,} rows;  TBESG: {len(tbesg):,} rows", file=sys.stderr)

    # 7. Walk BDB
    print("  Walking BDB entries…", file=sys.stderr)
    records: list[dict] = []
    for rec in walk_bdb(
        strong_to_bdb, bdb_entries, bdb_to_index, index_id_to_entry, bdb_to_strong, ctx
    ):
        records.append(enrich_record(rec, tbesh, tbesg))
    bdb_count = len(records)
    print(f"    BDB records: {bdb_count:,}", file=sys.stderr)

    # 8. Walk LSJ
    print("  Walking LSJ entries…", file=sys.stderr)
    for rec in walk_lsj(tflsj_entries, ctx):
        records.append(enrich_record(rec, tbesh, tbesg))
    lsj_count = len(records) - bdb_count
    print(f"    LSJ records: {lsj_count:,}", file=sys.stderr)

    # 8b. FK-target filter (S163 PATCH — added after first apply rolled back
    # on lexicon_entries.strong_number REFERENCES strong_entries FK violation).
    # strong_entries carries G0001-G5624 + H0001-H8674; TFLSJ-extra emits
    # Greek entries G5625-G9996 in Tyndale's extended numbering, which has
    # no FK target. Drop those rows pre-emit so the migration applies cleanly.
    print("  Loading strong_entries FK-target set…", file=sys.stderr)
    valid_fk_strongs = load_strong_entries_set()
    print(f"    strong_entries set: {len(valid_fk_strongs):,} entries", file=sys.stderr)
    pre_filter_count = len(records)
    records = [r for r in records if r["strong_number"] in valid_fk_strongs]
    dropped = pre_filter_count - len(records)
    print(f"    Dropped {dropped:,} records with no FK target "
          f"(extended Tyndale Strong's range beyond strong_entries coverage).",
          file=sys.stderr)
    bdb_count = sum(1 for r in records if r["source"] == "bdb")
    lsj_count = sum(1 for r in records if r["source"] == "lsj")
    print(f"    Post-filter: BDB {bdb_count:,} / LSJ {lsj_count:,} / "
          f"total {len(records):,}", file=sys.stderr)

    # 9. Coverage gate
    total_cites = sum(ctx.resolved_cites_per_record.values()) + sum(ctx.downgraded_cites_per_record.values())
    resolved = sum(ctx.resolved_cites_per_record.values())
    print(f"\n  Coverage:", file=sys.stderr)
    print(f"    Total records: {len(records):,}", file=sys.stderr)
    print(f"    Citations resolved: {resolved:,} of {total_cites:,} ({(100.0*resolved/total_cites) if total_cites else 0:.1f}%)", file=sys.stderr)
    print(f"    Unresolved cite abbreviations (distinct): {len(ctx.unresolved_cite_samples):,}", file=sys.stderr)
    print(f"    Unresolved BDB cross-lemma targets (distinct): {len(ctx.unresolved_xref_samples):,}", file=sys.stderr)

    # 10. Emit migration
    print(f"\n  Emitting migration SQL → {OUTPUT_SQL}", file=sys.stderr)
    insert_count = emit_migration_sql(records, OUTPUT_SQL)
    sql_size = OUTPUT_SQL.stat().st_size
    print(f"    {insert_count} INSERT statements; {sql_size:,} bytes", file=sys.stderr)

    # 11. Emit coverage report
    print(f"  Emitting coverage report → {OUTPUT_REPORT}", file=sys.stderr)
    emit_coverage_report(records, ctx, insert_count, OUTPUT_REPORT)
    report_size = OUTPUT_REPORT.stat().st_size
    print(f"    {report_size:,} bytes", file=sys.stderr)

    print("\nS163 loader complete.", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
