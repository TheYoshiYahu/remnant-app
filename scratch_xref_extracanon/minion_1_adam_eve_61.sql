-- ----- fragment: minion_1adameve_61.sql (session253 1-adam-eve 61) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch61. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae61 (view _session253_1ae61_lookup). Sort band base 65500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae61_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-61-word-curses-satan
  ('adam-eve-conflict', '1-adam-eve', 61, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The Word''s cursing of Satan in 1-adam-eve 61:3 is the very enmity of Eden, the seed-war still striking at the woman''s line outside the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 3, 'canon', 'genesis', 3, 14, 'free', E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The same Yahuah who first cursed the serpent in the garden curses him again in 1-adam-eve 61:3, driving him from Adam.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 3, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The driving-away of Satan in 1-adam-eve 61:3 is the first installment of the bruising sworn from Eden and finished at the feet of the saints.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 7, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Calling Satan *the father of evil arts* in 1-adam-eve 61:7 names the one who sins from the beginning, whose works the manifested Son undoes.'),
  -- thread: 1-adam-eve-61-satan-in-their-likeness
  ('adam-eve-conflict', '1-adam-eve', 61, 9, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan coming *with a face like your own* and false tokens in 1-adam-eve 61:9 is the same transforming deceiver Paul warns of.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lying messenger of 1-adam-eve 61:5, claiming to come from Elohim, is the liar and father of lies from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 7, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan seeking *to drive you to some place where he might destroy you* in 1-adam-eve 61:7 is the prowling adversary hunting whom he may devour.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 9, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The disguised deceiver of 1-adam-eve 61:9 is the old serpent who deceives the whole world, his deceit unchanged from the first days.'),
  -- thread: 1-adam-eve-61-mercy-spares-the-seed
  ('adam-eve-conflict', '1-adam-eve', 61, 10, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* Yahuah driving the deceiver away in His mercy in 1-adam-eve 61:10 is the pattern of the adversary fleeing before submission to Elohim.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 10, 'jubilees', 'jubilees', 10, 11, 'extras', E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The mercy that *did not allow him to destroy you* in 1-adam-eve 61:10 belongs to the same restraint by which the evil ones are bound and only a remnant left to Satan.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 7, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s design *to cut off all hope from you* in 1-adam-eve 61:7 is exactly the work the Son was manifested to destroy.'),
  -- thread: 1-adam-eve-61-word-comes-and-provides
  ('adam-eve-conflict', '1-adam-eve', 61, 18, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes again and speaks in 1-adam-eve 61:18 is the eternal Logos who was in the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 18, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comes to feed Adam in 1-adam-eve 61:18 would in time be made flesh and dwell among us, full of grace and truth.'),
  ('adam-eve-conflict', '1-adam-eve', 61, 16, 'canon', 'matthew', 4, 11, 'free', E'Matthew 4:11 — *Then the devil leaveth him, and, behold, angels came and ministered unto him.* Adam and Eve, fasting and weak, appealing to Elohim to satisfy their hunger in 1-adam-eve 61:16, foreshadow the wilderness fast where, the tempter gone, ministry comes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae61_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae61_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-61-word-curses-satan',
       E'The Word comes and curses Satan, driving him from the seed',
       E'When Satan has lured Adam and Eve out of the cave before the forty days are ended, *Then the Word of Yahuah Elohim (the LORD God) again came and cursed Satan, and drove him away from them* (1 Adam & Eve 61:3) — and Adam learns the deceiver is *the father of evil arts, who brought you and Eve out of the Garden of Delights* (61:7). It ain''t new: this is the very enmity of Eden replayed on the second day outside the gate. *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15); the same Yahuah who, in the garden, *said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field* (Genesis 3:14) now curses him again. The seed-war''s end is sworn: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20), *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65500
  FROM _session253_1ae61_lookup sv, _session253_1ae61_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=61 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-61-satan-in-their-likeness',
       E'Satan disguised in their own likeness, the angel of false light',
       E'Elohim unmasks the deception: *Because he couldn''t do anything to you unless he showed himself in the likeness of you. Therefore he came to you with a face like your own, and began to give you tokens as if they were all true* (1 Adam & Eve 61:8-9) — the *friendly old man who said... I am a messenger from Elohim* (61:5) was the adversary transformed. It ain''t new: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). He works as he always has — *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44); *your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). He is *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 65503
  FROM _session253_1ae61_lookup sv, _session253_1ae61_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=61 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-61-mercy-spares-the-seed',
       E'Yahuah''s mercy spares the seed; Satan bound and resisted',
       E'Against the destroyer Yahuah sets His mercy: *But because I am merciful and am favorable to you, I did not allow him to destroy you; instead I drove him away from you* (1 Adam & Eve 61:10). The promise that the head shall be bruised is already mercy in motion. *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you* (James 4:7) — and the binding of the adversary is the same primeval history the watchers'' book tells: *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth* (Jubilees 10:11). For Satan''s whole purpose, *to break your mutual bond; to cut off all hope from you* (61:7), is undone because *the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65506
  FROM _session253_1ae61_lookup sv, _session253_1ae61_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=61 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-61-word-comes-and-provides',
       E'The Word who comes, comforts, and provides the figs',
       E'Twice in this chapter the Logos Himself comes to the weakened pair: *Then came the Word of Elohim (God) again, and said to them, O Adam, get up, go and bring the two figs here* (1 Adam & Eve 61:18) — the Word who curses Satan (61:3) is the same Word who feeds and sustains. It ain''t new: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1); *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). And when the tempter''s hunger-trial is past, the ministry comes as it ever does: *Then the devil leaveth him, and, behold, angels came and ministered unto him* (Matthew 4:11) — the Word who provides for fasting Adam is the Word who is ministered to in His own wilderness fast.',
       sv.verse_id, ev.verse_id, 'extras', 65509
  FROM _session253_1ae61_lookup sv, _session253_1ae61_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=16
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=61 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-61-word-curses-satan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The Word''s cursing of Satan in 1-adam-eve 61:3 is the very enmity of Eden, the seed-war still striking at the woman''s line outside the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The same Yahuah who first cursed the serpent in the garden curses him again in 1-adam-eve 61:3, driving him from Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The driving-away of Satan in 1-adam-eve 61:3 is the first installment of the bruising sworn from Eden and finished at the feet of the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Calling Satan *the father of evil arts* in 1-adam-eve 61:7 names the one who sins from the beginning, whose works the manifested Son undoes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-word-curses-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-61-satan-in-their-likeness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan coming *with a face like your own* and false tokens in 1-adam-eve 61:9 is the same transforming deceiver Paul warns of.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-satan-in-their-likeness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lying messenger of 1-adam-eve 61:5, claiming to come from Elohim, is the liar and father of lies from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-satan-in-their-likeness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Satan seeking *to drive you to some place where he might destroy you* in 1-adam-eve 61:7 is the prowling adversary hunting whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-satan-in-their-likeness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The disguised deceiver of 1-adam-eve 61:9 is the old serpent who deceives the whole world, his deceit unchanged from the first days.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-satan-in-their-likeness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-61-mercy-spares-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* Yahuah driving the deceiver away in His mercy in 1-adam-eve 61:10 is the pattern of the adversary fleeing before submission to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-mercy-spares-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The mercy that *did not allow him to destroy you* in 1-adam-eve 61:10 belongs to the same restraint by which the evil ones are bound and only a remnant left to Satan.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-mercy-spares-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s design *to cut off all hope from you* in 1-adam-eve 61:7 is exactly the work the Son was manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-mercy-spares-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-61-word-comes-and-provides
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes again and speaks in 1-adam-eve 61:18 is the eternal Logos who was in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-word-comes-and-provides'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comes to feed Adam in 1-adam-eve 61:18 would in time be made flesh and dwell among us, full of grace and truth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-word-comes-and-provides'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 4:11 — *Then the devil leaveth him, and, behold, angels came and ministered unto him.* Adam and Eve, fasting and weak, appealing to Elohim to satisfy their hunger in 1-adam-eve 61:16, foreshadow the wilderness fast where, the tempter gone, ministry comes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae61_lookup sv, _session253_1ae61_lookup tv
 WHERE t.slug='1-adam-eve-61-word-comes-and-provides'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=61 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

