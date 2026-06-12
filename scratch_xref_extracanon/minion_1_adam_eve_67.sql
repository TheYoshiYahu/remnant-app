-- ----- fragment: minion_1adameve_67.sql (session253 1-adam-eve 67) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch67. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae67 (view _session253_1ae67_lookup). Sort band base 65650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae67_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-67-burnt-wheat-seed-war
  ('adam-eve-conflict', '1-adam-eve', 67, 1, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The hand-reaped wheat of 1 Adam and Eve 67:1 is the curse-ground toil of the fall, and Satan strikes at the very bread it yields.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to burn the corn and empty the water so as to kill Adam and Eve (1 Adam and Eve 67:3) is the serpent''s enmity striking at the seed of the woman from the first days outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 5, 'jubilees', 'jubilees', 11, 11, 'extras', E'Jubilees 11:11 — *And the prince Mastêmâ sent ravens and birds to devour the seed which was sown in the land, in order to destroy the land, and rob the children of men of their labours. Before they could plough in the seed, the ravens picked (it) from the surface of the ground.* The same adversary who burns Adam''s reaped heap (1 Adam and Eve 67:5) is shown again robbing the children of men of their harvest-labour — it ain''t new.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 3, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Satan''s scheme to slay Adam and Eve by hunger and thirst (1 Adam and Eve 67:3) is the devouring adversary at his oldest work.'),
  -- thread: 1-adam-eve-67-angels-of-light-deception
  ('adam-eve-conflict', '1-adam-eve', 67, 8, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan and his hosts meeting Adam and Eve in the form of angels praising Elohim (1 Adam and Eve 67:8) is the very transformation the apostle warns of.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 10, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The false promise of a better field and a fountain (1 Adam and Eve 67:10) is the murderer-and-liar from the beginning speaking of his own.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 8, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The disguised hosts of 1 Adam and Eve 67:8 are the old serpent and his angels who deceive the whole world.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 11, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Adam thinking the deceivers true and going back with them (1 Adam and Eve 67:11) is Eve beguiled through subtilty once more.'),
  -- thread: 1-adam-eve-67-led-astray-to-deny-elohim
  ('adam-eve-conflict', '1-adam-eve', 67, 4, 'canon', 'matthew', 4, 3, 'free', E'Matthew 4:3 — *And when the tempter came to him, he said, If thou be the Son of Elohim (God), command that these stones be made bread.* The plan to break Adam and Eve by hunger until they deny Elohim (1 Adam and Eve 67:4) is the same hunger-lever the tempter pressed against the Son in the wilderness.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 4, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* Satan empties their bottle of water to kill them with thirst (1 Adam and Eve 67:4), but the Word alone gives the water that quenches forever.'),
  ('adam-eve-conflict', '1-adam-eve', 67, 12, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Though Satan leads them astray eight days and leaves them as dead (1 Adam and Eve 67:12), the seed-promise guarantees Satan bruised under the feet of the redeemed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae67_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae67_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-67-burnt-wheat-seed-war',
       E'Satan burns the reaped wheat — the enemy robs the seed of its labour',
       E'Adam and Eve pull up the wheat Yahuah showed them and heap it, then sleep faint with toil: *Then they heaped it into a pile; and, faint from heat and from thirst, they went under a shady tree, where the breeze fanned them to sleep* (1 Adam and Eve 67:2). At once the adversary moves against the bread of the man''s labour — *come, let us set fire to this heap of corn, and burn it, and let us take that bottle of water that is by them, and empty it out, so that they may find nothing to drink, and we kill them with hunger and thirst* (1 Adam and Eve 67:3). This is the very curse-ground toil of the fall under attack: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground* (Genesis 3:19), and behind every assault stands the old enmity, *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new — the same hand that here burns the corn is shown in Jubilees robbing men of their harvest: *And the prince Mastêmâ sent ravens and birds to devour the seed which was sown in the land, in order to destroy the land, and rob the children of men of their labours* (Jubilees 11:11). The adversary prowls as ever, *as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 65650
  FROM _session253_1ae67_lookup sv, _session253_1ae67_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=67 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-67-angels-of-light-deception',
       E'Satan and his hosts as praising angels — transformed into an angel of light',
       E'Going up wounded from the burned field, Adam and Eve are met by the enemy in disguise: *Satan and his hosts met them in the form of angels, praising Elohim (God)* (1 Adam and Eve 67:8). With false comfort the deceiver lies, *Come back with us; we are angels of Elohim (God). Elohim (God) sent us to you, to show you another field of corn, better than that; and beyond it is a fountain of good water* (1 Adam and Eve 67:10). This is the apostle''s exact unmasking: *Satan himself is transformed into an angel of light* (2 Corinthians 11:14), and the serpent who *beguiled Eve through his subtilty* (2 Corinthians 11:3) is here at it again. He is the liar by nature — *He was a murderer from the beginning, and abode not in the truth... for he is a liar, and the father of it* (John 8:44) — *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 65653
  FROM _session253_1ae67_lookup sv, _session253_1ae67_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=67 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-67-led-astray-to-deny-elohim',
       E'Driven by hunger and thirst that they might deny Elohim',
       E'The enemy''s whole aim is named: that worn down by hunger and thirst, *they die of hunger and thirst; when they may, perhaps, deny Elohim (God), and He destroy them* (1 Adam and Eve 67:4) — and so *Satan began to lead astray Adam and Eve eight days, until they both fell down as if dead, from hunger, thirst, and faintness* (1 Adam and Eve 67:12). It is the tempter''s same lever pressed against the Second Adam in the wilderness — *And when the tempter came to him, he said, If thou be the Son of Elohim (God), command that these stones be made bread* (Matthew 4:3) — yet the deceiver who poured out their water cannot give the true drink, for only the Word gives *a well of water springing up into everlasting life* (John 4:14). And the promise stands over every assault: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65656
  FROM _session253_1ae67_lookup sv, _session253_1ae67_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=67 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-67-burnt-wheat-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The hand-reaped wheat of 1 Adam and Eve 67:1 is the curse-ground toil of the fall, and Satan strikes at the very bread it yields.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-burnt-wheat-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to burn the corn and empty the water so as to kill Adam and Eve (1 Adam and Eve 67:3) is the serpent''s enmity striking at the seed of the woman from the first days outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-burnt-wheat-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 11:11 — *And the prince Mastêmâ sent ravens and birds to devour the seed which was sown in the land, in order to destroy the land, and rob the children of men of their labours. Before they could plough in the seed, the ravens picked (it) from the surface of the ground.* The same adversary who burns Adam''s reaped heap (1 Adam and Eve 67:5) is shown again robbing the children of men of their harvest-labour — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-burnt-wheat-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Satan''s scheme to slay Adam and Eve by hunger and thirst (1 Adam and Eve 67:3) is the devouring adversary at his oldest work.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-burnt-wheat-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-67-angels-of-light-deception
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan and his hosts meeting Adam and Eve in the form of angels praising Elohim (1 Adam and Eve 67:8) is the very transformation the apostle warns of.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-angels-of-light-deception'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The false promise of a better field and a fountain (1 Adam and Eve 67:10) is the murderer-and-liar from the beginning speaking of his own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-angels-of-light-deception'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The disguised hosts of 1 Adam and Eve 67:8 are the old serpent and his angels who deceive the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-angels-of-light-deception'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Adam thinking the deceivers true and going back with them (1 Adam and Eve 67:11) is Eve beguiled through subtilty once more.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-angels-of-light-deception'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-67-led-astray-to-deny-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 4:3 — *And when the tempter came to him, he said, If thou be the Son of Elohim (God), command that these stones be made bread.* The plan to break Adam and Eve by hunger until they deny Elohim (1 Adam and Eve 67:4) is the same hunger-lever the tempter pressed against the Son in the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-led-astray-to-deny-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* Satan empties their bottle of water to kill them with thirst (1 Adam and Eve 67:4), but the Word alone gives the water that quenches forever.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-led-astray-to-deny-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Though Satan leads them astray eight days and leaves them as dead (1 Adam and Eve 67:12), the seed-promise guarantees Satan bruised under the feet of the redeemed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae67_lookup sv, _session253_1ae67_lookup tv
 WHERE t.slug='1-adam-eve-67-led-astray-to-deny-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=67 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

