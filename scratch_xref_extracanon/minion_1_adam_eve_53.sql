-- ----- fragment: minion_1adameve_53.sql (session253 1-adam-eve 53) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch53. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae53 (view _session253_1ae53_lookup). Sort band base 65300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae53_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-53-lions-roaring-devour
  ('adam-eve-conflict', '1-adam-eve', 53, 1, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The very lion-shape Satan takes against Adam and Eve in 1 Adam & Eve 53:1 is Kepha''s roaring lion seeking whom to devour.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 1, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan hiding under the form of lions in 1 Adam & Eve 53:1 is the same deceiver who transforms his shape to overthrow the faithful.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 1, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lions that come to break Adam and Eve in pieces (53:1) are the murderer from the beginning, hunting to kill.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s assault under the lions'' form (53:1) is the Edenic enmity striking at the woman and her seed.'),
  -- thread: 1-adam-eve-53-word-drives-lions
  ('adam-eve-conflict', '1-adam-eve', 53, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and drives off the lions in 1 Adam & Eve 53:3 is the eternal Word who was with Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 3, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who delivers Adam and Eve (53:3) would at last be made flesh to dwell among us.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 3, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Word driving the lions from Adam and Eve (53:3) is the Son manifested to destroy the works of the devil.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Their cry to be delivered from the paws (53:2) leans on the promise that the woman''s seed shall bruise the serpent''s head.'),
  -- thread: 1-adam-eve-53-turn-back-deceive
  ('adam-eve-conflict', '1-adam-eve', 53, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The warning that Satan would deceive Adam and work his purpose (53:5) names the liar and father of lies.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 5, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam is told to turn back and remain in the cave (53:5) for the same reason Kepha bids vigilance — the adversary prowls for the unguarded.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 5, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The deception Adam is warned to flee (53:5) is the serpent''s standing enmity against the seed.'),
  -- thread: 1-adam-eve-53-flood-remnant-delivered
  ('adam-eve-conflict', '1-adam-eve', 53, 6, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The descendants who defile themselves and follow Satan''s works (53:6) are the wickedness Genesis names as the cause of the flood.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 7, 'canon', 'genesis', 7, 4, 'free', E'Genesis 7:4 — *For yet seven days, and I will cause it to rain upon the earth forty days and forty nights; and every living substance that I have made will I destroy from off the face of the earth.* The waters of a flood that overwhelm them all (53:7) are the very deluge Yahuah brings in Genesis.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 7, 'canon', 'genesis', 7, 1, 'free', E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* The promise to deliver what is left of the righteous (53:7) is fulfilled when Yahuah brings righteous Noah and his house into the ark.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 7, 'enoch', '1-enoch', 10, 3, 'extras', E'1 Enoch 10:3 — *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.’* The righteous remnant Yahuah will deliver from the flood (53:7) is the preserved seed Enoch is sent to save.'),
  ('adam-eve-conflict', '1-adam-eve', 53, 7, 'jubilees', 'jubilees', 5, 5, 'extras', E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* The delivered righteous of 53:7 are embodied in Noah, who alone found grace before the flood.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae53_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae53_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-53-lions-roaring-devour',
       E'Satan as the ravenous lions — the adversary who seeks to devour',
       E'Outside the garden the old serpent waits in another shape: *They were not very far from the cave, when Satan came towards them, and hid himself between them and the cave, under the form of two ravenous lions three days without food, that came towards Adam and Eve, as if to break them in pieces and devour them* (1 Adam & Eve 53:1). It ain''t new — the adversary still hunts the seed of the woman, and Kepha names the very figure of this scene: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). He comes hidden, disguised, never himself — *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14) — for he was a destroyer from the first: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The lions on the western border are the same enmity Yahuah set in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 65300
  FROM _session253_1ae53_lookup sv, _session253_1ae53_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=53 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-53-word-drives-lions',
       E'The Word of Elohim drives the lions away — the Logos who delivers',
       E'Adam and Eve cry, and the One who answers is the Word: *Then Adam and Eve cried, and prayed Elohim (God) to deliver them from their paws. Then the Word of Elohim (God) came to them, and drove away the lions from them* (1 Adam & Eve 53:2-3). The Comforter who comes is no mere voice; He is the same Word who was in the beginning — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1) — *All things were made by him; and without him was not any thing made that was made* (John 1:3) — and who at the fulness of time would put on flesh: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The Word who drives off the lions on the first day outside Eden is the Son manifested to undo the adversary: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65303
  FROM _session253_1ae53_lookup sv, _session253_1ae53_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=53 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-53-turn-back-deceive',
       E'Turn back to the cave — lest Satan deceive you',
       E'Having driven off the lions, the Word warns Adam to keep to the appointed place: *And Elohim (God) said to Adam, "O Adam, what do you seek on the western border? And why have you left of thine own accord the eastern border, in which was your living place? Now then, turn back to your cave, and remain in it, so that Satan won''t deceive you or work his purpose over you"* (1 Adam & Eve 53:4-5). The whole danger of the western wandering is deception — the same snare Eden warned of: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). For the adversary is by nature a liar working his purpose — *Ye are of your father the devil... When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44) — and he hunts the unguarded soul: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 65306
  FROM _session253_1ae53_lookup sv, _session253_1ae53_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=53 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-53-flood-remnant-delivered',
       E'The flood foretold — and the righteous remnant delivered',
       E'On the very first day outside Eden the Word foretells the deluge and the kept seed: *For in this western border, O Adam, there will go from you a descendant, that shall replenish it; and that will defile themselves with their sins, and with their yielding to the commands of Satan, and by following his works. Therefore will I bring over them the waters of a flood, and overwhelm them all. But I will deliver what is left of the righteous among them; and I will bring them to a distant land, and the land in which you live now shall remain desolate and without one inhabitant in it* (1 Adam & Eve 53:6-7). This is the Genesis flood seen from the beginning: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5), and so *For yet seven days, and I will cause it to rain upon the earth forty days and forty nights; and every living substance that I have made will I destroy from off the face of the earth* (Genesis 7:4) — yet the righteous remnant is delivered: *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* (Genesis 7:1). The restored witnesses say the same: Enoch is sent so *that he may escape and his seed may be preserved for all the generations of the world* (1 Enoch 10:3), and Jubilees records *But Noah found grace before the eyes of Yahuah (God)* (Jubilees 5:5).',
       sv.verse_id, ev.verse_id, 'extras', 65309
  FROM _session253_1ae53_lookup sv, _session253_1ae53_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=53 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-53-lions-roaring-devour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The very lion-shape Satan takes against Adam and Eve in 1 Adam & Eve 53:1 is Kepha''s roaring lion seeking whom to devour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-lions-roaring-devour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan hiding under the form of lions in 1 Adam & Eve 53:1 is the same deceiver who transforms his shape to overthrow the faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-lions-roaring-devour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lions that come to break Adam and Eve in pieces (53:1) are the murderer from the beginning, hunting to kill.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-lions-roaring-devour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s assault under the lions'' form (53:1) is the Edenic enmity striking at the woman and her seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-lions-roaring-devour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-53-word-drives-lions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and drives off the lions in 1 Adam & Eve 53:3 is the eternal Word who was with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-word-drives-lions'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who delivers Adam and Eve (53:3) would at last be made flesh to dwell among us.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-word-drives-lions'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Word driving the lions from Adam and Eve (53:3) is the Son manifested to destroy the works of the devil.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-word-drives-lions'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Their cry to be delivered from the paws (53:2) leans on the promise that the woman''s seed shall bruise the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-word-drives-lions'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-53-turn-back-deceive
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The warning that Satan would deceive Adam and work his purpose (53:5) names the liar and father of lies.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-turn-back-deceive'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam is told to turn back and remain in the cave (53:5) for the same reason Kepha bids vigilance — the adversary prowls for the unguarded.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-turn-back-deceive'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The deception Adam is warned to flee (53:5) is the serpent''s standing enmity against the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-turn-back-deceive'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-53-flood-remnant-delivered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The descendants who defile themselves and follow Satan''s works (53:6) are the wickedness Genesis names as the cause of the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-flood-remnant-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:4 — *For yet seven days, and I will cause it to rain upon the earth forty days and forty nights; and every living substance that I have made will I destroy from off the face of the earth.* The waters of a flood that overwhelm them all (53:7) are the very deluge Yahuah brings in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-flood-remnant-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* The promise to deliver what is left of the righteous (53:7) is fulfilled when Yahuah brings righteous Noah and his house into the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-flood-remnant-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:3 — *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.’* The righteous remnant Yahuah will deliver from the flood (53:7) is the preserved seed Enoch is sent to save.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-flood-remnant-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* The delivered righteous of 53:7 are embodied in Noah, who alone found grace before the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae53_lookup sv, _session253_1ae53_lookup tv
 WHERE t.slug='1-adam-eve-53-flood-remnant-delivered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=53 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

