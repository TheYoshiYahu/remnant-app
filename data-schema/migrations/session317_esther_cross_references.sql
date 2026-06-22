-- =====================================================================
-- Session 317 — Esther FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session317_esther_cross_references.sql
-- =====================================================================

\echo 'session317 — Esther cross-references starting...'
BEGIN;

-- ----- fragment: minion_esther_1.sql (Esther 1) -----
-- Esther 1 — the feast of Ahasuerus and the deposing of Vashti.
-- Book slug: esther ; tag: esth01 ; session prefix: s317 ; temp view: _s317_esth01_lookup
-- sort_order band: 32500+ (one per thread)
-- LENS: The divine NAME is famously ABSENT from the whole book — Yahuah works by HIDDEN
--   PROVIDENCE behind the "coincidences." The wine-driven volatility of the king and the
--   removal of Vashti quietly open the way for Esther: the unseen sovereign hand keeping
--   his covenant people (Prov 21:1, Prov 19:21, Rom 8:28, Ps 121:4). No divine-name
--   reading is forced — the providence IS the thread.
--
-- Esther 1 coverage:
--   v.1-9  (the 180-day feast, royal wine in abundance, the pomp of the world-empire)
--          NT:     none warranted (pomp/wine of empire framed via Tanakh wisdom + Daniel)
--          Extras: none warranted
--          Tanakh: folded into the wine/folly thread (Prov 20:1, Dan 5) — the lavish feast
--                  is the setting for the drunken command of v.10
--   v.10-12 (heart merry with wine -> command Vashti to display her beauty; she REFUSES;
--           the king very wroth — the volatility of power ruled by wine)
--          NT:     none warranted (wisdom-on-wine answered within the Tanakh)
--          Extras: none warranted
--          Tanakh: Prov 20:1 (wine a mocker), Prov 23:29-35 (woe/redness of eyes/strange
--                  things), Prov 31:4-5 (not for kings to drink, lest they forget the law),
--                  Daniel 5:1-4 (Belshazzar's drunken feast) -> THREAD 1
--   v.13-22 (the counsellors fear the example; decree Vashti deposed, every man bear rule
--           in his own house — the empire's anxious over-reaction; providence quietly
--           making room: Vashti's removal opens the way for Esther)
--          NT:     Romans 8:28 (all things work together for good) -> THREAD 2
--          Extras: none warranted
--          Tanakh: Prov 21:1 (king's heart in the hand of Yahuah), Prov 19:21 (the counsel
--                  of Yahuah shall stand), Psalm 121:4 (he that keepeth Israel) -> THREAD 2
--
-- THREADS:
--   1. esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power
--        [free] targets: Tanakh (Prov 20:1, Prov 23:29, Prov 31:4-5) + Tanakh (Daniel 5:1-4)
--   2. esther-1-the-counsel-of-Yahuah-shall-stand-the-removing-of-vashti-makes-room
--        [free] targets: Tanakh (Prov 21:1, Prov 19:21, Psalm 121:4) + NT FORWARD (Romans 8:28)

CREATE TEMP VIEW _s317_esth01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- B. cross_references
-- =====================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the king's heart merry with wine -> the folly of drunken power
    ('canon','esther',1,10,'canon','proverbs',20,1,'free',
     E'*Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise* (Proverbs 20:1). Esther 1:10 marks the turn — *On the seventh day, when the heart of the king was merry with wine, he commanded... to bring Vashti the queen before the king... to shew the people and the princes her beauty*. The wisdom of the Tanakh names exactly what the chapter shows: the cup mocks the man, and the king who is *deceived thereby is not wise* turns his banquet into a public folly.'),
    ('canon','esther',1,10,'canon','daniel',5,1,'free',
     E'*Belshazzar the king made a great feast to a thousand of his lords, and drank wine before the thousand* (Daniel 5:1). Ahasuerus, with *the heart of the king... merry with wine* (Esther 1:10), stands beside Belshazzar — two world-emperors whose drunken feasts end in disaster. The pomp and wine of the empire is set up here only to be brought low; in Daniel the same wine-soaked banquet ends with the writing on the wall.'),
    ('canon','esther',1,10,'canon','daniel',5,4,'free',
     E'*They drank wine, and praised the gods of gold, and of silver, of brass, of iron, of wood, and of stone* (Daniel 5:4). The drinking *according to the state of the king* (Esther 1:7) and the heart *merry with wine* (Esther 1:10) is the same intoxicated glory of the nations — Babylon and Persia both lift the cup of self-glory, and the unseen hand of Yahuah weighs them in the balances.'),
    ('canon','esther',1,11,'canon','proverbs',31,4,'free',
     E'*It is not for kings, O Lemuel, it is not for kings to drink wine; nor for princes strong drink* (Proverbs 31:4). When the king, with heart *merry with wine*, commands *To bring Vashti the queen before the king with the crown royal, to shew the people and the princes her beauty* (Esther 1:11), he is the very picture the mother of Lemuel warned against — the ruler whose drink unseats his judgment.'),
    ('canon','esther',1,11,'canon','proverbs',31,5,'free',
     E'*Lest they drink, and forget the law, and pervert the judgment of any of the afflicted* (Proverbs 31:5). The drunken command of Esther 1:11 to parade *the crown royal* before the princes is judgment perverted by the cup — exactly what Proverbs warns the wine will do to a king, making him *forget the law* and wrong even his own house.'),
    ('canon','esther',1,12,'canon','proverbs',23,29,'free',
     E'*Who hath woe? who hath sorrow? who hath contentions? who hath babbling? who hath wounds without cause? who hath redness of eyes? They that tarry long at the wine* (Proverbs 23:29-30). When *the king very wroth, and his anger burned in him* (Esther 1:12) over Vashti''s refusal, it is the wine''s own fruit — woe and wrath and contention born at the cup, the rage that *strong drink is raging* (Proverbs 20:1) foretold.'),
    ('canon','esther',1,12,'canon','proverbs',23,31,'free',
     E'*Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright. At the last it biteth like a serpent* (Proverbs 23:31-32). The royal wine *in abundance, according to the state of the king* (Esther 1:7) bit at the last: it left the king *very wroth, and his anger burned in him* (Esther 1:12). The wisdom of the Tanakh had already drawn the whole arc of the chapter.'),

    -- THREAD 2: the counsel of Yahuah shall stand -> the removing of Vashti makes room
    ('canon','esther',1,19,'canon','proverbs',21,1,'free',
     E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). The anxious decree of Esther 1:19 — *let it be written among the laws of the Persians and the Medes, that it be not altered, That Vashti come no more before king Ahasuerus; and let the king give her royal estate unto another that is better than she* — looks like the panic of drunken counsellors, but the unaltered law of the Medes is the hidden hand turning the king''s heart, emptying the throne for Esther.'),
    ('canon','esther',1,19,'canon','proverbs',19,21,'free',
     E'*There are many devices in a man''s heart; nevertheless the counsel of Yahuah (LORD), that shall stand* (Proverbs 19:21). Memucan''s scheme to depose Vashti — *let the king give her royal estate unto another that is better than she* (Esther 1:19) — is the device of a man; but the *one that is better* the empire cannot name is already chosen by the counsel that *shall stand*. The book never speaks the Name, yet the Name''s counsel governs every clause.'),
    ('canon','esther',1,22,'canon','psalms',121,4,'free',
     E'*Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). While the empire sends *letters into all the king''s provinces... that every man should bear rule in his own house* (Esther 1:22), the unseen Keeper of his covenant people neither slumbers nor sleeps — the absent Name of Esther is the wakeful Keeper of Psalm 121, setting the stage to preserve his scattered people through the queen yet to come.'),
    ('canon','esther',1,19,'canon','romans',8,28,'free',
     E'*And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). The removing of Vashti by an anxious, wine-fuelled decree (Esther 1:19) is the very thing that *worketh together for good* — the empire''s over-reaction is the open door for Esther, and through her the deliverance of the covenant people. Romans names forward the providence Esther only shows.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- C. cross_reference_threads
-- =====================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power',
       E'The king''s heart merry with wine — the folly of drunken power',
       E'The book of Esther opens on the pomp and wine of the world-empire: a hundred and fourscore days of feasting, *royal wine in abundance, according to the state of the king* (Esther 1:7). Then comes the turn — *On the seventh day, when the heart of the king was merry with wine, he commanded... To bring Vashti the queen before the king with the crown royal, to shew the people and the princes her beauty* (Esther 1:10-11). Vashti refuses, *therefore was the king very wroth, and his anger burned in him* (Esther 1:12). The wisdom of the Tanakh had already named the whole arc: *Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise* (Proverbs 20:1); *It is not for kings, O Lemuel, it is not for kings to drink wine... lest they drink, and forget the law, and pervert the judgment of any of the afflicted* (Proverbs 31:4-5). The cup that *biteth like a serpent* (Proverbs 23:32) leaves only *woe... sorrow... contentions... redness of eyes* (Proverbs 23:29) — the rage that burned in the king. And Ahasuerus does not stand alone: *Belshazzar the king made a great feast to a thousand of his lords, and drank wine before the thousand* (Daniel 5:1), and *they drank wine, and praised the gods of gold, and of silver* (Daniel 5:4) — another drunken emperor whose feast ends with the writing on the wall. The lavish glory of the nations is lifted up here only to be brought low; the empire reels on its own wine while a sober and unseen hand sets the stage.',
       sv.verse_id, ev.verse_id, 'free', 32500
  FROM _s317_esth01_lookup sv, _s317_esth01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-1-the-counsel-of-Yahuah-shall-stand-the-removing-of-vashti-makes-room',
       E'The counsel of Yahuah shall stand — the removing of Vashti makes room',
       E'The Name of Yahuah is never spoken in the whole book of Esther — and that silence is the point. He works by hidden providence behind the "coincidences." The drunken counsellors panic that Vashti''s refusal will embolden every wife, and decree: *let it be written among the laws of the Persians and the Medes, that it be not altered, That Vashti come no more before king Ahasuerus; and let the king give her royal estate unto another that is better than she* (Esther 1:19). They send *letters into all the king''s provinces... that every man should bear rule in his own house* (Esther 1:22). It is an anxious over-reaction, a man''s device — yet *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1), and *There are many devices in a man''s heart; nevertheless the counsel of Yahuah (LORD), that shall stand* (Proverbs 19:21). The *one that is better* the empire cannot yet name is already chosen; the unalterable law of the Medes is the hidden hand emptying the throne for Esther. *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4) — the absent Name is the wakeful Keeper. And the New Testament names forward what Esther only shows: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). The empire''s drunken blunder is the open door of deliverance.',
       sv.verse_id, ev.verse_id, 'free', 32501
  FROM _s317_esth01_lookup sv, _s317_esth01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- D. cross_reference_thread_members
-- =====================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Wine is a mocker, strong drink is raging... is not wise* (Proverbs 20:1) — the heart *merry with wine* (Esther 1:10) deceived into folly.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Belshazzar the king made a great feast... and drank wine before the thousand* (Daniel 5:1) — the other drunken emperor whose feast ends in ruin.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*They drank wine, and praised the gods of gold, and of silver* (Daniel 5:4) — the intoxicated self-glory of the nations the unseen hand will weigh.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*It is not for kings... to drink wine; nor for princes strong drink* (Proverbs 31:4) — the king parading *the crown royal* (Esther 1:11) unseated by his cup.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Lest they drink, and forget the law, and pervert the judgment* (Proverbs 31:5) — judgment perverted by the cup in the drunken command of Esther 1:11.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Who hath woe?... who hath redness of eyes? They that tarry long at the wine* (Proverbs 23:29-30) — the woe and wrath that burned in the king (Esther 1:12).'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Look not thou upon the wine when it is red... At the last it biteth like a serpent* (Proverbs 23:31-32) — the royal wine that bit at the last, leaving the king wroth (Esther 1:12).'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-kings-heart-merry-with-wine-and-the-folly-of-drunken-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will* (Proverbs 21:1) — the unalterable decree (Esther 1:19) is the hidden hand emptying the throne.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-counsel-of-Yahuah-shall-stand-the-removing-of-vashti-makes-room'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*There are many devices in a man''s heart; nevertheless the counsel of Yahuah (LORD), that shall stand* (Proverbs 19:21) — the *one that is better* (Esther 1:19) already chosen by the counsel that stands.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-counsel-of-Yahuah-shall-stand-the-removing-of-vashti-makes-room'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4) — the absent Name is the wakeful Keeper while the empire writes its letters (Esther 1:22).'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-counsel-of-Yahuah-shall-stand-the-removing-of-vashti-makes-room'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*All things work together for good to them that love Elohim (God)... called according to his purpose* (Romans 8:28) — the empire''s drunken blunder (Esther 1:19) is the open door of deliverance.'
  FROM cross_reference_threads t
  JOIN _s317_esth01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s317_esth01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-1-the-counsel-of-Yahuah-shall-stand-the-removing-of-vashti-makes-room'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_2.sql (Esther 2) -----
-- Book: Esther  chapter 2  (Esther made queen; Mordecai uncovers a plot)
-- Tag: esth02   Session prefix: s317   sort_order band start: 32525 (+1 per thread)
-- Source book_slug=esther, edition=canon, chapter 2.
-- NOTE: the divine NAME is never spoken in Esther — Yahuah works by HIDDEN PROVIDENCE
--   behind the "coincidences." Each thread frames the unseen sovereign hand positioning
--   his people. No divine-name mention is invented; the providence IS the thread.
--
-- Esther 2 coverage:
--   v.5-7  (Mordecai a Yahudi of the captivity of Benjamin, line of Kish; orphan Hadassah/Esther raised as his own):
--        NT:     none warranted
--        Extras: none warranted (clean witnesses unavailable / not framework-bearing here)
--        Tanakh: Psalm 68:5-6 (father of the fatherless / Elohim setteth the solitary in families) — USED
--   v.8-17 (Esther taken to the palace, finds favour, made QUEEN instead of Vashti — the deliverer raised up unseen):
--        NT:     Romans 8:28 (all things work together for good) — USED
--        Extras: none warranted
--        Tanakh: Proverbs 21:1 (king's heart in the hand of Yahuah) — USED;
--                Genesis 39:21 (Yahuah with Joseph, gave him favour) — USED;
--                Genesis 41:39-41 (Joseph raised over Egypt) — USED (41:41);
--                Daniel 1:9 (Daniel brought into favour) — USED;
--                Psalm 75:6-7 (promotion cometh... Elohim setteth up another) — USED;
--                Proverbs 16:33 (lot cast... disposing is of Yahuah) — USED
--   v.10-20 (Esther conceals her people/kindred at Mordecai's charge — the hidden identity kept for the right time):
--        NT/Extras/Tanakh: none warranted as a separate thread; folded into the providence frame
--   v.21-23 (Mordecai uncovers the plot of Bigthan and Teresh; recorded in the book of the chronicles — the unrewarded good deed stored up):
--        NT:     Galatians 6:9 (in due season we shall reap) — USED;
--                Hebrews 6:10 (Elohim is not unrighteous to forget your work) — USED
--        Extras: none warranted
--        Tanakh: Ecclesiastes 8:11-13 (sentence not executed speedily... well with them that fear Elohim) — USED (8:12);
--                Proverbs 10:7 (the memory of the just is blessed) — USED
--
-- Threads (3):
--   esther-2-the-orphan-raised-in-faithfulness-a-father-of-the-fatherless  [free]  Tanakh
--   esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand            [free]  Tanakh + NT
--   esther-2-the-unrewarded-deed-written-in-the-chronicles                 [free]  Tanakh + NT

CREATE TEMP VIEW _s317_esth02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the orphan raised in faithfulness
    ('canon','esther',2,7,  'canon','psalms',68,5, 'free',
     E'*A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* (Psalm 68:5) Esther is the orphan of the captivity — *for she had neither father nor mother... whom Mordecai, when her father and mother were dead, took for his own daughter* (Esther 2:7). The Psalm names the hidden hand behind that adoption: the fatherless of the exile are never abandoned; the One who is *a father of the fatherless* was already at work in Mordecai''s house.'),
    ('canon','esther',2,7,  'canon','psalms',68,6, 'free',
     E'*Elohim (God) setteth the solitary in families: he bringeth out those which are bound with chains: but the rebellious dwell in a dry land.* (Psalm 68:6) The solitary orphan girl of a scattered people is *set in a family* — taken *for his own daughter* (Esther 2:7) by a faithful Yahudi (Jew) of the captivity. The same providence that *setteth the solitary in families* is positioning the deliverer before any deliverance is needed.'),

    -- Thread 2: the deliverer set on the throne by the hidden hand
    ('canon','esther',2,17,  'canon','proverbs',21,1, 'free',
     E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* (Proverbs 21:1) *The king loved Esther above all the women... so that he set the royal crown upon her head, and made her queen instead of Vashti* (Esther 2:17). The Name is never spoken in the book, but the love that turns toward Esther is the king''s heart turned *whithersoever he will* — the unseen hand seating the deliverer on the throne.'),
    ('canon','esther',2,15,  'canon','genesis',39,21, 'free',
     E'*But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* (Genesis 39:21) *Esther obtained favour in the sight of all them that looked upon her* (Esther 2:15) — the very word spoken over Joseph in a foreign land. The favour is not Esther''s charm but the same hidden hand that *gave him favour* in Egypt, raising up its servant in the empire before the crisis breaks.'),
    ('canon','esther',2,17,  'canon','genesis',41,41, 'free',
     E'*And Pharaoh said unto Joseph, See, I have set thee over all the land of Egypt.* (Genesis 41:41) As Joseph was lifted from the prison to the throne of Egypt, so the captive''s daughter is lifted to the throne of Persia — *he set the royal crown upon her head, and made her queen* (Esther 2:17). The pattern holds: the unseen Yahuah positions his deliverer in the foreign court before the danger appears.'),
    ('canon','esther',2,15,  'canon','daniel',1,9, 'free',
     E'*Now Elohim (God) had brought Daniel into favour and tender love with the prince of the eunuchs.* (Daniel 1:9) Daniel in Babylon and Esther in Shushan are the same providence: *Esther obtained favour in the sight of all them that looked upon her* (Esther 2:15). The captive who keeps faith is *brought into favour* by a hand that is never named, raised up inside the very empire that scattered the people.'),
    ('canon','esther',2,17,  'canon','psalms',75,6, 'free',
     E'*For promotion cometh neither from the east, nor from the west, nor from the south.* (Psalm 75:6) Esther''s elevation — *made queen instead of Vashti* (Esther 2:17) — looks like the king''s preference and a beauty contest, but the Psalm strips the surface: no earthly direction grants the throne. Promotion comes from no quarter of the compass; the hidden hand alone raises up.'),
    ('canon','esther',2,17,  'canon','psalms',75,7, 'free',
     E'*But Elohim (God) is the judge: he putteth down one, and setteth up another.* (Psalm 75:7) Vashti is put down and Esther is set up in the same breath of the narrative — *made queen instead of Vashti* (Esther 2:17). The Name unspoken in Esther is the very One the Psalm confesses: the Judge who *putteth down one, and setteth up another*, working the crisis-deliverer into place.'),
    ('canon','esther',2,8,  'canon','proverbs',16,33, 'free',
     E'*The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD).* (Proverbs 16:33) The decree, the gathering of the maidens, the custody of Hegai — *Esther was brought also unto the king''s house* (Esther 2:8) — all reads like chance and royal whim. Proverbs names the truth under the coincidence: the casting may be in the lap of men, but *the whole disposing thereof* belongs to the hand that is never named here.'),
    ('canon','esther',2,17,  'canon','romans',8,28, 'free',
     E'*And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* (Romans 8:28) The whole machinery of Esther 2 — Vashti deposed, virgins gathered, the captive''s daughter crowned (*made queen instead of Vashti*, Esther 2:17) — is the standing proof of this promise. With the Name hidden behind every turn, *all things work together for good* for the called people, the deliverer set in place before the threat.'),

    -- Thread 3: the unrewarded deed written in the chronicles
    ('canon','esther',2,23,  'canon','ecclesiastes',8,12, 'free',
     E'*Though a sinner do evil an hundred times, and his days be prolonged, yet surely I know that it shall be well with them that fear Elohim (God), which fear before him.* (Ecclesiastes 8:12) Mordecai exposes the plot and receives nothing — his deed is merely *written in the book of the chronicles before the king* (Esther 2:23). The good seems to vanish unrewarded, but Ecclesiastes holds the line: *it shall be well with them that fear Elohim* — the record is kept, the reward only delayed.'),
    ('canon','esther',2,23,  'canon','galatians',6,9, 'free',
     E'*And let us not be weary in well doing: for in due season we shall reap, if we faint not.* (Galatians 6:9) Mordecai''s loyalty is *written in the book of the chronicles* (Esther 2:23) and then, for the moment, forgotten. The verse names the providence storing it up: the sowing of well-doing reaps *in due season* — the chronicle is the seed that the hidden hand will bring to harvest when the king cannot sleep.'),
    ('canon','esther',2,23,  'canon','hebrews',6,10, 'free',
     E'*For Elohim (God) is not unrighteous to forget your work and labour of love, which ye have shewed toward his name, in that ye have ministered to the saints, and do minister.* (Hebrews 6:10) The man''s deed goes unrewarded but not unrecorded — *it was written in the book of the chronicles before the king* (Esther 2:23). The earthly chronicle mirrors the heavenly one: *Elohim is not unrighteous to forget your work* — the unseen hand never loses the record of a faithful deed.'),
    ('canon','esther',2,23,  'canon','proverbs',10,7, 'free',
     E'*The memory of the just is blessed: but the name of the wicked shall rot.* (Proverbs 10:7) The conspirators are *hanged on a tree* and Mordecai''s just deed is *written in the book of the chronicles* (Esther 2:23). The two destinies are already set in the proverb: the name of the wicked rots on the gallows, while *the memory of the just is blessed* — the written record awaiting its reward.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-2-the-orphan-raised-in-faithfulness-a-father-of-the-fatherless',
       E'The Orphan Raised in Faithfulness — a Father of the Fatherless',
       E'Mordecai is *a certain Yahudi (Jew), whose name was Mordecai... a Benjamite* (Esther 2:5), of *the captivity which had been carried away with Jeconiah king of Yahudah (Judah)* (Esther 2:6) — the line of Kish, Saul''s own tribe, carried from Jerusalem into Shushan. Into his house comes the orphan: *he brought up Hadassah, that is, Esther, his uncle''s daughter: for she had neither father nor mother... whom Mordecai, when her father and mother were dead, took for his own daughter* (Esther 2:7).\n\nThe Name is never spoken in Esther, but the providence is already moving. The Psalm names the hidden hand behind a faithful man adopting a solitary child of the scattered people: *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation* (Psalm 68:5); *Elohim (God) setteth the solitary in families* (Psalm 68:6). The fatherless of the exile are not abandoned. Before any deliverance is needed, the deliverer is being raised up — set in a family by the One who is himself the Father of the fatherless.',
       sv.verse_id, ev.verse_id, 'free', 32525
  FROM _s317_esth02_lookup sv, _s317_esth02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand',
       E'The Deliverer Set on the Throne by the Hidden Hand',
       E'On the surface, Esther 2 is a deposed queen, a beauty contest, and a king''s preference. Beneath it is the sovereign hand that is never named in the book. *Esther was brought also unto the king''s house, to the custody of Hegai* (Esther 2:8) — *The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33). *Esther obtained favour in the sight of all them that looked upon her* (Esther 2:15) — the very word spoken over the exiles before her: *Yahuah (LORD) was with Joseph... and gave him favour* (Genesis 39:21); *Elohim (God) had brought Daniel into favour and tender love with the prince of the eunuchs* (Daniel 1:9).\n\nThen the crown: *the king loved Esther above all the women... so that he set the royal crown upon her head, and made her queen instead of Vashti* (Esther 2:17). The king''s heart turned because *The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will* (Proverbs 21:1). As Joseph was lifted from prison to the throne of Egypt — *See, I have set thee over all the land of Egypt* (Genesis 41:41) — so the captive''s daughter is lifted to the throne of Persia. The Psalm strips the illusion of merit and chance alike: *promotion cometh neither from the east, nor from the west, nor from the south* (Psalm 75:6); *Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7). Vashti put down, Esther set up — the deliverer positioned in the foreign court before the danger ever appears. *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28).',
       sv.verse_id, ev.verse_id, 'free', 32526
  FROM _s317_esth02_lookup sv, _s317_esth02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-2-the-unrewarded-deed-written-in-the-chronicles',
       E'The Unrewarded Deed Written in the Chronicles',
       E'Mordecai overhears a plot: *two of the king''s chamberlains, Bigthan and Teresh... sought to lay hand on the king Ahasuerus* (Esther 2:21). He tells Esther, who *certified the king thereof in Mordecai''s name* (Esther 2:22), the conspirators are *hanged on a tree*, and the loyal deed earns him nothing but a line of ink: *it was written in the book of the chronicles before the king* (Esther 2:23). The good seems to evaporate, unrewarded.\n\nBut the hidden hand is storing it up. *Though a sinner do evil an hundred times, and his days be prolonged, yet surely I know that it shall be well with them that fear Elohim (God), which fear before him* (Ecclesiastes 8:12). The sowing is not lost: *let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9). The earthly chronicle mirrors the heavenly: *Elohim (God) is not unrighteous to forget your work and labour of love* (Hebrews 6:10). Two destinies are already fixed in the proverb — the conspirators on the gallows, the faithful man in the record: *The memory of the just is blessed: but the name of the wicked shall rot* (Proverbs 10:7). The written deed is the seed of the later reversal; the providence that keeps the record will, in due season, bring it to harvest.',
       sv.verse_id, ev.verse_id, 'free', 32527
  FROM _s317_esth02_lookup sv, _s317_esth02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* (Psalm 68:5) — the hidden hand behind the orphan''s adoption.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-orphan-raised-in-faithfulness-a-father-of-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) setteth the solitary in families...* (Psalm 68:6) — the solitary orphan set in a faithful family.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-orphan-raised-in-faithfulness-a-father-of-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD).* (Proverbs 16:33) — the gathering that looks like chance is the hidden hand.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) was with Joseph... and gave him favour...* (Genesis 39:21) — the same favour-word over the exiled Joseph.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Now Elohim (God) had brought Daniel into favour...* (Daniel 1:9) — the captive raised in favour inside the empire, as Esther in Shushan.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will.* (Proverbs 21:1) — the king''s love toward Esther is the heart turned by the hidden hand.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*See, I have set thee over all the land of Egypt.* (Genesis 41:41) — Joseph lifted from prison to throne, the pattern of the deliverer raised in the foreign court.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*For promotion cometh neither from the east, nor from the west, nor from the south.* (Psalm 75:6) — no earthly quarter grants the throne.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*But Elohim (God) is the judge: he putteth down one, and setteth up another.* (Psalm 75:7) — Vashti put down, Esther set up, by the unnamed Judge.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*And we know that all things work together for good...* (Romans 8:28) — the whole machinery of Esther 2 as the standing proof of the promise.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-deliverer-set-on-the-throne-by-the-hidden-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...it shall be well with them that fear Elohim (God), which fear before him.* (Ecclesiastes 8:12) — the good deed seems unrewarded, but the record is kept.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-unrewarded-deed-written-in-the-chronicles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...in due season we shall reap, if we faint not.* (Galatians 6:9) — the chronicle is the seed of the later reversal.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-unrewarded-deed-written-in-the-chronicles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Elohim (God) is not unrighteous to forget your work and labour of love...* (Hebrews 6:10) — the earthly chronicle mirrors the heavenly one.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-unrewarded-deed-written-in-the-chronicles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The memory of the just is blessed: but the name of the wicked shall rot.* (Proverbs 10:7) — the two destinies: the conspirators on the gallows, the just man in the record.'
  FROM cross_reference_threads t
  JOIN _s317_esth02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s317_esth02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-2-the-unrewarded-deed-written-in-the-chronicles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_3.sql (Esther 3) -----
-- Book: Esther  chapter 3   book_slug=esther   edition=canon
-- Tag: esth03   session prefix: s317   temp view: _s317_esth03_lookup
-- Sort band: 32550.. (+1 per thread)
-- NOTE ON ESTHER: the divine NAME is not spoken in this book — Yahuah works by HIDDEN
--   PROVIDENCE. No divine-name reading is forced; the hand moves unseen behind the lot,
--   the long delay, the king's wrath, the unbowed knee.
--
-- Esther 3 coverage:
--   v.1-6  (Haman the Agagite promoted; Mordecai will not bow; Haman seeks to destroy
--          ALL the Jews = THE SEED-WAR — Amalek the sworn enemy warring on the covenant seed)
--          NT:     Revelation 12:17 (dragon makes war with the remnant of her seed) — USED
--          Extras: none warranted (kept the seed-war in canon's own voice; Wisdom/Jubilees
--                  seed-war slug already exists separately)
--          Tanakh: Exodus 17:16, Deuteronomy 25:19, 1 Samuel 15:9, 1 Samuel 15:33,
--                  Genesis 3:15, Psalm 83:4 — ALL USED
--   v.2-6  (Mordecai the Yahudi bowed not, nor did him reverence — covenant-loyalty)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Daniel 3:18 (the three who would not serve nor worship) — USED
--   v.7    (they cast Pur, that is, the lot, before Haman — from day to day, month to month)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Proverbs 16:33 (the lot is cast... the whole disposing is of Yahuah) — USED
--                  Esther 9:24 (Haman cast Pur... whence the feast of Purim is named) — USED
--   v.8-15 (the decree sealed with the king's ring: to destroy, to kill, to cause to perish
--          all Jews in one day — the genocidal hatred, Pharaoh/Haman/Herod pattern)
--          NT:     Revelation 12:13 (the dragon persecuted the woman) — USED (in thread 1)
--          Extras: none warranted
--          Tanakh: folded into thread 1 (the seed-war) — the decree IS the war's instrument
--
-- THREADS:
--   esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war (free? NO — Rev member is canon; ALL canon → free)
--        targets: Tanakh (Exod17, Deut25, 1Sam15, Gen3, Ps83) + NT (Rev12) — tier free
--   esther-3-but-mordecai-bowed-not-the-yahudi-who-would-not-reverence-haman (free)
--        targets: Tanakh (Dan3) — tier free
--   esther-3-they-cast-pur-the-lot-but-the-disposing-is-of-yahuah (free)
--        targets: Tanakh (Prov16, Esth9) — tier free
--   esther-3-the-dragons-wrath-the-decree-to-destroy-kill-and-cause-to-perish (free)
--        targets: NT (Rev12:13) — tier free
--
-- CONTESTED/LOAD-BEARING: Haman "the AGAGITE" (3:1,10) is framed as of the line of AGAG king
--   of Amalek (1 Sam 15) — Saul's failure to "utterly destroy" let Agag's line survive to
--   Haman; the genocidal plot is the serpent's war on the covenant seed (Gen 3:15), the same
--   enmity the dragon wages (Rev 12:17). The divine Name is ABSENT by design; deliverance comes
--   by hidden providence, never by a forced divine-name reading.

CREATE TEMP VIEW _s317_esth03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the seed-war — Haman the Agagite seeks to destroy ALL the Jews
    ('canon','esther',3,6, 'canon','exodus',17,16, 'free',
      E'*For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16). When Haman *sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom* (Esther 3:6), it was no new hatred but the old war renewed: Haman is *the Agagite* (3:1), of the line of Amalek, the nation Yahuah swore perpetual war against from generation to generation.'),
    ('canon','esther',3,6, 'canon','deuteronomy',25,19, 'free',
      E'*Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about... that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19). The charge to blot out Amalek went unfinished — and so the Amalekite line rose again in Haman, who *sought to destroy all the Yahudim (Jews)* (Esther 3:6); the un-blotted enemy returns to finish his war on the covenant people.'),
    ('canon','esther',3,1, 'canon','1-samuel',15,9, 'free',
      E'*But Saul and the people spared Agag... and would not utterly destroy them* (1 Samuel 15:9). Haman is *the son of Hammedatha the Agagite* (Esther 3:1) — Agag king of Amalek, whom Saul was commanded to destroy utterly and spared. The mercy shown to Amalek became, generations later, the sword raised over all the Yahudim (Jews); the spared seed of the enemy returns to devour.'),
    ('canon','esther',3,1, 'canon','1-samuel',15,33, 'free',
      E'*And Samuel said, As thy sword hath made women childless, so shall thy mother be childless among women. And Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal* (1 Samuel 15:33). Samuel finished what Saul left undone — yet the Agagite line endured to Haman *the son of Hammedatha the Agagite* (Esther 3:1); the seed-war does not end with one judgment but runs from generation to generation until it is wholly blotted out.'),
    ('canon','esther',3,6, 'canon','genesis',3,15, 'free',
      E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The whole canon runs on this enmity of the two seeds. Haman''s plot to *destroy all the Yahudim (Jews)* (Esther 3:6) is the serpent''s seed striking at the woman''s seed — the covenant people through whom the Promised One must come; annihilate them, and the heel-bruiser is never born.'),
    ('canon','esther',3,6, 'canon','psalms',83,4, 'free',
      E'*They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance* (Psalm 83:4). This is the very design of Haman, who *sought to destroy all the Yahudim (Jews)* in *one day* (Esther 3:6,13) — not merely to oppress but to *cut them off from being a nation*, to erase the covenant seed from the earth.'),
    ('canon','esther',3,6, 'canon','revelation',12,17, 'free',
      E'*And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17). The wrath of Haman, *full of wrath* (Esther 3:5), who *sought to destroy all the Yahudim (Jews)* (3:6), is the dragon''s same ancient fury — the war on the covenant seed that *keep the commandments*, waged through Pharaoh, through Haman, through every hand that rises against the woman''s offspring.'),
    -- THREAD 2: Mordecai bowed not
    ('canon','esther',3,2, 'canon','daniel',3,18, 'free',
      E'*But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18). As the three in Babylon would not bow to the image though the furnace blazed, so *Mordecai bowed not, nor did him reverence* (Esther 3:2), though the whole gate bent the knee to Haman — the covenant-loyal will not give to a man the reverence owed to Yahuah alone.'),
    -- THREAD 3: they cast Pur, the lot
    ('canon','esther',3,7, 'canon','proverbs',16,33, 'free',
      E'*The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33). Haman *cast Pur, that is, the lot... from day to day, and from month to month, to the twelfth month* (Esther 3:7) — and the lot fell on a day eleven months off, leaving the whole long room for deliverance. The enemy casts the lot, but the hidden hand disposes its falling; even the date of the genocide bends to providence.'),
    ('canon','esther',3,7, 'canon','esther',9,24, 'free',
      E'*Because Haman the son of Hammedatha, the Agagite, the enemy of all the Yahudim (Jews), had devised against the Yahudim (Jews) to destroy them, and had cast Pur, that is, the lot, to consume them, and to destroy them* (Esther 9:24). The lot Haman cast *before Haman* (Esther 3:7) gives the deliverance feast its very name — Purim, *after the name of Pur* (9:26); the enemy''s instrument of destruction becomes the everlasting memorial of his defeat.'),
    -- THREAD 4: the dragon's wrath / the decree
    ('canon','esther',3,13, 'canon','revelation',12,13, 'free',
      E'*And when the dragon saw that he was cast unto the earth, he persecuted the woman which brought forth the man child* (Revelation 12:13). The decree *to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day* (Esther 3:13) is the dragon''s persecution of the woman made law — the serpent striking at the covenant people in his short-timed wrath, the same hatred that armed Pharaoh and would arm Herod.')
  ) AS i(src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, tier, note)
  JOIN _s317_esth03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war',
       E'Haman the Agagite seeks to destroy all the Jews — the seed-war',
       E'*After these things did king Ahasuerus promote Haman the son of Hammedatha the Agagite* (Esther 3:1). The word *Agagite* carries the whole war. Agag was king of Amalek, the nation that fell on Yashar''el (Israel) coming out of Egypt, of whom Yahuah swore *that Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16) and commanded *thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19). When Saul *spared Agag... and would not utterly destroy them* (1 Samuel 15:9), the Amalekite line survived — and though *Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal* (1 Samuel 15:33), the un-blotted seed rose again in Haman. So when Mordecai *bowed not*, Haman *thought scorn to lay hands on Mordecai alone... wherefore Haman sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom of Ahasuerus* (Esther 3:6). This is no private grudge; it is the ancient enmity of the two seeds — *I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15). To wipe out the covenant people is to cut off the line through which the Promised One must come: *Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance* (Psalm 83:4). It is the dragon''s war made law — *the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17) — the same wrath that armed Pharaoh and would arm Herod, and the same that is undone, in this book, by a hand that is never named but never absent.',
       sv.verse_id, ev.verse_id, 'free', 32550
  FROM _s317_esth03_lookup sv, _s317_esth03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-3-but-mordecai-bowed-not-the-yahudi-who-would-not-reverence-haman',
       E'But Mordecai bowed not — the Yahudi who would not reverence Haman',
       E'*And all the king''s servants, that were in the king''s gate, bowed, and reverenced Haman: for the king had so commanded concerning him. But Mordecai bowed not, nor did him reverence* (Esther 3:2). The whole gate bent; one man stood. When pressed *Why transgressest thou the king''s commandment?* he answered only by his identity — *he had told them that he was a Yahudi (Jew)* (Esther 3:4). The unbowed knee is the mark of covenant-loyalty: the reverence demanded for Haman is the reverence owed to Yahuah alone. It is the same stand the three took in Babylon: *be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18). The covenant-faithful will obey the king in all things lawful, but where a man claims the worship due to Yahuah, they will not bow though the furnace is heated and the gallows is built.',
       sv.verse_id, ev.verse_id, 'free', 32551
  FROM _s317_esth03_lookup sv, _s317_esth03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-3-they-cast-pur-the-lot-but-the-disposing-is-of-yahuah',
       E'They cast Pur, the lot — but the disposing thereof is of Yahuah',
       E'*In the first month... they cast Pur, that is, the lot, before Haman from day to day, and from month to month, to the twelfth month, that is, the month Adar* (Esther 3:7). Haman turns to divination to fix the perfect day for genocide — and the lot falls on a day eleven months away, leaving an immense room of time in which deliverance can come. The book never says Yahuah turned the lot; it does not have to, for the canon already declares it: *The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33). The enemy casts; the hidden hand disposes. And the lot itself becomes the memorial of his ruin — *Haman the son of Hammedatha, the Agagite, the enemy of all the Yahudim (Jews)... had cast Pur, that is, the lot, to consume them* (Esther 9:24), whence the feast of deliverance is forever named Purim, *after the name of Pur* (9:26). The instrument of destruction is overturned into the name of joy.',
       sv.verse_id, ev.verse_id, 'free', 32552
  FROM _s317_esth03_lookup sv, _s317_esth03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-3-the-dragons-wrath-the-decree-to-destroy-kill-and-cause-to-perish',
       E'The dragon''s wrath — the decree to destroy, to kill, and to cause to perish',
       E'*And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day... and to take the spoil of them for a prey* (Esther 3:13). Sealed with the king''s own ring, the annihilation of a whole people becomes the law of the empire — *the king and Haman sat down to drink; but the city Shushan was perplexed* (3:15). Behind the human decree is the older wrath it serves: *when the dragon saw that he was cast unto the earth, he persecuted the woman which brought forth the man child* (Revelation 12:13). The threefold sentence — *to destroy, to kill, and to cause to perish* — is the serpent striking at the covenant people in his short-timed fury, the same hatred that drowned the sons of Yashar''el (Israel) under Pharaoh and would later seek the child under Herod, and the same that is, here, made to *return upon his own head* by a deliverance no man arranged.',
       sv.verse_id, ev.verse_id, 'free', 32553
  FROM _s317_esth03_lookup sv, _s317_esth03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16) — Haman the Agagite is Amalek, the enemy Yahuah swore perpetual war against.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19) — the un-blotted enemy returns in Haman.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Saul and the people spared Agag... and would not utterly destroy them* (1 Samuel 15:9) — the spared Agagite line survives to Haman the son of Hammedatha the Agagite.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal* (1 Samuel 15:33) — yet the Agagite seed endures; the seed-war runs from generation to generation.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15) — Haman''s plot is the serpent''s seed striking at the woman''s seed.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance* (Psalm 83:4) — the exact design of Haman against all the Yahudim (Jews).'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=83 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*The dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17) — Haman''s wrath is the dragon''s same ancient war on the covenant seed.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-haman-the-agagite-seeks-to-destroy-all-the-jews-the-seed-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*We will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18) — as the three would not bow, so Mordecai the Yahudi bowed not, nor did Haman reverence.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-but-mordecai-bowed-not-the-yahudi-who-would-not-reverence-haman'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33) — Haman casts Pur, but the falling of the lot bends to the hidden hand.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-they-cast-pur-the-lot-but-the-disposing-is-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Haman... had cast Pur, that is, the lot, to consume them, and to destroy them* (Esther 9:24) — the lot Haman cast becomes the name of the deliverance feast, Purim.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-they-cast-pur-the-lot-but-the-disposing-is-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When the dragon saw that he was cast unto the earth, he persecuted the woman which brought forth the man child* (Revelation 12:13) — the decree to destroy, kill, and cause to perish is the dragon''s persecution made law.'
  FROM cross_reference_threads t
  JOIN _s317_esth03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s317_esth03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-3-the-dragons-wrath-the-decree-to-destroy-kill-and-cause-to-perish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_4.sql (Esther 4) -----
-- Book: Esther, chapter 4 — Mordecai's charge and Esther's resolve (the book's theological heart)
-- Tag: esth04 | session prefix: s317 | temp view: _s317_esth04_lookup
-- Slug prefix: esther-4- | sort_order band start: 32575 (+1 per thread)
-- Source: canon 'esther' chapter 4. All quotes verbatim from dump_canon.py.
--
-- ⚠ HIDDEN-PROVIDENCE FRAMING: The divine NAME is never spoken in Esther — Yahuah works by
-- hidden providence. This chapter holds the book's theological heart. 4:14 "deliverance shall
-- arise to the Yahudim FROM ANOTHER PLACE... who knoweth whether thou art come to the kingdom
-- for SUCH A TIME AS THIS" implies, without naming, the certain covenant faithfulness of Yahuah
-- to preserve his people (the unnamed Deliverer is sure) AND Esther placed by the unseen hand
-- for this hour. The threads frame the providence as IMPLIED — they do NOT invent a divine-name
-- mention the text withholds by design. 4:16 "if I perish, I perish" is the intercessor risking
-- her life for the people — a faint type of the Deliverer who lays down his life.
--
-- Esther 4 coverage:
--   v.1-3 (Mordecai and all the Jews mourn — sackcloth, ashes, fasting, weeping):
--        NT:     none warranted (the corporate lament carries laterally in the Tanakh)
--        Extras: none warranted
--        Tanakh: Joel 2:12-13 (turn with fasting/weeping); Jonah 3:5,8 (fast in sackcloth
--                against a decree); Daniel 9:3 (sackcloth and ashes, supplication) -> THREAD 1
--   v.4-12 (Esther fears to go uninvited; the golden sceptre the only reprieve):
--        NT:     none warranted (narrative bridge; the fear answered in THREAD 4 resolve)
--        Extras: none warranted
--        Tanakh: none warranted (bridge to the charge)
--   v.13-14a (deliverance shall arise FROM ANOTHER PLACE — covenant faithfulness sure):
--        NT:     Romans 8:28 (all things work together for good) -> THREAD 2
--        Extras: none warranted (Gen 50:20 carries it cleanest)
--        Tanakh: Genesis 50:20 (evil meant for good, to save much people); Genesis 45:7
--                (sent to preserve a posterity by a great deliverance); Numbers 23:19 (Elohim
--                is not a man that he should lie); Psalm 33:10-11 (the counsel of Yahuah
--                standeth) -> THREAD 2
--   v.14b (who knoweth whether thou art come... for SUCH A TIME AS THIS — placed by providence):
--        NT:     Acts 17:26 (determined the times, the bounds of habitation); Ephesians 2:10
--                (created unto good works before ordained); Galatians 4:4 (the fulness of the
--                time) -> THREAD 3
--        Extras: none warranted
--        Tanakh: (the providence is implied; the NT names the ordained hour) -> THREAD 3
--   v.15-17 (the corporate fast and Esther's resolve — IF I PERISH, I PERISH):
--        NT:     John 15:13 (lay down his life for his friends); Acts 20:24 (count not my life
--                dear); Philippians 2:30 (nigh unto death, not regarding his life) -> THREAD 4
--        Extras: none warranted
--        Tanakh: Genesis 43:14 (if I be bereaved, I am bereaved); Daniel 3:17-18 (but if
--                not... we will not serve thy gods) -> THREAD 4
--
-- THREADS:
--   1 esther-4-mordecai-and-all-the-yahudim-mourn-in-sackcloth-and-ashes  [Tanakh] free
--   2 esther-4-deliverance-shall-arise-from-another-place  [Tanakh + NT] free
--   3 esther-4-who-knoweth-whether-thou-art-come-for-such-a-time-as-this  [NT] free
--   4 esther-4-go-in-unto-the-king-and-if-i-perish-i-perish  [Tanakh + NT] free
--
-- Framework framing: 4:14 is the keystone. The unnamed providence of Yahuah is certain to
-- PRESERVE his people — deliverance WILL arise "from another place" whether Esther acts or not
-- (Gen 50:20 evil-meant-for-good, Num 23:19 Elohim does not lie, Rom 8:28) — and Esther is
-- placed for this exact hour by the unseen hand (Acts 17:26 the times determined, Eph 2:10 the
-- works ordained, Gal 4:4 the fulness of time). No divine-name reading is forced; the Name is
-- withheld by design and the providence is read as implied. 4:16 "if I perish, I perish" is the
-- intercessor offering herself for the people — John 15:13's greater love foreshadowed.

CREATE TEMP VIEW _s317_esth04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Mordecai and all the Yahudim mourn in sackcloth and ashes
    ('canon','esther',4,3,'canon','joel',2,12,'free',
     E'When the decree of death came, the whole people turned to mourning -- *there was great mourning among the Yahudim (Jews), and fasting, and weeping, and wailing; and many lay in sackcloth and ashes* (Esther 4:3). This is the very posture Yahuah calls for through Joel: *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). The Name is unspoken in Esther, but the fast is the appointed turning of a covenant people toward the One they do not name.'),
    ('canon','esther',4,3,'canon','joel',2,13,'free',
     E'Joel names the heart of the fast and the hope hidden in it: *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). The Yahudim *in sackcloth and ashes* (Esther 4:3) mourn before a mercy the book never names aloud -- the gracious One who turns away the evil decreed.'),
    ('canon','esther',4,3,'canon','jonah',3,5,'free',
     E'A doomed people once fasted against a decree of destruction and were spared: *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5). The Yahudim do the same under Haman''s decree -- *fasting, and weeping, and wailing; and many lay in sackcloth and ashes* (Esther 4:3) -- the cry of those who hope the sentence may yet be reversed by an unseen hand.'),
    ('canon','esther',4,3,'canon','jonah',3,8,'free',
     E'Nineveh''s king commanded the whole city to cry out: *let them be covered with sackcloth, and cry mightily unto Elohim (God): yea, let them turn every one from his evil way, and from the violence that is in their hands* (Jonah 3:8). The Yahudim *in sackcloth* (Esther 4:3) cry the same cry, though the book keeps the Name silent -- the mighty cry toward the One who can reverse the decree.'),
    ('canon','esther',4,1,'canon','daniel',9,3,'free',
     E'Daniel, hearing of the appointed desolations of his people, set himself to the same fast: *And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes* (Daniel 9:3). Mordecai begins exactly here -- *Mordecai rent his clothes, and put on sackcloth with ashes, and went out into the midst of the city, and cried with a loud and a bitter cry* (Esther 4:1) -- sackcloth and ashes, the body bent toward the One the exile sought when his people stood under sentence of death.'),

    -- THREAD 2: deliverance shall arise from another place (covenant faithfulness sure)
    ('canon','esther',4,14,'canon','genesis',50,20,'free',
     E'Mordecai is certain the deliverance does not hang on Esther: *if thou altogether holdest thy peace at this time, then shall there enlargement and deliverance arise to the Yahudim (Jews) from another place* (Esther 4:14). Joseph spoke that same hidden hand to the brothers who sold him: *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). What men mean for destruction, the unnamed providence bends to deliverance -- "from another place" is the place no man can name and none can shut.'),
    ('canon','esther',4,14,'canon','genesis',45,7,'free',
     E'The pattern is old: a hidden providence sends a deliverer ahead of the famine to preserve the seed. *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* (Genesis 45:7). Mordecai trusts the same certainty -- *deliverance arise to the Yahudim (Jews) from another place* (Esther 4:14) -- that Yahuah preserves his covenant people though his Name be never spoken in the book.'),
    ('canon','esther',4,14,'canon','numbers',23,19,'free',
     E'The ground of the certainty is the unchanging word: *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). Because the covenant promise to preserve the seed cannot fail, Mordecai can stake everything on it -- *deliverance arise to the Yahudim (Jews) from another place* (Esther 4:14) -- the Deliverer the book never names, but whose faithfulness it assumes.'),
    ('canon','esther',4,14,'canon','psalms',33,10,'free',
     E'Haman''s decree is a device of the heathen, and such devices do not stand: *Yahuah (LORD) bringeth the counsel of the heathen to nought: he maketh the devices of the people of none effect* (Psalm 33:10). Mordecai already sees the end of the plot -- *deliverance arise to the Yahudim (Jews) from another place* (Esther 4:14) -- the enemy''s counsel brought to nought by a hand that works behind the throne.'),
    ('canon','esther',4,14,'canon','psalms',33,11,'free',
     E'Against the device that fails stands the counsel that never does: *The counsel of Yahuah (LORD) standeth for ever, the thoughts of his heart to all generations* (Psalm 33:11). The *deliverance* that shall *arise to the Yahudim (Jews) from another place* (Esther 4:14) is not chance but the standing counsel of the One the book leaves unnamed -- his purpose toward his people unbroken to all generations.'),
    ('canon','esther',4,14,'canon','romans',8,28,'free',
     E'Paul gathers the whole providence into one word: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). This is Mordecai''s confidence stated as doctrine -- the threatened decree, the queen in the palace, the silence of the Name all worked together so that *deliverance arise to the Yahudim (Jews) from another place* (Esther 4:14). Nothing is loose; all serves the purpose of the One who calls and preserves his people.'),

    -- THREAD 3: who knoweth whether thou art come for such a time as this (placed by providence)
    ('canon','esther',4,14,'canon','acts',17,26,'free',
     E'Mordecai reads Esther''s throne as no accident: *who knoweth whether thou art come to the kingdom for such a time as this?* (Esther 4:14). Paul names the hand that sets such hours and stations: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The time and the place of Esther''s reign were determined before appointed -- the unseen providence had set her precisely for this hour.'),
    ('canon','esther',4,14,'canon','ephesians',2,10,'free',
     E'The works of this hour were prepared before she was ever queen: *For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* (Ephesians 2:10). Esther *come to the kingdom for such a time as this* (Esther 4:14) is exactly this -- the servant placed by the unseen hand to walk in the deliverance ordained beforehand for her to do.'),
    ('canon','esther',4,14,'canon','galatians',4,4,'free',
     E'The same providence keeps the great appointed hour: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). The hour for which Esther was raised up -- *for such a time as this* (Esther 4:14) -- is a small mirror of the fulness of the time, the One who governs every appointed moment placing his servant for the deliverance of his people.'),

    -- THREAD 4: go in unto the king, and if I perish, I perish (the intercessor offers herself)
    ('canon','esther',4,16,'canon','genesis',43,14,'free',
     E'Esther resolves to risk her life with the same surrender Jacob spoke when he sent Benjamin into danger: *And El Shaddai (God Almighty) give you mercy before the man, that he may send away your other brother, and Benjamin. If I be bereaved of my children, I am bereaved* (Genesis 43:14). Esther says it of herself -- *so will I go in unto the king, which is not according to the law: and if I perish, I perish* (Esther 4:16) -- mercy sought before the man, the outcome surrendered to the unnamed hand.'),
    ('canon','esther',4,16,'canon','daniel',3,17,'free',
     E'The three Hebrews answered the king with the same all-or-nothing trust before a death sentence: *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king* (Daniel 3:17). Esther steps toward the same fire -- *if I perish, I perish* (Esther 4:16) -- certain of the Deliverer whether or not she lives to see it.'),
    ('canon','esther',4,16,'canon','daniel',3,18,'free',
     E'And the Hebrews held their ground even past deliverance: *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18). This is the courage of Esther''s *if I perish, I perish* (Esther 4:16) -- obedience that does not bargain with the outcome, the servant willing to die for the covenant people.'),
    ('canon','esther',4,16,'canon','john',15,13,'free',
     E'Esther offers her own life for her people, a faint type of the Deliverer the book will not name: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Her *if I perish, I perish* (Esther 4:16) -- the intercessor going uninvited into death''s court for the Yahudim -- foreshadows the One who would lay down his life for the very people Esther steps forward to save.'),
    ('canon','esther',4,16,'canon','acts',20,24,'free',
     E'Paul carried the same indifference to his own life for the sake of his calling: *But none of these things move me, neither count I my life dear unto myself, so that I might finish my course with joy, and the ministry, which I have received of the Lord Yahusha (Lord Jesus)* (Acts 20:24). Esther counts her life not dear -- *if I perish, I perish* (Esther 4:16) -- the servant who will spend her life to finish the work set before her.'),
    ('canon','esther',4,16,'canon','philippians',2,30,'free',
     E'Epaphroditus is praised for the same self-offering: *Because for the work of Messiah (Christ) he was nigh unto death, not regarding his life, to supply your lack of service toward me* (Philippians 2:30). Esther goes nigh unto death not regarding her life -- *if I perish, I perish* (Esther 4:16) -- the willingness to be spent for the people that the unnamed providence honours.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-4-mordecai-and-all-the-yahudim-mourn-in-sackcloth-and-ashes',
       E'Mordecai and all the Yahudim mourn in sackcloth and ashes',
       E'When the decree of death is published, the whole people falls to mourning. *Mordecai rent his clothes, and put on sackcloth with ashes, and went out into the midst of the city, and cried with a loud and a bitter cry* (Esther 4:1); *in every province... there was great mourning among the Yahudim (Jews), and fasting, and weeping, and wailing; and many lay in sackcloth and ashes* (Esther 4:3). The Name of Yahuah is never spoken in this book, yet the fast is the appointed turning of a covenant people toward the One they do not name. It is the very posture Yahuah commands through Joel: *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12); *rend your heart, and not your garments... for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). A doomed city once fasted against a decree and was spared -- *the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5); *let them... cry mightily unto Elohim (God)* (Jonah 3:8). And Daniel, hearing of his people''s desolations, did the same -- *I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes* (Daniel 9:3). The mourning of the Yahudim is the cry of those who hope the sentence may yet be reversed by the unseen hand.',
       sv.verse_id, ev.verse_id, 'free', 32575
  FROM _s317_esth04_lookup sv, _s317_esth04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-4-deliverance-shall-arise-from-another-place',
       E'Deliverance shall arise to the Yahudim from another place',
       E'Here is the theological heart of the book, spoken without the Name. Mordecai is certain the rescue of the people does not finally hang on Esther: *if thou altogether holdest thy peace at this time, then shall there enlargement and deliverance arise to the Yahudim (Jews) from another place; but thou and thy father''s house shall be destroyed* (Esther 4:14). "From another place" is the place no man can name and none can shut -- the covenant faithfulness of Yahuah to preserve his people is sure, the unnamed Deliverer certain. Joseph spoke that same hidden hand to the brothers who sold him: *ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20); *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* (Genesis 45:7). The ground of the certainty is the unchanging word: *Elohim (God) is not a man, that he should lie... hath he said, and shall he not do it?* (Numbers 23:19). Haman''s decree is a device of the heathen, and such devices fail -- *Yahuah (LORD) bringeth the counsel of the heathen to nought... The counsel of Yahuah (LORD) standeth for ever* (Psalm 33:10-11). Paul gathers it into one word: *all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). The book withholds the Name by design; the providence is implied, and it is unbreakable.',
       sv.verse_id, ev.verse_id, 'free', 32576
  FROM _s317_esth04_lookup sv, _s317_esth04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-4-who-knoweth-whether-thou-art-come-for-such-a-time-as-this',
       E'Who knoweth whether thou art come for such a time as this',
       E'Mordecai reads Esther''s throne as no accident of fortune: *and who knoweth whether thou art come to the kingdom for such a time as this?* (Esther 4:14). The same hand that bends evil to deliverance set her station and her hour. Paul names that hand: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) -- the time and the place of Esther''s reign determined before appointed. The works of this hour were prepared before she was ever queen: *For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* (Ephesians 2:10). And the providence that governs the great appointed hour keeps the small ones too: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). Esther *come to the kingdom for such a time as this* is the servant placed by the unseen hand for the deliverance ordained beforehand -- a small mirror of the fulness of the time. The Name is unspoken, but the appointment is sure.',
       sv.verse_id, ev.verse_id, 'free', 32577
  FROM _s317_esth04_lookup sv, _s317_esth04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-4-go-in-unto-the-king-and-if-i-perish-i-perish',
       E'Go in unto the king — and if I perish, I perish',
       E'Esther answers the charge not with calculation but with surrender. *Go, gather together all the Yahudim (Jews) that are present in Shushan, and fast ye for me, and neither eat nor drink three days, night or day: I also and my maidens will fast likewise; and so will I go in unto the king, which is not according to the law: and if I perish, I perish* (Esther 4:16). She calls the corporate fast and then offers her own life for the people. It is Jacob''s surrender when he sent Benjamin into danger -- *If I be bereaved of my children, I am bereaved* (Genesis 43:14) -- the outcome handed to the unnamed hand. It is the three Hebrews'' all-or-nothing trust before the furnace -- *our Elohim (God) whom we serve is able to deliver us... But if not, be it known unto thee, O king, that we will not serve thy gods* (Daniel 3:17-18) -- obedience that will not bargain with the outcome. And it is a faint type of the Deliverer the book never names: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Like Paul -- *neither count I my life dear unto myself, so that I might finish my course* (Acts 20:24) -- and like Epaphroditus -- *for the work of Messiah (Christ) he was nigh unto death, not regarding his life* (Philippians 2:30) -- the intercessor goes uninvited into death''s court to save the people. The fast seeks the deliverance the book is certain will come; Esther will spend her life to be its hand.',
       sv.verse_id, ev.verse_id, 'free', 32578
  FROM _s317_esth04_lookup sv, _s317_esth04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1: Mordecai and all the Yahudim mourn in sackcloth and ashes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joel 2:12 — *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning*: the appointed posture of the mourning Yahudim.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-mordecai-and-all-the-yahudim-mourn-in-sackcloth-and-ashes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joel 2:13 — *rend your heart... for he is gracious and merciful*: the mercy the book never names, hidden in the fast.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-mordecai-and-all-the-yahudim-mourn-in-sackcloth-and-ashes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jonah 3:5 — *proclaimed a fast, and put on sackcloth*: a doomed people fasting against a decree and spared.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-mordecai-and-all-the-yahudim-mourn-in-sackcloth-and-ashes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jonah 3:8 — *cry mightily unto Elohim*: the cry toward the One who can reverse the decree.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-mordecai-and-all-the-yahudim-mourn-in-sackcloth-and-ashes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Daniel 9:3 — *fasting, and sackcloth, and ashes*: the exile''s posture when his people stand under sentence, matching Mordecai 4:1.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-mordecai-and-all-the-yahudim-mourn-in-sackcloth-and-ashes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: deliverance shall arise from another place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 50:20 — *ye thought evil against me; but Elohim meant it unto good... to save much people alive*: the hidden hand that bends evil to deliverance.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-deliverance-shall-arise-from-another-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 45:7 — *Elohim sent me before you to preserve you a posterity... by a great deliverance*: the providence that preserves the seed.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-deliverance-shall-arise-from-another-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 23:19 — *Elohim is not a man, that he should lie*: the unchanging word that grounds the certainty of deliverance.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-deliverance-shall-arise-from-another-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 33:10 — *Yahuah bringeth the counsel of the heathen to nought*: Haman''s device brought to nought by the hand behind the throne.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-deliverance-shall-arise-from-another-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 33:11 — *The counsel of Yahuah standeth for ever*: the standing counsel behind the deliverance from another place.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-deliverance-shall-arise-from-another-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Romans 8:28 — *all things work together for good... to them who are the called according to his purpose*: Mordecai''s confidence stated as doctrine.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-deliverance-shall-arise-from-another-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: who knoweth whether thou art come for such a time as this
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Acts 17:26 — *hath determined the times before appointed, and the bounds of their habitation*: Esther''s hour and station set by the unseen hand.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-who-knoweth-whether-thou-art-come-for-such-a-time-as-this'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ephesians 2:10 — *unto good works, which Elohim hath before ordained that we should walk in them*: the works of this hour prepared beforehand.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-who-knoweth-whether-thou-art-come-for-such-a-time-as-this'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Galatians 4:4 — *when the fulness of the time was come*: the providence that keeps every appointed hour, the great and the small.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-who-knoweth-whether-thou-art-come-for-such-a-time-as-this'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: go in unto the king, and if I perish, I perish
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 43:14 — *If I be bereaved of my children, I am bereaved*: Jacob''s surrender of the outcome to the unnamed hand, echoed in Esther.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-go-in-unto-the-king-and-if-i-perish-i-perish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Daniel 3:17 — *our Elohim whom we serve is able to deliver us*: all-or-nothing trust before a death sentence.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-go-in-unto-the-king-and-if-i-perish-i-perish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Daniel 3:18 — *But if not... we will not serve thy gods*: obedience that does not bargain with the outcome.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-go-in-unto-the-king-and-if-i-perish-i-perish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends*: Esther a faint type of the Deliverer.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-go-in-unto-the-king-and-if-i-perish-i-perish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Acts 20:24 — *neither count I my life dear unto myself, so that I might finish my course*: the servant who spends her life to finish the work.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-go-in-unto-the-king-and-if-i-perish-i-perish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Philippians 2:30 — *he was nigh unto death, not regarding his life*: the same self-offering for the people Esther shows.'
  FROM cross_reference_threads t
  JOIN _s317_esth04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s317_esth04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-4-go-in-unto-the-king-and-if-i-perish-i-perish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_5.sql (Esther 5) -----
-- Book: Esther  Chapter: 5  (book_slug=esther, edition=canon)
-- Tag: esth05   Session prefix: s317   Temp view: _s317_esth05_lookup
-- Sort band: 32600 (+1 per thread)
-- NOTE ON ESTHER: the divine NAME is never spoken in this book — Yahuah (LORD) works by
--   HIDDEN PROVIDENCE. Threads framed around the unseen hand turning the king's heart, the
--   wise patience that lets providence ripen, and pride digging its own pit. No divine-name
--   mention is invented; the connection is the principle the wisdom literature names openly.
--
-- Esther 5 coverage:
--   v.1-3  (the golden sceptre held out — favour at the moment of risk, answering the fast)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Proverbs 21:1 (the king's heart in the hand of Yahuah), Proverbs 16:7
--                  (when a man's ways please Yahuah he maketh his enemies at peace) — USED
--   v.4-8  (Esther's wisdom — two banquets, prudent timing rather than blurting the request)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Proverbs 15:23 (a word spoken in due season), Ecclesiastes 3:7 (a time to
--                  keep silence and a time to speak) — USED. (Prov 25:11/16:9 weighed,
--                  Prov 15:23 + Eccl 3:7 carry the weave more sharply; not added to avoid dump.)
--   v.9-14 (Haman's pride; the gallows he builds becomes his own undoing — snare on the snarer)
--          NT:     Galatians 6:7 (whatsoever a man soweth, that shall he also reap) — USED
--          Extras: none warranted
--          Tanakh: Proverbs 16:18 (pride goeth before destruction), Proverbs 26:27 (whoso
--                  diggeth a pit shall fall therein), Psalm 7:15-16 (he made a pit and is
--                  fallen into the ditch he made; his mischief returns on his own head),
--                  Psalm 9:15-16 (the heathen are sunk in the pit they made; the wicked is
--                  snared in the work of his own hands) — USED. (Prov 29:23/Obad 1:15 weighed;
--                  the pit-digging set is the keystone, kept tight.)
--
-- THREADS (all members canon Tanakh + NT Galatians → tier 'free' throughout):
--   esther-5-the-golden-sceptre-held-out-the-kings-heart-turned        (Prov 21:1, Prov 16:7)
--   esther-5-a-word-in-due-season-the-wisdom-of-the-two-banquets       (Prov 15:23, Eccl 3:7)
--   esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger
--                                          (Prov 16:18, Prov 26:27, Ps 7:15-16, Ps 9:15-16, Gal 6:7)

CREATE TEMP VIEW _s317_esth05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the sceptre held out — the unseen hand turning the king's heart
    ('canon','esther',5,2,'canon','proverbs',21,1,'free',
      E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* (Proverbs 21:1). Esther, having fasted, stands in the inner court at the risk of her life, and *the king held out to Esther the golden sceptre that was in his hand* (Esther 5:2) — the book never names Yahuah (LORD), yet the favour granted at the moment of risk is exactly this: the king''s heart turned by the unseen hand whithersoever He will.'),
    ('canon','esther',5,2,'canon','proverbs',16,7,'free',
      E'*When a man''s ways please Yahuah (LORD), he maketh even his enemies to be at peace with him.* (Proverbs 16:7). Esther came out of the fast, *and it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight* (Esther 5:2) — the hostile court, where to come unbidden is death, is turned favourable; the enemy''s throne becomes a place of peace by the hidden providence answering the prayer.'),
    -- Thread 2: a word in due season — the wisdom of the two banquets
    ('canon','esther',5,8,'canon','proverbs',15,23,'free',
      E'*A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* (Proverbs 15:23). Esther does not blurt her petition though the king twice offers *to the half of the kingdom*; she invites him and Haman to a banquet, and then to a second — *I will do to morrow as the king hath said* (Esther 5:8). The prudent timing is *a word spoken in due season*: she lets the providence ripen rather than spending the moment too soon.'),
    ('canon','esther',5,8,'canon','ecclesiastes',3,7,'free',
      E'*A time to rend, and a time to sew; a time to keep silence, and a time to speak.* (Ecclesiastes 3:7). Esther knows there is *a time to keep silence, and a time to speak*: pressed for her request, she holds it back and prepares a second banquet (Esther 5:8), waiting for the hour when the word will land. The wisdom of the two banquets is the discernment of the appointed time.'),
    -- Thread 3: the gallows Haman built — pride before the fall, the pit on its digger
    ('canon','esther',5,11,'canon','proverbs',16,18,'free',
      E'*Pride goeth before destruction, and an haughty spirit before a fall.* (Proverbs 16:18). Haman *told them of the glory of his riches, and the multitude of his children, and all the things wherein the king had promoted him* (Esther 5:11) — the very catalogue of his pride; and *pride goeth before destruction*, for the man boasting of his advancement is one banquet away from the fall.'),
    ('canon','esther',5,14,'canon','proverbs',26,27,'free',
      E'*Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him.* (Proverbs 26:27). At his wife''s counsel Haman *caused the gallows to be made* fifty cubits high for Mordecai (Esther 5:14) — but *whoso diggeth a pit shall fall therein*: the gallows raised to hang the Yahudi (Jew) is the very gallows on which Haman will himself be hanged.'),
    ('canon','esther',5,14,'canon','psalms',7,15,'free',
      E'*He made a pit, and digged it, and is fallen into the ditch which he made.* (Psalm 7:15). Haman *caused the gallows to be made* (Esther 5:14), digging the pit for another; but he *is fallen into the ditch which he made* — the engine of malice prepared for Mordecai swallows its own builder.'),
    ('canon','esther',5,14,'canon','psalms',7,16,'free',
      E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* (Psalm 7:16). The gallows Haman built that day (Esther 5:14) is the mischief that *shall return upon his own head*: the violence devised against the righteous comes down upon the head that devised it.'),
    ('canon','esther',5,14,'canon','psalms',9,15,'free',
      E'*The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* (Psalm 9:15). Haman, full of indignation, set the snare — *let a gallows be made of fifty cubits high* (Esther 5:14); but *in the net which they hid is their own foot taken*: the proud Agagite is sunk in the pit of his own making.'),
    ('canon','esther',5,14,'canon','psalms',9,16,'free',
      E'*Yahuah (LORD) is known by the judgment which he executeth: the wicked is snared in the work of his own hands. Higgaion. Selah.* (Psalm 9:16). The unseen hand that turned the king''s heart now turns the snare: Haman is *snared in the work of his own hands*, the gallows he caused to be made (Esther 5:14) — and so even where the Name is never spoken, Yahuah (LORD) *is known by the judgment which he executeth*.'),
    ('canon','esther',5,14,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7). Haman sows death — *he caused the gallows to be made* (Esther 5:14) — and *whatsoever a man soweth, that shall he also reap*: the harvest of the gallows is reaped by the sower himself, the same hidden justice the wisdom of the Tanakh declares carried forward.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-5-the-golden-sceptre-held-out-the-kings-heart-turned',
       E'The Golden Sceptre Held Out — the King''s Heart in the Hand of Yahuah',
       E'Esther comes out of the three-day fast and does the unlawful thing: she *put on her royal apparel, and stood in the inner court of the king''s house* (Esther 5:1), where to come unbidden is death. *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand* (Esther 5:2). The book of Esther never once speaks the Name — yet the favour granted at the very moment of risk is the unseen hand at work. **The wisdom literature names openly what Esther only shows:** *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1) — the absolute monarch''s heart is a channel Yahuah (LORD) bends like water. And *When a man''s ways please Yahuah (LORD), he maketh even his enemies to be at peace with him* (Proverbs 16:7): the hostile court, where the queen risks her life to enter, is turned to peace, the enemy''s throne become a place of mercy. The fast was answered before a word of the petition was spoken.',
       sv.verse_id, ev.verse_id, 'free', 32600
  FROM _s317_esth05_lookup sv, _s317_esth05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-5-a-word-in-due-season-the-wisdom-of-the-two-banquets',
       E'A Word in Due Season — the Wisdom of the Two Banquets',
       E'Twice the king lays the kingdom open before Esther — *What is thy petition? and it shall be granted thee: and what is thy request? even to the half of the kingdom it shall be performed* (Esther 5:6). A lesser hand would have seized the open door and blurted the plea. Esther does not. She invites the king and Haman to a banquet, and at the banquet asks only for a second: *let the king and Haman come to the banquet that I shall prepare for them, and I will do to morrow as the king hath said* (Esther 5:8). This is not timidity but wisdom letting the providence ripen. *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* (Proverbs 15:23) — the right word at the wrong hour is wasted; Esther waits for the *due season*. *To every thing there is a season... A time to rend, and a time to sew; a time to keep silence, and a time to speak* (Ecclesiastes 3:7): she discerns the time, keeping silence one more night so the word will land with full weight — the very night, as it falls out, that the king cannot sleep and Mordecai''s old kindness is read out of the records.',
       sv.verse_id, ev.verse_id, 'free', 32601
  FROM _s317_esth05_lookup sv, _s317_esth05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger',
       E'The Gallows Haman Built — Pride Before the Fall, the Pit on Its Own Digger',
       E'Haman goes out *joyful and with a glad heart*, but the sight of one man who will not bow undoes him: *when Haman saw Mordecai in the king''s gate, that he stood not up, nor moved for him, he was full of indignation* (Esther 5:9). At home he parades his pride — *the glory of his riches, and the multitude of his children, and all the things wherein the king had promoted him* (Esther 5:11) — yet confesses *all this availeth me nothing, so long as I see Mordecai the Yahudi (Jew) sitting at the king''s gate* (Esther 5:13). His wife and friends counsel a gallows fifty cubits high, *and he caused the gallows to be made* (Esther 5:14). The whole Tanakh has already written his end. *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27). David sang it of every such schemer: *He made a pit, and digged it, and is fallen into the ditch which he made. His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:15-16); *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken. Yahuah (LORD) is known by the judgment which he executeth: the wicked is snared in the work of his own hands* (Psalm 9:15-16). Where the Name is never spoken, Yahuah (LORD) is *known by the judgment which he executeth* — for the gallows raised for Mordecai becomes the gallows Haman himself swings from. The New Testament gathers the same law into one sentence: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7).',
       sv.verse_id, ev.verse_id, 'free', 32602
  FROM _s317_esth05_lookup sv, _s317_esth05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will* (Proverbs 21:1) — the unseen hand bending the absolute monarch''s heart, the providence answering the fast as the sceptre is held out.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-golden-sceptre-held-out-the-kings-heart-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*When a man''s ways please Yahuah (LORD), he maketh even his enemies to be at peace with him* (Proverbs 16:7) — the hostile court turned favourable, the enemy''s throne become a place of mercy for the queen who risked death to enter.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-golden-sceptre-held-out-the-kings-heart-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A word spoken in due season, how good is it!* (Proverbs 15:23) — Esther holds her petition for the second banquet, the prudent timing that lets the providence ripen rather than spending the moment too soon.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-a-word-in-due-season-the-wisdom-of-the-two-banquets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A time to keep silence, and a time to speak* (Ecclesiastes 3:7) — the discernment of the appointed time; Esther keeps silence one more night so the word will land with full weight.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-a-word-in-due-season-the-wisdom-of-the-two-banquets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — Haman''s catalogue of riches, children, and promotion (Esther 5:11) is the very pride that precedes his fall.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whoso diggeth a pit shall fall therein* (Proverbs 26:27) — the gallows raised to hang Mordecai (Esther 5:14) is the very gallows Haman will himself hang upon.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15) — the engine of malice prepared for the righteous swallows its own builder.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16) — the violence devised against Mordecai comes down upon the head that devised it.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken* (Psalm 9:15) — the proud Agagite sunk in the pit of his own making.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah (LORD) is known by the judgment which he executeth: the wicked is snared in the work of his own hands* (Psalm 9:16) — where the Name is never spoken in Esther, He is yet known by the judgment that snares Haman in the work of his own hands.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — the New Testament gathers the law of the pit-digger into one sentence; Haman sows the gallows and reaps it himself.'
  FROM cross_reference_threads t
  JOIN _s317_esth05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s317_esth05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-5-the-gallows-haman-built-pride-before-the-fall-pit-on-its-digger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_6.sql (Esther 6) -----
-- Book: Esther  Chapter: 6   Tag: esth06   Session prefix: s317
-- Sort band start: 32625 (+1 per thread)
-- Source book_slug=esther, edition canon. ⚠ Esther: the divine NAME is unspoken; Yahuah
-- works by HIDDEN PROVIDENCE. The providence is the thread, the Name unspoken by design.
--
-- Esther 6 coverage:
--   v.1-3  (the king could not sleep; the chronicle of Mordecai read) — PROVIDENTIAL TIMING
--          NT:     Romans 8:28 (all things work together for good) — used
--          Extras: none warranted (the canon providence-of-the-night witnesses carry it)
--          Tanakh: Psalm 121:4 (he that keepeth Yashar'el shall neither slumber nor sleep);
--                  Proverbs 21:1 (the king's heart is in the hand of Yahuah); Daniel 2:21
--                  (he changeth the times and the seasons); Proverbs 16:9 (a man's heart
--                  deviseth his way: but Yahuah directeth his steps); Job 33:15-17 (Elohim
--                  speaking in the night, withdrawing man from his purpose) — all used
--   v.4-11 (the great reversal: Haman forced to honour Mordecai) — PRIDE ABASED, HUMBLE EXALTED
--          NT:     Luke 1:51-52 (put down the mighty, exalted them of low degree=Magnificat);
--                  Luke 14:11 (whosoever exalteth himself shall be abased) — used
--          Extras: none warranted (the canon Magnificat-pattern witnesses carry it)
--          Tanakh: Proverbs 16:18 (pride goeth before destruction); 1 Samuel 2:7 (Yahuah
--                  maketh poor, and maketh rich; bringeth low, and lifteth up); Psalm 75:6-7
--                  (promotion cometh not from east/west; Elohim putteth down one, setteth up
--                  another) — used. NT Jas 4:6 also weighed; folded as a member.
--   v.12-14 (the enemies confess: thou shalt not prevail against the seed of the Yahudim)
--          NT:     none warranted (the seed-promise root is Tanakh; no forced NT add)
--          Extras: none warranted
--          Tanakh: Genesis 12:3 (curse him that curseth thee); Numbers 24:9 (cursed is he
--                  that curseth thee); Isaiah 54:17 (no weapon formed against thee shall
--                  prosper); Zechariah 2:8 (he that toucheth you toucheth the apple of his
--                  eye) — all used
--
-- Threads:
--   esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers
--       (free; targets: Tanakh Ps121:4, Prov21:1, Dan2:21, Prov16:9, Job33:15 + NT Rom8:28)
--   esther-6-the-great-reversal-pride-abased-and-the-humble-exalted
--       (free; targets: Tanakh Prov16:18, 1Sam2:7, Ps75:6, Ps75:7 + NT Luke1:51, Luke1:52,
--        Luke14:11, Jas4:6)
--   esther-6-thou-shalt-not-prevail-against-the-seed-of-the-yahudim
--       (free; targets: Tanakh Gen12:3, Num24:9, Isa54:17, Zech2:8)
--
-- Framework-load-bearing / framing notes:
--   * 6:1 "could not the king sleep" = HIDDEN PROVIDENCE, not a named theophany. Framed as the
--     Keeper who neither slumbers nor sleeps (Ps121:4) bending the king's heart (Prov21:1),
--     changing the times (Dan2:21), directing his steps (Prov16:9), speaking in the night
--     (Job33:15). Divine NAME deliberately NOT inserted — the Name is unspoken in Esther.
--   * 6:4-11 the reversal = the Magnificat pattern in narrative: pride abased, the humble
--     exalted (Luke1:51-52 / Luke14:11 / 1Sam2:7 / Ps75:6-7 / Prov16:18 / Jas4:6).
--   * 6:13 "the seed of the Yahudim... thou shalt not prevail" = the covenant seed cannot be
--     overcome (Gen12:3 / Num24:9 the Balaam blessing / Isa54:17 / Zech2:8 apple of the eye).

CREATE TEMP VIEW _s317_esth06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the sleepless night / hidden providence (source 6:1)
    ('canon','esther',6,1,'canon','psalms',121,4,'free',
     E'*Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). On the one night out of all nights, *could not the king sleep* (Esther 6:1) — and the king''s wakefulness is the wakefulness of the Keeper above him, who never sleeps over his people. The Name is unspoken in Esther, yet the providence is unmistakable: the unsleeping One holds the hour.'),
    ('canon','esther',6,1,'canon','proverbs',21,1,'free',
     E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). When *could not the king sleep* (Esther 6:1), and his hand reached for the very chronicle that recorded Mordecai''s deed, the king''s heart was being turned by a hand he could not see — to the salvation of the covenant people at the exact hour Haman came to seek their death.'),
    ('canon','esther',6,1,'canon','daniel',2,21,'free',
     E'*And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* (Daniel 2:21). The God who orders the times is the one who set THIS night and THIS reading; *could not the king sleep* (Esther 6:1) is the changing of an hour, an exquisite stroke of the same hand that rules over the kingdoms of men.'),
    ('canon','esther',6,1,'canon','proverbs',16,9,'free',
     E'*A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9). Haman devised the gallows; the king devised nothing but a restless night — yet the steps of both were directed. *Could not the king sleep... and they were read before the king* (Esther 6:1): the man''s sleeplessness is the Director''s appointment.'),
    ('canon','esther',6,1,'canon','job',33,15,'free',
     E'*In a dream, in a vision of the night, when deep sleep falleth upon men, in slumberings upon the bed; Then he openeth the ears of men, and sealeth their instruction, That he may withdraw man from his purpose* (Job 33:15-17). Where most men receive the night''s instruction in sleep, this king receives it in WAKEFULNESS — *could not the king sleep* (Esther 6:1) — and so his ears are opened to the record of Mordecai, withdrawing him from the purpose Haman had laid.'),
    ('canon','esther',6,1,'canon','romans',8,28,'free',
     E'*And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). A king''s insomnia, an unrewarded deed buried in a chronicle, an enemy''s early arrival at court — every thread is woven for good. *On that night could not the king sleep* (Esther 6:1) is the masterpiece of timing that proves it.'),

    -- Thread 2: the great reversal / pride abased, humble exalted (source 6:6, end 6:11)
    ('canon','esther',6,6,'canon','proverbs',16,18,'free',
     E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). *Now Haman thought in his heart, To whom would the king delight to do honour more than to myself?* (Esther 6:6) — and the haughty spirit that dressed the honour for itself was made to drape it on the very man it came to hang. The proverb walks out in narrative.'),
    ('canon','esther',6,6,'canon','1-samuel',2,7,'free',
     E'*Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7). Hannah''s song is enacted in one morning: Haman brought low, Mordecai the Yahudi (Jew) lifted up upon the king''s horse. The hidden hand that *could not the king sleep* now answers Haman''s proud heart (Esther 6:6) with abasement.'),
    ('canon','esther',6,6,'canon','psalms',75,6,'free',
     E'*For promotion cometh neither from the east, nor from the west, nor from the south* (Psalm 75:6). Haman sought promotion from the king''s own mouth, *thought in his heart, To whom would the king delight to do honour more than to myself?* (Esther 6:6) — but promotion comes from none of the four winds, and the honour he described was turned to another.'),
    ('canon','esther',6,6,'canon','psalms',75,7,'free',
     E'*But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7). The whole reversal of Esther 6 is this single verse made flesh — one put down, one set up — answering the proud heart that asked *To whom would the king delight to do honour more than to myself?* (Esther 6:6).'),
    ('canon','esther',6,6,'canon','luke',1,51,'free',
     E'*He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts* (Luke 1:51). Miriam''s (Mary''s) song names exactly Haman''s undoing: *Now Haman thought in his heart, To whom would the king delight to do honour more than to myself?* (Esther 6:6) — the proud scattered in the very imagination of his heart.'),
    ('canon','esther',6,6,'canon','luke',1,52,'free',
     E'*He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The Magnificat is the song of Esther 6: the mighty Haman put down, Mordecai of low degree exalted on horseback through the city. The proud heart of *To whom would the king delight to do honour more than to myself?* (Esther 6:6) is brought low by the same pattern Miriam (Mary) sings.'),
    ('canon','esther',6,6,'canon','luke',14,11,'free',
     E'*For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11). Haman exalted himself in his heart — *To whom would the king delight to do honour more than to myself?* (Esther 6:6) — and was abased to lead his rival''s horse; Mordecai, who had only done his duty unrewarded, was exalted. The Master''s word stands written in the chronicle.'),
    ('canon','esther',6,6,'canon','james',4,6,'free',
     E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). Esther 6 is resistance to the proud made visible: the haughty heart of *To whom would the king delight to do honour more than to myself?* (Esther 6:6) is resisted, and grace falls upon the humble Mordecai who asked for nothing.'),

    -- Thread 3: the seed of the Yahudim cannot be overcome (source 6:13)
    ('canon','esther',6,13,'canon','genesis',12,3,'free',
     E'*And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* (Genesis 12:3). Haman''s own wife and wise men confess the Abrahamic promise without knowing it: *If Mordecai be of the seed of the Yahudim (Jews)... thou shalt not prevail against him, but shalt surely fall before him* (Esther 6:13). To curse the covenant seed is to be cursed.'),
    ('canon','esther',6,13,'canon','numbers',24,9,'free',
     E'*He couched, he lay down as a lion, and as a great lion: who shall stir him up? Blessed is he that blesseth thee, and cursed is he that curseth thee* (Numbers 24:9). Balaam, hired to curse, could only bless the seed; Haman, scheming to destroy it, hears the same verdict from his own counsellors: *thou shalt not prevail against him* (Esther 6:13). The enemy cannot overturn the blessing on the seed.'),
    ('canon','esther',6,13,'canon','isaiah',54,17,'free',
     E'*No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD)* (Isaiah 54:17). Haman forged the gallows; it would not prosper. His wise men confess the heritage: *thou shalt not prevail against him, but shalt surely fall before him* (Esther 6:13).'),
    ('canon','esther',6,13,'canon','zechariah',2,8,'free',
     E'*For thus saith Yahuah Tseva''ot (LORD of hosts)... he that toucheth you toucheth the apple of his eye* (Zechariah 2:8). The covenant seed is the apple of the eye; to strike it is to strike the most guarded place. Even Haman''s household senses it: *If Mordecai be of the seed of the Yahudim (Jews)... thou shalt surely fall before him* (Esther 6:13).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers',
       E'On that night could not the king sleep — the Keeper who neither slumbers',
       E'In Esther the divine Name is never spoken; here is why it need not be. *On that night could not the king sleep, and he commanded to bring the book of records of the chronicles; and they were read before the king. And it was found written, that Mordecai had told of* the assassination plot (Esther 6:1-2) — and so the king learns his rescuer was never rewarded, on the very morning Haman approaches to ask for his death. Of all nights, the king cannot sleep; of all the chronicles, Mordecai''s deed is read; at the exact hour his enemy draws near. This is the masterpiece of hidden providence, and it is the work of One who is awake: *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). The king''s heart was turned by an unseen hand — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1) — for it belongs to the One who *changeth the times and the seasons* (Daniel 2:21). Man devises, but *Yahuah (LORD) directeth his steps* (Proverbs 16:9). And while most receive instruction in the night''s sleep, this king receives it awake: *when deep sleep falleth upon men... Then he openeth the ears of men... That he may withdraw man from his purpose* (Job 33:15-17). The whole night declares the promise: *all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). The Name is silent; the hand is everywhere.',
       sv.verse_id, ev.verse_id, 'free', 32625
  FROM _s317_esth06_lookup sv, _s317_esth06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-6-the-great-reversal-pride-abased-and-the-humble-exalted',
       E'The great reversal — pride abased and the humble exalted',
       E'Haman enters the court to ask that Mordecai be hanged, but the king speaks first: *What shall be done unto the man whom the king delighteth to honour? Now Haman thought in his heart, To whom would the king delight to do honour more than to myself?* (Esther 6:6). So the proud man, certain the honour is his own, describes the royal apparel, the king''s horse, the crown — and the king commands him to do all of it *to Mordecai the Yahudi (Jew)* (Esther 6:10), and Haman must lead the horse, proclaiming the praise of the very man he came to kill (Esther 6:11). This is the law of the kingdom written in a morning. *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7). *For promotion cometh neither from the east, nor from the west, nor from the south... But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:6-7). It is the very pattern Miriam (Mary) would sing: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts. He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:51-52). And the Master''s plain word: *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11), for *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). Haman scattered in the imagination of his own heart; Mordecai, who asked for nothing, exalted.',
       sv.verse_id, ev.verse_id, 'free', 32626
  FROM _s317_esth06_lookup sv, _s317_esth06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-6-thou-shalt-not-prevail-against-the-seed-of-the-yahudim',
       E'Thou shalt not prevail against the seed of the Yahudim',
       E'Haman flees home mourning, and his own wife and wise men pronounce his doom in the language of the covenant: *If Mordecai be of the seed of the Yahudim (Jews), before whom thou hast begun to fall, thou shalt not prevail against him, but shalt surely fall before him* (Esther 6:13). Even the enemies of the covenant people sense that to fight the seed is to lose. They confess, without knowing it, the promise to Abraham: *I will bless them that bless thee, and curse him that curseth thee* (Genesis 12:3). It is the verdict Balaam was hired to overturn and could not: *Blessed is he that blesseth thee, and cursed is he that curseth thee* (Numbers 24:9). Haman had forged a gallows, but *No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD)* (Isaiah 54:17). The seed is guarded as the most precious of all: *he that toucheth you toucheth the apple of his eye* (Zechariah 2:8). The covenant seed cannot be overcome — and the enemy''s own household is made to say so.',
       sv.verse_id, ev.verse_id, 'free', 32627
  FROM _s317_esth06_lookup sv, _s317_esth06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Members: Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4) — the king''s sleeplessness is the Keeper''s wakefulness.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will* (Proverbs 21:1) — the restless heart is being turned to deliverance.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he changeth the times and the seasons* (Daniel 2:21) — the God who orders the hours set this very night.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9) — the man''s insomnia is the Director''s appointment.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*when deep sleep falleth upon men... Then he openeth the ears of men... That he may withdraw man from his purpose* (Job 33:15-17) — the night''s instruction received awake.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=33 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*all things work together for good to them that love Elohim (God)* (Romans 8:28) — the night''s timing is the masterpiece that proves it.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-on-that-night-could-not-the-king-sleep-the-keeper-who-neither-slumbers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — the proverb walks out in Haman''s morning.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7) — Hannah''s song enacted in one court.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*promotion cometh neither from the east, nor from the west, nor from the south* (Psalm 75:6) — not from the king''s mouth Haman coveted.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7) — the whole reversal in a single verse.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he hath scattered the proud in the imagination of their hearts* (Luke 1:51) — Haman undone in the imagination of his own heart.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52) — the Magnificat is the song of Esther 6.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11) — the Master''s word in the chronicle.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — resistance to the proud made visible.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-the-great-reversal-pride-abased-and-the-humble-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will bless them that bless thee, and curse him that curseth thee* (Genesis 12:3) — the Abrahamic promise confessed by the enemy''s household.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-thou-shalt-not-prevail-against-the-seed-of-the-yahudim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Blessed is he that blesseth thee, and cursed is he that curseth thee* (Numbers 24:9) — the verdict Balaam could not overturn.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-thou-shalt-not-prevail-against-the-seed-of-the-yahudim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*No weapon that is formed against thee shall prosper* (Isaiah 54:17) — Haman''s gallows would not prosper.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-thou-shalt-not-prevail-against-the-seed-of-the-yahudim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he that toucheth you toucheth the apple of his eye* (Zechariah 2:8) — the seed is the most guarded place.'
  FROM cross_reference_threads t
  JOIN _s317_esth06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s317_esth06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-6-thou-shalt-not-prevail-against-the-seed-of-the-yahudim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_7.sql (Esther 7) -----
-- Book: Esther  Chapter: 7   Tag: esth07   Session: s317
-- Temp view: _s317_esth07_lookup
-- Slug prefix: esther-7-...   Sort band start: 32650 (+1 per thread)
-- Source: edition 'canon', book_slug 'esther', chapter 7
--
-- NOTE ON ESTHER: the divine NAME is not spoken in this book. Yahuah (the LORD)
-- works by HIDDEN PROVIDENCE — the deliverance and the reversal come to pass with
-- no named miracle, no theophany. Framed accordingly; NO invented divine-name reading.
--
-- Esther 7 coverage:
--   v.1-6  (Esther pleads her life and her people's; names the enemy Haman)
--          NT:     Romans 8:33-34 (the advocate — who shall charge / who condemneth) — USED
--          Extras: none warranted (no clean witness adds to the intercession type)
--          Tanakh: Proverbs 31:8-9 (open thy mouth / plead the cause), Psalm 35:11-12 (false
--                  witnesses, evil for good) — USED
--   v.7-10 (Haman hanged on the gallows he prepared for Mordecai; the king's wrath pacified)
--          NT:     Galatians 6:7 (whatsoever a man soweth, that shall he also reap) — USED
--          Extras: none warranted (the reversal is fully carried by Psalms/Proverbs/Daniel)
--          Tanakh: Psalm 7:15-16 (made a pit, fallen in his own ditch; mischief on his own
--                  head), Psalm 9:15-16 (sunk in the pit they made; snared in their own work),
--                  Psalm 57:6 (digged a pit, fallen themselves), Proverbs 26:27 (whoso diggeth
--                  a pit shall fall therein), Proverbs 11:5-6/11:8 (the wicked falleth by his
--                  own wickedness; the wicked cometh in the righteous's stead), Daniel 6:24
--                  (the accusers cast into the den they sought) — USED
--
-- THREADS (3):
--   esther-7-the-queen-pleads-the-cause-of-the-condemned  [free]  v.3-6
--       targets: Tanakh (Prov 31:8-9, Ps 35:11-12) + NT (Rom 8:33-34)
--   esther-7-his-mischief-returns-upon-his-own-head  [free]  v.10
--       targets: Tanakh (Ps 7:15-16, Ps 9:15-16, Ps 57:6, Prov 26:27, Prov 11:5-6/8)
--   esther-7-hanged-on-the-gallows-he-prepared-for-mordecai  [free]  v.9-10
--       targets: Tanakh (Dan 6:24) + NT (Gal 6:7)
--   (all members canon → every thread tier 'free')

CREATE TEMP VIEW _s317_esth07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ cross_references
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the queen pleads the cause of the condemned (v.3-6)
    ('canon','esther',7,3,'canon','proverbs',31,8,'free',
      E'*Open thy mouth for the dumb in the cause of all such as are appointed to destruction* (Proverbs 31:8). Esther rises to speak for a people who cannot speak for themselves — *let my life be given me at my petition, and my people at my request* (Esther 7:3) — the queen opening her mouth for those *appointed to destruction* by Haman''s decree.'),
    ('canon','esther',7,3,'canon','proverbs',31,9,'free',
      E'*Open thy mouth, judge righteously, and plead the cause of the poor and needy* (Proverbs 31:9). Esther''s plea — *let my life be given me at my petition, and my people at my request* (Esther 7:3) — is exactly this: the advocate pleading the cause of the helpless before the throne.'),
    ('canon','esther',7,4,'canon','psalms',35,11,'free',
      E'*False witnesses did rise up; they laid to my charge things that I knew not* (Psalm 35:11). Haman''s decree sold a guiltless people — *we are sold, I and my people, to be destroyed, to be slain, and to perish* (Esther 7:4) — the righteous charged and condemned without cause, the very cry of the persecuted in the psalm.'),
    ('canon','esther',7,4,'canon','psalms',35,12,'free',
      E'*They rewarded me evil for good to the spoiling of my soul* (Psalm 35:12). Mordecai *had spoken good for the king* (Esther 7:9) and was rewarded with a gallows; the people are *sold... to be destroyed* (Esther 7:4) — evil rewarded for good, the psalm''s lament made flesh in Haman''s plot.'),
    ('canon','esther',7,6,'canon','romans',8,33,'free',
      E'*Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth* (Romans 8:33). Esther stands and turns the charge back on the accuser — *the adversary and enemy is this wicked Haman* (Esther 7:6) — a faint type of the deliverance where no charge can stand against the chosen people.'),
    ('canon','esther',7,6,'canon','romans',8,34,'free',
      E'*Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us* (Romans 8:34). Esther the intercessor identifies with her people and exposes the one who *durst presume in his heart* to condemn them — *the adversary and enemy is this wicked Haman* (Esther 7:6) — pointing forward to the Advocate who pleads for his own that none may condemn them.'),

    -- THREAD 2: his mischief returns upon his own head (v.10)
    ('canon','esther',7,10,'canon','psalms',7,15,'free',
      E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15). Haman built a gallows for Mordecai and was hanged on it himself — *so they hanged Haman on the gallows that he had prepared for Mordecai* (Esther 7:10) — the snare-digger fallen into his own pit.'),
    ('canon','esther',7,10,'canon','psalms',7,16,'free',
      E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). The gallows *fifty cubits high, which Haman had made for Mordecai* (Esther 7:9) became Haman''s own — the violent device returning on the head of him that devised it, by the hidden providence.'),
    ('canon','esther',7,10,'canon','psalms',9,15,'free',
      E'*The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken* (Psalm 9:15). Haman is taken in the very snare he laid — *they hanged Haman on the gallows that he had prepared for Mordecai* (Esther 7:10) — his own foot caught in his own net.'),
    ('canon','esther',7,10,'canon','psalms',9,16,'free',
      E'*Yahuah (LORD) is known by the judgment which he executeth: the wicked is snared in the work of his own hands* (Psalm 9:16). Even where the Name is never spoken in Esther, the judgment is His: *the wicked is snared in the work of his own hands* — Haman hanged on his own gallows (Esther 7:10), the hidden hand made known by the reversal.'),
    ('canon','esther',7,10,'canon','psalms',57,6,'free',
      E'*They have prepared a net for my steps; my soul is bowed down: they have digged a pit before me, into the midst whereof they are fallen themselves* (Psalm 57:6). Haman digged a pit before Mordecai and *they are fallen themselves* — *they hanged Haman on the gallows that he had prepared for Mordecai* (Esther 7:10).'),
    ('canon','esther',7,10,'canon','proverbs',26,27,'free',
      E'*Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27). The proverb names the law of the reversal that Esther 7:10 enacts — Haman *hanged... on the gallows that he had prepared for Mordecai* — the digger fallen into his own pit.'),
    ('canon','esther',7,10,'canon','proverbs',11,5,'free',
      E'*The righteousness of the perfect shall direct his way: but the wicked shall fall by his own wickedness* (Proverbs 11:5). Haman falls not by another''s hand but by his own device — *they hanged Haman on the gallows that he had prepared for Mordecai* (Esther 7:10) — the wicked falling by his own wickedness.'),
    ('canon','esther',7,10,'canon','proverbs',11,6,'free',
      E'*The righteousness of the upright shall deliver them: but transgressors shall be taken in their own naughtiness* (Proverbs 11:6). Mordecai the upright is delivered and Haman the transgressor is *taken in his own naughtiness* — caught on his own gallows (Esther 7:10).'),
    ('canon','esther',7,10,'canon','proverbs',11,8,'free',
      E'*The righteous is delivered out of trouble, and the wicked cometh in his stead* (Proverbs 11:8). The reversal is exact: Mordecai the righteous, marked for the gallows, is delivered, and Haman the wicked comes *in his stead* — *they hanged Haman on the gallows that he had prepared for Mordecai* (Esther 7:10).'),

    -- THREAD 3: the accuser's own snare / sowing and reaping (v.9-10)
    ('canon','esther',7,10,'canon','daniel',6,24,'free',
      E'*And the king commanded, and they brought those men which had accused Daniel, and they cast them into the den of lions* (Daniel 6:24). As Daniel''s accusers met the very death they devised, so Haman is hanged on the gallows he raised — *they hanged Haman on the gallows that he had prepared for Mordecai* (Esther 7:10) — the accuser caught in the snare he set, by the same hidden hand of deliverance.'),
    ('canon','esther',7,9,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Haman sowed a gallows *fifty cubits high, which Haman had made for Mordecai* (Esther 7:9) and reaped it himself — the harvest of the man''s own sowing, the reversal that no plotter escapes.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-7-the-queen-pleads-the-cause-of-the-condemned',
       E'Esther pleads the cause of the condemned',
       E'At the second banquet of wine the king asks again, *What is thy petition, queen Esther?* (Esther 7:2), and Esther rises to plead not for honour but for life: *let my life be given me at my petition, and my people at my request: For we are sold, I and my people, to be destroyed, to be slain, and to perish* (Esther 7:3-4). She identifies wholly with her people and opens her mouth for those who cannot speak for themselves — *Open thy mouth for the dumb in the cause of all such as are appointed to destruction. Open thy mouth, judge righteously, and plead the cause of the poor and needy* (Proverbs 31:8-9). Her people are charged and sold without cause, as in the psalm: *False witnesses did rise up; they laid to my charge things that I knew not. They rewarded me evil for good to the spoiling of my soul* (Psalm 35:11-12) — for Mordecai *had spoken good for the king* (Esther 7:9) and was repaid with a gallows. Then she names the enemy and turns the charge back upon him: *The adversary and enemy is this wicked Haman* (Esther 7:6). The intercessor pleading for the condemned, exposing the accuser, is a faint type of the great Advocate: *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth. Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again... who also maketh intercession for us* (Romans 8:33-34). Even with the Name unspoken, the pattern is set: the one who stands and pleads, so that against the chosen people no charge can stand.',
       sv.verse_id, ev.verse_id, 'free', 32650
  FROM _s317_esth07_lookup sv, _s317_esth07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-7-his-mischief-returns-upon-his-own-head',
       E'His mischief returns upon his own head',
       E'The supreme reversal: *So they hanged Haman on the gallows that he had prepared for Mordecai. Then was the king''s wrath pacified* (Esther 7:10). The device of the wicked is turned on his own head — and the Tanakh has sung this law of the hidden providence all along. *He made a pit, and digged it, and is fallen into the ditch which he made. His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:15-16). *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken. Yahuah (LORD) is known by the judgment which he executeth: the wicked is snared in the work of his own hands* (Psalm 9:15-16) — and here is the hidden hand of Esther made known, for though the Name is never spoken in the book, the judgment is His. *They have digged a pit before me, into the midst whereof they are fallen themselves* (Psalm 57:6). The proverb states it plainly: *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27); *the wicked shall fall by his own wickedness* (Proverbs 11:5); *transgressors shall be taken in their own naughtiness* (Proverbs 11:6); *The righteous is delivered out of trouble, and the wicked cometh in his stead* (Proverbs 11:8) — the exact shape of it, Mordecai delivered and Haman come in his stead on the very gallows he raised.',
       sv.verse_id, ev.verse_id, 'free', 32651
  FROM _s317_esth07_lookup sv, _s317_esth07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-7-hanged-on-the-gallows-he-prepared-for-mordecai',
       E'Hanged on the gallows he prepared for Mordecai',
       E'Harbonah the chamberlain points to it: *Behold also, the gallows fifty cubits high, which Haman had made for Mordecai, who had spoken good for the king, standeth in the house of Haman. Then the king said, Hang him thereon* (Esther 7:9). The instrument of the accuser becomes the instrument of his own end — the snare returns on the snarer. So it was with Daniel''s accusers: *And the king commanded, and they brought those men which had accused Daniel, and they cast them into the den of lions* (Daniel 6:24) — the very death they devised for the righteous fell on themselves. The law beneath both is sure: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Haman sowed a gallows and reaped it himself; the harvest of his own hands came down upon his own head, and *the king''s wrath was pacified* (Esther 7:10) — the deliverance of the people accomplished by the hidden hand that no plotter escapes.',
       sv.verse_id, ev.verse_id, 'free', 32652
  FROM _s317_esth07_lookup sv, _s317_esth07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ thread_members
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Open thy mouth for the dumb in the cause of all such as are appointed to destruction* (Proverbs 31:8) — Esther opening her mouth for the people appointed to destruction.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-the-queen-pleads-the-cause-of-the-condemned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Open thy mouth, judge righteously, and plead the cause of the poor and needy* (Proverbs 31:9) — the advocate pleading the cause of the helpless before the throne.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-the-queen-pleads-the-cause-of-the-condemned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*False witnesses did rise up; they laid to my charge things that I knew not* (Psalm 35:11) — a guiltless people charged and sold without cause.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=35 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-the-queen-pleads-the-cause-of-the-condemned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*They rewarded me evil for good to the spoiling of my soul* (Psalm 35:12) — Mordecai who spoke good for the king repaid with a gallows.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=35 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-the-queen-pleads-the-cause-of-the-condemned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth* (Romans 8:33) — Esther turns the charge back on the accuser.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-the-queen-pleads-the-cause-of-the-condemned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Who is he that condemneth? It is Messiah (Christ) that died... who also maketh intercession for us* (Romans 8:34) — the intercessor type fulfilled in the Advocate who pleads for his own.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-the-queen-pleads-the-cause-of-the-condemned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15) — the snare-digger fallen into his own pit.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16) — the gallows returns on the head of him that devised it.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*In the net which they hid is their own foot taken* (Psalm 9:15) — Haman taken in the very snare he laid.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The wicked is snared in the work of his own hands* (Psalm 9:16) — the hidden hand of Esther made known by the reversal.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*They have digged a pit before me, into the midst whereof they are fallen themselves* (Psalm 57:6) — the pit-diggers fallen in.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=57 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27) — the law of the reversal Esther 7:10 enacts.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*The wicked shall fall by his own wickedness* (Proverbs 11:5) — Haman falls by his own device, not another''s hand.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Transgressors shall be taken in their own naughtiness* (Proverbs 11:6) — Haman the transgressor caught on his own gallows.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*The righteous is delivered out of trouble, and the wicked cometh in his stead* (Proverbs 11:8) — Mordecai delivered, Haman come in his stead on the gallows.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-his-mischief-returns-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*They brought those men which had accused Daniel, and they cast them into the den of lions* (Daniel 6:24) — the accusers met the death they devised for the righteous.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-hanged-on-the-gallows-he-prepared-for-mordecai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — Haman sowed a gallows and reaped it himself.'
  FROM cross_reference_threads t
  JOIN _s317_esth07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s317_esth07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-7-hanged-on-the-gallows-he-prepared-for-mordecai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_8.sql (Esther 8) -----
-- Book: Esther  Chapter: 8  (Mordecai exalted; the counter-decree; mourning turned to light and joy)
-- Tag: esth08   Session prefix: s317   Temp view: _s317_esth08_lookup
-- Slug prefix: esther-8-...   Sort band start: 32675 (+1 per thread)
-- Source: edition 'canon', book_slug 'esther', chapter 8.
-- NOTE ON ESTHER: the divine NAME is never spoken in this book; Yahuah (LORD) works by HIDDEN
--   PROVIDENCE. No divine-name reading is forced; the providence is named as providence.
--
-- Esther 8 coverage:
--   v.1-2  (the king gives Esther Haman's house; Mordecai receives the king's ring; set over the house)
--          NT:     Luke 1:52 (put down the mighty, exalted them of low degree)
--          Extras: none warranted
--          Tanakh: Psalm 75:7 (he putteth down one, setteth up another); 1 Samuel 2:8 (raiseth the poor
--                  out of the dust to set among princes); Genesis 41:42 (Pharaoh's ring put on Joseph)
--          -> thread esther-8-the-kings-ring-the-humble-raised-to-the-place-of-the-fallen [free]
--   v.3-8  (Esther pleads to reverse Haman's letters; the unalterable decree answered by a greater
--          decree sealed with the king's ring — deliverance by a stronger word)
--          NT:     Romans 8:31-37 (if Elohim be for us... more than conquerors)
--          Extras: none warranted
--          Tanakh: Isaiah 54:17 (no weapon formed shall prosper); Psalm 46:1 (Elohim our refuge, a
--                  very present help in trouble)
--          -> thread esther-8-the-counter-decree-the-stronger-word-more-than-conquerors [free]
--   v.9-14 (the writing sent to 127 provinces; Jews granted to stand for their life)
--          NT/Extras/Tanakh: folded into the counter-decree thread as the decree itself; no separate add
--   v.15-17 (Mordecai in royal apparel; Shushan rejoiced; the Jews had light, gladness, joy, honour;
--          many of the people of the land became Yahudim, for the fear of them fell)
--          NT:     none warranted (the joining pattern is carried by the Tanakh witnesses)
--          Extras: none warranted
--          Tanakh: Psalm 30:11 (turned my mourning into dancing); Esther 9:22 (turned from sorrow to
--                  joy, mourning into a good day = Purim); Isaiah 60:1 (arise, shine, thy light is come);
--                  Isaiah 56:6-7 (the sons of the stranger that JOIN THEMSELVES to Yahuah, keep the
--                  sabbath, take hold of the covenant — the genuine cleaving, not false-inclusion);
--                  Zechariah 8:23 (ten men take hold of the skirt of a Yahudi: Elohim is with you);
--                  Psalm 105:38 (the fear of them fell on Egypt)
--          -> thread esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves [free]
--
-- All targets are canon (Tanakh + NT) -> every tier is 'free'; every thread tier_required 'free'.
-- MEMBER form: STANDARD, explicit literal source verse. No compact AS m(...) form.

CREATE TEMP VIEW _s317_esth08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== CROSS_REFERENCES =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the king's ring — the humble raised to the place of the fallen (8:1-2)
    ('canon','esther',8,2,'canon','psalms',75,7,'free',
     E'*But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7). When the king *took off his ring, which he had taken from Haman, and gave it unto Mordecai* (Esther 8:2), it is this hidden hand that is moving: promotion comes not from east, west, nor south, but Yahuah (LORD) puts down the proud enemy and sets up the faithful in his very place.'),
    ('canon','esther',8,2,'canon','1-samuel',2,8,'free',
     E'*He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory* (1 Samuel 2:8). Mordecai the Yahudi (Jew), who sat in sackcloth at the king''s gate, is now *set over the house of Haman* (Esther 8:2) — Hannah''s song made history: the lowly lifted to sit among princes.'),
    ('canon','esther',8,2,'canon','genesis',41,42,'free',
     E'*And Pharaoh took off his ring from his hand, and put it upon Joseph''s hand, and arrayed him in vestures of fine linen* (Genesis 41:42). The same sign repeats: as Joseph rose from the pit and prison to the second place in Egypt by Pharaoh''s ring, so Mordecai receives *the king''s ring* (Esther 8:2) — the hidden providence over a scattered son of the covenant, raised to preserve his people alive.'),
    ('canon','esther',8,2,'canon','luke',1,52,'free',
     E'*He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). Miriam''s (Mary''s) Magnificat sings the same reversal Esther 8 enacts — Haman hanged on his own gallows and Mordecai given his ring and his house: the proud cast down, the humble raised, the pattern that runs from Hannah to the mother of Messiah.'),

    -- Thread 2: the counter-decree — the stronger word, more than conquerors (8:3-8)
    ('canon','esther',8,8,'canon','romans',8,31,'free',
     E'*If Elohim (God) be for us, who can be against us?* (Romans 8:31). Haman''s sealed decree *may no man reverse* (Esther 8:8) — yet the deliverance comes not by undoing the threat but by *a greater word* sealed with the same ring. So Paul: the charge against the elect stands written, but a stronger verdict overturns it; the unalterable threat is answered, not erased.'),
    ('canon','esther',8,8,'canon','romans',8,37,'free',
     E'*Nay, in all these things we are more than conquerors through him that loved us* (Romans 8:37). The Yahudim (Jews) are *granted... to stand for their life* (Esther 8:11) by the counter-decree of Esther 8:8 — not spared the battle but made victors within it: more than conquerors, the very shape of covenant deliverance.'),
    ('canon','esther',8,8,'canon','isaiah',54,17,'free',
     E'*No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD)* (Isaiah 54:17). Haman''s weapon was forged against the covenant people, but it does not prosper; the king''s second writing — *seal it with the king''s ring* (Esther 8:8) — is the visible edge of this heritage promised to Yahuah''s (LORD''s) servants.'),
    ('canon','esther',8,3,'canon','psalms',46,1,'free',
     E'*Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1). Esther *fell down at his feet, and besought him with tears to put away the mischief of Haman* (Esther 8:3); the help she pleads for arrives — the present help in the hour of trouble, working unseen through a queen''s tears and a king''s sceptre.'),

    -- Thread 3: mourning turned to light and joy; many joined themselves (8:15-17)
    ('canon','esther',8,16,'canon','psalms',30,11,'free',
     E'*Thou hast turned for me my mourning into dancing: thou hast put off my sackcloth, and girded me with gladness* (Psalm 30:11). *The Yahudim (Jews) had light, and gladness, and joy, and honour* (Esther 8:16); the sackcloth of Esther 4 is exchanged for the garment of fine linen and purple — the very reversal David sings, mourning turned to dancing.'),
    ('canon','esther',8,17,'canon','esther',9,22,'free',
     E'*The month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy* (Esther 9:22). The *feast and a good day* of Esther 8:17 becomes the appointed Purim of Esther 9:22 — a remembrance kept, the deliverance written into the people''s calendar of joy.'),
    ('canon','esther',8,16,'canon','isaiah',60,1,'free',
     E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). *The Yahudim (Jews) had light* (Esther 8:16) — the small dawn at Shushan is a token of the great rising of Isaiah 60, the covenant people brought from darkness into light when the hidden hand is at last revealed.'),
    ('canon','esther',8,17,'canon','isaiah',56,6,'free',
     E'*Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD)... and taketh hold of my covenant* (Isaiah 56:6). When *many of the people of the land became Yahudim (Jews)* (Esther 8:17), this is the Isaiah 56 pattern: the genuine cleaving of the sojourner who JOINS HIMSELF to Yahuah''s (LORD''s) people and takes hold of the covenant — not flippant inclusion, but the stranger grafted in through the covenant itself.'),
    ('canon','esther',8,17,'canon','isaiah',56,7,'free',
     E'*Even them will I bring to my holy mountain... for mine house shall be called an house of prayer for all people* (Isaiah 56:7). The nations who became Yahudim (Jews) in Esther 8:17 are the firstfruits of this promise — those who take hold of the covenant are brought to the mountain, the house of prayer opened to all who genuinely join themselves to the people of Yahuah (LORD).'),
    ('canon','esther',8,17,'canon','zechariah',8,23,'free',
     E'*Ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23). *Many of the people of the land became Yahudim (Jews); for the fear of the Yahudim (Jews) fell upon them* (Esther 8:17) — the very joining Zechariah foresees: the nations take hold because they perceive that Elohim (God) is with this people.'),
    ('canon','esther',8,17,'canon','psalms',105,38,'free',
     E'*Egypt was glad when they departed: for the fear of them fell upon them* (Psalm 105:38). The dread that fell on Egypt at the Exodus falls again at Shushan — *the fear of the Yahudim (Jews) fell upon them* (Esther 8:17): the same awe of a people whom Yahuah (LORD) defends, working now by hidden providence as once by open plagues.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== THREADS =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-8-the-kings-ring-the-humble-raised-to-the-place-of-the-fallen',
       E'The King''s Ring: the Humble Raised to the Place of the Fallen',
       E'On the day Haman hangs, *the king took off his ring, which he had taken from Haman, and gave it unto Mordecai. And Esther set Mordecai over the house of Haman* (Esther 8:2). The faithful Yahudi (Jew) is lifted into the very seat of the destroyed enemy — and no name of Yahuah (LORD) is spoken, for here he works by hidden providence. The Psalms name the hand: *But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7); and Hannah sang it before there was a king: *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory* (1 Samuel 2:8). The sign itself is borrowed from Joseph: *And Pharaoh took off his ring from his hand, and put it upon Joseph''s hand, and arrayed him in vestures of fine linen* (Genesis 41:42) — a scattered son of the covenant raised to preserve his people alive. And the whole reversal sounds again in Miriam''s (Mary''s) song: *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). From Hannah to Joseph to Mordecai to the mother of Messiah, one pattern: the proud cast down, the lowly raised.',
       sv.verse_id, ev.verse_id, 'free', 32675
  FROM _s317_esth08_lookup sv, _s317_esth08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-8-the-counter-decree-the-stronger-word-more-than-conquerors',
       E'The Counter-Decree: the Stronger Word, More Than Conquerors',
       E'Esther falls at the king''s feet *with tears to put away the mischief of Haman* (Esther 8:3), but the sealed Persian decree cannot be recalled: *the writing which is written in the king''s name, and sealed with the king''s ring, may no man reverse* (Esther 8:8). The deliverance does not come by undoing the threat — it comes by a GREATER WORD sealed with the same ring: *Write ye also for the Yahudim (Jews), as it liketh you, in the king''s name, and seal it with the king''s ring* (Esther 8:8), so the people are *granted... to stand for their life* (Esther 8:11). This is the very shape of covenant rescue Paul names: *If Elohim (God) be for us, who can be against us?* (Romans 8:31) — the charge stands written, yet a stronger verdict overturns it — and *Nay, in all these things we are more than conquerors through him that loved us* (Romans 8:37), not spared the battle but made victors within it. Isaiah seals it as the people''s inheritance: *No weapon that is formed against thee shall prosper... This is the heritage of the servants of Yahuah (LORD)* (Isaiah 54:17); and the unseen help arrives as promised: *Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1).',
       sv.verse_id, ev.verse_id, 'free', 32676
  FROM _s317_esth08_lookup sv, _s317_esth08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves',
       E'Mourning Turned to Light and Joy, and Many Joined Themselves',
       E'Mordecai goes out *in royal apparel of blue and white, and with a great crown of gold... and the city of Shushan rejoiced and was glad. The Yahudim (Jews) had light, and gladness, and joy, and honour* (Esther 8:15-16). The sackcloth of Esther 4 is put off — *Thou hast turned for me my mourning into dancing: thou hast put off my sackcloth, and girded me with gladness* (Psalm 30:11) — and the day becomes a remembrance, *the month which was turned unto them from sorrow to joy, and from mourning into a good day* (Esther 9:22), the appointed feast of Purim written into the people''s calendar. The little dawn at Shushan is a token of the great rising: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). And then the joining: *many of the people of the land became Yahudim (Jews); for the fear of the Yahudim (Jews) fell upon them* (Esther 8:17). This is the Isaiah 56 sojourner pattern, not flippant inclusion but genuine cleaving — *the sons of the stranger, that join themselves to Yahuah (LORD), to serve him... and taketh hold of my covenant* (Isaiah 56:6), *brought to my holy mountain... for mine house shall be called an house of prayer for all people* (Isaiah 56:7). Zechariah foresaw it: *ten men shall take hold... of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23). The same awe once fell on Egypt — *the fear of them fell upon them* (Psalm 105:38) — for these are a people whom Yahuah (LORD) defends, now by hidden providence as once by open plagues.',
       sv.verse_id, ev.verse_id, 'free', 32677
  FROM _s317_esth08_lookup sv, _s317_esth08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ===================== THREAD MEMBERS =====================
-- Thread 1: the king's ring
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7) — the hidden hand that moves the king''s ring from Haman to Mordecai.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-kings-ring-the-humble-raised-to-the-place-of-the-fallen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He raiseth up the poor out of the dust... to set them among princes* (1 Samuel 2:8) — Hannah''s song fulfilled in Mordecai set over Haman''s house.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-kings-ring-the-humble-raised-to-the-place-of-the-fallen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Pharaoh took off his ring from his hand, and put it upon Joseph''s hand* (Genesis 41:42) — the same sign of a scattered covenant son raised to save his people.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-kings-ring-the-humble-raised-to-the-place-of-the-fallen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52) — Miriam''s (Mary''s) Magnificat sings the same reversal.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-kings-ring-the-humble-raised-to-the-place-of-the-fallen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the counter-decree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*If Elohim (God) be for us, who can be against us?* (Romans 8:31) — the unalterable charge answered by a stronger word.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-counter-decree-the-stronger-word-more-than-conquerors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Nay, in all these things we are more than conquerors through him that loved us* (Romans 8:37) — granted to stand for their life, not spared the battle but made victors in it.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-counter-decree-the-stronger-word-more-than-conquerors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*No weapon that is formed against thee shall prosper... This is the heritage of the servants of Yahuah (LORD)* (Isaiah 54:17) — the king''s second writing the visible edge of this promised heritage.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-counter-decree-the-stronger-word-more-than-conquerors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1) — the unseen help Esther pleads for with tears, arriving in the hour of trouble.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-the-counter-decree-the-stronger-word-more-than-conquerors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: mourning turned to light and joy; many joined
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou hast turned for me my mourning into dancing... and girded me with gladness* (Psalm 30:11) — the sackcloth of Esther 4 exchanged for light, gladness, joy, and honour.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The month which was turned unto them from sorrow to joy, and from mourning into a good day* (Esther 9:22) — the good day of 8:17 becomes the appointed feast of Purim.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1) — the little dawn at Shushan a token of the great rising.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The sons of the stranger, that join themselves to Yahuah (LORD)... and taketh hold of my covenant* (Isaiah 56:6) — the genuine cleaving of the sojourner, not flippant inclusion.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Even them will I bring to my holy mountain... an house of prayer for all people* (Isaiah 56:7) — those who take hold of the covenant brought to the mountain.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Ten men shall take hold... of the skirt of him that is a Yahudi (Jew)... for we have heard that Elohim (God) is with you* (Zechariah 8:23) — the nations joining because Elohim (God) is with this people.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Egypt was glad when they departed: for the fear of them fell upon them* (Psalm 105:38) — the same awe of a people Yahuah (LORD) defends, now by hidden providence.'
  FROM cross_reference_threads t
  JOIN _s317_esth08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s317_esth08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-8-mourning-turned-to-light-and-joy-and-many-joined-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_9.sql (Esther 9) -----
-- Esther 9 — THE DAY OF REVERSAL AND THE FEAST OF PURIM (keystone chapter)
-- tag: esth09 ; session prefix: s317 ; temp view: _s317_esth09_lookup
-- slug prefix: esther-9- ; sort_order band start: 32700 (+1 per thread)
-- source book_slug=esther, chapter 9 ; SOURCE always canon Esther verse.
--
-- FRAMING NOTE — Esther is the book where the divine NAME is never spoken: Yahuah works by
-- HIDDEN PROVIDENCE. The chapter is NOT a divine-name theophany; the threads frame the unseen
-- hand that TURNS THE DAY of doom into the day of deliverance. Do not invent a divine-name reading.
--   * 9:1 "though it was turned to the contrary" = THE GREAT REVERSAL — the very day appointed for
--     destruction becomes the day of victory (the hidden providence overturning the doom). Wove to
--     Gen 50:20 (evil-meant-for-good), Ps 37:14-15 (the wicked's own sword in their own heart),
--     Prov 11:8 (righteous delivered, wicked comes in his stead), 1 Sam 2:4 (bows of the mighty
--     broken), Isa 54:17 (no weapon formed shall prosper).
--   * 9:10 / 9:15-16 the Yahudim "laid not their hand on the spoil/prey" (stated THREE TIMES) = the
--     restraint that proves deliverance not greed, AND the right finishing of the Amalek-war Saul
--     botched (1 Sam 15:9/15:19 Saul took the spoil; Haman the Agagite = the Amalekite line, Esth
--     9:24). Mordecai of Saul's tribe takes NONE. Wove to 1 Sam 15:9, 1 Sam 15:19, Deut 25:19
--     (blot out Amalek), Gen 14:23 (Abram took no spoil).
--   * 9:22 / 9:28 PURIM established — sorrow to joy, feasting, SENDING PORTIONS and GIFTS TO THE
--     POOR, "remembered and kept throughout every generation." FRAMED CAREFULLY: a commemorative
--     remembrance-day the PEOPLE instituted to keep the memory of the deliverance — NOT one of the
--     Lev-23 appointed times Yahuah commanded, but a genuine memorial of His saving hand, in the
--     pattern of Exod 12 (the Passover memorial) and Josh 4 (the memorial stones). Generosity to the
--     poor = the mark of true joy (Neh 8:10/8:12 "send portions... for whom nothing is prepared").
--     Wove FORWARD to Luke 22:19 ("this do in remembrance of me") for the remembering-of-deliverance
--     pattern, and to Ps 30:11-12 / Lam 3:22-23 for the sorrow-to-joy turn.
--
-- Esther 9 coverage:
--   v.1   (great reversal)  NT:     none warranted (the reversal-pattern surfaces at Luke 22:19 under the Purim thread)
--                           Extras: none warranted (clean canon witnesses carry the reversal weight)
--                           Tanakh: Gen 50:20, Ps 37:14-15, Prov 11:8, 1 Sam 2:4, Isa 54:17  -> THREAD 1
--   v.2-9 (the defense)     NT/Extras/Tanakh: none warranted (narrative detail; weight gathered at v1 reversal + v10 restraint)
--   v.10  (no spoil)        NT:     none warranted
--                           Extras: none warranted
--                           Tanakh: 1 Sam 15:9, 1 Sam 15:19, Deut 25:19, Gen 14:23  -> THREAD 2
--   v.11-14 (Shushan/sons)  none warranted (narrative; the ten sons + Agagite tie carried under v10)
--   v.15-16 (no prey x2)    Tanakh: folded into THREAD 2 as the source phrase (restraint stated three times)
--   v.17-19 (rest/feasting) Tanakh: folded into THREAD 4 (sorrow-to-joy)
--   v.22  (Purim/poor)      NT:     Luke 22:19 (this do in remembrance)         -> THREAD 3
--                           Extras: none warranted (Lev-23-feast guard: do not borrow festal apparatus)
--                           Tanakh: Exod 12:14, Josh 4:6-7, Neh 8:10, Neh 8:12  -> THREAD 3
--   v.20-21,23-27 (letters) none warranted (institution detail; carried under v22 Purim thread)
--   v.28  (remembered/kept) Tanakh: Ps 30:11-12, Lam 3:22-23                    -> THREAD 4 (with v22)
--   v.29-32 (confirmed)     none warranted (confirmation by letter; carried under v28)
--
-- THREADS (4):
--   1. esther-9-turned-to-the-contrary-the-great-reversal           Tanakh (canon only) -> free
--   2. esther-9-they-laid-not-their-hand-on-the-spoil               Tanakh (canon only) -> free
--   3. esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor   Tanakh + NT (Luke) -> free
--   4. esther-9-from-sorrow-to-joy-and-the-memorial-kept            Tanakh (canon only) -> free
-- NO extras members anywhere -> every thread tier_required = 'free'. No 'AS m(' compact form used.

CREATE TEMP VIEW _s317_esth09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the great reversal (9:1)
    ('canon','esther',9,1,'canon','genesis',50,20,'free',
      E'*But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20) The same hidden hand that turned the brothers'' evil to the saving of many turns Haman''s gallows-day into deliverance: *in the day that the enemies of the Yahudim (Jews) hoped to have power over them, (though it was turned to the contrary)* (Esther 9:1) — Yahuah works unnamed, but He works.'),
    ('canon','esther',9,1,'canon','psalms',37,14,'free',
      E'*The wicked have drawn out the sword, and have bent their bow, to cast down the poor and needy, and to slay such as be of upright conversation.* (Psalm 37:14) This is exactly Haman''s decree drawn against the Yahudim (Jews) — the sword bent to cast down the helpless on the appointed day.'),
    ('canon','esther',9,1,'canon','psalms',37,15,'free',
      E'*Their sword shall enter into their own heart, and their bows shall be broken.* (Psalm 37:15) The reversal in one line: the very weapon turns back on the wicked — *it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them* (Esther 9:1), as Haman hanged on his own gallows.'),
    ('canon','esther',9,1,'canon','proverbs',11,8,'free',
      E'*The righteous is delivered out of trouble, and the wicked cometh in his stead.* (Proverbs 11:8) The proverb is the whole plot of Purim in miniature — the trouble prepared for the Yahudim (Jews) falls instead upon those that hated them.'),
    ('canon','esther',9,1,'canon','1-samuel',2,4,'free',
      E'*The bows of the mighty men are broken, and they that stumbled are girded with strength.* (1 Samuel 2:4) Hannah''s song names the reversal long before: the strong are broken and the lowly girded — *it was turned to the contrary* (Esther 9:1).'),
    ('canon','esther',9,1,'canon','isaiah',54,17,'free',
      E'*No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD)...* (Isaiah 54:17) The decree was the weapon formed; on the day it should have prospered it could not, for the deliverance of the covenant people is their heritage.'),

    -- THREAD 2: no spoil / the Amalek-war rightly finished (9:10, 9:15-16)
    ('canon','esther',9,10,'canon','1-samuel',15,9,'free',
      E'*But Saul and the people spared Agag, and the best of the sheep, and of the oxen, and of the fatlings, and the lambs, and all that was good, and would not utterly destroy them...* (1 Samuel 15:9) Saul of the tribe of Benjamin took the Amalekite spoil and so lost the kingdom; now Mordecai of that same tribe, against Haman the Agagite (Esther 9:24, of Agag''s line), takes NONE — *but on the spoil laid they not their hand* (Esther 9:10).'),
    ('canon','esther',9,10,'canon','1-samuel',15,19,'free',
      E'*Wherefore then didst thou not obey the voice of Yahuah (LORD), but didst fly upon the spoil, and didst evil in the sight of Yahuah (LORD)?* (1 Samuel 15:19) The charge that broke Saul — he flew upon the spoil — is precisely what the Yahudim (Jews) refuse three times over: *they laid not their hands on the prey* (Esther 9:16).'),
    ('canon','esther',9,10,'canon','deuteronomy',25,19,'free',
      E'*Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about... that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* (Deuteronomy 25:19) The standing command against Amalek is at last carried out cleanly against Agag''s heir Haman — and rest from enemies (Esther 9:16) is the very condition the Torah named.'),
    ('canon','esther',9,10,'canon','genesis',14,23,'free',
      E'*That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich:* (Genesis 14:23) Abram after his victory took no spoil, that the glory be Yahuah''s and not his own; the Yahudim (Jews) in their victory do the same — *but on the spoil laid they not their hand* (Esther 9:10).'),

    -- THREAD 3: Purim — remembrance of deliverance, gifts to the poor (9:22)
    ('canon','esther',9,22,'canon','exodus',12,14,'free',
      E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* (Exodus 12:14) Passover is the pattern of a remembered deliverance commanded by Yahuah; Purim is fashioned after that pattern — yet note the difference: Purim is a memorial the PEOPLE established (Esther 9:27), not one of the appointed times Yahuah ordained, but a true commemoration of His hidden saving hand.'),
    ('canon','esther',9,22,'canon','joshua',4,6,'free',
      E'*That this may be a sign among you, that when your children ask their fathers in time to come, saying, What mean ye by these stones?* (Joshua 4:6) The memorial stones at Jordan exist so the next generation will ask and be told the deliverance — the same purpose Purim is given: that *these days should be remembered and kept throughout every generation* (Esther 9:28).'),
    ('canon','esther',9,22,'canon','joshua',4,7,'free',
      E'*...these stones shall be for a memorial unto the children of Yashar''el (Israel) for ever.* (Joshua 4:7) A memorial set so the saving act is never forgotten — exactly what Mordecai writes Purim to be: *nor the memorial of them perish from their seed* (Esther 9:28).'),
    ('canon','esther',9,22,'canon','nehemiah',8,10,'free',
      E'*...eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* (Nehemiah 8:10) The mark of true festal joy is generosity to the one who has nothing — the very command of Purim: *days of feasting and joy, and of sending portions one to another, and gifts to the poor* (Esther 9:22).'),
    ('canon','esther',9,22,'canon','nehemiah',8,12,'free',
      E'*And all the people went their way to eat, and to drink, and to send portions, and to make great mirth...* (Nehemiah 8:12) The same returned-people, in the same era, keep joy by SENDING PORTIONS — the practice Purim enshrines (Esther 9:22).'),
    ('canon','esther',9,22,'canon','luke',22,19,'free',
      E'*And he took bread, and gave thanks, and brake it, and gave unto them, saying, This is my body which is given for you: this do in remembrance of me.* (Luke 22:19) The whole life of the covenant is built on remembered deliverance kept by appointed act; Purim — *that they should make them days of feasting and joy* (Esther 9:22) — stands in that line of remembrances that the seed must not let perish.'),

    -- THREAD 4: from sorrow to joy, and the memorial kept (9:22, 9:28)
    ('canon','esther',9,22,'canon','psalms',30,11,'free',
      E'*Thou hast turned for me my mourning into dancing: thou hast put off my sackcloth, and girded me with gladness;* (Psalm 30:11) The Psalm names the very turn Purim commemorates — *the month which was turned unto them from sorrow to joy, and from mourning into a good day* (Esther 9:22).'),
    ('canon','esther',9,22,'canon','psalms',30,12,'free',
      E'*To the end that my glory may sing praise to thee, and not be silent. O Yahuah (LORD) my Elohim (God), I will give thanks unto thee for ever.* (Psalm 30:12) The purpose of every deliverance turned from mourning to joy is unceasing thanks — the spirit in which Purim is *remembered and kept throughout every generation* (Esther 9:28).'),
    ('canon','esther',9,28,'canon','lamentations',3,22,'free',
      E'*It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* (Lamentations 3:22) That the Yahudim (Jews) were not consumed on Haman''s appointed day is exactly this mercy — the memorial Purim keeps so the seed will not forget *that these days... should not fail* (Esther 9:28).'),
    ('canon','esther',9,28,'canon','lamentations',3,23,'free',
      E'*They are new every morning: great is thy faithfulness.* (Lamentations 3:23) The faithfulness that spared the people is renewed and rehearsed each year by the memorial — *that these days should be remembered and kept throughout every generation* (Esther 9:28).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-9-turned-to-the-contrary-the-great-reversal',
       E'Turned to the Contrary — the Great Reversal',
       E'Esther 9 opens on the very day Haman appointed for the destruction of the covenant people — *in the day that the enemies of the Yahudim (Jews) hoped to have power over them, (though it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them;)* (Esther 9:1). The divine NAME is never spoken in this book; Yahuah works by hidden providence — yet the whole canon names this kind of turn. *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20): the same unseen hand that bent the brothers'' evil toward the saving of many bends Haman''s gallows-day into deliverance. The Psalms describe the mechanism exactly: *The wicked have drawn out the sword, and have bent their bow, to cast down the poor and needy* (Psalm 37:14) — Haman''s decree to the letter — but *their sword shall enter into their own heart, and their bows shall be broken* (Psalm 37:15), as Haman hanged on his own gallows. The proverb is the plot in miniature: *The righteous is delivered out of trouble, and the wicked cometh in his stead* (Proverbs 11:8). Hannah sang it long before: *The bows of the mighty men are broken, and they that stumbled are girded with strength* (1 Samuel 2:4). And Isaiah seals the heritage of the people: *No weapon that is formed against thee shall prosper... This is the heritage of the servants of Yahuah (LORD)* (Isaiah 54:17). The weapon was forged; on the day it should have prevailed it could not.',
       sv.verse_id, ev.verse_id, 'free', 32700
  FROM _s317_esth09_lookup sv, _s317_esth09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-9-they-laid-not-their-hand-on-the-spoil',
       E'They Laid Not Their Hand on the Spoil',
       E'Three times the text presses the same restraint — *but on the spoil laid they not their hand* (Esther 9:10), *but on the prey they laid not their hand* (Esther 9:15), *but they laid not their hands on the prey* (Esther 9:16) — though the king''s decree had granted them the plunder. This is no incidental detail; it shows the day was deliverance, not greed, and it finishes rightly a war Saul botched. Saul of the tribe of Benjamin was sent to destroy Amalek and *spared Agag, and the best of the sheep, and of the oxen, and of the fatlings... and would not utterly destroy them* (1 Samuel 15:9), and for it lost the kingdom: *Wherefore then didst thou not obey the voice of Yahuah (LORD), but didst fly upon the spoil, and didst evil in the sight of Yahuah (LORD)?* (1 Samuel 15:19). Now Mordecai of that very tribe stands against Haman the Agagite — *Haman the son of Hammedatha, the Agagite, the enemy of all the Yahudim (Jews)* (Esther 9:24), Agag''s own line — and takes nothing. The standing Torah command is at last fulfilled clean: *that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19), and with the rest from enemies the Torah named (Esther 9:16). It is the posture of Abram, who after victory swore *that I will not take from a thread even to a shoelatchet... lest thou shouldest say, I have made Abram rich* (Genesis 14:23): the glory belongs to Yahuah''s hidden hand, not to the victors'' purse.',
       sv.verse_id, ev.verse_id, 'free', 32701
  FROM _s317_esth09_lookup sv, _s317_esth09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor',
       E'Purim — the Remembrance of Deliverance, and Gifts to the Poor',
       E'Mordecai writes the people to keep the fourteenth and fifteenth of Adar yearly *as the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor* (Esther 9:22), and they call these days Purim after the Pur, the lot Haman cast. Frame it carefully: Purim is a memorial the PEOPLE established — *The Yahudim (Jews) ordained, and took upon them, and upon their seed* (Esther 9:27) — not one of the appointed times of Leviticus 23 that Yahuah commanded, but a genuine commemoration of His hidden saving hand, fashioned after the pattern of the deliverances He DID command to be remembered. Passover is that pattern: *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations* (Exodus 12:14); and the stones at Jordan: *that when your children ask their fathers in time to come... What mean ye by these stones?* (Joshua 4:6) — *these stones shall be for a memorial unto the children of Yashar''el (Israel) for ever* (Joshua 4:7), a sign set so the saving act is told to every generation. The mark of true festal joy is generosity to the one who has nothing: *eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared... for the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10), and the people *went their way to eat, and to drink, and to send portions, and to make great mirth* (Nehemiah 8:12) — the very practice Purim enshrines. The whole covenant life is built on remembered deliverance kept by an appointed act, the line the Messiah extends: *This is my body which is given for you: this do in remembrance of me* (Luke 22:19). The seed must not let the memory perish.',
       sv.verse_id, ev.verse_id, 'free', 32702
  FROM _s317_esth09_lookup sv, _s317_esth09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=9 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-9-from-sorrow-to-joy-and-the-memorial-kept',
       E'From Sorrow to Joy, and the Memorial Kept',
       E'The month *which was turned unto them from sorrow to joy, and from mourning into a good day* (Esther 9:22) names a turn the Psalms had already sung: *Thou hast turned for me my mourning into dancing: thou hast put off my sackcloth, and girded me with gladness* (Psalm 30:11) — and to what end? *To the end that my glory may sing praise to thee, and not be silent. O Yahuah (LORD) my Elohim (God), I will give thanks unto thee for ever* (Psalm 30:12): the purpose of every deliverance turned from mourning is unceasing thanks. That the people were not consumed on Haman''s appointed day is the mercy Lamentations confesses out of the deepest ruin: *It is of the LORD''S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22); *they are new every morning: great is thy faithfulness* (Lamentations 3:23). So Mordecai writes the memorial to stand — *that these days should be remembered and kept throughout every generation, every family, every province, and every city... nor the memorial of them perish from their seed* (Esther 9:28) — a faithfulness rehearsed and renewed each year so the seed will never forget the hidden hand that turned the day.',
       sv.verse_id, ev.verse_id, 'free', 32703
  FROM _s317_esth09_lookup sv, _s317_esth09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=9 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 50:20 — *ye thought evil against me; but Elohim (God) meant it unto good* : the hidden hand that turns evil to saving, as the day was turned to the contrary.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-turned-to-the-contrary-the-great-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 37:14 — *The wicked have drawn out the sword... to cast down the poor and needy* : Haman''s decree to the letter.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-turned-to-the-contrary-the-great-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 37:15 — *Their sword shall enter into their own heart* : the reversal in one line, Haman on his own gallows.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-turned-to-the-contrary-the-great-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead* : the whole plot of Purim in miniature.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-turned-to-the-contrary-the-great-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength* : Hannah names the reversal long before.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-turned-to-the-contrary-the-great-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Isaiah 54:17 — *No weapon that is formed against thee shall prosper... This is the heritage of the servants of Yahuah (LORD)* : the decree was the weapon formed; on its day it could not prosper.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-turned-to-the-contrary-the-great-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 15:9 — *Saul and the people spared Agag... and would not utterly destroy them* : Saul took the Amalekite spoil; Mordecai of that tribe takes none.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-they-laid-not-their-hand-on-the-spoil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 15:19 — *but didst fly upon the spoil, and didst evil in the sight of Yahuah (LORD)* : the charge that broke Saul, refused three times here.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-they-laid-not-their-hand-on-the-spoil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 25:19 — *thou shalt blot out the remembrance of Amalek... thou shalt not forget it* : the standing command finished cleanly against Agag''s heir Haman.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-they-laid-not-their-hand-on-the-spoil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 14:23 — *I will not take from a thread even to a shoelatchet... lest thou shouldest say, I have made Abram rich* : Abram took no spoil, that the glory be Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-they-laid-not-their-hand-on-the-spoil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 12:14 — *this day shall be unto you for a memorial... a feast to Yahuah (LORD) throughout your generations* : the Passover pattern of a commanded remembered deliverance, after which Purim is fashioned (yet Purim is people-established, not a Lev-23 appointed time).'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 4:6 — *when your children ask their fathers... What mean ye by these stones?* : the memorial set so the saving act is told to the next generation.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Joshua 4:7 — *these stones shall be for a memorial unto the children of Yashar''el (Israel) for ever* : a memorial so the deliverance never perishes from the seed (Esther 9:28).'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Nehemiah 8:10 — *send portions unto them for whom nothing is prepared... the joy of Yahuah (LORD) is your strength* : true festal joy marked by gifts to the poor, the very command of Purim.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Nehemiah 8:12 — *to eat, and to drink, and to send portions, and to make great mirth* : the same returned-people keep joy by sending portions, the practice Purim enshrines.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Luke 22:19 — *this do in remembrance of me* : the covenant line of remembered deliverance kept by an appointed act, which the seed must not let perish.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-purim-the-remembrance-of-deliverance-gifts-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 30:11 — *Thou hast turned for me my mourning into dancing... and girded me with gladness* : the turn Purim commemorates, sorrow to joy.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-from-sorrow-to-joy-and-the-memorial-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 30:12 — *that my glory may sing praise to thee... I will give thanks unto thee for ever* : the purpose of every turned mourning is unceasing thanks.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-from-sorrow-to-joy-and-the-memorial-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lamentations 3:22 — *It is of the LORD''S mercies that we are not consumed, because his compassions fail not* : that the people were not consumed on Haman''s day is exactly this mercy.'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=28
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-from-sorrow-to-joy-and-the-memorial-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Lamentations 3:23 — *they are new every morning: great is thy faithfulness* : the faithfulness that spared the people, rehearsed and renewed each year by the memorial (Esther 9:28).'
  FROM cross_reference_threads t
  JOIN _s317_esth09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=9 AND sv.verse_number=28
  JOIN _s317_esth09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-9-from-sorrow-to-joy-and-the-memorial-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_esther_10.sql (Esther 10) -----
-- Esther 10 — full-library cross-references (Tanakh foundation layer)
-- Book slug: esther | chapter 10 (3 verses) | session prefix s317 | tag esth10
-- sort_order band start 32725 (+1 per thread)
-- ⚠ THE CLOSING CHAPTER OF ESTHER — the final chapter of the entire Writings track.
-- ⚠ The divine NAME is never spoken in Esther — Yahuah works by HIDDEN PROVIDENCE. No invented name-mention.
--
-- Esther 10 coverage:
--   v.1  (king lays tribute on land and isles)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (frame/setting verse, no framework weight)
--   v.2  (acts of his power, greatness of Mordecai, book of the chronicles of Media and Persia)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (the deeds are RECORDED — folded into the v.3 keystone; no standalone thread)
--   v.3  ★★ Mordecai the Yahudi NEXT UNTO the king, great among the Yahudim, accepted of his
--        brethren, SEEKING THE WEALTH (welfare/good) OF HIS PEOPLE, and SPEAKING PEACE to all his seed
--        NT:     Romans 14:19 (follow after the things which make for peace) — FORWARD
--        Extras: none warranted (no clean extras witness adds weight over the canon Joseph-type + peace cluster)
--        Tanakh: Gen 41:40 / 45:7 / 50:21 (Joseph second-to-Pharaoh, preserving + comforting his
--                brethren), Jer 29:7 (seek the peace of the city), Ps 122:6 (pray for the peace of
--                Jerusalem), Neh 2:10 (a man come to seek the welfare of Yashar''el)
--
-- THREADS (2 — a 3-verse chapter, kept tight and strong; both ALL-CANON => tier 'free'):
--   1. esther-10-mordecai-next-unto-the-king-the-joseph-pattern-deliverer  [Tanakh + NT]
--        10:3 -> Gen 41:40, Gen 45:7, Gen 50:21, Rom 14:19
--   2. esther-10-seeking-the-welfare-and-speaking-peace-to-all-his-people   [Tanakh + NT]
--        10:3 -> Jer 29:7, Ps 122:6, Neh 2:10, Rom 14:19
--   ★★ FRAMING: Mordecai exalted to SECOND in the empire, seeking his people''s good and speaking
--      peace to all his seed = the JOSEPH-PATTERN (the faithful exile raised to preserve and comfort
--      his brethren) — handled as a FAINT TYPE/foreshadow (lightly) of the greater Son exalted to
--      save and bless and speak peace to his people. The book closes on hidden providence VINDICATED:
--      the threatened people preserved, their faithful one exalted. No forced divine-name reading.
--
-- ----- view -----
CREATE TEMP VIEW _s317_esth10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----- cross_references -----
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Joseph-pattern deliverer — second in the empire, preserving and comforting his brethren
    ('canon','esther',10,3,'canon','genesis',41,40,'free',
      E'*Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou* (Genesis 41:40). Joseph the sold-away exile is raised to be SECOND only to Pharaoh — exactly the place Mordecai now holds: *Mordecai the Yahudi (Jew) was next unto king Ahasuerus* (Esther 10:3). The faithful son cast among the nations is exalted to the second seat of a Gentile empire, and from there preserves his people.'),
    ('canon','esther',10,3,'canon','genesis',45,7,'free',
      E'*And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* (Genesis 45:7). Joseph names the hidden hand that set him over Egypt: not his own climb but Elohim sending him ahead to keep his brethren alive. So with Mordecai — *seeking the wealth of his people* (Esther 10:3): the exile is exalted that the seed might be preserved. The divine Name is unspoken in Esther, but the Joseph-pattern declares the providence working underneath.'),
    ('canon','esther',10,3,'canon','genesis',50,21,'free',
      E'*Now therefore fear ye not: I will nourish you, and your little ones. And he comforted them, and spake kindly unto them* (Genesis 50:21). The exalted Joseph does not avenge but nourishes and comforts his brethren — and Mordecai likewise stands *accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed* (Esther 10:3). The raised-up deliverer turns his power toward the good and the comfort of his own — a faint type of the greater Son exalted to save and to comfort his people.'),
    ('canon','esther',10,3,'canon','romans',14,19,'free',
      E'*Let us therefore follow after the things which make for peace, and things wherewith one may edify another* (Romans 14:19). Mordecai *speaking peace to all his seed* (Esther 10:3) embodies the same posture the apostle presses on the gathered house — power and standing spent in pursuit of peace and the building-up of the brethren, not self.'),
    -- THREAD 2: seeking the welfare and speaking peace to all his people (the servant-ruler)
    ('canon','esther',10,3,'canon','jeremiah',29,7,'free',
      E'*And seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace* (Jeremiah 29:7). The exiles are charged to seek the peace of the very empire that carried them away — and Mordecai, the exalted captive, does exactly this: *speaking peace to all his seed* (Esther 10:3), *seeking the wealth of his people* from within the Persian court. The faithful exile is the answer to Jeremiah''s charge.'),
    ('canon','esther',10,3,'canon','psalms',122,6,'free',
      E'*Pray for the peace of Jerusalem: they shall prosper that love thee* (Psalm 122:6). The Psalm binds the welfare of the people to the seeking of their peace — and Mordecai stands *seeking the wealth of his people, and speaking peace to all his seed* (Esther 10:3). The servant-ruler who loves his people labours for their peace and their prospering.'),
    ('canon','esther',10,3,'canon','nehemiah',2,10,'free',
      E'*...it grieved them exceedingly that there was come a man to seek the welfare of the children of Yashar''el (Israel)* (Nehemiah 2:10). Nehemiah, like Mordecai, is a faithful Yahudi raised to high place in the Persian court who bends that office to *seek the welfare* of his own — the same word that names Mordecai *seeking the wealth of his people* (Esther 10:3). Two exiles, one calling: the high servant who spends his standing for his people''s good.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s317_esth10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s317_esth10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-10-mordecai-next-unto-the-king-the-joseph-pattern-deliverer',
       E'Next unto the king: the Joseph-pattern deliverer exalted to preserve his people',
       E'The book of Esther closes where it has run the whole way through — on the hidden providence of Yahuah, whose Name is never once spoken, vindicated in the deeds of the saved people and their exalted servant. *For Mordecai the Yahudi (Jew) was next unto king Ahasuerus, and great among the Yahudim (Jews), and accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed* (Esther 10:3). The faithful exile, who would not bow, is raised to the second seat of the empire — and this is no new thing. It is the JOSEPH-PATTERN, written long before in Torah. Joseph, sold away into a Gentile land, is set by Pharaoh second only to the throne: *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou* (Genesis 41:40). And Joseph names the hand underneath his rise — the same hand Esther keeps unnamed: *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* (Genesis 45:7). The exile was exalted that the seed might be PRESERVED. And the exalted one does not avenge but comforts: *Now therefore fear ye not: I will nourish you, and your little ones. And he comforted them, and spake kindly unto them* (Genesis 50:21). So Mordecai too — *accepted of the multitude of his brethren* — turns his power toward their good. This is the come-and-see shape the canon keeps drawing: the faithful son cast among the nations, raised up to save and to comfort his own, *speaking peace to all his seed*; and the apostle presses the same posture on the gathered house — *Let us therefore follow after the things which make for peace, and things wherewith one may edify another* (Romans 14:19). Read lightly, the pattern points beyond Mordecai to the greater Son exalted at the right hand to seek and save and speak peace to his people. The Writings end here: the threatened people preserved, their faithful one lifted up, the unseen Yahuah working all of it underground.',
       sv.verse_id, ev.verse_id, 'free', 32725
  FROM _s317_esth10_lookup sv, _s317_esth10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'esther-10-seeking-the-welfare-and-speaking-peace-to-all-his-people',
       E'Seeking the welfare and speaking peace: the high servant who spends his standing for his people',
       E'*...seeking the wealth of his people, and speaking peace to all his seed* (Esther 10:3). The book''s last line gives the measure of the man Yahuah preserved through Haman''s decree: not a ruler who climbed for himself, but a servant-ruler who bends the second seat of an empire toward his people''s GOOD and their PEACE. This is the exile''s charter, given by Jeremiah to the very captives carried to Babylon: *And seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace* (Jeremiah 29:7). Mordecai, the exalted captive in Persia, is that word made flesh — *speaking peace to all his seed* from within the king''s court. The Psalm of ascents binds the people''s prospering to the seeking of their peace: *Pray for the peace of Jerusalem: they shall prosper that love thee* (Psalm 122:6). And the pattern repeats in Mordecai''s near kinsman in the same Persian generation — Nehemiah, another faithful Yahudi raised to high office, of whom it is said *there was come a man to seek the welfare of the children of Yashar''el (Israel)* (Nehemiah 2:10): the very same calling, *to seek the welfare*, that names Mordecai *seeking the wealth of his people*. Two exiles, one office, one heart — the high servant who spends his standing not on himself but on the good and the peace of his own. The apostle gathers the whole posture into one charge to the restored house: *Let us therefore follow after the things which make for peace, and things wherewith one may edify another* (Romans 14:19). So the Writings close: the hidden Yahuah preserves a people, and the one He exalts seeks their welfare and speaks peace to all their seed.',
       sv.verse_id, ev.verse_id, 'free', 32726
  FROM _s317_esth10_lookup sv, _s317_esth10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='esther' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread members -----
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt be over my house... only in the throne will I be greater than thou* (Genesis 41:40) — Joseph set second to Pharaoh, the type of Mordecai *next unto king Ahasuerus*.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-mordecai-next-unto-the-king-the-joseph-pattern-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) sent me before you to preserve you a posterity in the earth* (Genesis 45:7) — the exile exalted to preserve the seed; the hidden providence Esther leaves unnamed.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-mordecai-next-unto-the-king-the-joseph-pattern-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He comforted them, and spake kindly unto them* (Genesis 50:21) — the raised-up Joseph nourishes and comforts his brethren, as Mordecai is *accepted of the multitude of his brethren*.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-mordecai-next-unto-the-king-the-joseph-pattern-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Follow after the things which make for peace... wherewith one may edify another* (Romans 14:19) — the FORWARD weave: Mordecai *speaking peace to all his seed* embodies the apostle''s charge to the gathered house.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-mordecai-next-unto-the-king-the-joseph-pattern-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Seek the peace of the city... in the peace thereof shall ye have peace* (Jeremiah 29:7) — the exile''s charter; Mordecai is that word made flesh, *speaking peace to all his seed* from within the Persian court.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-seeking-the-welfare-and-speaking-peace-to-all-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Pray for the peace of Jerusalem: they shall prosper that love thee* (Psalm 122:6) — the people''s prospering bound to the seeking of their peace, as Mordecai seeks his people''s *wealth* and *peace*.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=122 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-seeking-the-welfare-and-speaking-peace-to-all-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...a man to seek the welfare of the children of Yashar''el (Israel)* (Nehemiah 2:10) — Nehemiah, the same Persian-court calling as Mordecai *seeking the wealth of his people*: the high servant spending his office for his own.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-seeking-the-welfare-and-speaking-peace-to-all-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Follow after the things which make for peace... wherewith one may edify another* (Romans 14:19) — the FORWARD weave: the servant-ruler''s peace-seeking gathered into the apostle''s charge to the restored house.'
  FROM cross_reference_threads t
  JOIN _s317_esth10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='esther' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s317_esth10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='esther-10-seeking-the-welfare-and-speaking-peace-to-all-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session317 — Esther cross-references complete.'
