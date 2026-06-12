-- ----- fragment: minion_1adameve_44.sql (session253 1-adam-eve 44) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch44. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae44 (view _session253_1ae44_lookup). Sort band base 65075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae44_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-44-angel-guards-the-cave
  ('adam-eve-conflict', '1-adam-eve', 44, 2, 'canon', 'psalms', 104, 4, 'free', E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The guarding angel of 1-adam-eve 44:2 is one of these ministers of flame, mastering the very fire Satan kindled.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 1, 'canon', 'exodus', 3, 2, 'free', E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* As the bush burned unconsumed, so the angel keeps the cave unconsumed in the fire of 1-adam-eve 44:1.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 2, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The same flaming cherubic guard set over Eden''s way now guards the cave-of-treasures in 1-adam-eve 44:2.'),
  -- thread: 1-adam-eve-44-the-word-rebukes-the-deceiver
  ('adam-eve-conflict', '1-adam-eve', 44, 4, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Satan in 1-adam-eve 44:4 is this same Logos who was Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The Word''s charge that Satan "once before deceived My servants" in 1-adam-eve 44:4 names the disguising deceiver Paul warns of.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 4, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The one who first deceived and now seeks to destroy in 1-adam-eve 44:4 is the murderer and liar from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The Satan rebuked at the cave in 1-adam-eve 44:4 is the same old serpent who deceiveth the whole world.'),
  -- thread: 1-adam-eve-44-mercy-until-the-end-of-the-world
  ('adam-eve-conflict', '1-adam-eve', 44, 5, 'canon', 'romans', 2, 4, 'free', E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* The mercy and patience that spare Satan "until the end of the world" in 1-adam-eve 44:5 are this forbearance and longsuffering of Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 5, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The delayed judgment "until the end of the world" in 1-adam-eve 44:5 is Yahuah''s longsuffering, not slackness.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 5, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The destruction withheld by mercy in 1-adam-eve 44:5 is appointed for the end, when the Son is manifested to destroy the devil''s works.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 5, 'jubilees', 'jubilees', 10, 8, 'extras', E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* The same divine patience that leaves the enemy his hosts "until the end of the world" in 1-adam-eve 44:5 lets a remnant of Mastema''s spirits remain in Noah''s day.'),
  -- thread: 1-adam-eve-44-satan-flees-the-seed-kept
  ('adam-eve-conflict', '1-adam-eve', 44, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s fleeing in 1-adam-eve 44:6 is one defeat in the enmity Yahuah set between the serpent and the seed of the woman.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 6, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enemy driven off at the cave in 1-adam-eve 44:6 will at the last be bruised wholly under the feet of the redeemed.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 6, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour by whom the seed is kept from the forty-sixth day outside the garden in 1-adam-eve 44:6 was foreordained before the world''s foundation.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 6, 'enoch', '1-enoch', 54, 1, 'extras', E'1 Enoch 54:1 — *And I looked and turned to another part of the earth, and saw there a deep valley with burning fire.* The fire that surrounds the cave but cannot reach the seed in 1-adam-eve 44:6 foreshadows the valley of burning fire prepared for Satan''s hosts that Enoch beheld.'),
  -- thread: 1-adam-eve-44-our-nature-is-altered
  ('adam-eve-conflict', '1-adam-eve', 44, 9, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s lament that "our nature is altered" in 1-adam-eve 44:9 unfolds the curse spoken in Eden that bound man to the ground and to death.'),
  ('adam-eve-conflict', '1-adam-eve', 44, 8, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The fire that separates Adam and Eve from the cave and afflicts them in 1-adam-eve 44:8 echoes the flaming sword that bars the way back to the garden.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae44_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae44_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-44-angel-guards-the-cave',
       E'The angel of Yahuah guards the cave in the fire',
       E'Satan builds the flames high to consume the cave, *And Satan kept on bringing trees and throwing them into the fire, until the flames of the fire rose up on high, and covered the whole cave, thinking, as he did in his own mind, to consume the cave with much fire. But the angel of Yahuah (Lord) was guarding it.* (1-adam-eve 44:2) — and the unburnt dwelling within the fire is the old wonder. Yahuah''s ministering ones ARE fire: *Who maketh his angels spirits; his ministers a flaming fire:* (Psalm 104:4). At the bush the flame did not consume: *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* (Exodus 3:2). And the same flaming guard had kept Eden''s gate: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24).',
       sv.verse_id, ev.verse_id, 'extras', 65075
  FROM _session253_1ae44_lookup sv, _session253_1ae44_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=44 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-44-the-word-rebukes-the-deceiver',
       E'The Word of Elohim rebukes the old deceiver',
       E'The Logos Himself silences the accuser: *until the Word of Elohim (God) came who said to Satan, "Go away from here; once before you deceived My servants, and this time you seek to destroy them.* (1-adam-eve 44:4) — the Word who was from the beginning, *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1). The charge names the same enemy under his masks. He counterfeits even comfort and light: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). He was a deceiver and destroyer from the first: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44). It is that old serpent still: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 65078
  FROM _session253_1ae44_lookup sv, _session253_1ae44_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=44 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-44-mercy-until-the-end-of-the-world',
       E'Mercy spares the enemy until the end of the world',
       E'Even the rebuke of Satan is held back by mercy: *Were it not for My mercy I would have destroyed you and your hosts from off the earth. But I have had patience with you, until the end of the world.* (1-adam-eve 44:5) — the longsuffering that delays judgment is the riches of Yahuah''s goodness: *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The promise He withholds judgment to keep: *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* (2 Peter 3:9). Yet the appointed undoing is sure, for the Son was manifested to end the enemy''s works: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8). The same patience-then-judgment over Mastema''s hosts is told from the days of Noah: *And the chief of the spirits, Mastêmâ, came and said... "Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation."* (Jubilees 10:8).',
       sv.verse_id, ev.verse_id, 'extras', 65081
  FROM _session253_1ae44_lookup sv, _session253_1ae44_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=44 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-44-satan-flees-the-seed-kept',
       E'Satan flees; the seed of the woman is kept',
       E'The deceiver cannot stand before the Word and is driven off, the seed preserved: *Then Satan fled from before Yahuah (Lord). But the fire went on burning around the cave like a coal-fire the whole day; which was the forty-sixth day Adam and Eve had spent since they came out of the garden.* (1-adam-eve 44:6) — every assault is the serpent striking at the seed of the woman, and Yahuah''s mercy keeps the seed: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The crushing is sure and soon: *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* (Romans 16:20). The Saviour who keeps the seed was no afterthought but foreordained from before the world: *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* (1 Peter 1:20). The valley of burning fire prepared for the enemy''s hosts is the same judgment Enoch saw: *And I looked and turned to another part of the earth, and saw there a deep valley with burning fire.* (1 Enoch 54:1).',
       sv.verse_id, ev.verse_id, 'extras', 65084
  FROM _session253_1ae44_lookup sv, _session253_1ae44_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=44 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-44-our-nature-is-altered',
       E'Our nature is altered; the fire now scorches',
       E'Adam reads his fallen estate in the fire that once served him and now burns: *See this fire of which we have a portion in us: which formerly yielded to us, but no longer does so, now that we have transgressed the limit of creation, and changed our condition, and our nature is altered.* (1-adam-eve 44:9) — the sentence of the fall is that the creature, once at home in the garden, is now subject to the ground and to death: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). The way back is barred by the very fire of the guard: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24).',
       sv.verse_id, ev.verse_id, 'extras', 65087
  FROM _session253_1ae44_lookup sv, _session253_1ae44_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=44 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-44-angel-guards-the-cave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The guarding angel of 1-adam-eve 44:2 is one of these ministers of flame, mastering the very fire Satan kindled.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-angel-guards-the-cave'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* As the bush burned unconsumed, so the angel keeps the cave unconsumed in the fire of 1-adam-eve 44:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-angel-guards-the-cave'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The same flaming cherubic guard set over Eden''s way now guards the cave-of-treasures in 1-adam-eve 44:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-angel-guards-the-cave'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-44-the-word-rebukes-the-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Satan in 1-adam-eve 44:4 is this same Logos who was Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-the-word-rebukes-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The Word''s charge that Satan "once before deceived My servants" in 1-adam-eve 44:4 names the disguising deceiver Paul warns of.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-the-word-rebukes-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The one who first deceived and now seeks to destroy in 1-adam-eve 44:4 is the murderer and liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-the-word-rebukes-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The Satan rebuked at the cave in 1-adam-eve 44:4 is the same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-the-word-rebukes-the-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-44-mercy-until-the-end-of-the-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* The mercy and patience that spare Satan "until the end of the world" in 1-adam-eve 44:5 are this forbearance and longsuffering of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-mercy-until-the-end-of-the-world'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The delayed judgment "until the end of the world" in 1-adam-eve 44:5 is Yahuah''s longsuffering, not slackness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-mercy-until-the-end-of-the-world'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The destruction withheld by mercy in 1-adam-eve 44:5 is appointed for the end, when the Son is manifested to destroy the devil''s works.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-mercy-until-the-end-of-the-world'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* The same divine patience that leaves the enemy his hosts "until the end of the world" in 1-adam-eve 44:5 lets a remnant of Mastema''s spirits remain in Noah''s day.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-mercy-until-the-end-of-the-world'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-44-satan-flees-the-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s fleeing in 1-adam-eve 44:6 is one defeat in the enmity Yahuah set between the serpent and the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-satan-flees-the-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enemy driven off at the cave in 1-adam-eve 44:6 will at the last be bruised wholly under the feet of the redeemed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-satan-flees-the-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour by whom the seed is kept from the forty-sixth day outside the garden in 1-adam-eve 44:6 was foreordained before the world''s foundation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-satan-flees-the-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 54:1 — *And I looked and turned to another part of the earth, and saw there a deep valley with burning fire.* The fire that surrounds the cave but cannot reach the seed in 1-adam-eve 44:6 foreshadows the valley of burning fire prepared for Satan''s hosts that Enoch beheld.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-satan-flees-the-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-44-our-nature-is-altered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s lament that "our nature is altered" in 1-adam-eve 44:9 unfolds the curse spoken in Eden that bound man to the ground and to death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-our-nature-is-altered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The fire that separates Adam and Eve from the cave and afflicts them in 1-adam-eve 44:8 echoes the flaming sword that bars the way back to the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae44_lookup sv, _session253_1ae44_lookup tv
 WHERE t.slug='1-adam-eve-44-our-nature-is-altered'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=44 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

