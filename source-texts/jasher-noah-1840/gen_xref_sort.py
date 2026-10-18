#!/usr/bin/env python3
"""S450b — generate data-schema/migrations/session450b_jasher_xref_sort.sql.

The 21 session252 cards (and 7 thread anchors) that sit on Jasher 7:18, 9:7 and
20:13 were written while those rows held 34 / 33 / 18 verses of text each (the
app's parse had swallowed 7:19-51, 9:8-39, 20:14-30 into them). S450 restored
the verses; this moves every card to the verse it actually describes. The
assignment was made by READING the true verses against each note (the
word-overlap guess in jasher-xref-sort-plan.tsv was only a first pass):

  Gen 10:25 Peleg named for the dividing ........... 7:19   Jub 8:8 Peleg ..... 7:19
  Gen 10:32 the genealogy's dividing of nations .... 7:19   Deut 32:8 ........ 7:19
  Acts 17:26 bounds of the nations ................. 7:19
  Gen 10:8 Nimrod mighty in the earth .............. 7:30 (became strong, mighty hunter in the earth)
  Gen 10:10 Nimrod's city, Shinar .................. 7:43 (names the city Shinar)
  Micah 5:6 the land of Nimrod ..................... 7:44 (Nimrod dwelt in Shinar and reigned)
  Jub 10:19 city built at Shinar under Nimrod ...... 7:42 (advised with his counselors to build a city)
  Gen 11:1 one tongue under Nimrod ................. 7:46
  Gen 5:24 / Heb 11:5 Enoch taken up, garments ..... 7:25
  Gen 11:26 Terah seventy, begat Abram ............. 7:51   Josh 24:2 (ch 7) ... 7:51
  Josh 24:2 (ch 9) Terah first of the idol-servers . 9:7  (stays)
  Deut 4:19 / Jub 12:17 sun and moon are servants .. 9:19
  Gen 20:7 the angel who would slay the king ....... 20:14
  Gen 12:17 the Egypt precedent recalled ........... 20:21
  Gen 12:18 Abimelech calls Abraham to account ..... 20:24
  Gen 20:17 Abraham's prayer heals the land ........ 20:30
Thread anchors: peleg 7:19-22; nimrod-shinar 7:23-48; garments-enoch-terah-abram
7:24-51; 9 gods-of-wood-and-stone 9:6-10; 9 abram-reasons 9:11-19;
20 dream-angel 20:12-17; 20 pharaoh-precedent-and-healing 20:18-30.
Cards are found by (source verse, target verse) — the live ids are not known
here; anything else still sitting on a blob verse afterwards is reported.
"""
import re
from pathlib import Path
HERE = Path(__file__).parent; APP = HERE.resolve().parents[1]
MOVES = [  # (old c, old v, target "edition/book c:v", new c, new v)
    (7,18,'canon/genesis 10:25',7,19), (7,18,'canon/genesis 10:32',7,19), (7,18,'canon/deuteronomy 32:8',7,19),
    (7,18,'canon/acts 17:26',7,19), (7,18,'jubilees/jubilees 8:8',7,19),
    (7,18,'canon/genesis 10:8',7,30), (7,18,'canon/genesis 10:10',7,43), (7,18,'canon/genesis 11:1',7,46),
    (7,18,'canon/micah 5:6',7,44), (7,18,'jubilees/jubilees 10:19',7,42),
    (7,18,'canon/genesis 5:24',7,25), (7,18,'canon/hebrews 11:5',7,25),
    (7,18,'canon/genesis 11:26',7,51), (7,18,'canon/joshua 24:2',7,51),
    (9,7,'canon/deuteronomy 4:19',9,19), (9,7,'jubilees/jubilees 12:17',9,19),
    (20,13,'canon/genesis 20:7',20,14), (20,13,'canon/genesis 12:17',20,21),
    (20,13,'canon/genesis 12:18',20,24), (20,13,'canon/genesis 20:17',20,30),
]
THREADS = [  # slug, start c:v, end c:v
    ('jasher-7-peleg-the-earth-divided',7,19,7,22),
    ('jasher-7-nimrod-shinar-kingdom-of-man',7,23,7,48),
    ('jasher-7-garments-enoch-terah-abram',7,24,7,51),
    ('jasher-9-the-generation-serves-gods-of-wood-and-stone',9,6,9,10),
    ('jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator',9,11,9,19),
    ('jasher-20-dream-angel-drawn-sword',20,12,20,17),
    ('jasher-20-pharaoh-precedent-and-healing',20,18,20,30),
]
rows = []
for oc, ov, tgt, nc, nv in MOVES:
    ed_book, cv = tgt.split(' '); ed, book = ed_book.split('/'); tc, tv = map(int, cv.split(':'))
    rows.append(f"    ({oc},{ov},'{ed}','{book}',{tc},{tv},{nc},{nv})")
trs = [f"    ('{s}',{a},{b},{c},{d})" for s, a, b, c, d in THREADS]
sql = f"""-- =====================================================================
-- Session 450b migration — 2026-10-15
-- Jasher cross-reference cards on the three former blob verses: re-point
-- =====================================================================
-- Context: until S450 the app's Jasher 7:18, 9:7 and 20:13 each held a whole
-- run of verses (7:19-51, 9:8-39, 20:14-30 — 85 verses the parser had
-- swallowed). The session252 cards and thread anchors written on those rows
-- describe verses inside the run. S450 restored the verses; this moves each
-- card to the verse it actually describes (assignment by reading, listed in
-- source-texts/jasher-noah-1840/gen_xref_sort.py) and rewrites the note's
-- own "Jasher c:v" citation. Thread members follow their card automatically.
-- A move is SKIPPED (and reported) if a card already exists on the
-- destination pair. Afterwards every card still on 7:18 / 9:7 / 20:13 is
-- listed so nothing is lost silently. Idempotent.
-- Run AFTER session450_jasher_fix.sql:
--   python3 api/apply_migration.py data-schema/migrations/session450b_jasher_xref_sort.sql
-- =====================================================================
\\echo 'session450b — Jasher xref sort starting...'
BEGIN;
CREATE TEMP TABLE _s450b_mv (oc INT, ov INT, ted TEXT, tbook TEXT, tc INT, tv INT, nc INT, nv INT) ON COMMIT DROP;
INSERT INTO _s450b_mv VALUES
{',\n'.join(rows)};
CREATE TEMP TABLE _s450b_thr (slug TEXT, sc INT, sv INT, ec INT, ev INT) ON COMMIT DROP;
INSERT INTO _s450b_thr VALUES
{',\n'.join(trs)};

CREATE TEMP VIEW _s450b_v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $sort$
DECLARE m RECORD; xid INT; nid INT; dup INT; moved INT := 0; skipped INT := 0; absent INT := 0;
BEGIN
  FOR m IN SELECT * FROM _s450b_mv ORDER BY oc, ov, nc, nv LOOP
    SELECT x.id INTO xid FROM cross_references x
      JOIN _s450b_v s ON s.id=x.source_verse_id AND s.es='jasher' AND s.bs='jasher' AND s.ch=m.oc AND s.vn=m.ov
      JOIN _s450b_v t ON t.id=x.target_verse_id AND t.es=m.ted AND t.bs=m.tbook AND t.ch=m.tc AND t.vn=m.tv
     LIMIT 1;
    IF xid IS NULL THEN
      absent := absent + 1;
      RAISE NOTICE 'S450b not found (already moved, or never seeded): Jasher %:% -> %/% %:%', m.oc, m.ov, m.ted, m.tbook, m.tc, m.tv;
      CONTINUE;
    END IF;
    SELECT id INTO nid FROM _s450b_v WHERE es='jasher' AND bs='jasher' AND ch=m.nc AND vn=m.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S450b: destination Jasher %:% missing — run session450_jasher_fix.sql first', m.nc, m.nv; END IF;
    SELECT count(*) INTO dup FROM cross_references x
      JOIN _s450b_v t ON t.id=x.target_verse_id AND t.es=m.ted AND t.bs=m.tbook AND t.ch=m.tc AND t.vn=m.tv
     WHERE x.source_verse_id = nid AND x.id <> xid;
    IF dup > 0 THEN
      skipped := skipped + 1;
      RAISE NOTICE 'S450b SKIPPED card % (Jasher %:% -> %/% %:%): a card already sits on Jasher %:% for that target', xid, m.oc, m.ov, m.ted, m.tbook, m.tc, m.tv, m.nc, m.nv;
      CONTINUE;
    END IF;
    UPDATE cross_references
       SET source_verse_id = nid,
           note = regexp_replace(coalesce(note,''), 'Jasher ' || m.oc || ':' || m.ov || '(?!\\d)', 'Jasher ' || m.nc || ':' || m.nv, 'g')
     WHERE id = xid;
    moved := moved + 1;
    RAISE NOTICE 'S450b moved card %: Jasher %:% -> %:%  (target %/% %:%)', xid, m.oc, m.ov, m.nc, m.nv, m.ted, m.tbook, m.tc, m.tv;
  END LOOP;
  RAISE NOTICE 'S450b cards moved: %, skipped (duplicate at destination): %, not found: %', moved, skipped, absent;
END $sort$;

-- thread anchors
UPDATE cross_reference_threads t
   SET anchor_verse_id_start = s.id, anchor_verse_id_end = e.id
  FROM _s450b_thr th
  JOIN _s450b_v s ON s.es='jasher' AND s.bs='jasher' AND s.ch=th.sc AND s.vn=th.sv
  JOIN _s450b_v e ON e.es='jasher' AND e.bs='jasher' AND e.ch=th.ec AND e.vn=th.ev
 WHERE t.slug = th.slug
   AND (t.anchor_verse_id_start IS DISTINCT FROM s.id OR t.anchor_verse_id_end IS DISTINCT FROM e.id);

DO $verify$ DECLARE r RECORD; n INT := 0; BEGIN
  FOR r IN
    SELECT x.id, s.ch sch, s.vn svn, t.es tes, t.bs tbs, t.ch tch, t.vn tvn, left(coalesce(x.note,''),100) note
      FROM cross_references x JOIN _s450b_v s ON s.id=x.source_verse_id JOIN _s450b_v t ON t.id=x.target_verse_id
     WHERE s.es='jasher' AND s.bs='jasher' AND (s.ch, s.vn) IN ((7,18),(9,7),(20,13))
     ORDER BY s.ch, s.vn, x.id
  LOOP
    n := n + 1;
    RAISE NOTICE 'S450b STILL ON BLOB card % Jasher %:% -> %/% %:% | %', r.id, r.sch, r.svn, r.tes, r.tbs, r.tch, r.tvn, r.note;
  END LOOP;
  RAISE NOTICE 'S450b cards still sourced on 7:18 / 9:7 / 20:13 (expected 1: Josh 24:2 on 9:7, plus any from later sessions): %', n;
  FOR r IN
    SELECT t.slug, s.ch sch, s.vn svn, e.ch ech, e.vn evn FROM cross_reference_threads t
      JOIN _s450b_thr th ON th.slug=t.slug
      JOIN _s450b_v s ON s.id=t.anchor_verse_id_start JOIN _s450b_v e ON e.id=t.anchor_verse_id_end
  LOOP
    RAISE NOTICE 'S450b thread % now anchored %:% -> %:%', r.slug, r.sch, r.svn, r.ech, r.evn;
  END LOOP;
END $verify$;
COMMIT;
\\echo 'session450b — done.'
"""
out = APP / 'data-schema/migrations/session450b_jasher_xref_sort.sql'
out.write_text(sql, encoding='utf-8')
print('wrote', out, len(sql), 'bytes')
