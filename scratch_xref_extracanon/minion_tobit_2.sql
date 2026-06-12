-- ----- fragment: minion_tobit_02.sql (session253 tobit 2) -----
-- Source anchor: apocrypha/tobit ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob2 (view _session253_tob2_lookup). Sort band base 59625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-2-bury-the-dead
  ('apocrypha', 'tobit', 2, 7, 'canon', 'deuteronomy', 21, 23, 'free', E'Deuteronomy 21:23 — *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* Tobit buries before sunset and the same night precisely to keep this command that the land not be defiled by an unburied body.'),
  ('apocrypha', 'tobit', 2, 7, 'canon', 'genesis', 23, 19, 'free', E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* As Abraham labored to bury his own dead in dignity, so Tobit digs a grave for a brother of his nation at his own risk.'),
  ('apocrypha', 'tobit', 2, 8, 'canon', 'matthew', 8, 22, 'free', E'Matthew 8:22 — *But Yahusha (Jesus) said unto him, Follow me; and let the dead bury their dead.* The neighbours mock Tobit''s burying as folly, yet the kindness to the dead he renders is the very faithfulness that following requires.'),
  ('apocrypha', 'tobit', 2, 7, 'apocrypha', 'tobit', 12, 13, 'extras', E'Tobit 12:13 — *And when you did not delay to rise up, and leave your dinner, to go and cover the dead, your good deed was not hid from me: but I was with you.* Raphael reveals that the angel of Yahuah stood beside Tobit in this very burial of chapter 2, his good deed not hid.'),
  -- thread: tobit-2-feasts-turned-to-mourning
  ('apocrypha', 'tobit', 2, 6, 'canon', 'amos', 8, 10, 'free', E'Amos 8:10 — *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* Tobit quotes this prophecy by name, watching his feast of Pentecost turn to mourning over the slain brother in fulfilment of Amos.'),
  ('apocrypha', 'tobit', 2, 1, 'canon', 'deuteronomy', 16, 10, 'free', E'Deuteronomy 16:10 — *And thou shalt keep the feast of weeks unto Yahuah Elohayka (the LORD thy God) with a tribute of a freewill offering of thine hand, which thou shalt give unto Yahuah Elohayka (the LORD thy God), according as Yahuah Elohayka (the LORD thy God) hath blessed thee:* Tobit keeps this same feast of weeks even in the captivity of Nineveh, the appointed time held fast in exile.'),
  -- thread: tobit-2-righteous-struck-blind
  ('apocrypha', 'tobit', 2, 10, 'canon', 'job', 1, 1, 'free', E'Job 1:1 — *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* Tobit, like Job, is a God-fearing and upright man, so his sudden blindness raises the same question of why the righteous suffer.'),
  ('apocrypha', 'tobit', 2, 10, 'canon', 'job', 2, 7, 'free', E'Job 2:7 — *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* As Job''s body was smitten head to foot, so Tobit''s eyes are struck with whiteness — the just man afflicted in the flesh.'),
  -- thread: tobit-2-wifes-reproach
  ('apocrypha', 'tobit', 2, 14, 'canon', 'job', 2, 9, 'free', E'Job 2:9 — *Then said his wife unto him, Dost thou still retain thine integrity? curse Elohim (God), and die.* As Job''s wife reproached him in his suffering, so Anna reproaches Tobit, taunting the alms and righteous deeds that seem to have gained him nothing.'),
  ('apocrypha', 'tobit', 2, 14, 'canon', 'job', 2, 10, 'free', E'Job 2:10 — *But he said unto her, Thou speakest as one of the foolish women speaketh. What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips.* Tobit, abashed yet not cursing Yahuah, answers his wife''s reproach with the same steadfastness Job showed his.'),
  -- thread: tobit-2-alms-and-righteous-deeds
  ('apocrypha', 'tobit', 2, 14, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The alms his wife throws in his face are the very practice Tobit will charge upon his son as the way of righteousness.'),
  ('apocrypha', 'tobit', 2, 14, 'apocrypha', 'tobit', 4, 10, 'extras', E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Though Tobit sits afflicted in darkness, his alms are the treasure that, by the book''s own teaching, delivers from death.'),
  ('apocrypha', 'tobit', 2, 14, 'canon', 'matthew', 6, 4, 'free', E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* Tobit''s hidden alms and righteous deeds, mocked by his wife, are exactly the secret giving the Father sees and openly rewards.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-bury-the-dead',
       E'He Burieth The Dead Again — Kindness To The Slain',
       E'Tobit will not leave a brother''s body in the dust, though it costs him his dinner, his cleanness, and nearly his life: *Therefore I wept: and after the going down of the sun I went and made a grave, and buried him.* (Tobit 2:7) — *But my neighbours mocked me, and said, This man is not yet afraid to be put to death for this matter: who fled away; and yet, lo, he burieth the dead again.* (Tobit 2:8) This is no invention of late piety; it is Torah. The hanged man must not be left out overnight, lest the land be defiled: *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled* (Deuteronomy 21:23). The fathers bought ground at price to bury their own: *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre* (Genesis 23:19). And when one man would let burial delay his discipleship, the Master answered him: *But Yahusha (Jesus) said unto him, Follow me; and let the dead bury their dead.* (Matthew 8:22) — for Tobit''s burying was itself the following. Heaven was watching the whole time: the angel later confessed, *And when you did not delay to rise up, and leave your dinner, to go and cover the dead, your good deed was not hid from me: but I was with you.* (Tobit 12:13) It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59625
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-feasts-turned-to-mourning',
       E'Your Feasts Shall Be Turned Into Mourning — Amos Fulfilled',
       E'Tobit keeps the feast of weeks in exile — *in the feast of Pentecost, which is the holy feast of the seven weeks* (Tobit 2:1) — the very moed Torah commands: *And thou shalt keep the feast of weeks unto Yahuah Elohayka (the LORD thy God) with a tribute of a freewill offering of thine hand* (Deuteronomy 16:10). The Torah is kept in captivity, not abandoned. Yet the good dinner is broken by the news of the slain, and Tobit eats in heaviness, *Remembering that prophecy of Amos, as he said, Your feasts shall be turned into mourning, and all your mirth into lamentation.* (Tobit 2:6) He names the prophet by name — and there it stands: *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* (Amos 8:10) Exile is the prophecy come true; the feast-keeper feels the word of Amos in his own table.',
       sv.verse_id, ev.verse_id, 'extras', 59628
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-righteous-struck-blind',
       E'The Just Man Afflicted — Tobit And Job',
       E'The man who feared Yahuah and buried the dead is rewarded with calamity: *and the sparrows muted warm dung into my eyes, and a whiteness came in my eyes: and I went to the physicians, but they helped me not* (Tobit 2:10). Here is the riddle of Job set in a new key — the upright man stripped of sight as Job was stripped of all. For Job too was named perfect: *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* (Job 1:1) And the affliction fell upon his very body: *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* (Job 2:7) The blindness of Tobit, like the boils of Job, is the suffering of the just — not the wages of sin, but a trial within the hand of Yahuah, who will yet heal by His angel.',
       sv.verse_id, ev.verse_id, 'extras', 59631
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-wifes-reproach',
       E'Where Are Thy Righteous Deeds — The Wife''s Reproach',
       E'When the kid is brought home and Tobit fears it stolen, his wife turns on him in his blindness and poverty: *But she replied upon me, Where are your alms and your righteous deeds? behold, you and all your works are known.* (Tobit 2:14) The sting is Job''s exactly — the afflicted righteous man cut by the one nearest him: *Then said his wife unto him, Dost thou still retain thine integrity? curse Elohim (God), and die.* (Job 2:9) Yet where Job answers and holds fast, *But he said unto her, Thou speakest as one of the foolish women speaketh. What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips.* (Job 2:10) — Tobit too is abashed but does not curse Yahuah; he holds to his integrity. The wife''s reproach is the trial within the trial, and the just man bears it.',
       sv.verse_id, ev.verse_id, 'extras', 59634
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-2-alms-and-righteous-deeds',
       E'Thy Alms And Thy Righteous Deeds — The Treasure Laid Up',
       E'Anna means her words as a taunt — *Where are your alms and your righteous deeds?* (Tobit 2:14) — but they name the very life Tobit has lived and will counsel his son to live: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7) The alms are no empty works; they are treasure laid up: *Because that alms do deliver from death, and suffers not to come into darkness.* (Tobit 4:10) The Master taught the same hidden reward, not paraded before men: *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* (Matthew 6:4) Tobit''s righteous deeds are known — to Yahuah, and to the angel who stood beside him — and they will not go unrewarded.',
       sv.verse_id, ev.verse_id, 'extras', 59637
  FROM _session253_tob2_lookup sv, _session253_tob2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-2-bury-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 21:23 — *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* Tobit buries before sunset and the same night precisely to keep this command that the land not be defiled by an unburied body.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* As Abraham labored to bury his own dead in dignity, so Tobit digs a grave for a brother of his nation at his own risk.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 8:22 — *But Yahusha (Jesus) said unto him, Follow me; and let the dead bury their dead.* The neighbours mock Tobit''s burying as folly, yet the kindness to the dead he renders is the very faithfulness that following requires.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 12:13 — *And when you did not delay to rise up, and leave your dinner, to go and cover the dead, your good deed was not hid from me: but I was with you.* Raphael reveals that the angel of Yahuah stood beside Tobit in this very burial of chapter 2, his good deed not hid.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-bury-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-feasts-turned-to-mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 8:10 — *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* Tobit quotes this prophecy by name, watching his feast of Pentecost turn to mourning over the slain brother in fulfilment of Amos.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-feasts-turned-to-mourning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 16:10 — *And thou shalt keep the feast of weeks unto Yahuah Elohayka (the LORD thy God) with a tribute of a freewill offering of thine hand, which thou shalt give unto Yahuah Elohayka (the LORD thy God), according as Yahuah Elohayka (the LORD thy God) hath blessed thee:* Tobit keeps this same feast of weeks even in the captivity of Nineveh, the appointed time held fast in exile.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-feasts-turned-to-mourning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-righteous-struck-blind
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:1 — *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* Tobit, like Job, is a God-fearing and upright man, so his sudden blindness raises the same question of why the righteous suffer.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-righteous-struck-blind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 2:7 — *So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* As Job''s body was smitten head to foot, so Tobit''s eyes are struck with whiteness — the just man afflicted in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-righteous-struck-blind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-wifes-reproach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 2:9 — *Then said his wife unto him, Dost thou still retain thine integrity? curse Elohim (God), and die.* As Job''s wife reproached him in his suffering, so Anna reproaches Tobit, taunting the alms and righteous deeds that seem to have gained him nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-wifes-reproach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 2:10 — *But he said unto her, Thou speakest as one of the foolish women speaketh. What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips.* Tobit, abashed yet not cursing Yahuah, answers his wife''s reproach with the same steadfastness Job showed his.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-wifes-reproach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-2-alms-and-righteous-deeds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The alms his wife throws in his face are the very practice Tobit will charge upon his son as the way of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-alms-and-righteous-deeds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Though Tobit sits afflicted in darkness, his alms are the treasure that, by the book''s own teaching, delivers from death.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-alms-and-righteous-deeds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* Tobit''s hidden alms and righteous deeds, mocked by his wife, are exactly the secret giving the Father sees and openly rewards.'
  FROM cross_reference_threads t, cross_references x, _session253_tob2_lookup sv, _session253_tob2_lookup tv
 WHERE t.slug='tobit-2-alms-and-righteous-deeds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

