-- ----- fragment: minion_2esdras_14.sql (session253 2-esdras 14) -----
-- Source anchor: apocrypha/2-esdras ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd14 (view _session253_2esd14_lookup). Sort band base 63325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-14-voice-from-the-bush
  ('apocrypha', '2-esdras', 14, 1, 'canon', 'exodus', 3, 2, 'free', E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The bush that calls Esdras is the very bush of Horeb, named outright in the next verses.'),
  ('apocrypha', '2-esdras', 14, 2, 'canon', 'exodus', 3, 4, 'free', E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Esdras answers "Here am I" with the same words and to the same doubled call that Moses gave.'),
  ('apocrypha', '2-esdras', 14, 3, 'canon', 'exodus', 3, 6, 'free', E'Exodus 3:6 — *Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God).* The One who manifestly revealed Himself to Moses in the bush is the One now revealing Himself to Esdras.'),
  ('apocrypha', '2-esdras', 14, 4, 'canon', 'exodus', 3, 10, 'free', E'Exodus 3:10 — *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt.* The sending and leading of the people out of Egypt that Esdras recalls is the commission given at the bush.'),
  -- thread: 2-esdras-14-taken-to-remain-with-the-son
  ('apocrypha', '2-esdras', 14, 9, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Esdras being "taken away from all" without ordinary death is the Enoch translation he himself parallels.'),
  ('apocrypha', '2-esdras', 14, 9, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s bodily taking is the same translation into which Esdras is gathered to remain until the times be ended.'),
  ('apocrypha', '2-esdras', 14, 9, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The not-seeing-death that pleased Elohim is exactly the lot promised Esdras, taken to abide with the Son.'),
  ('apocrypha', '2-esdras', 14, 9, 'canon', 'acts', 1, 9, 'free', E'Acts 1:9 — *And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight.* The "my Son" with whom Esdras is to remain was Himself taken up; the translated wait with the ascended Messiah.'),
  -- thread: 2-esdras-14-the-law-is-burnt
  ('apocrypha', '2-esdras', 14, 21, 'canon', 'jeremiah', 36, 28, 'free', E'Jeremiah 36:28 — *Take thee again another roll, and write in it all the former words that were in the first roll, which Jehoiakim the king of Yahudah (Judah) hath burned.* The burnt-law-rewritten of Esdras is the same mercy Jeremiah received when the king burned the scroll.'),
  ('apocrypha', '2-esdras', 14, 22, 'canon', 'jeremiah', 36, 32, 'free', E'Jeremiah 36:32 — *Then took Jeremiah another roll, and gave it to Baruch the scribe, the son of Neriah; who wrote therein from the mouth of Jeremiah all the words of the book which Jehoiakim king of Yahudah (Judah) had burned in the fire: and there were added besides unto them many like words.* Esdras dictating the restored Word by the Spirit mirrors Jeremiah dictating to Baruch after the fire.'),
  ('apocrypha', '2-esdras', 14, 21, 'canon', 'psalms', 119, 89, 'free', E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* Though the law be burnt on earth, it stands settled in heaven, and so can be restored to men.'),
  -- thread: 2-esdras-14-cup-of-fire-wisdom
  ('apocrypha', '2-esdras', 14, 39, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The cup like water yet like fire, drunk inward, is the living water that becomes a well of understanding within.'),
  ('apocrypha', '2-esdras', 14, 40, 'canon', 'john', 7, 38, 'free', E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* Wisdom growing in Esdras''s breast so his mouth pours forth is the river of the Spirit flowing out of the inward man.'),
  ('apocrypha', '2-esdras', 14, 22, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The Ruach HaKodesh Esdras prays into himself to write the Word is this springing well of the Spirit.'),
  -- thread: 2-esdras-14-after-death-the-judgment
  ('apocrypha', '2-esdras', 14, 35, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Esdras''s "after death... when we shall live again" with the righteous made manifest and the ungodly declared is Daniel''s resurrection to life or to contempt.'),
  ('apocrypha', '2-esdras', 14, 34, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The kept-alive who obtain mercy and whose names are made manifest are the wise who shine in Daniel''s rising.'),
  -- thread: 2-esdras-14-ninety-four-books
  ('apocrypha', '2-esdras', 14, 46, 'canon', 'deuteronomy', 31, 26, 'free', E'Deuteronomy 31:26 — *Take this book of the law, and put it in the side of the ark of the covenant of Yahuah Elohaychem (the LORD your God), that it may be there for a witness against thee.* The seventy books reserved beside the public canon echo the law-book kept by the ark as a witness.'),
  ('apocrypha', '2-esdras', 14, 6, 'canon', 'matthew', 13, 11, 'free', E'Matthew 13:11 — *He answered and said unto them, Because it is given unto you to know the mysteries of the kingdom of heaven, but to them it is not given.* "These words shall you declare, and these shall you hide" is the Master''s own pattern of mysteries entrusted to the wise.'),
  ('apocrypha', '2-esdras', 14, 45, 'canon', 'revelation', 22, 18, 'free', E'Revelation 22:18 — *For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book:* The openly-published Word is the canon that may be neither added to nor diminished.'),
  ('apocrypha', '2-esdras', 14, 45, 'canon', 'revelation', 22, 19, 'free', E'Revelation 22:19 — *And if any man shall take away from the words of the book of this prophecy, Elohim (God) shall take away his part out of the book of life, and out of the holy city, and from the things which are written in this book.* The Word published "that the worthy and unworthy may read it" is sealed against subtraction as well as addition.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-voice-from-the-bush',
       E'The Voice Out of the Bush — Esdras Called as Moses Was',
       E'Ezra is hailed from a bush as Moses was at Horeb: *And it came to pass upon the third day, I sat under an oak, and, behold, there came a voice out of a bush over against me, and said, Esdras, Esdras* (2 Esdras 14:1), and *In the bush I did manifestly reveal myself to Moses, and talked with him, when my people served in Egypt* (2 Esdras 14:3). The pattern is the burning bush itself — *the bush burned with fire, and the bush was not consumed* (Exodus 3:2) — and the doubled name of the called man: *Elohim called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I* (Exodus 3:4), answered word-for-word by *And I said, Here am I, Yahuah* (2 Esdras 14:2). It ain''t new: the same Voice that raised up the first deliverer raises up the restorer of the Word.',
       sv.verse_id, ev.verse_id, 'extras', 63325
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-taken-to-remain-with-the-son',
       E'Taken Away to Remain With My Son — The Translation Pattern',
       E'Esdras is told he will not die in the common way but be taken up: *For you shall be taken away from all, and from henceforth you shall remain with my Son, and with such as be like you, until the times be ended* (2 Esdras 14:9), and at the last, *And I did so* — his work finished, he is gathered (2 Esdras 14:48). This is the translation pattern of Enoch and Elijah, the men who *were not, for Elohim took* them: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24); *Elijah went up by a whirlwind into heaven* (2 Kings 2:11). Note 2 Esdras''s own messianism: Esdras is to abide *with my Son* — and the Son Himself was taken up bodily, *a cloud received him out of their sight* (Acts 1:9). The translated saints await Him.',
       sv.verse_id, ev.verse_id, 'extras', 63328
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-the-law-is-burnt',
       E'Thy Law Is Burnt — The Word Rewritten',
       E'Esdras grieves that the Scriptures are destroyed and prays for their restoration: *For your law is burnt, therefore no man knoweth the things that are done of you, or the work that shall begin* (2 Esdras 14:21), and *send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all that has been done in the world since the beginning, which were written in your law, that men may find your path, and that they which will live in the latter days may live* (2 Esdras 14:22). The Word was burnt once before, by a king''s fire, and rewritten at Yahuah''s command: *Then the word of Yahuah came to Jeremiah, after that the king had burned the roll... Take thee again another roll, and write in it all the former words* (Jeremiah 36:27-28), and Baruch *wrote therein from the mouth of Jeremiah all the words of the book which Jehoiakim king of Yahudah had burned in the fire: and there were added besides unto them many like words* (Jeremiah 36:32). The Word cannot be burned out of being, *For ever, O Yahuah, thy word is settled in heaven* (Psalm 119:89).',
       sv.verse_id, ev.verse_id, 'extras', 63331
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-cup-of-fire-wisdom',
       E'The Cup Like Fire — Living Water and Understanding',
       E'Esdras is given a cup to drink that floods him with wisdom: *he reached me a full cup, which was full as it were with water, but the colour of it was like fire* (2 Esdras 14:39), and *when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast, for my spirit strengthened my memory* (2 Esdras 14:40). The Messiah offers the same indwelling draught of the Spirit: *whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14), and *out of his belly shall flow rivers of living water* (John 7:38). The fiery cup that opens Esdras''s mouth that it is *opened, and shut no more* is the Spirit poured into a vessel to make him speak.',
       sv.verse_id, ev.verse_id, 'extras', 63334
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-after-death-the-judgment',
       E'After Death the Judgment — When We Shall Live Again',
       E'Esdras preaches resurrection and a manifest judgment to the regathered remnant: *if so be that you will subdue your own understanding, and reform your hearts, you shall be kept alive and after death you shall obtain mercy* (2 Esdras 14:34), and *For after death shall the judgment come, when we shall live again: and then shall the names of the righteous be manifest, and the works of the ungodly shall be declared* (2 Esdras 14:35). This is Daniel''s two-fold awaking: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The 4 Ezra resurrection hope is no church-novelty — it is the Tanakh''s own promise, kept for the faithful of both houses who reform their hearts.',
       sv.verse_id, ev.verse_id, 'extras', 63337
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-14-ninety-four-books',
       E'The Twenty-Four and the Seventy — Words Declared and Words Hidden',
       E'The whole canon-question lives in Esdras''s commission: *These words shall you declare, and these shall you hide* (2 Esdras 14:6); the five scribes write *two hundred and four books* (2 Esdras 14:44 — ninety-four in the older count), and the order comes, *The first that you have written publish openly, that the worthy and unworthy may read it: But keep the seventy last, that you may deliver them only to such as be wise among the people* (2 Esdras 14:45-46). A book kept beside the ark is the Tanakh''s own pattern: *Take this book of the law, and put it in the side of the ark of the covenant of Yahuah Elohaychem, that it may be there for a witness against thee* (Deuteronomy 31:26). Hidden things for the wise is the Master''s own way — *Because it is given unto you to know the mysteries of the kingdom of heaven, but to them it is not given* (Matthew 13:11). Yet the published Word stands inviolable and complete: *If any man shall add unto these things, Elohim shall add unto him the plagues that are written in this book* (Revelation 22:18).',
       sv.verse_id, ev.verse_id, 'extras', 63340
  FROM _session253_2esd14_lookup sv, _session253_2esd14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=14 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-14-voice-from-the-bush
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The bush that calls Esdras is the very bush of Horeb, named outright in the next verses.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Esdras answers "Here am I" with the same words and to the same doubled call that Moses gave.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 3:6 — *Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God).* The One who manifestly revealed Himself to Moses in the bush is the One now revealing Himself to Esdras.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 3:10 — *Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Yashar''el (Israel) out of Egypt.* The sending and leading of the people out of Egypt that Esdras recalls is the commission given at the bush.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-voice-from-the-bush'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-taken-to-remain-with-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Esdras being "taken away from all" without ordinary death is the Enoch translation he himself parallels.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* Elijah''s bodily taking is the same translation into which Esdras is gathered to remain until the times be ended.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The not-seeing-death that pleased Elohim is exactly the lot promised Esdras, taken to abide with the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 1:9 — *And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight.* The "my Son" with whom Esdras is to remain was Himself taken up; the translated wait with the ascended Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-taken-to-remain-with-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-the-law-is-burnt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 36:28 — *Take thee again another roll, and write in it all the former words that were in the first roll, which Jehoiakim the king of Yahudah (Judah) hath burned.* The burnt-law-rewritten of Esdras is the same mercy Jeremiah received when the king burned the scroll.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-the-law-is-burnt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=36 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 36:32 — *Then took Jeremiah another roll, and gave it to Baruch the scribe, the son of Neriah; who wrote therein from the mouth of Jeremiah all the words of the book which Jehoiakim king of Yahudah (Judah) had burned in the fire: and there were added besides unto them many like words.* Esdras dictating the restored Word by the Spirit mirrors Jeremiah dictating to Baruch after the fire.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-the-law-is-burnt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=36 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* Though the law be burnt on earth, it stands settled in heaven, and so can be restored to men.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-the-law-is-burnt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-cup-of-fire-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The cup like water yet like fire, drunk inward, is the living water that becomes a well of understanding within.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-cup-of-fire-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* Wisdom growing in Esdras''s breast so his mouth pours forth is the river of the Spirit flowing out of the inward man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-cup-of-fire-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The Ruach HaKodesh Esdras prays into himself to write the Word is this springing well of the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-cup-of-fire-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-after-death-the-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Esdras''s "after death... when we shall live again" with the righteous made manifest and the ungodly declared is Daniel''s resurrection to life or to contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-after-death-the-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The kept-alive who obtain mercy and whose names are made manifest are the wise who shine in Daniel''s rising.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-after-death-the-judgment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-14-ninety-four-books
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:26 — *Take this book of the law, and put it in the side of the ark of the covenant of Yahuah Elohaychem (the LORD your God), that it may be there for a witness against thee.* The seventy books reserved beside the public canon echo the law-book kept by the ark as a witness.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:11 — *He answered and said unto them, Because it is given unto you to know the mysteries of the kingdom of heaven, but to them it is not given.* "These words shall you declare, and these shall you hide" is the Master''s own pattern of mysteries entrusted to the wise.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:18 — *For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book:* The openly-published Word is the canon that may be neither added to nor diminished.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:19 — *And if any man shall take away from the words of the book of this prophecy, Elohim (God) shall take away his part out of the book of life, and out of the holy city, and from the things which are written in this book.* The Word published "that the worthy and unworthy may read it" is sealed against subtraction as well as addition.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd14_lookup sv, _session253_2esd14_lookup tv
 WHERE t.slug='2-esdras-14-ninety-four-books'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=14 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

