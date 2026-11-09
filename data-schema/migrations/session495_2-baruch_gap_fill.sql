-- =====================================================================
-- Session 495 migration — 2026-11-08 — edition `pseudepigrapha` / book `2-baruch` — Phase 2 gap fill (chapters with no card: 33)
-- 4 new cross-reference cards (tier 'free'), 1 new threads, 0 existing thread(s) joined, 4 thread members.
-- Drafted on: claude-sonnet-5-5; voice read on Claude Fable 5.1; every quotation checked verbatim by script (assemble495.py) before this was written.
-- Safety (DO block): RAISES if the live text of any source verse differs from the read-back this was written against, if any target
-- verse is missing, or if a note for a NON-canon target does not carry the live target verse verbatim. Full-library lookup view (every edition slug).
-- Convention: canon quotations in notes follow the restored-names KJV wording of parsed/canon.json, not the live (modernised) display text.
-- Idempotent: INSERT ... ON CONFLICT DO NOTHING throughout; a re-run reports 0 inserted everywhere.
-- Run: python3 api/apply_migration.py data-schema/migrations/session495_2-baruch_gap_fill.sql
-- =====================================================================
\echo 'session495 — 2-baruch gap fill starting...'
BEGIN;
CREATE TEMP TABLE _s495_2_baruch_c (src_edition TEXT, src_slug TEXT, src_ch INT, src_v INT, src_text TEXT, tgt_edition TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, tgt_text TEXT, tier TEXT, note TEXT) ON COMMIT DROP;
INSERT INTO _s495_2_baruch_c VALUES
('pseudepigrapha','2-baruch',33,1,$n$'Are these the commands which thy companion, Jeremiah the prophet, commanded thee, and said unto thee: "Look to this people till I go and make ready the rest of the brethren in Babylon,$n$,'canon','jeremiah',29,1,$n$Now these are the words of the letter that Jeremiah the prophet sent from Jerusalem unto the residue of the elders which were carried away captives, and to the priests, and to the prophets, and to all the people whom Nebuchadnezzar had carried away captive from Jerusalem to Babylon;$n$,'free',$n$Jeremiah 29:1 — *Now these are the words of the letter that Jeremiah the prophet sent from Jerusalem unto the residue of the elders which were carried away captives, and to the priests, and to the prophets, and to all the people whom Nebuchadnezzar had carried away captive from Jerusalem to Babylon;* *'Are these the commands which thy companion, Jeremiah the prophet, commanded thee, and said unto thee: "Look to this people till I go and make ready the rest of the brethren in Babylon,* (2 Baruch 33:1) The people hold Baruch to the charge his companion Jeremiah gave him. Jeremiah was the prophet whose letter went out from Jerusalem to the elders, priests, prophets and all the people already carried away to Babylon, and those captives are the brethren the people have in mind.$n$),
('pseudepigrapha','2-baruch',33,2,$n$against whom has gone forth the sentence that they should be led into captivity"?$n$,'canon','jeremiah',29,4,$n$Thus saith Yahuah Tseva'ot (LORD of hosts), the Elohim (God) of Yashar'el (Israel), unto all that are carried away captives, whom I have caused to be carried away from Jerusalem unto Babylon;$n$,'free',$n$Jeremiah 29:4 — *Thus saith Yahuah Tseva'ot (LORD of hosts), the Elohim (God) of Yashar'el (Israel), unto all that are carried away captives, whom I have caused to be carried away from Jerusalem unto Babylon;* *against whom has gone forth the sentence that they should be led into captivity"?* (2 Baruch 33:2) Both speak of a sentence that has already gone out. In Jeremiah it is Yahuah (God) himself who says he caused them to be carried away from Jerusalem, so the captivity is not an accident of war but a judgment spoken and carried out.$n$),
('pseudepigrapha','2-baruch',33,3,$n$And now if thou also forsakest us, it were good for us all to die before thee, and then that thou shouldst withdraw from us.'$n$,'canon','numbers',27,17,$n$Which may go out before them, and which may go in before them, and which may lead them out, and which may bring them in; that the congregation of Yahuah (LORD) be not as sheep which have no shepherd.$n$,'free',$n$Numbers 27:17 — *Which may go out before them, and which may go in before them, and which may lead them out, and which may bring them in; that the congregation of Yahuah (LORD) be not as sheep which have no shepherd.* *And now if thou also forsakest us, it were good for us all to die before thee, and then that thou shouldst withdraw from us.'* (2 Baruch 33:3) The people's dread is the very fear Moses laid before Yahuah (God): a congregation left like sheep with no shepherd. Their cry, that it were good for them all to die before Baruch withdraws, is the cry of a flock that has no one else to lead it out and bring it in.$n$),
('pseudepigrapha','2-baruch',33,3,$n$And now if thou also forsakest us, it were good for us all to die before thee, and then that thou shouldst withdraw from us.'$n$,'canon','acts',20,38,$n$Sorrowing most of all for the words which he spake, that they should see his face no more. And they accompanied him unto the ship.$n$,'free',$n$Acts 20:38 — *Sorrowing most of all for the words which he spake, that they should see his face no more. And they accompanied him unto the ship.* *And now if thou also forsakest us, it were good for us all to die before thee, and then that thou shouldst withdraw from us.'* (2 Baruch 33:3) The elders at Miletus wept for the same reason, grieving most of all that the man who had led them would not be seen again. A people who weep when their teacher speaks of going away are weeping for the loss of the one who held them together.$n$);
CREATE TEMP TABLE _s495_2_baruch_t (slug TEXT, title TEXT, summary_md TEXT, ch INT, a_vn INT, z_vn INT, tier TEXT, sort_order INT) ON COMMIT DROP;
INSERT INTO _s495_2_baruch_t VALUES
('2-baruch-33-if-thou-forsakest-us-it-were-good-to-die-before-thee',$n$The people plead with the prophet not to leave them$n$,$n$The people answer Baruch with the words of the prophet who had gone before him: *'Are these the commands which thy companion, Jeremiah the prophet, commanded thee, and said unto thee: "Look to this people till I go and make ready the rest of the brethren in Babylon,* (2 Baruch 33:1) They remind him that the captivity is already decreed: *against whom has gone forth the sentence that they should be led into captivity"?* (2 Baruch 33:2) And then the cry of a flock that cannot bear to lose its shepherd: *And now if thou also forsakest us, it were good for us all to die before thee, and then that thou shouldst withdraw from us.'* (2 Baruch 33:3)

It ain't new. Jeremiah's letter had carried this sentence into Babylon in Yahuah's (God's) own words: *Thus saith Yahuah Tseva'ot (LORD of hosts), the Elohim (God) of Yashar'el (Israel), unto all that are carried away captives, whom I have caused to be carried away from Jerusalem unto Babylon;* (Jeremiah 29:4) The fear of a people left without a leader is as old as Moses, who asked Yahuah (God) for a man to go out and come in before the people, so that they should not be left leaderless: *Which may go out before them, and which may go in before them, and which may lead them out, and which may bring them in; that the congregation of Yahuah (LORD) be not as sheep which have no shepherd.* (Numbers 27:17) And the grief of a people who hear that their teacher is about to leave is met again at Miletus: *Sorrowing most of all for the words which he spake, that they should see his face no more. And they accompanied him unto the ship.* (Acts 20:38)

Baruch's people are not being faithless in this plea; they are doing what the scattered have always done when the one who holds them to the commandments speaks of going. Their words show how much hangs on a faithful shepherd, and the next chapter lets Baruch answer them.$n$,33,1,3,'extras',94000);
CREATE TEMP TABLE _s495_2_baruch_m (thread_slug TEXT, src_ch INT, src_v INT, tgt_edition TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, sort_order INT, member_note TEXT) ON COMMIT DROP;
INSERT INTO _s495_2_baruch_m VALUES
('2-baruch-33-if-thou-forsakest-us-it-were-good-to-die-before-thee',33,1,'canon','jeremiah',29,1,1,$n$Jeremiah 29:1 — *Now these are the words of the letter that Jeremiah the prophet sent from Jerusalem unto the residue of the elders which were carried away captives* Jeremiah's letter to the captives in Babylon is the charge the people remind Baruch of.$n$),
('2-baruch-33-if-thou-forsakest-us-it-were-good-to-die-before-thee',33,2,'canon','jeremiah',29,4,2,$n$Jeremiah 29:4 — *Thus saith Yahuah Tseva'ot (LORD of hosts), the Elohim (God) of Yashar'el (Israel), unto all that are carried away captives, whom I have caused to be carried away from Jerusalem unto Babylon* The captivity is a sentence Yahuah himself caused, as the people in Baruch's day acknowledge.$n$),
('2-baruch-33-if-thou-forsakest-us-it-were-good-to-die-before-thee',33,3,'canon','numbers',27,17,3,$n$Numbers 27:17 — *that the congregation of Yahuah (LORD) be not as sheep which have no shepherd* A people afraid of being left as sheep without a shepherd.$n$),
('2-baruch-33-if-thou-forsakest-us-it-were-good-to-die-before-thee',33,3,'canon','acts',20,38,4,$n$Acts 20:38 — *Sorrowing most of all for the words which he spake, that they should see his face no more.* A people in sorrow because the one who led them is leaving.$n$);
CREATE TEMP TABLE _s495_2_baruch_j (slug TEXT) ON COMMIT DROP;
-- (no rows for _s495_2_baruch_j)

CREATE OR REPLACE TEMP VIEW _s495_2_baruch_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id, v.text
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon', 'enoch', 'jubilees', 'jasher', 'apocrypha', 'apocrypha-charles-vol1', 'pseudepigrapha', 'adam-eve-conflict', 'apocalypse-of-abraham', 'ascension-isaiah', 'sonnini-acts-29', 'josephus', 'lightfoot-apostolic-fathers', 'mrjames-apocryphal-nt');

DO $s495$
DECLARE r RECORD; sid BIGINT; tid BIGINT; ltext TEXT; n INT;
        n_cards INT := 0; n_cards_same INT := 0; n_thr INT := 0; n_thr_same INT := 0; n_mem INT := 0; n_mem_same INT := 0; n_total INT;
BEGIN
  -- ---- guards: every row is checked before anything is written ----
  FOR r IN SELECT * FROM _s495_2_baruch_c LOOP
    SELECT verse_id, text INTO sid, ltext FROM _s495_2_baruch_lookup WHERE edition_slug = r.src_edition AND book_slug = r.src_slug AND chapter_number = r.src_ch AND verse_number = r.src_v;
    IF sid IS NULL THEN RAISE EXCEPTION 'S495: source verse %/% %:% missing', r.src_edition, r.src_slug, r.src_ch, r.src_v; END IF;
    IF ltext <> r.src_text THEN RAISE EXCEPTION 'S495: live text of %/% %:% differs from the read-back this migration was written against — re-run the dump and rebuild', r.src_edition, r.src_slug, r.src_ch, r.src_v; END IF;
    SELECT verse_id, text INTO tid, ltext FROM _s495_2_baruch_lookup WHERE edition_slug = r.tgt_edition AND book_slug = r.tgt_slug AND chapter_number = r.tgt_ch AND verse_number = r.tgt_v;
    IF tid IS NULL THEN RAISE EXCEPTION 'S495: target verse %/% %:% missing', r.tgt_edition, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    -- canon quotations follow the restored-names KJV of parsed/canon.json by convention (the live canon display text is modernised), so only non-canon targets are compared
    IF r.tgt_edition <> 'canon' AND position(ltext IN r.note) = 0 THEN RAISE EXCEPTION 'S495: note for %:% -> %/% %:% does not carry the live target verse verbatim', r.src_ch, r.src_v, r.tgt_edition, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    IF sid = tid THEN RAISE EXCEPTION 'S495: source = target at %:%', r.src_ch, r.src_v; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _s495_2_baruch_t LOOP
    IF NOT EXISTS (SELECT 1 FROM _s495_2_baruch_lookup WHERE edition_slug = 'pseudepigrapha' AND book_slug = '2-baruch' AND chapter_number = r.ch AND verse_number = r.a_vn)
    OR NOT EXISTS (SELECT 1 FROM _s495_2_baruch_lookup WHERE edition_slug = 'pseudepigrapha' AND book_slug = '2-baruch' AND chapter_number = r.ch AND verse_number = r.z_vn) THEN
      RAISE EXCEPTION 'S495: anchor %:%-% for thread % missing', r.ch, r.a_vn, r.z_vn, r.slug; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _s495_2_baruch_j LOOP
    IF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE slug = r.slug) THEN RAISE EXCEPTION 'S495: thread to join % does not exist', r.slug; END IF;
  END LOOP;

  -- ---- cards ----
  SELECT count(*) INTO n_total FROM _s495_2_baruch_c;
  WITH input(src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS
       (SELECT src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note FROM _s495_2_baruch_c)
  INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
  SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
    FROM input i
    JOIN _s495_2_baruch_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
    JOIN _s495_2_baruch_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
   WHERE sv.verse_id <> tv.verse_id
  ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;
  GET DIAGNOSTICS n_cards = ROW_COUNT; n_cards_same := n_total - n_cards;

  -- ---- threads ----
  SELECT count(*) INTO n_total FROM _s495_2_baruch_t;
  INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
  SELECT t.slug, t.title, t.summary_md, sv.verse_id, ev.verse_id, t.tier::content_tier, t.sort_order
    FROM _s495_2_baruch_t t
    JOIN _s495_2_baruch_lookup sv ON sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=t.ch AND sv.verse_number=t.a_vn
    JOIN _s495_2_baruch_lookup ev ON ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=t.ch AND ev.verse_number=t.z_vn
  ON CONFLICT (slug) DO NOTHING;
  GET DIAGNOSTICS n_thr = ROW_COUNT; n_thr_same := n_total - n_thr;

  -- ---- members (thread by slug — new or joined; card by its verse pair, source='manual') ----
  SELECT count(*) INTO n_total FROM _s495_2_baruch_m;
  INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
  SELECT th.id, x.id, m.sort_order, m.member_note
    FROM _s495_2_baruch_m m
    JOIN cross_reference_threads th ON th.slug = m.thread_slug
    JOIN _s495_2_baruch_lookup sv ON sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
    JOIN _s495_2_baruch_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
    JOIN cross_references x ON x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
  ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
  GET DIAGNOSTICS n_mem = ROW_COUNT; n_mem_same := n_total - n_mem;
  -- every member row must now exist (a card or thread that failed to resolve would leave one short)
  SELECT count(*) INTO n FROM _s495_2_baruch_m m WHERE NOT EXISTS (
    SELECT 1 FROM cross_reference_thread_members mm JOIN cross_reference_threads th ON th.id = mm.thread_id AND th.slug = m.thread_slug
      JOIN cross_references x ON x.id = mm.cross_reference_id
      JOIN _s495_2_baruch_lookup sv ON sv.verse_id = x.source_verse_id AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
      JOIN _s495_2_baruch_lookup tv ON tv.verse_id = x.target_verse_id AND tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v);
  IF n > 0 THEN RAISE EXCEPTION 'S495: % member row(s) did not resolve to a thread + card', n; END IF;

  RAISE NOTICE 'S495 (2-baruch) summary: cards inserted % / already there %; threads inserted % / already there %; members inserted % / already there %',
    n_cards, n_cards_same, n_thr, n_thr_same, n_mem, n_mem_same;
END $s495$;
COMMIT;
\echo 'session495 — 2-baruch gap fill done.'
