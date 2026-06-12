-- ----- fragment: minion_1adameve_68.sql (session253 1-adam-eve 68) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch68. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae68 (view _session253_1ae68_lookup). Sort band base 65675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae68_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-68-word-raises-from-death
  ('adam-eve-conflict', '1-adam-eve', 68, 2, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who raises Adam and Eve from death in 1-adam-eve 68:2 is the same Logos who was with Elohim in the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 2, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who restores life in 1-adam-eve 68:2 is the Maker of all, able to raise what He first formed.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Yahuah unmasks Satan''s trickery in 1-adam-eve 68:5 with the very charge the Messiah lays against him — a liar from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 5, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The false promises exposed in 1-adam-eve 68:5 are the deceiver''s trade, the same transforming guile Paul warns of.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 5, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s assault on Adam in 1-adam-eve 68:5 is the serpent striking at the seed of the woman; the enmity of Eden is already at work.'),
  -- thread: 1-adam-eve-68-offering-made-his-flesh
  ('adam-eve-conflict', '1-adam-eve', 68, 12, 'canon', 'john', 6, 51, 'free', E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The Word''s promise to make the offering His flesh in 1-adam-eve 68:12 is the living bread He proclaims in the flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 12, 'canon', 'matthew', 26, 26, 'free', E'Matthew 26:26 — *And as they were eating, Yahusha (Jesus) took bread, and blessed it, and brake it, and gave it to the disciples, and said, Take, eat; this is my body.* The offering ''made His flesh'' in 1-adam-eve 68:12 is fulfilled when the Messiah breaks bread and names it His body.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 12, 'canon', 'hebrews', 10, 10, 'free', E'Hebrews 10:10 — *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all.* The ''forgiveness and mercy'' through the offered flesh in 1-adam-eve 68:12 is the one sufficient offering of the body of the Messiah.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 8, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The solid manna Adam and Eve find in 1-adam-eve 68:8 prefigures the bread from heaven Yahuah rains on Yashar''el in the wilderness.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 8, 'canon', 'exodus', 16, 31, 'free', E'Exodus 16:31 — *And the house of Yashar''el (Israel) called the name thereof Manna: and it was like coriander seed, white; and the taste of it was like wafers made with honey.* The manna on the tree in 1-adam-eve 68:8 bears the same heaven-given name later called Manna by the house of Yashar''el.'),
  -- thread: 1-adam-eve-68-appointed-days-passion-resurrection
  ('adam-eve-conflict', '1-adam-eve', 68, 22, 'canon', 'john', 19, 14, 'free', E'John 19:14 — *And it was the preparation of the passover, and about the sixth hour: and he saith unto the Yahudim (Jews), Behold your King!* The ''preparation day Friday'' of suffering foretold in 1-adam-eve 68:22 is the very preparation on which the King is delivered up.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 22, 'canon', 'john', 19, 31, 'free', E'John 19:31 — *The Yahudim (Jews) therefore, because it was the preparation, that the bodies should not remain upon the cross on the sabbath day, (for that sabbath day was an high day,) besought Pilate that their legs might be broken, and that they might be taken away.* The preparation-day suffering and the sabbath of 1-adam-eve 68:22 align exactly with the cross and the high sabbath.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 23, 'canon', 'mark', 16, 9, 'free', E'Mark 16:9 — *Now when Yahusha (Jesus) was risen early the first day of the week, he appeared first to Mary Magdalene, out of whom he had cast seven devils.* The Word''s promise to ''create joy'' by rising on the first day in 1-adam-eve 68:23 is fulfilled when the Messiah rises early on the first day of the week.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 22, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word who says He will be ''made flesh'' to suffer in 1-adam-eve 68:22 comes in the fulness of time, sent forth and made of a woman.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 22, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The sufferings determined ''beforehand'' on Adam''s days in 1-adam-eve 68:22 belong to the Lamb foreordained before the foundation of the world.'),
  -- thread: 1-adam-eve-68-offering-mercy-name
  ('adam-eve-conflict', '1-adam-eve', 68, 10, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Adam''s offering on the mountain in 1-adam-eve 68:10 is the same accepted way of approach his son Abel keeps.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 11, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The prayer and plea for mercy in 1-adam-eve 68:11 is the calling on the Name that the seed of Seth carries forward.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 10, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake...* The offering Adam raises on the altar in 1-adam-eve 68:10 is the sweet savour Yahuah receives, as later from Noah after the flood.'),
  ('adam-eve-conflict', '1-adam-eve', 68, 10, 'jubilees', 'jubilees', 3, 27, 'extras', E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* The primeval altar-offering of 1-adam-eve 68:10 is the same scene Jubilees records — Adam offering a sweet savour outside the garden.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae68_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae68_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-68-word-raises-from-death',
       E'The Word raises Adam from death and unmasks the deceiver',
       E'Satan has worked his ruin, but the Logos answers him: *Elohim (God), therefore, sent His Word, and raised up Adam and Eve from their state of death.* (1-adam-eve 68:2) — the same Word *In the beginning... and the Word was Elohim (God)* (John 1:1), *All things were made by him; and without him was not any thing made that was made* (John 1:3). When Adam pleads, the Word names the true hand behind the burnt corn and the spilled water: *But it is Satan, your master who did it... and all the promises he has made you were just a trick, a deception, and a lie* (1-adam-eve 68:5) — for Yahusha said of him, *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him... for he is a liar, and the father of it* (John 8:44), and Satan *himself is transformed into an angel of light* (2 Corinthians 11:14). It ain''t new: from the first day outside the garden the serpent strikes at the seed, yet Yahuah keeps it — *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 65675
  FROM _session253_1ae68_lookup sv, _session253_1ae68_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=68 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-68-offering-made-his-flesh',
       E'The offering He will make His flesh — the manna and the altar bread',
       E'Over Adam''s offering of corn the Word speaks the gospel before the garden gate is cold: *I shall make it My flesh, when I come down on earth to save you; and I shall cause it to be offered continually on an altar, for forgiveness and for mercy, for those who partake of it duly* (1-adam-eve 68:12). This is the bread of the upper room — *Take, eat; this is my body* (Matthew 26:26) — and the living bread foretold: *I am the living bread which came down from heaven... and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). On the field they find *solid manna* (1-adam-eve 68:8), as Yahuah once *raine[d] bread from heaven* (Exodus 16:4) and the house of Yashar''el *called the name thereof Manna* (Exodus 16:31); and the offering *continually on an altar* answers the one offering by which *we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10). Adam''s altar-fire, kept burning, is the figure long before Sinai — *The fire shall ever be burning upon the altar; it shall never go out* (Leviticus 6:13).',
       sv.verse_id, ev.verse_id, 'extras', 65678
  FROM _session253_1ae68_lookup sv, _session253_1ae68_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=68 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-68-appointed-days-passion-resurrection',
       E'Adam''s appointed days foretell the Passion and the rising',
       E'Adam resolves to bring the offering *three times every week, on the fourth day Wednesday, on the preparation day Friday, and on the Sabbath* (1-adam-eve 68:20), and the Word turns his choice into prophecy: *you have determined beforehand the days in which sufferings shall come over Me, when I am made flesh; for they are the fourth Wednesday, and the preparation day Friday* (1-adam-eve 68:22). So it came — *it was the preparation of the passover... Behold your King!* (John 19:14); *because it was the preparation, that the bodies should not remain upon the cross on the sabbath day* (John 19:31). Then the Word names the first day for joy: *through My rising again on this day, will I create joy, and raise them on high, who believe in Me* (1-adam-eve 68:23) — *when Yahusha (Jesus) was risen early the first day of the week* (Mark 16:9). The flesh in which He suffers comes *when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman* (Galatians 4:4), the Lamb *foreordained before the foundation of the world* (1 Peter 1:20).',
       sv.verse_id, ev.verse_id, 'extras', 65681
  FROM _session253_1ae68_lookup sv, _session253_1ae68_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=20
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=68 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-68-offering-mercy-name',
       E'The offering of Adam and the calling on the Name',
       E'Restored, Adam and Eve build no new way but keep the old one: they *took of the corn, and made of it an offering... on the mountain, the place where they had offered up their first offering of blood* (1-adam-eve 68:10), pleading *accept this offering from us, and don''t turn us away, deprived of Your mercy* (1-adam-eve 68:11). This is the way kept before Sinai — Abel who *brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4); the day *men [began] to call upon the name of Yahuah (LORD)* (Genesis 4:26); and Noah who *builded an altar unto Yahuah (LORD)... and offered burnt offerings* so that *Yahuah (LORD) smelled a sweet savour* (Genesis 8:20-21). The witness is one: Jubilees keeps the same scene — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun* (Jubilees 3:27). Adam offers in hope, not law-as-curse, against the day of the Saviour.',
       sv.verse_id, ev.verse_id, 'extras', 65684
  FROM _session253_1ae68_lookup sv, _session253_1ae68_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=68 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-68-word-raises-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who raises Adam and Eve from death in 1-adam-eve 68:2 is the same Logos who was with Elohim in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-word-raises-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who restores life in 1-adam-eve 68:2 is the Maker of all, able to raise what He first formed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-word-raises-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Yahuah unmasks Satan''s trickery in 1-adam-eve 68:5 with the very charge the Messiah lays against him — a liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-word-raises-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The false promises exposed in 1-adam-eve 68:5 are the deceiver''s trade, the same transforming guile Paul warns of.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-word-raises-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s assault on Adam in 1-adam-eve 68:5 is the serpent striking at the seed of the woman; the enmity of Eden is already at work.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-word-raises-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-68-offering-made-his-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The Word''s promise to make the offering His flesh in 1-adam-eve 68:12 is the living bread He proclaims in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-made-his-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 26:26 — *And as they were eating, Yahusha (Jesus) took bread, and blessed it, and brake it, and gave it to the disciples, and said, Take, eat; this is my body.* The offering ''made His flesh'' in 1-adam-eve 68:12 is fulfilled when the Messiah breaks bread and names it His body.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-made-his-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 10:10 — *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all.* The ''forgiveness and mercy'' through the offered flesh in 1-adam-eve 68:12 is the one sufficient offering of the body of the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-made-his-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The solid manna Adam and Eve find in 1-adam-eve 68:8 prefigures the bread from heaven Yahuah rains on Yashar''el in the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-made-his-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 16:31 — *And the house of Yashar''el (Israel) called the name thereof Manna: and it was like coriander seed, white; and the taste of it was like wafers made with honey.* The manna on the tree in 1-adam-eve 68:8 bears the same heaven-given name later called Manna by the house of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-made-his-flesh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-68-appointed-days-passion-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 19:14 — *And it was the preparation of the passover, and about the sixth hour: and he saith unto the Yahudim (Jews), Behold your King!* The ''preparation day Friday'' of suffering foretold in 1-adam-eve 68:22 is the very preparation on which the King is delivered up.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-appointed-days-passion-resurrection'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 19:31 — *The Yahudim (Jews) therefore, because it was the preparation, that the bodies should not remain upon the cross on the sabbath day, (for that sabbath day was an high day,) besought Pilate that their legs might be broken, and that they might be taken away.* The preparation-day suffering and the sabbath of 1-adam-eve 68:22 align exactly with the cross and the high sabbath.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-appointed-days-passion-resurrection'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 16:9 — *Now when Yahusha (Jesus) was risen early the first day of the week, he appeared first to Mary Magdalene, out of whom he had cast seven devils.* The Word''s promise to ''create joy'' by rising on the first day in 1-adam-eve 68:23 is fulfilled when the Messiah rises early on the first day of the week.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-appointed-days-passion-resurrection'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word who says He will be ''made flesh'' to suffer in 1-adam-eve 68:22 comes in the fulness of time, sent forth and made of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-appointed-days-passion-resurrection'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The sufferings determined ''beforehand'' on Adam''s days in 1-adam-eve 68:22 belong to the Lamb foreordained before the foundation of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-appointed-days-passion-resurrection'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-68-offering-mercy-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Adam''s offering on the mountain in 1-adam-eve 68:10 is the same accepted way of approach his son Abel keeps.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-mercy-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The prayer and plea for mercy in 1-adam-eve 68:11 is the calling on the Name that the seed of Seth carries forward.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-mercy-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake...* The offering Adam raises on the altar in 1-adam-eve 68:10 is the sweet savour Yahuah receives, as later from Noah after the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-mercy-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* The primeval altar-offering of 1-adam-eve 68:10 is the same scene Jubilees records — Adam offering a sweet savour outside the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae68_lookup sv, _session253_1ae68_lookup tv
 WHERE t.slug='1-adam-eve-68-offering-mercy-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=68 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

