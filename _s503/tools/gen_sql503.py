"""S503 — gen_sql503.py → sql/session503_stragglers_rebuild.sql — ONE idempotent migration from fix/stragglers503.json: the last orphan cards
outside the gospels (eight books, canon and extras) rewritten IN PLACE (id kept, verse pair untouched) and each added to its live thread. The lookup
view is EDITION-AWARE (e.slug carried on every row) so a 2 Esdras / 2 Baruch source and a Testaments XII / Ascension of Isaiah target resolve.
Guards run before anything is written and RAISE (nothing lands) if: a card id is gone or no longer sits on its (edition, book, chapter, verse) pair;
the live text of its source verse differs from the read-back; its live note is neither the note this was written against nor the new note; the
card already sits in a thread this migration does not put it in; a thread to join is missing or its id moved. No threads inserted, no anchors set.
Member sort_order continues after each thread's live maximum, in source order. A re-run reports 0 everywhere. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
def q(s, tag='n'):
    assert f'${tag}$' not in s and '$s503$' not in s, 'dollar-quote tag collides with the text'
    assert not re.search(r"\n\s*\\", s), 'a line starts with a backslash — apply_migration.py would strip it'
    return f'${tag}$' + s + f'${tag}$'
def lit(s):
    assert "'" not in s, s
    return "'" + s + "'"
def main():
    fx = json.load(open(W3 / 'fix' / 'stragglers503.json')); tag = TAG; fname = 'session503_stragglers_rebuild.sql'
    crow = [f"({c['id']},{lit(c['s_ed'])},{lit(c['s_book'])},{c['src_ch']},{c['src_vn']},{q(c['src_text'])},{lit(c['t_ed'])},{lit(c['tgt_book'])},{c['tgt_ch']},{c['tgt_vn']},{q(c['old_note'] or '')},{q(c['note'])})" for c in fx['cards']]
    mrow = [f"({lit(m['thread_slug'])},{m['thread_id']},{m['id']},{m['src_vn'] + 1000 * m['src_ch']},{q(m['member_note'])})" for m in fx['members']]
    books = ', '.join(f"{title_of(e, b)}" for e, b in fx['books']); CROWS = ',\n'.join(crow); MROWS = ',\n'.join(mrow)
    sql = f"""-- =====================================================================
-- Session 503 migration — the STRAGGLERS: the last orphan cross-reference cards outside the gospels, rewritten Come-and-See and threaded.
-- Books: {books}. {len(fx['cards'])} cards rewritten in place (ids and verse pairs kept), 0 new threads, 0 anchors, {len(fx['members'])} thread members added.
-- Drafted and read on Claude Fable 5.1; every note composed by script (build503.py): target verse whole (canon from parsed/canon.json, the
-- restored-names KJV; extras from the live text), source verse whole as it reads live, then the prose. Edition-aware: sources in 2 Esdras and
-- 2 Baruch, targets in the Testaments of the Twelve Patriarchs and the Ascension of Isaiah resolve through e.slug.
-- Safety (DO block, before any write): RAISES if a card is gone or sits on another verse pair, if a source verse's live text differs from the
-- read-back, if a card's live note is neither the note this was written against nor the new one, if a card is already in a thread this file does
-- not put it in, or if a thread to join is missing or its id moved.  Idempotent: a re-run reports 0 rewritten / 0 inserted.  Nothing is deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/{fname}
-- =====================================================================
\\echo 'session503 — stragglers rebuild starting...'
BEGIN;
CREATE TEMP TABLE _{tag}_c (id BIGINT, s_ed TEXT, s_book TEXT, src_ch INT, src_v INT, src_text TEXT, t_ed TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, old_note TEXT, new_note TEXT) ON COMMIT DROP;
INSERT INTO _{tag}_c VALUES
{CROWS};
CREATE TEMP TABLE _{tag}_m (thread_slug TEXT, thread_id BIGINT, card_id BIGINT, ord INT, member_note TEXT) ON COMMIT DROP;
INSERT INTO _{tag}_m VALUES
{MROWS};

CREATE OR REPLACE TEMP VIEW _{tag}_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id, v.text
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id JOIN editions e ON b.edition_id = e.id;

DO $s503$
DECLARE r RECORD; sid BIGINT; tid BIGINT; ltext TEXT; cur RECORD; n INT; n_note INT := 0; n_note_same INT := 0; n_mem INT := 0; n_mem_same INT := 0; n_total INT;
BEGIN
  FOR r IN SELECT * FROM _{tag}_c LOOP
    SELECT verse_id, text INTO sid, ltext FROM _{tag}_lookup WHERE edition_slug = r.s_ed AND book_slug = r.s_book AND chapter_number = r.src_ch AND verse_number = r.src_v;
    IF sid IS NULL THEN RAISE EXCEPTION 'S503: source verse %/% %:% missing', r.s_ed, r.s_book, r.src_ch, r.src_v; END IF;
    IF ltext <> r.src_text THEN RAISE EXCEPTION 'S503: live text of %/% %:% differs from the read-back this migration was written against — re-dump and rebuild', r.s_ed, r.s_book, r.src_ch, r.src_v; END IF;
    SELECT verse_id INTO tid FROM _{tag}_lookup WHERE edition_slug = r.t_ed AND book_slug = r.tgt_slug AND chapter_number = r.tgt_ch AND verse_number = r.tgt_v;
    IF tid IS NULL THEN RAISE EXCEPTION 'S503: target verse %/% %:% missing', r.t_ed, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    SELECT * INTO cur FROM cross_references WHERE id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S503: card % is gone', r.id; END IF;
    IF cur.source_verse_id <> sid OR cur.target_verse_id <> tid THEN RAISE EXCEPTION 'S503: card % no longer sits on %/% %:% -> %/% %:%', r.id, r.s_ed, r.s_book, r.src_ch, r.src_v, r.t_ed, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    IF cur.note IS DISTINCT FROM r.old_note AND cur.note IS DISTINCT FROM r.new_note THEN RAISE EXCEPTION 'S503: the live note of card % differs from the read-back this migration was written against — re-dump and rebuild', r.id; END IF;
    IF EXISTS (SELECT 1 FROM cross_reference_thread_members mm JOIN cross_reference_threads th ON th.id = mm.thread_id
                WHERE mm.cross_reference_id = r.id AND NOT EXISTS (SELECT 1 FROM _{tag}_m m WHERE m.card_id = r.id AND m.thread_slug = th.slug)) THEN
      RAISE EXCEPTION 'S503: card % already sits in a thread this migration does not put it in — re-dump and rebuild', r.id; END IF;
  END LOOP;
  FOR r IN SELECT DISTINCT thread_slug, thread_id FROM _{tag}_m LOOP
    IF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE slug = r.thread_slug AND id = r.thread_id) THEN
      RAISE EXCEPTION 'S503: thread to join % (id %) does not exist under that id — re-dump and rebuild', r.thread_slug, r.thread_id; END IF;
  END LOOP;

  SELECT count(*) INTO n_total FROM _{tag}_c;
  UPDATE cross_references x SET note = c.new_note FROM _{tag}_c c WHERE x.id = c.id AND x.note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_note = ROW_COUNT; n_note_same := n_total - n_note;

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

  SELECT count(*) INTO n FROM _{tag}_c c JOIN cross_references x ON x.id = c.id WHERE x.note IS DISTINCT FROM c.new_note;
  IF n > 0 THEN RAISE EXCEPTION 'S503: % card(s) do not carry the new note', n; END IF;
  SELECT count(*) INTO n FROM _{tag}_m m WHERE NOT EXISTS (
    SELECT 1 FROM cross_reference_thread_members mm JOIN cross_reference_threads th ON th.id = mm.thread_id AND th.slug = m.thread_slug WHERE mm.cross_reference_id = m.card_id);
  IF n > 0 THEN RAISE EXCEPTION 'S503: % member row(s) did not land', n; END IF;

  RAISE NOTICE 'S503 (stragglers) summary: notes rewritten % / already there %; members inserted % / already there %', n_note, n_note_same, n_mem, n_mem_same;
END $s503$;
COMMIT;
\\echo 'session503 — stragglers rebuild done.'
"""
    SQL = W3 / 'sql'; SQL.mkdir(exist_ok=True); (SQL / fname).write_text(sql)
    print(f"stragglers503: cards {len(crow)} | members {len(mrow)} | bytes {len(sql)} -> {SQL / fname}")
if __name__ == '__main__': main()
