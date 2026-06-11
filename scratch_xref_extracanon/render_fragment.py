#!/usr/bin/env python3
"""Render a minion's structured JSON into a proven-format SQL fragment.

The extra-canonical cross-reference apparatus anchors threads on an EXTRA-CANONICAL
source verse (1 Enoch / Jubilees / Jasher / ...) and weaves members out to the
Tanakh + NT (canon) + parallel extra-canonical passages. Output SQL is the exact
`WITH input(...) AS (VALUES ...) INSERT` shape the gate tooling parses
(verify_fidelity.py / gate_check.py / resolve_check.py).

JSON schema (one file per chapter):
{
  "edition": "enoch", "book": "1-enoch", "chapter": 1,
  "session": "session250", "tag": "en01", "base_band": 50000,
  "threads": [
    {
      "slug": "1-enoch-1-...",            # english-only book fragments
      "title": "...",                       # restored sacred names ok
      "summary_md": "...",                  # come-and-see prose, full-italic quotes
      "anchor_start_v": 1, "anchor_end_v": 9,
      "tier": "extras",
      "members": [
        {"src_ch":1,"src_v":9,
         "tgt_edition":"canon","tgt_book":"jude","tgt_ch":1,"tgt_v":14,
         "tier":"extras","note":"..."}     # note quotes the TARGET verse in full
      ]
    }
  ]
}

Usage: render_fragment.py <chapter.json>  > minion_1enoch_01.sql
"""
import json, sys, os

ALL_EDITIONS = ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
 'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah',
 'sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt')

def e(s):
    """Escape a python str for a PostgreSQL E'...' literal."""
    return s.replace("\\", "\\\\").replace("'", "''")

def main():
    d = json.load(open(sys.argv[1], encoding="utf-8"))
    ed, book, ch = d["edition"], d["book"], d["chapter"]
    session, tag, base = d["session"], d["tag"], int(d["base_band"])
    view = f"_{session[ -3:] if False else session}_{tag}_lookup"
    view = f"_{session}_{tag}_lookup"
    threads = d["threads"]

    out = []
    P = out.append
    P(f"-- ----- fragment: minion_{book.replace('-','')}_{ch:02d}.sql ({session} {book} {ch}) -----")
    P(f"-- Source anchor: {ed}/{book} ch{ch}. Targets span Tanakh + NT (canon) + extra-canonical.")
    P(f"-- Tag: {tag} (view {view}). Sort band base {base}, step 3. Idempotent ON CONFLICT.")
    P("")
    edlist = ",".join(f"'{x}'" for x in ALL_EDITIONS)
    P(f"CREATE TEMP VIEW {view} AS")
    P("SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id")
    P("  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id")
    P("  JOIN editions e ON b.edition_id = e.id")
    P(f" WHERE e.slug IN ({edlist});")
    P("")

    # ---- cross_references (input tuples) ----
    P("WITH input(src_edition, src_slug, src_ch, src_v,")
    P("           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES")
    rows = []
    for t in threads:
        rows.append(f"  -- thread: {t['slug']}")
        for m in t["members"]:
            rows.append(
                f"  ('{ed}', '{book}', {ch}, {m['src_v']}, "
                f"'{m['tgt_edition']}', '{m['tgt_book']}', {m['tgt_ch']}, {m['tgt_v']}, "
                f"'{m['tier']}', E'{e(m['note'])}'),")
    # drop trailing comma on last value row
    for i in range(len(rows)-1, -1, -1):
        if rows[i].endswith("),"):
            rows[i] = rows[i][:-1]
            break
    out.extend(rows)
    P(")")
    P("INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)")
    P("SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier")
    P("  FROM input i")
    P(f"  JOIN {view} sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v")
    P(f"  JOIN {view} tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v")
    P(" WHERE sv.verse_id <> tv.verse_id")
    P("ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;")
    P("")

    # ---- threads ----
    P("-- ----- threads -----")
    for idx, t in enumerate(threads):
        band = base + idx*3
        P("INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)")
        P(f"SELECT '{t['slug']}',")
        P(f"       E'{e(t['title'])}',")
        P(f"       E'{e(t['summary_md'])}',")
        P(f"       sv.verse_id, ev.verse_id, '{t['tier']}', {band}")
        P(f"  FROM {view} sv, {view} ev")
        P(f" WHERE sv.edition_slug='{ed}' AND sv.book_slug='{book}' AND sv.chapter_number={ch} AND sv.verse_number={t['anchor_start_v']}")
        P(f"   AND ev.edition_slug='{ed}' AND ev.book_slug='{book}' AND ev.chapter_number={ch} AND ev.verse_number={t['anchor_end_v']}")
        P("ON CONFLICT (slug) DO NOTHING;")
        P("")

    # ---- thread_members ----
    P("-- ----- thread_members -----")
    for t in threads:
        P(f"-- members: {t['slug']}")
        for so, m in enumerate(t["members"], start=1):
            P("INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)")
            P(f"SELECT t.id, x.id, {so}, E'{e(m['note'])}'")
            P(f"  FROM cross_reference_threads t, cross_references x, {view} sv, {view} tv")
            P(f" WHERE t.slug='{t['slug']}'")
            P(f"   AND sv.edition_slug='{ed}' AND sv.book_slug='{book}' AND sv.chapter_number={ch} AND sv.verse_number={m['src_v']}")
            P(f"   AND tv.edition_slug='{m['tgt_edition']}' AND tv.book_slug='{m['tgt_book']}' AND tv.chapter_number={m['tgt_ch']} AND tv.verse_number={m['tgt_v']}")
            P("   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'")
            P("ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;")
            P("")
    print("\n".join(out))

if __name__ == "__main__":
    main()
