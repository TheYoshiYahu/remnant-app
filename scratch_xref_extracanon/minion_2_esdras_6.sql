-- ----- fragment: minion_2esdras_06.sql (session253 2-esdras 6) -----
-- Source anchor: apocrypha/2-esdras ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd6 (view _session253_2esd6_lookup). Sort band base 63125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-6-made-through-me-alone
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word''s sole agency in John is the very ''through me alone, and through none other'' the Voice claims in 2 Esdras 6:6.'),
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* Paul''s ''all things created by him, and for him'' is the same one-hand creation of 2 Esdras 6:6.'),
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* He who was before all and holds all together is the ''by me also they shall be ended'' of 2 Esdras 6:6 — Beginning and End in one hand.'),
  ('apocrypha', '2-esdras', 6, 6, 'canon', 'isaiah', 44, 24, 'free', E'Isaiah 44:24 — *Thus saith Yahuah (LORD), thy redeemer, and he that formed thee from the womb, I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself;* The prophet''s ''alone... by myself'' is exactly the ''through none other'' of 2 Esdras 6:6.'),
  -- thread: 2-esdras-6-jacob-the-heel-of-esau
  ('apocrypha', '2-esdras', 6, 8, 'canon', 'isaiah', 44, 5, 'free', E'Isaiah 44:5 — *One shall say, I am the LORD''S; and another shall call himself by the name of Jacob; and another shall subscribe with his hand unto Yahuah (LORD), and surname himself by the name of Yashar''el (Israel).* The name of Jacob taken up by the hand answers the heel-grasping hand of Jacob in 2 Esdras 6:8.'),
  ('apocrypha', '2-esdras', 6, 9, 'canon', 'deuteronomy', 7, 7, 'free', E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* The election of Jacob over Esau in 2 Esdras 6:9 rests on the same sovereign choosing of the few, not the many.'),
  -- thread: 2-esdras-6-the-books-opened
  ('apocrypha', '2-esdras', 6, 20, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books before the throne are the very ''books opened before the firmament'' of 2 Esdras 6:20 — the self-link of the live Revelation apparatus.'),
  ('apocrypha', '2-esdras', 6, 20, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The sealed token Daniel kept for the end is shown openly in 2 Esdras 6:20 — the dead seen all together when the books are opened.'),
  -- thread: 2-esdras-6-the-trumpet-and-the-raised
  ('apocrypha', '2-esdras', 6, 23, 'canon', '1-thessalonians', 4, 16, 'free', E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s trump that raises the dead is the trumpet that gives a sound in 2 Esdras 6:23.'),
  ('apocrypha', '2-esdras', 6, 21, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The dead ''raised up'' in 2 Esdras 6:21 is Daniel''s awaking from the dust to everlasting life.'),
  ('apocrypha', '2-esdras', 6, 23, 'canon', 'malachi', 4, 5, 'free', E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* The trumpet-token of the end in 2 Esdras 6:23 is heralded by Malachi''s Elijah before the dreadful day.'),
  ('apocrypha', '2-esdras', 6, 23, 'canon', 'malachi', 4, 6, 'free', E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* The turned heart of the fathers prepares the very day whose trumpet sounds in 2 Esdras 6:23.'),
  -- thread: 2-esdras-6-the-word-a-perfect-work
  ('apocrypha', '2-esdras', 6, 38, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''word'' that was a perfect work in 2 Esdras 6:38 is the Word that was in the beginning.'),
  ('apocrypha', '2-esdras', 6, 43, 'canon', 'john', 1, 10, 'free', E'John 1:10 — *He was in the world, and the world was made by him, and the world knew him not.* The world made as soon as the word went forth (2 Esdras 6:43) is the world made by the Word in John''s prologue.'),
  ('apocrypha', '2-esdras', 6, 38, 'canon', 'colossians', 1, 15, 'free', E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* The spoken word that perfected the first creation (2 Esdras 6:38) is the firstborn image through whom Paul says all was made.'),
  -- thread: 2-esdras-6-the-world-for-our-sakes
  ('apocrypha', '2-esdras', 6, 55, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The world made ''for our sakes'' in 2 Esdras 6:55 is the holy, chosen, treasured people of Moses.'),
  ('apocrypha', '2-esdras', 6, 58, 'canon', 'deuteronomy', 7, 8, 'free', E'Deuteronomy 7:8 — *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* The firstborn and fervent-lover of 2 Esdras 6:58 is loved for the oath''s sake, as Moses says — election, not merit.'),
  ('apocrypha', '2-esdras', 6, 58, 'canon', 'isaiah', 44, 21, 'free', E'Isaiah 44:21 — *Remember these, O Jacob and Yashar''el (Israel); for thou art my servant: I have formed thee; thou art my servant: O Yashar''el (Israel), thou shalt not be forgotten of me.* The firstborn people given into hands yet not forgotten (2 Esdras 6:58) is the servant Yashar''el the prophet vows never to forget — Israel is not cast away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-made-through-me-alone',
       E'Made through me alone, and through none other',
       E'Before paradise, before the angels, before the firmament was named, the Voice declares the sole agency of creation: *Then did I consider these things, and they all were made through me alone, and through none other: by me also they shall be ended, and by none other.* (2 Esdras 6:6). The Beginning and the End in one hand. John names that same Word: *All things were made by him; and without him was not any thing made that was made.* (John 1:3). Paul gathers the whole created order into Him: *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* (Colossians 1:16), and *he is before all things, and by him all things consist.* (Colossians 1:17). And the prophet seals the ''alone'' with no other hand beside Him: *Thus saith Yahuah (LORD), thy redeemer, and he that formed thee from the womb, I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself;* (Isaiah 44:24). It ain''t new — the Formed Wisdom by whom all was made, and by whom all shall be ended.',
       sv.verse_id, ev.verse_id, 'extras', 63125
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-jacob-the-heel-of-esau',
       E'Jacob''s hand held first the heel of Esau',
       E'Esdras asks the parting of the times, and the answer is a birth: *From Abraham to Isaac, when Jacob and Esau were born of him, Jacob''s hand held first the heel of Esau.* (2 Esdras 6:8) — *For Esau is the end of the world, and Jacob is the beginning of it that followeth.* (2 Esdras 6:9). The old age and the age to come hinge on the elder and the younger, the supplanter''s hand at the heel. Election precedes confession — *and another shall call himself by the name of Jacob; and another shall subscribe with his hand unto Yahuah (LORD), and surname himself by the name of Yashar''el (Israel).* (Isaiah 44:5). And the Chooser sets His love not on the many but the kept seed: *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* (Deuteronomy 7:7). The hand between the heel and the hand is the remnant''s hold on the inheritance — not a people that supplants Israel, but the faithful seed grasping the age that follows.',
       sv.verse_id, ev.verse_id, 'extras', 63128
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-books-opened',
       E'The books shall be opened before the firmament',
       E'The token of the end is a courtroom and a resurrection together: *And when the world, that shall begin to vanish away, shall be finished, then will I shew these tokens: the books shall be opened before the firmament, and they shall see all together:* (2 Esdras 6:20). John sees the same scene at the white throne: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). Daniel had sealed it for this very hour, the wise written in the book and waking from the dust: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). The vanishing world and the opened books are the one ledger of the last day.',
       sv.verse_id, ev.verse_id, 'extras', 63131
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-trumpet-and-the-raised',
       E'The trumpet shall give a sound, and they shall be raised up',
       E'The signs gather to a blast and a waking: *And the children of a year old shall speak with their voices, the women with child shall bring forth untimely children of three or four months old, and they shall live, and be raised up.* (2 Esdras 6:21) — *And the trumpet shall give a sound, which when every man heareth, they shall be suddenly afraid.* (2 Esdras 6:23). Paul sounds the same trump over the same raising of the dead: *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* (1 Thessalonians 4:16). And the prophet names the herald before that great and dreadful day, the heart of the fathers turned: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* (Malachi 4:5) — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* (Malachi 4:6). The trumpet of Esdras is the last trump of the gathering.',
       sv.verse_id, ev.verse_id, 'extras', 63134
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-word-a-perfect-work',
       E'Your word was a perfect work',
       E'Esdras recites the six days, and the engine of every day is the spoken word: *you spakest from the beginning of the creation, even the first day, and saidst thus; Let heaven and earth be made; and your word was a perfect work.* (2 Esdras 6:38) — *For as soon as your word went forth the work was made.* (2 Esdras 6:43). This is the Logos of the prologue, the Word that was in the beginning and by which all was made: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *He was in the world, and the world was made by him, and the world knew him not.* (John 1:10). And He who is the image of the invisible holds the first place in that making: *Who is the image of the invisible Elohim (God), the firstborn of every creature:* (Colossians 1:15). The word that went forth and the work that was made are the Formed Wisdom, the perfect work of the first day.',
       sv.verse_id, ev.verse_id, 'extras', 63137
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-6-the-world-for-our-sakes',
       E'You madest the world for our sakes',
       E'The creation-recital lands on a covenant claim, the chosen people the reason for the whole: *All this have I spoken before you, O Yahuah (God), because you madest the world for our sakes* (2 Esdras 6:55) — *But we your people, whom you have called your firstborn, your only begotten, and your fervent lover, are given into their hands.* (2 Esdras 6:58). This is no church displacing Israel; it is the firstborn beloved of the oath. Moses names the same chosen, holy, treasured people: *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6), loved for the oath''s sake, not their number: *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8). And the firstborn Yashar''el remembered for the redeemer''s sake: *Remember these, O Jacob and Yashar''el (Israel); for thou art my servant: I have formed thee; thou art my servant: O Yashar''el (Israel), thou shalt not be forgotten of me.* (Isaiah 44:21). Election precedes confession; the world is made for the kept seed.',
       sv.verse_id, ev.verse_id, 'extras', 63140
  FROM _session253_2esd6_lookup sv, _session253_2esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=55
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=6 AND ev.verse_number=59
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-6-made-through-me-alone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word''s sole agency in John is the very ''through me alone, and through none other'' the Voice claims in 2 Esdras 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* Paul''s ''all things created by him, and for him'' is the same one-hand creation of 2 Esdras 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* He who was before all and holds all together is the ''by me also they shall be ended'' of 2 Esdras 6:6 — Beginning and End in one hand.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 44:24 — *Thus saith Yahuah (LORD), thy redeemer, and he that formed thee from the womb, I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself;* The prophet''s ''alone... by myself'' is exactly the ''through none other'' of 2 Esdras 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-made-through-me-alone'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-jacob-the-heel-of-esau
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:5 — *One shall say, I am the LORD''S; and another shall call himself by the name of Jacob; and another shall subscribe with his hand unto Yahuah (LORD), and surname himself by the name of Yashar''el (Israel).* The name of Jacob taken up by the hand answers the heel-grasping hand of Jacob in 2 Esdras 6:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-jacob-the-heel-of-esau'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* The election of Jacob over Esau in 2 Esdras 6:9 rests on the same sovereign choosing of the few, not the many.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-jacob-the-heel-of-esau'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-books-opened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books before the throne are the very ''books opened before the firmament'' of 2 Esdras 6:20 — the self-link of the live Revelation apparatus.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-books-opened'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The sealed token Daniel kept for the end is shown openly in 2 Esdras 6:20 — the dead seen all together when the books are opened.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-books-opened'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-trumpet-and-the-raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s trump that raises the dead is the trumpet that gives a sound in 2 Esdras 6:23.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The dead ''raised up'' in 2 Esdras 6:21 is Daniel''s awaking from the dust to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* The trumpet-token of the end in 2 Esdras 6:23 is heralded by Malachi''s Elijah before the dreadful day.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* The turned heart of the fathers prepares the very day whose trumpet sounds in 2 Esdras 6:23.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-trumpet-and-the-raised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-word-a-perfect-work
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''word'' that was a perfect work in 2 Esdras 6:38 is the Word that was in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-word-a-perfect-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:10 — *He was in the world, and the world was made by him, and the world knew him not.* The world made as soon as the word went forth (2 Esdras 6:43) is the world made by the Word in John''s prologue.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-word-a-perfect-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* The spoken word that perfected the first creation (2 Esdras 6:38) is the firstborn image through whom Paul says all was made.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-word-a-perfect-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-6-the-world-for-our-sakes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The world made ''for our sakes'' in 2 Esdras 6:55 is the holy, chosen, treasured people of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-world-for-our-sakes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:8 — *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* The firstborn and fervent-lover of 2 Esdras 6:58 is loved for the oath''s sake, as Moses says — election, not merit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-world-for-our-sakes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:21 — *Remember these, O Jacob and Yashar''el (Israel); for thou art my servant: I have formed thee; thou art my servant: O Yashar''el (Israel), thou shalt not be forgotten of me.* The firstborn people given into hands yet not forgotten (2 Esdras 6:58) is the servant Yashar''el the prophet vows never to forget — Israel is not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd6_lookup sv, _session253_2esd6_lookup tv
 WHERE t.slug='2-esdras-6-the-world-for-our-sakes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=6 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

