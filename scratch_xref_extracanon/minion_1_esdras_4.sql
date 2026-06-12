-- ----- fragment: minion_1esdras_04.sql (session253 1-esdras 4) -----
-- Source anchor: apocrypha/1-esdras ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd4 (view _session253_1esd4_lookup). Sort band base 62575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-4-great-is-truth
  ('apocrypha', '1-esdras', 4, 38, 'canon', 'john', 14, 6, 'free', E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that lives and conquereth for evermore is not an abstraction but a Person, in whom 1 Esdras 4:38''s enduring Truth stands incarnate.'),
  ('apocrypha', '1-esdras', 4, 41, 'canon', 'john', 17, 17, 'free', E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth the people exalt as mighty above all things in 1 Esdras 4:41 is identified by Yahusha as the very word of the Father.'),
  ('apocrypha', '1-esdras', 4, 38, 'canon', 'psalms', 117, 2, 'free', E'Psalm 117:2 — *For his merciful kindness is great toward us: and the truth of Yahuah (LORD) endureth for ever. Praise ye Yahuah (LORD).* What Zerubbabel declares of Truth that endureth and conquereth for evermore in 1 Esdras 4:38, the psalm already anchors in Yahuah whose truth endureth for ever.'),
  ('apocrypha', '1-esdras', 4, 40, 'canon', 'psalms', 119, 160, 'free', E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* Where 1 Esdras 4:40 names Truth the majesty of all ages with no unrighteousness in her judgment, the psalm ties that ageless, righteous-judging Truth to Yahuah''s word true from the beginning.'),
  -- thread: 1-esdras-4-blessed-elohim-of-truth
  ('apocrypha', '1-esdras', 4, 40, 'canon', 'psalms', 100, 5, 'free', E'Psalm 100:5 — *For Yahuah (LORD) is good; his mercy is everlasting; and his truth endureth to all generations.* The Elohim of truth blessed in 1 Esdras 4:40 is the LORD whose truth endureth to all generations, the majesty of all ages.'),
  ('apocrypha', '1-esdras', 4, 39, 'canon', 'john', 17, 17, 'free', E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth with whom is no accepting of persons in 1 Esdras 4:39 is the Father''s own word, by which his people are set apart.'),
  ('apocrypha', '1-esdras', 4, 40, 'canon', 'psalms', 119, 160, 'free', E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* The righteous, unfailing judgment of Truth in 1 Esdras 4:40 is the very character of Yahuah''s word, true from the beginning and enduring for ever.'),
  -- thread: 1-esdras-4-king-heart-in-the-hand
  ('apocrypha', '1-esdras', 4, 3, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The king of 1 Esdras 4:3, lord of all and obeyed in everything, is himself only a river Yahuah turns where he wills.'),
  ('apocrypha', '1-esdras', 4, 8, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king who commands to build or make desolate in 1 Esdras 4:8 is removed and set up by Yahuah, who alone gives the wisdom Zerubbabel is about to display.'),
  -- thread: 1-esdras-4-leaves-father-cleaves-wife
  ('apocrypha', '1-esdras', 4, 20, 'canon', 'genesis', 2, 24, 'free', E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The leaving-and-cleaving the guardsman cites in 1 Esdras 4:20 is the Eden ordinance, the man cleaving to his wife as one flesh.'),
  ('apocrypha', '1-esdras', 4, 20, 'canon', 'matthew', 19, 5, 'free', E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha quotes the same leaving-and-cleaving that 1 Esdras 4:20 observes, sealing it as the joining no man may sunder.'),
  ('apocrypha', '1-esdras', 4, 25, 'canon', 'ephesians', 5, 31, 'free', E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* The love of wife above father and mother in 1 Esdras 4:25 is read by Paul as the great mystery of the one flesh, figuring Messiah and his bride.'),
  -- thread: 1-esdras-4-rebuild-jerusalem-vessels
  ('apocrypha', '1-esdras', 4, 44, 'canon', 'ezra', 1, 7, 'free', E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods.* The vessels Cyrus set apart that Zerubbabel asks returned in 1 Esdras 4:44 are the same Ezra records Cyrus bringing forth for the captivity.'),
  ('apocrypha', '1-esdras', 4, 57, 'canon', 'ezra', 1, 11, 'free', E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* The sending away of all the Babylon vessels in 1 Esdras 4:57 is tallied in Ezra as the gold and silver carried up to Jerusalem.'),
  ('apocrypha', '1-esdras', 4, 43, 'canon', 'isaiah', 44, 28, 'free', E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* The vow to build Jerusalem that Zerubbabel invokes in 1 Esdras 4:43 was decreed by Yahuah, who named Cyrus his shepherd to rebuild the city.'),
  ('apocrypha', '1-esdras', 4, 45, 'canon', 'isaiah', 45, 13, 'free', E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* The rebuilding of the temple Zerubbabel requires in 1 Esdras 4:45 fulfills Yahuah''s word that his raised-up king would build the city and free the captives, not for price nor reward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-great-is-truth',
       E'Great is the Truth, and stronger than all things',
       E'Zerubbabel, the third of the king''s guard, sets Truth above wine, the king, and women: *As for the truth, it endureth, and is always strong; it lives and conquereth for evermore* (1 Esdras 4:38), and *she is the strength, kingdom, power, and majesty, of all ages. Blessed be Yahuah (God) of truth* (1 Esdras 4:40), so that all the people shout *Great is Truth, and mighty above all things* (1 Esdras 4:41). It ain''t new: this is the LORD himself made flesh, *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6); and the truth that conquers is his word, *Sanctify them through thy truth: thy word is truth* (John 17:17). What Zerubbabel saw endure for ever the psalmist had already sung, *For his merciful kindness is great toward us: and the truth of Yahuah (LORD) endureth for ever. Praise ye Yahuah (LORD)* (Psalm 117:2).',
       sv.verse_id, ev.verse_id, 'extras', 62575
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-blessed-elohim-of-truth',
       E'Blessed be the Elohim of truth',
       E'Zerubbabel''s oration closes in worship: *Neither in her judgment is any unrighteousness; and she is the strength, kingdom, power, and majesty, of all ages. Blessed be Yahuah (God) of truth* (1 Esdras 4:40). The God of truth whose mercy endures is the same the psalmist praises, *For Yahuah (LORD) is good; his mercy is everlasting; and his truth endureth to all generations* (Psalm 100:5); and his word stands true from first to last, *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever* (Psalm 119:160). It ain''t new: the covenant God of truth Zerubbabel blesses is the One whose word is truth (John 17:17).',
       sv.verse_id, ev.verse_id, 'extras', 62578
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-king-heart-in-the-hand',
       E'The king is mighty, yet his heart is in Yahuah''s hand',
       E'The second guardsman exalts the king: *But yet the king is more mighty: for he is lord of all these things, and has dominion over them; and whatsoever he commands them they do* (1 Esdras 4:3), and *if he command to build, they build... if he command to plant, they plant* (1 Esdras 4:8-9). Yet Zerubbabel will overturn this, for above every king stands Truth — and Scripture sets that king himself under Yahuah''s hand, *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). It is Yahuah who *changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise* (Daniel 2:21) — the very wisdom by which the next speaker prevails.',
       sv.verse_id, ev.verse_id, 'extras', 62581
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-leaves-father-cleaves-wife',
       E'A man leaveth his father and cleaveth to his wife',
       E'Pleading the strength of women, the third speaker says, *A man leaveth his own father that brought him up, and his own country, and cleaveth to his wife* (1 Esdras 4:20), and *Wherefore a man loves his wife better than father or mother* (1 Esdras 4:25). It ain''t new: this is the creation ordinance, *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24), which Yahusha takes up as the unbreakable joining, *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5). Paul reads the one flesh as the mystery of Messiah and the assembly, *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh* (Ephesians 5:31).',
       sv.verse_id, ev.verse_id, 'extras', 62584
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-rebuild-jerusalem-vessels',
       E'Remember thy vow to build Jerusalem and restore the vessels',
       E'Found wisest, Zerubbabel claims as his reward not riches but the restoration: *Remember your vow, which you have vowed to build Jerusalem, in the day when you camest to your kingdom* (1 Esdras 4:43), *And to send away all the vessels that were taken away out of Jerusalem, which Cyrus set apart* (1 Esdras 4:44), and *He sent away also all the vessels from Babylon, that Cyrus had set apart... and sent to Jerusalem* (1 Esdras 4:57). This is the very decree of Ezra, *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods* (Ezra 1:7), numbered out for the return, *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem* (Ezra 1:11). It ain''t new: Yahuah had named Cyrus long before, *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid* (Isaiah 44:28) — the city rebuilt not for price nor reward but by the LORD''s own hand.',
       sv.verse_id, ev.verse_id, 'extras', 62587
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-4-great-is-truth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that lives and conquereth for evermore is not an abstraction but a Person, in whom 1 Esdras 4:38''s enduring Truth stands incarnate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth the people exalt as mighty above all things in 1 Esdras 4:41 is identified by Yahusha as the very word of the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 117:2 — *For his merciful kindness is great toward us: and the truth of Yahuah (LORD) endureth for ever. Praise ye Yahuah (LORD).* What Zerubbabel declares of Truth that endureth and conquereth for evermore in 1 Esdras 4:38, the psalm already anchors in Yahuah whose truth endureth for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=117 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* Where 1 Esdras 4:40 names Truth the majesty of all ages with no unrighteousness in her judgment, the psalm ties that ageless, righteous-judging Truth to Yahuah''s word true from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=160
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-blessed-elohim-of-truth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 100:5 — *For Yahuah (LORD) is good; his mercy is everlasting; and his truth endureth to all generations.* The Elohim of truth blessed in 1 Esdras 4:40 is the LORD whose truth endureth to all generations, the majesty of all ages.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-blessed-elohim-of-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=100 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth with whom is no accepting of persons in 1 Esdras 4:39 is the Father''s own word, by which his people are set apart.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-blessed-elohim-of-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* The righteous, unfailing judgment of Truth in 1 Esdras 4:40 is the very character of Yahuah''s word, true from the beginning and enduring for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-blessed-elohim-of-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=160
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-king-heart-in-the-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The king of 1 Esdras 4:3, lord of all and obeyed in everything, is himself only a river Yahuah turns where he wills.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-king-heart-in-the-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king who commands to build or make desolate in 1 Esdras 4:8 is removed and set up by Yahuah, who alone gives the wisdom Zerubbabel is about to display.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-king-heart-in-the-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-leaves-father-cleaves-wife
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The leaving-and-cleaving the guardsman cites in 1 Esdras 4:20 is the Eden ordinance, the man cleaving to his wife as one flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-leaves-father-cleaves-wife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha quotes the same leaving-and-cleaving that 1 Esdras 4:20 observes, sealing it as the joining no man may sunder.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-leaves-father-cleaves-wife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* The love of wife above father and mother in 1 Esdras 4:25 is read by Paul as the great mystery of the one flesh, figuring Messiah and his bride.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-leaves-father-cleaves-wife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-rebuild-jerusalem-vessels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods.* The vessels Cyrus set apart that Zerubbabel asks returned in 1 Esdras 4:44 are the same Ezra records Cyrus bringing forth for the captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* The sending away of all the Babylon vessels in 1 Esdras 4:57 is tallied in Ezra as the gold and silver carried up to Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* The vow to build Jerusalem that Zerubbabel invokes in 1 Esdras 4:43 was decreed by Yahuah, who named Cyrus his shepherd to rebuild the city.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* The rebuilding of the temple Zerubbabel requires in 1 Esdras 4:45 fulfills Yahuah''s word that his raised-up king would build the city and free the captives, not for price nor reward.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

