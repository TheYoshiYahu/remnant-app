-- =====================================================================
-- S227 enrichment — REVELATION 2 (roots: prophetic adds; letters are light on apocalyptic)
-- ADD-ONLY. References shared view _s227_rev_lookup (defined by assembled migration).
-- Member sort_order starts at 21 to avoid colliding with existing 1..n members.
-- =====================================================================

-- ---------------------------------------------------------------------
-- thread: revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44
-- existing: Isaiah 44:6, Revelation 22:13. ADD Isaiah 41:4 (additional first-last witness).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',2,8,'canon','isaiah',41,4,'free', E'*Who hath wrought and done it, calling the generations from the beginning? I Yahuah (LORD), the first, and with the last; I am he.* (Isaiah 41:4). The name spoken to Smyrna — *the first and the last, which was dead, and is alive* (Revelation 2:8) — is Yahuah''s (LORD''s) self-naming across Isaiah: the One *calling the generations from the beginning* is *the first, and with the last; I am he.* The Formed who took that name on his own lips and yet died and rose comforts the persecuted assembly with the divine name that governs every generation and outlasts death itself.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 41:4 — *I Yahuah (LORD), the first, and with the last; I am he* the One calling the generations from the beginning; the name *the first and the last, which was dead, and is alive* spoken to Smyrna (Revelation 2:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2
-- existing: Romans 2:28, 2:29 (NT only). ADD prophetic root Isaiah 48:1 (claim the name "but not in truth").
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',2,9,'canon','isaiah',48,1,'free', E'*Hear ye this, O house of Jacob, which are called by the name of Yashar''el (Israel), and are come forth out of the waters of Yahudah (Judah), which swear by the name of Yahuah (LORD), and make mention of the Elohim (God) of Yashar''el (Israel), but not in truth, nor in righteousness.* (Isaiah 48:1). Isaiah already drew the false-claim diagnostic the letter assumes: those *called by the name of Yashar''el (Israel)* who *swear by the name of Yahuah (LORD)* and *make mention of the Elohim (God) of Yashar''el (Israel), but not in truth.* So *them which say they are Yahudim (Jews), and are not* (Revelation 2:9) names the same gap Isaiah named — the covenant name on the lips, but not in truth nor in righteousness. The charge falls on the false claim, never on the people of Yahudah (Judah) whom the prophets gather home.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 48:1 — *called by the name of Yashar''el (Israel)... make mention of the Elohim (God) of Yashar''el (Israel), but not in truth* the prophets'' own false-claim diagnostic; *them which say they are Yahudim (Jews), and are not* (Revelation 2:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25
-- existing: Numbers 25:1, 25:3, 31:16. ADD Numbers 25:2 (the idol-meat itself: "did eat... bowed down").
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',2,14,'canon','numbers',25,2,'free', E'*And they called the people unto the sacrifices of their gods: and the people did eat, and bowed down to their gods.* (Numbers 25:2). Here is the very idol-meat the doctrine of Balaam casts as a stumblingblock — Moab *called the people unto the sacrifices of their gods,* and Yashar''el (Israel) *did eat, and bowed down to their gods.* That is precisely the snare laid at Pergamos: *to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). To eat the sacrifice is to bow to the god; the table and the worship are one act, and the doctrine of Balaam teaches exactly this joining.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Numbers 25:2 — *the people did eat, and bowed down to their gods* the idol-meat is the idol-worship; the very stumblingblock *to eat things sacrificed unto idols* the doctrine of Balaam casts (Revelation 2:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16
-- existing: Exodus 16:4, 16:15, John 6:32, John 6:51. ADD Psalm 78:24 (corn of heaven/angels' food)
--           + Isaiah 56:5 (the white-stone NEW NAME root, "an everlasting name... not be cut off").
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',2,17,'canon','psalms',78,24,'free', E'*And had rained down manna upon them to eat, and had given them of the corn of heaven.* (Psalm 78:24). The psalm remembers the manna as heaven''s own grain — *the corn of heaven,* and in the next breath *angels'' food* — rained down to feed the fathers in the wilderness. That is the bread held in store for the overcomer: *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17). The hidden manna is the corn of heaven reserved, the table of the Elohim (God) of Yashar''el (Israel) set against the idol-meat of Pergamos.'),
  ('canon','revelation',2,17,'canon','isaiah',56,5,'free', E'*Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* (Isaiah 56:5). The white stone carries *a new name written, which no man knoweth saving he that receiveth it* (Revelation 2:17) — and Isaiah is the root of that gift: to the faithful Yahuah (LORD) gives *a place and a name... an everlasting name, that shall not be cut off.* The new name on the stone is the everlasting name the prophet promised, a name given within the walls of the house, secured forever to the one who overcomes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 78:24 — *rained down manna upon them to eat, and had given them of the corn of heaven* the manna as heaven''s own grain, reserved for the overcomer (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 56:5 — *I will give them an everlasting name, that shall not be cut off* the root of the white stone''s new name; the new name written that no man knoweth (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21
-- existing: 1 Kings 16:31, 1 Kings 21:25, 2 Kings 9:22. ADD Nahum 3:4 (the prophets' harlot-and-witchcraft figure).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',2,20,'canon','nahum',3,4,'free', E'*Because of the multitude of the whoredoms of the wellfavoured harlot, the mistress of witchcrafts, that selleth nations through her whoredoms, and families through her witchcrafts.* (Nahum 3:4). The prophets render idolatry as the figure of the *harlot, the mistress of witchcrafts* — the very pairing Jehu named in Jezebel, *the whoredoms... and her witchcrafts.* So *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20) stands in the prophets'' own line of the seductress whose whoredoms and witchcrafts draw the covenant people away — the spiritual harlotry the prophets withstood, brought now into the assembly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Nahum 3:4 — *the whoredoms of the wellfavoured harlot, the mistress of witchcrafts* the prophets'' harlot-and-witchcraft figure for idolatry, the same pairing named in Jezebel; *that woman Jezebel... to seduce my servants* (Revelation 2:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
