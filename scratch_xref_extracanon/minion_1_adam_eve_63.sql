-- ----- fragment: minion_1adameve_63.sql (session253 1-adam-eve 63) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch63. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae63 (view _session253_1ae63_lookup). Sort band base 65550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae63_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-63-satan-buried-the-figs
  ('adam-eve-conflict', '1-adam-eve', 63, 8, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan burying the figs "eastward of the cave" to destroy them is the serpent of Eden still striking at the seed in 1 Adam & Eve 63:8.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 10, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam''s word that the enemy "has not ceased, no, not one day, from doing you some harm" (63:10) is the prowling adversary who never rests.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 8, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s destroying intent in 63:8 is the work of the devil that the Son comes to undo.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 10, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The "old serpent" who deceives the whole world is the same enemy whose meanness and evil works Yahuah exposes in 63:10.'),
  -- thread: 1-adam-eve-63-the-word-comes-and-shows-mercy
  ('adam-eve-conflict', '1-adam-eve', 63, 8, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word of Elohim" who comes and speaks to Adam in 63:8 is the eternal Logos, not a created messenger.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 9, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who commands the two trees to grow over Adam in 63:9 is the One by whom all things were made.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 8, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to Adam in 63:8 is the first of those many times Elohim spake unto the fathers.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 9, 'canon', 'lamentations', 3, 22, 'free', E'Lamentations 3:22 — *It is of the LORD’S mercies that we are not consumed, because his compassions fail not.* Yahuah''s "I had mercy on you" that grew the trees for Adam''s rest (63:9) is the unfailing compassion that does not consume.'),
  -- thread: 1-adam-eve-63-rest-under-the-trees-but-eat-not
  ('adam-eve-conflict', '1-adam-eve', 63, 11, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The single restraint laid on the new trees — "do not eat any of their fruit" (63:11) — re-sounds the one command of the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 13, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Adam''s dread of "death or some other evil, as at the first time" in these very fig trees (63:13) recalls the figs of the fall.'),
  ('adam-eve-conflict', '1-adam-eve', 63, 13, 'canon', 'job', 1, 21, 'free', E'Job 1:21 — *Naked came I out of my mother’s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Adam''s plea that Yahuah may root up or leave the trees (63:13) bows to the same sovereign hand that gives and takes away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae63_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae63_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-63-satan-buried-the-figs',
       E'Satan went before to destroy — and Yahuah grew them',
       E'The enemy reaches the cave first and buries the very fruit Adam was sent to fetch: *when I sent you to fetch the figs, Satan went before you to the cave, took the figs, and buried them outside, eastward of the cave, thinking to destroy them; and not sowing them with good intent* (1 Adam & Eve 63:8). It ain''t new — this is the serpent striking again at the seed of the woman, and Yahuah turning the malice into mercy: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The devourer prowls the very first day outside Eden — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). What Satan buried to destroy, Yahuah raised to overshadow.',
       sv.verse_id, ev.verse_id, 'extras', 65550
  FROM _session253_1ae63_lookup sv, _session253_1ae63_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=63 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-63-the-word-comes-and-shows-mercy',
       E'The Word of Elohim comes to Adam in mercy',
       E'Adam prays into his confusion and the Logos answers: *Then came the Word of Elohim (God) to Adam, and said to him, "O Adam, when I sent you to fetch the figs, Satan went before you..."* (1 Adam & Eve 63:8), and the mercy is named plainly — *I had mercy on you and I commanded them to grow... that I made you see My power and My marvelous works* (1 Adam & Eve 63:9). This is no created angel but the Word Himself who walks with Adam: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), the Word by whom the very trees were made — *All things were made by him; and without him was not any thing made that was made* (John 1:3) — the same Word who in time past *spake... unto the fathers* (Hebrews 1:1). The compassion that grew two trees over a weary man is the unfailing mercy of the covenant: *It is of the LORD’S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22).',
       sv.verse_id, ev.verse_id, 'extras', 65553
  FROM _session253_1ae63_lookup sv, _session253_1ae63_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=63 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-63-rest-under-the-trees-but-eat-not',
       E'Rest under the trees, but eat not their fruit',
       E'Yahuah blesses the trees for shade yet sets a single restraint: *rest under them when you feel weary. But do not eat any of their fruit or come near them* (1 Adam & Eve 63:11). Adam, scarred by Eden, hears a death-sentence in any tree and pleads — *if You know that there be in these trees either death or some other evil, as at the first time, root them up* (1 Adam & Eve 63:13). His dread reaches back to the first command and its first wound: *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17), and to the fig leaves of the fall — *and they sewed fig leaves together, and made themselves aprons* (Genesis 3:7). Yet Adam confesses Yahuah''s sovereign power even in his fear — *Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21).',
       sv.verse_id, ev.verse_id, 'extras', 65556
  FROM _session253_1ae63_lookup sv, _session253_1ae63_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=63 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-63-satan-buried-the-figs
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan burying the figs "eastward of the cave" to destroy them is the serpent of Eden still striking at the seed in 1 Adam & Eve 63:8.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-satan-buried-the-figs'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam''s word that the enemy "has not ceased, no, not one day, from doing you some harm" (63:10) is the prowling adversary who never rests.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-satan-buried-the-figs'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s destroying intent in 63:8 is the work of the devil that the Son comes to undo.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-satan-buried-the-figs'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The "old serpent" who deceives the whole world is the same enemy whose meanness and evil works Yahuah exposes in 63:10.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-satan-buried-the-figs'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-63-the-word-comes-and-shows-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word of Elohim" who comes and speaks to Adam in 63:8 is the eternal Logos, not a created messenger.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-the-word-comes-and-shows-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Word who commands the two trees to grow over Adam in 63:9 is the One by whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-the-word-comes-and-shows-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word speaking to Adam in 63:8 is the first of those many times Elohim spake unto the fathers.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-the-word-comes-and-shows-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Lamentations 3:22 — *It is of the LORD’S mercies that we are not consumed, because his compassions fail not.* Yahuah''s "I had mercy on you" that grew the trees for Adam''s rest (63:9) is the unfailing compassion that does not consume.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-the-word-comes-and-shows-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-63-rest-under-the-trees-but-eat-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The single restraint laid on the new trees — "do not eat any of their fruit" (63:11) — re-sounds the one command of the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-rest-under-the-trees-but-eat-not'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Adam''s dread of "death or some other evil, as at the first time" in these very fig trees (63:13) recalls the figs of the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-rest-under-the-trees-but-eat-not'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 1:21 — *Naked came I out of my mother’s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Adam''s plea that Yahuah may root up or leave the trees (63:13) bows to the same sovereign hand that gives and takes away.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae63_lookup sv, _session253_1ae63_lookup tv
 WHERE t.slug='1-adam-eve-63-rest-under-the-trees-but-eat-not'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=63 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

