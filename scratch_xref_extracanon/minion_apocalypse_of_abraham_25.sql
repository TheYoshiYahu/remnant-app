-- ----- fragment: minion_apocalypseofabraham_25.sql (session253 apocalypse-of-abraham 25) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa25 (view _session253_aoa25_lookup). Sort band base 67600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-25-idol-of-jealousy
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 1, 'canon', 'ezekiel', 8, 3, 'free', E'Ezekiel 8:3 — *And he put forth the form of an hand, and took me by a lock of mine head; and the spirit lifted me up between the earth and the heaven, and brought me in the visions of Elohim (God) to Jerusalem, to the door of the inner gate that looketh toward the north; where was the seat of the image of jealousy, which provoketh to jealousy.* Ezekiel, like Abraham, is carried up in vision to behold the very idol of jealousy set within the sanctuary.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'ezekiel', 8, 6, 'free', E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The idol is the anger whereby the people, proceeding from Abraham''s own generation, drive the glory far off — the statue that is His anger (25:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 1, 'canon', 'exodus', 20, 4, 'free', E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* The bronze statue of woodwork before which a man bows is the broken second word, the graven image forbidden at Sinai.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'exodus', 20, 5, 'free', E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very name ''idol of jealousy'' names the jealous Elohim provoked by it — the statue is His anger against a people who bow where they should not.'),
  -- thread: apocalypse-of-abraham-25-temple-beneath-the-throne
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 3, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Temple''s beauty ''like the glory that lieth beneath Thy throne'' is the earthly shadow of the heavenly glory that sits at the right hand on high.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 5, 'canon', 'exodus', 30, 8, 'free', E'Exodus 30:8 — *And when Aaron lighteth the lamps at even, he shall burn incense upon it, a perpetual incense before Yahuah (LORD) throughout your generations.* The Temple in which ''dwelleth every single prayer of man'' is the altar of perpetual incense, prayer rising before the Name throughout the generations.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 5, 'canon', 'ezekiel', 8, 16, 'free', E'Ezekiel 8:16 — *And he brought me into the inner court of the LORD''S house, and, behold, at the door of the temple of Yahuah (LORD), between the porch and the altar, were about five and twenty men, with their backs toward the temple of Yahuah (LORD), and their faces toward the east; and they worshipped the sun toward the east.* The priesthood ordained for the glorious Name is the very thing inverted when men turn their backs on the sanctuary to worship the sun.'),
  -- thread: apocalypse-of-abraham-25-desolation-foreseen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'daniel', 9, 27, 'free', E'Daniel 9:27 — *And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate.* The statue that is His anger against Abraham''s seed is the abomination that brings the sanctuary to desolation.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The idol of jealousy Abraham beheld in the holy place is the abomination of desolation Yahusha warns His disciples to recognize.'),
  -- thread: apocalypse-of-abraham-25-blood-witness-final-judgement
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 1, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The boy slain before the idol is innocent blood that, like Abel''s from the beginning, cries up to heaven as a witness for judgement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 7, 'canon', 'matthew', 24, 13, 'free', E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The murderous sacrifices witness to the final judgement; the elect who endure unto that end are saved through it.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 7, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* As the doom of Azazel the corrupter was decreed from of old, so the inciter of murderous sacrifices is held over for the final judgement appointed even at the beginning of creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-idol-of-jealousy',
       E'The idol of jealousy in the holy place',
       E'Abraham, borne up to the throne, is shown what his own seed will do: *I saw there the likeness of the idol of jealousy, having the likeness of woodwork such as my father was wont to make, and its statue was of glittering bronze; and before it a man, and he worshipped it; and in front of him an altar, and upon it a boy slain in the presence of the idol.* (Apocalypse of Abraham 25:1). It ain''t new — Ezekiel sees the very same thing set in the LORD''s house: *And he put forth the form of an hand, and took me by a lock of mine head; and the spirit lifted me up between the earth and the heaven, and brought me in the visions of Elohim (God) to Jerusalem, to the door of the inner gate that looketh toward the north; where was the seat of the image of jealousy, which provoketh to jealousy.* (Ezekiel 8:3), the great abominations *that I should go far off from my sanctuary* (Ezekiel 8:6). And the idol of jealousy is jealousy against the second word given at Sinai: *Thou shalt not make unto thee any graven image* (Exodus 20:4), *for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:5). The statue is the anger of a covenant people who break the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67600
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-temple-beneath-the-throne',
       E'The Temple, beautiful as the glory beneath the throne',
       E'Abraham marvels at the sanctuary''s beauty: *Or what is the Temple which I see that is beautiful in art, and its beauty being like the glory that lieth beneath Thy throne?* (Apocalypse of Abraham 25:3), and is told it is the priesthood of the glorious Name, *in which dwelleth every single prayer of man, and the rise of kings and prophets, and whatever sacrifice I ordain to be offered to me among my people who are to come out of thy generation* (Apocalypse of Abraham 25:5). It ain''t new — the earthly house is patterned on the heavenly: the express image of His glory upholds all things, *the brightness of his glory, and the express image of his person* (Hebrews 1:3). At that altar prayer ascends continually as ordained incense, *a perpetual incense before Yahuah (LORD) throughout your generations* (Exodus 30:8). And its desecration is the same Ezekiel saw — backs to the temple, faces to the sun (Ezekiel 8:16) — the inversion of the priesthood of the Name.',
       sv.verse_id, ev.verse_id, 'extras', 67603
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-desolation-foreseen',
       E'The people''s anger and the desolation foreseen',
       E'The statue is named as judgement upon the seed: *But the statue which thou sawest is mine anger, wherewith the people anger me who are to proceed for me from thee* (Apocalypse of Abraham 25:6). This is the abomination that makes desolate, shown to Abraham long before it stood. It ain''t new — Daniel sets the same idol in the same place: *and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate* (Daniel 9:27); and Yahusha reads Daniel forward to the last day: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). The idol of jealousy, the desolation, the abomination — one witness across Abraham, Ezekiel, Daniel, and the Messiah''s own mouth.',
       sv.verse_id, ev.verse_id, 'extras', 67606
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-blood-witness-final-judgement',
       E'The slain witness and the final judgement at the beginning',
       E'The man slaughtering is interpreted: *But the man whom thou sawest slaughtering — that is he who inciteth murderous sacrifices, which are a witness to me of the final judgement, even at the beginning of creation* (Apocalypse of Abraham 25:7) — the boy slain before the idol (Apocalypse of Abraham 25:1) is innocent blood that cries to heaven. It ain''t new — from the beginning the first slain brother''s blood is the standing witness: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The endurance unto the end is the answer to it: *But he that shall endure unto the end, the same shall be saved* (Matthew 24:13). And the appointed day for the inciter of corruption is already set, as it was set over Azazel — *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6) — the final judgement decreed even at the beginning of creation.',
       sv.verse_id, ev.verse_id, 'extras', 67609
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-25-idol-of-jealousy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 8:3 — *And he put forth the form of an hand, and took me by a lock of mine head; and the spirit lifted me up between the earth and the heaven, and brought me in the visions of Elohim (God) to Jerusalem, to the door of the inner gate that looketh toward the north; where was the seat of the image of jealousy, which provoketh to jealousy.* Ezekiel, like Abraham, is carried up in vision to behold the very idol of jealousy set within the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The idol is the anger whereby the people, proceeding from Abraham''s own generation, drive the glory far off — the statue that is His anger (25:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* The bronze statue of woodwork before which a man bows is the broken second word, the graven image forbidden at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very name ''idol of jealousy'' names the jealous Elohim provoked by it — the statue is His anger against a people who bow where they should not.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-25-temple-beneath-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Temple''s beauty ''like the glory that lieth beneath Thy throne'' is the earthly shadow of the heavenly glory that sits at the right hand on high.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-temple-beneath-the-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 30:8 — *And when Aaron lighteth the lamps at even, he shall burn incense upon it, a perpetual incense before Yahuah (LORD) throughout your generations.* The Temple in which ''dwelleth every single prayer of man'' is the altar of perpetual incense, prayer rising before the Name throughout the generations.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-temple-beneath-the-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 8:16 — *And he brought me into the inner court of the LORD''S house, and, behold, at the door of the temple of Yahuah (LORD), between the porch and the altar, were about five and twenty men, with their backs toward the temple of Yahuah (LORD), and their faces toward the east; and they worshipped the sun toward the east.* The priesthood ordained for the glorious Name is the very thing inverted when men turn their backs on the sanctuary to worship the sun.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-temple-beneath-the-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-25-desolation-foreseen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:27 — *And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate.* The statue that is His anger against Abraham''s seed is the abomination that brings the sanctuary to desolation.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-desolation-foreseen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The idol of jealousy Abraham beheld in the holy place is the abomination of desolation Yahusha warns His disciples to recognize.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-desolation-foreseen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-25-blood-witness-final-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The boy slain before the idol is innocent blood that, like Abel''s from the beginning, cries up to heaven as a witness for judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-blood-witness-final-judgement'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The murderous sacrifices witness to the final judgement; the elect who endure unto that end are saved through it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-blood-witness-final-judgement'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* As the doom of Azazel the corrupter was decreed from of old, so the inciter of murderous sacrifices is held over for the final judgement appointed even at the beginning of creation.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-blood-witness-final-judgement'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

