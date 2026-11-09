"""S495 — gen_sql495.py <book>  →  sql/session495_<book>_gap_fill.sql
One idempotent migration per book from fix/<book>.json: input rows in temp tables ($n$ dollar-quoted), an edition-aware lookup view
over EVERY edition (session417 shape), a DO block that (1) RAISES if any source verse's live text differs from the read-back, if any
target verse is missing, or if a note for a non-canon target does not carry the live target text verbatim (canon quotations follow
parsed/canon.json by convention), then (2) INSERTs cards / threads / members with
ON CONFLICT DO NOTHING and counts inserted vs already present, and (3) RAISE NOTICEs the summary. A re-run reports 0 inserted everywhere.
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, re
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common495 import *

def q(s):
    assert '$n$' not in s and '$s495$' not in s, 'dollar-quote tag collides with the text'
    assert not re.search(r"\n\s*\\", s), 'a line of the text starts with a backslash — apply_migration.py would strip it as a psql directive'
    return '$n$' + s + '$n$'
def lit(s):
    assert "'" not in s, s
    return "'" + s + "'"

def main(book):
    fx = load_book_fix(book); ed = fx['edition']; stem = stem_of(book); tag = tag_of(book)
    eds = list(ALL_EDITIONS)
    for f in (W / 'live').glob('*__*.json'):
        d = json.load(open(f))
        for e in {x['slug'] for x in d['editions']} | {c['s_ed'] for c in d['cards']} | {c['t_ed'] for c in d['cards']}:
            if e not in eds: eds.append(e)
    fname = f'session495_{stem}_gap_fill.sql'
    crow = [f"({lit(ed)},{lit(book)},{c['src_ch']},{c['src_vn']},{q(c['src_text'])},{lit(c['tgt_edition'])},{lit(c['tgt_book'])},{c['tgt_ch']},{c['tgt_vn']},{q(c['tgt_text'])},{lit(c['tier'])},{q(c['note'])})" for c in fx['cards']]
    trow = [f"({lit(t['slug'])},{q(t['title'])},{q(t['summary_md'])},{t['ch']},{t['anchor_start_vn']},{t['anchor_end_vn']},{lit(t['tier'])},{t['sort_order']})" for t in fx['threads']]
    mrow = [f"({lit(m['thread_slug'])},{m['src_ch']},{m['src_vn']},{lit(m['tgt_edition'])},{lit(m['tgt_book'])},{m['tgt_ch']},{m['tgt_vn']},{m['sort_order']},{q(m['member_note'])})" for m in fx['members']]
    joined = sorted({j['join_slug'] for j in fx['joins']})
    jrow = [f"({lit(s)})" for s in joined]
    chs = ', '.join(str(c) for c in fx['gap_chapters'])
    def ins(table, rows): return (f"INSERT INTO {table} VALUES\n" + ',\n'.join(rows) + ';\n') if rows else f"-- (no rows for {table})\n"
    sql = f"""-- =====================================================================
-- Session 495 migration — 2026-11-08 — edition `{ed}` / book `{book}` — Phase 2 gap fill (chapters with no card: {chs})
-- {len(fx['cards'])} new cross-reference cards (tier '{fx.get('card_tier', 'extras')}'), {len(fx['threads'])} new threads, {len(joined)} existing thread(s) joined, {len(fx['members'])} thread members.
-- Drafted on: {fx.get('model', '?')}; voice read on Claude Fable 5.1; every quotation checked verbatim by script (assemble495.py) before this was written.
-- Safety (DO block): RAISES if the live text of any source verse differs from the read-back this was written against, if any target
-- verse is missing, or if a note for a NON-canon target does not carry the live target verse verbatim. Full-library lookup view (every edition slug).
-- Convention: canon quotations in notes follow the restored-names KJV wording of parsed/canon.json, not the live (modernised) display text.
-- Idempotent: INSERT ... ON CONFLICT DO NOTHING throughout; a re-run reports 0 inserted everywhere.
-- Run: python3 api/apply_migration.py data-schema/migrations/{fname}
-- =====================================================================
\\echo 'session495 — {book} gap fill starting...'
BEGIN;
CREATE TEMP TABLE _{tag}_c (src_edition TEXT, src_slug TEXT, src_ch INT, src_v INT, src_text TEXT, tgt_edition TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, tgt_text TEXT, tier TEXT, note TEXT) ON COMMIT DROP;
{ins('_' + tag + '_c', crow)}CREATE TEMP TABLE _{tag}_t (slug TEXT, title TEXT, summary_md TEXT, ch INT, a_vn INT, z_vn INT, tier TEXT, sort_order INT) ON COMMIT DROP;
{ins('_' + tag + '_t', trow)}CREATE TEMP TABLE _{tag}_m (thread_slug TEXT, src_ch INT, src_v INT, tgt_edition TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, sort_order INT, member_note TEXT) ON COMMIT DROP;
{ins('_' + tag + '_m', mrow)}CREATE TEMP TABLE _{tag}_j (slug TEXT) ON COMMIT DROP;
{ins('_' + tag + '_j', jrow)}
CREATE OR REPLACE TEMP VIEW _{tag}_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id, v.text
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ({', '.join(lit(e) for e in eds)});

DO $s495$
DECLARE r RECORD; sid BIGINT; tid BIGINT; ltext TEXT; n INT;
        n_cards INT := 0; n_cards_same INT := 0; n_thr INT := 0; n_thr_same INT := 0; n_mem INT := 0; n_mem_same INT := 0; n_total INT;
BEGIN
  -- ---- guards: every row is checked before anything is written ----
  FOR r IN SELECT * FROM _{tag}_c LOOP
    SELECT verse_id, text INTO sid, ltext FROM _{tag}_lookup WHERE edition_slug = r.src_edition AND book_slug = r.src_slug AND chapter_number = r.src_ch AND verse_number = r.src_v;
    IF sid IS NULL THEN RAISE EXCEPTION 'S495: source verse %/% %:% missing', r.src_edition, r.src_slug, r.src_ch, r.src_v; END IF;
    IF ltext <> r.src_text THEN RAISE EXCEPTION 'S495: live text of %/% %:% differs from the read-back this migration was written against — re-run the dump and rebuild', r.src_edition, r.src_slug, r.src_ch, r.src_v; END IF;
    SELECT verse_id, text INTO tid, ltext FROM _{tag}_lookup WHERE edition_slug = r.tgt_edition AND book_slug = r.tgt_slug AND chapter_number = r.tgt_ch AND verse_number = r.tgt_v;
    IF tid IS NULL THEN RAISE EXCEPTION 'S495: target verse %/% %:% missing', r.tgt_edition, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    -- canon quotations follow the restored-names KJV of parsed/canon.json by convention (the live canon display text is modernised), so only non-canon targets are compared
    IF r.tgt_edition <> 'canon' AND position(ltext IN r.note) = 0 THEN RAISE EXCEPTION 'S495: note for %:% -> %/% %:% does not carry the live target verse verbatim', r.src_ch, r.src_v, r.tgt_edition, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    IF sid = tid THEN RAISE EXCEPTION 'S495: source = target at %:%', r.src_ch, r.src_v; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _{tag}_t LOOP
    IF NOT EXISTS (SELECT 1 FROM _{tag}_lookup WHERE edition_slug = '{ed}' AND book_slug = '{book}' AND chapter_number = r.ch AND verse_number = r.a_vn)
    OR NOT EXISTS (SELECT 1 FROM _{tag}_lookup WHERE edition_slug = '{ed}' AND book_slug = '{book}' AND chapter_number = r.ch AND verse_number = r.z_vn) THEN
      RAISE EXCEPTION 'S495: anchor %:%-% for thread % missing', r.ch, r.a_vn, r.z_vn, r.slug; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _{tag}_j LOOP
    IF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE slug = r.slug) THEN RAISE EXCEPTION 'S495: thread to join % does not exist', r.slug; END IF;
  END LOOP;

  -- ---- cards ----
  SELECT count(*) INTO n_total FROM _{tag}_c;
  WITH input(src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS
       (SELECT src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note FROM _{tag}_c)
  INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
  SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
    FROM input i
    JOIN _{tag}_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
    JOIN _{tag}_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
   WHERE sv.verse_id <> tv.verse_id
  ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;
  GET DIAGNOSTICS n_cards = ROW_COUNT; n_cards_same := n_total - n_cards;

  -- ---- threads ----
  SELECT count(*) INTO n_total FROM _{tag}_t;
  INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
  SELECT t.slug, t.title, t.summary_md, sv.verse_id, ev.verse_id, t.tier::content_tier, t.sort_order
    FROM _{tag}_t t
    JOIN _{tag}_lookup sv ON sv.edition_slug='{ed}' AND sv.book_slug='{book}' AND sv.chapter_number=t.ch AND sv.verse_number=t.a_vn
    JOIN _{tag}_lookup ev ON ev.edition_slug='{ed}' AND ev.book_slug='{book}' AND ev.chapter_number=t.ch AND ev.verse_number=t.z_vn
  ON CONFLICT (slug) DO NOTHING;
  GET DIAGNOSTICS n_thr = ROW_COUNT; n_thr_same := n_total - n_thr;

  -- ---- members (thread by slug — new or joined; card by its verse pair, source='manual') ----
  SELECT count(*) INTO n_total FROM _{tag}_m;
  INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
  SELECT th.id, x.id, m.sort_order, m.member_note
    FROM _{tag}_m m
    JOIN cross_reference_threads th ON th.slug = m.thread_slug
    JOIN _{tag}_lookup sv ON sv.edition_slug='{ed}' AND sv.book_slug='{book}' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
    JOIN _{tag}_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
    JOIN cross_references x ON x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
  ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
  GET DIAGNOSTICS n_mem = ROW_COUNT; n_mem_same := n_total - n_mem;
  -- every member row must now exist (a card or thread that failed to resolve would leave one short)
  SELECT count(*) INTO n FROM _{tag}_m m WHERE NOT EXISTS (
    SELECT 1 FROM cross_reference_thread_members mm JOIN cross_reference_threads th ON th.id = mm.thread_id AND th.slug = m.thread_slug
      JOIN cross_references x ON x.id = mm.cross_reference_id
      JOIN _{tag}_lookup sv ON sv.verse_id = x.source_verse_id AND sv.edition_slug='{ed}' AND sv.book_slug='{book}' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
      JOIN _{tag}_lookup tv ON tv.verse_id = x.target_verse_id AND tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v);
  IF n > 0 THEN RAISE EXCEPTION 'S495: % member row(s) did not resolve to a thread + card', n; END IF;

  RAISE NOTICE 'S495 ({book}) summary: cards inserted % / already there %; threads inserted % / already there %; members inserted % / already there %',
    n_cards, n_cards_same, n_thr, n_thr_same, n_mem, n_mem_same;
END $s495$;
COMMIT;
\\echo 'session495 — {book} gap fill done.'
"""
    SQL = W / 'sql'; SQL.mkdir(exist_ok=True)
    (SQL / fname).write_text(sql)
    print(f"{book}: cards {len(crow)} | threads {len(trow)} | joined {len(jrow)} | members {len(mrow)} | editions in view {len(eds)} | bytes {len(sql)} -> {SQL / fname}")

if __name__ == '__main__':
    if len(sys.argv) < 2: sys.exit(__doc__)
    main(sys.argv[1])
