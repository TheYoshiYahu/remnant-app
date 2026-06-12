-- ----- fragment: minion_1adameve_06.sql (session253 1-adam-eve 6) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae6 (view _session253_1ae6_lookup). Sort band base 64125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-6-word-raises-them
  ('adam-eve-conflict', '1-adam-eve', 6, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Yahuah sends to raise Adam and Eve in 1 Adam and Eve 6:3 is the Logos who was with Elohim and was Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 3, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word by whom all was made is the One sent to stand the fallen pair upright in 1 Adam and Eve 6:3.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 2, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word who decides to raise and comfort them in 1 Adam and Eve 6:2 is the Son who would in time be sent forth, made of the very woman whose seed He came to save.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 3, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word sent in 1 Adam and Eve 6:3 is He who upholds all things by the word of His power and would purge sin Himself.'),
  -- thread: 1-adam-eve-6-desire-for-divinity
  ('adam-eve-conflict', '1-adam-eve', 6, 5, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The desire for divinity Yahuah names in 1 Adam and Eve 6:5 is the very bait the serpent laid in the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 5, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The free-will transgression confessed in 1 Adam and Eve 6:5 is the eating Genesis records.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 4, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The coming-out of the garden Yahuah recalls in 1 Adam and Eve 6:4 is the sending-forth Genesis pronounces.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 6, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The commandment Yahuah says they should have kept in 1 Adam and Eve 6:6 is the single prohibition spoken in the garden.'),
  -- thread: 1-adam-eve-6-satan-hurled-down
  ('adam-eve-conflict', '1-adam-eve', 6, 7, 'canon', 'isaiah', 14, 14, 'free', E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The Satan who *sought the Godhead for himself* in 1 Adam and Eve 6:7 speaks the very ambition Isaiah puts in the mouth of the fallen one.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 7, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The hurling-down from heaven that Yahuah recounts in 1 Adam and Eve 6:7 is what Messiah testifies He Himself beheld.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 7, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Satan, who *could not remain in his first estate* in 1 Adam and Eve 6:7, leads the angels Jude says kept not their first estate.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 7, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The deceiver who *made the tree appear pleasant in your eyes* in 1 Adam and Eve 6:7 is the old serpent cast down who deceives the whole world.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 7, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Satan who deceived them *by believing his words* in 1 Adam and Eve 6:7 is the liar and father of lies, a murderer from the beginning.'),
  -- thread: 1-adam-eve-6-mercy-until-they-repent
  ('adam-eve-conflict', '1-adam-eve', 6, 9, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The Creator who *did not intend to destroy them* in 1 Adam and Eve 6:9 is the One who set the seed-promise that crushes the serpent''s head.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 9, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The mercy that punishes unto repentance in 1 Adam and Eve 6:9 looks to the day the Elohim of peace bruises Satan under His people''s feet.'),
  ('adam-eve-conflict', '1-adam-eve', 6, 10, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Against the curse held over the hardened in 1 Adam and Eve 6:10 stands the Son manifested to destroy the works of the devil.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-6-word-raises-them',
       E'He sent His Word to raise them',
       E'Outside the garden, grief has driven the first parents to the edge of death, and Yahuah will not let the seed of the woman perish: *But Elohim (God) looked at them; for they had killed themselves through great grief. But He decided to raise them and comfort them. He, therefore, sent His Word to them; that they should stand and be raised immediately* (1 Adam and Eve 6:1-3). The Comforter who comes is no created messenger but the Word Himself — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1) — *All things were made by him; and without him was not any thing made that was made* (John 1:3). It ain''t new: the same Word who formed Adam of the dust now stoops to raise him, and in the fulness of time will Himself be *made of a woman* — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the *brightness of his glory* who upholds all things by His word (Hebrews 1:3). Mercy keeps the seed from the very first day.',
       sv.verse_id, ev.verse_id, 'extras', 64125
  FROM _session253_1ae6_lookup sv, _session253_1ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-6-desire-for-divinity',
       E'Of your own free will, through desire for divinity',
       E'Yahuah names the wound exactly as Genesis told it: *Of your own free will have you transgressed through your desire for divinity, greatness, and an exalted state, such as I have; so that I deprived you of the bright nature in which you then were, and I made you come out of the garden to this land, rough and full of trouble* (1 Adam and Eve 6:5). This is the serpent''s lie unfolded — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil* (Genesis 3:5) — and the desire it kindled — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat* (Genesis 3:6). The exile that follows is Genesis 3''s own sentence: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23). The reach for divinity, and the loss of the bright nature — it ain''t new; it is the first chapter of the seed-war.',
       sv.verse_id, ev.verse_id, 'extras', 64128
  FROM _session253_1ae6_lookup sv, _session253_1ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-6-satan-hurled-down',
       E'He sought the Godhead for himself, and I hurled him down',
       E'Now Yahuah unmasks the hand behind the tree: *But the wicked Satan did not keep his faith and had no good intent towards Me... he considered Me to be useless, and sought the Godhead for himself; for this I hurled him down from heaven so that he could not remain in his first estate--it was he who made the tree appear pleasant in your eyes, until you ate of it, by believing his words* (1 Adam and Eve 6:7). The grasping for Godhead is Isaiah''s taunt over the fallen one — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14) — and the hurling-down is what Messiah Himself beheld: *And he said unto them, I beheld Satan as lightning fall from heaven* (Luke 10:18). The angels who *kept not their first estate* are reserved in chains — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6) — and this same deceiver, *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9), is the liar who made the tree appear pleasant. It ain''t new: the murderer and father of lies was at his work from the first day.',
       sv.verse_id, ev.verse_id, 'extras', 64131
  FROM _session253_1ae6_lookup sv, _session253_1ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-6-mercy-until-they-repent',
       E'I punished them until they repent',
       E'Yahuah closes by declaring His own heart toward the seed He made: *For I am Elohim (God) the Creator, who, when I created My creatures, did not intend to destroy them. But after they had sorely roused My anger, I punished them with grievous plagues, until they repent. But, if on the contrary, they still continue hardened in their transgression, they shall be under a curse forever* (1 Adam and Eve 6:9-10). This is the bruising-of-the-serpent mercy promised in the garden — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — the very head Yahuah will crush under the feet of His people: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). The Son was *manifested, that he might destroy the works of the devil* (1 John 3:8). The chastening that aims at repentance, not destruction — it ain''t new; it is covenant mercy keeping the seed from the first day outside Eden.',
       sv.verse_id, ev.verse_id, 'extras', 64134
  FROM _session253_1ae6_lookup sv, _session253_1ae6_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-6-word-raises-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Yahuah sends to raise Adam and Eve in 1 Adam and Eve 6:3 is the Logos who was with Elohim and was Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word by whom all was made is the One sent to stand the fallen pair upright in 1 Adam and Eve 6:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word who decides to raise and comfort them in 1 Adam and Eve 6:2 is the Son who would in time be sent forth, made of the very woman whose seed He came to save.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Word sent in 1 Adam and Eve 6:3 is He who upholds all things by the word of His power and would purge sin Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-word-raises-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-6-desire-for-divinity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The desire for divinity Yahuah names in 1 Adam and Eve 6:5 is the very bait the serpent laid in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-desire-for-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The free-will transgression confessed in 1 Adam and Eve 6:5 is the eating Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-desire-for-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* The coming-out of the garden Yahuah recalls in 1 Adam and Eve 6:4 is the sending-forth Genesis pronounces.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-desire-for-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The commandment Yahuah says they should have kept in 1 Adam and Eve 6:6 is the single prohibition spoken in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-desire-for-divinity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-6-satan-hurled-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The Satan who *sought the Godhead for himself* in 1 Adam and Eve 6:7 speaks the very ambition Isaiah puts in the mouth of the fallen one.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-satan-hurled-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The hurling-down from heaven that Yahuah recounts in 1 Adam and Eve 6:7 is what Messiah testifies He Himself beheld.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-satan-hurled-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Satan, who *could not remain in his first estate* in 1 Adam and Eve 6:7, leads the angels Jude says kept not their first estate.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-satan-hurled-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The deceiver who *made the tree appear pleasant in your eyes* in 1 Adam and Eve 6:7 is the old serpent cast down who deceives the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-satan-hurled-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Satan who deceived them *by believing his words* in 1 Adam and Eve 6:7 is the liar and father of lies, a murderer from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-satan-hurled-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-6-mercy-until-they-repent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The Creator who *did not intend to destroy them* in 1 Adam and Eve 6:9 is the One who set the seed-promise that crushes the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-mercy-until-they-repent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The mercy that punishes unto repentance in 1 Adam and Eve 6:9 looks to the day the Elohim of peace bruises Satan under His people''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-mercy-until-they-repent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Against the curse held over the hardened in 1 Adam and Eve 6:10 stands the Son manifested to destroy the works of the devil.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae6_lookup sv, _session253_1ae6_lookup tv
 WHERE t.slug='1-adam-eve-6-mercy-until-they-repent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

