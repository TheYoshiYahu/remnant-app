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
