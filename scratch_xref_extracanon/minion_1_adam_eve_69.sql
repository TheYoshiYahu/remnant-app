-- ----- fragment: minion_1adameve_69.sql (session253 1-adam-eve 69) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch69. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae69 (view _session253_1ae69_lookup). Sort band base 65700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae69_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-69-satan-pierces-the-side
  ('adam-eve-conflict', '1-adam-eve', 69, 3, 'canon', 'john', 19, 34, 'free', E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The wound in Adam''s right side, blood and water flowing, is the foreshadow of the pierced side of the Messiah at Golgotha.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 1, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan "appeared in the form of a man" to come near the altar — the same disguise by which he assaults the seed throughout this book.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 3, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The hater of all good hastening to pierce Adam at prayer is this prowling adversary seeking to devour.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The same old serpent, envious of Adam''s favour with Elohim, is the deceiver cast down to make war on the woman''s seed.'),
  -- thread: 1-adam-eve-69-thus-will-it-happen-to-me
  ('adam-eve-conflict', '1-adam-eve', 69, 6, 'canon', 'john', 19, 34, 'free', E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The Word''s words "I shall be pierced and blood and water shall flow from My side" are fulfilled to the letter at the cross.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 6, 'canon', '1-john', 5, 6, 'free', E'1 John 5:6 — *This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth.* The blood-and-water testimony promised to Adam is the witness John names of the Messiah.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 6, 'canon', 'zechariah', 12, 10, 'free', E'Zechariah 12:10 — *And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him...* The One who says "I shall be pierced" to Adam is the very Yahuah whom they look upon, pierced.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 5, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* As the Word raises and heals the wounded Adam, so His own wounding becomes the healing of the many.'),
  -- thread: 1-adam-eve-69-the-word-the-true-offering
  ('adam-eve-conflict', '1-adam-eve', 69, 5, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" Elohim sends to raise Adam is this same Word who was in the beginning, Himself Elohim.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 6, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* "Thus will it also happen to Me, on the earth" is the Word foretelling His own incarnation, made flesh to be the true offering.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 6, 'canon', 'hebrews', 10, 10, 'free', E'Hebrews 10:10 — *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all.* The body offered "on the altar as a perfect offering" that Adam is shown is the once-for-all offering of the Messiah''s body.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 7, 'canon', 'hebrews', 9, 22, 'free', E'Hebrews 9:22 — *And almost all things are by the law purged with blood; and without shedding of blood is no remission.* Adam''s commanded offering, finished in worship, stands in the way kept from the first altar — the shed blood that points to the perfect offering.'),
  -- thread: 1-adam-eve-69-healed-on-the-fiftieth-day
  ('adam-eve-conflict', '1-adam-eve', 69, 8, 'canon', 'leviticus', 23, 16, 'free', E'Leviticus 23:16 — *Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD).* Adam''s healing "at the end of the seven weeks... the fiftieth day" is reckoned by the very count that fixes the feast of weeks.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 8, 'canon', 'acts', 2, 1, 'free', E'Acts 2:1 — *And when the day of Pentecost was fully come, they were all with one accord in one place.* The fiftieth day on which Adam is restored is the very Pentecost on which the Spirit is poured out — the appointed time kept from the beginning.'),
  -- thread: 1-adam-eve-69-war-through-marriage-the-seed
  ('adam-eve-conflict', '1-adam-eve', 69, 11, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s war against Adam "through marriage" is the serpent''s enmity striking at the woman''s seed, the spine of the whole conflict.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 11, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The corrupt-union stratagem begun here is the same mingling that later defiles the line and brings the flood.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 11, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly...* Though Satan wages war on the seed, the promised head-crushing is certain and near.'),
  ('adam-eve-conflict', '1-adam-eve', 69, 11, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who sins "from the beginning" — warring on Adam outside the garden — is the one the Son is manifested to destroy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae69_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae69_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-69-satan-pierces-the-side',
       E'Satan pierces Adam''s side at the altar',
       E'Satan, transformed into a man, strikes the worshipping Adam at his very offering: *Then Satan hastened with the sharp iron stone he had with him, and with it pierced Adam on the right side, from which flowed blood and water, then Adam fell on the altar like a corpse. And Satan fled.* (1 Adam and Eve 69:3). It ain''t new — the adversary who later moves a soldier''s spear is the same who moved this stone: *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* (John 19:34). He works only by disguise: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14), the *roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8), *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). The blow at the altar is the serpent striking the seed from the first day outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 65700
  FROM _session253_1ae69_lookup sv, _session253_1ae69_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=69 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-69-thus-will-it-happen-to-me',
       E'The Word foretells His own pierced side, blood and water',
       E'Elohim raises the slain Adam by His Word, then turns the very wound into prophecy: *Elohim (God) said further to Adam, "Thus will it also happen to Me, on the earth, when I shall be pierced and blood and water shall flow from My side and run over My body, which is the true offering; and which shall be offered on the altar as a perfect offering."* (1 Adam and Eve 69:6). This is the cross spoken before the foundation of the world. *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* (John 19:34); *This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood.* (1 John 5:6); the prophets long foresaw *they shall look upon me whom they have pierced* (Zechariah 12:10) and *he was wounded for our transgressions, he was bruised for our iniquities... and with his stripes we are healed* (Isaiah 53:5). The first man''s wound is a sign of the last Adam''s.',
       sv.verse_id, ev.verse_id, 'extras', 65703
  FROM _session253_1ae69_lookup sv, _session253_1ae69_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=69 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-69-the-word-the-true-offering',
       E'The Word who raises Adam is the true and perfect offering',
       E'Adam falls dead, *He then sent His Word, and raised him up* (1 Adam and Eve 69:5), and that Word names Himself "the true offering... offered on the altar as a perfect offering" (1 Adam and Eve 69:6). This is the Logos by whom all things are: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1); *And the Word was made flesh, and dwelt among us* (John 1:14); the Son *being the brightness of his glory, and the express image of his person* (Hebrews 1:3). The altar of Adam looks forward to the one true sacrifice: *we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10), for *without shedding of blood is no remission* (Hebrews 9:22).',
       sv.verse_id, ev.verse_id, 'extras', 65706
  FROM _session253_1ae69_lookup sv, _session253_1ae69_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=69 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-69-healed-on-the-fiftieth-day',
       E'Healed on the fiftieth day — the seven weeks complete',
       E'*And Elohim (God) healed Adam in one day, which is the end of the seven weeks; and that is the fiftieth day.* (1 Adam and Eve 69:8). The fiftieth day, the morrow after seven sabbaths, is the count of Shavuot, the feast appointed in Torah: *seven sabbaths shall be complete* (Leviticus 23:15) until *ye shall number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD)* (Leviticus 23:16). It is this same fiftieth day on which the Spirit was poured: *And when the day of Pentecost was fully come, they were all with one accord in one place* (Acts 2:1). Adam''s healing is dated to the appointed time — the moedim are written into the first man''s days.',
       sv.verse_id, ev.verse_id, 'extras', 65709
  FROM _session253_1ae69_lookup sv, _session253_1ae69_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=69 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-69-war-through-marriage-the-seed',
       E'Satan wages war through marriage — the seed-war',
       E'The chapter closes with the adversary''s next stratagem: *But when there a multitude of beasts came all around them. It was Satan''s doing, in his wickedness; in order to wage war against Adam through marriage.* (1 Adam and Eve 69:11). This is the old enmity, the serpent striking at the seed of the woman: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Satan''s assault on the covenant line through corrupt union is the same war later seen when *the sons of Elohim (God) saw the daughters of men that they were fair* (Genesis 6:2). Yet the head-crushing is sure: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20), *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65712
  FROM _session253_1ae69_lookup sv, _session253_1ae69_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=69 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-69-satan-pierces-the-side
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The wound in Adam''s right side, blood and water flowing, is the foreshadow of the pierced side of the Messiah at Golgotha.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-satan-pierces-the-side'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan "appeared in the form of a man" to come near the altar — the same disguise by which he assaults the seed throughout this book.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-satan-pierces-the-side'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The hater of all good hastening to pierce Adam at prayer is this prowling adversary seeking to devour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-satan-pierces-the-side'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The same old serpent, envious of Adam''s favour with Elohim, is the deceiver cast down to make war on the woman''s seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-satan-pierces-the-side'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-69-thus-will-it-happen-to-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The Word''s words "I shall be pierced and blood and water shall flow from My side" are fulfilled to the letter at the cross.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-thus-will-it-happen-to-me'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 5:6 — *This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth.* The blood-and-water testimony promised to Adam is the witness John names of the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-thus-will-it-happen-to-me'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 12:10 — *And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him...* The One who says "I shall be pierced" to Adam is the very Yahuah whom they look upon, pierced.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-thus-will-it-happen-to-me'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* As the Word raises and heals the wounded Adam, so His own wounding becomes the healing of the many.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-thus-will-it-happen-to-me'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-69-the-word-the-true-offering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" Elohim sends to raise Adam is this same Word who was in the beginning, Himself Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-the-word-the-true-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* "Thus will it also happen to Me, on the earth" is the Word foretelling His own incarnation, made flesh to be the true offering.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-the-word-the-true-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 10:10 — *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all.* The body offered "on the altar as a perfect offering" that Adam is shown is the once-for-all offering of the Messiah''s body.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-the-word-the-true-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 9:22 — *And almost all things are by the law purged with blood; and without shedding of blood is no remission.* Adam''s commanded offering, finished in worship, stands in the way kept from the first altar — the shed blood that points to the perfect offering.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-the-word-the-true-offering'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-69-healed-on-the-fiftieth-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:16 — *Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD).* Adam''s healing "at the end of the seven weeks... the fiftieth day" is reckoned by the very count that fixes the feast of weeks.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-healed-on-the-fiftieth-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:1 — *And when the day of Pentecost was fully come, they were all with one accord in one place.* The fiftieth day on which Adam is restored is the very Pentecost on which the Spirit is poured out — the appointed time kept from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-healed-on-the-fiftieth-day'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-69-war-through-marriage-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s war against Adam "through marriage" is the serpent''s enmity striking at the woman''s seed, the spine of the whole conflict.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-war-through-marriage-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The corrupt-union stratagem begun here is the same mingling that later defiles the line and brings the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-war-through-marriage-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly...* Though Satan wages war on the seed, the promised head-crushing is certain and near.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-war-through-marriage-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who sins "from the beginning" — warring on Adam outside the garden — is the one the Son is manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae69_lookup sv, _session253_1ae69_lookup tv
 WHERE t.slug='1-adam-eve-69-war-through-marriage-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=69 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

