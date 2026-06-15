-- =====================================================================
-- Session 242 — 1 John FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session242_1john_cross_references.sql
-- =====================================================================

\echo 'session242 — 1 John cross-references starting...'
BEGIN;

-- ----- fragment: minion_1john_01.sql (S242 1 John 1) -----
-- =====================================================================
-- S242 minion — 1 JOHN 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 JOHN 1 (10 verses) — the prologue of the test-of-knowing-Him letter.
-- Tag: j242c1 (temp view _s242_j242c1_lookup).
-- Sort band: floor 10000, step 3 (10000, 10003, 10006, 10009 used; under 10030).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: John opens not with a doctrine but with a testimony of the senses — *which we have
-- heard, which we have seen with our eyes... and our hands have handled, of the Word of life* (1:1). The
-- *Word of life* is the Formed, the Word *from the beginning* by whom the heavens were made, made
-- manifest in the flesh that the apostles touched. Keep the Father the source: *that eternal life, which
-- was with the Father, and was manifested unto us* (1:2) — the life was WITH the Father and was
-- manifested; the Father sends and reveals, the Son is the One manifested. *Elohim (God) is light, and
-- in him is no darkness at all* (1:5) re-speaks the first word of creation, when Elohim said *Let there
-- be light* and divided the light from the darkness. The chapter''s tests of fellowship — walk in the
-- light, confess your sins — are the Tanakh''s own: walk in the light of Yahuah (LORD), and *whoso
-- confesseth and forsaketh* his sins *shall have mercy.* No new religion; the apostolic witness of the
-- Word made flesh, grounded wholly in Genesis and the Psalms. No co-equal-persons grammar, no modalist
-- collapse — the Formed Word made manifest from the Father.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   that which was from the beginning, the Word of life, the life with the Father manifested
--           Tanakh: Genesis 1:1 (In the beginning Elohim created), Genesis 1:3 (Let there be light),
--                   Psalm 33:6 (by the word of Yahuah were the heavens made), Proverbs 8:22-23 (wisdom
--                   from the beginning, set up from everlasting)
--           Extras: none warranted (the Word-from-the-beginning weight carried by Genesis/Proverbs/John)
--           NT: John 1:1-4 (In the beginning was the Word... in him was life; and the life was the light)
--   v.5     Elohim (God) is light, and in him is no darkness at all
--           Tanakh: Genesis 1:3-4 (Let there be light... divided the light from the darkness), Psalm
--                   27:1 (Yahuah is my light), Isaiah 60:19 (Yahuah shall be unto thee an everlasting light)
--           Extras: none warranted   NT: carried at v.1-4 (John 1:4-5 the light shineth in darkness)
--   v.6-7   if we walk in the light, as he is in the light, we have fellowship one with another
--           Tanakh: Psalm 89:15 (they shall walk... in the light of thy countenance), Isaiah 2:5 (O
--                   house of Jacob... let us walk in the light of Yahuah)
--           Extras: none warranted   NT: none warranted
--   v.8-10  if we confess our sins, he is faithful and just to forgive us our sins
--           Tanakh: Proverbs 28:13 (whoso confesseth and forsaketh them shall have mercy), Psalm 32:5
--                   (I will confess my transgressions... thou forgavest), Psalm 51:2-3 (cleanse me from
--                   my sin... I acknowledge my transgressions)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   10000 1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1  (Tanakh + NT)
--   10003 1-john-1-elohim-is-light-and-in-him-is-no-darkness-genesis-1-psalm-27-isaiah-60  (Tanakh)
--   10006 1-john-1-if-we-walk-in-the-light-we-have-fellowship-psalm-89-isaiah-2  (Tanakh)
--   10009 1-john-1-if-we-confess-our-sins-he-is-faithful-to-forgive-proverbs-28-psalm-32-51  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s242_j242c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1
  ('canon', '1-john', 1, 1, 'canon', 'genesis', 1, 1, 'free', E'*In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1). John opens his letter where the Torah opens: *That which was from the beginning, which we have heard, which we have seen with our eyes... of the Word of life* (1 John 1:1). The Word that *was from the beginning* is the Word by which Elohim (God) created — the Formed, present *in the beginning,* now heard and seen and handled by the apostles. John does not announce a new thing but the ancient One: the creating Word of Genesis 1, made manifest in the flesh.'),
  ('canon', '1-john', 1, 1, 'canon', 'genesis', 1, 3, 'free', E'*And Elohim (God) said, Let there be light: and there was light.* (Genesis 1:3). The first act of creation is the speaking of the Word: *Elohim (God) said, Let there be light.* John''s *Word of life* (1 John 1:1) is that same speaking Word — the Word by which the light came, *from the beginning,* now made manifest as life and light to men. The Word that called light out of darkness in Genesis is the Word the apostles heard and handled.'),
  ('canon', '1-john', 1, 1, 'canon', 'psalms', 33, 6, 'free', E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* (Psalm 33:6). The Psalm names the agent of creation: *by the word of Yahuah (LORD) were the heavens made.* This is the *Word of life* John testifies of, *that which was from the beginning* (1 John 1:1) — the Word by which the heavens were made, the Formed who was with Yahuah (LORD) before the works of old, now manifested in the flesh.'),
  ('canon', '1-john', 1, 1, 'canon', 'proverbs', 8, 22, 'free', E'*Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* (Proverbs 8:22). Wisdom speaks of being *in the beginning of his way, before his works of old* — *set up from everlasting, from the beginning, or ever the earth was* (Proverbs 8:23). This is the One *that which was from the beginning* (1 John 1:1), brought forth by Yahuah (LORD) before creation, by whom the worlds were framed: the Formed, the Word of life, with the Father before the heavens were made.'),
  ('canon', '1-john', 1, 2, 'canon', 'john', 1, 1, 'free', E'*In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1). John''s Gospel and his letter open with the same Word: *In the beginning was the Word,* and *that which was from the beginning... of the Word of life* (1 John 1:1). *In him was life; and the life was the light of men* (John 1:4) is the *Word of life* John testifies he has heard and handled. The Word *with Elohim (God)* in the beginning is *that eternal life, which was with the Father, and was manifested unto us* (1 John 1:2) — the Formed, with the Father, now made flesh.'),
  -- thread: 1-john-1-elohim-is-light-and-in-him-is-no-darkness-genesis-1-psalm-27-isaiah-60
  ('canon', '1-john', 1, 5, 'canon', 'genesis', 1, 4, 'free', E'*And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* (Genesis 1:4). At creation Elohim (God) *divided the light from the darkness* — light and darkness set utterly apart from the first day. John''s message is the ground of that division: *Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). The God who separated light from darkness is himself the light in whom is no darkness; the moral test of the letter is rooted in the creation order.'),
  ('canon', '1-john', 1, 5, 'canon', 'psalms', 27, 1, 'free', E'*Yahuah (LORD) is my light and my salvation; whom shall I fear? Yahuah (LORD) is the strength of my life; of whom shall I be afraid?* (Psalm 27:1). David confessed *Yahuah (LORD) is my light and my salvation.* John declares the same: *Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). The light that is the Psalmist''s salvation and strength is the very nature of Elohim (God) — no new revelation, but the light the saints of old already walked by.'),
  ('canon', '1-john', 1, 5, 'canon', 'isaiah', 60, 19, 'free', E'*The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* (Isaiah 60:19). Isaiah saw the day when *Yahuah (LORD) shall be unto thee an everlasting light* — Elohim (God) himself the light of his people. John names that same nature now: *Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). The everlasting light of Isaiah''s restoration is the light John says God IS — and to walk with him is to walk in that light.'),
  -- thread: 1-john-1-if-we-walk-in-the-light-we-have-fellowship-psalm-89-isaiah-2
  ('canon', '1-john', 1, 7, 'canon', 'psalms', 89, 15, 'free', E'*Blessed is the people that know the joyful sound: they shall walk, O Yahuah (LORD), in the light of thy countenance.* (Psalm 89:15). The blessed people *walk... in the light of thy countenance.* John makes that walking the test of true fellowship: *But if we walk in the light, as he is in the light, we have fellowship one with another* (1 John 1:7). To walk in the light is the walk the Psalm already named — and only there is the fellowship John speaks of, with the Father and with one another, found.'),
  ('canon', '1-john', 1, 7, 'canon', 'isaiah', 2, 5, 'free', E'*O house of Jacob, come ye, and let us walk in the light of Yahuah (LORD).* (Isaiah 2:5). Isaiah calls the house of Jacob: *let us walk in the light of Yahuah (LORD).* John makes the same the proof of fellowship: *if we walk in the light, as he is in the light, we have fellowship one with another* (1 John 1:7), while *if we say that we have fellowship with him, and walk in darkness, we lie* (1 John 1:6). The walk-in-the-light that Isaiah summoned Jacob to is the walk John says distinguishes truth from the lie.'),
  -- thread: 1-john-1-if-we-confess-our-sins-he-is-faithful-to-forgive-proverbs-28-psalm-32-51
  ('canon', '1-john', 1, 9, 'canon', 'proverbs', 28, 13, 'free', E'*He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy.* (Proverbs 28:13). The proverb sets the two ways exactly as John does: *he that covereth his sins shall not prosper,* but *whoso confesseth and forsaketh them shall have mercy.* John echoes it: *If we say that we have no sin, we deceive ourselves* (1 John 1:8) — that is covering; *If we confess our sins, he is faithful and just to forgive us our sins* (1 John 1:9) — that is the confessing and forsaking that finds mercy. The apostle preaches the wisdom of the Tanakh.'),
  ('canon', '1-john', 1, 9, 'canon', 'psalms', 32, 5, 'free', E'*I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin. Selah.* (Psalm 32:5). David''s pattern is John''s promise: *I will confess my transgressions unto Yahuah (LORD); and thou forgavest.* John says the same of the faithful God: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). The confession David made and the forgiveness he found are the very mercy John assures the scattered elect.'),
  ('canon', '1-john', 1, 9, 'canon', 'psalms', 51, 2, 'free', E'*Wash me throughly from mine iniquity, and cleanse me from my sin.* (Psalm 51:2). David''s plea — *cleanse me from my sin,* *I acknowledge my transgressions: and my sin is ever before me* (Psalm 51:3) — is the very posture John commends: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). The acknowledging and cleansing David sought are the confessing and cleansing John promises; against the self-deceit of *we have no sin* (1 John 1:8) stands the broken honesty of the fifty-first Psalm.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s242_j242c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1',
       E'That which was from the beginning, the Word of life (Genesis 1, Psalm 33, Proverbs 8, John 1)',
       E'John opens his letter not with a teaching but with a testimony of the senses: *That which was from the beginning, which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled, of the Word of life* (1 John 1:1). The phrase *from the beginning* sends us straight to the Torah''s first words: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1), and the first act of that creation was the speaking of the Word — *And Elohim (God) said, Let there be light: and there was light* (Genesis 1:3). The Psalm names that creating Word as the agent of all things: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6). And Wisdom, the One brought forth before the works of old, says *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* — *I was set up from everlasting, from the beginning, or ever the earth was* (Proverbs 8:22-23). This is the One John''s Gospel names plainly: *In the beginning was the Word, and the Word was with Elohim (God)... In him was life; and the life was the light of men* (John 1:1,4) — the *Word of life.* And here is the Christology, kept where John keeps it: *the life was manifested, and we have seen it... and shew unto you that eternal life, which was with the Father, and was manifested unto us* (1 John 1:2). The eternal life was WITH the Father and was manifested; the Father is the source and the One who reveals, and the Son is the Word made manifest — the Formed, present in the beginning, by whom the heavens were made, now heard and seen and handled in the flesh. John announces no new God and no new religion, but the ancient creating Word of Genesis, come to be touched by the hands of the apostles.',
       sv.verse_id, ev.verse_id, 'free', 10000
  FROM _s242_j242c1_lookup sv, _s242_j242c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-1-elohim-is-light-and-in-him-is-no-darkness-genesis-1-psalm-27-isaiah-60',
       E'Elohim (God) is light, and in him is no darkness at all (Genesis 1, Psalm 27, Isaiah 60)',
       E'*This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). John''s message of light and darkness re-speaks the first day of creation, when Elohim (God) drew the line between the two: *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness* (Genesis 1:4). The God who separated light from darkness at the beginning is himself the light in whom there is no darkness at all — the moral division of the letter is grounded in the creation order. The saints of old knew this light as their salvation: *Yahuah (LORD) is my light and my salvation; whom shall I fear?* (Psalm 27:1). And the prophets saw the day when Elohim (God) himself would be the unfailing light of his people: *Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19). John names that same nature now, not as a far-off hope but as the message heard from the One who is the Word of life: Elohim (God) IS light. To claim fellowship with him while walking in darkness is the lie (1 John 1:6); to walk in the light is to walk where the Psalmist and the prophet already walked — in the light Yahuah (LORD) is.',
       sv.verse_id, ev.verse_id, 'free', 10003
  FROM _s242_j242c1_lookup sv, _s242_j242c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-1-if-we-walk-in-the-light-we-have-fellowship-psalm-89-isaiah-2',
       E'If we walk in the light, we have fellowship one with another (Psalm 89, Isaiah 2)',
       E'*If we say that we have fellowship with him, and walk in darkness, we lie, and do not the truth: But if we walk in the light, as he is in the light, we have fellowship one with another* (1 John 1:6-7). The test of fellowship is a walk, and that walk is the Tanakh''s own. The Psalm blesses the people who walk it: *Blessed is the people that know the joyful sound: they shall walk, O Yahuah (LORD), in the light of thy countenance* (Psalm 89:15). And Isaiah summons the whole house of Jacob to it: *O house of Jacob, come ye, and let us walk in the light of Yahuah (LORD)* (Isaiah 2:5). To walk in the light is not a vague feeling but the conduct the prophets called Yashar''el (Israel) to — and John makes it the line between truth and the lie. The man who claims fellowship with the God who is light while walking in darkness lies; the one who walks in the light, as he is in the light, has the very fellowship the saints of old were blessed with, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanses him from all sin. The walk John commends is the walk in the light of Yahuah (LORD) that Jacob was called to from of old.',
       sv.verse_id, ev.verse_id, 'free', 10006
  FROM _s242_j242c1_lookup sv, _s242_j242c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-1-if-we-confess-our-sins-he-is-faithful-to-forgive-proverbs-28-psalm-32-51',
       E'If we confess our sins, he is faithful and just to forgive (Proverbs 28, Psalm 32, Psalm 51)',
       E'John sets the covering of sin against the confessing of it, exactly as the Tanakh does. *If we say that we have no sin, we deceive ourselves, and the truth is not in us. If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:8-9). The proverb draws the same two ways: *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13) — to say we have no sin is to cover it; to confess and forsake is to find mercy. David walked the confessing way and found the promise true: *I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5). And the fifty-first Psalm is the very posture John commends — broken honesty before the faithful God: *Wash me throughly from mine iniquity, and cleanse me from my sin* (Psalm 51:2), *For I acknowledge my transgressions: and my sin is ever before me* (Psalm 51:3). The forgiveness John promises the scattered elect is no new mercy but the mercy David found: the God who is faithful and just to forgive is the God to whom the Psalmist confessed and was cleansed. Against the self-deceit of *we have no sin* stands the whole witness of the Tanakh — confess, forsake, and find mercy.',
       sv.verse_id, ev.verse_id, 'free', 10009
  FROM _s242_j242c1_lookup sv, _s242_j242c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth* the Torah''s opening; *that which was from the beginning... of the Word of life* (1 John 1:1), the creating Word now heard and handled.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:3 — *And Elohim (God) said, Let there be light: and there was light* creation by the spoken Word; *the Word of life* (1 John 1:1), the same speaking Word made manifest as life and light.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made* the Word the agent of creation; *that which was from the beginning... of the Word of life* (1 John 1:1), the Formed by whom the heavens were made.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* Wisdom brought forth before creation; *that which was from the beginning* (1 John 1:1), with the Father before the heavens were made.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God)* the Gospel''s twin opening; *that eternal life, which was with the Father, and was manifested unto us* (1 John 1:2), the Word with the Father now made flesh.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-that-which-was-from-the-beginning-the-word-of-life-genesis-1-john-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-1-elohim-is-light-and-in-him-is-no-darkness-genesis-1-psalm-27-isaiah-60
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:4 — *Elohim (God) divided the light from the darkness* the creation order; *Elohim (God) is light, and in him is no darkness at all* (1 John 1:5), the God who divided light and darkness himself the light.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-elohim-is-light-and-in-him-is-no-darkness-genesis-1-psalm-27-isaiah-60'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 27:1 — *Yahuah (LORD) is my light and my salvation; whom shall I fear?* the light the saints walked by; *Elohim (God) is light, and in him is no darkness at all* (1 John 1:5).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-elohim-is-light-and-in-him-is-no-darkness-genesis-1-psalm-27-isaiah-60'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:19 — *Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* the prophet''s vision of God himself the light; *Elohim (God) is light, and in him is no darkness at all* (1 John 1:5).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-elohim-is-light-and-in-him-is-no-darkness-genesis-1-psalm-27-isaiah-60'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-1-if-we-walk-in-the-light-we-have-fellowship-psalm-89-isaiah-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 89:15 — *Blessed is the people... they shall walk, O Yahuah (LORD), in the light of thy countenance* the blessed walk; *if we walk in the light, as he is in the light, we have fellowship one with another* (1 John 1:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-if-we-walk-in-the-light-we-have-fellowship-psalm-89-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 2:5 — *O house of Jacob, come ye, and let us walk in the light of Yahuah (LORD)* the summons to Jacob; the same walk John makes the line between fellowship and the lie (1 John 1:6-7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-if-we-walk-in-the-light-we-have-fellowship-psalm-89-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-1-if-we-confess-our-sins-he-is-faithful-to-forgive-proverbs-28-psalm-32-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 28:13 — *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* the two ways; *If we confess our sins, he is faithful and just to forgive* (1 John 1:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-if-we-confess-our-sins-he-is-faithful-to-forgive-proverbs-28-psalm-32-51'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 32:5 — *I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* David''s confession and forgiveness; *If we confess our sins, he is faithful and just to forgive us our sins* (1 John 1:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-if-we-confess-our-sins-he-is-faithful-to-forgive-proverbs-28-psalm-32-51'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:2 — *Wash me throughly from mine iniquity, and cleanse me from my sin* the broken honesty John commends; against *we have no sin* (1 John 1:8) stands *to cleanse us from all unrighteousness* (1 John 1:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c1_lookup sv, _s242_j242c1_lookup tv
 WHERE t.slug='1-john-1-if-we-confess-our-sins-he-is-faithful-to-forgive-proverbs-28-psalm-32-51'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1john_02.sql (S242 1 John 2) -----
-- =====================================================================
-- S242 minion — 1 JOHN 2 FULL-LIBRARY cross-references — THE MASTER-FILTER CHAPTER
-- =====================================================================
-- Chapter: 1 JOHN 2 (29 verses) — the highest-watchpoint chapter of the book.
-- Tag: j242c2 (temp view _s242_j242c2_lookup).
-- Sort band: floor 10030, step 3 (10030, 10033, 10036, 10039, 10042, 10045 used; under 10060).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 John 2 = THE MASTER FILTER. *Hereby we do know that we know him, if we keep his
-- commandments* (2:3) — Torah-keeping is the evidentiary PROOF of knowing Him, and *he that saith, I know
-- him, and keepeth not his commandments, is a liar* (2:4). There is no knowing-Him severed from obedience.
-- And the commandment is not new but *an old commandment which ye had from the beginning* (2:7) — the Torah
-- from of old, the Shema and Leviticus 19:18, NOT a new law replacing the old. The "newness" of 2:8 is only
-- the fresh shining *because the darkness is past,* not an abolition. Love of brother is walking in light
-- (2:9-11, Leviticus 19:17-18); love of the world is the lust of Eden (2:15-16, Genesis 3:6); the antichrist
-- is the Daniel little-horn spirit that denies the Messiah (2:18,22). NO replacement theology, NO law-vs-grace
-- antithesis. Do NOT spiritualise "his commandments" into a vague feeling — they are the Torah, and keeping
-- them is how the apostle says we KNOW we know Him.)
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   an advocate with the Father / propitiation for our sins (whole world)
--           Tanakh: none warranted (the Advocate/propitiation Christology carried in prose, not a single
--                   load-bearing Tanakh quotation in this block)
--           Extras: none warranted   NT: none warranted
--   v.3-4   ★★★ hereby we KNOW we know him, IF we keep his commandments / he that keepeth not is a liar
--           Tanakh: Deuteronomy 11:1 (love Yahuah and keep his commandments alway), Deuteronomy 11:22
--                   (love Yahuah, keep his commandments), Deuteronomy 30:16 (keep his commandments = live),
--                   Deuteronomy 30:20 (love Yahuah... cleave unto him: for he is thy life)
--           Extras: Sirach 2:15 (they that love him will keep his ways)
--           NT: John 14:15 (if ye love me, keep my commandments), John 15:10 (keep my commandments, abide)
--   v.5-6   whoso keepeth his word, in him is the love of Elohim perfected / so to walk even as he walked
--           Tanakh: Deuteronomy 30:14 (the word is very nigh unto thee... that thou mayest do it),
--                   Deuteronomy 11:22 (walk in all his ways, cleave unto him)
--           Extras: none warranted (carried at 2:3-4)   NT: none warranted (carried at 2:3-4)
--   v.7-8   ★★ no NEW commandment, but an OLD commandment which ye had from the beginning
--           Tanakh: Deuteronomy 6:5 (love Yahuah with all thine heart), Deuteronomy 6:6 (these words...
--                   shall be in thine heart), Leviticus 19:18 (love thy neighbour as thyself)
--           Extras: none warranted   NT: John 13:34 (a new commandment... love one another), 2 John 5
--                   (not a new commandment, but that which we had from the beginning), 2 John 6 (love =
--                   walk after his commandments)
--   v.9-11  he that loveth his brother abideth in the light / he that hateth is in darkness
--           Tanakh: Leviticus 19:17 (thou shalt not hate thy brother in thine heart), Leviticus 19:18
--                   (love thy neighbour as thyself), Psalm 119:165 (great peace have they which love thy
--                   law: nothing shall offend them), Proverbs 4:18 (the path of the just as the shining
--                   light), Proverbs 4:19 (the way of the wicked is as darkness)
--           Extras: none warranted   NT: none warranted (carried at 2:7 old commandment)
--   v.12-14 sins forgiven for his name's sake / ye have known him from the beginning / overcome the wicked
--           Tanakh: none warranted (pastoral address, no single load-bearing quotation)
--           Extras: none warranted   NT: none warranted
--   v.15-17 love NOT the world / the lust of the flesh, the lust of the eyes, the pride of life
--           Tanakh: Genesis 3:6 (good for food, pleasant to the eyes, to make one wise — the threefold
--                   lust of Eden), Proverbs 27:20 (the eyes of man are never satisfied)
--           Extras: none warranted   NT: none warranted
--   v.18-23 many antichrists / who is a liar but he that denieth that Yahusha is the Messiah
--           Tanakh: Daniel 7:25 (speak great words against the most High, change times and laws),
--                   Daniel 11:36 (the king shall exalt himself, magnify himself above every god)
--           Extras: none warranted   NT: none warranted (the antichrist spirit carried by the Daniel root)
--   v.24-29 abide in the Son and the Father / the anointing teacheth you / abide that he may appear
--           Tanakh: none warranted (the abiding/anointing carried by the master-filter and old-commandment
--                   threads; no single fresh load-bearing quotation)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   10030 1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30  (Tanakh + Extras + NT)  [★★★ MASTER FILTER]
--   10033 1-john-2-whoso-keepeth-his-word-the-love-of-elohim-perfected-deuteronomy-30             (Tanakh)
--   10036 1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19              (Tanakh + NT)  [★★ OLD COMMANDMENT]
--   10039 1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119        (Tanakh)
--   10042 1-john-2-love-not-the-world-genesis-3-proverbs-27                                      (Tanakh)
--   10045 1-john-2-many-antichrists-he-that-denieth-the-messiah-is-a-liar-daniel-7-11            (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s242_j242c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30  [★★★ MASTER FILTER]
  ('canon', '1-john', 2, 3, 'canon', 'deuteronomy', 11, 1, 'free', E'*Therefore thou shalt love Yahuah Elohayka (the LORD thy God), and keep his charge, and his statutes, and his judgments, and his commandments, alway.* (Deuteronomy 11:1). The Torah binds love and commandment-keeping into one act: to love Yahuah (LORD) IS to keep his charge, his statutes, his judgments, his commandments, *alway.* John takes up that very welding when he writes *hereby we do know that we know him, if we keep his commandments* (1 John 2:3). The proof of knowing Him is not a feeling but the kept commandment; the apostle measures the knowledge of Yahuah (LORD) by the same rule Moses set before Yashar''el (Israel).'),
  ('canon', '1-john', 2, 3, 'canon', 'deuteronomy', 11, 22, 'free', E'*For if ye shall diligently keep all these commandments which I command you, to do them, to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him;* (Deuteronomy 11:22). To *cleave unto him* is to *diligently keep all these commandments... to do them.* This is the Torah''s own definition of nearness to Yahuah (LORD), and it is John''s test exactly: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3). There is no cleaving to Him, no knowing Him, severed from the doing of His commandments.'),
  ('canon', '1-john', 2, 4, 'canon', 'deuteronomy', 30, 16, 'free', E'*In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* (Deuteronomy 30:16). Moses set the keeping of the commandments as the very mark of those who love Yahuah (LORD) and live. John turns that mark into a test of the claim: *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). The man who claims to love and know Yahuah (LORD) but keeps not His commandments is convicted by Moses'' own word — the love that does not keep is no love.'),
  ('canon', '1-john', 2, 4, 'canon', 'deuteronomy', 30, 20, 'free', E'*That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* (Deuteronomy 30:20). To love Yahuah (LORD) is to *obey his voice* and *cleave unto him* — for *he is thy life.* John''s liar is the man who severs the knowing from the obeying that Moses bound together: *He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4). Where there is no obedience there is no life and no truth, for the One known is the One whose voice is obeyed.'),
  ('canon', '1-john', 2, 3, 'apocrypha', 'ecclesiasticus', 2, 15, 'extras', E'*They that fear Yahuah (God) will not disobey his Word; and they that love him will keep his ways.* (Sirach 2:15). The Hebrew library says the same in the wisdom-tongue: love of Yahuah (God) is proven by keeping His ways, and the fear of Him by not disobeying His Word. This is John''s test rendered by the son of Sirach: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3). They that love Him keep His ways; they that keep His commandments know Him — one and the same evidentiary rule across the whole library.'),
  ('canon', '1-john', 2, 3, 'canon', 'john', 14, 15, 'free', E'*If ye love me, keep my commandments.* (John 14:15). The Formed One spoke the master filter in his own words on the night he was betrayed: love is the keeping of the commandments. John the apostle, who lay on his breast at that supper, writes the same: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3). The commandments Yahusha (Jesus) bids his own keep are the Father''s — *I have kept my Father''s commandments* (John 15:10) — the Torah, not a new law; and the keeping of them is the proof of the love and the knowing.'),
  ('canon', '1-john', 2, 4, 'canon', 'john', 15, 10, 'free', E'*If ye keep my commandments, ye shall abide in my love; even as I have kept my Father''s commandments, and abide in his love.* (John 15:10). Abiding in his love is conditioned upon keeping his commandments — and his commandments are the Father''s, which he himself kept. John presses the converse as the mark of the liar: *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). To claim the knowing and the abiding while refusing the keeping is to be cut off from the very love one claims; the Son kept the Father''s commandments, and so must those who would abide in Him.'),
  -- thread: 1-john-2-whoso-keepeth-his-word-the-love-of-elohim-perfected-deuteronomy-30
  ('canon', '1-john', 2, 5, 'canon', 'deuteronomy', 30, 14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). Moses set the word not far off but *very nigh... in thy mouth, and in thy heart, that thou mayest do it* — the commandment given to be kept, and the keeping of it the love of Yahuah (LORD) made full. John speaks the same fullness: *But whoso keepeth his word, in him verily is the love of Elohim (God) perfected* (1 John 2:5). The love of Elohim (God) is not perfected in profession but in the kept word — the word that is nigh, in the heart, to be done.'),
  ('canon', '1-john', 2, 6, 'canon', 'deuteronomy', 11, 22, 'free', E'*For if ye shall diligently keep all these commandments which I command you, to do them, to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him;* (Deuteronomy 11:22). The walk of the covenant is to *walk in all his ways* — the very path Moses laid down. John says the one who abides in Him must walk that walk: *He that saith he abideth in him ought himself also so to walk, even as he walked* (1 John 2:6). To abide in Him is to walk in His ways as He walked them, keeping the commandments and cleaving unto Yahuah (LORD); the abiding and the walking are one.'),
  -- thread: 1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19  [★★ OLD COMMANDMENT]
  ('canon', '1-john', 2, 7, 'canon', 'deuteronomy', 6, 5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). This is the Shema''s great commandment — the love of Yahuah (LORD) with the whole heart, soul, and might, spoken to Yashar''el (Israel) of old. John denies he writes anything new: *I write no new commandment unto you, but an old commandment which ye had from the beginning* (1 John 2:7). The commandment is this one, from the beginning — the Torah''s own love-command, not a fresh law replacing the old but the ancient word heard from the start.'),
  ('canon', '1-john', 2, 7, 'canon', 'deuteronomy', 6, 6, 'free', E'*And these words, which I command thee this day, shall be in thine heart:* (Deuteronomy 6:6). The words of the commandment were to be *in thine heart* from the day they were given — borne, taught, and kept. John names exactly this when he writes *an old commandment which ye had from the beginning. The old commandment is the word which ye have heard from the beginning* (1 John 2:7). The word heard from the beginning is the word Moses commanded to be in the heart; the apostle preaches no novelty, only the old word of the Torah carried in the heart of the covenant people.'),
  ('canon', '1-john', 2, 7, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). *Love thy neighbour as thyself* is the old commandment from of old, sealed with *I am Yahuah (LORD).* When John writes *an old commandment which ye had from the beginning* (1 John 2:7), and then *He that loveth his brother abideth in the light* (1 John 2:10), it is this Levitical command he names — the love of the brother that the Torah commanded from the beginning, not a new law but the ancient word.'),
  ('canon', '1-john', 2, 8, 'canon', 'john', 13, 34, 'free', E'*A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* (John 13:34). The Formed One called the love-commandment *new* — yet John explains the newness: *Again, a new commandment I write unto you, which thing is true in him and in you: because the darkness is past, and the true light now shineth* (1 John 2:8). The commandment is old (the Torah''s *love thy neighbour*), and new only in its fresh shining — *as I have loved you* — now that the true light is come. It is not a replacement of the old law but the old love-command newly lit in the One who fulfilled it.'),
  ('canon', '1-john', 2, 7, 'canon', '2-john', 1, 5, 'free', E'*And now I beseech thee, lady, not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another.* (2 John 5). John''s twin letter says it plainest: he writes *not... a new commandment... but that which we had from the beginning.* It is the same denial as *I write no new commandment unto you, but an old commandment which ye had from the beginning* (1 John 2:7). The commandment to love is no new law — *and this is love, that we walk after his commandments* (2 John 6) — the old word from the beginning, walked out in the keeping of His commandments.'),
  -- thread: 1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119
  ('canon', '1-john', 2, 9, 'canon', 'leviticus', 19, 17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* (Leviticus 19:17). The Torah forbids the hatred of the brother in the heart. John makes that hatred the mark of darkness: *He that saith he is in the light, and hateth his brother, is in darkness even until now* (1 John 2:9). To hate the brother is to transgress the command of Leviticus, and the man who does so walks in darkness whatever he professes of the light.'),
  ('canon', '1-john', 2, 10, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The love of the brother is the old Levitical command. John makes the keeping of it the proof of abiding in the light: *He that loveth his brother abideth in the light, and there is none occasion of stumbling in him* (1 John 2:10). To love the neighbour as oneself is to walk in the light without stumbling — the Torah''s love-command lived out, exactly as the apostle names it.'),
  ('canon', '1-john', 2, 10, 'canon', 'psalms', 119, 165, 'free', E'*Great peace have they which love thy law: and nothing shall offend them.* (Psalm 119:165). The Psalmist welds the love of the Torah to peace and to the absence of stumbling — *nothing shall offend them.* John says the same of the one who loves his brother: *He that loveth his brother abideth in the light, and there is none occasion of stumbling in him* (1 John 2:10). The love that keeps the law is the love that does not stumble; the great peace of the Torah-lover is the unstumbling walk of the brother-lover in the light.'),
  ('canon', '1-john', 2, 11, 'canon', 'proverbs', 4, 18, 'free', E'*But the path of the just is as the shining light, that shineth more and more unto the perfect day.* (Proverbs 4:18). The just walk a path of growing light. John sets the brother-lover on that very path: *He that loveth his brother abideth in the light* (1 John 2:10). The way of the just is the way of light; to love the brother is to walk it.'),
  ('canon', '1-john', 2, 11, 'canon', 'proverbs', 4, 19, 'free', E'*The way of the wicked is as darkness: they know not at what they stumble.* (Proverbs 4:19). The wicked walk in a darkness so deep they cannot see what trips them. John echoes the very picture for the brother-hater: *he that hateth his brother is in darkness, and walketh in darkness, and knoweth not whither he goeth, because that darkness hath blinded his eyes* (1 John 2:11). The hater walks the way of the wicked — blind, stumbling, not knowing whither he goes; the apostle paints the proverb in apostolic ink.'),
  -- thread: 1-john-2-love-not-the-world-genesis-3-proverbs-27
  ('canon', '1-john', 2, 16, 'canon', 'genesis', 3, 6, 'free', E'*And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6). The first sin came by a threefold lust: the tree *good for food* (the lust of the flesh), *pleasant to the eyes* (the lust of the eyes), and *to be desired to make one wise* (the pride of life). John names that same three: *the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world* (1 John 2:16). The pattern of the world''s love is the pattern of Eden''s fall — the very lust that took the fruit is the lust that loves the world.'),
  ('canon', '1-john', 2, 16, 'canon', 'proverbs', 27, 20, 'free', E'*Hell and destruction are never full; so the eyes of man are never satisfied.* (Proverbs 27:20). The eye of man is a pit that never fills — the lust of the eyes can never be satisfied. John warns against feeding it: *Love not the world... For all that is in the world, the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father* (1 John 2:15-16). The world offers what the never-satisfied eye craves, but *the world passeth away, and the lust thereof* (1 John 2:17); the proverb''s bottomless eye is the world''s love that the apostle forbids.'),
  -- thread: 1-john-2-many-antichrists-he-that-denieth-the-messiah-is-a-liar-daniel-7-11
  ('canon', '1-john', 2, 18, 'canon', 'daniel', 7, 25, 'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). Daniel saw the little horn that *speak great words against the El Elyon (most High)* and *think to change times and laws.* John says that spirit is already abroad: *as ye have heard that antichrist shall come, even now are there many antichrists* (1 John 2:18). The antichrist John names is the Danielic adversary in many guises — the spirit that opposes the most High and would change His times and His law.'),
  ('canon', '1-john', 2, 22, 'canon', 'daniel', 11, 36, 'free', E'*And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* (Daniel 11:36). The wilful king *shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods.* John names the spirit of that exaltation in the one who denies the Messiah: *Who is a liar but he that denieth that Yahusha (Jesus) is the Messiah (Christ)? He is antichrist, that denieth the Father and the Son* (1 John 2:22). The Danielic king who magnifies himself above every god is of one spirit with the liar who denies the Father and the Son — the antichrist whose end is determined and sure.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s242_j242c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30',
       E'Hereby we know that we know him, if we keep his commandments — the master filter (Deuteronomy 11, 30)',
       E'Here is the framework''s own test verbalised by the apostle: *And hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:3-4). The knowing of Yahuah (LORD) is not measured by feeling or by profession but by the kept commandment — and the man who claims the knowing while refusing the keeping is named *a liar.* This is no apostolic novelty; it is the Torah''s own self-test. Moses set it before Yashar''el (Israel) plainly: *Therefore thou shalt love Yahuah Elohayka (the LORD thy God), and keep his charge, and his statutes, and his judgments, and his commandments, alway* (Deuteronomy 11:1) — love and commandment-keeping welded into one act, *alway.* To draw near to Him is to keep them: *if ye shall diligently keep all these commandments... to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him* (Deuteronomy 11:22). And the keeping is life itself: *to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live* (Deuteronomy 30:16); *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life* (Deuteronomy 30:20). The Hebrew library said the same in the wisdom-tongue: *they that love him will keep his ways* (Sirach 2:15). And the Formed One spoke the test in his own mouth on the night he was betrayed: *If ye love me, keep my commandments* (John 14:15); *If ye keep my commandments, ye shall abide in my love; even as I have kept my Father''s commandments, and abide in his love* (John 15:10) — the commandments he bids his own keep are the Father''s commandments, which he himself kept, the Torah and not a new law. So the master filter stands across the whole library: Torah-keeping is the evidentiary proof of knowing Him. Do not spiritualise *his commandments* into a vague new-covenant sentiment — they are the very commandments John calls, four verses on, *an old commandment which ye had from the beginning* (1 John 2:7), the Torah. The love that does not keep is no love; the knowing that does not obey is a lie.',
       sv.verse_id, ev.verse_id, 'extras', 10030
  FROM _s242_j242c2_lookup sv, _s242_j242c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-2-whoso-keepeth-his-word-the-love-of-elohim-perfected-deuteronomy-30',
       E'Whoso keepeth his word, in him is the love of Elohim perfected (Deuteronomy 30)',
       E'The master filter has its companion: *But whoso keepeth his word, in him verily is the love of Elohim (God) perfected: hereby know we that we are in him. He that saith he abideth in him ought himself also so to walk, even as he walked* (1 John 2:5-6). The love of Elohim (God) is not perfected in profession but in the kept word, and the abiding in Him is proven by the walk. This is Moses'' own teaching: the commandment is not far off but near, given to be done — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). The word is nigh that it may be kept, and the keeping of it is the love made full. And the walk John requires — *so to walk, even as he walked* — is the walk Moses laid down: *to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him* (Deuteronomy 11:22). To abide in Him is to walk in His ways as He walked them; the kept word, the perfected love, and the faithful walk are one and the same obedience.',
       sv.verse_id, ev.verse_id, 'free', 10033
  FROM _s242_j242c2_lookup sv, _s242_j242c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19',
       E'No new commandment, but an old commandment which ye had from the beginning (Deuteronomy 6, Leviticus 19)',
       E'The apostle expressly denies that he preaches a new law: *Brethren, I write no new commandment unto you, but an old commandment which ye had from the beginning. The old commandment is the word which ye have heard from the beginning* (1 John 2:7). The commandment is OLD — from the beginning — the Torah''s own word, heard from the start, carried in the heart of the covenant people. It is the Shema''s great command: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5), the words *which I command thee this day* that *shall be in thine heart* (Deuteronomy 6:6). And it is the Levitical love-command: *but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — the love of the brother that the Torah sealed with the divine Name. When John then says *Again, a new commandment I write unto you... because the darkness is past, and the true light now shineth* (1 John 2:8), the newness is not a replacement of the old law but its fresh shining: the Formed One called it new — *A new commandment I give unto you, That ye love one another; as I have loved you* (John 13:34) — new in its fresh light, *as I have loved you,* now that the true light is come, while the command itself is the Torah''s ancient *love thy neighbour.* His twin letter settles it past mistaking: *not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another. And this is love, that we walk after his commandments* (2 John 5-6). Do not read 2:7-8 as old-law-abolished and new-law-given — John says the opposite. The commandment is old, from the beginning, the Torah; its newness is only its fresh shining in the One who loved us and fulfilled it.',
       sv.verse_id, ev.verse_id, 'free', 10036
  FROM _s242_j242c2_lookup sv, _s242_j242c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119',
       E'He that loveth his brother abideth in the light; he that hateth is in darkness (Leviticus 19, Psalm 119, Proverbs 4)',
       E'John makes the love or hatred of the brother the very test of light and darkness: *He that saith he is in the light, and hateth his brother, is in darkness even until now. He that loveth his brother abideth in the light, and there is none occasion of stumbling in him. But he that hateth his brother is in darkness, and walketh in darkness, and knoweth not whither he goeth, because that darkness hath blinded his eyes* (1 John 2:9-11). This is the old commandment of Leviticus carried straight into the test: *Thou shalt not hate thy brother in thine heart* (Leviticus 19:17), and *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). To hate the brother is to transgress the Torah and walk in darkness; to love him is to keep the Torah and abide in light. The Psalmist welds the love of the law to the unstumbling walk: *Great peace have they which love thy law: and nothing shall offend them* (Psalm 119:165) — *none occasion of stumbling* is the great peace of the Torah-lover. And the picture of the two ways is Solomon''s: *the path of the just is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18), while *the way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:19). The brother-lover walks the path of the just in growing light; the brother-hater walks the way of the wicked, blind and stumbling, *knoweth not whither he goeth.* The love commanded in Leviticus is the light; its breach is the darkness.',
       sv.verse_id, ev.verse_id, 'free', 10039
  FROM _s242_j242c2_lookup sv, _s242_j242c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-2-love-not-the-world-genesis-3-proverbs-27',
       E'Love not the world: the lust of the flesh, the eyes, and the pride of life (Genesis 3, Proverbs 27)',
       E'*Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him. For all that is in the world, the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world* (1 John 2:15-16). The threefold lust John names is the very pattern of the first sin in the garden: *And when the woman saw that the tree was good for food* — the lust of the flesh — *and that it was pleasant to the eyes* — the lust of the eyes — *and a tree to be desired to make one wise* — the pride of life — *she took of the fruit thereof, and did eat* (Genesis 3:6). The love of the world is the love that took the forbidden fruit; the world offers what Eden offered, and it is *not of the Father.* And the world''s craving can never be filled, for *Hell and destruction are never full; so the eyes of man are never satisfied* (Proverbs 27:20) — the lust of the eyes is a bottomless pit. Yet *the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever* (1 John 2:17). The one who keeps the commandment abides; the one who loves the never-satisfying world passes away with it.',
       sv.verse_id, ev.verse_id, 'free', 10042
  FROM _s242_j242c2_lookup sv, _s242_j242c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-2-many-antichrists-he-that-denieth-the-messiah-is-a-liar-daniel-7-11',
       E'Many antichrists: he that denieth that Yahusha is the Messiah is a liar (Daniel 7, 11)',
       E'*Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time* (1 John 2:18); *Who is a liar but he that denieth that Yahusha (Jesus) is the Messiah (Christ)? He is antichrist, that denieth the Father and the Son* (1 John 2:22). The antichrist John names is no new figure; it is the spirit of the Danielic adversary, already abroad in many guises. Daniel saw the little horn that *shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws* (Daniel 7:25) — the power that opposes the most High and would change His times and His law. And he saw the wilful king who *shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36). The liar who denies that Yahusha (Jesus) is the Messiah, denying the Father and the Son, is of one spirit with that self-exalting adversary — the antichrist whose coming was foretold and whose end is determined and sure. The many antichrists of John''s last time are the Danielic spirit at work, opposing the most High and His anointed.',
       sv.verse_id, ev.verse_id, 'free', 10045
  FROM _s242_j242c2_lookup sv, _s242_j242c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=2 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 11:1 — *thou shalt love Yahuah Elohayka (the LORD thy God), and keep his charge, and his statutes, and his judgments, and his commandments, alway* love and commandment-keeping welded into one; *hereby we do know that we know him, if we keep his commandments* (1 John 2:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 11:22 — *to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him* cleaving = keeping; the Torah''s nearness is John''s test exactly (1 John 2:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:16 — *to keep his commandments and his statutes and his judgments, that thou mayest live* the keeping is the mark of those who love and live; *He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:20 — *that thou mayest love Yahuah... and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life* love = obey + cleave; the liar severs the knowing from the obeying (1 John 2:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 2:15 — *they that fear Yahuah (God) will not disobey his Word; and they that love him will keep his ways* the library''s wisdom-tongue rendering of the same test; love proven by keeping (1 John 2:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'John 14:15 — *If ye love me, keep my commandments* the Formed One''s own master filter; love IS the keeping (1 John 2:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'John 15:10 — *If ye keep my commandments, ye shall abide in my love; even as I have kept my Father''s commandments* his commandments are the Father''s, the Torah; the liar refuses the keeping (1 John 2:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-hereby-we-know-that-we-know-him-if-we-keep-his-commandments-deuteronomy-11-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-2-whoso-keepeth-his-word-the-love-of-elohim-perfected-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* the word given to be kept; *whoso keepeth his word, in him verily is the love of Elohim (God) perfected* (1 John 2:5).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-whoso-keepeth-his-word-the-love-of-elohim-perfected-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 11:22 — *to walk in all his ways, and to cleave unto him* the walk of the covenant; *He that saith he abideth in him ought himself also so to walk, even as he walked* (1 John 2:6).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-whoso-keepeth-his-word-the-love-of-elohim-perfected-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* the Shema''s great commandment from of old; *an old commandment which ye had from the beginning* (1 John 2:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:6 — *these words, which I command thee this day, shall be in thine heart* the word heard and kept from the beginning; *The old commandment is the word which ye have heard from the beginning* (1 John 2:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the old love-command sealed with the Name; the ancient word John names, not a new law (1 John 2:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 13:34 — *A new commandment I give unto you, That ye love one another; as I have loved you* the newness is fresh shining, not a new law; *the darkness is past, and the true light now shineth* (1 John 2:8).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 John 5 — *not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another* the twin letter''s plainest denial of any new law (1 John 2:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-an-old-commandment-from-the-beginning-deuteronomy-6-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart* the Torah forbids the hatred that John makes the mark of darkness; *hateth his brother, is in darkness even until now* (1 John 2:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the love-command kept = abiding in the light; *He that loveth his brother abideth in the light* (1 John 2:10).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:165 — *Great peace have they which love thy law: and nothing shall offend them* love of the law = no stumbling; *there is none occasion of stumbling in him* (1 John 2:10).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=165
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 4:18 — *the path of the just is as the shining light, that shineth more and more unto the perfect day* the brother-lover walks the path of the just in growing light (1 John 2:10).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 4:19 — *The way of the wicked is as darkness: they know not at what they stumble* the brother-hater walks the way of the wicked, blind; *knoweth not whither he goeth, because that darkness hath blinded his eyes* (1 John 2:11).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-he-that-loveth-his-brother-abideth-in-the-light-leviticus-19-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-2-love-not-the-world-genesis-3-proverbs-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:6 — *good for food... pleasant to the eyes... a tree to be desired to make one wise* the threefold lust of Eden; *the lust of the flesh, and the lust of the eyes, and the pride of life* (1 John 2:16).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-love-not-the-world-genesis-3-proverbs-27'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 27:20 — *Hell and destruction are never full; so the eyes of man are never satisfied* the lust of the eyes a bottomless pit; the world the never-satisfying craving John forbids (1 John 2:16).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-love-not-the-world-genesis-3-proverbs-27'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-2-many-antichrists-he-that-denieth-the-messiah-is-a-liar-daniel-7-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:25 — *speak great words against the El Elyon (most High)... and think to change times and laws* the little horn against the most High; the antichrist spirit already abroad (1 John 2:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-many-antichrists-he-that-denieth-the-messiah-is-a-liar-daniel-7-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:36 — *he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* the self-exalting king; one spirit with the liar that denies the Father and the Son (1 John 2:22).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c2_lookup sv, _s242_j242c2_lookup tv
 WHERE t.slug='1-john-2-many-antichrists-he-that-denieth-the-messiah-is-a-liar-daniel-7-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1john_03.sql (S242 1 John 3) -----
-- =====================================================================
-- S242 minion — 1 JOHN 3 (Yochanan Aleph) FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 JOHN 3 (24 verses) — contains ★★★ 3:4 the ANTI-ANTINOMIAN ANCHOR.
-- Tag: j242c3 (temp view _s242_j242c3_lookup).
-- Sort band: floor 10060, step 3 (10060, 10063, 10066, 10069, 10072, 10075, 10078).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: 1 John is the test-of-knowing-Him letter, and the test is keeping His
-- commandments. Chapter 3 carries the apostle's own DEFINITION of sin — *sin is the transgression
-- of the law* (3:4) — the anti-antinomian anchor: if the Torah were abolished sin itself would be
-- undefinable, but John defines sin AS law-breaking. The chapter also sets the children of Elohim
-- against the children of the devil by the test of righteousness and brotherly love: Cain who slew
-- his brother (3:11-12, Genesis 4) is the type of the wicked one's seed; hating a brother is murder
-- (3:15, Leviticus 19:17 / Genesis 9:6); love is not word but deed and truth (3:18, the Torah's own
-- open-thine-hand commandment); and we receive what we ask because we KEEP His commandments
-- (3:22-24, Deuteronomy 28). The Torah is the measuring-line throughout.
--
-- ===== 1 John 3 coverage checklist =====
--   v.4  Tanakh: Psalm 119:142 (thy law is the truth), Daniel 9:11 (transgressed thy law)
--        Extras: none warranted   NT: Romans 7:7 (I had not known sin but by the law), Romans 4:15 (where no law is, no transgression)
--   v.9  Tanakh: Genesis 1:11-12 (whose seed is in itself, after his kind)
--        Extras: none warranted   NT: none warranted (the seed-after-his-kind root carries it)
--   v.11-12 Tanakh: Genesis 4:1-2,8,10 (Cain slew Abel; thy brother's blood crieth from the ground)
--        Extras: Wisdom of Solomon 10:3 (the unrighteous... murdered his brother), Jubilees 4:1-4 (Cain slew Abel; his blood cried from the ground)
--        NT: John 8:44 (your father the devil, a murderer from the beginning), Jude 11 (the way of Cain)
--   v.15 Tanakh: Leviticus 19:17 (thou shalt not hate thy brother in thine heart), Genesis 9:6 (whoso sheddeth man's blood)
--        Extras: none warranted   NT: none warranted (the Torah root carries it)
--   v.18 Tanakh: Proverbs 3:27-28 (withhold not good), Isaiah 58:7 (deal thy bread to the hungry), Deuteronomy 15:7-8,11 (open thine hand wide to thy poor brother)
--        Extras: none warranted   NT: none warranted
--   v.22-24 Tanakh: Deuteronomy 28:1-2 (if thou hearken... all these blessings shall overtake thee), Psalm 145:18-19 (nigh unto all that call... will fulfil the desire of them that fear him)
--        Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9     [Tanakh + NT]  10060
--   1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1         [Tanakh]       10063
--   1-john-3-not-as-cain-who-slew-his-brother-genesis-4                 [Tanakh+extras+NT] 10066
--   1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9  [Tanakh] 10069
--   1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58  [Tanakh] 10072
--   1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145    [Tanakh] 10075
-- =====================================================================

-- ----- temp view -----
CREATE TEMP VIEW _s242_j242c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----- cross_references -----
INSERT INTO cross_references (source_verse_id, target_verse_id, tier_required, note, source)
SELECT sv.verse_id, tv.verse_id, i.tier::content_tier, i.note, 'manual'
  FROM (VALUES
    -- 3:4 sin is the transgression of the law
    ('canon','1-john',3,4,'canon','psalms',119,142,'free',
      E'*Thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142). The apostle''s definition — *sin is the transgression of the law* (1 John 3:4) — stands on this: the Torah is the truth and the everlasting measure, so its violation is exactly what sin is.'),
    ('canon','1-john',3,4,'canon','daniel',9,11,'free',
      E'*Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us* (Daniel 9:11). Daniel names sin in the same terms John does — to sin is to have *transgressed thy law*; *sin is the transgression of the law* (1 John 3:4).'),
    ('canon','1-john',3,4,'canon','romans',7,7,'free',
      E'*Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). Paul says the very same thing John does: sin is known only by the law, for *sin is the transgression of the law* (1 John 3:4) — the Torah is what defines it.'),
    ('canon','1-john',3,4,'canon','romans',4,15,'free',
      E'*Because the law worketh wrath: for where no law is, there is no transgression* (Romans 4:15). The corollary of John''s definition: if the law were abolished there would be no transgression and so no sin to name; but John defines *sin is the transgression of the law* (1 John 3:4), and so the law still stands.'),
    -- 3:9 born of Elohim, his seed remaineth
    ('canon','1-john',3,9,'canon','genesis',1,11,'free',
      E'*And Elohim (God) said, Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself, upon the earth: and it was so* (Genesis 1:11). The Father''s seed is in itself and brings forth after his kind from the beginning — so John can say of the one born of Elohim that *his seed remaineth in him: and he cannot sin, because he is born of Elohim* (1 John 3:9).'),
    ('canon','1-john',3,9,'canon','genesis',1,12,'free',
      E'*And the earth brought forth grass, and herb yielding seed after his kind, and the tree yielding fruit, whose seed was in itself, after his kind: and Elohim (God) saw that it was good* (Genesis 1:12). The seed reproduces only after its kind — the creation-law John draws on: the one *born of Elohim (God) doth not commit sin; for his seed remaineth in him* (1 John 3:9), bearing the Father''s righteous kind.'),
    -- 3:11-12 not as Cain
    ('canon','1-john',3,12,'canon','genesis',4,1,'free',
      E'*And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD)* (Genesis 4:1). This is the Cain John names — *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12) — the firstborn of Adam whose works became evil.'),
    ('canon','1-john',3,12,'canon','genesis',4,2,'free',
      E'*And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground* (Genesis 4:2). Abel is the righteous brother whose blood Cain shed; *wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','genesis',4,8,'free',
      E'*And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him* (Genesis 4:8). This is the slaying John points to — *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','genesis',4,10,'free',
      E'*And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The blood that cried out is the testimony of the first murder; John holds it up as the type of the world that hates the righteous — *Not as Cain... and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'apocrypha','the-wisdom-of-solomon',10,3,'extras',
      E'*But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3). The Hebrew library remembered Cain the same way John does — the unrighteous man who in his anger *murdered his brother*; *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'jubilees','jubilees',4,2,'extras',
      E'*And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2). Jubilees names the cause John names — the offering rejected, the works evil; *Because his own works were evil, and his brother''s righteous* (1 John 3:12).'),
    ('canon','1-john',3,12,'jubilees','jubilees',4,3,'extras',
      E'*And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him* (Jubilees 4:3). The library carries Genesis'' crying blood forward; the slain brother''s blood cried out — the murder John sets as the world''s pattern, *Not as Cain... and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','john',8,44,'free',
      E'*Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning... When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The Gospel twin: the murderer from the beginning is the wicked one whose child Cain was; *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    ('canon','1-john',3,12,'canon','jude',1,11,'free',
      E'*Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 11). Jude names *the way of Cain* as the path of the lost, exactly as John holds Cain up as the type to flee — *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'),
    -- 3:15 hateth his brother is a murderer
    ('canon','1-john',3,15,'canon','leviticus',19,17,'free',
      E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The Torah forbids the hatred John equates with murder; *Whosoever hateth his brother is a murderer* (1 John 3:15) — the apostle reads the heart-hatred Leviticus names as already the act.'),
    ('canon','1-john',3,15,'canon','genesis',9,6,'free',
      E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). Murder is the crime against the image of Elohim from of old; John presses it inward — *Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him* (1 John 3:15).'),
    -- 3:18 love in deed and truth
    ('canon','1-john',3,18,'canon','deuteronomy',15,7,'free',
      E'*If there be among you a poor man of one of thy brethren within any of thy gates... thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). John''s rebuke — he who *shutteth up his bowels of compassion* from a needy brother (1 John 3:17) — is Moses'' shut hand and hardened heart; love is *in deed and in truth* (1 John 3:18), the open hand the Torah commands.'),
    ('canon','1-john',3,18,'canon','deuteronomy',15,8,'free',
      E'*But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth* (Deuteronomy 15:8). The opened hand is love made deed; *let us not love in word, neither in tongue; but in deed and in truth* (1 John 3:18).'),
    ('canon','1-john',3,18,'canon','deuteronomy',15,11,'free',
      E'*For the poor shall never cease out of the land: therefore I command thee... Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The Torah commands love that acts toward the needy brother — the very love John demands *in deed and in truth* (1 John 3:18).'),
    ('canon','1-john',3,18,'canon','isaiah',58,7,'free',
      E'*Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). The fast Yahuah chose is love enacted toward a brother in need — not love in word but *in deed and in truth* (1 John 3:18).'),
    ('canon','1-john',3,18,'canon','proverbs',3,27,'free',
      E'*Withhold not good from them to whom it is due, when it is in the power of thine hand to do it* (Proverbs 3:27). When it is in thy hand to do good, do it — not love in word but in deed; *let us not love in word, neither in tongue; but in deed and in truth* (1 John 3:18).'),
    -- 3:22-24 we receive because we keep his commandments
    ('canon','1-john',3,22,'canon','deuteronomy',28,1,'free',
      E'*And it shall come to pass, if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth* (Deuteronomy 28:1). The blessing follows the kept commandment, as John says — *whatsoever we ask, we receive of him, because we keep his commandments* (1 John 3:22).'),
    ('canon','1-john',3,22,'canon','deuteronomy',28,2,'free',
      E'*And all these blessings shall come on thee, and overtake thee, if thou shalt hearken unto the voice of Yahuah Elohayka (the LORD thy God)* (Deuteronomy 28:2). The blessings overtake the obedient; John''s answered prayer rests on the same hinge — *we receive of him, because we keep his commandments, and do those things that are pleasing in his sight* (1 John 3:22).'),
    ('canon','1-john',3,22,'canon','psalms',145,18,'free',
      E'*Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* (Psalm 145:18). He is near to the one who calls in truth and keeps His way; *he that keepeth his commandments dwelleth in him, and he in him* (1 John 3:24).'),
    ('canon','1-john',3,22,'canon','psalms',145,19,'free',
      E'*He will fulfil the desire of them that fear him: he also will hear their cry, and will save them* (Psalm 145:19). The fearers who keep His commandments have their desire fulfilled — *whatsoever we ask, we receive of him, because we keep his commandments* (1 John 3:22).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s242_j242c3_lookup sv
    ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c3_lookup tv
    ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9',
       E'Sin is the transgression of the law (Psalm 119, Daniel 9)',
       E'Here the apostle gives the plainest definition of sin in all the New Testament, and it is the Torah: *Whosoever committeth sin transgresseth also the law: for sin is the transgression of the law* (1 John 3:4). To sin is to break the law — *hē anomia,* lawlessness. This is not a vague new-covenant feeling of wrongness; it is measured against the commandment, for *thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142). The Torah is the truth and the everlasting measure, so its violation is exactly what sin is. Daniel confessed in the same terms: *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us* (Daniel 9:11) — to sin is to have transgressed the law. Paul says it no differently: *I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7) — sin is known only by the law that names it. And the corollary closes the door on antinomianism: *for where no law is, there is no transgression* (Romans 4:15). If the Torah were abolished, there would be no transgression and so no sin left to define — but John defines sin AS law-breaking, which means the law still stands as the measuring-line of righteousness. This is the anti-antinomian anchor of the whole library set in apostolic ink: the Torah still defines what sin is, and the one born of Elohim is the one who does not transgress it.',
       sv.verse_id, ev.verse_id, 'free', 10060
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1',
       E'Born of Elohim, his seed remaineth in him (Genesis 1)',
       E'*Whosoever is born of Elohim (God) doth not commit sin; for his seed remaineth in him: and he cannot sin, because he is born of Elohim (God)* (1 John 3:9). John reaches back to the creation-law of the seed: *Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself* (Genesis 1:11), *and the earth brought forth... whose seed was in itself, after his kind: and Elohim (God) saw that it was good* (Genesis 1:12). The seed reproduces only after its kind — the Father''s righteous kind in the one begotten of Him. The one born of Elohim cannot make a practice of sin, because the abiding seed bears the Father''s nature, even as the herb brings forth after its kind from the beginning. The new birth is not lawlessness loosed but the Father''s own righteous seed remaining and bearing its kind.',
       sv.verse_id, ev.verse_id, 'free', 10063
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-not-as-cain-who-slew-his-brother-genesis-4',
       E'Not as Cain, who slew his brother (Genesis 4)',
       E'*For this is the message that ye heard from the beginning, that we should love one another. Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:11-12). John holds up the first murder as the type of the world that hates the righteous. The whole library keeps the account. Genesis tells it: *And Adam knew Eve his wife; and she conceived, and bare Cain* (Genesis 4:1); *and she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground* (Genesis 4:2); *and Cain talked with Abel his brother... and slew him* (Genesis 4:8); and the cry that John''s readers heard echoed in their own day — *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The Hebrew library remembered him the same way: *but when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3); and Jubilees names the cause John names — *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2), *and he slew him in the field: and his blood cried from the ground to heaven* (Jubilees 4:3). The works were evil, the brother''s righteous — that is why he slew him. And the Gospel names the father behind the deed: *Ye are of your father the devil... He was a murderer from the beginning* (John 8:44) — Cain *was of that wicked one.* Jude seals it: *Woe unto them! for they have gone in the way of Cain* (Jude 11). The world that hates the children of Elohim walks the way of Cain; the children of Elohim are known by the opposite — they love one another in deed, the message heard from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 10066
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9',
       E'Whosoever hateth his brother is a murderer (Leviticus 19, Genesis 9)',
       E'*Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him* (1 John 3:15). John reads the heart, and the Torah already forbade the hatred there: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The hatred Leviticus names in the heart John names as already murder — the inward root of the outward crime. And murder itself is the ancient crime against the image of Elohim: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). To hate a brother is to assail the image of Elohim in him; the one who does so has no eternal life abiding in him, for he has set himself against the very commandment that is the measuring-line of fellowship.',
       sv.verse_id, ev.verse_id, 'free', 10069
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58',
       E'Let us love not in word but in deed and in truth (Deuteronomy 15, Isaiah 58)',
       E'*But whoso hath this world''s good, and seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him? My little children, let us not love in word, neither in tongue; but in deed and in truth* (1 John 3:17-18). The love John demands is the open hand the Torah commanded. Moses set it plainly: *If there be among you a poor man of one of thy brethren... thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7) — the very shut hand and hardened heart John rebukes — *but thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need* (Deuteronomy 15:8), *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* (Deuteronomy 15:11). Isaiah named the fast Yahuah chose in the same deeds: *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). And the wise man said, *Withhold not good from them to whom it is due, when it is in the power of thine hand to do it* (Proverbs 3:27). Love that is only word and tongue is no love; the love that proves the children of Elohim is love enacted toward the brother in need — the Torah''s open hand made deed and truth.',
       sv.verse_id, ev.verse_id, 'free', 10072
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145',
       E'We receive because we keep his commandments (Deuteronomy 28, Psalm 145)',
       E'*And whatsoever we ask, we receive of him, because we keep his commandments, and do those things that are pleasing in his sight... And he that keepeth his commandments dwelleth in him, and he in him* (1 John 3:22,24). Answered prayer and abiding fellowship hang on the kept commandment — the Torah''s own hinge. Moses set the blessing after obedience: *if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth* (Deuteronomy 28:1), *And all these blessings shall come on thee, and overtake thee, if thou shalt hearken* (Deuteronomy 28:2). The Psalm names the nearness John promises: *Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* (Psalm 145:18), *He will fulfil the desire of them that fear him: he also will hear their cry, and will save them* (Psalm 145:19). The one who fears Him and keeps His commandments has the answered prayer, the fulfilled desire, the abiding presence. John does not loose obedience from blessing — he welds them, exactly as the Torah does.',
       sv.verse_id, ev.verse_id, 'free', 10075
  FROM _s242_j242c3_lookup sv, _s242_j242c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 119:142 — *thy righteousness is an everlasting righteousness, and thy law is the truth* the Torah is the truth and the everlasting measure; *sin is the transgression of the law* (1 John 3:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=142
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:11 — *all Yashar''el (Israel) have transgressed thy law... therefore the curse is poured upon us* Daniel names sin as transgressing the law; *sin is the transgression of the law* (1 John 3:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 7:7 — *I had not known sin, but by the law... except the law had said, Thou shalt not covet* sin is known only by the law that names it; *sin is the transgression of the law* (1 John 3:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:15 — *where no law is, there is no transgression* if the law were abolished no transgression could be named; but *sin is the transgression of the law* (1 John 3:4), so the law stands.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-sin-is-the-transgression-of-the-law-psalm-119-daniel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:11 — *the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself* the creation-law of the seed after its kind; *his seed remaineth in him: and he cannot sin, because he is born of Elohim* (1 John 3:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:12 — *whose seed was in itself, after his kind: and Elohim (God) saw that it was good* the seed reproduces only after its kind; the one born of Elohim bears the Father''s righteous kind (1 John 3:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-born-of-elohim-his-seed-remaineth-in-him-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-not-as-cain-who-slew-his-brother-genesis-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:1 — *she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD)* the firstborn of Adam John names; *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:2 — *Abel was a keeper of sheep, but Cain was a tiller of the ground* the righteous brother whose blood was shed; *Because his own works were evil, and his brother''s righteous* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:8 — *Cain rose up against Abel his brother, and slew him* the slaying John points to; *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:10 — *the voice of thy brother''s blood crieth unto me from the ground* the cry of the first murder, type of the world that hates the righteous (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 10:3 — *the unrighteous went away from her in his anger... the fury with which he murdered his brother* the Hebrew library''s memory of Cain; *Not as Cain... and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 4:2 — *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* the rejected offering, the evil works; *Because his own works were evil, and his brother''s righteous* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Jubilees 4:3 — *he slew him in the field: and his blood cried from the ground to heaven* the library carries Genesis'' crying blood forward (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'John 8:44 — *Ye are of your father the devil... He was a murderer from the beginning* the wicked one whose child Cain was; *Cain, who was of that wicked one, and slew his brother* (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Jude 11 — *they have gone in the way of Cain* Jude names the way of Cain as the path of the lost, the type John bids us flee (1 John 3:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-not-as-cain-who-slew-his-brother-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart* the Torah forbids the heart-hatred John reads as already murder; *Whosoever hateth his brother is a murderer* (1 John 3:15).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* murder is the crime against the image of Elohim; to hate a brother is to assail it (1 John 3:15).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-whosoever-hateth-his-brother-is-a-murderer-leviticus-19-genesis-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:7 — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* the very shut hand John rebukes; *let us not love in word... but in deed and in truth* (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:8 — *thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need* the opened hand is love made deed (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 15:11 — *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* the Torah commands love that acts toward the needy brother (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 58:7 — *deal thy bread to the hungry... when thou seest the naked, that thou cover him* the fast Yahuah chose is love enacted toward a brother in need; *in deed and in truth* (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 3:27 — *Withhold not good from them to whom it is due, when it is in the power of thine hand to do it* when it is in thy hand to do good, do it — not love in word (1 John 3:18).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-let-us-love-not-in-word-but-in-deed-and-truth-deuteronomy-15-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 28:1 — *if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments* the blessing follows the kept commandment; *we receive of him, because we keep his commandments* (1 John 3:22).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:2 — *all these blessings shall come on thee, and overtake thee, if thou shalt hearken* the blessings overtake the obedient; the same hinge of answered prayer (1 John 3:22).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 145:18 — *Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* the nearness John promises to the commandment-keeper; *he that keepeth his commandments dwelleth in him* (1 John 3:24).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 145:19 — *He will fulfil the desire of them that fear him: he also will hear their cry, and will save them* the fearers who keep His commandments have their desire fulfilled; *whatsoever we ask, we receive of him* (1 John 3:22).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c3_lookup sv, _s242_j242c3_lookup tv
 WHERE t.slug='1-john-3-we-receive-because-we-keep-his-commandments-deuteronomy-28-psalm-145'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1john_04.sql (S242 1 John 4) -----
-- =====================================================================
-- S242 minion — 1 JOHN 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 JOHN 4 (21 verses) — try the spirits / Elohim is love / the Father sent the Son.
-- Tag: j242c4 (temp view _s242_j242c4_lookup).
-- Sort band: floor 10090, step 3 (10090, 10093, 10096, 10099, 10102 used; under 10120).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 John = the test-of-knowing-Him letter; the test is keeping His commandments).
-- Chapter 4 sets the test of the spirits and the test of love side by side. The discerning of spirits
-- is the Torah's own test of the prophet (Deuteronomy 13 / 18; Isaiah 8:20 *to the law and to the
-- testimony*) — the spirit that confesses Yahusha (Jesus) come in the flesh stands the test; the spirit
-- of antichrist fails it. And love itself is *of Elohim (God)* — the Torah's *thou shalt love thy
-- neighbour as thyself* (Leviticus 19:18) and *thou shalt love Yahuah Elohayka with all thine heart*
-- (Deuteronomy 6:5). Christology held at the Father-is-the-source key: *Elohim (God) sent his only
-- begotten Son into the world* (4:9), *the Father sent the Son to be the Saviour of the world* (4:14) —
-- the Father is the sender and the source, the Son the one sent and begotten; no co-equal-persons
-- grammar, no modalist collapse. And the order of love is fixed: *We love him, because he first loved
-- us* (4:19) — Yahuah's covenant love precedes ours, *because Yahuah (LORD) loved you* (Deuteronomy 7:8).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   try the spirits / the spirit that confesseth not Yahusha come in flesh is antichrist
--           Tanakh: Deuteronomy 13:1-5 (try the prophet/dreamer), Deuteronomy 18:20-22 (the prophet
--                   who presumes), Isaiah 8:20 (to the law and to the testimony)
--           Extras: none warranted   NT: none warranted (the Torah test is the root)
--   v.7-8,11-12 beloved let us love one another, for love is of Elohim; Elohim is love
--           Tanakh: Leviticus 19:18 (love thy neighbour as thyself), Deuteronomy 6:5 (love Yahuah with
--                   all thine heart)
--           Extras: Sirach 2:15-16 (they that love him will keep his ways / be filled with the law)
--           NT: none warranted (carried in prose)
--   v.9-10,14 Elohim sent his only begotten Son / the Father sent the Son to be the Saviour
--           Tanakh: Isaiah 43:11 (beside me there is no saviour), Psalm 2:7 (Thou art my Son; this day
--                   have I begotten thee)
--           Extras: none warranted   NT: none warranted (the Father-the-sender Christology in prose)
--   v.19    we love him, because he first loved us
--           Tanakh: Deuteronomy 7:7-8 (because Yahuah loved you), Jeremiah 31:3 (I have loved thee
--                   with an everlasting love)
--           Extras: none warranted   NT: none warranted
--   v.20-21 if a man say I love Elohim and hateth his brother he is a liar; this commandment
--           Tanakh: Leviticus 19:17-18 (thou shalt not hate thy brother... love thy neighbour)
--           Extras: none warranted   NT: none warranted (the commandment is the Torah's)
--
-- THREADS (slug -> target libraries):
--   10090 1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8   (Tanakh)
--   10093 1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6  (Tanakh + Extras)
--   10096 1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2  (Tanakh)
--   10099 1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31  (Tanakh)
--   10102 1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s242_j242c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8
  ('canon', '1-john', 4, 1, 'canon', 'deuteronomy', 13, 3, 'free', E'*Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul.* (Deuteronomy 13:3). The Torah is the original test of the spirits: even a prophet who gives a sign that comes to pass is to be tried, and not hearkened to if he turns the heart after other gods. John gives the same charge — *believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world* (1 John 4:1). The measuring-line of discernment is not the wonder but fidelity to Yahuah (LORD); the apostle hands the assemblies the prophet-test Moses gave Yashar''el (Israel).'),
  ('canon', '1-john', 4, 1, 'canon', 'deuteronomy', 13, 5, 'free', E'*And that prophet, or that dreamer of dreams, shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt, and redeemed you out of the house of bondage, to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in. So shalt thou put the evil away from the midst of thee.* (Deuteronomy 13:5). The false prophet is judged because he seeks *to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in.* John''s *many false prophets are gone out into the world* (1 John 4:1) are the same breed under apostolic ink: the spirit that draws away from the way Yahuah (LORD) commanded is the spirit to be refused, tried by the Torah and found wanting.'),
  ('canon', '1-john', 4, 3, 'canon', 'deuteronomy', 18, 20, 'free', E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak, or that shall speak in the name of other gods, even that prophet shall die.* (Deuteronomy 18:20). The Torah names the presumptuous prophet who speaks what Yahuah (LORD) has not commanded. The spirit of antichrist is that voice grown to its fulness — *every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist* (1 John 4:3). The Torah''s test of the presuming prophet is the seed of John''s test of the lying spirit: what it confesses, and whether it speaks according to Yahuah (LORD)''s own word, exposes it.'),
  ('canon', '1-john', 4, 3, 'canon', 'deuteronomy', 18, 22, 'free', E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* (Deuteronomy 18:22). Moses gives a plain test for the spirit behind the prophet, and a plain comfort — *thou shalt not be afraid of him.* John gives the assemblies the same confidence over against the spirit of antichrist: *ye are of Elohim (God), little children, and have overcome them: because greater is he that is in you, than he that is in the world* (1 John 4:4). The Torah''s rule that the failing word unmasks the false prophet stands behind the apostle''s assurance that the tried-and-overcome spirit need not be feared.'),
  ('canon', '1-john', 4, 6, 'canon', 'isaiah', 8, 20, 'free', E'*To the law and to the testimony: if they speak not according to this word, it is because there is no light in them.* (Isaiah 8:20). Isaiah sets the standard of all discernment: every voice is brought *to the law and to the testimony,* and the voice that does not speak according to that word has no light. This is John''s very rule — *Hereby know we the spirit of truth, and the spirit of error* (1 John 4:6): the spirit of truth speaks according to the word, and the spirit of error does not. The apostle''s spirit-of-truth versus spirit-of-error is Isaiah''s law-and-testimony test carried into the assemblies.'),
  -- thread: 1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6
  ('canon', '1-john', 4, 7, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The command John calls the whole assembly back to — *Beloved, let us love one another: for love is of Elohim (God)* (1 John 4:7) — is the old commandment of the Torah, *thou shalt love thy neighbour as thyself.* Love is *of Elohim (God)* because Yahuah (LORD) spoke it from of old and sealed it with his own name; the apostle does not invent a new sentiment but presses the very statute Moses delivered, the love that is the keeping of the commandment.'),
  ('canon', '1-john', 4, 8, 'canon', 'deuteronomy', 6, 5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The Shema commands the love of Yahuah (LORD) with the whole heart — and John makes that love the very proof of knowing Him: *He that loveth not knoweth not Elohim (God); for Elohim (God) is love* (1 John 4:8). The one who does not love does not know the Elohim (God) whose own first commandment is love; the love John names is not a feeling severed from the Torah but the heart-love of Deuteronomy 6, the love that is owed first to Yahuah (LORD) and then to the brother made in His likeness.'),
  ('canon', '1-john', 4, 12, 'canon', 'deuteronomy', 6, 5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The invisible Elohim (God) is known and indwelt through love: *No man hath seen Elohim (God) at any time. If we love one another, Elohim (God) dwelleth in us, and his love is perfected in us* (1 John 4:12). The whole-hearted love commanded in the Shema is the very love by which Yahuah (LORD) is said to dwell in His people; the love-command of Deuteronomy 6 is not abolished but brought to its perfecting in the assembly that loves one another.'),
  ('canon', '1-john', 4, 7, 'apocrypha', 'ecclesiasticus', 2, 16, 'extras', E'*They that fear Yahuah (God) will seek that which is well, pleasing to him; and they that love him shall be filled with the law.* (Sirach 2:16). The Hebrew library binds the love of Yahuah (God) to the law as tightly as John binds love to the knowing of Elohim (God): *every one that loveth is born of Elohim (God), and knoweth Elohim (God)* (1 John 4:7). They that love Him *shall be filled with the law* — love and Torah are one motion, not two. The apostle''s *love is of Elohim (God)* re-speaks the wisdom of the fathers: the one who loves is the one filled with the law, born of and knowing the Elohim (God) who is love.'),
  -- thread: 1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2
  ('canon', '1-john', 4, 14, 'canon', 'isaiah', 43, 11, 'free', E'*I, even I, am Yahuah (LORD); and beside me there is no saviour.* (Isaiah 43:11). Yahuah (LORD) declares Himself the only Saviour — and John testifies *that the Father sent the Son to be the Saviour of the world* (1 John 4:14). There is no rival deliverer: the salvation of the world is the Father''s own salvation, accomplished through the Son He sent. Keep the order the verse keeps — the Father is the source and the sender, the Son the One sent forth to be the Saviour; the saving that belongs to Yahuah (LORD) alone is wrought by the begotten One the Father commissioned, not by a second who saves apart from Him.'),
  ('canon', '1-john', 4, 9, 'canon', 'isaiah', 43, 11, 'free', E'*I, even I, am Yahuah (LORD); and beside me there is no saviour.* (Isaiah 43:11). *In this was manifested the love of Elohim (God) toward us, because that Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9). The Elohim (God) who alone is Saviour manifests His love by sending — the sending is the Father''s act, the life is given *through him,* the Son. Beside Yahuah (LORD) there is no saviour; therefore the only-begotten sent into the world saves not as a rival but as the One through whom the one Elohim (God) gives life.'),
  ('canon', '1-john', 4, 9, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). The decree of the Father names the Son begotten: *Thou art my Son; this day have I begotten thee.* John speaks of the same begotten One — *Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9). The begetting is the Father''s declaring, the sending is the Father''s act; the Son is the begotten and the sent, not a co-equal who begets Himself. The Psalm''s Father-and-Son decree is the very Christology the apostle carries: the Father the source, the only-begotten the One He sent.'),
  -- thread: 1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31
  ('canon', '1-john', 4, 19, 'canon', 'deuteronomy', 7, 8, 'free', E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8). The redemption from Egypt rested on nothing in Yashar''el (Israel) but on Yahuah (LORD)''s prior love — *because Yahuah (LORD) loved you.* John fixes the same order for the assembly: *We love him, because he first loved us* (1 John 4:19). The love that saves is not earned by the loved but poured out first by the One who loves; the apostle''s *he first loved us* re-speaks the Torah''s reason for the exodus — Yahuah (LORD)''s love precedes and creates the love of His people.'),
  ('canon', '1-john', 4, 19, 'canon', 'deuteronomy', 7, 7, 'free', E'*Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* (Deuteronomy 7:7). Yahuah (LORD) loved and chose Yashar''el (Israel) for no merit of theirs — not for number, not for greatness, but of His own free love. *We love him, because he first loved us* (1 John 4:19): our love is wholly answer, never cause. The Torah''s reason — Yahuah (LORD) set His love freely, before and without any worthiness in the loved — is the ground of the apostle''s order, His love first and ours only because of His.'),
  ('canon', '1-john', 4, 19, 'canon', 'jeremiah', 31, 3, 'free', E'*Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee.* (Jeremiah 31:3). Yahuah (LORD)''s love is the *everlasting love* that draws — He loves first, and the drawing follows. John says no more and no less: *We love him, because he first loved us* (1 John 4:19). The lovingkindness that drew Yashar''el (Israel) is the first-loving the apostle names; our love is the response to a love that reached for us *of old,* an everlasting love that went before.'),
  -- thread: 1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19
  ('canon', '1-john', 4, 20, 'canon', 'leviticus', 19, 17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* (Leviticus 19:17). The Torah forbids the hatred of the brother *in thine heart.* John makes that command the very test of the love of Elohim (God): *If a man say, I love Elohim (God), and hateth his brother, he is a liar: for he that loveth not his brother whom he hath seen, how can he love Elohim (God) whom he hath not seen?* (1 John 4:20). The hatred Leviticus forbids exposes the lie; the claim to love the unseen Elohim (God) is broken by the hatred of the seen brother, for the love of Elohim (God) and the love of the brother are one Torah.'),
  ('canon', '1-john', 4, 21, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). John names the commandment outright: *And this commandment have we from him, That he who loveth Elohim (God) love his brother also* (1 John 4:21). It is no new commandment but the old one Yahuah (LORD) sealed with His name — *thou shalt love thy neighbour as thyself.* The love of Elohim (God) and the love of the brother are bound in a single statute of the Torah; the apostle quotes the Levitical command as the commandment the assembly *have... from him.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s242_j242c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8',
       E'Try the spirits whether they are of Elohim (Deuteronomy 13, 18; Isaiah 8:20)',
       E'John opens the chapter with a charge of discernment: *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world* (1 John 4:1). This is not a new apostolic invention but the Torah''s own test of the prophet handed to the assemblies. Moses commanded that even a prophet or dreamer who gives a sign that comes to pass be tried and refused if he turns the heart away: *Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul* (Deuteronomy 13:3), for he has spoken *to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in* (Deuteronomy 13:5). And Moses gave the test of the presuming prophet and the comfort with it: *the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20), and *when a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass... thou shalt not be afraid of him* (Deuteronomy 18:22). So John, naming the chief mark — *every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist* (1 John 4:3) — gives the same fearless assurance: *ye are of Elohim (God), little children, and have overcome them* (1 John 4:4). The standard of all such trying is Isaiah''s: *To the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:20). The apostle''s own conclusion is that very rule — *Hereby know we the spirit of truth, and the spirit of error* (1 John 4:6): the spirit of truth speaks according to the word, and the spirit of error does not. The discerning of spirits is the law-and-testimony test carried into the assemblies; the spirit is tried by what it confesses and whether it speaks according to Yahuah (LORD)''s own word.',
       sv.verse_id, ev.verse_id, 'free', 10090
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6',
       E'Beloved, let us love one another, for love is of Elohim (Leviticus 19:18, Deuteronomy 6:5)',
       E'*Beloved, let us love one another: for love is of Elohim (God); and every one that loveth is born of Elohim (God), and knoweth Elohim (God). He that loveth not knoweth not Elohim (God); for Elohim (God) is love* (1 John 4:7-8). The love John presses is not a vague sentiment but the old commandment of the Torah. *Love is of Elohim (God)* because Yahuah (LORD) spoke it from of old and sealed it with His own name: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). And it reaches up before it reaches across — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5), the Shema''s first command, the whole-hearted love of Yahuah (LORD) that John makes the very proof of knowing Him: *He that loveth not knoweth not Elohim (God).* The invisible Elohim (God) is known and indwelt through this love — *No man hath seen Elohim (God) at any time. If we love one another, Elohim (God) dwelleth in us, and his love is perfected in us* (1 John 4:12) — the whole-hearted love of the Shema brought to its perfecting in the assembly. The Hebrew library bound love and Torah in one motion: *they that love him shall be filled with the law* (Sirach 2:16). So the apostle does not abolish the love-command but presses it: to love is to keep the statute Moses delivered, to be born of and to know the Elohim (God) who is love.',
       sv.verse_id, ev.verse_id, 'extras', 10093
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2',
       E'The Father sent the Son to be the Saviour of the world (Isaiah 43:11, Psalm 2:7)',
       E'John testifies to the heart of the gospel with the order of Father and Son kept exact: *In this was manifested the love of Elohim (God) toward us, because that Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9), and *we have seen and do testify that the Father sent the Son to be the Saviour of the world* (1 John 4:14). The sending is the Father''s act; the Son is the One sent. And the salvation belongs to Yahuah (LORD) alone — *I, even I, am Yahuah (LORD); and beside me there is no saviour* (Isaiah 43:11). There is no rival deliverer: the saving of the world is the Father''s own salvation, accomplished through the only-begotten He sent, the life given *through him.* The begetting too is the Father''s declaring — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The Son is the begotten and the sent, not a co-equal who begets or saves Himself. Keep the order the apostle keeps: the Father is the source and the sender, the Son the One He commissioned and sent forth to be the Saviour; *that we might live through him* — the life of the one Elohim (God) given through the begotten One.',
       sv.verse_id, ev.verse_id, 'free', 10096
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31',
       E'We love him, because he first loved us (Deuteronomy 7:7-8, Jeremiah 31:3)',
       E'*We love him, because he first loved us* (1 John 4:19). The apostle fixes the order of all covenant love: Yahuah (LORD) loves first, and our love is wholly answer, never cause. This is the Torah''s own reason for the exodus. Yahuah (LORD) loved and chose Yashar''el (Israel) for no merit of theirs — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7) — *but because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand* (Deuteronomy 7:8). The redemption rested on nothing in Yashar''el (Israel) but on Yahuah (LORD)''s prior, free love. And that love is everlasting and drawing: *Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3). The lovingkindness that drew Yashar''el (Israel) of old is the first-loving John names; our love for Him is the response to a love that reached for us before we reached for Him. *He first loved us* re-speaks the Torah and the prophets: His love precedes and creates the love of His people.',
       sv.verse_id, ev.verse_id, 'free', 10099
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19',
       E'If a man say, I love Elohim, and hateth his brother, he is a liar (Leviticus 19:17-18)',
       E'John closes the chapter by welding the love of Elohim (God) to the love of the brother, and naming the breach a lie: *If a man say, I love Elohim (God), and hateth his brother, he is a liar: for he that loveth not his brother whom he hath seen, how can he love Elohim (God) whom he hath not seen?* (1 John 4:20). The hatred he forbids is the very hatred the Torah forbids: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). And the commandment he names is the Levitical command outright: *And this commandment have we from him, That he who loveth Elohim (God) love his brother also* (1 John 4:21) — no new commandment but the old one Yahuah (LORD) sealed with His name, *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The love of Elohim (God) and the love of the brother are bound in a single statute of the Torah; the claim to love the unseen Elohim (God) is exposed as a lie by the hatred of the seen brother, for they are one law. The apostle quotes the Torah as the commandment the assembly *have... from him.*',
       sv.verse_id, ev.verse_id, 'free', 10102
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:3 — *Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah... with all your heart* the Torah''s test of the prophet/dreamer; *try the spirits whether they are of Elohim (God)* (1 John 4:1).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 13:5 — the false prophet seeks *to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in*; the same breed are John''s *many false prophets... gone out into the world* (1 John 4:1).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:20 — *the prophet, which shall presume to speak a word in my name, which I have not commanded... shall die* the seed of John''s test; the spirit that confesseth not is *that spirit of antichrist* (1 John 4:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 18:22 — *if the thing follow not, nor come to pass... thou shalt not be afraid of him* the failing word unmasks the false prophet; behind John''s *ye... have overcome them... greater is he that is in you* (1 John 4:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 8:20 — *To the law and to the testimony: if they speak not according to this word... there is no light in them* the standard of all discernment; John''s *spirit of truth, and the spirit of error* (1 John 4:6).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the old commandment sealed with His name; *let us love one another: for love is of Elohim (God)* (1 John 4:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart* the Shema''s first command, made the proof of knowing Him; *He that loveth not knoweth not Elohim (God); for Elohim (God) is love* (1 John 4:8).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 6:5 — the whole-hearted love of the Shema brought to its perfecting; *If we love one another, Elohim (God) dwelleth in us, and his love is perfected in us* (1 John 4:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 2:16 — *they that love him shall be filled with the law* the Hebrew library binds love and Torah in one motion; *every one that loveth is born of Elohim (God), and knoweth Elohim (God)* (1 John 4:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:11 — *I, even I, am Yahuah (LORD); and beside me there is no saviour* the salvation belongs to Yahuah (LORD) alone; *the Father sent the Son to be the Saviour of the world* (1 John 4:14), the Father the sender.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 43:11 — beside Yahuah (LORD) there is no saviour, so the only-begotten saves not as a rival; *Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* the begetting is the Father''s declaring; *Elohim (God) sent his only begotten Son into the world* (1 John 4:9), the Father the source.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:8 — *because Yahuah (LORD) loved you... hath Yahuah (LORD) brought you out with a mighty hand* the exodus rested on His prior love; *We love him, because he first loved us* (1 John 4:19).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:7 — Yahuah (LORD) loved and chose for no merit, *for ye were the fewest of all people*; our love is wholly answer, *because he first loved us* (1 John 4:19).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:3 — *I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* the love that draws went before; *We love him, because he first loved us* (1 John 4:19).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart* the very hatred that exposes the lie; *If a man say, I love Elohim (God), and hateth his brother, he is a liar* (1 John 4:20).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the old commandment named outright; *this commandment have we from him, That he who loveth Elohim (God) love his brother also* (1 John 4:21).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1john_05.sql (S242 1 John 5) -----
-- =====================================================================
-- S242 minion — 1 JOHN 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 JOHN 5 (21 verses) — the closing chapter: love IS keeping His commandments,
--   the victory of faith, the threefold witness, the Son who is life, the assurance of eternal life.
-- Tag: j242c5 (temp view _s242_j242c5_lookup).
-- Sort band: floor 10120, step 3 (10120, 10123, 10126, 10129, 10132, 10135 used; under 10150).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 John = the test-of-knowing-Him letter; the test is KEEPING HIS COMMANDMENTS;
-- the Torah is the very measuring-line of fellowship, not abolished). Chapter 5 welds love and
-- obedience: *this is the love of Elohim, that we keep his commandments: and his commandments are
-- not grievous* (5:2-3) — John's *not grievous* is Moses' own *it is not too hard for thee... the
-- word is very nigh unto thee* (Deuteronomy 30). The Father is the source and sender; the Son is
-- the one *manifested*, *sent*, in whom is the life the Father gave (5:11). No co-equal-persons
-- grammar, no modalist collapse.
-- ⚠ 5:7-8 (the "Johannine Comma"): the canon pull DOES carry the heaven-witness clause; per the
-- brief I quote ONLY what dump_canon returns and do NOT add any trinitarian gloss in my prose. The
-- witness thread is built on the Torah's own two-or-three-witnesses law (Deuteronomy 19:15) — the
-- framework reading: the record stands established by witnesses, the witness of Elohim concerning
-- His Son. The Comma text is quoted verbatim where it falls, with no interpretive expansion.
--
-- 1 John 5 coverage:
--   v.1   Tanakh: none warranted (born-of-Elohim by believing)  Extras: none warranted  NT: John 1:12-13 (power to become sons of Elohim, believe on his name)
--   v.2-3 Tanakh: Deuteronomy 30:11-14 (commandment not hidden/not far off, the word very nigh), Deuteronomy 10:12-13, Joshua 22:5  Extras: Sirach (Ecclesiasticus) 2:15-16 (they that love him will keep his ways)  NT: John 14:15 (if ye love me, keep my commandments)   [LOAD-BEARING]
--   v.4   Tanakh: Psalm 44:5-7 (through thee will we push down our enemies)  Extras: none warranted  NT: none warranted
--   v.5   Tanakh: none warranted  Extras: none warranted  NT: (folded into v.4 victory thread)
--   v.6-9 Tanakh: Deuteronomy 19:15 (two or three witnesses establish the matter)  Extras: none warranted  NT: none warranted   [⚠ Comma caution]
--   v.10  (folded into witness thread)
--   v.11-12 Tanakh: Deuteronomy 30:15,19-20 (life and death set before thee... he is thy life)  Extras: none warranted  NT: none warranted
--   v.13  Tanakh: Daniel 12:2 (many that sleep shall awake, some to everlasting life)  Extras: none warranted  NT: none warranted
--   v.14-21 Tanakh: none warranted (assurance/prayer/keep from idols)  Extras: none warranted  NT: none warranted
--
-- THREADS (6):
--   1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30  [LOAD-BEARING; Deut 30/10, Joshua 22, John 14, Sirach 2 — extras tier]
--   1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1  [John 1 — free]
--   1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44  [Psalm 44 — free]
--   1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19  [Deut 19 — free; ⚠ Comma quoted verbatim]
--   1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30  [Deut 30 — free]
--   1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12  [Daniel 12 — free]
-- =====================================================================

CREATE TEMP VIEW _s242_j242c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30  [LOAD-BEARING]
  ('canon', '1-john', 5, 3, 'canon', 'deuteronomy', 30, 11, 'free', E'*For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* (Deuteronomy 30:11). When John says *his commandments are not grievous* (1 John 5:3), he speaks Moses'' own verdict on the Torah: the commandment *is not hidden from thee, neither is it far off.* The apostle does not abolish the commandments nor call them a burden too heavy — he names them, as Moses did, as the very thing a man can keep, because Yahuah (LORD) never gave a law beyond the reach of those who love Him.'),
  ('canon', '1-john', 5, 3, 'canon', 'deuteronomy', 30, 14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). The commandment is *very nigh unto thee... that thou mayest do it* — this is exactly why *his commandments are not grievous* (1 John 5:3). The Torah is not in heaven nor beyond the sea but in the mouth and the heart of the one who loves Yahuah (LORD); John''s *not grievous* is Moses'' *thou mayest do it.*'),
  ('canon', '1-john', 5, 2, 'canon', 'deuteronomy', 10, 12, 'free', E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul,* (Deuteronomy 10:12). Moses welds loving Yahuah (LORD) to walking in His ways and keeping His commandments (v.13). John welds the same two: *when we love Elohim (God), and keep his commandments* (1 John 5:2) — love and obedience are one act, as the Torah always taught.'),
  ('canon', '1-john', 5, 3, 'canon', 'joshua', 22, 5, 'free', E'*But take diligent heed to do the commandment and the law, which Moses the servant of Yahuah (LORD) charged you, to love Yahuah Elohaychem (the LORD your God), and to walk in all his ways, and to keep his commandments, and to cleave unto him, and to serve him with all your heart and with all your soul.* (Joshua 22:5). Joshua binds *to love Yahuah* to *keep his commandments* in one breath — the very fusion John makes: *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3). To love Him and to keep His commandments are not two things but one, from Moses to Joshua to the apostle.'),
  ('canon', '1-john', 5, 3, 'canon', 'john', 14, 15, 'free', E'*If ye love me, keep my commandments.* (John 14:15). Yahusha (Jesus) said love is proven in keeping His commandments; John writes the same: *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3). The Gospel twin and the epistle speak one word — love is not a feeling severed from obedience but is itself the keeping of the commandments.'),
  ('canon', '1-john', 5, 3, 'apocrypha', 'ecclesiasticus', 2, 15, 'extras', E'*They that fear Yahuah (God) will not disobey his Word; and they that love him will keep his ways.* (Sirach 2:15). The Hebrew library said it plainly: *they that love him will keep his ways* — and the next verse, *they that love him shall be filled with the law* (Sirach 2:16). This is John''s very welding of love and obedience: *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3). To love Yahuah (LORD) is to keep His ways and be filled with His law; the apostle stands in the same stream as the wisdom of the fathers.'),
  -- thread: 1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1
  ('canon', '1-john', 5, 1, 'canon', 'john', 1, 12, 'free', E'*But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name:* (John 1:12). The Gospel said those who *believe on his name* are given *power to become the sons of Elohim (God),* born *of Elohim (God)* (John 1:13). John''s epistle opens the chapter with the same word: *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God)* (1 John 5:1). Believing that Yahusha (Jesus) is the Messiah is the new birth the Gospel promised; the Father begets, and the believer is born of Him.'),
  -- thread: 1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44
  ('canon', '1-john', 5, 4, 'canon', 'psalms', 44, 5, 'free', E'*Through thee will we push down our enemies: through thy name will we tread them under that rise up against us.* (Psalm 44:5). The psalmist confesses the victory is not in his own arm but in Yahuah (LORD): *I will not trust in my bow, neither shall my sword save me* (Psalm 44:6). John names the same overcoming: *this is the victory that overcometh the world, even our faith* (1 John 5:4). The conquest is by trust in Him, not by the sword of the flesh — the faith of the one *born of Elohim (God)* overcomes the world as the psalmist''s faith pushed down the enemy through the Name.'),
  ('canon', '1-john', 5, 4, 'canon', 'psalms', 44, 7, 'free', E'*But thou hast saved us from our enemies, and hast put them to shame that hated us.* (Psalm 44:7). It is Yahuah (LORD) who *saved us from our enemies* — the victory belongs to Him and is received by faith. So John: *whatsoever is born of Elohim (God) overcometh the world: and this is the victory that overcometh the world, even our faith* (1 John 5:4). The one born of Elohim (God) overcomes not by his own strength but by the faith that lays hold of the One who saves; the psalm and the epistle confess one Deliverer.'),
  -- thread: 1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19  [⚠ Comma quoted verbatim]
  ('canon', '1-john', 5, 9, 'canon', 'deuteronomy', 19, 15, 'free', E'*One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15). The Torah''s law of witnesses requires *two... or... three witnesses* before *the matter shall be established.* John''s testimony is built on that very law: *there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one* (1 John 5:8), so that *the witness of Elohim (God) is greater* (1 John 5:9). The threefold witness meets the Torah''s requirement; the record concerning the Son stands established at the mouth of the witnesses Elohim (God) Himself appointed.'),
  -- thread: 1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30
  ('canon', '1-john', 5, 12, 'canon', 'deuteronomy', 30, 15, 'free', E'*See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15). Moses set before Yashar''el (Israel) *life and good, and death and evil* — a stark either/or. John sets the same before his hearers: *He that hath the Son hath life; and he that hath not the Son of Elohim (God) hath not life* (1 John 5:12). Life or death, with no third way; the choice Moses laid before the people is the choice the apostle lays before every soul, now centered in the Son in whom the Father gave the life.'),
  ('canon', '1-john', 5, 12, 'canon', 'deuteronomy', 30, 19, 'free', E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). *I have set before you life and death... therefore choose life* — and John says where that life is found: *He that hath the Son hath life* (1 John 5:12). To choose life is to have the Son; the Torah''s summons to choose life is answered in the One the Father gave, *and this life is in his Son* (1 John 5:11).'),
  ('canon', '1-john', 5, 11, 'canon', 'deuteronomy', 30, 20, 'free', E'*That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* (Deuteronomy 30:20). Moses says of Yahuah (LORD), *he is thy life, and the length of thy days* — life is found in cleaving to Him. John says the same of the gift the Father gave in the Son: *Elohim (God) hath given to us eternal life, and this life is in his Son* (1 John 5:11). The life that is Yahuah (LORD) Himself in the Torah is the eternal life now given in His Son; the Father remains the source from whom the life flows.'),
  -- thread: 1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12
  ('canon', '1-john', 5, 13, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Daniel was given the promise of *everlasting life* for those that sleep in the dust who shall awake. John writes so the scattered elect may have the assurance of that very life now: *These things have I written unto you that believe on the name of the Son of Elohim (God); that ye may know that ye have eternal life* (1 John 5:13). The everlasting life Daniel saw at the resurrection is the eternal life John says we may KNOW we have, by believing on the name of the Son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s242_j242c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30',
       E'This is the love of Elohim, that we keep his commandments: and they are not grievous (Deuteronomy 30, 10)',
       E'John welds love and obedience into one act and leaves no daylight between them: *By this we know that we love the children of Elohim (God), when we love Elohim (God), and keep his commandments. For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:2-3). The love of Elohim (God) IS the keeping of His commandments — not a sentiment that floats free of obedience, but the very doing of the Torah. And the closing clause, *his commandments are not grievous,* is Moses'' own verdict on that Torah: *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11); *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). John''s *not grievous* is Moses'' *it is not too hard for thee* — the commandment was never a burden beyond reach, but the near word a man who loves Yahuah (LORD) can keep. The Torah itself had already bound loving Him to keeping Him: *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him* (Deuteronomy 10:12), and Joshua charged the same — *to love Yahuah Elohaychem (the LORD your God), and to walk in all his ways, and to keep his commandments, and to cleave unto him* (Joshua 22:5). Yahusha (Jesus) spoke the identical word in the Gospel: *If ye love me, keep my commandments* (John 14:15). And the wisdom of the fathers had said it too: *they that love him will keep his ways* (Sirach 2:15), *they that love him shall be filled with the law* (Sirach 2:16). From the Torah through the prophets and the wisdom-books to the apostle, the testimony is one and unbroken — love is not severed from obedience; to love Elohim (God) is to keep His commandments, and His commandments are not grievous.',
       sv.verse_id, ev.verse_id, 'extras', 10120
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1',
       E'Whosoever believeth that Yahusha is the Messiah is born of Elohim (John 1)',
       E'The chapter opens with the new birth and its single mark: *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God): and every one that loveth him that begat loveth him also that is begotten of him* (1 John 5:1). This is the Gospel''s own promise come round again: *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name* (John 1:12), born *not of blood, nor of the will of the flesh, nor of the will of man, but of Elohim (God)* (John 1:13). To believe that Yahusha (Jesus) is the Messiah is to be born of the Father — the Father begets, the believer is born of Him, and the one who loves the Father who begat loves also the Son begotten. The Father remains the source of the begetting; the Son is the One believed on, and the new birth is the Father''s own work in the one who receives Him.',
       sv.verse_id, ev.verse_id, 'free', 10123
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44',
       E'This is the victory that overcometh the world, even our faith (Psalm 44)',
       E'*For whatsoever is born of Elohim (God) overcometh the world: and this is the victory that overcometh the world, even our faith. Who is he that overcometh the world, but he that believeth that Yahusha (Jesus) is the Son of Elohim (God)?* (1 John 5:4-5). The overcoming is by faith, not by the strength of the flesh — and that is the very confession of the psalmist of the sons of Korah: *Through thee will we push down our enemies: through thy name will we tread them under that rise up against us. For I will not trust in my bow, neither shall my sword save me* (Psalm 44:5-6). The victory is in Yahuah (LORD) and through His Name, received by trust: *thou hast saved us from our enemies, and hast put them to shame that hated us* (Psalm 44:7). What the psalmist confessed of the battles of old, John confesses of the world itself — the one born of Elohim (God) overcomes not by his own arm but by the faith that lays hold of the Deliverer. The bow and the sword save no one; the faith that trusts the Son is the victory.',
       sv.verse_id, ev.verse_id, 'free', 10126
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19',
       E'The record established at the mouth of the witnesses of Elohim concerning his Son (Deuteronomy 19)',
       E'John grounds the assurance of the Son in the Torah''s own law of evidence. The Spirit, the water, and the blood bear their record: *And it is the Spirit that beareth witness, because the Spirit is truth* (1 John 5:6); *And there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one* (1 John 5:8). A matter is not established on one voice alone but on the agreement of witnesses — the Torah''s requirement: *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* (Deuteronomy 19:15). The threefold earthly witness meets that very standard, so that the record stands sure, and *the witness of Elohim (God) is greater: for this is the witness of Elohim (God) which he hath testified of his Son. He that believeth on the Son of Elohim (God) hath the witness in himself* (1 John 5:9-10). The point is the establishing of the record concerning the Son by the witnesses Elohim (God) Himself appointed — the same Torah-law of two-or-three witnesses by which every matter in Yashar''el (Israel) was settled now settles the testimony of the Father about His Son.',
       sv.verse_id, ev.verse_id, 'free', 10129
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30',
       E'He that hath the Son hath life: I have set before thee life and death (Deuteronomy 30)',
       E'*And this is the record, that Elohim (God) hath given to us eternal life, and this life is in his Son. He that hath the Son hath life; and he that hath not the Son of Elohim (God) hath not life* (1 John 5:11-12). It is a stark either/or, with no third way — and it is the very choice Moses set before Yashar''el (Israel): *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15); *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). To choose life, Moses said, is to cleave to Yahuah (LORD): *for he is thy life, and the length of thy days* (Deuteronomy 30:20). John says that life is now given in the Son — *Elohim (God) hath given to us eternal life, and this life is in his Son.* The life that is Yahuah (LORD) Himself in the Torah is the eternal life the Father has given in the One He sent; to have the Son is to have the life, and the Father remains the source from whom the gift flows. The Torah''s summons — *choose life* — is answered in the Son in whom the Father set the life.',
       sv.verse_id, ev.verse_id, 'free', 10132
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12',
       E'That ye may know that ye have eternal life (Daniel 12)',
       E'John names the purpose of his whole letter: *These things have I written unto you that believe on the name of the Son of Elohim (God); that ye may know that ye have eternal life, and that ye may believe on the name of the Son of Elohim (God)* (1 John 5:13). The eternal life he says we may KNOW we have is the very life Daniel was shown at the end of the days: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Daniel saw the everlasting life of the resurrection from afar; John says the scattered elect who believe on the name of the Son may have its assurance now — not a hope deferred to the dust alone, but a present knowing. The everlasting life of Daniel''s awakening and the eternal life John''s readers may know are one and the same gift, given in the Son and held by faith.',
       sv.verse_id, ev.verse_id, 'free', 10135
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *this commandment... it is not hidden from thee, neither is it far off* the Torah within reach; John''s *his commandments are not grievous* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* Moses'' *thou mayest do it* is John''s *not grievous* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:12 — *to fear Yahuah... to love him* bound to keeping His commandments (v.13); John''s *love Elohim (God), and keep his commandments* (1 John 5:2).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 22:5 — *to love Yahuah... and to keep his commandments, and to cleave unto him* love and obedience welded in one charge; John''s *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 14:15 — *If ye love me, keep my commandments* the Gospel twin; John''s *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 2:15 — *they that love him will keep his ways* and *shall be filled with the law* (Sirach 2:16); the wisdom of the fathers welds love and obedience as John does (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:12 — *as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name* the new birth promised; *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God)* (1 John 5:1).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:5 — *through thy name will we tread them under... I will not trust in my bow* victory by trust not the sword; John''s *this is the victory that overcometh the world, even our faith* (1 John 5:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:7 — *thou hast saved us from our enemies* the victory belongs to Yahuah (LORD) and is received by faith; *whatsoever is born of Elohim (God) overcometh the world... even our faith* (1 John 5:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 19:15 — *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* the Torah''s law of evidence; the threefold record so that the witness of Elohim (God) concerning His Son stands established (1 John 5:8-9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *I have set before thee this day life and good, and death and evil* the stark either/or; John''s *He that hath the Son hath life... hath not the Son... hath not life* (1 John 5:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I have set before you life and death... therefore choose life* to choose life is to have the Son; *He that hath the Son hath life* (1 John 5:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* the life that is Yahuah (LORD) Himself; *this life is in his Son* (1 John 5:11), the Father the source.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life* the resurrection life Daniel saw; John writes *that ye may know that ye have eternal life* (1 John 5:13).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session242 — 1 John cross-references complete.'
