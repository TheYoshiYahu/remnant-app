-- =====================================================================
-- S227 enrichment — REVELATION 1 (roots: prophetic + extra-canonical adds)
-- ADD-ONLY. References shared view _s227_rev_lookup (defined by assembled migration).
-- Member sort_order starts at 21 to avoid colliding with existing 1..n members.
-- =====================================================================

-- ---------------------------------------------------------------------
-- thread: revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19
-- existing: Exodus 19:6 only. ADD prophetic roots for "faithful witness" + "kings and priests".
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',1,5,'canon','isaiah',55,4,'free', E'*Behold, I have given him for a witness to the people, a leader and commander to the people.* (Isaiah 55:4). John''s opening Christology names Yahusha (Jesus) *the faithful witness* (Revelation 1:5) — the very office Isaiah gives the seed of David, *a witness to the people, a leader and commander to the people.* The faithful witness who loved us and washed us in his own blood is the Davidic witness-King the prophets foretold.'),
  ('canon','revelation',1,6,'canon','isaiah',61,6,'free', E'*But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God): ye shall eat the riches of the Gentiles, and in their glory shall ye boast yourselves.* (Isaiah 61:6). The Sinai promise of a kingdom of priests is carried forward by Isaiah onto the restored seed — *ye shall be named the Priests of Yahuah (LORD).* So when the slain Lamb *hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6), it is the covenant calling of Yashar''el (Israel) brought to its purpose, not a new people replacing her.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 55:4 — *I have given him for a witness to the people, a leader and commander to the people* the Davidic witness-office; Yahusha (Jesus) *the faithful witness* (Revelation 1:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 61:6 — *ye shall be named the Priests of Yahuah (LORD)* the Sinai priesthood carried forward onto the restored seed; *made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-1-the-faithful-witness-who-made-us-kings-and-priests-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44
-- existing: Isaiah 44:6 (x2), Isaiah 48:12. ADD Isaiah 41:4 + 1 Enoch 48:3 (named before the sun).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',1,8,'canon','isaiah',41,4,'free', E'*Who hath wrought and done it, calling the generations from the beginning? I Yahuah (LORD), the first, and with the last; I am he.* (Isaiah 41:4). The Alpha-and-Omega name is Isaiah''s through and through: the One who calls *the generations from the beginning* is *the first, and with the last.* So the Formed One who says *I am Alpha and Omega, the beginning and the ending* (Revelation 1:8) speaks the very self-naming by which Yahuah (LORD) governs all the generations — first and last, beginning and ending, the same.'),
  ('canon','revelation',1,11,'enoch','1-enoch',48,3,'extras', E'*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* (1 Enoch 48:3). The Hebrew library holds the first-and-last name as a naming before creation itself: the Son of Adam''s name was *named before Yahuah (God) of Spirits* before sun and stars were made. The One who declares *I am Alpha and Omega, the first and the last* (Revelation 1:11) bears in the apocalypse the name the library says was his before the beginning — first because he was named before the first thing made, last because he outlasts them all.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 41:4 — *I Yahuah (LORD), the first, and with the last; I am he* the One who calls the generations from the beginning; the Formed takes the same name *I am Alpha and Omega, the beginning and the ending* (Revelation 1:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 48:3 — *before the sun and the signs were created... His name was named before Yahuah (God) of Spirits* the first-and-last name as a naming before creation; *I am Alpha and Omega, the first and the last* (Revelation 1:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-1-i-am-alpha-and-omega-the-first-and-the-last-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62
-- existing: 1 Enoch 14:15, 46:3, 62:7. ADD 1 Enoch 48:6 (chosen and hidden before creation).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',1,18,'enoch','1-enoch',48,6,'extras', E'*And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* (1 Enoch 48:6). The One among the lampstands declares *I am he that liveth, and was dead; and, behold, I am alive for evermore* (Revelation 1:18) — and the library knew this Son of Adam as the elect One *chosen and hidden before Him, Before the creation of the world and for evermore.* Chosen before the world, alive *for evermore*: the slain-yet-living One who holds the keys of death is the Elect One Enoch saw kept hidden beside the Head of Days from before the beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 48:6 — *he been chosen and hidden before Him, Before the creation of the world and for evermore* the Elect One kept hidden before the beginning; the slain-yet-living One *alive for evermore* who holds the keys of death (Revelation 1:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-1-the-son-of-adam-on-the-throne-of-glory-in-1-enoch-14-46-62'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
