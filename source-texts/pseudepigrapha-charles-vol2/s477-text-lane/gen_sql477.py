#!/usr/bin/env python3
"""S477 — generate data-schema/migrations/session477_adam_eve_4macc_text_lane.sql from s477_map.json, s477_cards_map.json
and the Oct 26 read-back (pseud-cards-live.json). Rule 10: upsert in place, ids kept (each merged verse keeps the id of its
first old line), every table that points at verses re-pointed from the swallowed lines to the kept row, guards RAISE when the
live text is not the read-back, idempotent (a re-run finds both books landed and changes nothing)."""
import json, re
from pathlib import Path
HERE = Path(__file__).resolve().parent
APP = HERE.parents[2]
M = json.load(open(HERE / "s477_map.json")); CM = json.load(open(HERE / "s477_cards_map.json"))
D = json.load(open(HERE.parent / "pseud-cards-live.json")); L = D["live"]
BOOKS = ["adam-eve", "4-maccabees"]
def q(s): return "$t$" + s + "$t$" if "$t$" not in s else "$u$" + s + "$u$"
new_rows = []; old_rows = []; map_rows = []
for bk in BOOKS:
    seen = set()
    for v in M[bk]["new_verses"]:
        parts = [p for p in v["parts"] if isinstance(p, int)]
        new_rows.append(f"('{bk}',{v['ch']},{v['vn']},{parts[0]},ARRAY[{','.join(map(str,parts))}]::int[],{q(v['text'])})")
        prefix = 0
        for p in parts:
            ot = L[f"pseudepigrapha|{bk}|{v['ch']}:{p}"]
            old_rows.append(f"('{bk}',{v['ch']},{p},{q(ot)})"); seen.add((v['ch'], p))
            map_rows.append(f"('{bk}',{v['ch']},{p},{v['vn']},{parts[0]},{prefix})")
            prefix += len(ot.split())
    # every live old verse must be accounted for
    live_keys = {tuple(map(int, k.split('|')[2].split(':'))) for k in L if k.startswith(f"pseudepigrapha|{bk}|")}
    assert live_keys == seen, (bk, live_keys ^ seen)
override = [r for r in CM["cards"] if r["override"] and r["xid"] == 69502][0]
expected_cards = [(r["xid"], r["side"], r["book"], *map(int, r["new"].split(":"))) for r in CM["cards"]]
exp_rows = ",\n".join(f"({x},'{s}','{b}',{c},{v})" for x, s, b, c, v in expected_cards)
anch_rows = ",\n".join(f"({a['thread_id']},'{a['book']}',{a['new_start'].split(':')[0]},{a['new_start'].split(':')[1]},{a['new_end'].split(':')[0]},{a['new_end'].split(':')[1]})" for a in CM["anchors"])
NEW=",\n".join(new_rows); OLD=",\n".join(old_rows); MAPR=",\n".join(map_rows)
n_new = {bk: len(M[bk]["new_verses"]) for bk in BOOKS}; n_old = {bk: sum(1 for k in L if k.startswith(f"pseudepigrapha|{bk}|")) for bk in BOOKS}
sql = f"""-- =====================================================================
-- Session 477 migration — 2026-10-26 — edition `pseudepigrapha`, books adam-eve (784) and 4-maccabees (789): TEXT LANE
-- Track B (S410–S415) kept every print line of Charles 1913 vol. 2 as a verse, so about half the verses of these two books broke
-- mid-clause. This migration merges the broken lines back into whole clauses (joined with a space, or directly after a hyphenated
-- line end), keeps the chapter numbering, renumbers the verses 1..n per chapter, and re-points everything that sat on a swallowed
-- line to the kept row by CONTENT (each merged verse keeps the id of its first old line; every old line's text sits inside the new
-- verse, traced in s477_cards_map.json). adam-eve {n_old['adam-eve']} -> {n_new['adam-eve']} verses; 4-maccabees {n_old['4-maccabees']} -> {n_new['4-maccabees']} verses; 94 and 18 chapters unchanged.
-- Two sentences that ran across a chapter break are moved to the chapter whose standard division carries them:
--   Vita Adae 45/46 (chapters 88/89): "(Then) was the sun darkened and the moon" moves to 89:1 — card 69502 (Joel 2:10) goes with it;
--   4 Maccabees 13/14: "brethren, who were on the rack, being tortured to death;" moves to the end of 13:13 (14:1 begins "nay more").
-- Re-pointed: cross_references (source/target; a collision on (source, target, source) merges the loser into the survivor — none
-- expected), cross_reference_threads anchors, commentary_entries, concept_verse_index, study_notes, bookmarks, verse_highlights
-- (word offsets shifted by the words that now precede the old line), reading_positions, kingdom_verses, red_pill_verses,
-- verses.canonical_verse_id; verse_words rows on swallowed lines are dropped. Then the swallowed rows are deleted (any FK missed
-- fails loud on RESTRICT), the kept rows renumbered and given the merged text.
-- Reads before this was written: every move read cold by two Sonnet agents that never saw the build (adam-eve: full merged text,
-- 241 cards, 61 anchors — both AGREE; 4-maccabees: addresses, 292 cards, 51 anchors — both AGREE; join quality by script: 0 doubled
-- words, 6 hyphen joins all real words). Guards: RAISES if any live verse of either book is missing or differs from the Oct 26
-- read-back, if a live verse exists that the read-back did not have, if a re-pointing would make source = target, or if the
-- post-run text/count check fails. Idempotent: a re-run finds both books already landed and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/session477_adam_eve_4macc_text_lane.sql
-- (apply_migration.py hides NOTICEs — the deploy script runs _s477_check.py, which prints the proof.)
-- =====================================================================
\\echo 'session477 (adam-eve + 4-maccabees text lane) — starting...'
BEGIN;
CREATE TEMP TABLE _s477new (book TEXT, ch INT, nvn INT, head_ovn INT, parts INT[], new_text TEXT) ON COMMIT DROP;
CREATE TEMP TABLE _s477old (book TEXT, ch INT, ovn INT, old_text TEXT) ON COMMIT DROP;
CREATE TEMP TABLE _s477parts (book TEXT, ch INT, ovn INT, nvn INT, head_ovn INT, prefix_words INT) ON COMMIT DROP;
CREATE TEMP TABLE _s477cards (xid INT, side CHAR(1), book TEXT, ch INT, nvn INT) ON COMMIT DROP;
CREATE TEMP TABLE _s477anch (thread_id INT, book TEXT, ach INT, avn INT, zch INT, zvn INT) ON COMMIT DROP;
INSERT INTO _s477new VALUES
{NEW};
INSERT INTO _s477old VALUES
{OLD};
INSERT INTO _s477parts VALUES
{MAPR};
INSERT INTO _s477cards VALUES
{exp_rows};
INSERT INTO _s477anch VALUES
{anch_rows};

DO $fix$
DECLARE
  bk TEXT; bid INT; r RECORD; t TEXT; oid BIGINT; dupid BIGINT; ns BIGINT; nt BIGINT; src TEXT; n INT;
  landed TEXT[] := '{{}}'; n_re INT := 0; n_merged INT := 0; n_del INT := 0; n_thr INT := 0; n_other INT := 0; n_ok INT := 0; n_bad INT := 0;
  id89 BIGINT; id88 BIGINT;
BEGIN
  CREATE TEMP TABLE _s477map (book TEXT, ch INT, ovn INT, old_id BIGINT, nvn INT, head_id BIGINT, prefix_words INT) ON COMMIT DROP;
  FOREACH bk IN ARRAY ARRAY['adam-eve','4-maccabees'] LOOP
    SELECT b.id INTO bid FROM books b JOIN editions e ON e.id = b.edition_id WHERE e.slug = 'pseudepigrapha' AND b.slug = bk;
    IF bid IS NULL THEN RAISE EXCEPTION 'S477: book pseudepigrapha/% not found', bk; END IF;
    -- already landed?
    SELECT count(*) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = bid;
    IF n = (SELECT count(*) FROM _s477new WHERE book = bk) AND NOT EXISTS (
         SELECT 1 FROM _s477new x WHERE x.book = bk AND NOT EXISTS (
           SELECT 1 FROM verses v JOIN chapters c ON c.id = v.chapter_id
            WHERE c.book_id = bid AND c.chapter_number = x.ch AND v.verse_number = x.nvn AND v.text = x.new_text)) THEN
      RAISE NOTICE 'S477: % already landed (% verses) — nothing to do', bk, n; landed := landed || bk; CONTINUE;
    END IF;
    -- guard: every old verse present with the read-back text, and nothing else in the book
    FOR r IN SELECT * FROM _s477old WHERE book = bk LOOP
      SELECT v.id, v.text INTO oid, t FROM verses v JOIN chapters c ON c.id = v.chapter_id
       WHERE c.book_id = bid AND c.chapter_number = r.ch AND v.verse_number = r.ovn;
      IF oid IS NULL THEN RAISE EXCEPTION 'S477: live % %:% missing — the book is neither the read-back nor the merged text', bk, r.ch, r.ovn; END IF;
      IF t <> r.old_text THEN RAISE EXCEPTION 'S477: live % %:% text differs from the Oct 26 read-back — re-dump and rebuild', bk, r.ch, r.ovn; END IF;
    END LOOP;
    SELECT count(*) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
     WHERE c.book_id = bid AND NOT EXISTS (SELECT 1 FROM _s477old o WHERE o.book = bk AND o.ch = c.chapter_number AND o.ovn = v.verse_number);
    IF n > 0 THEN RAISE EXCEPTION 'S477: % live verses of % are not in the read-back — re-dump and rebuild', n, bk; END IF;
    INSERT INTO _s477map
      SELECT p.book, p.ch, p.ovn, v.id, p.nvn, (SELECT v2.id FROM verses v2 JOIN chapters c2 ON c2.id = v2.chapter_id
              WHERE c2.book_id = bid AND c2.chapter_number = p.ch AND v2.verse_number = p.head_ovn), p.prefix_words
        FROM _s477parts p JOIN chapters c ON c.book_id = bid AND c.chapter_number = p.ch JOIN verses v ON v.chapter_id = c.id AND v.verse_number = p.ovn
       WHERE p.book = bk;
  END LOOP;
  IF array_length(landed, 1) = 2 THEN
    RAISE NOTICE 'S477 summary: both books already landed; 0 changed'; RETURN;
  END IF;

  -- 1. cross_references: re-point swallowed lines to the kept row; merge on a (source, target, source) collision
  FOR r IN SELECT x.id, x.source_verse_id s, x.target_verse_id tg, x.source src, ms.head_id hs, mt.head_id ht
             FROM cross_references x
             LEFT JOIN _s477map ms ON ms.old_id = x.source_verse_id AND ms.old_id <> ms.head_id
             LEFT JOIN _s477map mt ON mt.old_id = x.target_verse_id AND mt.old_id <> mt.head_id
            WHERE ms.old_id IS NOT NULL OR mt.old_id IS NOT NULL ORDER BY x.id LOOP
    ns := COALESCE(r.hs, r.s); nt := COALESCE(r.ht, r.tg);
    IF ns = nt THEN RAISE EXCEPTION 'S477: card % would become a self pair', r.id; END IF;
    SELECT id INTO dupid FROM cross_references WHERE source_verse_id = ns AND target_verse_id = nt AND source = r.src AND id <> r.id;
    IF dupid IS NOT NULL THEN
      INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
        SELECT m.thread_id, dupid, m.sort_order, m.member_note FROM cross_reference_thread_members m
         WHERE m.cross_reference_id = r.id AND NOT EXISTS (SELECT 1 FROM cross_reference_thread_members m2 WHERE m2.thread_id = m.thread_id AND m2.cross_reference_id = dupid);
      DELETE FROM cross_reference_thread_members WHERE cross_reference_id = r.id;
      DELETE FROM cross_references WHERE id = r.id;
      n_merged := n_merged + 1; RAISE NOTICE 'S477: card % merged into % (same pair after the merge)', r.id, dupid;
    ELSE
      UPDATE cross_references SET source_verse_id = ns, target_verse_id = nt WHERE id = r.id; n_re := n_re + 1;
    END IF;
  END LOOP;
  -- 1b. the one cross-chapter card: 69502 (Joel 2:10) follows "(Then) was the sun darkened and the moon" from old 88:3 to 89:1
  SELECT v.id INTO id89 FROM verses v JOIN chapters c ON c.id = v.chapter_id JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id
   WHERE e.slug = 'pseudepigrapha' AND b.slug = 'adam-eve' AND c.chapter_number = 89 AND v.verse_number = 1;
  SELECT head_id INTO id88 FROM _s477map WHERE book = 'adam-eve' AND ch = 88 AND ovn = 3;
  IF id88 IS NOT NULL THEN
    UPDATE cross_references SET source_verse_id = id89 WHERE id = {override['xid']} AND source_verse_id = id88
       AND NOT EXISTS (SELECT 1 FROM cross_references d WHERE d.source_verse_id = id89 AND d.target_verse_id = cross_references.target_verse_id AND d.source = cross_references.source AND d.id <> {override['xid']});
    IF FOUND THEN n_re := n_re + 1; RAISE NOTICE 'S477: card {override['xid']} moved adam-eve 88:3 -> 89:1 with the moved sentence'; ELSE RAISE NOTICE 'S477: card {override['xid']} not at adam-eve 88:3 (or a card already sits on 89:1 with that other end) — left as is'; END IF;
  END IF;

  -- 2. thread anchors
  UPDATE cross_reference_threads th SET anchor_verse_id_start = m.head_id FROM _s477map m WHERE th.anchor_verse_id_start = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_thr := n_thr + n;
  UPDATE cross_reference_threads th SET anchor_verse_id_end = m.head_id FROM _s477map m WHERE th.anchor_verse_id_end = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_thr := n_thr + n;

  -- 3. everything else that points at a swallowed line
  UPDATE commentary_entries ce SET verse_id = m.head_id FROM _s477map m WHERE ce.verse_id = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;
  DELETE FROM concept_verse_index ci USING _s477map m WHERE ci.verse_id = m.old_id AND m.old_id <> m.head_id
     AND EXISTS (SELECT 1 FROM concept_verse_index c2 WHERE c2.concept_id = ci.concept_id AND c2.verse_id = m.head_id);
  UPDATE concept_verse_index ci SET verse_id = m.head_id FROM _s477map m WHERE ci.verse_id = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;
  DELETE FROM verse_words vw USING _s477map m WHERE vw.verse_id = m.old_id AND m.old_id <> m.head_id;
  UPDATE study_notes sn SET verse_id = m.head_id FROM _s477map m WHERE sn.verse_id = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;
  DELETE FROM bookmarks bm USING _s477map m WHERE bm.verse_id = m.old_id AND m.old_id <> m.head_id
     AND EXISTS (SELECT 1 FROM bookmarks b2 WHERE b2.user_id = bm.user_id AND b2.verse_id = m.head_id);
  UPDATE bookmarks bm SET verse_id = m.head_id FROM _s477map m WHERE bm.verse_id = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;
  FOR r IN SELECT h.id, m.head_id, m.prefix_words FROM verse_highlights h JOIN _s477map m ON m.old_id = h.verse_id AND m.old_id <> m.head_id LOOP
    BEGIN
      UPDATE verse_highlights SET verse_id = r.head_id, word_start = word_start + r.prefix_words, word_end = word_end + r.prefix_words WHERE id = r.id;
      n_other := n_other + 1;
    EXCEPTION WHEN unique_violation THEN DELETE FROM verse_highlights WHERE id = r.id; END;
  END LOOP;
  UPDATE reading_positions rp SET verse_id = m.head_id FROM _s477map m WHERE rp.verse_id = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;
  IF to_regclass('kingdom_verses') IS NOT NULL THEN
    UPDATE kingdom_verses kv SET verse_id = m.head_id FROM _s477map m WHERE kv.verse_id = m.old_id AND m.old_id <> m.head_id;
    GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;
  END IF;
  IF to_regclass('red_pill_verses') IS NOT NULL THEN
    UPDATE red_pill_verses rv SET verse_id = m.head_id FROM _s477map m WHERE rv.verse_id = m.old_id AND m.old_id <> m.head_id;
    GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;
  END IF;
  UPDATE verses v SET canonical_verse_id = m.head_id FROM _s477map m WHERE v.canonical_verse_id = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n = ROW_COUNT; n_other := n_other + n;

  -- 4. drop the swallowed rows (a missed FK fails loud here, on RESTRICT)
  DELETE FROM verses v USING _s477map m WHERE v.id = m.old_id AND m.old_id <> m.head_id;
  GET DIAGNOSTICS n_del = ROW_COUNT;

  -- 5. renumber the kept rows and give them the merged text (negative numbers first, so no (chapter, number) collision)
  UPDATE verses v SET verse_number = -m.nvn FROM (SELECT DISTINCT head_id, nvn FROM _s477map) m WHERE v.id = m.head_id;
  UPDATE verses v SET verse_number = -v.verse_number, text = x.new_text
    FROM _s477map m JOIN _s477new x ON x.book = m.book AND x.ch = m.ch AND x.nvn = m.nvn
   WHERE v.id = m.head_id AND m.old_id = m.head_id;

  -- 6. verify text and counts
  FOREACH bk IN ARRAY ARRAY['adam-eve','4-maccabees'] LOOP
    IF bk = ANY(landed) THEN CONTINUE; END IF;
    SELECT b.id INTO bid FROM books b JOIN editions e ON e.id = b.edition_id WHERE e.slug = 'pseudepigrapha' AND b.slug = bk;
    SELECT count(*) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = bid;
    IF n <> (SELECT count(*) FROM _s477new WHERE book = bk) THEN RAISE EXCEPTION 'S477: % has % verses after the merge, expected %', bk, n, (SELECT count(*) FROM _s477new WHERE book = bk); END IF;
    FOR r IN SELECT * FROM _s477new WHERE book = bk LOOP
      SELECT v.text INTO t FROM verses v JOIN chapters c ON c.id = v.chapter_id WHERE c.book_id = bid AND c.chapter_number = r.ch AND v.verse_number = r.nvn;
      IF t IS NULL OR t <> r.new_text THEN RAISE EXCEPTION 'S477: % %:% did not land with the merged text', bk, r.ch, r.nvn; END IF;
    END LOOP;
  END LOOP;
  -- 7. every card and anchor at its expected address
  FOR r IN SELECT c.*, x.source_verse_id s, x.target_verse_id tg FROM _s477cards c JOIN cross_references x ON x.id = c.xid LOOP
    SELECT v.id INTO oid FROM verses v JOIN chapters ch ON ch.id = v.chapter_id JOIN books b ON b.id = ch.book_id JOIN editions e ON e.id = b.edition_id
     WHERE e.slug = 'pseudepigrapha' AND b.slug = r.book AND ch.chapter_number = r.ch AND v.verse_number = r.nvn;
    IF (r.side = 'S' AND r.s = oid) OR (r.side = 'T' AND r.tg = oid) THEN n_ok := n_ok + 1; ELSE n_bad := n_bad + 1; RAISE NOTICE 'S477: card % is not at % %:%', r.xid, r.book, r.ch, r.nvn; END IF;
  END LOOP;
  IF n_bad > 0 THEN RAISE EXCEPTION 'S477: % cards did not land where the map says', n_bad; END IF;
  RAISE NOTICE 'S477 summary: cards re-pointed %, merged %, thread anchor ends re-pointed %, other rows re-pointed %, swallowed verse rows deleted %, cards verified at their new address %/%',
    n_re, n_merged, n_thr, n_other, n_del, n_ok, (SELECT count(*) FROM _s477cards);
END $fix$;
COMMIT;
\\echo 'session477 — done.'
"""
out = APP / "data-schema" / "migrations" / "session477_adam_eve_4macc_text_lane.sql"
out.write_text(sql)
print("wrote", out, len(sql), "chars;", len(new_rows), "new verses,", len(old_rows), "old verses,", len(expected_cards), "cards,", len(CM["anchors"]), "anchors")
