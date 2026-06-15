-- =====================================================================
-- Session 303 — Isaiah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session303_isaiah_cross_references.sql
-- =====================================================================

\echo 'session303 — Isaiah cross-references starting...'
BEGIN;

-- ----- fragment: minion_isaiah_6.sql (Isaiah 6) -----
-- Chapter: Isaiah 6 — THE THRONE VISION, a Christological keystone. *In the year that king Uzziah
-- died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up* (6:1); the seraphim cry
-- *Holy, holy, holy, is Yahuah Tseva'ot (LORD of hosts): the whole earth is full of his glory* (6:3).
-- John names whose glory this was: *These things said Esaias, when he saw his glory, and spake of him*
-- (John 12:41) — the One enthroned IS the Formed Son, the visible Glory who has a Father (the Formed
-- and the Formless; NOT trinitarian co-equal grammar, NOT modalist). The live coal cleanses the
-- prophet's lips (6:6-7); the sent one answers *Here am I; send me* (6:8); the fat-heart commission
-- (6:9-10) is quoted across the NT (Matthew 13, John 12, Acts 28) as judicial blinding of a people who
-- will not turn — covenant-lawsuit, conduct/judgment, NEVER ethnic, a partial hardening with a remnant
-- standing (Rom 11). And the holy seed survives as a stump (6:13) — the two-house remnant, the root of
-- Jesse (Isaiah 11), the remnant according to the election of grace (Romans 11:5).
-- Tag: isa06   Temp view: _s303_isa06_lookup
-- Sort band: base 26125, step 3 -> threads at 26125, 26128, 26131, 26134, 26137, 26140 (6 threads)
-- Source of EVERY row: 'canon','isaiah',6,v
--
-- Isaiah 6 coverage:
--   ★★ v.1-3 (I saw also Yahuah (Lord) sitting upon a throne, high and lifted up... Holy, holy, holy,
--          is Yahuah Tseva'ot (LORD of hosts): the whole earth is full of his glory)
--        NT:     ★★ Revelation 4:8 (the four beasts... saying, Holy, holy, holy, Yahuah Elohim (Lord
--                God) Almighty, which was, and is, and is to come) — THREAD 1 (trisagion; one heavenly
--                worship), and ★★★ John 12:41 (when he saw his glory) — THREAD 2 (the enthroned Glory)
--        Extras: ★ 1 Enoch 39:12-13 (I heard the voices of those four presences as they uttered praises
--                before Yahuah of glory; the first voice blesses Yahuah of Spirits for ever) — THREAD 1
--                (the holy ones crying before the throne); 1 Enoch 14:15-18 (the throne reaching heaven,
--                the flaming fire — Enoch's throne-vision parallel) — THREAD 2
--        Tanakh: woven through the throne/glory in prose; no separate Tanakh add forced here
--   ★★★ v.1 + v.10 read together by John (the throne Isaiah saw = the Formed Son's glory; the blinding
--          quoted from 6:10)
--        NT:     ★★★ John 12:41 (These things said Esaias, when he saw his glory, and spake of him),
--                John 12:40 (He hath blinded their eyes, and hardened their heart) — THREAD 2 (load-bearing)
--        Extras: 1 Enoch 14 throne-vision (THREAD 2)
--        Tanakh: none separate (the Formed-Glory weave is the NT's own naming)
--   v.6-7 (a live coal... taken with the tongs from off the altar... thine iniquity is taken away, and
--          thy sin purged)
--        NT:     none warranted distinct (the atoning-cleansing forward-weave is carried in prose; the
--                purging of sin is the altar's own work, fulfilled in the Messiah our atonement — held
--                in the thread prose, not forced to a single NT verse)
--        Extras: none warranted
--        Tanakh: ★ Leviticus 16:12 (a censer full of burning coals of fire from off the altar before
--                Yahuah) — THREAD 3 (the altar-coal that cleanses)
--   v.8 (the voice of Yahuah... Whom shall I send, and who will go for us? Then said I, Here am I; send me)
--        NT:     none warranted distinct (the sent-prophet pattern is woven into THREAD 4's commission
--                prose; the heaviest NT weave on this chapter is the fat-heart quotation)
--        Extras: none warranted
--        Tanakh: held in prose — the sending is the preface to the commission of v.9-10 (THREAD 4)
--   ★★ v.9-10 (Hear ye indeed, but understand not... Make the heart of this people fat, and make their
--          ears heavy, and shut their eyes... lest they... convert, and be healed)
--        NT:     ★★ Matthew 13:14-15 (in them is fulfilled the prophecy of Esaias... this people's heart
--                is waxed gross), ★★ John 12:40 (He hath blinded their eyes, and hardened their heart),
--                ★★ Acts 28:26-27 (Go unto this people... the heart of this people is waxed gross) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Romans 11:8 GUARD via the remnant (handled in THREAD 5; the hardening is PARTIAL,
--                a remnant remains — bound in the holy-seed thread, not a contradiction)
--   ★ v.11-13 (Until the cities be wasted... a great forsaking... yet in it shall be a tenth... as a teil
--          tree, and as an oak, whose substance is in them... so the holy seed shall be the substance thereof)
--        NT:     ★ Romans 11:5 (even so then at this present time also there is a remnant according to the
--                election of grace) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★ Isaiah 11:1 (there shall come forth a rod out of the stem of Jesse, and a Branch shall
--                grow out of his roots), ★ Isaiah 11:11 (Yahuah shall set his hand again the second time
--                to recover the remnant of his people) — THREAD 5 (the surviving stump = the two-house remnant)
--
-- Threads (slug — target libraries):
--   1. isaiah-6-holy-holy-holy-the-throne-isaiah-saw — NT (Revelation 4) + Extras (1 Enoch 39) [extras]
--      (★★ the trisagion; the one heavenly worship before the throne)
--   2. isaiah-6-when-he-saw-his-glory-and-spake-of-him — NT (John 12) + Extras (1 Enoch 14) [extras]
--      (★★★ the enthroned Glory Isaiah saw IS the Formed Son — the Formed-and-Formless keystone)
--   3. isaiah-6-the-live-coal-thine-iniquity-is-taken-away — Tanakh (Leviticus 16) [free]
--      (the altar-coal that purges sin; cleansing of the sent one's lips)
--   4. isaiah-6-make-the-heart-of-this-people-fat — NT (Matthew 13, John 12, Acts 28) [free]
--      (★★ the fat-heart commission; judicial blinding as covenant-lawsuit, victims-not-enemies, partial)
--   5. isaiah-6-the-holy-seed-shall-be-the-substance — NT (Romans 11) + Tanakh (Isaiah 11) [free]
--      (★ the surviving stump = the two-house remnant, the root of Jesse, the remnant of grace)
--
-- Framing notes:
--   ★★ THE TRISAGION (THREAD 1): *And one cried unto another, and said, Holy, holy, holy, is Yahuah
--      Tseva'ot (LORD of hosts): the whole earth is full of his glory* (6:3). The heavenly worship is
--      ONE across the library: *the four beasts had each of them six wings... and they rest not day and
--      night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty* (Revelation 4:8) — the same
--      six-winged living ones, the same threefold cry. And the restored witness shows the holy ones at
--      the throne doing the very thing: *I heard the voices of those four presences as they uttered
--      praises before Yahuah (God) of glory. And the first voice blesses Yahuah (God) of Spirits for
--      ever and ever* (1 Enoch 39:12-13). One throne, one Holy-Holy-Holy.
--   ★★★ WHO ISAIAH SAW (THREAD 2): John reads Isaiah 6 and names whose glory it was: *These things said
--      Esaias, when he saw his glory, and spake of him* (John 12:41) — quoting the blinding of 6:10 just
--      before (*He hath blinded their eyes, and hardened their heart*, John 12:40). The One enthroned
--      *high and lifted up* whose train filled the temple (6:1) is the Formed Son, the visible Glory
--      drawn from the Formless Father — the One Isaiah saw and *spake of*. This is the Formed-and-Formless
--      proof: the enthroned Glory is Yahusha (Jesus), who is Yahuah and HAS a Father; NOT co-equal
--      trinitarian persons, NOT a modalist collapse. Enoch's own throne-vision frames it: *the middle
--      one reached to heaven, like the throne of Yahuah (God)... and the top of the throne was of
--      sapphire. And I saw a flaming fire* (1 Enoch 14:15-16) — the throne high and lifted up, the fire,
--      the glory none could look upon.
--   THE LIVE COAL (THREAD 3): *Then flew one of the seraphims unto me, having a live coal in his hand,
--      which he had taken with the tongs from off the altar... thine iniquity is taken away, and thy sin
--      purged* (6:6-7). The coal is the altar's own fire of atonement: *he shall take a censer full of
--      burning coals of fire from off the altar before Yahuah (LORD)* (Leviticus 16:12) — the Day of
--      Atonement coals carried within the vail. The unclean lips are cleansed by the altar before the
--      prophet is sent; atonement precedes commission.
--   ★★ THE FAT-HEART COMMISSION (THREAD 4): *Make the heart of this people fat, and make their ears
--      heavy, and shut their eyes; lest they see... and convert, and be healed* (6:9-10). This is the
--      most-quoted commission in the NT — Matthew 13:14-15, John 12:40, Acts 28:26-27 — the judicial
--      blinding of a people who WILL NOT turn. Frame it as covenant-lawsuit: this is conduct and judgment
--      within the covenant, NEVER ethnic hatred. The hardening is PARTIAL and has an end — *blindness in
--      part is happened to Yashar'el (Israel), until the fulness of the Gentiles be come in* (Rom 11:25);
--      *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Rom 11:1-2) — a remnant remains
--      (bound in THREAD 5). Victims, not enemies; the lost sheep, not the cast-off.
--   ★ THE HOLY SEED (THREAD 5): *But yet in it shall be a tenth... as a teil tree, and as an oak, whose
--      substance is in them, when they cast their leaves: so the holy seed shall be the substance thereof*
--      (6:13). The surviving stump is the remnant — the two-house remnant preserved through the
--      forsaking. Isaiah's own next throne-word names it: *there shall come forth a rod out of the stem
--      of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1), and *Yahuah (Lord) shall set
--      his hand again the second time to recover the remnant of his people* (Isaiah 11:11). Paul confirms
--      the remnant stands: *even so then at this present time also there is a remnant according to the
--      election of grace* (Romans 11:5). The holy seed in the stump is the living root the whole tree grows from.
--   EXTRAS: 1 Enoch 39 (the four presences before the throne) and 1 Enoch 14 (the throne-vision)
--      woven on the throne/glory; clean witnesses, parses verified. No extras forced on the coal, the
--      commission, or the holy seed.
--   VERSES WITH NO SEPARATE ADD: v.2 (the seraphim/six wings — woven into THREAD 1 with v.3), v.4-5
--      (the smoke, the unclean lips — preface to the coal of THREAD 3), v.8 (whom shall I send — the
--      sending, preface to THREAD 4's commission), v.11-12 (the desolation — the lawsuit-judgment that
--      THREAD 5's remnant survives). All recorded, none silently skipped.

CREATE TEMP VIEW _s303_isa06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Holy, holy, holy — the throne Isaiah saw; the one heavenly worship
    ('canon','isaiah',6,3,'canon','revelation',4,8,'free',
      E'*And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). The seraphim of *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts)* (Isaiah 6:3) and the living ones of the Revelation throne are one worship: the same six-winged ones (Isaiah 6:2), the same threefold *Holy, holy, holy*. The heaven Isaiah saw and the heaven John saw cry the same cry before the same throne.'),
    ('canon','isaiah',6,3,'enoch','1-enoch',39,12,'extras',
      E'*And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12). The seraphim who *cried unto another, and said, Holy, holy, holy* (Isaiah 6:3) are the holy ones Enoch hears at the throne — the four presences who *uttered praises before Yahuah (God) of glory*. The restored witness shows the same ceaseless worship before the same throne of glory that filled Isaiah''s temple.'),
    ('canon','isaiah',6,3,'enoch','1-enoch',39,13,'extras',
      E'*And the first voice blesses Yahuah (God) of Spirits for ever and ever* (1 Enoch 39:13). The whole earth *full of his glory* (Isaiah 6:3) is sung in heaven without ceasing — *the first voice blesses Yahuah (God) of Spirits for ever and ever*. The trisagion of the seraphim is the unending blessing the holy ones pour before the throne; one worship, in heaven and over all the earth.'),

    -- THREAD 2 (★★★): When he saw his glory, and spake of him — the enthroned Glory IS the Formed Son
    ('canon','isaiah',6,1,'canon','john',12,41,'extras',
      E'*These things said Esaias, when he saw his glory, and spake of him* (John 12:41). John names whose glory filled the temple when Isaiah *saw also Yahuah (Lord) sitting upon a throne, high and lifted up* (Isaiah 6:1): it was HIS glory — the Formed Son''s — *and spake of him*. The visible enthroned Glory Isaiah beheld is the One drawn from the Formless Father, who is Yahuah and has a Father; Isaiah saw him and spoke of him.'),
    ('canon','isaiah',6,10,'canon','john',12,40,'extras',
      E'*He hath blinded their eyes, and hardened their heart; that they should not see with their eyes, nor understand with their heart, and be converted, and I should heal them* (John 12:40). John quotes the commission *Make the heart of this people fat... lest they see with their eyes... and convert, and be healed* (Isaiah 6:10) — and then declares (12:41) that the One who spoke it is the One whose glory Isaiah saw. The blinding-word and the throne-vision belong to the same enthroned Glory, the Formed Son.'),
    ('canon','isaiah',6,1,'enoch','1-enoch',14,15,'extras',
      E'*But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 14:15). Enoch''s throne-vision frames the throne Isaiah saw *high and lifted up* (Isaiah 6:1): a throne that *reached to heaven, like the throne of Yahuah (God)*, sapphire-topped. The same exalted throne, the same Glory none could approach.'),
    ('canon','isaiah',6,1,'enoch','1-enoch',14,16,'extras',
      E'*And I saw a flaming fire, and beyond that fire I saw a mountain whose summit reached to heaven* (1 Enoch 14:16). The throne *high and lifted up* whose *train filled the temple* (Isaiah 6:1) is the throne of flaming fire Enoch beholds — *a flaming fire... a mountain whose summit reached to heaven*. The Glory Isaiah saw enthroned is the same fire-wrapped Presence of Enoch''s vision.'),

    -- THREAD 3: The live coal — thine iniquity is taken away (the altar that cleanses)
    ('canon','isaiah',6,6,'canon','leviticus',16,12,'free',
      E'*And he shall take a censer full of burning coals of fire from off the altar before Yahuah (LORD), and his hands full of sweet incense beaten small, and bring it within the vail* (Leviticus 16:12). The seraph''s *live coal in his hand, which he had taken with the tongs from off the altar* (Isaiah 6:6) is the altar''s own atoning fire — *burning coals of fire from off the altar before Yahuah (LORD)* carried within the vail on the Day of Atonement. The coal that purges the prophet''s lips comes from the place of atonement.'),
    ('canon','isaiah',6,7,'canon','leviticus',16,16,'free',
      E'*And he shall make an atonement for the holy place, because of the uncleanness of the children of Yashar''el (Israel), and because of their transgressions in all their sins* (Leviticus 16:16). When the coal touches the prophet''s lips — *thine iniquity is taken away, and thy sin purged* (Isaiah 6:7) — it does the altar''s own work: *an atonement... because of their transgressions in all their sins*. The unclean lips of the man among a people of unclean lips (6:5) are cleansed by the fire of atonement before he is sent.'),

    -- THREAD 4 (★★): Make the heart of this people fat (the fat-heart commission; covenant-lawsuit, partial)
    ('canon','isaiah',6,9,'canon','matthew',13,14,'free',
      E'*And in them is fulfilled the prophecy of Esaias, which saith, By hearing ye shall hear, and shall not understand; and seeing ye shall see, and shall not perceive* (Matthew 13:14). Yahusha names the commission *Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9) as fulfilled in the parable-hearers — *By hearing ye shall hear, and shall not understand*. The judicial dulling Isaiah was sent to pronounce is enacted on those who would not turn.'),
    ('canon','isaiah',6,10,'canon','matthew',13,15,'free',
      E'*For this people''s heart is waxed gross, and their ears are dull of hearing, and their eyes they have closed; lest at any time they should see with their eyes, and hear with their ears, and should understand with their heart, and should be converted, and I should heal them* (Matthew 13:15). This is Isaiah 6:10 word for word — *Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see... and convert, and be healed*. The fat heart, the heavy ears, the shut eyes are the covenant-lawsuit verdict on a people who refuse to turn; conduct and judgment, never ethnic — a hardening that has an end.'),
    ('canon','isaiah',6,9,'canon','acts',28,26,'free',
      E'*Saying, Go unto this people, and say, Hearing ye shall hear, and shall not understand; and seeing ye shall see, and not perceive* (Acts 28:26). Paul closes Acts quoting the sending of Isaiah 6:9 — *Go, and tell this people, Hear ye indeed, but understand not* — *Well spake the Ruach HaKodesh (Holy Spirit) by Esaias the prophet unto our fathers* (28:25). The same commission, the same blinding of those who will not hear, spoken by the Spirit.'),
    ('canon','isaiah',6,10,'canon','acts',28,27,'free',
      E'*For the heart of this people is waxed gross, and their ears are dull of hearing, and their eyes have they closed; lest they should see with their eyes, and hear with their ears, and understand with their heart, and should be converted, and I should heal them* (Acts 28:27). Isaiah 6:10 again, exact — *Make the heart of this people fat... lest they... convert, and be healed*. The judicial blinding is conduct-within-the-covenant on those who refuse; it is partial, not a casting-off — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — and a remnant stands.'),

    -- THREAD 5 (★): The holy seed shall be the substance (the surviving stump = the two-house remnant)
    ('canon','isaiah',6,13,'canon','isaiah',11,1,'free',
      E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). The stump of Isaiah 6:13 — *as a teil tree, and as an oak, whose substance is in them, when they cast their leaves: so the holy seed shall be the substance thereof* — is the very stem from which the Branch grows: *a rod out of the stem of Jesse, and a Branch... out of his roots*. The holy seed in the felled tree is the living root the Messiah springs from.'),
    ('canon','isaiah',6,13,'canon','isaiah',11,11,'free',
      E'*And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* (Isaiah 11:11). The *tenth* that *shall return* (Isaiah 6:13) is the remnant Yahuah recovers *the second time* — *the remnant of his people, which shall be left*. The holy-seed stump is the two-house remnant gathered home, the outcasts of Yashar''el and the dispersed of Yahudah assembled (11:12).'),
    ('canon','isaiah',6,13,'canon','romans',11,5,'free',
      E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). *The holy seed shall be the substance thereof* (Isaiah 6:13) — the surviving stump — is the remnant Paul confirms still stands: *a remnant according to the election of grace*. The hardening of the fat-heart commission is partial, never a cast-off people; the holy seed is preserved, the root from which the whole tree is graffed (Romans 11:16-17).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-6-holy-holy-holy-the-throne-isaiah-saw',
       E'Holy, holy, holy — the throne Isaiah saw and the one heavenly worship',
       E'In the temple Isaiah beholds the throne and hears the cry: *I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple. Above it stood the seraphims: each one had six wings... And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:1-3). The Revelation throne shows the same worship, the same living ones, the same threefold cry: *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). And the restored witness places the holy ones at that throne doing the very thing: *I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory. And the first voice blesses Yahuah (God) of Spirits for ever and ever* (1 Enoch 39:12-13). One throne, one Holy-Holy-Holy — the worship Isaiah heard in the temple is the worship of heaven without ceasing, and the whole earth is full of His glory.',
       sv.verse_id, ev.verse_id, 'extras', 26125
  FROM _s303_isa06_lookup sv, _s303_isa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-6-when-he-saw-his-glory-and-spake-of-him',
       E'When he saw his glory — the enthroned One Isaiah saw is the Formed Son',
       E'Isaiah saw a Person on the throne: *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1); *for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts)* (6:5). John reads this very chapter and names whose glory it was. He first quotes the commission of 6:10 — *He hath blinded their eyes, and hardened their heart; that they should not see with their eyes, nor understand with their heart, and be converted, and I should heal them* (John 12:40) — and then declares: *These things said Esaias, when he saw his glory, and spake of him* (John 12:41). The glory that filled the temple was HIS glory. This is the Formed and the Formless: the visible enthroned Glory whom Isaiah saw is the Formed Son, the expressed Word drawn from the Formless Father — the One who appeared, who is Yahuah, and who HAS a Father. Not co-equal trinitarian persons; not a modalist collapse — the One enthroned, of whom Isaiah *spake*, is Yahusha (Jesus). Enoch''s throne-vision sets the same scene: *the middle one reached to heaven, like the throne of Yahuah (God)... and the top of the throne was of sapphire. And I saw a flaming fire, and beyond that fire I saw a mountain whose summit reached to heaven* (1 Enoch 14:15-16) — the throne high and lifted up, the fire, the Glory none could look upon.',
       sv.verse_id, ev.verse_id, 'extras', 26128
  FROM _s303_isa06_lookup sv, _s303_isa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-6-the-live-coal-thine-iniquity-is-taken-away',
       E'The live coal from off the altar — thine iniquity is taken away',
       E'Undone before the throne, the prophet confesses: *Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips* (Isaiah 6:5). The cleansing comes from the altar: *Then flew one of the seraphims unto me, having a live coal in his hand, which he had taken with the tongs from off the altar: And he laid it upon my mouth, and said, Lo, this hath touched thy lips; and thine iniquity is taken away, and thy sin purged* (6:6-7). The coal is the altar''s own atoning fire — the same fire carried within the vail on the Day of Atonement: *And he shall take a censer full of burning coals of fire from off the altar before Yahuah (LORD), and his hands full of sweet incense beaten small, and bring it within the vail* (Leviticus 16:12), there to *make an atonement... because of the uncleanness of the children of Yashar''el (Israel), and because of their transgressions in all their sins* (Leviticus 16:16). The unclean lips are purged by the fire of atonement; cleansing precedes the sending. Only then can the prophet answer *Here am I; send me* (6:8).',
       sv.verse_id, ev.verse_id, 'free', 26131
  FROM _s303_isa06_lookup sv, _s303_isa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-6-make-the-heart-of-this-people-fat',
       E'Make the heart of this people fat — the commission quoted across the gospel',
       E'The commission Isaiah is sent with is a verdict on those who will not turn: *Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not. Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed* (Isaiah 6:9-10). This is the most-quoted commission in the gospel record. Yahusha applies it to the parable-hearers: *in them is fulfilled the prophecy of Esaias, which saith, By hearing ye shall hear, and shall not understand* (Matthew 13:14), *For this people''s heart is waxed gross, and their ears are dull of hearing, and their eyes they have closed* (Matthew 13:15). John makes it the throne-Glory''s own word (John 12:40). And Paul closes the book of Acts with it: *Well spake the Ruach HaKodesh (Holy Spirit) by Esaias the prophet unto our fathers, Saying, Go unto this people... Hearing ye shall hear, and shall not understand* (Acts 28:25-26), *For the heart of this people is waxed gross... lest they should... be converted, and I should heal them* (Acts 28:27). Read it as covenant-lawsuit, NOT ethnic judgment: the fat heart, the heavy ears, the shut eyes are the righteous verdict on a people who refuse to turn — conduct and judgment within the covenant. And it is PARTIAL — *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — never a casting-off: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). Victims, not enemies; the lost sheep, with a remnant standing.',
       sv.verse_id, ev.verse_id, 'free', 26134
  FROM _s303_isa06_lookup sv, _s303_isa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-6-the-holy-seed-shall-be-the-substance',
       E'The holy seed shall be the substance — the surviving stump, the remnant preserved',
       E'The vision ends in judgment, but not in extinction: *Then said I, Yahuah (Lord), how long? And he answered, Until the cities be wasted without inhabitant... and the land be utterly desolate* (Isaiah 6:11). Yet a stump remains: *But yet in it shall be a tenth, and it shall return, and shall be eaten: as a teil tree, and as an oak, whose substance is in them, when they cast their leaves: so the holy seed shall be the substance thereof* (6:13). The felled tree keeps its living root — the holy seed. Isaiah''s own next throne-word draws the Branch from that very stem: *And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1); and the *tenth* that returns is the remnant Yahuah recovers — *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* (Isaiah 11:11), assembling *the outcasts of Yashar''el (Israel)* and *the dispersed of Yahudah (Judah)* (11:12) — the two-house remnant gathered home. Paul confirms the holy seed still stands: *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The hardening of the fat-heart commission is partial; the holy seed is preserved — the root from which the whole tree is graffed (Romans 11:16-17).',
       sv.verse_id, ev.verse_id, 'free', 26137
  FROM _s303_isa06_lookup sv, _s303_isa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty* (Revelation 4:8) — the same six-winged living ones and the same threefold cry of Isaiah 6:2-3; one worship before one throne.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-holy-holy-holy-the-throne-isaiah-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12) — the holy ones crying *Holy, holy, holy* (Isaiah 6:3) seen at the throne of glory in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-holy-holy-holy-the-throne-isaiah-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the first voice blesses Yahuah (God) of Spirits for ever and ever* (1 Enoch 39:13) — the whole earth *full of his glory* (Isaiah 6:3) is the unending blessing the holy ones pour before the throne.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-holy-holy-holy-the-throne-isaiah-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *These things said Esaias, when he saw his glory, and spake of him* (John 12:41) — the One enthroned *high and lifted up* (Isaiah 6:1) IS the Formed Son; Isaiah saw HIS glory and spake of him.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-when-he-saw-his-glory-and-spake-of-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *He hath blinded their eyes, and hardened their heart* (John 12:40) — John quotes the commission of Isaiah 6:10 and (12:41) declares it the word of the One whose glory Isaiah saw.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-when-he-saw-his-glory-and-spake-of-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the middle one reached to heaven, like the throne of Yahuah (God)... the top of the throne was of sapphire* (1 Enoch 14:15) — the throne *high and lifted up* (Isaiah 6:1) framed in Enoch''s own throne-vision.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-when-he-saw-his-glory-and-spake-of-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And I saw a flaming fire... a mountain whose summit reached to heaven* (1 Enoch 14:16) — the Glory whose *train filled the temple* (Isaiah 6:1) is the same fire-wrapped Presence none could look upon.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-when-he-saw-his-glory-and-spake-of-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *a censer full of burning coals of fire from off the altar before Yahuah (LORD)... bring it within the vail* (Leviticus 16:12) — the seraph''s live coal *from off the altar* (Isaiah 6:6) is the Day-of-Atonement fire.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-the-live-coal-thine-iniquity-is-taken-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*make an atonement... because of their transgressions in all their sins* (Leviticus 16:16) — the coal does the altar''s own work: *thine iniquity is taken away, and thy sin purged* (Isaiah 6:7).'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-the-live-coal-thine-iniquity-is-taken-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *in them is fulfilled the prophecy of Esaias... By hearing ye shall hear, and shall not understand* (Matthew 13:14) — the *Hear ye indeed, but understand not* of Isaiah 6:9 enacted on the parable-hearers.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-make-the-heart-of-this-people-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *this people''s heart is waxed gross, and their ears are dull of hearing, and their eyes they have closed* (Matthew 13:15) — Isaiah 6:10 word for word; the covenant-lawsuit verdict on those who refuse to turn, never ethnic.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-make-the-heart-of-this-people-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Go unto this people... Hearing ye shall hear, and shall not understand* (Acts 28:26) — Paul closes Acts with the sending of Isaiah 6:9, spoken by the Ruach HaKodesh.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=28 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-make-the-heart-of-this-people-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the heart of this people is waxed gross... lest they should... be converted, and I should heal them* (Acts 28:27) — Isaiah 6:10 exact; a PARTIAL hardening, never a cast-off people (Romans 11:1), with a remnant standing.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=28 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-make-the-heart-of-this-people-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1) — the *holy seed* stump of Isaiah 6:13 is the very stem from which the Branch grows.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-the-holy-seed-shall-be-the-substance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* (Isaiah 11:11) — the *tenth* that returns (Isaiah 6:13) is the two-house remnant gathered home.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-the-holy-seed-shall-be-the-substance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5) — Paul confirms the *holy seed* (Isaiah 6:13) still stands; the hardening is partial, the remnant preserved.'
  FROM cross_reference_threads t
  JOIN _s303_isa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s303_isa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-6-the-holy-seed-shall-be-the-substance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_7.sql (Isaiah 7) -----
-- Chapter: Isaiah 7 — THE SIGN OF IMMANUEL and the two-kingdom crisis. In the days of Ahaz of
-- Yahudah (Judah) the confederacy of Syria (Rezin) and EPHRAIM — the northern house of Israel
-- under Pekah — goes up against the house of David (7:1-9). Adonai Yahuah declares it shall not
-- stand, and that *within threescore and five years shall Ephraim be broken, that it be not a
-- people* (7:8) — the scattering of the northern house, the Lo-Ammi pattern that the later
-- regathering (Isaiah 11:11-13) reverses. The faith-call to the house of David: *If ye will not
-- believe, surely ye shall not be established* (7:9). Ahaz refuses to ask a sign (7:10-13), so
-- the sign is given anyway to the whole house of David: *Behold, a virgin shall conceive, and
-- bear a son, and shall call his name Immanuel* (7:14) — the keystone, fulfilled in Matthew
-- 1:22-23 and the annunciation of Luke 1, the Formed Son taking flesh, God-with-us; one Immanuel
-- arc with 8:8/8:10 (*God is with us*) and 9:6-7 (the child born, the government on his shoulder).
-- Tag: isa07   Temp view: _s303_isa07_lookup
-- Sort band: base 26150, step 3 -> threads at 26150, 26153, 26156 (3 threads)
-- Source of EVERY row: 'canon','isaiah',7,v
--
-- Isaiah 7 coverage:
--   v.1 (Rezin king of Syria, and Pekah... king of Yashar'el, went up toward Jerusalem to war
--          against it, but could not prevail)
--        NT:     none warranted (the historical setting; the framework weave is the two-house crisis)
--        Extras: none warranted
--        Tanakh: gathered into THREAD 1 (the confederacy backdrop)
--   ★ v.2 (it was told the house of David, Syria is confederate with Ephraim; and his heart was moved)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: THREAD 1 (the northern house allied against the southern; the divided kingdom)
--   v.3-7 (Shear-jashub; Take heed, and be quiet; fear not; the evil counsel; It shall not stand)
--        NT/Extras/Tanakh: none warranted distinct — the oracle's reassurance; gathered in THREAD 1 prose.
--   ★★ v.8 (within threescore and five years shall Ephraim be broken, that it be not a people)
--        NT:     none warranted distinct (the Lo-Ammi/regathering forward-weave is the prophets' own)
--        Extras: none warranted
--        Tanakh: ★ Hosea 1:9-10 (Call his name Lo-ammi: for ye are not my people... yet... in the
--                place where it was said... Ye are not my people, there it shall be said... Ye are
--                the sons of the living Elohim), ★ Isaiah 11:11-13 (recover the remnant the second
--                time; assemble the outcasts of Yashar'el; Ephraim shall not envy Yahudah), Isaiah
--                9:21 (Manasseh, Ephraim... against Yahudah) — THREAD 1 (the breaking = covenant
--                judgment the regathering reverses, never replacement)
--   ★ v.9 (And the head of Ephraim is Samaria... If ye will not believe, surely ye shall not be
--          established)
--        NT:     none warranted distinct (the faith-and-covenant frame is carried laterally + in prose)
--        Extras: none warranted
--        Tanakh: ★★ 2 Chronicles 20:20 (Believe in Yahuah Elohaychem, so shall ye be established;
--                believe his prophets, so shall ye prosper — the same believe/established verb-pair),
--                ★ Genesis 15:6 (he believed in Yahuah; and he counted it to him for righteousness),
--                ★ Genesis 26:5 (Abraham obeyed my voice, and kept my charge, my commandments, my
--                statutes, and my laws) — THREAD 2 (faith AND covenant-word together, never either alone)
--   v.10-13 (Ask thee a sign... I will not ask, neither will I tempt Yahuah... will ye weary my Elohim?)
--        NT/Extras/Tanakh: none warranted distinct — the sign refused; the wearying of Elohim that
--          gives the sign anyway to the whole house of David; gathered into THREAD 3 prose.
--   ★★★ v.14 (Therefore Yahuah himself shall give you a sign; Behold, a virgin shall conceive, and
--          bear a son, and shall call his name Immanuel) — THE KEYSTONE
--        NT:     ★★★ Matthew 1:23 (Behold, a virgin shall be with child, and shall bring forth a son,
--                and they shall call his name Emmanuel, which being interpreted is, Elohim (God)
--                with us), Matthew 1:22 (that it might be fulfilled which was spoken... by the
--                prophet), ★ Luke 1:31 (thou shalt conceive... and shalt call his name Yahusha),
--                Luke 1:32-33 (Son of the Highest... the throne of his father David... reign over
--                the house of Jacob for ever), Luke 1:35 (that holy thing... shall be called the
--                Son of Elohim) — THREAD 3 (load-bearing keystone)
--        Extras: none warranted (no clean restored witness adds to the virgin-Immanuel sign)
--        Tanakh: ★ Isaiah 8:8 (the stretching out of his wings shall fill the breadth of thy land,
--                O Immanuel), ★ Isaiah 8:10 (Take counsel together... for Elohim (God) is with us),
--                ★ Isaiah 9:6 (unto us a child is born, unto us a son is given... his name shall be
--                called Wonderful, Counsellor, El Gibbor, Avi-ad, Sar Shalom), Isaiah 9:7 (upon the
--                throne of David... for ever) — THREAD 3 (the Immanuel arc, laterally + forward)
--   v.15-25 (Butter and honey... the land forsaken of both her kings... the king of Assyria... briers
--          and thorns)
--        NT/Extras: none warranted
--        Tanakh: none forced — the near-term sign-clock (before the child knows good from evil, the
--          two kings' land is forsaken) and the Assyrian desolation oracle; the historical floor the
--          Immanuel sign is set into, carried in THREAD 3 prose, not a separate add.
--
-- Threads (slug — target libraries):
--   1. isaiah-7-the-confederacy-of-syria-and-ephraim-against-the-house-of-david — Tanakh
--      (Hosea 1, Isaiah 11, Isaiah 9) [free] (★ the two-kingdom crisis; Ephraim broken = the
--      Lo-Ammi scattering the regathering reverses, never replacement)
--   2. isaiah-7-if-ye-will-not-believe-surely-ye-shall-not-be-established — Tanakh
--      (2 Chronicles 20, Genesis 15, Genesis 26) [free] (★ faith AND covenant-word together)
--   3. isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel — NT (Matthew 1, Luke 1)
--      + Tanakh (Isaiah 8, Isaiah 9) [free] (★★★ THE keystone: God-with-us, the Formed Son in flesh)
--
-- Framing notes:
--   ★ THE TWO-KINGDOM CRISIS (THREAD 1): the confederacy is the northern house against the southern —
--      *Syria is confederate with Ephraim* (7:2), Rezin of Syria and Pekah *king of Yashar'el (Israel)*
--      (7:1) against the house of David. Adonai declares the breaking: *within threescore and five
--      years shall Ephraim be broken, that it be not a people* (7:8). This is the Lo-Ammi pattern —
--      *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9) — covenant-judgment scattering of
--      the northern house, NOT a cancelled people: *yet... in the place where it was said unto them,
--      Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim
--      (God)* (Hosea 1:10). The breaking is exactly what the later regathering reverses: *Yahuah (Lord)
--      shall set his hand again the second time to recover the remnant of his people* (Isaiah 11:11),
--      *the envy also of Ephraim shall depart... Ephraim shall not envy Yahudah (Judah)* (Isaiah 11:13).
--      The two houses warring here (cf. Isaiah 9:21, *Manasseh, Ephraim... against Yahudah*) are the
--      two sticks made one. Never replacement; the remnant remains.
--   ★ IF YE WILL NOT BELIEVE (THREAD 2): the faith-call to the house of David — *If ye will not
--      believe, surely ye shall not be established* (7:9). Jehoshaphat preaches the identical verb-pair:
--      *Believe in Yahuah Elohaychem (the LORD your God), so shall ye be established* (2 Chronicles
--      20:20). But the framework holds faith AND covenant-word together, never faith-confession alone:
--      Abraham *believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6),
--      AND Abraham *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws*
--      (Genesis 26:5). The house of David is established by trust that obeys, not by lineage alone nor
--      by confession alone.
--   ★★★ IMMANUEL (THREAD 3): Ahaz refuses the sign — *I will not ask, neither will I tempt Yahuah*
--      (7:12) — wearying Elohim, so the sign is given to the whole house of David: *Therefore Yahuah
--      (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall
--      call his name Immanuel* (7:14). Matthew names the fulfillment word for word: *Behold, a virgin
--      shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which
--      being interpreted is, Elohim (God) with us* (Matthew 1:23). Read through the Formed and the
--      Formless: God-with-us is the Formed Son — the One who appeared and walked with His people through
--      the Tanakh — now taking flesh; the annunciation gives him the throne of David and the house of
--      Jacob (Luke 1:32-33), born of the Ruach HaKodesh, *the Son of Elohim (God)* (Luke 1:35). The
--      child's name is one Immanuel arc through Isaiah: *the stretching out of his wings shall fill the
--      breadth of thy land, O Immanuel* (8:8), *for Elohim (God) is with us* (8:10), and *unto us a
--      child is born, unto us a son is given... his name shall be called Wonderful, Counsellor, El
--      Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)*
--      (9:6), upon the throne of David for ever (9:7).
--   EXTRAS: recorded NONE WARRANTED across the chapter — a deliberate, recorded answer. The load-bearing
--      weaves are the NT (Matthew 1, Luke 1) and the Tanakh prophets/Torah (Hosea 1, Isaiah 8/9/11,
--      2 Chronicles 20, Genesis 15/26). No restored witness was forced onto the Immanuel sign.
--   VERSES WITH NO ADD: v.3-7 (the oracle's reassurance, Shear-jashub, the evil counsel that shall not
--      stand), v.10-13 (the sign refused/Elohim wearied — gathered into THREAD 3), v.15-25 (the
--      near-term sign-clock and the Assyrian desolation oracle — the historical floor the sign is set
--      into): the framework weaves rise from v.2/8/9/14; these are gathered in the thread prose, no
--      separate framework-bearing target warranted.

CREATE TEMP VIEW _s303_isa07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The confederacy of Syria and Ephraim against the house of David — Ephraim broken
    ('canon','isaiah',7,8,'canon','hosea',1,9,'free',
      E'*Then said Elohim (God), Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9). When Adonai declares *within threescore and five years shall Ephraim be broken, that it be not a people* (Isaiah 7:8), this is the Lo-Ammi pattern — the northern house, Ephraim, scattered in covenant-judgment so that it is *not a people*, *not my people*. The breaking is the divorce of the northern stick, the conduct-judgment for covenant-breaking, never an ethnic end.'),
    ('canon','isaiah',7,8,'canon','hosea',1,10,'free',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The breaking of Ephraim *that it be not a people* (Isaiah 7:8) is reversed in the very same word: where it was said *Ye are not my people*, there they shall be called *the sons of the living Elohim (God)*. The scattering is judgment; the regathering is the promise — never a cancelled people.'),
    ('canon','isaiah',7,8,'canon','isaiah',11,11,'free',
      E'*And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea* (Isaiah 11:11). The Ephraim *broken, that it be not a people* (7:8) is the remnant Yahuah recovers *the second time* from the lands of the scattering — the breaking is exactly what the second-recovery reverses, the northern house brought home.'),
    ('canon','isaiah',7,8,'canon','isaiah',11,13,'free',
      E'*The envy also of Ephraim shall depart, and the adversaries of Yahudah (Judah) shall be cut off: Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* (Isaiah 11:13). The two houses warring here — Ephraim confederate against the house of David, Ephraim *broken* (7:8) — are the two sticks made one when *Ephraim shall not envy Yahudah (Judah)*. The crisis of Isaiah 7 is the very division the regathering heals.'),
    ('canon','isaiah',7,2,'canon','isaiah',9,21,'free',
      E'*Manasseh, Ephraim; and Ephraim, Manasseh: and they together shall be against Yahudah (Judah). For all this his anger is not turned away, but his hand is stretched out still* (Isaiah 9:21). *Syria is confederate with Ephraim* (Isaiah 7:2) is the same northern-house enmity Isaiah names again — *they together shall be against Yahudah (Judah)* — the divided kingdom, the northern tribes set against the southern house of David, the wound the two-stick regathering closes.'),

    -- THREAD 2 (★): If ye will not believe, surely ye shall not be established — faith AND covenant-word
    ('canon','isaiah',7,9,'canon','2-chronicles',20,20,'free',
      E'*And they rose early in the morning, and went forth into the wilderness of Tekoa: and as they went forth, Jehoshaphat stood and said, Hear me, O Yahudah (Judah), and ye inhabitants of Jerusalem; Believe in Yahuah Elohaychem (the LORD your God), so shall ye be established; believe his prophets, so shall ye prosper* (2 Chronicles 20:20). The faith-call to the house of David — *If ye will not believe, surely ye shall not be established* (Isaiah 7:9) — is Jehoshaphat''s word to Yahudah (Judah) in the very same verb-pair: *Believe in Yahuah Elohaychem (the LORD your God), so shall ye be established*. To be established is to trust Yahuah; the kingdom that will not believe shall not stand.'),
    ('canon','isaiah',7,9,'canon','genesis',15,6,'free',
      E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). The call *If ye will not believe, surely ye shall not be established* (Isaiah 7:9) is the same trust Abraham had — *he believed in Yahuah (LORD)* — the faith reckoned for righteousness. The house of David is established not by lineage alone nor by power-confederacy, but by believing Yahuah, the faith of the father of the seed.'),
    ('canon','isaiah',7,9,'canon','genesis',26,5,'free',
      E'*Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). The believing that establishes (Isaiah 7:9) is never a bare confession: the same Abraham who *believed in Yahuah* (Genesis 15:6) is the one who *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws*. Faith and covenant-word together — trust that obeys — is what establishes the house of David; *if ye will not believe, surely ye shall not be established*.'),

    -- THREAD 3 (★★★): Behold, a virgin shall conceive, and bear a son — Immanuel, God with us
    ('canon','isaiah',7,14,'canon','matthew',1,23,'free',
      E'*Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23). The sign given to the house of David — *Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14) — is named word for word as fulfilled, with the name unfolded: *Emmanuel... Elohim (God) with us*. Read through the Formed and the Formless: God-with-us is the Formed Son, the One who appeared and walked with His people through the Tanakh, now conceived and born; the sign to the whole house of David is God Himself come near.'),
    ('canon','isaiah',7,14,'canon','matthew',1,22,'free',
      E'*Now all this was done, that it might be fulfilled which was spoken of Yahuah (Lord) by the prophet, saying* (Matthew 1:22). The virgin-sign of Isaiah 7:14 is expressly *that which was spoken of Yahuah (Lord) by the prophet* — Matthew names Isaiah''s Immanuel as the word now fulfilled in the birth, the sign to the house of David carried forward into flesh.'),
    ('canon','isaiah',7,14,'canon','luke',1,31,'free',
      E'*And, behold, thou shalt conceive in thy womb, and bring forth a son, and shalt call his name Yahusha (JESUS)* (Luke 1:31). The annunciation answers Isaiah''s sign — *a virgin shall conceive, and bear a son* (Isaiah 7:14) — in the angel''s word to Mary: *thou shalt conceive in thy womb, and bring forth a son*. The virgin conceives; the promised child of the house of David is named and born.'),
    ('canon','isaiah',7,14,'canon','luke',1,32,'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The son born of the virgin (Isaiah 7:14) is given *the throne of his father David* — the sign to the HOUSE OF DAVID fulfilled in the Davidic heir, the Son of the Highest who has a Father: *Yahuah Elohim (the Lord God) shall give unto him* the throne.'),
    ('canon','isaiah',7,14,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The Immanuel-child (Isaiah 7:14) reigns *over the house of Jacob for ever* — the two houses of Jacob gathered under the everlasting throne of David, the kingdom that *if ye will not believe* (7:9) the unbelieving could not hold, now established without end.'),
    ('canon','isaiah',7,14,'canon','luke',1,35,'free',
      E'*And the angel answered and said unto her, The Ruach HaKodesh (Holy Spirit) shall come upon thee, and the power of the Highest shall overshadow thee: therefore also that holy thing which shall be born of thee shall be called the Son of Elohim (God)* (Luke 1:35). The virgin who conceives the sign-child (Isaiah 7:14) conceives by *the Ruach HaKodesh (Holy Spirit)*, and the child *shall be called the Son of Elohim (God)* — God-with-us, the Formed Son drawn from the Formless, born into flesh; he is the Son of the Most High, and he has a Father.'),
    ('canon','isaiah',7,14,'canon','isaiah',8,8,'free',
      E'*And he shall pass through Yahudah (Judah); he shall overflow and go over, he shall reach even to the neck; and the stretching out of his wings shall fill the breadth of thy land, O Immanuel* (Isaiah 8:8). The Immanuel of the sign (7:14) is named again as the land''s own Lord — *the breadth of thy land, O Immanuel* — the God-with-us to whom Yahudah (Judah) belongs even in the Assyrian flood. One Immanuel arc binds the sign to the chapter that follows.'),
    ('canon','isaiah',7,14,'canon','isaiah',8,10,'free',
      E'*Take counsel together, and it shall come to nought; speak the word, and it shall not stand: for Elohim (God) is with us* (Isaiah 8:10). The name Immanuel (7:14) is its own confession of safety: *for Elohim (God) is with us* — the same word the name means. The confederacy''s counsel *shall not stand* (cf. 7:7, *It shall not stand*) precisely because God is with His people; the sign-child''s name is the kingdom''s assurance.'),
    ('canon','isaiah',7,14,'canon','isaiah',9,6,'free',
      E'*For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6). The virgin''s son Immanuel (7:14) is *the child... born... the son... given*, his names declaring who God-with-us is: *El Gibbor (The mighty God)* born among us — the Formed Son in flesh, bearing the government on his shoulder.'),
    ('canon','isaiah',7,14,'canon','isaiah',9,7,'free',
      E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:7). The sign-child given to the house of David (7:14) reigns *upon the throne of David... for ever* — the same throne the annunciation names (Luke 1:32-33). The kingdom the unbelieving Ahaz could not establish (7:9), Yahuah Tseva''ot Himself will establish for ever in Immanuel.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-7-the-confederacy-of-syria-and-ephraim-against-the-house-of-david',
       E'The confederacy of Syria and Ephraim against the house of David — Ephraim broken, that it be not a people',
       E'In the days of Ahaz, *Rezin the king of Syria, and Pekah the son of Remaliah, king of Yashar''el (Israel), went up toward Jerusalem to war against it* (Isaiah 7:1), and *it was told the house of David, saying, Syria is confederate with Ephraim* (7:2). This is the two-kingdom crisis: the northern house — Ephraim, the ten tribes — allied with Syria against the southern house of David. Adonai declares it shall not stand (*It shall not stand, neither shall it come to pass*, 7:7) and pronounces the breaking of the north: *within threescore and five years shall Ephraim be broken, that it be not a people* (7:8). This is the Lo-Ammi pattern — covenant-judgment, the scattering of the northern stick, not an ethnic end: *Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9). And the breaking is reversed in the very same word: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The scattering is exactly what the later regathering undoes: *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people... from Assyria, and from Egypt... and from the islands of the sea* (Isaiah 11:11), and *the envy also of Ephraim shall depart... Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* (Isaiah 11:13). The two houses warring here — *Manasseh, Ephraim; and Ephraim, Manasseh: and they together shall be against Yahudah (Judah)* (Isaiah 9:21) — are the two sticks Yahuah makes one. The breaking of Ephraim is covenant-judgment for covenant-breaking; the remnant remains, and the regathering is the promise. Never replacement.',
       sv.verse_id, ev.verse_id, 'free', 26150
  FROM _s303_isa07_lookup sv, _s303_isa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-7-if-ye-will-not-believe-surely-ye-shall-not-be-established',
       E'If ye will not believe, surely ye shall not be established — faith and covenant-word together',
       E'The oracle to the trembling house of David closes with a faith-call: *If ye will not believe, surely ye shall not be established* (Isaiah 7:9). To stand is to trust Yahuah, not the strength of a confederacy nor the throne''s mere lineage. Jehoshaphat preaches the identical verb-pair to Yahudah (Judah): *Believe in Yahuah Elohaychem (the LORD your God), so shall ye be established; believe his prophets, so shall ye prosper* (2 Chronicles 20:20). But the framework holds faith AND covenant-word together — never bare confession, never lineage alone. The father of the seed *believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6), AND that same Abraham *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). The establishing of the house of David is trust that obeys: believing Yahuah, keeping His word. The kingdom that will not believe shall not be established — and the unbelief of Ahaz here is answered by the sign given anyway, the Immanuel whose throne Yahuah Himself will establish for ever (9:7).',
       sv.verse_id, ev.verse_id, 'free', 26153
  FROM _s303_isa07_lookup sv, _s303_isa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel',
       E'Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel — God with us',
       E'Yahuah offers Ahaz a sign *in the depth, or in the height above* (Isaiah 7:11), but Ahaz refuses — *I will not ask, neither will I tempt Yahuah (LORD)* (7:12) — wearying Elohim, who answers the whole house anyway: *Hear ye now, O house of David... Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (7:13-14). This is the keystone. Matthew names it word for word as fulfilled: *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23), expressly *that it might be fulfilled which was spoken of Yahuah (Lord) by the prophet* (Matthew 1:22). The annunciation unfolds it: *thou shalt conceive in thy womb, and bring forth a son* (Luke 1:31), the *Son of the Highest* to whom *Yahuah Elohim (the Lord God) shall give... the throne of his father David* (Luke 1:32), reigning *over the house of Jacob for ever* (Luke 1:33), conceived by *the Ruach HaKodesh (Holy Spirit)* and called *the Son of Elohim (God)* (Luke 1:35). Read through the Formed and the Formless: God-with-us is the Formed Son — the One who appeared, spoke, and walked with His people throughout the Tanakh — now taking flesh; he is the Son of the Most High and has a Father. The name spans one Immanuel arc through Isaiah: *the stretching out of his wings shall fill the breadth of thy land, O Immanuel* (8:8), *for Elohim (God) is with us* (8:10), and *unto us a child is born, unto us a son is given... his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (9:6), *upon the throne of David... for ever* (9:7). The sign to the house of David is God Himself come near.',
       sv.verse_id, ev.verse_id, 'free', 26156
  FROM _s303_isa07_lookup sv, _s303_isa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Syria is confederate with Ephraim* (7:2) is the same northern-house enmity: *Manasseh, Ephraim... and they together shall be against Yahudah (Judah)* (Isaiah 9:21) — the divided kingdom, the ten tribes against the house of David.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-the-confederacy-of-syria-and-ephraim-against-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9) — Ephraim *broken, that it be not a people* (7:8) is the Lo-Ammi scattering of the northern house, covenant-judgment, not an ethnic end.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-the-confederacy-of-syria-and-ephraim-against-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *in the place where it was said... Ye are not my people, there it shall be said... Ye are the sons of the living Elohim (God)* (Hosea 1:10) — the breaking (7:8) is reversed in the same word; the regathering is the promise.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-the-confederacy-of-syria-and-ephraim-against-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people* (Isaiah 11:11) — Ephraim broken (7:8) is the remnant recovered the second time from the lands of scattering.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-the-confederacy-of-syria-and-ephraim-against-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* (Isaiah 11:13) — the very division of Isaiah 7 is the wound the two-stick regathering heals.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-the-confederacy-of-syria-and-ephraim-against-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Believe in Yahuah Elohaychem (the LORD your God), so shall ye be established* (2 Chronicles 20:20) — the same believe/established verb-pair as 7:9; to stand is to trust Yahuah.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-if-ye-will-not-believe-surely-ye-shall-not-be-established'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — the believing that establishes (7:9) is the faith of Abraham, father of the seed.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-if-ye-will-not-believe-surely-ye-shall-not-be-established'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5) — faith AND covenant-word together; the believing that establishes (7:9) is trust that obeys, never bare confession.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-if-ye-will-not-believe-surely-ye-shall-not-be-established'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Behold, a virgin shall be with child... and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23) — Isaiah 7:14 named word for word as fulfilled; the name unfolded as God-with-us.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*that it might be fulfilled which was spoken of Yahuah (Lord) by the prophet* (Matthew 1:22) — the virgin-sign (7:14) named expressly as the prophet''s word now fulfilled in the birth.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *thou shalt conceive in thy womb, and bring forth a son* (Luke 1:31) — the annunciation answers *a virgin shall conceive, and bear a son* (7:14); the promised child of the house of David named and born.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the sign to the HOUSE OF DAVID (7:14) fulfilled in the Davidic heir, the Son who has a Father.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — the Immanuel-child reigns over the two houses of Jacob, the throne the unbelieving could not hold (7:9) established without end.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the Ruach HaKodesh (Holy Spirit) shall come upon thee... that holy thing... shall be called the Son of Elohim (God)* (Luke 1:35) — the virgin conceives the sign-child (7:14) by the Spirit; God-with-us, the Formed Son born into flesh, who has a Father.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the stretching out of his wings shall fill the breadth of thy land, O Immanuel* (Isaiah 8:8) — the Immanuel of the sign (7:14) named again as the land''s own Lord; one Immanuel arc.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *speak the word, and it shall not stand: for Elohim (God) is with us* (Isaiah 8:10) — the name Immanuel (7:14) is its own confession: God is with us, so the confederacy''s counsel shall not stand.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *unto us a child is born, unto us a son is given... his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6) — the virgin''s son Immanuel (7:14) is the child born, El Gibbor among us.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*upon the throne of David... to establish it... for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:7) — the kingdom unbelief could not establish (7:9) Yahuah establishes for ever in Immanuel.'
  FROM cross_reference_threads t
  JOIN _s303_isa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s303_isa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-7-behold-a-virgin-shall-conceive-and-bear-a-son-immanuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_9.sql (Isaiah 9) -----
-- Chapter: Isaiah 9 — THE GREAT LIGHT and THE CHILD BORN. The dawn breaks first on the northern
-- house: *Nevertheless the dimness shall not be such as was in her vexation, when at the first he
-- lightly afflicted the land of Zebulun and the land of Naphtali... in Galilee of the nations. The
-- people that walked in darkness have seen a great light* (9:1-2) — the FIRST tribes carried off by
-- Assyria are the FIRST on whom the light shines, and Matthew quotes it verbatim of Messiah's
-- Galilean ministry (Matt 4:14-16). Then the keystone: *For unto us a child is born, unto us a son
-- is given... and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God),
-- Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (9:6) — the Formed Son who
-- bears the Name and the titles and HAS a Father, whose government rests *upon the throne of David*
-- (9:7), drawing the Davidic covenant (2 Sam 7) and Gabriel's word (Luke 1:32-33) and the Son of
-- Adam named before creation (1 Enoch 48). The chapter then turns to covenant-lawsuit against the
-- northern house — *Ephraim and the inhabitant of Samaria, that say in the pride and stoutness of
-- heart* (9:9) — Ephraim and Manasseh devouring each other (9:21), the refrain *For all this his
-- anger is not turned away, but his hand is stretched out still*. Conduct, not ethnicity; corrective
-- covenant-lawsuit, victims-not-enemies, a remnant guarded (Rom 11).
-- Tag: isa09   Temp view: _s303_isa09_lookup
-- Sort band: base 26200, step 3 -> threads at 26200, 26203, 26206, 26209 (4 threads)
-- Source of EVERY row: 'canon','isaiah',9,v
--
-- Isaiah 9 coverage:
--   ★ v.1-2 (the land of Zebulun and the land of Naphtali... Galilee of the nations. The people that
--          walked in darkness have seen a great light)
--        NT:     ★★★ Matthew 4:15-16 (The land of Zabulon, and the land of Nephthalim... Galilee of
--                the Gentiles; The people which sat in darkness saw great light) — THREAD 1 (verbatim),
--                ★ Luke 1:79 (To give light to them that sit in darkness and in the shadow of death) — THREAD 1
--        Extras: none warranted (the great-light dawn is the NT's own naming; no clean extras pull)
--        Tanakh: woven in prose (the two-house scattering of the northern tribes); no separate add forced
--   ★★★ v.6-7 (For unto us a child is born, unto us a son is given... his name shall be called
--          Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar
--          Shalom (The Prince of Peace)... upon the throne of David)
--        NT:     ★★★ Luke 1:32 (He shall be great, and shall be called the Son of the Highest: and
--                Yahuah Elohim shall give unto him the throne of his father David), Luke 1:33 (of his
--                kingdom there shall be no end) — THREAD 2 (the throne of David, no end)
--        Extras: ★ 1 Enoch 48:2 (that Son of Adam was named In the presence of Yahuah of Spirits),
--                1 Enoch 48:3 (before the sun... His name was named) — THREAD 2 (the Son named before
--                creation, the Elect One; clean witness, parse verified)
--        Tanakh: ★★ 2 Samuel 7:12 (I will set up thy seed after thee... and I will establish his
--                kingdom), 2 Samuel 7:13 (I will stablish the throne of his kingdom for ever),
--                2 Samuel 7:14 (I will be his father, and he shall be my son) — THREAD 2 (the Davidic
--                covenant the child fulfils; the Father/Son frame)
--   ★ v.8-10 (Yahuah sent a word into Jacob... Ephraim and the inhabitant of Samaria, that say in the
--          pride and stoutness of heart)
--        NT:     none warranted (the covenant-lawsuit against the northern house is Tanakh-internal)
--        Extras: none warranted
--        Tanakh: ★ Hosea 7:10 (the pride of Yashar'el (Israel) testifieth to his face: and they do
--                not return to Yahuah their Elohim), ★ Hosea 5:13 (then went Ephraim to the Assyrian)
--                — THREAD 3 (Ephraim's pride, the same northern-house lawsuit)
--   ★ v.11-21 (For all this his anger is not turned away, but his hand is stretched out still...
--          Manasseh, Ephraim; and Ephraim, Manasseh: and they together shall be against Yahudah)
--        NT:     none warranted (corrective covenant-judgment; the Rom 11 remnant guard held in prose)
--        Extras: none warranted
--        Tanakh: ★ Hosea 7:13 (Woe unto them! for they have fled from me... though I have redeemed
--                them, yet they have spoken lies against me) — THREAD 4 (the stretched-out hand;
--                self-devouring brothers, corrective not final, victims-not-enemies)
--
-- Threads (slug — target libraries):
--   1. isaiah-9-the-people-that-walked-in-darkness-have-seen-a-great-light — NT (Matthew 4, Luke 1) [free]
--      (★ the great light dawns FIRST on the scattered northern house — Galilee of the nations)
--   2. isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace — NT (Luke 1) + Tanakh
--      (2 Samuel 7) + Extras (1 Enoch 48) [extras]
--      (★★★ THE KEYSTONE — the Formed Son who bears the Name and titles and HAS a Father, the throne of David)
--   3. isaiah-9-the-word-against-jacob-ephraim-and-the-inhabitant-of-samaria — Tanakh (Hosea 5, 7) [free]
--      (★ covenant-lawsuit against the northern house — Ephraim's pride; conduct not ethnicity)
--   4. isaiah-9-his-hand-is-stretched-out-still — Tanakh (Hosea 7) [free]
--      (★ the threefold refrain; brothers devouring brothers; corrective, victims-not-enemies, remnant guarded)
--
-- Framing notes:
--   ★ THE GREAT LIGHT (THREAD 1): *The people that walked in darkness have seen a great light: they
--      that dwell in the land of the shadow of death, upon them hath the light shined* (9:2) — and the
--      land named is *the land of Zebulun and the land of Naphtali... Galilee of the nations* (9:1),
--      the FIRST tribes Assyria carried off, the northern house. Matthew quotes it verbatim of where
--      Messiah began: *The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond
--      Jordan, Galilee of the Gentiles; The people which sat in darkness saw great light* (Matt
--      4:15-16). Two-house weight: the light dawns FIRST on the scattered of Ephraim. Luke seals it —
--      *the dayspring from on high hath visited us, To give light to them that sit in darkness*
--      (Luke 1:78-79).
--   ★★★ THE CHILD BORN, THE FORMED SON (THREAD 2): *For unto us a child is born, unto us a son is
--      given... his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad
--      (The everlasting Father), Sar Shalom (The Prince of Peace)* (9:6). The titles — El Gibbor (the
--      mighty El) and Avi-ad (the Father of eternity) — are titles the Formed Son CARRIES as the
--      visible Glory who bears the Name; he is Yahuah and HAS a Father (the Formed and the Formless;
--      NOT trinitarian co-equal-persons, NOT modalist). His government is *upon the throne of David*
--      with *no end* (9:7) — Gabriel announces exactly this: *the throne of his father David: And he
--      shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke
--      1:32-33), fulfilling the Davidic covenant: *I will set up thy seed after thee... and I will
--      establish his kingdom... I will be his father, and he shall be my son* (2 Sam 7:12-14). The
--      restored witness names him before creation: *that Son of Adam was named In the presence of
--      Yahuah (God) of Spirits... before the sun and the signs were created... His name was named*
--      (1 Enoch 48:2-3) — the Elect One, the Formed Son foreknown.
--   ★ EPHRAIM'S PRIDE (THREAD 3): *Yahuah (Lord) sent a word into Jacob... even Ephraim and the
--      inhabitant of Samaria, that say in the pride and stoutness of heart* (9:8-9). The same lawsuit
--      Hosea presses on the northern house: *the pride of Yashar'el (Israel) testifieth to his face:
--      and they do not return to Yahuah (LORD) their Elohim (God)* (Hosea 7:10); and they ran to the
--      empire instead of repenting — *then went Ephraim to the Assyrian* (Hosea 5:13). Conduct, not
--      ethnicity; the prophets indict the sin within the covenant.
--   ★ THE STRETCHED-OUT HAND (THREAD 4): the threefold refrain *For all this his anger is not turned
--      away, but his hand is stretched out still* (9:12, 17, 21) closes a covenant-judgment in which
--      brothers devour brothers — *Manasseh, Ephraim; and Ephraim, Manasseh: and they together shall
--      be against Yahudah (Judah)* (9:21). Hosea sounds the same woe: *Woe unto them! for they have
--      fled from me... though I have redeemed them, yet they have spoken lies against me* (Hosea
--      7:13). The hand stretched out STILL is corrective, not final — the redeemed people fled, not
--      cast off; victims-not-enemies, the remnant guarded (Rom 11:1).
--   VERSES WITH NO SEPARATE ADD: v.3-5 (the joy, the broken yoke, the day of Midian — preface to the
--      child-born of THREAD 2, the burning/fuel of fire pointing to the warrior-victory the Prince of
--      Peace ends), v.13-16 (head and tail, the prophet that teacheth lies, the leaders that cause to
--      err — the lawsuit-detail woven into THREADS 3-4), v.18-20 (wickedness burning, the land
--      darkened, eating the flesh of his own arm — the self-consuming judgment of THREAD 4). All
--      recorded, none silently skipped.

CREATE TEMP VIEW _s303_isa09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The people that walked in darkness have seen a great light (the northern house first)
    ('canon','isaiah',9,1,'canon','matthew',4,15,'free',
      E'*The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles* (Matthew 4:15). Matthew names the very ground Isaiah named — *the land of Zebulun and the land of Naphtali... by the way of the sea, beyond Jordan, in Galilee of the nations* (Isaiah 9:1) — as where Messiah began to preach. The FIRST tribes Assyria carried off, the scattered northern house, are the first ground the light touches.'),
    ('canon','isaiah',9,2,'canon','matthew',4,16,'free',
      E'*The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up* (Matthew 4:16). This is Isaiah 9:2 word for word — *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined*. The dawn breaks first on Galilee of the nations, on the dispersed of Ephraim; the great light is the Messiah''s own coming.'),
    ('canon','isaiah',9,2,'canon','luke',1,79,'free',
      E'*To give light to them that sit in darkness and in the shadow of death, to guide our feet into the way of peace* (Luke 1:79). Zacharias sings the dawn Isaiah foresaw — *the dayspring from on high hath visited us* (Luke 1:78) — over the people who *walked in darkness* and *the land of the shadow of death* (Isaiah 9:2). The light that shines on the scattered house guides their feet *into the way of peace*, the Sar Shalom of 9:6.'),

    -- THREAD 2 (★★★): Unto us a child is born — El Gibbor, Avi-ad, Sar Shalom; the throne of David
    ('canon','isaiah',9,7,'canon','luke',1,32,'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The child whose *government shall be upon his shoulder* (Isaiah 9:6), set *upon the throne of David* (9:7), is the One Gabriel announces to Mary: given *the throne of his father David*. The everlasting Davidic kingdom of Isaiah 9 is the throne the Son of the Highest receives.'),
    ('canon','isaiah',9,7,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). Isaiah said *Of the increase of his government and peace there shall be no end* (Isaiah 9:7) — Gabriel echoes it exactly: *of his kingdom there shall be no end*. The endless government on David''s throne is the reign of the child born, the son given.'),
    ('canon','isaiah',9,6,'canon','2-samuel',7,14,'free',
      E'*I will be his father, and he shall be my son* (2 Samuel 7:14). The child called *Avi-ad (The everlasting Father)* and *El Gibbor (The mighty God)* (Isaiah 9:6) carries the Name and the titles as the Formed Son, the visible Glory — and he HAS a Father: *I will be his father, and he shall be my son*. The Davidic son stands in the Father/Son frame, not as a co-equal person but as the Formed One drawn from the Formless Source.'),
    ('canon','isaiah',9,7,'canon','2-samuel',7,12,'free',
      E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). The government *upon the throne of David* with no end (Isaiah 9:7) is the very covenant sworn to David — the *seed* whose *kingdom* Yahuah will *establish*. The child born is the promised Davidic seed.'),
    ('canon','isaiah',9,7,'canon','2-samuel',7,13,'free',
      E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). Isaiah''s *upon the throne of David, and upon his kingdom, to order it, and to establish it... from henceforth even for ever* (Isaiah 9:7) is the Davidic oath fulfilled — *I will stablish the throne of his kingdom for ever*. *The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (9:7).'),
    ('canon','isaiah',9,6,'enoch','1-enoch',48,2,'extras',
      E'*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2). The child whose *name shall be called Wonderful, Counsellor, El Gibbor (The mighty God)* (Isaiah 9:6) is the One the restored witness sees named in heaven — *that Son of Adam was named In the presence of Yahuah (God) of Spirits*. The Formed Son, the Elect One, bears his Name before the throne.'),
    ('canon','isaiah',9,6,'enoch','1-enoch',48,3,'extras',
      E'*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). The son given, named *Avi-ad (The everlasting Father)* (Isaiah 9:6), was named before creation itself — *before the sun and the signs were created... His name was named*. The everlasting One is the Formed Son foreknown before the world, drawn from the Formless Father.'),

    -- THREAD 3 (★): The word against Jacob — Ephraim and the inhabitant of Samaria (covenant-lawsuit)
    ('canon','isaiah',9,9,'canon','hosea',7,10,'free',
      E'*And the pride of Yashar''el (Israel) testifieth to his face: and they do not return to Yahuah (LORD) their Elohim (God), nor seek him for all this* (Hosea 7:10). Isaiah indicts *Ephraim and the inhabitant of Samaria, that say in the pride and stoutness of heart* (Isaiah 9:9); Hosea presses the same lawsuit on the same northern house — *the pride of Yashar''el (Israel) testifieth to his face*. The sin is the pride that will not return; conduct within the covenant, never ethnicity.'),
    ('canon','isaiah',9,10,'canon','hosea',5,13,'free',
      E'*When Ephraim saw his sickness, and Yahudah (Judah) saw his wound, then went Ephraim to the Assyrian, and sent to king Jareb: yet could he not heal you* (Hosea 5:13). Isaiah''s defiant boast — *The bricks are fallen down, but we will build with hewn stones* (Isaiah 9:10) — is the same self-reliance Hosea names: instead of turning, *Ephraim* ran *to the Assyrian* for healing he could not give. The northern house rebuilds and seeks the empire rather than seeking Yahuah.'),

    -- THREAD 4 (★): His hand is stretched out still (brothers devouring brothers; corrective, not final)
    ('canon','isaiah',9,21,'canon','hosea',7,13,'free',
      E'*Woe unto them! for they have fled from me: destruction unto them! because they have transgressed against me: though I have redeemed them, yet they have spoken lies against me* (Hosea 7:13). Isaiah''s judgment — *Manasseh, Ephraim; and Ephraim, Manasseh: and they together shall be against Yahudah (Judah). For all this his anger is not turned away, but his hand is stretched out still* (Isaiah 9:21) — is Hosea''s woe over the same fled people: *though I have redeemed them, yet they have spoken lies against me*. The redeemed who fled are corrected, not cast off; the stretched-out hand is still reaching.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-9-the-people-that-walked-in-darkness-have-seen-a-great-light',
       E'The people that walked in darkness have seen a great light — the dawn on the northern house',
       E'The light Isaiah promises dawns first on the very ground Assyria struck first: *Nevertheless the dimness shall not be such as was in her vexation, when at the first he lightly afflicted the land of Zebulun and the land of Naphtali, and afterward did more grievously afflict her by the way of the sea, beyond Jordan, in Galilee of the nations. The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* (Isaiah 9:1-2). Zebulun and Naphtali were the FIRST tribes carried off — the scattered of Ephraim, the northern house — and they are the first on whom the light shines. Matthew names exactly this as where Messiah began: *leaving Nazareth, he came and dwelt in Capernaum, which is upon the sea coast, in the borders of Zabulon and Nephthalim: That it might be fulfilled which was spoken by Esaias the prophet, saying, The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles; The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up* (Matthew 4:13-16). And Zacharias sings the same dawn over the same darkness: *the dayspring from on high hath visited us, To give light to them that sit in darkness and in the shadow of death, to guide our feet into the way of peace* (Luke 1:78-79). The great light is the Messiah''s coming, and it breaks first upon the dispersed northern house — two-house light, the way of peace prepared for the scattered.',
       sv.verse_id, ev.verse_id, 'free', 26200
  FROM _s303_isa09_lookup sv, _s303_isa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace',
       E'Unto us a child is born — El Gibbor, Avi-ad, Sar Shalom, upon the throne of David',
       E'Here is the keystone of the chapter: *For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace). Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:6-7). The titles — *El Gibbor (The mighty God)*, the mighty El, and *Avi-ad (The everlasting Father)*, the Father of eternity — are titles the Formed Son carries as the visible Glory who bears the Name. This is the Formed and the Formless: the child given is Yahuah and HAS a Father — the One drawn from the Formless Source — not a co-equal trinitarian person, not a modalist collapse, but the Formed Son who took flesh. His throne is David''s. Gabriel announces precisely this kingdom: *He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33) — the *no end* of Isaiah 9:7 word for word. And it is the Davidic covenant fulfilled: *I will set up thy seed after thee... and I will establish his kingdom. He shall build an house for my name, and I will stablish the throne of his kingdom for ever... I will be his father, and he shall be my son* (2 Samuel 7:12-14) — the Father/Son frame, the everlasting throne. The restored witness names the Son before creation itself: *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days. Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:2-3) — the Elect One, the Formed Son foreknown before the world. The child born is the everlasting King, and *the zeal of Yahuah Tseva''ot (LORD of hosts) will perform this*.',
       sv.verse_id, ev.verse_id, 'extras', 26203
  FROM _s303_isa09_lookup sv, _s303_isa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-9-the-word-against-jacob-ephraim-and-the-inhabitant-of-samaria',
       E'The word against Jacob — Ephraim and the inhabitant of Samaria, the pride of the heart',
       E'The chapter turns from the great light to a covenant-lawsuit against the northern house: *Yahuah (Lord) sent a word into Jacob, and it hath lighted upon Yashar''el (Israel). And all the people shall know, even Ephraim and the inhabitant of Samaria, that say in the pride and stoutness of heart, The bricks are fallen down, but we will build with hewn stones: the sycomores are cut down, but we will change them into cedars* (Isaiah 9:8-10). The sin is pride — the defiant resolve to rebuild bigger rather than to repent. Hosea presses the very same indictment on the very same house: *the pride of Yashar''el (Israel) testifieth to his face: and they do not return to Yahuah (LORD) their Elohim (God), nor seek him for all this* (Hosea 7:10). And rather than turning, Ephraim ran to the empire: *When Ephraim saw his sickness, and Yahudah (Judah) saw his wound, then went Ephraim to the Assyrian, and sent to king Jareb: yet could he not heal you, nor cure you of your wound* (Hosea 5:13). This is conduct within the covenant — the prophets indict the pride and the false self-reliance of the northern house, never the people as an ethnicity. The grandmother who inherited the lie is a lost sheep, not an enemy.',
       sv.verse_id, ev.verse_id, 'free', 26206
  FROM _s303_isa09_lookup sv, _s303_isa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-9-his-hand-is-stretched-out-still',
       E'His hand is stretched out still — brothers devouring brothers, the corrective hand',
       E'The judgment of the chapter closes with a refrain sounded three times — *For all this his anger is not turned away, but his hand is stretched out still* (Isaiah 9:12, 17, 21) — over a people consuming itself: *And he shall snatch on the right hand, and be hungry; and he shall eat on the left hand, and they shall not be satisfied: they shall eat every man the flesh of his own arm: Manasseh, Ephraim; and Ephraim, Manasseh: and they together shall be against Yahudah (Judah)* (Isaiah 9:20-21). The two halves of the northern house devour each other, then turn together against the south — the divided kingdom tearing itself apart. Yet the hand stretched out STILL is the hand of One who has not let go. Hosea names the same woe over the same fled people: *Woe unto them! for they have fled from me: destruction unto them! because they have transgressed against me: though I have redeemed them, yet they have spoken lies against me* (Hosea 7:13). They are the redeemed who fled, corrected, not cast off — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The stretched-out hand is corrective covenant-lawsuit, not a final rejection; victims-not-enemies, with a remnant guarded and a regathering still to come.',
       sv.verse_id, ev.verse_id, 'free', 26209
  FROM _s303_isa09_lookup sv, _s303_isa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The land of Zabulon, and the land of Nephthalim... Galilee of the Gentiles* (Matthew 4:15) — Matthew names the very ground of Isaiah 9:1, the first tribes Assyria carried off, as where Messiah began.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-the-people-that-walked-in-darkness-have-seen-a-great-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *The people which sat in darkness saw great light* (Matthew 4:16) — Isaiah 9:2 word for word; the dawn breaks first on the scattered northern house.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-the-people-that-walked-in-darkness-have-seen-a-great-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *To give light to them that sit in darkness and in the shadow of death, to guide our feet into the way of peace* (Luke 1:79) — Zacharias sings the dawn of Isaiah 9:2, the way of peace of the Sar Shalom.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=79
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-the-people-that-walked-in-darkness-have-seen-a-great-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the government upon his shoulder (Isaiah 9:6) set upon David''s throne; Gabriel''s word to Mary.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *of his kingdom there shall be no end* (Luke 1:33) — the *no end* of Isaiah 9:7 word for word; the endless government on David''s throne.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will be his father, and he shall be my son* (2 Samuel 7:14) — the child called *Avi-ad* and *El Gibbor* (Isaiah 9:6) is the Formed Son who HAS a Father; the Father/Son frame, not co-equal persons.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12) — the throne of David of Isaiah 9:7 is the Davidic covenant; the child born is the promised seed.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — Isaiah''s *establish it... for ever* (9:7); *the zeal of Yahuah Tseva''ot (LORD of hosts) will perform this*.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *that Son of Adam was named In the presence of Yahuah (God) of Spirits* (1 Enoch 48:2) — the child whose *name shall be called* (Isaiah 9:6) is the Elect One named in heaven before the throne.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *before the sun and the signs were created... His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3) — the son given, *Avi-ad (The everlasting Father)* (Isaiah 9:6), foreknown before the world, the Formed Son drawn from the Formless.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-unto-us-a-child-is-born-the-mighty-el-the-prince-of-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the pride of Yashar''el (Israel) testifieth to his face: and they do not return to Yahuah (LORD) their Elohim (God)* (Hosea 7:10) — the same lawsuit on the same northern house as *the pride and stoutness of heart* of Isaiah 9:9.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-the-word-against-jacob-ephraim-and-the-inhabitant-of-samaria'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *then went Ephraim to the Assyrian, and sent to king Jareb: yet could he not heal you* (Hosea 5:13) — Isaiah''s defiant *we will build with hewn stones* (9:10) is the same self-reliance: rebuild and run to the empire rather than return to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-the-word-against-jacob-ephraim-and-the-inhabitant-of-samaria'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Woe unto them! for they have fled from me... though I have redeemed them, yet they have spoken lies against me* (Hosea 7:13) — Isaiah''s self-devouring judgment (9:21) is Hosea''s woe over the redeemed who fled; corrected, not cast off, the hand stretched out still.'
  FROM cross_reference_threads t
  JOIN _s303_isa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=9 AND sv.verse_number=21
  JOIN _s303_isa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-9-his-hand-is-stretched-out-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_11.sql (Isaiah 11) -----
-- Chapter: Isaiah 11 — THE BRANCH AND THE SECOND-TIME REGATHERING. The Davidic Messiah springs
-- from the felled stump of Jesse: *And there shall come forth a rod out of the stem of Jesse, and a
-- Branch shall grow out of his roots* (11:1); the sevenfold Spirit rests on him (11:2); with the
-- breath of his lips he slays the wicked (11:4); the wolf dwells with the lamb and the earth is full
-- of the knowledge of Yahuah (11:6-9); the root of Jesse stands for an ensign and the nations seek
-- him (11:10); and Yahuah sets his hand AGAIN THE SECOND TIME to gather both houses — the outcasts of
-- Yashar'el and the dispersed of Yahudah — Ephraim and Yahudah no longer adversaries (11:11-13); a
-- highway for the remnant like the day Yashar'el came up out of Egypt (11:15-16). The two-house
-- regathering keystone; never replacement, both branches are Yashar'el.
-- Tag: isa11   Temp view: _s303_isa11_lookup   Session prefix: s303
-- Sort band: base 26250, step 3 -> threads at 26250, 26253, 26256, 26259, 26262, 26265, 26268 (7 threads)
-- Source of EVERY row: 'canon','isaiah',11,v
--
-- Isaiah 11 coverage:
--   ★ v.1 (there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots)
--        NT:     none warranted distinct (the Root-of-Jesse NT weave is THREAD 5 at v.10; the Branch
--                christology here is carried by the Tanakh Branch-prophets)
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 23:5 (I will raise unto David a righteous Branch), ★ Zechariah 6:12-13
--                (Behold the man whose name is The BRANCH... he shall be a priest upon his throne) — THREAD 1
--   ★★ v.2 (the spirit of Yahuah shall rest upon him, the spirit of wisdom and understanding, the spirit
--          of counsel and might, the spirit of knowledge and of the fear of Yahuah)
--        NT:     ★ Revelation 5:6 (seven horns and seven eyes, which are the seven Spirits of Elohim) — THREAD 2
--        Extras: ★★ 1 Enoch 49:2-3 (in him dwells the spirit of wisdom, the spirit of understanding and
--                of might — the Elect One before Yahuah of Spirits) — THREAD 2
--        Tanakh: woven in prose (the anointing); no separate Tanakh add forced
--   v.3-5 (with righteousness shall he judge... he shall smite the earth with the rod of his mouth, and
--          with the breath of his lips shall he slay the wicked... righteousness shall be the girdle of his loins)
--        NT:     ★★ 2 Thessalonians 2:8 (whom Yahuah shall consume with the spirit of his mouth), ★★
--                Revelation 19:11 (in righteousness he doth judge and make war), ★★ Revelation 19:15
--                (out of his mouth goeth a sharp sword) — THREAD 3; Ephesians 6:14 (loins girt, breastplate
--                of righteousness) woven in prose
--        Extras: none warranted
--        Tanakh: held in prose
--   v.6-9 (the wolf shall dwell with the lamb... they shall not hurt nor destroy in all my holy mountain:
--          for the earth shall be full of the knowledge of Yahuah, as the waters cover the sea)
--        NT:     none warranted distinct (the new-creation peace is consummated in Revelation 21-22, woven
--                in prose; the cleanest verbatim partner is the Tanakh twin)
--        Extras: none warranted
--        Tanakh: ★ Habakkuk 2:14 (the earth shall be filled with the knowledge of the glory of Yahuah, as
--                the waters cover the sea) — THREAD 4 (near-verbatim twin)
--   ★ v.10 (in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to
--          it shall the Gentiles seek)
--        NT:     ★★ Romans 15:12 (Paul quotes it verbatim: There shall be a root of Jesse... in him shall
--                the Gentiles trust) — THREAD 5
--        Extras: none warranted
--        Tanakh: woven in prose
--   ★★★ v.11-13 (Yahuah shall set his hand again the second time to recover the remnant of his people...
--          assemble the outcasts of Yashar'el, and gather together the dispersed of Yahudah... Ephraim shall
--          not envy Yahudah, and Yahudah shall not vex Ephraim) — THE TWO-HOUSE KEYSTONE
--        NT:     none warranted distinct (the regathering's NT root is Romans 11 not-cast-away, woven in
--                prose as guard; the load is the Tanakh two-house witnesses)
--        Extras: none warranted (clean; no extras forced on the keystone)
--        Tanakh: ★★★ Ezekiel 37:19 (I will take the stick of Joseph... and the stick of Yahudah, and make
--                them one stick), ★★★ Ezekiel 37:22 (they shall be no more two nations), ★★ Jeremiah 31:10
--                (He that scattered Yashar'el will gather him), ★★ Hosea 1:11 (the children of Yahudah and
--                the children of Yashar'el be gathered together... one head) — THREAD 6
--   v.15-16 (a highway for the remnant of his people, which shall be left, from Assyria; like as it was to
--          Yashar'el in the day that he came up out of the land of Egypt)
--        NT:     none warranted distinct (the new-Exodus regathering is Tanakh-anchored)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 35:8 (an highway... The way of holiness), ★ Jeremiah 31:8 (I will bring them from
--                the north country, and gather them from the coasts of the earth) — THREAD 7
--   v.14 (they shall fly upon the shoulders of the Philistines... lay their hand upon Edom and Moab)
--        NT/Extras/Tanakh: none warranted (the restored-dominion detail is held within THREAD 6's
--                regathering prose; no separate cross-reference forced)
--
-- Threads (slug — target libraries):
--   1. isaiah-11-a-branch-out-of-the-stem-of-jesse — Tanakh (Jeremiah 23, Zechariah 6) [free]
--      (★ the Netzer/Branch — the Davidic Messiah from the felled stump, King and Priest)
--   2. isaiah-11-the-spirit-of-yahuah-shall-rest-upon-him — NT (Revelation 5) + Extras (1 Enoch 49) [extras]
--      (★★ the sevenfold Spirit on the Formed Son, the Elect One)
--   3. isaiah-11-the-breath-of-his-lips-shall-slay-the-wicked — NT (2 Thessalonians 2, Revelation 19) [free]
--      (righteous judgment; the breath/sword of his mouth that slays the Wicked)
--   4. isaiah-11-the-earth-full-of-the-knowledge-of-yahuah — Tanakh (Habakkuk 2) [free]
--      (the restored creation; not hurt nor destroy in all my holy mountain)
--   5. isaiah-11-a-root-of-jesse-to-it-shall-the-gentiles-seek — NT (Romans 15) [free]
--      (★★ Paul quotes 11:10 verbatim; the nations grafted into Yashar'el, NOT a replacement people)
--   6. isaiah-11-the-second-time-to-recover-the-remnant — Tanakh (Ezekiel 37, Jeremiah 31, Hosea 1) [free]
--      (★★★ THE TWO-HOUSE KEYSTONE — both houses gathered the second time, made one)
--   7. isaiah-11-a-highway-for-the-remnant-of-his-people — Tanakh (Isaiah 35, Jeremiah 31) [free]
--      (the second Exodus / new-Exodus highway home from Assyria)
--
-- Framing notes:
--   ★ THE BRANCH (THREAD 1): *And there shall come forth a rod out of the stem of Jesse, and a Branch shall
--      grow out of his roots* (11:1). The stump of Jesse was cut down (the holy-seed stump of Isaiah 6:13)
--      yet the living root survives — and from it the Netzer (Branch) grows. The Branch-prophets name him
--      the righteous Davidic King: *I will raise unto David a righteous Branch, and a King shall reign and
--      prosper* (Jeremiah 23:5), *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6); and
--      Zechariah crowns him King-Priest: *Behold the man whose name is The BRANCH... he shall be a priest
--      upon his throne* (Zechariah 6:12-13). One Branch across the prophets.
--   ★★ THE SEVENFOLD SPIRIT (THREAD 2): *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of
--      wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of
--      Yahuah* (11:2). The Formed Son anointed without measure. Revelation shows the seven Spirits on the
--      Lamb who is the Root of David: *seven horns and seven eyes, which are the seven Spirits of Elohim
--      (God)* (Revelation 5:6) — and that Lamb is *the Root of David* (Revelation 5:5), the very root of
--      Jesse (11:10). The restored witness names the same anointed One: *in him dwells the spirit of wisdom,
--      And the spirit which gives insight, And the spirit of understanding and of might... For he is the
--      Elect One before Yahuah (God) of Spirits* (1 Enoch 49:3,2). The Elect One bearing the sevenfold
--      Spirit is the Branch of Jesse.
--   THE BREATH OF HIS LIPS (THREAD 3): *with righteousness shall he judge the poor... and he shall smite the
--      earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (11:4),
--      *righteousness shall be the girdle of his loins* (11:5). Paul takes the breath-of-his-lips straight
--      forward: *whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the
--      brightness of his coming* (2 Thessalonians 2:8). And the returning King: *in righteousness he doth
--      judge and make war* (Revelation 19:11), *out of his mouth goeth a sharp sword, that with it he should
--      smite the nations: and he shall rule them with a rod of iron* (Revelation 19:15). The rod of his
--      mouth, the breath of his lips, the righteous judgment — one Messiah. (The girdle of righteousness is
--      put on the saints: *loins girt about with truth... the breastplate of righteousness*, Ephesians 6:14.)
--   THE KNOWLEDGE OF YAHUAH (THREAD 4): *They shall not hurt nor destroy in all my holy mountain: for the
--      earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (11:9). Habakkuk
--      sings the same line: *For the earth shall be filled with the knowledge of the glory of Yahuah (LORD),
--      as the waters cover the sea* (Habakkuk 2:14) — the restored creation, the holy mountain at peace, the
--      wolf with the lamb, consummated in the new heavens and new earth.
--   ★★ THE ROOT OF JESSE (THREAD 5): *in that day there shall be a root of Jesse, which shall stand for an
--      ensign of the people; to it shall the Gentiles seek* (11:10). Paul quotes it verbatim to seal the
--      nations' inclusion: *There shall be a root of Jesse, and he that shall rise to reign over the
--      Gentiles; in him shall the Gentiles trust* (Romans 15:12). The nations seeking the root of Jesse are
--      grafted INTO Yashar'el's olive tree (Romans 11) — not a replacement people; the wild branches grown
--      back to the same root.
--   ★★★ THE SECOND TIME (THREAD 6 — KEYSTONE): *Yahuah (Lord) shall set his hand again the second time to
--      recover the remnant of his people... And he shall set up an ensign for the nations, and shall assemble
--      the outcasts of Yashar'el (Israel), and gather together the dispersed of Yahudah (Judah) from the
--      four corners of the earth. The envy also of Ephraim shall depart... Ephraim shall not envy Yahudah,
--      and Yahudah shall not vex Ephraim* (11:11-13). This is the two-house regathering: BOTH houses — the
--      scattered northern outcasts (Yashar'el/Ephraim/Joseph) AND the dispersed of Yahudah — gathered the
--      SECOND time, made one, no longer adversaries. Ezekiel's two sticks are the same word: *I will take
--      the stick of Joseph... and will put them with him, even with the stick of Yahudah (Judah), and make
--      them one stick, and they shall be one in mine hand* (Ezekiel 37:19); *they shall be no more two
--      nations, neither shall they be divided into two kingdoms any more at all* (37:22). Jeremiah: *He that
--      scattered Yashar'el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah
--      31:10). Hosea: *Then shall the children of Yahudah (Judah) and the children of Yashar'el (Israel) be
--      gathered together, and appoint themselves one head* (Hosea 1:11). NEVER replacement — Yahuah hath not
--      cast away his people (Romans 11:1-2); both olive branches are Yashar'el.
--   THE HIGHWAY (THREAD 7): *And there shall be an highway for the remnant of his people, which shall be
--      left, from Assyria; like as it was to Yashar'el (Israel) in the day that he came up out of the land
--      of Egypt* (11:16). The second Exodus — a new-Exodus regathering home from the nations. Isaiah's own
--      highway: *And an highway shall be there... it shall be called The way of holiness... the redeemed
--      shall walk there* (Isaiah 35:8-9); and Jeremiah's ingathering: *I will bring them from the north
--      country, and gather them from the coasts of the earth... a great company shall return thither*
--      (Jeremiah 31:8). The remnant walks home as Yashar'el once walked out of Egypt.
--   VERSES WITH NO SEPARATE ADD: v.3 (quick understanding in the fear of Yahuah — preface to the judgment of
--      THREAD 3), v.5 (the girdle of righteousness — woven into THREAD 3, Ephesians 6:14 in prose), v.7-8
--      (the cow and the bear, the sucking child on the asp's hole — woven into THREAD 4's holy-mountain
--      peace), v.14 (dominion over Philistia, Edom, Moab, Ammon — held in THREAD 6's regathering prose).
--      All recorded, none silently skipped.

CREATE TEMP VIEW _s303_isa11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): A Branch out of the stem of Jesse — the Netzer/Davidic Messiah
    ('canon','isaiah',11,1,'canon','jeremiah',23,5,'free',
      E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). The *Branch* that grows from *the stem of Jesse* (Isaiah 11:1) is the *righteous Branch* raised unto David — a *King* who reigns in *judgment and justice*. The same Branch-prophecy: the felled stump of David''s house springs the King.'),
    ('canon','isaiah',11,1,'canon','jeremiah',23,6,'free',
      E'*In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6). The Branch of *the stem of Jesse* (Isaiah 11:1) is named *Yahuah Tsidkenu* — and in his days BOTH houses, *Yahudah* and *Yashar''el*, are saved and dwell safely. The Branch is the Messiah who gathers the two houses (Isaiah 11:11-13).'),
    ('canon','isaiah',11,1,'canon','zechariah',6,12,'free',
      E'*Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). The *Branch* that *shall grow out of his roots* (Isaiah 11:1) is *the man whose name is The BRANCH*, who *shall grow up out of his place* and build Yahuah''s temple. One named Branch across the prophets — the Davidic Messiah.'),
    ('canon','isaiah',11,1,'canon','zechariah',6,13,'free',
      E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). The Branch of Jesse (Isaiah 11:1) is crowned King AND Priest — *he shall sit and rule upon his throne... and he shall be a priest upon his throne*. The rod from Jesse''s stem reigns as the priest-king after the order of Melek Tsadiq.'),

    -- THREAD 2 (★★): The spirit of Yahuah shall rest upon him — the sevenfold Spirit, the Elect One
    ('canon','isaiah',11,2,'canon','revelation',5,6,'extras',
      E'*And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6). The sevenfold *spirit of Yahuah (LORD)* that rests upon the Branch (Isaiah 11:2) is the *seven Spirits of Elohim* on the Lamb — who is *the Root of David* (Revelation 5:5), the very root of Jesse (11:10). The anointed Branch and the seven-Spirit Lamb are one.'),
    ('canon','isaiah',11,2,'enoch','1-enoch',49,3,'extras',
      E'*And in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might, And the spirit of those who have fallen asleep in righteousness* (1 Enoch 49:3). The *spirit of wisdom and understanding... the spirit of counsel and might* resting on the Branch (Isaiah 11:2) is the same anointing the restored witness names on the Elect One — *in him dwells the spirit of wisdom... the spirit of understanding and of might*. The sevenfold Spirit on the chosen One.'),
    ('canon','isaiah',11,2,'enoch','1-enoch',49,2,'extras',
      E'*For he is mighty in all the secrets of righteousness... Because the Elect One standeth before Yahuah (God) of Spirits, And his glory is for ever and ever, And his might unto all generations* (1 Enoch 49:2). The One on whom *the spirit of Yahuah (LORD) shall rest* (Isaiah 11:2) is the Elect One who *standeth before Yahuah (God) of Spirits*, mighty *in all the secrets of righteousness* — the Branch anointed to *judge the secret things* (1 Enoch 49:4; Isaiah 11:3-4).'),

    -- THREAD 3: The breath of his lips shall slay the wicked — righteous judgment
    ('canon','isaiah',11,4,'canon','2-thessalonians',2,8,'free',
      E'*And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). Paul takes the Branch''s weapon straight forward: *with the breath of his lips shall he slay the wicked* (Isaiah 11:4) becomes *whom Yahuah (Lord) shall consume with the spirit of his mouth*. The Wicked / man of sin is slain by the breath of the Messiah''s mouth — no sword of iron, the word of his lips.'),
    ('canon','isaiah',11,4,'canon','revelation',19,11,'free',
      E'*And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war* (Revelation 19:11). *With righteousness shall he judge... and reprove with equity for the meek of the earth* (Isaiah 11:4) is the returning King who *in righteousness... doth judge and make war*. The same righteous Judge, now revealed in glory.'),
    ('canon','isaiah',11,4,'canon','revelation',19,15,'free',
      E'*And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron* (Revelation 19:15). *He shall smite the earth with the rod of his mouth* (Isaiah 11:4) is fulfilled in the King out of whose *mouth goeth a sharp sword, that with it he should smite the nations*. The rod of his mouth IS the sharp sword; the breath of his lips slays the wicked.'),

    -- THREAD 4: The earth full of the knowledge of Yahuah — the restored creation
    ('canon','isaiah',11,9,'canon','habakkuk',2,14,'free',
      E'*For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). The holy-mountain peace — *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9) — is Habakkuk''s same line word for word. The restored creation where nothing hurts nor destroys, the whole earth flooded with the knowledge of Yahuah.'),

    -- THREAD 5 (★★): A root of Jesse — to it shall the Gentiles seek (Paul quotes verbatim)
    ('canon','isaiah',11,10,'canon','romans',15,12,'free',
      E'*And again, Esaias saith, There shall be a root of Jesse, and he that shall rise to reign over the Gentiles; in him shall the Gentiles trust* (Romans 15:12). Paul quotes Isaiah 11:10 verbatim to seal the nations'' inclusion — *there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek*. The nations seeking the root of Jesse are grafted INTO Yashar''el''s olive tree, the wild branches grown back to the same root — never a replacement people.'),

    -- THREAD 6 (★★★): The second time to recover the remnant — THE TWO-HOUSE KEYSTONE
    ('canon','isaiah',11,12,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The assembling of *the outcasts of Yashar''el (Israel)* and *the dispersed of Yahudah (Judah)* (Isaiah 11:12) is Ezekiel''s two sticks made one — Joseph/Ephraim joined to Yahudah, *one stick... one in mine hand*. The two-house regathering, both houses made one.'),
    ('canon','isaiah',11,13,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). *Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* (Isaiah 11:13) is the end of the division — *no more two nations*, one nation under one king. The envy departs because the two kingdoms become one in Yahuah''s hand.'),
    ('canon','isaiah',11,11,'canon','jeremiah',31,10,'free',
      E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people* (Isaiah 11:11) is the same shepherd-promise — *He that scattered Yashar''el will gather him*. The One who scattered the northern house through Assyria gathers them home the second time.'),
    ('canon','isaiah',11,12,'canon','hosea',1,11,'free',
      E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). The gathering of *the outcasts of Yashar''el* and *the dispersed of Yahudah* (Isaiah 11:12) is Hosea''s reversal of Lo-ammi (*not my people*, Hosea 1:9): both houses *gathered together, and appoint themselves one head*. The scattered are made one people again.'),

    -- THREAD 7: A highway for the remnant — the second Exodus / new-Exodus
    ('canon','isaiah',11,16,'canon','isaiah',35,8,'free',
      E'*And an highway shall be there, and a way, and it shall be called The way of holiness; the unclean shall not pass over it; but it shall be for those: the wayfaring men, though fools, shall not err therein* (Isaiah 35:8). The *highway for the remnant of his people, which shall be left, from Assyria* (Isaiah 11:16) is Isaiah''s own *way of holiness* — the redeemed road home. The second Exodus walks the holy highway out of the nations.'),
    ('canon','isaiah',11,16,'canon','jeremiah',31,8,'free',
      E'*Behold, I will bring them from the north country, and gather them from the coasts of the earth, and with them the blind and the lame, the woman with child and her that travaileth with child together: a great company shall return thither* (Jeremiah 31:8). The highway for the remnant *like as it was to Yashar''el (Israel) in the day that he came up out of the land of Egypt* (Isaiah 11:16) is Jeremiah''s ingathering — *a great company shall return* from the north and the coasts of the earth. The new Exodus, the remnant walking home.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-11-a-branch-out-of-the-stem-of-jesse',
       E'A Branch out of the stem of Jesse — the Netzer, the Davidic King-Priest',
       E'The chapter opens with the Messiah springing from a felled tree: *And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). The stump of David''s house was cut down — yet the holy seed survives (Isaiah 6:13), and from the living root the Netzer (Branch) grows. The Branch-prophets name him. Jeremiah: *Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5), *and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (23:6) — and *in his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely*, both houses kept. Zechariah crowns him King AND Priest: *Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12); *he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne* (6:13). One named Branch across the prophets — the rod from Jesse''s stem, the priest-king who reigns in righteousness.',
       sv.verse_id, ev.verse_id, 'free', 26250
  FROM _s303_isa11_lookup sv, _s303_isa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-11-the-spirit-of-yahuah-shall-rest-upon-him',
       E'The Spirit of Yahuah shall rest upon him — the sevenfold Spirit, the Elect One',
       E'The Branch is anointed without measure: *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2) — the sevenfold Spirit on the Formed Son. Revelation shows that very Spirit on the Lamb who is the root of Jesse: the elder names him *the Lion of the tribe of Juda, the Root of David* (Revelation 5:5), and then John beholds *a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6). The seven Spirits on the Root of David are the sevenfold Spirit resting on the Branch of Jesse. The restored witness names the same anointed One — the Elect One: *For he is mighty in all the secrets of righteousness... Because the Elect One standeth before Yahuah (God) of Spirits* (1 Enoch 49:2); *And in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might* (49:3). The Elect One bearing the spirit of wisdom and understanding and might is the Branch of Jesse, anointed to judge the secret things in righteousness (Isaiah 11:3-4; 1 Enoch 49:4).',
       sv.verse_id, ev.verse_id, 'extras', 26253
  FROM _s303_isa11_lookup sv, _s303_isa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-11-the-breath-of-his-lips-shall-slay-the-wicked',
       E'The breath of his lips shall slay the wicked — the righteous Judge',
       E'The Branch judges not by appearance but in righteousness: *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4); *and righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins* (11:5). His weapon is the word of his mouth. Paul takes it straight forward to the man of sin: *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). And the returning King carries the same: *and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war* (Revelation 19:11); *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron* (Revelation 19:15). The rod of his mouth IS the sharp sword; the breath of his lips slays the Wicked — one righteous Judge from prophecy to consummation. (The girdle of righteousness is put on his people too: *Stand therefore, having your loins girt about with truth, and having on the breastplate of righteousness*, Ephesians 6:14.)',
       sv.verse_id, ev.verse_id, 'free', 26256
  FROM _s303_isa11_lookup sv, _s303_isa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=11 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-11-the-earth-full-of-the-knowledge-of-yahuah',
       E'The earth full of the knowledge of Yahuah — the restored creation at peace',
       E'The Branch''s reign restores creation itself: *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them* (Isaiah 11:6); *And the sucking child shall play on the hole of the asp, and the weaned child shall put his hand on the cockatrice'' den* (11:8). The enmity is undone — and the reason is given: *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (11:9). Habakkuk sings the very same line: *For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). The holy mountain where nothing hurts nor destroys, the whole earth flooded with the knowledge of Yahuah — the peace the prophets see consummated in the restored creation, where the curse of Eden is lifted and the seed-war ends.',
       sv.verse_id, ev.verse_id, 'free', 26259
  FROM _s303_isa11_lookup sv, _s303_isa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-11-a-root-of-jesse-to-it-shall-the-gentiles-seek',
       E'A root of Jesse — to it shall the nations seek (Paul quotes it verbatim)',
       E'The Branch becomes a standard the nations rally to: *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious* (Isaiah 11:10). Paul reaches for this verse to seal the nations'' inclusion in the closing argument of Romans: *And again, Esaias saith, There shall be a root of Jesse, and he that shall rise to reign over the Gentiles; in him shall the Gentiles trust* (Romans 15:12). Read it through the olive tree, not replacement: the nations seeking the root of Jesse are grafted INTO Yashar''el (Romans 11) — the wild branches grown back to the same root, not a new people supplanting the old. The same root that gathers the two houses the second time (Isaiah 11:11-12) is the root to which the nations come; one tree, one root, one ensign.',
       sv.verse_id, ev.verse_id, 'free', 26262
  FROM _s303_isa11_lookup sv, _s303_isa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★) — THE TWO-HOUSE KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-11-the-second-time-to-recover-the-remnant',
       E'The second time to recover the remnant — both houses gathered and made one',
       E'This is the two-house regathering keystone: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt... and from the islands of the sea* (Isaiah 11:11); *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (11:12); *The envy also of Ephraim shall depart... Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* (11:13). BOTH houses — the scattered northern outcasts (Yashar''el / Ephraim / Joseph, divorced and exiled through Assyria) AND the dispersed of Yahudah — gathered the SECOND time, made one, no longer adversaries. Ezekiel''s two sticks are the same word: *Behold, I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19); *and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (37:22). Jeremiah promises the shepherd-gathering: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). And Hosea reverses Lo-ammi (*ye are not my people*, Hosea 1:9): *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land* (Hosea 1:11). This is NEVER replacement — Yahuah hath not cast away his people (Romans 11:1-2); both olive branches are Yashar''el, the natural and the wild grown back to one root.',
       sv.verse_id, ev.verse_id, 'free', 26265
  FROM _s303_isa11_lookup sv, _s303_isa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-11-a-highway-for-the-remnant-of-his-people',
       E'A highway for the remnant — the second Exodus home from the nations',
       E'The regathering ends with a road home: *And there shall be an highway for the remnant of his people, which shall be left, from Assyria; like as it was to Yashar''el (Israel) in the day that he came up out of the land of Egypt* (Isaiah 11:16) — and Yahuah dries the sea-tongue before them, *and with his mighty wind shall he shake his hand over the river... and make men go over dryshod* (11:15), the Exodus pattern run again. This is the second Exodus, the new-Exodus regathering. Isaiah''s own highway is the way of the redeemed: *And an highway shall be there, and a way, and it shall be called The way of holiness; the unclean shall not pass over it... the redeemed shall walk there* (Isaiah 35:8-9). Jeremiah''s ingathering fills it: *Behold, I will bring them from the north country, and gather them from the coasts of the earth, and with them the blind and the lame... a great company shall return thither* (Jeremiah 31:8). The remnant walks home along the holy highway as Yashar''el once walked out of Egypt — Yahuah leading his people a second time.',
       sv.verse_id, ev.verse_id, 'free', 26268
  FROM _s303_isa11_lookup sv, _s303_isa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=11 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will raise unto David a righteous Branch, and a King shall reign and prosper* (Jeremiah 23:5) — the *Branch* from *the stem of Jesse* (Isaiah 11:1) is the righteous Davidic King.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-a-branch-out-of-the-stem-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*this is his name... Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6) — in the Branch''s days BOTH Yahudah and Yashar''el are saved (the two houses Isaiah 11:11-13 gathers).'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-a-branch-out-of-the-stem-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold the man whose name is The BRANCH; and he shall grow up out of his place* (Zechariah 6:12) — the *Branch* that *shall grow out of his roots* (Isaiah 11:1) named outright.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-a-branch-out-of-the-stem-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he shall sit and rule upon his throne; and he shall be a priest upon his throne* (Zechariah 6:13) — the Branch of Jesse crowned King AND Priest.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-a-branch-out-of-the-stem-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *a Lamb... having seven horns and seven eyes, which are the seven Spirits of Elohim (God)* (Revelation 5:6) — the sevenfold *spirit of Yahuah* (Isaiah 11:2) on the Lamb who is *the Root of David* (Revelation 5:5).'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-spirit-of-yahuah-shall-rest-upon-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *in him dwells the spirit of wisdom... the spirit of understanding and of might* (1 Enoch 49:3) — the very *spirit of wisdom and understanding... counsel and might* of Isaiah 11:2 on the Elect One.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=49 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-spirit-of-yahuah-shall-rest-upon-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the Elect One standeth before Yahuah (God) of Spirits... mighty in all the secrets of righteousness* (1 Enoch 49:2) — the One on whom *the spirit of Yahuah shall rest* (Isaiah 11:2), anointed to judge in righteousness.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=49 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-spirit-of-yahuah-shall-rest-upon-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *whom Yahuah (Lord) shall consume with the spirit of his mouth* (2 Thessalonians 2:8) — the *breath of his lips* that *shall slay the wicked* (Isaiah 11:4) taken straight forward to the man of sin.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-breath-of-his-lips-shall-slay-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *in righteousness he doth judge and make war* (Revelation 19:11) — *with righteousness shall he judge* (Isaiah 11:4) revealed in the returning King.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-breath-of-his-lips-shall-slay-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron* (Revelation 19:15) — the *rod of his mouth* (Isaiah 11:4) IS the sharp sword.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-breath-of-his-lips-shall-slay-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14) — the same line as Isaiah 11:9; the holy mountain where nothing hurts nor destroys.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-earth-full-of-the-knowledge-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *There shall be a root of Jesse... in him shall the Gentiles trust* (Romans 15:12) — Paul quotes Isaiah 11:10 verbatim; the nations grafted INTO Yashar''el, never a replacement people.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=10
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-a-root-of-jesse-to-it-shall-the-gentiles-seek'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★) — KEYSTONE
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will take the stick of Joseph... and... the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — the *outcasts of Yashar''el* and *dispersed of Yahudah* (Isaiah 11:12) made one in Yahuah''s hand.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-second-time-to-recover-the-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — *Ephraim shall not envy Yahudah... and Yahudah shall not vex Ephraim* (Isaiah 11:13); the division ends.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-second-time-to-recover-the-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10) — Yahuah recovers the remnant *the second time* (Isaiah 11:11).'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-second-time-to-recover-the-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11) — the Lo-ammi reversal; both houses gathered (Isaiah 11:12).'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-the-second-time-to-recover-the-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *an highway shall be there... it shall be called The way of holiness... the redeemed shall walk there* (Isaiah 35:8-9) — the highway *for the remnant* (Isaiah 11:16), the road of the redeemed home.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-a-highway-for-the-remnant-of-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will bring them from the north country, and gather them from the coasts of the earth... a great company shall return thither* (Jeremiah 31:8) — the new-Exodus ingathering filling the highway of Isaiah 11:16.'
  FROM cross_reference_threads t
  JOIN _s303_isa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s303_isa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-11-a-highway-for-the-remnant-of-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_40.sql (Isaiah 40) -----
-- Chapter: Isaiah 40 — THE GREAT "COMFORT YE" OPENING of Isaiah's second half: the turn from
-- judgment to comfort, the pardon of the covenant people, the voice in the wilderness preparing
-- the way of Yahuah, the everlasting word that stands, the Shepherd who gathers the lambs, the
-- incomparable Creator over the idols, and the El Olam who renews the faint. *Comfort ye,
-- comfort ye my people, saith your Elohim (God)* (40:1). The chapter is a Christological and
-- two-house keystone: *The voice of him that crieth in the wilderness, Prepare ye the way of
-- Yahuah (LORD)* (40:3) is quoted of John the Baptist by ALL FOUR GOSPELS — the preparer of the
-- way of Yahuah = the way of the coming Formed Son; *Behold your Elohim (God)!* (40:9) is the
-- Shepherd who *shall feed his flock... gather the lambs* (40:11), the gathering of the two-house
-- flock; and *El Olam (the everlasting God), Yahuah (LORD), the Creator of the ends of the earth*
-- (40:28) is the Creator-by-the-Word who strengthens the weary.
-- Tag: isa40   Temp view: _s303_isa40_lookup
-- Sort band: base 26975, step 3 -> threads at 26975, 26978, 26981, 26984, 26987, 26990, 26993 (7 threads)
-- Source of EVERY row: 'canon','isaiah',40,v
--
-- Isaiah 40 coverage:
--   ★★ v.1-2 (Comfort ye, comfort ye my people... Speak ye comfortably to Jerusalem... that her
--          warfare is accomplished, that her iniquity is pardoned)
--        NT:     none warranted distinct (the comfort/pardon is carried in prose + the gospel weave of v.3-5)
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 52:9 (Yahuah hath comforted his people, he hath redeemed Jerusalem) — THREAD 1 (lateral)
--   ★★★ v.3-5 (The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah...
--          Every valley shall be exalted... and all flesh shall see it together)
--        NT:     ★★★ Matthew 3:3, Mark 1:3, Luke 3:4 + Luke 3:5 + Luke 3:6 (all flesh shall see the
--                salvation of Elohim), John 1:23 — THREAD 2 (the four-gospel keystone)
--        Extras: none warranted
--        Tanakh: held in prose (Isaiah 52:8-10 the watchmen / all the ends of the earth shall see —
--                bound in THREAD 1's comfort); no separate forced add
--   ★★ v.6-8 (All flesh is grass... The grass withereth, the flower fadeth: but the word of our
--          Elohim shall stand for ever)
--        NT:     ★★ 1 Peter 1:24 + 1 Peter 1:25 (quoted verbatim, but the word of the Lord endureth
--                for ever), ★★ James 1:10 + James 1:11 (the rich shall fade as the flower of the grass) — THREAD 3
--        Extras: none warranted
--        Tanakh: woven in prose (Psalm 103:15-16 man's days as grass) — not forced; the NT quotation carries it
--   ★★ v.9-11 (O Zion, that bringest good tidings... Behold your Elohim!... He shall feed his flock
--          like a shepherd: he shall gather the lambs with his arm)
--        NT:     ★★ John 10:11 (I am the good shepherd) + John 10:16 (other sheep... one fold, one shepherd) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 34:11 (I... will both search my sheep, and seek them out) + Ezekiel 34:23
--                (I will set up one shepherd... my servant David) — THREAD 4
--   ★ v.12-14 (Who hath measured the waters in the hollow of his hand... Who hath directed the
--          Spirit of Yahuah, or being his counsellor hath taught him?)
--        NT:     ★ Romans 11:34 (who hath known the mind of the Lord? or who hath been his counsellor?)
--                + 1 Corinthians 2:16 (who hath known the mind of the Lord) — THREAD 5
--        Extras: none warranted
--        Tanakh: woven in prose (Job 38-39 the Creator's interrogation) — not forced
--   v.15-17 (the nations are as a drop of a bucket... All nations before him are as nothing)
--        NT/Extras/Tanakh: none warranted distinct — the nations-as-nothing is the preface to the
--          idols-vs-Creator contrast of v.18-26 (bound in THREAD 6's prose)
--   ★ v.18-26 (To whom then will ye liken Elohim?... the graven image... It is he that sitteth upon
--          the circle of the earth... Lift up your eyes on high, and behold who hath created these things)
--        NT:     ★ Romans 1:20 (the invisible things of him from the creation... clearly seen) +
--                Romans 1:23 (changed the glory... into an image) + Romans 1:25 (worshipped... the
--                creature more than the Creator) — THREAD 6
--        Extras: none warranted (idol-folly material in Wisdom 13-14 is a candidate but the Romans
--                weave is the cleaner, load-bearing pull; extras not forced)
--        Tanakh: woven in prose (Jeremiah 10:3-5 the idol that cannot move) — not forced
--   v.27 (Why sayest thou, O Jacob... My way is hid from Yahuah?)
--        NT/Extras/Tanakh: none warranted distinct — the complaint of the two houses is the preface
--          to the El-Olam answer of v.28-31 (bound in THREAD 7's prose)
--   ★★ v.28-31 (El Olam (the everlasting God), Yahuah, the Creator of the ends of the earth,
--          fainteth not... But they that wait upon Yahuah shall renew their strength; they shall
--          mount up with wings as eagles)
--        NT:     ★ John 1:3 (All things were made by him) + Colossians 1:16 (by him were all things
--                created) — the Creator-by-the-Word; ★ 2 Corinthians 4:16 (the inward man is renewed
--                day by day) + 2 Corinthians 12:9 (my strength is made perfect in weakness) — THREAD 7
--        Extras: none warranted
--        Tanakh: woven in prose; no separate forced add
--
-- Threads (slug — target libraries):
--   1. isaiah-40-comfort-ye-comfort-ye-my-people — Tanakh (Isaiah 52) [free]
--      (★★ the turn from judgment to comfort; the pardon of the covenant people, two-house comfort after exile)
--   2. isaiah-40-prepare-ye-the-way-of-yahuah — NT (Matthew 3, Mark 1, Luke 3, John 1) [free]
--      (★★★ the four-gospel keystone: the wilderness voice prepares the way of Yahuah = the coming of the Formed Son)
--   3. isaiah-40-all-flesh-is-grass-but-the-word-shall-stand — NT (1 Peter 1, James 1) [free]
--      (★★ all flesh is grass, but the word of our Elohim stands for ever — quoted verbatim by Peter)
--   4. isaiah-40-behold-your-elohim-he-shall-feed-his-flock — NT (John 10) + Tanakh (Ezekiel 34) [free]
--      (★★ Behold your Elohim! the Shepherd who gathers the lambs = the one shepherd of the two-house flock)
--   5. isaiah-40-who-hath-been-his-counsellor — NT (Romans 11, 1 Corinthians 2) [free]
--      (★ the incomparable Creator: who hath known the mind of Yahuah, or been his counsellor — quoted by Paul)
--   6. isaiah-40-to-whom-then-will-ye-liken-el — NT (Romans 1) [free]
--      (★ idols vs the Creator El; the invisible One clearly seen, the folly of serving the creature)
--   7. isaiah-40-el-olam-the-everlasting-creator-who-renews-the-faint — NT (John 1, Colossians 1, 2 Corinthians 4 & 12) [free]
--      (★★ El Olam, the everlasting Creator-by-the-Word who renews the strength of them that wait on him)
--
-- Framing notes:
--   ★★ COMFORT YE (THREAD 1): *Comfort ye, comfort ye my people, saith your Elohim (God). Speak ye
--      comfortably to Jerusalem... that her warfare is accomplished, that her iniquity is pardoned*
--      (40:1-2). The whole second half of Isaiah turns here from judgment to comfort. The lateral
--      witness within the same Book seals it: *Yahuah (LORD) hath comforted his people, he hath
--      redeemed Jerusalem* (52:9). This is covenant-comfort and covenant-pardon to the covenant
--      people — *my people* — never a cast-off nation; the two houses comforted after exile.
--   ★★★ PREPARE YE THE WAY (THREAD 2): *The voice of him that crieth in the wilderness, Prepare ye
--      the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God)... and
--      all flesh shall see it together* (40:3-5). This is the ONLY Tanakh text all four gospels quote
--      of John the Baptist (Matthew 3:3, Mark 1:3, Luke 3:4-6, John 1:23). The decisive lens: the
--      voice prepares *the way of YAHUAH* — and the way it prepares is the coming of Yahusha (Jesus).
--      The way of Yahuah and the coming of the Formed Son are ONE; the Formed Son is Yahuah come in
--      flesh (the Formed and the Formless). Luke quotes through v.6, naming the goal — *all flesh
--      shall see the salvation of Elohim (God)* — the salvation being the Formed One himself.
--   ★★ ALL FLESH IS GRASS (THREAD 3): *All flesh is grass... The grass withereth, the flower fadeth:
--      but the word of our Elohim (God) shall stand for ever* (40:6-8). Peter quotes it verbatim and
--      names the standing word: *but the word of Yahuah (Lord) endureth for ever. And this is the
--      word which by the gospel is preached unto you* (1 Peter 1:25). James preaches the same against
--      the rich man: *as the flower of the grass he shall pass away* (James 1:10-11). The eternal,
--      never-abolished word of Elohim outlasts all flesh — the same word written on the heart.
--   ★★ BEHOLD YOUR ELOHIM / THE SHEPHERD (THREAD 4): *say unto the cities of Yahudah (Judah), Behold
--      your Elohim (God)!... He shall feed his flock like a shepherd: he shall gather the lambs with
--      his arm* (40:9-11). The Shepherd who comes is the Shepherd who gathers. Yahusha names himself:
--      *I am the good shepherd* (John 10:11), with the two-house gathering explicit — *other sheep I
--      have, which are not of this fold: them also I must bring... and there shall be one fold, and
--      one shepherd* (John 10:16). Ezekiel had already promised the One Shepherd: *I, even I, will
--      both search my sheep, and seek them out* (34:11); *I will set up one shepherd over them...
--      even my servant David* (34:23). The gathering Shepherd of Isaiah 40 = the one Shepherd over
--      the regathered two houses.
--   ★ WHO HATH BEEN HIS COUNSELLOR (THREAD 5): *Who hath directed the Spirit of Yahuah (LORD), or
--      being his counsellor hath taught him?* (40:13). Paul quotes it of the incomparable Creator:
--      *who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34),
--      *who hath known the mind of Yahuah (Lord), that he may instruct him? But we have the mind of
--      Messiah (Christ)* (1 Corinthians 2:16). None taught the Creator; yet His mind is given in the
--      Messiah.
--   ★ TO WHOM WILL YE LIKEN EL (THREAD 6): *To whom then will ye liken Elohim (God)?... The workman
--      melteth a graven image... It is he that sitteth upon the circle of the earth... Lift up your
--      eyes on high, and behold who hath created these things* (40:18-26). The incomparable Creator
--      against the dead idols. Paul reads the same indictment: *the invisible things of him from the
--      creation of the world are clearly seen* (Romans 1:20); men *changed the glory of the
--      uncorruptible Elohim (God) into an image* (1:23) and *worshipped and served the creature more
--      than the Creator* (1:25). Isaiah's idol-folly is Paul's idol-folly; the Creator alone.
--   ★★ EL OLAM, THE CREATOR WHO RENEWS (THREAD 7): *Hast thou not known... that El Olam (the
--      everlasting God), Yahuah (LORD), the Creator of the ends of the earth, fainteth not, neither
--      is weary?... But they that wait upon Yahuah (LORD) shall renew their strength; they shall
--      mount up with wings as eagles* (40:28-31). The everlasting Creator created by His Word — *All
--      things were made by him* (John 1:3); *by him were all things created* (Colossians 1:16) — the
--      Formed Son the agent of creation. And the Creator who *giveth power to the faint* renews the
--      weary: *the inward man is renewed day by day* (2 Corinthians 4:16); *My grace is sufficient
--      for thee: for my strength is made perfect in weakness* (2 Corinthians 12:9).
--   VERSES WITH NO SEPARATE ADD: v.15-17 (the nations as a drop of a bucket — preface to the
--      idols-vs-Creator contrast of THREAD 6), v.27 (Why sayest thou, O Jacob... My way is hid — the
--      two-house complaint that THREAD 7's El-Olam answer addresses). All weighed across NT/Extras/
--      Tanakh, recorded, none silently skipped. No extras forced — the chapter's heaviest weave is
--      the four-gospel quotation and the NT epistle citations; clean canon pulls throughout (all
--      threads 'free').

CREATE TEMP VIEW _s303_isa40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Comfort ye, comfort ye my people (the turn to comfort; the pardon of the covenant people)
    ('canon','isaiah',40,1,'canon','isaiah',52,9,'free',
      E'*Break forth into joy, sing together, ye waste places of Jerusalem: for Yahuah (LORD) hath comforted his people, he hath redeemed Jerusalem* (Isaiah 52:9). The opening cry *Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1) is answered within the same Book: *Yahuah (LORD) hath comforted his people, he hath redeemed Jerusalem*. The comfort is covenant-comfort to the covenant people — *his people* — the pardon and redemption of the very ones who went into exile.'),
    ('canon','isaiah',40,2,'canon','isaiah',52,3,'free',
      E'*For thus saith Yahuah (LORD), Ye have sold yourselves for nought; and ye shall be redeemed without money* (Isaiah 52:3). When Isaiah 40:2 declares *that her iniquity is pardoned: for she hath received of the LORD''S hand double for all her sins*, the same Book names the redemption it secures: *ye shall be redeemed without money*. The warfare accomplished and the iniquity pardoned is the free redemption of the people sold for nought.'),

    -- THREAD 2 (★★★): Prepare ye the way of Yahuah (the four-gospel keystone)
    ('canon','isaiah',40,3,'canon','matthew',3,3,'free',
      E'*For this is he that was spoken of by the prophet Esaias, saying, The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord), make his paths straight* (Matthew 3:3). Matthew names John the Baptist as the wilderness voice of *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD)* (Isaiah 40:3). The way prepared is the way of Yahuah — and the One whose coming it prepares is Yahusha (Jesus); the way of Yahuah and the coming of the Formed Son are one.'),
    ('canon','isaiah',40,3,'canon','mark',1,3,'free',
      E'*The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord), make his paths straight* (Mark 1:3). Mark opens the gospel with Isaiah 40:3 — *Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God)*. The wilderness voice prepares the way of Yahuah for the coming of the Son of Elohim (Mark 1:1); the way of Yahuah IS the way of the Formed One who came in flesh.'),
    ('canon','isaiah',40,3,'canon','luke',3,4,'free',
      E'*As it is written in the book of the words of Esaias the prophet, saying, The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord), make his paths straight* (Luke 3:4). Luke quotes Isaiah 40:3 of John the Baptist and goes on to quote the whole oracle through v.5-6. The voice in the wilderness prepares *the way of Yahuah (LORD)* — and the way leads to the salvation of Elohim made visible in the Formed Son.'),
    ('canon','isaiah',40,4,'canon','luke',3,5,'free',
      E'*Every valley shall be filled, and every mountain and hill shall be brought low; and the crooked shall be made straight, and the rough ways shall be made smooth* (Luke 3:5). This is Isaiah 40:4 carried into the gospel — *Every valley shall be exalted, and every mountain and hill shall be made low: and the crooked shall be made straight, and the rough places plain*. The whole landscape is levelled to make the highway for the coming of our Elohim; Luke quotes the very leveling as fulfilled in the Baptist''s preparation.'),
    ('canon','isaiah',40,5,'canon','luke',3,6,'free',
      E'*And all flesh shall see the salvation of Elohim (God)* (Luke 3:6). Luke names the goal of *And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together* (Isaiah 40:5): what all flesh shall see is *the salvation of Elohim (God)* — the revealed glory of Yahuah IS the salvation, the Formed Son made manifest. The prophet''s *all flesh shall see it together* and the gospel''s *all flesh shall see the salvation of Elohim* are the same beholding.'),
    ('canon','isaiah',40,3,'canon','john',1,23,'free',
      E'*He said, I am the voice of one crying in the wilderness, Make straight the way of Yahuah (Lord), as said the prophet Esaias* (John 1:23). John the Baptist applies Isaiah 40:3 to himself by name — *I am the voice of one crying in the wilderness, Make straight the way of Yahuah (LORD)*. The fourth gospel joins the other three: the wilderness voice prepares the way of Yahuah for the coming of the Word made flesh (John 1:14).'),

    -- THREAD 3 (★★): All flesh is grass, but the word of our Elohim shall stand (quoted verbatim by Peter)
    ('canon','isaiah',40,6,'canon','1-peter',1,24,'free',
      E'*For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24). Peter quotes Isaiah 40:6 verbatim — *All flesh is grass, and all the goodliness thereof is as the flower of the field*. All flesh fades; the contrast is about to be drawn between perishing flesh and the imperishable word.'),
    ('canon','isaiah',40,8,'canon','1-peter',1,25,'free',
      E'*But the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you* (1 Peter 1:25). Peter completes the quotation of Isaiah 40:8 — *but the word of our Elohim (God) shall stand for ever* — and names that abiding word: it is *the word which by the gospel is preached unto you*, the incorruptible seed by which the people are born again (1 Peter 1:23). The word that stands for ever is never abolished.'),
    ('canon','isaiah',40,7,'canon','james',1,10,'free',
      E'*But the rich, in that he is made low: because as the flower of the grass he shall pass away* (James 1:10). James preaches the lesson of Isaiah 40:7 — *The grass withereth, the flower fadeth... surely the people is grass* — against the rich man who trusts in fading flesh: *as the flower of the grass he shall pass away*. The withering of the grass is the measure of all human glory.'),
    ('canon','isaiah',40,7,'canon','james',1,11,'free',
      E'*For the sun is no sooner risen with a burning heat, but it withereth the grass, and the flower thereof falleth, and the grace of the fashion of it perisheth: so also shall the rich man fade away in his ways* (James 1:11). James draws out Isaiah 40:7 — *The grass withereth, the flower fadeth: because the spirit of Yahuah (LORD) bloweth upon it* — applying the scorching of the grass to the fading rich man. All flesh withers; only the word of our Elohim stands.'),

    -- THREAD 4 (★★): Behold your Elohim! He shall feed his flock (the gathering Shepherd of the two-house flock)
    ('canon','isaiah',40,11,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The promise *He shall feed his flock like a shepherd: he shall gather the lambs with his arm* (Isaiah 40:11) is claimed in the first person by Yahusha: *I am the good shepherd*. The Shepherd who comes with *Behold your Elohim (God)!* (40:9) is the One who feeds the flock and lays down his life for the sheep.'),
    ('canon','isaiah',40,11,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The gathering of *He shall... gather the lambs with his arm, and carry them in his bosom* (Isaiah 40:11) is the two-house gathering Yahusha names: the *other sheep... not of this fold* brought into *one fold, and one shepherd*. The scattered house of Yashar''el (Israel) and the house of Yahudah (Judah) gathered into one flock under one Shepherd.'),
    ('canon','isaiah',40,11,'canon','ezekiel',34,11,'free',
      E'*For thus saith Adonai Yahuah (the Lord GOD); Behold, I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11). The Shepherd of Isaiah 40:11 who *shall feed his flock... gather the lambs with his arm* is the Shepherd Ezekiel promised: *I, even I, will both search my sheep, and seek them out* — Yahuah Himself seeking the scattered flock, *the house of Yashar''el (Israel)* who *are my people* (34:30).'),
    ('canon','isaiah',40,11,'canon','ezekiel',34,23,'free',
      E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The feeding-Shepherd of Isaiah 40:11 is the *one shepherd* Ezekiel names — *my servant David* — set over the regathered flock. The gathering of the lambs and the one Davidic Shepherd are the same promise: one Shepherd over the two houses made one.'),

    -- THREAD 5 (★): Who hath been his counsellor (the incomparable Creator; quoted by Paul)
    ('canon','isaiah',40,13,'canon','romans',11,34,'free',
      E'*For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34). Paul quotes Isaiah 40:13 verbatim — *Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* — to crown the depth of Elohim''s unsearchable wisdom. None counselled the Creator; His judgments are *past finding out* (Romans 11:33).'),
    ('canon','isaiah',40,13,'canon','1-corinthians',2,16,'free',
      E'*For who hath known the mind of Yahuah (Lord), that he may instruct him? But we have the mind of Messiah (Christ)* (1 Corinthians 2:16). Paul quotes Isaiah 40:13 again — *who... being his counsellor hath taught him?* — and answers it in the Messiah: no man instructed the Creator, yet *we have the mind of Messiah (Christ)*. The incomparable mind that none taught is given to His people in the Anointed One.'),

    -- THREAD 6 (★): To whom then will ye liken El (idols vs the Creator; read by Paul in Romans 1)
    ('canon','isaiah',40,18,'canon','romans',1,23,'free',
      E'*And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23). Isaiah''s question *To whom then will ye liken Elohim (God)? or what likeness will ye compare unto him?* (Isaiah 40:18) is the very folly Paul indicts: men *changed the glory of the uncorruptible Elohim (God) into an image*. The graven image (40:19) is the lie that the incomparable El can be likened to anything made.'),
    ('canon','isaiah',40,26,'canon','romans',1,20,'free',
      E'*For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20). Isaiah commands the same looking: *Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number* (Isaiah 40:26). The created host declares the Creator''s power; the heavens leave the idolater *without excuse*.'),
    ('canon','isaiah',40,25,'canon','romans',1,25,'free',
      E'*Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen* (Romans 1:25). The Holy One''s challenge *To whom then will ye liken me, or shall I be equal? saith the Holy One* (Isaiah 40:25) exposes the idolater''s exchange: they *worshipped and served the creature more than the Creator*. None is equal to the Holy One; to liken Him to the creature is the lie.'),

    -- THREAD 7 (★★): El Olam, the everlasting Creator who renews the faint (Creator-by-the-Word + strength to the weary)
    ('canon','isaiah',40,28,'canon','john',1,3,'free',
      E'*All things were made by him; and without him was not any thing made that was made* (John 1:3). *El Olam (the everlasting God), Yahuah (LORD), the Creator of the ends of the earth* (Isaiah 40:28) created by His Word: *All things were made by him*. The everlasting Creator is the Father who creates through the Formed Son, the Word — *the Word was made flesh, and dwelt among us* (John 1:14); the Creator of the ends of the earth and the agent of creation are not two rivals but the Formless and the Formed.'),
    ('canon','isaiah',40,28,'canon','colossians',1,16,'free',
      E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him* (Colossians 1:16). *Yahuah (LORD), the Creator of the ends of the earth* (Isaiah 40:28) made all things by the Son who is *the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15): *by him were all things created*. The everlasting El creates by His expressed Word, the Formed Son the agent of all creation.'),
    ('canon','isaiah',40,29,'canon','2-corinthians',4,16,'free',
      E'*For which cause we faint not; but though our outward man perish, yet the inward man is renewed day by day* (2 Corinthians 4:16). The Creator who *giveth power to the faint; and to them that have no might he increaseth strength* (Isaiah 40:29) is the One who renews the inward man: *the inward man is renewed day by day*. As the everlasting El *fainteth not* (40:28), so His people *faint not* — their strength renewed by Him.'),
    ('canon','isaiah',40,31,'canon','2-corinthians',12,9,'free',
      E'*And he said unto me, My grace is sufficient for thee: for my strength is made perfect in weakness... for when I am weak, then am I strong* (2 Corinthians 12:9). The promise *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles* (Isaiah 40:31) is fulfilled in the strength made perfect in weakness: *My strength is made perfect in weakness*. The weary who wait on Yahuah are renewed not by their own might but by His — *when I am weak, then am I strong*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-40-comfort-ye-comfort-ye-my-people',
       E'Comfort ye, comfort ye my people — the turn to comfort, the pardon of the covenant people',
       E'The whole second half of Isaiah opens here, turning from judgment to comfort: *Comfort ye, comfort ye my people, saith your Elohim (God). Speak ye comfortably to Jerusalem, and cry unto her, that her warfare is accomplished, that her iniquity is pardoned: for she hath received of the LORD''S hand double for all her sins* (Isaiah 40:1-2). This is comfort to *my people* — the covenant people, never a cast-off nation — and the pardon is covenant-pardon. The same Book seals it: *Yahuah (LORD) hath comforted his people, he hath redeemed Jerusalem* (Isaiah 52:9), the redemption secured *without money* (52:3) for the people who *sold yourselves for nought*. The warfare accomplished, the iniquity pardoned, the free redemption — this is the comfort of the two houses after exile, the lost sheep gathered and forgiven.',
       sv.verse_id, ev.verse_id, 'free', 26975
  FROM _s303_isa40_lookup sv, _s303_isa40_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=40 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-40-prepare-ye-the-way-of-yahuah',
       E'Prepare ye the way of Yahuah — the wilderness voice quoted by all four gospels',
       E'No Tanakh text is quoted of John the Baptist more universally than this — all four gospels carry it: *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God). Every valley shall be exalted, and every mountain and hill shall be made low... And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together* (Isaiah 40:3-5). Matthew: *this is he that was spoken of by the prophet Esaias... The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord)* (Matthew 3:3). Mark opens his gospel with it (Mark 1:3). Luke quotes the whole oracle, the leveling and the goal: *Every valley shall be filled, and every mountain and hill shall be brought low* (Luke 3:5), *And all flesh shall see the salvation of Elohim (God)* (Luke 3:6). And John the Baptist claims it of himself by name: *I am the voice of one crying in the wilderness, Make straight the way of Yahuah (Lord), as said the prophet Esaias* (John 1:23). The decisive lens: the voice prepares *the way of YAHUAH* — and what it prepares is the coming of Yahusha (Jesus). The way of Yahuah and the coming of the Formed Son are ONE; the salvation all flesh shall see is the Word made flesh (John 1:14), Yahuah come among His people.',
       sv.verse_id, ev.verse_id, 'free', 26978
  FROM _s303_isa40_lookup sv, _s303_isa40_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=40 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-40-all-flesh-is-grass-but-the-word-shall-stand',
       E'All flesh is grass, but the word of our Elohim shall stand for ever',
       E'Against the fading of all flesh, the prophet sets the one thing that endures: *All flesh is grass, and all the goodliness thereof is as the flower of the field: The grass withereth, the flower fadeth: because the spirit of Yahuah (LORD) bloweth upon it: surely the people is grass. The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:6-8). Peter quotes it verbatim and names the abiding word: *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24), *But the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you* (1 Peter 1:25) — the incorruptible seed by which the people are born again (1:23). James preaches the same against the rich man who trusts in fading flesh: *as the flower of the grass he shall pass away* (James 1:10), for *the sun is no sooner risen with a burning heat, but it withereth the grass... so also shall the rich man fade away in his ways* (James 1:11). All human glory withers like grass; only the word of our Elohim stands for ever — the eternal, never-abolished word, the same word written on the heart.',
       sv.verse_id, ev.verse_id, 'free', 26981
  FROM _s303_isa40_lookup sv, _s303_isa40_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=40 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-40-behold-your-elohim-he-shall-feed-his-flock',
       E'Behold your Elohim! — the Shepherd who gathers the two-house flock',
       E'The good tidings are the coming of Elohim Himself as Shepherd: *O Zion, that bringest good tidings, get thee up into the high mountain... say unto the cities of Yahudah (Judah), Behold your Elohim (God)! Behold, Adonai Yahuah (the Lord GOD) will come with strong hand... He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom, and shall gently lead those that are with young* (Isaiah 40:9-11). Yahusha claims the Shepherd''s role in the first person: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11), and names the gathering as the two-house ingathering — *other sheep I have, which are not of this fold: them also I must bring... and there shall be one fold, and one shepherd* (John 10:16). Ezekiel had promised exactly this Shepherd: *I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11), *And I will set up one shepherd over them... even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The gathering Shepherd of Isaiah 40, the good Shepherd of John 10, and the one Davidic Shepherd of Ezekiel 34 are one: Yahuah come to gather the scattered house of Yashar''el (Israel) and the house of Yahudah (Judah) into one flock under one Shepherd.',
       sv.verse_id, ev.verse_id, 'free', 26984
  FROM _s303_isa40_lookup sv, _s303_isa40_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=40 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-40-who-hath-been-his-counsellor',
       E'Who hath been his counsellor — the incomparable Creator whose mind none taught',
       E'The Creator who measures the waters and metes out heaven is beyond all counsel: *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span... Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him? With whom took he counsel, and who instructed him, and taught him in the path of judgment?* (Isaiah 40:12-14). Paul quotes it twice. To crown the depth of Elohim''s unsearchable wisdom: *O the depth of the riches both of the wisdom and knowledge of Elohim (God)!... For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:33-34). And to mark the mind no man can reach yet which is given in the Anointed: *For who hath known the mind of Yahuah (Lord), that he may instruct him? But we have the mind of Messiah (Christ)* (1 Corinthians 2:16). None directed the Spirit of Yahuah, none taught the Creator the path of judgment — yet His incomparable mind is given to His people in the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 26987
  FROM _s303_isa40_lookup sv, _s303_isa40_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=40 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-40-to-whom-then-will-ye-liken-el',
       E'To whom then will ye liken El — the incomparable Creator against the idols',
       E'The prophet sets the living Creator against the dead idols: *To whom then will ye liken Elohim (God)? or what likeness will ye compare unto him? The workman melteth a graven image, and the goldsmith spreadeth it over with gold* (Isaiah 40:18-19); *It is he that sitteth upon the circle of the earth... that stretcheth out the heavens as a curtain* (40:22); *To whom then will ye liken me, or shall I be equal? saith the Holy One. Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number* (40:25-26). Paul reads the same indictment of idolatry in Romans 1: the heavens leave men without excuse — *the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made* (Romans 1:20); yet they *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man* (1:23) and *worshipped and served the creature more than the Creator, who is blessed for ever* (1:25). Isaiah''s graven image and Paul''s exchanged glory are the same lie: the incomparable El, who cannot be likened to anything made, traded for the creature. None is equal to the Holy One.',
       sv.verse_id, ev.verse_id, 'free', 26990
  FROM _s303_isa40_lookup sv, _s303_isa40_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=40 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-40-el-olam-the-everlasting-creator-who-renews-the-faint',
       E'El Olam, the everlasting Creator who renews the strength of them that wait',
       E'The chapter ends in the everlasting Creator who never tires and renews the weary: *Hast thou not known? hast thou not heard, that El Olam (the everlasting God), Yahuah (LORD), the Creator of the ends of the earth, fainteth not, neither is weary?... He giveth power to the faint; and to them that have no might he increaseth strength... But they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint* (Isaiah 40:28-31). This is the answer to Jacob''s complaint, *My way is hid from Yahuah (LORD)* (40:27): the Creator is not absent but everlasting. He created by His Word — *All things were made by him; and without him was not any thing made that was made* (John 1:3); *by him were all things created, that are in heaven, and that are in earth... all things were created by him, and for him* (Colossians 1:16) — the Father creating through the Formed Son, the image of the invisible Elohim. And the Creator who *fainteth not* renews His people who faint: *though our outward man perish, yet the inward man is renewed day by day* (2 Corinthians 4:16); *My grace is sufficient for thee: for my strength is made perfect in weakness... when I am weak, then am I strong* (2 Corinthians 12:9). They that wait on Yahuah mount up with eagles'' wings — strengthened not by their own might but by the everlasting El, the Creator of the ends of the earth.',
       sv.verse_id, ev.verse_id, 'free', 26993
  FROM _s303_isa40_lookup sv, _s303_isa40_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=40 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) hath comforted his people, he hath redeemed Jerusalem* (Isaiah 52:9) — the *Comfort ye... my people* of Isaiah 40:1 answered within the same Book; covenant-comfort to the covenant people.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=1
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-comfort-ye-comfort-ye-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*ye shall be redeemed without money* (Isaiah 52:3) — the *iniquity pardoned* of Isaiah 40:2 is the free redemption of the people sold for nought.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=2
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-comfort-ye-comfort-ye-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord)* (Matthew 3:3) — Matthew names John the Baptist as the voice of Isaiah 40:3; the way of Yahuah = the coming of the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=3
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-prepare-ye-the-way-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Prepare ye the way of Yahuah (Lord), make his paths straight* (Mark 1:3) — Mark opens the gospel with Isaiah 40:3, the wilderness voice before the Son of Elohim.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=3
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-prepare-ye-the-way-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *As it is written in the book of the words of Esaias the prophet... The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord)* (Luke 3:4) — Luke quotes Isaiah 40:3 and carries the whole oracle through v.5-6.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=3
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-prepare-ye-the-way-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Every valley shall be filled, and every mountain and hill shall be brought low* (Luke 3:5) — Isaiah 40:4 carried into the gospel; the landscape levelled to make the highway for our Elohim.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=4
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-prepare-ye-the-way-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *And all flesh shall see the salvation of Elohim (God)* (Luke 3:6) — Luke names the goal of Isaiah 40:5: the revealed glory of Yahuah that all flesh shall see IS the salvation, the Formed Son made manifest.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=5
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-prepare-ye-the-way-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★★ *I am the voice of one crying in the wilderness, Make straight the way of Yahuah (Lord), as said the prophet Esaias* (John 1:23) — the Baptist applies Isaiah 40:3 to himself by name; the fourth gospel joins the other three.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=3
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-prepare-ye-the-way-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24) — Peter quotes Isaiah 40:6 verbatim.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=6
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-all-flesh-is-grass-but-the-word-shall-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *But the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you* (1 Peter 1:25) — Isaiah 40:8 completed; the word that stands for ever is the never-abolished word.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=8
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-all-flesh-is-grass-but-the-word-shall-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the rich, in that he is made low: because as the flower of the grass he shall pass away* (James 1:10) — James preaches Isaiah 40:7 against the rich man who trusts in fading flesh.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=7
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-all-flesh-is-grass-but-the-word-shall-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the sun is no sooner risen with a burning heat, but it withereth the grass... so also shall the rich man fade away in his ways* (James 1:11) — the scorching of the grass of Isaiah 40:7 applied to the fading rich man.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=7
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-all-flesh-is-grass-but-the-word-shall-stand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — Yahusha claims the Shepherd of Isaiah 40:11 who *shall feed his flock... gather the lambs* in the first person.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=11
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-behold-your-elohim-he-shall-feed-his-flock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *other sheep I have, which are not of this fold... and there shall be one fold, and one shepherd* (John 10:16) — the gathering of the lambs of Isaiah 40:11 is the two-house ingathering into one flock.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=11
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-behold-your-elohim-he-shall-feed-his-flock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Behold, I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11) — the gathering Shepherd of Isaiah 40:11 is Yahuah Himself seeking the scattered flock.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=11
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-behold-your-elohim-he-shall-feed-his-flock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will set up one shepherd over them... even my servant David; he shall feed them* (Ezekiel 34:23) — the feeding-Shepherd of Isaiah 40:11 is the one Davidic Shepherd over the regathered two houses.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=11
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-behold-your-elohim-he-shall-feed-his-flock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34) — Paul quotes Isaiah 40:13 verbatim to crown the unsearchable wisdom of Elohim.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=13
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-who-hath-been-his-counsellor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *who hath known the mind of Yahuah (Lord), that he may instruct him? But we have the mind of Messiah (Christ)* (1 Corinthians 2:16) — Isaiah 40:13 again; the mind none taught is given in the Messiah.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=13
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-who-hath-been-his-counsellor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man* (Romans 1:23) — the folly of Isaiah 40:18, likening the incomparable El to a graven image.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=18
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-to-whom-then-will-ye-liken-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the invisible things of him from the creation of the world are clearly seen... so that they are without excuse* (Romans 1:20) — Isaiah 40:26''s *Lift up your eyes... behold who hath created these things*; the host declares the Creator.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=26
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-to-whom-then-will-ye-liken-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*worshipped and served the creature more than the Creator, who is blessed for ever* (Romans 1:25) — the Holy One''s challenge of Isaiah 40:25, *To whom will ye liken me?*; none is equal to the Creator.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=25
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-to-whom-then-will-ye-liken-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *All things were made by him; and without him was not any thing made that was made* (John 1:3) — El Olam, the Creator of Isaiah 40:28, created by His Word, the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=28
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-el-olam-the-everlasting-creator-who-renews-the-faint'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *by him were all things created, that are in heaven, and that are in earth... all things were created by him, and for him* (Colossians 1:16) — the everlasting El of Isaiah 40:28 creates by the Son, the image of the invisible Elohim.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=28
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-el-olam-the-everlasting-creator-who-renews-the-faint'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *though our outward man perish, yet the inward man is renewed day by day* (2 Corinthians 4:16) — the Creator who *giveth power to the faint* (Isaiah 40:29) renews the inward man.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=29
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-el-olam-the-everlasting-creator-who-renews-the-faint'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *My grace is sufficient for thee: for my strength is made perfect in weakness... when I am weak, then am I strong* (2 Corinthians 12:9) — they that *wait upon Yahuah... shall renew their strength* (Isaiah 40:31) are renewed not by their own might but by His.'
  FROM cross_reference_threads t
  JOIN _s303_isa40_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=40 AND sv.verse_number=31
  JOIN _s303_isa40_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-40-el-olam-the-everlasting-creator-who-renews-the-faint'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_52.sql (Isaiah 52) -----
-- Chapter: Isaiah 52 — THE PROLOGUE TO THE SUFFERING SERVANT. Zion is roused and the captivity
-- loosed (*Awake, awake; put on thy strength, O Zion... loose thyself from the bands of thy neck, O
-- captive daughter of Zion*, 52:1-2) — the two-house regathering of the scattered. The herald's feet
-- publish good tidings of salvation (52:7, quoted Romans 10:15), the watchmen see eye to eye as Yahuah
-- brings again Zion (52:8-9), and Yahuah *made bare his holy arm in the eyes of all the nations* — the
-- bared arm of 53:1 (quoted John 12:38), the Formed Son who is salvation seen *to the ends of the
-- earth* (Luke 3:6). The chapter calls the holy ones OUT — *go ye out from thence, touch no unclean
-- thing... be ye clean, that bear the vessels of Yahuah* (52:11, quoted 2 Corinthians 6:17; Rev 18:4)
-- — the gathering out, holiness/separation that AFFIRMS the clean/unclean distinction, not a new
-- people. It closes with the servant prologue that flows straight into ch53: *Behold, my servant
-- shall deal prudently, he shall be exalted and extolled, and be very high* (52:13) — the
-- exaltation-through-humiliation pattern (Philippians 2:8-9; the lifted-up servant, John 3:14, 12:32)
-- — and *So shall he sprinkle many nations... that which had not been told them shall they see*
-- (52:15, quoted Romans 15:21): the priestly sprinkling cleansing the nations (the blood of
-- sprinkling, Hebrews 12:24; Leviticus 16), the nations grafted in to Yashar'el, never a replacement.
-- Tag: isa52   Temp view: _s303_isa52_lookup
-- Sort band: base 27275, step 3 -> threads at 27275, 27278, 27281, 27284, 27287, 27290 (6 threads)
-- Source of EVERY row: 'canon','isaiah',52,v
--
-- Isaiah 52 coverage:
--   v.1-2 (Awake, awake; put on thy strength, O Zion... loose thyself from the bands of thy neck, O
--          captive daughter of Zion)
--        NT:     none warranted distinct (the rousing/regathering is the Tanakh's own lateral weave)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 51:17 (Awake, awake, stand up, O Jerusalem, which hast drunk... the cup of
--                his fury), ★ Isaiah 60:1 (Arise, shine; for thy light is come) — THREAD 1
--   v.3-6 (Ye have sold yourselves for nought; and ye shall be redeemed without money... my name
--          continually every day is blasphemed... my people shall know my name)
--        NT:     none warranted distinct (held in prose — the redemption-without-money frames THREAD 1)
--        Extras: none warranted
--        Tanakh: woven into THREAD 1's redemption prose; no separate add forced
--   ★★ v.7 (How beautiful upon the mountains are the feet of him that bringeth good tidings, that
--          publisheth peace... that publisheth salvation; that saith unto Zion, Thy Elohim reigneth!)
--        NT:     ★★ Romans 10:15 (How beautiful are the feet of them that preach the gospel of peace,
--                and bring glad tidings of good things!) — THREAD 2 (Paul quotes it of the preaching)
--        Extras: none warranted
--        Tanakh: ★★ Nahum 1:15 (Behold upon the mountains the feet of him that bringeth good tidings,
--                that publisheth peace!) — THREAD 2 (the lateral Tanakh twin)
--   v.8-9 (Thy watchmen shall lift up the voice... they shall see eye to eye, when Yahuah shall bring
--          again Zion... for Yahuah hath comforted his people, he hath redeemed Jerusalem)
--        NT:     none warranted distinct (the comfort/regathering carried in prose)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 40:1 (Comfort ye, comfort ye my people, saith your Elohim) — THREAD 3
--   ★★ v.10 (Yahuah hath made bare his holy arm in the eyes of all the nations; and all the ends of
--          the earth shall see the salvation of our Elohim)
--        NT:     ★★ John 12:38 (to whom hath the arm of Yahuah been revealed?), ★★ Luke 3:6 (all flesh
--                shall see the salvation of Elohim) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 53:1 (to whom is the arm of Yahuah revealed?) — THREAD 4 (the bared arm = the servant)
--   ★★ v.11 (Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the
--          midst of her; be ye clean, that bear the vessels of Yahuah)
--        NT:     ★★ 2 Corinthians 6:17 (come out from among them, and be ye separate... touch not the
--                unclean thing), ★ Revelation 18:4 (Come out of her, my people) — THREAD 5
--        Extras: none warranted
--        Tanakh: woven (the going-before of v.12 / Exodus pattern) — held in prose
--   v.12 (ye shall not go out with haste... Yahuah will go before you; and the Elohim of Yashar'el
--          will be your rereward)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in THREAD 5's gathering-out prose (the new-exodus going-before)
--   ★★★ v.13-15 (Behold, my servant shall deal prudently, he shall be exalted and extolled, and be
--          very high... his visage was so marred more than any man... So shall he sprinkle many
--          nations; the kings shall shut their mouths at him: for that which had not been told them
--          shall they see)
--        NT:     ★★ Philippians 2:8-9 (he humbled himself... wherefore Elohim also hath highly exalted
--                him), ★ John 3:14 / ★ John 12:32 (the Son of Adam lifted up / I... lifted up... will
--                draw all men), ★★ Romans 15:21 (To whom he was not spoken of, they shall see) — THREAD 6
--        Extras: none warranted
--        Tanakh: ★ Leviticus 16:14 (sprinkle of the blood... seven times) — THREAD 6 (priestly sprinkling)
--        (Hebrews 12:24, the blood of sprinkling — also THREAD 6)
--
-- Threads (slug — target libraries):
--   1. isaiah-52-awake-awake-loose-thyself-from-the-bands — Tanakh (Isaiah 51, Isaiah 60) [free]
--      (Zion roused, the captivity loosed; the two-house restoration of the scattered)
--   2. isaiah-52-how-beautiful-upon-the-mountains-the-feet — NT (Romans 10) + Tanakh (Nahum 1) [free]
--      (★★ the herald's feet publishing good tidings of salvation; Thy Elohim reigneth)
--   3. isaiah-52-the-watchmen-shall-see-eye-to-eye — Tanakh (Isaiah 40) [free]
--      (the regathering and the comfort; Yahuah brings again Zion, hath comforted his people)
--   4. isaiah-52-the-bared-arm-the-salvation-seen-to-the-ends — NT (John 12, Luke 3) + Tanakh (Isaiah 53) [free]
--      (★★ the bared holy arm = the arm of Isaiah 53:1, the Formed Son; salvation seen to the ends of the earth)
--   5. isaiah-52-go-ye-out-touch-no-unclean-thing — NT (2 Corinthians 6, Revelation 18) [free]
--      (★★ come out, be separate, touch no unclean thing — the gathering out; clean/unclean affirmed, not a new people)
--   6. isaiah-52-behold-my-servant-exalted-and-extolled — NT (Philippians 2, John 3, John 12, Romans 15) + Tanakh (Leviticus 16, Hebrews 12) [free]
--      (★★★ the servant prologue to ch53: exalted-through-humiliation, lifted up; sprinkle many nations = priestly cleansing of the nations grafted in)
--
-- Framing notes:
--   ★ AWAKE, LOOSE THE BANDS (THREAD 1): *Awake, awake; put on thy strength, O Zion... loose thyself
--      from the bands of thy neck, O captive daughter of Zion* (52:1-2) answers the cup-of-fury rousing
--      of *Awake, awake, stand up, O Jerusalem* (Isaiah 51:17) and rises into *Arise, shine; for thy
--      light is come* (Isaiah 60:1). The captive daughter loosed = the scattered two-house people
--      gathered; *ye shall be redeemed without money* (52:3). Restoration of Yashar'el, never replacement.
--   ★★ THE HERALD'S FEET (THREAD 2): *How beautiful upon the mountains are the feet of him that
--      bringeth good tidings... that publisheth salvation; that saith unto Zion, Thy Elohim reigneth!*
--      (52:7). Paul quotes it of gospel preaching — *How beautiful are the feet of them that preach the
--      gospel of peace* (Romans 10:15); Nahum sings the lateral twin — *Behold upon the mountains the
--      feet of him that bringeth good tidings, that publisheth peace!* (Nahum 1:15). Good tidings of the
--      reign of Elohim, published to Zion.
--   THE WATCHMEN (THREAD 3): *thy watchmen... shall see eye to eye, when Yahuah shall bring again
--      Zion... for Yahuah hath comforted his people* (52:8-9) is the answer to the opening of the comfort
--      oracle — *Comfort ye, comfort ye my people* (Isaiah 40:1). The regathering and the comfort are one.
--   ★★ THE BARED ARM (THREAD 4): *Yahuah hath made bare his holy arm in the eyes of all the nations;
--      and all the ends of the earth shall see the salvation of our Elohim* (52:10). The very next breath
--      asks *to whom is the arm of Yahuah revealed?* (Isaiah 53:1) — the bared arm IS the servant, the
--      Formed Son. John quotes it (John 12:38), and Luke makes the salvation universal — *all flesh shall
--      see the salvation of Elohim* (Luke 3:6). The Formed-and-Formless lens: the arm is the visible Son
--      drawn from the Formless Father.
--   ★★ GO YE OUT, TOUCH NO UNCLEAN THING (THREAD 5): *Depart ye, depart ye, go ye out from thence,
--      touch no unclean thing... be ye clean, that bear the vessels of Yahuah* (52:11). Paul quotes it
--      verbatim — *come out from among them, and be ye separate, saith Yahuah, and touch not the unclean
--      thing* (2 Corinthians 6:17); the Revelation echoes *Come out of her, my people* (18:4). This is
--      the gathering OUT, holiness/separation — and *touch no unclean thing* AFFIRMS the clean/unclean
--      distinction; the Torah is not abolished, the called-out are the same people made clean.
--   ★★★ THE SERVANT EXALTED AND EXTOLLED (THREAD 6): *Behold, my servant shall deal prudently, he
--      shall be exalted and extolled, and be very high* (52:13) — yet *his visage was so marred more than
--      any man* (52:14). The exaltation-through-humiliation pattern: *he humbled himself, and became
--      obedient unto death... Wherefore Elohim also hath highly exalted him* (Philippians 2:8-9); the
--      lifted-up servant — *even so must the Son of Adam be lifted up* (John 3:14), *I, if I be lifted up
--      from the earth, will draw all men unto me* (John 12:32). *So shall he sprinkle many nations*
--      (52:15) is the priestly cleansing of the nations — *sprinkle of the blood... seven times*
--      (Leviticus 16:14), *the blood of sprinkling* (Hebrews 12:24) — the nations brought in, grafted to
--      Yashar'el, NOT a replacement; and Paul quotes *that which had not been told them shall they see*
--      of preaching where Messiah was not named — *To whom he was not spoken of, they shall see* (Romans 15:21).
--   VERSES WITH NO SEPARATE ADD: v.3-6 (sold for nought, redeemed without money, my name blasphemed —
--      woven into THREAD 1's redemption prose); v.12 (Yahuah will go before you — the new-exodus
--      going-before, held in THREAD 5's gathering-out prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s303_isa52_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Awake, awake — loose the bands (Zion roused, the captivity loosed, two-house restoration)
    ('canon','isaiah',52,1,'canon','isaiah',51,17,'free',
      E'*Awake, awake, stand up, O Jerusalem, which hast drunk at the hand of Yahuah (LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling, and wrung them out* (Isaiah 51:17). The double *Awake, awake; put on thy strength, O Zion* (Isaiah 52:1) answers this rousing: the city that drank the cup of fury is now called to rise and put on her beautiful garments. The same Zion, the same doubled summons — first to face the judgment, now to receive the comfort.'),
    ('canon','isaiah',52,1,'canon','isaiah',60,1,'free',
      E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). The roused Zion of *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments* (Isaiah 52:1) is the same Zion bidden to *Arise, shine* — the captive daughter loosed and clothed in glory, the scattered gathered to her light.'),
    ('canon','isaiah',52,2,'canon','isaiah',60,4,'free',
      E'*Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side* (Isaiah 60:4). The *captive daughter of Zion* bidden to *loose thyself from the bands of thy neck* (Isaiah 52:2) is the same Zion whose scattered children come home from far — the two-house regathering, the bands of captivity broken and the dispersed gathered in.'),

    -- THREAD 2 (★★): How beautiful upon the mountains are the feet (the herald of good tidings)
    ('canon','isaiah',52,7,'canon','romans',10,15,'free',
      E'*And how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15). Paul quotes Isaiah of the preaching of the good news — *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace... that publisheth salvation* (Isaiah 52:7). The herald who publishes peace and salvation to Zion is the sent preacher of the gospel of peace.'),
    ('canon','isaiah',52,7,'canon','nahum',1,15,'free',
      E'*Behold upon the mountains the feet of him that bringeth good tidings, that publisheth peace! O Yahudah (Judah), keep thy solemn feasts, perform thy vows: for the wicked shall no more pass through thee* (Nahum 1:15). This is the lateral Tanakh twin of *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace* (Isaiah 52:7) — the same herald on the same mountains; and Nahum binds the good tidings to keeping the appointed feasts: *keep thy solemn feasts, perform thy vows*. The good news and the Torah''s calendar stand together.'),

    -- THREAD 3: The watchmen shall see eye to eye (the regathering and the comfort)
    ('canon','isaiah',52,9,'canon','isaiah',40,1,'free',
      E'*Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1). The opening of the comfort oracle is fulfilled here: *Break forth into joy, sing together, ye waste places of Jerusalem: for Yahuah (LORD) hath comforted his people, he hath redeemed Jerusalem* (Isaiah 52:9). What chapter 40 commanded — comfort my people — chapter 52 announces accomplished; the watchmen *see eye to eye, when Yahuah shall bring again Zion* (52:8).'),

    -- THREAD 4 (★★): The bared holy arm — salvation seen to the ends of the earth (the arm = the servant)
    ('canon','isaiah',52,10,'canon','isaiah',53,1,'free',
      E'*Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1). The bared arm of *Yahuah (LORD) hath made bare his holy arm in the eyes of all the nations* (Isaiah 52:10) is the very arm whose revealing chapter 53 asks after — and the answer chapter 53 gives is the suffering servant himself. The holy arm made bare IS the servant, the Formed Son; the salvation seen to the ends of the earth is seen in him.'),
    ('canon','isaiah',52,10,'canon','john',12,38,'free',
      E'*That the saying of Esaias the prophet might be fulfilled, which he spake, Yahuah (Lord), who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:38). John reads the bared *holy arm* of Isaiah 52:10 through the very next verse (53:1) and applies the revealed arm to Yahusha (Jesus) — the arm of Yahuah made bare in the eyes of all the nations is the Formed Son, the visible salvation of Elohim. He is the arm none believed when he came.'),
    ('canon','isaiah',52,10,'canon','luke',3,6,'free',
      E'*And all flesh shall see the salvation of Elohim (God)* (Luke 3:6). Luke makes universal what Isaiah declared: *all the ends of the earth shall see the salvation of our Elohim (God)* (Isaiah 52:10). The salvation Yahuah lays bare in his holy arm is seen by all flesh, to the ends of the earth — the nations beholding the Formed Son.'),

    -- THREAD 5 (★★): Go ye out, touch no unclean thing (come out, be separate — the gathering out)
    ('canon','isaiah',52,11,'canon','2-corinthians',6,17,'free',
      E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). Paul quotes Isaiah verbatim — *Depart ye, depart ye, go ye out from thence, touch no unclean thing... be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11). This is the gathering OUT, holiness and separation; and *touch not the unclean thing* affirms the clean/unclean distinction — the Torah is not abolished but kept by a called-out, separated people.'),
    ('canon','isaiah',52,11,'canon','revelation',18,4,'free',
      E'*And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4). The double command *go ye out from thence... go ye out of the midst of her* (Isaiah 52:11) is the call John hears against Babylon — *Come out of her, my people*. The separation is for the holy ones who *bear the vessels of Yahuah (LORD)*; come out, be clean, be not partakers of her uncleanness.'),

    -- THREAD 6 (★★★): Behold, my servant — exalted and extolled (the servant prologue; sprinkle many nations)
    ('canon','isaiah',52,13,'canon','philippians',2,8,'free',
      E'*And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). The servant *exalted and extolled, and... very high* (Isaiah 52:13) whose *visage was so marred more than any man* (52:14) is the One who first humbled himself unto death. The marring precedes the exaltation — the very pattern Paul sings of the Formed Son.'),
    ('canon','isaiah',52,13,'canon','philippians',2,9,'free',
      E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9). *Behold, my servant shall deal prudently, he shall be exalted and extolled, and be very high* (Isaiah 52:13) is the exaltation Paul declares: the marred, humbled servant *highly exalted* by Elohim. The Formed Son is lifted up BY the Father — exaltation through humiliation, not co-equal self-glory.'),
    ('canon','isaiah',52,13,'canon','john',3,14,'free',
      E'*And as Moses lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up* (John 3:14). The servant who *shall be exalted and extolled, and be very high* (Isaiah 52:13) is the Son of Adam who *must be lifted up* — the same lifting-up that is at once the cross and the exaltation, the marred servant raised very high.'),
    ('canon','isaiah',52,13,'canon','john',12,32,'free',
      E'*And I, if I be lifted up from the earth, will draw all men unto me* (John 12:32). The servant *exalted and extolled, and... very high* (Isaiah 52:13), at whom *the kings shall shut their mouths* and who *shall sprinkle many nations* (52:15), is the One who, lifted up, draws all men — the nations gathered to the high-and-lifted-up servant.'),
    ('canon','isaiah',52,14,'canon','leviticus',16,14,'free',
      E'*And he shall take of the blood of the bullock, and sprinkle it with his finger upon the mercy seat eastward; and before the mercy seat shall he sprinkle of the blood with his finger seven times* (Leviticus 16:14). *So shall he sprinkle many nations* (Isaiah 52:15) reads the marred servant (52:14) as the great priest whose sprinkling cleanses — the Day-of-Atonement sprinkling of blood now reaching *many nations*. The nations are cleansed and brought in, grafted to Yashar''el, not a people replaced.'),
    ('canon','isaiah',52,14,'canon','hebrews',12,24,'free',
      E'*And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). The servant who *shall sprinkle many nations* (Isaiah 52:15) is the mediator of *the blood of sprinkling* — the priestly cleansing that brings the nations in. The new covenant is the Torah written on the heart sealed by that blood, not a covenant replaced.'),
    ('canon','isaiah',52,15,'canon','romans',15,21,'free',
      E'*But as it is written, To whom he was not spoken of, they shall see: and they that have not heard shall understand* (Romans 15:21). Paul quotes Isaiah verbatim of preaching where Messiah was not named — *that which had not been told them shall they see; and that which they had not heard shall they consider* (Isaiah 52:15). The nations whom the servant sprinkles see and understand what was never before told them; the good tidings reach the unreached.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa52_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa52_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-52-awake-awake-loose-thyself-from-the-bands',
       E'Awake, awake — loose thyself from the bands, O captive daughter of Zion',
       E'The chapter opens with a double summons to a roused and redeemed Zion: *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city... Shake thyself from the dust; arise, and sit down, O Jerusalem: loose thyself from the bands of thy neck, O captive daughter of Zion* (Isaiah 52:1-2). This answers the earlier rousing of the city that drank the cup of fury — *Awake, awake, stand up, O Jerusalem, which hast drunk at the hand of Yahuah (LORD) the cup of his fury* (Isaiah 51:17) — and rises into the dawn-call of *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). The captive daughter is loosed and her scattered children come home: *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far* (Isaiah 60:4). This is the two-house regathering of the dispersed — *Ye have sold yourselves for nought; and ye shall be redeemed without money* (52:3) — the same Zion, judged and now restored, never a people replaced but the captive set free.',
       sv.verse_id, ev.verse_id, 'free', 27275
  FROM _s303_isa52_lookup sv, _s303_isa52_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=52 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-52-how-beautiful-upon-the-mountains-the-feet',
       E'How beautiful upon the mountains are the feet — the herald of good tidings',
       E'The watchman''s cry rings over the hills: *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). Paul takes it up word for word of the preaching of the gospel: *And how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15). And the lateral Tanakh twin sounds the same herald on the same mountains, binding the good news to the keeping of the appointed times: *Behold upon the mountains the feet of him that bringeth good tidings, that publisheth peace! O Yahudah (Judah), keep thy solemn feasts, perform thy vows* (Nahum 1:15). One herald, one good tidings — peace and salvation published to Zion, the reign of Elohim announced, and the Torah''s feasts kept in the gladness of it.',
       sv.verse_id, ev.verse_id, 'free', 27278
  FROM _s303_isa52_lookup sv, _s303_isa52_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=52 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-52-the-watchmen-shall-see-eye-to-eye',
       E'The watchmen shall see eye to eye — Yahuah hath comforted his people',
       E'The herald''s tidings are taken up by the watchmen and the waste places: *Thy watchmen shall lift up the voice; with the voice together shall they sing: for they shall see eye to eye, when Yahuah (LORD) shall bring again Zion. Break forth into joy, sing together, ye waste places of Jerusalem: for Yahuah (LORD) hath comforted his people, he hath redeemed Jerusalem* (Isaiah 52:8-9). This is the fulfillment of the word that opened the whole comfort oracle: *Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1). What chapter 40 commanded, chapter 52 announces accomplished — the regathering and the comfort are one act: Yahuah brings again Zion, comforts his people, and redeems Jerusalem, and the watchmen see the homecoming with their own eyes.',
       sv.verse_id, ev.verse_id, 'free', 27281
  FROM _s303_isa52_lookup sv, _s303_isa52_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=52 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-52-the-bared-arm-the-salvation-seen-to-the-ends',
       E'Yahuah hath made bare his holy arm — the bared arm is the servant',
       E'*Yahuah (LORD) hath made bare his holy arm in the eyes of all the nations; and all the ends of the earth shall see the salvation of our Elohim (God)* (Isaiah 52:10). What is this bared holy arm? The very next verse of the next breath asks and answers it: *Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1) — and the answer chapter 53 unfolds is the suffering servant himself. The arm of Yahuah made bare IS the servant, the Formed Son drawn from the Formless Father, the visible salvation of Elohim. John reads it exactly so, applying the revealed arm to Yahusha (Jesus): *That the saying of Esaias the prophet might be fulfilled, which he spake, Yahuah (Lord), who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:38). And Luke makes the sight universal: *And all flesh shall see the salvation of Elohim (God)* (Luke 3:6). The arm laid bare before all the nations is the Formed Son, salvation seen to the ends of the earth.',
       sv.verse_id, ev.verse_id, 'free', 27284
  FROM _s303_isa52_lookup sv, _s303_isa52_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=52 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-52-go-ye-out-touch-no-unclean-thing',
       E'Go ye out, touch no unclean thing — the called-out, separated people',
       E'A double command calls the holy ones out: *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11). Yet it is not a panicked flight: *For ye shall not go out with haste, nor go by flight: for Yahuah (LORD) will go before you; and the Elohim (God) of Yashar''el (Israel) will be your rereward* (52:12) — a new exodus with Yahuah leading. Paul quotes the verse verbatim: *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17); and the Revelation sounds it against Babylon: *Come out of her, my people, that ye be not partakers of her sins* (Revelation 18:4). This is the gathering OUT — holiness and separation — and the charge *touch no unclean thing* plainly affirms the clean/unclean distinction: the Torah is not abolished but kept by a called-out, separated people who bear the vessels of Yahuah clean.',
       sv.verse_id, ev.verse_id, 'free', 27287
  FROM _s303_isa52_lookup sv, _s303_isa52_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=52 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-52-behold-my-servant-exalted-and-extolled',
       E'Behold, my servant — exalted and extolled; he shall sprinkle many nations',
       E'The chapter closes with the prologue that flows straight into the suffering servant of chapter 53: *Behold, my servant shall deal prudently, he shall be exalted and extolled, and be very high. As many were astonied at thee; his visage was so marred more than any man, and his form more than the sons of men: So shall he sprinkle many nations; the kings shall shut their mouths at him: for that which had not been told them shall they see; and that which they had not heard shall they consider* (Isaiah 52:13-15). The pattern is exaltation THROUGH humiliation — the marred servant lifted very high. Paul sings the same arc of the Formed Son: *he humbled himself, and became obedient unto death, even the death of the cross. Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:8-9). The lifting-up is at once the cross and the throne: *as Moses lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up* (John 3:14); *I, if I be lifted up from the earth, will draw all men unto me* (John 12:32). And *so shall he sprinkle many nations* reads the servant as the great priest whose blood cleanses — *sprinkle of the blood with his finger seven times* (Leviticus 16:14), *the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24) — the nations cleansed and brought in, grafted to Yashar''el, never replacing it. Paul applies the unheard tidings to the unreached: *To whom he was not spoken of, they shall see: and they that have not heard shall understand* (Romans 15:21). The high-and-lifted-up servant draws the nations, sprinkles them clean, and is seen by those to whom he was never told.',
       sv.verse_id, ev.verse_id, 'free', 27290
  FROM _s303_isa52_lookup sv, _s303_isa52_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=52 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Awake, awake, stand up, O Jerusalem, which hast drunk... the cup of his fury* (Isaiah 51:17) — the city roused to face judgment is now roused to put on her beautiful garments (Isaiah 52:1).'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=1
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-awake-awake-loose-thyself-from-the-bands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1) — the roused Zion of *put on thy beautiful garments* (Isaiah 52:1) clothed in glory.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=1
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-awake-awake-loose-thyself-from-the-bands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thy sons shall come from far, and thy daughters shall be nursed at thy side* (Isaiah 60:4) — the *captive daughter of Zion* loosed from her bands (Isaiah 52:2) sees her scattered children gathered home, the two-house regathering.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=2
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-awake-awake-loose-thyself-from-the-bands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15) — Paul quotes Isaiah 52:7 verbatim of the sent preacher of the good news.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=7
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-how-beautiful-upon-the-mountains-the-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Behold upon the mountains the feet of him that bringeth good tidings, that publisheth peace! O Yahudah (Judah), keep thy solemn feasts* (Nahum 1:15) — the lateral Tanakh twin of Isaiah 52:7, binding the good tidings to keeping the appointed feasts.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=7
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-how-beautiful-upon-the-mountains-the-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1) — the command that opened the comfort oracle is announced accomplished: *Yahuah (LORD) hath comforted his people, he hath redeemed Jerusalem* (Isaiah 52:9).'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=9
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-the-watchmen-shall-see-eye-to-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1) — the bared *holy arm* of Isaiah 52:10 IS the suffering servant chapter 53 unfolds; the arm is the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=10
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-the-bared-arm-the-salvation-seen-to-the-ends'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:38) — John applies the revealed arm of Isaiah 52:10 / 53:1 to Yahusha (Jesus), the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=10
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-the-bared-arm-the-salvation-seen-to-the-ends'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And all flesh shall see the salvation of Elohim (God)* (Luke 3:6) — Luke makes universal what Isaiah 52:10 declared: *all the ends of the earth shall see the salvation of our Elohim*.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=10
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-the-bared-arm-the-salvation-seen-to-the-ends'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing* (2 Corinthians 6:17) — Paul quotes Isaiah 52:11 verbatim; *touch not the unclean thing* affirms the clean/unclean distinction, Torah not abolished.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=11
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-go-ye-out-touch-no-unclean-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Come out of her, my people, that ye be not partakers of her sins* (Revelation 18:4) — the double *go ye out of the midst of her* (Isaiah 52:11) sounded against Babylon; come out, be clean.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=11
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-go-ye-out-touch-no-unclean-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8) — the marred servant (Isaiah 52:14) who first humbled himself before being exalted (52:13).'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=13
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-behold-my-servant-exalted-and-extolled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9) — *exalted and extolled, and... very high* (Isaiah 52:13); the Formed Son lifted up BY the Father.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=13
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-behold-my-servant-exalted-and-extolled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *even so must the Son of Adam be lifted up* (John 3:14) — the servant *exalted and extolled, and... very high* (Isaiah 52:13) is the Son of Adam lifted up, cross and exaltation in one.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=13
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-behold-my-servant-exalted-and-extolled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I, if I be lifted up from the earth, will draw all men unto me* (John 12:32) — the high-and-lifted-up servant (Isaiah 52:13) who *shall sprinkle many nations* (52:15) draws the nations to himself.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=13
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-behold-my-servant-exalted-and-extolled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *sprinkle of the blood with his finger seven times* (Leviticus 16:14) — *So shall he sprinkle many nations* (Isaiah 52:15) reads the marred servant as the great priest whose atoning sprinkling cleanses the nations and brings them in.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=14
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-behold-my-servant-exalted-and-extolled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24) — the servant who *shall sprinkle many nations* (Isaiah 52:15) is the mediator whose sprinkled blood cleanses; the nations grafted in, not a people replaced.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=14
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-behold-my-servant-exalted-and-extolled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *To whom he was not spoken of, they shall see: and they that have not heard shall understand* (Romans 15:21) — Paul quotes Isaiah 52:15 verbatim of preaching where Messiah was not named; the unreached nations see and understand.'
  FROM cross_reference_threads t
  JOIN _s303_isa52_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=52 AND sv.verse_number=15
  JOIN _s303_isa52_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-52-behold-my-servant-exalted-and-extolled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_53.sql (Isaiah 53) -----
-- Chapter: Isaiah 53 — THE SUFFERING-SERVANT KEYSTONE of the whole Tanakh. ★★★ THE SERVANT IS THE
-- MESSIAH, the Formed Son who suffers — NOT collective-Israel-only. The chapter itself forecloses the
-- collective reading: the servant is *wounded for OUR transgressions* (53:5) and *for the transgression
-- of MY PEOPLE was he stricken* (53:8) — he is DISTINCT from the people he dies for, therefore an
-- individual; and he is sinless — *he had done no violence, neither was any deceit in his mouth* (53:9) —
-- which Israel collectively never is in Isaiah. The New Testament names him by quoting THIS chapter
-- verbatim again and again (John 12, Romans 10, Matthew 8, 1 Peter 2, Acts 8, Luke 22, Mark 15,
-- Hebrews 9). The Formed/Formless lens: the servant has a Father — *it pleased Yahuah (LORD) to bruise
-- him* (53:10) — the Formed Son emptied and exalted BY the Father, never a co-equal person. Torah-never-
-- abolished: *thou shalt make his soul an offering for sin* (53:10) is the asham guilt-offering
-- (Leviticus 5) FULFILLED, not abolished. Two-house: *my people* (53:8) = the covenant people he redeems,
-- the *all we like sheep* (53:6) gathered back to the Shepherd (1 Peter 2:25).
-- Tag: isa53   Temp view: _s303_isa53_lookup
-- Sort band: base 27300, step 3 -> threads at 27300, 27303, 27306, 27309, 27312, 27315, 27318, 27321 (8)
-- Source of EVERY row: 'canon','isaiah',53,v
--
-- Isaiah 53 coverage:
--   ★ v.1 (Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?)
--        NT:     ★★ John 12:38 + Romans 10:16 (both quote it verbatim of unbelief at Messiah's coming) — THREAD 1
--        Extras: none warranted
--        Tanakh: Isaiah 52:10 (Yahuah hath made bare his holy arm) — woven in prose (the bared arm = the report)
--   v.2-3 (he hath no form nor comeliness... despised and rejected of men; a man of sorrows)
--        NT:     ★ John 1:11 (He came unto his own, and his own received him not) — THREAD 2
--        Extras: none warranted (the despised-righteous-one type is THREAD 8's Wisdom/Enoch weave)
--        Tanakh: none warranted distinct (woven into THREAD 2)
--   ★ v.4 (Surely he hath borne our griefs, and carried our sorrows)
--        NT:     ★★ Matthew 8:17 (Himself took our infirmities, and bare our sicknesses — quoted verbatim of his healings) — THREAD 2
--        Extras: none warranted
--        Tanakh: none warranted
--   ★★ v.5-6 (he was wounded for our transgressions... with his stripes we are healed. All we like sheep have gone astray)
--        NT:     ★★ 1 Peter 2:24 (by whose stripes ye were healed) + 1 Peter 2:25 (For ye were as sheep going astray) — THREAD 3
--        Extras: none warranted
--        Tanakh: none warranted distinct (the substitution is the heart of the chapter, carried in prose)
--   ★★ v.7 (he was oppressed... yet he opened not his mouth: he is brought as a lamb to the slaughter)
--        NT:     ★★ Acts 8:32 (He was led as a sheep to the slaughter) + Acts 8:35 (Philip... preached unto him Yahusha) — THREAD 4;
--                ★ Mark 15:5 (Yahusha yet answered nothing; so that Pilate marvelled — silent before accusers) — THREAD 4;
--                ★ John 1:29 (Behold the Lamb of Elohim) + 1 Corinthians 5:7 (Messiah our passover is sacrificed for us) — THREAD 4
--        Extras: none warranted
--        Tanakh: none warranted distinct (Exodus 12 Passover lamb woven in prose)
--   ★ v.8 (cut off out of the land of the living: for the transgression of my people was he stricken)
--        NT:     ★ Acts 8:33 (the eunuch passage continues — In his humiliation his judgment was taken away) — THREAD 4
--        Extras: none warranted
--        Tanakh: none warranted (this is the DISTINCT-from-the-people proof, framed in THREAD 4 + header)
--   ★ v.9 (he made his grave with the wicked, and with the rich in his death; because he had done no violence)
--        NT:     ★ Matthew 27:57 + 27:60 (the rich man of Arimathaea's new tomb) + 1 Peter 2:22 (Who did no sin,
--                neither was guile found in his mouth — quotes 53:9 of his sinlessness) — THREAD 5
--        Extras: none warranted
--        Tanakh: none warranted
--   ★★ v.10-11 (it pleased Yahuah to bruise him... an offering for sin... he shall prolong his days... justify many)
--        NT:     ★ Hebrews 9:28 (Messiah was once offered to bear the sins of many) — THREAD 6;
--                ★★ Romans 5:19 (by the obedience of one shall many be made righteous) — THREAD 6
--        Extras: none warranted distinct (the asham/Leviticus 5 fulfilment + Formed-Son-bruised-BY-the-Father woven in prose)
--        Tanakh: Leviticus 5 asham guilt-offering — woven in prose (the offering for sin FULFILLED, not abolished)
--   ★★ v.12 (he bare the sin of many, and made intercession for the transgressors; numbered with the transgressors)
--        NT:     ★★ Luke 22:37 (he was reckoned among the transgressors — Yahusha quotes 53:12 of himself) +
--                Mark 15:28 (And he was numbered with the transgressors — crucified between two thieves) +
--                ★ Hebrews 7:25 (he ever liveth to make intercession for them) — THREAD 7
--        Extras: none warranted (the exaltation-of-the-portioned-one is THREAD 8)
--        Tanakh: none warranted
--   ★★ v.3 + v.11 + v.12 read as the RIGHTEOUS-ONE-CONDEMNED-THEN-EXALTED type
--        NT:     (carried by the NT threads above)
--        Extras: ★★ Wisdom of Solomon 2:12,19,20 (let us lie in wait for the righteous... condemn him with a
--                shameful death — the persecuted righteous one mocked and slain) + ★★ 1 Enoch 62:7,9 (the Son of
--                Adam... shall raise up the kings and the mighty from their seats — the Elect One exalted after
--                being hidden/rejected) — THREAD 8
--        Tanakh: woven in prose (Psalm 22 the despised-and-vindicated sufferer — named in prose, not forced)
--
-- Threads (slug — target libraries):
--   1. isaiah-53-who-hath-believed-our-report-the-arm-of-yahuah-revealed — NT (John 12, Romans 10) [free]
--      (★★ the report unbelieved at Messiah's coming; the bared holy arm of 52:10)
--   2. isaiah-53-a-man-of-sorrows-he-bore-our-griefs — NT (John 1, Matthew 8) [free]
--      (★ despised and rejected, his own received him not; he bore our griefs — quoted of his healings)
--   3. isaiah-53-with-his-stripes-we-are-healed-all-we-like-sheep — NT (1 Peter 2) [free]
--      (★★ the substitutionary wounding; with his stripes ye were healed; sheep going astray returned to the Shepherd)
--   4. isaiah-53-brought-as-a-lamb-to-the-slaughter — NT (Acts 8, Mark 15, John 1, 1 Corinthians 5) [free]
--      (★★ the silent Lamb the eunuch reads and Philip preaches as Yahusha; the Passover Lamb; cut off for MY PEOPLE)
--   5. isaiah-53-his-grave-with-the-rich-no-deceit-in-his-mouth — NT (Matthew 27, 1 Peter 2) [free]
--      (★ the rich man's tomb; the sinless one — who did no sin, neither was guile found in his mouth)
--   6. isaiah-53-an-offering-for-sin-he-shall-prolong-his-days — NT (Hebrews 9, Romans 5) [free]
--      (★★ the asham offering FULFILLED; prolong his days = resurrection after being cut off; justify many)
--   7. isaiah-53-numbered-with-the-transgressors-made-intercession — NT (Luke 22, Mark 15, Hebrews 7) [free]
--      (★★ Yahusha quotes 53:12 of himself; numbered with the transgressors; ever liveth to make intercession)
--   8. isaiah-53-the-righteous-one-condemned-the-elect-one-exalted — Extras (Wisdom of Solomon 2, 1 Enoch 62) [extras]
--      (★★ the persecuted-righteous-one type; the Elect One/Son of Adam exalted after rejection)
--
-- Framework-load-bearing / contested framing:
--   ★★★ THE SERVANT IS THE MESSIAH, NOT COLLECTIVE ISRAEL (header + every NT thread): the collective-Israel
--      reading is the counter-reading this apparatus overrides. The text itself proves an individual:
--      *for the transgression of MY PEOPLE was he stricken* (53:8) sets the servant APART from the people he
--      dies for; *he had done no violence, neither was any deceit in his mouth* (53:9) makes him sinless, which
--      Israel collectively never is in Isaiah. The NT then NAMES him by quoting the chapter verbatim.
--   ★★ FORMED/FORMLESS (THREAD 6 prose): *it pleased Yahuah (LORD) to bruise him* (53:10) — the servant has a
--      Father; the Formed Son emptied and exalted BY the Most High, never a co-equal trinitarian person.
--   ★★ TORAH NEVER ABOLISHED (THREAD 6 prose): *thou shalt make his soul an offering for sin* (53:10) — the
--      asham guilt-offering of Leviticus 5 FULFILLED in him, the type meeting its substance; not abolished.
--   ★ TWO-HOUSE (THREAD 3): *All we like sheep have gone astray* (53:6) gathered back — *ye were as sheep going
--      astray; but are now returned unto the Shepherd* (1 Peter 2:25); *my people* (53:8) = the covenant people redeemed.
--   EXTRAS (THREAD 8): Wisdom of Solomon 2 (the righteous one mocked, condemned to a shameful death — a 2nd-Temple
--      witness to the persecuted-righteous-one type) and 1 Enoch 62 (the Elect One/Son of Adam, hidden then
--      seated on the throne of glory) — clean witnesses; 1 Enoch 62:5 SKIPPED (carries a "(Note:...)" apparatus
--      fragment), Wisdom 2:24 skipped (end-marker). Extras woven only on THREAD 8; canon NT carries the chapter.
--   VERSES WITH NO SEPARATE ADD: none silently skipped — every verse v.1-12 is bound to a thread above; v.6b
--      (Yahuah hath laid on him the iniquity of us all) is woven into THREAD 3 with v.5-6a; v.10b-11a (he shall
--      see his seed... travail of his soul) woven into THREAD 6 with v.10-11.

CREATE TEMP VIEW _s303_isa53_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Who hath believed our report? — the report unbelieved at Messiah's coming
    ('canon','isaiah',53,1,'canon','john',12,38,'free',
      E'*That the saying of Esaias the prophet might be fulfilled, which he spake, Yahuah (Lord), who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:38). John quotes Isaiah 53:1 word for word to explain why, after so many miracles, *yet they believed not on him* (John 12:37). The servant''s *report* (Isaiah 53:1) is the gospel of the Messiah; the *arm of Yahuah (LORD)* bared in 52:10 is revealed in him — and the marvel of the chapter is how few believe it.'),
    ('canon','isaiah',53,1,'canon','romans',10,16,'free',
      E'*But they have not all obeyed the gospel. For Esaias saith, Yahuah (Lord), who hath believed our report?* (Romans 10:16). Paul quotes Isaiah 53:1 to name Israel''s unbelief of the very gospel preached to them — *Who hath believed our report?* The servant''s report goes out, *faith cometh by hearing, and hearing by the word of Elohim (God)* (10:17), yet the report of the suffering Messiah is the stumbling-block; the chapter foretells its own rejection.'),

    -- THREAD 2 (★): A man of sorrows / he bore our griefs
    ('canon','isaiah',53,3,'canon','john',1,11,'free',
      E'*He came unto his own, and his own received him not* (John 1:11). The servant is *despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not* (Isaiah 53:3). John names the rejection: the Word made flesh *came unto his own, and his own received him not* — the despised servant is the unreceived Messiah, esteemed not by the very people he came to.'),
    ('canon','isaiah',53,4,'canon','matthew',8,17,'free',
      E'*That it might be fulfilled which was spoken by Esaias the prophet, saying, Himself took our infirmities, and bare our sicknesses* (Matthew 8:17). Matthew quotes Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows* — of Yahusha healing all the sick at evening (8:16). The servant who bears the griefs of his people is the One who *took our infirmities, and bare our sicknesses*; the prophecy is fulfilled in his very hands.'),

    -- THREAD 3 (★★): With his stripes we are healed / all we like sheep
    ('canon','isaiah',53,5,'canon','1-peter',2,24,'free',
      E'*Who his own self bare our sins in his own body on the tree, that we, being dead to sins, should live unto righteousness: by whose stripes ye were healed* (1 Peter 2:24). Peter quotes Isaiah 53:5 — *he was wounded for our transgressions, he was bruised for our iniquities... and with his stripes we are healed* — of the Messiah on the tree. The wounding is substitutionary: he bore OUR sins in his own body, and *by whose stripes ye were healed*. The servant is distinct from the sinners he heals; he is the sin-bearer.'),
    ('canon','isaiah',53,6,'canon','1-peter',2,25,'free',
      E'*For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25). Peter quotes Isaiah 53:6 — *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all*. The straying sheep are *returned unto the Shepherd* — the scattered covenant people gathered back to the One on whom Yahuah laid the iniquity of them all; the two-house flock brought home to its Shepherd.'),

    -- THREAD 4 (★★): Brought as a lamb to the slaughter — the silent Lamb, cut off for my people
    ('canon','isaiah',53,7,'canon','acts',8,32,'free',
      E'*The place of the scripture which he read was this, He was led as a sheep to the slaughter; and like a lamb dumb before his shearer, so opened he not his mouth* (Acts 8:32). The Ethiopian eunuch is reading Isaiah 53:7 itself — *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth*. The very verse the eunuch reads in his chariot is the silent suffering servant; the question *of whom speaketh the prophet this?* (8:34) opens the door to the gospel.'),
    ('canon','isaiah',53,8,'canon','acts',8,33,'free',
      E'*In his humiliation his judgment was taken away: and who shall declare his generation? for his life is taken from the earth* (Acts 8:33). The eunuch reads on into Isaiah 53:8 — *He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken*. He is *cut off* for the transgression of *MY PEOPLE* — distinct from the people, stricken in their place; an individual, the Messiah, not collective Israel.'),
    ('canon','isaiah',53,7,'canon','acts',8,35,'free',
      E'*Then Philip opened his mouth, and began at the same scripture, and preached unto him Yahusha (Jesus)* (Acts 8:35). Philip takes the eunuch''s question about *a lamb to the slaughter* (Isaiah 53:7) and *began at the same scripture, and preached unto him Yahusha (Jesus)*. The apostolic answer to "of whom speaketh the prophet this?" is named outright: the silent Lamb of Isaiah 53 is Yahusha — the chapter is about the Messiah, by the church''s own reading.'),
    ('canon','isaiah',53,7,'canon','mark',15,5,'free',
      E'*But Yahusha (Jesus) yet answered nothing; so that Pilate marvelled* (Mark 15:5). The servant *opened not his mouth* (Isaiah 53:7) — and before Pilate, accused of many things, *Yahusha (Jesus) yet answered nothing; so that Pilate marvelled*. The lamb dumb before her shearers is the silent Messiah before his accusers, fulfilling the verse to the letter.'),
    ('canon','isaiah',53,7,'canon','john',1,29,'free',
      E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29). The *lamb to the slaughter* of Isaiah 53:7 is named by the Baptist: *Behold the Lamb of Elohim (God), which taketh away the sin of the world*. The Passover lamb of Exodus 12 and the silent lamb of Isaiah 53 meet in the One John points to — the Lamb who bears away sin.'),
    ('canon','isaiah',53,7,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The *lamb to the slaughter* (Isaiah 53:7) is *Messiah (Christ) our passover... sacrificed for us* — the Passover lamb of the appointed times (Exodus 12), the feast still kept (*let us keep the feast*, 5:8), fulfilled in the slain servant. The Torah''s lamb is not abolished but met in its substance.'),

    -- THREAD 5 (★): His grave with the rich / no deceit in his mouth
    ('canon','isaiah',53,9,'canon','matthew',27,57,'free',
      E'*When the even was come, there came a rich man of Arimathaea, named Joseph, who also himself was Yahusha''s (Jesus'') disciple* (Matthew 27:57). The servant *made his grave with the wicked, and with the rich in his death* (Isaiah 53:9) — crucified between two thieves (with the wicked), then buried by *a rich man of Arimathaea*. The strange double of the verse — wicked AND rich — is fulfilled exactly in the death and burial of the Messiah.'),
    ('canon','isaiah',53,9,'canon','matthew',27,60,'free',
      E'*And laid it in his own new tomb, which he had hewn out in the rock: and he rolled a great stone to the door of the sepulchre, and departed* (Matthew 27:60). *With the rich in his death* (Isaiah 53:9) — the body of Yahusha is laid in the rich man''s *own new tomb... hewn out in the rock*. The servant who died among the wicked is buried in the rich man''s grave, the prophecy fulfilled to the detail.'),
    ('canon','isaiah',53,9,'canon','1-peter',2,22,'free',
      E'*Who did no sin, neither was guile found in his mouth* (1 Peter 2:22). Peter quotes Isaiah 53:9 — *because he had done no violence, neither was any deceit in his mouth* — of the Messiah''s sinlessness. This is the proof the servant is no collective people but the spotless individual: *who did no sin*. Israel collectively is never sinless in Isaiah; the servant alone is, the Lamb without blemish.'),

    -- THREAD 6 (★★): An offering for sin / he shall prolong his days / justify many
    ('canon','isaiah',53,10,'canon','hebrews',9,28,'free',
      E'*So Messiah (Christ) was once offered to bear the sins of many; and unto them that look for him shall he appear the second time without sin unto salvation* (Hebrews 9:28). When *thou shalt make his soul an offering for sin* (Isaiah 53:10), the servant is the asham guilt-offering (Leviticus 5) fulfilled — *Messiah (Christ) was once offered to bear the sins of many*. *It pleased Yahuah (LORD) to bruise him*: the Formed Son bruised and offered BY the Father, the type meeting its substance, the Torah''s offering not abolished but consummated.'),
    ('canon','isaiah',53,11,'canon','romans',5,19,'free',
      E'*For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous* (Romans 5:19). The servant *shall prolong his days* — raised after being *cut off* — and *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). Paul names it: *by the obedience of one shall many be made righteous*. The righteous servant justifies many by bearing their iniquities; the resurrection (prolonged days) seals the justification.'),

    -- THREAD 7 (★★): Numbered with the transgressors / made intercession
    ('canon','isaiah',53,12,'canon','luke',22,37,'free',
      E'*For I say unto you, that this that is written must yet be accomplished in me, And he was reckoned among the transgressors: for the things concerning me have an end* (Luke 22:37). Yahusha quotes Isaiah 53:12 OF HIMSELF — *he was numbered with the transgressors* — *this that is written must yet be accomplished in me*. The Messiah names the suffering servant as himself; there is no clearer proof the chapter speaks of the individual, not the nation.'),
    ('canon','isaiah',53,12,'canon','mark',15,28,'free',
      E'*And the scripture was fulfilled, which saith, And he was numbered with the transgressors* (Mark 15:28). Crucified between two thieves, *and he was numbered with the transgressors* (Isaiah 53:12) is fulfilled at the cross — *with him they crucify two thieves; the one on his right hand, and the other on his left* (15:27). The servant *poured out his soul unto death* among the wicked, exactly as written.'),
    ('canon','isaiah',53,12,'canon','hebrews',7,25,'free',
      E'*Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). The servant *made intercession for the transgressors* (Isaiah 53:12) — and the risen Messiah *ever liveth to make intercession for them*. The intercession is not finished at the cross but continues in the One who *shall prolong his days* (53:10); the priest after the order of Melek Tsadiq (Melchizedek) pleads for the many whose sin he bore.'),

    -- THREAD 8 (★★ extras): The righteous one condemned, the Elect One exalted
    ('canon','isaiah',53,3,'apocrypha','the-wisdom-of-solomon',2,12,'extras',
      E'*Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education* (Wisdom of Solomon 2:12). The *man of sorrows... despised, and we esteemed him not* (Isaiah 53:3) is the persecuted righteous one the ungodly plot against — *let us lie in wait for the righteous*. The 2nd-Temple witness already reads the suffering of the righteous one as the world''s hatred of the one who reproves its lawlessness.'),
    ('canon','isaiah',53,12,'apocrypha','the-wisdom-of-solomon',2,19,'extras',
      E'*Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience* (Wisdom of Solomon 2:19). The servant who *opened not his mouth* and was *numbered with the transgressors* (Isaiah 53:7,12) is foreshadowed in the righteous one tortured to test his meekness — *let us examine him with despitefulness and torture... and prove his patience*. The mockers'' own words script the patient, silent suffering of the just.'),
    ('canon','isaiah',53,12,'apocrypha','the-wisdom-of-solomon',2,20,'extras',
      E'*Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20). The servant *poured out his soul unto death* and *was numbered with the transgressors* (Isaiah 53:12); the ungodly resolve *let us condemn him with a shameful death*. The shameful death of the righteous son who calls Yahuah his father (2:16-18) is the very pattern Isaiah 53 unfolds — the just one slain, then vindicated.'),
    ('canon','isaiah',53,11,'enoch','1-enoch',62,7,'extras',
      E'*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* (1 Enoch 62:7). The *righteous servant* who shall *justify many* (Isaiah 53:11) is the Son of Adam *born unto righteousness*, hidden from before the world and now revealed — the Elect One in whom righteousness dwells. The restored witness binds the suffering-and-justifying servant to the exalted Son of Adam before the Head of Days.'),
    ('canon','isaiah',53,12,'enoch','1-enoch',62,9,'extras',
      E'*And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And shall loosen the reins of the strong, And break the teeth of the sinners* (1 Enoch 62:9). The servant who was *numbered with the transgressors* (Isaiah 53:12) — humbled, despised, slain — is the same Son of Adam exalted to judge the kings and the mighty. The pattern is one: rejected and cut off, then *divide him a portion with the great* (53:12); the suffering servant and the enthroned Elect One are the same Formed Son.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa53_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa53_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-who-hath-believed-our-report-the-arm-of-yahuah-revealed',
       E'Who hath believed our report — the arm of Yahuah revealed and refused',
       E'The suffering-servant song opens with a lament over unbelief: *Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1). The *arm of Yahuah (LORD)* is the one just bared in the previous breath — *Yahuah (LORD) hath made bare his holy arm in the eyes of all the nations; and all the ends of the earth shall see the salvation of our Elohim (God)* (Isaiah 52:10). That bared arm, that saving power, is the servant himself — and the marvel of the chapter is how few receive him. The New Testament quotes this verse verbatim to name the unbelief at Messiah''s coming. John, after all the miracles, writes: *That the saying of Esaias the prophet might be fulfilled, which he spake, Yahuah (Lord), who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:38). And Paul: *But they have not all obeyed the gospel. For Esaias saith, Yahuah (Lord), who hath believed our report?* (Romans 10:16). The report is the gospel of the suffering Messiah; the chapter foretells its own rejection. Read it as covenant-lawsuit, never ethnic verdict — the report goes out, *faith cometh by hearing* (Romans 10:17), and a remnant believes.',
       sv.verse_id, ev.verse_id, 'free', 27300
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-a-man-of-sorrows-he-bore-our-griefs',
       E'A man of sorrows — despised and rejected, yet bearing our griefs',
       E'The servant is no figure of glory to the eye: *he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him. He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not* (Isaiah 53:2-3). John names the rejection of the Word made flesh: *He came unto his own, and his own received him not* (John 1:11) — the despised servant is the unreceived Messiah, esteemed not by the very people he came to. Yet the sorrows he bears are not his own: *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (53:4). Matthew quotes that very verse of Yahusha''s healings: *Himself took our infirmities, and bare our sicknesses* (Matthew 8:17). The One despised and rejected is the One who carries the griefs of his people — the man of sorrows who bears the sorrows of the many.',
       sv.verse_id, ev.verse_id, 'free', 27303
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-with-his-stripes-we-are-healed-all-we-like-sheep',
       E'With his stripes we are healed — the substitution, and the straying sheep gathered',
       E'Here is the heart of the chapter, the substitutionary exchange: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). He is wounded for OUR transgressions — distinct from the sinners he heals, the One on whom the punishment falls. And the sheep who went astray are us: *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (53:6). Peter quotes both verses of the Messiah on the tree: *Who his own self bare our sins in his own body on the tree, that we, being dead to sins, should live unto righteousness: by whose stripes ye were healed* (1 Peter 2:24); *For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25). The straying flock is gathered back — the scattered covenant people, both houses, *returned unto the Shepherd* on whom Yahuah laid the iniquity of them all. The servant bears; the sheep are healed and brought home.',
       sv.verse_id, ev.verse_id, 'free', 27306
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-brought-as-a-lamb-to-the-slaughter',
       E'Brought as a lamb to the slaughter — the silent Lamb the church preaches as Yahusha',
       E'The servant goes to death silent and unresisting: *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). This is the verse the Ethiopian eunuch is reading in his chariot — *The place of the scripture which he read was this, He was led as a sheep to the slaughter; and like a lamb dumb before his shearer, so opened he not his mouth* (Acts 8:32) — and on into 53:8 — *In his humiliation his judgment was taken away: and who shall declare his generation? for his life is taken from the earth* (Acts 8:33). When the eunuch asks *of whom speaketh the prophet this? of himself, or of some other man?* the apostolic answer is unambiguous: *Then Philip opened his mouth, and began at the same scripture, and preached unto him Yahusha (Jesus)* (Acts 8:35). The silent Lamb IS Yahusha — the chapter is Messianic by the church''s own reading. The silence is fulfilled before Pilate: *But Yahusha (Jesus) yet answered nothing; so that Pilate marvelled* (Mark 15:5). And the Lamb is the Passover Lamb: *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29); *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — the appointed-times lamb of Exodus 12 met in its substance, the feast still kept. And note the proof of the individual: *for the transgression of MY PEOPLE was he stricken* (53:8) — he is cut off FOR the people, distinct from them; not collective Israel, but the Messiah who dies in their place.',
       sv.verse_id, ev.verse_id, 'free', 27309
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-his-grave-with-the-rich-no-deceit-in-his-mouth',
       E'His grave with the rich — the sinless one, no deceit in his mouth',
       E'The servant''s death and burial are foretold in a strange double: *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth* (Isaiah 53:9). With the wicked — crucified between two thieves; and with the rich — buried in a rich man''s tomb: *When the even was come, there came a rich man of Arimathaea, named Joseph, who also himself was Yahusha''s (Jesus'') disciple* (Matthew 27:57), who *laid it in his own new tomb, which he had hewn out in the rock* (Matthew 27:60). Both halves of the verse fulfilled to the letter. And the ground of it all is the servant''s sinlessness — *because he had done no violence, neither was any deceit in his mouth* — which Peter quotes: *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22). This is the decisive proof that the servant is an individual, not the nation: Israel collectively is never sinless in Isaiah, but the servant *did no sin* — the Lamb without blemish, the spotless Messiah.',
       sv.verse_id, ev.verse_id, 'free', 27312
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-an-offering-for-sin-he-shall-prolong-his-days',
       E'An offering for sin — he shall prolong his days, and justify many',
       E'The death of the servant is the Father''s own purpose, and an offering: *Yet it pleased Yahuah (LORD) to bruise him; he hath put him to grief: when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days, and the pleasure of Yahuah (LORD) shall prosper in his hand* (Isaiah 53:10). Two pillars stand here. First, the Formed and the Formless: *it pleased Yahuah (LORD) to bruise him* — the servant has a Father; the Formed Son is offered and bruised BY the Most High, never a co-equal trinitarian person. Second, the Torah fulfilled, not abolished: *thou shalt make his soul an offering for sin* is the asham guilt-offering (Leviticus 5) meeting its substance — *So Messiah (Christ) was once offered to bear the sins of many* (Hebrews 9:28). And the resurrection is written in: he is *cut off* (53:8) yet *shall prolong his days* — life beyond death. *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (53:11). Paul names the justification: *by the obedience of one shall many be made righteous* (Romans 5:19). The righteous servant, raised, justifies the many by bearing their iniquities — the offering accepted, the Father''s pleasure prospering in his hand.',
       sv.verse_id, ev.verse_id, 'free', 27315
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-numbered-with-the-transgressors-made-intercession',
       E'Numbered with the transgressors — and he made intercession for them',
       E'The song closes in victory wrung from death: *Therefore will I divide him a portion with the great, and he shall divide the spoil with the strong; because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors* (Isaiah 53:12). Yahusha quotes this verse OF HIMSELF on the night he is betrayed: *For I say unto you, that this that is written must yet be accomplished in me, And he was reckoned among the transgressors: for the things concerning me have an end* (Luke 22:37) — there is no plainer proof the chapter speaks of the individual Messiah, not the nation. It is fulfilled at the cross between two thieves: *And the scripture was fulfilled, which saith, And he was numbered with the transgressors* (Mark 15:28). And the intercession does not end at his death — *and made intercession for the transgressors* continues in the risen, ever-living priest: *he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). The servant who *poured out his soul unto death* is the priest after the order of Melek Tsadiq (Melchizedek) who lives to plead for the many whose sin he bore.',
       sv.verse_id, ev.verse_id, 'free', 27318
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 8 (★★ extras)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-53-the-righteous-one-condemned-the-elect-one-exalted',
       E'The righteous one condemned, the Elect One exalted — the restored witnesses',
       E'The pattern of Isaiah 53 — the righteous one despised, condemned, slain, then vindicated and exalted — runs through the restored library. The Wisdom of Solomon puts the ungodly''s plot in their own mouths: *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law* (Wisdom of Solomon 2:12); *Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience* (2:19); *Let us condemn him with a shameful death: for by his own saying he shall be respected* (2:20). The righteous son who calls Yahuah his father, mocked and condemned to a shameful death — this is the *man of sorrows... despised, and we esteemed him not* (Isaiah 53:3), the servant who *opened not his mouth* and was *numbered with the transgressors* (53:7,12), a 2nd-Temple witness reading the suffering of the just exactly as Isaiah sings it. And the vindication is the throne: 1 Enoch names the Elect One, the Son of Adam, hidden before the world and now revealed — *This is the Son of Adam who is born unto righteousness, And righteousness abides over him* (1 Enoch 62:7); *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9). The same One who *shall justify many* and was *numbered with the transgressors* (Isaiah 53:11-12) is exalted to judge the kings and the mighty — for the suffering servant and the enthroned Elect One are one Formed Son: rejected and cut off, then given *a portion with the great* (53:12).',
       sv.verse_id, ev.verse_id, 'extras', 27321
  FROM _s303_isa53_lookup sv, _s303_isa53_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=53 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:38) — Isaiah 53:1 quoted verbatim of unbelief after all the miracles.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=1
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-who-hath-believed-our-report-the-arm-of-yahuah-revealed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *For Esaias saith, Yahuah (Lord), who hath believed our report?* (Romans 10:16) — Isaiah 53:1 quoted to name Israel''s unbelief of the gospel of the suffering Messiah.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=1
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-who-hath-believed-our-report-the-arm-of-yahuah-revealed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *He came unto his own, and his own received him not* (John 1:11) — the *despised and rejected... a man of sorrows* (Isaiah 53:3) is the unreceived Messiah.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=3
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-a-man-of-sorrows-he-bore-our-griefs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Himself took our infirmities, and bare our sicknesses* (Matthew 8:17) — Isaiah 53:4 (*he hath borne our griefs, and carried our sorrows*) quoted of Yahusha''s healings.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=4
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-a-man-of-sorrows-he-bore-our-griefs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *by whose stripes ye were healed* (1 Peter 2:24) — Isaiah 53:5 (*with his stripes we are healed*) quoted of the Messiah bearing our sins on the tree.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=5
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-with-his-stripes-we-are-healed-all-we-like-sheep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *For ye were as sheep going astray; but are now returned unto the Shepherd* (1 Peter 2:25) — Isaiah 53:6 (*All we like sheep have gone astray*); the two-house flock gathered home.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=6
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-with-his-stripes-we-are-healed-all-we-like-sheep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *He was led as a sheep to the slaughter; and like a lamb dumb before his shearer* (Acts 8:32) — the eunuch is reading Isaiah 53:7 itself in his chariot.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=7
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-brought-as-a-lamb-to-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *In his humiliation his judgment was taken away... for his life is taken from the earth* (Acts 8:33) — Isaiah 53:8; *cut off... for the transgression of MY PEOPLE* proves the individual servant, distinct from the people.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=8
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-brought-as-a-lamb-to-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Philip... began at the same scripture, and preached unto him Yahusha (Jesus)* (Acts 8:35) — the church''s own answer: the silent Lamb of Isaiah 53:7 IS Yahusha.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=7
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-brought-as-a-lamb-to-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *But Yahusha (Jesus) yet answered nothing; so that Pilate marvelled* (Mark 15:5) — *he opened not his mouth* (Isaiah 53:7) fulfilled before his accusers.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=7
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-brought-as-a-lamb-to-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29) — the *lamb to the slaughter* (Isaiah 53:7) named by the Baptist.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=7
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-brought-as-a-lamb-to-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — the slain Lamb of Isaiah 53:7 is the Passover lamb (Exodus 12), the feast still kept, fulfilled not abolished.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=7
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-brought-as-a-lamb-to-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *there came a rich man of Arimathaea, named Joseph* (Matthew 27:57) — *with the rich in his death* (Isaiah 53:9): the rich man''s burial.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=9
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=57
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-his-grave-with-the-rich-no-deceit-in-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *laid it in his own new tomb, which he had hewn out in the rock* (Matthew 27:60) — *he made his grave... with the rich in his death* (Isaiah 53:9) fulfilled to the detail.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=9
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=60
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-his-grave-with-the-rich-no-deceit-in-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22) — Isaiah 53:9 (*neither was any deceit in his mouth*); the sinless servant, proof of the individual, not the nation.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=9
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-his-grave-with-the-rich-no-deceit-in-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Messiah (Christ) was once offered to bear the sins of many* (Hebrews 9:28) — *thou shalt make his soul an offering for sin* (Isaiah 53:10): the asham guilt-offering (Leviticus 5) FULFILLED, not abolished.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=10
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-an-offering-for-sin-he-shall-prolong-his-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *by the obedience of one shall many be made righteous* (Romans 5:19) — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11).'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=11
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-an-offering-for-sin-he-shall-prolong-his-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *And he was reckoned among the transgressors: for the things concerning me have an end* (Luke 22:37) — Yahusha quotes Isaiah 53:12 OF HIMSELF; the plainest proof the chapter speaks of the individual Messiah.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=12
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-numbered-with-the-transgressors-made-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And he was numbered with the transgressors* (Mark 15:28) — Isaiah 53:12 fulfilled at the cross between two thieves.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=12
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=15 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-numbered-with-the-transgressors-made-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he ever liveth to make intercession for them* (Hebrews 7:25) — *made intercession for the transgressors* (Isaiah 53:12) continues in the risen, ever-living priest.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=12
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-numbered-with-the-transgressors-made-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 8 members (★★ extras)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *let us lie in wait for the righteous... he upbraideth us with our offending the law* (Wisdom of Solomon 2:12) — the persecuted righteous one, the *man of sorrows... despised* (Isaiah 53:3).'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=3
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-the-righteous-one-condemned-the-elect-one-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Let us examine him with despitefulness and torture... and prove his patience* (Wisdom of Solomon 2:19) — the silent servant who *opened not his mouth* (Isaiah 53:7), patience tested by torment.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=12
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-the-righteous-one-condemned-the-elect-one-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20) — the just one slain, as the servant *poured out his soul unto death* (Isaiah 53:12).'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=12
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-the-righteous-one-condemned-the-elect-one-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *This is the Son of Adam who is born unto righteousness, And righteousness abides over him* (1 Enoch 62:7) — the *righteous servant* who shall *justify many* (Isaiah 53:11), the Elect One revealed.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=11
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-the-righteous-one-condemned-the-elect-one-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *And this Son of Adam... Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9) — the servant *numbered with the transgressors* (Isaiah 53:12) exalted to judge; suffering servant and enthroned Elect One are one Formed Son.'
  FROM cross_reference_threads t
  JOIN _s303_isa53_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=53 AND sv.verse_number=12
  JOIN _s303_isa53_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-53-the-righteous-one-condemned-the-elect-one-exalted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_54.sql (Isaiah 54) -----
-- Chapter: Isaiah 54 — THE RESTORED-WIFE SONG that follows the suffering Servant of ch53. The
-- barren, put-away, scattered house is called home and made to sing: *Sing, O barren, thou that
-- didst not bear... for more are the children of the desolate than the children of the married
-- wife* (54:1) — Paul quotes it of *Jerusalem which is above... the mother of us all* (Galatians
-- 4:26-27): the restoration of the divorced northern house (Hosea's Lo-Ruhamah/Lo-Ammi made Ammi),
-- the two-house regathering, NEVER a replacement church. Her Maker is her Husband, her Redeemer the
-- Holy One of Yashar'el (54:5) — the Formed Son, the redeemer-husband (Hosea 2:19-20; Ephesians
-- 5:25-32). The forsaking is *a small moment* (54:7-8) — exile — and the gathering is everlasting:
-- sealed by the Noahic oath (Genesis 9:11) and the unbreakable *covenant of my peace* (54:10;
-- Ezekiel 37:26; Romans 11:29 — Elohim hath not cast away his people). The jeweled city is laid
-- with sapphires and pleasant stones (54:11-12 -> Revelation 21:18-21), her children all *taught
-- of Yahuah* (54:13 -> John 6:45 quoted verbatim; the Torah written on the heart, Jeremiah 31:33-34),
-- and the heritage of the servants is vindication: *No weapon that is formed against thee shall
-- prosper... their righteousness is of me* (54:17 -> Romans 8:33-34, the covenant righteousness
-- that produces obedience, kept under the 1 John 2:3-4 filter).
-- Tag: isa54   Temp view: _s303_isa54_lookup
-- Sort band: base 27325, step 3 -> threads at 27325, 27328, 27331, 27334, 27337, 27340, 27343 (7 threads)
-- Source of EVERY row: 'canon','isaiah',54,v
--
-- Isaiah 54 coverage:
--   ★★★ v.1 (Sing, O barren... for more are the children of the desolate than the children of the
--          married wife, saith Yahuah)
--        NT:     ★★★ Galatians 4:27 (Paul quotes it verbatim) + Galatians 4:26 (Jerusalem which is
--                above... the mother of us all) + Galatians 4:28 (children of promise) — THREAD 1
--        Extras: none warranted (the regathering weave is the prophets' own; no clean extras add)
--        Tanakh: ★★ Hosea 2:23 (I will say to them which were not my people, Thou art my people) +
--                Hosea 2:1 (Ammi... Ru-hamah) — THREAD 1 (the divorced house restored, Lo-Ammi -> Ammi)
--   ★ v.2-3 (Enlarge the place of thy tent... thy seed shall inherit the Gentiles)
--        NT:     ★ Romans 4:13 (the promise, that he should be the heir of the world) + Romans 4:16
--                (the promise sure to all the seed) — THREAD 2
--        Extras: none warranted
--        Tanakh: woven (the spreading-out is the regathering of THREAD 1; not forced to a separate add)
--   ★★ v.4-6 (thou shalt forget the shame of thy youth... For thy Maker is thine husband... thy
--          Redeemer the Holy One of Yashar'el... a woman forsaken and grieved in spirit)
--        NT:     ★★ Ephesians 5:25 (Husbands, love your wives, even as Messiah also loved the church)
--                + Ephesians 5:31-32 (one flesh... a great mystery concerning Messiah) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Hosea 2:19-20 (I will betroth thee unto me for ever... in righteousness) +
--                Hosea 2:16 (thou shalt call me Ishi) — THREAD 3 (the Maker/Husband/Redeemer = Formed Son)
--   ★★ v.7-10 (For a small moment have I forsaken thee; but with great mercies will I gather thee...
--          this is as the waters of Noah... neither shall the covenant of my peace be removed)
--        NT:     ★★ Romans 11:29 (the gifts and calling of Elohim are without repentance) + Romans
--                11:1 (Hath Elohim cast away his people? Elohim forbid) — THREAD 4
--        Extras: none warranted (Jubilees 6 Noahic-oath parses to the festival/Shavuot covenant, not
--                the no-more-flood oath in a clean single verse; held in prose, no extras add forced)
--        Tanakh: ★★ Genesis 9:11 (neither shall all flesh be cut off any more by the waters of a
--                flood) + ★★ Ezekiel 37:26 (I will make a covenant of peace with them... an everlasting
--                covenant) — THREAD 4 (the Noahic oath pattern + the unbreakable covenant of peace)
--   ★★ v.11-12 (I will lay thy stones with fair colours, and lay thy foundations with sapphires...
--          all thy borders of pleasant stones)
--        NT:     ★★ Revelation 21:18 (the foundations... garnished with all manner of precious stones)
--                wait — Rev 21:18 is the wall/gold; ★★ Revelation 21:19 (the foundations of the wall...
--                garnished with all manner of precious stones; the first foundation was jasper; the
--                second, sapphire) — THREAD 5
--        Extras: none warranted
--        Tanakh: woven (the New Jerusalem is the NT's own filling of the jeweled city; no Tanakh add forced)
--   ★★ v.13 (And all thy children shall be taught of Yahuah; and great shall be the peace of thy children)
--        NT:     ★★ John 6:45 (It is written in the prophets, And they shall be all taught of Elohim
--                — Yahusha quotes it verbatim) — THREAD 6
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 31:33 (I will put my law in their inward parts, and write it in their
--                hearts) + ★★ Jeremiah 31:34 (they shall all know me, from the least... unto the
--                greatest) — THREAD 6 (taught of Yahuah = Torah on the heart)
--   ★★ v.14-17 (In righteousness shalt thou be established... No weapon that is formed against thee
--          shall prosper... This is the heritage of the servants of Yahuah, and their righteousness
--          is of me)
--        NT:     ★★ Romans 8:33 (Who shall lay any thing to the charge of Elohim's elect? It is
--                Elohim that justifieth) + Romans 8:34 (Who is he that condemneth?) — THREAD 7;
--                ★ 1 John 2:3-4 FILTER (we know him, if we keep his commandments) — THREAD 7
--        Extras: none warranted
--        Tanakh: woven (the vindication of the servants flows from the singular Servant of ch53; in prose)
--
-- Threads (slug — target libraries):
--   1. isaiah-54-sing-o-barren-the-desolate-hath-many-children — NT (Galatians 4) + Tanakh (Hosea 2) [free]
--      (★★★ the barren/put-away house restored and multiplied = the two-house regathering, Lo-Ammi -> Ammi; NOT a replacement church)
--   2. isaiah-54-thy-seed-shall-inherit-the-nations — NT (Romans 4) [free]
--      (★ enlarge the tent; the seed the heir of the world by the righteousness of faith — the promise-line spreading out)
--   3. isaiah-54-thy-maker-is-thine-husband — NT (Ephesians 5) + Tanakh (Hosea 2) [free]
--      (★★ Maker/Husband/Redeemer = the Formed Son, the redeemer-husband; the marriage of the forsaken wife restored)
--   4. isaiah-54-the-covenant-of-my-peace-shall-not-be-removed — NT (Romans 11) + Tanakh (Genesis 9, Ezekiel 37) [free]
--      (★★ the Noahic oath pattern + the everlasting covenant of peace; the small-moment forsaking, the everlasting gathering; not cast off)
--   5. isaiah-54-thy-foundations-with-sapphires — NT (Revelation 21) [free]
--      (★★ the afflicted city laid with sapphires and pleasant stones = the New Jerusalem of precious stones)
--   6. isaiah-54-all-thy-children-shall-be-taught-of-yahuah — NT (John 6) + Tanakh (Jeremiah 31) [free]
--      (★★ taught of Yahuah, quoted verbatim by Yahusha = the Torah written on the heart, they shall all know me)
--   7. isaiah-54-no-weapon-formed-against-thee-shall-prosper — NT (Romans 8, 1 John 2) [free]
--      (★★ the heritage of the servants; vindication, no charge against the elect; righteousness-of-me that WALKS in the commandments)
--
-- Framing notes:
--   ★★★ SING, O BARREN (THREAD 1): *Sing, O barren, thou that didst not bear... for more are the
--      children of the desolate than the children of the married wife, saith Yahuah* (54:1). Paul
--      quotes this WORD FOR WORD — *For it is written, Rejoice, thou barren that bearest not... for
--      the desolate hath many more children than she which hath an husband* (Galatians 4:27) —
--      applying it to *Jerusalem which is above... the mother of us all* (4:26), the children of
--      promise (4:28). Frame it carefully: the barren is the divorced, scattered house — Hosea's
--      *Lo-Ruhamah* and *Lo-Ammi* — restored: *I will say to them which were not my people, Thou
--      art my people* (Hosea 2:23), *Ammi... Ru-hamah* (Hosea 2:1). The children multiplied are
--      the two-house regathering (both olive branches Yashar'el, Romans 11), NEVER a replacement
--      church grafted in by confession.
--   ★ THY SEED SHALL INHERIT (THREAD 2): *Enlarge the place of thy tent... For thou shalt break
--      forth on the right hand and on the left; and thy seed shall inherit the Gentiles* (54:2-3).
--      The spreading-out of the regathered people, the seed inheriting — *the promise, that he
--      should be the heir of the world, was not to Abraham, or to his seed, through the law, but
--      through the righteousness of faith* (Romans 4:13); the promise *sure to all the seed*
--      (4:16). The flesh-credential is excluded, not the covenant — the heir inherits by the
--      faith of Abraham (Genesis 15:6), the same seed-of-promise line.
--   ★★ THY MAKER IS THINE HUSBAND (THREAD 3): *For thy Maker is thine husband; Yahuah Tseva'ot
--      (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar'el (Israel)* (54:5);
--      *a woman forsaken and grieved in spirit, and a wife of youth, when thou wast refused* (54:6).
--      The Maker/Husband/Redeemer is the Formed Son, the redeemer-husband of his people. Hosea
--      sings the same restored marriage: *I will betroth thee unto me for ever; yea, I will betroth
--      thee unto me in righteousness... and thou shalt know Yahuah* (Hosea 2:19-20), *thou shalt
--      call me Ishi* (2:16). And Paul names the mystery: *Husbands, love your wives, even as Messiah
--      also loved the church, and gave himself for it* (Ephesians 5:25), *they two shall be one
--      flesh... I speak concerning Messiah* (5:31-32) — the bride is Yashar'el restored.
--   ★★ THE COVENANT OF MY PEACE (THREAD 4): *For a small moment have I forsaken thee; but with great
--      mercies will I gather thee* (54:7) — exile then regathering of the two houses. The oath is
--      sealed by the Noahic pattern: *this is as the waters of Noah unto me... so have I sworn that
--      I would not be wroth with thee* (54:9), echoing *neither shall all flesh be cut off any more
--      by the waters of a flood* (Genesis 9:11). And the covenant cannot be broken: *the mountains
--      shall depart... but my kindness shall not depart from thee, neither shall the covenant of my
--      peace be removed* (54:10) — the same everlasting covenant of peace over the regathered sticks:
--      *I will make a covenant of peace with them; it shall be an everlasting covenant* (Ezekiel
--      37:26). Paul seals it: *the gifts and calling of Elohim (God) are without repentance* (Romans
--      11:29); *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The
--      small-moment wrath, the everlasting mercy.
--   ★★ THY FOUNDATIONS WITH SAPPHIRES (THREAD 5): *O thou afflicted, tossed with tempest, and not
--      comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with
--      sapphires... all thy borders of pleasant stones* (54:11-12). The restored, jeweled city is
--      the New Jerusalem John sees: *the foundations of the wall of the city were garnished with all
--      manner of precious stones. The first foundation was jasper; the second, sapphire* (Revelation
--      21:19) — *the holy city, new Jerusalem... prepared as a bride adorned for her husband* (21:2),
--      the same bride-city of the Husband-Redeemer of THREAD 3.
--   ★★ TAUGHT OF YAHUAH (THREAD 6): *And all thy children shall be taught of Yahuah (LORD); and great
--      shall be the peace of thy children* (54:13). Yahusha quotes it verbatim: *It is written in the
--      prophets, And they shall be all taught of Elohim (God)* (John 6:45). This is the Torah written
--      on the heart of the new covenant: *I will put my law in their inward parts, and write it in
--      their hearts* (Jeremiah 31:33), *they shall all know me, from the least of them unto the
--      greatest* (31:34) — the Torah not replaced but interiorized; taught of Yahuah, the commandment
--      written within.
--   ★★ NO WEAPON FORMED (THREAD 7): *No weapon that is formed against thee shall prosper; and every
--      tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of
--      the servants of Yahuah (LORD), and their righteousness is of me* (54:17). Note "servants"
--      plural here flows from the singular Servant of ch53 — those justified by the Servant become
--      the servants. The vindication: *Who shall lay any thing to the charge of Elohim's (God's)
--      elect? It is Elohim (God) that justifieth. Who is he that condemneth?* (Romans 8:33-34). The
--      *righteousness... of me* is covenant/imputed righteousness that PRODUCES obedience, not
--      flesh-merit — kept under the filter: *hereby we do know that we know him, if we keep his
--      commandments* (1 John 2:3); *He that saith, I know him, and keepeth not his commandments, is
--      a liar* (2:4).
--   VERSES WITH NO SEPARATE ADD: v.15-16 (the gatherers who fall, the smith and the waster — the
--      preface to the no-weapon promise of v.17, bound into THREAD 7), v.14 (in righteousness shalt
--      thou be established — the opening of the heritage-of-servants block, woven into THREAD 7).
--      All recorded, none silently skipped. Extras: weighed on the Noahic oath (Jubilees 6) and the
--      barren/restored-wife motif; no clean single-verse extras witness warranted — held in prose.

CREATE TEMP VIEW _s303_isa54_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Sing, O barren — the desolate hath many children (the restored two-house wife)
    ('canon','isaiah',54,1,'canon','galatians',4,27,'free',
      E'*For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband* (Galatians 4:27). Paul quotes Isaiah 54:1 word for word — *Sing, O barren, thou that didst not bear... for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD)*. The barren, put-away house is the one made to sing; her children multiplied beyond the married wife is the regathering of the scattered, divorced house, not a new people.'),
    ('canon','isaiah',54,1,'canon','galatians',4,26,'free',
      E'*But Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26). The barren who *more are the children of the desolate* (Isaiah 54:1) is the free Jerusalem above — *the mother of us all* — the covenant promise-line whose children are multiplied. The desolate wife is not cast off; she is the mother of the regathered people of promise.'),
    ('canon','isaiah',54,1,'canon','galatians',4,28,'free',
      E'*Now we, brethren, as Isaac was, are the children of promise* (Galatians 4:28). The children of the barren who *didst not bear* (Isaiah 54:1) are *the children of promise* — born not after the flesh alone but by the covenant word, as Isaac was. The multiplied children of the desolate are the seed-of-promise line gathered home.'),
    ('canon','isaiah',54,1,'canon','hosea',2,23,'free',
      E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The barren made to sing (Isaiah 54:1) is the divorced northern house — *Lo-Ruhamah*, *Lo-Ammi* — restored: *them which were not my people, Thou art my people*. The desolate wife with many children is the put-away house brought home and made Ammi again.'),
    ('canon','isaiah',54,1,'canon','hosea',2,1,'free',
      E'*Say ye unto your brethren, Ammi; and to your sisters, Ru-hamah* (Hosea 2:1). The reproach lifted from the barren — *thou shalt forget the shame of thy youth* (Isaiah 54:1,4) — is the very turning of Lo-Ammi to *Ammi* (my people) and Lo-Ruhamah to *Ru-hamah* (having obtained mercy). The desolate wife is the scattered house renamed and restored, the two-house regathering.'),

    -- THREAD 2 (★): Thy seed shall inherit the nations (enlarge the tent; the heir of the world)
    ('canon','isaiah',54,3,'canon','romans',4,13,'free',
      E'*For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). The promise *thy seed shall inherit the Gentiles, and make the desolate cities to be inhabited* (Isaiah 54:3) is the seed made *heir of the world* — the promise-line spreading out *on the right hand and on the left* (54:3) to inherit, by the righteousness of faith, not by flesh-credential.'),
    ('canon','isaiah',54,3,'canon','romans',4,16,'free',
      E'*Therefore it is of faith, that it might be by grace; to the end the promise might be sure to all the seed... who is the father of us all* (Romans 4:16). The seed that *shall inherit the Gentiles* (Isaiah 54:3), breaking forth to enlarge the tent, is *all the seed* to whom the promise is *sure* — Abraham *the father of us all*. The enlarged habitation (54:2) is the multiplied seed of promise inheriting the nations.'),

    -- THREAD 3 (★★): Thy Maker is thine husband (the Formed Son, the redeemer-husband; marriage restored)
    ('canon','isaiah',54,5,'canon','ephesians',5,25,'free',
      E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) — the Maker/Husband/Redeemer is the Formed Son, the redeemer-husband who *gave himself* for his bride. The forsaken wife is loved and restored by her own Maker.'),
    ('canon','isaiah',54,5,'canon','ephesians',5,31,'free',
      E'*For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh. This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:31-32). *Thy Maker is thine husband... and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) is the very marriage the mystery names — Redeemer and bride made one. The restored wife of Isaiah 54 is Yashar''el reunited to her Husband-Maker.'),
    ('canon','isaiah',54,5,'canon','hosea',2,19,'free',
      E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The forsaken *wife of youth* whose *Maker is thine husband* (Isaiah 54:5-6) is the bride betrothed *for ever* — *in righteousness... and in mercies*. The Redeemer the Holy One of Yashar''el is the everlasting Husband betrothing his put-away wife back to himself.'),
    ('canon','isaiah',54,6,'canon','hosea',2,16,'free',
      E'*And it shall come to pass at that day, saith Yahuah (LORD), that thou shalt call me Ishi; and shalt call me no more Baali* (Hosea 2:16). *Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit, and a wife of youth, when thou wast refused* (Isaiah 54:6) — and the day of restoration is when she calls him *Ishi* (my husband). The grieved, refused wife is recalled to the marriage; her Maker is her Husband again.'),

    -- THREAD 4 (★★): The covenant of my peace shall not be removed (Noahic oath + everlasting covenant)
    ('canon','isaiah',54,9,'canon','genesis',9,11,'free',
      E'*And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth* (Genesis 9:11). *For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee* (Isaiah 54:9). The oath over the regathered wife is patterned on the Noahic oath — as surely as the flood will not return, so surely the wrath will not return; the gathering is sworn and unbreakable.'),
    ('canon','isaiah',54,10,'canon','ezekiel',37,26,'free',
      E'*Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore* (Ezekiel 37:26). *My kindness shall not depart from thee, neither shall the covenant of my peace be removed* (Isaiah 54:10) is the same everlasting *covenant of peace* — set over the two sticks made one (Ezekiel 37:19), the regathered houses planted and multiplied for ever. The mountains may depart; this covenant cannot.'),
    ('canon','isaiah',54,8,'canon','romans',11,29,'free',
      E'*For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). *In a little wrath I hid my face from thee for a moment; but with everlasting kindness will I have mercy on thee, saith Yahuah (LORD) thy Redeemer* (Isaiah 54:8) — the little-wrath is a moment, the kindness is everlasting, because *the gifts and calling... are without repentance*. The forsaking does not undo the calling; the Redeemer gathers with everlasting mercy.'),
    ('canon','isaiah',54,7,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1). *For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7) — the forsaking is a *small moment*, never a casting-off. Paul confirms the very logic of Isaiah 54: the people are not cast away; the small-moment forsaking is answered by the great-mercies gathering.'),

    -- THREAD 5 (★★): Thy foundations with sapphires (the jeweled New Jerusalem)
    ('canon','isaiah',54,11,'canon','revelation',21,19,'free',
      E'*And the foundations of the wall of the city were garnished with all manner of precious stones. The first foundation was jasper; the second, sapphire; the third, a chalcedony; the fourth, an emerald* (Revelation 21:19). *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires* (Isaiah 54:11) — the afflicted city''s foundations laid with sapphires are the New Jerusalem''s jeweled foundations, *sapphire* among them. The comfortless city is rebuilt in precious stone.'),
    ('canon','isaiah',54,12,'canon','revelation',21,18,'free',
      E'*And the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass* (Revelation 21:18). *And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones* (Isaiah 54:12) — the gates and borders of pleasant stones are the gem-built city John sees, wall of jasper and gold, *the holy city, new Jerusalem... prepared as a bride adorned for her husband* (Revelation 21:2). The jeweled wife-city is the bride of the Husband-Redeemer.'),

    -- THREAD 6 (★★): All thy children shall be taught of Yahuah (quoted by Yahusha; Torah on the heart)
    ('canon','isaiah',54,13,'canon','john',6,45,'free',
      E'*It is written in the prophets, And they shall be all taught of Elohim (God). Every man therefore that hath heard, and hath learned of the Father, cometh unto me* (John 6:45). Yahusha quotes Isaiah 54:13 verbatim — *And all thy children shall be taught of Yahuah (LORD); and great shall be the peace of thy children*. The children taught of Yahuah are those drawn by the Father who *learned of the Father*; the prophet''s word is fulfilled in those taught within.'),
    ('canon','isaiah',54,13,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel)... I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The children *taught of Yahuah (LORD)* (Isaiah 54:13) are taught by the Torah written within — the new covenant is the law *in their inward parts*, not the law replaced. To be taught of Yahuah is to have his commandment written on the heart.'),
    ('canon','isaiah',54,13,'canon','jeremiah',31,34,'free',
      E'*And they shall teach no more every man his neighbour... saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD)* (Jeremiah 31:34). *All thy children shall be taught of Yahuah (LORD)* (Isaiah 54:13) is the very promise that *they shall all know me* — every child of the restored wife taught directly, the knowledge of Yahuah written within from least to greatest.'),

    -- THREAD 7 (★★): No weapon formed against thee shall prosper (the heritage of the servants; vindication)
    ('canon','isaiah',54,17,'canon','romans',8,33,'free',
      E'*Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth* (Romans 8:33). *No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn* (Isaiah 54:17) — no accusation stands, for *it is Elohim (God) that justifieth* the elect. The tongue that rises in judgment is condemned; the charge against the chosen cannot prosper.'),
    ('canon','isaiah',54,17,'canon','romans',8,34,'free',
      E'*Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us* (Romans 8:34). *Every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD)* (Isaiah 54:17) — none can condemn the servants, for the risen Messiah *maketh intercession*. The heritage of vindication is sure; the Servant of ch53 makes the servants uncondemned.'),
    ('canon','isaiah',54,17,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). *Their righteousness is of me, saith Yahuah (LORD)* (Isaiah 54:17) — the righteousness given to the servants is not flesh-merit but covenant righteousness, and it WALKS: *we do know that we know him, if we keep his commandments*. The righteousness that is *of me* produces obedience; it is known by the keeping.'),
    ('canon','isaiah',54,17,'canon','1-john',2,4,'free',
      E'*He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). The *righteousness... of me* of the servants (Isaiah 54:17) is no license to lawlessness — *he that saith, I know him, and keepeth not his commandments, is a liar*. The heritage of the servants is a righteousness given AND kept; the filter against the antinomian reading of the gift.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa54_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa54_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-54-sing-o-barren-the-desolate-hath-many-children',
       E'Sing, O barren — the desolate hath many children, the put-away wife restored',
       E'The song that follows the suffering Servant of chapter 53 begins with a command to the barren: *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD)* (Isaiah 54:1). Paul quotes it WORD FOR WORD and names the mother: *For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband* (Galatians 4:27) — *Jerusalem which is above is free, which is the mother of us all* (4:26); *Now we, brethren, as Isaac was, are the children of promise* (4:28). Read it through the prophets who first sang it: the barren is the divorced, scattered northern house — Hosea''s *Lo-Ruhamah* and *Lo-Ammi* — restored: *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23); *Say ye unto your brethren, Ammi; and to your sisters, Ru-hamah* (Hosea 2:1). The desolate wife with more children than the married is the put-away house brought home and made Ammi (my people) again — the two-house regathering, the children of promise multiplied. This is restoration, NOT replacement: not a new people grafted in by confession, but the very wife who *didst not bear* made to sing, her children beyond number.',
       sv.verse_id, ev.verse_id, 'free', 27325
  FROM _s303_isa54_lookup sv, _s303_isa54_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=54 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-54-thy-seed-shall-inherit-the-nations',
       E'Enlarge the place of thy tent — thy seed shall inherit, the heir of the world',
       E'The restored wife is told to make room, for her children will overflow: *Enlarge the place of thy tent, and let them stretch forth the curtains of thine habitations: spare not, lengthen thy cords, and strengthen thy stakes; For thou shalt break forth on the right hand and on the left; and thy seed shall inherit the Gentiles, and make the desolate cities to be inhabited* (Isaiah 54:2-3). The seed that inherits is the seed of promise made heir of the world: *For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). It is *of faith, that it might be by grace; to the end the promise might be sure to all the seed... who is the father of us all* (Romans 4:16). The flesh-credential is excluded — the inheritance comes through the righteousness of faith, the same faith Abraham had (Genesis 15:6) — but the seed is no less the covenant seed, the enlarged tent of the regathered people spreading out *on the right hand and on the left* to inherit the nations and rebuild the desolate cities.',
       sv.verse_id, ev.verse_id, 'free', 27328
  FROM _s303_isa54_lookup sv, _s303_isa54_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=54 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-54-thy-maker-is-thine-husband',
       E'Thy Maker is thine husband — the Redeemer-Husband, the marriage restored',
       E'The shame of the forsaken wife is lifted by the One who made her: *Fear not... for thou shalt forget the shame of thy youth, and shalt not remember the reproach of thy widowhood any more. For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:4-5); *Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit, and a wife of youth, when thou wast refused* (54:6). The Maker, the Husband, the Redeemer, the Holy One of Yashar''el — this is the Formed Son, the redeemer-husband of his people, the visible Glory who appeared and is Yahuah and has a Father. Hosea sings the same restored marriage: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19); *thou shalt call me Ishi* (my husband) (2:16). And Paul names the mystery outright: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25); *they two shall be one flesh. This is a great mystery: but I speak concerning Messiah (Christ) and the church* (5:31-32). The refused, grieving wife is recalled to the marriage; her own Maker is her Husband, the bride is Yashar''el restored.',
       sv.verse_id, ev.verse_id, 'free', 27331
  FROM _s303_isa54_lookup sv, _s303_isa54_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=54 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-54-the-covenant-of-my-peace-shall-not-be-removed',
       E'The covenant of my peace shall not be removed — the Noahic oath, the everlasting gathering',
       E'The forsaking is brief; the mercy is everlasting: *For a small moment have I forsaken thee; but with great mercies will I gather thee. In a little wrath I hid my face from thee for a moment; but with everlasting kindness will I have mercy on thee, saith Yahuah (LORD) thy Redeemer* (Isaiah 54:7-8). The exile is a *small moment*; the regathering of the two houses is *with great mercies*. And the oath is sealed by the Noahic pattern: *For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee* (54:9) — echoing *neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth* (Genesis 9:11). As surely as the flood will not return, so surely the wrath will not return. And the covenant itself cannot be broken: *For the mountains shall depart, and the hills be removed; but my kindness shall not depart from thee, neither shall the covenant of my peace be removed, saith Yahuah (LORD) that hath mercy on thee* (54:10) — the same everlasting *covenant of peace* set over the two sticks made one: *I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them* (Ezekiel 37:26). Paul seals the whole logic: *the gifts and calling of Elohim (God) are without repentance* (Romans 11:29); *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The little wrath passes; the everlasting kindness gathers; the covenant of peace stands when the mountains fall.',
       sv.verse_id, ev.verse_id, 'free', 27334
  FROM _s303_isa54_lookup sv, _s303_isa54_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=54 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-54-thy-foundations-with-sapphires',
       E'I will lay thy foundations with sapphires — the jeweled city, the New Jerusalem',
       E'The afflicted, comfortless city is promised a rebuilding in precious stone: *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires. And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones* (Isaiah 54:11-12). This is the jeweled city John sees descending: *And the foundations of the wall of the city were garnished with all manner of precious stones. The first foundation was jasper; the second, sapphire; the third, a chalcedony; the fourth, an emerald* (Revelation 21:19) — *the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass* (21:18). The very *sapphire* foundations of Isaiah 54:11 stand in the New Jerusalem''s wall; the gates of carbuncle and borders of pleasant stones are the gem-built city *prepared as a bride adorned for her husband* (Revelation 21:2). The restored wife of this chapter and the bride-city of the consummation are one — the comfortless city rebuilt in fair colours, jewel upon jewel, the dwelling of the Husband-Redeemer with his people.',
       sv.verse_id, ev.verse_id, 'free', 27337
  FROM _s303_isa54_lookup sv, _s303_isa54_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=54 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-54-all-thy-children-shall-be-taught-of-yahuah',
       E'All thy children shall be taught of Yahuah — the Torah written on the heart',
       E'The children of the restored wife are taught directly by Yahuah himself: *And all thy children shall be taught of Yahuah (LORD); and great shall be the peace of thy children* (Isaiah 54:13). Yahusha quotes this verse verbatim: *It is written in the prophets, And they shall be all taught of Elohim (God). Every man therefore that hath heard, and hath learned of the Father, cometh unto me* (John 6:45) — the children taught of Yahuah are those drawn by the Father, who *learned of the Father*. And this teaching is the Torah written within, the heart of the new covenant: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33); *they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD)* (Jeremiah 31:34). To be *taught of Yahuah* is not to be freed from the commandment but to have it written on the heart — the law not replaced but interiorized, every child of the restored house knowing Yahuah directly, from least to greatest, and *great shall be the peace of thy children*.',
       sv.verse_id, ev.verse_id, 'free', 27340
  FROM _s303_isa54_lookup sv, _s303_isa54_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=54 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-54-no-weapon-formed-against-thee-shall-prosper',
       E'No weapon formed against thee shall prosper — the heritage of the servants, vindicated',
       E'The chapter closes with the vindication of the restored people: *In righteousness shalt thou be established: thou shalt be far from oppression... No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD), and their righteousness is of me, saith Yahuah (LORD)* (Isaiah 54:14,17). Note that the servants here are PLURAL — flowing from the singular Servant of chapter 53: those justified by the Servant become the servants, and inherit his vindication. Paul writes the same heritage: *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth. Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again... who also maketh intercession for us* (Romans 8:33-34) — no weapon, no accusing tongue can prosper, for it is Elohim that justifies and the risen Messiah that intercedes. And the *righteousness... of me* is the key: it is covenant righteousness given, not flesh-merit earned — but a righteousness that WALKS. The filter holds: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3); *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). The heritage of the servants is a righteousness given and kept — vindication for the obedient covenant people, never license for the lawless.',
       sv.verse_id, ev.verse_id, 'free', 27343
  FROM _s303_isa54_lookup sv, _s303_isa54_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=54 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the desolate hath many more children than she which hath an husband* (Galatians 4:27) — Paul quotes Isaiah 54:1 word for word; the barren put-away house made to sing.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=1
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-sing-o-barren-the-desolate-hath-many-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26) — the barren/desolate (Isaiah 54:1) is the free Jerusalem, mother of the people of promise.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=1
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-sing-o-barren-the-desolate-hath-many-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*as Isaac was, are the children of promise* (Galatians 4:28) — the children of the barren who *didst not bear* (Isaiah 54:1) are the seed of promise, not flesh alone.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=1
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-sing-o-barren-the-desolate-hath-many-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will say to them which were not my people, Thou art my people* (Hosea 2:23) — the barren restored (Isaiah 54:1) is Lo-Ammi made Ammi, the divorced northern house brought home.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=1
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-sing-o-barren-the-desolate-hath-many-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Ammi... Ru-hamah* (Hosea 2:1) — the shame forgotten (Isaiah 54:1,4) is Lo-Ammi to Ammi (my people), Lo-Ruhamah to Ru-hamah (mercy obtained); the renamed restored house.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=1
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-sing-o-barren-the-desolate-hath-many-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the promise, that he should be the heir of the world... through the righteousness of faith* (Romans 4:13) — *thy seed shall inherit the Gentiles* (Isaiah 54:3) is the seed made heir of the world.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=3
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-seed-shall-inherit-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the promise might be sure to all the seed... the father of us all* (Romans 4:16) — the enlarged tent and inheriting seed (Isaiah 54:2-3) is the promise sure to all the seed of Abraham.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=3
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-seed-shall-inherit-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — *thy Maker is thine husband... thy Redeemer* (Isaiah 54:5) is the redeemer-husband who gave himself.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=5
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-maker-is-thine-husband'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they two shall be one flesh... I speak concerning Messiah (Christ) and the church* (Ephesians 5:31-32) — the Maker-Husband and bride (Isaiah 54:5) made one; the mystery of Yashar''el restored.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=5
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-maker-is-thine-husband'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will betroth thee unto me for ever... in righteousness, and in judgment, and in lovingkindness* (Hosea 2:19) — the forsaken wife whose Maker is her Husband (Isaiah 54:5) betrothed for ever.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=5
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-maker-is-thine-husband'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thou shalt call me Ishi* (my husband) (Hosea 2:16) — the refused *wife of youth* (Isaiah 54:6) recalled to the marriage, calling her Maker Husband again.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=6
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-maker-is-thine-husband'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *neither shall all flesh be cut off any more by the waters of a flood* (Genesis 9:11) — *as the waters of Noah unto me... so have I sworn* (Isaiah 54:9); the Noahic oath patterns the unbreakable gathering.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=9
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-the-covenant-of-my-peace-shall-not-be-removed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will make a covenant of peace with them; it shall be an everlasting covenant* (Ezekiel 37:26) — the *covenant of my peace* that shall not be removed (Isaiah 54:10) over the two sticks made one.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=10
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-the-covenant-of-my-peace-shall-not-be-removed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the gifts and calling of Elohim (God) are without repentance* (Romans 11:29) — the little-wrath moment, the everlasting kindness (Isaiah 54:8); the calling not undone by the forsaking.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=8
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-the-covenant-of-my-peace-shall-not-be-removed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — *a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7); forsaking is a moment, never a casting-off.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=7
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-the-covenant-of-my-peace-shall-not-be-removed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the foundations of the wall of the city were garnished with all manner of precious stones... the second, sapphire* (Revelation 21:19) — *lay thy foundations with sapphires* (Isaiah 54:11) in the New Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=11
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-foundations-with-sapphires'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the building of the wall of it was of jasper: and the city was pure gold* (Revelation 21:18) — *thy gates of carbuncles, and all thy borders of pleasant stones* (Isaiah 54:12); the gem-built bride-city.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=12
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-thy-foundations-with-sapphires'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *It is written in the prophets, And they shall be all taught of Elohim (God)* (John 6:45) — Yahusha quotes Isaiah 54:13 verbatim; the children taught of Yahuah are drawn by the Father.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=13
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-all-thy-children-shall-be-taught-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — *taught of Yahuah* (Isaiah 54:13) is the Torah written within, not the law replaced.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=13
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-all-thy-children-shall-be-taught-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *they shall all know me, from the least of them unto the greatest* (Jeremiah 31:34) — *all thy children shall be taught of Yahuah* (Isaiah 54:13); every child knowing Yahuah directly.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=13
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-all-thy-children-shall-be-taught-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth* (Romans 8:33) — *no weapon... shall prosper... every tongue... thou shalt condemn* (Isaiah 54:17); no accusation stands.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=17
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-no-weapon-formed-against-thee-shall-prosper'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Who is he that condemneth? It is Messiah (Christ) that died... who also maketh intercession for us* (Romans 8:34) — the *heritage of the servants* (Isaiah 54:17) is vindication; the risen Servant intercedes.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=17
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-no-weapon-formed-against-thee-shall-prosper'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *we do know that we know him, if we keep his commandments* (1 John 2:3) — *their righteousness is of me* (Isaiah 54:17); the gift-righteousness WALKS in the commandments.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=17
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-no-weapon-formed-against-thee-shall-prosper'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4) — the heritage''s righteousness (Isaiah 54:17) is given AND kept; the filter against the antinomian reading.'
  FROM cross_reference_threads t
  JOIN _s303_isa54_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=54 AND sv.verse_number=17
  JOIN _s303_isa54_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-54-no-weapon-formed-against-thee-shall-prosper'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_61.sql (Isaiah 61) -----
-- Chapter: Isaiah 61 — THE ANOINTED ONE'S MANIFESTO, the scripture Yahusha reads in the Nazareth
-- synagogue. *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath
-- anointed me to preach good tidings unto the meek... to proclaim liberty to the captives* (61:1) —
-- the Formed/Anointed Son, Spirit-anointed BY the Father (Christology: Formed, not co-equal), opens
-- the scroll in Luke 4 and says *This day is this scripture fulfilled in your ears* (Luke 4:21). He
-- reads only as far as *the acceptable year of Yahuah* and STOPS mid-sentence BEFORE *the day of
-- vengeance of our Elohim* (61:2) — mercy proclaimed now, vengeance reserved. The liberty to captives
-- and opening of the prison is the Jubilee release (Leviticus 25:10) the Servant brings (Isaiah 49:9,
-- 42:7); the binding of the brokenhearted is the Builder of Jerusalem who gathers the outcasts and
-- heals the broken in heart (Psalm 147:2-3). Then beauty for ashes, the oil of joy, the garment of
-- praise, and *trees of righteousness, the planting of Yahuah* (61:3 -> Isaiah 60:21; Psalm 1:3;
-- Matthew 15:13). The restored build the old wastes and are *named the Priests of Yahuah* (61:4-6) —
-- the kingdom-of-priests, peculiar-people priesthood (Exodus 19:6; 1 Peter 2:9; Revelation 1:6), NOT
-- a replacement. For their shame, double; an everlasting covenant; *their seed shall be known among
-- the Gentiles* — the scattered house regathered and acknowledged among the nations (61:7-9; Isaiah
-- 65:23; Romans 11:1). The Anointed rejoices, *clothed... with the garments of salvation... the robe
-- of righteousness, as a bridegroom... and as a bride adorneth herself* (61:10) — the wedding garment
-- of the restored bride (Revelation 19:7-8; Zechariah 3:4; Hosea 2:23). And the chapter closes with
-- the harvest figure: *as the earth bringeth forth her bud... so Adonai Yahuah will cause
-- righteousness and praise to spring forth before all the nations* (61:11; Isaiah 45:8; Psalm 85:11).
-- Tag: isa61   Temp view: _s303_isa61_lookup
-- Sort band: base 27500, step 3 -> threads at 27500, 27503, 27506, 27509, 27512, 27515 (6 threads)
-- Source of EVERY row: 'canon','isaiah',61,v
--
-- Isaiah 61 coverage:
--   ★★★ v.1-2 (The Spirit of Adonai Yahuah is upon me; because Yahuah hath anointed me to preach...
--          to proclaim liberty to the captives... To proclaim the acceptable year of Yahuah, and the
--          day of vengeance of our Elohim)
--        NT:     ★★★ Luke 4:18 + 4:19 (Yahusha reads it in the synagogue) + 4:21 (This day is this
--                scripture fulfilled in your ears) — THREAD 1 (the self-stop before vengeance surfaced)
--        Extras: none warranted (the Servant/Jubilee weave is the prophets' own; no clean extras add)
--        Tanakh: ★★ Leviticus 25:10 (proclaim liberty... it shall be a jubile) + ★★ Isaiah 49:9 (to
--                the prisoners, Go forth) + ★ Isaiah 42:7 (to bring out the prisoners from the prison)
--                + ★ Psalm 147:3 (He healeth the broken in heart) + Psalm 147:2 (gathereth the
--                outcasts) — THREAD 1
--   ★ v.3 (to give unto them beauty for ashes, the oil of joy for mourning... that they might be
--          called trees of righteousness, the planting of Yahuah)
--        NT:     ★ Matthew 15:13 (Every plant, which my heavenly Father hath not planted, shall be
--                rooted up) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 60:21 (Thy people also shall be all righteous... the branch of my planting,
--                the work of my hands) + ★ Psalm 1:3 (like a tree planted by the rivers of water) — THREAD 2
--   ★★ v.4-6 (they shall build the old wastes... But ye shall be named the Priests of Yahuah: men
--          shall call you the Ministers of our Elohim)
--        NT:     ★★ 1 Peter 2:9 (a royal priesthood, an holy nation, a peculiar people) + ★★
--                Revelation 1:6 (hath made us kings and priests unto Elohim and his Father) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Exodus 19:6 (ye shall be unto me a kingdom of priests, and an holy nation) — THREAD 3
--   ★ v.7-9 (For your shame ye shall have double... I will make an everlasting covenant with them.
--          And their seed shall be known among the Gentiles)
--        NT:     ★ Romans 11:1 (Hath Elohim cast away his people? Elohim forbid) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 65:23 (they are the seed of the blessed of Yahuah, and their offspring
--                with them) — THREAD 4 (the seed acknowledged among the nations = scattered house regathered)
--   ★★ v.10 (he hath clothed me with the garments of salvation, he hath covered me with the robe of
--          righteousness, as a bridegroom... and as a bride adorneth herself with her jewels)
--        NT:     ★★ Revelation 19:7 (the marriage of the Lamb is come, and his wife hath made herself
--                ready) + ★★ Revelation 19:8 (arrayed in fine linen... the righteousness of saints) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Zechariah 3:4 (Take away the filthy garments... I will clothe thee with change of
--                raiment) + ★ Hosea 2:23 (the restored-bride house, Lo-Ammi made Ammi) — THREAD 5
--   v.11 (For as the earth bringeth forth her bud... so Adonai Yahuah will cause righteousness and
--          praise to spring forth before all the nations)
--        NT:     none warranted (the springing-forth figure is fulfilled in the Tanakh's own lateral weave)
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 45:8 (let the earth open, and let them bring forth salvation, and let
--                righteousness spring up together) + ★ Psalm 85:11 (Truth shall spring out of the
--                earth; and righteousness shall look down from heaven) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach — NT (Luke 4) + Tanakh (Leviticus 25, Isaiah 49, Isaiah 42, Psalm 147) [free]
--      (★★★ the Anointed Son, Spirit-anointed BY the Father; the Nazareth scroll; self-stop before vengeance; Jubilee liberty to captives)
--   2. isaiah-61-beauty-for-ashes-the-planting-of-yahuah — NT (Matthew 15) + Tanakh (Isaiah 60, Psalm 1) [free]
--      (★ beauty for ashes / oil of joy / trees of righteousness = the planting of Yahuah, the branch of his hand)
--   3. isaiah-61-ye-shall-be-named-the-priests-of-yahuah — NT (1 Peter 2, Revelation 1) + Tanakh (Exodus 19) [free]
--      (★★ the restored people a kingdom of priests, the peculiar-people priesthood — NOT replacement)
--   4. isaiah-61-their-seed-shall-be-known-among-the-nations — NT (Romans 11) + Tanakh (Isaiah 65) [free]
--      (★ double for shame, everlasting covenant; the seed acknowledged among the nations = scattered house regathered)
--   5. isaiah-61-the-garments-of-salvation-the-robe-of-righteousness — NT (Revelation 19) + Tanakh (Zechariah 3, Hosea 2) [free]
--      (★★ clothed as bridegroom and bride; robe of righteousness = the wedding garment of the restored bride Yashar'el)
--   6. isaiah-61-righteousness-and-praise-to-spring-forth — Tanakh (Isaiah 45, Psalm 85) [free]
--      (the harvest figure: righteousness springing out of the earth before all the nations)
--
-- Framing notes:
--   ★★★ THE SPIRIT OF YAHUAH IS UPON ME (THREAD 1): *The Spirit of Adonai Yahuah (the Lord GOD) is
--      upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath
--      sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of
--      the prison to them that are bound; To proclaim the acceptable year of Yahuah (LORD)* (61:1-2a).
--      This is the Anointed One — the Formed Son, Spirit-anointed BY the Father (the formless Source
--      anoints the expressed Word), NOT a co-equal person. Yahusha reads THIS scroll in the Nazareth
--      synagogue: *The Spirit of Yahuah (Lord) is upon me, because he hath anointed me to preach the
--      gospel to the poor... to set at liberty them that are bruised, To preach the acceptable year of
--      Yahuah (Lord)* (Luke 4:18-19) and declares *This day is this scripture fulfilled in your ears*
--      (Luke 4:21). CRITICAL: he stops mid-verse, reading *the acceptable year* but NOT *the day of
--      vengeance of our Elohim* (61:2) — mercy proclaimed at the first appearing, the vengeance
--      reserved for the day to come. The *liberty to the captives* and *opening of the prison* is the
--      Jubilee release: *proclaim liberty throughout all the land unto all the inhabitants thereof: it
--      shall be a jubile unto you* (Leviticus 25:10) — the same liberation the Servant brings: *That
--      thou mayest say to the prisoners, Go forth* (Isaiah 49:9); *To open the blind eyes, to bring
--      out the prisoners from the prison* (Isaiah 42:7). And the binding of the brokenhearted is the
--      work of the Builder of Jerusalem: *Yahuah (LORD) doth build up Jerusalem: he gathereth together
--      the outcasts of Yashar'el (Israel). He healeth the broken in heart, and bindeth up their wounds*
--      (Psalm 147:2-3) — the gathering of the scattered house woven into the healing.
--   ★ BEAUTY FOR ASHES (THREAD 2): *To appoint unto them that mourn in Zion, to give unto them beauty
--      for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that
--      they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be
--      glorified* (61:3). The mourners become *trees of righteousness, the planting of Yahuah* — the
--      same image Isaiah gives the restored people: *Thy people also shall be all righteous... the
--      branch of my planting, the work of my hands, that I may be glorified* (Isaiah 60:21), and the
--      Psalm's righteous one *like a tree planted by the rivers of water, that bringeth forth his
--      fruit in his season* (Psalm 1:3). Yahusha names the inverse — what the Father has NOT planted:
--      *Every plant, which my heavenly Father hath not planted, shall be rooted up* (Matthew 15:13).
--      Only the planting of Yahuah stands; the trees of righteousness are his own work, glorifying him.
--   ★★ THE PRIESTS OF YAHUAH (THREAD 3): the restored *shall build the old wastes... they shall repair
--      the waste cities* (61:4) and *ye shall be named the Priests of Yahuah (LORD): men shall call you
--      the Ministers of our Elohim (God)* (61:6). This is the kingdom-of-priests vocation given at
--      Sinai: *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6) — carried
--      forward unbroken: *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar
--      people* (1 Peter 2:9); *hath made us kings and priests unto Elohim (God) and his Father*
--      (Revelation 1:6). The peculiar-people priesthood is the SAME people restored, not a replacement
--      grafted in by confession (Romans 11:1-2 guard) — the covenant nation made priests to the nations.
--   ★ THEIR SEED KNOWN AMONG THE NATIONS (THREAD 4): *For your shame ye shall have double... in their
--      land they shall possess the double: everlasting joy shall be unto them* (61:7); *I will make an
--      everlasting covenant with them. And their seed shall be known among the Gentiles, and their
--      offspring among the people: all that see them shall acknowledge them, that they are the seed
--      which Yahuah (LORD) hath blessed* (61:8-9). The blessed seed acknowledged among the nations is
--      the scattered house regathered and recognized — the same vindicated seed: *they are the seed of
--      the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23). And the everlasting
--      covenant means the people are not cast off: *Hath Elohim (God) cast away his people? Elohim
--      (God) forbid* (Romans 11:1). Double for shame, everlasting covenant, the seed known among the
--      Gentiles — restoration, not replacement.
--   ★★ THE GARMENTS OF SALVATION (THREAD 5): *I will greatly rejoice in Yahuah (LORD)... for he hath
--      clothed me with the garments of salvation, he hath covered me with the robe of righteousness,
--      as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels*
--      (61:10). The wedding garment is the robe of righteousness given — the same change of raiment
--      that strips the filthy garments: *Take away the filthy garments from him... I will clothe thee
--      with change of raiment* (Zechariah 3:4). And it is the bride's array at the marriage of the
--      Lamb: *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation
--      19:7); *to her was granted that she should be arrayed in fine linen, clean and white: for the
--      fine linen is the righteousness of saints* (Revelation 19:8). The bride is Yashar'el restored —
--      the put-away house made Ammi again: *I will say to them which were not my people, Thou art my
--      people* (Hosea 2:23). The robe of righteousness is the wedding garment of the restored people.
--   RIGHTEOUSNESS TO SPRING FORTH (THREAD 6): *For as the earth bringeth forth her bud, and as the
--      garden causeth the things that are sown in it to spring forth; so Adonai Yahuah (the Lord GOD)
--      will cause righteousness and praise to spring forth before all the nations* (61:11). The harvest
--      figure of righteousness rising from the ground is Isaiah's own refrain: *Drop down, ye heavens,
--      from above... let the earth open, and let them bring forth salvation, and let righteousness
--      spring up together* (Isaiah 45:8); and the Psalm sings it: *Truth shall spring out of the earth;
--      and righteousness shall look down from heaven* (Psalm 85:11). The springing-forth before all the
--      nations is the same dawn of righteousness the prophets and Psalms await.
--   VERSES WITH NO SEPARATE ADD: v.2b (the day of vengeance — handled IN THREAD 1 as the line Yahusha
--      deliberately did NOT read, mercy now/vengeance reserved), v.4-5 (build the old wastes / strangers
--      feed your flocks — the preface to the Priests-of-Yahuah promise, bound into THREAD 3), v.7
--      (double for shame — opening of the everlasting-covenant block, woven into THREAD 4). All recorded;
--      no library silently skipped. Extras weighed on the anointing/Jubilee/restoration weave — no clean
--      single-verse extras witness warranted (the apparatus here is the prophets' own and the NT's
--      filling); held in prose, no extras add forced.

CREATE TEMP VIEW _s303_isa61_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): The Spirit of Yahuah is upon me — the Anointed One, the Nazareth scroll, Jubilee liberty
    ('canon','isaiah',61,1,'canon','luke',4,18,'free',
      E'*The Spirit of Yahuah (Lord) is upon me, because he hath anointed me to preach the gospel to the poor; he hath sent me to heal the brokenhearted, to preach deliverance to the captives, and recovering of sight to the blind, to set at liberty them that are bruised* (Luke 4:18). Yahusha reads Isaiah 61:1 from the scroll in the Nazareth synagogue — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me... to proclaim liberty to the captives, and the opening of the prison to them that are bound*. The Anointed One is the Formed Son, Spirit-anointed BY the Father; the manifesto of Isaiah 61 is his own.'),
    ('canon','isaiah',61,2,'canon','luke',4,19,'free',
      E'*To preach the acceptable year of Yahuah (Lord)* (Luke 4:19). Yahusha reads to exactly this point of Isaiah 61:2 — *To proclaim the acceptable year of Yahuah (LORD)* — and STOPS, deliberately not reading the next clause, *and the day of vengeance of our Elohim (God)*. The acceptable year (the Jubilee of release, the gospel of mercy) is proclaimed at his first appearing; the day of vengeance is reserved for the day to come. The stop mid-verse is the whole frame: mercy now, judgment held back.'),
    ('canon','isaiah',61,1,'canon','luke',4,21,'free',
      E'*And he began to say unto them, This day is this scripture fulfilled in your ears* (Luke 4:21). Having read *The Spirit of Yahuah... hath anointed me* (Isaiah 61:1) in the synagogue, Yahusha declares the prophecy fulfilled in himself — *this day*. The anointed Preacher of good tidings, the One who proclaims liberty to the captives, stands before them; Isaiah 61 is not a future stranger but the Formed Son present and fulfilling it.'),
    ('canon','isaiah',61,1,'canon','leviticus',25,10,'free',
      E'*And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family* (Leviticus 25:10). *To proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1) is the Jubilee release proclaimed — debts cancelled, the bound set free, every man returned to his inheritance. The Anointed brings the great Jubilee; *the acceptable year of Yahuah* (61:2) is the year of liberty itself.'),
    ('canon','isaiah',61,1,'canon','isaiah',49,9,'free',
      E'*That thou mayest say to the prisoners, Go forth; to them that are in darkness, Shew yourselves. They shall feed in the ways, and their pastures shall be in all high places* (Isaiah 49:9). The Servant given *for a covenant of the people* (Isaiah 49:8) says to the prisoners *Go forth* — the same release as *the opening of the prison to them that are bound* (Isaiah 61:1). The Anointed of chapter 61 and the prisoner-freeing Servant of chapter 49 are one and the same.'),
    ('canon','isaiah',61,1,'canon','isaiah',42,7,'free',
      E'*To open the blind eyes, to bring out the prisoners from the prison, and them that sit in darkness out of the prison house* (Isaiah 42:7). The Servant called *for a covenant of the people, for a light of the Gentiles* (Isaiah 42:6) brings the prisoners out of the prison house — the very work of *the opening of the prison to them that are bound* (Isaiah 61:1). Luke records Yahusha reading *recovering of sight to the blind* (Luke 4:18); the opened eyes and opened prison of chapter 42 are folded into the manifesto.'),
    ('canon','isaiah',61,1,'canon','psalms',147,3,'free',
      E'*He healeth the broken in heart, and bindeth up their wounds* (Psalm 147:3). *He hath sent me to bind up the brokenhearted* (Isaiah 61:1) is the very work the Psalm ascribes to Yahuah himself — the binding of the broken in heart. The Anointed does the healing of Yahuah; and it is bound to the gathering of the scattered: *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel)* (Psalm 147:2).'),

    -- THREAD 2 (★): Beauty for ashes — the planting of Yahuah, trees of righteousness
    ('canon','isaiah',61,3,'canon','isaiah',60,21,'free',
      E'*Thy people also shall be all righteous: they shall inherit the land for ever, the branch of my planting, the work of my hands, that I may be glorified* (Isaiah 60:21). The mourners made *trees of righteousness, the planting of Yahuah (LORD), that he might be glorified* (Isaiah 61:3) are the same people called *the branch of my planting, the work of my hands, that I may be glorified* — Yahuah''s own planting, all righteous, planted by his hand to his glory.'),
    ('canon','isaiah',61,3,'canon','psalms',1,3,'free',
      E'*And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper* (Psalm 1:3). The righteous of the Psalm — whose *delight is in the law of Yahuah* (Psalm 1:2) — is *like a tree planted by the rivers of water*, the same image as *trees of righteousness, the planting of Yahuah* (Isaiah 61:3). The planted tree that bears fruit is the Torah-delighting righteous one, rooted and flourishing.'),
    ('canon','isaiah',61,3,'canon','matthew',15,13,'free',
      E'*But he answered and said, Every plant, which my heavenly Father hath not planted, shall be rooted up* (Matthew 15:13). Yahusha names the inverse of *the planting of Yahuah (LORD)* (Isaiah 61:3): every plant the Father has NOT planted is rooted up. Only the trees of righteousness that are Yahuah''s own planting stand; what is not his planting — the traditions and the rooted-up — does not abide. The planting of Yahuah is the work of his hands that endures.'),

    -- THREAD 3 (★★): Ye shall be named the Priests of Yahuah — the kingdom of priests, peculiar people
    ('canon','isaiah',61,6,'canon','exodus',19,6,'free',
      E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). *But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* (Isaiah 61:6) is the Sinai vocation restored — the kingdom of priests, the holy nation, given to the children of Yashar''el and now reaffirmed over the regathered people. The priesthood of the whole covenant nation, never set aside.'),
    ('canon','isaiah',61,6,'canon','1-peter',2,9,'free',
      E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). *Ye shall be named the Priests of Yahuah (LORD)* (Isaiah 61:6) is the very priesthood Peter names — the royal priesthood, the holy nation, the peculiar people. This is the SAME covenant people restored, the kingdom-of-priests vocation carried forward, NOT a replacement grafted in by confession.'),
    ('canon','isaiah',61,6,'canon','revelation',1,6,'free',
      E'*And hath made us kings and priests unto Elohim (God) and his Father; to him be glory and dominion for ever and ever. Amen* (Revelation 1:6). *Ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* (Isaiah 61:6) is fulfilled in the redeemed *made... kings and priests unto Elohim (God) and his Father* — the priesthood promised over the restored people, ministering to the Most High for ever.'),

    -- THREAD 4 (★): Their seed shall be known among the nations — double for shame, everlasting covenant
    ('canon','isaiah',61,9,'canon','isaiah',65,23,'free',
      E'*They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23). *Their seed shall be known among the Gentiles, and their offspring among the people: all that see them shall acknowledge them, that they are the seed which Yahuah (LORD) hath blessed* (Isaiah 61:9) — the same blessed seed and offspring, acknowledged among the nations. The scattered house is regathered and recognized as the seed Yahuah hath blessed.'),
    ('canon','isaiah',61,8,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). *I will make an everlasting covenant with them* (Isaiah 61:8) — and an everlasting covenant means the people are never cast off. Paul confirms the logic: Elohim has not cast away his people; the everlasting covenant of Isaiah 61 stands, and the blessed seed (61:9) is acknowledged, not abandoned.'),

    -- THREAD 5 (★★): The garments of salvation — the robe of righteousness, the wedding garment
    ('canon','isaiah',61,10,'canon','revelation',19,7,'free',
      E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). *I will greatly rejoice in Yahuah (LORD)... as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10) is the joy of the wedding — the bridegroom and the bride both arrayed. The marriage of the Lamb is the consummation of the bride-imagery of Isaiah 61; the wife has made herself ready.'),
    ('canon','isaiah',61,10,'canon','revelation',19,8,'free',
      E'*And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). *He hath covered me with the robe of righteousness... as a bride adorneth herself with her jewels* (Isaiah 61:10) — the bride''s garment is the robe of righteousness GIVEN, *granted* her, the fine linen that *is the righteousness of saints*. The wedding garment is not self-woven but bestowed; the robe of righteousness clothes the restored bride.'),
    ('canon','isaiah',61,10,'canon','zechariah',3,4,'free',
      E'*Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment* (Zechariah 3:4). *He hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness* (Isaiah 61:10) is the same change of raiment — the filthy garments taken away, iniquity passed, the robe of righteousness put on. The clothing is Yahuah''s own act upon his people, the filthy stripped and the righteous robe given.'),
    ('canon','isaiah',61,10,'canon','hosea',2,23,'free',
      E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The bride adorned *as a bride adorneth herself with her jewels* (Isaiah 61:10) is the put-away house restored — *them which were not my people, Thou art my people*, Lo-Ammi made Ammi. The robe of righteousness and the wedding adornment clothe the once-divorced wife brought home.'),

    -- THREAD 6: Righteousness and praise to spring forth — the harvest figure
    ('canon','isaiah',61,11,'canon','isaiah',45,8,'free',
      E'*Drop down, ye heavens, from above, and let the skies pour down righteousness: let the earth open, and let them bring forth salvation, and let righteousness spring up together; I Yahuah (LORD) have created it* (Isaiah 45:8). *As the earth bringeth forth her bud... so Adonai Yahuah (the Lord GOD) will cause righteousness and praise to spring forth before all the nations* (Isaiah 61:11) is the same harvest figure — the earth opening, righteousness and salvation springing up by Yahuah''s own creating word. Righteousness rises from the ground like a seed sown.'),
    ('canon','isaiah',61,11,'canon','psalms',85,11,'free',
      E'*Truth shall spring out of the earth; and righteousness shall look down from heaven* (Psalm 85:11). *So Adonai Yahuah (the Lord GOD) will cause righteousness and praise to spring forth before all the nations* (Isaiah 61:11) sings the same figure the Psalm sings — truth springing out of the earth, righteousness from above, the dawning of righteousness before all the nations. The springing-forth of righteousness is the long-awaited harvest of Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa61_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa61_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach',
       E'The Spirit of Yahuah is upon me — the Anointed One, the Nazareth scroll, the Jubilee of liberty',
       E'The chapter opens with the manifesto of the Anointed One: *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound; To proclaim the acceptable year of Yahuah (LORD)* (Isaiah 61:1-2a). This is the Formed Son, Spirit-anointed BY the Father — the formless Source anointing the expressed Word — not a co-equal person but the One sent and anointed. Yahusha takes this very scroll in the Nazareth synagogue: *The Spirit of Yahuah (Lord) is upon me, because he hath anointed me to preach the gospel to the poor; he hath sent me to heal the brokenhearted, to preach deliverance to the captives... to set at liberty them that are bruised, To preach the acceptable year of Yahuah (Lord)* (Luke 4:18-19), and declares *This day is this scripture fulfilled in your ears* (Luke 4:21). Watch where he stops: he reads *the acceptable year of Yahuah* and goes no further — he does NOT read *and the day of vengeance of our Elohim (God)* (61:2). The acceptable year, the Jubilee of mercy, is proclaimed at his first appearing; the day of vengeance is held back for the day to come. And the *liberty to the captives* is the Jubilee release: *proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession* (Leviticus 25:10) — the bound set free, every man restored to his inheritance. The Servant brings exactly this: *That thou mayest say to the prisoners, Go forth* (Isaiah 49:9); *To open the blind eyes, to bring out the prisoners from the prison* (Isaiah 42:7). And the binding of the brokenhearted is the work of the Builder of Jerusalem: *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel). He healeth the broken in heart, and bindeth up their wounds* (Psalm 147:2-3) — the gathering of the scattered house woven into the healing. The Anointed preaches the great Jubilee of release; the year of mercy is now.',
       sv.verse_id, ev.verse_id, 'free', 27500
  FROM _s303_isa61_lookup sv, _s303_isa61_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=61 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-61-beauty-for-ashes-the-planting-of-yahuah',
       E'Beauty for ashes — the trees of righteousness, the planting of Yahuah',
       E'To the mourners of Zion the Anointed gives a great exchange: *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified* (Isaiah 61:3). The mourners become *trees of righteousness, the planting of Yahuah* — the same image Isaiah gives the restored people a chapter before: *Thy people also shall be all righteous: they shall inherit the land for ever, the branch of my planting, the work of my hands, that I may be glorified* (Isaiah 60:21). It is the Psalm''s righteous one, whose *delight is in the law of Yahuah*, made *like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither* (Psalm 1:3). And Yahusha names the inverse — what does NOT abide: *Every plant, which my heavenly Father hath not planted, shall be rooted up* (Matthew 15:13). Only the planting of Yahuah stands; the trees of righteousness are his own work, planted by his hand, glorifying him — beauty given for ashes, the garment of praise for the spirit of heaviness, a people rooted and flourishing because Yahuah planted them.',
       sv.verse_id, ev.verse_id, 'free', 27503
  FROM _s303_isa61_lookup sv, _s303_isa61_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=61 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-61-ye-shall-be-named-the-priests-of-yahuah',
       E'Ye shall be named the Priests of Yahuah — the kingdom of priests, the peculiar people',
       E'The restored people rebuild and are given a vocation: *And they shall build the old wastes, they shall raise up the former desolations, and they shall repair the waste cities, the desolations of many generations* (Isaiah 61:4); *But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* (Isaiah 61:6). This is the Sinai calling restored — the vocation given to the whole covenant nation: *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). It is carried forward unbroken into the apostolic word: *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9); and consummated in the redeemed: *And hath made us kings and priests unto Elohim (God) and his Father; to him be glory and dominion for ever and ever* (Revelation 1:6). This is the SAME covenant people restored to its priestly calling — the kingdom of priests of Sinai, the peculiar-people priesthood — NOT a new people replacing them, never grafted in by confession alone (Romans 11:1-2 stands guard). The restored Yashar''el ministers as the priests of Yahuah to the nations.',
       sv.verse_id, ev.verse_id, 'free', 27506
  FROM _s303_isa61_lookup sv, _s303_isa61_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=61 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-61-their-seed-shall-be-known-among-the-nations',
       E'Their seed shall be known among the nations — double for shame, the everlasting covenant',
       E'For the shame of exile the Anointed promises a double recompense and an unbreakable covenant: *For your shame ye shall have double; and for confusion they shall rejoice in their portion: therefore in their land they shall possess the double: everlasting joy shall be unto them* (Isaiah 61:7); *For I Yahuah (LORD) love judgment, I hate robbery for burnt offering; and I will direct their work in truth, and I will make an everlasting covenant with them. And their seed shall be known among the Gentiles, and their offspring among the people: all that see them shall acknowledge them, that they are the seed which Yahuah (LORD) hath blessed* (Isaiah 61:8-9). The blessed seed acknowledged among the nations is the scattered house regathered and recognized — the same vindicated seed Isaiah names: *they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23). And the everlasting covenant guarantees the people are never abandoned: *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1). Double for the shame, everlasting joy, an everlasting covenant, and the blessed seed known among the Gentiles — this is restoration of the covenant people, the offspring acknowledged among the nations, never their replacement.',
       sv.verse_id, ev.verse_id, 'free', 27509
  FROM _s303_isa61_lookup sv, _s303_isa61_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=61 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-61-the-garments-of-salvation-the-robe-of-righteousness',
       E'The garments of salvation — the robe of righteousness, the wedding garment of the bride',
       E'The Anointed rejoices in the clothing Yahuah gives: *I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10). The robe of righteousness is GIVEN — Yahuah''s own act upon his people, the same change of raiment that strips the filthy garments away: *Take away the filthy garments from him... Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment* (Zechariah 3:4). And it is the bride''s array at the marriage of the Lamb: *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7); *to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8) — the wedding garment not self-woven but *granted*, the righteousness bestowed. The bride who adorns herself is Yashar''el restored, the put-away house brought home: *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). Bridegroom and bride both arrayed; the robe of righteousness is the wedding garment of the once-divorced wife made Ammi again.',
       sv.verse_id, ev.verse_id, 'free', 27512
  FROM _s303_isa61_lookup sv, _s303_isa61_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=61 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-61-righteousness-and-praise-to-spring-forth',
       E'Righteousness and praise to spring forth — the harvest of righteousness before all nations',
       E'The chapter closes with a harvest figure: *For as the earth bringeth forth her bud, and as the garden causeth the things that are sown in it to spring forth; so Adonai Yahuah (the Lord GOD) will cause righteousness and praise to spring forth before all the nations* (Isaiah 61:11). As surely as a sown seed pushes up out of the ground, so surely Yahuah will make righteousness rise. It is Isaiah''s own refrain: *Drop down, ye heavens, from above, and let the skies pour down righteousness: let the earth open, and let them bring forth salvation, and let righteousness spring up together; I Yahuah (LORD) have created it* (Isaiah 45:8). And the Psalm sings the same: *Truth shall spring out of the earth; and righteousness shall look down from heaven* (Psalm 85:11). The springing-forth before all the nations is the long-awaited harvest — righteousness rising from the earth by Yahuah''s creating word, praise budding like a garden, the dawn of the acceptable year made visible to every nation.',
       sv.verse_id, ev.verse_id, 'free', 27515
  FROM _s303_isa61_lookup sv, _s303_isa61_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=61 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The Spirit of Yahuah (Lord) is upon me, because he hath anointed me... to preach deliverance to the captives* (Luke 4:18) — Yahusha reads Isaiah 61:1 from the Nazareth scroll; the Anointed Son.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=1
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *To preach the acceptable year of Yahuah (Lord)* (Luke 4:19) — Yahusha stops HERE, NOT reading *the day of vengeance* (Isaiah 61:2); mercy now, vengeance reserved.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=2
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *This day is this scripture fulfilled in your ears* (Luke 4:21) — Yahusha declares Isaiah 61:1 fulfilled in himself, the Anointed present.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=1
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *proclaim liberty throughout all the land... it shall be a jubile unto you* (Leviticus 25:10) — *liberty to the captives* (Isaiah 61:1) is the Jubilee release.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=1
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *say to the prisoners, Go forth* (Isaiah 49:9) — the Servant''s release matches *the opening of the prison to them that are bound* (Isaiah 61:1).'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=1
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *to bring out the prisoners from the prison, and them that sit in darkness* (Isaiah 42:7) — the Servant opens the prison-house, the work of Isaiah 61:1.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=1
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *He healeth the broken in heart, and bindeth up their wounds* (Psalm 147:3) — *bind up the brokenhearted* (Isaiah 61:1) is Yahuah''s own healing, joined to gathering the outcasts (147:2).'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=1
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-spirit-of-yahuah-is-upon-me-anointed-to-preach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the branch of my planting, the work of my hands, that I may be glorified* (Isaiah 60:21) — *trees of righteousness, the planting of Yahuah* (Isaiah 61:3) is the same planted people.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=3
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-beauty-for-ashes-the-planting-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *like a tree planted by the rivers of water, that bringeth forth his fruit* (Psalm 1:3) — the Torah-delighting righteous is the planted tree of Isaiah 61:3.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=3
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-beauty-for-ashes-the-planting-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Every plant, which my heavenly Father hath not planted, shall be rooted up* (Matthew 15:13) — only *the planting of Yahuah* (Isaiah 61:3) stands; the inverse named.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=3
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-beauty-for-ashes-the-planting-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6) — *named the Priests of Yahuah* (Isaiah 61:6) is the Sinai vocation restored.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=6
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-ye-shall-be-named-the-priests-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9) — the same priesthood of Isaiah 61:6; the covenant people restored, NOT replaced.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=6
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-ye-shall-be-named-the-priests-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6) — the priesthood of Isaiah 61:6 consummated in the redeemed.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=6
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-ye-shall-be-named-the-priests-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23) — *the seed which Yahuah hath blessed* (Isaiah 61:9), regathered and acknowledged.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=9
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-their-seed-shall-be-known-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the *everlasting covenant* (Isaiah 61:8) means the people are never cast off.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=8
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-their-seed-shall-be-known-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the bridegroom/bride joy of Isaiah 61:10 consummated.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=10
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-garments-of-salvation-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8) — the *robe of righteousness* (Isaiah 61:10) GRANTED, not self-woven.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=10
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-garments-of-salvation-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Take away the filthy garments... I will clothe thee with change of raiment* (Zechariah 3:4) — the same change of raiment as the *garments of salvation* (Isaiah 61:10).'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=10
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-garments-of-salvation-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *them which were not my people, Thou art my people* (Hosea 2:23) — the adorned bride (Isaiah 61:10) is the put-away house restored, Lo-Ammi made Ammi.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=10
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-the-garments-of-salvation-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *let the earth open, and let them bring forth salvation, and let righteousness spring up together* (Isaiah 45:8) — the same harvest figure as Isaiah 61:11.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=11
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-righteousness-and-praise-to-spring-forth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Truth shall spring out of the earth; and righteousness shall look down from heaven* (Psalm 85:11) — the springing-forth of righteousness sung in the Psalm, as in Isaiah 61:11.'
  FROM cross_reference_threads t
  JOIN _s303_isa61_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=61 AND sv.verse_number=11
  JOIN _s303_isa61_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=85 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-61-righteousness-and-praise-to-spring-forth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_56.sql (Isaiah 56) -----
-- Chapter: Isaiah 56 — THE COVENANT-FAITHFULNESS / HOUSE-OF-PRAYER chapter. It opens with the
-- Sabbath KEPT, not abolished: *Keep ye judgment, and do justice... Blessed is the man that doeth
-- this... that keepeth the sabbath from polluting it* (56:1-2; lateral Isa 58:13-14; rooted Exod
-- 20:8-11; the rest that remaineth Heb 4:9; filtered 1 John 2:3-4). The KEYSTONE is v.3-8: *the
-- son of the stranger, that hath joined himself to Yahuah* and *the eunuchs that keep my sabbaths...
-- and take hold of my covenant* are given *a place and a name better than of sons and of daughters*
-- — the scattered returning + those who JOIN by COVENANT-KEEPING (Sabbath kept, covenant held
-- fast), NOT false inclusion by confession-apart-from-the-covenant. The eunuch formerly shut out
-- (Deut 23:1) is brought in by taking hold of the covenant — and Acts 8:27-39 shows it literally
-- fulfilled in the Ethiopian eunuch reading THIS very prophet. The strangers made *fellowcitizens*
-- THROUGH the covenant (Eph 2:12-13,19), the wild-olive of Yashar'el grown wild in the nations come
-- home (Rom 11). v.7 *mine house shall be called an house of prayer for all people* — Yahusha
-- quotes it cleansing the temple (Matt 21:13; Mark 11:17 quotes the fuller *for all nations*). v.8
-- *Yahuah Elohim which gathereth the outcasts of Yashar'el... Yet will I gather others to him* = the
-- two-house ingathering (Ps 147:2; John 10:16 other sheep; John 11:52 gather-in-one the scattered;
-- Ezek 37:19,21 — Rom 11:1-2 guard, never replacement). v.9-12 the blind watchmen / greedy dogs /
-- shepherds that cannot understand = covenant-lawsuit against faithless leaders (Ezek 34:2,5 the
-- shepherds who fed themselves while the flock became meat to the beasts) — corrupt leadership
-- condemned, the people are victims, not enemies.
-- Tag: isa56   Temp view: _s303_isa56_lookup
-- Sort band: base 27375, step 3 -> threads at 27375, 27378, 27381, 27384, 27387, 27390 (6 threads)
-- Source of EVERY row: 'canon','isaiah',56,v
--
-- Isaiah 56 coverage:
--   ★ v.1-2 (Keep ye judgment, and do justice... Blessed is the man... that keepeth the sabbath
--          from polluting it)
--        NT:     ★ Hebrews 4:9 (There remaineth therefore a rest to the people of Elohim) — THREAD 1;
--                ★ 1 John 2:3-4 FILTER (we know him, if we keep his commandments) — THREAD 1
--        Extras: none warranted (the Sabbath weave is the Torah/prophets' own; no clean extras add)
--        Tanakh: ★★ Isaiah 58:13-14 (turn away thy foot from the sabbath... call the sabbath a
--                delight) + ★★ Exodus 20:8 (Remember the sabbath day, to keep it holy) — THREAD 1
--   ★★★ v.3-5 (Neither let the son of the stranger... say... Yahuah hath utterly separated me...
--          neither let the eunuch say, I am a dry tree... the eunuchs that keep my sabbaths... take
--          hold of my covenant... a place and a name better than of sons and of daughters)
--        NT:     ★★★ Acts 8:27 (a man of Ethiopia, an eunuch... had come to Jerusalem for to worship)
--                + Acts 8:28 (reading Esaias the prophet) + Acts 8:38 (he baptized him) — THREAD 2;
--                ★★ Ephesians 2:12 (aliens from the commonwealth of Yashar'el) + Eph 2:13 (made nigh
--                by the blood) + Eph 2:19 (no more strangers and foreigners, but fellowcitizens) — THREAD 2
--        Extras: none warranted (the covenant-inclusion weave is the prophet's own + NT; no clean extras add)
--        Tanakh: ★★ Deuteronomy 23:1 (He that is wounded in the stones... shall not enter into the
--                congregation of Yahuah) — the Torah-tension the covenant-faith resolves — THREAD 2
--   ★★ v.6-7 (the sons of the stranger that join themselves to Yahuah... keepeth the sabbath...
--          mine house shall be called an house of prayer for all people)
--        NT:     ★★★ Mark 11:17 (My house shall be called of all nations the house of prayer — fuller
--                form, Yahusha cleansing the temple) + ★★ Matthew 21:13 (My house shall be called the
--                house of prayer) — THREAD 3
--        Extras: none warranted
--        Tanakh: woven (the gathering of the nations into the covenant house flows into THREAD 4; the
--                Sabbath-keeping stranger is THREAD 1+2's covenant-keeper; not forced to a separate add)
--   ★★ v.8 (Adonai Yahuah which gathereth the outcasts of Yashar'el saith, Yet will I gather others
--          to him, beside those that are gathered unto him)
--        NT:     ★★ John 10:16 (other sheep I have... them also I must bring... one fold, one shepherd)
--                + ★★ John 11:52 (gather together in one the children of Elohim that were scattered) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Psalm 147:2 (Yahuah... gathereth together the outcasts of Yashar'el) + ★★ Ezekiel
--                37:19 (the stick of Joseph... and the stick of Yahudah... one stick) + Ezek 37:21
--                (gather them on every side) — THREAD 4
--   ★ v.3-8 KEYSTONE two-house/wild-olive guard (the stranger who takes hold of the covenant = the
--          wild olive of Yashar'el grown wild in the nations come home, NOT a new people by confession)
--        NT:     ★★ Romans 11:17 (a wild olive tree, wert graffed in... partakest of the root) +
--                Rom 11:1 (Hath Elohim cast away his people? Elohim forbid) — THREAD 5 (the guard thread)
--        Extras: none warranted
--        Tanakh: woven (Ezek 37 two sticks in THREAD 4 is the regathering root)
--   v.9-12 (All ye beasts of the field, come to devour... His watchmen are blind... greedy dogs...
--          shepherds that cannot understand)
--        NT:     none warranted (no clean NT add; the shepherd-lawsuit is the Tanakh's own)
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 34:5 (they were scattered... and became meat to all the beasts of the
--                field, when they were scattered) + ★★ Ezekiel 34:2 (Woe be to the shepherds... that
--                do feed themselves! should not the shepherds feed the flocks?) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. isaiah-56-blessed-is-the-man-that-keepeth-the-sabbath — NT (Hebrews 4, 1 John 2) + Tanakh (Isaiah 58, Exodus 20) [free]
--      (★ keep judgment and do justice; the Sabbath KEPT not abolished, the rest that remaineth, under the keep-his-commandments filter)
--   2. isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant — NT (Acts 8, Ephesians 2) + Tanakh (Deuteronomy 23) [free]
--      (★★★ KEYSTONE: the eunuch shut out by Deut 23 and the stranger brought in by COVENANT-KEEPING, a name better than sons; the Ethiopian eunuch the literal first-fruit, strangers made fellowcitizens THROUGH the covenant)
--   3. isaiah-56-mine-house-an-house-of-prayer-for-all-people — NT (Mark 11, Matthew 21) [free]
--      (★★ the house of prayer for all nations, quoted by Yahusha cleansing the temple — the nations gathered INTO the covenant house, not a replacement of it)
--   4. isaiah-56-gathereth-the-outcasts-of-yasharel-and-others-beside — NT (John 10, John 11) + Tanakh (Psalm 147, Ezekiel 37) [free]
--      (★★ the two-house ingathering: the outcasts of Yashar'el + others gathered beside = the other sheep, the scattered children gathered in one, the two sticks made one)
--   5. isaiah-56-strangers-joined-the-wild-olive-come-home — NT (Romans 11) [free]
--      (★ the GUARD thread: the stranger who takes hold of the covenant is the wild olive of Yashar'el grown wild in the nations grafted back into HER OWN root — never a people cast off and replaced)
--   6. isaiah-56-his-watchmen-are-blind-the-greedy-shepherds — Tanakh (Ezekiel 34) [free]
--      (★★ covenant-lawsuit against the blind watchmen and greedy dogs/shepherds who feed themselves while the flock becomes meat to the beasts; corrupt leadership condemned, the people are victims)
--
-- Framing notes:
--   ★ KEEP THE SABBATH (THREAD 1): *Thus saith Yahuah (LORD), Keep ye judgment, and do justice...
--      Blessed is the man that doeth this, and the son of Adam that layeth hold on it; that keepeth
--      the sabbath from polluting it* (56:1-2). The whole chapter is framed as covenant-faithfulness:
--      the blessing is on the one who KEEPS the Sabbath, not on confession alone. Isaiah himself
--      lays it down again lateral: *call the sabbath a delight, the holy of Yahuah (LORD)* (58:13);
--      it is the fourth word of the Ten: *Remember the sabbath day, to keep it holy* (Exodus 20:8).
--      The NT does NOT abolish it — *There remaineth therefore a rest to the people of Elohim (God)*
--      (Hebrews 4:9). And the filter holds: *hereby we do know that we know him, if we keep his
--      commandments* (1 John 2:3); *He that saith, I know him, and keepeth not his commandments, is
--      a liar* (2:4). The Sabbath kept frames the inclusion that follows — not membership-by-
--      confession, but covenant-keeping.
--   ★★★ THE EUNUCH AND THE STRANGER (THREAD 2 — KEYSTONE): *Neither let the son of the stranger,
--      that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly
--      separated me from his people: neither let the eunuch say, Behold, I am a dry tree* (56:3).
--      The eunuch was formerly shut out: *He that is wounded in the stones, or hath his privy member
--      cut off, shall not enter into the congregation of Yahuah (LORD)* (Deuteronomy 23:1). What
--      resolves the tension is COVENANT-KEEPING, not bare confession: *the eunuchs that keep my
--      sabbaths, and choose the things that please me, and take hold of my covenant* are given *a
--      place and a name better than of sons and of daughters... an everlasting name* (56:4-5). This
--      is fulfilled literally and stunningly in Acts: *a man of Ethiopia, an eunuch of great
--      authority... had come to Jerusalem for to worship* (Acts 8:27), *sitting in his chariot read
--      Esaias the prophet* (8:28) — reading THIS prophet — *and he baptized him* (8:38), the eunuch
--      brought in. And Paul names the strangers' standing: *aliens from the commonwealth of
--      Yashar'el (Israel), and strangers from the covenants of promise* (Ephesians 2:12), *now in
--      HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood*
--      (2:13), *no more strangers and foreigners, but fellowcitizens with the saints* (2:19). The
--      foreigner who TAKES HOLD OF THE COVENANT is brought into the commonwealth — not a new people
--      grafted by confession-apart-from-the-covenant, but the scattered + those who join by keeping
--      the covenant. Frame CAREFULLY: covenant-faith, never false inclusion.
--   ★★ HOUSE OF PRAYER FOR ALL PEOPLE (THREAD 3): *Also the sons of the stranger, that join
--      themselves to Yahuah (LORD), to serve him... every one that keepeth the sabbath* (56:6) — and
--      *mine house shall be called an house of prayer for all people* (56:7). Yahusha quotes it
--      cleansing the temple, and Mark preserves the FULLER form: *Is it not written, My house shall
--      be called of all nations the house of prayer? but ye have made it a den of thieves* (Mark
--      11:17); *My house shall be called the house of prayer* (Matthew 21:13). The gathering of the
--      nations INTO the covenant house — the house of prayer for all peoples — not a replacement of
--      the house but its filling.
--   ★★ GATHERETH THE OUTCASTS, AND OTHERS BESIDE (THREAD 4): *Adonai Yahuah (The Lord GOD) which
--      gathereth the outcasts of Yashar'el (Israel) saith, Yet will I gather others to him, beside
--      those that are gathered unto him* (56:8). This is the heart of the two-house ingathering: the
--      outcasts of Yashar'el FIRST, then others gathered beside. The Psalm sings the same:
--      *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar'el
--      (Israel)* (Psalm 147:2). Yahusha names the others-beside: *And other sheep I have, which are
--      not of this fold: them also I must bring, and they shall hear my voice; and there shall be
--      one fold, and one shepherd* (John 10:16); he died *that also he should gather together in one
--      the children of Elohim (God) that were scattered abroad* (John 11:52). And Ezekiel makes it
--      the two sticks: *the stick of Joseph... and... the stick of Yahudah (Judah), and make them
--      one stick* (Ezekiel 37:19), *gather them on every side, and bring them into their own land*
--      (37:21). The outcasts + others = the two houses gathered home as one.
--   ★ THE WILD OLIVE COME HOME (THREAD 5 — GUARD): the stranger who *take[s] hold of my covenant*
--      (56:4,6) is, in Paul's figure, the wild olive grafted back: *thou, being a wild olive tree,
--      wert graffed in among them, and with them partakest of the root and fatness of the olive
--      tree* (Romans 11:17). The graft is INTO Yashar'el's own root, not a new tree — and the people
--      are never cast off: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans
--      11:1). The strangers joined to Yahuah are the wild branches of the same olive come home, the
--      covenant-keepers gathered — never a replacement people. This thread is the explicit guard
--      against the replacement reading of the keystone.
--   ★★ THE BLIND WATCHMEN (THREAD 6): *All ye beasts of the field, come to devour... His watchmen
--      are blind: they are all ignorant, they are all dumb dogs, they cannot bark... Yea, they are
--      greedy dogs which can never have enough, and they are shepherds that cannot understand: they
--      all look to their own way, every one for his gain* (56:9-11). This is covenant-lawsuit against
--      faithless LEADERS, not the people. Ezekiel speaks the same indictment: *Woe be to the
--      shepherds of Yashar'el (Israel) that do feed themselves! should not the shepherds feed the
--      flocks?* (Ezekiel 34:2); and the flock became the very prey Isaiah's beasts devour: *they
--      were scattered, because there is no shepherd: and they became meat to all the beasts of the
--      field, when they were scattered* (Ezekiel 34:5). The greedy dogs and the beasts of the field
--      are one picture — the corrupt watchmen condemned, the scattered flock the victim. Victims,
--      not enemies.
--   VERSES WITH NO SEPARATE ADD: v.9-12's beasts/drunken-shepherds are bound into THREAD 6 (the
--      Ezekiel 34 shepherd-lawsuit); v.12 (Come ye... I will fetch wine) is the self-indicting speech
--      of the greedy shepherds of v.11, woven into THREAD 6. All recorded, none silently skipped.
--      Extras weighed across all passages (Sabbath, the gathering, the watchmen) — no clean single-
--      verse extra-canonical witness warranted; held in prose.

CREATE TEMP VIEW _s303_isa56_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Blessed is the man that keepeth the sabbath (Sabbath kept, not abolished)
    ('canon','isaiah',56,2,'canon','isaiah',58,13,'free',
      E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13). *Blessed is the man... that keepeth the sabbath from polluting it* (Isaiah 56:2) is the same Sabbath Isaiah elsewhere calls *a delight, the holy of Yahuah* — kept, not polluted, honoured as Yahuah''s holy day. The prophet sets the Sabbath at the center of covenant-faithfulness, never abolishes it.'),
    ('canon','isaiah',56,2,'canon','exodus',20,8,'free',
      E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). The blessing on the one *that keepeth the sabbath from polluting it* (Isaiah 56:2) rests on the fourth of the Ten Words — *the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God)... Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:10-11). Isaiah 56 calls Yashar''el back to the commandment given at Sinai, not to a thing set aside.'),
    ('canon','isaiah',56,2,'canon','hebrews',4,9,'free',
      E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The Sabbath *kept... from polluting it* (Isaiah 56:2) is not done away in the NT — *there remaineth therefore a rest* (the sabbath-rest, sabbatismos) *to the people of Elohim (God)*, rooted in *Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4). The rest that remaineth is the very Sabbath Isaiah blesses the keeper of.'),
    ('canon','isaiah',56,1,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). *Keep ye judgment, and do justice* (Isaiah 56:1) is the covenant-keeping that frames the whole chapter, and the NT filter confirms it — knowing Yahuah is proved by *if we keep his commandments*. The blessing of Isaiah 56 is on the doer and the keeper, not the bare confessor.'),
    ('canon','isaiah',56,1,'canon','1-john',2,4,'free',
      E'*He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). *Keep ye judgment, and do justice: for my salvation is near to come* (Isaiah 56:1) — the salvation drawing near does not loose the keeping; the filter against the lawless reading stands: *he that saith, I know him, and keepeth not his commandments, is a liar*. Isaiah 56 frames salvation-near as a summons to keep, not a release from it.'),

    -- THREAD 2 (★★★ KEYSTONE): The eunuch and the stranger take hold of my covenant
    ('canon','isaiah',56,3,'canon','deuteronomy',23,1,'free',
      E'*He that is wounded in the stones, or hath his privy member cut off, shall not enter into the congregation of Yahuah (LORD)* (Deuteronomy 23:1). This is the Torah-tension Isaiah 56 resolves: *neither let the eunuch say, Behold, I am a dry tree* (Isaiah 56:3). The one formerly shut out of the congregation is now told not to despair — for the eunuch who *keep[s] my sabbaths... and take[s] hold of my covenant* (56:4) is brought in, given *a name better than of sons and of daughters* (56:5). The covenant kept, not the flesh-defect, decides.'),
    ('canon','isaiah',56,4,'canon','acts',8,27,'free',
      E'*And he arose and went: and, behold, a man of Ethiopia, an eunuch of great authority under Candace queen of the Ethiopians, who had the charge of all her treasure, and had come to Jerusalem for to worship* (Acts 8:27). The eunuch of Isaiah 56:4 — *the eunuchs that keep my sabbaths, and choose the things that please me, and take hold of my covenant* — appears in flesh: an Ethiopian eunuch who *had come to Jerusalem for to worship*, a literal first-fruit of the very promise, the dry tree made fruitful.'),
    ('canon','isaiah',56,4,'canon','acts',8,28,'free',
      E'*Was returning, and sitting in his chariot read Esaias the prophet* (Acts 8:28). The eunuch given *a place and a name better than of sons and of daughters* (Isaiah 56:5) is found reading *Esaias the prophet* — this very book — when Philip is sent to him. Isaiah''s promise to the eunuch is fulfilled in a eunuch reading Isaiah; the prophecy reads itself into its own fulfillment.'),
    ('canon','isaiah',56,5,'canon','acts',8,38,'free',
      E'*And he commanded the chariot to stand still: and they went down both into the water, both Philip and the eunuch; and he baptized him* (Acts 8:38). *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name* (Isaiah 56:5) — and the eunuch is *baptized*, given his place and everlasting name in the house, brought into the covenant people he feared had *utterly separated* him (56:3). The dry tree receives the everlasting name.'),
    ('canon','isaiah',56,6,'canon','ephesians',2,19,'free',
      E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19). *Also the sons of the stranger, that join themselves to Yahuah (LORD)... to be his servants* (Isaiah 56:6) are made *no more strangers and foreigners, but fellowcitizens* — the very stranger who joins himself by covenant-keeping is brought into the household, the commonwealth of Yashar''el. Inclusion THROUGH the covenant, not apart from it.'),
    ('canon','isaiah',56,3,'canon','ephesians',2,12,'free',
      E'*That at that time ye were without Messiah (Christ), being aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise, having no hope* (Ephesians 2:12). The *son of the stranger* who feared *Yahuah (LORD) hath utterly separated me from his people* (Isaiah 56:3) is the one Paul calls *aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* — the separation Isaiah 56 overturns by the covenant taken hold of.'),
    ('canon','isaiah',56,6,'canon','ephesians',2,13,'free',
      E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13). The strangers who *join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD)* (Isaiah 56:6) are those *made nigh by the blood* — the far-off brought near, the covenant-keeping stranger drawn in. Made nigh THROUGH the covenant blood, into Yashar''el''s own commonwealth.'),

    -- THREAD 3 (★★): Mine house an house of prayer for all people (Yahusha cleansing the temple)
    ('canon','isaiah',56,7,'canon','mark',11,17,'free',
      E'*And he taught, saying unto them, Is it not written, My house shall be called of all nations the house of prayer? but ye have made it a den of thieves* (Mark 11:17). Yahusha quotes Isaiah 56:7 cleansing the temple — and Mark preserves the FULLER form, *of all nations* — exactly Isaiah''s *mine house shall be called an house of prayer for all people*. The house is for all peoples gathered in; the moneychangers had made it a den of thieves, robbing it of that purpose.'),
    ('canon','isaiah',56,7,'canon','matthew',21,13,'free',
      E'*And said unto them, It is written, My house shall be called the house of prayer; but ye have made it a den of thieves* (Matthew 21:13). *Mine house shall be called an house of prayer for all people* (Isaiah 56:7) — Yahusha cites it overturning the tables: *My house shall be called the house of prayer*. The temple was to be the house of prayer for the nations Isaiah 56 gathers; the den of thieves had displaced the very strangers the prophecy welcomed.'),

    -- THREAD 4 (★★): Gathereth the outcasts of Yashar'el, and others beside (the two-house ingathering)
    ('canon','isaiah',56,8,'canon','psalms',147,2,'free',
      E'*Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel)* (Psalm 147:2). *Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel)* (Isaiah 56:8) sings the same gathering the Psalm names — Yahuah the gatherer of the outcasts, building up Jerusalem by bringing home the scattered. The outcasts of the northern house regathered.'),
    ('canon','isaiah',56,8,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). *Yet will I gather others to him, beside those that are gathered unto him* (Isaiah 56:8) is the very *other sheep... not of this fold* Yahusha must bring — the outcasts of Yashar''el gathered FIRST, then others beside, made *one fold* under *one shepherd*. The two-house ingathering in the Shepherd''s own words.'),
    ('canon','isaiah',56,8,'canon','john',11,52,'free',
      E'*And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). *He which gathereth the outcasts of Yashar''el (Israel)... Yet will I gather others to him* (Isaiah 56:8) is the gathering John names — Yahusha dying to *gather together in one the children of Elohim (God) that were scattered abroad*, the outcasts and the others-beside made one.'),
    ('canon','isaiah',56,8,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). *He... which gathereth the outcasts of Yashar''el (Israel)... Yet will I gather others to him* (Isaiah 56:8) is the two-house regathering Ezekiel draws as the two sticks — Joseph (Ephraim, the scattered north) and Yahudah made *one stick*, the outcasts and the others gathered as one people.'),
    ('canon','isaiah',56,8,'canon','ezekiel',37,21,'free',
      E'*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). *Yahuah Elohim which gathereth the outcasts of Yashar''el (Israel)* (Isaiah 56:8) is Ezekiel''s promise to *gather them on every side* from among the heathen — the scattered outcasts brought home, the same ingathering Isaiah''s others-beside join.'),

    -- THREAD 5 (★ GUARD): The strangers joined, the wild olive come home (never replacement)
    ('canon','isaiah',56,6,'canon','romans',11,17,'free',
      E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree* (Romans 11:17). *The sons of the stranger, that join themselves to Yahuah (LORD)... and taketh hold of my covenant* (Isaiah 56:6) are Paul''s *wild olive tree... graffed in*, partaking of the root — grafted INTO Yashar''el''s own olive, not a new tree. The stranger who takes hold of the covenant is the wild branch come home, never a replacement people.'),
    ('canon','isaiah',56,3,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1). The stranger who feared *Yahuah (LORD) hath utterly separated me from his people* (Isaiah 56:3) need not — for *Hath Elohim (God) cast away his people? Elohim (God) forbid*. The people are not cast off and replaced; the strangers are grafted into a living root, the covenant people gathered, not supplanted.'),

    -- THREAD 6 (★★): His watchmen are blind, the greedy shepherds (covenant-lawsuit against the leaders)
    ('canon','isaiah',56,10,'canon','ezekiel',34,2,'free',
      E'*Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). *His watchmen are blind... they are shepherds that cannot understand: they all look to their own way, every one for his gain* (Isaiah 56:10-11) is the same covenant-lawsuit Ezekiel brings against *the shepherds... that do feed themselves* — the leaders who graze on the flock instead of feeding it. The indictment is on the watchmen, not the sheep.'),
    ('canon','isaiah',56,9,'canon','ezekiel',34,5,'free',
      E'*And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5). *All ye beasts of the field, come to devour* (Isaiah 56:9) — with the blind watchmen who *cannot bark* (56:10) — is exactly Ezekiel''s picture: the flock, left by faithless shepherds, *became meat to all the beasts of the field*. The beasts devour because the watchmen failed; the people are the victims of the leaders'' negligence, not the enemy.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa56_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa56_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-56-blessed-is-the-man-that-keepeth-the-sabbath',
       E'Blessed is the man that keepeth the sabbath — covenant-faithfulness, not abolition',
       E'The chapter opens not with confession but with KEEPING: *Thus saith Yahuah (LORD), Keep ye judgment, and do justice: for my salvation is near to come, and my righteousness to be revealed. Blessed is the man that doeth this, and the son of Adam that layeth hold on it; that keepeth the sabbath from polluting it, and keepeth his hand from doing any evil* (Isaiah 56:1-2). The blessing rests on the doer, the keeper, the one who guards the Sabbath from being polluted — covenant-faithfulness frames the whole chapter that follows. Isaiah lays the same Sabbath down again later: *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (58:13). It is the fourth of the Ten Words spoken at Sinai: *Remember the sabbath day, to keep it holy... wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:8,11). The NT does not abolish it — *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9), the sabbath-rest rooted in *Elohim (God) did rest the seventh day from all his works* (4:4). And the filter holds against every reading that makes the keeping optional: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3); *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (2:4). The salvation drawing near is a summons to keep, never a release from keeping — and the inclusion of the eunuch and the stranger that follows turns on this very Sabbath-keeping, not on confession apart from the covenant.',
       sv.verse_id, ev.verse_id, 'free', 27375
  FROM _s303_isa56_lookup sv, _s303_isa56_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=56 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant',
       E'The eunuch and the stranger take hold of my covenant — a name better than sons and daughters',
       E'Here is the keystone of the chapter, and it must be framed carefully. Two who feared they were shut out are addressed: *Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people: neither let the eunuch say, Behold, I am a dry tree* (Isaiah 56:3). The eunuch was indeed barred by the Torah: *He that is wounded in the stones, or hath his privy member cut off, shall not enter into the congregation of Yahuah (LORD)* (Deuteronomy 23:1). What overturns the bar is not bare confession but COVENANT-KEEPING: *the eunuchs that keep my sabbaths, and choose the things that please me, and take hold of my covenant* (56:4) are given *in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off* (56:5). The dry tree is made fruitful by taking hold of the covenant. And this is fulfilled stunningly, literally, in Acts: *a man of Ethiopia, an eunuch of great authority... had come to Jerusalem for to worship* (Acts 8:27), found *sitting in his chariot* reading *Esaias the prophet* (8:28) — this very book — and *he baptized him* (8:38), the eunuch given his place and everlasting name in the house. The prophecy is fulfilled in a eunuch reading the prophecy. So too the stranger: *aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* (Ephesians 2:12) are *made nigh by the blood of Messiah (Christ)* (2:13), *no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (2:19). This is the scattered returning and those who JOIN by keeping the covenant — Sabbath kept, covenant held fast — brought into the commonwealth THROUGH the covenant, never a new people included by confession-apart-from-the-covenant. Covenant-faith, not false inclusion.',
       sv.verse_id, ev.verse_id, 'free', 27378
  FROM _s303_isa56_lookup sv, _s303_isa56_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=56 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-56-mine-house-an-house-of-prayer-for-all-people',
       E'Mine house shall be called an house of prayer for all people — Yahusha cleansing the temple',
       E'The strangers who join themselves to Yahuah are brought to the mountain and the house: *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD)... every one that keepeth the sabbath from polluting it, and taketh hold of my covenant; Even them will I bring to my holy mountain, and make them joyful in my house of prayer... for mine house shall be called an house of prayer for all people* (Isaiah 56:6-7). Yahusha quotes this verse cleansing the temple, and Mark preserves the FULLER form Isaiah wrote — *for all nations*: *Is it not written, My house shall be called of all nations the house of prayer? but ye have made it a den of thieves* (Mark 11:17); *It is written, My house shall be called the house of prayer; but ye have made it a den of thieves* (Matthew 21:13). The temple was meant to be the house of prayer for all the peoples Isaiah 56 gathers — and the moneychangers had made it a den of thieves, displacing the very strangers and nations the prophecy welcomed in. Note that the welcome is for those who *keepeth the sabbath* and *taketh hold of my covenant* (56:6): the nations gathered INTO the covenant house, not a replacement of the house. Yahusha clears it so that it may be again what Isaiah said it would be.',
       sv.verse_id, ev.verse_id, 'free', 27381
  FROM _s303_isa56_lookup sv, _s303_isa56_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=56 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-56-gathereth-the-outcasts-of-yasharel-and-others-beside',
       E'Gathereth the outcasts of Yashar''el, and others beside — the two-house ingathering',
       E'The chapter''s welcome culminates in the great gathering word: *Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him* (Isaiah 56:8). This is the heart of the two-house ingathering: FIRST the outcasts of Yashar''el — the scattered, divorced northern house — and THEN others gathered beside. The Psalm sings the same: *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel)* (Psalm 147:2). Yahusha names the others-beside as his other sheep: *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16); and he died *that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). Ezekiel draws it as the two sticks made one: *I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19), *I will take the children of Yashar''el (Israel) from among the heathen... and will gather them on every side, and bring them into their own land* (37:21). The outcasts of Yashar''el and the others gathered beside are the two houses — Ephraim and Yahudah — brought home and made one people, one fold, one stick in the hand of the Gatherer.',
       sv.verse_id, ev.verse_id, 'free', 27384
  FROM _s303_isa56_lookup sv, _s303_isa56_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=56 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★ GUARD)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-56-strangers-joined-the-wild-olive-come-home',
       E'The strangers joined to Yahuah — the wild olive grafted into her own root, not replacement',
       E'This thread guards the keystone against the replacement reading. The *sons of the stranger, that join themselves to Yahuah (LORD)... and taketh hold of my covenant* (Isaiah 56:6) and the one who feared *Yahuah (LORD) hath utterly separated me from his people* (56:3) are, in Paul''s figure, the wild olive grafted back: *And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree* (Romans 11:17). The graft is INTO the cultivated olive — Yashar''el''s own root — not the planting of a new tree. And the people are never cast off and supplanted: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1). So the stranger of Isaiah 56 who takes hold of the covenant is not a foreign people replacing the old, but the wild branch — the descendants of Yashar''el grown wild and scattered in the nations — grafted back into her own living root. The covenant-keeping foreigner come home, never a church grafted in by confession to replace a cast-off people. This is the line the keystone must never be read across: gathering and restoration, not replacement.',
       sv.verse_id, ev.verse_id, 'free', 27387
  FROM _s303_isa56_lookup sv, _s303_isa56_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=56 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-56-his-watchmen-are-blind-the-greedy-shepherds',
       E'His watchmen are blind, the greedy shepherds — covenant-lawsuit against the leaders',
       E'The chapter turns from the gathering to a sharp covenant-lawsuit against the faithless leaders who let the flock be scattered: *All ye beasts of the field, come to devour, yea, all ye beasts in the forest. His watchmen are blind: they are all ignorant, they are all dumb dogs, they cannot bark; sleeping, lying down, loving to slumber. Yea, they are greedy dogs which can never have enough, and they are shepherds that cannot understand: they all look to their own way, every one for his gain, from his quarter* (Isaiah 56:9-11) — and their own self-indulgent speech: *Come ye, say they, I will fetch wine, and we will fill ourselves with strong drink* (56:12). This is the same indictment Ezekiel brings, and it falls on the SHEPHERDS, not the sheep: *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). And the consequence is exactly Isaiah''s devouring beasts: *And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5). The blind watchmen who *cannot bark* leave the gate open; the beasts of the field come to devour; the greedy shepherds gorge themselves while the flock is torn. The lawsuit dismantles the corrupt leadership — never attacks the people. The scattered flock is the victim of the watchmen''s negligence, the lost sheep Yahuah himself will come to gather (the very ingathering of the verse before, 56:8).',
       sv.verse_id, ev.verse_id, 'free', 27390
  FROM _s303_isa56_lookup sv, _s303_isa56_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=56 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13) — the same Sabbath *kept... from polluting it* (Isaiah 56:2), honoured not abolished.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=2
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-blessed-is-the-man-that-keepeth-the-sabbath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Remember the sabbath day, to keep it holy* (Exodus 20:8) — the fourth of the Ten Words under the blessing on the Sabbath-keeper (Isaiah 56:2).'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=2
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-blessed-is-the-man-that-keepeth-the-sabbath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — the Sabbath-rest still remaineth; the kept Sabbath (Isaiah 56:2) not done away.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=2
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-blessed-is-the-man-that-keepeth-the-sabbath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *we do know that we know him, if we keep his commandments* (1 John 2:3) — *Keep ye judgment, and do justice* (Isaiah 56:1); knowing Yahuah proved by keeping.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=1
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-blessed-is-the-man-that-keepeth-the-sabbath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4) — the filter against the lawless reading of salvation-near (Isaiah 56:1).'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=1
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-blessed-is-the-man-that-keepeth-the-sabbath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *hath his privy member cut off, shall not enter into the congregation of Yahuah (LORD)* (Deuteronomy 23:1) — the Torah-bar the eunuch feared (Isaiah 56:3), resolved by taking hold of the covenant.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=3
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *a man of Ethiopia, an eunuch... had come to Jerusalem for to worship* (Acts 8:27) — the eunuch of Isaiah 56:4 in flesh, a literal first-fruit of the promise.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=4
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *sitting in his chariot read Esaias the prophet* (Acts 8:28) — the eunuch given an everlasting name (Isaiah 56:5) found reading this very prophet; the prophecy fulfilled in its own reader.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=4
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *they went down both into the water... and he baptized him* (Acts 8:38) — the eunuch given *a place and a name better than of sons and of daughters* (Isaiah 56:5), the dry tree made fruitful.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=5
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* (Ephesians 2:12) — the separation the stranger feared (Isaiah 56:3) overturned by the covenant.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=3
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — the stranger who joins himself to Yahuah (Isaiah 56:6) made nigh THROUGH the covenant, not apart from it.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=6
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *no more strangers and foreigners, but fellowcitizens with the saints* (Ephesians 2:19) — the stranger who takes hold of the covenant (Isaiah 56:6) made fellowcitizen of the household.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=6
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-the-eunuch-and-the-stranger-take-hold-of-my-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *My house shall be called of all nations the house of prayer* (Mark 11:17) — Yahusha quotes Isaiah 56:7 cleansing the temple; Mark''s fuller *of all nations* form.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=7
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=11 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-mine-house-an-house-of-prayer-for-all-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *My house shall be called the house of prayer; but ye have made it a den of thieves* (Matthew 21:13) — *an house of prayer for all people* (Isaiah 56:7), the den of thieves displacing the welcomed nations.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=7
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-mine-house-an-house-of-prayer-for-all-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he gathereth together the outcasts of Yashar''el (Israel)* (Psalm 147:2) — the same gathering of the outcasts (Isaiah 56:8); Yahuah builds Jerusalem by bringing the scattered home.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=8
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-gathereth-the-outcasts-of-yasharel-and-others-beside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *other sheep I have... them also I must bring... one fold, and one shepherd* (John 10:16) — *Yet will I gather others to him, beside those that are gathered* (Isaiah 56:8); the two-house ingathering.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=8
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-gathereth-the-outcasts-of-yasharel-and-others-beside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52) — the outcasts and others-beside (Isaiah 56:8) gathered in one by the Shepherd''s death.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=8
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-gathereth-the-outcasts-of-yasharel-and-others-beside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the stick of Joseph... and the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — the outcasts and others-beside (Isaiah 56:8) = the two sticks made one.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=8
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-gathereth-the-outcasts-of-yasharel-and-others-beside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *gather them on every side, and bring them into their own land* (Ezekiel 37:21) — *which gathereth the outcasts of Yashar''el* (Isaiah 56:8); the scattered brought home from among the heathen.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=8
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-gathereth-the-outcasts-of-yasharel-and-others-beside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★ GUARD)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou, being a wild olive tree, wert graffed in among them... partakest of the root* (Romans 11:17) — the stranger who takes hold of the covenant (Isaiah 56:6) = the wild olive grafted into Yashar''el''s own root.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=6
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-strangers-joined-the-wild-olive-come-home'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the stranger feared utter separation (Isaiah 56:3); but the people are not cast off and replaced, the wild branch grafted into a living root.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=3
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-strangers-joined-the-wild-olive-come-home'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2) — the greedy shepherds who *look to their own way, every one for his gain* (Isaiah 56:11).'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=10
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-his-watchmen-are-blind-the-greedy-shepherds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5) — *All ye beasts of the field, come to devour* (Isaiah 56:9); the flock the victim of the blind watchmen, never the enemy.'
  FROM cross_reference_threads t
  JOIN _s303_isa56_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=9
  JOIN _s303_isa56_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-56-his-watchmen-are-blind-the-greedy-shepherds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_65.sql (Isaiah 65) -----
-- Chapter: Isaiah 65 — THE COVENANT-LAWSUIT TURNED TO NEW CREATION. Yahuah answers the prayer of
-- ch64: first the indictment of the rebellious house — *I am sought of them that asked not for me;
-- I am found of them that sought me not... I have spread out my hands all the day unto a rebellious
-- people* (65:1-2), which Paul quotes BOTH verses verbatim in Romans 10:20-21: v.1 of the finding
-- (the wild-olive branches of Yashar'el grown wild among the nations coming home — NOT a new gentile
-- people replacing Israel; Romans 11:1-2 guard), v.2 of the disobedient house. Then the REMNANT
-- preserved for the servants' sakes — *as the new wine is found in the cluster... so will I do for my
-- servants' sakes, that I may not destroy them all* (65:8), *I will bring forth a seed out of Jacob...
-- mine elect shall inherit it* (65:9-10; Romans 9:27-29 / 11:5 the remnant according to the election
-- of grace). Then the DIVIDE within the people — faithful vs faithless by CONDUCT, never ethnicity:
-- *Behold, my servants shall eat, but ye shall be hungry... my servants shall sing for joy... ye shall
-- leave your name for a curse... and call his servants by another name* (65:13-15; the new name of
-- Isaiah 62:2; Revelation 2:17; 3:12). Then THE keystone: *For, behold, I create new heavens and a
-- new earth: and the former shall not be remembered* (65:17 -> 2 Peter 3:13; Revelation 21:1,4;
-- Isaiah 66:22 lateral) — the consummation of the whole framework. The New Jerusalem a rejoicing,
-- no more weeping (65:18-19 -> Revelation 21:2,4; Isaiah 25:8); the curse of Eden and Deuteronomy 28
-- reversed — they build and inhabit, plant and eat, the seed of the blessed of Yahuah (65:21-23 ->
-- Genesis 3:17-19; Amos 9:14 lateral); and the kingdom-peace — *the wolf and the lamb shall feed
-- together... dust shall be the serpent's meat. They shall not hurt nor destroy in all my holy
-- mountain* (65:25 = Isaiah 11:9 verbatim; the serpent's dust = Genesis 3:14).
-- Tag: isa65   Temp view: _s303_isa65_lookup
-- Sort band: base 27600, step 3 -> threads at 27600, 27603, 27606, 27609, 27612, 27615, 27618 (7 threads)
-- Source of EVERY row: 'canon','isaiah',65,v
--
-- Isaiah 65 coverage:
--   ★★★ v.1-2 (I am sought of them that asked not for me; I am found of them that sought me not...
--          I have spread out my hands all the day unto a rebellious people)
--        NT:     ★★★ Romans 10:20 (I was found of them that sought me not — v.1 verbatim) + ★★★ Romans
--                10:21 (All day long I have stretched forth my hands unto a disobedient... people — v.2
--                verbatim) + ★ Romans 9:25-26 (I will call them my people, which were not my people) +
--                ★★ Romans 11:1-2 GUARD (Hath Elohim cast away his people? Elohim forbid) — THREAD 1
--        Extras: none warranted (the two-house finding is the prophets' own; no clean extras add)
--        Tanakh: woven (Hosea Lo-Ammi is carried IN via Romans 9:25-26; not forced to a separate add)
--   ★ v.3-7 (a people that provoketh me... sacrificeth in gardens... eat swine's flesh... I will
--          recompense into their bosom)
--        NT:     none warranted (the indictment is the lead-in to the finding of v.1-2 and the divide
--                of v.13; carried in prose, not a separate thread)
--        Extras: none warranted   Tanakh: woven (the abominations recur at Isaiah 66:17, held in prose)
--   ★ v.8-10 (As the new wine is found in the cluster... so will I do for my servants' sakes, that I
--          may not destroy them all... mine elect shall inherit it)
--        NT:     ★ Romans 9:27 (a remnant shall be saved) + Romans 9:29 (Except Yahuah of Sabaoth had
--                left us a seed) + ★★ Romans 11:5 (a remnant according to the election of grace) — THREAD 2
--        Extras: none warranted   Tanakh: woven (the seed of Jacob is the remnant motif of THREAD 2)
--   ★★ v.11-15 (ye are they that forsake Yahuah... I will number you to the sword vs Behold, my
--          servants shall eat... ye shall leave your name for a curse... call his servants by another name)
--        NT:     ★★ Revelation 2:17 (a new name written, which no man knoweth) + ★★ Revelation 3:12
--                (I will write upon him my new name... new Jerusalem) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 62:2 (thou shalt be called by a new name, which the mouth of Yahuah shall name) — THREAD 3
--   ★★★ v.17 (For, behold, I create new heavens and a new earth: and the former shall not be remembered)
--        NT:     ★★★ 2 Peter 3:13 (we... look for new heavens and a new earth, wherein dwelleth
--                righteousness) + ★★★ Revelation 21:1 (a new heaven and a new earth) + ★★ Revelation
--                21:4 (former things are passed away) — THREAD 4
--        Extras: ★ 1 Enoch 45:4 (I will change the heaven and the earth... and I will make the earth a
--                thing of light) — THREAD 4 (clean verbatim new-creation witness)
--        Tanakh: ★★ Isaiah 66:22 (as the new heavens and the new earth... so shall your seed and your
--                name remain) — THREAD 4
--   ★★ v.18-19 (I create Jerusalem a rejoicing... the voice of weeping shall be no more heard in her)
--        NT:     ★★ Revelation 21:2 (the holy city, new Jerusalem... prepared as a bride) + ★★
--                Revelation 21:4 (Elohim shall wipe away all tears... no more death... nor crying) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 25:8 (He will swallow up death in victory; and Adonai Yahuah will wipe away
--                tears from off all faces) — THREAD 5
--   ★ v.20-23 (they shall build houses, and inhabit them; they shall plant vineyards, and eat... they
--          shall not labour in vain... they are the seed of the blessed of Yahuah)
--        NT:     none warranted (the curse-reversal is the prophets' and Torah's own; no clean NT add forced)
--        Extras: none warranted
--        Tanakh: ★★ Genesis 3:17-19 (cursed is the ground for thy sake; in sorrow shalt thou eat... in
--                the sweat of thy face) — THREAD 6 (the Eden curse reversed) + ★ Amos 9:14 (they shall
--                build the waste cities, and inhabit them; and they shall plant vineyards) — THREAD 6
--   ★★ v.25 (The wolf and the lamb shall feed together... and dust shall be the serpent's meat. They
--          shall not hurt nor destroy in all my holy mountain)
--        NT:     none warranted (the messianic-kingdom peace is bound to its Isaiah-11 twin, the canon's own)
--        Extras: none warranted
--        Tanakh: ★★★ Isaiah 11:9 (They shall not hurt nor destroy in all my holy mountain — verbatim) +
--                ★★ Isaiah 11:6 (The wolf also shall dwell with the lamb) + ★★ Genesis 3:14 (upon thy
--                belly shalt thou go, and dust shalt thou eat) — THREAD 7
--   v.16 (he that blesseth himself... shall bless himself in the Elohim of truth; the former troubles
--          are forgotten): woven into THREAD 3 (the hinge into the new name / forgotten former things).
--   v.24 (before they call, I will answer): woven into THREAD 5 (the New-Jerusalem joy block).
--
-- Threads (slug — target libraries):
--   1. isaiah-65-i-am-found-of-them-that-sought-me-not — NT (Romans 10, Romans 9, Romans 11) [free]
--      (★★★ Paul quotes 65:1-2 verbatim in Romans 10:20-21 — the wild-olive house found/the disobedient house, NOT a replacement people; Romans 11 guard)
--   2. isaiah-65-a-blessing-is-in-the-cluster-the-remnant-preserved — NT (Romans 9, Romans 11) [free]
--      (★ the new wine in the cluster, the servants spared, the seed of Jacob = the remnant according to the election of grace)
--   3. isaiah-65-call-his-servants-by-another-name — NT (Revelation 2, Revelation 3) + Tanakh (Isaiah 62) [free]
--      (★★ the divide within the people by conduct; the faithless leave their name for a curse, the servants get a NEW name)
--   4. isaiah-65-behold-i-create-new-heavens-and-a-new-earth — NT (2 Peter 3, Revelation 21) + Tanakh (Isaiah 66) + Extras (1 Enoch 45) [extras]
--      (★★★ THE keystone forward-weave — the new creation; 2 Peter 3:13 / Revelation 21:1,4; Isaiah 66:22 lateral; 1 Enoch 45:4 the changed heaven and earth)
--   5. isaiah-65-i-create-jerusalem-a-rejoicing — NT (Revelation 21) + Tanakh (Isaiah 25) [free]
--      (★★ the New Jerusalem a rejoicing, the voice of weeping no more = Revelation 21:2,4; death swallowed up, tears wiped, Isaiah 25:8)
--   6. isaiah-65-they-shall-build-houses-and-inhabit-them — Tanakh (Genesis 3, Amos 9) [free]
--      (★ the Eden/Deuteronomy-28 curse reversed — build and inhabit, plant and eat, not labour in vain; the seed of the blessed of Yahuah)
--   7. isaiah-65-the-wolf-and-the-lamb-shall-feed-together — Tanakh (Isaiah 11, Genesis 3) [free]
--      (★★ the messianic-kingdom peace — 65:25 = Isaiah 11:9 verbatim, wolf and lamb; the serpent's dust = the Genesis 3:14 curse standing on the serpent alone)
--
-- Framing notes:
--   ★★★ I AM FOUND OF THEM THAT SOUGHT ME NOT (THREAD 1): *I am sought of them that asked not for me;
--      I am found of them that sought me not... I have spread out my hands all the day unto a rebellious
--      people* (65:1-2). Paul quotes BOTH verses verbatim: *I was found of them that sought me not; I
--      was made manifest unto them that asked not after me* (Romans 10:20) — and *to Yashar'el (Israel)
--      he saith, All day long I have stretched forth my hands unto a disobedient and gainsaying people*
--      (Romans 10:21). Frame the two-house weave with care. v.1 is the finding of those who *asked not*
--      — the wild-olive branches of Yashar'el grown wild among the nations, the scattered house coming
--      home — NOT a new gentile people replacing Israel. Paul names them in the same breath as Hosea's
--      Lo-Ammi made Ammi: *I will call them my people, which were not my people... there shall they be
--      called the children of the living Elohim (God)* (Romans 9:25-26). v.2 is the disobedient house,
--      the *rebellious people* to whom the hands are spread all day. And the GUARD is fixed firm: *Hath
--      Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his
--      people which he foreknew* (Romans 11:1-2). The finding of the one and the patience toward the
--      other are TWO movements over the ONE covenant people, never a casting-off.
--   ★ THE REMNANT PRESERVED (THREAD 2): *As the new wine is found in the cluster, and one saith, Destroy
--      it not; for a blessing is in it: so will I do for my servants' sakes, that I may not destroy them
--      all. And I will bring forth a seed out of Jacob... and mine elect shall inherit it* (65:8-9). The
--      blessing in the cluster is the remnant for whose sake the whole is spared. Paul reads it exactly:
--      *Though the number of the children of Yashar'el (Israel) be as the sand of the sea, a remnant
--      shall be saved* (Romans 9:27); *Except Yahuah (Lord) of Sabaoth had left us a seed, we had been
--      as Sodoma* (9:29); *Even so then at this present time also there is a remnant according to the
--      election of grace* (Romans 11:5). The seed out of Jacob is the elect remnant — the cluster not
--      destroyed for the blessing within it.
--   ★★ CALL HIS SERVANTS BY ANOTHER NAME (THREAD 3): the covenant-lawsuit DIVIDE — *But ye are they that
--      forsake Yahuah (LORD)... Therefore will I number you to the sword* (65:11-12) against *Behold, my
--      servants shall eat, but ye shall be hungry... my servants shall sing for joy of heart, but ye
--      shall cry for sorrow* (65:13-14). The line runs through CONDUCT, never ethnicity — the faithful
--      and the faithless WITHIN the people (victims of the lie, not enemies). The faithless *shall leave
--      your name for a curse unto my chosen... and call his servants by another name* (65:15). The new
--      name is Isaiah's own promise: *thou shalt be called by a new name, which the mouth of Yahuah
--      (LORD) shall name* (Isaiah 62:2); and John carries it forward: *I will give him a white stone, and
--      in the stone a new name written, which no man knoweth* (Revelation 2:17); *I will write upon him
--      the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem...
--      and I will write upon him my new name* (Revelation 3:12). v.16 is the hinge — *the former troubles
--      are forgotten* — turning toward the new creation.
--   ★★★ BEHOLD, I CREATE NEW HEAVENS AND A NEW EARTH (THREAD 4): the keystone — *For, behold, I create
--      new heavens and a new earth: and the former shall not be remembered, nor come into mind* (65:17).
--      Peter looks for its fulfillment: *Nevertheless we, according to his promise, look for new heavens
--      and a new earth, wherein dwelleth righteousness* (2 Peter 3:13); John sees it come: *And I saw a
--      new heaven and a new earth: for the first heaven and the first earth were passed away* (Revelation
--      21:1), *the former things are passed away* (21:4). Isaiah himself seals its permanence: *as the
--      new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so
--      shall your seed and your name remain* (Isaiah 66:22) — the seed and the name endure. And the
--      restored apocalyptic witness sings the same renewal: *I will change the heaven and the earth and
--      the light and the darkness, and I will make the earth a thing of light* (1 Enoch 45:4). This is
--      the consummation of the whole framework.
--   ★★ I CREATE JERUSALEM A REJOICING (THREAD 5): *be ye glad and rejoice for ever in that which I
--      create: for, behold, I create Jerusalem a rejoicing, and her people a joy. And I will rejoice in
--      Jerusalem... and the voice of weeping shall be no more heard in her, nor the voice of crying*
--      (65:18-19). John sees the rejoicing city: *the holy city, new Jerusalem, coming down from Elohim
--      (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2), where *Elohim
--      (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow,
--      nor crying* (21:4). And Isaiah's own twin: *He will swallow up death in victory; and Adonai Yahuah
--      (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8). The weeping ends; the joy
--      is for ever.
--   ★ THEY SHALL BUILD HOUSES AND INHABIT THEM (THREAD 6): the curse reversed — *they shall build houses,
--      and inhabit them; and they shall plant vineyards, and eat the fruit of them. They shall not build,
--      and another inhabit... they shall not labour in vain... for they are the seed of the blessed of
--      Yahuah (LORD)* (65:21-23). The labour-in-vain, the eating in sorrow, is the Eden sentence: *cursed
--      is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life... In the sweat
--      of thy face shalt thou eat bread* (Genesis 3:17-19). And the regathering-language is Amos's:
--      *they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink
--      the wine thereof* (Amos 9:14). The seed of the blessed of Yahuah is the two-house seed; the curse
--      of the ground is lifted in the new creation.
--   ★★ THE WOLF AND THE LAMB SHALL FEED TOGETHER (THREAD 7): *The wolf and the lamb shall feed together,
--      and the lion shall eat straw like the bullock: and dust shall be the serpent's meat. They shall
--      not hurt nor destroy in all my holy mountain* (65:25). The closing line is Isaiah 11 VERBATIM:
--      *They shall not hurt nor destroy in all my holy mountain* (Isaiah 11:9); *The wolf also shall dwell
--      with the lamb, and the leopard shall lie down with the kid* (Isaiah 11:6) — the messianic-kingdom
--      peace of the Branch from Jesse. And the serpent alone keeps his sentence — *dust shall be the
--      serpent's meat* — the curse of Eden standing on the serpent: *upon thy belly shalt thou go, and
--      dust shalt thou eat all the days of thy life* (Genesis 3:14). Creation is at peace, the curse
--      lifted from all but the serpent of Genesis 3:15's enmity.
--   VERSES WITH NO SEPARATE ADD: v.3-7 (the indictment — gardens, swine's flesh, the recompense into the
--      bosom — is the lead-in to the finding of v.1-2 and the divide of v.13; the swine/garden abominations
--      recur at Isaiah 66:17, held in prose). v.16 woven into THREAD 3 (former troubles forgotten, the
--      hinge to the new name). v.24 (before they call, I will answer) woven into THREAD 5. Extras: weighed
--      1 Enoch 45:4-5 (clean — ADDED to THREAD 4) and 2 Esdras / 4 Ezra 7 on the renewed creation (the
--      clean verses there are the resurrection/judgment, not a single verbatim new-heavens line — held in
--      prose, no add forced). All recorded, none silently skipped.

CREATE TEMP VIEW _s303_isa65_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): I am found of them that sought me not (Paul quotes 65:1-2 verbatim; the two houses)
    ('canon','isaiah',65,1,'canon','romans',10,20,'free',
      E'*But Esaias is very bold, and saith, I was found of them that sought me not; I was made manifest unto them that asked not after me* (Romans 10:20). Paul quotes Isaiah 65:1 word for word — *I am sought of them that asked not for me; I am found of them that sought me not*. The finding of those who *asked not* is the wild-olive branches of Yashar''el (Israel) grown wild among the nations brought home — the scattered house found, NOT a new people replacing Israel.'),
    ('canon','isaiah',65,2,'canon','romans',10,21,'free',
      E'*But to Yashar''el (Israel) he saith, All day long I have stretched forth my hands unto a disobedient and gainsaying people* (Romans 10:21). Paul quotes Isaiah 65:2 word for word — *I have spread out my hands all the day unto a rebellious people, which walketh in a way that was not good*. The spread-out hands are the long-suffering of Yahuah toward the disobedient house; the indictment and the patience are over the one covenant people.'),
    ('canon','isaiah',65,1,'canon','romans',9,25,'free',
      E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). The *nation that was not called by my name* found in Isaiah 65:1 is Hosea''s Lo-Ammi made Ammi — *them which were not my people, Thou art my people*. The finding of those who asked not is the divorced house renamed and restored, never a foreign people grafted in by confession.'),
    ('canon','isaiah',65,1,'canon','romans',9,26,'free',
      E'*And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26). Those *found* who *sought me not* (Isaiah 65:1) are the very ones told *Ye are not my people* now called *the children of the living Elohim (God)* — the scattered, wild-grown branches of Yashar''el regathered, the two-house finding.'),
    ('canon','isaiah',65,2,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1). The hands spread out *all the day unto a rebellious people* (Isaiah 65:2) are spread in patience, never in rejection — *Elohim (God) forbid* that the people be cast away. The disobedient house is borne with, not abandoned; the guard against the replacement reading.'),
    ('canon','isaiah',65,2,'canon','romans',11,2,'free',
      E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). *I have spread out my hands all the day unto a rebellious people* (Isaiah 65:2) — the all-day stretching of the hands is the proof that the foreknown people are not cast away. The rebellion is real and judged, but the spread hands remain spread; the covenant people stand.'),

    -- THREAD 2 (★): A blessing is in the cluster — the remnant preserved (the seed of Jacob = the elect remnant)
    ('canon','isaiah',65,8,'canon','romans',9,27,'free',
      E'*Esaias also crieth concerning Yashar''el (Israel), Though the number of the children of Yashar''el (Israel) be as the sand of the sea, a remnant shall be saved* (Romans 9:27). *As the new wine is found in the cluster... so will I do for my servants'' sakes, that I may not destroy them all* (Isaiah 65:8) — the blessing in the cluster is the remnant for whose sake the whole is spared; *a remnant shall be saved*, the servants not destroyed.'),
    ('canon','isaiah',65,8,'canon','romans',9,29,'free',
      E'*And as Esaias said before, Except Yahuah (Lord) of Sabaoth had left us a seed, we had been as Sodoma, and been made like unto Gomorrha* (Romans 9:29). The *blessing... in it* that spares the cluster (Isaiah 65:8) is the *seed* left — without which the people would be as Sodom. The servants spared for the blessing within them are the seed kept by Yahuah''s own faithfulness.'),
    ('canon','isaiah',65,9,'canon','romans',11,5,'free',
      E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). *I will bring forth a seed out of Jacob... and mine elect shall inherit it, and my servants shall dwell there* (Isaiah 65:9). The seed out of Jacob, *mine elect*, is the remnant according to the election of grace — the elect that inherit the mountains, the servants that dwell in the land.'),

    -- THREAD 3 (★★): Call his servants by another name (the divide by conduct; the new name)
    ('canon','isaiah',65,15,'canon','isaiah',62,2,'free',
      E'*And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2). *Ye shall leave your name for a curse unto my chosen... and call his servants by another name* (Isaiah 65:15) — the faithless leave their name for a curse, but the servants receive the *new name, which the mouth of Yahuah shall name*. The divide is by conduct: the curse-name and the new name marking the faithless and the faithful within the one people.'),
    ('canon','isaiah',65,15,'canon','revelation',2,17,'free',
      E'*To him that overcometh will I give to eat of the hidden manna, and will give him a white stone, and in the stone a new name written, which no man knoweth saving he that receiveth it* (Revelation 2:17). *Call his servants by another name* (Isaiah 65:15) is carried forward to the overcomer''s *new name written* in the white stone — the servants of Yahuah marked with the name no man knows but he that receives it, the faithful renamed.'),
    ('canon','isaiah',65,15,'canon','revelation',3,12,'free',
      E'*I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem, which cometh down out of heaven from my Elohim (God): and I will write upon him my new name* (Revelation 3:12). The promise to *call his servants by another name* (Isaiah 65:15) is fulfilled when the overcomer is written with the name of Elohim and *my new name* and the name of the new Jerusalem — the servants named with the name of the new-creation city.'),

    -- THREAD 4 (★★★): Behold, I create new heavens and a new earth (THE keystone — the new creation)
    ('canon','isaiah',65,17,'canon','2-peter',3,13,'free',
      E'*Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13). *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17) — Peter names this very promise as the hope of the people: *new heavens and a new earth, wherein dwelleth righteousness*. The keystone of Isaiah is the consummation the apostles look for.'),
    ('canon','isaiah',65,17,'canon','revelation',21,1,'free',
      E'*And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea* (Revelation 21:1). *Behold, I create new heavens and a new earth: and the former shall not be remembered* (Isaiah 65:17) — John sees the prophet''s word come: *a new heaven and a new earth*, the *first... passed away*. The creating of Isaiah 65 is the seeing of Revelation 21; the former remembered no more.'),
    ('canon','isaiah',65,17,'canon','revelation',21,4,'free',
      E'*And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4). *The former shall not be remembered, nor come into mind* (Isaiah 65:17) — the former things that pass from memory in Isaiah are the *former things... passed away* in John: death, sorrow, crying, and pain all gone in the new creation.'),
    ('canon','isaiah',65,17,'canon','isaiah',66,22,'free',
      E'*For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain* (Isaiah 66:22). *I create new heavens and a new earth* (Isaiah 65:17) — and the very next chapter seals their permanence: the new heavens and new earth *shall remain*, and with them *your seed and your name*. The new creation endures, and the seed-of-promise line and the name endure with it.'),
    ('canon','isaiah',65,17,'enoch','1-enoch',45,4,'extras',
      E'*And on that day I will cause Mine Elect One to dwell among them, and I will change the heaven and the earth and the light and the darkness, and I will make the earth a thing of light* (1 Enoch 45:4). *For, behold, I create new heavens and a new earth* (Isaiah 65:17) — the restored apocalyptic witness sings the same renewal: the heaven and the earth *changed*, the earth made *a thing of light*, the Elect One dwelling among his people. The new creation of the prophet is the new age of the parables.'),

    -- THREAD 5 (★★): I create Jerusalem a rejoicing (the New Jerusalem, weeping no more)
    ('canon','isaiah',65,18,'canon','revelation',21,2,'free',
      E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). *I create Jerusalem a rejoicing, and her people a joy* (Isaiah 65:18) — the rejoicing city Yahuah creates is the *holy city, new Jerusalem* John sees come down, *prepared as a bride*. The created joy of Isaiah is the descending bride-city of Revelation.'),
    ('canon','isaiah',65,19,'canon','revelation',21,4,'free',
      E'*And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying* (Revelation 21:4). *The voice of weeping shall be no more heard in her, nor the voice of crying* (Isaiah 65:19) — the weeping silenced in Isaiah''s new Jerusalem is the *no more... crying* of John''s, every tear wiped away. The end of weeping is the same promise in both.'),
    ('canon','isaiah',65,19,'canon','isaiah',25,8,'free',
      E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away* (Isaiah 25:8). *The voice of weeping shall be no more heard in her, nor the voice of crying* (Isaiah 65:19) — the weeping ends because *He will swallow up death in victory* and *wipe away tears from off all faces*. The rejoicing city is the city where death itself is swallowed up and the rebuke of the people taken away.'),

    -- THREAD 6 (★): They shall build houses and inhabit them (the Eden / Deuteronomy-28 curse reversed)
    ('canon','isaiah',65,21,'canon','genesis',3,17,'free',
      E'*And unto Adam he said... cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). *They shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them* (Isaiah 65:21) — the new creation lifts the Eden sentence: the ground cursed and eaten in sorrow becomes the vineyard planted and the fruit eaten in peace. The curse of the ground is reversed for the seed of the blessed of Yahuah.'),
    ('canon','isaiah',65,23,'canon','genesis',3,19,'free',
      E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). *They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD)* (Isaiah 65:23) — the labour-in-vain, the bread in the sweat of the face, is the Eden curse; in the new creation the seed of the blessed *shall not labour in vain*, the toil under the sun undone.'),
    ('canon','isaiah',65,21,'canon','amos',9,14,'free',
      E'*And I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof* (Amos 9:14). *They shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them* (Isaiah 65:21) — Amos sings the same regathering: the captivity brought again, the waste cities built and inhabited, the vineyards planted and their wine drunk. The build-and-inhabit promise is the two-house restoration.'),

    -- THREAD 7 (★★): The wolf and the lamb shall feed together (the messianic-kingdom peace; the serpent's dust)
    ('canon','isaiah',65,25,'canon','isaiah',11,9,'free',
      E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). *They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD)* (Isaiah 65:25) — the closing line is Isaiah 11 word for word, binding the new-creation peace to the kingdom of the Branch from Jesse; the holy mountain where nothing hurts nor destroys.'),
    ('canon','isaiah',65,25,'canon','isaiah',11,6,'free',
      E'*The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them* (Isaiah 11:6). *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock* (Isaiah 65:25) — the same reconciled creation of the messianic kingdom: predator and prey at peace, the lion eating straw. The peace of the Branch (Isaiah 11) is the peace of the new creation (Isaiah 65).'),
    ('canon','isaiah',65,25,'canon','genesis',3,14,'free',
      E'*And Yahuah Elohim (the LORD God) said unto the serpent... upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life* (Genesis 3:14). *And dust shall be the serpent''s meat* (Isaiah 65:25) — even in the kingdom-peace the serpent alone keeps his sentence: dust for his meat. The curse of Eden is lifted from all creation but the serpent of the enmity (Genesis 3:15), whose head is bruised at last.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa65_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa65_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-65-i-am-found-of-them-that-sought-me-not',
       E'I am found of them that sought me not — the house found, the rebellious house borne with',
       E'Yahuah answers the prayer of chapter 64 first with a word of finding and a word of long-suffering: *I am sought of them that asked not for me; I am found of them that sought me not: I said, Behold me, behold me, unto a nation that was not called by my name. I have spread out my hands all the day unto a rebellious people, which walketh in a way that was not good, after their own thoughts* (Isaiah 65:1-2). Paul quotes BOTH verses word for word: *But Esaias is very bold, and saith, I was found of them that sought me not; I was made manifest unto them that asked not after me. But to Yashar''el (Israel) he saith, All day long I have stretched forth my hands unto a disobedient and gainsaying people* (Romans 10:20-21). Read the two-house weave with care. v.1 is the FINDING of those who *asked not* — the wild-olive branches of Yashar''el (Israel) grown wild among the nations, the scattered house brought home, *a nation that was not called by my name* — NOT a new gentile people replacing Israel. Paul names them in the same breath through Hosea: *I will call them my people, which were not my people... there shall they be called the children of the living Elohim (God)* (Romans 9:25-26) — Lo-Ammi made Ammi. v.2 is the disobedient house, the *rebellious people* to whom the hands are *spread out all the day* — long-suffering, not rejection. And the guard is fixed firm: *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2). The finding of the one and the patience toward the other are two movements of mercy over the ONE covenant people — never a casting-off, never a replacement.',
       sv.verse_id, ev.verse_id, 'free', 27600
  FROM _s303_isa65_lookup sv, _s303_isa65_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=65 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-65-a-blessing-is-in-the-cluster-the-remnant-preserved',
       E'A blessing is in the cluster — the remnant preserved, the seed out of Jacob',
       E'Against the indictment of the rebellious house Yahuah sets the preserving of a remnant: *Thus saith Yahuah (LORD), As the new wine is found in the cluster, and one saith, Destroy it not; for a blessing is in it: so will I do for my servants'' sakes, that I may not destroy them all. And I will bring forth a seed out of Jacob, and out of Yahudah (Judah) an inheritor of my mountains: and mine elect shall inherit it, and my servants shall dwell there* (Isaiah 65:8-9). The blessing in the cluster is the remnant for whose sake the whole is not destroyed. Paul reads it exactly so: *Esaias also crieth concerning Yashar''el (Israel), Though the number of the children of Yashar''el (Israel) be as the sand of the sea, a remnant shall be saved* (Romans 9:27); *Except Yahuah (Lord) of Sabaoth had left us a seed, we had been as Sodoma, and been made like unto Gomorrha* (Romans 9:29). And he names it the heart of the matter in his own day: *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The seed out of Jacob, *mine elect*, is that remnant — the cluster not destroyed because of the blessing within it, the servants who inherit the mountains and dwell in the land.',
       sv.verse_id, ev.verse_id, 'free', 27603
  FROM _s303_isa65_lookup sv, _s303_isa65_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=65 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-65-call-his-servants-by-another-name',
       E'Call his servants by another name — the divide within the people, the new name',
       E'The chapter draws the covenant-lawsuit divide, and it runs through CONDUCT, never ethnicity: *But ye are they that forsake Yahuah (LORD), that forget my holy mountain... Therefore will I number you to the sword* (Isaiah 65:11-12) set against *Behold, my servants shall eat, but ye shall be hungry: behold, my servants shall drink, but ye shall be thirsty... Behold, my servants shall sing for joy of heart, but ye shall cry for sorrow of heart* (65:13-14). The faithful and the faithless stand WITHIN the one people — the faithless are victims of the lie they inherited, never enemies to be hated. And the faithless *shall leave your name for a curse unto my chosen: for Adonai Yahuah (the Lord GOD) shall slay thee, and call his servants by another name* (65:15) — *because the former troubles are forgotten* (65:16). The new name is Isaiah''s own promise to Zion: *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2). And John carries it to the consummation: *I will give him a white stone, and in the stone a new name written, which no man knoweth saving he that receiveth it* (Revelation 2:17); *I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem... and I will write upon him my new name* (Revelation 3:12). The servants of Yahuah are renamed with the name of the new-creation city; the faithless leave only a name for a curse.',
       sv.verse_id, ev.verse_id, 'free', 27606
  FROM _s303_isa65_lookup sv, _s303_isa65_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=65 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-65-behold-i-create-new-heavens-and-a-new-earth',
       E'Behold, I create new heavens and a new earth — the keystone of the new creation',
       E'Here is the keystone toward which the whole framework runs: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17). Peter names this very promise as the hope of the people: *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13). John sees it come: *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea* (Revelation 21:1) — and *the former things are passed away* (Revelation 21:4), the very *former* that *shall not be remembered, nor come into mind*. Isaiah himself seals its permanence in the next chapter: *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain* (Isaiah 66:22) — the new creation endures, and the seed-of-promise line and the name endure with it. And the restored apocalyptic witness sings the same renewal: *And on that day I will cause Mine Elect One to dwell among them, and I will change the heaven and the earth and the light and the darkness, and I will make the earth a thing of light* (1 Enoch 45:4). The Father is the formless Source; the Elect One dwelling among his people is the Formed Son. The creating of Isaiah, the looking-for of Peter, the seeing of John, the changing of the parables — one new creation, the consummation of all the promises.',
       sv.verse_id, ev.verse_id, 'extras', 27609
  FROM _s303_isa65_lookup sv, _s303_isa65_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=65 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-65-i-create-jerusalem-a-rejoicing',
       E'I create Jerusalem a rejoicing — the New Jerusalem, the voice of weeping no more',
       E'The new creation is no abstraction but a city full of joy: *But be ye glad and rejoice for ever in that which I create: for, behold, I create Jerusalem a rejoicing, and her people a joy. And I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard in her, nor the voice of crying* (Isaiah 65:18-19). John sees the rejoicing city descend: *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2), the city where *Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying* (Revelation 21:4). The weeping silenced in Isaiah''s Jerusalem is the *no more... crying* of John''s. And Isaiah''s own earlier word is the ground of it: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away* (Isaiah 25:8). The voice of weeping ends because death itself is swallowed up and every tear is wiped away — *and it shall come to pass, that before they call, I will answer; and while they are yet speaking, I will hear* (Isaiah 65:24). The created joy is for ever.',
       sv.verse_id, ev.verse_id, 'free', 27612
  FROM _s303_isa65_lookup sv, _s303_isa65_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=65 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-65-they-shall-build-houses-and-inhabit-them',
       E'They shall build houses, and inhabit them — the curse of Eden reversed',
       E'In the new creation the curse laid on the ground at Eden is lifted: *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them. They shall not build, and another inhabit; they shall not plant, and another eat... They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:21-23). The labour-in-vain, the eating in sorrow, the toil that another reaps, is the Eden sentence on Adam: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17); *In the sweat of thy face shalt thou eat bread, till thou return unto the ground* (Genesis 3:19). In the new creation the ground is no longer cursed against the seed of the blessed — they build and inhabit, plant and eat, *not labour in vain*. And the regathering-language is Amos''s own: *I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof* (Amos 9:14). The build-and-inhabit promise is the two-house restoration; *they are the seed of the blessed of Yahuah*, the seed-of-promise line whose curse is undone at last.',
       sv.verse_id, ev.verse_id, 'free', 27615
  FROM _s303_isa65_lookup sv, _s303_isa65_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=65 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-65-the-wolf-and-the-lamb-shall-feed-together',
       E'The wolf and the lamb shall feed together — the kingdom-peace, the serpent''s dust',
       E'The chapter closes on the peace of the messianic kingdom: *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent''s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD)* (Isaiah 65:25). The closing line is Isaiah 11 WORD FOR WORD: *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9) — binding the new-creation peace to the kingdom of the Branch from Jesse, *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid... and a little child shall lead them* (Isaiah 11:6). Predator and prey reconciled, the lion eating straw, nothing that hurts nor destroys in the holy mountain. And one creature alone keeps his ancient sentence: *and dust shall be the serpent''s meat* — the curse of Eden standing on the serpent, *upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life* (Genesis 3:14). All creation is at peace and the curse is lifted from everything but the serpent of the enmity (Genesis 3:15), whose head is bruised at the last; the dust he was given to eat is the dust he keeps eating in the kingdom that has no place for him.',
       sv.verse_id, ev.verse_id, 'free', 27618
  FROM _s303_isa65_lookup sv, _s303_isa65_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=65 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I was found of them that sought me not; I was made manifest unto them that asked not after me* (Romans 10:20) — Paul quotes Isaiah 65:1 word for word; the house that asked not, found.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=1
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-am-found-of-them-that-sought-me-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *All day long I have stretched forth my hands unto a disobedient and gainsaying people* (Romans 10:21) — Paul quotes Isaiah 65:2 word for word; the rebellious house borne with all day.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=2
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-am-found-of-them-that-sought-me-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I will call them my people, which were not my people* (Romans 9:25) — the nation not called by Yahuah''s name (Isaiah 65:1) is Lo-Ammi made Ammi, the scattered house renamed.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=1
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-am-found-of-them-that-sought-me-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*there shall they be called the children of the living Elohim (God)* (Romans 9:26) — those found who sought not (Isaiah 65:1) are the once-not-my-people now called children; the two-house finding.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=1
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-am-found-of-them-that-sought-me-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the hands spread all day to the rebellious (Isaiah 65:2) are patience, not rejection; the replacement-reading guard.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=2
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-am-found-of-them-that-sought-me-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — the all-day stretched hands (Isaiah 65:2) prove the foreknown people are not cast away.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=2
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-am-found-of-them-that-sought-me-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *a remnant shall be saved* (Romans 9:27) — the blessing in the cluster spared for the servants'' sakes (Isaiah 65:8) is Paul''s remnant saved out of the multitude.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=8
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-a-blessing-is-in-the-cluster-the-remnant-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Except Yahuah (Lord) of Sabaoth had left us a seed* (Romans 9:29) — the cluster not destroyed for the blessing in it (Isaiah 65:8) is the seed left, without which the people were as Sodom.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=8
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-a-blessing-is-in-the-cluster-the-remnant-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *a remnant according to the election of grace* (Romans 11:5) — the seed out of Jacob, mine elect (Isaiah 65:9), is the remnant chosen by grace, inheriting the mountains.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=9
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-a-blessing-is-in-the-cluster-the-remnant-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2) — the servants called by another name (Isaiah 65:15) receive Zion''s promised new name.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=15
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-call-his-servants-by-another-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *a new name written, which no man knoweth saving he that receiveth it* (Revelation 2:17) — call his servants by another name (Isaiah 65:15) carried to the overcomer''s new name in the white stone.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=15
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-call-his-servants-by-another-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will write upon him... the name of the city of my Elohim (God), which is new Jerusalem... and my new name* (Revelation 3:12) — the servants'' another name (Isaiah 65:15) is the new-creation city''s name.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=15
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-call-his-servants-by-another-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *we... look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13) — the apostles'' hope is the very promise Yahuah declares (Isaiah 65:17).'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=17
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-behold-i-create-new-heavens-and-a-new-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away* (Revelation 21:1) — John sees the creating of Isaiah 65:17 come.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=17
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-behold-i-create-new-heavens-and-a-new-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *for the former things are passed away* (Revelation 21:4) — the former not remembered nor come into mind (Isaiah 65:17) is John''s former things passed away.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=17
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-behold-i-create-new-heavens-and-a-new-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the new heavens and the new earth... shall remain... so shall your seed and your name remain* (Isaiah 66:22) — the new creation of 65:17 endures, and the seed and name with it.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=17
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-behold-i-create-new-heavens-and-a-new-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will change the heaven and the earth... and I will make the earth a thing of light* (1 Enoch 45:4) — the restored witness sings the same renewal as I create new heavens and a new earth (Isaiah 65:17).'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=17
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=45 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-behold-i-create-new-heavens-and-a-new-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride* (Revelation 21:2) — the Jerusalem created a rejoicing (Isaiah 65:18) is John''s descending bride-city.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=18
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-create-jerusalem-a-rejoicing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Elohim (God) shall wipe away all tears... no more death, neither sorrow, nor crying* (Revelation 21:4) — the voice of weeping no more heard (Isaiah 65:19) is John''s no more crying.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=19
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-create-jerusalem-a-rejoicing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8) — the weeping ends (Isaiah 65:19) because death is swallowed up and tears wiped away.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=19
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-i-create-jerusalem-a-rejoicing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *cursed is the ground for thy sake; in sorrow shalt thou eat of it* (Genesis 3:17) — the build-and-inhabit, plant-and-eat (Isaiah 65:21) reverses the Eden curse on the ground.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=21
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-they-shall-build-houses-and-inhabit-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *In the sweat of thy face shalt thou eat bread* (Genesis 3:19) — they shall not labour in vain (Isaiah 65:23) lifts the toil-in-sweat of the Eden sentence.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=23
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-they-shall-build-houses-and-inhabit-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they shall build the waste cities, and inhabit them; and they shall plant vineyards* (Amos 9:14) — the build-and-inhabit promise (Isaiah 65:21) is Amos''s two-house regathering.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=21
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-they-shall-build-houses-and-inhabit-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *They shall not hurt nor destroy in all my holy mountain* (Isaiah 11:9) — Isaiah 65:25 closes with Isaiah 11 verbatim; the new-creation peace bound to the kingdom of the Branch.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=25
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-the-wolf-and-the-lamb-shall-feed-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid* (Isaiah 11:6) — the wolf and lamb feeding together (Isaiah 65:25) is the reconciled creation of the messianic kingdom.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=25
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-the-wolf-and-the-lamb-shall-feed-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life* (Genesis 3:14) — dust the serpent''s meat (Isaiah 65:25) is the Eden curse standing on the serpent alone.'
  FROM cross_reference_threads t
  JOIN _s303_isa65_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=65 AND sv.verse_number=25
  JOIN _s303_isa65_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-65-the-wolf-and-the-lamb-shall-feed-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_isaiah_66.sql (Isaiah 66) -----
-- Chapter: Isaiah 66 — THE BOOK'S CLIMAX. Heaven is Yahuah's throne and the earth his footstool;
-- no house can contain him, but he looks to *him that is poor and of a contrite spirit, and
-- trembleth at my word* (66:1-2) — Stephen quotes it against temple-presumption (Acts 7:49-50);
-- the contrite-and-trembling heart is the true worshipper (Isaiah 57:15; Matthew 5:3; Psalm 51:17).
-- Ritual without obedience is abhorred (66:3-4 — *he that killeth an ox is as if he slew a man*),
-- the exposure of heartless sacrifice, never its abolition (1 Samuel 15:22; Hosea 6:6; Isaiah
-- 1:11). The persecuted remnant — *your brethren that hated you, that cast you out for my name's
-- sake* — shall appear to joy while the persecutors are ashamed (66:5; John 16:2). Then the great
-- birth: *as soon as Zion travailed, she brought forth her children... shall a nation be born at
-- once?* (66:7-9) — the restored two-house nation born in a day (Revelation 12:2,5; John 16:21;
-- Galatians 4:27). The maternal comfort of restored Jerusalem (66:10-14 — *as one whom his mother
-- comforteth, so will I comfort you... your bones shall flourish*) is the comfort-ye of Isaiah 40,
-- the mother-love of Isaiah 49, the New-Jerusalem mother (Galatians 4:26; Revelation 21:2), the
-- bones-flourish of the two-house resurrection (Ezekiel 37). Then Yahuah comes *with fire... by
-- fire and by his sword will Yahuah plead with all flesh* (66:15-16) — the fiery judgment executed
-- by the Formed Son (2 Thessalonians 1:7-8; Revelation 19:15; Malachi 4:1; 2 Peter 3:7; 1 Enoch
-- 1:9; 45:5). The two-house INGATHERING of all nations and tongues, the scattered brethren brought
-- home, *and I will also take of them for priests and for Levites* (66:18-21; Revelation 7:9;
-- Zechariah 8:23; Romans 15:10; Isaiah 61:6; 1 Peter 2:9; Romans 11:2 guard). And THE
-- anti-antinomian climax: *as the new heavens and the new earth... shall remain... so shall your
-- seed and your name remain. And it shall come to pass, that... from one sabbath to another, shall
-- all flesh come to worship before me* (66:22-23) — the new moons AND sabbaths KEPT BY ALL FLESH in
-- the new creation (Isaiah 65:17; 2 Peter 3:13; Revelation 21:1; Zechariah 14:16; Colossians
-- 2:16-17; 1 John 2:3; 1 Enoch 45:4). The book ends on the rebels' final state, quoted verbatim by
-- Yahusha: *their worm shall not die* (66:24; Mark 9:48; Daniel 12:2).
-- Tag: isa66   Temp view: _s303_isa66_lookup
-- Sort band: base 27625, step 3 -> threads at 27625, 27628, 27631, 27634, 27637, 27640, 27643, 27646 (8 threads)
-- Source of EVERY row: 'canon','isaiah',66,v
--
-- Isaiah 66 coverage:
--   ★★ v.1-2 (The heaven is my throne, and the earth is my footstool... but to this man will I look,
--          even to him that is poor and of a contrite spirit, and trembleth at my word)
--        NT:     ★★ Acts 7:49 + Acts 7:50 (Stephen quotes it verbatim against temple-presumption) +
--                Matthew 5:3 (Blessed are the poor in spirit) — THREAD 1
--        Extras: none warranted (no clean throne/contrite-heart witness adds beyond the canon weave)
--        Tanakh: ★★ Isaiah 57:15 (the high and lofty One... with him that is of a contrite and humble
--                spirit) + Psalm 51:17 (a broken and a contrite heart, O Elohim, thou wilt not despise) — THREAD 1
--   ★ v.3-4 (He that killeth an ox is as if he slew a man... they have chosen their own ways)
--        NT:     none warranted (the obedience-above-sacrifice weave is the prophets' own; no clean NT add)
--        Tanakh: ★ 1 Samuel 15:22 (to obey is better than sacrifice) + Hosea 6:6 (I desired mercy,
--                and not sacrifice) + Isaiah 1:11 (the multitude of your sacrifices... I delight not) — THREAD 2
--        Extras: none warranted
--   ★★ v.5 (Your brethren that hated you, that cast you out for my name's sake... but he shall appear
--          to your joy, and they shall be ashamed)
--        NT:     ★★ John 16:2 (They shall put you out of the synagogues) — THREAD 3
--        Extras: none warranted
--        Tanakh: woven (the persecuted-remnant motif; held in THREAD 3 prose, no separate Tanakh add forced)
--   ★ v.6 (A voice of noise from the city... that rendereth recompence to his enemies) — preface to the
--        recompence of THREAD 6 (the fiery judgment); woven there, no separate add.
--   ★★★ v.7-9 (Before she travailed, she brought forth... shall a nation be born at once? for as soon
--          as Zion travailed, she brought forth her children)
--        NT:     ★★★ Revelation 12:2 (she being with child cried, travailing in birth) + Revelation 12:5
--                (she brought forth a man child... caught up unto Elohim) + John 16:21 (a woman when she
--                is in travail... for joy that a man is born) + Galatians 4:27 (the desolate hath many
--                more children) — THREAD 4
--        Extras: none warranted
--        Tanakh: woven (Zion's birth = the regathered nation; the prophets' own; in prose)
--   ★★ v.10-14 (Rejoice ye with Jerusalem... that ye may suck, and be satisfied with the breasts of her
--          consolations... As one whom his mother comforteth, so will I comfort you... your bones shall
--          flourish)
--        NT:     ★★ Galatians 4:26 (Jerusalem which is above... the mother of us all) + Revelation 21:2
--                (the holy city, new Jerusalem... as a bride) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 40:1 (Comfort ye, comfort ye my people) + Isaiah 49:15 (Can a woman forget
--                her sucking child) + ★ Ezekiel 37:14 (I shall put my spirit in you, and ye shall live —
--                your bones shall flourish, the two-house resurrection-figure) — THREAD 5
--   ★★★ v.15-16 (Yahuah will come with fire... by fire and by his sword will Yahuah plead with all flesh)
--        + v.24 (their worm shall not die, neither shall their fire be quenched)
--        NT:     ★★★ 2 Thessalonians 1:7 + 2 Thessalonians 1:8 (the Lord Yahusha revealed from heaven...
--                in flaming fire) + Revelation 19:15 (out of his mouth a sharp sword... the winepress of
--                wrath) + ★ Mark 9:48 (Where their worm dieth not — Yahusha quotes v.24 verbatim) — THREAD 6
--        Extras: ★ 1 Enoch 1:9 (He cometh with ten thousands of His set-apart ones to execute judgement
--                upon all... to convict all flesh) + 1 Enoch 45:5 (the sinners... shall burn... and they
--                shall not be quenched) — THREAD 6
--        Tanakh: ★★ Malachi 4:1 (the day cometh, that shall burn as an oven) + 2 Peter 3:7 (reserved
--                unto fire) + Daniel 12:2 (some to shame and everlasting contempt — the v.24 final state) — THREAD 6
--   v.17 (they that sanctify themselves... eating swine's flesh... shall be consumed) — the dietary
--        rebellion judged with the fire of v.15-16; woven into THREAD 6 prose, no separate add.
--   ★★★ v.18-21 (I will gather all nations and tongues... and they shall declare my glory among the
--          Gentiles... they shall bring all your brethren for an offering... I will also take of them for
--          priests and for Levites)
--        NT:     ★★★ Revelation 7:9 (a great multitude... of all nations, and kindreds, and people, and
--                tongues) + Romans 15:10 (Rejoice, ye Gentiles, with his people) + ★ 1 Peter 2:9 (a royal
--                priesthood... a peculiar people) + Romans 11:2 GUARD (Elohim hath not cast away his
--                people) — THREAD 7
--        Extras: none warranted (1 Enoch 90 gathering parses to the bull/sheep allegory, not a clean
--                all-nations-and-tongues witness; held in prose)
--        Tanakh: ★★ Zechariah 8:23 (ten men... shall take hold of the skirt of him that is a Yahudi) +
--                ★ Isaiah 61:6 (ye shall be named the Priests of Yahuah — the restored priesthood) — THREAD 7
--   ★★★ v.22-23 (as the new heavens and the new earth... shall remain... so shall your seed and your
--          name remain... from one new moon to another, and from one sabbath to another, shall all
--          flesh come to worship before me)
--        NT:     ★★★ Revelation 21:1 (a new heaven and a new earth) + ★★ Colossians 2:16 +
--                Colossians 2:17 (let no man judge you... of the sabbath days... the body is of Messiah)
--                + ★ 1 John 2:3 FILTER (we know him, if we keep his commandments) + 2 Peter 3:13 (new
--                heavens and a new earth, wherein dwelleth righteousness) — THREAD 8
--        Extras: ★ 1 Enoch 45:4 (I will change the heaven and the earth... and make the earth a thing
--                of light) — THREAD 8
--        Tanakh: ★★★ Isaiah 65:17 (I create new heavens and a new earth) + ★★ Zechariah 14:16 (all the
--                nations... go up from year to year... to keep the feast of tabernacles) — THREAD 8
--
-- Threads (slug — target libraries):
--   1. isaiah-66-the-heaven-is-my-throne-and-the-earth-my-footstool — NT (Acts 7, Matthew 5) + Tanakh (Isaiah 57, Psalm 51) [free]
--      (★★ no house contains Yahuah; he looks to the poor/contrite/trembling-at-the-word heart — Stephen quotes it vs temple-presumption; NOT anti-temple)
--   2. isaiah-66-he-that-killeth-an-ox-is-as-if-he-slew-a-man — Tanakh (1 Samuel 15, Hosea 6, Isaiah 1) [free]
--      (★ ritual without obedience abhorred = obedience-above-empty-sacrifice; the exposure of heartless ritual, NOT abolition of offerings)
--   3. isaiah-66-they-cast-you-out-for-my-names-sake — NT (John 16) [free]
--      (★★ the persecuted remnant; cast out for the Name shall appear to joy, the persecutors ashamed; victims-not-enemies, conduct not ethnicity)
--   4. isaiah-66-as-soon-as-zion-travailed-she-brought-forth-her-children — NT (Revelation 12, John 16, Galatians 4) [free]
--      (★★★ Zion's birth-pangs bring forth the nation/children at once = the restored two-house people born in a day)
--   5. isaiah-66-as-one-whom-his-mother-comforteth-so-will-i-comfort-you — NT (Galatians 4, Revelation 21) + Tanakh (Isaiah 40, Isaiah 49, Ezekiel 37) [free]
--      (★★ the maternal comfort of restored Jerusalem; suck at her consolations; your bones shall flourish = the two-house resurrection-figure)
--   6. isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh — NT (2 Thessalonians 1, Revelation 19, Mark 9) + Extras (1 Enoch 1, 1 Enoch 45) + Tanakh (Malachi 4, 2 Peter 3, Daniel 12) [extras]
--      (★★★ Yahuah comes with fire to plead with all flesh, executed by the Formed Son; the rebels' worm-dieth-not final state, quoted verbatim by Yahusha)
--   7. isaiah-66-i-will-gather-all-nations-and-tongues — NT (Revelation 7, Romans 15, 1 Peter 2, Romans 11) + Tanakh (Zechariah 8, Isaiah 61) [free]
--      (★★★ the two-house ingathering of all nations/tongues, the scattered brethren brought home, the restored priesthood; NOT replacement, Romans 11 guard)
--   8. isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship — NT (Revelation 21, Colossians 2, 1 John 2, 2 Peter 3) + Extras (1 Enoch 45) + Tanakh (Isaiah 65, Zechariah 14) [extras]
--      (★★★ THE anti-antinomian climax: new moons AND sabbaths kept by all flesh in the new creation; the appointed times continue into eternity; the seed and name remain = two-house permanence)
--
-- Framing notes:
--   ★★ THE HEAVEN IS MY THRONE (THREAD 1): *Thus saith Yahuah (LORD), The heaven is my throne, and
--      the earth is my footstool: where is the house that ye build unto me?... but to this man will
--      I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (66:1-2).
--      Stephen quotes it verbatim against temple-presumption — *Heaven is my throne, and earth is my
--      footstool: what house will ye build me?* (Acts 7:49); *Hath not my hand made all these
--      things?* (Acts 7:50). This is NOT anti-temple; it is anti-presumption: the worshipper Yahuah
--      regards is the contrite, the *poor in spirit* (Matthew 5:3), the one who trembles at the word.
--      Isaiah said it before: *I dwell in the high and holy place, with him also that is of a contrite
--      and humble spirit* (Isaiah 57:15); and David: *a broken and a contrite heart, O Elohim (God),
--      thou wilt not despise* (Psalm 51:17).
--   ★ HE THAT KILLETH AN OX (THREAD 2): *He that killeth an ox is as if he slew a man; he that
--      sacrificeth a lamb, as if he cut off a dog's neck... Yea, they have chosen their own ways*
--      (66:3). The sacrifice of the rebel heart is abhorred — NOT because offerings are abolished but
--      because obedience must come first: *to obey is better than sacrifice* (1 Samuel 15:22); *I
--      desired mercy, and not sacrifice* (Hosea 6:6); *the multitude of your sacrifices... I delight
--      not* (Isaiah 1:11). The exposure of heartless ritual, the prophets' constant refrain.
--   ★★ CAST OUT FOR MY NAME'S SAKE (THREAD 3): *Hear the word of Yahuah (LORD), ye that tremble at
--      his word; Your brethren that hated you, that cast you out for my name's sake, said, Let Yahuah
--      (LORD) be glorified: but he shall appear to your joy, and they shall be ashamed* (66:5). The
--      persecuted remnant — the very ones who tremble at the word — are cast out by their own
--      brethren; Yahusha names the same hour: *They shall put you out of the synagogues: yea, the
--      time cometh, that whosoever killeth you will think that he doeth Elohim (God) service* (John
--      16:2). Victims, not enemies; the line is conduct, not ethnicity — the persecutors are exposed,
--      the persecuted vindicated to joy.
--   ★★★ ZION TRAVAILED, SHE BROUGHT FORTH (THREAD 4): *Before she travailed, she brought forth...
--      Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as
--      soon as Zion travailed, she brought forth her children* (66:7-8). The restored nation born at
--      once — the two-house people brought forth in a day. John sees the woman in travail: *she being
--      with child cried, travailing in birth* (Revelation 12:2); *she brought forth a man child...
--      caught up unto Elohim (God)* (12:5). Yahusha names the birth-pang joy: *as soon as she is
--      delivered of the child, she remembereth no more the anguish, for joy that a man is born into
--      the world* (John 16:21). And Paul: *the desolate hath many more children than she which hath
--      an husband* (Galatians 4:27). Zion's travail brings forth the multiplied children of promise.
--   ★★ AS ONE WHOM HIS MOTHER COMFORTETH (THREAD 5): *Rejoice ye with Jerusalem... that ye may suck,
--      and be satisfied with the breasts of her consolations... As one whom his mother comforteth, so
--      will I comfort you; and ye shall be comforted in Jerusalem* (66:10-13); *your bones shall
--      flourish like an herb* (66:14). The maternal comfort of restored Jerusalem — the comfort-ye of
--      *Comfort ye, comfort ye my people* (Isaiah 40:1), the mother-love of *Can a woman forget her
--      sucking child... yet will I not forget thee* (Isaiah 49:15). She is the New-Jerusalem mother:
--      *Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26); *the holy
--      city, new Jerusalem... prepared as a bride* (Revelation 21:2). And the bones-flourish is the
--      two-house resurrection-figure: *I shall put my spirit in you, and ye shall live, and I shall
--      place you in your own land* (Ezekiel 37:14).
--   ★★★ BY FIRE WILL YAHUAH PLEAD WITH ALL FLESH (THREAD 6): *For, behold, Yahuah (LORD) will come
--      with fire, and with his chariots like a whirlwind, to render his anger with fury... For by
--      fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD)
--      shall be many* (66:15-16). The Formed Son is the executor: *when the Lord Yahusha (Lord Jesus)
--      shall be revealed from heaven with his mighty angels* (2 Thessalonians 1:7), *In flaming fire
--      taking vengeance* (1:8); *out of his mouth goeth a sharp sword... he treadeth the winepress of
--      the fierceness and wrath* (Revelation 19:15). The day burns as an oven (Malachi 4:1); the
--      heavens are *reserved unto fire* (2 Peter 3:7). 1 Enoch sings the same coming: *He cometh with
--      ten thousands of His set-apart ones To execute judgement upon all... And to convict all flesh*
--      (1 Enoch 1:9); *the sinners... shall burn before the face of the holy, and they shall not be
--      quenched* (45:5). And the book's last verse, quoted verbatim by Yahusha, fixes the rebels'
--      final state: *their worm shall not die, neither shall their fire be quenched* (66:24); *Where
--      their worm dieth not, and the fire is not quenched* (Mark 9:48); *some to shame and everlasting
--      contempt* (Daniel 12:2). (v.17, the swine's-flesh rebels, are the *all flesh* this fire pleads
--      against — the dietary rebellion judged, not licensed.)
--   ★★★ I WILL GATHER ALL NATIONS AND TONGUES (THREAD 7): *it shall come, that I will gather all
--      nations and tongues; and they shall come, and see my glory... and I will send those that
--      escape of them unto the nations... and they shall declare my glory among the Gentiles. And they
--      shall bring all your brethren for an offering unto Yahuah (LORD) out of all nations... And I
--      will also take of them for priests and for Levites* (66:18-21). The two-house ingathering: John
--      sees *a great multitude, which no man could number, of all nations, and kindreds, and people,
--      and tongues* (Revelation 7:9); Paul: *Rejoice, ye Gentiles, with his people* (Romans 15:10).
--      The scattered brethren brought home; the restored priesthood — *ye shall be named the Priests
--      of Yahuah (LORD)* (Isaiah 61:6), *a royal priesthood... a peculiar people* (1 Peter 2:9) — and
--      the nations laying hold: *ten men shall take hold... of the skirt of him that is a Yahudi (Jew)*
--      (Zechariah 8:23). This is restoration, NOT replacement — the guard stands: *Elohim (God) hath
--      not cast away his people which he foreknew* (Romans 11:2).
--   ★★★ FROM ONE SABBATH TO ANOTHER, ALL FLESH WORSHIP (THREAD 8): *For as the new heavens and the
--      new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed
--      and your name remain. And it shall come to pass, that from one new moon to another, and from
--      one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)*
--      (66:22-23). THE anti-antinomian climax: the new moons AND the sabbaths are KEPT BY ALL FLESH in
--      the new creation — the appointed times are not abolished, they continue into eternity. The new
--      heavens: *behold, I create new heavens and a new earth* (Isaiah 65:17); *I saw a new heaven and
--      a new earth* (Revelation 21:1); *new heavens and a new earth, wherein dwelleth righteousness*
--      (2 Peter 3:13); 1 Enoch: *I will change the heaven and the earth... and make the earth a thing
--      of light* (45:4). Zechariah confirms the kept feast: *every one that is left of all the nations
--      ... shall... go up from year to year to worship the King... and to keep the feast of
--      tabernacles* (Zechariah 14:16). Colossians is the shadow whose BODY remains, not abolished:
--      *Let no man therefore judge you... of the new moon, or of the sabbath days: Which are a shadow
--      of things to come; but the body is of Messiah (Christ)* (Colossians 2:16-17) — the shadow cast
--      by a body that is still there. The filter holds: *hereby we do know that we know him, if we
--      keep his commandments* (1 John 2:3). And the seed-and-name-remain is the two-house permanence.
--   VERSES WITH NO SEPARATE ADD: v.6 (the voice of recompence — preface to the fire of THREAD 6),
--      v.17 (the swine's-flesh rebels — the all-flesh judged in THREAD 6), v.9 (Shall I cause to bring
--      forth, and shut the womb? — the closing of the birth-question of THREAD 4), v.12 (peace like a
--      river / glory of the Gentiles — woven into the comfort of THREAD 5 and the ingathering of
--      THREAD 7). All recorded; none silently skipped. Extras weighed: 1 Enoch 90 (the gathering of
--      the sheep) held in prose, not a clean all-nations-and-tongues single-verse witness; 1 Enoch 1
--      and 45 used as MEMBERS where verbatim and clean; 2 Esdras new-heaven material not warranted
--      over Isaiah 65's own lateral.

CREATE TEMP VIEW _s303_isa66_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): The heaven is my throne — the poor and contrite who tremble at the word
    ('canon','isaiah',66,1,'canon','acts',7,49,'free',
      E'*Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* (Acts 7:49). Stephen quotes Isaiah 66:1 verbatim — *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest?* — against temple-presumption: *the El Elyon (most High) dwelleth not in temples made with hands* (Acts 7:48). No house contains Yahuah; the rebuke is of presumption, not of the temple.'),
    ('canon','isaiah',66,2,'canon','acts',7,50,'free',
      E'*Hath not my hand made all these things?* (Acts 7:50). *For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit* (Isaiah 66:2). Stephen carries the verse straight on: the Maker of all needs no house — what he regards is the contrite heart, not the building.'),
    ('canon','isaiah',66,2,'canon','matthew',5,3,'free',
      E'*Blessed are the poor in spirit: for theirs is the kingdom of heaven* (Matthew 5:3). *To this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2). The one Yahuah regards is the *poor in spirit* — the contrite, the trembling-at-the-word heart that the Beatitude opens upon; the kingdom belongs to exactly this man.'),
    ('canon','isaiah',66,2,'canon','isaiah',57,15,'free',
      E'*For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble* (Isaiah 57:15). The same lens within the book: the One whose throne is heaven (Isaiah 66:1) dwells *with him also that is of a contrite and humble spirit* — *to this man will I look... that... trembleth at my word* (66:2). The high and holy One stoops to the contrite.'),
    ('canon','isaiah',66,2,'canon','psalms',51,17,'free',
      E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). *To this man will I look, even to him that is poor and of a contrite spirit* (Isaiah 66:2). David named the only sacrifice Yahuah does not despise — *a broken and a contrite heart* — the very heart Isaiah says he looks to; the contrite spirit is the worship that no house can replace.'),

    -- THREAD 2 (★): He that killeth an ox — obedience above empty sacrifice
    ('canon','isaiah',66,3,'canon','1-samuel',15,22,'free',
      E'*And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). *He that killeth an ox is as if he slew a man... Yea, they have chosen their own ways* (Isaiah 66:3) — the sacrifice of the disobedient is abhorred, for *to obey is better than sacrifice*. Not the offering abolished, but the heartless offering exposed.'),
    ('canon','isaiah',66,3,'canon','hosea',6,6,'free',
      E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). *He that sacrificeth a lamb, as if he cut off a dog''s neck; he that offereth an oblation, as if he offered swine''s blood* (Isaiah 66:3) — when the heart has *chosen their own ways*, the sacrifice itself becomes abomination, for Yahuah *desired mercy, and not sacrifice*. The ritual without obedience is what is condemned.'),
    ('canon','isaiah',66,3,'canon','isaiah',1,11,'free',
      E'*To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams... and I delight not in the blood of bullocks, or of lambs, or of he goats* (Isaiah 1:11). The book opens and closes with the same word: the sacrifices of the rebellious heart are loathed — *he that offereth an oblation, as if he offered swine''s blood* (Isaiah 66:3). Not the abolition of offerings, but the exposure of offerings without obedience.'),

    -- THREAD 3 (★★): They cast you out for my name's sake — the persecuted remnant
    ('canon','isaiah',66,5,'canon','john',16,2,'free',
      E'*They shall put you out of the synagogues: yea, the time cometh, that whosoever killeth you will think that he doeth Elohim (God) service* (John 16:2). *Your brethren that hated you, that cast you out for my name''s sake, said, Let Yahuah (LORD) be glorified* (Isaiah 66:5) — the persecutors cast out the faithful while invoking Yahuah''s glory, exactly as Yahusha foretold: they *will think that he doeth Elohim (God) service*. The remnant that trembles at the word is the victim, and shall *appear to your joy, and they shall be ashamed*.'),

    -- THREAD 4 (★★★): Zion travailed, she brought forth her children — the nation born at once
    ('canon','isaiah',66,8,'canon','revelation',12,2,'free',
      E'*And she being with child cried, travailing in birth, and pained to be delivered* (Revelation 12:2). *Before she travailed, she brought forth... for as soon as Zion travailed, she brought forth her children* (Isaiah 66:7-8) — the woman in travail John sees is Zion in her birth-pangs, bringing forth her children, the restored people.'),
    ('canon','isaiah',66,8,'canon','revelation',12,5,'free',
      E'*And she brought forth a man child, who was to rule all nations with a rod of iron: and her child was caught up unto Elohim (God), and to his throne* (Revelation 12:5). *Before her pain came, she was delivered of a man child* (Isaiah 66:7); *shall a nation be born at once?* (66:8). Zion''s travail brings forth both the man child and the nation — the woman of Revelation 12 is the travailing Zion of Isaiah 66.'),
    ('canon','isaiah',66,8,'canon','john',16,21,'free',
      E'*A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world* (John 16:21). *As soon as Zion travailed, she brought forth her children* (Isaiah 66:8). Yahusha names the birth-pang joy of the very travail Isaiah sings — the anguish forgotten in the joy of the nation born.'),
    ('canon','isaiah',66,8,'canon','galatians',4,27,'free',
      E'*For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband* (Galatians 4:27). *Shall a nation be born at once? for as soon as Zion travailed, she brought forth her children* (Isaiah 66:8) — the children of the desolate, multiplied beyond number, are the nation Zion brings forth at once; the two-house people born in a day.'),

    -- THREAD 5 (★★): As one whom his mother comforteth — the maternal comfort of restored Jerusalem
    ('canon','isaiah',66,13,'canon','isaiah',40,1,'free',
      E'*Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1). *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem* (Isaiah 66:13). The book''s great comfort opens at chapter 40 and lands here at the end — the mother-comfort of restored Jerusalem fulfilling *comfort ye, comfort ye my people*.'),
    ('canon','isaiah',66,13,'canon','isaiah',49,15,'free',
      E'*Can a woman forget her sucking child, that she should not have compassion on the son of her womb? yea, they may forget, yet will I not forget thee* (Isaiah 49:15). *That ye may suck, and be satisfied with the breasts of her consolations* (Isaiah 66:11); *as one whom his mother comforteth, so will I comfort you* (66:13). The nursing-mother love of Isaiah 49 is the comfort of restored Jerusalem — Yahuah''s compassion that cannot forget her children.'),
    ('canon','isaiah',66,10,'canon','galatians',4,26,'free',
      E'*But Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26). *Rejoice ye with Jerusalem, and be glad with her, all ye that love her... that ye may suck, and be satisfied with the breasts of her consolations* (Isaiah 66:10-11). The Jerusalem whose breasts comfort her children is *the mother of us all* — the free Jerusalem above, the mother-city of the restored people.'),
    ('canon','isaiah',66,10,'canon','revelation',21,2,'free',
      E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). *Rejoice ye with Jerusalem... rejoice for joy with her, all ye that mourn for her* (Isaiah 66:10) — the city all are called to rejoice with is the *new Jerusalem* John sees descending, the bride-mother of the consummation.'),
    ('canon','isaiah',66,14,'canon','ezekiel',37,14,'free',
      E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD)* (Ezekiel 37:14). *And when ye see this, your heart shall rejoice, and your bones shall flourish like an herb* (Isaiah 66:14) — the flourishing bones echo Ezekiel''s valley: the dried bones of the whole house of Yashar''el (Israel) made to live, the two-house resurrection-figure of the regathered people.'),

    -- THREAD 6 (★★★): By fire will Yahuah plead with all flesh — the fiery judgment + the rebels' end
    ('canon','isaiah',66,15,'canon','2-thessalonians',1,7,'free',
      E'*And to you who are troubled rest with us, when the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels* (2 Thessalonians 1:7). *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury* (Isaiah 66:15) — the coming-with-fire is the Formed Son *revealed from heaven with his mighty angels*; the executor of the chariot-and-fire judgment.'),
    ('canon','isaiah',66,16,'canon','2-thessalonians',1,8,'free',
      E'*In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (2 Thessalonians 1:8). *For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many* (Isaiah 66:16) — the fire-and-sword pleading with all flesh is the *flaming fire taking vengeance*; the Formed Son pleads the covenant lawsuit in fire.'),
    ('canon','isaiah',66,16,'canon','revelation',19,15,'free',
      E'*And out of his mouth goeth a sharp sword, that with it he should smite the nations... and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God)* (Revelation 19:15). *By fire and by his sword will Yahuah (LORD) plead with all flesh* (Isaiah 66:16) — the sword of the Rider is the sword by which Yahuah pleads; the Formed Son who smites the nations and treads the winepress.'),
    ('canon','isaiah',66,15,'canon','malachi',4,1,'free',
      E'*For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 4:1). *Yahuah (LORD) will come with fire... to render his anger with fury, and his rebuke with flames of fire* (Isaiah 66:15). The same burning day — the wicked as stubble, the rebuke in flames; the prophets close on the fire of the Day of Yahuah.'),
    ('canon','isaiah',66,15,'canon','2-peter',3,7,'free',
      E'*But the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment and perdition of ungodly men* (2 Peter 3:7). *Yahuah (LORD) will come with fire... his rebuke with flames of fire* (Isaiah 66:15) — the present heavens and earth are *reserved unto fire* against the day of judgment, the same fiery rebuke Isaiah sees coming on all flesh.'),
    ('canon','isaiah',66,15,'enoch','1-enoch',1,9,'extras',
      E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness* (1 Enoch 1:9). *Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury* (Isaiah 66:15); *by fire and by his sword will Yahuah (LORD) plead with all flesh* (66:16). 1 Enoch sees the same coming-in-judgement to *convict all flesh* — the verse Jude later quotes by name; the library''s own witness to the fiery advent.'),
    ('canon','isaiah',66,16,'enoch','1-enoch',45,5,'extras',
      E'*And I will make the sinners to be as straw in the fire, and they shall burn before the face of the holy, and they shall not be quenched* (1 Enoch 45:5). *By fire and by his sword will Yahuah (LORD) plead with all flesh* (Isaiah 66:16); *neither shall their fire be quenched* (66:24). 1 Enoch sees the sinners burning *and they shall not be quenched* — the same unquenchable fire of judgment that closes Isaiah''s book.'),
    ('canon','isaiah',66,24,'canon','mark',9,48,'free',
      E'*Where their worm dieth not, and the fire is not quenched* (Mark 9:48). Yahusha quotes Isaiah 66:24 verbatim — *their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh*. The final state of the rebels who transgressed against Yahuah: the worm that does not die, the fire not quenched; the book''s last word, carried straight onto Yahusha''s lips of Gehenna.'),
    ('canon','isaiah',66,24,'canon','daniel',12,2,'free',
      E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). *They shall go forth, and look upon the carcases of the men that have transgressed against me... and they shall be an abhorring unto all flesh* (Isaiah 66:24) — the *shame and everlasting contempt* of Daniel is the abhorring of the transgressors; the two ends, life and contempt, that the resurrection divides.'),

    -- THREAD 7 (★★★): I will gather all nations and tongues — the two-house ingathering + restored priesthood
    ('canon','isaiah',66,18,'canon','revelation',7,9,'free',
      E'*After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb* (Revelation 7:9). *I will gather all nations and tongues; and they shall come, and see my glory* (Isaiah 66:18) — the gathered *all nations and tongues* is the numberless multitude of every nation and tongue before the throne; the ingathering Isaiah foresees, consummated.'),
    ('canon','isaiah',66,19,'canon','romans',15,10,'free',
      E'*And again he saith, Rejoice, ye Gentiles, with his people* (Romans 15:10). *I will send those that escape of them unto the nations... and they shall declare my glory among the Gentiles* (Isaiah 66:19) — the glory declared among the nations gathers them in to *rejoice... with his people*; the nations brought into the joy of the regathered house, not replacing it.'),
    ('canon','isaiah',66,21,'canon','isaiah',61,6,'free',
      E'*But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* (Isaiah 61:6). *And I will also take of them for priests and for Levites, saith Yahuah (LORD)* (Isaiah 66:21) — the restored priesthood drawn from the regathered brethren, the same promise that the people shall be *named the Priests of Yahuah (LORD)*.'),
    ('canon','isaiah',66,21,'canon','1-peter',2,9,'free',
      E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness* (1 Peter 2:9). *I will also take of them for priests and for Levites* (Isaiah 66:21) — the regathered people made a *royal priesthood*, the restored priesthood of the ingathered brethren; the peculiar people of the covenant, not a new nation grafted in by confession.'),
    ('canon','isaiah',66,20,'canon','zechariah',8,23,'free',
      E'*Thus saith Yahuah Tseva''ot (LORD of hosts); In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you* (Zechariah 8:23). *They shall bring all your brethren for an offering unto Yahuah (LORD) out of all nations... to my holy mountain Jerusalem* (Isaiah 66:20) — the nations of all languages laying hold of the covenant people, brought home to the holy mountain; the ingathering of the scattered brethren.'),
    ('canon','isaiah',66,20,'canon','romans',11,2,'free',
      E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). *They shall bring all your brethren for an offering unto Yahuah (LORD) out of all nations* (Isaiah 66:20) — the brethren brought home from all nations are the foreknown people Yahuah *hath not cast away*; the ingathering is restoration of the covenant people, the guard against any replacement reading.'),

    -- THREAD 8 (★★★): From one sabbath to another, all flesh worship — the appointed times into eternity
    ('canon','isaiah',66,22,'canon','isaiah',65,17,'free',
      E'*For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17). *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain* (Isaiah 66:22) — the new creation just promised in chapter 65 is the ground of the permanence here: the new heavens remain, and so the seed and name of the people remain.'),
    ('canon','isaiah',66,22,'canon','revelation',21,1,'free',
      E'*And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea* (Revelation 21:1). *As the new heavens and the new earth, which I will make, shall remain before me* (Isaiah 66:22) — the new heavens and new earth Isaiah names are the very *new heaven and a new earth* John sees; the abiding creation in which the people''s seed and name remain.'),
    ('canon','isaiah',66,22,'canon','2-peter',3,13,'free',
      E'*Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13). *As the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD)* (Isaiah 66:22) — Peter looks for the very *new heavens and a new earth* of Isaiah''s promise, the abiding creation *wherein dwelleth righteousness*.'),
    ('canon','isaiah',66,22,'enoch','1-enoch',45,4,'extras',
      E'*And on that day I will cause Mine Elect One to dwell among them, and I will change the heaven and the earth and the light and the darkness, and I will make the earth a thing of light* (1 Enoch 45:4). *As the new heavens and the new earth, which I will make, shall remain before me* (Isaiah 66:22) — 1 Enoch sees Yahuah *change the heaven and the earth* and make the earth light, the same renewal of creation in which the seed and name remain.'),
    ('canon','isaiah',66,23,'canon','zechariah',14,16,'free',
      E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). *From one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — Zechariah names the same kept appointed time: all the nations going up *to keep the feast of tabernacles*. The feasts are not abolished; all flesh keeps them in the restored age.'),
    ('canon','isaiah',66,23,'canon','colossians',2,16,'free',
      E'*Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days* (Colossians 2:16). *From one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23) — far from abolishing the new moon and sabbath, Isaiah says all flesh shall KEEP them in the new creation; Paul forbids the OUTSIDE judging of those who keep them.'),
    ('canon','isaiah',66,23,'canon','colossians',2,17,'free',
      E'*Which are a shadow of things to come; but the body is of Messiah (Christ)* (Colossians 2:17). *From one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — the feasts are *a shadow of things to come*, and the body that casts the shadow is *of Messiah (Christ)*: the shadow stands because the body stands. Isaiah shows the sabbaths and new moons kept on into the new heavens, the appointed times not abolished but fulfilled and kept.'),
    ('canon','isaiah',66,23,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). *From one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23) — the climax of the book is all flesh KEEPING the sabbaths in the new creation; the filter holds: *we do know that we know him, if we keep his commandments*. Any reading that abolishes the kept sabbath fails the filter Isaiah''s own ending sets.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s303_isa66_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s303_isa66_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-the-heaven-is-my-throne-and-the-earth-my-footstool',
       E'The heaven is my throne — to this man will I look, the poor and contrite who tremble at the word',
       E'The book''s climax opens with the Maker of all dwarfing every house built for him: *Thus saith Yahuah (LORD), The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest? For all those things hath mine hand made... but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:1-2). Stephen quotes it word for word against temple-presumption: *Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* (Acts 7:49), *Hath not my hand made all these things?* (Acts 7:50) — *the El Elyon (most High) dwelleth not in temples made with hands* (7:48). This is NOT anti-temple; it is anti-presumption. The worshipper Yahuah regards is the contrite — *Blessed are the poor in spirit: for theirs is the kingdom of heaven* (Matthew 5:3). Isaiah said it earlier in the book: *the high and lofty One that inhabiteth eternity... I dwell in the high and holy place, with him also that is of a contrite and humble spirit* (Isaiah 57:15); and David: *the sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). No house can contain Yahuah; the heart that trembles at his word is the dwelling he seeks.',
       sv.verse_id, ev.verse_id, 'free', 27625
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-he-that-killeth-an-ox-is-as-if-he-slew-a-man',
       E'He that killeth an ox is as if he slew a man — obedience above empty sacrifice',
       E'The sacrifice of the rebel heart is abhorred: *He that killeth an ox is as if he slew a man; he that sacrificeth a lamb, as if he cut off a dog''s neck; he that offereth an oblation, as if he offered swine''s blood; he that burneth incense, as if he blessed an idol. Yea, they have chosen their own ways, and their soul delighteth in their abominations* (Isaiah 66:3). This is NOT the abolition of offerings — it is the exposure of heartless ritual, the prophets'' constant refrain. Samuel said it to Saul: *Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Hosea: *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). And Isaiah''s own opening chapter: *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD)... I delight not in the blood of bullocks, or of lambs* (Isaiah 1:11). When the heart has *chosen their own ways*, the offering itself becomes abomination. The offering is not cancelled; the disobedient offerer is.',
       sv.verse_id, ev.verse_id, 'free', 27628
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-they-cast-you-out-for-my-names-sake',
       E'Your brethren that cast you out for my name''s sake — the persecuted remnant vindicated',
       E'A word to the remnant that trembles at the word — the persecuted, not the persecutors: *Hear the word of Yahuah (LORD), ye that tremble at his word; Your brethren that hated you, that cast you out for my name''s sake, said, Let Yahuah (LORD) be glorified: but he shall appear to your joy, and they shall be ashamed* (Isaiah 66:5). The faithful are cast out by their own brethren — who invoke Yahuah''s glory even as they expel the righteous. Yahusha names the same hour exactly: *They shall put you out of the synagogues: yea, the time cometh, that whosoever killeth you will think that he doeth Elohim (God) service* (John 16:2). Read it through the framework of victims-not-enemies: the line drawn here is conduct, not ethnicity — those who hate and cast out the trembling remnant are exposed, and the remnant is vindicated. *He shall appear to your joy, and they shall be ashamed*: the casting-out is reversed, the persecuted brought to joy, the persecutors to shame.',
       sv.verse_id, ev.verse_id, 'free', 27631
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-as-soon-as-zion-travailed-she-brought-forth-her-children',
       E'As soon as Zion travailed, she brought forth her children — the nation born at once',
       E'The chapter''s most astonishing sign: a nation born in a single day. *Before she travailed, she brought forth; before her pain came, she was delivered of a man child. Who hath heard such a thing?... Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Zion travailed, she brought forth her children* (Isaiah 66:7-8); *Shall I bring to the birth, and not cause to bring forth?* (66:9). The restored two-house people are born at once when Zion travails. John sees the very woman: *she being with child cried, travailing in birth, and pained to be delivered* (Revelation 12:2), *and she brought forth a man child... and her child was caught up unto Elohim (God), and to his throne* (12:5). Yahusha names the birth-pang joy: *A woman when she is in travail hath sorrow... but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world* (John 16:21). And Paul names the multiplied children: *the desolate hath many more children than she which hath an husband* (Galatians 4:27). Zion''s travail brings forth both the man child and the nation — the people of promise born in a day, the regathering accomplished as a birth.',
       sv.verse_id, ev.verse_id, 'free', 27634
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-as-one-whom-his-mother-comforteth-so-will-i-comfort-you',
       E'As one whom his mother comforteth, so will I comfort you — the mother-comfort of restored Jerusalem',
       E'The newborn nation is nursed at the breast of restored Jerusalem: *Rejoice ye with Jerusalem, and be glad with her, all ye that love her... That ye may suck, and be satisfied with the breasts of her consolations; that ye may milk out, and be delighted with the abundance of her glory* (Isaiah 66:10-11); *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem* (66:13). This is the great comfort the book opened with: *Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1) — landing here at the end. It is the nursing-mother love of *Can a woman forget her sucking child, that she should not have compassion on the son of her womb?... yet will I not forget thee* (Isaiah 49:15). She is the mother-city: *Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26), *the holy city, new Jerusalem... prepared as a bride adorned for her husband* (Revelation 21:2). And the promise that *your bones shall flourish like an herb* (66:14) is the two-house resurrection-figure of Ezekiel''s valley: *I shall put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14) — the dried bones of the whole house of Yashar''el (Israel) made to live and flourish.',
       sv.verse_id, ev.verse_id, 'free', 27637
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh',
       E'By fire and by his sword will Yahuah plead with all flesh — the fiery judgment and the rebels'' end',
       E'Against the rejoicing of the restored comes the fire upon the rebels: *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire. For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many* (Isaiah 66:15-16). The Formed Son is the executor of this fire: *when the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels* (2 Thessalonians 1:7), *In flaming fire taking vengeance on them that know not Elohim (God)* (1:8); *out of his mouth goeth a sharp sword, that with it he should smite the nations... and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God)* (Revelation 19:15). The day burns as an oven: *all that do wickedly, shall be stubble; and the day that cometh shall burn them up* (Malachi 4:1); the heavens are *reserved unto fire against the day of judgment* (2 Peter 3:7). The library''s own apocalyptic sees the same advent: *He cometh with ten thousands of His set-apart ones To execute judgement upon all... And to convict all flesh* (1 Enoch 1:9 — the verse Jude quotes by name); *I will make the sinners to be as straw in the fire, and they shall burn before the face of the holy, and they shall not be quenched* (1 Enoch 45:5). And the book''s very last verse fixes the rebels'' final state — quoted verbatim by Yahusha of Gehenna: *they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched* (66:24); *Where their worm dieth not, and the fire is not quenched* (Mark 9:48); *many of them that sleep in the dust of the earth shall awake... some to shame and everlasting contempt* (Daniel 12:2). The swine''s-flesh rebels of v.17 are the *all flesh* this fire pleads against — the dietary rebellion judged, not licensed.',
       sv.verse_id, ev.verse_id, 'extras', 27640
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-i-will-gather-all-nations-and-tongues',
       E'I will gather all nations and tongues — the two-house ingathering and the restored priesthood',
       E'The book ends in ingathering: *it shall come, that I will gather all nations and tongues; and they shall come, and see my glory. And I will set a sign among them, and I will send those that escape of them unto the nations... that have not heard my fame... and they shall declare my glory among the Gentiles. And they shall bring all your brethren for an offering unto Yahuah (LORD) out of all nations... to my holy mountain Jerusalem... And I will also take of them for priests and for Levites, saith Yahuah (LORD)* (Isaiah 66:18-21). John sees the gathered multitude: *a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb* (Revelation 7:9). Paul: *Rejoice, ye Gentiles, with his people* (Romans 15:10). The scattered brethren are brought home as the nations lay hold of the covenant people: *ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you* (Zechariah 8:23). And the restored priesthood is drawn from the regathered people: *ye shall be named the Priests of Yahuah (LORD)* (Isaiah 61:6), *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). This is restoration of the two houses, NOT replacement — the guard stands firm: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The brethren brought from all nations are the foreknown covenant people, gathered home.',
       sv.verse_id, ev.verse_id, 'free', 27643
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 8 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship',
       E'From one sabbath to another shall all flesh come to worship — the appointed times into eternity',
       E'The book closes on the anti-antinomian climax of the whole Tanakh: *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain. And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:22-23). The new moons AND the sabbaths are KEPT BY ALL FLESH in the new creation — the appointed times are not abolished; they continue into eternity, as permanent as the new heavens themselves, and the seed and name of the people remain with them. The new creation is the one just promised: *behold, I create new heavens and a new earth* (Isaiah 65:17); *I saw a new heaven and a new earth* (Revelation 21:1); *new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13); and the library''s witness, *I will change the heaven and the earth... and I will make the earth a thing of light* (1 Enoch 45:4). Zechariah names the same kept feast: *every one that is left of all the nations... shall... go up from year to year to worship the King... and to keep the feast of tabernacles* (Zechariah 14:16). And Colossians, so often misread as abolition, is the shadow whose BODY remains: *Let no man therefore judge you... of the new moon, or of the sabbath days: Which are a shadow of things to come; but the body is of Messiah (Christ)* (Colossians 2:16-17) — the shadow stands because the body stands; Paul forbids the outsider judging those who keep them, while Isaiah shows all flesh keeping them on into the new heavens. The filter holds: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3). Any reading that abolishes the kept sabbath fails the filter Isaiah''s own ending sets — for the very last vision of the book is all flesh worshipping from sabbath to sabbath, for ever.',
       sv.verse_id, ev.verse_id, 'extras', 27646
  FROM _s303_isa66_lookup sv, _s303_isa66_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='isaiah' AND ev.chapter_number=66 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Heaven is my throne, and earth is my footstool: what house will ye build me?* (Acts 7:49) — Stephen quotes Isaiah 66:1 verbatim against temple-presumption; no house contains Yahuah.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=1
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-the-heaven-is-my-throne-and-the-earth-my-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Hath not my hand made all these things?* (Acts 7:50) — *all those things hath mine hand made* (Isaiah 66:2); the Maker of all needs no house, only the contrite heart.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=2
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-the-heaven-is-my-throne-and-the-earth-my-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Blessed are the poor in spirit: for theirs is the kingdom of heaven* (Matthew 5:3) — *him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2) is the man Yahuah looks to.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=2
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-the-heaven-is-my-throne-and-the-earth-my-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I dwell in the high and holy place, with him also that is of a contrite and humble spirit* (Isaiah 57:15) — the same lens within the book; the high One stoops to the contrite of Isaiah 66:2.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=2
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-the-heaven-is-my-throne-and-the-earth-my-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the only sacrifice not despised is the contrite heart Yahuah looks to (Isaiah 66:2).'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=2
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-the-heaven-is-my-throne-and-the-earth-my-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22) — the disobedient''s ox-slaughter abhorred (Isaiah 66:3); obedience above offering.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=3
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-he-that-killeth-an-ox-is-as-if-he-slew-a-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I desired mercy, and not sacrifice* (Hosea 6:6) — the lamb-sacrifice of the rebel heart (Isaiah 66:3) is abomination when mercy and obedience are absent.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=3
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-he-that-killeth-an-ox-is-as-if-he-slew-a-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the multitude of your sacrifices unto me... I delight not in the blood of bullocks* (Isaiah 1:11) — the book opens and closes on heartless ritual loathed (Isaiah 66:3); not offerings abolished, offerers exposed.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=3
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-he-that-killeth-an-ox-is-as-if-he-slew-a-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *They shall put you out of the synagogues: yea, the time cometh, that whosoever killeth you will think that he doeth Elohim (God) service* (John 16:2) — *cast you out for my name''s sake, said, Let Yahuah (LORD) be glorified* (Isaiah 66:5); the persecuted remnant vindicated.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=5
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-they-cast-you-out-for-my-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *she being with child cried, travailing in birth, and pained to be delivered* (Revelation 12:2) — *as soon as Zion travailed, she brought forth her children* (Isaiah 66:8); the woman in travail is Zion.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=8
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-soon-as-zion-travailed-she-brought-forth-her-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *she brought forth a man child... her child was caught up unto Elohim (God), and to his throne* (Revelation 12:5) — *delivered of a man child* (Isaiah 66:7); Zion''s travail brings forth the man child and the nation.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=8
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-soon-as-zion-travailed-she-brought-forth-her-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born* (John 16:21) — the birth-pang joy of Zion''s travail (Isaiah 66:8).'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=8
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-soon-as-zion-travailed-she-brought-forth-her-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the desolate hath many more children than she which hath an husband* (Galatians 4:27) — *shall a nation be born at once?* (Isaiah 66:8); the multiplied children of promise born in a day.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=8
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-soon-as-zion-travailed-she-brought-forth-her-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1) — *as one whom his mother comforteth, so will I comfort you* (Isaiah 66:13); the book''s great comfort lands at the end.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=13
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-one-whom-his-mother-comforteth-so-will-i-comfort-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Can a woman forget her sucking child... yet will I not forget thee* (Isaiah 49:15) — *suck, and be satisfied with the breasts of her consolations* (Isaiah 66:11); the nursing-mother love of restored Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=13
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-one-whom-his-mother-comforteth-so-will-i-comfort-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26) — the comforting mother-city (Isaiah 66:10-11) is the free Jerusalem above.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=10
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-one-whom-his-mother-comforteth-so-will-i-comfort-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the holy city, new Jerusalem... prepared as a bride adorned for her husband* (Revelation 21:2) — *rejoice ye with Jerusalem* (Isaiah 66:10); the bride-mother of the consummation.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=10
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-one-whom-his-mother-comforteth-so-will-i-comfort-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I shall put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14) — *your bones shall flourish like an herb* (Isaiah 66:14); the two-house resurrection-figure, the dried bones made to live.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=14
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-as-one-whom-his-mother-comforteth-so-will-i-comfort-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *when the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels* (2 Thessalonians 1:7) — *Yahuah (LORD) will come with fire, and with his chariots like a whirlwind* (Isaiah 66:15); the Formed Son the executor.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=15
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *In flaming fire taking vengeance on them that know not Elohim (God)* (2 Thessalonians 1:8) — *by fire and by his sword will Yahuah (LORD) plead with all flesh* (Isaiah 66:16); the flaming-fire vengeance.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=16
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *out of his mouth goeth a sharp sword... he treadeth the winepress of the fierceness and wrath* (Revelation 19:15) — *by his sword will Yahuah (LORD) plead with all flesh* (Isaiah 66:16); the Rider who smites the nations.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=16
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the day cometh, that shall burn as an oven... shall burn them up* (Malachi 4:1) — *his rebuke with flames of fire* (Isaiah 66:15); the burning Day of Yahuah, the wicked as stubble.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=15
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the heavens and the earth... reserved unto fire against the day of judgment* (2 Peter 3:7) — *Yahuah (LORD) will come with fire* (Isaiah 66:15); the creation reserved for the fiery rebuke.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=15
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *He cometh with ten thousands of His set-apart ones To execute judgement upon all... to convict all flesh* (1 Enoch 1:9) — *by fire... will Yahuah (LORD) plead with all flesh* (Isaiah 66:16); the library''s witness to the fiery advent (the verse Jude quotes by name).'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=15
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the sinners... shall burn before the face of the holy, and they shall not be quenched* (1 Enoch 45:5) — *neither shall their fire be quenched* (Isaiah 66:24); the unquenchable fire of judgment.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=16
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=45 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Where their worm dieth not, and the fire is not quenched* (Mark 9:48) — Yahusha quotes Isaiah 66:24 verbatim; the rebels'' final state, the worm that does not die.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=24
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*some to shame and everlasting contempt* (Daniel 12:2) — *they shall be an abhorring unto all flesh* (Isaiah 66:24); the resurrection divides life from contempt.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=24
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-by-fire-and-by-his-sword-will-yahuah-plead-with-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne* (Revelation 7:9) — *I will gather all nations and tongues* (Isaiah 66:18); the ingathering consummated.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=18
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-i-will-gather-all-nations-and-tongues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Rejoice, ye Gentiles, with his people* (Romans 15:10) — *they shall declare my glory among the Gentiles* (Isaiah 66:19); the nations brought into the joy of the regathered house, not replacing it.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=19
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-i-will-gather-all-nations-and-tongues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *ye shall be named the Priests of Yahuah (LORD)* (Isaiah 61:6) — *I will also take of them for priests and for Levites* (Isaiah 66:21); the restored priesthood from the regathered people.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=21
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-i-will-gather-all-nations-and-tongues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *ye are a chosen generation, a royal priesthood... a peculiar people* (1 Peter 2:9) — *take of them for priests and for Levites* (Isaiah 66:21); the regathered people made a royal priesthood, not a new nation by confession.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=21
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-i-will-gather-all-nations-and-tongues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *ten men shall take hold... of the skirt of him that is a Yahudi (Jew), saying, We will go with you* (Zechariah 8:23) — *bring all your brethren... out of all nations* (Isaiah 66:20); the nations laying hold of the covenant people.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=20
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-i-will-gather-all-nations-and-tongues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — the brethren brought from all nations (Isaiah 66:20) are the foreknown people; the guard against replacement.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=20
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-i-will-gather-all-nations-and-tongues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 8 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I create new heavens and a new earth: and the former shall not be remembered* (Isaiah 65:17) — *as the new heavens and the new earth, which I will make, shall remain* (Isaiah 66:22); the new creation grounds the permanence.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=22
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I saw a new heaven and a new earth: for the first heaven and the first earth were passed away* (Revelation 21:1) — the *new heavens and the new earth* of Isaiah 66:22 John sees descending.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=22
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13) — Peter looks for the very new heavens of Isaiah 66:22, the abiding creation.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=22
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will change the heaven and the earth... and I will make the earth a thing of light* (1 Enoch 45:4) — the renewal of creation in which the seed and name remain (Isaiah 66:22).'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=22
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=45 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *every one that is left of all the nations... shall go up from year to year to worship the King... and to keep the feast of tabernacles* (Zechariah 14:16) — *from one sabbath to another, shall all flesh come to worship* (Isaiah 66:23); the kept appointed time, the feasts not abolished.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=23
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *Let no man therefore judge you... of the new moon, or of the sabbath days* (Colossians 2:16) — Isaiah 66:23 has ALL FLESH KEEP the new moon and sabbath in the new creation; Paul forbids the outsider judging the keepers.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=23
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *Which are a shadow of things to come; but the body is of Messiah (Christ)* (Colossians 2:17) — the shadow stands because the body stands; *all flesh come to worship* sabbath to sabbath (Isaiah 66:23), the appointed times kept on.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=23
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — the book ends with all flesh KEEPING the sabbath (Isaiah 66:23); the filter against any abolition reading.'
  FROM cross_reference_threads t
  JOIN _s303_isa66_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=66 AND sv.verse_number=23
  JOIN _s303_isa66_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='isaiah-66-from-one-sabbath-to-another-shall-all-flesh-come-to-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session303 — Isaiah cross-references complete.'
