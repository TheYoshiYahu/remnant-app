-- ----- fragment: minion_1adameve_70.sql (session253 1-adam-eve 70) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch70. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae70 (view _session253_1ae70_lookup). Sort band base 65725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae70_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-70-satan-angel-of-light
  ('adam-eve-conflict', '1-adam-eve', 70, 1, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very disguise Sha''ul names is the one Satan wears in 1 Adam and Eve 70:1, counterfeiting the angels of the gifts.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 2, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The fair words full of deceit of 1 Adam and Eve 70:2 are the same subtilty that beguiled Eve in the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hater of all good who takes the angel''s form in 1 Adam and Eve 70:1 is that old serpent who deceiveth the whole world.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Kepha bids the watchfulness Adam lacked when he welcomed the smiling adversary of 1 Adam and Eve 70:2.'),
  -- thread: 1-adam-eve-70-counterfeit-gifts
  ('adam-eve-conflict', '1-adam-eve', 70, 9, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The very treasures Satan boasts of in 1 Adam and Eve 70:9 are the gifts kept against the Messiah''s coming and offered at His cradle.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 3, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Adam''s gladness at the counterfeit angels of 1 Adam and Eve 70:3 is mercy abused by the liar who was a murderer from the beginning.'),
  -- thread: 1-adam-eve-70-false-word-of-elohim
  ('adam-eve-conflict', '1-adam-eve', 70, 6, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent''s twisting of the divine word in the garden is the same false ''Word of Elohim'' pressed on Adam in 1 Adam and Eve 70:6.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 6, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The bold contradiction of Yahuah''s command is the deceiver''s craft, now repackaged as a message from Elohim in 1 Adam and Eve 70:6.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 11, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil... When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Adam''s belief of the lying messengers in 1 Adam and Eve 70:11 is faith placed in the father of lies who forges the very Word of Elohim.'),
  -- thread: 1-adam-eve-70-the-oath-trap
  ('adam-eve-conflict', '1-adam-eve', 70, 12, 'canon', 'matthew', 5, 34, 'free', E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne.* The Messiah''s word forbids the very oath Satan extorts from Adam in 1 Adam and Eve 70:12.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 15, 'canon', 'matthew', 5, 37, 'free', E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* Adam''s elaborate sworn vow in 1 Adam and Eve 70:15 is the ''more than these'' that cometh of evil — and the evil one is its author.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 16, 'canon', 'james', 5, 12, 'free', E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* That Adam swore thus in 1 Adam and Eve 70:16 is the snare Ya''aqob warns ends in condemnation.'),
  ('adam-eve-conflict', '1-adam-eve', 70, 12, 'canon', '2-corinthians', 11, 13, 'free', E'2 Corinthians 11:13 — *For such are false apostles, deceitful workers, transforming themselves into the apostles of Messiah (Christ).* Satan''s demand for an oath in 1 Adam and Eve 70:12 is the deceitful worker''s craft, binding the soul before unveiling the lie.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae70_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae70_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-70-satan-angel-of-light',
       E'Satan in the form of an angel — the deceiver transformed',
       E'Outside the garden the seed-war takes its oldest shape: *After this Satan, the hater of all good, took the form of an angel, and with him two others, so that they looked like the three angels who had brought to Adam gold, incense, and myrrh* (1 Adam and Eve 70:1), and *They passed before Adam and Eve while they were under the tree, and greeted Adam and Eve with fair words that were full of deceit* (1 Adam and Eve 70:2). It ain''t new — Sha''ul names the very disguise: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14), even as in Eden *the serpent beguiled Eve through his subtilty* (2 Corinthians 11:3). This is the dragon already at work: *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9), the *roaring lion* who *walketh about, seeking whom he may devour* (1 Peter 5:8). The Apocalypse only unveils the foe Adam met under the tree on his first day out of paradise.',
       sv.verse_id, ev.verse_id, 'extras', 65725
  FROM _session253_1ae70_lookup sv, _session253_1ae70_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=70 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-70-counterfeit-gifts',
       E'Gold, incense, and myrrh — the gifts kept for the Saviour, counterfeited',
       E'Satan counterfeits the very tokens of the promise: *I am the angel that brought you gold, and took it to the cave; this other angel is the one that brought you incense; and that third angel, is the one who brought you myrrh when you were on top of the mountain, and who carried you to the cave* (1 Adam and Eve 70:9). The gold, incense, and myrrh were laid up in the Cave of Treasures against the Saviour''s coming — and they come forth at last at His cradle: *when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). Adam''s heart was glad *because he thought concerning them, that they were the same angels, who had brought him gold, incense, and myrrh* (1 Adam and Eve 70:3) — but the enemy cannot give the gift, only forge the giver. He *speaketh a lie... for he is a liar, and the father of it* (John 8:44).',
       sv.verse_id, ev.verse_id, 'extras', 65728
  FROM _session253_1ae70_lookup sv, _session253_1ae70_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=70 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-70-false-word-of-elohim',
       E'A false ''Word of Elohim'' — the serpent''s old question made new',
       E'The adversary cloaks his lie in the holiest name: *It is a simple thing, yet it is the Word of Elohim (God), will you accept it from us and do it? But if you will not accept it, we will return to Elohim (God), and tell Him that you would not receive His Word* (1 Adam and Eve 70:6). It ain''t new — this is the garden voice again, *Yea, hath Elohim (God) said* (Genesis 3:1), and the flat contradiction of Yahuah''s word, *Ye shall not surely die* (Genesis 3:4). The true Word is not a thing whispered by a stranger but the One who was *in the beginning... and the Word was Elohim (God)* (John 1:1); every counterfeit measures itself against Him. Satan, *a liar, and the father of it* (John 8:44), forges the Word he hates.',
       sv.verse_id, ev.verse_id, 'extras', 65731
  FROM _session253_1ae70_lookup sv, _session253_1ae70_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=70 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-70-the-oath-trap',
       E'The oath of the deceived — swear not at all',
       E'Satan binds Adam by a vow before the lie is even spoken: *Swear, and promise me that you will receive it* (1 Adam and Eve 70:12), and Adam, not knowing the snare, takes the oath, *So true as Elohim (God) is living... I will not break my promise, nor renounce my word* (1 Adam and Eve 70:15). The Messiah warns against exactly this binding by oath: *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* (Matthew 5:34), *for whatsoever is more than these cometh of evil* (Matthew 5:37). Ya''aqob seals it: *swear not... but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). The enemy traffics in oaths because he is *transformed into an angel of light* (2 Corinthians 11:14) and his false apostles are *deceitful workers, transforming themselves* (2 Corinthians 11:13).',
       sv.verse_id, ev.verse_id, 'extras', 65734
  FROM _session253_1ae70_lookup sv, _session253_1ae70_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=70 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-70-satan-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very disguise Sha''ul names is the one Satan wears in 1 Adam and Eve 70:1, counterfeiting the angels of the gifts.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The fair words full of deceit of 1 Adam and Eve 70:2 are the same subtilty that beguiled Eve in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hater of all good who takes the angel''s form in 1 Adam and Eve 70:1 is that old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Kepha bids the watchfulness Adam lacked when he welcomed the smiling adversary of 1 Adam and Eve 70:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-satan-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-70-counterfeit-gifts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The very treasures Satan boasts of in 1 Adam and Eve 70:9 are the gifts kept against the Messiah''s coming and offered at His cradle.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-counterfeit-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Adam''s gladness at the counterfeit angels of 1 Adam and Eve 70:3 is mercy abused by the liar who was a murderer from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-counterfeit-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-70-false-word-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent''s twisting of the divine word in the garden is the same false ''Word of Elohim'' pressed on Adam in 1 Adam and Eve 70:6.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-false-word-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The bold contradiction of Yahuah''s command is the deceiver''s craft, now repackaged as a message from Elohim in 1 Adam and Eve 70:6.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-false-word-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil... When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Adam''s belief of the lying messengers in 1 Adam and Eve 70:11 is faith placed in the father of lies who forges the very Word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-false-word-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-70-the-oath-trap
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne.* The Messiah''s word forbids the very oath Satan extorts from Adam in 1 Adam and Eve 70:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-the-oath-trap'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* Adam''s elaborate sworn vow in 1 Adam and Eve 70:15 is the ''more than these'' that cometh of evil — and the evil one is its author.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-the-oath-trap'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* That Adam swore thus in 1 Adam and Eve 70:16 is the snare Ya''aqob warns ends in condemnation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-the-oath-trap'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 11:13 — *For such are false apostles, deceitful workers, transforming themselves into the apostles of Messiah (Christ).* Satan''s demand for an oath in 1 Adam and Eve 70:12 is the deceitful worker''s craft, binding the soul before unveiling the lie.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae70_lookup sv, _session253_1ae70_lookup tv
 WHERE t.slug='1-adam-eve-70-the-oath-trap'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=70 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

