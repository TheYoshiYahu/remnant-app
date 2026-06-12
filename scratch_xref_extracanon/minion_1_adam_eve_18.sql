-- ----- fragment: minion_1adameve_18.sql (session253 1-adam-eve 18) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae18 (view _session253_1ae18_lookup). Sort band base 64425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-18-serpent-strikes-the-seed
  ('adam-eve-conflict', '1-adam-eve', 18, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent running straight for Eve in 1-adam-eve 18:2 is the very enmity Yahuah set in Eden being acted out from the first day outside the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 18, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The blood-red serpent that swells to kill in 1-adam-eve 18:1 is that same old serpent named at the end of the war.'),
  ('adam-eve-conflict', '1-adam-eve', 18, 4, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The serpent that threw down and squeezed Adam and Eve to kill them in 1-adam-eve 18:4 is the same devouring adversary the apostle names.'),
  -- thread: 1-adam-eve-18-the-curse-on-the-belly
  ('adam-eve-conflict', '1-adam-eve', 18, 4, 'canon', 'genesis', 3, 14, 'free', E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The serpent''s own words in 1-adam-eve 18:4 — slippery, going on its belly — are Eden''s curse confessed from its own mouth.'),
  ('adam-eve-conflict', '1-adam-eve', 18, 4, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The serpent that still tries to kill though already cursed in 1-adam-eve 18:4 is the murderer from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 18, 6, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The Word''s sentence against the serpent in 1-adam-eve 18:6 is the same bruising of Satan the gospel promises.'),
  -- thread: 1-adam-eve-18-the-word-rescues-and-silences
  ('adam-eve-conflict', '1-adam-eve', 18, 6, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes to the serpent and pronounces judgment in 1-adam-eve 18:6 is the eternal Word of the prologue.'),
  ('adam-eve-conflict', '1-adam-eve', 18, 6, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word who made the serpent and gave it speech now removes it in 1-adam-eve 18:6-7 — the Maker disposing of His own creature.'),
  ('adam-eve-conflict', '1-adam-eve', 18, 7, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Word silencing the serpent''s deceiving speech in 1-adam-eve 18:7 foreshadows the Son manifested to destroy the devil''s works.'),
  ('adam-eve-conflict', '1-adam-eve', 18, 5, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The contrast is sharp: in 1-adam-eve 18:5 a true angel of Yahuah delivers Adam and Eve, where elsewhere Satan only counterfeits the angelic to deceive them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-18-serpent-strikes-the-seed',
       E'The serpent strikes at the seed of the woman',
       E'*When the accursed serpent saw Adam and Eve, it swelled its head, stood on its tail, and with eyes blood-red, acted like it would kill them.* *It made straight for Eve, and ran after her... Then with its great strength, it threw down Adam and Eve and squeezed them, and tried to kill them.* It ain''t new. On the very first days outside the garden the war is already the same war Yahuah declared in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The serpent that ran straight for Eve is the same old serpent of the end — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9) — and the same adversary the apostle warned of: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The seed-war from day one to the consummation is one war.',
       sv.verse_id, ev.verse_id, 'extras', 64425
  FROM _session253_1ae18_lookup sv, _session253_1ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-18-the-curse-on-the-belly',
       E'Upon thy belly: the curse spoken again',
       E'When Adam seizes its tail the serpent throws its own sentence in his face: *"O Adam, because of you and of Eve, I am slippery, and go on my belly."* This is Eden''s curse quoted back — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life* (Genesis 3:14). The serpent owns its own ruin, yet still strikes — for from the first he was a murderer: *Ye are of your father the devil... He was a murderer from the beginning* (John 8:44). And the Word''s verdict in this chapter is the same as the gospel''s promise: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 64428
  FROM _session253_1ae18_lookup sv, _session253_1ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-18-the-word-rescues-and-silences',
       E'The Word delivers and strikes the deceiver mute',
       E'Mercy answers the murder: *But Elohim (God) sent an angel who threw the serpent away from them, and raised them up.* Then *the Word of Elohim (God) came to the serpent* and sealed its mouth — *"This time, however, you will be mute, and you and your race will speak no more."* The Word who comes and judges here is the Logos of the prologue — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1); *All things were made by him; and without him was not any thing made that was made* (John 1:3). And the silencing of the serpent''s speech is the very purpose for which He was manifested: *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The deceiver who once spoke to ruin Yahuah''s creatures is now struck mute by the Word he could not overcome.',
       sv.verse_id, ev.verse_id, 'extras', 64431
  FROM _session253_1ae18_lookup sv, _session253_1ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-18-serpent-strikes-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent running straight for Eve in 1-adam-eve 18:2 is the very enmity Yahuah set in Eden being acted out from the first day outside the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-serpent-strikes-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The blood-red serpent that swells to kill in 1-adam-eve 18:1 is that same old serpent named at the end of the war.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-serpent-strikes-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The serpent that threw down and squeezed Adam and Eve to kill them in 1-adam-eve 18:4 is the same devouring adversary the apostle names.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-serpent-strikes-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-18-the-curse-on-the-belly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The serpent''s own words in 1-adam-eve 18:4 — slippery, going on its belly — are Eden''s curse confessed from its own mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-the-curse-on-the-belly'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The serpent that still tries to kill though already cursed in 1-adam-eve 18:4 is the murderer from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-the-curse-on-the-belly'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The Word''s sentence against the serpent in 1-adam-eve 18:6 is the same bruising of Satan the gospel promises.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-the-curse-on-the-belly'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-18-the-word-rescues-and-silences
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes to the serpent and pronounces judgment in 1-adam-eve 18:6 is the eternal Word of the prologue.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-the-word-rescues-and-silences'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The same Word who made the serpent and gave it speech now removes it in 1-adam-eve 18:6-7 — the Maker disposing of His own creature.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-the-word-rescues-and-silences'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Word silencing the serpent''s deceiving speech in 1-adam-eve 18:7 foreshadows the Son manifested to destroy the devil''s works.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-the-word-rescues-and-silences'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The contrast is sharp: in 1-adam-eve 18:5 a true angel of Yahuah delivers Adam and Eve, where elsewhere Satan only counterfeits the angelic to deceive them.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae18_lookup sv, _session253_1ae18_lookup tv
 WHERE t.slug='1-adam-eve-18-the-word-rescues-and-silences'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

