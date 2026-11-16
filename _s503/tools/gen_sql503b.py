"""S503b — gen_sql503b.py → sql/session503b_matthew_repoint.sql — ONE idempotent migration from fix/repoint503.json: Matthew cards re-pointed from a
gospel-of-John verse to the 1 John verse their note meant (target_verse_id UPDATE, id kept, source kept, thread kept), with note and member note
rewritten; plus the shorthand twins rewritten in place. Guards (DO block, before any write) RAISE and nothing lands if: a card is gone; it sits
neither on its OLD pair with the old note nor already on its NEW pair with the new note (the guard the roadmap asked for: the card must still read
as written to the John verse); its Matthew live text moved; its member row in its thread is missing or carries neither the old nor the new member
note; or another live card already holds the new (source, target, source) pair. Re-run reports 0 everywhere. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
def q(s, tag='n'):
    assert f'${tag}$' not in s and '$s503b$' not in s; assert not re.search(r"\n\s*\\", s); return f'${tag}$' + s + f'${tag}$'
def lit(s): assert "'" not in s; return "'" + s + "'"
fx = json.load(open(W3 / 'fix' / 'repoint503.json')); tag = 's503b'; fname = 'session503b_matthew_repoint.sql'
rows = ',\n'.join(f"({c['id']},{c['src_ch']},{c['src_vn']},{q(c['src_text'])},{lit(c['old_t_ed'])},{lit(c['old_tgt_book'])},{c['old_tgt_ch']},{c['old_tgt_vn']},{lit(c['t_ed'])},{lit(c['tgt_book'])},{c['tgt_ch']},{c['tgt_vn']},{lit(c['source'])},{q(c['old_note'] or '')},{q(c['note'])},{c['thread_id']},{q(c['old_member_note'] or '')},{q(c['member_note'])})" for c in fx['cards'])
rp = [c for c in fx['cards'] if c['repointed']]; ip = [c for c in fx['cards'] if not c['repointed']]
desc = '; '.join(f"{c['id']} Matthew {c['src_ch']}:{c['src_vn']} John {c['old_tgt_ch']}:{c['old_tgt_vn']} → 1 John {c['tgt_ch']}:{c['tgt_vn']}" for c in rp)
sql = f"""-- =====================================================================
-- Session 503b migration — canon / Matthew — the RE-POINT pass. {len(rp)} card(s) whose old note meant 1 John but whose target was the gospel of John
-- re-pointed to the 1 John verse (target_verse_id UPDATE; id, source verse, thread kept; note and member note rewritten Come-and-See to the new pair):
-- {desc}.
-- {len(ip)} shorthand twin(s) rewritten in place with the target unchanged: {', '.join(f"{c['id']} Matthew {c['src_ch']}:{c['src_vn']} → {title_of(c['t_ed'], c['tgt_book'])} {c['tgt_ch']}:{c['tgt_vn']}" for c in ip)}.
-- Written and read on Claude Fable 5.1 against the read-back {fx['read_back_note']}. Every note composed by script (build503b.py): target verse whole
-- from parsed/canon.json, Matthew verse whole from the live text, then the prose.
-- Safety (DO block, before any write): RAISES if a card is gone, if it sits neither on its old pair with its old note nor already on its new pair with
-- its new note, if its Matthew live text moved, if its member row is missing or carries neither member note, or if another card already holds the
-- new pair. Idempotent: a re-run reports 0 everywhere. Nothing deleted, no card added.
-- Run: python3 api/apply_migration.py data-schema/migrations/{fname}
-- =====================================================================
\\echo 'session503b — Matthew re-point pass starting...'
BEGIN;
CREATE TEMP TABLE _{tag}_c (id BIGINT, src_ch INT, src_v INT, src_text TEXT, o_ed TEXT, o_book TEXT, o_ch INT, o_v INT, n_ed TEXT, n_book TEXT, n_ch INT, n_v INT, src TEXT, old_note TEXT, new_note TEXT, thread_id BIGINT, old_mnote TEXT, new_mnote TEXT) ON COMMIT DROP;
INSERT INTO _{tag}_c VALUES
{rows};
CREATE OR REPLACE TEMP VIEW _{tag}_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id, v.text
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id JOIN editions e ON b.edition_id = e.id;

DO $s503b$
DECLARE r RECORD; sid BIGINT; oid BIGINT; nid BIGINT; ltext TEXT; cur RECORD; n INT; n_rp INT := 0; n_rp_same INT := 0; n_m INT := 0; n_m_same INT := 0; n_total INT;
BEGIN
  FOR r IN SELECT * FROM _{tag}_c LOOP
    SELECT verse_id, text INTO sid, ltext FROM _{tag}_lookup WHERE edition_slug = 'canon' AND book_slug = 'matthew' AND chapter_number = r.src_ch AND verse_number = r.src_v;
    IF sid IS NULL THEN RAISE EXCEPTION 'S503b: Matthew %:% missing', r.src_ch, r.src_v; END IF;
    IF ltext <> r.src_text THEN RAISE EXCEPTION 'S503b: live text of Matthew %:% differs from the read-back — re-dump and rebuild', r.src_ch, r.src_v; END IF;
    SELECT verse_id INTO oid FROM _{tag}_lookup WHERE edition_slug = r.o_ed AND book_slug = r.o_book AND chapter_number = r.o_ch AND verse_number = r.o_v;
    SELECT verse_id INTO nid FROM _{tag}_lookup WHERE edition_slug = r.n_ed AND book_slug = r.n_book AND chapter_number = r.n_ch AND verse_number = r.n_v;
    IF oid IS NULL OR nid IS NULL THEN RAISE EXCEPTION 'S503b: a target verse for card % is missing', r.id; END IF;
    SELECT * INTO cur FROM cross_references WHERE id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S503b: card % is gone', r.id; END IF;
    IF cur.source_verse_id <> sid THEN RAISE EXCEPTION 'S503b: card % no longer sits on Matthew %:%', r.id, r.src_ch, r.src_v; END IF;
    IF NOT ((cur.target_verse_id = oid AND cur.note IS NOT DISTINCT FROM r.old_note) OR (cur.target_verse_id = nid AND cur.note IS NOT DISTINCT FROM r.new_note)) THEN
      RAISE EXCEPTION 'S503b: card % does not read as written to its old target (nor already as the new card) — re-dump and rebuild', r.id; END IF;
    IF oid <> nid AND EXISTS (SELECT 1 FROM cross_references x WHERE x.id <> r.id AND x.source_verse_id = sid AND x.target_verse_id = nid AND x.source = r.src) THEN
      RAISE EXCEPTION 'S503b: another card already holds the new pair for card %', r.id; END IF;
    SELECT count(*) INTO n FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id = r.thread_id AND (m.member_note IS NOT DISTINCT FROM r.old_mnote OR m.member_note IS NOT DISTINCT FROM r.new_mnote);
    IF n <> 1 THEN RAISE EXCEPTION 'S503b: card % has no member row in thread % carrying the member note this was written against', r.id, r.thread_id; END IF;
    IF EXISTS (SELECT 1 FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id <> r.thread_id) THEN
      RAISE EXCEPTION 'S503b: card % sits in another thread too — re-dump and rebuild', r.id; END IF;
  END LOOP;

  SELECT count(*) INTO n_total FROM _{tag}_c;
  UPDATE cross_references x SET target_verse_id = nv.verse_id, note = c.new_note
    FROM _{tag}_c c JOIN _{tag}_lookup nv ON nv.edition_slug = c.n_ed AND nv.book_slug = c.n_book AND nv.chapter_number = c.n_ch AND nv.verse_number = c.n_v
   WHERE x.id = c.id AND x.note IS NOT DISTINCT FROM c.old_note AND c.old_note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_rp = ROW_COUNT; n_rp_same := n_total - n_rp;
  UPDATE cross_reference_thread_members m SET member_note = c.new_mnote FROM _{tag}_c c
   WHERE m.cross_reference_id = c.id AND m.thread_id = c.thread_id AND m.member_note IS NOT DISTINCT FROM c.old_mnote AND c.old_mnote IS DISTINCT FROM c.new_mnote;
  GET DIAGNOSTICS n_m = ROW_COUNT; n_m_same := n_total - n_m;

  SELECT count(*) INTO n FROM _{tag}_c c JOIN cross_references x ON x.id = c.id JOIN _{tag}_lookup nv ON nv.edition_slug = c.n_ed AND nv.book_slug = c.n_book AND nv.chapter_number = c.n_ch AND nv.verse_number = c.n_v
   WHERE x.target_verse_id <> nv.verse_id OR x.note IS DISTINCT FROM c.new_note;
  IF n > 0 THEN RAISE EXCEPTION 'S503b: % card(s) do not carry the new target and note', n; END IF;
  RAISE NOTICE 'S503b (matthew re-point) summary: cards re-pointed/rewritten % / already there %; member notes rewritten % / already there %', n_rp, n_rp_same, n_m, n_m_same;
END $s503b$;
COMMIT;
\\echo 'session503b — Matthew re-point pass done.'
"""
SQL = W3 / 'sql'; SQL.mkdir(exist_ok=True); (SQL / fname).write_text(sql); print(f"repoint503: cards {len(fx['cards'])} (re-pointed {len(rp)}) | bytes {len(sql)} -> {SQL / fname}")
