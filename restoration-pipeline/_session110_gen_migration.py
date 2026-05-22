#!/usr/bin/env python3
"""Generate the Session 110 Matthew cross-references migration SQL."""
import json
import re
from pathlib import Path
from collections import defaultdict

PARSED = Path("/tmp/matt_xref_parsed.json")
CANON  = Path("/sessions/clever-gracious-albattani/mnt/Desktop/App/source-texts/parsed/canon.json")
OUT_SQL = Path("/tmp/session110_matthew_cross_references.sql")
OUT_LOG = Path("/tmp/session110_gen_log.txt")

# -------- Book-name resolution --------

# Hebrew-name (or alternate-English) → canonical English book name
HEBREW_TO_ENGLISH = {
    "bereshit": "Genesis",
    "shemot": "Exodus",
    "vayikra": "Leviticus",
    "bemidbar": "Numbers",
    "bamidbar": "Numbers",
    "devarim": "Deuteronomy",
    "yahoshua": "Joshua",
    "yehoshua": "Joshua",
    "shoftim": "Judges",
    "shmuel alef": "1 Samuel",
    "shemuel alef": "1 Samuel",
    "shmuel": "1 Samuel",  # ambiguous, but defaults
    "shemu'el alef": "1 Samuel",
    "shmuel bet": "2 Samuel",
    "shemu'el bet": "2 Samuel",
    "melakhim alef": "1 Kings",
    "melakhim bet": "2 Kings",
    "1 melakhim": "1 Kings",
    "2 melakhim": "2 Kings",
    "divrei ha-yamim alef": "1 Chronicles",
    "devarim ha-yamim alef": "1 Chronicles",
    "divrei ha-yamim bet": "2 Chronicles",
    "devarim ha-yamim bet": "2 Chronicles",
    "ezra": "Ezra",
    "nechemiyah": "Nehemiah",
    "nehemyah": "Nehemiah",
    "esther": "Esther",
    "iyov": "Job",
    "yov": "Job",
    "tehillim": "Psalms",
    "tehilim": "Psalms",
    "psalm": "Psalms",
    "mishlei": "Proverbs",
    "kohelet": "Ecclesiastes",
    "shir hashirim": "Song of Solomon",
    "yeshayahu": "Isaiah",
    "yirmeyahu": "Jeremiah",
    "eikha": "Lamentations",
    "yechezk'el": "Ezekiel",
    "yechezkel": "Ezekiel",
    "daniel": "Daniel",
    "hosheia": "Hosea",
    "hoshea": "Hosea",
    "yoel": "Joel",
    "yo'el": "Joel",
    "amos": "Amos",
    "ovadyah": "Obadiah",
    "yonah": "Jonah",
    "mikhah": "Micah",
    "mikha": "Micah",
    "nachum": "Nahum",
    "habakuk": "Habakkuk",
    "chavakuk": "Habakkuk",
    "tsefanyah": "Zephaniah",
    "chaggai": "Haggai",
    "zekharyah": "Zechariah",
    "zecharyah": "Zechariah",
    "mal'akhi": "Malachi",
    "malakhi": "Malachi",
    "matt": "Matthew",
    "yochanan": "John",
    "1 yochanan": "1 John",
    "2 yochanan": "2 John",
    "3 yochanan": "3 John",
    "ya'aqov": "James",
    "yaaqov": "James",
    "yaakov": "James",
    "kefa": "1 Peter",  # ambiguous
    "1 kefa": "1 Peter",
    "2 kefa": "2 Peter",
    "yahudah": "Jude",
    "hitgalut": "Revelation",
    "1 timotheos": "1 Timothy",
    "2 timotheos": "2 Timothy",
    "1 tsalonik'im": "1 Thessalonians",
    "2 tsalonik'im": "2 Thessalonians",
    "deut": "Deuteronomy",
    "lev": "Leviticus",
}

# Build set of valid book slugs from canon.json
canon = json.load(open(CANON))
CANON_BOOKS = {}
for b in canon["books"]:
    title = b["book_title"]
    slug = b["book_id"]
    CANON_BOOKS[title.lower()] = slug
    CANON_BOOKS[slug] = slug
    # Also map without spaces
    CANON_BOOKS[title.lower().replace(" ", "")] = slug

# Build set of valid verses per (slug, chapter): max verse number
VERSE_INDEX = {}  # (slug, ch) -> set of verse_numbers
for b in canon["books"]:
    slug = b["book_id"]
    for ch in b["chapters"]:
        VERSE_INDEX[(slug, ch["number"])] = {v["number"] for v in ch["verses"]}


def resolve_book(name: str) -> str | None:
    """Return canonical slug from a book-name string, or None if unresolvable."""
    n = name.strip()
    # Strip italic markers and extra punctuation
    n = re.sub(r"[\*'`]", "", n)
    # If it has parentheses, prefer the parenthetical content
    paren = re.search(r"\(([^)]+)\)", n)
    if paren:
        english = paren.group(1).strip()
        # Try parenthetical alone
        if english.lower() in CANON_BOOKS:
            return CANON_BOOKS[english.lower()]
        # Try N-prefix + parenthetical (e.g., "2 Shmuel (Samuel)" -> "2 Samuel")
        num_prefix = re.match(r"^(\d+\s+)", n)
        if num_prefix:
            combined = (num_prefix.group(1) + english).strip().lower()
            if combined in CANON_BOOKS:
                return CANON_BOOKS[combined]
    # Strip parentheses for further lookup
    bare = re.sub(r"\s*\([^)]*\)\s*", "", n).strip().lower()
    if bare in CANON_BOOKS:
        return CANON_BOOKS[bare]
    if bare in HEBREW_TO_ENGLISH:
        english = HEBREW_TO_ENGLISH[bare]
        return CANON_BOOKS.get(english.lower())
    # Try without trailing dot
    bare = bare.rstrip(".")
    if bare in CANON_BOOKS:
        return CANON_BOOKS[bare]
    if bare in HEBREW_TO_ENGLISH:
        return CANON_BOOKS.get(HEBREW_TO_ENGLISH[bare].lower())
    return None


# -------- Reference parsing --------

# Match "BookName Ch:V" or "BookName Ch:V-V" or "BookName Ch" (whole chapter)
RE_REF = re.compile(
    r"""
    ^\s*\*?                                # optional leading *
    (?P<book>[A-Za-z0-9'`\-\s\(\)\.]+?)    # book name (lazy)
    \s+
    (?P<ch1>\d+)                           # first chapter
    (?:\s*:\s*(?P<v1>\d+))?                # optional first verse
    (?:\s*[-–]\s*(?:(?P<ch2>\d+)\s*:\s*)?  # optional range — second chapter (if span)
      (?P<v2>\d+))?
    \s*\*?\s*$
    """,
    re.VERBOSE,
)


def parse_ref(ref: str) -> tuple[str, int, int] | None:
    """Parse 'Matt 1:21' → ('matthew', 1, 21). Returns (slug, ch, first_v) or None.
    For ranges, returns the FIRST verse of the range.
    """
    if not ref:
        return None
    # Pre-clean
    s = ref.strip().rstrip(".").rstrip(",").strip()
    # Remove leading "*" italic
    s = re.sub(r"^\*+\s*|\s*\*+$", "", s)
    m = RE_REF.match(s)
    if not m:
        return None
    book = m.group("book").strip()
    slug = resolve_book(book)
    if not slug:
        return None
    try:
        ch1 = int(m.group("ch1"))
    except (ValueError, TypeError):
        return None
    v1_str = m.group("v1")
    if v1_str is None:
        # whole-chapter ref, default to verse 1
        v1 = 1
    else:
        try:
            v1 = int(v1_str)
        except ValueError:
            return None
    # Validate verse exists in canon.json
    if (slug, ch1) not in VERSE_INDEX:
        return None
    if v1 not in VERSE_INDEX[(slug, ch1)]:
        return None
    return (slug, ch1, v1)


# -------- Helpers --------

def sql_escape(s: str) -> str:
    """Escape a string for SQL single-quoted literal."""
    if s is None:
        return "NULL"
    s = s.replace("'", "''")
    # Remove trailing/leading whitespace
    return f"'{s.strip()}'"


def slug_to_title(slug: str) -> str:
    return " ".join(w.capitalize() for w in slug.split("-"))


# -------- Main --------

data = json.load(open(PARSED))
chapters = data["chapters"]

# Aggregate by globally-unique source/target/note triples for the cross_references table.
# Use a dict so deduping is automatic.
# Key: (source_slug, source_ch, source_v, target_slug, target_ch, target_v)
# Value: (thread_slug or None, note, range_label)
xref_rows = {}
# For threads: thread_slug -> {"anchor": (slug,ch,v), "anchor_end": (slug,ch,v) or None,
#                              "summary": str, "framework_major": bool, "members": [{key, sort, note}]}
threads = {}
# LANDED additions (existing threads): {thread_slug: [(key, note)]}
landed_adds = defaultdict(list)
# Layer 1: list of (source_key, target_key, note)
layer1_rows = []

# Resolution warnings
warnings = []
unresolved_refs = defaultdict(int)


def make_key(ref_str):
    parsed = parse_ref(ref_str)
    if parsed is None:
        return None
    return parsed


SINGLE_CHAPTER_BOOKS = {"obadiah", "philemon", "2-john", "3-john", "jude"}

def parse_ref_multi(ref: str):
    """Parse 'Matt 26:2, 17-30' into [(matt,26,2), (matt,26,17)]. Returns list of keys."""
    if not ref:
        return []
    # Pre-clean
    s = ref.strip().rstrip(".").rstrip(",").strip()
    s = re.sub(r"^\*+\s*|\s*\*+$", "", s)
    # Look for "Book Ch:V1, V2, V3-V4, ..." pattern (book + chapter + comma-separated verses)
    m = re.match(r"^\s*\*?(?P<book>[A-Za-z0-9'`\-\s\(\)\.]+?)\s+(?P<ch>\d+)\s*:\s*(?P<rest>[\d,\-–\s]+)\*?\s*$", s)
    if m and "," in m.group("rest"):
        book = m.group("book").strip()
        slug = resolve_book(book)
        if not slug:
            return []
        ch = int(m.group("ch"))
        if (slug, ch) not in VERSE_INDEX:
            return []
        results = []
        for piece in m.group("rest").split(","):
            piece = piece.strip()
            # piece might be "17-30" or "5"
            v_match = re.match(r"^(\d+)", piece)
            if v_match:
                v = int(v_match.group(1))
                if v in VERSE_INDEX[(slug, ch)]:
                    results.append((slug, ch, v))
        return results
    # Single-chapter book shorthand: "Jude 6" → (jude, 1, 6)
    sc = re.match(r"^\s*\*?(?P<book>[A-Za-z0-9'`\-\s\(\)\.]+?)\s+(?P<v>\d+)(?:\s*[-–]\s*\d+)?\s*\*?\s*$", s)
    if sc:
        slug = resolve_book(sc.group("book").strip())
        if slug and slug in SINGLE_CHAPTER_BOOKS:
            v = int(sc.group("v"))
            if (slug, 1) in VERSE_INDEX and v in VERSE_INDEX[(slug, 1)]:
                return [(slug, 1, v)]
    # Fall back to single-verse parse
    single = parse_ref(s)
    return [single] if single else []


def attempt_range_pair(source_ref, target_ref, note):
    """Parse source + target refs; return list of (source_key, target_key, note) pairs."""
    src_keys = parse_ref_multi(source_ref)
    tgt_keys = parse_ref_multi(target_ref)
    if not src_keys:
        unresolved_refs[source_ref] += 1
    if not tgt_keys:
        unresolved_refs[target_ref] += 1
    if not src_keys or not tgt_keys:
        return []
    # Cross product, but if either side has multiple verses, only pair index-by-index
    # to avoid combinatorial explosion. Use the shorter length.
    if len(src_keys) == 1 and len(tgt_keys) == 1:
        return [(src_keys[0], tgt_keys[0], note)]
    if len(src_keys) == 1:
        return [(src_keys[0], t, note) for t in tgt_keys]
    if len(tgt_keys) == 1:
        return [(s, tgt_keys[0], note) for s in src_keys]
    # Both multi: pair index-by-index
    pairs = []
    for s, t in zip(src_keys, tgt_keys):
        pairs.append((s, t, note))
    return pairs


# Process LANDED additions
for n_str, ch in chapters.items():
    for t in ch["landed_thread_additions"]:
        slug = t["slug"]
        for mbr in t["members"]:
            for src_key, tgt_key, note in attempt_range_pair(mbr["source"], mbr["target"], mbr["note"]):
                if src_key == tgt_key:
                    continue
                key = (src_key, tgt_key)
                xref_rows[key] = ("manual", note)
                landed_adds[slug].append((src_key, tgt_key, note))

# Process PROPOSED threads
for n_str, ch in chapters.items():
    for t in ch["proposed_threads"]:
        slug = t["slug"]
        if t.get("format", "").endswith("-deferred"):
            # No inline members — still create the thread record so it can accept members later
            anchor_parse = parse_ref(t.get("anchor") or "")
            threads[slug] = {
                "anchor": anchor_parse,
                "anchor_end": None,
                "summary": t.get("summary", "")[:4000],
                "framework_major": t.get("framework_major", False),
                "members": [],
            }
            continue
        anchor_parse = parse_ref(t.get("anchor") or "")
        # try to extract anchor end-verse from a range like "Matt 5:17-19"
        anchor_end_parse = None
        anchor_str = (t.get("anchor") or "").strip()
        m_range = re.search(r"(\d+)\s*[-–]\s*(\d+)$", anchor_str)
        if m_range and anchor_parse:
            try:
                # If range is verse-only (e.g., "5:17-19"), the end verse is m_range.group(2)
                end_v = int(m_range.group(2))
                if (anchor_parse[0], anchor_parse[1]) in VERSE_INDEX and end_v in VERSE_INDEX[(anchor_parse[0], anchor_parse[1])]:
                    anchor_end_parse = (anchor_parse[0], anchor_parse[1], end_v)
            except (ValueError, TypeError):
                pass
        if slug not in threads:
            threads[slug] = {
                "anchor": anchor_parse,
                "anchor_end": anchor_end_parse,
                "summary": t.get("summary", "")[:4000],
                "framework_major": t.get("framework_major", False),
                "members": [],
            }
        for mbr in t["members"]:
            src_ref = mbr.get("source")
            tgt_ref = mbr.get("target")
            # If source is empty (Format B with implicit source = anchor), use anchor text
            if not src_ref and anchor_parse:
                src_ref = f"{anchor_parse[0]} {anchor_parse[1]}:{anchor_parse[2]}"
            for src_key, tgt_key, note in attempt_range_pair(src_ref, tgt_ref, mbr.get("note", "")):
                if src_key == tgt_key:
                    continue
                key = (src_key, tgt_key)
                xref_rows[key] = ("manual", note)
                threads[slug]["members"].append({
                    "src_key": src_key, "tgt_key": tgt_key, "note": note,
                    "sort": mbr.get("sort") or 0,
                })

# Process Layer 1
for n_str, ch in chapters.items():
    for source_block in ch["layer1_rows"]:
        src_ref = source_block["source"]
        for tgt in source_block["targets"]:
            for src_key, tgt_key, note in attempt_range_pair(src_ref, tgt["target"], tgt["note"]):
                if src_key == tgt_key:
                    continue
                key = (src_key, tgt_key)
                xref_rows[key] = ("manual", note)
                layer1_rows.append((src_key, tgt_key, note))

# -------- SQL Generation --------

sql = []
sql.append("-- =====================================================================")
sql.append("-- Session 110 — Matthew cross-references migration (Round 1 ship)")
sql.append("-- =====================================================================")
sql.append("-- Auto-generated from commentaries/matthew-N.md §Cross-Reference Apparatus")
sql.append("-- sections by /tmp/gen_migration.py. Materializes the full Matthew sweep:")
sql.append("--")
sql.append(f"--   - {sum(len(v) for v in landed_adds.values())} new member rows added to 3 existing threads")
sql.append("--     (grace-from-name's-sake, post-harvest-sifting, scattered-seed-gathering)")
sql.append(f"--   - {len(threads)} new PROPOSED threads created and seeded with members")
sql.append(f"--   - {len(layer1_rows)} Layer 1 per-verse cross-references")
sql.append(f"--   - {len(xref_rows)} distinct cross_references rows total (after de-dupe)")
sql.append("--")
sql.append("-- All cross_references rows are tier_required='free' per S73; the chapter-")
sql.append("-- end card is a free-tier feature.")
sql.append("--")
sql.append("-- Idempotent: every INSERT uses ON CONFLICT DO NOTHING. Re-running produces")
sql.append("-- zero side effects after the first apply.")
sql.append("--")
sql.append("-- Run via Render Shell:")
sql.append("--   psql \"$DATABASE_URL\" -f /data-schema/migrations/session110_matthew_cross_references.sql")
sql.append("-- Or via api/apply_migration.py if psql isn't available in the container.")
sql.append("-- =====================================================================")
sql.append("")
sql.append("\\echo 'Session 110 — Matthew cross-references migration starting...'")
sql.append("BEGIN;")
sql.append("")
sql.append("-- ---------------------------------------------------------------------")
sql.append("-- Verse-id lookup helper as a temporary view scoped to this txn.")
sql.append("-- canon edition only — every reference in this migration resolves there.")
sql.append("-- ---------------------------------------------------------------------")
sql.append("CREATE TEMP VIEW _s110_verse_lookup AS")
sql.append("SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id")
sql.append("  FROM verses v")
sql.append("  JOIN chapters c ON v.chapter_id = c.id")
sql.append("  JOIN books    b ON c.book_id    = b.id")
sql.append("  JOIN editions e ON b.edition_id = e.id")
sql.append(" WHERE e.slug = 'canon';")
sql.append("")
sql.append("-- ---------------------------------------------------------------------")
sql.append("-- Section 1: cross_references rows.")
sql.append("-- Single INSERT ... SELECT block using a VALUES list so we get one")
sql.append("-- atomic statement rather than 1800 individual INSERTs.")
sql.append("-- ---------------------------------------------------------------------")
sql.append("WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES")
value_lines = []
for (src, tgt), (source_kind, note) in xref_rows.items():
    src_slug, src_ch, src_v = src
    tgt_slug, tgt_ch, tgt_v = tgt
    value_lines.append(
        f"  ({sql_escape(src_slug)}, {src_ch}, {src_v}, "
        f"{sql_escape(tgt_slug)}, {tgt_ch}, {tgt_v}, {sql_escape(note)})"
    )
sql.append(",\n".join(value_lines))
sql.append(")")
sql.append("INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)")
sql.append("SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'")
sql.append("  FROM input i")
sql.append("  JOIN _s110_verse_lookup sv")
sql.append("    ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v")
sql.append("  JOIN _s110_verse_lookup tv")
sql.append("    ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v")
sql.append(" WHERE sv.verse_id <> tv.verse_id")
sql.append("ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;")
sql.append("")
sql.append("-- ---------------------------------------------------------------------")
sql.append("-- Section 2: new threads (cross_reference_threads).")
sql.append("-- Each thread has slug, title, summary_md, anchor_verse_id_start/_end.")
sql.append("-- ---------------------------------------------------------------------")
for slug in sorted(threads.keys()):
    t = threads[slug]
    if not t["anchor"]:
        sql.append(f"-- WARNING: thread {slug!r} has no resolvable anchor — skipping")
        continue
    title = slug_to_title(slug)
    summary_md = t["summary"]
    a_slug, a_ch, a_v = t["anchor"]
    if t["anchor_end"]:
        e_slug, e_ch, e_v = t["anchor_end"]
        sql.append(
            f"INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order) "
            f"SELECT {sql_escape(slug)}, {sql_escape(title)}, {sql_escape(summary_md)}, "
            f"sv.verse_id, ev.verse_id, 'free', 100 "
            f"  FROM _s110_verse_lookup sv, _s110_verse_lookup ev "
            f" WHERE sv.book_slug = {sql_escape(a_slug)} AND sv.chapter_number = {a_ch} AND sv.verse_number = {a_v} "
            f"   AND ev.book_slug = {sql_escape(e_slug)} AND ev.chapter_number = {e_ch} AND ev.verse_number = {e_v} "
            f"ON CONFLICT (slug) DO NOTHING;"
        )
    else:
        sql.append(
            f"INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, tier_required, sort_order) "
            f"SELECT {sql_escape(slug)}, {sql_escape(title)}, {sql_escape(summary_md)}, sv.verse_id, 'free', 100 "
            f"  FROM _s110_verse_lookup sv "
            f" WHERE sv.book_slug = {sql_escape(a_slug)} AND sv.chapter_number = {a_ch} AND sv.verse_number = {a_v} "
            f"ON CONFLICT (slug) DO NOTHING;"
        )
sql.append("")

sql.append("-- ---------------------------------------------------------------------")
sql.append("-- Section 3: thread members for new PROPOSED threads.")
sql.append("-- Links each new thread to its member cross_references rows.")
sql.append("-- ---------------------------------------------------------------------")
for slug in sorted(threads.keys()):
    t = threads[slug]
    if not t["members"]:
        continue
    for m in t["members"]:
        src_slug, src_ch, src_v = m["src_key"]
        tgt_slug, tgt_ch, tgt_v = m["tgt_key"]
        sort_order = m.get("sort") or 0
        sql.append(
            f"INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note) "
            f"SELECT t.id, x.id, {sort_order}, {sql_escape(m['note'])} "
            f"  FROM cross_reference_threads t, cross_references x, "
            f"       _s110_verse_lookup sv, _s110_verse_lookup tv "
            f" WHERE t.slug = {sql_escape(slug)} "
            f"   AND sv.book_slug = {sql_escape(src_slug)} AND sv.chapter_number = {src_ch} AND sv.verse_number = {src_v} "
            f"   AND tv.book_slug = {sql_escape(tgt_slug)} AND tv.chapter_number = {tgt_ch} AND tv.verse_number = {tgt_v} "
            f"   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual' "
            f"ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;"
        )
sql.append("")

sql.append("-- ---------------------------------------------------------------------")
sql.append("-- Section 4: thread members for LANDED-thread additions.")
sql.append("-- Adds new members to threads that already exist on prod (S74 threads).")
sql.append("-- ---------------------------------------------------------------------")
for slug, members in sorted(landed_adds.items()):
    for (src_key, tgt_key, note) in members:
        src_slug, src_ch, src_v = src_key
        tgt_slug, tgt_ch, tgt_v = tgt_key
        sql.append(
            f"INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note) "
            f"SELECT t.id, x.id, COALESCE((SELECT MAX(sort_order)+1 FROM cross_reference_thread_members WHERE thread_id = t.id), 1), {sql_escape(note)} "
            f"  FROM cross_reference_threads t, cross_references x, "
            f"       _s110_verse_lookup sv, _s110_verse_lookup tv "
            f" WHERE t.slug = {sql_escape(slug)} "
            f"   AND sv.book_slug = {sql_escape(src_slug)} AND sv.chapter_number = {src_ch} AND sv.verse_number = {src_v} "
            f"   AND tv.book_slug = {sql_escape(tgt_slug)} AND tv.chapter_number = {tgt_ch} AND tv.verse_number = {tgt_v} "
            f"   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual' "
            f"ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;"
        )
sql.append("")

sql.append("COMMIT;")
sql.append("\\echo 'Session 110 — Matthew cross-references migration complete.'")

OUT_SQL.write_text("\n".join(sql) + "\n", encoding="utf-8")

# Write log
log = []
log.append(f"Migration size: {len(sql)} lines, {OUT_SQL.stat().st_size if OUT_SQL.exists() else 0} bytes\n")
log.append(f"Distinct cross_references rows: {len(xref_rows)}\n")
log.append(f"Distinct new threads: {len(threads)}\n")
log.append(f"LANDED-thread additions: {sum(len(v) for v in landed_adds.values())} member rows across {len(landed_adds)} threads\n")
log.append(f"Layer 1 rows: {len(layer1_rows)}\n")
log.append(f"\nUnresolved references ({len(unresolved_refs)} distinct, totalling {sum(unresolved_refs.values())} occurrences):\n")
for ref, count in sorted(unresolved_refs.items(), key=lambda x: -x[1])[:50]:
    log.append(f"  ({count}x)  {ref!r}\n")
OUT_LOG.write_text("".join(log), encoding="utf-8")

print(f"Wrote {OUT_SQL} ({OUT_SQL.stat().st_size:,} bytes, {len(sql)} lines)")
print(f"Wrote {OUT_LOG}")
print()
print("=== Summary ===")
print(f"Distinct cross_references rows: {len(xref_rows)}")
print(f"Distinct new threads: {len(threads)}")
print(f"LANDED-thread additions: {sum(len(v) for v in landed_adds.values())} member rows")
print(f"Layer 1 rows: {len(layer1_rows)}")
print()
print(f"Unresolved references: {len(unresolved_refs)} distinct, {sum(unresolved_refs.values())} occurrences")
print("Top 15 unresolved:")
for ref, count in sorted(unresolved_refs.items(), key=lambda x: -x[1])[:15]:
    print(f"  ({count}x)  {ref!r}")
