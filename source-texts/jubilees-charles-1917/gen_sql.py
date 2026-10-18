import json
d=json.load(open('jubilees.fixed.json')); chs=d['books'][0]['chapters']
ch_json=json.load(open('jubilees-changed-verses.json'))
def esc(s): return "E'"+s.replace('\\','\\\\').replace("'","\\'")+"'"
vals=[]; maxes=[]
for c in chs:
    n=int(c['number']); maxes.append((n,max(v['number'] for v in c['verses'])))
    for v in c['verses']: vals.append("    (%d, %d, %s)"%(n,v['number'],esc(v['text'])))
total=len(vals); assert total==1307
E="e.slug = 'jubilees'"; Bk="b.slug = 'jubilees'"
sql=f"""-- =====================================================================
-- Session 453 migration — 2026-10-17
-- Jubilees: text audit against Charles 1917 (sacred-texts), by content, S453
-- =====================================================================
-- Edition: editions.slug='jubilees' -> books.slug='jubilees' -> chapters 1-50.
--
-- WHY: S453 diffed the app's Jubilees (parsed/jubilees.json = live DB) against a
-- clean Charles base VERSE BY VERSE, BY CONTENT (source-texts/jubilees-charles-1917/:
-- SPCK 1917 via sacred-texts, 50 chapters / 1,307 verses; the 1902 OCR as second
-- witness). THE TEXT IS FAITHFUL: nothing invented, nothing missing. But 243 rows
-- each held 2-3 verses run together (the source's dropped verse markers) — 276
-- verses had no row of their own. Verse NUMBERS were already Charles's (the row
-- after 1:5 is 1:7), so no row changes number. Also removed: 24 stray footnote
-- digits the text had inherited ("Mastêmâ 1 came", "sheep 4 and asses"), two
-- mis-numbered markers (3:23 printed "32.", 25:10 printed "19."), and the 17:2/17:3
-- split moved to where Charles has it. Full table + split report:
-- source-texts/jubilees-charles-1917/jubilees-damage-table.md, split-report.md.
--
-- Source of truth: source-texts/parsed/jubilees.json (S453) = the fixed
-- existing-restored-editions/Jubilees-Restored-Names-Edition.txt.
--
-- WHAT IT DOES (Rule 10 — ids preserved, rows updated in place):
--   1. UPSERT verses (chapter_id, verse_number): {len(ch_json['changed'])} existing rows get their
--      first-piece text (text differs); {len(ch_json['inserted'])} missing rows INSERTed; the other
--      789 rows untouched. Highlights/notes/cards on existing rows keep their row.
--   2. Surplus rows: none expected; checked anyway (deleted only if unreferenced).
--   3. search_vocabulary: additive.
--   4. Verify: all 1307 rows present with the new text, else EXCEPTION.
-- Cards that describe a verse now split out of its old row are moved by
-- session453b_jubilees_xref_sort.sql (assignment by reading the note's quotation).
-- Commentary (chapter_intro) is NOT changed (it already cites Charles's numbers).
-- Idempotent. Run:
--   python3 api/apply_migration.py data-schema/migrations/session453_jubilees_fix.sql
-- =====================================================================
\\echo 'session453 — Jubilees split-verse fix starting...'
BEGIN;

CREATE TEMP TABLE _s453_verses (ch INT, vn INT, txt TEXT, PRIMARY KEY (ch, vn)) ON COMMIT DROP;
INSERT INTO _s453_verses (ch, vn, txt) VALUES
{',\n'.join(vals)};

CREATE TEMP TABLE _s453_max (ch INT PRIMARY KEY, hi INT) ON COMMIT DROP;
INSERT INTO _s453_max (ch, hi) VALUES {', '.join('(%d,%d)'%m for m in maxes)};

DO $before$
DECLARE n INT;
BEGIN
    SELECT count(v.id) INTO n FROM verses v
      JOIN chapters c ON c.id = v.chapter_id
      JOIN books    b ON b.id = c.book_id    AND {Bk}
      JOIN editions e ON e.id = b.edition_id AND {E};
    RAISE NOTICE 'S453 BEFORE  Jubilees verse rows: % (expect 1031)', n;
END
$before$;

-- 1. Verses: update in place / insert missing
INSERT INTO verses (chapter_id, verse_number, text)
SELECT c.id, s.vn, s.txt
  FROM _s453_verses s
  JOIN chapters c ON c.chapter_number = s.ch
  JOIN books    b ON b.id = c.book_id    AND {Bk}
  JOIN editions e ON e.id = b.edition_id AND {E}
ON CONFLICT (chapter_id, verse_number)
DO UPDATE SET text = EXCLUDED.text
      WHERE verses.text IS DISTINCT FROM EXCLUDED.text;

-- 2. Surplus rows: delete only if nothing references them
DO $surplus$
DECLARE r RECORD; fk RECORD; hit BOOLEAN; refs TEXT; ndel INT := 0; nkept INT := 0;
BEGIN
    FOR r IN
        SELECT v.id, c.chapter_number AS ch, v.verse_number AS vn, left(v.text, 60) AS t
          FROM verses v
          JOIN chapters c ON c.id = v.chapter_id
          JOIN books    b ON b.id = c.book_id    AND {Bk}
          JOIN editions e ON e.id = b.edition_id AND {E}
          JOIN _s453_max m ON m.ch = c.chapter_number
         WHERE v.verse_number > m.hi
         ORDER BY c.chapter_number, v.verse_number
    LOOP
        refs := '';
        FOR fk IN
            SELECT cl.relname AS tbl, a.attname AS col
              FROM pg_constraint con
              JOIN pg_class cl     ON cl.oid = con.conrelid
              JOIN pg_namespace ns ON ns.oid = cl.relnamespace
              JOIN pg_attribute a  ON a.attrelid = con.conrelid AND a.attnum = con.conkey[1]
             WHERE con.contype = 'f' AND con.confrelid = 'verses'::regclass AND ns.nspname NOT LIKE 'pg_temp%'
        LOOP
            EXECUTE format('SELECT EXISTS (SELECT 1 FROM %I WHERE %I = $1)', fk.tbl, fk.col) INTO hit USING r.id;
            IF hit THEN refs := refs || fk.tbl || '.' || fk.col || ' '; END IF;
        END LOOP;
        IF refs = '' THEN DELETE FROM verses WHERE id = r.id; ndel := ndel + 1;
        ELSE nkept := nkept + 1; RAISE NOTICE 'S453 KEPT surplus Jubilees %:% (id %) — referenced by: %  "%"', r.ch, r.vn, r.id, refs, r.t;
        END IF;
    END LOOP;
    RAISE NOTICE 'S453 surplus rows deleted: %, kept (referenced): %', ndel, nkept;
END
$surplus$;

-- 3. search_vocabulary — additive
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v
              JOIN chapters c ON c.id = v.chapter_id
              JOIN books    b ON b.id = c.book_id    AND {Bk}
              JOIN editions e ON e.id = b.edition_id AND {E}
        $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END
$vocab$;

-- 4. Verify
DO $verify$
DECLARE missing INT; wrong INT; n INT; r RECORD;
BEGIN
    SELECT count(*) INTO missing FROM _s453_verses s
     WHERE NOT EXISTS (SELECT 1 FROM verses v
          JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = s.ch
          JOIN books    b ON b.id = c.book_id    AND {Bk}
          JOIN editions e ON e.id = b.edition_id AND {E}
         WHERE v.verse_number = s.vn);
    SELECT count(*) INTO wrong FROM _s453_verses s
      JOIN chapters c ON c.chapter_number = s.ch
      JOIN books    b ON b.id = c.book_id    AND {Bk}
      JOIN editions e ON e.id = b.edition_id AND {E}
      JOIN verses   v ON v.chapter_id = c.id AND v.verse_number = s.vn
     WHERE v.text IS DISTINCT FROM s.txt;
    IF missing <> 0 OR wrong <> 0 THEN
        RAISE EXCEPTION 'S453: Jubilees fix incomplete — missing=%, wrong text=%', missing, wrong;
    END IF;
    SELECT count(v.id) INTO n FROM verses v
      JOIN chapters c ON c.id = v.chapter_id
      JOIN books    b ON b.id = c.book_id    AND {Bk}
      JOIN editions e ON e.id = b.edition_id AND {E};
    RAISE NOTICE 'S453 AFTER   all 1307 Charles verses present with the new text; Jubilees verse rows now: % (expect 1307)', n;
    FOR r IN
        SELECT c.chapter_number AS ch, count(v.id) AS n, m.hi
          FROM chapters c
          JOIN books    b ON b.id = c.book_id    AND {Bk}
          JOIN editions e ON e.id = b.edition_id AND {E}
          JOIN _s453_max m ON m.ch = c.chapter_number
          LEFT JOIN verses v ON v.chapter_id = c.id
         GROUP BY c.chapter_number, m.hi HAVING count(v.id) <> m.hi ORDER BY 1
    LOOP
        RAISE NOTICE 'S453 AFTER   Jubilees %: % rows but Charles has %', r.ch, r.n, r.hi;
    END LOOP;
END
$verify$;

COMMIT;
\\echo 'session453 — Jubilees fix done.'
"""
open('session453_jubilees_fix.sql','w',encoding='utf-8').write(sql)
# ---- 453b: card moves
moves=json.load(open('jub-card-moves.json'))
rows=[]
for m in moves:
    oe,ob,oc,ov=('jubilees','jubilees',m['ch'],m['old_v'])
    tb,tc,tv=m['other']
    # other side's edition slug: canon books live in edition 'canon'; others = book slug (jubilees/enoch/jasher...) — resolve by book slug only
    rows.append("    ('%s', %d, %d, '%s', %d, %d, %d, %s)"%(m['side'],m['ch'],m['old_v'],tb,tc,tv,m['new_v'],esc(m['how'])))
sql_b=f"""-- =====================================================================
-- Session 453b migration — 2026-10-17
-- Jubilees cross-reference cards: move each card to the verse it quotes
-- =====================================================================
-- Context: until S453 the app's Jubilees had 243 rows each holding 2-3 verses.
-- Cards written on (or pointing at) such a row and quoting a verse that is now
-- its own row are moved there. Assignment is by READING: the card note's own
-- italic quotation is matched against the Charles verses of that chapter
-- (source-texts/jubilees-charles-1917/card_sort.py; report jub-card-sort-report.md).
-- side 's' = the card's SOURCE is the Jubilees verse; 't' = its TARGET is.
-- A move is SKIPPED (and reported) if a card already sits on the destination
-- pair. Not-found moves (card edited since the local copy) are reported.
-- Idempotent. Run AFTER session453_jubilees_fix.sql:
--   python3 api/apply_migration.py data-schema/migrations/session453b_jubilees_xref_sort.sql
-- =====================================================================
\\echo 'session453b — Jubilees xref sort starting...'
BEGIN;
CREATE TEMP TABLE _s453b_mv (side TEXT, jc INT, jv INT, obook TEXT, oc INT, ov INT, nv INT, how TEXT) ON COMMIT DROP;
INSERT INTO _s453b_mv VALUES
{',\n'.join(rows)};

CREATE TEMP VIEW _s453b_v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $sort$
DECLARE m RECORD; xid INT; nid INT; dup INT; moved INT := 0; skipped INT := 0; absent INT := 0;
BEGIN
  FOR m IN SELECT * FROM _s453b_mv ORDER BY jc, jv, nv LOOP
    SELECT id INTO nid FROM _s453b_v WHERE es='jubilees' AND bs='jubilees' AND ch=m.jc AND vn=m.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S453b: destination Jubilees %:% missing — run session453_jubilees_fix.sql first', m.jc, m.nv; END IF;
    IF m.side = 's' THEN
      SELECT x.id INTO xid FROM cross_references x
        JOIN _s453b_v s ON s.id=x.source_verse_id AND s.es='jubilees' AND s.bs='jubilees' AND s.ch=m.jc AND s.vn=m.jv
        JOIN _s453b_v t ON t.id=x.target_verse_id AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov
       LIMIT 1;
    ELSE
      SELECT x.id INTO xid FROM cross_references x
        JOIN _s453b_v t ON t.id=x.target_verse_id AND t.es='jubilees' AND t.bs='jubilees' AND t.ch=m.jc AND t.vn=m.jv
        JOIN _s453b_v s ON s.id=x.source_verse_id AND s.bs=m.obook AND s.ch=m.oc AND s.vn=m.ov
       LIMIT 1;
    END IF;
    IF xid IS NULL THEN
      absent := absent + 1;
      RAISE NOTICE 'S453b not found (edited since, or never seeded): side % Jubilees %:% <-> % %:%', m.side, m.jc, m.jv, m.obook, m.oc, m.ov;
      CONTINUE;
    END IF;
    IF m.side = 's' THEN
      SELECT count(*) INTO dup FROM cross_references x JOIN _s453b_v t ON t.id=x.target_verse_id AND t.bs=m.obook AND t.ch=m.oc AND t.vn=m.ov
       WHERE x.source_verse_id = nid AND x.id <> xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x JOIN _s453b_v s ON s.id=x.source_verse_id AND s.bs=m.obook AND s.ch=m.oc AND s.vn=m.ov
       WHERE x.target_verse_id = nid AND x.id <> xid;
    END IF;
    IF dup > 0 THEN
      skipped := skipped + 1;
      RAISE NOTICE 'S453b SKIPPED card % (Jubilees %:% -> %:%, other end % %:%): a card already sits there', xid, m.jc, m.jv, m.jc, m.nv, m.obook, m.oc, m.ov;
      CONTINUE;
    END IF;
    IF m.side = 's' THEN
      UPDATE cross_references SET source_verse_id = nid,
             note = regexp_replace(coalesce(note,''), 'Jubilees ' || m.jc || ':' || m.jv || '(?!\\d)', 'Jubilees ' || m.jc || ':' || m.nv, 'g')
       WHERE id = xid;
    ELSE
      UPDATE cross_references SET target_verse_id = nid,
             note = regexp_replace(coalesce(note,''), 'Jubilees ' || m.jc || ':' || m.jv || '(?!\\d)', 'Jubilees ' || m.jc || ':' || m.nv, 'g')
       WHERE id = xid;
    END IF;
    moved := moved + 1;
    RAISE NOTICE 'S453b moved card % (%): Jubilees %:% -> %:%  other end % %:%  [%]', xid, m.side, m.jc, m.jv, m.jc, m.nv, m.obook, m.oc, m.ov, m.how;
  END LOOP;
  RAISE NOTICE 'S453b cards moved: %, skipped (duplicate at destination): %, not found: %', moved, skipped, absent;
END $sort$;
COMMIT;
\\echo 'session453b — done.'
"""
open('session453b_jubilees_xref_sort.sql','w',encoding='utf-8').write(sql_b)
print('fix sql',len(sql),'bytes; sort sql',len(sql_b),'bytes;',len(rows),'moves')
