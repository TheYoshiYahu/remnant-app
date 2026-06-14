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
