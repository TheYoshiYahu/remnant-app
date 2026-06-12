-- ----- fragment: minion_apocalypseofabraham_22.sql (session253 apocalypse-of-abraham 22) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa22 (view _session253_aoa22_lookup). Sort band base 67525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-22-the-word-planned-beforehand
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The commandment given to creation *through my Word* in Apocalypse of Abraham 22:3 is the same Word who was with Elohim in the beginning.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 3, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* That the creatures were commanded into being *through my Word* (Apocalypse of Abraham 22:3) is John''s confession that all things were made by Him.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 3, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Word through whom all is commanded in Apocalypse of Abraham 22:3 is He by whom all things were created and for whom they exist.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 4, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* What was *planned beforehand... ere it was created* (Apocalypse of Abraham 22:4) is the work of the Son by whom He made the worlds.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 4, 'canon', 'ephesians', 1, 4, 'free', E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* The picture that *stood before me ere it was created* (Apocalypse of Abraham 22:4) holds the elect chosen before the foundation of the world.'),
  -- thread: apocalypse-of-abraham-22-two-peoples-left-and-right
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side and right side of Apocalypse of Abraham 22:7-8 are the two manner of people separated from the bowels of Abraham''s own seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The destiny of judgement or restoration in Apocalypse of Abraham 22:7 is the same life-and-death set before the people in the Torah.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'matthew', 25, 33, 'free', E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The left for vengeance and the right set apart in Apocalypse of Abraham 22:7-8 is the very separation of the sheep and the goats at the end of the world.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two destinies of the multitude in Apocalypse of Abraham 22:7 are the broad way to destruction and the strait way to life.'),
  -- thread: apocalypse-of-abraham-22-azazel-bound
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 8, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The *peoples with Azazel* of Apocalypse of Abraham 22:8 are the multitude under the corruption that Enoch lays at the fallen Watcher''s feet.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 8, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel named in Apocalypse of Abraham 22:8 is the same fallen one Enoch sees bound and cast into the darkness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 8, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* That Abraham''s people are set apart out from *the peoples with Azazel* (Apocalypse of Abraham 22:8) is the deliverance from the one whose end is the fire of the great judgement.'),
  -- thread: apocalypse-of-abraham-22-called-my-people
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The seed *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) is the everlasting covenant seed promised to Abraham.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* To be *called My People* in Apocalypse of Abraham 22:9 is to be the special, chosen people of the Torah.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'hosea', 2, 23, 'free', E'Hosea 2:23 — *And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* The naming *called My People* in Apocalypse of Abraham 22:9 is the very word the Eternal speaks over His seed through Hosea.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'romans', 9, 25, 'free', E'Romans 9:25 — *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved.* That the seed is *ordained... to be called My People* (Apocalypse of Abraham 22:9) is the calling Paul confesses over the vessels of mercy afore prepared unto glory.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', '1-peter', 2, 9, 'free', E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The people *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) are the chosen generation called out of darkness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-the-word-planned-beforehand',
       E'Through My Word — all planned before it was made',
       E'Abraham, beholding the picture of the creatures, asks its meaning, and the Eternal answers: *This is my will with regard to those who exist in the divine world-counsel, and it seemed well-pleasing before my sight, and then afterwards I gave commandment to them through my Word.* (Apocalypse of Abraham 22:3) — *And it came to pass, whatever I had determined to be, was already planned beforehand in this picture, and it stood before me ere it was created, as thou hast seen.* (Apocalypse of Abraham 22:4). It ain''t new: the world is made by the Word, and nothing exists that He did not first determine. *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *All things were made by him; and without him was not any thing made that was made.* (John 1:3). The Son is *the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15), *For by him were all things created* (Colossians 1:16); and by Him the worlds were framed: *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds* (Hebrews 1:2). And the elect were *planned beforehand* — chosen *before the foundation of the world* (Ephesians 1:4). The picture is the Word''s eternal counsel; the same Word stood before Abraham as it stands before us.',
       sv.verse_id, ev.verse_id, 'extras', 67525
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-two-peoples-left-and-right',
       E'The two peoples — the left and the right hand',
       E'Abraham asks who the people in the picture are *on this side and on that*, and the Eternal divides them: *These which are on the left side are the multitude of the peoples which have formerly been in existence, and which are after thee destined, some for judgement and restoration, and others for vengeance and destruction at the end of the world.* (Apocalypse of Abraham 22:7) — *But these which are on the right side of the picture — they are the people set apart for me of the peoples with Azazel.* (Apocalypse of Abraham 22:8). It ain''t new: two manner of people were separated from the beginning. *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). The Torah sets the two before every soul: *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). And the Son of Adam divides them at the end as a shepherd divides his flock: *And he shall set the sheep on his right hand, but the goats on the left.* (Matthew 25:33) — the strait and the wide gate, *which leadeth unto life, and few there be that find it* (Matthew 7:14). The right hand is the set-apart seed; election precedes confession, and no church replaces the people set apart for Him.',
       sv.verse_id, ev.verse_id, 'extras', 67528
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-azazel-bound',
       E'The peoples with Azazel — the fallen one bound',
       E'The right-hand people are gathered *of the peoples with Azazel* (Apocalypse of Abraham 22:8) — set apart out from under the dominion of the fallen Watcher. It ain''t new: the live witness of the Watchers names Azazel and his end. To him the whole earth''s corruption is laid: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* (1 Enoch 10:8) — and his sentence is sealed: *Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4), *And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:6). Azazel is the system, the adversary who corrupts; the elect are drawn out from among the peoples he holds. The dismantling of his works, not the cursing of the seed, is the deliverance.',
       sv.verse_id, ev.verse_id, 'extras', 67531
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-called-my-people',
       E'Ordained to be born of thee and called My People',
       E'Of the right-hand seed the Eternal says: *These are they whom I have ordained to be born of thee and to be called My People.* (Apocalypse of Abraham 22:9). It ain''t new: the covenant with Abraham is to be Elohim to him and to his seed forever, the seed called by His Name. *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* (Genesis 17:7). They are the chosen, set-apart people: *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). And the Most High names them His own even from among them which were not a people: *And I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23) — *I will call them my people, which were not my people; and her beloved, which was not beloved.* (Romans 9:25). The seed ordained before the picture was made is the *chosen generation, a royal priesthood, an holy nation* (1 Peter 2:9). My People — the seed kept, the covenant standing.',
       sv.verse_id, ev.verse_id, 'extras', 67534
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-22-the-word-planned-beforehand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The commandment given to creation *through my Word* in Apocalypse of Abraham 22:3 is the same Word who was with Elohim in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* That the creatures were commanded into being *through my Word* (Apocalypse of Abraham 22:3) is John''s confession that all things were made by Him.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Word through whom all is commanded in Apocalypse of Abraham 22:3 is He by whom all things were created and for whom they exist.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* What was *planned beforehand... ere it was created* (Apocalypse of Abraham 22:4) is the work of the Son by whom He made the worlds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* The picture that *stood before me ere it was created* (Apocalypse of Abraham 22:4) holds the elect chosen before the foundation of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-22-two-peoples-left-and-right
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side and right side of Apocalypse of Abraham 22:7-8 are the two manner of people separated from the bowels of Abraham''s own seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The destiny of judgement or restoration in Apocalypse of Abraham 22:7 is the same life-and-death set before the people in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The left for vengeance and the right set apart in Apocalypse of Abraham 22:7-8 is the very separation of the sheep and the goats at the end of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two destinies of the multitude in Apocalypse of Abraham 22:7 are the broad way to destruction and the strait way to life.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-22-azazel-bound
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The *peoples with Azazel* of Apocalypse of Abraham 22:8 are the multitude under the corruption that Enoch lays at the fallen Watcher''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-azazel-bound'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel named in Apocalypse of Abraham 22:8 is the same fallen one Enoch sees bound and cast into the darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-azazel-bound'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* That Abraham''s people are set apart out from *the peoples with Azazel* (Apocalypse of Abraham 22:8) is the deliverance from the one whose end is the fire of the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-azazel-bound'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-22-called-my-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The seed *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) is the everlasting covenant seed promised to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* To be *called My People* in Apocalypse of Abraham 22:9 is to be the special, chosen people of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 2:23 — *And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* The naming *called My People* in Apocalypse of Abraham 22:9 is the very word the Eternal speaks over His seed through Hosea.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:25 — *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved.* That the seed is *ordained... to be called My People* (Apocalypse of Abraham 22:9) is the calling Paul confesses over the vessels of mercy afore prepared unto glory.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The people *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) are the chosen generation called out of darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

