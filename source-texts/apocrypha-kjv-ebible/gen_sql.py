import json
d=json.load(open('apocrypha.fixed.json')); B={b['book_id']:b for b in d['books']}
ch=json.load(open('apocrypha-changed-verses.json'))
def esc(s): return "E'"+s.replace('\\','\\\\').replace("'","\\'")+"'"
def txt(b,c,v): return next(x['text'] for x in next(cc for cc in B[b]['chapters'] if cc['number']==c)['verses'] if x['number']==v)
rows=[f"    ('{b}', {c}, {v}, {esc(txt(b,c,v))})" for b,c,v in ch['changed']+ch['inserted'] if not (b=='the-rest-of-esther' and c==10 and v==4)]
E="e.slug = 'apocrypha'"; ROWS=",\n".join(rows)
sql=f"""-- =====================================================================
-- Session 454 migration — 2026-10-17
-- Apocrypha (KJV 1611 edition): text audit against eBible KJV, by content, S454
-- =====================================================================
-- WHY: S454 diffed the app's Apocrypha (parsed/apocrypha.json = live DB) against the
-- KJV 1611 Apocrypha VERSE BY VERSE, BY CONTENT (source-texts/apocrypha-kjv-ebible/,
-- 14 books / 5,720 verses from the local eBible eng-kjv_usfx.xml). THE TEXT IS
-- FAITHFUL: 5,710 of 5,720 match 1:1, 0 changed, 0 missing, 0 extra. Four defects:
--   1. The Rest of Esther 10: KJV 10:4-13 sat in ONE row numbered 1 with the digits
--      inline. That row keeps its id and becomes v.4; vv.5-13 are inserted.
--   2. The Rest of Esther 11:1 and 13:7 ended with a 1611 marginal note printed
--      inside the verse ("[PLACED IN THE GREEK ...]") — removed from the text.
--   3. 2 Esdras 14:48 ended with a stray chapter-rule glyph — removed.
--   4. 1 Maccabees 5:35 "and and burnt" — doubled word removed.
-- Table: source-texts/apocrypha-kjv-ebible/apocrypha-damage-table.md
-- Source of truth: source-texts/parsed/apocrypha.json (S454).
-- Rule 10 — ids preserved, rows updated in place. Cards on the old Esther 10:1 row
-- are moved by session454b_apocrypha_xref_sort.sql. Idempotent. Run:
--   python3 api/apply_migration.py data-schema/migrations/session454_apocrypha_fix.sql
-- =====================================================================
\\echo 'session454 — Apocrypha fix starting...'
BEGIN;

DO $before$
DECLARE n INT;
BEGIN
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND {E};
    RAISE NOTICE 'S454 BEFORE  Apocrypha verse rows: % (expect 5711)', n;
END $before$;

-- 1. Rest of Esther 10: the merged row (verse_number 1) keeps its id and becomes v.4
DO $ren$
DECLARE cid INT; n1 INT; n4 INT;
BEGIN
    SELECT c.id INTO cid FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'the-rest-of-esther'
      JOIN editions e ON e.id = b.edition_id AND {E} WHERE c.chapter_number = 10;
    IF cid IS NULL THEN RAISE EXCEPTION 'S454: Rest of Esther 10 not found'; END IF;
    SELECT count(*) INTO n1 FROM verses WHERE chapter_id = cid AND verse_number = 1;
    SELECT count(*) INTO n4 FROM verses WHERE chapter_id = cid AND verse_number = 4;
    IF n1 = 1 AND n4 = 0 THEN
        UPDATE verses SET verse_number = 4, text = {esc(txt('the-rest-of-esther',10,4))} WHERE chapter_id = cid AND verse_number = 1;
        RAISE NOTICE 'S454 Rest of Esther 10:1 (merged row) renumbered to 10:4, id kept';
    ELSIF n1 = 0 AND n4 = 1 THEN
        RAISE NOTICE 'S454 Rest of Esther 10:4 already in place (re-run)';
    ELSE
        RAISE EXCEPTION 'S454: unexpected Rest of Esther 10 state: v1 rows=%, v4 rows=%', n1, n4;
    END IF;
END $ren$;

-- 2. The other 13 rows: upsert by (chapter, verse)
CREATE TEMP TABLE _s454_verses (bk TEXT, ch INT, vn INT, txt TEXT, PRIMARY KEY (bk, ch, vn)) ON COMMIT DROP;
INSERT INTO _s454_verses (bk, ch, vn, txt) VALUES
{ROWS};

INSERT INTO verses (chapter_id, verse_number, text)
SELECT c.id, s.vn, s.txt FROM _s454_verses s
  JOIN books b ON b.slug = s.bk JOIN editions e ON e.id = b.edition_id AND {E}
  JOIN chapters c ON c.book_id = b.id AND c.chapter_number = s.ch
ON CONFLICT (chapter_id, verse_number) DO UPDATE SET text = EXCLUDED.text WHERE verses.text IS DISTINCT FROM EXCLUDED.text;

-- 3. search_vocabulary — additive
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v JOIN chapters c ON c.id = v.chapter_id
              JOIN books b ON b.id = c.book_id AND b.slug = 'the-rest-of-esther'
              JOIN editions e ON e.id = b.edition_id AND {E} $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END $vocab$;

-- 4. Verify
DO $verify$
DECLARE missing INT; wrong INT; n INT; n10 INT;
BEGIN
    SELECT count(*) INTO missing FROM _s454_verses s WHERE NOT EXISTS (
        SELECT 1 FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = s.ch
          JOIN books b ON b.id = c.book_id AND b.slug = s.bk JOIN editions e ON e.id = b.edition_id AND {E}
         WHERE v.verse_number = s.vn AND v.text = s.txt);
    SELECT count(*) INTO n10 FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 10
      JOIN books b ON b.id = c.book_id AND b.slug = 'the-rest-of-esther' JOIN editions e ON e.id = b.edition_id AND {E};
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND {E};
    IF missing <> 0 OR n10 <> 10 OR n <> 5720 THEN
        RAISE EXCEPTION 'S454: fix incomplete — rows missing/wrong text=%, Esther 10 rows=% (expect 10), Apocrypha rows=% (expect 5720)', missing, n10, n;
    END IF;
    RAISE NOTICE 'S454 AFTER   Apocrypha verse rows: % (expect 5720); Rest of Esther 10 has vv.4-13; all 14 edited rows carry the new text', n;
END $verify$;
COMMIT;
\\echo 'session454 — Apocrypha fix done.'
"""
open('../../data-schema/migrations/session454_apocrypha_fix.sql','w',encoding='utf-8').write(sql)
# ---- 454b cards + anchors
cm=json.load(open('apoc-card-moves.json'))
mv=[f"    ('{m['tb']}', {m['tc']}, {m['tv']}, {m['new_v']}, {esc(m['how'])})" for m in cm['moves']]
an=[f"    ('{s}', {a}, {b})" for s,(a,b) in cm['anchors'].items()]; MV=',\n'.join(mv); AN=',\n'.join(an)
sql_b=f"""-- =====================================================================
-- Session 454b migration — 2026-10-17
-- Rest of Esther 10 cross-reference cards: move each card to the verse it describes
-- =====================================================================
-- Until S454 the app's Rest of Esther 10 was ONE row (old 10:1 = KJV 10:4-13; now 10:4).
-- Its 12 session253 cards and 4 threads sit on that row. Each card's note names the
-- verse it is written on ("The Rest of Esther 10:N") — the card moves there (report:
-- source-texts/apocrypha-kjv-ebible/apoc-card-sort-report.md). Thread anchors are set to
-- the span of their members. Skips a move if a card already sits on the destination pair.
-- Idempotent. Run AFTER session454_apocrypha_fix.sql:
--   python3 api/apply_migration.py data-schema/migrations/session454b_apocrypha_xref_sort.sql
-- =====================================================================
\\echo 'session454b — Rest of Esther 10 xref sort starting...'
BEGIN;
CREATE TEMP TABLE _s454b_mv (obook TEXT, oc INT, ov INT, nv INT, how TEXT) ON COMMIT DROP;
INSERT INTO _s454b_mv VALUES
{MV};
CREATE TEMP TABLE _s454b_an (slug TEXT, va INT, vb INT) ON COMMIT DROP;
INSERT INTO _s454b_an VALUES
{AN};
CREATE TEMP VIEW _s454b_v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $sort$
DECLARE m RECORD; a RECORD; xid INT; nid INT; aid INT; bid INT; dup INT; moved INT := 0; skipped INT := 0; absent INT := 0; left_ INT;
BEGIN
  FOR m IN SELECT * FROM _s454b_mv ORDER BY nv LOOP
    SELECT id INTO nid FROM _s454b_v WHERE es='apocrypha' AND bs='the-rest-of-esther' AND ch=10 AND vn=m.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S454b: destination Rest of Esther 10:% missing — run session454_apocrypha_fix.sql first', m.nv; END IF;
    SELECT x.id INTO xid FROM cross_references x
      JOIN _s454b_v s ON s.id=x.source_verse_id AND s.es='apocrypha' AND s.bs='the-rest-of-esther' AND s.ch=10 AND s.vn=4
      JOIN _s454b_v t ON t.id=x.target_verse_id AND t.es='canon' AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov LIMIT 1;
    IF xid IS NULL THEN absent := absent + 1; RAISE NOTICE 'S454b not found (already moved, or edited): Rest of Esther 10:4 -> % %:%', m.obook, m.oc, m.ov; CONTINUE; END IF;
    SELECT count(*) INTO dup FROM cross_references x JOIN _s454b_v t ON t.id=x.target_verse_id AND t.es='canon' AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov
     WHERE x.source_verse_id = nid AND x.id <> xid;
    IF dup > 0 THEN skipped := skipped + 1; RAISE NOTICE 'S454b SKIPPED card %: a card already sits on 10:% -> % %:%', xid, m.nv, m.obook, m.oc, m.ov; CONTINUE; END IF;
    UPDATE cross_references SET source_verse_id = nid WHERE id = xid;
    moved := moved + 1;
    RAISE NOTICE 'S454b moved card %: Rest of Esther 10:4 -> 10:%  (target % %:%)  [%]', xid, m.nv, m.obook, m.oc, m.ov, m.how;
  END LOOP;
  FOR a IN SELECT * FROM _s454b_an LOOP
    SELECT id INTO aid FROM _s454b_v WHERE es='apocrypha' AND bs='the-rest-of-esther' AND ch=10 AND vn=a.va;
    SELECT id INTO bid FROM _s454b_v WHERE es='apocrypha' AND bs='the-rest-of-esther' AND ch=10 AND vn=a.vb;
    UPDATE cross_reference_threads SET anchor_verse_id_start = aid, anchor_verse_id_end = bid WHERE slug = a.slug;
    IF FOUND THEN RAISE NOTICE 'S454b thread % anchored 10:%–10:%', a.slug, a.va, a.vb; ELSE RAISE NOTICE 'S454b thread % NOT FOUND', a.slug; END IF;
  END LOOP;
  SELECT count(*) INTO left_ FROM cross_references x JOIN _s454b_v s ON s.id=x.source_verse_id AND s.es='apocrypha' AND s.bs='the-rest-of-esther' AND s.ch=10 AND s.vn=4;
  RAISE NOTICE 'S454b cards moved: %, skipped: %, not found: %; cards still on Rest of Esther 10:4: % (expect 0 — any left is from a later session, sort by hand)', moved, skipped, absent, left_;
END $sort$;
COMMIT;
\\echo 'session454b — done.'
"""
open('../../data-schema/migrations/session454b_apocrypha_xref_sort.sql','w',encoding='utf-8').write(sql_b)
print('fix',len(sql),'bytes,',len(rows),'upsert rows; sort',len(sql_b),'bytes,',len(mv),'moves,',len(an),'anchors')
