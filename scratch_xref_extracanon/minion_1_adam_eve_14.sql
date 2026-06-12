-- ----- fragment: minion_1adameve_14.sql (session253 1-adam-eve 14) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae14 (view _session253_1ae14_lookup). Sort band base 64325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-14-light-no-darkness
  ('adam-eve-conflict', '1-adam-eve', 14, 2, 'canon', 'revelation', 21, 23, 'free', E'Revelation 21:23 — *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof.* The house of light with no darkness that Yahuah promises Adam in 1 Adam and Eve 14:2 is the City whose lamp is the Lamb.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 2, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* Adam''s plea for a place "where there is no darkness" (14:1) is answered in the kingdom of heaven where there shall be no night.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 1, 'canon', 'john', 12, 46, 'free', E'John 12:46 — *I am come a light into the world, that whosoever believeth on me should not abide in darkness.* The very Word who comforts Adam in his gloom (14:1) is the Light come into the world so none need abide in darkness.'),
  -- thread: 1-adam-eve-14-misery-saves-not-only-yahuah
  ('adam-eve-conflict', '1-adam-eve', 14, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s hand that no misery can loose (14:3) is the serpent whose head only the woman''s seed will bruise.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 4, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Yahuah''s "But I will" save you (14:4) is the manifested Son destroying the very works of Satan whose hand held Adam.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 3, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance from Satan''s hand promised to Adam (14:3) is the same crushing of Satan promised under the feet of the saints.'),
  -- thread: 1-adam-eve-14-flesh-of-your-descendants
  ('adam-eve-conflict', '1-adam-eve', 14, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word''s pledge to "become flesh of your descendants" (14:4) is the Word made flesh who dwelt among us.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 4, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The descent from heaven into the flesh of Adam''s line (14:4) is the Son sent forth, made of a woman, in the fulness of time.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 4, 'canon', 'hebrews', 2, 14, 'free', E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* Taking on "the infirmity from which you suffer" and the darkness of the grave (14:4) is the Son partaking of flesh and blood to destroy the devil through death.'),
  -- thread: 1-adam-eve-14-reckoned-a-son-of-adam
  ('adam-eve-conflict', '1-adam-eve', 14, 5, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One "who am without years" speaking to Adam (14:5) is the Word who was in the beginning with Elohim and was Elohim.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 5, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Years-less One subjecting Himself to times and days to save Adam (14:5) was foreordained before the foundation of the world, manifest in the last times.'),
  ('adam-eve-conflict', '1-adam-eve', 14, 5, 'enoch', '1-enoch', 48, 6, 'extras', E'1 Enoch 48:6 — *And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* The Son who is "without years" yet reckoned a son of Adam (14:5) is the One Enoch saw chosen and hidden before the creation of the world.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-14-light-no-darkness',
       E'Take me to the house of light — the garden restored, the kingdom of heaven',
       E'Adam, sitting in the gloom outside Eden, cries: *"O Yahuah (Lord), take You my soul, and let me not see this gloom any more; or remove me to some place where there is no darkness."* (1 Adam and Eve 14:1) Yahuah does not take the soul but pledges the day of return: *"this darkness will pass from you, every day I have determined for you, until the fulfillment of My covenant; when I will save you and bring you back again into the garden, into the house of light you long for, in which there is no darkness--I will bring you to it--in the kingdom of heaven."* (1 Adam and Eve 14:2) It ain''t new: the house of light Adam longed for on the very first day outside the garden is the same City the Spirit shows at the end. *"And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof."* (Revelation 21:23) *"And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever."* (Revelation 22:5) And the One who promises it is Himself that Light come to seek Adam in the dark: *"I am come a light into the world, that whosoever believeth on me should not abide in darkness."* (John 12:46)',
       sv.verse_id, ev.verse_id, 'extras', 64325
  FROM _session253_1ae14_lookup sv, _session253_1ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-14-misery-saves-not-only-yahuah',
       E'Your misery will not free you from Satan''s hand — but I will',
       E'Yahuah will not let Adam''s self-affliction be mistaken for atonement: *"All this misery that you have been made to take on yourself because of your transgression, will not free you from the hand of Satan, and will not save you. But I will."* (1 Adam and Eve 14:3-4) The seed-war declared in the garden runs through every page of Adam''s exile: the serpent strikes, but only the seed of the woman crushes him. *"And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel."* (Genesis 3:15) Adam''s penance cannot break Satan''s grip; the Son of Elohim alone undoes the devil''s work. *"He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil."* (1 John 3:8) And the bruising of the serpent''s head is the believer''s promised victory. *"And the Elohim (God) of peace shall bruise Satan under your feet shortly."* (Romans 16:20)',
       sv.verse_id, ev.verse_id, 'extras', 64328
  FROM _session253_1ae14_lookup sv, _session253_1ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-14-flesh-of-your-descendants',
       E'I shall become flesh of your descendants — the cave''s darkness over the grave',
       E'Here, on the first day of Adam''s exile, the Word foretells His own incarnation and burial: *"When I shall come down from heaven, and shall become flesh of your descendants, and take on Myself the infirmity from which you suffer, then the darkness that covered you in this cave shall cover Me in the grave, when I am in the flesh of your descendants."* (1 Adam and Eve 14:4) It ain''t new: the gospel of the Word made flesh is spoken to Adam himself. *"And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth."* (John 1:14) He comes in the very flesh of Adam''s line, born of a woman as Eden promised. *"But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,"* (Galatians 4:4) He takes on the infirmity of the seed to share its flesh and blood and so destroy death''s master. *"Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;"* (Hebrews 2:14) The darkness of Adam''s cave prefigures the darkness of the tomb He would enter in that flesh.',
       sv.verse_id, ev.verse_id, 'extras', 64331
  FROM _session253_1ae14_lookup sv, _session253_1ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-14-reckoned-a-son-of-adam',
       E'The Years-less subject to the reckoning of years — reckoned a son of Adam',
       E'The eternal Word stoops into time for Adam''s sake: *"And I, who am without years, shall be subject to the reckoning of years, of times, of months, and of days, and I shall be reckoned as one of the sons of Adam, in order to save you."* (1 Adam and Eve 14:5) This is the Logos who was before all things, now numbering Himself with the seed of Adam. *"In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)."* (John 1:1) *"All things were made by him; and without him was not any thing made that was made."* (John 1:3) He who is without years was nonetheless foreordained for this from before time. *"Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,"* (1 Peter 1:20) It ain''t new among the restored books either: Enoch saw the same Son named and hidden before the world began. *"And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore."* (1 Enoch 48:6)',
       sv.verse_id, ev.verse_id, 'extras', 64334
  FROM _session253_1ae14_lookup sv, _session253_1ae14_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-14-light-no-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:23 — *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof.* The house of light with no darkness that Yahuah promises Adam in 1 Adam and Eve 14:2 is the City whose lamp is the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-light-no-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* Adam''s plea for a place "where there is no darkness" (14:1) is answered in the kingdom of heaven where there shall be no night.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-light-no-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 12:46 — *I am come a light into the world, that whosoever believeth on me should not abide in darkness.* The very Word who comforts Adam in his gloom (14:1) is the Light come into the world so none need abide in darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-light-no-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-14-misery-saves-not-only-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s hand that no misery can loose (14:3) is the serpent whose head only the woman''s seed will bruise.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-misery-saves-not-only-yahuah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Yahuah''s "But I will" save you (14:4) is the manifested Son destroying the very works of Satan whose hand held Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-misery-saves-not-only-yahuah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance from Satan''s hand promised to Adam (14:3) is the same crushing of Satan promised under the feet of the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-misery-saves-not-only-yahuah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-14-flesh-of-your-descendants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word''s pledge to "become flesh of your descendants" (14:4) is the Word made flesh who dwelt among us.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-flesh-of-your-descendants'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The descent from heaven into the flesh of Adam''s line (14:4) is the Son sent forth, made of a woman, in the fulness of time.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-flesh-of-your-descendants'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* Taking on "the infirmity from which you suffer" and the darkness of the grave (14:4) is the Son partaking of flesh and blood to destroy the devil through death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-flesh-of-your-descendants'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-14-reckoned-a-son-of-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One "who am without years" speaking to Adam (14:5) is the Word who was in the beginning with Elohim and was Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-reckoned-a-son-of-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Years-less One subjecting Himself to times and days to save Adam (14:5) was foreordained before the foundation of the world, manifest in the last times.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-reckoned-a-son-of-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 48:6 — *And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* The Son who is "without years" yet reckoned a son of Adam (14:5) is the One Enoch saw chosen and hidden before the creation of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae14_lookup sv, _session253_1ae14_lookup tv
 WHERE t.slug='1-adam-eve-14-reckoned-a-son-of-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

