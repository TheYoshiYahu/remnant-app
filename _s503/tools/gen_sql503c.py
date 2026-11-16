"""S503c — gen_sql503c.py <slug> → sql/session503c_<short>.sql — ONE idempotent migration per thread from fix/sweep/<slug>.json: the thread's title and
summary rewritten (slug kept); the named member cards' notes rewritten in place and their member notes rewritten. Guards (DO block, before any write)
RAISE and nothing lands if a card is gone or off its verse pair, its source text moved, its live note is neither old nor new, its member row in this
thread is missing or carries neither member note, or the thread's title/summary are neither old nor new. Re-run reports 0 everywhere. The S499c
migration made general (any source book, edition-aware). Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
def q(s, tag='n'):
    assert f'${tag}$' not in s and '$s503c$' not in s; assert not re.search(r"\n\s*\\", s); return f'${tag}$' + s + f'${tag}$'
def lit(s): assert "'" not in s; return "'" + s + "'"
def short(slug): return '-'.join(slug.split('-')[:4])
def main(slug):
    fx = json.load(open(W3 / 'fix' / 'sweep' / f'{slug}.json')); t = fx['thread']; sh = short(slug); fname = f'session503c_{sh}.sql'
    rows = ',\n'.join(f"({c['id']},{lit(c['s_ed'])},{lit(c['s_book'])},{c['src_ch']},{c['src_vn']},{q(c['src_text'])},{lit(c['t_ed'])},{lit(c['tgt_book'])},{c['tgt_ch']},{c['tgt_vn']},{q(c['old_note'] or '')},{q(c['note'])},{c['thread_id']},{q(c['old_member_note'] or '')},{q(c['member_note'])})" for c in fx['cards'])
    cards_sql = (f"INSERT INTO s503c_cards VALUES\n{rows};") if fx['cards'] else "-- (no card rows)"
    sql = f"""-- =====================================================================
-- Session 503c migration — summaries sweep — thread {t['id']} `{slug}`: title + summary rewritten (slug kept); {len(fx['cards'])} member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- {fx['read_back_note']}. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/{fname}
-- =====================================================================
\\echo 'session503c — {sh} starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
{cards_sql}
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES ({t['id']}, {lit(t['slug'])}, {q(t['old_title'])}, {q(t['title'])}, {q(t['old_summary'])}, {q(t['summary'])});

DO $s503c$
DECLARE r record; x record; n int;
BEGIN
  FOR r IN SELECT * FROM s503c_cards LOOP
    SELECT xr.id, xr.note, sv.text AS stext, se.slug AS sed, sb.slug AS sbook, sc.chapter_number AS sch, sv.verse_number AS svn, te.slug AS ted, tb.slug AS tbook, tc.chapter_number AS tch, tv.verse_number AS tvn
      INTO x FROM cross_references xr
      JOIN verses sv ON sv.id = xr.source_verse_id JOIN chapters sc ON sc.id = sv.chapter_id JOIN books sb ON sb.id = sc.book_id JOIN editions se ON se.id = sb.edition_id
      JOIN verses tv ON tv.id = xr.target_verse_id JOIN chapters tc ON tc.id = tv.chapter_id JOIN books tb ON tb.id = tc.book_id JOIN editions te ON te.id = tb.edition_id
      WHERE xr.id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S503c: card % is gone', r.id; END IF;
    IF x.sed <> r.s_ed OR x.sbook <> r.s_book OR x.sch <> r.src_ch OR x.svn <> r.src_vn OR x.ted <> r.t_ed OR x.tbook <> r.tgt_book OR x.tch <> r.tgt_ch OR x.tvn <> r.tgt_vn THEN
      RAISE EXCEPTION 'S503c: card % no longer sits on the verse pair this was written for', r.id; END IF;
    IF x.stext <> r.src_text THEN RAISE EXCEPTION 'S503c: live text of % %:% differs from the read-back — re-dump and rebuild', r.s_book, r.src_ch, r.src_vn; END IF;
    IF x.note IS DISTINCT FROM r.old_note AND x.note IS DISTINCT FROM r.new_note THEN RAISE EXCEPTION 'S503c: the live note of card % differs from the read-back — re-dump and rebuild', r.id; END IF;
    SELECT count(*) INTO n FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id = r.thread_id AND (m.member_note IS NOT DISTINCT FROM r.old_mnote OR m.member_note IS NOT DISTINCT FROM r.new_mnote);
    IF n <> 1 THEN RAISE EXCEPTION 'S503c: card % has no member row in thread % carrying the member note this was written against', r.id, r.thread_id; END IF;
  END LOOP;
  SELECT t.* INTO x FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id AND s.slug = t.slug;
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread {t['id']} not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread {t['id']} title/summary differ from the read-back — re-dump and rebuild'; END IF;
END $s503c$;

DO $s503c2$
DECLARE n_notes int; n_m int; n_t int; n_c int;
BEGIN
  SELECT count(*) INTO n_c FROM s503c_cards;
  UPDATE cross_references xr SET note = c.new_note FROM s503c_cards c WHERE xr.id = c.id AND xr.note IS NOT DISTINCT FROM c.old_note AND c.old_note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_notes = ROW_COUNT;
  UPDATE cross_reference_thread_members m SET member_note = c.new_mnote FROM s503c_cards c WHERE m.cross_reference_id = c.id AND m.thread_id = c.thread_id AND m.member_note IS NOT DISTINCT FROM c.old_mnote AND c.old_mnote IS DISTINCT FROM c.new_mnote;
  GET DIAGNOSTICS n_m = ROW_COUNT;
  UPDATE cross_reference_threads t SET title = s.new_title, summary_md = s.new_summary FROM s503c_thread s WHERE t.id = s.id AND t.title = s.old_title AND t.summary_md = s.old_summary;
  GET DIAGNOSTICS n_t = ROW_COUNT;
  RAISE NOTICE 'S503c ({sh}) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\\echo 'session503c — {sh} done.'
"""
    SQL = W3 / 'sql'; SQL.mkdir(exist_ok=True); (SQL / fname).write_text(sql); print(f"{slug}: cards {len(fx['cards'])} | bytes {len(sql)} -> {SQL / fname}"); return fname
if __name__ == '__main__': main(sys.argv[1])
