-- ----- fragment: minion_1adameve_29.sql (session253 1-adam-eve 29) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae29 (view _session253_1ae29_lookup). Sort band base 64700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-29-serpent-cursed-seed-war
  ('adam-eve-conflict', '1-adam-eve', 29, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The loud curse Elohim speaks over Satan in 1-adam-eve 29:1 is the garden-curse still in force, the serpent striking at the seed of the woman.'),
  ('adam-eve-conflict', '1-adam-eve', 29, 2, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* As Satan and his hosts flee the rebuke in 1-adam-eve 29:2, Paul names the end of that same war — the serpent bruised under the feet of the redeemed.'),
  ('adam-eve-conflict', '1-adam-eve', 29, 1, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* John names the very work Elohim begins to undo when He curses Satan in 1-adam-eve 29:1 — the devil who sins from the beginning meets the Son manifested to destroy his works.'),
  -- thread: 1-adam-eve-29-word-warns-of-the-deceiver
  ('adam-eve-conflict', '1-adam-eve', 29, 4, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that comes to Adam in 1-adam-eve 29:4 to counsel and warn him is the Logos John names — the same who was with Elohim from the beginning now walking with the first man.'),
  ('adam-eve-conflict', '1-adam-eve', 29, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The Word''s warning that Satan seeks to deceive Adam and his descendants in 1-adam-eve 29:4 unmasks the enemy''s one tactic — the false light Paul exposes.'),
  ('adam-eve-conflict', '1-adam-eve', 29, 4, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Peter''s charge to watchfulness is the practical form of the Word''s first-day warning to Adam in 1-adam-eve 29:4 — know and understand this Satan who seeks your destruction.'),
  ('adam-eve-conflict', '1-adam-eve', 29, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The Satan who seeks to deceive Adam and his seed in 1-adam-eve 29:4 is the very serpent John names as the deceiver of the whole world.'),
  -- thread: 1-adam-eve-29-michael-golden-rods-treasure
  ('adam-eve-conflict', '1-adam-eve', 29, 6, 'canon', 'jude', 1, 9, 'free', E'Jude 1:9 — *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee.* The angel Michael whom Elohim sends to fetch the golden rods in 1-adam-eve 29:6 is the same archangel Jude names contending against the devil — Yahuah''s appointed servant against the enemy of Adam''s race.'),
  ('adam-eve-conflict', '1-adam-eve', 29, 6, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The Michael sent to comfort Adam in 1-adam-eve 29:6 is the great prince Daniel sees standing for the children of the covenant — the same guardian from the first man to the last trouble.'),
  ('adam-eve-conflict', '1-adam-eve', 29, 7, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The golden rods laid up to shine in Adam''s cave-night in 1-adam-eve 29:7 are the first of the treasure kept against the Saviour''s coming — the very gold the magi at last bring to the child.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-29-serpent-cursed-seed-war',
       E'The merciful Elohim curses the serpent — the seed-war from the first day out',
       E'When Satan plots Adam''s death by his many tricks, *the merciful Elohim (God)... spoke to Satan in a loud voice, and cursed him* (1 Adam & Eve 29:1), and at the rebuke *he and his hosts fled* (29:2). This is no new quarrel — it is the curse first spoken in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The whole life of Adam outside Eden is that enmity playing out, and Yahuah keeps the seed. The apostle hears the same promise rolling forward to its end: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). And the reason the serpent is cursed and his works undone: *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). It ain''t new — the first day outside the garden is already Calvary''s eve.',
       sv.verse_id, ev.verse_id, 'extras', 64700
  FROM _session253_1ae29_lookup sv, _session253_1ae29_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=29 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-29-word-warns-of-the-deceiver',
       E'The Word warns Adam: Satan seeks to deceive you and your seed',
       E'*Then came the Word from Elohim (God) to Adam, and said to him, "Know you and understand concerning this Satan, that he seeks to deceive you and your descendants after you"* (1 Adam & Eve 29:4). The Comforter who comes is the Word — the same of whom John writes, *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and *the Word was made flesh, and dwelt among us* (John 1:14). And the warning He gives is the unchanging method of the enemy: *for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). Adam is told on day one what every saint must learn: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The deceiver of Eden is the deceiver of the whole world (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 64703
  FROM _session253_1ae29_lookup sv, _session253_1ae29_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=29 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-29-michael-golden-rods-treasure',
       E'Michael fetches the golden rods — the angel-servant and the treasure laid up',
       E'Adam begs *something from the garden, as a token to him, wherein to be comforted* (1 Adam & Eve 29:5), and in mercy *Elohim (God)... sent the angel Michael as far as the sea that reaches India, to take from there golden rods and bring them to Adam* (29:6), that they might *shine forth with light in the night around him, and put an end to his fear of the darkness* (29:7). Michael is the archangel ever sent on Yahuah''s errands and ever set for His people: *Michael the archangel, when contending with the devil he disputed about the body of Moses... said, Yahuah (Lord) rebuke thee* (Jude 1:9); *at that time shall Michael stand up, the great prince which standeth for the children of thy people* (Daniel 12:1). And this gold, laid up by Adam in the cave against the darkness, is the first of the treasure kept for the Saviour''s coming — the gold the magi bring: *they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 64706
  FROM _session253_1ae29_lookup sv, _session253_1ae29_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=29 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-29-serpent-cursed-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The loud curse Elohim speaks over Satan in 1-adam-eve 29:1 is the garden-curse still in force, the serpent striking at the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-serpent-cursed-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* As Satan and his hosts flee the rebuke in 1-adam-eve 29:2, Paul names the end of that same war — the serpent bruised under the feet of the redeemed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-serpent-cursed-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* John names the very work Elohim begins to undo when He curses Satan in 1-adam-eve 29:1 — the devil who sins from the beginning meets the Son manifested to destroy his works.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-serpent-cursed-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-29-word-warns-of-the-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that comes to Adam in 1-adam-eve 29:4 to counsel and warn him is the Logos John names — the same who was with Elohim from the beginning now walking with the first man.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-word-warns-of-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The Word''s warning that Satan seeks to deceive Adam and his descendants in 1-adam-eve 29:4 unmasks the enemy''s one tactic — the false light Paul exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-word-warns-of-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Peter''s charge to watchfulness is the practical form of the Word''s first-day warning to Adam in 1-adam-eve 29:4 — know and understand this Satan who seeks your destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-word-warns-of-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The Satan who seeks to deceive Adam and his seed in 1-adam-eve 29:4 is the very serpent John names as the deceiver of the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-word-warns-of-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-29-michael-golden-rods-treasure
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:9 — *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee.* The angel Michael whom Elohim sends to fetch the golden rods in 1-adam-eve 29:6 is the same archangel Jude names contending against the devil — Yahuah''s appointed servant against the enemy of Adam''s race.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-michael-golden-rods-treasure'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The Michael sent to comfort Adam in 1-adam-eve 29:6 is the great prince Daniel sees standing for the children of the covenant — the same guardian from the first man to the last trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-michael-golden-rods-treasure'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The golden rods laid up to shine in Adam''s cave-night in 1-adam-eve 29:7 are the first of the treasure kept against the Saviour''s coming — the very gold the magi at last bring to the child.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae29_lookup sv, _session253_1ae29_lookup tv
 WHERE t.slug='1-adam-eve-29-michael-golden-rods-treasure'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

