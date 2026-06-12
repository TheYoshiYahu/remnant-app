-- ----- fragment: minion_2adameve_22.sql (session253 2-adam-eve 22) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae22 (view _session253_2ae22_lookup). Sort band base 66525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-22-enoch-translated
  ('adam-eve-conflict', '2-adam-eve', 22, 8, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Conflict''s transporting of Enoch from the mountain to the land of life is Moses'' "he was not, for Elohim took him" told from inside the cave.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 4, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s awareness through grace that Yahuah meant to remove him (22:4) is the same testimony of pleasing Elohim before the translation.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 9, 'enoch', '1-enoch', 12, 1, 'extras', E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* That Enoch was "out of the reach of death" (22:9) is the hidden, untraced abode of his own restored book.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 8, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The mansions of the righteous and Paradise of joy (22:8) is Jubilees'' Garden of Eden into which the angels conducted Enoch.'),
  -- thread: 2-adam-eve-22-enoch-celebrated-book
  ('adam-eve-conflict', '2-adam-eve', 22, 2, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The "celebrated book" of 22:2 is the very scroll Jude quotes as Scripture, the seventh from Adam prophesying.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 2, 'jubilees', 'jubilees', 4, 17, 'extras', E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book... And he was the first to write a testimony.* Enoch who "wrote a celebrated book" (22:2) is Jubilees'' first man to write a testimony.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 2, 'jubilees', 'jubilees', 4, 19, 'extras', E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep, as it will happen to the children of men throughout their generations until the day of judgment; he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* The "many wonders" that may not be told here (22:2) are the visions Jubilees says he saw and wrote down.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 1, 'canon', 'genesis', 5, 22, 'free', E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters.* Enoch keeping the commandment and continuing to minister in the cave (22:1) is the walk with Elohim that Genesis measures in years.'),
  -- thread: 2-adam-eve-22-watch-over-your-souls
  ('adam-eve-conflict', '2-adam-eve', 22, 5, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Enoch''s foreknowledge that Elohim would bring the waters of the Flood and destroy creation (22:5) is the very sentence Yahuah speaks to Noah.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 7, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos; then began men to call upon the name of Yahuah (LORD).* To "hold fast by your fear of Elohim and by your service of Him, and worship Him in upright faith" (22:7) is the calling on the Name kept in the line of Seth — the way before the law.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 5, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The destroying flood Enoch foretells (22:5) is the judgment Jude reports the same Enoch prophesying upon all the ungodly.'),
  -- thread: 2-adam-eve-22-seth-mingled-with-cain
  ('adam-eve-conflict', '2-adam-eve', 22, 10, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The children of Seth going down to "fall into sin with the children of Cain" (22:10) is Genesis'' sons of Elohim taking the daughters of men.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 3, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* That Seth''s line "went astray and fell" toward Cain''s children (22:3) is the seed of the wicked one drawing in the seed kept righteous — the seed-war from the first murder.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 10, 'enoch', '1-enoch', 6, 6, 'extras', E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The descent from the holy mountain into sin (22:10) is mirrored by the Watchers'' own descent in the days of Jared in Enoch''s book.'),
  ('adam-eve-conflict', '2-adam-eve', 22, 3, 'jubilees', 'jubilees', 4, 22, 'extras', E'Jubilees 4:22 — *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all.* The same Enoch who here grieves over Seth''s children falling (22:3) is the Enoch who, in Jubilees, testifies against the defiling union of the seed-lines.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-enoch-translated',
       E'Enoch Translated — He Was Not, For Elohim Took Him',
       E'Of the seventh from Adam this book says, *Enoch continued in his ministry before Yahuah (Lord) three hundred and eighty-five years, and at the end of that time he became aware through the grace of Elohim (God), that Elohim (God) intended to remove him from the earth* (2 Adam and Eve 22:4); and so it was that *Elohim (God) transported him from that mountain to the land of life, to the mansions of the righteous and of the chosen, the abode of Paradise of joy* (22:8). It ain''t new — Moses wrote it plainly: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), and the witness of faith is sealed in the Renewed Covenant: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5). The restored book of Enoch keeps the same memory of the hidden one: *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him* (1 Enoch 12:1), and Jubilees: *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23). One walk, one taking, witnessed in four scrolls.',
       sv.verse_id, ev.verse_id, 'extras', 66525
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-enoch-celebrated-book',
       E'The Celebrated Book and the Wonders of Enoch',
       E'The book lingers on the scribe of the cave: *It is this Enoch to whom many wonders happened, and who also wrote a celebrated book; but those wonders may not be told in this place* (2 Adam and Eve 22:2). It ain''t new — the apostle Jude reaches for that very book by name: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14), citing the words *To execute judgment upon all, and to convince all that are ungodly* (Jude 1:15). Jubilees remembers the same first author and the same wonders: *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven... and he was the first to write a testimony* (Jubilees 4:17); *And what was and what will be he saw in a vision of his sleep... he saw and understood everything, and wrote his testimony* (Jubilees 4:19). The celebrated book is no legend invented late — three witnesses name it.',
       sv.verse_id, ev.verse_id, 'extras', 66528
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-watch-over-your-souls',
       E'Watch Over Your Souls — Enoch''s Last Charge and the Coming Flood',
       E'Before he is taken, Enoch foretells the judgment and charges the holy remnant: *I know that Elohim (God) intends to bring the waters of the Flood upon the earth, and to destroy our creation* (2 Adam and Eve 22:5), and *Watch over your souls, and hold fast by your fear of Elohim (God) and by your service of Him, and worship Him in upright faith, and serve Him in righteousness, innocence and judgment, in repentance and also in purity* (22:7). It ain''t new — Yahuah Himself announces the same flood to Noah: *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die* (Genesis 6:17). The charge to fear and serve Him in repentance is the way kept before Sinai, when first *began men to call upon the name of Yahuah (LORD)* (Genesis 4:26); and the judgment Enoch foresees is the very word Jude reports him preaching: *To execute judgment upon all, and to convince all that are ungodly* (Jude 1:15).',
       sv.verse_id, ev.verse_id, 'extras', 66531
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-22-seth-mingled-with-cain',
       E'The Two Seed-Lines Mingle — Seth''s Children Fall to the Children of Cain',
       E'Here the long-guarded separation of the holy mountain breaks: *the children of Seth went astray and fell, they, their children and their wives* (2 Adam and Eve 22:3), until *not one of our fathers or of their children, remained on that holy mountain, except those three, Methuselah, Lamech, and Noah. For all the rest went down from the mountain and fell into sin with the children of Cain* (22:10). It ain''t new — this is Genesis 6 told from the mountain above: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). The mingling is the undoing of the seed-war separation that runs from the first murder: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). The restored scrolls set the same descent in the days of Jared: *who descended in the days of Yered (Jared) on the summit of Mount Hermon* (1 Enoch 6:6); and Enoch *testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men* (Jubilees 4:22). Election precedes confession; the covenant seed is kept in three men against the day of the ark.',
       sv.verse_id, ev.verse_id, 'extras', 66534
  FROM _session253_2ae22_lookup sv, _session253_2ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-22-enoch-translated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Conflict''s transporting of Enoch from the mountain to the land of life is Moses'' "he was not, for Elohim took him" told from inside the cave.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s awareness through grace that Yahuah meant to remove him (22:4) is the same testimony of pleasing Elohim before the translation.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* That Enoch was "out of the reach of death" (22:9) is the hidden, untraced abode of his own restored book.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The mansions of the righteous and Paradise of joy (22:8) is Jubilees'' Garden of Eden into which the angels conducted Enoch.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-translated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-22-enoch-celebrated-book
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The "celebrated book" of 22:2 is the very scroll Jude quotes as Scripture, the seventh from Adam prophesying.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book... And he was the first to write a testimony.* Enoch who "wrote a celebrated book" (22:2) is Jubilees'' first man to write a testimony.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep, as it will happen to the children of men throughout their generations until the day of judgment; he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* The "many wonders" that may not be told here (22:2) are the visions Jubilees says he saw and wrote down.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters.* Enoch keeping the commandment and continuing to minister in the cave (22:1) is the walk with Elohim that Genesis measures in years.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-enoch-celebrated-book'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-22-watch-over-your-souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Enoch''s foreknowledge that Elohim would bring the waters of the Flood and destroy creation (22:5) is the very sentence Yahuah speaks to Noah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-watch-over-your-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos; then began men to call upon the name of Yahuah (LORD).* To "hold fast by your fear of Elohim and by your service of Him, and worship Him in upright faith" (22:7) is the calling on the Name kept in the line of Seth — the way before the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-watch-over-your-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The destroying flood Enoch foretells (22:5) is the judgment Jude reports the same Enoch prophesying upon all the ungodly.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-watch-over-your-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-22-seth-mingled-with-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The children of Seth going down to "fall into sin with the children of Cain" (22:10) is Genesis'' sons of Elohim taking the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* That Seth''s line "went astray and fell" toward Cain''s children (22:3) is the seed of the wicked one drawing in the seed kept righteous — the seed-war from the first murder.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The descent from the holy mountain into sin (22:10) is mirrored by the Watchers'' own descent in the days of Jared in Enoch''s book.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:22 — *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all.* The same Enoch who here grieves over Seth''s children falling (22:3) is the Enoch who, in Jubilees, testifies against the defiling union of the seed-lines.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae22_lookup sv, _session253_2ae22_lookup tv
 WHERE t.slug='2-adam-eve-22-seth-mingled-with-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

