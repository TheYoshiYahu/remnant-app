-- ----- fragment: minion_apocalypseofabraham_07.sql (session253 apocalypse-of-abraham 7) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa7 (view _session253_aoa7_lookup). Sort band base 67150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-7-fire-water-no-god
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 2, 'apocrypha', 'the-wisdom-of-solomon', 13, 2, 'extras', E'Wisdom of Solomon 13:2 — *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* The Apocrypha names the very ladder Abraham climbs in 7:2 — fire, water, the stars — and calls it the error of those who mistook creature for Creator.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 3, 'apocrypha', 'the-wisdom-of-solomon', 13, 4, 'extras', E'Wisdom of Solomon 13:4 — *But if they were astonished at their power and virtue, let them understand by them, how much mightier he is that made them.* Abraham''s refusal to call water ''Elohim'' because it is subject to the earth (7:3) is the same reasoning: the power of a thing points past it to the One who made it mightier still.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 1, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* What is subjected and perishable, as Abraham says of fire in 7:1, cannot answer or save — the same indictment the Psalm lays on every idol.'),
  -- thread: apocalypse-of-abraham-7-sun-moon-stars-not-god
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 8, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abraham''s refusal to call moon or stars god (7:8) is the very fence Moses sets — the host of heaven serves, it is not served.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 6, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun Abraham honours but will not worship (7:6) is a made thing, ruled and set in place by the One who made it.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 7, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The sun whose course is obscured by night and cloud (7:7) profits no more than the carved idol — both are vanity beside the Maker.'),
  -- thread: apocalypse-of-abraham-7-terah-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 9, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abraham''s address to Terah in 7:9 stands at the exact hinge Joshua names — the father served other gods; the son will make known the One who made everything.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 9, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call where this chapter sets it — in Abraham''s homeland among the idols, before the going out, the same Elohim Abraham proclaims to Terah in 7:9.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 9, 'canon', 'jeremiah', 10, 10, 'free', E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The ''Elohim who hath made everything'' that Abraham names in 7:9 is Jeremiah''s living and true Elohim, set against the gods that did not make the heavens.'),
  -- thread: apocalypse-of-abraham-7-maker-of-all
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 12, 'canon', 'genesis', 1, 9, 'free', E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* Abraham''s praise that the Maker ''hath made the earth dry in the midst of many waters'' (7:12) recites the third day of Genesis word for deed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 12, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The crimsoned heavens and golden sun Abraham points to in 7:12 are the very handywork the Psalm says declares the Maker''s glory.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 13, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Abraham''s plea that Elohim reveal Himself through Himself (7:13) meets Paul''s word that the made things already make Him clearly seen.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-fire-water-no-god',
       E'Fire and water are not gods — the elements are subjected',
       E'Young Abraham reasons his way up the ladder of the elements and finds every one of them subject to another: *Behold, the fire is more worthy of honour than all things formed, because even that which is not subjected is subjected unto it, and things easily perishable are mocked by its flames.* (Apocalypse of Abraham 7:1) — *But even more worthy of honour is the water, because it conquereth the fire and satisfieth the earth.* (Apocalypse of Abraham 7:2) — *But even it I do not call Elohim (God), because it is subjected to the earth under which the water inclineth.* (Apocalypse of Abraham 7:3). It ain''t new: the same dismantling stands in the Apocrypha, where the men who mistook the elements for the powers that rule the world are answered — *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* (Wisdom of Solomon 13:2) — *But if they were astonished at their power and virtue, let them understand by them, how much mightier he is that made them.* (Wisdom of Solomon 13:4). A thing that can be conquered cannot save: *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5). The system of carved and elemental gods is taken apart; only the Maker stands.',
       sv.verse_id, ev.verse_id, 'extras', 67150
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-sun-moon-stars-not-god',
       E'Nor sun, nor moon, nor stars — the host of heaven obscured',
       E'Abraham climbs past the earth to the lights of the sky, and finds even these fail: *I call the sun more worthy of honour than the earth, because it with its rays illumineth the whole world and the different atmospheres.* (Apocalypse of Abraham 7:6) — *But even it I do not call god, because at night and by clouds its course is obscured.* (Apocalypse of Abraham 7:7) — *Nor, again, do I call the moon or the stars god, because they also in their season obscure their light at night.* (Apocalypse of Abraham 7:8). The Torah set this same fence: *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* (Deuteronomy 4:19). For the lights were made — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* (Genesis 1:16) — and a made thing is no god. It ain''t new: Abraham reaches by reason what Moses commands by covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67153
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-terah-other-gods',
       E'Hear, Terah my father — the call out of the fathers'' gods',
       E'Abraham turns from the elements to address the idol-maker himself: *But hear this, Terah my father; for I will make known to thee the Elohim (God) who hath made everything, not these we consider as gods.* (Apocalypse of Abraham 7:9). This is the household of Joshua''s witness — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* (Joshua 24:2) — and the scene Stephen preaches — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2). The living Elohim is the One who makes and is not made: *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king* (Jeremiah 10:10). The system of the fathers'' gods is left behind; the call out of Ur begins in this very rebuke.',
       sv.verse_id, ev.verse_id, 'extras', 67156
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-maker-of-all',
       E'Who hath crimsoned the heavens — the Maker of everything revealed',
       E'Abraham''s argument arrives at its end: only the Maker is worthy, and only He can reveal Himself. *Who hath crimsoned the heavens, and made the sun golden, and the moon lustrous, and with it the stars; and hath made the earth dry in the midst of many waters, and set thee in the world.* (Apocalypse of Abraham 7:12) — *Yet may Elohim (God) reveal Himself to us through Himself!* (Apocalypse of Abraham 7:13). This is Genesis'' own order of creation — the lights set, the dry land drawn out of the waters: *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* (Genesis 1:9). The heavens themselves preach the Maker — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1) — and Paul says the witness is plain — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made* (Romans 1:20). It ain''t new: from the made things Abraham reasons to the One who must reveal Himself, through Himself.',
       sv.verse_id, ev.verse_id, 'extras', 67159
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-7-fire-water-no-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 13:2 — *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* The Apocrypha names the very ladder Abraham climbs in 7:2 — fire, water, the stars — and calls it the error of those who mistook creature for Creator.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-fire-water-no-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:4 — *But if they were astonished at their power and virtue, let them understand by them, how much mightier he is that made them.* Abraham''s refusal to call water ''Elohim'' because it is subject to the earth (7:3) is the same reasoning: the power of a thing points past it to the One who made it mightier still.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-fire-water-no-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* What is subjected and perishable, as Abraham says of fire in 7:1, cannot answer or save — the same indictment the Psalm lays on every idol.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-fire-water-no-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-7-sun-moon-stars-not-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abraham''s refusal to call moon or stars god (7:8) is the very fence Moses sets — the host of heaven serves, it is not served.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-sun-moon-stars-not-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun Abraham honours but will not worship (7:6) is a made thing, ruled and set in place by the One who made it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-sun-moon-stars-not-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The sun whose course is obscured by night and cloud (7:7) profits no more than the carved idol — both are vanity beside the Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-sun-moon-stars-not-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-7-terah-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abraham''s address to Terah in 7:9 stands at the exact hinge Joshua names — the father served other gods; the son will make known the One who made everything.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-terah-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call where this chapter sets it — in Abraham''s homeland among the idols, before the going out, the same Elohim Abraham proclaims to Terah in 7:9.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-terah-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The ''Elohim who hath made everything'' that Abraham names in 7:9 is Jeremiah''s living and true Elohim, set against the gods that did not make the heavens.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-terah-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-7-maker-of-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* Abraham''s praise that the Maker ''hath made the earth dry in the midst of many waters'' (7:12) recites the third day of Genesis word for deed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-maker-of-all'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The crimsoned heavens and golden sun Abraham points to in 7:12 are the very handywork the Psalm says declares the Maker''s glory.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-maker-of-all'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Abraham''s plea that Elohim reveal Himself through Himself (7:13) meets Paul''s word that the made things already make Him clearly seen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-maker-of-all'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

