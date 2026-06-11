-- ----- fragment: minion_1enoch_41.sql (session250 1-enoch 41) -----
-- Source anchor: enoch/1-enoch ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en41 (view _session250_en41_lookup). Sort band base 51000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-41-deeds-weighed-balance
  ('enoch', '1-enoch', 41, 1, 'canon', 'daniel', 5, 27, 'free', E'Daniel 5:27 — *TEKEL; Thou art weighed in the balances, and art found wanting.* The very scale Enoch sees over all men is the one the hand wrote against Belshazzar, weighing a king''s deeds and finding them short.'),
  ('enoch', '1-enoch', 41, 1, 'canon', 'proverbs', 16, 11, 'free', E'Proverbs 16:11 — *A just weight and balance are the LORD''S: all the weights of the bag are his work.* The balance in which men''s actions are weighed is Yahuah''s own, never a scale that fraud can tilt.'),
  ('enoch', '1-enoch', 41, 1, 'enoch', '1-enoch', 60, 11, 'extras', E'1 Enoch 60:11 — *And the other angel who went with me and showed me what was hidden told me what is first and last in the heaven in the height, and beneath the earth in the depth, and at the ends of the heaven, and on the foundation of the heaven, and in the chamber of the winds, and how the spirits are divided, and how the weighing in the balance is done, and how the fountains of the spirits are reckoned, each according to the power of the spirit, the power of the lights of the moon, and according to the power that is in righteousness.* Enoch''s own Parables expand the balance of 41:1, showing the weighing reckoned spirit by spirit beside the chambers of the winds.'),
  -- thread: 1-enoch-41-chambers-winds-lightning
  ('enoch', '1-enoch', 41, 4, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The closed chambers of hail Enoch is shown are the sealed treasuries Yahuah challenges Job to find.'),
  ('enoch', '1-enoch', 41, 3, 'canon', 'psalms', 135, 7, 'free', E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The secrets of the lightning and the chambers of the winds Enoch sees are the very treasuries the Psalm says Yahuah draws the wind from.'),
  ('enoch', '1-enoch', 41, 4, 'apocrypha', 'ecclesiasticus', 43, 14, 'extras', E'Ecclesiasticus 43:14 — *Through this the treasures are opened: and clouds fly forth as fowls.* Sirach names the same opened storehouses of cloud and storm that Enoch is led through in the closed chambers of the winds.'),
  -- thread: 1-enoch-41-luminary-order-division-light
  ('enoch', '1-enoch', 41, 7, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* Enoch''s division of light from darkness and his ordered sun and moon are the fourth-day lights set for signs and seasons — the moedim.'),
  ('enoch', '1-enoch', 41, 6, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon that accomplishes her monthly revolution and sets by oath in Enoch is the moon Yahuah appointed for the seasons.'),
  ('enoch', '1-enoch', 41, 5, 'canon', 'jeremiah', 31, 35, 'free', E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The sun and moon that keep faith and never leave their orbit in Enoch are the fixed ordinances Yahuah swears by as surety for Israel.'),
  ('enoch', '1-enoch', 41, 7, 'jubilees', 'jubilees', 2, 8, 'extras', E'Jubilees 2:8 — *And on the fourth day He created the sun and the moon and the stars, and set them in the firmament of the heaven, to give light upon all the earth, and to rule over the day and the night, and divide the light from the darkness.* Jubilees sets the same dividing of light from darkness on the fourth day, the lights that govern Enoch''s faithful orbit and the appointed feasts.'),
  -- thread: 1-enoch-41-no-angel-intercedes-He-judges
  ('enoch', '1-enoch', 41, 8, 'canon', '1-timothy', 2, 5, 'free', E'1 Timothy 2:5 — *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus);* No angel can intercede, says Enoch; the one mediator who can is not an angel but the Formed Son come in flesh.'),
  ('enoch', '1-enoch', 41, 8, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The intercession Enoch withholds from every angel is the living intercession the Son alone makes for those who come to the Father by Him.'),
  ('enoch', '1-enoch', 41, 9, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* He who judges all according to their deeds in Enoch is the One whose opened books judge the dead by their works.'),
  ('enoch', '1-enoch', 41, 10, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The sinners cast into the furnace of fire at the close of Enoch 41 is the very sentence Yahusha pronounces on the workers of iniquity at the end of the age.'),
  ('enoch', '1-enoch', 41, 9, 'enoch', '1-enoch', 47, 3, 'extras', E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* Enoch''s own Parables show the Head of Days opening the books of the living, the throne-scene behind the judgement-according-to-deeds of 41:9.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-41-deeds-weighed-balance',
       E'The actions of men weighed in the balance',
       E'Enoch is shown the most sober secret of heaven: *And after that I saw all the secrets of the heavens, and how the kingdom is divided, and how the actions of men are weighed in the balance.* (1 Enoch 41:1). This is no novel image — the same scale hangs over Belshazzar''s feast: *TEKEL; Thou art weighed in the balances, and art found wanting.* (Daniel 5:27), the hand-writing that reckons a king''s deeds against the standard he had spurned. The balance itself belongs to the Creator, not to men who would rig it: *A just weight and balance are the LORD''S: all the weights of the bag are his work.* (Proverbs 16:11). And the weighing is no mere metaphor for the conscience — within Enoch''s own Parables the angel shows him the mechanism plainly: *...and how the weighing in the balance is done, and how the fountains of the spirits are reckoned, each according to the power of the spirit...* (1 Enoch 60:11). The judgement falls on deeds because the covenant was given to be kept; the balance vindicates the righteous who walked in the way and exposes the sinner who deny the name of Yahuah of Spirits.',
       sv.verse_id, ev.verse_id, 'extras', 51000
  FROM _session250_en41_lookup sv, _session250_en41_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=41 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-41-chambers-winds-lightning',
       E'The closed chambers of the winds, lightning, and thunder',
       E'Enoch is led through the storehouses of the weather: *And there mine eyes saw the secrets of the lightning and of the thunder, and the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew...* (1 Enoch 41:3), and then *And there I saw closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds...* (1 Enoch 41:4). This is the same tour Yahuah gives Job out of the whirlwind: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* (Job 38:22) — sealed treasuries opened only at the Creator''s word. The Psalmist names the same chambers: *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* (Psalm 135:7). The witness runs on into the apocrypha, where Sirach sings the same storehouses: *Through this the treasures are opened: and clouds fly forth as fowls.* (Ecclesiasticus 43:14). It ain''t new — Enoch''s closed chambers are the canon''s own treasuries of hail, wind, and lightning, all held under one ordering hand.',
       sv.verse_id, ev.verse_id, 'extras', 51003
  FROM _session250_en41_lookup sv, _session250_en41_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=41 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-41-luminary-order-division-light',
       E'The chambers of sun and moon: the kept orbit and the divided light',
       E'Enoch sees the luminaries hold their appointed course: *And I saw the chambers of the sun and moon, whence they proceed and whither they come again... and how they do not leave their orbit, and they add nothing to their orbit and they do not take away from it, and they keep faith one with another: and in accordance with an oath they set and they rise.* (1 Enoch 41:5), the moon keeping *the monthly revolution by day and by night* (1 Enoch 41:6), Yahuah *who made a division between the light and the darkness* (1 Enoch 41:7). This is Genesis 1 read back to us: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14) — lights set for the moedim, the appointed times, the moon *appointed... for seasons* (Psalm 104:19). Their fixed, faithful course is the covenant guarantee: *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night... Yahuah Tseva''ot (LORD of hosts) is his name:* (Jeremiah 31:35), so sure that if those ordinances fail, then so would Israel. Jubilees ties the same fourth-day lights straight to the feast-calendar: *And on the fourth day He created the sun and the moon and the stars... to rule over the day and the night, and divide the light from the darkness.* (Jubilees 2:8). The luminaries keep faith by oath; the feasts are appointed by the lights — Torah''s order, not a new one.',
       sv.verse_id, ev.verse_id, 'extras', 51006
  FROM _session250_en41_lookup sv, _session250_en41_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=41 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-41-no-angel-intercedes-He-judges',
       E'No angel can intercede: He Himself is the judge of all',
       E'At the heart of the chapter stands a startling word: *And no angel here has power to intercede for man, nor yet is any angel able to hear the prayer of man.* (1 Enoch 41:8), *But He Himself is the judge of all, and He judges all according to their deeds.* (1 Enoch 41:9). No angel mediates — and the canon agrees, naming the one Mediator who is not an angel: *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus);* (1 Timothy 2:5). The intercession Enoch denies to angels belongs to the Son alone, who *ever liveth to make intercession for them* (Hebrews 7:25). And the judgement according to deeds is the scene of the opened books: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened... and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12) — the same books Enoch''s own Parables saw the Head of Days open (1 Enoch 47:3). The chapter then closes with the sentence Yahusha Himself will speak: the sinners *cast into the furnace of fire* (1 Enoch 41:10) — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* (Matthew 13:42). The judge of all is Yahuah of Spirits; the one mediator who carries man''s prayer is His Formed Son, not any angel.',
       sv.verse_id, ev.verse_id, 'extras', 51009
  FROM _session250_en41_lookup sv, _session250_en41_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=41 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-41-deeds-weighed-balance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 5:27 — *TEKEL; Thou art weighed in the balances, and art found wanting.* The very scale Enoch sees over all men is the one the hand wrote against Belshazzar, weighing a king''s deeds and finding them short.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-deeds-weighed-balance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:11 — *A just weight and balance are the LORD''S: all the weights of the bag are his work.* The balance in which men''s actions are weighed is Yahuah''s own, never a scale that fraud can tilt.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-deeds-weighed-balance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 60:11 — *And the other angel who went with me and showed me what was hidden told me what is first and last in the heaven in the height, and beneath the earth in the depth, and at the ends of the heaven, and on the foundation of the heaven, and in the chamber of the winds, and how the spirits are divided, and how the weighing in the balance is done, and how the fountains of the spirits are reckoned, each according to the power of the spirit, the power of the lights of the moon, and according to the power that is in righteousness.* Enoch''s own Parables expand the balance of 41:1, showing the weighing reckoned spirit by spirit beside the chambers of the winds.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-deeds-weighed-balance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-41-chambers-winds-lightning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The closed chambers of hail Enoch is shown are the sealed treasuries Yahuah challenges Job to find.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-chambers-winds-lightning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The secrets of the lightning and the chambers of the winds Enoch sees are the very treasuries the Psalm says Yahuah draws the wind from.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-chambers-winds-lightning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 43:14 — *Through this the treasures are opened: and clouds fly forth as fowls.* Sirach names the same opened storehouses of cloud and storm that Enoch is led through in the closed chambers of the winds.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-chambers-winds-lightning'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-41-luminary-order-division-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* Enoch''s division of light from darkness and his ordered sun and moon are the fourth-day lights set for signs and seasons — the moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-luminary-order-division-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon that accomplishes her monthly revolution and sets by oath in Enoch is the moon Yahuah appointed for the seasons.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-luminary-order-division-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The sun and moon that keep faith and never leave their orbit in Enoch are the fixed ordinances Yahuah swears by as surety for Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-luminary-order-division-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:8 — *And on the fourth day He created the sun and the moon and the stars, and set them in the firmament of the heaven, to give light upon all the earth, and to rule over the day and the night, and divide the light from the darkness.* Jubilees sets the same dividing of light from darkness on the fourth day, the lights that govern Enoch''s faithful orbit and the appointed feasts.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-luminary-order-division-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-41-no-angel-intercedes-He-judges
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Timothy 2:5 — *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus);* No angel can intercede, says Enoch; the one mediator who can is not an angel but the Formed Son come in flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-no-angel-intercedes-He-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The intercession Enoch withholds from every angel is the living intercession the Son alone makes for those who come to the Father by Him.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-no-angel-intercedes-He-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* He who judges all according to their deeds in Enoch is the One whose opened books judge the dead by their works.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-no-angel-intercedes-He-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The sinners cast into the furnace of fire at the close of Enoch 41 is the very sentence Yahusha pronounces on the workers of iniquity at the end of the age.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-no-angel-intercedes-He-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* Enoch''s own Parables show the Head of Days opening the books of the living, the throne-scene behind the judgement-according-to-deeds of 41:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en41_lookup sv, _session250_en41_lookup tv
 WHERE t.slug='1-enoch-41-no-angel-intercedes-He-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=41 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

