-- ----- fragment: minion_1adameve_31.sql (session253 1-adam-eve 31) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae31 (view _session253_1ae31_lookup). Sort band base 64750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-31-gold-incense-myrrh-messiah
  ('adam-eve-conflict', '1-adam-eve', 31, 2, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The very three tokens Adam kept in the cave are the gifts the kings bring to the child, exactly as 1 Adam and Eve 31:2 foretold.'),
  ('adam-eve-conflict', '1-adam-eve', 31, 2, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The promise "I will come and save you" of 1 Adam and Eve 31:2 is kept in the fulness of time, the Saviour come in the flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 31, 2, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour promised to Adam on his third day out of the garden was foreordained before the foundation of the world, matching 1 Adam and Eve 31:2.'),
  ('adam-eve-conflict', '1-adam-eve', 31, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covenant tokens of 1 Adam and Eve 31:2 are pledges of the Seed who will save, the spine of the whole seed-war.'),
  -- thread: 1-adam-eve-31-the-word-comforts-and-covenants
  ('adam-eve-conflict', '1-adam-eve', 31, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One who speaks His covenant to Adam in 1 Adam and Eve 31:1 is the eternal Word, Elohim Himself.'),
  ('adam-eve-conflict', '1-adam-eve', 31, 2, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word''s promise "I will come... in the flesh" in 1 Adam and Eve 31:2 is fulfilled when the Word is made flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 31, 1, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The same Word who upholds all things stoops to comfort and covenant with Adam in 1 Adam and Eve 31:1.'),
  -- thread: 1-adam-eve-31-three-angels-bear-the-gifts
  ('adam-eve-conflict', '1-adam-eve', 31, 5, 'enoch', '1-enoch', 40, 9, 'extras', E'1 Enoch 40:9 — *And he said unto me: ''This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.''* The same three named angels who bear Adam''s tokens in 1 Adam and Eve 31:5 stand named together among the four faces of the throne.'),
  ('adam-eve-conflict', '1-adam-eve', 31, 5, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The angels carry the gifts at Elohim''s command in 1 Adam and Eve 31:5, but the inheritance itself is the Son''s, whom they serve.'),
  -- thread: 1-adam-eve-31-three-days-in-the-heart-of-the-earth
  ('adam-eve-conflict', '1-adam-eve', 31, 11, 'canon', 'matthew', 12, 40, 'free', E'Matthew 12:40 — *For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth.* The "three days... in the heart of the earth" foretold to Adam in 1 Adam and Eve 31:11 is the very sign the Son of Adam gives for His burial and rising.'),
  ('adam-eve-conflict', '1-adam-eve', 31, 11, 'canon', 'jonah', 1, 17, 'free', E'Jonah 1:17 — *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* The three-day sign sealed into Adam''s third day in 1 Adam and Eve 31:11 is foreshadowed in Jonah''s three days in the deep.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-31-gold-incense-myrrh-messiah',
       E'Gold, incense, and myrrh — kept against the Saviour''s coming',
       E'Elohim names the three tokens and what they foretell: *For I will come and save you; and kings shall bring me when in the flesh, gold, incense and myrrh; gold as a token of My kingdom; incense as a token of My divinity; and myrrh as a token of My suffering and of My death* (1 Adam and Eve 31:2). It ain''t new — from the first days outside the garden the Saviour is promised, and the very gifts laid up in the cave are the gifts the magi will bring at His coming: *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). This is the One who comes when the appointed years are full: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20). The covenant given to Adam holds the same Seed-promise: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 64750
  FROM _session253_1ae31_lookup sv, _session253_1ae31_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=31 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-31-the-word-comforts-and-covenants',
       E'The Word of Elohim who comforts Adam and keeps covenant',
       E'It is the Word Himself who speaks to Adam, gives the tokens, and binds the covenant: *You asked Me for something from the garden, to be comforted therewith, and I have given you these three tokens as a consolation to you; that you trust in Me and in My covenant with you* (1 Adam and Eve 31:1). This is the Logos who was from the beginning: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1); *All things were made by him; and without him was not any thing made that was made* (John 1:3) — the same Word who would Himself come in the flesh: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). He upholds all things even as He stoops to comfort Adam: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high* (Hebrews 1:3).',
       sv.verse_id, ev.verse_id, 'extras', 64753
  FROM _session253_1ae31_lookup sv, _session253_1ae31_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=31 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-31-three-angels-bear-the-gifts',
       E'Michael, Gabriel, and Raphael bring the tokens',
       E'Three named messengers carry the tokens to Adam: *Then Elohim (God) commanded the three angels, Michael, Gabriel and Raphael, each to bring what he had brought, and give it to Adam. And they did so, one by one* (1 Adam and Eve 31:5). The same holy ones are named together in the watcher-tradition: *And he said unto me: ''This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.''* (1 Enoch 40:9). Raphael himself tells of the office these messengers keep: *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One* (Tobit 12:15). It ain''t new — the same angelic court attends the saints from Adam''s cave to the throne.',
       sv.verse_id, ev.verse_id, 'extras', 64756
  FROM _session253_1ae31_lookup sv, _session253_1ae31_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=31 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-31-three-days-in-the-heart-of-the-earth',
       E'Three days in the heart of the earth',
       E'The tokens are given on the third day with a hidden sign written in: *Elohim (God) gave these three things to Adam on the third day after he had come out of the garden, in token of the three days Yahuah (Lord) should remain in the heart of the earth* (1 Adam and Eve 31:11). This is the very sign the Saviour Himself would name: *For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40), prefigured in the prophet: *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17). It ain''t new — the three days of the grave are sealed into the third day of Adam''s mercy outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 64759
  FROM _session253_1ae31_lookup sv, _session253_1ae31_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=31 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-31-gold-incense-myrrh-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The very three tokens Adam kept in the cave are the gifts the kings bring to the child, exactly as 1 Adam and Eve 31:2 foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-gold-incense-myrrh-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The promise "I will come and save you" of 1 Adam and Eve 31:2 is kept in the fulness of time, the Saviour come in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-gold-incense-myrrh-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour promised to Adam on his third day out of the garden was foreordained before the foundation of the world, matching 1 Adam and Eve 31:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-gold-incense-myrrh-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covenant tokens of 1 Adam and Eve 31:2 are pledges of the Seed who will save, the spine of the whole seed-war.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-gold-incense-myrrh-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-31-the-word-comforts-and-covenants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The One who speaks His covenant to Adam in 1 Adam and Eve 31:1 is the eternal Word, Elohim Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-the-word-comforts-and-covenants'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word''s promise "I will come... in the flesh" in 1 Adam and Eve 31:2 is fulfilled when the Word is made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-the-word-comforts-and-covenants'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The same Word who upholds all things stoops to comfort and covenant with Adam in 1 Adam and Eve 31:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-the-word-comforts-and-covenants'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-31-three-angels-bear-the-gifts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 40:9 — *And he said unto me: ''This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.''* The same three named angels who bear Adam''s tokens in 1 Adam and Eve 31:5 stand named together among the four faces of the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-three-angels-bear-the-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The angels carry the gifts at Elohim''s command in 1 Adam and Eve 31:5, but the inheritance itself is the Son''s, whom they serve.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-three-angels-bear-the-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-31-three-days-in-the-heart-of-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:40 — *For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth.* The "three days... in the heart of the earth" foretold to Adam in 1 Adam and Eve 31:11 is the very sign the Son of Adam gives for His burial and rising.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-three-days-in-the-heart-of-the-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 1:17 — *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* The three-day sign sealed into Adam''s third day in 1 Adam and Eve 31:11 is foreshadowed in Jonah''s three days in the deep.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae31_lookup sv, _session253_1ae31_lookup tv
 WHERE t.slug='1-adam-eve-31-three-days-in-the-heart-of-the-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=31 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

