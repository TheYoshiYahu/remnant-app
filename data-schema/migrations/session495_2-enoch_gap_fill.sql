-- =====================================================================
-- Session 495 migration — 2026-11-08 — edition `pseudepigrapha` / book `2-enoch` — Phase 2 gap fill (chapters with no card: 57)
-- 4 new cross-reference cards (tier 'free'), 1 new threads, 0 existing thread(s) joined, 4 thread members.
-- Drafted on: claude-sonnet-5-5; voice read on Claude Fable 5.1; every quotation checked verbatim by script (assemble495.py) before this was written.
-- Safety (DO block): RAISES if the live text of any source verse differs from the read-back this was written against, if any target
-- verse is missing, or if a note for a NON-canon target does not carry the live target verse verbatim. Full-library lookup view (every edition slug).
-- Convention: canon quotations in notes follow the restored-names KJV wording of parsed/canon.json, not the live (modernised) display text.
-- Idempotent: INSERT ... ON CONFLICT DO NOTHING throughout; a re-run reports 0 inserted everywhere.
-- Run: python3 api/apply_migration.py data-schema/migrations/session495_2-enoch_gap_fill.sql
-- =====================================================================
\echo 'session495 — 2-enoch gap fill starting...'
BEGIN;
CREATE TEMP TABLE _s495_2_enoch_c (src_edition TEXT, src_slug TEXT, src_ch INT, src_v INT, src_text TEXT, tgt_edition TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, tgt_text TEXT, tier TEXT, note TEXT) ON COMMIT DROP;
INSERT INTO _s495_2_enoch_c VALUES
('pseudepigrapha','2-enoch',57,1,$n$My child Methosalam, summon all your brethren and all your household and the elders of the people, that I may talk to them and depart, as is planned for me.$n$,'canon','genesis',49,1,$n$And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.$n$,'free',$n$Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* *My child Methosalam, summon all your brethren and all your household and the elders of the people, that I may talk to them and depart, as is planned for me.* (2 Enoch 57:1) A father who knows his time is short gathers the whole household around him to speak before he goes, just as Jacob called his sons to his bed. Enoch's word is sent down through his son in the same way, so that what he has seen is not left unsaid.$n$),
('pseudepigrapha','2-enoch',57,1,$n$My child Methosalam, summon all your brethren and all your household and the elders of the people, that I may talk to them and depart, as is planned for me.$n$,'canon','deuteronomy',31,28,$n$Gather unto me all the elders of your tribes, and your officers, that I may speak these words in their ears, and call heaven and earth to record against them.$n$,'free',$n$Deuteronomy 31:28 — *Gather unto me all the elders of your tribes, and your officers, that I may speak these words in their ears, and call heaven and earth to record against them.* *My child Methosalam, summon all your brethren and all your household and the elders of the people, that I may talk to them and depart, as is planned for me.* (2 Enoch 57:1) Moses also has the elders brought to him so that his last words are spoken in their hearing. In both places the elders of the people are summoned because what is about to be said is meant to be carried on after the speaker is gone.$n$),
('pseudepigrapha','2-enoch',57,2,$n$And Methosalam made haste, and summoned his brethren, Regim, Riman, Uchan, Chermion, Gaidad, and all the elders of the people before the face of his father Enoch; and he blessed them, and said to them:$n$,'canon','deuteronomy',33,1,$n$And this is the blessing, wherewith Moses the man of Elohim (God) blessed the children of Yashar'el (Israel) before his death.$n$,'free',$n$Deuteronomy 33:1 — *And this is the blessing, wherewith Moses the man of Elohim (God) blessed the children of Yashar'el (Israel) before his death.* *And Methosalam made haste, and summoned his brethren, Regim, Riman, Uchan, Chermion, Gaidad, and all the elders of the people before the face of his father Enoch; and he blessed them, and said to them:* (2 Enoch 57:2) Once the people are assembled, a blessing is spoken over them before the departing father's farewell words begin. Moses blessed the children of Yashar'el (Israel) in the same way at the end of his life.$n$),
('pseudepigrapha','2-enoch',57,1,$n$My child Methosalam, summon all your brethren and all your household and the elders of the people, that I may talk to them and depart, as is planned for me.$n$,'canon','2-peter',1,14,$n$Knowing that shortly I must put off this my tabernacle, even as our Lord Yahusha HaMashiach (Lord Jesus Christ) hath shewed me.$n$,'free',$n$2 Peter 1:14 — *Knowing that shortly I must put off this my tabernacle, even as our Lord Yahusha HaMashiach (Lord Jesus Christ) hath shewed me.* *My child Methosalam, summon all your brethren and all your household and the elders of the people, that I may talk to them and depart, as is planned for me.* (2 Enoch 57:1) Peter also speaks of his departure as something known beforehand and arranged, and he goes on to say that he will take pains that his hearers can recall these things after his decease. Enoch's words, that he may talk to them and depart as is planned for him, sit in the same line.$n$);
CREATE TEMP TABLE _s495_2_enoch_t (slug TEXT, title TEXT, summary_md TEXT, ch INT, a_vn INT, z_vn INT, tier TEXT, sort_order INT) ON COMMIT DROP;
INSERT INTO _s495_2_enoch_t VALUES
('2-enoch-57-gather-the-elders-that-i-may-speak-and-depart',$n$Gather the elders, that I may speak and depart$n$,$n$Enoch, knowing his time has come, asks his son to bring the people together: *My child Methosalam, summon all your brethren and all your household and the elders of the people, that I may talk to them and depart, as is planned for me.* (2 Enoch 57:1) The son does as he is told: *And Methosalam made haste, and summoned his brethren, Regim, Riman, Uchan, Chermion, Gaidad, and all the elders of the people before the face of his father Enoch; and he blessed them, and said to them:* (2 Enoch 57:2)

It ain't new. The fathers of Yashar'el (Israel) did exactly this when their days drew to an end. *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* (Genesis 49:1) Moses, for the same purpose, had the elders of the tribes called to him: *Gather unto me all the elders of your tribes, and your officers, that I may speak these words in their ears, and call heaven and earth to record against them.* (Deuteronomy 31:28) When his words were done, the people were blessed: *And this is the blessing, wherewith Moses the man of Elohim (God) blessed the children of Yashar'el (Israel) before his death.* (Deuteronomy 33:1)

The apostles knew the same custom. Peter, near the end, wrote: *Knowing that shortly I must put off this my tabernacle, even as our Lord Yahusha HaMashiach (Lord Jesus Christ) hath shewed me.* (2 Peter 1:14)

What stands out in all of these is one pattern the scriptures keep. The one who is about to go gathers the household and the elders, blesses them, and speaks what must be remembered, so that the word does not die with the man who carried it. Enoch's gathering belongs in that line, and the long farewell that follows is spoken in the hearing of the same assembled elders.$n$,57,1,2,'extras',94000);
CREATE TEMP TABLE _s495_2_enoch_m (thread_slug TEXT, src_ch INT, src_v INT, tgt_edition TEXT, tgt_slug TEXT, tgt_ch INT, tgt_v INT, sort_order INT, member_note TEXT) ON COMMIT DROP;
INSERT INTO _s495_2_enoch_m VALUES
('2-enoch-57-gather-the-elders-that-i-may-speak-and-depart',57,1,'canon','genesis',49,1,1,$n$Genesis 49:1 — *Gather yourselves together, that I may tell you that which shall befall you in the last days.* Jacob's deathbed gathering of his sons is the pattern for Enoch's call to his household.$n$),
('2-enoch-57-gather-the-elders-that-i-may-speak-and-depart',57,1,'canon','deuteronomy',31,28,2,$n$Deuteronomy 31:28 — *Gather unto me all the elders of your tribes, and your officers, that I may speak these words in their ears* Moses summons the elders before his departure, as Enoch has them summoned.$n$),
('2-enoch-57-gather-the-elders-that-i-may-speak-and-depart',57,2,'canon','deuteronomy',33,1,3,$n$Deuteronomy 33:1 — *And this is the blessing, wherewith Moses the man of Elohim (God) blessed the children of Yashar'el (Israel) before his death.* The blessing spoken over the gathered people before a father's death, as Methuselah blesses the elders before Enoch speaks.$n$),
('2-enoch-57-gather-the-elders-that-i-may-speak-and-depart',57,1,'canon','2-peter',1,14,4,$n$2 Peter 1:14 — *Knowing that shortly I must put off this my tabernacle* Peter, like Enoch, knows his departure is near and prepares those he leaves behind.$n$);
CREATE TEMP TABLE _s495_2_enoch_j (slug TEXT) ON COMMIT DROP;
-- (no rows for _s495_2_enoch_j)

CREATE OR REPLACE TEMP VIEW _s495_2_enoch_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id, v.text
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon', 'enoch', 'jubilees', 'jasher', 'apocrypha', 'apocrypha-charles-vol1', 'pseudepigrapha', 'adam-eve-conflict', 'apocalypse-of-abraham', 'ascension-isaiah', 'sonnini-acts-29', 'josephus', 'lightfoot-apostolic-fathers', 'mrjames-apocryphal-nt');

DO $s495$
DECLARE r RECORD; sid BIGINT; tid BIGINT; ltext TEXT; n INT;
        n_cards INT := 0; n_cards_same INT := 0; n_thr INT := 0; n_thr_same INT := 0; n_mem INT := 0; n_mem_same INT := 0; n_total INT;
BEGIN
  -- ---- guards: every row is checked before anything is written ----
  FOR r IN SELECT * FROM _s495_2_enoch_c LOOP
    SELECT verse_id, text INTO sid, ltext FROM _s495_2_enoch_lookup WHERE edition_slug = r.src_edition AND book_slug = r.src_slug AND chapter_number = r.src_ch AND verse_number = r.src_v;
    IF sid IS NULL THEN RAISE EXCEPTION 'S495: source verse %/% %:% missing', r.src_edition, r.src_slug, r.src_ch, r.src_v; END IF;
    IF ltext <> r.src_text THEN RAISE EXCEPTION 'S495: live text of %/% %:% differs from the read-back this migration was written against — re-run the dump and rebuild', r.src_edition, r.src_slug, r.src_ch, r.src_v; END IF;
    SELECT verse_id, text INTO tid, ltext FROM _s495_2_enoch_lookup WHERE edition_slug = r.tgt_edition AND book_slug = r.tgt_slug AND chapter_number = r.tgt_ch AND verse_number = r.tgt_v;
    IF tid IS NULL THEN RAISE EXCEPTION 'S495: target verse %/% %:% missing', r.tgt_edition, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    -- canon quotations follow the restored-names KJV of parsed/canon.json by convention (the live canon display text is modernised), so only non-canon targets are compared
    IF r.tgt_edition <> 'canon' AND position(ltext IN r.note) = 0 THEN RAISE EXCEPTION 'S495: note for %:% -> %/% %:% does not carry the live target verse verbatim', r.src_ch, r.src_v, r.tgt_edition, r.tgt_slug, r.tgt_ch, r.tgt_v; END IF;
    IF sid = tid THEN RAISE EXCEPTION 'S495: source = target at %:%', r.src_ch, r.src_v; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _s495_2_enoch_t LOOP
    IF NOT EXISTS (SELECT 1 FROM _s495_2_enoch_lookup WHERE edition_slug = 'pseudepigrapha' AND book_slug = '2-enoch' AND chapter_number = r.ch AND verse_number = r.a_vn)
    OR NOT EXISTS (SELECT 1 FROM _s495_2_enoch_lookup WHERE edition_slug = 'pseudepigrapha' AND book_slug = '2-enoch' AND chapter_number = r.ch AND verse_number = r.z_vn) THEN
      RAISE EXCEPTION 'S495: anchor %:%-% for thread % missing', r.ch, r.a_vn, r.z_vn, r.slug; END IF;
  END LOOP;
  FOR r IN SELECT * FROM _s495_2_enoch_j LOOP
    IF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE slug = r.slug) THEN RAISE EXCEPTION 'S495: thread to join % does not exist', r.slug; END IF;
  END LOOP;

  -- ---- cards ----
  SELECT count(*) INTO n_total FROM _s495_2_enoch_c;
  WITH input(src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS
       (SELECT src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note FROM _s495_2_enoch_c)
  INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
  SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
    FROM input i
    JOIN _s495_2_enoch_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
    JOIN _s495_2_enoch_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
   WHERE sv.verse_id <> tv.verse_id
  ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;
  GET DIAGNOSTICS n_cards = ROW_COUNT; n_cards_same := n_total - n_cards;

  -- ---- threads ----
  SELECT count(*) INTO n_total FROM _s495_2_enoch_t;
  INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
  SELECT t.slug, t.title, t.summary_md, sv.verse_id, ev.verse_id, t.tier::content_tier, t.sort_order
    FROM _s495_2_enoch_t t
    JOIN _s495_2_enoch_lookup sv ON sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=t.ch AND sv.verse_number=t.a_vn
    JOIN _s495_2_enoch_lookup ev ON ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=t.ch AND ev.verse_number=t.z_vn
  ON CONFLICT (slug) DO NOTHING;
  GET DIAGNOSTICS n_thr = ROW_COUNT; n_thr_same := n_total - n_thr;

  -- ---- members (thread by slug — new or joined; card by its verse pair, source='manual') ----
  SELECT count(*) INTO n_total FROM _s495_2_enoch_m;
  INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
  SELECT th.id, x.id, m.sort_order, m.member_note
    FROM _s495_2_enoch_m m
    JOIN cross_reference_threads th ON th.slug = m.thread_slug
    JOIN _s495_2_enoch_lookup sv ON sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
    JOIN _s495_2_enoch_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
    JOIN cross_references x ON x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
  ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
  GET DIAGNOSTICS n_mem = ROW_COUNT; n_mem_same := n_total - n_mem;
  -- every member row must now exist (a card or thread that failed to resolve would leave one short)
  SELECT count(*) INTO n FROM _s495_2_enoch_m m WHERE NOT EXISTS (
    SELECT 1 FROM cross_reference_thread_members mm JOIN cross_reference_threads th ON th.id = mm.thread_id AND th.slug = m.thread_slug
      JOIN cross_references x ON x.id = mm.cross_reference_id
      JOIN _s495_2_enoch_lookup sv ON sv.verse_id = x.source_verse_id AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
      JOIN _s495_2_enoch_lookup tv ON tv.verse_id = x.target_verse_id AND tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v);
  IF n > 0 THEN RAISE EXCEPTION 'S495: % member row(s) did not resolve to a thread + card', n; END IF;

  RAISE NOTICE 'S495 (2-enoch) summary: cards inserted % / already there %; threads inserted % / already there %; members inserted % / already there %',
    n_cards, n_cards_same, n_thr, n_thr_same, n_mem, n_mem_same;
END $s495$;
COMMIT;
\echo 'session495 — 2-enoch gap fill done.'
