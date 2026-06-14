-- ----- fragment: minion_colossians_04.sql (S232 Colossians 4) -----
-- =====================================================================
-- S232 minion — COLOSSIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: COLOSSIANS 4 (18 verses) — continue in prayer / walk in wisdom /
--          speech seasoned with salt / the greetings.
-- Tag: co04 (temp view _s232_co04_lookup).
-- Sort band: floor 7735, step 3 (7735, 7738, 7741, 7744 used; under 7760).
-- Source is ALWAYS the canon Colossians verse; targets span Tanakh + NT (no extras warranted here).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'.
--
-- GOVERNING FRAME: Paul closes the letter. The household order of 3:18-25 spills into 4:1 (the
-- master who himself has a Master in heaven), then the practical charges — continue in prayer,
-- walk in wisdom toward them without, speech seasoned with salt — then the salutations. The
-- framework reads the closing charges as the Torah's own ethic carried forward, not a new ethic:
-- the just-and-equal master is the Torah's master who fears Elohim (Leviticus 25:43); the
-- salt-seasoned speech is the salt of the COVENANT (Leviticus 2:13) carried into the mouth.
--
-- ⚑ COLOSSIANS 4:11 TRAP HONORED: *And Yahusha (Jesus), which is called Justus* (4:11) is a MAN'S
--   NAME — "Jesus Justus," one of Paul's fellow-workers of the circumcision — NOT the Messiah. No
--   Messiah/Christ thread is built on 4:11 (same proper-name discipline as the apocrypha
--   "Jesus"=Joshua rule, applied in canon). The greetings 4:7-18 are a salutation list of proper
--   names with no genuine parallels; recorded "none warranted" — no threads forced on them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     Masters, give your servants that which is just and equal; ye have a Master in heaven
--           Tanakh: Leviticus 25:43 (rule not with rigour, but fear thy Elohim), Deuteronomy 15:14
--                   (furnish him liberally, thou wast a bondman, Yahuah redeemed thee)
--           Extras: none warranted   NT: none warranted (twin Ephesians 6:9 carried in the
--                   3:18-25 household-code thread of ch3, not duplicated here)
--   v.2-4   Continue in prayer, and watch in the same with thanksgiving; pray for an open door
--           Tanakh: none warranted   Extras: none warranted
--           NT: Luke 18:1 (men ought always to pray, and not to faint)
--   v.5     Walk in wisdom toward them that are without, redeeming the time
--           Tanakh: Proverbs 13:20 (he that walketh with wise men shall be wise)
--           Extras: none warranted   NT: Ephesians 5:15-16 (walk circumspectly... as wise,
--                   redeeming the time — the twin letter, near-verbatim)
--   v.6     Let your speech be alway with grace, seasoned with salt
--           Tanakh: Leviticus 2:13 (the salt of the covenant... with all thine offerings offer salt)
--           Extras: none warranted   NT: Mark 9:50 (have salt in yourselves), Matthew 5:13 (ye are
--                   the salt of the earth), Ephesians 4:29 (no corrupt communication... minister grace)
--   v.7-18  the greetings / Tychicus, Onesimus, Aristarchus, Jesus Justus, Epaphras, Luke, the
--           epistle from Laodicea / the salutation by my hand
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (proper-name salutation list; ⚑ 4:11 Jesus Justus = a man, NOT the Messiah; 4:16 the
--            lost epistle from Laodicea has no canon parallel)
--
-- THREADS (slug -> target libraries):
--   7735 colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15  (Tanakh)
--   7738 colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18  (NT)
--   7741 colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5  (Tanakh + NT)
--   7744 colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s232_co04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15
  ('canon', 'colossians', 4, 1, 'canon', 'leviticus', 25, 43, 'free', E'*Thou shalt not rule over him with rigour; but shalt fear thy Elohim (God).* (Leviticus 25:43). The Torah binds the master''s hand from the start: he is not to *rule over him with rigour,* and the reason is that he himself stands under One above him — *but shalt fear thy Elohim (God).* Paul speaks the same charge to the Colosse assembly: *Masters, give unto your servants that which is just and equal; knowing that ye also have a Master in heaven* (Colossians 4:1). The just-and-equal dealing Paul commands is not a new ethic but the Torah''s own: the master who himself fears Elohim (God) and answers to a Master above cannot grind those beneath him. The heavenly Master makes every earthly master a servant.'),
  ('canon', 'colossians', 4, 1, 'canon', 'deuteronomy', 15, 14, 'free', E'*Thou shalt furnish him liberally out of thy flock, and out of thy floor, and out of thy winepress: of that wherewith Yahuah Elohayka (the LORD thy God) hath blessed thee thou shalt give unto him.* (Deuteronomy 15:14). When the bondservant goes free, the Torah will not let the master send him empty: he must *furnish him liberally,* for *thou wast a bondman in the land of Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee* (Deuteronomy 15:15). The master gives generously because he was himself a redeemed servant. Paul presses the same root when he tells masters to give *that which is just and equal; knowing that ye also have a Master in heaven* (Colossians 4:1) — the one who was redeemed deals justly with those he holds, because his own Master in heaven redeemed him.'),
  -- thread: colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18
  ('canon', 'colossians', 4, 2, 'canon', 'luke', 18, 1, 'free', E'*And he spake a parable unto them to this end, that men ought always to pray, and not to faint;* (Luke 18:1). Yahusha (Jesus) gave the parable of the persistent widow *to this end, that men ought always to pray, and not to faint.* Paul lays the same charge on the assembly: *Continue in prayer, and watch in the same with thanksgiving* (Colossians 4:2). To *continue* and to *watch* is the not-fainting prayer the parable taught — the unwearied, persevering crying-out of the elect who *cry day and night unto him* (Luke 18:7). Paul''s charge is the practice of the Master''s own teaching.'),
  -- thread: colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5
  ('canon', 'colossians', 4, 5, 'canon', 'ephesians', 5, 15, 'free', E'*See then that ye walk circumspectly, not as fools, but as wise,* (Ephesians 5:15). The twin letter, written the same season, carries the same charge nearly word for word: *walk circumspectly, not as fools, but as wise.* Paul writes to Colosse *Walk in wisdom toward them that are without, redeeming the time* (Colossians 4:5) — the wise walk before the watching world, the careful conduct toward *them that are without.* The two letters speak with one mouth: the called-out ones are to walk as the wise, not the foolish, ordering their steps before the nations.'),
  ('canon', 'colossians', 4, 5, 'canon', 'ephesians', 5, 16, 'free', E'*Redeeming the time, because the days are evil.* (Ephesians 5:16). The Ephesian charge adds the urgency: *redeeming the time, because the days are evil.* Paul gives the Colossians the very same words — *Walk in wisdom toward them that are without, redeeming the time* (Colossians 4:5). To *redeem the time* is to buy back the fleeting opportunity, to spend the evil days wisely toward those still outside. The twin letters set the same clock before both assemblies.'),
  ('canon', 'colossians', 4, 5, 'canon', 'proverbs', 13, 20, 'free', E'*He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 13:20). The wisdom-walk Paul commands is the wisdom-walk of the proverb: *He that walketh with wise men shall be wise.* When Paul says *Walk in wisdom toward them that are without* (Colossians 4:5), the verb is the proverb''s — wisdom is a manner of walking, a daily gait, not a stored opinion. The one whose steps are wise commends the way to those outside; the companion of fools is destroyed.'),
  -- thread: colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9
  ('canon', 'colossians', 4, 6, 'canon', 'leviticus', 2, 13, 'free', E'*And every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt.* (Leviticus 2:13). Every offering brought to Yahuah (LORD) had to be salted — *the salt of the covenant of thy Elohim (God)* was never to be lacking. Salt was the sign of the covenant, the preserving bond that does not spoil. Paul carries that altar-salt into the mouth: *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6). The words of the covenant people are themselves an offering, and they too must bear the salt of the covenant — gracious, preserving, never insipid, fit to be set before Elohim (God).'),
  ('canon', 'colossians', 4, 6, 'canon', 'mark', 9, 50, 'free', E'*Salt is good: but if the salt have lost his saltness, wherewith will ye season it? Have salt in yourselves, and have peace one with another.* (Mark 9:50). Yahusha (Jesus) charged his own: *Have salt in yourselves, and have peace one with another.* The inward salt — the seasoning that does not lose its savour — issues in peace among the brethren. Paul gives the same salt its place at the lips: *Let your speech be alway with grace, seasoned with salt, that ye may know how ye ought to answer every man* (Colossians 4:6). The salt the Master told them to keep in themselves is the salt that now seasons their speech, that they may answer every man with grace and not lose their savour.'),
  ('canon', 'colossians', 4, 6, 'canon', 'matthew', 5, 13, 'free', E'*Ye are the salt of the earth: but if the salt have lost his savour, wherewith shall it be salted? it is thenceforth good for nothing, but to be cast out, and to be trodden under foot of men.* (Matthew 5:13). Yahusha (Jesus) named his people *the salt of the earth* — and warned that salt which loses its savour is good for nothing. Paul applies the warning to the tongue: *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6). The salt that the assembly is to BE among the nations must show in the way it SPEAKS toward *them that are without* (Colossians 4:5) — gracious, savoury speech that has not gone flat, fit to answer every man.'),
  ('canon', 'colossians', 4, 6, 'canon', 'ephesians', 4, 29, 'free', E'*Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers.* (Ephesians 4:29). The twin letter gives the same rule for the tongue from the other side: let *no corrupt communication* go out, but only what is good for edifying, *that it may minister grace unto the hearers.* Paul tells Colosse the same: *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6). Speech that ministers grace and speech seasoned with salt are one charge in the two letters — words that build up, preserve, and bring grace to those who hear, never corrupt, never savourless.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s232_co04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s232_co04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15',
       E'Masters, give that which is just and equal — ye also have a Master in heaven (Leviticus 25, Deuteronomy 15)',
       E'The household order that ran through chapter three spills into its first verse: *Masters, give unto your servants that which is just and equal; knowing that ye also have a Master in heaven* (Colossians 4:1). This is not a new ethic Paul invents but the Torah''s own restraint on the master''s hand. The law that governed Yashar''el (Israel) bound the master from ruling harshly: *Thou shalt not rule over him with rigour; but shalt fear thy Elohim (God)* (Leviticus 25:43) — the reason no master may grind those beneath him is that he himself stands under One above him. And when a bondservant went free, the master could not send him empty: *Thou shalt furnish him liberally out of thy flock, and out of thy floor, and out of thy winepress* (Deuteronomy 15:14), *and thou shalt remember that thou wast a bondman in the land of Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee* (Deuteronomy 15:15). The master deals justly and generously because he was himself a redeemed servant, and because he answers to a Master above. Paul presses exactly that root: the one who has a *Master in heaven* cannot lord it over the servants in his house. The Torah''s just-and-equal dealing is carried straight into the assembly''s life — every earthly master made a servant by the heavenly One.',
       sv.verse_id, ev.verse_id, 'free', 7735
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18',
       E'Continue in prayer, and watch — men ought always to pray, and not to faint (Luke 18)',
       E'Paul''s first practical charge after the household order is to prayer: *Continue in prayer, and watch in the same with thanksgiving* (Colossians 4:2). To *continue* and to *watch* is the unwearied, persevering prayer the Master himself taught. Yahusha (Jesus) *spake a parable unto them to this end, that men ought always to pray, and not to faint* (Luke 18:1) — the parable of the widow who would not stop coming to the unjust judge, and of the Elohim (God) who *shall avenge his own elect, which cry day and night unto him* (Luke 18:7). The persevering crying-out of the elect, day and night, not fainting, is the very thing Paul commands the Colosse assembly to *continue* in. His charge is simply the practice of the Master''s own teaching — prayer that does not give up, kept with watchfulness and thanksgiving.',
       sv.verse_id, ev.verse_id, 'free', 7738
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5',
       E'Walk in wisdom toward them that are without, redeeming the time (Proverbs 13, Ephesians 5)',
       E'*Walk in wisdom toward them that are without, redeeming the time* (Colossians 4:5). The twin letter, written the same season, gives the charge nearly word for word: *See then that ye walk circumspectly, not as fools, but as wise, Redeeming the time, because the days are evil* (Ephesians 5:15-16). The two letters speak with one mouth — the called-out ones are to walk as the wise and not the foolish before the watching nations, buying back the fleeting opportunity while the evil days last. And the wisdom-walk is the proverb''s own: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed* (Proverbs 13:20). Mark the verb the proverb and Paul share — wisdom is a manner of *walking,* a daily gait, not a stored opinion. The one whose steps are wise commends the way to *them that are without;* the companion of fools is destroyed. The Torah''s wisdom and the apostle''s charge are one road.',
       sv.verse_id, ev.verse_id, 'free', 7741
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9',
       E'Let your speech be seasoned with salt — the salt of the covenant (Leviticus 2, Mark 9, Matthew 5)',
       E'*Let your speech be alway with grace, seasoned with salt, that ye may know how ye ought to answer every man* (Colossians 4:6). The salt Paul puts on the tongue is the altar-salt of the Torah. Every offering brought to Yahuah (LORD) had to be salted: *every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt* (Leviticus 2:13). Salt was the sign of the covenant — the preserving bond that does not spoil — and it was never to be lacking from what was set before Elohim (God). Paul carries that covenant-salt into the mouth of the assembly: the words of the covenant people are themselves an offering, and they too must bear the salt of the covenant. Yahusha (Jesus) had charged the same: *Have salt in yourselves, and have peace one with another* (Mark 9:50), and named his people *the salt of the earth* who must not lose their savour (Matthew 5:13). The salt the Master told them to keep in themselves and to be in the earth is the salt that now seasons their speech. And the twin letter says it from the other side: *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers* (Ephesians 4:29). Gracious, savoury, covenant-salted speech — never corrupt, never gone flat — fit to answer every man and to be set before Elohim (God) as an offering.',
       sv.verse_id, ev.verse_id, 'free', 7744
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:43 — *Thou shalt not rule over him with rigour; but shalt fear thy Elohim (God)* the master restrained because he himself answers to One above; Paul''s masters *have a Master in heaven* (Colossians 4:1).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:14 — *Thou shalt furnish him liberally* the redeemed master gives generously to the freed servant, *for thou wast a bondman... and Yahuah redeemed thee*; the same root as giving *that which is just and equal* (Colossians 4:1).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 18:1 — *men ought always to pray, and not to faint* the Master''s parable of persevering prayer; Paul''s charge to *Continue in prayer, and watch* (Colossians 4:2).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 5:15 — *walk circumspectly, not as fools, but as wise* the twin letter''s near-verbatim charge; *Walk in wisdom toward them that are without* (Colossians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 5:16 — *Redeeming the time, because the days are evil* the twin letter''s same words; *redeeming the time* (Colossians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 13:20 — *He that walketh with wise men shall be wise* wisdom as a manner of walking, the proverb''s own verb; *Walk in wisdom toward them that are without* (Colossians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 2:13 — *neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering* the altar-salt of the covenant; carried into the mouth, *speech... seasoned with salt* (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 9:50 — *Have salt in yourselves, and have peace one with another* the inward salt the Master charged; the salt that now seasons their speech (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:13 — *Ye are the salt of the earth: but if the salt have lost his savour* the people who must not go flat; the salt they ARE must show in how they SPEAK (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:29 — *that which is good to the use of edifying, that it may minister grace unto the hearers* the twin letter''s rule for the tongue; *speech... alway with grace, seasoned with salt* (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
