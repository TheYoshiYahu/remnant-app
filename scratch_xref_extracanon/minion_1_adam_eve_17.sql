-- ----- fragment: minion_1adameve_17.sql (session253 1-adam-eve 17) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae17 (view _session253_1ae17_lookup). Sort band base 64400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-17-serpent-on-its-belly
  ('adam-eve-conflict', '1-adam-eve', 17, 2, 'canon', 'genesis', 3, 14, 'free', E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The serpent crawling on its breast and eating dust at the gate in 1 Adam and Eve 17:2 is the very sentence Yahuah pronounced, now seen carried out.'),
  ('adam-eve-conflict', '1-adam-eve', 17, 2, 'canon', 'micah', 7, 17, 'free', E'Micah 7:17 — *They shall lick the dust like a serpent, they shall move out of their holes like worms of the earth: they shall be afraid of Yahuah Eloheinu (the LORD our God), and shall fear because of thee.* Micah keeps the same emblem of the enemy abased to lick the dust that 1 Adam and Eve 17:2 sets at the western gate.'),
  ('adam-eve-conflict', '1-adam-eve', 17, 4, 'canon', 'isaiah', 65, 25, 'free', E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent''s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* Even in the world to come the serpent still eats dust, the same debasement 1 Adam and Eve 17:4 shows beginning on the first day outside.'),
  -- thread: 1-adam-eve-17-old-serpent-deceiver
  ('adam-eve-conflict', '1-adam-eve', 17, 2, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* John names the same identity the book gives in 1 Adam and Eve 17:2 — the serpent that became Satan, the old deceiver cast down to the earth.'),
  ('adam-eve-conflict', '1-adam-eve', 17, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The cursed serpent crawling at the gate in 1 Adam and Eve 17:2 stands under this very sentence — the head it raised against the woman is already doomed to be bruised by her seed.'),
  ('adam-eve-conflict', '1-adam-eve', 17, 2, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The serpent that became Satan in 1 Adam and Eve 17:2 is the devil who sinned from the beginning, whose works the Son of Elohim came to destroy.'),
  -- thread: 1-adam-eve-17-meanest-of-the-beasts
  ('adam-eve-conflict', '1-adam-eve', 17, 5, 'jubilees', 'jubilees', 3, 28, 'extras', E'Jubilees 3:28 — *And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue.* Jubilees remembers the same change among the beasts that 1 Adam and Eve 17:5 shows — the creature once admired now standing dumb and abhorred.'),
  ('adam-eve-conflict', '1-adam-eve', 17, 6, 'jubilees', 'jubilees', 3, 29, 'extras', E'Jubilees 3:29 — *And He sent out of the Garden of Eden all flesh that was in the Garden of Eden, and all flesh was scattered according to its kinds, and according to its types to the places which had been created for them.* The beasts fleeing the venomous serpent''s home in 1 Adam and Eve 17:6 belongs to this scattering of all flesh out of Eden after the fall.'),
  ('adam-eve-conflict', '1-adam-eve', 17, 3, 'canon', 'genesis', 3, 14, 'free', E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The serpent''s fall from the most exalted of beasts to creeping on its belly in 1 Adam and Eve 17:3 is the literal undoing of this curse spoken in the garden.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-17-serpent-on-its-belly',
       E'Upon thy belly shalt thou go — the curse made visible',
       E'As Adam and Eve come back toward the garden gate they meet the very serpent that ruined them, now broken: *they found the serpent that became Satan coming at the gate, and sorrowfully licking the dust, and wiggling on its breast on the ground, by reason of the curse that fell on it from Elohim (God).* (1 Adam and Eve 17:2) It ain''t new — this is the word Yahuah spoke at the gate before they ever left: *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* (Genesis 3:14). The prophets hold the same picture of the enemy brought low to lick the ground: *They shall lick the dust like a serpent, they shall move out of their holes like worms of the earth: they shall be afraid of Yahuah Eloheinu (the LORD our God), and shall fear because of thee.* (Micah 7:17) — and even into the restored creation the sentence stands: *and dust shall be the serpent''s meat.* (Isaiah 65:25).',
       sv.verse_id, ev.verse_id, 'extras', 64400
  FROM _session253_1ae17_lookup sv, _session253_1ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-17-old-serpent-deceiver',
       E'That old serpent — the deceiver behind the dust',
       E'The book is careful to name what the licking beast really is: not a mere snake but the adversary himself — *the serpent that became Satan* (1 Adam and Eve 17:2). From the beginning the seed-war wears the serpent''s skin, and the Revelation seals the identification: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9). But the enmity laid in the gate already carries the promise of the serpent''s undoing: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) — and the Son of Elohim comes for exactly this: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 64403
  FROM _session253_1ae17_lookup sv, _session253_1ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-17-meanest-of-the-beasts',
       E'The fairest of beasts made the meanest of them all',
       E'The fall is told as a reversal among the creatures: once exalted, the serpent is unmade — *whereas before the serpent was the most exalted of all beasts, now it was changed and become slippery, and the meanest of them all, and it crept on its breast and went on its belly* (1 Adam and Eve 17:3); *whereas it had been the most beautiful of all beasts, all of which stood dumb at its beauty, it was now abhorred of them* (1 Adam and Eve 17:5). The restored chronicle of the primeval days remembers the same dumbing of the beasts after Eden: *And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue.* (Jubilees 3:28) — and the whole of that flesh is then driven from the garden: *And He sent out of the Garden of Eden all flesh that was in the Garden of Eden, and all flesh was scattered according to its kinds, and according to its types to the places which had been created for them.* (Jubilees 3:29).',
       sv.verse_id, ev.verse_id, 'extras', 64406
  FROM _session253_1ae17_lookup sv, _session253_1ae17_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-17-serpent-on-its-belly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The serpent crawling on its breast and eating dust at the gate in 1 Adam and Eve 17:2 is the very sentence Yahuah pronounced, now seen carried out.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-serpent-on-its-belly'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 7:17 — *They shall lick the dust like a serpent, they shall move out of their holes like worms of the earth: they shall be afraid of Yahuah Eloheinu (the LORD our God), and shall fear because of thee.* Micah keeps the same emblem of the enemy abased to lick the dust that 1 Adam and Eve 17:2 sets at the western gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-serpent-on-its-belly'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent''s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* Even in the world to come the serpent still eats dust, the same debasement 1 Adam and Eve 17:4 shows beginning on the first day outside.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-serpent-on-its-belly'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-17-old-serpent-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* John names the same identity the book gives in 1 Adam and Eve 17:2 — the serpent that became Satan, the old deceiver cast down to the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-old-serpent-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The cursed serpent crawling at the gate in 1 Adam and Eve 17:2 stands under this very sentence — the head it raised against the woman is already doomed to be bruised by her seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-old-serpent-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The serpent that became Satan in 1 Adam and Eve 17:2 is the devil who sinned from the beginning, whose works the Son of Elohim came to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-old-serpent-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-17-meanest-of-the-beasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 3:28 — *And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue.* Jubilees remembers the same change among the beasts that 1 Adam and Eve 17:5 shows — the creature once admired now standing dumb and abhorred.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-meanest-of-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 3:29 — *And He sent out of the Garden of Eden all flesh that was in the Garden of Eden, and all flesh was scattered according to its kinds, and according to its types to the places which had been created for them.* The beasts fleeing the venomous serpent''s home in 1 Adam and Eve 17:6 belongs to this scattering of all flesh out of Eden after the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-meanest-of-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* The serpent''s fall from the most exalted of beasts to creeping on its belly in 1 Adam and Eve 17:3 is the literal undoing of this curse spoken in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae17_lookup sv, _session253_1ae17_lookup tv
 WHERE t.slug='1-adam-eve-17-meanest-of-the-beasts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

