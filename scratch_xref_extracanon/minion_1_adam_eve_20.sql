-- ----- fragment: minion_1adameve_20.sql (session253 1-adam-eve 20) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae20 (view _session253_1ae20_lookup). Sort band base 64475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-20-serpent-rises-against-seed
  ('adam-eve-conflict', '1-adam-eve', 20, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent rising against Eve to kill her in 1 Adam & Eve 20:1 is exactly this enmity already at work the first day outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 1, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam''s dread of the serpent in 20:1 is the same conflict whose verdict Sha''ul announces — Satan bruised under the seed''s feet.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent with hideous, evil eyes pressing against Eve in 20:1 is that same old serpent who deceiveth the whole world.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 1, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The serpent seeking Eve alone to kill her in 20:1 is the adversary Kepha warns still walks about seeking whom he may devour.'),
  -- thread: 1-adam-eve-20-i-have-driven-it-away
  ('adam-eve-conflict', '1-adam-eve', 20, 2, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Elohim''s promise in 20:2 not to let the serpent come near and to drive it away is the same angelic charge that keeps the faithful in all their ways.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 2, 'canon', 'psalms', 91, 13, 'free', E'Psalm 91:13 — *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet.* The promise that the serpent shall have no ability to hurt them in 20:2 is the trampling of the adder and the dragon underfoot.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 2, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* Yahuah driving the serpent from the mountain in 20:2 is the angel of Yahuah encamping round about those that fear Him.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 2, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Word''s stripping the serpent of its ability to hurt in 20:2 foreshadows the Son manifested to destroy the works of the devil.'),
  -- thread: 1-adam-eve-20-worship-delivered-from-death
  ('adam-eve-conflict', '1-adam-eve', 20, 3, 'canon', 'psalms', 34, 17, 'free', E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Adam and Eve''s thanksgiving in 20:3 answers the cry of 20:1 — the righteous cry and Yahuah hears and delivers them out of all their troubles.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 3, 'canon', 'psalms', 34, 19, 'free', E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* The deliverance from death praised in 20:3 is the very pattern — many afflictions, but Yahuah delivers His own out of them all.'),
  ('adam-eve-conflict', '1-adam-eve', 20, 3, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Being delivered from death in 20:3 is rescue from the hand of the murderer from the beginning whom Yahusha names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-20-serpent-rises-against-seed',
       E'The serpent that rises against Eve — the enmity from the first day out',
       E'Adam cries from outside the garden, *"O Elohim (God), take us away to some other place, where the serpent can not come near us again, and rise against us. For fear that it might find Your handmaid Eve alone and kill her; for its eyes are hideous and evil."* (1 Adam & Eve 20:1). It ain''t new: this is the very enmity Yahuah spoke in the garden — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The serpent that hunts Eve to kill her is the seed-war from day one, and Sha''ul names its end — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* (Romans 16:20). John unmasks the old serpent: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 64475
  FROM _session253_1ae20_lookup sv, _session253_1ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-20-i-have-driven-it-away',
       E'"I have driven it away from you" — Yahuah''s covenant mercy keeps the seed',
       E'Elohim answers the cry: *"From now on, don''t be afraid, I will not let it come near you; I have driven it away from you, from this mountain; neither will I leave in it the ability to hurt you."* (1 Adam & Eve 20:2). The Word who guards the holy line on the mountain is the same mercy David sings — *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11) — and *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet.* (Psalm 91:13). It is Yahuah''s own angel that hedges the seed about: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* (Psalm 34:7). And the purpose behind the driving-away is the undoing of the serpent altogether — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 64478
  FROM _session253_1ae20_lookup sv, _session253_1ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-20-worship-delivered-from-death',
       E'They worshipped and gave thanks — delivered from death',
       E'*Then Adam and Eve worshipped before Elohim (God) and gave Him thanks, and praised Him for having delivered them from death.* (1 Adam & Eve 20:3). This is the worship of the righteous who cry and are heard — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* (Psalm 34:17) — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* (Psalm 34:19). The deliverance from death they praise is the very work the Son was sent to finish against the murderer-from-the-beginning — *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* (John 8:44).',
       sv.verse_id, ev.verse_id, 'extras', 64481
  FROM _session253_1ae20_lookup sv, _session253_1ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-20-serpent-rises-against-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent rising against Eve to kill her in 1 Adam & Eve 20:1 is exactly this enmity already at work the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-serpent-rises-against-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam''s dread of the serpent in 20:1 is the same conflict whose verdict Sha''ul announces — Satan bruised under the seed''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-serpent-rises-against-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent with hideous, evil eyes pressing against Eve in 20:1 is that same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-serpent-rises-against-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The serpent seeking Eve alone to kill her in 20:1 is the adversary Kepha warns still walks about seeking whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-serpent-rises-against-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-20-i-have-driven-it-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Elohim''s promise in 20:2 not to let the serpent come near and to drive it away is the same angelic charge that keeps the faithful in all their ways.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-i-have-driven-it-away'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:13 — *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet.* The promise that the serpent shall have no ability to hurt them in 20:2 is the trampling of the adder and the dragon underfoot.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-i-have-driven-it-away'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* Yahuah driving the serpent from the mountain in 20:2 is the angel of Yahuah encamping round about those that fear Him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-i-have-driven-it-away'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Word''s stripping the serpent of its ability to hurt in 20:2 foreshadows the Son manifested to destroy the works of the devil.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-i-have-driven-it-away'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-20-worship-delivered-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Adam and Eve''s thanksgiving in 20:3 answers the cry of 20:1 — the righteous cry and Yahuah hears and delivers them out of all their troubles.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-worship-delivered-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* The deliverance from death praised in 20:3 is the very pattern — many afflictions, but Yahuah delivers His own out of them all.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-worship-delivered-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Being delivered from death in 20:3 is rescue from the hand of the murderer from the beginning whom Yahusha names.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae20_lookup sv, _session253_1ae20_lookup tv
 WHERE t.slug='1-adam-eve-20-worship-delivered-from-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

