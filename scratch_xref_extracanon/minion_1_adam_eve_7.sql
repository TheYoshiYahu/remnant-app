-- ----- fragment: minion_1adameve_07.sql (session253 1-adam-eve 7) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae7 (view _session253_1ae7_lookup). Sort band base 64150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-7-covenant-five-half-days
  ('adam-eve-conflict', '1-adam-eve', 7, 2, 'canon', 'genesis', 9, 9, 'free', E'Genesis 9:9 — *And I, behold, I establish my covenant with you, and with your seed after you;* the unbreakable covenant Yahuah swears to Adam in 1 Adam and Eve 7:2 is the same covenant He renews with Noah, kept down the holy seed-line.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 2, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* the fulfilment of the "great five and a half days" Yahuah names to Adam in 1 Adam and Eve 7:2, the appointed time of the promised Saviour.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 2, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word of Elohim who comforts Adam and pledges to come is the Logos who in time takes flesh, fulfilling the covenant of 1 Adam and Eve 7:2.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 2, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* the Saviour promised to Adam on the very first day of exile in 1 Adam and Eve 7:2 was foreordained before creation itself.'),
  -- thread: 1-adam-eve-7-adam-named-the-beasts
  ('adam-eve-conflict', '1-adam-eve', 7, 3, 'canon', 'genesis', 2, 19, 'free', E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Adam''s memory in 1 Adam and Eve 7:3 of naming the beasts is drawn straight from this Eden scene.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 4, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The subjection of the beasts Adam recalls in 1 Adam and Eve 7:4 is the dominion granted at man''s creation.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 3, 'jubilees', 'jubilees', 3, 2, 'extras', E'Jubilees 3:2 — *And Adam named them all by their respective names, and as he called them, so was their name.* Jubilees recounts the same naming of every beast that Adam grieves over losing in 1 Adam and Eve 7:3.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 4, 'jasher', 'jasher', 1, 2, 'extras', E'Jasher 1:2 — *And Elohim formed man from the ground, and he blew into his nostrils the breath of life, and man became a living soul endowed with speech.* The very speech by which Adam named and ruled the beasts in 1 Adam and Eve 7:4 is the breath of life Jasher records at his forming.'),
  -- thread: 1-adam-eve-7-beasts-will-devour-the-curse
  ('adam-eve-conflict', '1-adam-eve', 7, 5, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* the rising of the beasts Adam dreads in 1 Adam and Eve 7:5 is creation''s hostility under this curse upon the ground.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 6, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The "strange land" outside the garden in which Adam now pleads in 1 Adam and Eve 7:6 is precisely this expulsion.'),
  -- thread: 1-adam-eve-7-beasts-not-hurt-covenant-of-peace
  ('adam-eve-conflict', '1-adam-eve', 7, 8, 'canon', 'ezekiel', 34, 25, 'free', E'Ezekiel 34:25 — *And I will make with them a covenant of peace, and will cause the evil beasts to cease out of the land: and they shall dwell safely in the wilderness, and sleep in the woods.* The command that the beasts not trouble Adam in 1 Adam and Eve 7:8 is the first instance of this covenant of peace that stills the evil beasts.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 8, 'canon', 'hosea', 2, 18, 'free', E'Hosea 2:18 — *And in that day will I make a covenant for them with the beasts of the field, and with the fowls of heaven, and with the creeping things of the ground: and I will break the bow and the sword and the battle out of the earth, and will make them to lie down safely.* Yahuah''s covenant with the very beasts, birds, and creeping things named in 1 Adam and Eve 7:8 is the same peace Hosea foresees.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 8, 'canon', 'isaiah', 11, 9, 'free', E'Isaiah 11:9 — *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* The beasts made gentle toward Adam in 1 Adam and Eve 7:8 foreshadow the holy mountain where nothing hurts or destroys.'),
  -- thread: 1-adam-eve-7-serpent-excepted-the-seed-war
  ('adam-eve-conflict', '1-adam-eve', 7, 9, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent excepted from homage in 1 Adam and Eve 7:9 is the one against whom the seed-war was decreed — enmity, not familiarity, between the serpent and Adam''s line.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 9, 'canon', 'genesis', 3, 14, 'free', E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* the serpent set apart and accursed here is why in 1 Adam and Eve 7:9 it alone does not come among the beasts to Adam.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 9, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enmity with the serpent that begins on Adam''s first day of exile in 1 Adam and Eve 7:9 ends with Satan bruised under the feet of the seed.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 9, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent against which Elohim is angry in 1 Adam and Eve 7:9 is unmasked as the dragon, the deceiver, whose casting down is the war''s appointed end.'),
  ('adam-eve-conflict', '1-adam-eve', 7, 9, 'jubilees', 'jubilees', 3, 28, 'extras', E'Jubilees 3:28 — *And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue.* Jubilees records the silencing of the beasts at the expulsion, matching the serpent set apart and accursed in 1 Adam and Eve 7:9.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-7-covenant-five-half-days',
       E'My covenant of the great five and a half days',
       E'Outside the garden, mercy answers the weeping: *Then Elohim (God) had pity on them, and said: "O Adam, I have made My covenant with you, and I will not turn from it; neither will I let you return to the garden, until My covenant of the great five and a half days is fulfilled."* (1 Adam and Eve 7:2). It ain''t new — this is the same covenant-keeping Elohim who after the flood says *And I, behold, I establish my covenant with you, and with your seed after you* (Genesis 9:9), and the "five and a half days" is the ~5,500-year reckoning toward the incarnation, the Word who promised to come and save: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4), *And the Word was made flesh, and dwelt among us* (John 1:14). The Saviour pledged on the first day outside Eden was no afterthought but the One *Who verily was foreordained before the foundation of the world* (1 Peter 1:20).',
       sv.verse_id, ev.verse_id, 'extras', 64150
  FROM _session253_1ae7_lookup sv, _session253_1ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-7-adam-named-the-beasts',
       E'You made all beasts come to me, that I should name them',
       E'Adam pleads from his lost dominion, remembering Eden: *O Yahuah (Lord), You created us, and made us fit to be in the garden; and before I transgressed, You made all beasts come to me, that I should name them* (1 Adam and Eve 7:3); *and I named every one according to Your mind; and you made them all subject to me* (1 Adam and Eve 7:4). This recalls Genesis directly: *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof* (Genesis 2:19), the dominion first granted at man''s making: *let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth* (Genesis 1:26). The restored books tell the same scene — *And Adam named them all by their respective names, and as he called them, so was their name* (Jubilees 3:2) — for man was *a living soul endowed with speech* (Jasher 1:2). It ain''t new: one primeval history witnessed across the whole library.',
       sv.verse_id, ev.verse_id, 'extras', 64153
  FROM _session253_1ae7_lookup sv, _session253_1ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-7-beasts-will-devour-the-curse',
       E'All beasts will rise against me — the curse and the strange land',
       E'Adam fears the unmade creation now turned hostile: *But now, O Yahuah Elohim (LORD God), that I have transgressed Your commandment, all beasts will rise against me and will devour me, and Eve Your handmaid; and will cut off our life from the face of the earth* (1 Adam and Eve 7:5); he begs because *You have made us come out of the garden, and have made us be in a strange land* (1 Adam and Eve 7:6). This is the curse of Genesis 3 working itself out: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17), the dominion forfeited when *Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23). The harmony of Eden is broken; the strange land is the wilderness of exile under the curse — yet mercy will answer it.',
       sv.verse_id, ev.verse_id, 'extras', 64156
  FROM _session253_1ae7_lookup sv, _session253_1ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-7-beasts-not-hurt-covenant-of-peace',
       E'Elohim commands the beasts not to trouble Adam',
       E'Mercy disarms the curse: *Then Elohim (God) commanded the beasts, and the birds, and all that moves on the earth, to come to Adam and to be familiar with him, and not to trouble him and Eve; nor yet any of the good and righteous among their offspring* (1 Adam and Eve 7:8). This is the same covenant of peace Yahuah pledges through the prophets: *And I will make with them a covenant of peace, and will cause the evil beasts to cease out of the land: and they shall dwell safely* (Ezekiel 34:25); *And in that day will I make a covenant for them with the beasts of the field, and with the fowls of heaven, and with the creeping things of the ground* (Hosea 2:18); the restored peace of the holy mountain where *They shall not hurt nor destroy in all my holy mountain* (Isaiah 11:9). It ain''t new — the first taste of that promised peace is granted to Adam on the day of his exile, and it is reserved especially for "the good and righteous," the holy seed.',
       sv.verse_id, ev.verse_id, 'extras', 64159
  FROM _session253_1ae7_lookup sv, _session253_1ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-7-serpent-excepted-the-seed-war',
       E'Except the serpent — the enmity from the first day',
       E'One creature alone is shut out from the peace: *Then all the beasts paid homage to Adam, according to the commandment of Elohim (God); except the serpent, against which Elohim (God) was angry. It did not come to Adam, with the beasts* (1 Adam and Eve 7:9). The serpent stands apart because the war is already declared: *Because thou hast done this, thou art cursed above all cattle... And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:14-15). It ain''t new — from the very first day outside Eden the seed-war is in force, and its end is sworn: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20), when *the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). Jubilees marks the same severing — *And on that day was closed the mouth of all beasts... so that they could no longer speak* (Jubilees 3:28) — the serpent that beguiled now silenced and cursed apart.',
       sv.verse_id, ev.verse_id, 'extras', 64162
  FROM _session253_1ae7_lookup sv, _session253_1ae7_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-7-covenant-five-half-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:9 — *And I, behold, I establish my covenant with you, and with your seed after you;* the unbreakable covenant Yahuah swears to Adam in 1 Adam and Eve 7:2 is the same covenant He renews with Noah, kept down the holy seed-line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-covenant-five-half-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* the fulfilment of the "great five and a half days" Yahuah names to Adam in 1 Adam and Eve 7:2, the appointed time of the promised Saviour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-covenant-five-half-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word of Elohim who comforts Adam and pledges to come is the Logos who in time takes flesh, fulfilling the covenant of 1 Adam and Eve 7:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-covenant-five-half-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* the Saviour promised to Adam on the very first day of exile in 1 Adam and Eve 7:2 was foreordained before creation itself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-covenant-five-half-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-7-adam-named-the-beasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Adam''s memory in 1 Adam and Eve 7:3 of naming the beasts is drawn straight from this Eden scene.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-adam-named-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The subjection of the beasts Adam recalls in 1 Adam and Eve 7:4 is the dominion granted at man''s creation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-adam-named-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 3:2 — *And Adam named them all by their respective names, and as he called them, so was their name.* Jubilees recounts the same naming of every beast that Adam grieves over losing in 1 Adam and Eve 7:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-adam-named-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 1:2 — *And Elohim formed man from the ground, and he blew into his nostrils the breath of life, and man became a living soul endowed with speech.* The very speech by which Adam named and ruled the beasts in 1 Adam and Eve 7:4 is the breath of life Jasher records at his forming.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-adam-named-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-7-beasts-will-devour-the-curse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* the rising of the beasts Adam dreads in 1 Adam and Eve 7:5 is creation''s hostility under this curse upon the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-beasts-will-devour-the-curse'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The "strange land" outside the garden in which Adam now pleads in 1 Adam and Eve 7:6 is precisely this expulsion.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-beasts-will-devour-the-curse'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-7-beasts-not-hurt-covenant-of-peace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:25 — *And I will make with them a covenant of peace, and will cause the evil beasts to cease out of the land: and they shall dwell safely in the wilderness, and sleep in the woods.* The command that the beasts not trouble Adam in 1 Adam and Eve 7:8 is the first instance of this covenant of peace that stills the evil beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-beasts-not-hurt-covenant-of-peace'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 2:18 — *And in that day will I make a covenant for them with the beasts of the field, and with the fowls of heaven, and with the creeping things of the ground: and I will break the bow and the sword and the battle out of the earth, and will make them to lie down safely.* Yahuah''s covenant with the very beasts, birds, and creeping things named in 1 Adam and Eve 7:8 is the same peace Hosea foresees.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-beasts-not-hurt-covenant-of-peace'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:9 — *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* The beasts made gentle toward Adam in 1 Adam and Eve 7:8 foreshadow the holy mountain where nothing hurts or destroys.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-beasts-not-hurt-covenant-of-peace'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-7-serpent-excepted-the-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent excepted from homage in 1 Adam and Eve 7:9 is the one against whom the seed-war was decreed — enmity, not familiarity, between the serpent and Adam''s line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-serpent-excepted-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* the serpent set apart and accursed here is why in 1 Adam and Eve 7:9 it alone does not come among the beasts to Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-serpent-excepted-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enmity with the serpent that begins on Adam''s first day of exile in 1 Adam and Eve 7:9 ends with Satan bruised under the feet of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-serpent-excepted-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent against which Elohim is angry in 1 Adam and Eve 7:9 is unmasked as the dragon, the deceiver, whose casting down is the war''s appointed end.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-serpent-excepted-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 3:28 — *And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue.* Jubilees records the silencing of the beasts at the expulsion, matching the serpent set apart and accursed in 1 Adam and Eve 7:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae7_lookup sv, _session253_1ae7_lookup tv
 WHERE t.slug='1-adam-eve-7-serpent-excepted-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

