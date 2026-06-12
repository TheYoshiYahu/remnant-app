-- ----- fragment: minion_1adameve_55.sql (session253 1-adam-eve 55) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch55. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae55 (view _session253_1ae55_lookup). Sort band base 65350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae55_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-55-word-covenant-promise
  ('adam-eve-conflict', '1-adam-eve', 55, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes to Adam in 1 Adam & Eve 55:1 is the same Logos who was God before the beginning of the world.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 1, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who raises Adam from his dead state is the One who will Himself take flesh to fulfil the covenant He names in 55:1.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 1, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Word who lifts Adam upholds all things and will Himself purge the sin that struck him down.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 1, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The covenant Adam must wait to see *fulfilled* (55:1) arrives only in the fulness of time, the long-promised coming of the Saviour.'),
  -- thread: 1-adam-eve-55-satan-deceiver-renounced-glory
  ('adam-eve-conflict', '1-adam-eve', 55, 9, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The very lie of *a divine nature* Satan sold his hosts in 55:9 is the lie he carried down to Eve.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 9, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver who beguiled his hosts with vain promises (55:9-10) is the liar from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 10, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The hosts *believed that his word was true* (55:10) because his deceit wears the disguise of light.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 11, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The hosts who yielded and *renounced the glory of Elohim* (55:10-11) are the angels who left their first estate and are kept for judgment.'),
  -- thread: 1-adam-eve-55-war-in-heaven-cast-down
  ('adam-eve-conflict', '1-adam-eve', 55, 12, 'canon', 'revelation', 12, 7, 'free', E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels.* The angels'' account of being unable to prevail but by Elohim''s strength (55:12) is John''s war in heaven told from inside the host.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 13, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The fall from among the angels and the joy of heaven (55:13) is the casting down of the old serpent to the earth.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 13, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* Yahusha witnesses the very fall the angels describe to Adam in 55:12-13.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 14, 'canon', 'isaiah', 14, 12, 'free', E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The one driven down to *this dark earth* who *had become darkness itself* (55:14) is the fallen son of the morning.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 14, 'canon', 'ezekiel', 28, 15, 'free', E'Ezekiel 28:15 — *Thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee.* He who *became darkness itself and a worker of unrighteousness* (55:14) was created perfect until iniquity was found in him.'),
  -- thread: 1-adam-eve-55-mercy-keeps-the-seed
  ('adam-eve-conflict', '1-adam-eve', 55, 15, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s continued war against Adam (55:15) is the enmity decreed in the garden — the seed-war shown from the first day outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 15, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The adversary who *has continued ... to make war against you* (55:15) is the roaring lion who never ceases his hunt.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 16, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The mercy that bears with Adam *until the fulfillment of the promise* (55:16) ends in Satan bruised under the feet of the seed.'),
  ('adam-eve-conflict', '1-adam-eve', 55, 16, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The promise Adam is helped to await (55:16) is the manifesting of the Son to destroy the works of the very Satan warring against him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae55_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae55_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-55-word-covenant-promise',
       E'The Word of Elohim raises Adam and names the covenant',
       E'When Adam and Eve fall as dead before the garden, it is not an angel but the Logos Himself who lifts them: *Then came the Word of Elohim (God) to Adam and Eve, and raised them from their dead state, saying to them, "Why did you come up here? ... It cannot be today; but only when the covenant I have made with you is fulfilled."* (1 Adam & Eve 55:1). This is the One John names: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and *the Word was made flesh, and dwelt among us* (John 1:14) — the Voice that walked Eden in the cool of the day. He is *the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3), and the covenant He withholds until it is *fulfilled* waits its hour: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). It ain''t new — the seed-promise of Eden is already spoken over Adam on his first day outside the gate.',
       sv.verse_id, ev.verse_id, 'extras', 65350
  FROM _session253_1ae55_lookup sv, _session253_1ae55_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=55 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-55-satan-deceiver-renounced-glory',
       E'Satan gathered his hosts and deceived them with a vain promise',
       E'The faithful angels open to Adam the oldest record of the war: *He gathered together his hosts, and deceived them, promising to give them a great kingdom, a divine nature ... His hosts believed that his word was true, so they yielded to him, and renounced the glory of Elohim (God)* (1 Adam & Eve 55:9-10). The same lie he sold the angels he sold to Eve — *ye shall be as gods* (Genesis 3:5). He is the original deceiver of whom Yahusha said, *He was a murderer from the beginning, and abode not in the truth ... for he is a liar, and the father of it* (John 8:44), and to this day his craft is disguise: *Satan himself is transformed into an angel of light* (2 Corinthians 11:14). Those hosts who *renounced the glory of Elohim* are the angels of whom Jude warns — *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). It ain''t new: the lie told outside the garden was already old in heaven.',
       sv.verse_id, ev.verse_id, 'extras', 65353
  FROM _session253_1ae55_lookup sv, _session253_1ae55_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=55 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-55-war-in-heaven-cast-down',
       E'The war in heaven and the casting down of Satan',
       E'The angels tell Adam how the rebellion was broken: *Then after he had fought with Elohim (God) ... he gathered together his hosts, and made war with us ... we could not have prevailed against him to hurl him from heaven. But when he fell from among us, there was great joy in heaven ... But Elohim (God) in His mercy, drove him from among us to this dark earth; for he had become darkness itself* (1 Adam & Eve 55:12-14). This is John''s vision opened backward: *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels* (Revelation 12:7), *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). Yahusha saw it: *I beheld Satan as lightning fall from heaven* (Luke 10:18). And the prophets sang his fall before either: *How art thou fallen from heaven, O Lucifer, son of the morning!* (Isaiah 14:12) — *thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee* (Ezekiel 28:15). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 65356
  FROM _session253_1ae55_lookup sv, _session253_1ae55_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=55 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-55-mercy-keeps-the-seed',
       E'Yahuah''s mercy keeps Adam until the promise',
       E'Satan''s war does not cease at the gate of Eden — it follows the seed: *And he has continued, O Adam, to make war against you, until he tricked you and made you come out of the garden ... because you obeyed him, and trespassed against Elohim (God)* (1 Adam & Eve 55:15). But the angels plead, and mercy holds the line: *and asked Him not to destroy Adam this time ... but to bear with him until the fulfillment of the promise; and to help him in this world until he was free from Satan''s hand* (1 Adam & Eve 55:16). This is the enmity first decreed in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The same bruising is pledged to the saints: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20), for *the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The promise Adam waits on IS the seed who crushes the serpent''s head. It ain''t new — the seed-war and the seed-mercy open on the first day outside Eden.',
       sv.verse_id, ev.verse_id, 'extras', 65359
  FROM _session253_1ae55_lookup sv, _session253_1ae55_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=55 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-55-word-covenant-promise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes to Adam in 1 Adam & Eve 55:1 is the same Logos who was God before the beginning of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-word-covenant-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who raises Adam from his dead state is the One who will Himself take flesh to fulfil the covenant He names in 55:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-word-covenant-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Word who lifts Adam upholds all things and will Himself purge the sin that struck him down.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-word-covenant-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The covenant Adam must wait to see *fulfilled* (55:1) arrives only in the fulness of time, the long-promised coming of the Saviour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-word-covenant-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-55-satan-deceiver-renounced-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The very lie of *a divine nature* Satan sold his hosts in 55:9 is the lie he carried down to Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-satan-deceiver-renounced-glory'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver who beguiled his hosts with vain promises (55:9-10) is the liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-satan-deceiver-renounced-glory'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The hosts *believed that his word was true* (55:10) because his deceit wears the disguise of light.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-satan-deceiver-renounced-glory'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The hosts who yielded and *renounced the glory of Elohim* (55:10-11) are the angels who left their first estate and are kept for judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-satan-deceiver-renounced-glory'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-55-war-in-heaven-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels.* The angels'' account of being unable to prevail but by Elohim''s strength (55:12) is John''s war in heaven told from inside the host.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-war-in-heaven-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The fall from among the angels and the joy of heaven (55:13) is the casting down of the old serpent to the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-war-in-heaven-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* Yahusha witnesses the very fall the angels describe to Adam in 55:12-13.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-war-in-heaven-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The one driven down to *this dark earth* who *had become darkness itself* (55:14) is the fallen son of the morning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-war-in-heaven-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 28:15 — *Thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee.* He who *became darkness itself and a worker of unrighteousness* (55:14) was created perfect until iniquity was found in him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-war-in-heaven-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-55-mercy-keeps-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s continued war against Adam (55:15) is the enmity decreed in the garden — the seed-war shown from the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-mercy-keeps-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The adversary who *has continued ... to make war against you* (55:15) is the roaring lion who never ceases his hunt.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-mercy-keeps-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The mercy that bears with Adam *until the fulfillment of the promise* (55:16) ends in Satan bruised under the feet of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-mercy-keeps-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The promise Adam is helped to await (55:16) is the manifesting of the Son to destroy the works of the very Satan warring against him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae55_lookup sv, _session253_1ae55_lookup tv
 WHERE t.slug='1-adam-eve-55-mercy-keeps-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=55 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

