-- ----- fragment: minion_psalms_130.sql (Psalm 130) -----
--
-- Chapter: Psalm 130 (KEYSTONE — de profundis, the sixth penitential psalm; plenteous redemption)
-- Tag: ps130   Session prefix: s302   Slug prefix: psalm-130-  (SINGULAR)
-- Sort band base: 25225  (25225, 25228, 25231, 25234, 25237)
-- Source rows ALWAYS 'canon','psalms',130,v.   Member table = cross_reference_thread_members.
--
-- Per-chapter coverage checklist:
--   v.1-2  (Out of the depths have I cried unto thee... hear my voice)
--          NT:     none warranted here (the cry is answered FORWARD via the redemption thread v.7-8)
--          Extras: none warranted (Manasseh's prayer empty in this parse; Sirach reserved for mercy/wait threads)
--          Tanakh: Jonah 2:2 (out of the belly of hell cried I); Ps 69:1-2 (the deep waters); Lam 3:55 (out of the low dungeon)  -> THREAD 1
--   v.3    (If thou shouldest mark iniquities, who shall stand?)
--          NT:     Rom 3:19-20 (by the deeds of the law no flesh justified); Rev 6:17 (who shall be able to stand?)  -> THREAD 2
--          Extras: 2 Esdras 8:36 (merciful to them which have not the confidence of good works)  -> THREAD 2
--          Tanakh: Mal 3:2 (who shall stand when he appeareth?); Ps 143:2 (no man living be justified)  -> THREAD 2
--   v.4    (But there is forgiveness with thee, that thou mayest be feared)
--          NT:     1 John 1:9 (faithful and just to forgive)  -> THREAD 3
--          Extras: none warranted (Sirach's forgiveness verse 2:11 reserved for the keystone mercy thread)
--          Tanakh: Exod 34:6-7 (the Name proclaimed, forgiving iniquity); Jer 31:34 (I will forgive their iniquity); Deut 10:12-13 (the fear that walks/keeps commandments)  -> THREAD 3
--   v.5-6  (I wait for Yahuah... in his word do I hope... more than they that watch for the morning)
--          NT:     Rom 8:24-25 (saved by hope; with patience wait for it)  -> THREAD 4
--          Extras: Ecclesiasticus 2:7 (you that fear Yahuah, wait for his mercy)  -> THREAD 4
--          Tanakh: Ps 119:81 (I hope in thy word); Lam 3:24-26 (good that a man should hope and quietly wait); Isa 21:11-12 (Watchman, the morning cometh)  -> THREAD 4
--   v.7-8  (Let Yashar'el hope... plenteous redemption... he shall redeem Yashar'el from all his iniquities)
--          NT:     Titus 2:14 (redeem us from all iniquity); Matt 1:21 (save his people from their sins); Rom 11:26-27 (all Yashar'el saved, take away their sins); Rom 11:1-2 (Elohim hath NOT cast away his people — guard); Luke 1:68 (visited and redeemed his people)  -> THREAD 5
--          Extras: Ecclesiasticus 2:11 (full of compassion and mercy... forgiveth sins)  -> THREAD 5
--          Tanakh: Ps 103:3-4 (forgiveth all thine iniquities; redeemeth thy life)  -> THREAD 5
--
-- Threads (slug -> target libraries):
--   1. psalm-130-out-of-the-depths-have-i-cried                                  [free]   Tanakh
--   2. psalm-130-if-thou-shouldest-mark-iniquities-who-shall-stand               [extras] Tanakh + NT + Apocrypha(2 Esdras)
--   3. psalm-130-there-is-forgiveness-with-thee-that-thou-mayest-be-feared       [free]   Tanakh + NT
--   4. psalm-130-i-wait-for-yahuah-and-in-his-word-do-i-hope                     [extras] Tanakh + NT + Apocrypha(Ecclesiasticus)
--   5. psalm-130-with-yahuah-is-plenteous-redemption-he-shall-redeem-israel      [extras] Tanakh + NT + Apocrypha(Ecclesiasticus)
--
-- Framework-load-bearing / contested framings:
--   v.3 who-shall-stand: framed as exclusion of flesh-MERIT / self-righteousness (Rom 3:20 the deeds of the
--        law = the flesh's bid to be justified BY law-doing; 2 Esdras 8:36 no confidence of good works), NOT
--        an abolition of Torah. The very next verse (v.4) produces the fear that keeps commandments (Deut 10:12-13).
--   v.4 forgiveness UNTO fear: pardon that yields reverence/obedience, NOT license. Joined to Exod 34:6-7 (the
--        Name) and Deut 10:12-13 (fear -> walk -> keep the commandments) so the 1 John 2:3-4 filter is honored.
--   v.7-8 plenteous redemption: THE keystone. Redemption of the WHOLE house of Yashar'el (two houses, Rom 11:26),
--        with the Rom 11:1-2 guard wired IN so the regathering is never read as replacement.

CREATE TEMP VIEW _s302_ps130_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES

  -- THREAD 1 — v.1-2 the cry out of the depths
  ('canon','psalms',130,1,'canon','jonah',2,2,'free',
   E'*And said, I cried by reason of mine affliction unto Yahuah (LORD), and he heard me; out of the belly of hell cried I, and thou heardest my voice.* (Jonah 2:2). Psalm 130 opens with the same cry from the lowest place — *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1). Yonah prays from inside the fish, the psalmist from the depths of guilt; both are heard, for Yahuah hears the voice that rises from the bottom.'),
  ('canon','psalms',130,1,'canon','psalms',69,2,'free',
   E'*I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me.* (Psalm 69:2). The deep is the figure of a soul going under in its trouble; *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1) sings the same descent, and the same upward cry from it.'),
  ('canon','psalms',130,2,'canon','lamentations',3,55,'free',
   E'*I called upon thy name, O Yahuah (LORD), out of the low dungeon.* (Lamentations 3:55). The mourner of Yerushalayim calls the Name from the pit; the psalmist begs *Yahuah (Lord), hear my voice: let thine ears be attentive to the voice of my supplications* (Psalm 130:2) — the Name called from the lowest place is the Name that bends to hear.'),

  -- THREAD 2 — v.3 if thou shouldest mark iniquities, who shall stand?
  ('canon','psalms',130,3,'canon','romans',3,20,'free',
   E'*Therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin.* (Romans 3:20). *If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* (Psalm 130:3) is the question Sha''ul answers: under a strict reckoning no flesh can plead its own law-doing as merit. This excludes self-righteousness — the flesh''s bid to be justified BY its works — it does not abolish the Torah, which the very next breath makes the ground of reverent obedience.'),
  ('canon','psalms',130,3,'canon','malachi',3,2,'free',
   E'*But who may abide the day of his coming? and who shall stand when he appeareth? for he is like a refiner''s fire, and like fullers'' soap:* (Malachi 3:2). Mal''akhi asks the same question the psalmist asks — *who shall stand?* (Psalm 130:3) — of the coming of the messenger of the covenant. No flesh abides the refiner''s fire on its own account; the standing must be given, not earned.'),
  ('canon','psalms',130,3,'canon','psalms',143,2,'free',
   E'*And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* (Psalm 143:2). The companion penitential psalm states plainly what Psalm 130:3 asks — *who shall stand?* — that under bare judgment no man living is justified. The plea is for mercy, not for a verdict on the merits.'),
  ('canon','psalms',130,3,'canon','revelation',6,17,'free',
   E'*For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). The seal-vision echoes the psalm''s question forward to the last day — *who shall stand?* (Psalm 130:3). The answer in both is the same: only those covered by the forgiveness of the next verse, never the strength of their own flesh.'),
  ('canon','psalms',130,3,'apocrypha','2-esdras',8,36,'extras',
   E'*For in this, O Yahuah (God), your righteousness and your goodness shall be declared, if you be merciful to them which have not the confidence of good works.* (2 Esdras 8:36). Ezra''s prayer says outright what Psalm 130:3 implies — *who shall stand?* — that the standing rests on mercy shown to those who have no store of works to lean on. The flesh''s confidence is excluded; the mercy is the whole ground.'),

  -- THREAD 3 — v.4 but there is forgiveness with thee, that thou mayest be feared
  ('canon','psalms',130,4,'canon','exodus',34,6,'free',
   E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* (Exodus 34:6). The forgiveness of Psalm 130:4 — *But there is forgiveness with thee* — is the Name Yahuah proclaimed to Moshe: mercy is not a softening of the covenant but the covenant Name itself unfolded before His servant.'),
  ('canon','psalms',130,4,'canon','exodus',34,7,'free',
   E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty; visiting the iniquity of the fathers upon the children...* (Exodus 34:7). *There is forgiveness with thee, that thou mayest be feared* (Psalm 130:4): the Name that forgives iniquity is the same Name that will by no means clear the guilty — so the pardon is no license, it is the very thing that puts the fear of Yahuah in the heart.'),
  ('canon','psalms',130,4,'canon','jeremiah',31,34,'free',
   E'*...for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). The new covenant promise is the psalmist''s *there is forgiveness with thee* (Psalm 130:4) written on the heart — and the same passage writes the Torah *in their inward parts* (Jeremiah 31:33). Pardon and the law-on-the-heart come together; the forgiveness produces the obedient fear, never replaces it.'),
  ('canon','psalms',130,4,'canon','deuteronomy',10,12,'free',
   E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him...* (Deuteronomy 10:12). This names the fear Psalm 130:4 says forgiveness produces — *that thou mayest be feared*. The fear of Yahuah is to walk in His ways; pardon that does not bend the heart to walk is not the pardon the psalm sings.'),
  ('canon','psalms',130,4,'canon','1-john',1,9,'free',
   E'*If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* (1 John 1:9). The forgiveness *with thee* (Psalm 130:4) is named faithful and just — not indulgent, but covenant-true. And by the same writer, the forgiven keep His commandments (1 John 2:3-4); the pardon makes the reverent walker.'),

  -- THREAD 4 — v.5-6 I wait for Yahuah, and in his word do I hope
  ('canon','psalms',130,5,'canon','psalms',119,81,'free',
   E'*My soul fainteth for thy salvation: but I hope in thy word.* (Psalm 119:81). Psalm 130:5 — *in his word do I hope* — is the Torah-psalm''s own confession; the hope is not vague longing but hope anchored in the spoken word and covenant of Yahuah.'),
  ('canon','psalms',130,5,'canon','lamentations',3,26,'free',
   E'*It is good that a man should both hope and quietly wait for the salvation of Yahuah (LORD).* (Lamentations 3:26). *I wait for Yahuah (LORD), my soul doth wait* (Psalm 130:5) is the same posture the mourner learns in the ashes: hope and quiet waiting for the salvation that comes from Yahuah alone.'),
  ('canon','psalms',130,6,'canon','isaiah',21,12,'free',
   E'*The watchman said, The morning cometh, and also the night: if ye will enquire, enquire ye: return, come.* (Isaiah 21:12). The psalmist waits *more than they that watch for the morning* (Psalm 130:6); Yeshayahu''s watchman answers the night-cry with the promise that *the morning cometh* — and with the call to *return*. The waiting is not idle; it turns the heart back.'),
  ('canon','psalms',130,5,'canon','romans',8,25,'free',
   E'*But if we hope for that we see not, then do we with patience wait for it.* (Romans 8:25). Sha''ul names the very discipline of Psalm 130:5 — *my soul doth wait* — hope for the unseen carried in patience. The night-watch of the psalm is the patient waiting of the covenant people for the redemption to come.'),
  ('canon','psalms',130,5,'apocrypha','ecclesiasticus',2,7,'extras',
   E'*You that fear Yahuah (God), wait for his mercy; and go not aside, lest you fall.* (Ecclesiasticus 2:7). Ben Sira binds the waiting of Psalm 130:5 to the fear of v.4: those who fear Yahuah *wait for his mercy*. The hope in the Word and the wait for mercy are one posture, and the fear keeps the waiter from turning aside.'),

  -- THREAD 5 — v.7-8 with Yahuah is plenteous redemption; he shall redeem Yashar'el from all his iniquities
  ('canon','psalms',130,7,'canon','titus',2,14,'free',
   E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works.* (Titus 2:14). The *plenteous redemption* of Psalm 130:7 is fulfilled in the Formed Son who redeems *from all iniquity* — the very ''all'' of *he shall redeem Yashar''el (Israel) from all his iniquities* (Psalm 130:8) — and the redeemed are made a peculiar people zealous of good works, not freed from them.'),
  ('canon','psalms',130,8,'canon','matthew',1,21,'free',
   E'*And she shall bring forth a son, and thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins.* (Matthew 1:21). The Name Yahusha means He shall save His people from their sins — the very work of Psalm 130:8, *he shall redeem Yashar''el (Israel) from all his iniquities*. The plenteous redemption takes flesh and bears the Name of the saving it performs.'),
  ('canon','psalms',130,7,'canon','romans',11,26,'free',
   E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob:* (Romans 11:26). *Let Yashar''el (Israel) hope in Yahuah* (Psalm 130:7) and *he shall redeem Yashar''el (Israel) from all his iniquities* (Psalm 130:8) are the whole-house promise Sha''ul cites: ALL Yashar''el — the two houses gathered — delivered, ungodliness turned away.'),
  ('canon','psalms',130,7,'canon','romans',11,27,'free',
   E'*For this is my covenant unto them, when I shall take away their sins.* (Romans 11:27). The covenant Sha''ul quotes is the redemption *from all his iniquities* (Psalm 130:8): the taking away of the sins of Yashar''el is the everlasting covenant pledge, not a new people put in Yashar''el''s place.'),
  ('canon','psalms',130,7,'canon','romans',11,1,'free',
   E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1). The guard on the keystone: *Let Yashar''el (Israel) hope in Yahuah* (Psalm 130:7) presumes Yashar''el is still His people. Elohim has NOT cast them away; the plenteous redemption is FOR them, never a transfer of the promise to another people.'),
  ('canon','psalms',130,7,'canon','luke',1,68,'free',
   E'*Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people,* (Luke 1:68). Zekharyah''s song answers Psalm 130:7''s hope: Yahuah Elohim of Yashar''el *hath visited and redeemed his people* — the plenteous redemption come at last to the house it was always promised to.'),
  ('canon','psalms',130,7,'canon','psalms',103,3,'free',
   E'*Who forgiveth all thine iniquities; who healeth all thy diseases;* (Psalm 103:3). The companion psalm sings the same ''all'' — *forgiveth all thine iniquities* answering *he shall redeem Yashar''el (Israel) from all his iniquities* (Psalm 130:8). With Yahuah there is *plenteous redemption* (Psalm 130:7) because His mercy reaches every iniquity, not some.'),
  ('canon','psalms',130,8,'canon','psalms',103,4,'free',
   E'*Who redeemeth thy life from destruction; who crowneth thee with lovingkindness and tender mercies;* (Psalm 103:4). *He shall redeem Yashar''el (Israel) from all his iniquities* (Psalm 130:8) is the personal mercy of Psalm 103:4 made the portion of the whole house — life redeemed from destruction, crowned with the lovingkindness in which there is plenteous redemption.'),
  ('canon','psalms',130,7,'apocrypha','ecclesiasticus',2,11,'extras',
   E'*For Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction.* (Ecclesiasticus 2:11). Ben Sira names the *mercy* and *plenteous redemption* of Psalm 130:7 in the same words: full of compassion, forgiving sins, saving in affliction — the Sinai Name (Exod 34:6) carried into the wisdom of the second-Temple fathers.')

  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps130_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps130_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-130-out-of-the-depths-have-i-cried',
       E'Out of the depths have I cried unto thee',
       E'Psalm 130 opens at the bottom: *Out of the depths have I cried unto thee, O Yahuah (LORD). Yahuah (Lord), hear my voice: let thine ears be attentive to the voice of my supplications* (Psalm 130:1-2). It is the cry of a soul gone under, and the canon sings it again and again. Yonah prays from inside the fish — *out of the belly of hell cried I, and thou heardest my voice* (Jonah 2:2). The psalmist of Psalm 69 sinks in the same water — *I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me* (Psalm 69:2). And the mourner of Yerushalayim calls the Name from the pit — *I called upon thy name, O Yahuah (LORD), out of the low dungeon* (Lamentations 3:55). The depths are no barrier to Yahuah; the Name called from the lowest place is the Name that bends to hear.',
       sv.verse_id, ev.verse_id, 'free', 25225
  FROM _s302_ps130_lookup sv, _s302_ps130_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=130 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=130 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-130-if-thou-shouldest-mark-iniquities-who-shall-stand',
       E'If thou shouldest mark iniquities, who shall stand?',
       E'*If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* (Psalm 130:3). Under a strict reckoning — every sin marked and held — no one stands. Sha''ul gives the verdict: *by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20). The companion psalm pleads the same — *enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). Mal''akhi asks it of the coming One — *who shall stand when he appeareth? for he is like a refiner''s fire* (Malachi 3:2) — and the seal-vision asks it of the last day — *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Ezra''s prayer lays the ground bare: Yahuah''s goodness is declared *if you be merciful to them which have not the confidence of good works* (2 Esdras 8:36). Read it carefully: what is excluded is flesh-MERIT, the bid to be justified BY one''s own law-doing — not the Torah itself, which the very next verse turns into reverent obedience. No flesh stands on its account; the standing must be given.',
       sv.verse_id, ev.verse_id, 'extras', 25228
  FROM _s302_ps130_lookup sv, _s302_ps130_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=130 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=130 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-130-there-is-forgiveness-with-thee-that-thou-mayest-be-feared',
       E'There is forgiveness with thee, that thou mayest be feared',
       E'*But there is forgiveness with thee, that thou mayest be feared* (Psalm 130:4). The pardon is not a softening that breeds license — it produces the fear of Yahuah. This forgiveness is the covenant Name itself, proclaimed to Moshe: *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth, keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:6-7). The same Name that forgives will by no means clear the unrepentant — so the pardon puts reverence in the heart. The new covenant pledges it — *I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34) — in the very breath that writes the Torah *in their inward parts* (Jeremiah 31:33). And the fear it produces is named: *to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways* (Deuteronomy 10:12). The forgiveness is *faithful and just* (1 John 1:9) — covenant-true, making the forgiven a reverent walker who keeps His commandments, never a freed lawless one.',
       sv.verse_id, ev.verse_id, 'free', 25231
  FROM _s302_ps130_lookup sv, _s302_ps130_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=130 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=130 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-130-i-wait-for-yahuah-and-in-his-word-do-i-hope',
       E'I wait for Yahuah, and in his word do I hope',
       E'*I wait for Yahuah (LORD), my soul doth wait, and in his word do I hope. My soul waiteth for Yahuah (Lord) more than they that watch for the morning: I say, more than they that watch for the morning* (Psalm 130:5-6). The hope is anchored in the WORD, not in vague longing. The Torah-psalm makes the same confession — *My soul fainteth for thy salvation: but I hope in thy word* (Psalm 119:81). The mourner learns it in the ashes — *It is good that a man should both hope and quietly wait for the salvation of Yahuah (LORD)* (Lamentations 3:26). Yeshayahu''s watchman answers the night-cry — *The watchman said, The morning cometh, and also the night... return, come* (Isaiah 21:12) — so the waiting turns the heart back. Sha''ul names the discipline — *if we hope for that we see not, then do we with patience wait for it* (Romans 8:25). And Ben Sira binds the waiting to the fear of the verse before: *You that fear Yahuah (God), wait for his mercy; and go not aside, lest you fall* (Ecclesiasticus 2:7). Hope in the Word and wait for the mercy are one posture, kept by the fear that does not turn aside.',
       sv.verse_id, ev.verse_id, 'extras', 25234
  FROM _s302_ps130_lookup sv, _s302_ps130_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=130 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=130 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-130-with-yahuah-is-plenteous-redemption-he-shall-redeem-israel',
       E'With Yahuah is plenteous redemption — he shall redeem Yashar''el from all his iniquities',
       E'The keystone: *Let Yashar''el (Israel) hope in Yahuah (LORD): for with Yahuah (LORD) there is mercy, and with him is plenteous redemption. And he shall redeem Yashar''el (Israel) from all his iniquities* (Psalm 130:7-8). The redemption is plenteous and it is for the WHOLE house — *all his iniquities*, the whole people. The Formed Son fulfills the ''all'': *Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). He bears the Name of the work — *thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins* (Matthew 1:21). Sha''ul reads it of the two houses gathered: *so all Yashar''el (Israel) shall be saved... For this is my covenant unto them, when I shall take away their sins* (Romans 11:26-27). And he guards it against every replacement reading — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1): the plenteous redemption is FOR Yashar''el, never transferred to another people. Zekharyah sings it come at last — *Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68). The companion psalm names the mercy — *Who forgiveth all thine iniquities... Who redeemeth thy life from destruction* (Psalm 103:3-4) — and Ben Sira the same: *Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction* (Ecclesiasticus 2:11). Out of the depths the cry began; here it is answered — plenteous redemption for all the house of Yashar''el.',
       sv.verse_id, ev.verse_id, 'extras', 25237
  FROM _s302_ps130_lookup sv, _s302_ps130_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=130 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=130 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===================== thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',130,1,'canon','jonah',2,2,1,E'Jonah 2:2 — *out of the belly of hell cried I, and thou heardest my voice*: Yonah''s cry from the fish answers *out of the depths have I cried unto thee* (Psalm 130:1).'),
    ('psalms',130,1,'canon','psalms',69,2,2,E'Psalm 69:2 — *I am come into deep waters, where the floods overflow me*: the same descent into the deep behind Psalm 130:1.'),
    ('psalms',130,2,'canon','lamentations',3,55,3,E'Lamentations 3:55 — *I called upon thy name, O Yahuah (LORD), out of the low dungeon*: the Name called from the pit, as in *hear my voice* (Psalm 130:2).')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-130-out-of-the-depths-have-i-cried'
  JOIN _s302_ps130_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps130_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',130,3,'canon','romans',3,20,1,E'Romans 3:20 — *by the deeds of the law there shall no flesh be justified in his sight*: the answer to *who shall stand?* (Psalm 130:3) — flesh-merit excluded, Torah not abolished.'),
    ('psalms',130,3,'canon','malachi',3,2,2,E'Malachi 3:2 — *who shall stand when he appeareth? for he is like a refiner''s fire*: the same question asked of the coming messenger of the covenant.'),
    ('psalms',130,3,'canon','psalms',143,2,3,E'Psalm 143:2 — *in thy sight shall no man living be justified*: the companion psalm states plainly what Psalm 130:3 asks.'),
    ('psalms',130,3,'canon','revelation',6,17,4,E'Revelation 6:17 — *the great day of his wrath is come; and who shall be able to stand?*: the psalm''s question carried to the last day.'),
    ('psalms',130,3,'apocrypha','2-esdras',8,36,5,E'2 Esdras 8:36 — *if you be merciful to them which have not the confidence of good works*: the standing rests on mercy, not on a store of works.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-130-if-thou-shouldest-mark-iniquities-who-shall-stand'
  JOIN _s302_ps130_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps130_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',130,4,'canon','exodus',34,6,1,E'Exodus 34:6 — *Yahuah Elohim (The LORD God), merciful and gracious, longsuffering*: the forgiveness *with thee* (Psalm 130:4) is the covenant Name proclaimed to Moshe.'),
    ('psalms',130,4,'canon','exodus',34,7,2,E'Exodus 34:7 — *forgiving iniquity and transgression and sin, and that will by no means clear the guilty*: the Name that forgives yet does not clear the unrepentant — pardon that breeds fear, not license.'),
    ('psalms',130,4,'canon','jeremiah',31,34,3,E'Jeremiah 31:34 — *I will forgive their iniquity, and I will remember their sin no more*: the new-covenant pardon, joined to the Torah written *in their inward parts* (31:33).'),
    ('psalms',130,4,'canon','deuteronomy',10,12,4,E'Deuteronomy 10:12 — *to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways*: this names the fear Psalm 130:4 says forgiveness produces.'),
    ('psalms',130,4,'canon','1-john',1,9,5,E'1 John 1:9 — *he is faithful and just to forgive us our sins*: the forgiveness is covenant-true, making the forgiven a commandment-keeper (1 John 2:3-4).')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-130-there-is-forgiveness-with-thee-that-thou-mayest-be-feared'
  JOIN _s302_ps130_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps130_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',130,5,'canon','psalms',119,81,1,E'Psalm 119:81 — *I hope in thy word*: the Torah-psalm''s own confession of Psalm 130:5''s *in his word do I hope*.'),
    ('psalms',130,5,'canon','lamentations',3,26,2,E'Lamentations 3:26 — *that a man should both hope and quietly wait for the salvation of Yahuah*: the same waiting posture as *my soul doth wait* (Psalm 130:5).'),
    ('psalms',130,6,'canon','isaiah',21,12,3,E'Isaiah 21:12 — *The watchman said, The morning cometh... return, come*: answers the watch *for the morning* (Psalm 130:6) and turns the heart back.'),
    ('psalms',130,5,'canon','romans',8,25,4,E'Romans 8:25 — *with patience wait for it*: Sha''ul names the discipline of the night-watch of Psalm 130:5.'),
    ('psalms',130,5,'apocrypha','ecclesiasticus',2,7,5,E'Ecclesiasticus 2:7 — *You that fear Yahuah (God), wait for his mercy*: binds the waiting to the fear of v.4 — one posture kept from turning aside.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-130-i-wait-for-yahuah-and-in-his-word-do-i-hope'
  JOIN _s302_ps130_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps130_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',130,7,'canon','titus',2,14,1,E'Titus 2:14 — *that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works*: the Formed Son fulfills the ''all'' of *plenteous redemption* (Psalm 130:7-8).'),
    ('psalms',130,8,'canon','matthew',1,21,2,E'Matthew 1:21 — *call his name Yahusha (JESUS): for he shall save his people from their sins*: the Name bears the very work of *he shall redeem Yashar''el from all his iniquities* (Psalm 130:8).'),
    ('psalms',130,7,'canon','romans',11,26,3,E'Romans 11:26 — *so all Yashar''el (Israel) shall be saved*: the whole-house redemption of Psalm 130:7 — the two houses gathered.'),
    ('psalms',130,7,'canon','romans',11,27,4,E'Romans 11:27 — *this is my covenant unto them, when I shall take away their sins*: the everlasting covenant of taking away Yashar''el''s sins (Psalm 130:8).'),
    ('psalms',130,7,'canon','romans',11,1,5,E'Romans 11:1 — *Hath Elohim cast away his people? Elohim forbid*: the guard — the plenteous redemption is FOR Yashar''el, never transferred to another people.'),
    ('psalms',130,7,'canon','luke',1,68,6,E'Luke 1:68 — *he hath visited and redeemed his people*: Zekharyah sings the redemption of Psalm 130:7 come at last to the house it was promised to.'),
    ('psalms',130,7,'canon','psalms',103,3,7,E'Psalm 103:3 — *Who forgiveth all thine iniquities*: the companion ''all'' answering *plenteous redemption* (Psalm 130:7).'),
    ('psalms',130,8,'canon','psalms',103,4,8,E'Psalm 103:4 — *Who redeemeth thy life from destruction*: the personal mercy made the portion of the whole house (Psalm 130:8).'),
    ('psalms',130,7,'apocrypha','ecclesiasticus',2,11,9,E'Ecclesiasticus 2:11 — *full of compassion and mercy... forgiveth sins, and saves in time of affliction*: Ben Sira names the mercy and plenteous redemption of Psalm 130:7 in the Sinai Name''s own words.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-130-with-yahuah-is-plenteous-redemption-he-shall-redeem-israel'
  JOIN _s302_ps130_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps130_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
