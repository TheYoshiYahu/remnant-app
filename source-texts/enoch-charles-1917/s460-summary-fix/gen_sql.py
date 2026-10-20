"""S460 — write data-schema/migrations/session460_enoch_summary_fix.sql from fix_summaries.json."""
import json, re, collections
from pathlib import Path as _P
HERE = str(_P(__file__).resolve().parent); HERE_UP = str(_P(HERE).parent)
from pathlib import Path
S = Path(HERE + '')
fix = json.load(open(S / 'fix_summaries.json'))
live = json.load(open(S / 'src/source-texts/enoch-charles-1917/enoch-cards-live.json'))
L = live['enoch_live']; threads = {t['id']: t for t in live['threads']}
CIT = re.compile(r"(?<![23] )(?:1 )?Enoch (\d+):(\d+)(?:[-–](\d+))?")

def q(s):
    assert '$n$' not in s; return '$n$' + s + '$n$'

rows = []; quoted = set(); n_title = 0
for i, x in sorted(((int(k), v) for k, v in fix.items())):
    old = threads[i]; new = x['summary_md']
    if new == old['summary_md'] and x['title'] == old['title']: continue
    if x['title'] != old['title']: n_title += 1
    rows.append(f"({i},{q(old['summary_md'])},{q(new)},{q(x['title'])})")
    for m in CIT.finditer(new):
        a = f"{m.group(1)}:{m.group(2)}"; quoted.add(a)
        if m.group(3): quoted.add(f"{m.group(1)}:{m.group(3)}")
erows = [f"({int(a.split(':')[0])},{int(a.split(':')[1])},{q(L[a])})" for a in sorted(quoted, key=lambda a: (int(a.split(':')[0]), int(a.split(':')[1])))]
acts = collections.Counter(x['action'] for x in fix.values())

sql = f"""-- =====================================================================
-- Session 460 migration — 2026-10-19
-- 1 Enoch thread-summary fix. Every live cross-reference thread summary
-- that quoted 1 Enoch words not on the live Charles 1917 text (S460 map:
-- source-texts/enoch-charles-1917/s460-summary-fix/summary-fidelity-map.md).
--   {len(rows)} thread summaries replaced ({acts['rewritten']} rewritten by hand, {acts['adjusted']} adjusted,
--       {acts['requoted']} re-quoted from the live verse with the thought unchanged);
--   {n_title} titles changed where the live chapter carries a different thought
--       than the invented verses did. Ids and slugs are never touched.
-- Safety: a thread is skipped (NOTICE) if its live summary is not the text
-- the fix was written against (edited since the Oct 20 00:01 read-back).
-- The migration RAISES if any 1 Enoch verse the new summaries quote
-- ({len(erows)} verses) is not the live text — the fix must not land on a text
-- that has changed. Idempotent: a re-run finds every summary already in
-- place and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/session460_enoch_summary_fix.sql
-- =====================================================================
\\echo 'session460 — 1 Enoch thread-summary fix starting...'
BEGIN;
CREATE TEMP TABLE _s460 (tid INT, old_summary TEXT, new_summary TEXT, new_title TEXT) ON COMMIT DROP;
INSERT INTO _s460 VALUES
{',\n'.join(rows)};
CREATE TEMP TABLE _s460e (ch INT, vn INT, live_text TEXT) ON COMMIT DROP;
INSERT INTO _s460e VALUES
{',\n'.join(erows)};

DO $fix$
DECLARE r RECORD; n_bad INT; n_updated INT := 0; n_already INT := 0; n_skipped INT := 0; n_absent INT := 0; n_titles INT := 0;
BEGIN
  -- 1. every quoted 1 Enoch verse must be the live text
  SELECT count(*) INTO n_bad FROM _s460e e
    LEFT JOIN (SELECT c.chapter_number ch, v.verse_number vn, v.text FROM verses v
               JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions ed ON ed.id=b.edition_id
               WHERE ed.slug='enoch' AND b.slug='1-enoch') lv ON lv.ch=e.ch AND lv.vn=e.vn
    WHERE lv.text IS NULL OR lv.text <> e.live_text;
  IF n_bad > 0 THEN
    RAISE EXCEPTION 'session460: % quoted 1 Enoch verse(s) differ from the live text the fix was written against — read the live text back and rebuild the fix', n_bad;
  END IF;
  -- 2. replace each summary where the live row still carries the text the fix was written against
  FOR r IN SELECT * FROM _s460 LOOP
    PERFORM 1 FROM cross_reference_threads WHERE id=r.tid;
    IF NOT FOUND THEN n_absent := n_absent + 1; RAISE NOTICE 'session460: thread % absent', r.tid; CONTINUE; END IF;
    PERFORM 1 FROM cross_reference_threads WHERE id=r.tid AND summary_md=r.new_summary AND title=r.new_title;
    IF FOUND THEN n_already := n_already + 1; CONTINUE; END IF;
    PERFORM 1 FROM cross_reference_threads WHERE id=r.tid AND summary_md=r.old_summary;
    IF NOT FOUND THEN n_skipped := n_skipped + 1; RAISE NOTICE 'session460: thread % SKIPPED — live summary is not the read-back text', r.tid; CONTINUE; END IF;
    PERFORM 1 FROM cross_reference_threads WHERE id=r.tid AND title<>r.new_title;
    IF FOUND THEN n_titles := n_titles + 1; END IF;
    UPDATE cross_reference_threads SET summary_md=r.new_summary, title=r.new_title WHERE id=r.tid;
    n_updated := n_updated + 1;
  END LOOP;
  RAISE NOTICE 'session460 summary: summaries updated %, titles changed %, already in place %, skipped %, absent %', n_updated, n_titles, n_already, n_skipped, n_absent;
  INSERT INTO schema_version (id, version, notes) VALUES (1, '1.0.0-phase4-session460',
    'Session 460 (2026-10-19) — 1 Enoch thread-summary fix: summaries updated ' || n_updated || ', titles changed ' || n_titles || ', already in place ' || n_already || ', skipped ' || n_skipped || ', absent ' || n_absent || '. Ids and slugs unchanged.')
  ON CONFLICT (id) DO UPDATE SET version = EXCLUDED.version, landed_at = now(), notes = EXCLUDED.notes;
END $fix$;

COMMIT;
\\echo 'session460 — done.'
"""
out = S / 'session460_enoch_summary_fix.sql'
out.write_text(sql)
print('rows', len(rows), 'titles changed', n_title, 'enoch verses guarded', len(erows), 'bytes', len(sql))
