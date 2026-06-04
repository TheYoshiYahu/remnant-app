#!/usr/bin/env python3
"""S193 cross-reference audit: chapter-anchoring + template-bleed static check.
Parses the gospel xref migrations without a live DB."""
import re, sys, glob, os, hashlib
from collections import defaultdict, Counter

MIG = os.path.dirname(os.path.abspath(__file__))

def tokenize_strings(sql):
    """Return list of (start_index, string_literal) respecting '' escapes and E'' prefixes."""
    out = []
    i, n = 0, len(sql)
    while i < n:
        c = sql[i]
        # E'...' or '...'
        if c == "'" :
            # check preceding char for E
            start = i
            i += 1
            buf = []
            while i < n:
                if sql[i] == "'":
                    if i+1 < n and sql[i+1] == "'":
                        buf.append("'"); i += 2; continue
                    else:
                        i += 1; break
                else:
                    buf.append(sql[i]); i += 1
            out.append((start, ''.join(buf)))
        else:
            i += 1
    return out

# --- Thread anchor extraction -------------------------------------------------
# Match: INSERT INTO cross_reference_threads ... SELECT 'slug', ... WHERE sv.book_slug = '..' AND sv.chapter_number = N ... ev.book_slug='..' AND ev.chapter_number = M
THREAD_BLOCK = re.compile(
    r"INSERT\s+INTO\s+cross_reference_threads\b(.*?)ON\s+CONFLICT\s*\(slug\)",
    re.IGNORECASE | re.DOTALL)

def parse_threads(sql):
    threads = []
    for m in THREAD_BLOCK.finditer(sql):
        block = m.group(1)
        # slug = first string literal in block
        slugm = re.search(r"'([a-z0-9][a-z0-9\-]+)'", block)
        slug = slugm.group(1) if slugm else "<?>"
        sb = re.search(r"sv\.book_slug\s*=\s*'([^']+)'", block)
        sc = re.search(r"sv\.chapter_number\s*=\s*(\d+)", block)
        eb = re.search(r"ev\.book_slug\s*=\s*'([^']+)'", block)
        ec = re.search(r"ev\.chapter_number\s*=\s*(\d+)", block)
        srt = re.search(r",\s*(\d+)\s*$", block.strip()) or re.search(r"(\d+)\s*$", block.strip())
        threads.append({
            'slug': slug,
            'src_book': sb.group(1) if sb else None,
            'src_ch': int(sc.group(1)) if sc else None,
            'end_book': eb.group(1) if eb else None,
            'end_ch': int(ec.group(1)) if ec else None,
        })
    return threads

# --- Member note extraction ---------------------------------------------------
def parse_members_matt(sql):
    """Matt extras format: thread_members INSERT with literal member_note + WHERE t.slug=.. sv.chapter_number=N."""
    members = []
    blocks = re.split(r"INSERT\s+INTO\s+cross_reference_thread_members", sql, flags=re.IGNORECASE)
    for b in blocks[1:]:
        b = b.split("ON CONFLICT")[0]
        slugm = re.search(r"t\.slug\s*=\s*'([^']+)'", b)
        scm = re.search(r"sv\.chapter_number\s*=\s*(\d+)", b)
        # member note is the literal after the sort_order int in SELECT t.id, x.id, N, '<note>'
        notem = re.search(r"SELECT\s+t\.id,\s*x\.id,\s*\d+,\s*'(.*?)'\s*\n\s*FROM", b, re.DOTALL)
        if slugm and notem:
            note = notem.group(1).replace("''","'")
            members.append({'slug': slugm.group(1),
                            'src_ch': int(scm.group(1)) if scm else None,
                            'note': note})
    return members

VALUES_HDR = re.compile(r"WITH\s+input\(([^)]*)\)\s+AS\s*\(VALUES", re.IGNORECASE)

def parse_members_mljn(sql):
    """Mark/Luke/John: parse each WITH input(...) AS (VALUES ...) region.
    Two shapes: input(src_slug,...) [NEW thread, slug in following thread: concat]
    or input(thread_slug,...) [bulk, slug = tuple col 0]."""
    members = []
    for hm in VALUES_HDR.finditer(sql):
        cols = hm.group(1)
        is_bulk = cols.strip().lower().startswith('thread_slug')
        region_start = hm.end()
        # region ends at the INSERT INTO cross_references that consumes it
        nxt = sql.find('INSERT INTO cross_references', region_start)
        region = sql[region_start:nxt if nxt!=-1 else len(sql)]
        # slug for NEW-thread block: look in the INSERT concat just after region
        new_slug = None
        if not is_bulk:
            tail = sql[nxt:nxt+400] if nxt!=-1 else ''
            sm = re.search(r"thread:([a-z0-9\-]+)", tail)
            new_slug = sm.group(1) if sm else '<new?>'
        # each VALUES tuple is a single line in these files
        for line in region.splitlines():
            ls = line.strip()
            if not (ls.startswith('(') or ls.startswith("('")):
                continue
            lits = [s for _,s in tokenize_strings(line)]
            if not lits: continue
            note = lits[-1]               # member_note is always the last column
            if len(note) < 40: continue   # skip pure slug/book tuples
            col0 = lits[0]
            slug = col0 if is_bulk else new_slug
            members.append({'slug': slug, 'src_ch': None, 'note': note})
    return members

FILES = {
 'Matthew': sorted(glob.glob(os.path.join(MIG,'session1*matt*extras_cross_references.sql'))),
 'Mark':    [os.path.join(MIG,'session183_mark_xref_members_and_threads.sql')],
 'Luke':    [os.path.join(MIG,'session185_luke_xref_members_and_threads.sql')],
 'John':    [os.path.join(MIG,'session181_john_xref_threads.sql')],
}

all_notes = []           # (gospel, slug, note)
note_global = Counter()
summary = {}

for gospel, files in FILES.items():
    threads, members = [], []
    for f in files:
        sql = open(f, encoding='utf-8', errors='replace').read()
        threads += parse_threads(sql)
        if gospel == 'Matthew':
            members += parse_members_matt(sql)
        else:
            members += parse_members_mljn(sql)
    # anchor span analysis
    single = [t for t in threads if t['src_ch'] is not None and t['src_ch']==t['end_ch'] and t['src_book']==t['end_book']]
    multi  = [t for t in threads if not (t['src_ch'] is not None and t['src_ch']==t['end_ch'] and t['src_book']==t['end_book'])]
    # member note bleed within gospel
    for mem in members:
        norm = re.sub(r'\s+',' ', mem['note']).strip()
        all_notes.append((gospel, mem['slug'], norm))
        note_global[norm]+=1
    summary[gospel] = {'threads':threads,'members':members,'single':single,'multi':multi}

print("="*70)
print("S193 FOUR-GOSPEL CROSS-REFERENCE AUDIT")
print("="*70)
for g in ['Matthew','Mark','Luke','John']:
    s=summary[g]
    print(f"\n## {g}")
    print(f"  threads parsed: {len(s['threads'])}")
    print(f"  single-chapter-anchored: {len(s['single'])}")
    print(f"  multi-chapter-anchored (spanning): {len(s['multi'])}")
    for t in s['multi']:
        print(f"      SPAN: {t['slug']}  [{t['src_book']} {t['src_ch']} -> {t['end_book']} {t['end_ch']}]")
    print(f"  member rows parsed: {len(s['members'])}")

# Global duplicate member-note detection (template-bleed signature)
print("\n"+"="*70)
print("TEMPLATE-BLEED CHECK (exact-duplicate member notes)")
print("="*70)
dupes = {n:c for n,c in note_global.items() if c>1 and len(n)>30}
if not dupes:
    print("  PASS — zero exact-duplicate member-note strings across all gospels.")
else:
    print(f"  {len(dupes)} duplicated note string(s) found:")
    # map note -> (gospel,slug) occurrences
    occ = defaultdict(list)
    for g,slug,n in all_notes:
        if n in dupes: occ[n].append((g,slug))
    for n,c in sorted(dupes.items(), key=lambda x:-x[1]):
        places = occ[n]
        gset = set(g for g,_ in places); sset=set(s for _,s in places)
        flag = "INTRA-THREAD repeat (likely benign)" if len(sset)==1 else "CROSS-THREAD BLEED"
        print(f"\n  [{c}x] {flag}")
        print(f"      threads: {sorted(sset)}")
        print(f"      note: {n[:140]}...")

# Per multi-chapter thread: confirm member notes internally distinct
print("\n"+"="*70)
print("MULTI-CHAPTER THREADS — internal member-note distinctness")
print("="*70)
notes_by_slug = defaultdict(list)
for g,slug,n in all_notes:
    notes_by_slug[slug].append(n)
for g in ['Matthew','Mark','Luke','John']:
    for t in summary[g]['multi']:
        notes = notes_by_slug.get(t['slug'],[])
        d = len(notes)-len(set(notes))
        status = "DISTINCT" if d==0 else f"{d} DUP"
        print(f"  {g:8} {t['slug'][:55]:55} members={len(notes):2} {status}")

# =====================================================================
# FULL-LIBRARY / EDITION-AWARE GUARD  (locked S194)
# A chapter-end-card migration MUST use the edition-aware Matthew schema
# (multi-edition lookup view + src_edition/tgt_edition tuple columns) so
# cross-references reach the full restored library — canon ↔ Apocrypha ↔
# Pseudepigrapha ↔ 1 Enoch ↔ Jubilees ↔ Jasher ↔ Adam-Eve ↔ Apocalypse of
# Abraham ↔ Ascension of Isaiah. The canon-only schema (e.slug='canon',
# no edition columns) used by S181/183/185 is RETIRED and HARD-FAILS here.
# =====================================================================
EXTRAS_EDITIONS = {'enoch','1-enoch','jubilees','jasher','apocrypha',
    'apocrypha-charles-vol1','pseudepigrapha','adam-eve','adam-and-eve',
    'apocalypse-of-abraham','ascension-isaiah','ascension-of-isaiah',
    'extras','2-esdras','sonnini','havoth','shamayim','cepher'}

def classify_migration(sql):
    """Return (status, detail) for a cross-reference migration's library reach."""
    # 1. Edition-aware lookup view? (e.slug IN (...) listing extras editions)
    in_lists = re.findall(r"e\.slug\s+IN\s*\(([^)]*)\)", sql, re.IGNORECASE)
    view_editions = set()
    for lst in in_lists:
        view_editions |= set(re.findall(r"'([a-z0-9\-]+)'", lst))
    canon_only_view = (not view_editions) and bool(
        re.search(r"e\.slug\s*=\s*'canon'", sql, re.IGNORECASE))
    # 2. Edition-aware tuple schema? (input(... tgt_edition ...))
    has_edition_cols = bool(re.search(r"input\([^)]*tgt_edition", sql, re.IGNORECASE))
    # 3. Any actual extras-edition target referenced in tuples or joins?
    tokens = set(re.findall(r"'([a-z0-9\-]+)'", sql))
    extras_hit = sorted(tokens & EXTRAS_EDITIONS)
    view_extras = sorted(view_editions & EXTRAS_EDITIONS)
    full = has_edition_cols and (view_extras or extras_hit)
    if full:
        return ("FULL-LIBRARY", f"view editions={sorted(view_editions) or 'n/a'}; extras targets={extras_hit or 'none-yet'}")
    if canon_only_view or not has_edition_cols:
        why = []
        if canon_only_view: why.append("lookup view canon-only (e.slug='canon')")
        if not has_edition_cols: why.append("no src_edition/tgt_edition tuple columns")
        return ("CANON-ONLY", "; ".join(why))
    return ("AMBIGUOUS", f"edition cols present but no extras editions referenced; view={sorted(view_editions)}")

# Scan every chapter-end-card migration in the dir.
COVERAGE_GLOBS = ['session1*matt*extras_cross_references.sql',
    'session18*_*xref*threads.sql','session183_mark_xref_members_and_threads.sql',
    'session185_luke_xref_members_and_threads.sql','session194_*xref*threads.sql']
cov_files = []
for gpat in COVERAGE_GLOBS:
    cov_files += glob.glob(os.path.join(MIG, gpat))
cov_files = sorted(set(cov_files))

print("\n"+"="*70)
print("FULL-LIBRARY / EDITION-AWARE GUARD (S194) — canon-only HARD-FAILS")
print("="*70)
fails = []
for f in cov_files:
    sql = open(f, encoding='utf-8', errors='replace').read()
    status, detail = classify_migration(sql)
    mark = "PASS" if status == "FULL-LIBRARY" else "FAIL" if status == "CANON-ONLY" else "WARN"
    if status == "CANON-ONLY": fails.append(os.path.basename(f))
    print(f"  [{mark}] {status:13} {os.path.basename(f)}")
    print(f"         {detail}")
if fails:
    print(f"\n  GUARD RESULT: FAIL — {len(fails)} canon-only migration(s) need an extras-parity pass:")
    for f in fails: print(f"      - {f}")
    print("  These must be back-filled to the edition-aware Matthew schema (see")
    print("  App/XREF_LIBRARY_COVERAGE_ROADMAP.md). New batches that come back CANON-ONLY do not merge.")
else:
    print("\n  GUARD RESULT: PASS — every scanned migration reaches the full restored library.")
