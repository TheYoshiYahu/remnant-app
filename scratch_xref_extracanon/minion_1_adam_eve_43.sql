-- ----- fragment: minion_1adameve_43.sql (session253 1-adam-eve 43) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae43 (view _session253_1ae43_lookup). Sort band base 65050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-43-satans-fire-deceiver
  ('adam-eve-conflict', '1-adam-eve', 43, 14, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan''s counterfeit fire apes the cherub''s flaming sword, the deceiver dressing his assault as a sign from Elohim in 1 Adam and Eve 43:14.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 15, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The aim to make Adam and Eve deny Yahuah in 1 Adam and Eve 43:15 is the liar''s same first-day work.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 14, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* the prowling adversary who set the cave ablaze in 1 Adam and Eve 43:14 still seeks to devour.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 15, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The one who would cut off their trust in 1 Adam and Eve 43:15 is the same old serpent who deceiveth the whole world.'),
  -- thread: 1-adam-eve-43-blotted-out-seed-war
  ('adam-eve-conflict', '1-adam-eve', 43, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The fear to be blotted from the earth in 1 Adam and Eve 43:10 is the serpent striking at the very seed Eden promised would crush him.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 10, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Against Adam''s dread of erasure in 1 Adam and Eve 43:10 stands the certain crushing of the very enemy assaulting the seed.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 10, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The plot to put their souls to death in 1 Adam and Eve 43:10 is the devil''s work the Son was manifested to destroy.'),
  -- thread: 1-adam-eve-43-gold-incense-myrrh-covenant
  ('adam-eve-conflict', '1-adam-eve', 43, 11, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh Adam fears to lose in 1 Adam and Eve 43:11 are the very treasures the magi bring to the promised Saviour.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 12, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covenant Adam pleads in 1 Adam and Eve 43:12 is the Eden promise of the seed that the kept gifts await.'),
  -- thread: 1-adam-eve-43-mercy-angel-guards-cave
  ('adam-eve-conflict', '1-adam-eve', 43, 16, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel sent around the cave in 1 Adam and Eve 43:16 is the same encamping deliverer of those who fear Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 16, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The charge to guard the cave from the fire in 1 Adam and Eve 43:16 is the angelic keeping the Psalm pledges.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 16, 'canon', 'exodus', 14, 19, 'free', E'Exodus 14:19 — *And the angel of Elohim (God), which went before the camp of Yashar''el (Israel), removed and went behind them; and the pillar of the cloud went from before their face, and stood behind them:* the same angel of Elohim posts himself as a guard, as around the cave in 1 Adam and Eve 43:16.'),
  ('adam-eve-conflict', '1-adam-eve', 43, 16, 'canon', 'hebrews', 1, 7, 'free', E'Hebrews 1:7 — *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire.* The guardian angel of 1 Adam and Eve 43:16 is himself a flame of fire, true fire fencing Satan''s counterfeit blaze.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-43-satans-fire-deceiver',
       E'The fire that was from Satan — the deceiver''s terror',
       E'Adam, seeing the flames, fears Yahuah''s anger: *O Eve, it is because Elohim (God) is angry with us, and will drive us from it* (1 Adam and Eve 43:5). But the page lifts the veil: *But that fire was from Satan. For he had gathered trees and dry grasses, and had carried and brought them to the cave, and had set fire to them, in order to consume the cave and what was in it* (1 Adam and Eve 43:14) — *So that Adam and Eve should be left in sorrow, and he should cut off their trust in Elohim (God), and make them deny Him* (1 Adam and Eve 43:15). It ain''t new: the adversary stages a false sign to drive the seed of the woman to despair and apostasy. *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14) — the fire feigns the cherub''s flame to deceive. He works as he has from the first: *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44). *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — the very enemy named the deceiver of the whole world: *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 65050
  FROM _session253_1ae43_lookup sv, _session253_1ae43_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=43 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-43-blotted-out-seed-war',
       E'To blot out their name — the strike at the seed',
       E'Adam dreads exile unto extinction: *O Eve, if Elohim (God) will bring us into a strange land other than this, in which we find consolation, it must be to put our souls to death, and blot out our name from the face of the earth* (1 Adam and Eve 43:10). This is the serpent''s whole strategy laid bare — to end the line before the Promised Seed can come. Yet the sentence in Eden already named the war and its outcome: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The head Satan strikes at is the woman''s seed, and the crushing is promised: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). For this the Son comes: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The name shall not be blotted out, for the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 65053
  FROM _session253_1ae43_lookup sv, _session253_1ae43_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=43 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-43-gold-incense-myrrh-covenant',
       E'Gold, incense, and myrrh — the covenant kept against the Saviour',
       E'Even in terror Adam clings to the tokens of the promise: *O Eve, if we are further alienated from the garden and from Elohim (God), where shall we find Him again, and ask Him to give us gold, incense, myrrh, and some fruit of the fig-tree?* (1 Adam and Eve 43:11) — *Where shall we find Him, that He may think of us, as regards the covenant He has made on our behalf?* (1 Adam and Eve 43:12). These three are no accident: they are the very gifts laid up against the Saviour''s coming. *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). The covenant Adam pleads is kept, for the Word who comforted him was foreordained: it ain''t new — the gold, incense, and myrrh of the cave reach forward to Bethlehem.',
       sv.verse_id, ev.verse_id, 'extras', 65056
  FROM _session253_1ae43_lookup sv, _session253_1ae43_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=43 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-43-mercy-angel-guards-cave',
       E'By the mercy of Elohim — His angel guards the cave',
       E'The deceiver''s fire does not prevail: *But by the mercy of Elohim (God) he could not burn the cave, for Elohim (God) sent His angel around the cave to guard it from such a fire, until it went out* (1 Adam and Eve 43:16). The seed-keeping mercy posts a guardian, as in the Exodus night: *And the angel of Elohim (God), which went before the camp of Yashar''el (Israel), removed and went behind them; and the pillar of the cloud went from before their face, and stood behind them* (Exodus 14:19). It is the standing promise over those who fear Him: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7) — *For he shall give his angels charge over thee, to keep thee in all thy ways* (Psalm 91:11). And the guardian himself is fire answering fire: *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire* (Hebrews 1:7). Satan''s counterfeit flame is hemmed by the true flame of Yahuah''s keeping.',
       sv.verse_id, ev.verse_id, 'extras', 65059
  FROM _session253_1ae43_lookup sv, _session253_1ae43_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=16
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=43 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-43-satans-fire-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan''s counterfeit fire apes the cherub''s flaming sword, the deceiver dressing his assault as a sign from Elohim in 1 Adam and Eve 43:14.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-satans-fire-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The aim to make Adam and Eve deny Yahuah in 1 Adam and Eve 43:15 is the liar''s same first-day work.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-satans-fire-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* the prowling adversary who set the cave ablaze in 1 Adam and Eve 43:14 still seeks to devour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-satans-fire-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The one who would cut off their trust in 1 Adam and Eve 43:15 is the same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-satans-fire-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-43-blotted-out-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The fear to be blotted from the earth in 1 Adam and Eve 43:10 is the serpent striking at the very seed Eden promised would crush him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-blotted-out-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Against Adam''s dread of erasure in 1 Adam and Eve 43:10 stands the certain crushing of the very enemy assaulting the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-blotted-out-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The plot to put their souls to death in 1 Adam and Eve 43:10 is the devil''s work the Son was manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-blotted-out-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-43-gold-incense-myrrh-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh Adam fears to lose in 1 Adam and Eve 43:11 are the very treasures the magi bring to the promised Saviour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-gold-incense-myrrh-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The covenant Adam pleads in 1 Adam and Eve 43:12 is the Eden promise of the seed that the kept gifts await.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-gold-incense-myrrh-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-43-mercy-angel-guards-cave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel sent around the cave in 1 Adam and Eve 43:16 is the same encamping deliverer of those who fear Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-mercy-angel-guards-cave'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The charge to guard the cave from the fire in 1 Adam and Eve 43:16 is the angelic keeping the Psalm pledges.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-mercy-angel-guards-cave'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:19 — *And the angel of Elohim (God), which went before the camp of Yashar''el (Israel), removed and went behind them; and the pillar of the cloud went from before their face, and stood behind them:* the same angel of Elohim posts himself as a guard, as around the cave in 1 Adam and Eve 43:16.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-mercy-angel-guards-cave'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:7 — *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire.* The guardian angel of 1 Adam and Eve 43:16 is himself a flame of fire, true fire fencing Satan''s counterfeit blaze.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae43_lookup sv, _session253_1ae43_lookup tv
 WHERE t.slug='1-adam-eve-43-mercy-angel-guards-cave'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=43 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

