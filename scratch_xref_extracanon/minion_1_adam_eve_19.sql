-- ----- fragment: minion_1adameve_19.sql (session253 1-adam-eve 19) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae19 (view _session253_1ae19_lookup). Sort band base 64450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-19-word-raises-the-fallen
  ('adam-eve-conflict', '1-adam-eve', 19, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and raises Adam in 1 Adam & Eve 19:3 is the eternal Logos, with Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 19, 3, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who came to Adam outside Eden would one day come in flesh, the promised Saviour Adam awaited.'),
  ('adam-eve-conflict', '1-adam-eve', 19, 3, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Word''s coming to Adam in his despair is no afterthought but the eternal plan of the Lamb foreordained before the world''s foundation.'),
  -- thread: 1-adam-eve-19-the-serpent-held-back
  ('adam-eve-conflict', '1-adam-eve', 19, 4, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Yahuah keeping the serpent from Adam in 1 Adam & Eve 19:4 enacts the very enmity He decreed between the seed of the woman and the serpent.'),
  ('adam-eve-conflict', '1-adam-eve', 19, 5, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* "The accursed one" Yahuah names wicked in 1 Adam & Eve 19:5 is that old serpent, the Devil and Satan, exposed and cast down at the end.'),
  ('adam-eve-conflict', '1-adam-eve', 19, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The wickedness Yahuah foreknew in the accursed one (1 Adam & Eve 19:5) the Messiah names plainly: a murderer and liar from the beginning.'),
  -- thread: 1-adam-eve-19-i-am-with-you
  ('adam-eve-conflict', '1-adam-eve', 19, 6, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The Word''s charge to Adam to strengthen his heart and fear not (1 Adam & Eve 19:6) is the very promise Yahuah speaks over His servant in Isaiah.'),
  ('adam-eve-conflict', '1-adam-eve', 19, 6, 'canon', 'hebrews', 13, 5, 'free', E'Hebrews 13:5 — *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* "I am with you to the end of the days" (1 Adam & Eve 19:6) is the same unbroken pledge that He will never leave nor forsake His own.'),
  ('adam-eve-conflict', '1-adam-eve', 19, 6, 'canon', 'matthew', 28, 20, 'free', E'Matthew 28:20 — *Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.* The Word''s "I am with you to the end" to Adam (1 Adam & Eve 19:6) is sealed by the risen Messiah''s promise to be with His own to the very end of the age.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-19-word-raises-the-fallen',
       E'The Word of Elohim raises Adam from the ground',
       E'Adam, terrified the beasts would devour him, *beat his chest and fell on the ground like a corpse* (1 Adam & Eve 19:3) — and the One who comes is the Word: *Then the Word of Elohim (God) came to him, who raised him* (1 Adam & Eve 19:3). This is the same Logos John names: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), the Word who *was made flesh, and dwelt among us* (John 1:14). It ain''t new — from the first days outside the garden the Word walks to the fallen man and lifts him up, foreordained to do so: *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20).',
       sv.verse_id, ev.verse_id, 'extras', 64450
  FROM _session253_1ae19_lookup sv, _session253_1ae19_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=19 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-19-the-serpent-held-back',
       E'The accursed serpent kept from Adam',
       E'When Elohim brought the beasts to Adam, He withheld one: *I did not let the serpent come with them because it might have risen against you* (1 Adam & Eve 19:4), *For I knew that the accursed one is wicked* (1 Adam & Eve 19:5). This is the seed-war shown from day one — the same enmity Yahuah set in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The accursed one is the old serpent, *the great dragon... that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9), of whom the Messiah said *He was a murderer from the beginning* (John 8:44). Yahuah''s mercy guards the seed of the woman before Satan can strike.',
       sv.verse_id, ev.verse_id, 'extras', 64453
  FROM _session253_1ae19_lookup sv, _session253_1ae19_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=19 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-19-i-am-with-you',
       E'Strengthen your heart; I am with you to the end',
       E'The Word does not leave Adam in his terror but gives him the covenant comfort: *But now strengthen your heart and fear not. I am with you to the end of the days I have determined on you* (1 Adam & Eve 19:6). This is the everlasting refrain of Yahuah to His own — *Fear thou not; for I am with thee... I will strengthen thee; yea, I will help thee* (Isaiah 41:10) — the promise that He *will never leave thee, nor forsake thee* (Hebrews 13:5), and which the risen Messiah seals: *and, lo, I am with you alway, even unto the end of the world* (Matthew 28:20). From the first day outside the garden the Word''s word is the same word He speaks to the end.',
       sv.verse_id, ev.verse_id, 'extras', 64456
  FROM _session253_1ae19_lookup sv, _session253_1ae19_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=19 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-19-word-raises-the-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and raises Adam in 1 Adam & Eve 19:3 is the eternal Logos, with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-word-raises-the-fallen'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who came to Adam outside Eden would one day come in flesh, the promised Saviour Adam awaited.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-word-raises-the-fallen'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Word''s coming to Adam in his despair is no afterthought but the eternal plan of the Lamb foreordained before the world''s foundation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-word-raises-the-fallen'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-19-the-serpent-held-back
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Yahuah keeping the serpent from Adam in 1 Adam & Eve 19:4 enacts the very enmity He decreed between the seed of the woman and the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-the-serpent-held-back'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* "The accursed one" Yahuah names wicked in 1 Adam & Eve 19:5 is that old serpent, the Devil and Satan, exposed and cast down at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-the-serpent-held-back'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The wickedness Yahuah foreknew in the accursed one (1 Adam & Eve 19:5) the Messiah names plainly: a murderer and liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-the-serpent-held-back'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-19-i-am-with-you
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The Word''s charge to Adam to strengthen his heart and fear not (1 Adam & Eve 19:6) is the very promise Yahuah speaks over His servant in Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-i-am-with-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 13:5 — *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* "I am with you to the end of the days" (1 Adam & Eve 19:6) is the same unbroken pledge that He will never leave nor forsake His own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-i-am-with-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 28:20 — *Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.* The Word''s "I am with you to the end" to Adam (1 Adam & Eve 19:6) is sealed by the risen Messiah''s promise to be with His own to the very end of the age.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae19_lookup sv, _session253_1ae19_lookup tv
 WHERE t.slug='1-adam-eve-19-i-am-with-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

