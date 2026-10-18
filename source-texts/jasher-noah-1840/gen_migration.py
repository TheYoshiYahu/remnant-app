#!/usr/bin/env python3
"""S450 — generate data-schema/migrations/session450_jasher_fix.sql from
jasher-noah-1840/jasher.fixed.json (or parsed/jasher.json once it is landed).
Same shape as S449's Enoch migration (Rule 10: in place, ids kept), plus a
chapter-title update for the 34 titles the old parse truncated."""
import json, sys
from pathlib import Path
HERE=Path(__file__).parent; APP=HERE.resolve().parents[1]
src=Path(sys.argv[1]) if len(sys.argv)>1 else HERE/'jasher.fixed.json'
d=json.load(open(src,encoding='utf-8'))
chs=d['books'][0]['chapters']
def esc(s): return "E'"+s.replace('\\','\\\\').replace("'","\\'")+"'"
vals=[]; maxes=[]; titles=[]
for c in chs:
    n=int(c['number']); maxes.append((n,max(int(v['number']) for v in c['verses'])))
    titles.append("    (%d, %s)"%(n,esc(c['title'])))
    for v in c['verses']: vals.append("    (%d, %d, %s)"%(n,int(v['number']),esc(v['text'])))
total=len(vals)
tpl=open(HERE/'migration_template.sql',encoding='utf-8').read()
# retarget the S449 Enoch template at Jasher
tpl=tpl.replace("b.slug = '1-enoch'","b.slug = 'jasher'").replace("e.slug = 'enoch'","e.slug = 'jasher'")
tpl=tpl.replace("sb.slug = '1-enoch' OR tb.slug = '1-enoch'","sb.slug = 'jasher' OR tb.slug = 'jasher'")
tpl=tpl.replace('_s449_','_s450_').replace('S449','S450').replace('session449','session450').replace('Enoch','Jasher').replace('1 Enoch','Jasher').replace('Charles','Noah 1840')
head=tpl.split('\\echo')[0]
body=tpl[len(head):]
header="""-- =====================================================================
-- Session 450 migration — 2026-10-15
-- Jasher: text audit against Noah 1840 (sacred-texts), by content, S450
-- =====================================================================
-- Edition: editions.slug='jasher' -> books.slug='jasher' -> chapters 1-91.
--
-- WHY: S450 diffed the published Jasher Restored Names Edition against a
-- clean Noah 1840 base VERSE BY VERSE, BY CONTENT (source-texts/jasher-noah-1840/,
-- two pulls of sacred-texts six months apart, identical). The BOOK TEXT IS
-- FAITHFUL: all 3,910 verses match (nothing invented, nothing misplaced).
-- The APP was short 85 verses: printed page numbers glued to 7:18, 9:7 and
-- 20:13 made the parser swallow 7:19-51, 9:8-39 and 20:14-30 into those
-- three rows. Plus small slips (12:35 lost "and earth"; 47:5 / 78:10 my-your
-- swapped; "from from there" x6; "the El Shaddai" x3; 23:63 stray "the") and
-- 34 chapter titles truncated at the line wrap. Full table:
-- source-texts/jasher-noah-1840/jasher-damage-table.md + worddiff-txt.log.
--
-- Source of truth: source-texts/parsed/jasher.json (S450), re-parsed from the
-- fixed existing-restored-editions/Jasher-Restored-Names-Edition.txt.
--
-- WHAT IT DOES (ids preserved wherever a row already exists):
--   0. Chapter titles: the 34 truncated titles completed (chapters.chapter_title).
--   1. UPSERT verses (chapter_id, verse_number): existing rows updated IN
--      PLACE only where the text differs (13 rows + the 3 blob rows);
--      the 85 missing rows INSERTed. Everything else untouched.
--   2. Surplus rows: none expected (no chapter lost verses); checked anyway.
--   3. search_vocabulary: new lexemes added (additive only).
--   4. Verify: all 3910 rows present with the new text, else EXCEPTION.
--      Reports cross_references sourced on / targeting 7:18, 9:7, 20:13 —
--      cards on those three rows were written while the row held 34/33/18
--      verses of text, so each may belong to a later verse (card sort).
-- Commentary (chapter_intro) is NOT changed here (it was never wrong).
-- Idempotent. Run:
--   python3 api/apply_migration.py data-schema/migrations/session450_jasher_fix.sql
-- =====================================================================
"""
TITLES=',\n'.join(titles)
title_block=f"""
CREATE TEMP TABLE _s450_titles (ch INT PRIMARY KEY, title TEXT) ON COMMIT DROP;
INSERT INTO _s450_titles (ch, title) VALUES
{TITLES};

-- 0. Chapter titles (34 were cut at the line wrap by the old parse)
UPDATE chapters c SET chapter_title = t.title
  FROM _s450_titles t, books b, editions e
 WHERE c.chapter_number = t.ch AND b.id = c.book_id AND b.slug = 'jasher'
   AND e.id = b.edition_id AND e.slug = 'jasher'
   AND c.chapter_title IS DISTINCT FROM t.title;
"""
body=body.replace("CREATE TEMP TABLE _s450_max", title_block+"\nCREATE TEMP TABLE _s450_max",1)
# replace the S449 xref report (all Enoch cards) with the three-blob report
import re
body=re.sub(r"    SELECT count\(\*\) INTO n FROM cross_references x\n.*?END LOOP;\n", """    FOR r IN
        SELECT x.id, sb.slug AS sbook, sc.chapter_number AS sch, sv.verse_number AS svn,
               tb.slug AS tbook, tc.chapter_number AS tch, tv.verse_number AS tvn, left(coalesce(x.note,''),90) AS note
          FROM cross_references x
          JOIN verses sv ON sv.id = x.source_verse_id JOIN chapters sc ON sc.id = sv.chapter_id JOIN books sb ON sb.id = sc.book_id
          JOIN verses tv ON tv.id = x.target_verse_id JOIN chapters tc ON tc.id = tv.chapter_id JOIN books tb ON tb.id = tc.book_id
         WHERE (sb.slug = 'jasher' AND (sc.chapter_number, sv.verse_number) IN ((7,18),(9,7),(20,13)))
            OR (tb.slug = 'jasher' AND (tc.chapter_number, tv.verse_number) IN ((7,18),(9,7),(20,13)))
         ORDER BY sb.slug, sc.chapter_number, sv.verse_number
    LOOP
        RAISE NOTICE 'S450 XREF-ON-BLOB % %:%:% -> %:%:% | %', r.id, r.sbook, r.sch, r.svn, r.tbook, r.tch, r.tvn, r.note;
    END LOOP;
""", body, flags=re.S)
sql=header+body.replace('{{VALS}}',',\n'.join(vals)).replace('{{MAXES}}',', '.join('(%d,%d)'%(n,h) for n,h in maxes)).replace('{{TOTAL}}',str(total))
out=HERE/'session450_jasher_fix.sql'
out.write_text(sql,encoding='utf-8')
print("rows",total,"titles",len(titles),"bytes",len(sql),"->",out)
