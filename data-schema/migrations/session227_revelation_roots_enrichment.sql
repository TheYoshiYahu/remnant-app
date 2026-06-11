-- =====================================================================
-- Session 227 — Revelation ROOTS ENRICHMENT (S224/S225/S226 follow-up)
-- =====================================================================
-- Yoshi's interpretive KEY for Revelation, applied across the whole book:
-- Revelation invents almost no new vocabulary — it RECYCLES the Hebrew
-- prophets' imagery, and the Second-Temple apocalyptic corpus supplies the
-- rest of John's dictionary. So every Revelation symbol's roots must be present
-- and NAVIGABLE: the canon/NT weave PLUS its prophetic source(s) PLUS its
-- extra-canonical parallel(s), as real cross-references, not just prose.
--
-- The S227 roots audit found the apparatus already strongly prophet-grounded
-- (124/149 threads) but thin on the apocalyptic dictionary as formal members
-- (only 52/149 carried any extra-canonical cross-reference). This migration
-- closes the gap: it ADDS prophetic and extra-canonical cross_references +
-- thread members to the live Revelation threads, where a REAL root exists
-- (never forcing a parallel that isn't genuinely there). It rewrites and
-- deletes nothing — every change is an additive ON CONFLICT DO NOTHING insert.
--
-- Roots bound here include: Daniel (the beasts, the little horn, the Son of
-- Adam, the books opened, the kingdom that crushes), Ezekiel (the throne-
-- chariot, the sealed/eaten scroll, the seal on the forehead, the two sticks,
-- Gog, the harlot, the river, the tribal gates), Isaiah (Babylon's fall, the
-- new heavens, the winepress, the first-and-last, the jeweled city, the light),
-- Jeremiah (Babylon, come-out-of-her, word-as-fire, the millstone), Zechariah
-- (the two olive trees, the horsemen, the measuring line), Joel/Amos/Nahum/
-- Zephaniah/Micah/Habakkuk/Malachi/Hosea — and the apocalyptic dictionary:
-- 1 Enoch (the Son of Man/Elect One, the watchers chained in the abyss, the
-- books of the living opened, the throne of glory, the winepress of blood),
-- 2 Esdras/4 Ezra (the eagle vision, the man from the sea, the souls asking
-- how long, the sealed company on Zion, the bride-city revealed), Tobit (the
-- jeweled New Jerusalem), Wisdom, Sirach (Elijah as fire), Baruch, 2 Maccabees
-- (Jeremiah hides the ark until the gathering), and the Testaments. Editions
-- whose parsed text was garbled (2 Baruch) or mismapped (1 Enoch 25) were
-- deliberately not cited, to keep every quote verbatim-faithful.
--
-- Idempotent: every insert is ON CONFLICT DO NOTHING. The source fragments are
-- scratch_xref_revelation/minion_enrich_rev_<NN>.sql (kept as the record).
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session227_revelation_roots_enrichment.sql
-- =====================================================================

\echo 'session227 — Revelation roots enrichment (prophetic + extra-canonical) starting...'
BEGIN;

CREATE TEMP VIEW _s227_rev_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== chapter 01 =====
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

-- ===== chapter 02 =====
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

-- ===== chapter 03 =====
-- =====================================================================
-- S227 enrichment — REVELATION 3 (roots: prophetic adds; letters are light on apocalyptic)
-- ADD-ONLY. References shared view _s227_rev_lookup (defined by assembled migration).
-- Member sort_order starts at 21 to avoid colliding with existing 1..n members.
-- =====================================================================

-- ---------------------------------------------------------------------
-- thread: revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22
-- existing: Isaiah 22:22 (the primary key-of-David root). ADD Isaiah 45:1 (the gates none can shut).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,8,'canon','isaiah',45,1,'free', E'*Thus saith Yahuah (LORD) to his anointed... I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut* (Isaiah 45:1). The open door set before Philadelphia — *behold, I have set before thee an open door, and no man can shut it* (Revelation 3:8) — speaks the same opening Isaiah proclaims: Yahuah (LORD) opens *the two leaved gates* before his anointed, and *the gates shall not be shut.* The One who holds the key of the house of David opens the way home, and the gates he throws open no power of man can close against the faithful.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 45:1 — *to open before him the two leaved gates; and the gates shall not be shut* the gates Yahuah (LORD) opens that none can close; *an open door, and no man can shut it* (Revelation 3:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65
-- existing: Isaiah 65:15, 65:16, Romans 9:25. ADD Isaiah 60:14 + 49:23 (the bowing-before-thy-feet root of 3:9).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,9,'canon','isaiah',60,14,'free', E'*The sons also of them that afflicted thee shall come bending unto thee; and all they that despised thee shall bow themselves down at the soles of thy feet; and they shall call thee, The city of Yahuah (LORD), The Zion of the Holy One of Yashar''el (Israel).* (Isaiah 60:14). The promise to Philadelphia — *I will make them to come and worship before thy feet, and to know that I have loved thee* (Revelation 3:9) — is Isaiah''s restoration-word turned to the faithful: those who afflicted Zion *shall bow themselves down at the soles of thy feet* and own her as the city of Yahuah (LORD). The vindication of the kept assembly is the vindication the prophet promised the forsaken city — the despisers bowing, the Holy One''s love acknowledged.'),
  ('canon','revelation',3,9,'canon','isaiah',49,23,'free', E'*And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* (Isaiah 49:23). Isaiah promises the waiting remnant that her oppressors *shall bow down to thee with their face toward the earth,* and she *shall not be ashamed that wait for me.* The same is sealed to Philadelphia, which *hast kept my word, and hast not denied my name* (Revelation 3:8): *I will make them to come and worship before thy feet* (Revelation 3:9). The bowing of the false claimants before the faithful is the prophet''s own promise to those who wait on Yahuah (LORD) — the patient keepers vindicated, never ashamed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 60:14 — *they that despised thee shall bow themselves down at the soles of thy feet* the despisers bowing before restored Zion; *I will make them to come and worship before thy feet* (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 49:23 — *they shall bow down to thee... and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me* the waiting remnant vindicated; *I will make them to come and worship before thy feet* (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8
-- existing: Isaiah 65:16, Isaiah 44:6, Proverbs 8:22, Colossians 1:15, 1:18.
-- ADD Proverbs 8:30 (Wisdom brought up with him, the beginning) + Isaiah 43:10 (no Elohim formed — faithful witness).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,14,'canon','proverbs',8,30,'free', E'*Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* (Proverbs 8:30). Wisdom, who *possessed* the beginning of Yahuah''s (LORD''s) way, was *by him, as one brought up with him,* his daily delight as the world was framed. The Messiah names himself to Laodicea *the beginning of the creation of Elohim (God)* (Revelation 3:14) in that very register — the Formed who was with the Father before the works of old, brought up beside him, by whom the creation begins. He is not the first thing made but the One who was the Father''s delight before there was anything made.'),
  ('canon','revelation',3,14,'canon','isaiah',43,10,'free', E'*Ye are my witnesses, saith Yahuah (LORD), and my servant whom I have chosen: that ye may know and believe me, and understand that I am he: before me there was no Elohim (God) formed, neither shall there be after me.* (Isaiah 43:10). The title *the faithful and true witness* (Revelation 3:14) stands in Isaiah''s witness-court, where Yahuah (LORD) names his servant *whom I have chosen* to testify *that I am he.* The Amen who speaks to Laodicea is that faithful witness — the chosen Servant testifying the truth that does not fail, before whom *there was no Elohim (God) formed,* the one true witness against the lukewarm assembly''s false self-reckoning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Proverbs 8:30 — *I was by him, as one brought up with him: and I was daily his delight* Wisdom beside the Father before the works of old; *the beginning of the creation of Elohim (God)* (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 43:10 — *Ye are my witnesses... and my servant whom I have chosen... that I am he* the witness-court of the chosen Servant; *the faithful and true witness* who speaks to Laodicea (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55
-- existing: Isaiah 55:1, Proverbs 8:34. ADD Zechariah 3:4 (filthy garments off, white raiment on)
--           + Isaiah 61:10 (garments of salvation / robe of righteousness) for the white-raiment counsel.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,18,'canon','zechariah',3,4,'free', E'*And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4). The white raiment counselled to naked Laodicea — *white raiment, that thou mayest be clothed, and that the shame of thy nakedness do not appear* (Revelation 3:18) — is Zechariah''s clothing of the high priest: the *filthy garments* taken away, the iniquity caused to pass, and the *change of raiment* put on. The buying of white raiment is the cleansing exchange the prophet saw — shame and defilement stripped off, the clean garment given by the One who removes iniquity.'),
  ('canon','revelation',3,18,'canon','isaiah',61,10,'free', E'*I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels.* (Isaiah 61:10). The white raiment Laodicea is counselled to buy is Isaiah''s *garments of salvation* and *robe of righteousness* — the clothing Yahuah (LORD) himself puts on his people. So *buy of me... white raiment, that thou mayest be clothed* (Revelation 3:18) is the offer of the very garments the prophet rejoiced in, the bridal robe of righteousness given to cover the shame the lukewarm assembly does not know she wears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 3:4 — *Take away the filthy garments from him... I will clothe thee with change of raiment* the cleansing exchange of garments; *white raiment, that thou mayest be clothed* (Revelation 3:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 61:10 — *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness* the clothing Yahuah (LORD) puts on his people; the white raiment bought of him (Revelation 3:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7
-- existing: Daniel 7:9, 7:14. ADD Daniel 7:18 + 7:27 (the saints take and possess the kingdom).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,21,'canon','daniel',7,18,'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). Daniel does not stop at the kingdom given to the Son of Adam — he sees it shared with his people: *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever.* That is exactly the grant the Messiah makes at Laodicea: *To him that overcometh will I grant to sit with me in my throne* (Revelation 3:21). The dominion received from the Ancient of days is given to the Son and through him to the saints, who possess the everlasting kingdom with the One who overcame.'),
  ('canon','revelation',3,21,'canon','daniel',7,27,'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). The vision closes by handing *the kingdom and dominion... under the whole heaven* to *the people of the saints of the El Elyon (most High)* — an everlasting kingdom the nations serve. The throne-promise to the overcomer is that same handing: *will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* (Revelation 3:21). The everlasting dominion given to the saints in Daniel is the throne the faithful are called to share with the Son who reigns with his Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the dominion shared with the Son''s people; *grant to sit with me in my throne* (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:27 — *the kingdom and dominion... shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* the everlasting dominion handed to the saints; the throne the faithful share (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 04 =====
-- S227 enrichment — Revelation 4: throne / sea of glass / creatures / elders / Maker
-- Adds prophetic + extra-canonical roots (1 Enoch throne-visions especially) to live threads.
-- References shared view _s227_rev_lookup (defined by the assembled migration).

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
  ('canon','revelation',4,2,'canon','isaiah',6,1,'free', E'*In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1). Before Ezekiel and before John, Isaiah was caught up to the same throne: *Yahuah (Lord) sitting upon a throne, high and lifted up.* The seer''s *a throne was set in heaven, and one sat on the throne* (Revelation 4:2) is the one throne the prophets all behold — the Father, the Most High, shown in vision-form to His servants.'),
  ('canon','revelation',4,2,'enoch','1-enoch',14,18,'extras', E'*And beyond that abyss I saw a place which had no firmament of the heaven above, and no firmly founded earth beneath it... but it was a waste and horrible place* (1 Enoch 14:18). In the same vision where Enoch reached the throne of Yahuah (God), he passed the lofty throne-room John is now caught up into — *a door was opened in heaven* (Revelation 4:1), the throne *set in heaven* (Revelation 4:2). The seers of Yashar''el (Israel) ascended to behold what John beholds: the throne of the living Elohim (God) above the firmament.'),
  ('canon','revelation',4,9,'enoch','1-enoch',71,8,'extras', E'*And after that I saw the hidden things in heaven... how the fountains of the spirits are reckoned* (1 Enoch 71:8). Enoch was translated to *the heaven of heavens* and saw *a structure built of crystals, and between those crystals tongues of living fire* (1 Enoch 71:9) — the crystal throne-house of fire where the Head of Days sits. It is the same throne-room John enters, where *him that liveth for ever and ever* (Revelation 4:9) receives glory and honour and thanks; the lofty throne of glory the seers of Yashar''el (Israel) beheld before him.'),
  -- thread: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
  ('canon','revelation',4,6,'enoch','1-enoch',71,5,'extras', E'*And he translated my spirit into the heaven of heavens, And I saw there a structure built of crystals, And between those crystals tongues of living fire* (1 Enoch 71:5). Enoch saw the throne-room floored and walled with crystal — *a structure built of crystals* — the same clear, shining expanse John names *a sea of glass like unto crystal* (Revelation 4:6). The crystal pavement of the throne-house the seers of Yashar''el (Israel) beheld is the crystal sea before the throne, the clear floor of the heavenly sanctuary.'),
  -- thread: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
  ('canon','revelation',4,8,'enoch','1-enoch',39,11,'extras', E'*And I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits, and they intercede for the children of men* (1 Enoch 39:11). Enoch saw the very four John sees: *four presences which surround the throne of glory,* unceasing in praise — John''s *four beasts* who *rest not day and night, saying, Holy, holy, holy* (Revelation 4:8). The four worship-bearers about the throne are one order across the library, the burning ones who circle the throne of the Most High.'),
  -- thread: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
  ('canon','revelation',4,10,'canon','daniel',7,10,'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). The numberless host that ministers before the throne in John''s vision — the elders and the *myriads* — is Daniel''s court: *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him.* The four and twenty elders who *cast their crowns before the throne* (Revelation 4:10) are of that same uncountable throng before the Ancient of days.'),
  ('canon','revelation',4,10,'enoch','1-enoch',60,1,'extras', E'*...the host of the Most High, and the angels, a thousand thousands and ten thousand times ten thousand, were disquieted with a great disquiet* (1 Enoch 60:1). The Hebrew library numbered the throne-host exactly as John does: *a thousand thousands and ten thousand times ten thousand,* the angels of the Most High; and *the Head of Days sat on the throne of His glory, and the angels and the righteous stood around Him* (1 Enoch 60:2) — the very picture of the elders and myriads who fall down and worship before the throne (Revelation 4:10).'),
  -- thread: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
  ('canon','revelation',4,11,'canon','isaiah',40,26,'free', E'*Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names by the greatness of his might... not one faileth* (Isaiah 40:26). The elders'' song — *thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11) — is Isaiah''s confession of the Maker who *created these things* and calls the whole host by name. He is worthy because he made and numbers and upholds all; the throne is the throne of the Creator.'),
  ('canon','revelation',4,11,'canon','jeremiah',10,12,'free', E'*He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12). Jeremiah names the One the elders crown as Maker: *he hath made the earth by his power... and hath stretched out the heavens by his discretion.* So they sing *thou hast created all things* (Revelation 4:11) — power, wisdom, and discretion gathered into the one Creator on the throne, worthy of all glory and honour and power.'),
  ('canon','revelation',4,11,'enoch','1-enoch',9,5,'extras', E'*Thou hast made all things, and power over all things hast Thou: and all things are naked and open in Thy sight... and nothing can hide itself from Thee* (1 Enoch 9:5). The Hebrew library lifts the elders'' very creed: *Thou hast made all things, and power over all things hast Thou.* It is the ground of all the throne-room''s worship — *for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11) — the Maker who made all and holds power over all.'),
  ('canon','revelation',4,11,'apocrypha','2-esdras',6,38,'extras', E'*And I said, O Yahuah (God), you spakest from the beginning of the creation, even the first day, and saidst thus; Let heaven and earth be made; and your word was a perfect work* (2 Esdras 6:38). Ezra recounts the creation the elders crown the Maker for: *you spakest from the beginning of the creation... Let heaven and earth be made.* The same confession stands behind *thou hast created all things* (Revelation 4:11) — all things made by his word, *for as soon as your word went forth the work was made* (2 Esdras 6:43), and so worthy is he who made them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----

-- thread: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 6:1 — *I saw also Yahuah (Lord) sitting upon a throne, high and lifted up* the throne Isaiah was caught up to behold, the one throne John is caught up to, *a throne was set in heaven, and one sat on the throne* (Revelation 4:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 14:18 — *I saw a place which had no firmament of the heaven above* the lofty throne-room Enoch reached in his ascent, the heaven into which a door opens and John is caught up (Revelation 4:1-2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 71:8 — *I saw the hidden things in heaven* Enoch translated to the heaven of heavens and the crystal throne-house of living fire, the throne-room of *him that liveth for ever and ever* (Revelation 4:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=71 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 71:5 — *I saw there a structure built of crystals, And between those crystals tongues of living fire* the crystal throne-house Enoch beheld in the heaven of heavens, the same crystal expanse as John''s sea of glass like crystal (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-sea-of-glass-before-the-throne-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=71 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 39:11 — *I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits* the four about the throne whose ceaseless praise Enoch saw, John''s four beasts crying *Holy, holy, holy* day and night (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* the numberless court before the Ancient of days, the host of which the enthroned elders who cast their crowns are a part (Revelation 4:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 60:1 — *a thousand thousands and ten thousand times ten thousand* the host of the Most High before the throne of glory where the Head of Days sits, the angels and righteous standing around Him (Revelation 4:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 40:26 — *behold who hath created these things, that bringeth out their host by number... not one faileth* the Maker who created and numbers the whole host, worthy because *thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 10:12 — *He hath made the earth by his power... and hath stretched out the heavens by his discretion* the Creator the elders crown as Maker, worthy of glory and honour and power, *for thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 9:5 — *Thou hast made all things, and power over all things hast Thou* the Hebrew library''s creed of the Maker, the ground of the elders'' song, *thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Esdras 6:38 — *you spakest from the beginning of the creation... Let heaven and earth be made; and your word was a perfect work* the creation by the word, the ground of the elders'' worship of the Maker (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 05 =====
-- S227 enrichment — Revelation 5: sealed scroll / Lion-Root / kings-priests / worthy Lamb
-- Adds prophetic + extra-canonical roots to live threads. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
  ('canon','revelation',5,1,'apocrypha','2-esdras',6,20,'extras', E'*...the books shall be opened before the firmament, and they shall see all together* (2 Esdras 6:20). Ezra is shown the heavenly books that stay shut until the appointed end, then *opened before the firmament* — the sealed decree John sees in the right hand of him on the throne, *a book written within and on the backside, sealed with seven seals* (Revelation 5:1). The Hebrew library knew the sealed heavenly book that no creature opens until the time comes, the very scroll the slain Lamb is found worthy to loose.'),
  ('canon','revelation',5,4,'apocrypha','2-esdras',14,45,'extras', E'*The first that you have written publish openly, that the worthy and unworthy may read it* (2 Esdras 14:45). Ezra is commanded to publish some books openly but to seal up and keep back the hidden ones, sealed from all but the worthy and wise — the same sealed-scroll world John weeps in, where *no man was found worthy to open and to read the book* (Revelation 5:4). The sealed prophetic word kept from the many until the worthy One is shown is the scroll the Lamb alone prevails to open (Revelation 5:5).'),
  -- thread: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
  ('canon','revelation',5,5,'apocrypha','2-esdras',12,31,'extras', E'*And the lion, whom you sawest rising up out of the wood, and roaring, and speaking to the eagle, and rebuking her for her unrighteousness with all the words which you have heard* (2 Esdras 12:31). Ezra too saw a Lion who rises to judge the last kingdom — and the angel names him outright: *This is the anointed* (2 Esdras 12:32). The elder''s *Lion of the tribe of Juda... hath prevailed* (Revelation 5:5) is the same figure the Hebrew library beheld: the Messiah as the roaring Lion who confronts and overthrows the beast-empire, the anointed One reserved for the end.'),
  ('canon','revelation',5,5,'apocrypha','2-esdras',12,32,'extras', E'*This is the anointed, which the Highest has kept for them and for their wickedness to the end: he shall reprove them, and shall upbraid them with their cruelty* (2 Esdras 12:32). The Lion of Ezra''s vision is plainly named *the anointed... of the seed of David* (2 Esdras 12:32), kept by the Highest *to the end.* So the Lion who *hath prevailed* (Revelation 5:5) is the Root of David, the anointed King reserved and now revealed — the One the library looked for, come forth to reprove the beast and to open the sealed scroll.'),
  -- thread: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
  ('canon','revelation',5,10,'canon','isaiah',61,6,'free', E'*But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* (Isaiah 61:6). The new song''s *hast made us unto our Elohim (God) kings and priests* (Revelation 5:10) is Isaiah''s restoration-promise: the redeemed *named the Priests of Yahuah (LORD)... the Ministers of our Elohim (God).* The Lamb''s blood brings the covenant people into the priestly calling Isaiah foretold for restored Yashar''el (Israel) — not a new people in her place, but the gathered seed made priests of Yahuah (LORD).'),
  -- thread: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
  ('canon','revelation',5,13,'enoch','1-enoch',48,5,'extras', E'*All who dwell on earth shall fall down and worship before him, And will praise and bless and celebrate with song Yahuah (God) of Spirits* (1 Enoch 48:5). The Hebrew library foresaw the very worship of Revelation 5: *all who dwell on earth shall fall down and worship before him* — the Son of Adam, named before creation — *and will praise and bless... Yahuah (God) of Spirits.* So every creature gives blessing *unto him that sitteth upon the throne, and unto the Lamb* (Revelation 5:13): the chosen Son worshipped, and the Father glorified in him, two and distinguished as Enoch saw.'),
  ('canon','revelation',5,13,'enoch','1-enoch',62,9,'extras', E'*And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And shall loosen the reins of the strong* (1 Enoch 62:9). In Enoch the Elect One is set *on the throne of His glory* (1 Enoch 62:6) and before him the kings and mighty fall — the same enthroned, worshipped Son of Adam John beholds receiving *blessing, and honour, and glory, and power* with him that sits on the throne (Revelation 5:13). The Formed Son seated and worshipped, distinct from Yahuah (God) of Spirits who seated him, is the frame the library and the seer share.'),
  ('canon','revelation',5,12,'enoch','1-enoch',62,6,'extras', E'*And Yahuah (God) of Spirits seated the Elect One on the throne of His glory, And he shall judge all the secret things* (1 Enoch 62:6). The sevenfold acclamation *Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12) is the dignity Enoch saw given the Elect One *seated... on the throne of His glory* by Yahuah (God) of Spirits. The Lamb who receives power and glory is the chosen Son enthroned by the Father — worthy because the Father has set him there, the slain-yet-reigning Formed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----

-- thread: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 6:20 — *the books shall be opened before the firmament* the heavenly books sealed until the appointed end, the sealed scroll John sees in the right hand of him on the throne (Revelation 5:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 14:45 — *that the worthy and unworthy may read it* some books published openly while the hidden ones are sealed and kept back from all but the worthy, the sealed scroll none was found worthy to open (Revelation 5:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 12:31 — *the lion, whom you sawest rising up out of the wood, and roaring... rebuking her for her unrighteousness* the Messiah-Lion of Ezra''s vision who confronts the beast-empire, the Lion of Yahudah (Judah) who hath prevailed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 12:32 — *This is the anointed, which the Highest has kept... to the end* the Lion named outright as the anointed of the seed of David, the Root of David reserved and now revealed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 61:6 — *ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* the restoration-promise of priesthood for Yashar''el (Israel), the covenant people made kings and priests by the Lamb''s blood (Revelation 5:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 48:5 — *All who dwell on earth shall fall down and worship before him, And will praise and bless... Yahuah (God) of Spirits* the worship of the Son of Adam and the glory of the Father together, every creature blessing him on the throne and the Lamb (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 62:9 — *this Son of Adam... Shall raise up the kings and the mighty from their seats* the enthroned Elect One before whom the mighty fall, the worshipped Son distinct from Yahuah (God) of Spirits who seated him (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 62:6 — *Yahuah (God) of Spirits seated the Elect One on the throne of His glory* the Father enthroning the chosen Son, the worthy Lamb who receives power and glory because the Father has set him there (Revelation 5:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 06 =====
-- S227 enrichment — Revelation 6: seals (four horsemen, sixth-seal cosmos, hide-us, day of wrath)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: four-horsemen-of-the-seals — add Jeremiah's fourfold judgment (sword/famine/death/captivity + four kinds)
  ('canon','revelation',6,8,'canon','jeremiah',15,2,'free', E'*Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity.* (Jeremiah 15:2). The pale rider gathers the same sorted judgments — *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death* (Revelation 6:8). Jeremiah''s fourfold appointing of death, sword, famine, and captivity is the very roster the seal looses; the riders do not invent the curses but carry out the sentence Yahuah (LORD) had long since pronounced.'),
  ('canon','revelation',6,8,'canon','jeremiah',15,3,'free', E'*And I will appoint over them four kinds, saith Yahuah (LORD): the sword to slay, and the dogs to tear, and the fowls of the heaven, and the beasts of the earth, to devour and destroy.* (Jeremiah 15:3). The fourth seal kills *with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8) — exactly Jeremiah''s *four kinds,* the sword and the beasts of the earth named together to devour. The pale horse is the prophet''s appointed four, sent out from before the throne over the fourth part of the earth.'),

  -- thread: sun-black-moon-as-blood-heaven-as-scroll — add Joel 2:10 (the fuller darkening + earth quaking)
  ('canon','revelation',6,12,'canon','joel',2,10,'free', E'*The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining:* (Joel 2:10). The sixth seal opens with *a great earthquake; and the sun became black... and the moon became as blood* (Revelation 6:12). Joel had set the quaking earth and trembling heavens beside the darkened sun and moon and withdrawn stars — the whole shaking cosmos of the day of Yahuah (LORD). The seal gathers Joel''s every sign at once: the earth heaving, the lights failing, the heavens unmade.'),

  -- thread: hide-us-from-the-face — add Isaiah 2:10 and 2:21 (the rock/dust, the clefts of the rocks)
  ('canon','revelation',6,15,'canon','isaiah',2,10,'free', E'*Enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD), and for the glory of his majesty.* (Isaiah 2:10). When the seal breaks the great of the earth *hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15). Isaiah had already bidden the proud *enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD)* — the same flight to the rocks before the same majesty. The hiding-place of the terrified is the prophet''s own.'),
  ('canon','revelation',6,16,'canon','isaiah',2,21,'free', E'*To go into the clefts of the rocks, and into the tops of the ragged rocks, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth.* (Isaiah 2:21). They cry *Fall on us, and hide us from the face of him that sitteth on the throne* (Revelation 6:16). Isaiah named both the flight and its cause — men creeping *into the clefts of the rocks... when he ariseth to shake terribly the earth* — and the seal''s great earthquake is precisely that shaking. The face they cannot abide is the glory of his majesty the prophet foretold.'),

  -- thread: great-day-of-his-wrath-who-shall-be-able-to-stand — add Zephaniah 1:18 and Nahum 1:6
  ('canon','revelation',6,17,'canon','zephaniah',1,18,'free', E'*Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy* (Zephaniah 1:18). The seal closes — *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Zephaniah named that day the day of wrath and said no riches could deliver in it, the whole land devoured by the fire of his jealousy. Neither the rich men nor the chief captains hiding in the rocks (6:15) can buy their way out; nothing stands in the day of wrath but what he holds.'),
  ('canon','revelation',6,17,'canon','nahum',1,6,'free', E'*Who can stand before his indignation? and who can abide in the fierceness of his anger? his fury is poured out like fire, and the rocks are thrown down by him.* (Nahum 1:6). The seal asks *who shall be able to stand?* (Revelation 6:17), and Nahum had asked it first — *Who can stand before his indignation?* He answers with the picture of the seal itself: the rocks thrown down by him, the very rocks the proud fled to. No power of man abides his anger; the day of wrath leaves none standing of itself.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- four-horsemen-of-the-seals
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 15:2 — *Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity* the sorted fourfold judgment the pale rider looses (Revelation 6:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 15:3 — *I will appoint over them four kinds... the sword to slay... and the beasts of the earth, to devour and destroy* the prophet''s appointed four, the sword and the beasts of the fourth seal (Revelation 6:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-four-horsemen-of-the-seals-zechariahs-chariots-and-the-covenant-judgments'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- sun-black-moon-as-blood-heaven-as-scroll
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 2:10 — *the earth shall quake... the sun and the moon shall be dark, and the stars shall withdraw their shining* Joel''s whole shaking cosmos gathered into the sixth seal''s earthquake and darkening (Revelation 6:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-sun-black-the-moon-as-blood-the-heaven-as-a-scroll-joel-2-isaiah-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- hide-us-from-the-face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 2:10 — *Enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD)* the prophet''s flight to the rocks before the same majesty, on the lips of the terrified at the seal (Revelation 6:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 2:21 — *To go into the clefts of the rocks... when he ariseth to shake terribly the earth* the seal''s great earthquake is Isaiah''s shaking, the face they cannot abide his foretold majesty (Revelation 6:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-hide-us-from-the-face-and-the-wrath-of-the-lamb-hosea-10-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- great-day-of-his-wrath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zephaniah 1:18 — *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath... the whole land shall be devoured by the fire of his jealousy* no riches deliver in the day of wrath; none of the rich hiding in the rocks can stand (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Nahum 1:6 — *Who can stand before his indignation?... the rocks are thrown down by him* the seal''s question asked first by Nahum, who answers it with the rocks the proud fled to thrown down (Revelation 6:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-6-the-great-day-of-his-wrath-who-shall-be-able-to-stand-joel-2-zephaniah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 07 =====
-- S227 enrichment — Revelation 7: 144,000 + great multitude (Sukkot palms; the Lamb feeds)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: white-robes-and-palms-the-sukkot-ingathering — add prophetic roots (no prophetic member yet)
  ('canon','revelation',7,9,'canon','zechariah',14,16,'free', E'*every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* (Zechariah 14:16). The palms in the multitude''s hands (Revelation 7:9) are the palms of the feast Zechariah said the gathered nations would keep — *the feast of tabernacles,* Sukkot. The prophet foresaw the regathered from all nations going up to keep the ingathering feast before the King; the seer sees them arrived, palm-bearing before the throne, keeping the great Sukkot the prophet promised.'),
  ('canon','revelation',7,14,'canon','isaiah',1,18,'free', E'*though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool.* (Isaiah 1:18). The white robes are explained at the throne: *these are they... which have washed their robes, and made them white in the blood of the Lamb* (Revelation 7:14). Isaiah had promised the very washing — sins scarlet and crimson made *white as snow,* white as wool. The robes washed white are the prophet''s cleansing made visible: the blood of the Lamb does what Isaiah said Yahuah (LORD) would do, turning the crimson-stained white.'),
  ('canon','revelation',7,14,'canon','daniel',12,10,'free', E'*Many shall be purified, and made white, and tried; but the wicked shall do wickedly... but the wise shall understand.* (Daniel 12:10). They *came out of great tribulation, and have washed their robes, and made them white* (Revelation 7:14). Daniel foresaw the end-time refining: *many shall be purified, and made white, and tried.* The white-robed who came through tribulation are Daniel''s purified and tried — made white not by their own hand but by the trial endured and the blood of the Lamb, the wise who are kept while the wicked do wickedly.'),

  -- thread: the-lamb-shall-feed-them-and-lead-them-to-living-fountains — add 2 Esdras (fountains/trees), no extra yet
  ('canon','revelation',7,17,'apocrypha','2-esdras',2,19,'extras', E'*And as many fountains flowing with milk and honey, and seven mighty mountains, whereupon there grow roses and lilies, by which I will fill your children with joy.* (2 Esdras 2:19). The Lamb *shall lead them unto living fountains of waters* (Revelation 7:17), and the restored library shows the same reward of the gathered: *fountains flowing with milk and honey* and the trees of the holy mountains where Yahuah (God) fills his children with joy. The living fountains of the throne and the flowing fountains of Esdras are one promise — the homecoming seed led to springs of life and joy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- white-robes-and-palms-the-sukkot-ingathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:16 — *all the nations... shall even go up from year to year to worship the King... and to keep the feast of tabernacles* the prophet''s gathered nations keeping Sukkot, the palms in the multitude''s hands (Revelation 7:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 1:18 — *though your sins be as scarlet, they shall be as white as snow* the prophet''s washing white, the robes made white in the blood of the Lamb (Revelation 7:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Daniel 12:10 — *Many shall be purified, and made white, and tried* the end-time refining; the white-robed who came out of great tribulation are Daniel''s purified and tried (Revelation 7:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-white-robes-and-palms-the-sukkot-ingathering-leviticus-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-lamb-shall-feed-them-and-lead-them-to-living-fountains
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 2:19 — *as many fountains flowing with milk and honey... by which I will fill your children with joy* the restored library''s flowing fountains, the living fountains the Lamb leads the gathered to (Revelation 7:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-7-the-lamb-shall-feed-them-and-lead-them-to-living-fountains-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 08 =====
-- S227 enrichment — Revelation 8: seventh seal, silence, trumpets, censer, plagues
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: silence-in-heaven — add extra-canonical silence (2 Esdras 7:30, the old silence)
  ('canon','revelation',8,1,'apocrypha','2-esdras',7,30,'extras', E'*And the world shall be turned into the old silence seven days, like as in the former judgments: so that no man shall remain.* (2 Esdras 7:30). The seventh seal opens on *silence in heaven about the space of half an hour* (Revelation 8:1), and the restored library knew this silence as the hush at the turning of the ages — *the world shall be turned into the old silence... like as in the former judgments.* Esdras sets the silence at the very hinge of judgment and resurrection; the half-hour of Revelation is that same primeval stillness, the world returned to silence before the trumpets and the day of Yahuah (LORD) begin.'),

  -- thread: hail-and-fire-mingled-with-blood — add prophetic roots beyond Exodus (Ezekiel 38:22, Joel 2:30)
  ('canon','revelation',8,7,'canon','ezekiel',38,22,'free', E'*I will rain upon him, and upon his bands, and upon the many people that are with him, an overflowing rain, and great hailstones, fire, and brimstone.* (Ezekiel 38:22). The first trumpet brings *hail and fire mingled with blood* (Revelation 8:7), and Ezekiel had foretold this very mingling over Gog''s hordes — *great hailstones, fire, and brimstone.* The day-of-Yahuah storm the prophet rained upon the enemy of his people is the trumpet''s storm upon the earth; the hail and fire of the seal are the prophet''s own arsenal of judgment.'),
  ('canon','revelation',8,7,'canon','joel',2,30,'free', E'*And I will shew wonders in the heavens and in the earth, blood, and fire, and pillars of smoke.* (Joel 2:30). *Hail and fire mingled with blood* fall at the first trumpet (Revelation 8:7), and Joel had named the triad of the day of Yahuah (LORD) — *blood, and fire, and pillars of smoke.* The wonders Joel said would come before the great and terrible day are the trumpet''s signs: blood and fire poured out upon the earth as the day breaks.'),

  -- thread: the-star-wormwood — add Lamentations 3:19 (the wormwood and the gall)
  ('canon','revelation',8,11,'canon','lamentations',3,19,'free', E'*Remembering mine affliction and my misery, the wormwood and the gall.* (Lamentations 3:19). The third trumpet names the star *Wormwood* and turns the waters bitter (Revelation 8:11). The lament binds *the wormwood and the gall* together as the very taste of judgment and affliction — the same bitter pair Jeremiah pronounced over the people. The waters made wormwood are the cup of affliction the prophet remembered, the bitterness of the day of Yahuah (LORD) poured into the rivers of the earth.'),

  -- thread: sun-moon-stars-third-darkened — add Amos 8:9 (sun down at noon) and Joel 2:31 (moon to blood)
  ('canon','revelation',8,12,'canon','amos',8,9,'free', E'*I will cause the sun to go down at noon, and I will darken the earth in the clear day:* (Amos 8:9). The fourth trumpet darkens *the third part of the sun... so as... the day shone not for a third part of it* (Revelation 8:12). Amos had named the sign of the day of Yahuah (LORD) — *the sun to go down at noon... darken the earth in the clear day.* The day failing at its height is the prophet''s portent, the light withdrawn in the very hour it should shine, now smitten at the trumpet.'),
  ('canon','revelation',8,12,'canon','joel',2,31,'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). The fourth trumpet smites *the third part of the moon* with the sun and stars (Revelation 8:12), and Joel had set the darkened sun and the moon turned to blood as the sign *before the great and the terrible day of Yahuah (LORD).* The lights failing at the trumpet are Joel''s day-of-Yahuah signs; the eagle''s threefold *Woe* (8:13) follows because the day the prophet announced is breaking upon the inhabiters of the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- silence-in-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 7:30 — *the world shall be turned into the old silence seven days, like as in the former judgments* the restored library''s silence at the hinge of judgment, the half-hour hush of the seventh seal (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- hail-and-fire-mingled-with-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 38:22 — *great hailstones, fire, and brimstone* the prophet''s day-of-Yahuah storm over Gog, the hail and fire mingled with blood of the first trumpet (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:30 — *I will shew wonders in the heavens and in the earth, blood, and fire, and pillars of smoke* Joel''s day-of-Yahuah triad, the blood and fire of the first trumpet (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-star-wormwood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Lamentations 3:19 — *the wormwood and the gall* the lament binds wormwood and gall as the taste of judgment, the bitter waters of the third trumpet (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- sun-moon-stars-third-darkened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Amos 8:9 — *I will cause the sun to go down at noon, and I will darken the earth in the clear day* the day failing at its height, the sun smitten at the fourth trumpet (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:31 — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD)* Joel''s day-of-Yahuah signs, the lights smitten at the fourth trumpet (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 09 =====
-- S227 enrichment — Revelation 9: the abyss/locusts (1 Enoch territory)
-- ADD-only: new cross_references + new thread members on the existing live ch9 threads
-- (built in session224). References the shared view _s227_rev_lookup defined by the
-- assembled migration. No rewrites, no deletes; ON CONFLICT DO NOTHING throughout.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the fallen star and the key of the bottomless pit (extras) — promote more of 1 Enoch's prison-of-stars
  ('canon','revelation',9,1,'enoch','1-enoch',18,11,'extras', E'*And beyond that abyss I saw a place which had no firmament of the heaven above, and no firmly founded earth beneath it: there was no water upon it, and no birds, but it was a waste and horrible place* (1 Enoch 18:11). The bottomless pit the seer sees unlocked (Revelation 9:1) is the waste place at the end of heaven and earth that Enoch was shown — neither firmament above nor earth beneath, the very abyss the fallen star is given the key to open.'),
  ('canon','revelation',9,1,'enoch','1-enoch',18,13,'extras', E'*And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times* (1 Enoch 18:13). The star fallen from heaven (Revelation 9:1) is one of these transgressing stars Enoch named — the host that broke the commandment and was bound in the prison-pit; the fall the seer watches is the fall the older library had already charted.'),
  ('canon','revelation',9,2,'enoch','1-enoch',18,15,'extras', E'*a great fire there which burnt and blazed, and the place was cleft as far as the abyss, being full of great descending columns of fire* (1 Enoch 18:15). The smoke that rises *as the smoke of a great furnace* (Revelation 9:2) is the smoke of this fire Enoch saw — the abyss cleft and full of descending columns of fire, the furnace-chamber whose mouth the trumpet now opens.'),
  ('canon','revelation',9,1,'enoch','1-enoch',21,5,'extras', E'*This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven* (1 Enoch 21:5). The pit unlocked at the fifth trumpet (Revelation 9:1) is the prison-house Enoch was twice shown — the appointed cell of the fallen stars and the host of heaven, held until their guilt should be consummated and the appointed hour come.'),
  ('canon','revelation',9,1,'enoch','1-enoch',88,3,'extras', E'*and gathered and took all the great stars whose privy members were like those of horses, and bound them all hand and foot, and cast them in an abyss of the earth* (1 Enoch 88:3). The binding Enoch saw — the stars bound hand and foot and cast into the abyss of the earth — is the other end of the loosing John sees: the long-bound fallen ones, and the star given the key when the appointed time is come (Revelation 9:1).'),
  -- thread: the locusts out of the smoke, and the sealed spared (free) — add prophetic Joel
  ('canon','revelation',9,3,'canon','joel',1,5,'free', E'*Awake, ye drunkards, and weep; and howl, all ye drinkers of wine, because of the new wine; for it is cut off from your mouth* (Joel 1:5). Joel''s locust-day is a summons that strips the careless of their ease; so the locusts out of the smoke (Revelation 9:3) come upon the men who have not the seal, the day of Yahuah (LORD) waking the secure to the torment they cannot escape.'),
  -- thread: five months torment, and men seeking death (free, P=jeremiah only) — add Job and Hosea
  ('canon','revelation',9,6,'canon','job',3,20,'free', E'*Wherefore is light given to him that is in misery, and life unto the bitter in soul* (Job 3:20). Job''s cry — why is life given to the bitter in soul who would be rid of it — is the very anguish of the fifth trumpet, when men *seek death, and shall not find it* (Revelation 9:6); life is held on them as a torment, the light a burden to the soul that longs for the grave.'),
  ('canon','revelation',9,6,'canon','job',3,22,'free', E'*Which rejoice exceedingly, and are glad, when they can find the grave?* (Job 3:22). Job names those who would *rejoice exceedingly* could they but find the grave; so the men of the trumpet *desire to die, and death shall flee from them* (Revelation 9:6) — the grave they crave is denied, the gladness Job spoke of forever out of reach for the five months appointed.'),
  ('canon','revelation',9,6,'canon','job',7,15,'free', E'*So that my soul chooseth strangling, and death rather than my life* (Job 7:15). The soul that *chooseth... death rather than my life* is the soul of the scorpion-stung who *shall desire to die* (Revelation 9:6). Job''s extremity is theirs — to choose death over life and be refused even that choice, the torment outlasting the will to live.'),
  ('canon','revelation',9,6,'canon','hosea',10,8,'free', E'*and they shall say to the mountains, Cover us; and to the hills, Fall on us* (Hosea 10:8). The cry Hosea put in the mouth of the judged — *Cover us... Fall on us* — is the same flight from a life become unbearable; the men of the fifth trumpet *shall seek death, and shall not find it* (Revelation 9:6), begging the grave to take them as Hosea''s people begged the hills to fall.'),
  -- thread: the shapes of the locusts, like Joel's army (free, P=joel) — add more Joel 2
  ('canon','revelation',9,7,'canon','joel',2,6,'free', E'*Before their face the people shall be much pained: all faces shall gather blackness* (Joel 2:6). Joel''s locust-army brings dread upon every face; so the trumpet-locusts, *their faces... as the faces of men* (Revelation 9:7), advance as Joel''s host before which the people are *much pained.* The shape of the swarm is the prophet''s day-of-Yahuah army made vision.'),
  ('canon','revelation',9,9,'canon','joel',2,7,'free', E'*They shall run like mighty men; they shall climb the wall like men of war; and they shall march every one on his ways, and they shall not break their ranks* (Joel 2:7). The ordered, unbreakable advance of Joel''s host — *they shall not break their ranks* — is the war-array of the locusts whose *sound of their wings was as the sound of chariots of many horses running to battle* (Revelation 9:9): a marshalled army, not a scattered swarm.'),
  ('canon','revelation',9,9,'canon','joel',2,9,'free', E'*They shall run to and fro in the city; they shall run upon the wall, they shall climb up upon the houses; they shall enter in at the windows like a thief* (Joel 2:9). Joel''s locusts overrun the city wall and house and window; the chariot-loud swarm of the fifth trumpet (Revelation 9:9) is that same all-pervading host, the prophet''s relentless army loosed to torment the unsealed.'),
  -- thread: Abaddon, Apollyon, the angel of the bottomless pit (extras) — promote more of 1 Enoch's bound destroyer
  ('canon','revelation',9,11,'enoch','1-enoch',10,5,'extras', E'*And place upon him rough and jagged rocks, and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light* (1 Enoch 10:5). The bound chief of the fallen, sealed under rocks and darkness until judgment, is the angel of the bottomless pit (Revelation 9:11) — held in the pit Enoch described, the king of the swarm loosed only at the appointed trumpet.'),
  ('canon','revelation',9,11,'enoch','1-enoch',10,6,'extras', E'*And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6). The destroyer''s end is the fire of the great judgment; the angel of the bottomless pit whose name is Destruction (Revelation 9:11) is bound now and reserved for the fire — loosed for the torment of the five months, but kept for the judgment Enoch foretold.'),
  ('canon','revelation',9,11,'enoch','1-enoch',20,2,'extras', E'*Uriel, one of the holy angels, who is over the world and over Tartarus* (1 Enoch 20:2). The library knew an angel set over the abyss itself — Uriel, *over... Tartarus* — and the king of the locusts is *the angel of the bottomless pit* (Revelation 9:11): the deep place has its appointed powers, and from it the destroyer ascends when the seal is opened.'),
  -- thread: four angels bound at the Euphrates, and the horsemen (free, P=isaiah/jeremiah, E=0) — add 1 Enoch host + more prophets
  ('canon','revelation',9,15,'enoch','1-enoch',56,5,'extras', E'*And in those days the angels shall return And hurl themselves to the east upon the Parthians and Medes: They shall stir up the kings, so that a spirit of unrest shall come upon them, And they shall rouse them from their thrones* (1 Enoch 56:5). The four angels loosed at the Euphrates to slay the third part (Revelation 9:15) do the very work Enoch saw — angels hurled to the east who *stir up the kings* and rouse the eastern host to war; the loosing of the bound angels is the loosing of the army upon the kingdoms.'),
  ('canon','revelation',9,16,'enoch','1-enoch',56,6,'extras', E'*And they shall go up and tread under foot the land of His elect ones, And the land of His elect ones shall be before them a threshing-floor and a highway* (1 Enoch 56:6). The numberless cavalry of the sixth trumpet (Revelation 9:16) is Enoch''s eastern multitude that goes up to tread the land underfoot — the angel-stirred host from beyond the river, loosed to do its appointed slaughter.'),
  ('canon','revelation',9,15,'enoch','1-enoch',56,7,'extras', E'*Till there be no number of the corpses through their slaughter, And their punishment be not in vain* (1 Enoch 56:7). The host loosed at the Euphrates is *to slay the third part of men* (Revelation 9:15); Enoch foretold the same — slaughter *till there be no number of the corpses,* the punishment of the appointed hour not in vain.'),
  ('canon','revelation',9,17,'canon','isaiah',5,27,'free', E'*None shall be weary nor stumble among them; none shall slumber nor sleep; neither shall the girdle of their loins be loosed, nor the latchet of their shoes be broken* (Isaiah 5:27). Isaiah''s summoned army is tireless and unbreakable; the lion-headed horsemen out of whose mouths *issued fire and smoke and brimstone* (Revelation 9:17) are that very host — none weary, none slumbering, the day-of-vengeance cavalry the prophet described.'),
  ('canon','revelation',9,15,'canon','jeremiah',46,6,'free', E'*Let not the swift flee away, nor the mighty man escape; they shall stumble, and fall toward the north by the river Euphrates* (Jeremiah 46:6). Jeremiah set the slaughter at the very river — *they shall... fall toward the north by the river Euphrates* — where the four angels are bound and loosed to slay (Revelation 9:15); the covenant river is the appointed place of the falling, in the prophet and in the trumpet alike.'),
  -- thread: they repented not of worshipping devils and idols (extras) — add prophetic + 1 Enoch
  ('canon','revelation',9,20,'canon','daniel',5,23,'free', E'*and thou hast praised the gods of silver, and gold, of brass, iron, wood, and stone, which see not, nor hear, nor know* (Daniel 5:23). Daniel''s charge against Belshazzar names the very idols the survivors will not forsake — *gods of silver, and gold, of brass, iron, wood, and stone* — the made-things *which see not, nor hear, nor know,* exactly the *idols of gold, and silver, and brass, and stone, and of wood* of which they *repented not* (Revelation 9:20).'),
  ('canon','revelation',9,20,'canon','psalms',135,16,'free', E'*They have mouths, but they speak not; eyes have they, but they see not* (Psalm 135:16). The Psalter''s litany of the dead idols — *mouths, but they speak not; eyes... but they see not* — is the seer''s own *which neither can see, nor hear, nor walk* (Revelation 9:20); the breathless gods the unrepentant cling to are the speechless, sightless made-things the psalm had long exposed.'),
  ('canon','revelation',9,20,'canon','psalms',115,6,'free', E'*They have ears, but they hear not: noses have they, but they smell not* (Psalm 115:6). The psalm names sense after sense the idols lack — *ears, but they hear not* — the very catalogue the seer takes up against the idols of gold and silver of which the survivors *repented not* (Revelation 9:20); the worshippers cling to gods more dead than themselves.'),
  ('canon','revelation',9,20,'enoch','1-enoch',99,7,'extras', E'*And they who worship stones, and grave images of gold and silver and wood and clay, And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them* (1 Enoch 99:7). The restored library binds the two charges into one, just as the seer does: those who *worship... grave images of gold and silver and wood* and *worship impure spirits and demons* — idol-worship and devil-worship together, exactly *the works of their hands, that they should not worship devils, and idols of gold, and silver* (Revelation 9:20). And, as Enoch warns, the idols *shall get no manner of help from them*: the plagues fall and the breathless gods cannot save.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== thread members =====
-- members: revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14 (existing 1..8)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 18:11 — *a place which had no firmament of the heaven above, and no firmly founded earth beneath it... a waste and horrible place* the waste abyss at the end of heaven and earth, the pit the fallen star unlocks (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 18:13 — *the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God)* the transgressing stars bound for breaking the commandment; the fallen star is one of them (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 18:15 — *a great fire there which burnt and blazed, and the place was cleft as far as the abyss, being full of great descending columns of fire* the furnace-chamber whose smoke rises as the smoke of a great furnace (Revelation 9:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'1 Enoch 21:5 — *This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven* the appointed prison of the fallen stars, the pit unlocked at the fifth trumpet (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 25, E'1 Enoch 88:3 — *bound them all hand and foot, and cast them in an abyss of the earth* the fallen stars bound and cast into the abyss; the loosing John sees is the other end of this binding (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=88 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9 (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 1:5 — *Awake, ye drunkards, and weep... for the new wine... is cut off from your mouth* the locust-day wakes the careless to judgment; the locusts of the smoke come on the unsealed (Revelation 9:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8 (existing 1..2)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Job 3:20 — *Wherefore is light given to him that is in misery, and life unto the bitter in soul* life held on the bitter soul as a torment; men seek death and find it not (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Job 3:22 — *Which rejoice exceedingly, and are glad, when they can find the grave?* the gladness of finding the grave, denied the men of the fifth trumpet who desire to die (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Job 7:15 — *my soul chooseth strangling, and death rather than my life* the soul choosing death over life, the extremity of the scorpion-stung (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'Hosea 10:8 — *they shall say to the mountains, Cover us; and to the hills, Fall on us* the flight from a life made unbearable, the death the trumpet-men beg for and are refused (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2 (existing 1..4)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 2:6 — *Before their face the people shall be much pained: all faces shall gather blackness* the dread of Joel''s host before which every face blackens, the advancing locusts with faces as men (Revelation 9:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:7 — *they shall march every one on his ways, and they shall not break their ranks* the marshalled, unbreakable war-array of Joel''s host, the chariot-loud locust-army (Revelation 9:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Joel 2:9 — *they shall run upon the wall, they shall climb up upon the houses; they shall enter in at the windows like a thief* the all-pervading host overrunning wall and house, the relentless swarm of the fifth trumpet (Revelation 9:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88 (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 10:5 — *cover him with darkness, and let him abide there for ever, and cover his face that he may not see light* the bound chief sealed under darkness until judgment, the angel of the bottomless pit (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire* the destroyer reserved for the fire of judgment; loosed for the torment but kept for the end (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 20:2 — *Uriel, one of the holy angels, who is over the world and over Tartarus* an angel set over the abyss itself; the king of the swarm is the angel of the bottomless pit (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5 (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 56:5 — *the angels shall return And hurl themselves to the east upon the Parthians and Medes: They shall stir up the kings... And they shall rouse them from their thrones* the angels loosed to stir up the eastern host, the four angels loosed at the Euphrates (Revelation 9:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 56:6 — *they shall go up and tread under foot the land of His elect ones... a threshing-floor and a highway* the numberless eastern multitude that treads the land, the cavalry of the sixth trumpet (Revelation 9:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=56 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 56:7 — *Till there be no number of the corpses through their slaughter, And their punishment be not in vain* the appointed slaughter without number, the host loosed to slay the third part of men (Revelation 9:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=56 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'Isaiah 5:27 — *None shall be weary nor stumble among them; none shall slumber nor sleep* Isaiah''s tireless summoned army, the lion-headed horsemen of the sixth trumpet (Revelation 9:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 25, E'Jeremiah 46:6 — *they shall stumble, and fall toward the north by the river Euphrates* the slaughter set at the very river where the four angels are bound and loosed (Revelation 9:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=46 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115 (existing 1..6)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 5:23 — *thou hast praised the gods of silver, and gold, of brass, iron, wood, and stone, which see not, nor hear, nor know* Daniel''s charge naming the very idols of which the survivors repented not (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 135:16 — *They have mouths, but they speak not; eyes have they, but they see not* the Psalter''s litany of dead idols, *which neither can see, nor hear, nor walk* (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Psalm 115:6 — *They have ears, but they hear not: noses have they, but they smell not* sense after sense the idols lack; the breathless gods the unrepentant cling to (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'1 Enoch 99:7 — *they who worship stones, and grave images of gold and silver and wood... And those who worship impure spirits and demons* the library binds idol-worship and devil-worship as one charge, exactly the seer''s (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 10 =====
-- S227 enrichment — Revelation 10: the mighty angel and the little scroll
-- ADD-only: new cross_references + new thread members on the existing live ch10 threads
-- (built in session224). References the shared view _s227_rev_lookup. No rewrites.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the mighty angel clothed with a cloud, rainbow, pillars of fire (free, P=daniel/ezekiel)
  ('canon','revelation',10,1,'canon','daniel',10,5,'free', E'*Then I lifted up mine eyes, and looked, and behold a certain man clothed in linen, whose loins were girded with fine gold of Uphaz* (Daniel 10:5). The mighty angel whose *face was as it were the sun, and his feet as pillars of fire* (Revelation 10:1) is the man Daniel saw by the great river — *a certain man clothed in linen,* girded with fine gold. John sees the same shining figure that came to Daniel; the latter-day messenger wears the one unbroken glory.'),
  ('canon','revelation',10,3,'canon','ezekiel',43,2,'free', E'*and, behold, the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2). The angel *cried with a loud voice* (Revelation 10:3), and the glory that returns to the temple in Ezekiel cries with *a voice... like a noise of many waters.* The mighty angel''s loud cry is the voice of the returning glory the prophet heard — the same throne-glory bending down upon the sea and the earth.'),
  -- thread: the cry as a lion roaring and the seven thunders sealed up (free, P=amos/daniel)
  ('canon','revelation',10,3,'canon','psalms',29,3,'free', E'*The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters* (Psalm 29:3). The seven thunders that *uttered their voices* (Revelation 10:3) are the thunder of Yahuah (LORD) the psalm names — *the Elohim (God) of glory thundereth.* The loud cry and the rolling thunders are the voice of Yahuah (LORD) upon the waters, the very utterance the psalmist sang seven times over his deep.'),
  -- thread: the angel's oath by him that liveth for ever (free, P=daniel)
  ('canon','revelation',10,5,'canon','genesis',14,22,'free', E'*And Abram said to the king of Sodom, I have lift up mine hand unto Yahuah (LORD), the El Elyon (most high God), the possessor of heaven and earth* (Genesis 14:22). The angel *lifted up his hand to heaven, and sware by him that liveth for ever and ever, who created heaven... and the earth... and the sea* (Revelation 10:5-6). Abram swore the oldest such oath, hand lifted to *the possessor of heaven and earth* — the very Maker by whom the angel now swears. The raised hand unto the Creator of heaven and earth is the patriarch''s oath-gesture, taken up at the consummation.'),
  -- thread: take it, and eat it up — sweet as honey, bitter in the belly (extras) — add fiery-cup + Ezekiel 3:2
  ('canon','revelation',10,9,'apocrypha','2-esdras',14,38,'extras', E'*And the next day, behold, a voice called me, saying, Esdras, open your mouth, and drink that I give you to drink* (2 Esdras 14:38). The angel says, *Take it, and eat it up* (Revelation 10:9); the restored library tells the same charge given to Esdras — *open your mouth, and drink that I give you.* Whether the word is eaten as a scroll or drunk as a cup, the prophet must first take it into himself, mouth opened to receive what he will then speak.'),
  ('canon','revelation',10,10,'apocrypha','2-esdras',14,39,'extras', E'*Then opened I my mouth, and, behold, he reached me a full cup, which was full as it were with water, but the colour of it was like fire* (2 Esdras 14:39). John *took the little book... and ate it up* (Revelation 10:10); Esdras took *a full cup... the colour of it was like fire.* The fiery draught and the eaten scroll are one figure — the word of Yahuah (LORD) received into the very body of the prophet, fire to take in, that he may be filled and made able to speak.'),
  ('canon','revelation',10,10,'canon','ezekiel',3,2,'free', E'*So I opened my mouth, and he caused me to eat that roll* (Ezekiel 3:2). *And I took the little book out of the angel''s hand, and ate it up* (Revelation 10:10). Ezekiel''s very act is John''s — *I opened my mouth, and he caused me to eat that roll.* The eating of the scroll is the receiving of the word that becomes the prophet''s own, the same commission re-enacted upon the sea and the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== thread members =====
-- members: revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1 (existing 1..4)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 10:5 — *a certain man clothed in linen, whose loins were girded with fine gold of Uphaz* the shining man Daniel saw by the river, the mighty angel''s sun-bright face and fiery feet (Revelation 10:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 43:2 — *the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters* the returning throne-glory whose voice is many waters, the angel''s loud cry (Revelation 10:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth* the seven thunders are the voice of Yahuah (LORD) upon the waters, the glory that thundereth (Revelation 10:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=29 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12 (existing 1..3)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Genesis 14:22 — *I have lift up mine hand unto Yahuah (LORD), the El Elyon (most high God), the possessor of heaven and earth* Abram''s oath-gesture, the lifted hand unto the Maker of heaven and earth (Revelation 10:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3 (existing 1..6)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 14:38 — *Esdras, open your mouth, and drink that I give you to drink* the prophet bidden to open his mouth and take the word in, as John is bidden to eat the little book (Revelation 10:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 14:39 — *he reached me a full cup, which was full as it were with water, but the colour of it was like fire* the fiery draught Esdras drank, one figure with the eaten scroll John took in (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Ezekiel 3:2 — *So I opened my mouth, and he caused me to eat that roll* Ezekiel''s very act of eating the roll, the same commission John re-enacts (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 11 =====
-- S227 enrichment — Revelation 11: the two witnesses (two houses), the beast,
--   the seventh trumpet, the ark of the testament.
-- ADD-only: new cross_references + new thread members on the existing live ch11 threads.
-- NOTE: ch11 was corrected in session225 (two-witnesses = the two houses, Ezekiel 37
--   two sticks). The two-witnesses, fire/shut-heaven, spirit-of-life, and kingdoms
--   threads already carry their S225 members (Ezek 37:16/17/19/22; Rev 20:11-12 frame);
--   nothing here duplicates them. References the shared view _s227_rev_lookup. No rewrites.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the reed to measure the temple (extras thread, P-adds free) — add Zechariah 2:2, Daniel 8:14
  ('canon','revelation',11,1,'canon','zechariah',2,2,'free', E'*And he said unto me, To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof* (Zechariah 2:2). The reed given to *measure the temple of Elohim (God), and the altar* (Revelation 11:1) is the measuring-line of Zechariah, sent *to measure Jerusalem.* And that measuring ended not in ruin but in restoration — Yahuah (LORD) a wall of fire about her and the glory in her midst; so the measured temple is marked off for keeping, not for demolition.'),
  ('canon','revelation',11,2,'canon','daniel',8,14,'free', E'*And he said unto me, Unto two thousand and three hundred days; then shall the sanctuary be cleansed* (Daniel 8:14). The holy city *trodden under foot forty and two months* (Revelation 11:2) is the trodden sanctuary of Daniel, given over for a numbered season — *then shall the sanctuary be cleansed.* The treading is measured and bounded; like Daniel''s days, it runs its appointed count and ends in the cleansing of the holy place.'),
  -- thread: the two witnesses, two olive trees, two candlesticks (P=ezekiel/zechariah) — Ezek 37 done in S225; add Zechariah 4:2, 4:6, 4:12
  ('canon','revelation',11,4,'canon','zechariah',4,2,'free', E'*I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps* (Zechariah 4:2). The two witnesses are *the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4), named from Zechariah''s golden lampstand fed by its bowl and pipes. The lamps that burn before Yahuah (LORD) are the witness of his people — the two houses bearing his light through the dark days of the treading-down.'),
  ('canon','revelation',11,3,'canon','zechariah',4,6,'free', E'*This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The two witnesses *prophesy a thousand two hundred and threescore days* (Revelation 11:3) in the power Zechariah named over the lampstand — *Not by might, nor by power, but by my spirit.* The two houses testify not by their own strength but by the Spirit of Yahuah (LORD), the oil that feeds the lamps through the whole appointed time.'),
  ('canon','revelation',11,4,'canon','zechariah',4,12,'free', E'*What be these two olive branches which through the two golden pipes empty the golden oil out of themselves?* (Zechariah 4:12). The *two olive trees* of the witnesses (Revelation 11:4) are Zechariah''s two branches pouring out the golden oil into the lamps — the two houses supplying the light with the Spirit''s oil, feeding the one lampstand of the testimony out of themselves.'),
  -- thread: the beast from the pit slays them, the great city Sodom (free, P=daniel/isaiah) — add Daniel 7:25, Ezekiel 16:49, Isaiah 1:21
  ('canon','revelation',11,7,'canon','daniel',7,25,'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time* (Daniel 7:25). The beast that *make war against them, and... overcome them, and kill them* (Revelation 11:7) is the horn that *wear out the saints of the El Elyon (most High)* — given the saints into his hand for a measured season, *a time and times and the dividing of time,* the very span of the witnesses'' treading-down. The prevailing is bounded, the law-changing beast loosed only for the appointed hour.'),
  ('canon','revelation',11,8,'canon','ezekiel',16,49,'free', E'*Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy* (Ezekiel 16:49). The great city where the witnesses lie dead is *spiritually... called Sodom* (Revelation 11:8) — and Ezekiel had already named the covenant city Sodom''s sister, charging her with Sodom''s very iniquity. The city earns the name not by her place but by her deeds, the pride and hardness Ezekiel laid to the unfaithful daughter.'),
  ('canon','revelation',11,8,'canon','isaiah',1,21,'free', E'*How is the faithful city become an harlot! it was full of judgment; righteousness lodged in it; but now murderers* (Isaiah 1:21). The city *spiritually... called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8) is Isaiah''s faithful city *become an harlot* — once full of judgment, now full of murderers, the city that slays the prophets. Sodom by her deeds and a harlot by her unfaithfulness: the prophets'' own charge against the covenant city in her rebellion.'),
  -- thread: the kingdoms become the kingdoms of our Lord (free, P=daniel/zechariah, E where real) — add Daniel 2:35, 7:18, Obadiah 1:21, 2 Esdras 12:32
  ('canon','revelation',11,15,'canon','daniel',2,35,'free', E'*and the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35). *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* (Revelation 11:15): this is the stone of Daniel grown to fill the earth — the image of the kingdoms broken to chaff, and the stone *became a great mountain, and filled the whole earth.* The seventh trumpet declares come what Daniel saw: the everlasting kingdom filling all.'),
  ('canon','revelation',11,18,'canon','daniel',7,18,'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever* (Daniel 7:18). The trumpet gives *reward unto thy servants the prophets, and to the saints* (Revelation 11:18); Daniel foretold that very inheritance — *the saints of the El Elyon (most High) shall take the kingdom... for ever and ever.* The kingdom that becomes the Lord''s is the kingdom the saints possess with him; the reward of the seventh trumpet is the everlasting reign shared.'),
  ('canon','revelation',11,15,'canon','obadiah',1,21,'free', E'*And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom shall be the LORD’S* (Obadiah 1:21). The cry that *the kingdoms of this world are become the kingdoms of our Lord* (Revelation 11:15) is Obadiah''s closing word — *and the kingdom shall be the LORD’S.* The end of all the prophets'' hope is the one reign, the kingdom restored to Yahuah (LORD) from mount Zion, declared come at the seventh trumpet.'),
  ('canon','revelation',11,18,'apocrypha','2-esdras',12,32,'extras', E'*This is the anointed, which the Highest has kept for them and for their wickedness to the end: he shall reprove them, and shall upbraid them with their cruelty* (2 Esdras 12:32). The seventh trumpet names *the time of the dead, that they should be judged,* and the wrath come on *them which destroy the earth* (Revelation 11:18). The restored library saw the same — the anointed *kept... to the end* to reprove the nations and judge their cruelty; the Messiah of his Father held in reserve until the appointed reckoning, then set forth to judge the destroyers of the earth.'),
  -- thread: the temple opened and the ark of his testament seen (P=0,E=0 -> add Jeremiah + 2 Maccabees)
  ('canon','revelation',11,19,'canon','jeremiah',3,16,'free', E'*they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more* (Jeremiah 3:16). The ark hidden and unremembered in Jeremiah''s day is *seen in his temple* at the last — *the ark of his testament* (Revelation 11:19). The prophet foretold the day the ark would no more be visited on earth; the seer is shown where it is — opened in heaven, the covenant not lost but enthroned.'),
  ('canon','revelation',11,19,'canon','jeremiah',3,17,'free', E'*At that time they shall call Jerusalem the throne of Yahuah (LORD); and all the nations shall be gathered unto it, to the name of Yahuah (LORD)* (Jeremiah 3:17). When *the temple of Elohim (God) was opened in heaven, and there was seen... the ark of his testament* (Revelation 11:19), it is the day Jeremiah named — Jerusalem *the throne of Yahuah (LORD)* and the nations gathered to his name. The showing of the ark is the dawning of that gathering: the covenant-throne revealed, the peoples drawn to it.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,4,'extras', E'*the prophet, being warned of Yahuah (God), commanded the tabernacle and the ark to go with him, as he went forth into the mountain, where Moses climbed up, and saw the heritage of Yahuah (God)* (2 Maccabees 2:4). The library kept the memory of the ark hidden away — Jeremiah, *warned of Yahuah (God),* taking *the tabernacle and the ark* into the mountain. The ark *seen in his temple* (Revelation 11:19) is the hidden ark brought to light at last, the thing concealed against the day of restoration now openly shown.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,5,'extras', E'*And when Jeremy came thither, he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door* (2 Maccabees 2:5). The ark Jeremiah *laid* in the hollow cave and *stopped the door* upon is the ark now *seen in his temple* in heaven (Revelation 11:19). What the prophet sealed away in the mountain against the appointed time is unsealed in the vision — the door of the cave answered by the opening of the heavenly temple.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,7,'extras', E'*As for that place, it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy* (2 Maccabees 2:7). The ark was to stay hidden *until the time that Yahuah (God) gather his people again together* — and at the seventh trumpet, when the kingdom is come and the people gathered, *the ark of his testament* is seen (Revelation 11:19). The showing of the ark is the sign that the appointed gathering has arrived, the covenant brought back into view for the regathered people.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,8,'extras', E'*Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also, as it was shewed under Moses* (2 Maccabees 2:8). The library foretold that at the gathering *Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also* — and so it is: *the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament* (Revelation 11:19), with the lightnings and thunderings of Sinai. The hidden ark shown, the glory and the cloud returned, exactly as the library said it would be at the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== thread members =====
-- members: revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40 (existing 1..7)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 2:2 — *To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof* the measuring-line of Jerusalem that ends in restoration, the reed marking off the temple (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 8:14 — *Unto two thousand and three hundred days; then shall the sanctuary be cleansed* the trodden sanctuary given over a numbered season, then cleansed; the city trodden forty-two months (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4 (existing 1..3 S224 + 4..7 S225)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 4:2 — *a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon* the golden lampstand whose lamps are the witness of his people, the two candlesticks of the two houses (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Zechariah 4:6 — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* the power in which the two witnesses prophesy, the Spirit''s oil feeding the lamps of the two houses (Revelation 11:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Zechariah 4:12 — *these two olive branches which through the two golden pipes empty the golden oil out of themselves* the two olive trees pouring the golden oil into the lamps, the two houses supplying the testimony (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7 (existing 1..3)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:25 — *shall wear out the saints of the El Elyon (most High), and think to change times and laws... until a time and times and the dividing of time* the law-changing horn that wears out the saints for a measured season, the beast that slays the witnesses (Revelation 11:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 16:49 — *this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness* the covenant city named Sodom''s sister by her deeds, the great city spiritually called Sodom (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Isaiah 1:21 — *How is the faithful city become an harlot!... but now murderers* the faithful city turned harlot and murderous, the city that slays the prophets and the witnesses (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7 (existing 1..7)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 2:35 — *the stone that smote the image became a great mountain, and filled the whole earth* the stone grown to fill the earth, the everlasting kingdom now declared come (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the kingdom the saints possess with the Messiah; the trumpet rewards the servants and saints (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Obadiah 1:21 — *and the kingdom shall be the LORD’S* the prophets'' closing hope, the one reign restored to Yahuah (LORD) from mount Zion (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Esdras 12:32 — *This is the anointed, which the Highest has kept for them... to the end: he shall reprove them, and shall upbraid them with their cruelty* the anointed kept in reserve to judge the nations; the wrath come on them that destroy the earth (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25 (existing 1..4)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 3:16 — *they shall say no more, The ark of the covenant of Yahuah (LORD)... neither shall they remember it* the ark hidden and unremembered in Jeremiah''s day, now seen openly in the heavenly temple (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 3:17 — *At that time they shall call Jerusalem the throne of Yahuah (LORD); and all the nations shall be gathered unto it* the day of the gathering when the ark-throne is revealed and the nations drawn to his name (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Maccabees 2:4 — *the prophet... commanded the tabernacle and the ark to go with him, as he went forth into the mountain* Jeremiah hiding the ark in the mountain; the ark now seen openly in the temple of heaven (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Maccabees 2:5 — *he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door* the ark sealed in the cave against the appointed time, unsealed when the heavenly temple is opened (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 25, E'2 Maccabees 2:7 — *it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy* the ark hidden until the gathering; the showing of the ark is the sign the gathering has come (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 26, E'2 Maccabees 2:8 — *Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also, as it was shewed under Moses* the hidden ark shown and the glory-cloud returned at the gathering, exactly as the heavenly temple is opened (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 12 =====
-- S227 enrichment — Revelation 12: the woman & dragon (travail of Zion, wilderness, the remnant)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the-woman-clothed-with-the-sun-the-travail-of-zion — add Isaiah 26:17-18 (the daughter of Zion in her pangs)
  ('canon','revelation',12,2,'canon','isaiah',26,17,'free', E'*Like as a woman with child, that draweth near the time of her delivery, is in pain, and crieth out in her pangs; so have we been in thy sight, O Yahuah (LORD).* (Isaiah 26:17). The woman *cried, travailing in birth, and pained to be delivered* (Revelation 12:2) is the travailing daughter of Zion the prophets drew long before — Isaiah''s own confession of the covenant people in her pangs before Yahuah (LORD), the nation labouring under affliction. The figure is no new thing: it is Yashar''el (Israel) in her sorrow, the woman in pain in the sight of her Elohim (God).'),
  ('canon','revelation',12,2,'canon','isaiah',26,18,'free', E'*We have been with child, we have been in pain, we have as it were brought forth wind; we have not wrought any deliverance in the earth; neither have the inhabitants of the world fallen.* (Isaiah 26:18). Isaiah''s travail brought forth only wind — pangs without deliverance, the old age''s labour that could not save itself. The woman of the vision travails the same travail (Revelation 12:2), but now the deliverance the prophet longed for and could not work is wrought: she *brought forth a man child* (Revelation 12:5), and the barren labour of Yashar''el (Israel) at last bears the seed of promise.'),

  -- thread: that-old-serpent-cast-down — add 1 Enoch 88 (the fallen star bound and cast into the abyss)
  ('canon','revelation',12,9,'enoch','1-enoch',88,1,'extras', E'*And I saw one of those four who had come forth first, and he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss: now that abyss was narrow and deep, and horrible and dark.* (1 Enoch 88:1). The restored library saw the casting-down before John named it: the fallen star — the chief of the rebels — *seized... bound... and cast... into an abyss.* When *the great dragon was cast out... he was cast out into the earth* (Revelation 12:9), it is the same old expulsion the seer of Enoch beheld, the rebel hurled down from heaven; and his binding in the narrow and dark abyss is the very chaining John sees completed when the dragon is *bound... a thousand years* (Revelation 20:2).'),
  ('canon','revelation',12,9,'enoch','1-enoch',88,3,'extras', E'*And as I was beholding in the vision, lo, one of those four who had come forth stoned (them) from heaven, and gathered and took all the great stars whose privy members were like those of horses, and bound them all hand and foot, and cast them in an abyss of the earth.* (1 Enoch 88:3). The rebel stars are *bound... hand and foot, and cast... in an abyss of the earth* — and with the dragon *his angels were cast out with him* (Revelation 12:9). The casting-down is no solitary fall but the whole company of the rebels hurled from heaven to the earth and the abyss, exactly the throwing-out of the dragon and his angels the vision shows; the library bears one witness to the expulsion of the fallen.'),

  -- thread: two-wings-of-a-great-eagle-into-the-wilderness — add Numbers 16:30,32 (the earth opens her mouth)
  ('canon','revelation',12,16,'canon','numbers',16,30,'free', E'*But if Yahuah (LORD) make a new thing, and the earth open her mouth, and swallow them up, with all that appertain unto them, and they go down quick into the pit; then ye shall understand that these men have provoked Yahuah (LORD).* (Numbers 16:30). When the serpent casts the flood after the woman, *the earth helped the woman, and the earth opened her mouth, and swallowed up the flood* (Revelation 12:16). The earth opening her mouth to swallow is the sign Moses called for against Korah — *the earth open her mouth, and swallow them up* — Yahuah (LORD)''s own new thing, the ground itself made his instrument against those who war on his people. The same earth that swallowed the rebels swallows the serpent''s flood to deliver the woman.'),
  ('canon','revelation',12,16,'canon','numbers',16,32,'free', E'*And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* (Numbers 16:32). *The earth opened her mouth, and swallowed up the flood which the dragon cast out of his mouth* (Revelation 12:16) — the very deed wrought against Korah, *the earth opened her mouth, and swallowed them up.* The deliverance of the woman is no new wonder but the old wonder turned to her defence: the ground that opened to devour the enemies of Yahuah (LORD) opens again to devour the flood loosed against the woman and her seed.'),

  -- thread: the-remnant-which-keep-the-commandments — add Daniel 7:25 (the war on the saints and the law)
  ('canon','revelation',12,17,'canon','daniel',7,25,'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). The dragon *went to make war with the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17) — and Daniel had named the shape of that war: the power that wars on the saints is the power that *think[s] to change times and laws.* The assault on the commandment-keepers and the assault on the commandments are one assault; the dragon makes war on the woman''s seed precisely because they hold fast the times and laws he would overthrow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 26:17 — *Like as a woman with child... is in pain, and crieth out in her pangs; so have we been in thy sight, O Yahuah (LORD)* the travailing daughter of Zion; the woman''s birth-pangs are Yashar''el (Israel) in her sorrow before her Elohim (God) (Revelation 12:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 26:18 — *we have been in pain, we have as it were brought forth wind; we have not wrought any deliverance* the old age''s barren travail; the woman''s pangs now bear the deliverance Isaiah longed for and could not work (Revelation 12:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- that-old-serpent-the-devil-and-satan-cast-down-genesis-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 88:1 — *he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss* the restored library''s casting-down of the chief rebel; the same expulsion as the dragon cast out into the earth (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=88 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 88:3 — *bound them all hand and foot, and cast them in an abyss of the earth* the whole company of rebel stars hurled down; with the dragon his angels were cast out with him (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=88 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Numbers 16:30 — *the earth open her mouth, and swallow them up... they go down quick into the pit* the sign Moses called against Korah; the earth made Yahuah (LORD)''s instrument, as it swallows the serpent''s flood (Revelation 12:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Numbers 16:32 — *the earth opened her mouth, and swallowed them up... all the men that appertained unto Korah* the old wonder turned to the woman''s defence; the ground opens again to devour the flood loosed against her (Revelation 12:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-remnant-which-keep-the-commandments-of-elohim-malachi-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:25 — *shall wear out the saints of the El Elyon (most High), and think to change times and laws* the war on the saints is the war on the law; the dragon makes war on the seed because they keep the commandments he would overthrow (Revelation 12:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 13 =====
-- S227 enrichment — Revelation 13: the two beasts & the mark (Daniel beasts, the worship, the seal counterfeited)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the-beast-from-the-sea — add Daniel 7:24 (ten horns = ten kings) + 2 Esdras 11:39 (the last of the four beasts)
  ('canon','revelation',13,1,'canon','daniel',7,24,'free', E'*And the ten horns out of this kingdom are ten kings that shall arise: and another shall rise after them; and he shall be diverse from the first, and he shall subdue three kings.* (Daniel 7:24). The beast rises *having seven heads and ten horns, and upon his horns ten crowns* (Revelation 13:1), and Daniel told what the ten horns are: *ten kings that shall arise* out of the fourth kingdom. The crowned horns of John''s beast are the crowned kings of Daniel''s fourth kingdom — the same diadems, the same dominion divided among the kings of the last empire, gathered upon the one composite beast.'),
  ('canon','revelation',13,1,'apocrypha','2-esdras',11,39,'extras', E'*Art not you it that remainest of the four beasts, whom I made to reign in my world, that the end of their times might come through them?* (2 Esdras 11:39). The voice rebukes Ezra''s eagle as the last of *the four beasts* whom the Most High *made to reign in my world* — Daniel''s four kingdoms again, the eagle the surviving fourth. So John''s beast *rise[s] up out of the sea, having seven heads and ten horns* (Revelation 13:1): the one composite is the remnant of the four beasts, the last reign before the appointed end of their times comes upon them. The library names the same succession of empires brought to its head and its end.'),

  -- thread: the-dragon-gave-him-his-power-all-the-world-worshipped — add Daniel 3:4 (the herald to all peoples, nations, languages)
  ('canon','revelation',13,3,'canon','daniel',3,4,'free', E'*Then an herald cried aloud, To you it is commanded, O people, nations, and languages,* (Daniel 3:4). On the plain of Dura a herald commanded *people, nations, and languages* to worship the golden image; and *all the world wondered after the beast* (Revelation 13:3). The same summons that went out to every people and nation and tongue before the image is the worship now drawn after the beast over the whole earth. The herald''s reach was one province; the beast''s is the world — but the demand is one demand, the compelled worship of the image lifted to fill all the earth.'),

  -- thread: a-mouth-speaking-great-things-and-blasphemies — add Daniel 7:11 (the beast slain for the great words of the horn)
  ('canon','revelation',13,5,'canon','daniel',7,11,'free', E'*I beheld then because of the voice of the great words which the horn spake: I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* (Daniel 7:11). The beast is given *a mouth speaking great things and blasphemies* for *forty and two months* (Revelation 13:5) — but Daniel watched the end of that loud mouth: *because of the voice of the great words which the horn spake,* he beheld *till the beast was slain... and given to the burning flame.* The boasting mouth is the very thing that seals the beast''s doom; the great words sound only for the appointed season, and then the body is destroyed and given to the fire.'),

  -- thread: names-not-written-in-the-book-of-life — add 1 Enoch 47:3 (the books of the living opened) + 108:3 (names blotted out of the book of life)
  ('canon','revelation',13,8,'enoch','1-enoch',47,3,'extras', E'*In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3). The book John names — *the book of life of the Lamb slain* (Revelation 13:8) — is the *books of the living* the restored library saw *opened before* the Head of Days upon the throne of his glory. The register of the living is no new thing of the last day; it is opened in heaven before the throne, the names long written there, and the worshippers of the beast are those not found in it.'),
  ('canon','revelation',13,8,'enoch','1-enoch',108,3,'extras', E'*Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever* (1 Enoch 108:3). The library knows the book of life and the dreadful blotting-out: *their names shall be blotted out of the book of life.* John sees the same book — those *whose names are not written in the book of life of the Lamb slain* (Revelation 13:8) worship the beast. The framework''s order holds across the library: names are blotted out, never added; to belong to the Lamb is to have a name kept in the book from the foundation, and the patience of the saints rests on that writing.'),

  -- thread: the-mark-in-the-hand-and-forehead — add Exodus 13:9 (the sign on the hand, the Torah in the mouth)
  ('canon','revelation',13,16,'canon','exodus',13,9,'free', E'*And it shall be for a sign unto thee upon thine hand, and for a memorial between thine eyes, that the LORD''S law may be in thy mouth: for with a strong hand hath Yahuah (LORD) brought thee out of Egypt.* (Exodus 13:9). The true sign on hand and brow is the sign of the Torah: *a sign unto thee upon thine hand, and... a memorial between thine eyes, that the LORD''S law may be in thy mouth.* The beast''s mark *in their right hand, or in their foreheads* (Revelation 13:16) is the counterfeit of exactly this — the law of Yahuah (LORD) on the hand and between the eyes, the token of the redeemed brought out of Egypt, parodied by the brand of the beast on the same hand and brow. The mark is the anti-Torah inversion of the sign that the LORD''S law is in his people''s mouth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:24 — *the ten horns out of this kingdom are ten kings that shall arise* the crowned horns of the beast are the kings of Daniel''s fourth kingdom, *ten horns... ten crowns* (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 11:39 — *Art not you it that remainest of the four beasts, whom I made to reign in my world* the eagle named the last of Daniel''s four beasts; the composite beast is that surviving fourth reign (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=11 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 3:4 — *an herald cried aloud, To you it is commanded, O people, nations, and languages* the herald''s summons to every people to worship the image, lifted to fill the earth, *all the world wondered after the beast* (Revelation 13:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:11 — *because of the voice of the great words which the horn spake... till the beast was slain... and given to the burning flame* the boasting mouth seals the beast''s doom; the great words sound only for the appointed season (Revelation 13:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- names-not-written-in-the-book-of-life-of-the-lamb-slain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 47:3 — *the Head of Days... seated Himself upon the throne of His glory, And the books of the living were opened before Him* the register of the living opened in heaven before the throne; the names written there before the beast rose (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 108:3 — *their names shall be blotted out of the book of life, And out of the books of the holy ones* the book of life and the blotting-out; names are blotted out, never added — the beast''s worshippers are not found written there (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Exodus 13:9 — *a sign unto thee upon thine hand, and for a memorial between thine eyes, that the LORD''S law may be in thy mouth* the Torah-sign on hand and brow that the beast''s mark counterfeits; the law of Yahuah (LORD), not the beast''s name (Revelation 13:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 14 =====
-- S227 enrichment — Revelation 14: 144,000 on Zion, everlasting gospel, Babylon, the commandment-keepers
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the-lamb-on-mount-sion-the-144000 — add Ezekiel 37:22 (one nation, no more two) + 2 Esdras 2 (the sealed company on Sion)
  ('canon','revelation',14,1,'canon','ezekiel',37,22,'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The 144,000 *of all the tribes of the children of Yashar''el (Israel)* stand with the Lamb on mount Sion (Revelation 14:1; cf. 7:4) — and this is the very end the prophet was shown when he joined the two sticks: *I will make them one nation... they shall be no more two nations.* The two-house seed, Judah and Ephraim/Joseph, are not two kingdoms any longer but one people under one king, gathered home upon the mountains of Yashar''el (Israel). The number on Zion is the reunited house made whole, not a people that erases the tribes.'),
  ('canon','revelation',14,1,'apocrypha','2-esdras',2,42,'extras', E'*I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs.* (2 Esdras 2:42). The restored library set the same company on the same mountain: *upon the mount Sion a great people, whom I could not number,* praising Elohim (God) *with songs* — the very scene John beholds when *a Lamb stood on the mount Sion, and with him an hundred forty and four thousand* (Revelation 14:1), who *sung as it were a new song before the throne* (Revelation 14:3). The gathered on Zion, beyond numbering, lifting the song of the redeemed: one vision across the library of the people brought home to the holy hill.'),
  ('canon','revelation',14,3,'apocrypha','2-esdras',2,45,'extras', E'*He answered and said to me, These be they that have put off the mortal clothing, and put on the immortal, and have confessed the name of Yahuah (God): now are they crowned, and receive palms.* (2 Esdras 2:45). The company on Sion are *they that... have confessed the name of Yahuah (God)* and *now are... crowned, and receive palms* — the redeemed who bear *his Father''s name written in their foreheads* (Revelation 14:1) and sing the new song none could learn *but the hundred and forty and four thousand, which were redeemed from the earth* (Revelation 14:3). The crowned palm-bearers of the restored library and the sealed firstfruits of John are one gathered multitude, marked by the Name and brought through to praise.'),

  -- thread: the-everlasting-gospel-worship-him-that-made — add Psalm 96:5, Psalm 96:13, Isaiah 40:26, 1 Enoch 5:1
  ('canon','revelation',14,7,'canon','psalms',96,5,'free', E'*For all the gods of the nations are idols: but Yahuah (LORD) made the heavens.* (Psalm 96:5). The everlasting gospel sends every nation back from its idols to the Maker: *worship him that made heaven, and earth, and the sea, and the fountains of waters* (Revelation 14:7). The psalm draws the same line — *all the gods of the nations are idols: but Yahuah (LORD) made the heavens.* Over against the beast and his image, the gospel proclaims the One who made the heavens; worship belongs not to the works of men''s hands but to the Creator of all.'),
  ('canon','revelation',14,7,'canon','psalms',96,13,'free', E'*Before Yahuah (LORD): for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth.* (Psalm 96:13). The angel cries *Fear Elohim (God), and give glory to him; for the hour of his judgment is come* (Revelation 14:7) — the very hour the psalm sang in advance: *he cometh to judge the earth... he shall judge the world with righteousness.* The summons to worship the Maker and the announcement that the hour of judgment is come are one word, for the Creator is the Judge; the gospel calls the nations to fear and glorify him before he comes to judge the world in righteousness.'),
  ('canon','revelation',14,7,'canon','isaiah',40,26,'free', E'*Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names by the greatness of his might, for that he is strong in power; not one faileth.* (Isaiah 40:26). To *worship him that made heaven* (Revelation 14:7) is to lift the eyes to the One Isaiah names — *behold who hath created these things, that bringeth out their host by number.* The Maker of the starry host, who calls them all by name and lets not one fail, is the One the everlasting gospel summons all flesh to fear and to glorify; the heavens themselves preach the Creator the gospel names.'),
  ('canon','revelation',14,7,'enoch','1-enoch',5,1,'extras', E'*Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* (1 Enoch 5:1). The everlasting gospel''s call — *worship him that made heaven, and earth, and the sea* (Revelation 14:7) — is the call the restored library raises from the works of creation: *give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The seasons and the trees and the host of heaven all testify of the Maker; the gospel and the library alike send the heart from the made things to the One who liveth for ever and made them.'),

  -- thread: babylon-is-fallen-is-fallen — add Jeremiah 51:7 (the golden cup) + Daniel 4:30 (the pride of Babylon)
  ('canon','revelation',14,8,'canon','jeremiah',51,7,'free', E'*Babylon hath been a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad.* (Jeremiah 51:7). The angel''s charge — *she made all nations drink of the wine of the wrath of her fornication* (Revelation 14:8) — is Jeremiah''s golden cup: *a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine.* The cup that intoxicated the nations and the cup of her fornication are one cup; the great city of the last days pours the same wine the prophet saw Babylon pour, and falls under the same word.'),
  ('canon','revelation',14,8,'canon','daniel',4,30,'free', E'*The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30). *Babylon is fallen, is fallen, that great city* (Revelation 14:8) — and Daniel showed the pride that goes before that fall: *Is not this great Babylon, that I have built... for the honour of my majesty?* In the boast of *great Babylon* the king was abased that very hour; so the great city, drunk with her own glory and her fornication, is fallen. The pride of Babylon is the seed of her ruin, announced before it falls as a sure word.'),

  -- thread: here-are-they-that-keep-the-commandments — add Daniel 7:25 (the saints worn by the beast) + 2 Esdras 2:40 (those who fulfilled the law)
  ('canon','revelation',14,12,'canon','daniel',7,25,'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). *Here is the patience of the saints: here are they that keep the commandments of Elohim (God)* (Revelation 14:12) — and Daniel named the trial that patience endures: the beast-power that *wear[s] out the saints* and *think[s] to change times and laws.* The saints are worn but not overcome, given into his hand only *until a time and times and the dividing of time.* Their patience is the holding-fast of the commandment-keepers through the very season the beast wars on the law; the appointed end is fixed, and the saints keep the times and laws he would change.'),
  ('canon','revelation',14,12,'apocrypha','2-esdras',2,40,'extras', E'*Take your number, O Sion, and shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah (God).* (2 Esdras 2:40). The saints of the book are *they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12) — and the restored library marks the gathered of Sion by the same sign: *those... clothed in white, which have fulfilled the law of Yahuah (God).* The law-keepers clothed in white and the commandment-keepers holding the faith are one company; the patience of the saints is the patience of those who fulfilled the law, numbered and kept on Zion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 37:22 — *I will make them one nation... they shall be no more two nations, neither shall they be divided into two kingdoms any more* the climax of the two sticks; the 144,000 are the reunited house made one under one king (Revelation 14:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 2:42 — *upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs* the restored library''s company on Sion, beyond number, singing the song of the redeemed (Revelation 14:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Esdras 2:45 — *they that... have confessed the name of Yahuah (God): now are they crowned, and receive palms* the crowned palm-bearers who bear the Name; the sealed with the Father''s name in their foreheads (Revelation 14:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 96:5 — *all the gods of the nations are idols: but Yahuah (LORD) made the heavens* the gospel turns the nations from idols to the Maker of the heavens; worship him that made heaven and earth (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 96:13 — *he cometh to judge the earth: he shall judge the world with righteousness* the hour of judgment the angel proclaims; the Maker is the Judge who comes in righteousness (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Isaiah 40:26 — *behold who hath created these things, that bringeth out their host by number... not one faileth* the Maker of the starry host the gospel names; lift the eyes to the Creator and worship him (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'1 Enoch 5:1 — *give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so* the restored library''s call from the made things to the eternal Maker; the everlasting gospel''s very summons (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- babylon-is-fallen-is-fallen-isaiah-21-jeremiah-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 51:7 — *Babylon hath been a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine* the golden cup that intoxicated the nations; the wine of her fornication is the same cup (Revelation 14:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-babylon-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 4:30 — *Is not this great Babylon, that I have built... for the honour of my majesty?* the pride of great Babylon, abased that very hour; the seed of her fall (Revelation 14:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-babylon-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- here-are-they-that-keep-the-commandments-of-elohim-malachi-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:25 — *shall wear out the saints of the El Elyon (most High)... until a time and times and the dividing of time* the trial the saints'' patience endures; worn but not overcome, the commandment-keepers held to the appointed end (Revelation 14:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-here-are-they-that-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 2:40 — *those of yours that are clothed in white, which have fulfilled the law of Yahuah (God)* the law-keepers of Sion clothed in white; the same sign as they that keep the commandments and the faith of Yahusha (Jesus) (Revelation 14:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-here-are-they-that-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 15 =====
-- S227 enrichment — Revelation 15: song of Moses & the Lamb; sanctuary opened; seven last plagues
-- ADD-ONLY. References shared view _s227_rev_lookup (defined by assembled migration).

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: song-of-moses-and-the-lamb
  ('canon','revelation',15,2,'canon','psalms',98,1,'free', E'*O sing unto Yahuah (LORD) a new song; for he hath done marvellous things: his right hand, and his holy arm, hath gotten him the victory.* (Psalm 98:1). The victors stand on the sea of glass having *gotten the victory over the beast* (Revelation 15:2), and the song they raise is this new song: the marvellous things done by his right hand, the holy arm that drowned Pharaoh and now overthrows the beast. *Great and marvellous are thy works* is the choir taking up the psalmist''s reason for the new song — the victory is his, not theirs, won by the arm of Yahuah (LORD).'),
  ('canon','revelation',15,2,'apocrypha','2-esdras',2,42,'extras', E'*I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs.* (2 Esdras 2:42). The Hebrew library beheld the very scene: a numberless company on mount Sion *praised Yahuah (God) with songs*, and in their midst *a young man of a high stature, taller than all the rest... set crowns* upon them (2 Esdras 2:43). So the victors stand *on the sea of glass, having the harps of Elohim (God)* (Revelation 15:2) and sing — the redeemed gathered to praise, crowned by the exalted one who stands among them.'),
  -- thread: just-and-true-the-Rock
  ('canon','revelation',15,3,'canon','psalms',111,2,'free', E'*The works of Yahuah (LORD) are great, sought out of all them that have pleasure therein.* (Psalm 111:2). The song confesses *Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty* (Revelation 15:3) — the very praise of the psalm, *the works of Yahuah (LORD) are great.* The redeemed search out his works and find them great, and over the seven plagues about to fall they declare not fear but wonder, for every work of his is great and worthy to be sought out.'),
  ('canon','revelation',15,3,'canon','psalms',111,3,'free', E'*His work is honourable and glorious: and his righteousness endureth for ever.* (Psalm 111:3). *Just and true are thy ways, thou King of saints* (Revelation 15:3) is the song''s confession of the same righteousness the psalm names — *his righteousness endureth for ever.* As the witness-song of Moses called him the Rock whose work is perfect, so the psalm calls his work honourable and glorious; the redeemed sing that the judgments now poured out carry that everlasting righteousness, just and true in every way.'),
  -- thread: all-nations-shall-come-and-worship
  ('canon','revelation',15,4,'canon','isaiah',66,23,'free', E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* (Isaiah 66:23). The song declares *all nations shall come and worship before thee* (Revelation 15:4), and Isaiah named the manner of that worship: *all flesh* coming *from one sabbath to another* to bow before him. The nations gathered are not loosed from his appointed times but keep them — new moon and sabbath — the Torah-honouring worship of the One who alone is holy.'),
  ('canon','revelation',15,4,'canon','jeremiah',16,19,'free', E'*O Yahuah (LORD), my strength, and my fortress... the Gentiles shall come unto thee from the ends of the earth, and shall say, Surely our fathers have inherited lies, vanity, and things wherein there is no profit.* (Jeremiah 16:19). Jeremiah foresaw the Gentiles coming *from the ends of the earth*, casting away the lies their fathers inherited. The song sees it manifest: *all nations shall come and worship before thee* (Revelation 15:4) — the nations turning from the idols that *cannot do evil, neither... good* to bow before the only One who is holy, the very turning home the prophet promised.'),
  -- thread: temple-of-the-tabernacle-of-the-testimony-opened
  ('canon','revelation',15,5,'canon','ezekiel',44,4,'free', E'*Then brought he me the way of the north gate before the house: and I looked, and, behold, the glory of Yahuah (LORD) filled the house of Yahuah (LORD): and I fell upon my face.* (Ezekiel 44:4). When the sanctuary opens, *the temple of the tabernacle of the testimony in heaven was opened* (Revelation 15:5). Ezekiel, brought to the opened house, saw *the glory of Yahuah (LORD) filled the house* and fell on his face — the same heavenly sanctuary, the glory filling it, of which Moses'' tent of testimony was the earthly copy.'),
  -- thread: temple-filled-with-smoke
  ('canon','revelation',15,8,'canon','ezekiel',10,4,'free', E'*Then the glory of Yahuah (LORD) went up from the cherub, and stood over the threshold of the house; and the house was filled with the cloud, and the court was full of the brightness of the LORD’S glory.* (Ezekiel 10:4). Ezekiel saw *the house... filled with the cloud* and the court full of the brightness of the glory. So *the temple was filled with smoke from the glory of Elohim (God), and from his power* (Revelation 15:8). The cloud of glory that filled the house in Ezekiel''s vision is the smoke that fills the heavenly temple — the visible weight of holiness no flesh can stand before.'),
  -- thread: seven-last-plagues-covenant-sanctions
  ('canon','revelation',15,1,'canon','leviticus',26,25,'free', E'*And I will bring a sword upon you, that shall avenge the quarrel of my covenant... I will send the pestilence among you; and ye shall be delivered into the hand of the enemy.* (Leviticus 26:25). The seven last plagues *fill up... the wrath of Elohim (God)* (Revelation 15:1), and the covenant set out that very wrath — *seven times* (Leviticus 26:24) the sword *that shall avenge the quarrel of my covenant*, with pestilence behind it. The bowls are no novelty but the covenant''s own avenging sanction, sworn at Sinai, filled up at the last upon the kingdom of the beast.'),
  ('canon','revelation',15,1,'canon','ezekiel',5,12,'free', E'*A third part of thee shall die with the pestilence, and with famine shall they be consumed... and a third part shall fall by the sword round about thee; and I will scatter a third part into all the winds...* (Ezekiel 5:12). Ezekiel poured out the covenant sanctions in measured thirds — pestilence, famine, sword, scattering. The seven angels carry that same measured judgment to its sevenfold fullness: *seven angels having the seven last plagues; for in them is filled up the wrath of Elohim (God)* (Revelation 15:1). The prophet''s portioned wrath is the bowls'' wrath filled up and final.'),
  ('canon','revelation',15,1,'canon','amos',4,10,'free', E'*I have sent among you the pestilence after the manner of Egypt: your young men have I slain with the sword... yet have ye not returned unto me, saith Yahuah (LORD).* (Amos 4:10). Amos named the covenant plagues *after the manner of Egypt*, sent again and again on a people that would not return. The seven last plagues are that same Egypt-wrath brought to its end — *filled up* upon men who, like Amos''s hearers, *repented not* (Revelation 16:9,11). The pestilence after the manner of Egypt is poured out a final time on the new Egypt that will not turn.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- song-of-moses-and-the-lamb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 98:1 — *O sing unto Yahuah (LORD) a new song; for he hath done marvellous things: his right hand, and his holy arm, hath gotten him the victory* the victors who *gotten the victory over the beast* take up the new song; the marvellous works are his, the victory his (Revelation 15:2-3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-song-of-moses-and-the-lamb-the-new-exodus-sung-in-the-old-exodus-words-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=98 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 2:42 — *upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs* the Hebrew library beholds the numberless company singing on Sion, the exalted young man crowning them, the posture of the victors with the harps (Revelation 15:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-song-of-moses-and-the-lamb-the-new-exodus-sung-in-the-old-exodus-words-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- just-and-true-the-Rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 111:2 — *The works of Yahuah (LORD) are great, sought out of all them that have pleasure therein* the redeemed search out his works and find them great; *great and marvellous are thy works* (Revelation 15:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-just-and-true-are-thy-ways-the-rock-whose-work-is-perfect-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 111:3 — *His work is honourable and glorious: and his righteousness endureth for ever* the everlasting righteousness the song confesses, *just and true are thy ways* (Revelation 15:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-just-and-true-are-thy-ways-the-rock-whose-work-is-perfect-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- all-nations-shall-come-and-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 66:23 — *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* the manner of the nations'' worship: keeping his appointed times; *all nations shall come and worship before thee* (Revelation 15:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-all-nations-shall-come-and-worship-before-thee-psalm-86-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 16:19 — *the Gentiles shall come unto thee from the ends of the earth, and shall say, Surely our fathers have inherited lies* the nations turning from inherited idols to the only Holy One; *all nations shall come and worship before thee* (Revelation 15:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-all-nations-shall-come-and-worship-before-thee-psalm-86-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- temple-of-the-tabernacle-of-the-testimony-opened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 44:4 — *the glory of Yahuah (LORD) filled the house of Yahuah (LORD): and I fell upon my face* the prophet at the opened house sees the glory fill it; *the temple of the tabernacle of the testimony in heaven was opened* (Revelation 15:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-temple-of-the-tabernacle-of-the-testimony-opened-the-heavenly-pattern-exodus-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- temple-filled-with-smoke
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 10:4 — *the house was filled with the cloud, and the court was full of the brightness of the LORD’S glory* the cloud of glory that fills the house; *the temple was filled with smoke from the glory of Elohim (God)* (Revelation 15:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-temple-filled-with-smoke-from-the-glory-none-able-to-enter-exodus-40-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- seven-last-plagues-covenant-sanctions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Leviticus 26:25 — *a sword upon you, that shall avenge the quarrel of my covenant... I will send the pestilence among you* the covenant''s avenging sword and pestilence, *seven times* (26:24); the seven last plagues fill up that wrath (Revelation 15:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-seven-last-plagues-the-covenant-sanctions-poured-out-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 5:12 — *A third part of thee shall die with the pestilence... and a third part shall fall by the sword... and I will scatter a third part into all the winds* the prophet pours out the covenant sanctions in measured portions; the seven last plagues bring that wrath to sevenfold fullness (Revelation 15:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-seven-last-plagues-the-covenant-sanctions-poured-out-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Amos 4:10 — *I have sent among you the pestilence after the manner of Egypt... yet have ye not returned unto me* the covenant plagues after the manner of Egypt on a people that would not turn; the seven last plagues fill up that wrath on the new Egypt (Revelation 15:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-seven-last-plagues-the-covenant-sanctions-poured-out-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 16 =====
-- S227 enrichment — Revelation 16: the bowls; Armageddon; it is done
-- ADD-ONLY. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sun-scorching-and-darkness-on-throne-of-beast
  ('canon','revelation',16,8,'canon','isaiah',24,6,'free', E'*Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* (Isaiah 24:6). Isaiah saw the curse devour the earth, *the inhabitants of the earth burned.* The fourth vial brings it: *power was given unto him to scorch men with fire. And men were scorched with great heat* (Revelation 16:8-9). The burning that leaves few men is the scorching wrath of the bowl, poured on the men who *blasphemed the name of Elohim (God)* and would not turn.'),
  ('canon','revelation',16,10,'canon','joel',2,31,'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). Joel set the darkened sun as the herald of the day of Yahuah (LORD). The fifth vial darkens the beast''s seat: *his kingdom was full of darkness; and they gnawed their tongues for pain* (Revelation 16:10). The sun turned to darkness before the terrible day falls now on the throne of the beast, the day of Yahuah (LORD) come upon his kingdom.'),
  ('canon','revelation',16,10,'canon','amos',8,9,'free', E'*And it shall come to pass in that day, saith Adonai Yahuah (the Lord GOD), that I will cause the sun to go down at noon, and I will darken the earth in the clear day:* (Amos 8:9). Amos foretold the sun *down at noon* and the earth darkened *in the clear day.* So the fifth angel pours his vial *upon the seat of the beast; and his kingdom was full of darkness* (Revelation 16:10). The midday darkness Amos named is the plague of Egypt on the beast''s throne, the light withdrawn from the kingdom that would not repent.'),
  -- thread: euphrates-dried-for-the-kings-of-the-east
  ('canon','revelation',16,12,'canon','isaiah',44,27,'free', E'*That saith to the deep, Be dry, and I will dry up thy rivers:* (Isaiah 44:27). Yahuah (LORD) speaks to the deep, *Be dry,* and dries the rivers — the word spoken to open the way for Cyrus from the east. The sixth vial enacts it on the great river: *the water thereof was dried up, that the way of the kings of the east might be prepared* (Revelation 16:12). The same word that dried Babylon''s waters for the conqueror from the east dries the Euphrates here.'),
  ('canon','revelation',16,12,'canon','isaiah',45,1,'free', E'*Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him; and I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut;* (Isaiah 45:1). Isaiah named the king from the east — Cyrus — for whom Yahuah (LORD) opened the gates and dried the river to take Babylon. The sixth vial dries the Euphrates *that the way of the kings of the east might be prepared* (Revelation 16:12): the road opened for the conquerors from the east, as the gates were opened for Cyrus, the river drawn back at the word of Yahuah (LORD).'),
  -- thread: i-come-as-a-thief-armageddon
  ('canon','revelation',16,16,'canon','zechariah',14,2,'free', E'*For I will gather all nations against Jerusalem to battle; and the city shall be taken...* (Zechariah 14:2). Zechariah saw all nations gathered against Jerusalem to battle, and (in the verse following) Yahuah (LORD) going forth to fight them. So the frog-spirits gather the kings *into a place called in the Hebrew tongue Armageddon* (Revelation 16:16) — the nations massed for the last battle, drawn to the field where Yahuah (LORD) himself goes forth to break them.'),
  ('canon','revelation',16,16,'canon','zephaniah',3,8,'free', E'*for my determination is to gather the nations, that I may assemble the kingdoms, to pour upon them mine indignation, even all my fierce anger: for all the earth shall be devoured with the fire of my jealousy.* (Zephaniah 3:8). Zephaniah heard Yahuah (LORD) declare his purpose *to gather the nations... to pour upon them mine indignation.* The gathering at Armageddon is that very assembling: *he gathered them together into a place called in the Hebrew tongue Armageddon* (Revelation 16:16). The kings drawn by the unclean spirits are the nations assembled for the outpouring of his fierce anger.'),
  -- thread: it-is-done-the-great-earthquake-and-the-great-hail
  ('canon','revelation',16,18,'canon','haggai',2,6,'free', E'*For thus saith Yahuah Tseva''ot (LORD of hosts); Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land;* (Haggai 2:6). Haggai foretold the one final shaking of heaven and earth and sea. The seventh vial brings it: *there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great* (Revelation 16:18). The promised once-for-all shaking of all things is the earthquake that splits the great city and topples the cities of the nations.'),
  ('canon','revelation',16,18,'canon','joel',3,16,'free', E'*Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people...* (Joel 3:16). Joel heard Yahuah (LORD) roar from Zion till *the heavens and the earth shall shake.* So at the seventh vial a *great voice out of the temple of heaven, from the throne, saying, It is done* (Revelation 16:17) is followed by the great earthquake (16:18). The voice that shakes heaven and earth is the hope of his people even as it is the terror of the beast''s world.'),
  ('canon','revelation',16,18,'enoch','1-enoch',1,6,'extras', E'*And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame* (1 Enoch 1:6). The Hebrew library beheld the day of judgment as the shaking of the mountains, melted like wax, *the earth... wholly rent in sunder* (1 Enoch 1:7). The seventh vial brings that shaking: *a great earthquake, such as was not since men were upon the earth* (Revelation 16:18), every island fled and the mountains not found. The cosmic shaking the watchers'' seer foretold is the earthquake of the finished wrath.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- sun-scorching-and-darkness-on-throne-of-beast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 24:6 — *the inhabitants of the earth are burned, and few men left* the curse that burns the earth; the fourth vial scorches men with great heat (Revelation 16:8-9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-sun-scorching-and-the-darkness-on-the-throne-of-the-beast-exodus-10-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:31 — *The sun shall be turned into darkness... before the great and the terrible day of Yahuah (LORD) come* the darkened sun heralds the day; the fifth vial fills the beast''s kingdom with darkness (Revelation 16:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-sun-scorching-and-the-darkness-on-the-throne-of-the-beast-exodus-10-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Amos 8:9 — *I will cause the sun to go down at noon, and I will darken the earth in the clear day* the midday darkness of the day of Yahuah; the fifth vial darkens the seat of the beast (Revelation 16:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-sun-scorching-and-the-darkness-on-the-throne-of-the-beast-exodus-10-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- euphrates-dried-for-the-kings-of-the-east
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 44:27 — *That saith to the deep, Be dry, and I will dry up thy rivers* the word that dries Babylon''s waters for the conqueror from the east; the Euphrates dried for the kings of the east (Revelation 16:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-euphrates-dried-for-the-kings-of-the-east-the-way-prepared-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 45:1 — *to Cyrus... to open before him the two leaved gates; and the gates shall not be shut* the king from the east for whom the gates are opened and the river dried; the way of the kings of the east prepared (Revelation 16:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-the-euphrates-dried-for-the-kings-of-the-east-the-way-prepared-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- i-come-as-a-thief-armageddon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:2 — *I will gather all nations against Jerusalem to battle; and the city shall be taken* the nations gathered to battle, and Yahuah going forth to fight them (14:3); the kings gathered to Armageddon (Revelation 16:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-i-come-as-a-thief-blessed-is-he-that-keepeth-his-garments-and-armageddon-zechariah-3-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Zephaniah 3:8 — *my determination is to gather the nations, that I may assemble the kingdoms, to pour upon them mine indignation* Yahuah''s purpose to assemble the kingdoms for his wrath; the kings mustered at Armageddon (Revelation 16:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-i-come-as-a-thief-blessed-is-he-that-keepeth-his-garments-and-armageddon-zechariah-3-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- it-is-done-the-great-earthquake-and-the-great-hail
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Haggai 2:6 — *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* the promised once-for-all shaking of all things; the great earthquake of the seventh vial (Revelation 16:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-it-is-done-the-great-earthquake-and-the-great-hail-ezekiel-38-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 3:16 — *Yahuah (LORD) also shall roar out of Zion... and the heavens and the earth shall shake* the roar from Zion that shakes heaven and earth; the great voice and earthquake of *It is done* (Revelation 16:17-18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-it-is-done-the-great-earthquake-and-the-great-hail-ezekiel-38-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 1:6 — *the high mountains shall be shaken... And shall melt like wax before the flame* the Hebrew library''s day of judgment shakes the mountains and rends the earth; the great earthquake of the finished wrath (Revelation 16:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-16-it-is-done-the-great-earthquake-and-the-great-hail-ezekiel-38-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 17 =====
-- S227 enrichment — Revelation 17: the woman on the beast; mystery Babylon; the Lamb overcomes
-- ADD-ONLY. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: woman-on-the-scarlet-beast-seven-heads-and-ten-horns
  ('canon','revelation',17,3,'canon','daniel',7,23,'free', E'*Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* (Daniel 7:23). The angel''s own reading of Daniel''s beast: a world-devouring fourth kingdom that treads down and breaks in pieces. The scarlet beast *full of names of blasphemy, having seven heads and ten horns* (Revelation 17:3) is that same brute power, the blaspheming kingdom that tramples the earth and carries the harlot upon its back.'),
  ('canon','revelation',17,3,'canon','daniel',7,24,'free', E'*And the ten horns out of this kingdom are ten kings that shall arise: and another shall rise after them; and he shall be diverse from the first, and he shall subdue three kings.* (Daniel 7:24). Daniel''s ten horns are *ten kings that shall arise* out of the fourth kingdom. The beast the woman rides bears those same *ten horns* (Revelation 17:3), later named as *ten kings, which have received no kingdom as yet* (17:12) — the harlot carried by Daniel''s very kingdom, the ten-horned power read straight from the night-vision.'),
  ('canon','revelation',17,3,'apocrypha','2-esdras',11,1,'extras', E'*Then saw I a dream, and, behold, there came up from the sea an eagle, which had twelve feathered wings, and three heads.* (2 Esdras 11:1). The Hebrew library saw the same beast from the sea — *an eagle... which had twelve feathered wings, and three heads*, whose wings and heads are the kings that reign in succession. So the seer beholds a scarlet beast *having seven heads and ten horns* (Revelation 17:3), the heads and horns alike the kings of the world-kingdom. The multi-headed, many-winged ruler rising from the sea is the apocalyptic figure both seers share.'),
  ('canon','revelation',17,3,'apocrypha','2-esdras',12,11,'extras', E'*The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel.* (2 Esdras 12:11). The interpreting voice tells Esdras plainly: the eagle from the sea *is the kingdom which was seen in the vision of your brother Daniel* — the fourth kingdom, its heads and wings the kings. The scarlet beast with *seven heads and ten horns* (Revelation 17:3) is that same Danielic kingdom, the heads kings and the horns kings; the Hebrew library binds the eagle, Daniel''s beast, and the harlot''s mount into one world-power.'),
  -- thread: lamb-shall-overcome-them-lord-of-lords
  ('canon','revelation',17,14,'canon','daniel',2,44,'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44). Daniel saw the stone-kingdom that breaks all the kingdoms of men and stands for ever. The ten kings *shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings* (Revelation 17:14) — the everlasting kingdom that crushes the beast''s confederacy. The kings hold power one hour; the kingdom of the Lamb breaks them in pieces and endures for ever.'),
  -- thread: waters-are-peoples-and-nations
  ('canon','revelation',17,15,'canon','isaiah',17,12,'free', E'*Woe to the multitude of many people, which make a noise like the noise of the seas; and to the rushing of nations, that make a rushing like the rushing of mighty waters!* (Isaiah 17:12). Isaiah likens the massed peoples to roaring seas, *the rushing of nations... like the rushing of mighty waters.* The angel reads the same idiom: *The waters which thou sawest, where the whore sitteth, are peoples, and multitudes, and nations, and tongues* (Revelation 17:15). The many waters under the harlot are the nations in just this sense — the swarming peoples whose roar fills the earth.'),
  ('canon','revelation',17,15,'canon','isaiah',17,13,'free', E'*The nations shall rush like the rushing of many waters: but Elohim (God) shall rebuke them, and they shall flee far off, and shall be chased as the chaff of the mountains before the wind...* (Isaiah 17:13). The peoples rush like many waters, yet at his rebuke *they shall flee far off.* So the waters the whore sits upon *are peoples, and multitudes, and nations, and tongues* (Revelation 17:15) — and the prophet''s warning is the harlot''s end: the very floods she rides are rebuked and flee, the nations that carried her turning to make her desolate.'),
  -- thread: mystery-babylon-the-mother-of-harlots
  ('canon','revelation',17,5,'canon','isaiah',47,1,'extras', E'*Come down, and sit in the dust, O virgin daughter of Babylon, sit on the ground: there is no throne, O daughter of the Chaldeans: for thou shalt no more be called tender and delicate.* (Isaiah 47:1). Isaiah summoned the *virgin daughter of Babylon* down from her throne into the dust — the self-exalting harlot-city stripped of her glory. *MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS* (Revelation 17:5) is that same daughter of the Chaldeans unveiled, the proud city whose throne is taken away and who is brought down to sit in the dust.'),
  ('canon','revelation',17,6,'canon','ezekiel',23,37,'extras', E'*That they have committed adultery, and blood is in their hands, and with their idols have they committed adultery, and have also caused their sons... to pass for them through the fire, to devour them.* (Ezekiel 23:37). Ezekiel arraigned the unfaithful city on the harlot''s double count — adultery *and blood in their hands.* So the woman is *drunken with the blood of the saints, and with the blood of the martyrs of Yahusha (Jesus)* (Revelation 17:6): she has played the harlot with the kings and shed the blood of the faithful, judged for fornication and bloodshed together, exactly as the prophet judged the harlot-city.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- woman-on-the-scarlet-beast-seven-heads-and-ten-horns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:23 — *The fourth beast shall be the fourth kingdom upon earth... shall devour the whole earth, and shall tread it down* the world-devouring fourth kingdom; the scarlet beast that carries the woman (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:24 — *the ten horns out of this kingdom are ten kings that shall arise* Daniel''s ten horns are ten kings; the beast bears *seven heads and ten horns*, the horns the ten kings of 17:12 (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Esdras 11:1 — *there came up from the sea an eagle, which had twelve feathered wings, and three heads* the multi-headed, many-winged ruler from the sea, its heads and wings the kings; the scarlet beast with seven heads and ten horns (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Esdras 12:11 — *The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel* the Hebrew library names the eagle as Daniel''s fourth kingdom; the same kingdom is the harlot''s mount (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- lamb-shall-overcome-them-lord-of-lords
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 2:44 — *the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms* the stone-kingdom that crushes all others and stands for ever; the Lamb overcomes the ten kings (Revelation 17:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- waters-are-peoples-and-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 17:12 — *the rushing of nations, that make a rushing like the rushing of mighty waters* the massed peoples as roaring seas; *the waters... are peoples, and multitudes, and nations, and tongues* (Revelation 17:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 17:13 — *The nations shall rush like the rushing of many waters: but Elohim (God) shall rebuke them, and they shall flee far off* the floods rebuked and fleeing; the waters that carry the whore turn to make her desolate (Revelation 17:15-16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- mystery-babylon-the-mother-of-harlots
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 47:1 — *Come down, and sit in the dust, O virgin daughter of Babylon... there is no throne, O daughter of the Chaldeans* the proud daughter of the Chaldeans brought down to the dust; *MYSTERY, BABYLON THE GREAT* unveiled (Revelation 17:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 23:37 — *they have committed adultery, and blood is in their hands* the harlot-city judged for fornication and bloodshed together; the woman drunken with the blood of the saints (Revelation 17:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 18 =====
-- S227 enrichment — Revelation 18: Babylon fallen; come out of her; the Tyre-dirge; millstone; blood found in her
-- ADD-ONLY. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: babylon-the-great-is-fallen-is-fallen
  ('canon','revelation',18,2,'canon','isaiah',13,19,'free', E'*And Babylon, the glory of kingdoms, the beauty of the Chaldees’ excellency, shall be as when Elohim (God) overthrew Sodom and Gomorrah.* (Isaiah 13:19). Isaiah pronounced *Babylon, the glory of kingdoms,* overthrown as utterly as Sodom. *Babylon the great is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2) — the proud glory of kingdoms cast down like the cities of the plain, emptied of men and given to the unclean. The seer re-speaks the prophet''s sentence on the whole doomed world-system.'),
  ('canon','revelation',18,2,'canon','jeremiah',51,37,'free', E'*And Babylon shall become heaps, a dwellingplace for dragons, an astonishment, and an hissing, without an inhabitant.* (Jeremiah 51:37). Jeremiah saw Babylon become *heaps, a dwellingplace for dragons... without an inhabitant.* So she is *become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird* (Revelation 18:2) — the city of man''s pride no longer a city but a haunt of dragons and foul spirits, never to be inhabited again.'),
  -- thread: reward-her-double-the-cup-she-filled
  ('canon','revelation',18,6,'canon','jeremiah',16,18,'free', E'*And first I will recompense their iniquity and their sin double; because they have defiled my land...* (Jeremiah 16:18). Jeremiah names the law of double recompense: *I will recompense their iniquity and their sin double.* So the voice commands over Babylon, *double unto her double according to her works: in the cup which she hath filled fill to her double* (Revelation 18:6) — the measure-for-measure justice of the prophet, her defilements repaid double into her own cup.'),
  ('canon','revelation',18,7,'canon','isaiah',47,7,'free', E'*And thou saidst, I shall be a lady for ever: so that thou didst not lay these things to thy heart, neither didst remember the latter end of it.* (Isaiah 47:7). The daughter of Babylon''s boast — *I shall be a lady for ever* — forgetting her latter end, is the proud security the seer re-speaks: *For she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7). The city certain of her own permanence, remembering no end, is the very figure Isaiah arraigned, undone in the day she thought could never come.'),
  -- thread: the-kings-and-merchants-lament-over-her (Tyre)
  ('canon','revelation',18,19,'canon','ezekiel',27,31,'free', E'*And they shall make themselves utterly bald for thee, and gird them with sackcloth, and they shall weep for thee with bitterness of heart and bitter wailing.* (Ezekiel 27:31). Ezekiel''s mourners over Tyre make themselves bald, gird with sackcloth, and *weep for thee with bitterness of heart and bitter wailing.* The shipmasters and sailors mourn the same way: *they cast dust on their heads, and cried, weeping and wailing* (Revelation 18:19) — the dirge over the merchant-city of the sea re-spoken over Babylon the great.'),
  ('canon','revelation',18,17,'canon','isaiah',23,1,'free', E'*The burden of Tyre. Howl, ye ships of Tarshish; for it is laid waste, so that there is no house, no entering in...* (Isaiah 23:1). Isaiah''s burden of Tyre opens with the wail of the seafarers — *Howl, ye ships of Tarshish.* So *every shipmaster, and all the company in ships, and sailors, and as many as trade by sea, stood afar off, and cried when they saw the smoke of her burning* (Revelation 18:17-18). The howling ships of Tyre''s dirge are the shipmasters wailing over the fallen city, their trade laid waste in one hour.'),
  -- thread: rejoice-over-her-thou-heaven
  ('canon','revelation',18,20,'canon','isaiah',44,23,'free', E'*Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth... for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* (Isaiah 44:23). Isaiah calls the heavens to sing because Yahuah (LORD) has redeemed Jacob. *Rejoice over her, thou heaven, and ye holy apostles and prophets; for Elohim (God) hath avenged you on her* (Revelation 18:20) — the same summons to the heavens to rejoice, the fall of the oppressor being the redemption of the people, the heavens singing for the deliverance Yahuah (LORD) has wrought.'),
  -- thread: the-millstone-cast-into-the-sea
  ('canon','revelation',18,21,'canon','ezekiel',26,21,'free', E'*I will make thee a terror, and thou shalt be no more: though thou be sought for, yet shalt thou never be found again, saith Adonai Yahuah (the Lord GOD).* (Ezekiel 26:21). Ezekiel sealed Tyre''s doom: *thou shalt be no more... yet shalt thou never be found again.* So the angel casts the millstone into the sea: *Thus with violence shall that great city Babylon be thrown down, and shall be found no more at all* (Revelation 18:21). The city sunk like a stone, sought for and never found again — the prophet''s very sentence on the sea-city spoken over Babylon.'),
  ('canon','revelation',18,22,'canon','isaiah',24,8,'free', E'*The mirth of tabrets ceaseth, the noise of them that rejoice endeth, the joy of the harp ceaseth.* (Isaiah 24:8). Isaiah saw the joy of the city silenced — *the joy of the harp ceaseth.* So the seer silences the fallen city: *the voice of harpers, and musicians, and of pipers, and trumpeters, shall be heard no more at all in thee* (Revelation 18:22). The mirth and the harp that ceased in the prophet''s judgment cease forever in Babylon, the music and the millstone alike heard no more.'),
  -- thread: the-blood-of-prophets-and-saints-found-in-her
  ('canon','revelation',18,24,'enoch','1-enoch',47,1,'extras', E'*And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits.* (1 Enoch 47:1). The Hebrew library saw *the blood of the righteous* ascend from the earth, crying before the throne for judgment. *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24) — the same shed blood, ascended and remembered, the long account of the righteous slain closed in the doom of the city that shed it.'),
  ('canon','revelation',18,24,'enoch','1-enoch',47,2,'extras', E'*In those days the holy ones who dwell above in the heavens... supplicate and pray... On behalf of the blood of the righteous which has been shed... That judgement may be done unto them...* (1 Enoch 47:2). The holy ones above plead *on behalf of the blood of the righteous which has been shed, that judgement may be done.* That judgment falls when *in her was found the blood of prophets, and of saints* (Revelation 18:24) — the prayer for the avenging of righteous blood answered in Babylon''s fall, the cry of the souls under the altar heard at last.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- babylon-the-great-is-fallen-is-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 13:19 — *Babylon, the glory of kingdoms... shall be as when Elohim (God) overthrew Sodom and Gomorrah* the glory of kingdoms cast down like Sodom; *Babylon the great is fallen, is fallen* (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 51:37 — *Babylon shall become heaps, a dwellingplace for dragons... without an inhabitant* the city become a haunt of dragons; *become the habitation of devils, and the hold of every foul spirit* (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- reward-her-double-the-cup-she-filled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 16:18 — *first I will recompense their iniquity and their sin double* the law of double recompense; *double unto her double according to her works* (Revelation 18:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 47:7 — *thou saidst, I shall be a lady for ever... neither didst remember the latter end of it* the daughter of Babylon''s boast, forgetting her end; *I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-kings-and-merchants-lament-over-her (Tyre)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 27:31 — *they shall weep for thee with bitterness of heart and bitter wailing* the mourners over Tyre baldness and sackcloth; the shipmasters *weeping and wailing* over Babylon (Revelation 18:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=27 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 23:1 — *The burden of Tyre. Howl, ye ships of Tarshish; for it is laid waste* the seafarers'' wail over Tyre; the shipmasters and sailors crying over the smoke of her burning (Revelation 18:17-18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- rejoice-over-her-thou-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 44:23 — *Sing, O ye heavens; for Yahuah (LORD) hath done it... for Yahuah (LORD) hath redeemed Jacob* the heavens called to sing for the redemption of Jacob; *Rejoice over her, thou heaven... for Elohim (God) hath avenged you on her* (Revelation 18:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-millstone-cast-into-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 26:21 — *thou shalt be no more: though thou be sought for, yet shalt thou never be found again* the sea-city sunk and never found; *shall be found no more at all* (Revelation 18:21).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=26 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 24:8 — *The mirth of tabrets ceaseth... the joy of the harp ceaseth* the silenced joy of the doomed city; *the voice of harpers, and musicians... shall be heard no more at all in thee* (Revelation 18:22).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-blood-of-prophets-and-saints-found-in-her
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 47:1 — *the blood of the righteous from the earth before Yahuah (God) of Spirits* the blood of the righteous ascending to cry for judgment; *in her was found the blood of prophets, and of saints* (Revelation 18:24).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 47:2 — *On behalf of the blood of the righteous which has been shed... That judgement may be done unto them* the holy ones pleading for the avenging of righteous blood; that judgment falls in Babylon''s reckoning (Revelation 18:24).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 19 =====
-- S227 enrichment — Revelation 19: the great Alleluia, the marriage, the angel refuses worship, the supper on Gog, the beast cast into fire
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- great-alleluia: add Jeremiah's heaven-sings-over-Babylon (prophetic)
  ('canon','revelation',19,3,'canon','jeremiah',51,48,'free', E'*Then the heaven and the earth, and all that is therein, shall sing for Babylon: for the spoilers shall come unto her from the north, saith Yahuah (LORD).* (Jeremiah 51:48). The four Alleluias of heaven are sung over the smoke of the great whore rising for ever (Revelation 19:3); Jeremiah foretold the very thing — that heaven and earth would sing *for Babylon* when her spoilers came. The doom of the harlot-city is the appointed occasion of the song; the seer hears arrive the praise the prophet promised would break out over Babylon''s fall.'),

  -- marriage-of-the-lamb: add Hosea 2:20 + Isaiah 62:5 (prophetic), 2 Esdras 2:39-40 (extra)
  ('canon','revelation',19,7,'canon','hosea',2,20,'free', E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD).* (Hosea 2:20). The wife who *hath made herself ready* (Revelation 19:7) is the harlot of Hosea wooed home and betrothed *in faithfulness* — she who had played the harlot is taken back, and the knowing of Yahuah (LORD) is restored. The marriage of the Lamb is this betrothal consummated: Israel, not a stranger-people, brought back to her husband.'),
  ('canon','revelation',19,7,'canon','isaiah',62,5,'free', E'*and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* (Isaiah 62:5). Heaven calls to *give honour to him: for the marriage of the Lamb is come* (Revelation 19:7); Isaiah had already named the joy of that wedding — thy Elohim (God) rejoicing over thee as a bridegroom over his bride. The forsaken wife is married again, and the rejoicing the prophet foresaw is the gladness of the marriage supper.'),
  ('canon','revelation',19,8,'apocrypha','2-esdras',2,40,'extras', E'*Take your number, O Sion, and shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah (God).* (2 Esdras 2:40). The Bride is *arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The restored library names the same company — Sion''s own, *clothed in white, which have fulfilled the law*: the white raiment is the righteousness of the law-keepers, the commandment-keeping saints, not a garment woven apart from Torah.'),

  -- worship-elohim, the angel refuses (P=0,E=0): Tobit 12 + Ascension of Isaiah (extras)
  ('canon','revelation',19,10,'apocrypha','tobit',12,18,'extras', E'*For not of any favour of mine, but by the will of our Elohim (God) I came; wherefore praise him for ever.* (Tobit 12:18). When John falls to worship the angel, the answer is, *See thou do it not: I am thy fellowservant... worship Elohim (God)* (Revelation 19:10). Raphael had spoken the same refusal to Tobit and Tobias when they fell on their faces in fear — deflecting all honour from himself to the One: *praise him for ever.* The mighty angel of the apocalypse keeps the angel''s ancient rule: worship is the One''s alone.'),
  ('canon','revelation',19,10,'ascension-isaiah','ascension-isaiah',7,21,'extras', E'*And I fell on my face to worship him, but the angel who conducted me did not permit me, but said unto me: "Worship neither throne nor angel..."* (Ascension of Isaiah 7:21). John''s very gesture — *I fell at his feet to worship him* (Revelation 19:10) — is Isaiah''s in his ascent, and the angel''s refusal is the same: he will not permit the worship, for *I am not thy lord, but thy fellow servant* (Ascension of Isaiah 8:5). Throughout the apocalyptic seers the rule holds unbroken: the conducting angel forbids the worship and turns it back to the One.'),

  -- beast-and-false-prophet cast into the lake of fire (Daniel 7 only): 1 Enoch (extras)
  ('canon','revelation',19,20,'enoch','1-enoch',54,6,'extras', E'*...take hold of them on that great day, and cast them on that day into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them...* (1 Enoch 54:6). The beast and the false prophet are *cast alive into a lake of fire burning with brimstone* (Revelation 19:20). Enoch saw the same end for the chiefs of the rebellion — the holy angels casting them on the great day *into the burning furnace*, the deep valley of fire prepared for the hosts of the adversary. The lake of fire of the apocalypse is the burning furnace of the watcher-judgment come at last.'),
  ('canon','revelation',19,20,'enoch','1-enoch',10,6,'extras', E'*And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:6). The two beasts are taken and *cast alive into a lake of fire* (Revelation 19:20); Enoch''s oldest oracle of judgment decreed it of the chief of the watchers — bound now, *cast into the fire* at the great judgment. The fate Revelation gives the beast is the fate the Hebrew library long assigned the head of the rebellion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- great-alleluia
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 51:48 — *the heaven and the earth... shall sing for Babylon* the prophet''s heaven singing over Babylon''s fall, the Alleluias raised over the smoke of the great whore (Revelation 19:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-great-alleluia-hallelu-yah-salvation-unto-yahuah-psalm-104-and-106'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- marriage-of-the-lamb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Hosea 2:20 — *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* the harlot wooed home and betrothed, the wife of the Lamb made ready (Revelation 19:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-marriage-of-the-lamb-the-bride-in-fine-linen-isaiah-61-and-54-and-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 62:5 — *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* the joy of the wedding foretold, the gladness over the marriage of the Lamb (Revelation 19:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-marriage-of-the-lamb-the-bride-in-fine-linen-isaiah-61-and-54-and-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Esdras 2:40 — *shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah (God)* the restored library''s white-clad law-keepers, the fine linen that is the righteousness of saints (Revelation 19:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-marriage-of-the-lamb-the-bride-in-fine-linen-isaiah-61-and-54-and-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- worship-elohim, the angel refuses worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Tobit 12:18 — *not of any favour of mine, but by the will of our Elohim (God) I came; wherefore praise him for ever* Raphael deflecting all honour to the One, as the angel refuses John''s worship — *worship Elohim (God)* (Revelation 19:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-worship-elohim-the-angel-refuses-worship-exodus-34-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ascension of Isaiah 7:21 — *I fell on my face to worship him, but the angel... did not permit me* Isaiah''s seer-gesture and the angel''s same refusal, *I am not thy lord, but thy fellow servant* (Revelation 19:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-worship-elohim-the-angel-refuses-worship-exodus-34-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- beast-and-false-prophet cast into the lake of fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 54:6 — *cast them... into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them* the chiefs of the rebellion cast into the valley of fire, the beast and false prophet cast into the lake of fire (Revelation 19:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-beast-and-false-prophet-cast-into-the-lake-of-fire-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 10:6 — *on the day of the great judgement he shall be cast into the fire* the oldest decree of the watcher-judgment, the fate given the beast cast alive into the lake of fire (Revelation 19:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-beast-and-false-prophet-cast-into-the-lake-of-fire-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 20 =====
-- S227 enrichment — Revelation 20: the dragon bound, the thrones & first resurrection, priests who reign, Gog, the fire, the white throne, the second death
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- dragon bound (has 1 Enoch 10:12/13): add Azazel-bound + bound-till-judgment (extras)
  ('canon','revelation',20,2,'enoch','1-enoch',10,4,'extras', E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness...* (1 Enoch 10:4). The angel *laid hold on the dragon... and bound him a thousand years, And cast him into the bottomless pit* (Revelation 20:2-3). Enoch saw the binding first — the chief of the watchers seized, bound hand and foot, and cast into darkness in a pit opened in the desert. The dragon shut in the pit is the bound adversary of the watcher-vision, held fast until the appointed judgment.'),
  ('canon','revelation',20,3,'enoch','1-enoch',18,14,'extras', E'*And He was wroth with them, and bound them till the time when their guilt should be consummated...* (1 Enoch 18:14). The dragon is bound and shut up *that he should deceive the nations no more, till the thousand years should be fulfilled* (Revelation 20:3). Enoch saw the rebels bound *till the time when their guilt should be consummated* — a fixed term, not endless, after which they are loosed to the final fire. The symbolic thousand years is that appointed term of binding the Hebrew library already knew.'),

  -- thrones & first resurrection (has 2 Esdras 7:32): add Daniel 12:13 (prophetic), 1 Enoch 51:1 (extra)
  ('canon','revelation',20,4,'canon','daniel',12,13,'free', E'*But go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days.* (Daniel 12:13). They *lived and reigned with Messiah... This is the first resurrection* (Revelation 20:4-5). Daniel was promised the same — to rest, then *stand in thy lot at the end of the days*: to rise and take his portion in the kingdom. The first resurrection is the prophet''s own standing-up at the end, the righteous raised to reign.'),
  ('canon','revelation',20,5,'enoch','1-enoch',51,1,'extras', E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes.* (1 Enoch 51:1). *This is the first resurrection* (Revelation 20:5). Enoch named the rising — the earth and Sheol and hell rendering back the dead they held — *for in those days the Elect One shall arise* and choose the righteous and holy. The resurrection of the apocalypse is the giving-back the Hebrew library foresaw at the rising of the Elect One.'),

  -- priests of Elohim who reign (has Isaiah 61:6): add Daniel 7:18, 7:27 (prophetic)
  ('canon','revelation',20,6,'canon','daniel',7,18,'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). The blessed and holy *shall be priests of Elohim (God) and of Messiah, and shall reign with him a thousand years* (Revelation 20:6). Daniel saw the same — the saints taking and possessing the kingdom for ever. The priestly reign of the apocalypse is the kingdom Daniel promised would be given to the saints of the Most High, the reign of the refined remnant.'),
  ('canon','revelation',20,6,'canon','daniel',7,27,'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High)...* (Daniel 7:27). They *shall reign with him a thousand years* (Revelation 20:6). The dominion under the whole heaven given to the saints is this reign — *under the whole heaven*, upon the earth, with the holy people, not a disembodied estate; the kingdom of priests is Daniel''s everlasting kingdom of the saints come to its possession.'),

  -- Gog & Magog (has Ezekiel + Genesis 22:17): add Zechariah 12:3, 14:2 (prophetic)
  ('canon','revelation',20,8,'canon','zechariah',12,3,'free', E'*And in that day will I make Jerusalem a burdensome stone for all people: all that burden themselves with it shall be cut in pieces, though all the people of the earth be gathered together against it.* (Zechariah 12:3). Gog and Magog go up *on the breadth of the earth, and compassed the camp of the saints about, and the beloved city* (Revelation 20:8-9). Zechariah saw the same final muster — all the people of the earth gathered together against Jerusalem, only to be cut in pieces. The siege of the beloved city is the prophet''s burdensome stone, and the gathered nations break upon it.'),
  ('canon','revelation',20,8,'canon','zechariah',14,2,'free', E'*For I will gather all nations against Jerusalem to battle...* (Zechariah 14:2). The deceived nations are gathered *to battle: the number of whom is as the sand of the sea* (Revelation 20:8). Zechariah names the gathering plainly — *I will gather all nations against Jerusalem to battle* — the last assault the seer sees compassing the camp of the saints, before fire comes down and devours them.'),

  -- fire came down and devoured (has Ezek 38:22,39:6, 2 Kings 1:10, Gen 19:24): add Psalm 11:6 (prophetic)
  ('canon','revelation',20,9,'canon','psalms',11,6,'free', E'*Upon the wicked he shall rain snares, fire and brimstone, and an horrible tempest: this shall be the portion of their cup.* (Psalm 11:6). *And fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The psalm decreed the portion of the wicked — fire and brimstone rained down from heaven; the fire that devours the gathered nations around the camp is that very rain, the portion of their cup poured out at the last.'),

  -- the great white throne (S226 refined, P-only): add 2 Esdras 7:33 (extra)
  ('canon','revelation',20,11,'apocrypha','2-esdras',7,33,'extras', E'*And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end:* (2 Esdras 7:33). *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away* (Revelation 20:11). The restored library saw the same one judgment — the Most High appearing *upon the seat of judgment*, when long-suffering ends and only judgment remains. The white throne is that seat of judgment, the single great assize of the souls of the dead, not a separate later event.'),

  -- death & hell into the lake, the second death (has Hosea 13:14, Isaiah 25:8): add Daniel 12:2, Psalm 49:15 (prophetic)
  ('canon','revelation',20,14,'canon','daniel',12,2,'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Death and hell give up their dead, and *whosoever was not found written in the book of life was cast into the lake of fire. This is the second death* (Revelation 20:14-15). Daniel set the two awakenings side by side — some to everlasting life, some to shame and everlasting contempt. The second death is that everlasting contempt, the portion of the raised who are not found in the book.'),
  ('canon','revelation',20,14,'canon','psalms',49,15,'free', E'*But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me. Selah.* (Psalm 49:15). *And death and hell were cast into the lake of fire* (Revelation 20:14). The psalmist''s confidence is the undoing the apocalypse seals — the grave that holds the redeemed shall not keep them; death and hell themselves are abolished, cast into the lake, and the One who redeems the soul from the grave receives his own.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- dragon bound
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 10:4 — *Bind Azâzêl hand and foot, and cast him into the darkness* the binding of the chief watcher in a pit, the dragon bound and cast into the bottomless pit (Revelation 20:2-3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 18:14 — *He was wroth with them, and bound them till the time when their guilt should be consummated* a fixed term of binding, the dragon shut up till the thousand years be fulfilled (Revelation 20:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thrones & first resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 12:13 — *thou shalt rest, and stand in thy lot at the end of the days* the prophet''s own standing-up at the end, the first resurrection of the righteous who reign (Revelation 20:4-5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 51:1 — *the earth also give back that which has been entrusted to it, And Sheol also shall give back* the earth and Sheol rendering back the dead at the rising of the Elect One, the first resurrection (Revelation 20:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- priests who reign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the saints'' everlasting kingdom, the blessed and holy who reign as priests (Revelation 20:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:27 — *the kingdom and dominion... under the whole heaven, shall be given to the people of the saints* the dominion under the whole heaven, the priestly reign upon the earth with the holy people (Revelation 20:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Gog & Magog
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 12:3 — *I make Jerusalem a burdensome stone for all people... though all the people of the earth be gathered together against it* the final muster against Jerusalem, Gog compassing the camp of the saints (Revelation 20:8-9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Zechariah 14:2 — *I will gather all nations against Jerusalem to battle* the prophet''s last assault on the city, the nations gathered as the sand of the sea (Revelation 20:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- fire came down and devoured them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 11:6 — *Upon the wicked he shall rain snares, fire and brimstone... this shall be the portion of their cup* the fire and brimstone rained on the wicked, the fire that devours the gathered nations (Revelation 20:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the great white throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 7:33 — *the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* the one great assize of the souls of the dead, the white throne whence earth and heaven flee (Revelation 20:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- death & hell into the lake, the second death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 12:2 — *many of them that sleep in the dust... shall awake, some to everlasting life, and some to shame and everlasting contempt* the two awakenings; the second death is Daniel''s everlasting contempt for those not in the book (Revelation 20:14-15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 49:15 — *Elohim (God) will redeem my soul from the power of the grave: for he shall receive me* the grave undone for the redeemed, death and hell themselves cast into the lake of fire (Revelation 20:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 21 =====
-- S227 enrichment — Revelation 21: the bride-city, the tabernacle with men, no more tears, the overcomer-son, the twelve gates, the jeweled city, no temple no sun
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- new Jerusalem coming down as a bride (has Isaiah + Tobit 13:10): add 2 Esdras (extras)
  ('canon','revelation',21,2,'apocrypha','2-esdras',10,27,'extras', E'*And I looked, and, behold, the woman appeared to me no more, but there was a city builded, and a large place shewed itself from the foundations...* (2 Esdras 10:27). John sees *the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). Esdras saw the same mystery — the mourning woman who is Sion transformed before his eyes into a builded city. The bride and the city are one: the woman Israel revealed as the New Jerusalem, restored to her husband, not a new people in her place.'),
  ('canon','revelation',21,10,'apocrypha','2-esdras',13,36,'extras', E'*And Sion shall come, and shall be shewed to all men, being prepared and builded, like as you sawest the hill graven without hands.* (2 Esdras 13:36). The seer is carried to a great mountain and shown *that great city, the holy Jerusalem, descending out of heaven from Elohim (God)* (Revelation 21:10). Esdras foretold it — Sion *prepared and builded*, shewed to all men. The city not made with hands of the apocalypse is the prepared Sion of the restored library, the kingdom-mountain come down.'),

  -- the tabernacle of Elohim with men (has Ezek 37:27, Lev 26, Zech 2, Exod 29): add Jeremiah 31:33 (prophetic)
  ('canon','revelation',21,3,'canon','jeremiah',31,33,'free', E'*...I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The great voice declares, *the tabernacle of Elohim (God) is with men... and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). This is the new-covenant promise of Jeremiah fulfilled — the indwelling God, the law written within, *they shall be my people* and *I will be their Elohim (God)*: the dwelling of God with men is the covenant of the heart come home.'),

  -- wipe away all tears, no more death (has Isaiah 25:8, 55:1): add Isaiah 35:10, 65:19 (prophetic)
  ('canon','revelation',21,4,'canon','isaiah',35,10,'free', E'*And the ransomed of Yahuah (LORD) shall return... and sorrow and sighing shall flee away.* (Isaiah 35:10). *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying* (Revelation 21:4). Isaiah promised the ransomed everlasting joy upon their heads, *sorrow and sighing* fled away. The wiping of every tear is that homecoming joy made final — the redeemed returned to Zion, their sorrow and sighing gone for ever.'),
  ('canon','revelation',21,4,'canon','isaiah',65,19,'free', E'*and the voice of weeping shall be no more heard in her, nor the voice of crying.* (Isaiah 65:19). *...neither sorrow, nor crying, neither shall there be any more pain* (Revelation 21:4). In the new heavens and new earth Isaiah heard the end of weeping — *the voice of weeping shall be no more heard.* The new Jerusalem where God wipes every tear is the rejoicing-city of Isaiah, where the voice of crying is silenced for ever.'),

  -- he shall be my son, the overcomer inherits (P=0,E=0): Jeremiah 31:9, Psalm 89:26-27 (prophetic)
  ('canon','revelation',21,7,'canon','jeremiah',31,9,'free', E'*...for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9). *He that overcometh shall inherit all things; and I will be his Elohim (God), and he shall be my son* (Revelation 21:7). The sonship promised the overcomer is the sonship Jeremiah declared over the regathered house — *I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* The inheriting son is restored Israel, Ephraim brought home as firstborn; the consummation is the two houses owned again as sons.'),
  ('canon','revelation',21,7,'canon','psalms',89,26,'free', E'*He shall cry unto me, Thou art my father, my Elohim (God), and the rock of my salvation.* (Psalm 89:26). The overcomer is promised, *I will be his Elohim (God), and he shall be my son* (Revelation 21:7). The covenant-psalm spoke the same sonship — the one who cries *Thou art my father*, whom God makes *my firstborn, higher than the kings of the earth* (Psalm 89:27). The overcomer''s inheritance is the firstborn-sonship of the Davidic covenant opened to all who conquer.'),

  -- twelve gates and twelve foundations (has Ezek 48): add Exodus 28:21 (Torah root)
  ('canon','revelation',21,12,'canon','exodus',28,21,'free', E'*And the stones shall be with the names of the children of Yashar''el (Israel), twelve, according to their names... every one with his name shall they be according to the twelve tribes.* (Exodus 28:21). The city has *twelve gates, and at the gates twelve angels, and names written thereon, which are the names of the twelve tribes* (Revelation 21:12). The twelve names borne on the high priest''s breastplate are the twelve names on the gates — the tribes carried into the holy place, the whole house of Israel inscribed on the New Jerusalem, the two sticks made one.'),

  -- the city of gold and precious stones (has Isaiah 54:11-12, Tobit 13:16-17): add Ezekiel 28:13, Exodus 28:17 (prophetic/Torah)
  ('canon','revelation',21,18,'canon','ezekiel',28,13,'free', E'*Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz... the beryl, the onyx, and the jasper, the sapphire, the emerald... and gold...* (Ezekiel 28:13). The city''s foundations are *garnished with all manner of precious stones... jasper... sapphire... emerald... and the city was pure gold* (Revelation 21:18-19). The very stones of Eden''s covering in Ezekiel — jasper, sapphire, emerald, and gold — are the jewels of the New Jerusalem; the garden-glory lost is restored as the foundation of the city.'),
  ('canon','revelation',21,19,'canon','exodus',28,17,'free', E'*And thou shalt set in it settings of stones, even four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle...* (Exodus 28:17). *And the foundations of the wall of the city were garnished with all manner of precious stones* (Revelation 21:19). The twelve foundation-stones answer the twelve stones of the breastplate, set in four rows for the twelve tribes; the jeweled city wears the priestly stones of Israel, the whole tribal company built into her walls.'),

  -- no temple, no sun, the glory the light (has Isaiah 60, 2 Esdras 7:26): add Zechariah 14:7 (prophetic)
  ('canon','revelation',21,23,'canon','zechariah',14,7,'free', E'*But it shall be one day which shall be known to Yahuah (LORD), not day, nor night: but it shall come to pass, that at evening time it shall be light.* (Zechariah 14:7). *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it* (Revelation 21:23). Zechariah foresaw the day that needs no sun — *at evening time it shall be light* — light without the heavenly lamps. The city lit by the glory of God, where there is no night, is that one Yahuah-day the prophet knew.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- new Jerusalem bride
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 10:27 — *the woman appeared to me no more, but there was a city builded* the mourning woman who is Sion transformed into a city, the bride who is the New Jerusalem (Revelation 21:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-new-jerusalem-coming-down-as-a-bride-isaiah-52'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=10 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 13:36 — *Sion shall come, and shall be shewed to all men, being prepared and builded* the prepared Sion not made with hands, the holy Jerusalem descending out of heaven (Revelation 21:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-new-jerusalem-coming-down-as-a-bride-isaiah-52'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- tabernacle with men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 31:33 — *I will... be their Elohim (God), and they shall be my people* the new-covenant indwelling, the tabernacle of God with men, the law written in the heart (Revelation 21:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-tabernacle-of-elohim-with-men-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- wipe away all tears
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 35:10 — *the ransomed of Yahuah (LORD) shall return... and sorrow and sighing shall flee away* the homecoming joy of the ransomed, every tear wiped away (Revelation 21:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-wipe-away-all-tears-no-more-death-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 65:19 — *the voice of weeping shall be no more heard in her, nor the voice of crying* the rejoicing-city of the new heavens and earth, no more sorrow nor crying (Revelation 21:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-wipe-away-all-tears-no-more-death-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- he shall be my son, the overcomer inherits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 31:9 — *I am a father to Yashar''el (Israel), and Ephraim is my firstborn* the regathered house owned as firstborn son, the overcomer who shall be his son (Revelation 21:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-he-shall-be-my-son-the-overcomer-inherits-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 89:26 — *Thou art my father, my Elohim (God), and the rock of my salvation* the Davidic firstborn-sonship (Psalm 89:27), opened to the overcomer who shall be his son (Revelation 21:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-he-shall-be-my-son-the-overcomer-inherits-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- twelve gates and twelve foundations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Exodus 28:21 — *the stones shall be with the names of the children of Yashar''el (Israel), twelve... according to the twelve tribes* the tribal names on the breastplate, the same twelve names on the gates of the city (Revelation 21:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-twelve-gates-and-twelve-foundations-the-one-covenant-people-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the city of gold and precious stones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 28:13 — *in Eden the garden of Elohim (God); every precious stone was thy covering... the sapphire, the emerald... and gold* the stones of Eden''s covering restored as the jewels of the New Jerusalem (Revelation 21:18-19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-city-of-gold-and-precious-stones-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Exodus 28:17 — *four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle* the twelve breastplate stones of the tribes, answered by the twelve foundation-stones of the city (Revelation 21:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-the-city-of-gold-and-precious-stones-isaiah-54'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- no temple, no sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:7 — *not day, nor night: but... at evening time it shall be light* the one Yahuah-day that needs no sun, the city lit by the glory of Elohim (God) (Revelation 21:23).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-21-no-temple-no-sun-the-glory-of-elohim-the-light-isaiah-60'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=21 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== chapter 22 =====
-- S227 enrichment — Revelation 22: the river of life, seeing his face & the name, no night, Alpha & Omega / root of David, the tree-of-life commandments, the Spirit and the bride
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- the pure river of water of life (has Ezek 47, Zech 14:8, Gen 2:10): add Joel 3:18, Psalm 46:4 (prophetic)
  ('canon','revelation',22,1,'canon','joel',3,18,'free', E'*...and all the rivers of Yahudah (Judah) shall flow with waters, and a fountain shall come forth of the house of Yahuah (LORD), and shall water the valley of Shittim.* (Joel 3:18). The angel shows *a pure river of water of life... proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). Joel saw the fountain that issues *of the house of Yahuah (LORD)* — the temple-spring watering the dry valley. The river from the throne is that fountain of the house of Yahuah (LORD), the living waters the prophet promised flowing from the sanctuary.'),
  ('canon','revelation',22,1,'canon','psalms',46,4,'free', E'*There is a river, the streams whereof shall make glad the city of Elohim (God), the holy place of the tabernacles of the El Elyon (most High).* (Psalm 46:4). The river of life flows *in the midst of the street of it* (Revelation 22:1-2). The psalm sang of the river whose streams gladden *the city of Elohim (God)* — the holy city watered by streams of life. The river of water of life running through the New Jerusalem is that gladdening river of the city of God come to its fullness.'),

  -- they shall see his face, his name in their foreheads (P=0; has Exod 33:20, Ps 17:15, Num 6:25): add Isaiah 33:17, Numbers 6:27, Psalm 42:2
  ('canon','revelation',22,4,'canon','isaiah',33,17,'free', E'*Thine eyes shall see the king in his beauty: they shall behold the land that is very far off.* (Isaiah 33:17). *And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4). What no man could do — *there shall no man see me, and live* — is granted at the last: Isaiah promised the eyes that *shall see the king in his beauty.* The face-to-face sight of God, denied to Moses, is the servants'' portion in the city, the vision the prophet foretold.'),
  ('canon','revelation',22,4,'canon','numbers',6,27,'free', E'*And they shall put my name upon the children of Yashar''el (Israel); and I will bless them.* (Numbers 6:27). The servants *shall see his face; and his name shall be in their foreheads* (Revelation 22:4). The priestly blessing set the divine Name upon Israel — *they shall put my name upon the children of Yashar''el (Israel).* The Name in the foreheads is that blessing made indelible: the sealed servants bear the very Name the priests pronounced over the people, the true seal against the mark.'),
  ('canon','revelation',22,4,'canon','psalms',42,2,'free', E'*My soul thirsteth for Elohim (God), for the living Elohim (God): when shall I come and appear before Elohim (God)?* (Psalm 42:2). In the city the servants *shall see his face* (Revelation 22:4). The psalmist''s thirst — *when shall I come and appear before Elohim (God)?* — is answered at the river of life: the longed-for appearing before the living God is granted, his servants serving him and beholding his face.'),

  -- no night, no sun, they reign for ever (has Isaiah 60, Daniel 7:18/27): add Zechariah 14:7 (prophetic)
  ('canon','revelation',22,5,'canon','zechariah',14,7,'free', E'*But it shall be one day which shall be known to Yahuah (LORD), not day, nor night: but it shall come to pass, that at evening time it shall be light.* (Zechariah 14:7). *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light* (Revelation 22:5). Zechariah knew the day that is no day and no night, lit without sun. The endless light of the city, where the servants reign for ever and ever, is that single Yahuah-day the prophet foresaw.'),

  -- Alpha & Omega, the root and offspring of David (has Isaiah 44:6, 11:1/10, Num 24:17): add Isaiah 48:12, Jeremiah 23:5
  ('canon','revelation',22,13,'canon','isaiah',48,12,'free', E'*Hearken unto me, O Jacob and Yashar''el (Israel), my called; I am he; I am the first, I also am the last.* (Isaiah 48:12). *I am Alpha and Omega, the beginning and the end, the first and the last* (Revelation 22:13). The title belongs to Yahuah (LORD) alone, spoken to Jacob — *I am the first, I also am the last.* The Formed who is the root and offspring of David takes the very name of the One who called Israel: Alpha and Omega is Isaiah''s first-and-last come in flesh.'),
  ('canon','revelation',22,16,'canon','jeremiah',23,5,'free', E'*...I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* (Jeremiah 23:5). *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16). Jeremiah named him the *righteous Branch* raised unto David, the King who reigns and does justice in the earth. The offspring of David who is the morning star is that Branch — Davidic king and bright star together, reigning upon the earth as the prophet promised.'),

  -- blessed are they that do his commandments, the tree of life (has Deut 30:16, Mal 4:4, Ps 1:2, Gen 3:24, 2 Esdras 8:52): add Proverbs 3:18
  ('canon','revelation',22,14,'canon','proverbs',3,18,'free', E'*She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* (Proverbs 3:18). *Blessed are they that do his commandments, that they may have right to the tree of life* (Revelation 22:14). Wisdom — which is the keeping of Yahuah''s (LORD''s) instruction — is *a tree of life to them that lay hold upon her.* The right to the tree of life belongs to the doers of the commandments: those who lay hold of Torah-wisdom are the blessed who eat of the tree.'),

  -- the Spirit and the bride say Come; the warning not to add (has Isaiah 55:1, Deut 4:2/12:32, Prov 30:6): add Isaiah 55:3, Proverbs 30:5
  ('canon','revelation',22,17,'canon','isaiah',55,3,'free', E'*Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David.* (Isaiah 55:3). *And let him that is athirst come. And whosoever will, let him take the water of life freely* (Revelation 22:17). Isaiah''s call to the thirsty is the Spirit and the bride''s *Come* — *come unto me: hear, and your soul shall live.* The freely-given water of life is the everlasting covenant of the sure mercies of David, offered to whosoever will.'),
  ('canon','revelation',22,18,'canon','proverbs',30,5,'free', E'*Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him.* (Proverbs 30:5). The warning seals the book: *If any man shall add unto these things... and if any man shall take away* (Revelation 22:18-19). The proverb that forbids adding to the word first declares why — *every word of Elohim (God) is pure*: nothing may be added to or taken from what is already perfect, the same charge as *ye shall not add unto the word.* The pure word is to be kept whole, neither augmented nor diminished.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the pure river of water of life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 3:18 — *a fountain shall come forth of the house of Yahuah (LORD)* the temple-spring watering the dry valley, the river of life proceeding out of the throne (Revelation 22:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-pure-river-of-water-of-life-from-the-throne-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 46:4 — *There is a river, the streams whereof shall make glad the city of Elohim (God)* the river that gladdens the holy city, the water of life through the New Jerusalem (Revelation 22:1-2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-pure-river-of-water-of-life-from-the-throne-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- they shall see his face, his name in their foreheads
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 33:17 — *Thine eyes shall see the king in his beauty* the face-to-face sight denied to Moses, granted the servants who see his face (Revelation 22:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-they-shall-see-his-face-his-name-in-their-foreheads-exodus-33'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=33 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Numbers 6:27 — *they shall put my name upon the children of Yashar''el (Israel); and I will bless them* the priestly blessing setting the Name on Israel, the Name in the foreheads of the servants (Revelation 22:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-they-shall-see-his-face-his-name-in-their-foreheads-exodus-33'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Psalm 42:2 — *when shall I come and appear before Elohim (God)?* the psalmist''s thirst to appear before the living God, answered as his servants see his face (Revelation 22:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-they-shall-see-his-face-his-name-in-their-foreheads-exodus-33'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- no night, no sun, they reign for ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:7 — *not day, nor night: but... at evening time it shall be light* the one Yahuah-day lit without sun, the city with no night where the servants reign for ever (Revelation 22:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-no-night-no-sun-yahuah-giveth-them-light-and-they-reign-isaiah-60'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Alpha & Omega, the root and offspring of David
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 48:12 — *I am he; I am the first, I also am the last* the title of Yahuah (LORD) spoken to Jacob, taken by the root of David — Alpha and Omega (Revelation 22:13).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-i-am-alpha-and-omega-the-root-and-offspring-of-david-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 23:5 — *I will raise unto David a righteous Branch, and a King shall reign... in the earth* the Davidic Branch who reigns on the earth, the root and offspring of David, the morning star (Revelation 22:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-i-am-alpha-and-omega-the-root-and-offspring-of-david-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- blessed are they that do his commandments, the tree of life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her* Torah-wisdom as the tree of life, the right to the tree given the doers of the commandments (Revelation 22:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-blessed-are-they-that-do-his-commandments-the-tree-of-life-crown-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the Spirit and the bride say Come; the warning not to add
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 55:3 — *Incline your ear, and come unto me: hear, and your soul shall live* the call to the thirsty, the Spirit and the bride''s *Come*, the water of life freely given (Revelation 22:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-spirit-and-the-bride-say-come-and-the-warning-not-to-add-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Proverbs 30:5 — *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* the pure word that may not be added to, the warning not to add or take away (Revelation 22:18-19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-spirit-and-the-bride-say-come-and-the-warning-not-to-add-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session227 — Revelation roots enrichment complete.'
