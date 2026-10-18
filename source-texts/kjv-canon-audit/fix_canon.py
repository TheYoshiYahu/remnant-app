"""S456 — canon (KJV) fix, step C of the S455 audit. Every edit counted and asserted; re-runnable.
Run from this folder:  python3 fix_canon.py
  1. parsed/canon.json updated IN PLACE (backup canon.json.pre-s455b, written once):
       item 1  116 Psalm superscriptions (eBible <d>, kjv-canon.json titles) -> chapter 'title', names restored
       item 2  Psalm 119: the 21 stanza letters stripped from the END of vv.8,16,...,168; acrostic note -> ch.119 'title'
       item 3  14 Pauline subscriptions moved out of the last verse into the JSON 'footnote' (free text; nothing in the
               API/app reads footnotes and yoshi-fn ids only resolve inside restoration-pipeline/yoshi_overrides.py)
       item 4  Amos 3:7, 1 John 3:4-8, Psalm 81:3 KEPT (Yoshi's renderings) -> source_type yoshi-rendering
       item 5  Romans 15:30 echo -> (Lord Jesus Christ's)
  2. data-schema/migrations/session455b_canon_fix.sql generated. The LIVE canon text is the session-149 MODERNIZED register
     (canon.json is not), so the verse edits are SURGICAL (strip the tail / insert the one word) and the titles go through
     the same modernizer (restoration-pipeline/_session149_modernize_canon.py). Rule 10: ids kept, UPDATE in place, idempotent.
  3. canon-fix-report.md — every title (both registers), every stripped tail, every subscription, the flags.
"""
import json, re, copy, sys, importlib.util
from pathlib import Path
HERE = Path(__file__).resolve().parent
APP = HERE.parent.parent
CANON = APP / 'source-texts/parsed/canon.json'
BACKUP = CANON.with_name('canon.json.pre-s455b')
SQL_OUT = APP / 'data-schema/migrations/session455b_canon_fix.sql'

spec = importlib.util.spec_from_file_location('mod', APP / 'restoration-pipeline/_session149_modernize_canon.py')
mod = importlib.util.module_from_spec(spec); spec.loader.exec_module(mod)
modernize = mod.modernize_one

kjv = json.load(open(HERE / 'kjv-canon.json'))
KB = {b['app_book_id']: b for b in kjv['books']}
if not BACKUP.exists():
    BACKUP.write_bytes(CANON.read_bytes()); print('backup written:', BACKUP.name)
src = json.load(open(BACKUP))          # always start from the pre-fix text -> re-runnable, same result
d = copy.deepcopy(src)
B = {b['book_id']: b for b in d['books']}
def ch(bid, n): return next(c for c in B[bid]['chapters'] if c['number'] == n)
def verse(bid, c, v): return next(x for x in ch(bid, c)['verses'] if x['number'] == v)

report = ['# S456 canon fix — what changed (parsed/canon.json, backup .pre-s455b)\n']
sql_titles, sql_verses = [], []   # (chapter, title_modernized) / per-item SQL fragments

# ---- item 1: Psalm superscriptions -> chapter title, names restored -------------------------------------
def restore_names(t):
    t = re.sub(r'\b(?:the )?LORD\b', 'Yahuah (LORD)', t)          # one pass: "the LORD" and bare "LORD" alike
    t = re.sub(r'\bGod\b', 'Elohim (God)', t)
    t = re.sub(r'\bJudah\b', 'Yahudah (Judah)', t)
    assert not re.search(r'\b(LORD|God|Jesus|Christ|Israel|Judah)\b', re.sub(r'\((LORD|God|Judah)\)', '', t)), t
    assert '((' not in t and t.count('(') == t.count(')'), t
    return t
titles = KB['psalms']['titles']; assert len(titles) == 116
report.append('## Item 1 — 116 Psalm superscriptions -> chapter_title\n\n| Ps | title (canon.json, KJV register) | title (live, modernized) |\n|---|---|---|')
for n, t in sorted(titles.items(), key=lambda kv: int(kv[0])):
    n = int(n); c = ch('psalms', n)
    assert c['title'] == f'Chapter {n}', (n, c['title'])
    r = restore_names(t); c['title'] = r
    m = modernize(r); sql_titles.append((n, m))
    report.append(f'| {n} | {r} | {m if m != r else "(same)"} |')

# ---- item 2: Psalm 119 stanza letters ------------------------------------------------------------------
TAIL = re.compile(r'\s*[א-ת]\s+[A-Z]+\.$')
report.append('\n## Item 2 — Psalm 119: 21 stanza letters stripped from the end of vv.8,16,...,168\n')
c119 = ch('psalms', 119); letters = []; stripped = 0
for v in c119['verses']:
    m = TAIL.search(v['text'])
    if v['number'] % 8 == 0 and v['number'] < 176:
        assert m, (v['number'], v['text'][-30:])
        letters.append(m.group(0).strip()); v['text'] = v['text'][:m.start()].rstrip(); stripped += 1
        report.append(f'- 119:{v["number"]} — removed `{m.group(0).strip()}`')
    else:
        assert not m, (v['number'], v['text'][-30:])
assert stripped == 21 and len(letters) == 21
# the 22 letters: Aleph (absent in the app) + the 21 that were glued on
ACROSTIC = ('An acrostic of twenty-two stanzas, eight verses each, one for every letter of the Hebrew alphabet in order: '
            'א Aleph (1–8), ב Beth (9–16), ג Gimel (17–24), ד Daleth (25–32), ה He (33–40), ו Vau (41–48), ז Zain (49–56), '
            'ח Cheth (57–64), ט Teth (65–72), י Jod (73–80), כ Caph (81–88), ל Lamed (89–96), מ Mem (97–104), נ Nun (105–112), '
            'ס Samech (113–120), ע Ain (121–128), פ Pe (129–136), צ Tzaddi (137–144), ק Koph (145–152), ר Resh (153–160), '
            'ש Schin (161–168), ת Tau (169–176).')
# every glued letter name must appear in the note (KJV spellings), in order
names_in_note = re.findall(r'[א-ת] ([A-Z][a-z]+) \(', ACROSTIC)
assert [x.split()[1].rstrip('.').capitalize() for x in letters] == names_in_note[1:], (letters, names_in_note)
assert c119['title'] == 'Chapter 119'; c119['title'] = ACROSTIC; sql_titles.append((119, ACROSTIC))
report.append(f'- 119 chapter_title = acrostic note ({len(ACROSTIC)} chars)')

# ---- item 3: Pauline subscriptions -> footnote ----------------------------------------------------------
SUBS = [('romans',16,27),('1-corinthians',16,24),('2-corinthians',13,14),('galatians',6,18),('ephesians',6,24),('philippians',4,23),
        ('colossians',4,18),('1-thessalonians',5,28),('2-thessalonians',3,18),('1-timothy',6,21),('2-timothy',4,22),('titus',3,15),
        ('philemon',1,25),('hebrews',13,25)]
report.append('\n## Item 3 — 14 Pauline subscriptions out of the last verse (JSON footnote, free text)\n')
sub_rows = []
for bk, c, vn in SUBS:
    v = verse(bk, c, vn); t = v['text']
    assert t.count('Amen.') == 1 and KB[bk]['chapters'][str(c)][str(vn)].endswith('Amen.'), (bk, c, vn)
    cut = t.index('Amen.') + 5
    body, sub = t[:cut], t[cut:].strip()
    assert sub and sub[0].isupper() and len(sub.split()) >= 4, (bk, sub)
    # the kept body must equal the KJV verse once restored names are mapped back (same mapping diff_canon.py uses, in short)
    v['text'] = body; v['footnote'] = ((v.get('footnote') or '') + ' ' if v.get('footnote') else '') + 'KJV 1611 subscription: ' + sub
    opening = ' '.join(sub.split()[:4])
    sub_rows.append((bk, c, vn, opening)); report.append(f'- {bk} {c}:{vn} — `{sub}`')

# ---- item 4: Yoshi renderings kept, flagged -------------------------------------------------------------
KEEP = [('amos',3,7),('1-john',3,4),('1-john',3,5),('1-john',3,6),('1-john',3,7),('1-john',3,8),('psalms',81,3)]
report.append('\n## Item 4 — kept as Yoshi renderings (source_type yoshi-rendering; registered in restoration-pipeline/YOSHI_RENDERED_PASSAGES.md)\n')
for bk, c, vn in KEEP:
    v = verse(bk, c, vn); assert v['source_type'] == 'restored-names-kjv'; v['source_type'] = 'yoshi-rendering'
    report.append(f'- {bk} {c}:{vn} — {v["text"]}')

# ---- item 5: Romans 15:30 echo --------------------------------------------------------------------------
v = verse('romans', 15, 30)
OLD = "Lord Yahusha HaMashiach's (Jesus Christ’s)"; NEW = "Lord Yahusha HaMashiach's (Lord Jesus Christ’s)"
assert v['text'].count(OLD) == 1; v['text'] = v['text'].replace(OLD, NEW)
report.append(f'\n## Item 5 — Romans 15:30\n\n- {v["text"]}')

# ---- nothing else changed ---------------------------------------------------------------------------------
old = {(b['book_id'],c['number'],x['number']):(x['text'],x.get('footnote'),x['source_type']) for b in src['books'] for c in b['chapters'] for x in c['verses']}
new = {(b['book_id'],c['number'],x['number']):(x['text'],x.get('footnote'),x['source_type']) for b in d['books'] for c in b['chapters'] for x in c['verses']}
assert old.keys() == new.keys() and len(new) == 31102
diff = {k for k in new if new[k] != old[k]}
assert len(diff) == 21 + 14 + 7 + 1, len(diff)
told = {(b['book_id'],c['number']):c['title'] for b in src['books'] for c in b['chapters']}
tnew = {(b['book_id'],c['number']):c['title'] for b in d['books'] for c in b['chapters']}
assert sum(1 for k in tnew if tnew[k] != told[k]) == 117
s2, d2 = copy.deepcopy(src), copy.deepcopy(d)
for D in (s2, d2):
    for b in D['books']:
        for c in b['chapters']: c['verses'] = []; c['title'] = ''
assert json.dumps(s2, sort_keys=True) == json.dumps(d2, sort_keys=True), 'non-verse, non-title content changed!'
json.dump(d, open(CANON, 'w'), indent=1, ensure_ascii=False)
print(f'canon.json written in place: {len(diff)} verse rows changed (21 Ps119 + 14 subscriptions + 7 flags + Rom 15:30), 117 chapter titles; everything else identical')

# ---- SQL -------------------------------------------------------------------------------------------------
def E(s): return "E'" + s.replace('\\', '\\\\').replace("'", "\\'") + "'"
L = []
L.append(f"""-- =====================================================================
-- Session 455b migration — 2026-10-18 (built S456)
-- Canon (KJV edition): fix for the five presentation items the S455 content audit found
-- =====================================================================
-- WHY: S455 diffed the app's canon against eBible's KJV 1769 VERSE BY VERSE, BY CONTENT
-- (source-texts/kjv-canon-audit/): FAITHFUL — 31,102/31,102, 0 missing, 0 extra. Five items:
--   1. All 116 Psalm superscriptions were absent (the parse dropped eBible's <d>). They go into
--      chapters.chapter_title (the reader shows it as the italic subtitle; NOT chapter_intro, which
--      the app renders as the free commentary). Names restored; same modernized register as the body.
--   2. Psalm 119: the 21 stanza letters (ב BETH. ... ת TAU.) sat glued to the END of vv.8,16,...,168.
--      Stripped; the acrostic is named in ch.119's chapter_title instead.
--   3. The 14 Pauline subscriptions ("Written to the Romans from Corinthus...") sat inside the last verse
--      of 14 epistles. Cut after "Amen." (kept in parsed/canon.json footnote field only — no DB column).
--   4. Amos 3:7, 1 John 3:4-8, Psalm 81:3 are Yoshi's renderings — KEPT, not touched here.
--   5. Romans 15:30 echo: (Jesus Christ's) -> (Lord Jesus Christ's).
-- The live canon text is the session-149 MODERNIZED register, so verse edits are surgical pattern edits,
-- never whole-text replacements. Rule 10 — ids preserved, UPDATE in place, no verse numbers change, no card
-- moves. Idempotent. Table: source-texts/kjv-canon-audit/canon-damage-table.md; report: canon-fix-report.md.
-- Run:  python3 api/apply_migration.py data-schema/migrations/session455b_canon_fix.sql
-- =====================================================================
\\echo 'session455b — canon fix starting...'
BEGIN;

DO $before$
DECLARE n INT; t INT;
BEGIN
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon';
    SELECT count(*) INTO t FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' WHERE c.chapter_title IS DISTINCT FROM 'Chapter ' || c.chapter_number;
    RAISE NOTICE 'S455b BEFORE  canon verse rows: % (expect 31102); Psalm chapters already titled: % (0 first run, 117 re-run)', n, t;
END $before$;

-- 1 + 2. Psalm superscriptions + the Psalm 119 acrostic note -> chapters.chapter_title (116 + 1)
CREATE TEMP TABLE _s455b_titles (ch INT PRIMARY KEY, title TEXT NOT NULL) ON COMMIT DROP;
INSERT INTO _s455b_titles (ch, title) VALUES""")
L.append(',\n'.join(f"    ({n}, {E(t)})" for n, t in sorted(sql_titles)) + ';')
L.append("""UPDATE chapters c SET chapter_title = s.title
  FROM _s455b_titles s, books b, editions e
 WHERE c.book_id = b.id AND b.slug = 'psalms' AND e.id = b.edition_id AND e.slug = 'canon'
   AND c.chapter_number = s.ch AND c.chapter_title IS DISTINCT FROM s.title;

-- 2. Psalm 119: strip "<hebrew letter> NAME." from the end of vv.8,16,...,168 (register-agnostic)
DO $ps119$
DECLARE cid INT; n INT;
BEGIN
    SELECT c.id INTO cid FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
      JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' WHERE c.chapter_number = 119;
    IF cid IS NULL THEN RAISE EXCEPTION 'S455b: Psalm 119 not found'; END IF;
    UPDATE verses SET text = rtrim(regexp_replace(text, '\\s*[\\u05d0-\\u05ea]\\s+[A-Z]+\\.$', ''))
     WHERE chapter_id = cid AND verse_number % 8 = 0 AND verse_number < 176
       AND text ~ '\\s*[\\u05d0-\\u05ea]\\s+[A-Z]+\\.$';
    GET DIAGNOSTICS n = ROW_COUNT;
    RAISE NOTICE 'S455b Psalm 119: stanza letters stripped from % verses (21 first run, 0 re-run)', n;
END $ps119$;

-- 3. The 14 Pauline subscriptions: keep the verse up to and including "Amen."; the subscription must be
--    the text that follows (checked by its opening words) so an unexpected verse is never cut.
CREATE TEMP TABLE _s455b_subs (bk TEXT, ch INT, vn INT, opening TEXT, PRIMARY KEY (bk, ch, vn)) ON COMMIT DROP;
INSERT INTO _s455b_subs (bk, ch, vn, opening) VALUES""")
L.append(',\n'.join(f"    ({E(bk)}, {c}, {vn}, {E(op)})" for bk, c, vn, op in sub_rows) + ';')
L.append("""DO $subs$
DECLARE r RECORD; vid BIGINT; t TEXT; p INT; done INT := 0; already INT := 0;
BEGIN
    FOR r IN SELECT * FROM _s455b_subs LOOP
        SELECT v.id, v.text INTO vid, t FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = r.ch
          JOIN books b ON b.id = c.book_id AND b.slug = r.bk JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
         WHERE v.verse_number = r.vn;
        IF vid IS NULL THEN RAISE EXCEPTION 'S455b: % %:% not found', r.bk, r.ch, r.vn; END IF;
        p := position('Amen.' IN t);
        IF p = 0 THEN RAISE EXCEPTION 'S455b: % %:% has no "Amen." — not touched', r.bk, r.ch, r.vn; END IF;
        IF substr(t, p + 5) ~ ('^\\s*' || regexp_replace(r.opening, '([.^$*+?()\\[\\]{}|\\\\])', '\\\\\\1', 'g')) THEN
            UPDATE verses SET text = substr(t, 1, p + 4) WHERE id = vid; done := done + 1;
        ELSIF btrim(substr(t, p + 5)) = '' THEN
            already := already + 1;
        ELSE
            RAISE EXCEPTION 'S455b: % %:% — text after "Amen." is not the expected subscription: %', r.bk, r.ch, r.vn, substr(t, p + 5, 60);
        END IF;
    END LOOP;
    RAISE NOTICE 'S455b subscriptions cut: % (14 first run), already clean: %', done, already;
END $subs$;

-- 5. Romans 15:30 — the echo carries the title (apostrophe/quote characters matched loosely, kept as found)
DO $rom$
DECLARE n INT;
BEGIN
    UPDATE verses v SET text = regexp_replace(v.text, 'Lord Yahusha HaMashiach(.)s \\(Jesus Christ(.)s\\)', 'Lord Yahusha HaMashiach\\1s (Lord Jesus Christ\\2s)')
      FROM chapters c, books b, editions e
     WHERE v.chapter_id = c.id AND c.chapter_number = 15 AND v.verse_number = 30 AND c.book_id = b.id AND b.slug = 'romans'
       AND e.id = b.edition_id AND e.slug = 'canon' AND v.text ~ 'Lord Yahusha HaMashiach.s \\(Jesus Christ.s\\)';
    GET DIAGNOSTICS n = ROW_COUNT;
    RAISE NOTICE 'S455b Romans 15:30 echo fixed: % (1 first run, 0 re-run)', n;
END $rom$;

-- search_vocabulary — additive, Psalms only (the only book whose words could be new)
DO $vocab$
BEGIN
    IF to_regclass('public.search_vocabulary') IS NOT NULL THEN
        INSERT INTO search_vocabulary (lexeme, occurrences)
        SELECT word, ndoc FROM ts_stat($q$
            SELECT v.text_tsv FROM verses v JOIN chapters c ON c.id = v.chapter_id
              JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
              JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' AND c.chapter_number = 119 $q$)
        ON CONFLICT (lexeme) DO NOTHING;
    END IF;
END $vocab$;

-- Verify — by content
DO $verify$
DECLARE titles_wrong INT; letters_left INT; subs_left INT; rom INT; n INT;
BEGIN
    SELECT count(*) INTO titles_wrong FROM _s455b_titles s WHERE NOT EXISTS (
        SELECT 1 FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'psalms'
          JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon' WHERE c.chapter_number = s.ch AND c.chapter_title = s.title);
    SELECT count(*) INTO letters_left FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 119
      JOIN books b ON b.id = c.book_id AND b.slug = 'psalms' JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.text ~ '[\\u05d0-\\u05ea]\\s+[A-Z]+\\.$';
    SELECT count(*) INTO subs_left FROM _s455b_subs s JOIN books b ON b.slug = s.bk JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
      JOIN chapters c ON c.book_id = b.id AND c.chapter_number = s.ch JOIN verses v ON v.chapter_id = c.id AND v.verse_number = s.vn
     WHERE v.text NOT LIKE '%Amen.' OR v.text LIKE '%' || s.opening || '%';
    SELECT count(*) INTO rom FROM verses v JOIN chapters c ON c.id = v.chapter_id AND c.chapter_number = 15
      JOIN books b ON b.id = c.book_id AND b.slug = 'romans' JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon'
     WHERE v.verse_number = 30 AND v.text ~ '\\(Lord Jesus Christ.s\\)';
    SELECT count(v.id) INTO n FROM verses v JOIN chapters c ON c.id = v.chapter_id
      JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id AND e.slug = 'canon';
    IF titles_wrong <> 0 OR letters_left <> 0 OR subs_left <> 0 OR rom <> 1 OR n <> 31102 THEN
        RAISE EXCEPTION 'S455b: fix incomplete — titles wrong=%, Ps119 letters left=%, subscriptions left=%, Rom 15:30 ok=%, canon rows=% (expect 0,0,0,1,31102)',
            titles_wrong, letters_left, subs_left, rom, n;
    END IF;
    RAISE NOTICE 'S455b AFTER   117 Psalm titles in place; Psalm 119 clean; 14 epistles end at "Amen."; Romans 15:30 carries (Lord Jesus Christ''s); canon rows % (unchanged)', n;
END $verify$;

INSERT INTO schema_version (id, version, notes) VALUES (1, '1.0.0-phase4-session455b',
  'Session 455b (2026-10-18, built S456) — canon KJV presentation fix after the S455 content audit: 116 Psalm superscriptions + Psalm 119 acrostic note into chapter_title; Psalm 119 stanza letters stripped from 21 verses; 14 Pauline subscriptions cut from the last verse; Romans 15:30 echo. Ids unchanged.')
ON CONFLICT (id) DO UPDATE SET version = EXCLUDED.version, landed_at = now(), notes = EXCLUDED.notes;
COMMIT;
\\echo 'session455b — canon fix done.'""")
SQL_OUT.write_text('\n'.join(L)); print('SQL written:', SQL_OUT.relative_to(APP), f'({len(sql_titles)} titles, {len(sub_rows)} subscriptions)')
(HERE / 'canon-fix-report.md').write_text('\n'.join(report) + '\n'); print('report: canon-fix-report.md')
