-- =====================================================================
-- Session 231 — Philippians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session231_philippians_cross_references.sql
-- =====================================================================

\echo 'session231 — Philippians cross-references starting...'
BEGIN;

-- ----- fragment: minion_philippians_01.sql (S231 Philippians 1) -----
-- =====================================================================
-- S231 minion — PHILIPPIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: PHILIPPIANS 1 (30 verses) — partnership in the gospel / to live is Messiah /
--          conversation becometh the gospel. Mostly NT/allusive; few formula-quotations.
-- Tag: ph01 (temp view _s231_ph01_lookup).
-- Sort band: floor 7560, step 3 (7560, 7563, 7566 used; under 7585).
-- Source is ALWAYS the canon Philippians verse; targets span Tanakh + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'. No extras member in this chapter
--   (the strong extras witnesses fall at 2:6 brightness-of-Elohim and 4:3 book-of-life,
--   not in chapter 1 — recorded 'none warranted' honestly below).
--
-- GOVERNING FRAME: Paul writes from prison to the called-out ones at Philippi — Yashar'el
-- (Israel) and the grafted-in seed of the nations, partners in the gospel from the first day.
-- The covenant-keeping Elohim (God) who began the good work will finish it; to live is
-- HaMashiach (Christ); the manner of life that becomes the gospel is the citizen-walk that
-- anticipates 3:20 (*our conversation is in heaven*). No replacement theology, no
-- law-vs-grace antithesis; the citizenship above = the gathered commonwealth, the Jerusalem
-- above, not a new institution replacing Yashar'el (Israel). Christology (the Formed) is
-- load-bearing in ch2; ch1 carries no kenosis-hymn rows.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   greeting; fellowship in the gospel from the first day
--           Tanakh: none warranted (a salutation; no load-bearing parallel)
--           Extras: none warranted   NT: carried in the perform-good-work thread (v.6)
--   v.6     he which hath begun a good work in you will perform it until the day of Messiah
--           Tanakh: Psalm 138:8 (Yahuah will perfect that which concerneth me; forsake not
--                   the works of thine own hands), Jeremiah 32:40 (everlasting covenant... I
--                   will not turn away from them... I will put my fear in their hearts)
--           Extras: none warranted   NT: Romans 8:28-29 (all things work together for good...
--                   the called according to his purpose... predestinate to be conformed)
--   v.7-20  bonds furthering the gospel; Messiah magnified whether by life or death
--           Tanakh: none warranted (pastoral report; the death-or-life resolves at v.21)
--           Extras: none warranted   NT: none warranted (carried in v.21 thread)
--   v.21-24 for to me to live is Messiah, and to die is gain; desire to depart and be with him
--           Tanakh: Psalm 73:25-26 (whom have I in heaven but thee... Elohim is... my portion
--                   for ever)
--           Extras: none warranted   NT: Galatians 2:20 (I live; yet not I, but Messiah liveth
--                   in me), Colossians 3:3-4 (your life is hid with Messiah... who is our life)
--   v.25-26 confidence to abide for your furtherance and joy of faith
--           Tanakh: none warranted   Extras: none warranted   NT: carried in v.21 thread
--   v.27    only let your conversation be as it becometh the gospel of Messiah
--           Tanakh: Deuteronomy 30:19-20 (choose life... love Yahuah... obey his voice...
--                   cleave unto him: for he is thy life — the covenant walk)
--           Extras: none warranted   NT: Colossians 3:1-2 (seek those things which are above...
--                   set your affection on things above), anticipating Philippians 3:20
--   v.28-30 the gift to believe and to suffer for his sake
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7560 philippians-1-he-which-hath-begun-a-good-work-will-perform-it-psalm-138       (Tanakh + NT)
--   7563 philippians-1-for-to-me-to-live-is-messiah-and-to-die-is-gain-psalm-73        (Tanakh + NT)
--   7566 philippians-1-your-conversation-as-it-becometh-the-gospel-deuteronomy-30      (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s231_ph01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philippians-1-he-which-hath-begun-a-good-work-will-perform-it-psalm-138
  ('canon', 'philippians', 1, 6, 'canon', 'psalms', 138, 8, 'free', E'*Yahuah (LORD) will perfect that which concerneth me: thy mercy, O Yahuah (LORD), endureth for ever: forsake not the works of thine own hands.* (Psalm 138:8). The psalmist rests on the covenant-keeping Elohim (God) who finishes what he begins — *Yahuah (LORD) will perfect that which concerneth me* — and pleads *forsake not the works of thine own hands.* Paul speaks the same confidence over the called-out ones at Philippi: *Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The good work is the works of Yahuah''s (LORD) own hands; the One who began it is the One who perfects it, and his mercy that endureth for ever guarantees the day of HaMashiach (Christ).'),
  ('canon', 'philippians', 1, 6, 'canon', 'jeremiah', 32, 40, 'free', E'*And I will make an everlasting covenant with them, that I will not turn away from them, to do them good; but I will put my fear in their hearts, that they shall not depart from me.* (Jeremiah 32:40). Yahuah (LORD) binds himself never to turn away from his people but *to do them good,* and he himself works the perseverance — *I will put my fear in their hearts, that they shall not depart from me.* This is the ground of Paul''s assurance that *he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The completion of the good work is not the believer holding on but the everlasting-covenant Elohim (God) holding on to them, keeping his people to the day of HaMashiach (Christ).'),
  ('canon', 'philippians', 1, 6, 'canon', 'romans', 8, 28, 'free', E'*And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose. For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren.* (Romans 8:28-29). Paul names the purpose that carries the good work to its end: the called *are conformed to the image of his Son.* It is the same confidence he speaks at Philippi — *he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The good work begun is the work of being conformed to the image of the Son; the One who foreknew and called is the One who completes it, so that all things work together for good unto that day.'),
  -- thread: philippians-1-for-to-me-to-live-is-messiah-and-to-die-is-gain-psalm-73
  ('canon', 'philippians', 1, 21, 'canon', 'psalms', 73, 25, 'free', E'*Whom have I in heaven but thee? and there is none upon earth that I desire beside thee. My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever.* (Psalm 73:25-26). Asaph finds the whole of his desire, in heaven and on earth, in Yahuah (LORD) alone, and reckons that even when *my flesh and my heart faileth,* still *Elohim (God) is... my portion for ever.* Paul speaks that same singular desire from his bonds: *For to me to live is Messiah (Christ), and to die is gain* (Philippians 1:21). Whether by life or by death he loses nothing, for the One who is his portion forever cannot fail; to depart is *to be with Messiah (Christ); which is far better* (Philippians 1:23).'),
  ('canon', 'philippians', 1, 21, 'canon', 'galatians', 2, 20, 'free', E'*I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me.* (Galatians 2:20). The life Paul lives is no longer his own — *not I, but Messiah (Christ) liveth in me.* That is exactly what he means when he says *For to me to live is Messiah (Christ), and to die is gain* (Philippians 1:21): if Messiah (Christ) is the very content of his living, then death only removes the veil of the flesh and brings him face to face with the One who loved him and gave himself for him. To live is HaMashiach (Christ); to die is to have him without hindrance.'),
  ('canon', 'philippians', 1, 21, 'canon', 'colossians', 3, 3, 'free', E'*For ye are dead, and your life is hid with Messiah (Christ) in Elohim (God). When Messiah (Christ), who is our life, shall appear, then shall ye also appear with him in glory.* (Colossians 3:3-4). In the twin letter Paul names Messiah (Christ) plainly: *Messiah (Christ), who is our life.* The believer''s life is *hid with Messiah (Christ) in Elohim (God),* safe past the reach of death. So when Paul says *For to me to live is Messiah (Christ), and to die is gain* (Philippians 1:21), dying is gain precisely because the life is already hid in Messiah (Christ); death cannot touch it, and the appearing of HaMashiach (Christ) brings it out into glory.'),
  -- thread: philippians-1-your-conversation-as-it-becometh-the-gospel-deuteronomy-30
  ('canon', 'philippians', 1, 27, 'canon', 'deuteronomy', 30, 20, 'free', E'*That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* (Deuteronomy 30:20). Moses sets the covenant walk before Yashar''el (Israel): to *love Yahuah Elohayka (the LORD thy God)... obey his voice... cleave unto him: for he is thy life.* Paul calls the Philippians to that same manner of life under the gospel: *Only let your conversation be as it becometh the gospel of Messiah (Christ)... that ye stand fast in one spirit, with one mind striving together for the faith of the gospel* (Philippians 1:27). The conversation that becomes the gospel is the covenant walk of Deuteronomy carried forward — cleaving to the One who is their life, that they may dwell in the inheritance he swore to the fathers.'),
  ('canon', 'philippians', 1, 27, 'canon', 'colossians', 3, 1, 'free', E'*If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God). Set your affection on things above, not on things on the earth.* (Colossians 3:1-2). The twin letter unfolds the manner of life that becomes the gospel: *seek those things which are above... set your affection on things above.* It is the citizen-walk Paul commands at Philippi — *let your conversation be as it becometh the gospel of Messiah (Christ)* (Philippians 1:27) — and which he names outright two chapters on: *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). Those whose citizenship is above order their conduct by what is above, standing fast in one spirit until the Saviour appears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s231_ph01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s231_ph01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-1-he-which-hath-begun-a-good-work-will-perform-it-psalm-138',
       E'He which hath begun a good work in you will perform it (Psalm 138, Jeremiah 32)',
       E'Paul opens his letter with a confidence rooted in the character of the covenant-keeping Elohim (God): *Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The assurance is not in the believers'' grip but in Yahuah''s (LORD), and the psalmist already knew it: *Yahuah (LORD) will perfect that which concerneth me: thy mercy, O Yahuah (LORD), endureth for ever: forsake not the works of thine own hands* (Psalm 138:8). The good work is the work of Yahuah''s (LORD) own hands, and the One who began it perfects it because his mercy endureth for ever. Jeremiah names the binding underneath it: *I will make an everlasting covenant with them, that I will not turn away from them, to do them good; but I will put my fear in their hearts, that they shall not depart from me* (Jeremiah 32:40) — Yahuah (LORD) himself works the perseverance, putting his fear in their hearts so that they do not depart. And Paul unfolds the purpose to which the good work tends: *whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren* (Romans 8:28-29). The good work begun is the conforming of the called to the image of the Son; the One who foreknew, called, and covenanted is the One who carries it to completion at the day of HaMashiach (Christ). This is no replacement of the covenant promise but its fulfilment in the gathered seed — the everlasting-covenant Elohim (God) finishing in his people what he began.',
       sv.verse_id, ev.verse_id, 'free', 7560
  FROM _s231_ph01_lookup sv, _s231_ph01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-1-for-to-me-to-live-is-messiah-and-to-die-is-gain-psalm-73',
       E'For to me to live is Messiah, and to die is gain (Psalm 73)',
       E'From his bonds Paul reduces the whole of life and death to one Person: *For to me to live is Messiah (Christ), and to die is gain* (Philippians 1:21). He is *in a strait betwixt two,* desiring *to depart, and to be with Messiah (Christ); which is far better* (Philippians 1:23). The same singular desire was Asaph''s when his world was failing: *Whom have I in heaven but thee? and there is none upon earth that I desire beside thee. My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever* (Psalm 73:25-26). When the flesh and heart fail, the portion remains — and so death is no loss but gain. The life Paul lives is already not his own: *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me* (Galatians 2:20). If Messiah (Christ) is the very content of his living, death only removes the veil of the flesh. The twin letter says it plainly: *For ye are dead, and your life is hid with Messiah (Christ) in Elohim (God). When Messiah (Christ), who is our life, shall appear, then shall ye also appear with him in glory* (Colossians 3:3-4). To live is HaMashiach (Christ) because the life is hid in him; to die is gain because death cannot touch what is hid in Elohim (God), and the appearing of HaMashiach (Christ) brings it out into glory.',
       sv.verse_id, ev.verse_id, 'free', 7563
  FROM _s231_ph01_lookup sv, _s231_ph01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=1 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-1-your-conversation-as-it-becometh-the-gospel-deuteronomy-30',
       E'Let your conversation be as it becometh the gospel (Deuteronomy 30, Colossians 3)',
       E'Paul gives the Philippians one governing command for their common life: *Only let your conversation be as it becometh the gospel of Messiah (Christ): that whether I come and see you, or else be absent, I may hear of your affairs, that ye stand fast in one spirit, with one mind striving together for the faith of the gospel* (Philippians 1:27). The manner of life is to match the gospel — a citizen-walk. That is the covenant walk Moses set before Yashar''el (Israel): *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers* (Deuteronomy 30:20). To love, to obey his voice, to cleave unto him who is their life — the conversation that becomes the gospel is this covenant walk carried forward, not set aside. The twin letter spells out its bearing: *If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God). Set your affection on things above, not on things on the earth* (Colossians 3:1-2). And Paul names the reason outright two chapters on: *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). Those whose citizenship is the Jerusalem above — the gathered commonwealth, not a new institution replacing Yashar''el (Israel) — order their conduct by what is above, cleaving to the One who is their life, standing fast in one spirit until the Saviour appears.',
       sv.verse_id, ev.verse_id, 'free', 7566
  FROM _s231_ph01_lookup sv, _s231_ph01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philippians-1-he-which-hath-begun-a-good-work-will-perform-it-psalm-138
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 138:8 — *Yahuah (LORD) will perfect that which concerneth me... forsake not the works of thine own hands* the covenant-keeping Elohim (God) who finishes what he begins; *he which hath begun a good work in you will perform it* (Philippians 1:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-he-which-hath-begun-a-good-work-will-perform-it-psalm-138'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=138 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 32:40 — *an everlasting covenant... I will not turn away from them... I will put my fear in their hearts, that they shall not depart from me* Yahuah (LORD) himself works the perseverance; the ground that *he... will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-he-which-hath-begun-a-good-work-will-perform-it-psalm-138'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=32 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:28-29 — *the called according to his purpose... predestinate to be conformed to the image of his Son* the purpose to which the good work tends; *he which hath begun a good work in you will perform it* (Philippians 1:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-he-which-hath-begun-a-good-work-will-perform-it-psalm-138'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-1-for-to-me-to-live-is-messiah-and-to-die-is-gain-psalm-73
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 73:25-26 — *whom have I in heaven but thee... Elohim (God) is the strength of my heart, and my portion for ever* the One desire that remains when flesh and heart fail; *to me to live is Messiah (Christ), and to die is gain* (Philippians 1:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-for-to-me-to-live-is-messiah-and-to-die-is-gain-psalm-73'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 2:20 — *I live; yet not I, but Messiah (Christ) liveth in me* the life that is Messiah (Christ) himself; so *to live is Messiah (Christ), and to die is gain* (Philippians 1:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-for-to-me-to-live-is-messiah-and-to-die-is-gain-psalm-73'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 3:3-4 — *your life is hid with Messiah (Christ) in Elohim (God)... Messiah (Christ), who is our life* death cannot touch the hid life; so *to die is gain* (Philippians 1:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-for-to-me-to-live-is-messiah-and-to-die-is-gain-psalm-73'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-1-your-conversation-as-it-becometh-the-gospel-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:20 — *love Yahuah Elohayka (the LORD thy God)... obey his voice... cleave unto him: for he is thy life* the covenant walk; the manner of life *as it becometh the gospel of Messiah (Christ)* (Philippians 1:27).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-your-conversation-as-it-becometh-the-gospel-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 3:1-2 — *seek those things which are above... set your affection on things above* the citizen-walk that becomes the gospel, anticipating *our conversation is in heaven* (Philippians 3:20); *let your conversation be as it becometh the gospel* (Philippians 1:27).'
  FROM cross_reference_threads t, cross_references x, _s231_ph01_lookup sv, _s231_ph01_lookup tv
 WHERE t.slug='philippians-1-your-conversation-as-it-becometh-the-gospel-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_philippians_02.sql (S231 Philippians 2) -----
-- =====================================================================
-- S231 minion — PHILIPPIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: PHILIPPIANS 2 (30 verses) — THE KENOSIS HYMN (2:5-11), the load-bearing / BLESSING chapter.
-- Tag: ph02 (temp view _s231_ph02_lookup).
-- Sort band: floor 7585, step 3 (7585, 7588, 7591, 7594, 7597 used; under 7610).
-- Source is ALWAYS the canon Philippians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the Formed): 2:5-11 is the hymn of SUBMISSION — Yahusha (Jesus) is THE FORMED, the
-- Son drawn out of the Formless Father, who bears the Father's own Name. The hymn's whole movement is
-- downward then up by the Father's hand: the Formed *made himself of no reputation* (emptied himself),
-- *humbled himself,* *became obedient unto death* — and then *Elohim (God) also hath highly exalted him,
-- and given him a name which is above every name,* and every knee bows *to the glory of Elohim (God) the
-- Father* (2:11). The *form of Elohim* he was in is the divine glory he shares as the One brought forth;
-- *equal with Elohim* is the thing he did NOT grasp/clutch — he laid it down. The Name above every name
-- is the Father's own Name (YHWH) placed upon the Son. Built on Isaiah 45:23 (*unto me every knee shall
-- bow* — YHWH speaking; the knee bows to the Name the Formed bears), Isaiah 53 (the obedient Servant
-- *brought as a lamb to the slaughter*), and the Father-exalts-the-Son frame; the every-knee is also
-- Romans 14:11, all-things-subjected-to-the-Father is 1 Corinthians 15:27, the form-of-Elohim twin is
-- Colossians 1:15-16 / 2:9; Wisdom 7:25-26 weighed and woven as a Formed witness (the brightness of the
-- everlasting light, brought forth from the Almighty — NOT a second co-equal person). This is NOT a
-- co-equal-persons proof-text, NOT modalism, NOT a created/mere-man Christology. The Formed Son, ordered
-- under the Father, exalted BY the Father, to the Father's glory.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   consolation in Messiah, likeminded, of one accord
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral exhortation)
--   v.3-4   in lowliness of mind let each esteem other better than themselves
--           Tanakh: none warranted (humility carried with v.8 in the Sirach thread)
--           Extras: Sirach 3:18 (the greater thou art, the more humble thyself)
--           NT: none warranted
--   v.5-11  THE KENOSIS HYMN — form of Elohim, emptied, obedient unto death, exalted, every knee bows
--           Tanakh: Isaiah 45:23 (unto me every knee shall bow, every tongue shall swear), Isaiah 53:7
--                   (brought as a lamb to the slaughter), Isaiah 53:8 (cut off out of the land of the living)
--           Extras: Wisdom 7:25 (the breath of the power of Yahuah), Wisdom 7:26 (brightness of the
--                   everlasting light, the image of his goodness) — the Formed witness, VERIFIED
--           NT: Romans 14:11 (every knee shall bow to me, every tongue confess), 1 Corinthians 15:27
--                   (he hath put all things under his feet... excepted... which did put all things under him),
--                   Colossians 1:15 (the image of the invisible Elohim, the firstborn), Colossians 1:16
--                   (by him were all things created), Colossians 2:9 (in him dwelleth all the fulness)
--   v.12-13 work out your own salvation; Elohim worketh in you to will and to do
--           Tanakh: Ezekiel 36:27 (I will put my spirit within you, and cause you to walk in my statutes)
--           Extras: none warranted   NT: none warranted
--   v.14-16 blameless sons in a crooked and perverse nation, ye shine as lights
--           Tanakh: Deuteronomy 32:5 (a perverse and crooked generation), Daniel 12:3 (they that be wise
--                   shall shine as the brightness of the firmament)
--           Extras: 1 Enoch 104:2 WEIGHED — this edition reads *the light has shone upon me... I have
--                   beheld the books of life,* NOT the shine-as-lights-of-heaven wording; none warranted
--           NT: none warranted
--   v.17    if I be offered upon the sacrifice and service of your faith
--           Tanakh: Numbers 28:7 (the strong wine to be poured for a drink offering), Exodus 29:40
--                   (the fourth part of an hin of wine for a drink offering)
--           Extras: none warranted   NT: none warranted
--   v.18-30 joy/rejoice, Timotheus, Epaphroditus
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (personal/pastoral)
--
-- THREADS (slug -> target libraries):
--   7585 philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45  (Tanakh + Extras + NT)  [KENOSIS-HYMN CENTERPIECE / BLESSING]
--   7588 philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3            (Extras)
--   7591 philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36              (Tanakh)
--   7594 philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12            (Tanakh)
--   7597 philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28         (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s231_ph02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45  [KENOSIS HYMN]
  ('canon', 'philippians', 2, 10, 'canon', 'isaiah', 45, 23, 'free', E'*I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear.* (Isaiah 45:23). Yahuah (LORD) himself swore that *unto me every knee shall bow.* Paul speaks the very oath of the exalted Formed: *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The knee does not bow to a second God; it bows to the Name the Formed bears — the Father''s own Name placed upon the Son, *a name which is above every name* (Philippians 2:9). The oath sworn by Yahuah (LORD) in Isaiah is fulfilled when every knee bows at the Name of the Formed, *to the glory of Elohim (God) the Father* (Philippians 2:11).'),
  ('canon', 'philippians', 2, 11, 'canon', 'isaiah', 45, 23, 'free', E'*I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear.* (Isaiah 45:23). The second half of Yahuah''s (LORD''s) oath — *every tongue shall swear* — is what Paul completes: *that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11). The swearing of every tongue in Isaiah becomes the confession of every tongue that the Formed is Lord; and mark where it lands — *to the glory of Elohim (God) the Father.* The Son exalted and named bears the divine Name, yet the whole movement ends in the Father''s glory: the Formed ordered under the One who exalted him.'),
  ('canon', 'philippians', 2, 7, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). Isaiah''s obedient Servant is *brought as a lamb to the slaughter,* silent and submitting — the very shape of the Formed who *made himself of no reputation, and took upon him the form of a servant* (Philippians 2:7). The hymn''s *form of a servant* is the Servant of Isaiah: not grasping at equality but emptying himself, taking the lowest place, the lamb who opened not his mouth.'),
  ('canon', 'philippians', 2, 8, 'canon', 'isaiah', 53, 8, 'free', E'*He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). The Servant was *cut off out of the land of the living* — stricken for the transgression of the people. So the Formed *humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). The death of the cross is the cutting-off of Isaiah''s Servant; the obedience-unto-death of the hymn is the obedient suffering of the One on whom Yahuah (LORD) laid the iniquity of us all.'),
  ('canon', 'philippians', 2, 10, 'canon', 'romans', 14, 11, 'free', E'*For it is written, As I live, saith Yahuah (Lord), every knee shall bow to me, and every tongue shall confess to Elohim (God).* (Romans 14:11). Paul cites the same Isaiah 45:23 oath in Romans, naming it the warrant that all shall stand before the judgment seat: *every knee shall bow to me, and every tongue shall confess to Elohim (God).* It is the twin of the hymn — *every knee should bow... every tongue should confess* (Philippians 2:10-11). The bowing knee and confessing tongue belong to Yahuah (Lord), and they belong to the Formed who bears his Name; the confession runs up to Elohim (God), to the Father''s glory.'),
  ('canon', 'philippians', 2, 9, 'canon', '1-corinthians', 15, 27, 'free', E'*For he hath put all things under his feet. But when he saith all things are put under him, it is manifest that he is excepted, which did put all things under him.* (1 Corinthians 15:27). Paul guards the very point the hymn makes: all things are subjected to the Son, *but... he is excepted, which did put all things under him* — the Father is not subjected, for it is the Father who subjects all to the Son and *highly exalted him, and given him a name which is above every name* (Philippians 2:9). The exaltation is BY the Father; the Formed receives the Name and the dominion from the One who ordered all under his feet, and renders the kingdom back to the Father.'),
  ('canon', 'philippians', 2, 6, 'canon', 'colossians', 1, 15, 'free', E'*Who is the image of the invisible Elohim (God), the firstborn of every creature:* (Colossians 1:15). The twin letter names the Formed as *the image of the invisible Elohim (God), the firstborn* — the One brought forth who shows the unseen Father. This is the *form of Elohim* of the hymn: *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God)* (Philippians 2:6). The image of the invisible Elohim is the form of Elohim; the Formed Son bears the Father''s glory as the firstborn, not a rival God but the One drawn out of the Formless to be his image.'),
  ('canon', 'philippians', 2, 6, 'canon', 'colossians', 1, 16, 'free', E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* (Colossians 1:16). All things in heaven and earth were created *by him* and *for him* — the same scope as the hymn''s every-knee, *things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The One in *the form of Elohim* (Philippians 2:6) is the One by whom all was made; the creation made through the Formed is the creation that bows to the Formed, the Father working all through the Son he brought forth.'),
  ('canon', 'philippians', 2, 6, 'canon', 'colossians', 2, 9, 'free', E'*For in him dwelleth all the fulness of the Godhead bodily.* (Colossians 2:9). In the Formed *dwelleth all the fulness of the Godhead bodily* — the fulness of the Father poured into the Son who took on flesh. This is the *form of Elohim* of the hymn made plain: *Who, being in the form of Elohim (God)* (Philippians 2:6). The fulness is the Father''s, dwelling bodily in the One brought forth; the Formed is not a second source but the bodily dwelling of the one Elohim (God)''s fulness, who then emptied himself and was exalted.'),
  ('canon', 'philippians', 2, 6, 'apocrypha', 'the-wisdom-of-solomon', 7, 25, 'extras', E'*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* (Wisdom 7:25). The Hebrew library beheld Wisdom as *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty* — brought forth from the One, sharing his glory, yet not a second God beside him. This is the same posture as the Formed who was *in the form of Elohim (God)* (Philippians 2:6): the glory flows out FROM the Almighty into the One brought forth. Read as the Formed, Wisdom''s breath-of-the-power is the Son who carries the Father''s glory as the One emptied and exalted, not a co-equal rival to the Father.'),
  ('canon', 'philippians', 2, 6, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'*For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom 7:26). Wisdom is *the brightness of the everlasting light... and the image of his goodness* — the radiance that shines out from the Father, the image that shows him. The hymn names the Formed in the same terms of derived glory: *being in the form of Elohim (God)* (Philippians 2:6), the One who is *the image of the invisible Elohim (God)* (Colossians 1:15). The brightness is OF the everlasting light; the image is OF his goodness — the Formed Son drawn from the Formless Father, bearing his glory and his Name, then humbling himself unto death and exalted by the Father.'),
  -- thread: philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3
  ('canon', 'philippians', 2, 3, 'apocrypha', 'ecclesiasticus', 3, 18, 'extras', E'*The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Sirach 3:18). The wisdom of the library teaches the very mind Paul commands: *The greater you are, the more humble thyself.* So Paul says, *in lowliness of mind let each esteem other better than themselves* (Philippians 2:3). The path to favour before Yahuah (God) is downward, the lowering of the self — the same descent the Formed himself walked, who being greatest *made himself of no reputation* and *humbled himself* (Philippians 2:7-8).'),
  ('canon', 'philippians', 2, 8, 'apocrypha', 'ecclesiasticus', 3, 18, 'extras', E'*The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Sirach 3:18). *The greater you are, the more humble thyself* — and the greatest of all walked it furthest: the Formed *humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). Sirach''s rule that humbling finds favour before Yahuah (God) is proven in the hymn, for it is precisely after the Formed humbled himself that *Elohim (God) also hath highly exalted him* (Philippians 2:9). The greater he was, the lower he went; the lower he went, the higher the Father raised him.'),
  -- thread: philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36
  ('canon', 'philippians', 2, 13, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The new-covenant promise is that Yahuah (LORD) himself will work the obedience from within: *I will put my spirit within you, and cause you to walk in my statutes.* Paul speaks this fulfilled: *work out your own salvation with fear and trembling. For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:12-13). The willing and the doing are Elohim''s (God''s) own work within — the Spirit causing the walk in the statutes, the obedience he gives and then crowns. This is not works-credential earning standing but the covenant-keeping Elohim (God) producing his will in his people.'),
  -- thread: philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12
  ('canon', 'philippians', 2, 15, 'canon', 'deuteronomy', 32, 5, 'free', E'*They have corrupted themselves, their spot is not the spot of his children: they are a perverse and crooked generation.* (Deuteronomy 32:5). Moses'' song names the faithless among the people *a perverse and crooked generation.* Paul takes the very phrase: *that ye may be blameless and harmless, the sons of Elohim (God), without rebuke, in the midst of a crooked and perverse nation* (Philippians 2:15). The called-out are the true *sons of Elohim (God)* — *his children* whose spot is not the spot of the corrupt — set as light in the midst of the crooked and perverse, the faithful remnant within the generation.'),
  ('canon', 'philippians', 2, 15, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Daniel saw the wise *shine as the brightness of the firmament... as the stars for ever and ever.* Paul says the blameless sons *shine as lights in the world* (Philippians 2:15), *holding forth the word of life* (Philippians 2:16). The shining of Daniel''s wise — those who turn many to righteousness — is the shining of the children of Elohim (God) who hold forth the word of life in the midst of a crooked nation, lights set against the dark.'),
  -- thread: philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28
  ('canon', 'philippians', 2, 17, 'canon', 'numbers', 28, 7, 'free', E'*And the drink offering thereof shall be the fourth part of an hin for the one lamb: in the holy place shalt thou cause the strong wine to be poured unto Yahuah (LORD) for a drink offering.* (Numbers 28:7). The Torah of the continual offering pours out wine *unto Yahuah (LORD) for a drink offering* alongside the lamb. Paul casts his own life in these very terms: *if I be offered upon the sacrifice and service of your faith, I joy, and rejoice with you all* (Philippians 2:17). His poured-out life is the drink offering atop the altar; the faith of the Philippians is the sacrifice, and Paul''s labour the wine poured over it unto Yahuah (LORD), with joy.'),
  ('canon', 'philippians', 2, 17, 'canon', 'exodus', 29, 40, 'free', E'*And with the one lamb a tenth deal of flour mingled with the fourth part of an hin of beaten oil; and the fourth part of an hin of wine for a drink offering.* (Exodus 29:40). The consecration offering joined to the daily lamb *the fourth part of an hin of wine for a drink offering* — the wine poured out for a sweet savour. Paul names his life that poured-out wine: *if I be offered upon the sacrifice and service of your faith, I joy, and rejoice with you all* (Philippians 2:17). His being *offered* is the drink offering of Exodus, his life spent over the sacrifice of their faith as the wine poured beside the lamb.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s231_ph02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s231_ph02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45',
       E'Every knee shall bow: the Formed emptied himself and was exalted by the Father (Isaiah 45)',
       E'*Let this mind be in you, which was also in HaMashiach Yahusha (Christ Jesus): Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant... he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:5-8). The hymn is the descent of the Formed — the Son drawn out of the Formless Father, who bears the Father''s own glory. The *form of Elohim* he was in is the divine glory he shares as the One brought forth, named in the twin letter: *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15); *by him were all things created* (Colossians 1:16); *in him dwelleth all the fulness of the Godhead bodily* (Colossians 2:9). The Hebrew library beheld the same derived glory in Wisdom: *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty* (Wisdom 7:25), *the brightness of the everlasting light... and the image of his goodness* (Wisdom 7:26) — the brightness flowing FROM the light, the image OF his goodness, never a second God beside the Father. Yet *equal with Elohim* is the very thing the Formed *thought it not robbery* to hold — he did not clutch at it; he laid it down. He took *the form of a servant,* the Servant of Isaiah *brought as a lamb to the slaughter* (Isaiah 53:7), *cut off out of the land of the living* (Isaiah 53:8), obedient unto the death of the cross. Then comes the turn, and it is the FATHER who acts: *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth; And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:9-11). The Name above every name is the Father''s own Name (YHWH) placed upon the Son; and the bowing of every knee is the oath Yahuah (LORD) swore by himself: *I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear* (Isaiah 45:23). The knee bows to the Name the Formed bears; Paul cites the same oath again — *As I live, saith Yahuah (Lord), every knee shall bow to me, and every tongue shall confess to Elohim (God)* (Romans 14:11). And mark the guard Paul keeps elsewhere on this exaltation: *he hath put all things under his feet. But... he is excepted, which did put all things under him* (1 Corinthians 15:27) — the Father is not subjected; the Father subjects all to the Son and renders him the Name. The whole movement ends not in the Son''s self-glory but *to the glory of Elohim (God) the Father.* This is the Formed Son, ordered under the Father — emptied, obedient, exalted BY the Father, bearing the Name, every knee bowing to the Father''s glory. Not a co-equal-persons proof-text, not a modalist collapse of Father into Son, not a created or mere-man Christology: the One brought forth from the Formless, who carried the divine glory, laid it down, and was lifted up by the hand of the One who sent him.',
       sv.verse_id, ev.verse_id, 'extras', 7585
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3',
       E'Let each esteem other better: the greater thou art, the more humble thyself (Sirach 3)',
       E'Paul commands the mind that the hymn will embody: *Let nothing be done through strife or vainglory; but in lowliness of mind let each esteem other better than themselves* (Philippians 2:3). The wisdom of the library taught the same descent: *The greater you are, the more humble thyself, and you shall find favour before Yahuah (God)* (Sirach 3:18). The way up is down; favour before Yahuah (God) is found by the one who lowers himself. And the greatest of all walked it furthest — the Formed who *made himself of no reputation* and *humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:7-8). Sirach''s rule is proven in the hymn: it is precisely after the Formed humbled himself that *Elohim (God) also hath highly exalted him* (Philippians 2:9). The greater he was, the lower he went; the lower he went, the higher the Father raised him. So the called-out are to esteem one another better, walking the same downward road that ends in the Father''s exalting hand.',
       sv.verse_id, ev.verse_id, 'extras', 7588
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36',
       E'It is Elohim which worketh in you both to will and to do (Ezekiel 36)',
       E'*Wherefore, my beloved, as ye have always obeyed... work out your own salvation with fear and trembling. For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:12-13). The working-out is real obedience, but its source is Elohim (God) himself working within — the new-covenant promise Ezekiel spoke: *A new heart also will I give you, and a new spirit will I put within you... And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:26-27). The will and the deed are Yahuah''s (LORD''s) own work in his people — the Spirit causing them to walk in the statutes, the obedience he gives and then crowns. This is no works-credential earning standing before Elohim (God); it is the covenant-keeping Elohim (God) producing his good pleasure from within, so that the obedience the people *do* is the obedience he himself *worketh.* The keeping of the judgments is not abolished but written on the heart and wrought by the Spirit.',
       sv.verse_id, ev.verse_id, 'free', 7591
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12',
       E'Blameless sons shining as lights in a crooked and perverse nation (Deuteronomy 32, Daniel 12)',
       E'*That ye may be blameless and harmless, the sons of Elohim (God), without rebuke, in the midst of a crooked and perverse nation, among whom ye shine as lights in the world; Holding forth the word of life* (Philippians 2:15-16). Paul lifts the phrase straight from the song of Moses, which named the faithless among the people *a perverse and crooked generation* whose *spot is not the spot of his children* (Deuteronomy 32:5). The called-out are the true *sons of Elohim (God)* — his children — set as light in the midst of the crooked and perverse, the faithful remnant within the generation. And their shining is the shining Daniel saw at the end: *they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). The blameless sons who *shine as lights in the world,* holding forth the word of life, are Daniel''s wise — those who turn many to righteousness, set as stars against the dark of a crooked nation.',
       sv.verse_id, ev.verse_id, 'free', 7594
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28',
       E'Offered upon the sacrifice of your faith: the drink offering poured out (Numbers 28, Exodus 29)',
       E'*Yea, and if I be offered upon the sacrifice and service of your faith, I joy, and rejoice with you all* (Philippians 2:17). Paul casts his own life in the language of the Torah''s continual offering — the drink offering poured out beside the daily lamb. *In the holy place shalt thou cause the strong wine to be poured unto Yahuah (LORD) for a drink offering* (Numbers 28:7); *the fourth part of an hin of wine for a drink offering... for a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:40-41). The faith of the Philippians is the sacrifice on the altar; Paul''s poured-out life is the wine poured over it, *offered* unto Yahuah (LORD) as the drink offering atop the lamb. He does not grieve the pouring-out — *I joy, and rejoice with you all* — for a life spent over the sacrifice of their faith is a sweet savour, the drink offering of the Torah fulfilled in a servant poured out for the gathered.',
       sv.verse_id, ev.verse_id, 'free', 7597
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 45:23 — *unto me every knee shall bow* Yahuah''s (LORD''s) own oath; *at the name of Yahusha (Jesus) every knee should bow* (Philippians 2:10), the knee bowing to the Name the Formed bears.'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:23 — *every tongue shall swear* the second half of the oath; *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:7 — *brought as a lamb to the slaughter... so he openeth not his mouth* the obedient Servant; the Formed *took upon him the form of a servant* (Philippians 2:7).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:8 — *cut off out of the land of the living... for the transgression of my people* the Servant''s death; the Formed *became obedient unto death, even the death of the cross* (Philippians 2:8).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 14:11 — *As I live, saith Yahuah (Lord), every knee shall bow to me* the same Isaiah-45 oath; the twin of *every knee should bow... every tongue should confess* (Philippians 2:10-11).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 15:27 — *he is excepted, which did put all things under him* the Father not subjected; the Father *highly exalted him, and given him a name which is above every name* (Philippians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Colossians 1:15 — *the image of the invisible Elohim (God), the firstborn of every creature* the Formed who shows the unseen Father; *being in the form of Elohim (God)* (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Colossians 1:16 — *by him were all things created... all things were created by him, and for him* the same scope as the every-knee, *things in heaven, and things in earth* (Philippians 2:10).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Colossians 2:9 — *in him dwelleth all the fulness of the Godhead bodily* the Father''s fulness dwelling in the Formed; the *form of Elohim (God)* made plain (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Wisdom 7:25 — *the breath of the power of Yahuah (God)... flowing from the glory of the Almighty* derived glory, brought forth from the One; the Formed *in the form of Elohim (God)* (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Wisdom 7:26 — *the brightness of the everlasting light... and the image of his goodness* the radiance OF the Father, the Formed witness; the *form of Elohim (God)* (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 3:18 — *The greater you are, the more humble thyself, and you shall find favour before Yahuah (God)* the wisdom of lowering; *let each esteem other better than themselves* (Philippians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 3:18 — *the more humble thyself, and you shall find favour before Yahuah (God)* proven in the hymn: the Formed *humbled himself* (Philippians 2:8) and so the Father *highly exalted him* (Philippians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the obedience Yahuah (LORD) works from within; *it is Elohim (God) which worketh in you both to will and to do* (Philippians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:5 — *they are a perverse and crooked generation* the phrase Paul lifts; the sons of Elohim (God) shine *in the midst of a crooked and perverse nation* (Philippians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that be wise shall shine as the brightness of the firmament... as the stars for ever* the shining of the wise; the blameless sons *shine as lights in the world* (Philippians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 28:7 — *the strong wine to be poured unto Yahuah (LORD) for a drink offering* the wine poured beside the lamb; *if I be offered upon the sacrifice... of your faith* (Philippians 2:17).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 29:40 — *the fourth part of an hin of wine for a drink offering* the drink offering of the daily lamb; Paul''s life *offered upon the sacrifice and service of your faith* (Philippians 2:17).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_philippians_03.sql (S231 Philippians 3) -----
-- =====================================================================
-- S231 minion — PHILIPPIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: PHILIPPIANS 3 (21 verses) — the flesh-credential / "the righteousness which is of the law."
-- Tag: ph03 (temp view _s231_ph03_lookup).
-- Sort band: floor 7610, step 3 (7610, 7613, 7616, 7619, 7622 used; under 7635).
-- Source is ALWAYS the canon Philippians verse; targets span Tanakh + NT, woven (no extras warranted this chapter).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (BLESSING CHAPTER). Paul writes from prison to the called-out ones — Yashar'el (Israel)
-- and the grafted-in seed of the nations. ★★ What Paul counts loss in 3:4-9 is the FLESH-CREDENTIAL BOAST
-- — pedigree and Torah-keeping wielded as a self-made claim that boasts before Elohim — NOT Torah-obedience
-- itself and NOT the Torah abolished. He says he WAS *blameless* touching the law (3:6); he counts his OWN
-- righteousness (self-achieved legal standing) loss, set against *the righteousness which is of Elohim (God)
-- by faith* (3:9) — the gift-righteousness of Genesis 15:6, Habakkuk 2:4, Jeremiah 23:6 (Yahuah our
-- righteousness). The *concision* / *dogs* (3:2) = the mutilation/credential party (same opponents as
-- Galatians). This is the SIBLING of Ephesians 2:8-9 (the boast excluded) and Galatians works-of-the-flesh.
-- 3:9 is NEVER "the Torah is dung/abolished"; the excluded thing is the self-righteous boast, the embraced
-- thing is the faith-righteousness the prophets promised. *Our conversation (citizenship) is in heaven*
-- (3:20) = the Jerusalem above, the gathered commonwealth, not a new institution replacing Yashar'el (Israel).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     Finally, my brethren, rejoice in Yahuah (Lord)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (carried in ch4 rejoice block)
--   v.2-3   beware of the concision; we are the circumcision, worship in the spirit, no confidence in the flesh
--           Tanakh: Deuteronomy 10:16 (circumcise the foreskin of your heart), Jeremiah 9:23-26 (let him that
--                   glorieth glory in knowing me; all the house of Yashar'el uncircumcised in the heart)
--           Extras: none warranted   NT: none warranted (the concision/Galatians weight carried in prose)
--   v.4-6   the flesh-catalogue: circumcised the eighth day... touching the righteousness in the law, blameless
--           Tanakh: Genesis 17:12 (he that is eight days old shall be circumcised), Leviticus 12:3 (in the
--                   eighth day the flesh of his foreskin shall be circumcised)
--           Extras: none warranted   NT: none warranted
--   v.7-9   I count all things loss... not having mine own righteousness, but the righteousness of Elohim by faith
--           Tanakh: Genesis 15:6 (he believed in Yahuah; he counted it for righteousness), Habakkuk 2:4 (the
--                   just shall live by his faith), Jeremiah 23:6 (Yahuah Tsidkenu, THE LORD OUR RIGHTEOUSNESS)
--           Extras: none warranted   NT: Romans 10:3 (going about to establish their own righteousness),
--                   Romans 4:3-5 (Abraham believed, counted for righteousness; to him that worketh not),
--                   Romans 9:30-32 (the righteousness which is of faith vs the law sought by works)
--   v.10-16 that I may know him and the power of his resurrection; I press toward the mark
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (resurrection-body carried at v.21)
--   v.17-19 the enemies of the cross, whose Elohim is their belly, whose glory is in their shame
--           Tanakh: none warranted (Hosea 4:7 weighed; a single allusive phrase, not load-bearing)
--           Extras: none warranted   NT: none warranted
--   v.20    our conversation is in heaven; from whence we look for the Saviour
--           Tanakh: none warranted   Extras: none warranted   NT: Galatians 4:26 (Jerusalem which is above
--                   is free, the mother of us all), Hebrews 11:10 (a city which hath foundations), Hebrews
--                   11:16 (a better country, an heavenly; he hath prepared for them a city)
--   v.21    who shall change our vile body, fashioned like unto his glorious body
--           Tanakh: Daniel 12:2-3 (many that sleep in the dust shall awake; the wise shall shine)
--           Extras: 2 Esdras / 2 Baruch transformed body weighed — none warranted (canon witnesses carry it cleanly)
--           NT: 1 Corinthians 15:42-53 (sown in corruption, raised in incorruption; we shall all be changed)
--
-- THREADS (slug -> target libraries):
--   7610 philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9   (Tanakh)
--   7613 philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12  (Tanakh)
--   7616 philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2  (Tanakh + NT)  [BLESSING]
--   7619 philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11  (NT)
--   7622 philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s231_ph03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9
  ('canon', 'philippians', 3, 3, 'canon', 'deuteronomy', 10, 16, 'free', E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16). The command of the Torah itself was never the outward sign alone but the heart it pointed to — *circumcise... the foreskin of your heart.* Paul says *we are the circumcision, which worship Elohim (God) in the spirit, and rejoice in HaMashiach Yahusha (Christ Jesus), and have no confidence in the flesh* (Philippians 3:3). This is not the abolition of circumcision but its truest meaning: the people of the heart-circumcision, who serve in the spirit and lay down the flesh-boast. Paul stands on Moses, not against him — the inward circumcision the Torah always required.'),
  ('canon', 'philippians', 3, 3, 'canon', 'jeremiah', 9, 23, 'free', E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches:* (Jeremiah 9:23). Yahuah (LORD) forbids the flesh-boast and names the only true ground: *But let him that glorieth glory in this, that he understandeth and knoweth me* (Jeremiah 9:24). Paul speaks the same word when he says we *have no confidence in the flesh* (Philippians 3:3) but *rejoice in HaMashiach Yahusha (Christ Jesus)* — the glorying transferred from wisdom, might, and pedigree to the knowledge of Yahuah (LORD) himself. The credential-boast of v.4-6 is exactly the wise-man''s and mighty-man''s glory Jeremiah condemned.'),
  ('canon', 'philippians', 3, 3, 'canon', 'jeremiah', 9, 26, 'free', E'*Egypt, and Yahudah (Judah), and Edom, and the children of Ammon, and Moab, and all that are in the utmost corners, that dwell in the wilderness: for all these nations are uncircumcised, and all the house of Yashar''el (Israel) are uncircumcised in the heart.* (Jeremiah 9:26). Jeremiah declares that outward circumcision profits nothing while the heart stays *uncircumcised* — even *all the house of Yashar''el (Israel)* are reckoned uncircumcised when the heart is not. This is the very distinction Paul presses: the circumcision that counts is they *which worship Elohim (God) in the spirit... and have no confidence in the flesh* (Philippians 3:3), against the *concision* (Philippians 3:2) who trust the cut flesh as a credential. The prophet already taught that the flesh-mark without the heart is no circumcision at all.'),
  -- thread: philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12
  ('canon', 'philippians', 3, 5, 'canon', 'genesis', 17, 12, 'free', E'*And he that is eight days old shall be circumcised among you, every man child in your generations, he that is born in the house, or bought with money of any stranger, which is not of thy seed.* (Genesis 17:12). The eighth-day circumcision is the very *token of the covenant* (Genesis 17:11) Yahuah (LORD) gave Abraham. Paul names it first in his flesh-catalogue: *Circumcised the eighth day, of the stock of Yashar''el (Israel)* (Philippians 3:5). He recites it not to despise the covenant-sign but to show that even the fullest pedigree — kept exactly to the Torah''s day — is *loss* when wielded as a self-made claim. The sign is honourable; the boast in the sign is the thing counted loss.'),
  ('canon', 'philippians', 3, 5, 'canon', 'leviticus', 12, 3, 'free', E'*And in the eighth day the flesh of his foreskin shall be circumcised.* (Leviticus 12:3). The Torah fixes the day exactly — *in the eighth day* — and Paul''s credential is that he was *circumcised the eighth day* (Philippians 3:5), Torah-perfect from infancy, *touching the righteousness which is in the law, blameless* (Philippians 3:6). The point is not that the eighth-day command fell away but that flawless Torah-keeping, held as a flesh-boast, cannot stand as one''s *own righteousness.* Paul kept the day; he counts the boast in the day loss for the excellency of the knowledge of HaMashiach (Christ).'),
  -- thread: philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2  [BLESSING]
  ('canon', 'philippians', 3, 9, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). The faith-righteousness Paul embraces is no new thing — it is the righteousness Abraham received before any work, when *he believed in Yahuah (LORD); and he counted it to him for righteousness.* Paul desires to *be found in him, not having mine own righteousness, which is of the law, but that which is through the faith of Messiah (Christ), the righteousness which is of Elohim (God) by faith* (Philippians 3:9). What he sets aside is *mine own righteousness* — legal standing achieved as a credential — not the Instruction; what he embraces is the gift-righteousness counted to Abraham, the righteousness *of Elohim (God),* reckoned to faith.'),
  ('canon', 'philippians', 3, 9, 'canon', 'habakkuk', 2, 4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4). Against *his soul which is lifted up* — the proud, self-exalted man — stands the word *the just shall live by his faith.* This is the very contrast Paul draws: not his own lifted-up righteousness *which is of the law,* but *the righteousness which is of Elohim (God) by faith* (Philippians 3:9). The prophet already set the proud flesh-boast over against the life that comes by trusting Yahuah (LORD); Paul counts the flesh-credential *dung* (Philippians 3:8) precisely so he may live the just-by-faith life Habakkuk named.'),
  ('canon', 'philippians', 3, 9, 'canon', 'jeremiah', 23, 6, 'free', E'*In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS).* (Jeremiah 23:6). The righteous Branch raised unto David bears the name *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* — the righteousness that is Yahuah''s own gift, not man''s achievement. This is *the righteousness which is of Elohim (God) by faith* (Philippians 3:9) that Paul will not trade for *mine own righteousness, which is of the law.* The prophet promised a King whose very name is the people''s righteousness; Paul is *found in him,* clothed not in his flesh-credential but in the righteousness Yahuah (LORD) himself supplies.'),
  ('canon', 'philippians', 3, 9, 'canon', 'romans', 10, 3, 'free', E'*For they being ignorant of Elohim''s (God''s) righteousness, and going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God).* (Romans 10:3). Paul names the exact error elsewhere: *going about to establish their own righteousness,* refusing to submit to *the righteousness of Elohim (God).* It is word-for-word the choice of Philippians: *not having mine own righteousness, which is of the law, but... the righteousness which is of Elohim (God) by faith* (Philippians 3:9). The fault was never zeal for Torah — Yashar''el (Israel) *have a zeal of Elohim (God)* (Romans 10:2) — but the self-made standing wielded in place of the gift. The thing rejected is the *own righteousness,* not the law.'),
  ('canon', 'philippians', 3, 9, 'canon', 'romans', 4, 5, 'free', E'*But to him that worketh not, but believeth on him that justifieth the ungodly, his faith is counted for righteousness.* (Romans 4:5). The pattern of Abraham — *his faith is counted for righteousness* — is the same gift Paul seeks to *be found in,* the righteousness *through the faith of Messiah (Christ), the righteousness which is of Elohim (God) by faith* (Philippians 3:9). And Abraham received it *not in circumcision, but in uncircumcision* (Romans 4:10), before the flesh-sign — proof that the credential never earned it. The righteousness Paul will not surrender for pedigree is the reckoned righteousness of faith that came to Abraham as a gift.'),
  ('canon', 'philippians', 3, 9, 'canon', 'romans', 9, 31, 'free', E'*But Yashar''el (Israel), which followed after the law of righteousness, hath not attained to the law of righteousness. Wherefore? Because they sought it not by faith, but as it were by the works of the law.* (Romans 9:31-32). The failure was in the seeking — *not by faith, but as it were by the works of the law,* the law turned into a flesh-credential. The same diagnosis governs Philippians: Paul lays down *mine own righteousness, which is of the law,* for *the righteousness which is of Elohim (God) by faith* (Philippians 3:9). The Gentiles *attained to righteousness, even the righteousness which is of faith* (Romans 9:30) — the gift Paul presses toward — while the works-credential, however blameless, *attained* nothing.'),
  -- thread: philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11
  ('canon', 'philippians', 3, 20, 'canon', 'galatians', 4, 26, 'free', E'*But Jerusalem which is above is free, which is the mother of us all.* (Galatians 4:26). Paul names the homeland of the called-out ones: *Jerusalem which is above is free, which is the mother of us all.* This is the citizenship he means when he writes *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). Not an escape from the earth nor a new people replacing Yashar''el (Israel), but the free Jerusalem above — the gathered commonwealth of the children of promise, awaiting the Saviour who will come down from it.'),
  ('canon', 'philippians', 3, 20, 'canon', 'hebrews', 11, 10, 'free', E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God).* (Hebrews 11:10). Abraham, a stranger in the land of promise, *looked for a city which hath foundations, whose builder and maker is Elohim (God)* — the same forward look Paul describes: *our conversation is in heaven; from whence also we look for the Saviour* (Philippians 3:20). The patriarchs and the called-out ones share one citizenship and one hope: the city Elohim (God) himself builds, from which the Saviour comes. To have one''s conversation in heaven is to be of Abraham''s pilgrim company, seeking the founded city.'),
  ('canon', 'philippians', 3, 20, 'canon', 'hebrews', 11, 16, 'free', E'*But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* (Hebrews 11:16). The faithful *desire a better country, that is, an heavenly,* for which Elohim (God) *hath prepared for them a city.* This is the homeland of Paul''s citizens whose *conversation is in heaven* (Philippians 3:20) — strangers and pilgrims on the earth, belonging to the heavenly country and the prepared city. The heavenly citizenship is not a status that erases Yashar''el (Israel) but the consummation of the very promise the fathers died still believing.'),
  -- thread: philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15
  ('canon', 'philippians', 3, 21, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Daniel saw the resurrection of the body — *many of them that sleep in the dust of the earth shall awake* — and the wise who *shall shine as the brightness of the firmament* (Daniel 12:3). Paul names the same hope: the Saviour *shall change our vile body, that it may be fashioned like unto his glorious body* (Philippians 3:21). The dust-sleepers raised to everlasting life and the transformed glorious body are one promise; the citizens of heaven await not a fleshless escape but the awakening and glorifying of the body Daniel foretold.'),
  ('canon', 'philippians', 3, 21, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). The raised wise *shall shine as the brightness of the firmament... as the stars for ever and ever* — bodies transfigured in glory. This is *his glorious body* unto which the vile body is *fashioned like* when the Saviour *shall change our vile body* (Philippians 3:21). Daniel''s shining ones and Paul''s glorified citizens are the same: the bodily resurrection brought to the brightness of the stars, by the power whereby he is *able even to subdue all things unto himself.*'),
  ('canon', 'philippians', 3, 21, 'canon', '1-corinthians', 15, 43, 'free', E'*It is sown in dishonour; it is raised in glory: it is sown in weakness; it is raised in power:* (1 Corinthians 15:43). Paul unfolds the change of the body: *sown in dishonour; raised in glory... sown in weakness; raised in power.* This is the very transformation of Philippians — the Saviour *shall change our vile body, that it may be fashioned like unto his glorious body* (Philippians 3:21). The vile body of dishonour and weakness is raised glorious and powerful; the *natural body* sown becomes the *spiritual body* (1 Corinthians 15:44), conformed to the risen Messiah (Christ).'),
  ('canon', 'philippians', 3, 21, 'canon', '1-corinthians', 15, 52, 'free', E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). At the last trump *the dead shall be raised incorruptible, and we shall be changed* — *this corruptible must put on incorruption, and this mortal must put on immortality* (1 Corinthians 15:53). This is the changing of the body Paul promises the Philippians: the Saviour *shall change our vile body, that it may be fashioned like unto his glorious body* (Philippians 3:21). The corruptible, mortal, vile body is changed and clothed in the incorruption of his glorious body — the one hope of the citizens who look for the Saviour from heaven.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s231_ph03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s231_ph03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9',
       E'No confidence in the flesh: circumcise the heart and glory in knowing Yahuah (Deuteronomy 10, Jeremiah 9)',
       E'Paul warns *Beware of dogs, beware of evil workers, beware of the concision* (Philippians 3:2) — the mutilation party who preach the cut flesh as a credential — and answers, *For we are the circumcision, which worship Elohim (God) in the spirit, and rejoice in HaMashiach Yahusha (Christ Jesus), and have no confidence in the flesh* (Philippians 3:3). This is not the abolition of circumcision but its truest meaning, taught by the Torah itself: *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). The command always pointed past the flesh-mark to the heart. Jeremiah pressed it further: outward circumcision profits nothing while the heart stays uncircumcised — *all the house of Yashar''el (Israel) are uncircumcised in the heart* (Jeremiah 9:26). And against every flesh-boast Yahuah (LORD) set the only true ground of glorying: *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches: But let him that glorieth glory in this, that he understandeth and knoweth me* (Jeremiah 9:23-24). Paul''s catalogue of pedigree in the next verses is exactly the wise-man''s and mighty-man''s glory Jeremiah condemned; the people of the heart-circumcision lay it down and glory instead in knowing Yahuah (LORD). Paul stands on Moses and the prophets, not against them — the inward circumcision the Torah always required, the worship in the spirit, the glorying transferred from the flesh to the knowledge of Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 7610
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12',
       E'Circumcised the eighth day: the token of the covenant kept Torah-perfect (Genesis 17, Leviticus 12)',
       E'Paul opens his flesh-catalogue with the covenant-sign, kept to the very day the Torah commands: *Circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee* (Philippians 3:5). The eighth day is no accident of memory but the exact command Yahuah (LORD) gave Abraham: *And he that is eight days old shall be circumcised among you, every man child in your generations* (Genesis 17:12), the sign Yahuah (LORD) called *a token of the covenant betwixt me and you* (Genesis 17:11). The Torah fixes it again: *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3). Paul was Torah-perfect from infancy, *touching the righteousness which is in the law, blameless* (Philippians 3:6) — and that is precisely the point. He recites the flawless credential not to despise the covenant-sign, which is honourable, but to show that even the fullest, most exact obedience cannot stand as one''s *own righteousness* when it is wielded as a self-made claim before Elohim (God). *But what things were gain to me, those I counted loss for Messiah (Christ)* (Philippians 3:7). He kept the eighth-day sign; what he counts loss is the boast in it. The Instruction is not refuse — the flesh-credential held against the gift-righteousness of Elohim (God) is.',
       sv.verse_id, ev.verse_id, 'free', 7613
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2',
       E'The righteousness which is of Elohim by faith, not the flesh-credential (Genesis 15, Habakkuk 2, Jeremiah 23)',
       E'This is the heart of the chapter, and the reading must be guarded. Paul writes, *Yea doubtless, and I count all things but loss for the excellency of the knowledge of HaMashiach Yahusha (Christ Jesus) my Lord: for whom I have suffered the loss of all things, and do count them but dung, that I may win Messiah (Christ), And be found in him, not having mine own righteousness, which is of the law, but that which is through the faith of Messiah (Christ), the righteousness which is of Elohim (God) by faith* (Philippians 3:8-9). What Paul counts loss and dung is the FLESH-CREDENTIAL BOAST — pedigree and Torah-keeping wielded as a self-made claim that boasts before Elohim (God) — NOT Torah-obedience itself, and NOT the Torah abolished. He has just said he was *blameless* touching the law (Philippians 3:6); he does not call the law refuse, he calls *mine own righteousness* — legal standing achieved as a credential — refuse, and sets it against *the righteousness which is of Elohim (God) by faith.* That faith-righteousness is no new thing the prophets did not know. It is the righteousness Abraham received before any work: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). It is the life Habakkuk named over against the proud, self-exalted soul: *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). It is the King whose very name is the people''s righteousness: *this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6). Paul names the same choice elsewhere word-for-word: Yashar''el (Israel), *going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God)* (Romans 10:3) — and the fault was never their zeal for Torah but the self-made standing wielded in place of the gift, *not by faith, but as it were by the works of the law* (Romans 9:32). Abraham himself received the reckoned righteousness *not in circumcision, but in uncircumcision* (Romans 4:10), *his faith... counted for righteousness* (Romans 4:5), proof the credential never earned it. So the excluded thing is the self-righteous boast; the embraced thing is the faith-righteousness the prophets promised. Paul kept the law blameless and counts the BOAST loss, not the Instruction — that he may be found in HaMashiach (Christ), clothed in the righteousness Yahuah (LORD) himself supplies.',
       sv.verse_id, ev.verse_id, 'free', 7616
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11',
       E'Our conversation is in heaven: the free Jerusalem above and the city whose builder is Elohim (Galatians 4, Hebrews 11)',
       E'*For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). The citizenship Paul names is the Jerusalem above — *But Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26) — not an escape from the earth nor a new people replacing Yashar''el (Israel), but the free homeland of the children of promise, the gathered commonwealth. It is the same forward look the fathers had: Abraham *looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10), and all the faithful *desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). To have one''s conversation in heaven is to belong to Abraham''s pilgrim company — strangers and pilgrims on the earth, citizens of the heavenly country, awaiting the Saviour who comes down from it. The heavenly citizenship is not a status that erases Yashar''el (Israel) but the consummation of the very promise the patriarchs died still believing.',
       sv.verse_id, ev.verse_id, 'free', 7619
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15',
       E'Who shall change our vile body: the dust-sleepers raised and made to shine (Daniel 12, 1 Corinthians 15)',
       E'The Saviour we look for from heaven *shall change our vile body, that it may be fashioned like unto his glorious body, according to the working whereby he is able even to subdue all things unto himself* (Philippians 3:21). The hope of the heavenly citizens is not a fleshless escape but the resurrection and glorifying of the body, exactly as Daniel foretold: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life... And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:2-3). The dust-sleepers raised to everlasting life and made to shine as the stars are the transformed glorious body Paul names. Paul unfolds the change in full: *It is sown in dishonour; it is raised in glory: it is sown in weakness; it is raised in power* (1 Corinthians 15:43); and *In a moment, in the twinkling of an eye, at the last trump... the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52), *for this corruptible must put on incorruption, and this mortal must put on immortality* (1 Corinthians 15:53). The vile body of dishonour, weakness, and corruption is raised glorious, powerful, and incorruptible — *fashioned like unto his glorious body,* conformed to the risen Messiah (Christ). Daniel''s shining ones and Paul''s glorified citizens are one promise: the bodily resurrection brought to the brightness of the stars, by the power whereby he subdues all things unto himself.',
       sv.verse_id, ev.verse_id, 'free', 7622
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:16 — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* the Torah''s own demand for the inward circumcision; the people who *worship Elohim (God) in the spirit... and have no confidence in the flesh* (Philippians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 9:23 — *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might* the flesh-boast Yahuah (LORD) forbids; *no confidence in the flesh,* the glorying transferred to knowing him (Philippians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 9:26 — *all the house of Yashar''el (Israel) are uncircumcised in the heart* the flesh-mark without the heart is no circumcision; the *concision* (Philippians 3:2) who trust the cut flesh as a credential.'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:12 — *he that is eight days old shall be circumcised among you* the covenant-sign Yahuah (LORD) gave Abraham; Paul *circumcised the eighth day* (Philippians 3:5), Torah-perfect from infancy.'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 12:3 — *in the eighth day the flesh of his foreskin shall be circumcised* the Torah fixes the exact day; Paul kept it, yet counts the boast in it loss, *touching the righteousness which is in the law, blameless* (Philippians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* the gift-righteousness Abraham received before any work; *the righteousness which is of Elohim (God) by faith* (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:4 — *the just shall live by his faith,* set against *his soul which is lifted up*; the proud flesh-boast vs the life of faith Paul embraces (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 23:6 — *this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* the King whose name is the people''s righteousness; the gift Paul will not trade for *mine own righteousness, which is of the law* (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 10:3 — *going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God)* the exact parallel; the rejected thing is the *own righteousness,* not the law (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:5 — *to him that worketh not, but believeth... his faith is counted for righteousness* Abraham''s pattern, received before the flesh-sign; the reckoned righteousness Paul seeks (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 9:31 — *Yashar''el (Israel), which followed after the law of righteousness... sought it not by faith, but as it were by the works of the law* the law turned into a credential; the same diagnosis as Philippians 3:9.'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 4:26 — *Jerusalem which is above is free, which is the mother of us all* the homeland of the called-out ones; *our conversation is in heaven* (Philippians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:10 — *a city which hath foundations, whose builder and maker is Elohim (God)* Abraham''s forward look, shared by the heavenly citizens (Philippians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:16 — *they desire a better country, that is, an heavenly... he hath prepared for them a city* the heavenly homeland of the pilgrim faithful; the citizenship whose *conversation is in heaven* (Philippians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life* the bodily resurrection; the *vile body* changed by the Saviour (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that be wise shall shine as the brightness of the firmament... as the stars for ever and ever* the transfigured glory; *his glorious body* unto which the vile body is fashioned (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:43 — *sown in dishonour; raised in glory: sown in weakness; raised in power* the change of the body; the vile body *fashioned like unto his glorious body* (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:52 — *the dead shall be raised incorruptible, and we shall be changed* at the last trump; the corruptible, mortal, vile body changed and clothed in incorruption (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_philippians_04.sql (S231 Philippians 4) -----
-- =====================================================================
-- S231 minion — PHILIPPIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: PHILIPPIANS 4 (23 verses) — the closing exhortation: rejoice in Yahuah (Lord),
--   the peace of Elohim, think on these things, the sweet-savour gift, my Elohim shall supply.
-- Tag: ph04 (temp view _s231_ph04_lookup).
-- Sort band: floor 7635, step 3 (7635, 7638, 7641, 7644 used; under 7660).
-- Source is ALWAYS the canon Philippians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul closes his letter to the called-out ones at Philippi — Israel and the
-- grafted-in seed of the nations, partners in the gospel. The chapter's roots all run back into
-- the Tanakh and the Hebrew library: the names written in the book of life (the heavenly tablets,
-- the book of remembrance), the nearness of Yahuah (Lord) to all who call on him, the peace of
-- the mind stayed on him, the sweet-savour offering ascending from Sinai's altar, and the
-- Shepherd who supplies every need. Same Yahuah, same covenant care; the apostle's exhortation is
-- the Tanakh's own promise re-spoken to the gathered assembly. No replacement theology, no
-- law-vs-grace antithesis — the sweet savour of v.18 is the very burnt-offering odour of Genesis
-- and Leviticus, gathered up into the partners' gift.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   stand fast in Yahuah (Lord); Euodias and Syntyche of the same mind
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral, no load-bearing parallel)
--   v.3     whose names are in the book of life
--           Tanakh: Exodus 32:32-33 (blot me out of thy book), Daniel 12:1 (every one found written in
--                   the book), Malachi 3:16 (a book of remembrance written before him)
--           Extras: 1 Enoch 47:3 (the books of the living opened before the Head of Days),
--                   1 Enoch 104:2 (I have beheld the books of life), 1 Enoch 108:3 (their names blotted
--                   out of the book of life) — STRONG extras, the heavenly tablets / books of the living
--           NT: carried in the apparatus elsewhere (Rev 20:12); not duplicated here
--   v.4     rejoice in Yahuah (Lord) alway
--           Tanakh: none warranted (rejoice-in-Yahuah is pervasive but no single load-bearing root for ch4)
--           Extras: none warranted   NT: none warranted
--   v.5-7   Yahuah (Lord) is at hand; the peace of Elohim which passeth all understanding
--           Tanakh: Psalm 145:18 (nigh unto all them that call upon him), Psalm 34:18 (nigh unto them
--                   of a broken heart), Isaiah 26:3 (kept in perfect peace, the mind stayed on thee)
--           Extras: none warranted   NT: none warranted
--   v.8-9   think on these things; the Elohim of peace shall be with you
--           Tanakh: none warranted   Extras: weighed Wisdom on virtue — none warranted (the virtue-list
--                   is paraenetic, no single verse re-spoken)   NT: none warranted
--   v.10-13 content in whatsoever state; I can do all things through Messiah
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.14-18 the sweet-savour gift: an odour of a sweet smell, a sacrifice acceptable
--           Tanakh: Genesis 8:21 (Yahuah smelled a sweet savour), Exodus 29:18 (a sweet savour, an
--                   offering made by fire), Leviticus 1:9 (a burnt sacrifice... of a sweet savour)
--           Extras: none warranted   NT: none warranted
--   v.19    my Elohim shall supply all your need
--           Tanakh: Psalm 23:1 (Yahuah is my shepherd; I shall not want)
--           Extras: none warranted   NT: none warranted
--   v.20-23 doxology and salutations
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7635 philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12   (Tanakh + Extras)  [STRONG extras]
--   7638 philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26  (Tanakh)
--   7641 philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1  (Tanakh)
--   7644 philippians-4-my-elohim-shall-supply-all-your-need-psalm-23  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s231_ph04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12
  ('canon', 'philippians', 4, 3, 'canon', 'exodus', 32, 32, 'free', E'*Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* (Exodus 32:32). Moses knew of a book Yahuah (LORD) had written, in which the names of his people stand; he pleads to be blotted out rather than see Yashar''el (Israel) perish, and Yahuah (LORD) answers, *Whosoever hath sinned against me, him will I blot out of my book* (Exodus 32:33). Paul speaks of that same register when he names his fellowlabourers *whose names are in the book of life* (Philippians 4:3). The book Moses appealed to at Sinai is the book in which the Philippian partners are written — one covenant ledger, kept by the same Elohim from the mountain to the assembly.'),
  ('canon', 'philippians', 4, 3, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Daniel learns that deliverance in the day of trouble belongs to *every one that shall be found written in the book.* This is the book of life Paul names — *whose names are in the book of life* (Philippians 4:3); to be written there is to be among the delivered people. The labourers in the gospel at Philippi are enrolled in the very book that secures the children of the covenant in the last great trouble.'),
  ('canon', 'philippians', 4, 3, 'canon', 'malachi', 3, 16, 'free', E'*Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16). Yahuah (LORD) keeps *a book of remembrance* for those who fear him and think upon his name — and they shall be his *in that day when I make up my jewels* (Malachi 3:17). Paul writes that his fellowlabourers'' *names are in the book of life* (Philippians 4:3): the book of remembrance is the book of life, the register of those who feared Yahuah (LORD) and laboured for his name, gathered as his own treasured jewels.'),
  ('canon', 'philippians', 4, 3, 'enoch', '1-enoch', 47, 3, 'extras', E'*In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3). The Hebrew library beholds the same heavenly register: *the books of the living were opened* before the Head of Days enthroned in glory. These are the books Paul appeals to when he says his fellowlabourers'' *names are in the book of life* (Philippians 4:3). The book of life is no metaphor invented late; it is the books of the living that Enoch saw opened before the throne, in which the names of the righteous stand written before Yahuah (God) of Spirits.'),
  ('canon', 'philippians', 4, 3, 'enoch', '1-enoch', 104, 2, 'extras', E'*That I have seen, and the light has shone upon me, And I have seen the holy ones of heaven, And I have beheld the books of life.* (1 Enoch 104:2). Enoch swears to the righteous by what he has been shown — *I have beheld the books of life,* the heavenly record in which the names of the faithful are kept. Paul names the same books when he writes that his fellowlabourers are those *whose names are in the book of life* (Philippians 4:3). The books of life Enoch beheld in the heavens are the ledger in which the Philippian labourers are inscribed; the righteous are not forgotten but written and beheld before Yahuah (God).'),
  ('canon', 'philippians', 4, 3, 'enoch', '1-enoch', 108, 3, 'extras', E'*Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* (1 Enoch 108:3). The library knows the dark side of the register: the names of the wicked *shall be blotted out of the book of life.* To be blotted out is the very judgement Yahuah (LORD) spoke at Sinai — *him will I blot out of my book* (Exodus 32:33). Paul writes the bright side: his fellowlabourers'' *names are in the book of life* (Philippians 4:3), not blotted out but kept, enrolled among the holy ones whose names endure when sin has passed away.'),
  -- thread: philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26
  ('canon', 'philippians', 4, 5, 'canon', 'psalms', 145, 18, 'free', E'*Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth.* (Psalm 145:18). The psalm declares that *Yahuah (LORD) is nigh unto all them that call upon him* — and Paul says simply, *Yahuah (Lord) is at hand* (Philippians 4:5). The nearness that the psalmist confesses is the ground of the apostle''s exhortation: because Yahuah (Lord) is at hand, near to all who call on him in truth, the assembly need *be careful for nothing* but make their requests known. The nigh-at-hand Yahuah (LORD) of the psalm is the Yahuah (Lord) who hears the prayer and supplication of Philippi.'),
  ('canon', 'philippians', 4, 5, 'canon', 'psalms', 34, 18, 'free', E'*Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.* (Psalm 34:18). David sings that *Yahuah (LORD) is nigh unto them that are of a broken heart.* Paul re-speaks the same nearness over the Philippians: *Yahuah (Lord) is at hand* (Philippians 4:5). The One who draws near to the broken and contrite is the One at hand to the anxious assembly; his nearness is why their anxiety may be turned to prayer and their hearts kept in peace.'),
  ('canon', 'philippians', 4, 7, 'canon', 'isaiah', 26, 3, 'free', E'*Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.* (Isaiah 26:3). Isaiah promises that Yahuah (LORD) *wilt keep him in perfect peace, whose mind is stayed on thee.* This is the peace Paul names: *the peace of Elohim (God), which passeth all understanding, shall keep your hearts and minds through HaMashiach Yahusha (Christ Jesus)* (Philippians 4:7). The keeping is the same — the mind stayed on Yahuah (LORD) is kept in perfect peace, the heart guarded by a peace beyond understanding; trust in him, and the peace of Elohim (God) stands sentinel over the soul.'),
  -- thread: philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1
  ('canon', 'philippians', 4, 18, 'canon', 'genesis', 8, 21, 'free', E'*And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* (Genesis 8:21). When Noah offered burnt offerings, *Yahuah (LORD) smelled a sweet savour* — the first sacrifice that ascended acceptable before him. Paul receives the gift of the Philippians and calls it *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). The partners'' generosity rises to Elohim (God) as the very sweet savour Yahuah (LORD) smelled at the altar; their giving is worship, an offering wellpleasing in the same sense the Tanakh''s sacrifices were.'),
  ('canon', 'philippians', 4, 18, 'canon', 'exodus', 29, 18, 'free', E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD).* (Exodus 29:18). The consecration offering at the tabernacle is *a sweet savour, an offering made by fire unto Yahuah (LORD).* Paul lays the same priestly language on the Philippians'' gift: *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). What the altar sent up to Yahuah (LORD) as a sweet savour, the partners now send to the apostle and to Elohim (God) — the sacrifice of their love an offering by fire, ascending wellpleasing before him.'),
  ('canon', 'philippians', 4, 18, 'canon', 'leviticus', 1, 9, 'free', E'*But his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 1:9). The law of the burnt offering names it *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* Paul uses that exact savour-language for what came from Philippi: *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). The whole sweet-savour system of Leviticus is not left behind but fulfilled in the partners'' offering; their gift is a burnt offering in spirit, ascending of a sweet savour unto Yahuah (LORD).'),
  -- thread: philippians-4-my-elohim-shall-supply-all-your-need-psalm-23
  ('canon', 'philippians', 4, 19, 'canon', 'psalms', 23, 1, 'free', E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want.* (Psalm 23:1). David confesses the Shepherd who leaves him in no want: *Yahuah Ra''ah (The LORD is my shepherd); I shall not want.* Paul promises the same provision to the giving assembly: *my Elohim (God) shall supply all your need according to his riches in glory by HaMashiach Yahusha (Christ Jesus)* (Philippians 4:19). The Shepherd who lets his sheep want nothing is the Elohim (God) who supplies all the Philippians'' need; because they gave, they shall not want, for the Shepherd of the psalm tends them out of his riches in glory.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s231_ph04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s231_ph04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12',
       E'Whose names are in the book of life — the books of the living (Exodus 32, Daniel 12, Malachi 3, 1 Enoch)',
       E'Paul names his fellowlabourers at Philippi as those *whose names are in the book of life* (Philippians 4:3) — and that book is no late invention but the heavenly register the whole library knows. At Sinai Moses appealed to it: *if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32), and Yahuah (LORD) answered, *Whosoever hath sinned against me, him will I blot out of my book* (Exodus 32:33). Daniel learned that deliverance in the last great trouble belongs to *every one that shall be found written in the book* (Daniel 12:1). Malachi saw it kept for the faithful: *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16), who shall be his *in that day when I make up my jewels* (Malachi 3:17). The Hebrew library beheld the very same books opened before the throne: *the books of the living were opened* before the Head of Days seated in glory (1 Enoch 47:3), and Enoch swore by what he saw — *I have beheld the books of life* (1 Enoch 104:2). He knew the dark side too, the wicked whose *names shall be blotted out of the book of life* (1 Enoch 108:3), the same blotting Yahuah (LORD) spoke at Sinai. So when Paul says the Philippian partners'' names are in the book of life, he enrolls them in the one covenant ledger that runs from Moses to Daniel to the Head of Days'' throne — the book of remembrance, the books of the living, in which the righteous are written and beheld and kept, not blotted out, gathered as the treasured jewels of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'extras', 7635
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26',
       E'Yahuah (Lord) is at hand, and the peace that passeth understanding (Psalm 145, 34, Isaiah 26)',
       E'Paul grounds his whole closing exhortation in a single confession of the Tanakh: *Yahuah (Lord) is at hand* (Philippians 4:5). Because Yahuah (Lord) is near, the assembly is to *be careful for nothing; but in every thing by prayer and supplication with thanksgiving let your requests be made known unto Elohim (God)* (Philippians 4:6), and then *the peace of Elohim (God), which passeth all understanding, shall keep your hearts and minds through HaMashiach Yahusha (Christ Jesus)* (Philippians 4:7). The nearness is the psalmist''s: *Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* (Psalm 145:18), and *Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit* (Psalm 34:18). The peace is Isaiah''s: *Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee* (Isaiah 26:3). The thread is one promise re-spoken — the Yahuah (LORD) who is nigh to all who call, who keeps in perfect peace the mind stayed on him, is the Yahuah (Lord) at hand to anxious Philippi, guarding their hearts with a peace beyond understanding.',
       sv.verse_id, ev.verse_id, 'free', 7638
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1',
       E'An odour of a sweet smell, a sacrifice acceptable (Genesis 8, Exodus 29, Leviticus 1)',
       E'When Paul receives the gift the Philippians sent by Epaphroditus, he names it in the language of the altar: *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). That sweet savour is the Tanakh''s own. It rose first from Noah''s altar: *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21), the first offering received acceptable after the flood. It was the appointed language of the tabernacle: the consecration ram burned whole is *a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18), and the law of the burnt offering names it *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 1:9). Paul lays this whole sweet-savour system upon the partners'' generosity: their giving is not mere assistance but worship, a burnt offering in spirit, ascending wellpleasing before Elohim (God). The savour Yahuah (LORD) smelled at Noah''s altar and over Sinai''s fire is the savour of the Philippians'' love — the sacrifice of the gathered, acceptable and wellpleasing, the Torah''s offering fulfilled in the fellowship of the gospel.',
       sv.verse_id, ev.verse_id, 'free', 7641
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-my-elohim-shall-supply-all-your-need-psalm-23',
       E'My Elohim (God) shall supply all your need — the Shepherd who leaves no want (Psalm 23)',
       E'Paul answers the partners'' generosity with a promise: *my Elohim (God) shall supply all your need according to his riches in glory by HaMashiach Yahusha (Christ Jesus)* (Philippians 4:19). The promise is David''s confession brought forward — *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1). The Shepherd who tends his sheep so that they want nothing is the Elohim (God) who supplies all the Philippians'' need; because they gave out of their own want (they *sent once and again* unto Paul''s necessity, 4:16), they themselves shall not want, for the Shepherd of the psalm leads them and feeds them out of his riches in glory. The covenant care of Yahuah (LORD) the Shepherd is the apostle''s assurance to the giving assembly: those who pour out for the gospel are kept by the One who lets his flock lack nothing.',
       sv.verse_id, ev.verse_id, 'free', 7644
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:32 — *blot me, I pray thee, out of thy book which thou hast written* the book Yahuah (LORD) wrote at Sinai; the Philippian labourers'' *names are in the book of life* (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *every one that shall be found written in the book* the delivered people in the day of trouble; those *whose names are in the book of life* (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:16 — *a book of remembrance was written before him for them that feared Yahuah (LORD)* the book of remembrance = the book of life in which the labourers are kept (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 47:3 — *the books of the living were opened before Him* before the Head of Days enthroned; the same books, those *whose names are in the book of life* (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 104:2 — *I have beheld the books of life* the heavenly record of the righteous; the book in which the Philippian labourers are enrolled (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=104 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 108:3 — *their names shall be blotted out of the book of life* the dark side of the register (cf. Exodus 32:33); the labourers'' names kept, not blotted out (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 145:18 — *Yahuah (LORD) is nigh unto all them that call upon him* the nearness behind *Yahuah (Lord) is at hand* (Philippians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:18 — *Yahuah (LORD) is nigh unto them that are of a broken heart* the near Yahuah (LORD) re-spoken as *Yahuah (Lord) is at hand* (Philippians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:3 — *Thou wilt keep him in perfect peace, whose mind is stayed on thee* the peace that *passeth all understanding, shall keep your hearts and minds* (Philippians 4:7).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:21 — *Yahuah (LORD) smelled a sweet savour* the first offering received acceptable; the Philippians'' gift *an odour of a sweet smell, a sacrifice acceptable* (Philippians 4:18).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 29:18 — *a sweet savour, an offering made by fire unto Yahuah (LORD)* the tabernacle''s savour-language laid on the partners'' gift (Philippians 4:18).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 1:9 — *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD)* the law of the burnt offering fulfilled in the gift *wellpleasing to Elohim (God)* (Philippians 4:18).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-4-my-elohim-shall-supply-all-your-need-psalm-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 23:1 — *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* the Shepherd who leaves no want; *my Elohim (God) shall supply all your need* (Philippians 4:19).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-my-elohim-shall-supply-all-your-need-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session231 — Philippians cross-references complete.'
