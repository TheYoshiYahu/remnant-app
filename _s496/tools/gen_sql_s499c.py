"""S499c — gen_sql_s499c.py → c15/session499c_matthew_15_canaanite_thread.sql. One idempotent migration from c15/fix.json: thread 30911's title and
summary rewritten; seven cards' notes rewritten in place; their member notes rewritten. Guards (DO block, before any write) RAISE and nothing lands if a
card is gone or off its verse pair, its Matthew text moved, its live note is neither the old nor the new, its member row is missing or its member note
is neither old nor new, or the thread's title/summary are neither old nor new. Re-run reports 0 everywhere. Model: Claude Fable 5.1."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
def q(s, tag='n'):
    assert f'${tag}$' not in s; assert not re.search(r"\n\s*\\", s); return f'${tag}$' + s + f'${tag}$'
fx = json.load(open(W6 / 'c15' / 'fix.json')); t = fx['thread']
rows = ',\n'.join(f"({c['id']},{c['src_ch']},{c['src_vn']},{q(c['src_text'])},'{c['tgt_book']}',{c['tgt_ch']},{c['tgt_vn']},{q(c['old_note'])},{q(c['note'])},{c['thread_id']},{q(c['old_member_note'])},{q(c['member_note'])})" for c in fx['cards'])
sql = f"""-- =====================================================================
-- Session 499c migration — 2026-11-13 — canon / Matthew 15:21–28 — the Canaanite-woman thread rewritten on Yoshi's reading:
-- the woman is a sheep of the scattered house (seed revealed, Matthew 15:22, 15:24); the bread is withheld because the divorced house cannot be
-- taken back until the husband's death (Jeremiah 3:8; Deuteronomy 24:4; Romans 7:2–4; Mark 7:27 "first"); the sending widens after the death.
-- Thread {t['id']} ({t['slug']}): title + summary rewritten (slug kept). {len(fx['cards'])} cards rewritten in place with their member notes
-- (four S1xx cards rebuilt Come-and-See: 124214 124215 124216 124217; three S499 cards given the reason: 2876 177460 3520).
-- Written and read on Claude Fable 5.1; every note composed by script (target verse whole from parsed/canon.json, Matthew verse whole from the
-- Nov 13 20:11 read-back). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted, no card re-pointed.
-- =====================================================================
BEGIN;
CREATE TEMP TABLE s499c_cards (id bigint, src_ch int, src_vn int, src_text text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s499c_cards VALUES
{rows};
CREATE TEMP TABLE s499c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s499c_thread VALUES ({t['id']}, '{t['slug']}', {q(t['old_title'])}, {q(t['title'])}, {q(t['old_summary'])}, {q(t['summary'])});

DO $s499c$
DECLARE r record; x record; n int;
BEGIN
  FOR r IN SELECT * FROM s499c_cards LOOP
    SELECT xr.id, xr.note, sv.text AS stext, sc.chapter_number AS sch, sv.verse_number AS svn, sb.slug AS sbook, tb.slug AS tbook, tc.chapter_number AS tch, tv.verse_number AS tvn
      INTO x FROM cross_references xr
      JOIN verses sv ON sv.id = xr.source_verse_id JOIN chapters sc ON sc.id = sv.chapter_id JOIN books sb ON sb.id = sc.book_id
      JOIN verses tv ON tv.id = xr.target_verse_id JOIN chapters tc ON tc.id = tv.chapter_id JOIN books tb ON tb.id = tc.book_id
      WHERE xr.id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S499c: card % is gone', r.id; END IF;
    IF x.sbook <> 'matthew' OR x.sch <> r.src_ch OR x.svn <> r.src_vn OR x.tbook <> r.tgt_book OR x.tch <> r.tgt_ch OR x.tvn <> r.tgt_vn THEN
      RAISE EXCEPTION 'S499c: card % no longer sits on the verse pair this was written for', r.id; END IF;
    IF x.stext <> r.src_text THEN RAISE EXCEPTION 'S499c: live text of matthew %:% differs from the read-back this migration was written against — re-dump and rebuild', r.src_ch, r.src_vn; END IF;
    IF x.note IS DISTINCT FROM r.old_note AND x.note IS DISTINCT FROM r.new_note THEN RAISE EXCEPTION 'S499c: the live note of card % differs from the read-back — re-dump and rebuild', r.id; END IF;
    SELECT count(*) INTO n FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id = r.thread_id AND (m.member_note IS NOT DISTINCT FROM r.old_mnote OR m.member_note IS NOT DISTINCT FROM r.new_mnote);
    IF n <> 1 THEN RAISE EXCEPTION 'S499c: card % has no member row in thread % carrying the member note this was written against', r.id, r.thread_id; END IF;
  END LOOP;
  SELECT t.* INTO x FROM cross_reference_threads t JOIN s499c_thread s ON s.id = t.id AND s.slug = t.slug;
  IF NOT FOUND THEN RAISE EXCEPTION 'S499c: thread {t['id']} not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s499c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S499c: thread {t['id']} title/summary differ from the read-back — re-dump and rebuild'; END IF;
END $s499c$;

DO $s499c2$
DECLARE n_notes int; n_m int; n_t int;
BEGIN
  UPDATE cross_references xr SET note = c.new_note FROM s499c_cards c WHERE xr.id = c.id AND xr.note IS NOT DISTINCT FROM c.old_note AND c.old_note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_notes = ROW_COUNT;
  UPDATE cross_reference_thread_members m SET member_note = c.new_mnote FROM s499c_cards c WHERE m.cross_reference_id = c.id AND m.thread_id = c.thread_id AND m.member_note IS NOT DISTINCT FROM c.old_mnote AND c.old_mnote IS DISTINCT FROM c.new_mnote;
  GET DIAGNOSTICS n_m = ROW_COUNT;
  UPDATE cross_reference_threads t SET title = s.new_title, summary_md = s.new_summary FROM s499c_thread s WHERE t.id = s.id AND t.title = s.old_title AND t.summary_md = s.old_summary;
  GET DIAGNOSTICS n_t = ROW_COUNT;
  RAISE NOTICE 'S499c (matthew 15 canaanite) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %',
    n_notes, (SELECT count(*) FROM s499c_cards) - n_notes, n_m, (SELECT count(*) FROM s499c_cards) - n_m, n_t, 1 - n_t;
END $s499c2$;
COMMIT;
"""
out = W6 / 'c15' / 'session499c_matthew_15_canaanite_thread.sql'; out.write_text(sql); print('wrote', out, len(sql))
