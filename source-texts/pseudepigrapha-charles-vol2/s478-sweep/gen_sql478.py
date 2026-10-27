"""S478 — write ONE migration (edition `pseudepigrapha`, books adam-eve + 4-maccabees) from fix/fix_cards.json, fix/fix_members.json, fix/fix_summaries.json (+ the Oct 26 read-back):
  session478_pseudepigrapha_sweep.sql, session478_adam_eve_sweep.sql, session478_apocalypse_abraham_sweep.sql, session478_ascension_isaiah_sweep.sql
Addresses are 'ed|book|c:v'. Run from the s463e-sweep folder (reads in/pseud-cards-live.json). Output dir = argv[1] (default .)."""
import json, sys, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
OUTDIR = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE
cards = {int(k): v for k, v in json.load(open(HERE / 'fix' / 'fix_cards.json')).items()}
members = json.load(open(HERE / 'fix' / 'fix_members.json'))
summaries = json.load(open(HERE / 'fix' / 'fix_summaries.json'))
live = json.load(open(HERE / 'in' / 'pseud-cards-live.json')); L = live['live']
C = {c['id']: c for c in live['cards']}; T = {t['id']: t for t in live['threads']}
EDS = {'pseudepigrapha', 'adam-eve-conflict', 'apocalypse-of-abraham', 'ascension-isaiah'}
FILES = {'pseudepigrapha': 'session478_adam_eve_4macc_sweep.sql'}
TAG = {'pseudepigrapha': 's478'}

def q(s):
    assert '$n$' not in s
    return '$n$' + s + '$n$'
def addr(a):
    ed, b, cv = a.split('|'); c, v = cv.split(':'); return ed, b, int(c), int(v)
def card_ed(i):
    if i in cards: return cards[i]['old'].split('|')[0]
    c = C[i]; return c['s_ed'] if c['s_ed'] in EDS else c['t_ed']
def thread_ed(tid):
    t = T[tid]; return t['a_ed'] if t['a_ed'] in EDS else None

for ed, fname in FILES.items():
    tag = TAG[ed]
    rows = []; K = collections.Counter(); n_moves = 0
    for i, x in sorted(cards.items()):
        if x['old'].split('|')[0] != ed: continue
        oe, ob, oc, ov = addr(x['old']); ne, nb, nc, nv = addr(x['new']); assert oe == ne == ed
        rebuilt = x['kind'].startswith('PROSE')
        lv = L[x['new']]
        if rebuilt: assert lv in x['new_note'], (i, 'rebuilt note must quote the live verse verbatim')
        rows.append(f"({i},'{x['side']}','{ob}',{oc},{ov},'{nb}',{nc},{nv},{q(x['new_note'])},{q(lv)},{'true' if rebuilt else 'false'})")
        K[x['kind']] += 1
        if x['old'] != x['new']: n_moves += 1
    mrows = [f"({m['thread_id']},{m['xref_id']},{q(m['new'])})" for m in members if card_ed(m['xref_id']) == ed]
    srows = [f"({s['thread_id']},{q(s['old'])},{q(s['new'])})" for s in summaries]   # S478: every fixed summary (thread 413 is anchored in Matthew but cites 4 Maccabees)
    if not rows and not mrows and not srows: print(ed, 'nothing'); continue
    books = sorted({addr(x['old'])[1] for x in cards.values() if x['old'].split('|')[0] == ed})
    desc = (f"--   {K.get('PROSE',0)+K.get('PROSE_MOVE',0)} cards whose note carried degraded prose: rebuilt Come-and-See — full live verse in stand-alone italics, cited; the other verse the same (canon from parsed/canon.json); then prose;\n"
            f"--   {K.get('CANON_REQUOTE',0)} cards whose canon lead quotation was off parsed/canon.json: re-quoted verbatim, prose kept;\n"
            f"--   {K.get('PHRASE_PATCH',0)} cards whose prose carried hyphen-chains / 'substance' / an off quoted phrase: that sentence rewritten, all else kept; {K.get('ADDR_CITE_FIX',0)} cards whose prose cited the pre-merge verse numbering: re-cited to the merged numbering;\n"
            f"--   {n_moves} cards re-pointed to the verse their own words sit in (ids kept; 8 by two cold reads, 4 rebuilt cards by the quotation);\n"
            
            f"--   {len(mrows)} thread member notes ride along; {len(srows)} thread summaries fixed (old summary must match exactly or the row is skipped).")
    sql = f"""-- =====================================================================
-- Session 478 migration — 2026-10-27 — edition `{ed}` (books: {', '.join(books)}) — the sweep of the two books merged in S477
-- Charles adam-eve + 4 Maccabees card sweep (the S478 chain on the merged live text), one migration:
{desc}
-- Reads before this was written: the 9 neighbour-verse cards read cold by two Sonnet agents that never saw the build (9/9 agree: 8 move, 1 stays);
-- every rebuilt note, member note, patch and summary read cold against the voice skill by two Fable readers (17 findings, all applied).
-- Safety: a card is skipped (NOTICE) if its extra-book end is not at the expected address (edited since the Oct 26 read-back), if a card
-- already sits on the destination pair, or if the move would make source = target. RAISES if the live verse text differs from
-- the read-back, or if a rebuilt note does not carry the live verse verbatim.
-- Idempotent: a re-run finds every card already landed and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/{fname}
-- =====================================================================
\\echo 'session478 — adam-eve + 4 Maccabees sweep starting...'
BEGIN;
CREATE TEMP TABLE _{tag} (xid INT, side CHAR(1), ob TEXT, oc INT, ov INT, nb TEXT, nc INT, nv INT, new_note TEXT, live_text TEXT, quotes_live BOOLEAN) ON COMMIT DROP;
{('INSERT INTO _' + tag + ' VALUES' + chr(10)) if rows else ''}{(',' + chr(10)).join(rows)}{';' if rows else ''}
CREATE TEMP TABLE _{tag}m (thread_id INT, xid INT, new_note TEXT) ON COMMIT DROP;
{('INSERT INTO _' + tag + 'm VALUES' + chr(10)) if mrows else ''}{(',' + chr(10)).join(mrows)}{';' if mrows else ''}
CREATE TEMP TABLE _{tag}s (thread_id INT, old_summary TEXT, new_summary TEXT) ON COMMIT DROP;
{('INSERT INTO _' + tag + 's VALUES' + chr(10)) if srows else ''}{(',' + chr(10)).join(srows)}{';' if srows else ''}
CREATE OR REPLACE TEMP VIEW _{tag}v AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; pass INT; nid INT; dup INT;
        n_moved INT := 0; n_requoted INT := 0; n_same INT := 0; n_absent INT := 0; n_skipped INT := 0; n_mem INT := 0; n_sum INT := 0; n_sum_skip INT := 0;
BEGIN
  FOR pass IN 1..3 LOOP
  FOR r IN SELECT * FROM _{tag} ORDER BY xid LOOP
    IF r.side = 'T' THEN
      SELECT x.id, x.note, t.ch, t.vn, t.es, t.bs, x.source_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _{tag}v t ON t.id = x.target_verse_id WHERE x.id = r.xid;
    ELSE
      SELECT x.id, x.note, s.ch, s.vn, s.es, s.bs, x.target_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _{tag}v s ON s.id = x.source_verse_id WHERE x.id = r.xid;
    END IF;
    IF cur.id IS NULL THEN
      IF pass = 3 THEN n_absent := n_absent + 1; RAISE NOTICE 'S478 card % absent', r.xid; END IF; CONTINUE;
    END IF;
    IF cur.es <> '{ed}' OR cur.bs <> r.ob THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S478 card % extra end is %/% not {ed}/% — skipped', r.xid, cur.es, cur.bs, r.ob; END IF; CONTINUE;
    END IF;
    IF cur.bs = r.nb AND cur.ch = r.nc AND cur.vn = r.nv AND cur.note = r.new_note THEN
      IF pass = 1 THEN n_same := n_same + 1; END IF; CONTINUE;
    END IF;
    IF NOT (cur.ch = r.oc AND cur.vn = r.ov) AND NOT (cur.bs = r.nb AND cur.ch = r.nc AND cur.vn = r.nv) THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1;
      RAISE NOTICE 'S478 card % is at % %:%, expected %:% — edited since the read-back, skipped', r.xid, cur.bs, cur.ch, cur.vn, r.oc, r.ov; END IF; CONTINUE;
    END IF;
    SELECT id INTO nid FROM _{tag}v WHERE es = '{ed}' AND bs = r.nb AND ch = r.nc AND vn = r.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S478: live % %:% missing', r.nb, r.nc, r.nv; END IF;
    IF (SELECT text FROM _{tag}v WHERE id = nid) <> r.live_text THEN
      RAISE EXCEPTION 'S478: live % %:% text differs from the read-back the fix was written against — re-run the dump and rebuild', r.nb, r.nc, r.nv;
    END IF;
    IF r.quotes_live AND position(r.live_text IN r.new_note) = 0 THEN
      RAISE EXCEPTION 'S478: new note for card % does not quote the live % %:% verbatim', r.xid, r.nb, r.nc, r.nv;
    END IF;
    IF nid = cur.other_id THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S478 SKIPPED card % (-> % %:%): that is the card''s other verse', r.xid, r.nb, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN
      SELECT count(*) INTO dup FROM cross_references x WHERE x.source_verse_id = cur.other_id AND x.target_verse_id = nid AND x.id <> r.xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x WHERE x.target_verse_id = cur.other_id AND x.source_verse_id = nid AND x.id <> r.xid;
    END IF;
    IF dup > 0 THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S478 SKIPPED card % (-> % %:%): a card already sits on that pair', r.xid, r.nb, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN UPDATE cross_references SET target_verse_id = nid, note = r.new_note WHERE id = r.xid;
    ELSE UPDATE cross_references SET source_verse_id = nid, note = r.new_note WHERE id = r.xid; END IF;
    IF r.oc = r.nc AND r.ov = r.nv AND r.ob = r.nb THEN n_requoted := n_requoted + 1;
    ELSE n_moved := n_moved + 1; RAISE NOTICE 'S478 moved card %: % %:% -> %:% (%)', r.xid, r.nb, r.oc, r.ov, r.nc, r.nv, CASE WHEN r.side='T' THEN 'target' ELSE 'source' END; END IF;
  END LOOP;
  END LOOP;

  FOR r IN SELECT m.* FROM _{tag}m m LOOP
    UPDATE cross_reference_thread_members SET member_note = r.new_note
     WHERE thread_id = r.thread_id AND cross_reference_id = r.xid AND member_note IS DISTINCT FROM r.new_note;
    IF FOUND THEN n_mem := n_mem + 1; END IF;
  END LOOP;

  FOR r IN SELECT s.* FROM _{tag}s s LOOP
    UPDATE cross_reference_threads SET summary_md = r.new_summary WHERE id = r.thread_id AND summary_md = r.old_summary;
    IF FOUND THEN n_sum := n_sum + 1;
    ELSIF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE id = r.thread_id AND summary_md = r.new_summary) THEN
      n_sum_skip := n_sum_skip + 1; RAISE NOTICE 'S478 SKIPPED thread % summary: live text is neither the old nor the new', r.thread_id;
    END IF;
  END LOOP;

  RAISE NOTICE 'S478 ({ed}) summary: notes rewritten in place %, moved %, already landed %, skipped %, absent %; member notes updated %; summaries updated % (skipped %)',
    n_requoted, n_moved, n_same, n_skipped, n_absent, n_mem, n_sum, n_sum_skip;
  IF n_skipped + n_absent + n_sum_skip > 0 THEN RAISE NOTICE 'S478: read the SKIPPED/absent lines above — those rows still carry the old text'; END IF;
END $fix$;
COMMIT;
\\echo 'session478 — done.'
"""
    (OUTDIR / fname).write_text(sql)
    print(ed, '| cards', len(rows), 'moves', n_moves, dict(K), '| member rows', len(mrows), '| summaries', len(srows), '| bytes', len(sql), '->', OUTDIR / fname)
