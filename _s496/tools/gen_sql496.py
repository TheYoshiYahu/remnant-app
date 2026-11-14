"""S496 — gen_sql496.py <batch>  →  sql/session496_<book>_<batch>_rebuild.sql
ONE idempotent migration for the batch from fix/<book>_<batch>.json — the UPDATE path: each card's note rewritten IN PLACE (id kept,
verse pair untouched), new threads inserted, unanchored threads anchored, every card added to its thread. Guards run before anything is
written and RAISE (nothing lands) if: a card id is missing or no longer sits on the verse pair this was written for; the live text of
its source verse differs from the read-back; its live note is neither the note this was written against nor the new note (someone
edited it since the dump); a card has meanwhile been put in a thread this migration does not know; a thread to join is missing; a thread
to anchor already carries a different anchor; an anchor verse is missing. Member sort_order continues after each thread's live maximum,
in source verse order. A re-run reports 0 everywhere. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *

def q(s, tag='n'):
    assert f'${tag}$' not in s and '$s496$' not in s, 'dollar-quote tag collides with the text'
    assert not re.search(r"\n\s*\\", s), 'a line of the text starts with a backslash — apply_migration.py would strip it as a psql directive'
    return f'${tag}$' + s + f'${tag}$'
def lit(s):
    assert "'" not in s, s
    return "'" + s + "'"

def main(batch):
    book, chapters = BATCHES[batch]; stem = f'{book}_{batch}'; tag = tag_of6(batch); BK = TITLES[book]
    fx = json.load(open(W6 / 'fix' / f'{stem}.json'))
    fname = f'session496_{stem}_rebuild.sql'
    crow = [f"({c['id']},{c['src_ch']},{c['src_vn']},{q(c['src_text'])},{lit(c['tgt_book'])},{c['tgt_ch']},{c['tgt_vn']},{q(c['old_note'] or '')},{q(c['note'])})" for c in fx['cards']]
    trow = [f"({lit(t['slug'])},{q(t['title'])},{q(t['summary_md'])},{t['ch']},{t['anchor_start_vn']},{t['anchor_end_vn']},{lit(t['tier'])},{t['sort_order']})" for t in fx['threads']]
    arow = [f"({lit(a['slug'])},{lit(a['book'])},{a['ch']},{a['a_vn']},{a['z_vn']})" for a in fx['anchors']]
    mrow = [f"({lit(m['thread_slug'])},{m['id']},{m['src_vn'] + 1000 * m['src_ch']},{q(m['member_note'])})" for m in fx['members']]
    def ins(table, rows): return (f"INSERT INTO {table} VALUES\n" + ',\n'.join(rows) + ';\n') if rows else f"-- (no rows for {table})\n"
    chs = f"{min(fx['chapters'])}–{max(fx['chapters'])}"
    sql = f"""-- =====================================================================
-- Session 496 migration — canon / {BK} {chs} — Phase 2 REBUILD, batch {batch}: the orphan cards rewritten Come-and-See and threaded.
-- {len(fx['cards'])} cards rewritten in place (ids and verse pairs kept), {len(fx['threads'])} new thread(s), {len(fx['anchors'])} unanchored thread(s) anchored, {len(fx['members'])} thread members added.
-- Drafted on: {', '.join(fx['models'])}; read and corrected on Claude Fable 5.1; every note composed by script (assemble496.py): target verse whole
-- from parsed/canon.json (restored-names KJV, the canon convention), {BK} verse whole from the live text of the read-back, then the prose.
-- Safety (DO block, before any write): RAISES if a card id is gone or sits on another verse pair, if a {BK} verse's live text differs from the
-- read-back, if a card's live note is neither the note this was written against nor the new one, if a card is already in a thread this file does
-- not put it in, if a thread to join / an anchor verse is missing, or if a thread to anchor already has a different anchor.
-- Idempotent: a re-run reports 0 rewritten / 0 inserted / 0 anchored.  Nothing is deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/{fname}
-- =====================================================================
\\echo 'session496 — {BK} {chs} rebuild starting...'
BEGIN;
CREATE TEMP TABLE _{tag}_c (id BIGINT, src_ch INT, src_v INT, src_text TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, old_note TEXT, new_note TEXT) ON COMMIT DROP;
{ins('_' + tag + '_c', crow)}CREATE TEMP TABLE _{tag}_t (slug TEXT, title TEXT, summary_md TEXT, ch INT, a_vn INT, z_vn INT, tier TEXT, sort_order INT) ON COMMIT DROP;
{ins('_' + tag + '_t', trow)}CREATE TEMP TABLE _{tag}_a (slug TEXT, book TEXT, ch INT, a_vn INT, z_vn INT) ON COMMIT DROP;
{ins('_' + tag + '_a', arow)}CREATE TEMP TABLE _{tag}_m (thread_slug TEXT, card_id BIGINT, ord INT, member_note TEXT) ON COMMIT DROP;
{ins('_' + tag + '_m', mrow)}
CREATE OR REPLACE TEMP VIEW _{tag}_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id, v.text
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

DO $s496$
DECLARE r RECORD; sid BIGINT; tid BIGINT; ltext TEXT; cur RECORD; n INT; av BIGINT; zv BIGINT;
        n_note INT := 0; n_note_same INT := 0; n_thr INT := 0; n_thr_same INT := 0; n_anc INT := 0; n_anc_same INT := 0; n_mem INT := 0; n_mem_same INT := 0; n_total INT;
BEGIN
  -- ---- guards: every row is checked before anything is written ----
  FOR r IN SELECT * FROM _{tag}_c LOOP
    SELECT verse_id, text INTO sid, ltext FROM _{tag}_lookup WHERE book_slug = '{book}' AND chapter_number = r.src_ch AND verse_number = r.src_v;
    IF sid IS NULL THEN RAISE EXCEPTION 'S496: source verse {book} %:% missing', r.src_ch, r.src_v; END IF;
    IF ltext <> r.src_text THEN RAISE EXCEPTION 'S496: live text of {book} %:% differs from the read-back this migration was written against — re-run the dump and rebuild', r.src_ch, r.src_v; END IF;
    SELECT verse_id INTO tid FROM _{tag}_lookup WHERE book_slug = r.tgt_slug AND chapter_number = r.tgt_ch AND verse_number = r.tgt_v;
    IF tid IS NULL THEN RAISE EXCEPTION 'S496: target verse % %:% missing', r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    SELECT * INTO cur FROM cross_references WHERE id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S496: card % is gone', r.id; END IF;
    IF cur.source_verse_id <> sid OR cur.target_verse_id <> tid THEN RAISE EXCEPTION 'S496: card % no longer sits on {book} %:% -> % %:%', r.id, r.src_ch, r.src_v, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    IF cur.note IS DISTINCT FROM r.old_note AND cur.note IS DISTINCT FROM r.new_note THEN RAISE EXCEPTION 'S496: the live note of card % differs from the read-back this migration was written against — re-run the dump and rebuild', r.id; END IF;
    IF EXISTS (SELECT 1 FROM cross_reference_thread_members mm JOIN cross_reference_threads th ON th.id = mm.thread_id
                WHERE mm.cross_reference_id = r.id AND NOT EXISTS (SELECT 1 FROM _{tag}_m m WHERE m.card_id = r.id AND m.thread_slug = th.slug)) THEN
      RAISE EXCEPTION 'S496: card % already sits in a thread this migration does not put it in — re-run the dump and rebuild', r.id; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _{tag}_t LOOP
    IF NOT EXISTS (SELECT 1 FROM _{tag}_lookup WHERE book_slug = '{book}' AND chapter_number = r.ch AND verse_number = r.a_vn)
    OR NOT EXISTS (SELECT 1 FROM _{tag}_lookup WHERE book_slug = '{book}' AND chapter_number = r.ch AND verse_number = r.z_vn) THEN
      RAISE EXCEPTION 'S496: anchor %:%-% for new thread % missing', r.ch, r.a_vn, r.z_vn, r.slug; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _{tag}_a LOOP
    SELECT verse_id INTO av FROM _{tag}_lookup WHERE book_slug = r.book AND chapter_number = r.ch AND verse_number = r.a_vn;
    SELECT verse_id INTO zv FROM _{tag}_lookup WHERE book_slug = r.book AND chapter_number = r.ch AND verse_number = r.z_vn;
    IF av IS NULL OR zv IS NULL THEN RAISE EXCEPTION 'S496: anchor verse % %:%-% for thread % missing', r.book, r.ch, r.a_vn, r.z_vn, r.slug; END IF;
    SELECT * INTO cur FROM cross_reference_threads WHERE slug = r.slug;
    IF NOT FOUND THEN RAISE EXCEPTION 'S496: thread to anchor % does not exist', r.slug; END IF;
    IF cur.anchor_verse_id_start IS NOT NULL AND (cur.anchor_verse_id_start <> av OR cur.anchor_verse_id_end IS DISTINCT FROM zv) THEN
      RAISE EXCEPTION 'S496: thread % already carries a different anchor — re-run the dump and rebuild', r.slug; END IF;
  END LOOP;
  FOR r IN SELECT DISTINCT thread_slug FROM _{tag}_m LOOP
    IF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE slug = r.thread_slug) AND NOT EXISTS (SELECT 1 FROM _{tag}_t WHERE slug = r.thread_slug) THEN
      RAISE EXCEPTION 'S496: thread to join % does not exist', r.thread_slug; END IF;
  END LOOP;

  -- ---- notes rewritten in place ----
  SELECT count(*) INTO n_total FROM _{tag}_c;
  UPDATE cross_references x SET note = c.new_note FROM _{tag}_c c WHERE x.id = c.id AND x.note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_note = ROW_COUNT; n_note_same := n_total - n_note;

  -- ---- new threads ----
  SELECT count(*) INTO n_total FROM _{tag}_t;
  INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
  SELECT t.slug, t.title, t.summary_md, sv.verse_id, ev.verse_id, t.tier::content_tier, t.sort_order
    FROM _{tag}_t t
    JOIN _{tag}_lookup sv ON sv.book_slug='{book}' AND sv.chapter_number=t.ch AND sv.verse_number=t.a_vn
    JOIN _{tag}_lookup ev ON ev.book_slug='{book}' AND ev.chapter_number=t.ch AND ev.verse_number=t.z_vn
  ON CONFLICT (slug) DO NOTHING;
  GET DIAGNOSTICS n_thr = ROW_COUNT; n_thr_same := n_total - n_thr;

  -- ---- anchors for the unanchored threads these cards join ----
  SELECT count(*) INTO n_total FROM _{tag}_a;
  UPDATE cross_reference_threads th SET anchor_verse_id_start = sv.verse_id, anchor_verse_id_end = ev.verse_id
    FROM _{tag}_a a
    JOIN _{tag}_lookup sv ON sv.book_slug=a.book AND sv.chapter_number=a.ch AND sv.verse_number=a.a_vn
    JOIN _{tag}_lookup ev ON ev.book_slug=a.book AND ev.chapter_number=a.ch AND ev.verse_number=a.z_vn
   WHERE th.slug = a.slug AND th.anchor_verse_id_start IS NULL;
  GET DIAGNOSTICS n_anc = ROW_COUNT; n_anc_same := n_total - n_anc;

  -- ---- members: each card into its thread, after the thread's live maximum, in source verse order ----
  SELECT count(*) INTO n_total FROM _{tag}_m;
  INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
  SELECT th.id, m.card_id,
         COALESCE((SELECT max(mm.sort_order) FROM cross_reference_thread_members mm WHERE mm.thread_id = th.id), 0)
           + row_number() OVER (PARTITION BY th.id ORDER BY m.ord, m.card_id),
         m.member_note
    FROM _{tag}_m m JOIN cross_reference_threads th ON th.slug = m.thread_slug
   WHERE NOT EXISTS (SELECT 1 FROM cross_reference_thread_members mm WHERE mm.thread_id = th.id AND mm.cross_reference_id = m.card_id)
  ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
  GET DIAGNOSTICS n_mem = ROW_COUNT; n_mem_same := n_total - n_mem;

  -- ---- proof before commit: every card carries its new note and sits in its thread ----
  SELECT count(*) INTO n FROM _{tag}_c c JOIN cross_references x ON x.id = c.id WHERE x.note IS DISTINCT FROM c.new_note;
  IF n > 0 THEN RAISE EXCEPTION 'S496: % card(s) do not carry the new note', n; END IF;
  SELECT count(*) INTO n FROM _{tag}_m m WHERE NOT EXISTS (
    SELECT 1 FROM cross_reference_thread_members mm JOIN cross_reference_threads th ON th.id = mm.thread_id AND th.slug = m.thread_slug WHERE mm.cross_reference_id = m.card_id);
  IF n > 0 THEN RAISE EXCEPTION 'S496: % member row(s) did not land', n; END IF;
  SELECT count(*) INTO n FROM _{tag}_a a JOIN cross_reference_threads th ON th.slug = a.slug WHERE th.anchor_verse_id_start IS NULL;
  IF n > 0 THEN RAISE EXCEPTION 'S496: % thread(s) still unanchored', n; END IF;

  RAISE NOTICE 'S496 ({book} {batch}) summary: notes rewritten % / already there %; threads inserted % / already there %; anchors set % / already there %; members inserted % / already there %',
    n_note, n_note_same, n_thr, n_thr_same, n_anc, n_anc_same, n_mem, n_mem_same;
END $s496$;
COMMIT;
\\echo 'session496 — {BK} {chs} rebuild done.'
"""
    SQL = W6 / 'sql'; SQL.mkdir(exist_ok=True); (SQL / fname).write_text(sql)
    print(f"{stem}: cards {len(crow)} | new threads {len(trow)} | anchors {len(arow)} | members {len(mrow)} | bytes {len(sql)} -> {SQL / fname}")

if __name__ == '__main__':
    if len(sys.argv) < 2: sys.exit(__doc__)
    main(sys.argv[1])
