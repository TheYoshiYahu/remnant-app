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


COMMIT;
\echo 'session303 — Isaiah cross-references complete.'
