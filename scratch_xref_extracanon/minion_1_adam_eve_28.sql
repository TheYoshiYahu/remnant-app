-- ----- fragment: minion_1adameve_28.sql (session253 1-adam-eve 28) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae28 (view _session253_1ae28_lookup). Sort band base 64675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-28-angel-of-light
  ('adam-eve-conflict', '1-adam-eve', 28, 1, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The crafty Satan who comes on a cloud at 1-adam-eve 28:1 is the same adversary Sha''ul unmasks, working by counterfeit glory.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 2, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* As Adam and Eve mistake the deceiver for angels of Elohim at 1-adam-eve 28:2, Sha''ul warns the same subtilty still corrupts the mind.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The host Satan gathers in 1-adam-eve 28:1 are the angels cast down with him, and his trade is the deceiving of the whole world.'),
  -- thread: 1-adam-eve-28-elohim-withheld-his-word
  ('adam-eve-conflict', '1-adam-eve', 28, 7, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* The lie that overthrew Eve in the garden is named again at 1-adam-eve 28:7, where Yahuah waits to see whether Adam will be overcome as she was.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 7, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver testing Adam at 1-adam-eve 28:7 is the liar who has murdered by falsehood from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s trial at 1-adam-eve 28:7 is one stroke of the enmity Yahuah set between the serpent and the seed of the woman.'),
  -- thread: 1-adam-eve-28-false-comfort-restoration
  ('adam-eve-conflict', '1-adam-eve', 28, 5, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Satan''s false promise of restoration at 1-adam-eve 28:5 is the same overreaching lie he used in the garden, offering by deceit what is not his to give.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 5, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The garden Satan promises to reopen at 1-adam-eve 28:5 was sealed by the flaming sword, so his offer is a lie at the very threshold.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 6, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The words that sink into the hearts of Adam and Eve at 1-adam-eve 28:6 are the devil''s work, which only the manifested Son undoes.'),
  -- thread: 1-adam-eve-28-high-mountain-cast-down
  ('adam-eve-conflict', '1-adam-eve', 28, 10, 'canon', 'matthew', 4, 6, 'free', E'Matthew 4:6 — *And saith unto him, If thou be the Son of Elohim (God), cast thyself down: for it is written, He shall give his angels charge concerning thee: and in their hands they shall bear thee up, lest at any time thou dash thy foot against a stone.* The devil who marches the first Adam up a high mountain to throw him down at 1-adam-eve 28:10 tempts the second Adam to the very same fall.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 10, 'canon', 'matthew', 4, 8, 'free', E'Matthew 4:8 — *Again, the devil taketh him up into an exceeding high mountain, and sheweth him all the kingdoms of the world, and the glory of them;* As Satan covets to wipe off Adam''s name so the earth remains his alone at 1-adam-eve 28:10, he likewise offers the kingdoms of the world he claims to own.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 10, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The Devil who draws near to throw Adam and Eve down and kill them at 1-adam-eve 28:10 is the roaring lion seeking to devour the seed.'),
  ('adam-eve-conflict', '1-adam-eve', 28, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to wipe off their name from the earth at 1-adam-eve 28:10 is his strike at the heel, but the head-crushing Seed is already promised.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-28-angel-of-light',
       E'Satan transformed into an angel of light',
       E'Satan comes against the first pair in borrowed glory: *But when the crafty Satan saw them, that they were going to the garden, he gathered together his host, and came in appearance on a cloud, intent on deceiving them* (1-adam-eve 28:1), and *But when Adam and Eve saw him thus in a vision, they thought they were angels of Elohim (God) come to comfort them about having left the garden* (1-adam-eve 28:2). It ain''t new — Sha''ul names the very disguise: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). The same subtilty that first beguiled the woman wears now a robe of light: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). And the deceiver who *came in appearance on a cloud* is the *old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 64675
  FROM _session253_1ae28_lookup sv, _session253_1ae28_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=28 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-28-elohim-withheld-his-word',
       E'Yahuah withheld His Word to prove Adam',
       E'Where the serpent''s lie overthrew Eve in the garden, Yahuah now lets Adam be tried: *Yet Elohim (God) withheld His Word from Adam, and did not make him understand at once, but waited to see his strength; whether he would be overcome as Eve was when in the garden, or whether he would prevail* (1-adam-eve 28:7). The Word withheld here is the very Word the serpent first contradicted — *And the serpent said unto the woman, Ye shall not surely die* (Genesis 3:4) — the seed-war that began the moment the deceiver opened his mouth. Yahusha holds the same Word against the same tempter: *And ye shall know the truth, and the truth shall make you free* (John 8:32), for the devil *is a liar, and the father of it* (John 8:44). And the whole contest moves toward the promise that the woman''s Seed *shall bruise thy head* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 64678
  FROM _session253_1ae28_lookup sv, _session253_1ae28_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=28 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-28-false-comfort-restoration',
       E'The false promise of restoration to the garden',
       E'Satan dangles the one thing the exiles long for: *Elohim (God) has sent us to take you and bring you to the border of the garden northwards; to the shore of the clear sea, and bathe you and Eve in it, and raise you to your former gladness, that you return again to the garden* (1-adam-eve 28:5), and *These words sank into the heart of Adam and Eve* (1-adam-eve 28:6). It ain''t new — the lie always promises the very blessing it cannot give, just as in Eden: *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil* (Genesis 3:5). Yet the way back was barred by Yahuah Himself: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). No false angel reopens that gate; only the Son destroys the deceiver''s work — *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 64681
  FROM _session253_1ae28_lookup sv, _session253_1ae28_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=28 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-28-high-mountain-cast-down',
       E'Up the high mountain to be cast down',
       E'Satan''s mercy is murder in disguise: he leads them *to the mountain to the north of the garden, a very high mountain, without any steps to the top of it*, and *made them go up to the top in reality, and not in a vision; wishing, as he did, to throw them down and kill them, and to wipe off their name from the earth; so that this earth should remain to him and his hosts alone* (1-adam-eve 28:10). It ain''t new — the same tempter takes the second Adam up the same kind of height with the same word: *Then the devil taketh him up into the holy city, and setteth him on a pinnacle of the temple, And saith unto him, If thou be the Son of Elohim (God), cast thyself down* (Matthew 4:5-6), and *Again, the devil taketh him up into an exceeding high mountain* (Matthew 4:8). The adversary who would *wipe off their name from the earth* is the *roaring lion* who *walketh about, seeking whom he may devour* (1 Peter 5:8) — but the promised Seed shall *bruise thy head* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 64684
  FROM _session253_1ae28_lookup sv, _session253_1ae28_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=28 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-28-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The crafty Satan who comes on a cloud at 1-adam-eve 28:1 is the same adversary Sha''ul unmasks, working by counterfeit glory.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* As Adam and Eve mistake the deceiver for angels of Elohim at 1-adam-eve 28:2, Sha''ul warns the same subtilty still corrupts the mind.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The host Satan gathers in 1-adam-eve 28:1 are the angels cast down with him, and his trade is the deceiving of the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-28-elohim-withheld-his-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* The lie that overthrew Eve in the garden is named again at 1-adam-eve 28:7, where Yahuah waits to see whether Adam will be overcome as she was.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-elohim-withheld-his-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver testing Adam at 1-adam-eve 28:7 is the liar who has murdered by falsehood from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-elohim-withheld-his-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s trial at 1-adam-eve 28:7 is one stroke of the enmity Yahuah set between the serpent and the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-elohim-withheld-his-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-28-false-comfort-restoration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Satan''s false promise of restoration at 1-adam-eve 28:5 is the same overreaching lie he used in the garden, offering by deceit what is not his to give.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-false-comfort-restoration'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The garden Satan promises to reopen at 1-adam-eve 28:5 was sealed by the flaming sword, so his offer is a lie at the very threshold.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-false-comfort-restoration'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The words that sink into the hearts of Adam and Eve at 1-adam-eve 28:6 are the devil''s work, which only the manifested Son undoes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-false-comfort-restoration'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-28-high-mountain-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 4:6 — *And saith unto him, If thou be the Son of Elohim (God), cast thyself down: for it is written, He shall give his angels charge concerning thee: and in their hands they shall bear thee up, lest at any time thou dash thy foot against a stone.* The devil who marches the first Adam up a high mountain to throw him down at 1-adam-eve 28:10 tempts the second Adam to the very same fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-high-mountain-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:8 — *Again, the devil taketh him up into an exceeding high mountain, and sheweth him all the kingdoms of the world, and the glory of them;* As Satan covets to wipe off Adam''s name so the earth remains his alone at 1-adam-eve 28:10, he likewise offers the kingdoms of the world he claims to own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-high-mountain-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The Devil who draws near to throw Adam and Eve down and kill them at 1-adam-eve 28:10 is the roaring lion seeking to devour the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-high-mountain-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to wipe off their name from the earth at 1-adam-eve 28:10 is his strike at the heel, but the head-crushing Seed is already promised.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae28_lookup sv, _session253_1ae28_lookup tv
 WHERE t.slug='1-adam-eve-28-high-mountain-cast-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=28 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

