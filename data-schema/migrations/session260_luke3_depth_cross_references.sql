-- =====================================================================
-- Session 260 — Luke (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_luke3_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Luke (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_luke_17.sql -----
-- ============================================================================
-- Luke 17 — full-library Come-and-See cross-reference threads (NT DEPTH pass)
-- THIN-ADD: existing anchors 17:20 (kingdom within) + 17:26 (Noah/Lot block).
-- 3 NEW threads: 17:1-4 offences/millstone/forgive; 17:5-10 faith/unprofitable
-- servants; 17:11-19 ten lepers / shown to priests / the Samaritan returns.
-- Band base 14480, step 3.
-- ============================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _lk17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows --------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 17:1-4 offences / millstone / rebuke-and-forgive ---------------
  ('canon','luke',17,2,'canon','leviticus',19,17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The Torah of brotherly love is the very ground Yahusha stands on in 17:3 — *if thy brother trespass against thee, rebuke him; and if he repent, forgive him.* The rebuke is not cruelty but the refusal to *suffer sin upon him*; love does not flatter a brother into ruin.'),
  ('canon','luke',17,2,'canon','ezekiel',14,9, 'free', E'*And if the prophet be deceived when he hath spoken a thing, I Yahuah (LORD) have deceived that prophet, and I will stretch out my hand upon him, and will destroy him from the midst of my people Yashar''el (Israel)* (Ezekiel 14:9). To set a stumbling-block before the people is no light thing — Yahuah Himself moves against the one who leads His own astray, which is why the millstone is the gentler fate (Luke 17:2).'),
  ('canon','luke',17,2,'canon','ezekiel',14,11, 'free', E'*That the house of Yashar''el (Israel) may go no more astray from me, neither be polluted any more with all their transgressions; but that they may be my people, and I may be their Elohim (God), saith Adonai Yahuah (the Lord GOD)* (Ezekiel 14:11). The Father''s aim in removing the stumbling-block is restoration — that His people *go no more astray.* Causing *one of these little ones to offend* works directly against that mercy.'),
  ('canon','luke',17,4,'canon','proverbs',28,13, 'free', E'*He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13). The seven-times-a-day repentance Yahusha commands answers the seven-times-a-day return of the brother who says *I repent* (Luke 17:4) — the one who confesses and forsakes is met with the very mercy Proverbs promises, again and again.'),

  -- THREAD 2: 17:5-10 increase our faith / unprofitable servants -------------
  ('canon','luke',17,5,'canon','habakkuk',2,4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). The apostles cry *Increase our faith* (17:5), and Yahusha answers that even mustard-seed faith uproots the sycamine — for the just have always lived by faith, the trusting that takes Yahuah at His word. Yet that same faith, in the parable that follows, is the faith that *works* its owed service.'),
  ('canon','luke',17,10,'canon','deuteronomy',10,12, 'free', E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul* (Deuteronomy 10:12). When the servant has *done all those things which are commanded* (Luke 17:10), he has only rendered what Yahuah requires — fear, walk, love, serve. Obedience does not put Elohim in our debt; it is the creature''s owed worship.'),
  ('canon','luke',17,10,'canon','deuteronomy',10,13, 'free', E'*To keep the commandments of Yahuah (LORD), and his statutes, which I command thee this day for thy good?* (Deuteronomy 10:13). The commandments are kept *for thy good* — so the *unprofitable servant* is no grudging slave but one who knows his duty is his blessing. Faith that DOES its covenant duty is not merit earned over Elohim; it is the trust that bears fruit, and it is the keeping that is for our own good.'),
  ('canon','luke',17,10,'canon','psalms',116,16, 'free', E'*O Yahuah (LORD), truly I am thy servant; I am thy servant, and the son of thine handmaid: thou hast loosed my bonds* (Psalm 116:16). Here is the heart of the *unprofitable servant* — gladly owning the title *servant,* claiming no wage, boasting in no merit, for it is Yahuah who *loosed my bonds.* Done duty is the freed man''s response, not the hireling''s claim.'),
  ('canon','luke',17,10,'apocrypha','ecclesiasticus',35,1, 'extras', E'*He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Sirach 35:1). The second-Temple wisdom fuses faith and faithful doing exactly as Yahusha does — to keep the law IS the acceptable service, the offering *enough.* The servant who has *done that which was our duty* (Luke 17:10) has brought the very sacrifice that pleases; obedience and trust are never torn apart in the library.'),

  -- THREAD 3: 17:11-19 ten lepers / shown to priests / the Samaritan returns -
  ('canon','luke',17,14,'canon','leviticus',13,45, 'free', E'*And the leper in whom the plague is, his clothes shall be rent, and his head bare, and he shall put a covering upon his upper lip, and shall cry, Unclean, unclean* (Leviticus 13:45). The ten *stood afar off* (17:12) because the Torah set the leper outside the camp, crying his own uncleanness. Their cry *Master, have mercy on us* rises from the very place the law had fixed them.'),
  ('canon','luke',17,14,'canon','leviticus',13,46, 'free', E'*All the days wherein the plague shall be in him he shall be defiled; he is unclean: he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46). The leper *dwell(s) alone... without the camp* — so the healing that restores them to the camp must be sealed by the priest. Yahusha does not bypass the Torah; He sends them straight into it.'),
  ('canon','luke',17,14,'canon','leviticus',14,2, 'free', E'*This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* (Leviticus 14:2). ★ When Yahusha says *Go shew yourselves unto the priests* (17:14), He commands the exact statute — *the law of the leper... He shall be brought unto the priest.* The Torah is upheld, not abolished; the cleansing is real because it is certified the Father''s appointed way.'),
  ('canon','luke',17,14,'canon','leviticus',14,3, 'free', E'*And the priest shall go forth out of the camp; and the priest shall look, and, behold, if the plague of leprosy be healed in the leper* (Leviticus 14:3). The priest *shall look... if the plague... be healed* — and *as they went, they were cleansed* (Luke 17:14). They were healed in the very act of obeying the command to go; faith walked into the Torah and was made whole on the road.'),
  ('canon','luke',17,16,'canon','2-kings',5,14, 'free', E'*Then went he down, and dipped himself seven times in Jordan, according to the saying of the man of Elohim (God): and his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14). Naaman the Syrian — the foreigner — is cleansed of leprosy when he stoops to obey, the pattern of the one leper who returns. The outsider healed and the outsider grateful is an old, old thread.'),
  ('canon','luke',17,16,'canon','2-kings',5,15, 'free', E'*And he returned to the man of Elohim (God)... and he said, Behold, now I know that there is no Elohim (God) in all the earth, but in Yashar''el (Israel)* (2 Kings 5:15). ★ Naaman *returned... to give glory* — and so does the lone Samaritan, who *turned back, and with a loud voice glorified Elohim* (Luke 17:15). The stranger who returns to give glory: this is two-house grace — the northern outsider grafted in, *Elohim hath not cast away his people* (Rom 11:1-2), and the one who knows it bows lowest.'),
  ('canon','luke',17,15,'canon','psalms',103,2, 'free', E'*Bless Yahuah (LORD), O my soul, and forget not all his benefits* (Psalm 103:2). The nine *forgot all his benefits*; the one *turned back* and blessed. The Samaritan''s loud-voiced glory is Psalm 103 lived out — the soul that will *not forget.*'),
  ('canon','luke',17,15,'canon','psalms',103,3, 'free', E'*Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3). The Healer who cleansed ten bodies is the same who *forgiveth all thine iniquities* — and to the one who returned, *thy faith hath made thee whole* (17:19), the deeper healing the other nine walked away from.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-17-offences-the-millstone-and-the-torah-of-rebuke-and-forgive-leviticus-19',
       E'It is impossible but that offences will come — the millstone and the Torah of rebuke-and-forgive (Leviticus 19; Ezekiel 14)',
       E'Yahusha turns to the disciples with a sober word: *It is impossible but that offences will come: but woe unto him, through whom they come!* (Luke 17:1). To set a snare before a *little one* is so grave that *it were better for him that a millstone were hanged about his neck, and he cast into the sea, than that he should offend one of these little ones* (17:2). This is not new severity — it is the Torah''s own seriousness about leading the people astray. *And if the prophet be deceived when he hath spoken a thing, I Yahuah (LORD) have deceived that prophet, and I will stretch out my hand upon him, and will destroy him from the midst of my people Yashar''el (Israel)* (Ezekiel 14:9), and all *that the house of Yashar''el (Israel) may go no more astray from me... but that they may be my people* (Ezekiel 14:11). The Father moves against the stumbling-block for the sake of restoration. And the answer to offence among brothers is the answer Moses already gave: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). So Yahusha commands, *If thy brother trespass against thee, rebuke him; and if he repent, forgive him* (17:3) — *and if he trespass against thee seven times in a day, and seven times in a day turn again to thee, saying, I repent; thou shalt forgive him* (17:4). The rebuke is love refusing to *suffer sin* upon a brother; the forgiveness is the mercy Proverbs promises — *whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13) — poured out as often as the returning sinner says *I repent.* The Torah of brotherly love stands whole: rebuke that does not hate, and forgiveness that does not weary.',
       sv.verse_id, ev.verse_id, 'free', 14480
  FROM _lk17_lookup sv, _lk17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-17-we-are-unprofitable-servants-faith-that-does-its-owed-duty-habakkuk-2-deuteronomy-10-sirach-35',
       E'We are unprofitable servants — faith that DOES its owed covenant duty (Habakkuk 2; Deuteronomy 10; Sirach 35)',
       E'When the apostles plead *Increase our faith* (Luke 17:5), Yahusha answers that faith the size of *a grain of mustard seed* can uproot the sycamine and plant it in the sea (17:6) — for *the just shall live by his faith* (Habakkuk 2:4), the trusting that takes Yahuah at His word. But then He guards that faith from ever becoming a boast. He paints the servant who comes in from *plowing or feeding cattle* and is not thanked merely for *the things that were commanded him* (17:7-9), and He drives it home: *So likewise ye, when ye shall have done all those things which are commanded you, say, We are unprofitable servants: we have done that which was our duty to do* (17:10). ★ Here faith and faithful doing are held together. Obedience does not put Elohim in our debt — it renders only what the covenant already owes: *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul* (Deuteronomy 10:12), *to keep the commandments of Yahuah (LORD), and his statutes, which I command thee this day for thy good* (Deuteronomy 10:13). The keeping is *for thy good* — so the unprofitable servant is no grudging hireling but a freed son, who says with the Psalmist, *O Yahuah (LORD), truly I am thy servant; I am thy servant, and the son of thine handmaid: thou hast loosed my bonds* (Psalm 116:16). The second-Temple wisdom said the same: *He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Sirach 35:1). This is the anti-antinomian and anti-merit seal at once — faith that works its owed service, never to earn, always because it trusts and because the duty is itself the gift.',
       sv.verse_id, ev.verse_id, 'extras', 14483
  FROM _lk17_lookup sv, _lk17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=17 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5',
       E'Ten lepers shewn unto the priests, and the stranger who returned to give glory (Leviticus 13-14; 2 Kings 5; Psalm 103)',
       E'Ten men *that were lepers... stood afar off* (Luke 17:12) — afar off because the Torah had set them there: *the leper... shall cry, Unclean, unclean* (Leviticus 13:45), and *he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46). They lift their cry, *Yahusha (Jesus), Master, have mercy on us* (17:13), and His answer sends them straight back into the Torah: *Go shew yourselves unto the priests* (17:14). ★ For that is the statute exactly — *This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* (Leviticus 14:2), and *the priest shall look, and, behold, if the plague of leprosy be healed in the leper* (Leviticus 14:3). Yahusha does not abolish the law of the leper; He commands it, and *as they went, they were cleansed* (17:14) — healed in the very act of obedience, faith walking into the Torah and made whole on the road. Then the turn that breaks the heart open: *one of them, when he saw that he was healed, turned back, and with a loud voice glorified Elohim, and fell down on his face at his feet, giving him thanks: and he was a Samaritan* (17:15-16). The lone returner is the northern stranger, and Yahusha marks it: *There are not found that returned to give glory to Elohim, save this stranger* (17:18). It is an old pattern — Naaman the Syrian, *his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14), then *returned to the man of Elohim (God)... Behold, now I know that there is no Elohim (God) in all the earth, but in Yashar''el (Israel)* (2 Kings 5:15). The foreigner cleansed, the foreigner returning to give glory: this is two-house grace — the outsider grafted in, for *Elohim hath not cast away his people* (Romans 11:1-2). The nine *forgot all his benefits*; the one *forget not all his benefits* (Psalm 103:2), blessing *who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3) — and to him alone Yahusha said, *Arise, go thy way: thy faith hath made thee whole* (17:19).',
       sv.verse_id, ev.verse_id, 'free', 14486
  FROM _lk17_lookup sv, _lk17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=17 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members --------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* — the Torah of love behind *rebuke him; and if he repent, forgive him.*'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-offences-the-millstone-and-the-torah-of-rebuke-and-forgive-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 14:9 — Yahuah stretches out His hand against the prophet who leads His people astray; the millstone is the gentler fate.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-offences-the-millstone-and-the-torah-of-rebuke-and-forgive-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 14:11 — the Father removes the stumbling-block so *the house of Yashar''el may go no more astray... that they may be my people.*'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-offences-the-millstone-and-the-torah-of-rebuke-and-forgive-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 28:13 — *whoso confesseth and forsaketh them shall have mercy* — the mercy met out to the brother who returns seven times saying *I repent.*'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-offences-the-millstone-and-the-torah-of-rebuke-and-forgive-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:4 — *the just shall live by his faith* — the trusting answer to *Increase our faith,* the same faith that then does its duty.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-we-are-unprofitable-servants-faith-that-does-its-owed-duty-habakkuk-2-deuteronomy-10-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:12 — what Yahuah requires: fear, walk, love, serve — done duty, not merit earned over Elohim.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-we-are-unprofitable-servants-faith-that-does-its-owed-duty-habakkuk-2-deuteronomy-10-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:13 — keep the commandments *for thy good* — the servant''s duty is itself the blessing.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-we-are-unprofitable-servants-faith-that-does-its-owed-duty-habakkuk-2-deuteronomy-10-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 116:16 — *truly I am thy servant... thou hast loosed my bonds* — the unprofitable servant''s glad self-naming, no wage claimed.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-we-are-unprofitable-servants-faith-that-does-its-owed-duty-habakkuk-2-deuteronomy-10-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 35:1 — *He that keepeth the law brings offerings enough* — second-Temple wisdom fusing faith and faithful doing; obedience is the acceptable service.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-we-are-unprofitable-servants-faith-that-does-its-owed-duty-habakkuk-2-deuteronomy-10-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 13:45 — *Unclean, unclean* — why the ten *stood afar off.*'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 13:46 — *without the camp shall his habitation be* — the separation the cleansing must reverse.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 14:2 — ★ *He shall be brought unto the priest* — the exact statute Yahusha commands in *Go shew yourselves unto the priests.* Torah upheld.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 14:3 — the priest *shall look... if the plague... be healed* — they were cleansed *as they went,* healed in obeying.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Kings 5:14 — Naaman the foreigner cleansed of leprosy when he stoops to obey — the pattern of the one who returns.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Kings 5:15 — ★ Naaman *returned... to give glory* — two-house grace: the stranger grafted in, *Elohim hath not cast away his people* (Rom 11:1-2).'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Psalm 103:2 — *forget not all his benefits* — the soul of the one who turned back to glorify Elohim; the nine forgot.'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Psalm 103:3 — *who forgiveth all thine iniquities; who healeth all thy diseases* — the deeper healing in *thy faith hath made thee whole.*'
  FROM cross_reference_threads t, cross_references x, _lk17_lookup sv, _lk17_lookup tv
 WHERE t.slug='luke-17-ten-lepers-shewn-to-the-priests-and-the-stranger-who-returned-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_18.sql -----
-- minion_luke_18.sql — Luke 18 NT-depth cross-references (THIN-ADD, 3 NEW threads)
-- DEDUP: 18:1 (importunate widow) and 18:9 (Pharisee & publican) already exist — NOT re-anchored.
-- Band base = 14000 + (18-1)*30 = 14510, step 3.

-- 3a. Temp view
CREATE TEMP VIEW _lk18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: 18:15-17 little children / receive the kingdom as a little child
  ('canon','luke',18,16,'canon','psalms',8,2, 'free', E'*Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger* (Psalm 8:2). The praise Yahuah (LORD) ordains is not the strength of the mighty but the strength of the small — the very thing the kingdom is built upon.'),
  ('canon','luke',18,16,'canon','deuteronomy',1,39, 'free', E'*Moreover your little ones, which ye said should be a prey, and your children, which in that day had no knowledge between good and evil, they shall go in thither, and unto them will I give it, and they shall possess it* (Deuteronomy 1:39). The generation that calculated and rebelled was shut out; the little ones, who could only be carried, inherited the land. Israel''s own history is the parable.'),
  ('canon','luke',18,17,'canon','joel',2,16, 'free', E'*Gather the people, sanctify the congregation, assemble the elders, gather the children, and those that suck the breasts: let the bridegroom go forth of his chamber, and the bride out of her closet* (Joel 2:16). When Yahuah (LORD) gathers his people, the nursing infants are gathered with them — not turned away, but named in the assembly.'),
  ('canon','luke',18,17,'canon','psalms',131,2, 'free', E'*Surely I have behaved and quieted myself, as a child that is weaned of his mother: my soul is even as a weaned child* (Psalm 131:2). This is the posture of the one who enters: a heart not haughty, not exercised in things too high, but stilled and trusting — the kingdom received *as a little child*.'),

  -- Thread 2: 18:18-30 the rich ruler / thou knowest the commandments / one thing thou lackest
  ('canon','luke',18,20,'canon','exodus',20,12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). Yahusha (Jesus) names the commandment straight from Sinai. He does not soften the Torah or set it aside — he holds it up: *Thou knowest the commandments.*'),
  ('canon','luke',18,20,'canon','exodus',20,13, 'free', E'*Thou shalt not kill* (Exodus 20:13). One after another the Formed Son recites the Ten Words — kill not, steal not, false witness not, adultery not — the abiding Torah of the Father, never abrogated, named as the path of life the ruler already walks.'),
  ('canon','luke',18,20,'canon','deuteronomy',5,16, 'free', E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Deuteronomy 5:16). The same commandments restated in Moses'' farewell stand behind Yahusha''s words; the Torah is one, given once and still binding.'),
  ('canon','luke',18,22,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). To *sell all... and distribute unto the poor* is this royal law made flesh — the love of neighbour that the grip of riches had quietly choked.'),
  ('canon','luke',18,22,'canon','deuteronomy',6,5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). Here is the *one thing* the ruler lacked: not a heavier rule than the Torah, but the undivided heart the Torah always demanded. Mammon held the place that belonged to Yahuah alone — and *thou shalt have no other gods* leaves no room for a second master.'),
  ('canon','luke',18,30,'canon','deuteronomy',24,15, 'free', E'*At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* (Deuteronomy 24:15). The Torah forever bends the wealth of Yashar''el (Israel) toward the poor; the ruler''s sorrow exposes a heart set on riches rather than on the open hand the law requires.'),

  -- Thread 3: 18:31-43 all things written by the prophets / Son of David, have mercy
  ('canon','luke',18,31,'canon','isaiah',53,5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). When Yahusha (Jesus) says *all things that are written by the prophets concerning the Son of Adam shall be accomplished*, this is the chief of those writings — the cross was prophesied long before it was carried.'),
  ('canon','luke',18,32,'canon','isaiah',53,7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). *He shall be delivered unto the Gentiles, and shall be mocked, and spitefully entreated, and spitted on* — the silent, suffering Lamb of Isaiah walks toward Jerusalem.'),
  ('canon','luke',18,32,'canon','psalms',22,7, 'free', E'*All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying* (Psalm 22:7). The mocking and the spitting are written in David''s psalm of the pierced one centuries before; the prophets'' word is not failing — it is being *accomplished*.'),
  ('canon','luke',18,38,'canon','2-samuel',7,13, 'free', E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The blind beggar cries *Thou Son of David* — confessing the everlasting throne promised to David''s seed. He is the Son of David in the flesh, the Son begotten and exalted by the Father.'),
  ('canon','luke',18,41,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5). The sign of the coming of Elohim (God) to save is the opening of blind eyes — and at Jericho the prophecy is fulfilled before the crowd: *Receive thy sight; thy faith hath saved thee.*'),
  ('canon','luke',18,42,'canon','psalms',146,8, 'free', E'*Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous* (Psalm 146:8). What the psalm ascribes to Yahuah is done by the Formed Son in his sight — the Father''s own healing work shining through the One he sent.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-18-receive-the-kingdom-as-a-little-child-psalm-8-deuteronomy-1',
       E'Suffer little children to come unto me — the kingdom received as a little child (Psalm 8; Deuteronomy 1; Joel 2)',
       E'When the disciples rebuke those who bring the infants, Yahusha (Jesus) overturns them: *Suffer little children to come unto me, and forbid them not: for of such is the kingdom of Elohim (God)* (Luke 18:16), and *Whosoever shall not receive the kingdom of Elohim (God) as a little child shall in no wise enter therein* (Luke 18:17). Come and see how the whole library teaches that Yahuah (LORD) builds upon the small and the trusting. *Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger* (Psalm 8:2) — the kingdom''s strength is the praise of the little ones. Israel''s own story carries the lesson: the scheming, rebelling generation was shut out of the land, but *your little ones, which ye said should be a prey, and your children, which in that day had no knowledge between good and evil, they shall go in thither, and unto them will I give it, and they shall possess it* (Deuteronomy 1:39). When Yahuah gathers his people he never leaves the children behind — *Gather the people, sanctify the congregation, assemble the elders, gather the children, and those that suck the breasts* (Joel 2:16). And the heart of the one who enters is drawn in David''s picture: *Surely I have behaved and quieted myself, as a child that is weaned of his mother: my soul is even as a weaned child* (Psalm 131:2). The kingdom is not earned by the great; it is received, like a gift into open hands, by the small.',
       sv.verse_id, ev.verse_id, 'free', 14510
  FROM _lk18_lookup sv, _lk18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=18 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-18-thou-knowest-the-commandments-and-the-one-thing-lacking-exodus-20-deuteronomy-6',
       E'Thou knowest the commandments — the Torah upheld and the one thing lacking (Exodus 20; Deuteronomy 5–6; Leviticus 19)',
       E'A rich ruler asks *what shall I do to inherit eternal life?* (Luke 18:18), and Yahusha (Jesus) answers not by setting the Torah aside but by pointing straight to it: *Thou knowest the commandments, Do not commit adultery, Do not kill, Do not steal, Do not bear false witness, Honour thy father and thy mother* (Luke 18:20). Come and see — these are the very words of Sinai, named one by one: *Honour thy father and thy mother* (Exodus 20:12), *Thou shalt not kill* (Exodus 20:13), restated in Moses'' farewell — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:16). The Formed Son does not say the commandments are too few or now abolished; he says *thou knowest* them. They stand. Then he names the man''s lack: *Yet lackest thou one thing: sell all that thou hast, and distribute unto the poor... and come, follow me* (Luke 18:22). This *one thing* is not a heavier law than the Torah — it is the heart the Torah always required: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). The ruler''s wealth had become the rival god the very first Word forbids, choking out *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself* (Leviticus 19:18) and the law that bends riches toward the poor — *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it* (Deuteronomy 24:15). *How hardly shall they that have riches enter into the kingdom of Elohim (God)!* — the camel and the needle''s eye. The commandments were never the problem; the divided heart was. The Torah is upheld; the idol of mammon is exposed.',
       sv.verse_id, ev.verse_id, 'free', 14513
  FROM _lk18_lookup sv, _lk18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=18 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-18-all-that-the-prophets-wrote-fulfilled-and-the-son-of-david-isaiah-53-2-samuel-7',
       E'All things written by the prophets accomplished — and the blind man''s cry, Thou Son of David (Isaiah 53; Psalm 22; 2 Samuel 7)',
       E'On the road up to Jerusalem Yahusha (Jesus) tells the twelve plainly: *Behold, we go up to Jerusalem, and all things that are written by the prophets concerning the Son of Adam shall be accomplished* (Luke 18:31). Come and see that the cross is no accident — it was written long before. *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5); *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter* (Isaiah 53:7). His own words — *he shall be delivered unto the Gentiles, and shall be mocked, and spitefully entreated, and spitted on* — are David''s psalm coming true: *All they that see me laugh me to scorn: they shoot out the lip, they shake the head* (Psalm 22:7). Then, at Jericho, a blind beggar cries out what the rulers will not see: *Thou Son of David, have mercy on me* (Luke 18:38). He confesses the everlasting throne promised to David''s seed — *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — the Son of David in the flesh, the Son begotten and exalted by the Father. And the healing is itself the prophets fulfilled: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5). What the psalm ascribes to Yahuah (LORD) himself — *Yahuah (LORD) openeth the eyes of the blind* (Psalm 146:8) — is wrought by the Formed Son in the sight of all, the Father''s own work shining through the One he sent. *Thy faith hath saved thee.*',
       sv.verse_id, ev.verse_id, 'free', 14516
  FROM _lk18_lookup sv, _lk18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=18 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 8:2 — *Out of the mouth of babes and sucklings hast thou ordained strength* — the kingdom''s strength is the praise of the small.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-receive-the-kingdom-as-a-little-child-psalm-8-deuteronomy-1'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 1:39 — the little ones inherit the land the calculating generation forfeited.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-receive-the-kingdom-as-a-little-child-psalm-8-deuteronomy-1'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:16 — when Yahuah gathers his people, the nursing children are gathered with them.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-receive-the-kingdom-as-a-little-child-psalm-8-deuteronomy-1'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 131:2 — *as a child that is weaned of his mother* — the stilled, trusting heart that enters.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-receive-the-kingdom-as-a-little-child-psalm-8-deuteronomy-1'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=131 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother* — Yahusha names the Fifth Word from Sinai.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-thou-knowest-the-commandments-and-the-one-thing-lacking-exodus-20-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:13 — *Thou shalt not kill* — the Ten Words recited as the abiding path of life.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-thou-knowest-the-commandments-and-the-one-thing-lacking-exodus-20-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 5:16 — the same commandments restated in Moses'' farewell; the Torah is one and still binding.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-thou-knowest-the-commandments-and-the-one-thing-lacking-exodus-20-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 19:18 — *love thy neighbour as thyself* — made flesh in giving to the poor.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-thou-knowest-the-commandments-and-the-one-thing-lacking-exodus-20-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 6:5 — *love Yahuah... with all thine heart* — the one thing lacking: the undivided heart, with no rival god of mammon.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-thou-knowest-the-commandments-and-the-one-thing-lacking-exodus-20-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 24:15 — the Torah bends wealth toward the poor; the ruler''s sorrow shows a heart set on riches.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-thou-knowest-the-commandments-and-the-one-thing-lacking-exodus-20-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *with his stripes we are healed* — the chief of the prophets'' writings concerning the suffering Son.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-all-that-the-prophets-wrote-fulfilled-and-the-son-of-david-isaiah-53-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:7 — *as a lamb to the slaughter* — the silent suffering of the mocked and spat-upon Son foretold.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-all-that-the-prophets-wrote-fulfilled-and-the-son-of-david-isaiah-53-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:7 — *they shoot out the lip, they shake the head* — the mocking written in David''s psalm of the pierced one.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-all-that-the-prophets-wrote-fulfilled-and-the-son-of-david-isaiah-53-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Samuel 7:13 — *the throne of his kingdom for ever* — the everlasting throne the blind man confesses crying *Thou Son of David*.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-all-that-the-prophets-wrote-fulfilled-and-the-son-of-david-isaiah-53-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 35:5 — *the eyes of the blind shall be opened* — the sign of Elohim coming to save, fulfilled at Jericho.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-all-that-the-prophets-wrote-fulfilled-and-the-son-of-david-isaiah-53-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 146:8 — *Yahuah openeth the eyes of the blind* — the Father''s own healing work wrought through the Formed Son he sent.'
  FROM cross_reference_threads t, cross_references x, _lk18_lookup sv, _lk18_lookup tv
 WHERE t.slug='luke-18-all-that-the-prophets-wrote-fulfilled-and-the-son-of-david-isaiah-53-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=18 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_19.sql -----
-- ============================================================================
-- Luke 19 — full-library Come-and-See cross-reference threads (NT DEPTH pass)
-- THIN-ADD: existing anchors 19:10 and 19:41-44 are NOT re-anchored here.
-- 3 NEW threads: 19:1-9 Zacchaeus / 19:11-27 the pounds / 19:28-40 triumphal entry
-- sort_order band base 14540, step 3.
-- ============================================================================

-- 3a. Temp view ---------------------------------------------------------------
CREATE TEMP VIEW _lk19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ---------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- ===== Thread 1: 19:1-9 Zacchaeus / fourfold restitution =====
  ('canon','luke',19,8,'canon','exodus',22,1, 'free', E'*If a man shall steal an ox, or a sheep, and kill it, or sell it; he shall restore five oxen for an ox, and four sheep for a sheep* (Exodus 22:1). Zacchæus does not invent a new generosity — he reaches for the Torah''s own measure for the stolen sheep: fourfold. His repentance bears Torah-fruit by the very statute.'),
  ('canon','luke',19,8,'canon','leviticus',6,5, 'free', E'*He shall even restore it in the principal, and shall add the fifth part more thereto, and give it unto him to whom it appertaineth, in the day of his trespass offering* (Leviticus 6:5; see vv.4-5). Restoring what was taken by violence or deceit, principal plus a fifth, is the prescribed shape of true turning — Zacchæus walks the statute.'),
  ('canon','luke',19,8,'canon','numbers',5,7, 'free', E'*Then they shall confess their sin which they have done: and he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof, and give it unto him against whom he hath trespassed* (Numbers 5:7; see vv.6-7). Confession AND recompense together — the Torah binds the heart''s turning to the hand''s restitution. Zacchæus does both, standing.'),
  ('canon','luke',19,8,'canon','ezekiel',33,15, 'free', E'*If the wicked restore the pledge, give again that he had robbed, walk in the statutes of life, without committing iniquity; he shall surely live, he shall not die* (Ezekiel 33:15; see vv.14-16). The prophet''s portrait of the wicked who lives: he restores. *This day is salvation come to this house* (Luke 19:9) lands exactly where Ezekiel said life is found.'),
  ('canon','luke',19,9,'canon','galatians',3,7, 'free', E'*Know ye therefore that they which are of faith, the same are the children of Abraham* (Galatians 3:7). Yahusha names Zacchæus *a son of Abraham* (Luke 19:9) — the lost of the seed sought and saved, not a stranger to the covenant but a child of it restored.'),
  ('canon','luke',19,9,'canon','acts',3,25, 'free', E'*Ye are the children of the prophets, and of the covenant which Elohim (God) made with our fathers, saying unto Abraham, And in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25). The *son of Abraham* belongs to the covenant promise; the gathering of the lost is Israel coming home, the people never cast off (Romans 11:1-2).'),

  -- ===== Thread 2: 19:11-27 the pounds / nobleman receives a kingdom =====
  ('canon','luke',19,12,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). The nobleman *went into a far country to receive for himself a kingdom, and to return* (Luke 19:12) — the *one like* (kaph, the comparative kept) the Son of Adam who is BROUGHT near to the Father.'),
  ('canon','luke',19,12,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). The kingdom is GIVEN — the Formed Son receives it FROM the Father, then returns to reckon. He does not seize it as a co-equal; he is given it, and reigns.'),
  ('canon','luke',19,15,'canon','ezekiel',34,10, 'free', E'*Behold, I am against the shepherds; and I will require my flock at their hand* (Ezekiel 34:10). When the King returns *he commanded these servants to be called unto him... that he might know how much every man had gained* (Luke 19:15) — the same reckoning the Shepherd makes with the stewards of his flock.'),
  ('canon','luke',19,16,'canon','proverbs',13,11, 'free', E'*Wealth gotten by vanity shall be diminished: but he that gathereth by labour shall increase* (Proverbs 13:11). The pound *kept laid up in a napkin* gains nothing; the faithful servants trade and increase — the wisdom of diligent stewardship until the Lord comes.'),
  ('canon','luke',19,17,'canon','matthew',25,21, 'free', E'*His lord said unto him, Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things* (Matthew 25:21). *Well, thou good servant: because thou hast been faithful in a very little, have thou authority over ten cities* (Luke 19:17) — faithfulness in little is rewarded with rule, the gospels'' twin parable.'),
  ('canon','luke',19,27,'canon','revelation',11,15, 'free', E'*The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The citizens who said *We will not have this man to reign over us* (Luke 19:14) are answered at the end: the King returns, the kingdom is consummated, and he reigns — the everlasting dominion of Daniel fulfilled.'),

  -- ===== Thread 3: 19:28-40 triumphal entry on the colt / Blessed is the King =====
  ('canon','luke',19,35,'canon','zechariah',9,9, 'free', E'*Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9). The colt *whereon yet never man sat* (Luke 19:30) is no accident — the lowly King of Zion enters exactly as the prophet foretold.'),
  ('canon','luke',19,38,'canon','psalms',118,26, 'free', E'*Blessed be he that cometh in the name of Yahuah (LORD): we have blessed you out of the house of Yahuah (LORD)* (Psalm 118:26). The multitude''s cry, *Blessed be the King that cometh in the name of Yahuah* (Luke 19:38), is the pilgrim psalm sung to the rejected-then-exalted Stone of the very next breath (Psalm 118:22).'),
  ('canon','luke',19,40,'canon','habakkuk',2,11, 'free', E'*For the stone shall cry out of the wall, and the beam out of the timber shall answer it* (Habakkuk 2:11). *If these should hold their peace, the stones would immediately cry out* (Luke 19:40) — creation itself owns the King; even the stones, the prophet says, will testify when men are silent.'),
  ('canon','luke',19,35,'canon','genesis',49,10, 'free', E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be. Binding his foal unto the vine, and his ass''s colt unto the choice vine* (Genesis 49:10-11). Jacob''s blessing on Yahudah binds the foal and the colt to the coming Shiloh — the sceptre of Judah riding into his city.'),
  ('canon','luke',19,38,'canon','matthew',21,9, 'free', E'*And the multitudes that went before, and that followed, cried, saying, Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord); Hosanna in the highest* (Matthew 21:9). The gospels sing one song at the gate: the Son of David, the King of Zion, blessed in the Name.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-19-zacchaeus-fourfold-restitution-the-son-of-abraham-restored-exodus-22-leviticus-6',
       E'Zacchæus restores fourfold — repentance that bears Torah-fruit, the son of Abraham sought and saved (Exodus 22; Leviticus 6; Ezekiel 33)',
       E'Zacchæus the chief publican climbs the sycomore, and when the Lord calls him down *to day I must abide at thy house* (Luke 19:5), the rich man''s repentance pours out as restitution: *Behold, Yahuah (Lord), the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8). He invents nothing. He reaches for the Torah''s own measure — *he shall restore five oxen for an ox, and four sheep for a sheep* (Exodus 22:1) — fourfold for the stolen sheep. The trespass offering law is the same shape: *he shall even restore it in the principal, and shall add the fifth part more thereto, and give it unto him to whom it appertaineth* (Leviticus 6:5; vv.4-5), and Numbers binds the turning of the heart to the work of the hand: *Then they shall confess their sin which they have done: and he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof* (Numbers 5:7; vv.6-7). True repentance is not a feeling — it is Torah-fruit. Ezekiel painted the very portrait: *If the wicked restore the pledge, give again that he had robbed, walk in the statutes of life, without committing iniquity; he shall surely live, he shall not die* (Ezekiel 33:15; vv.14-16). And so the verdict: *This day is salvation come to this house, forsomuch as he also is a son of Abraham* (Luke 19:9). Zacchæus is no stranger to the covenant — he is a lost child of it brought home. *Know ye therefore that they which are of faith, the same are the children of Abraham* (Galatians 3:7); *Ye are the children of the prophets, and of the covenant which Elohim (God) made with our fathers, saying unto Abraham, And in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25). The Son of Adam came *to seek and to save that which was lost* (Luke 19:10) — the lost of Israel gathered, the people never cast off (Romans 11:1-2). Grace and the Torah are not at war here; salvation arrives, and it walks the statute out the door.',
       sv.verse_id, ev.verse_id, 'free', 14540
  FROM _lk19_lookup sv, _lk19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-19-the-pounds-the-nobleman-receives-a-kingdom-and-returns-daniel-7-ezekiel-34',
       E'The pounds — a nobleman receives a kingdom FROM the Father and returns to reckon (Daniel 7; Ezekiel 34)',
       E'Because they thought *the kingdom of Elohim (God) should immediately appear* (Luke 19:11), Yahusha tells of *a certain nobleman* who *went into a far country to receive for himself a kingdom, and to return* (Luke 19:12). The shape is Daniel''s throne-room: *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13) — the comparative *like* (kaph) kept, the Son brought NEAR to the Father — *and there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). The kingdom is GIVEN. The Formed Son does not seize it as a co-equal nor earn it as a creature; he receives it FROM the Father and returns. And when he returns *he commanded these servants to be called unto him... that he might know how much every man had gained* (Luke 19:15) — the Shepherd''s reckoning with the stewards of his flock: *Behold, I am against the shepherds; and I will require my flock at their hand* (Ezekiel 34:10). The faithful trade and increase, for *he that gathereth by labour shall increase* (Proverbs 13:11), while the pound *kept laid up in a napkin* gains nothing. To the diligent comes the word the gospels twin in Matthew: *Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things* (Matthew 25:21) — here, *have thou authority over ten cities* (Luke 19:17). And the citizens who said *We will not have this man to reign over us* (Luke 19:14) are answered at the last, when *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). Occupy till he comes — the King is given the everlasting dominion, and he WILL return to reign.',
       sv.verse_id, ev.verse_id, 'free', 14543
  FROM _lk19_lookup sv, _lk19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=19 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-19-the-king-comes-lowly-on-the-colt-blessed-is-he-the-stones-would-cry-out-zechariah-9-psalm-118',
       E'The King comes lowly on the colt — Blessed is he that cometh, and the stones would cry out (Zechariah 9; Psalm 118; Habakkuk 2; Genesis 49)',
       E'They set Yahusha on *a colt tied, whereon yet never man sat* (Luke 19:30), cast their garments on it, and spread their clothes in the way — and it is no accident, for the prophet had drawn the scene centuries before: *Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9). The King of Zion comes not on a war-horse but lowly. The multitude sings the pilgrim psalm: *Blessed be the King that cometh in the name of Yahuah (Lord): peace in heaven, and glory in the highest* (Luke 19:38), the very words of *Blessed be he that cometh in the name of Yahuah (LORD)* (Psalm 118:26) — sung over the Stone the builders refused, become the head of the corner (Psalm 118:22). When the Pharisees demand he rebuke them, he answers, *if these should hold their peace, the stones would immediately cry out* (Luke 19:40), and Habakkuk had already heard them: *For the stone shall cry out of the wall, and the beam out of the timber shall answer it* (Habakkuk 2:11) — creation itself owns the King when men fall silent. And the colt was bound to him from the patriarch''s blessing: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be. Binding his foal unto the vine, and his ass''s colt unto the choice vine* (Genesis 49:10-11) — the sceptre of Judah, riding his foal into his own city. The gospels sing one song at the gate: *Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord); Hosanna in the highest* (Matthew 21:9). The lowly King, the Son of David, the Shiloh of Judah, enters Yerushalayim exactly as it was written.',
       sv.verse_id, ev.verse_id, 'free', 14546
  FROM _lk19_lookup sv, _lk19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=19 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members ---------------------------------------------------------
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 22:1 — *he shall restore five oxen for an ox, and four sheep for a sheep* — the Torah''s fourfold measure Zacchæus reaches for.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-zacchaeus-fourfold-restitution-the-son-of-abraham-restored-exodus-22-leviticus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 6:5 — *restore it in the principal, and shall add the fifth part more thereto* — the trespass-offering shape of restitution.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-zacchaeus-fourfold-restitution-the-son-of-abraham-restored-exodus-22-leviticus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 5:7 — *they shall confess their sin... and he shall recompense his trespass with the principal* — confession bound to restitution.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-zacchaeus-fourfold-restitution-the-son-of-abraham-restored-exodus-22-leviticus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 33:15 — *If the wicked restore the pledge... he shall surely live* — the prophet''s portrait of repentance unto life.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-zacchaeus-fourfold-restitution-the-son-of-abraham-restored-exodus-22-leviticus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Galatians 3:7 — *they which are of faith, the same are the children of Abraham* — the son of Abraham named in faith.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-zacchaeus-fourfold-restitution-the-son-of-abraham-restored-exodus-22-leviticus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 3:25 — *Ye are the children... of the covenant which Elohim made with our fathers* — the covenant child restored, Israel not cast off.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-zacchaeus-fourfold-restitution-the-son-of-abraham-restored-exodus-22-leviticus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *one like the Son of Adam came with the clouds... brought him near before* the Ancient of days — the kaph comparative kept.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-pounds-the-nobleman-receives-a-kingdom-and-returns-daniel-7-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom* — the kingdom GIVEN to the Son by the Father.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-pounds-the-nobleman-receives-a-kingdom-and-returns-daniel-7-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:10 — *I will require my flock at their hand* — the Shepherd''s reckoning with his stewards when he returns.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-pounds-the-nobleman-receives-a-kingdom-and-returns-daniel-7-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 13:11 — *he that gathereth by labour shall increase* — the wisdom of faithful, diligent stewardship.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-pounds-the-nobleman-receives-a-kingdom-and-returns-daniel-7-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 25:21 — *Well done, thou good and faithful servant... I will make thee ruler over many things* — the gospels'' twin parable.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-pounds-the-nobleman-receives-a-kingdom-and-returns-daniel-7-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Revelation 11:15 — *The kingdoms of this world are become the kingdoms of our Lord... and he shall reign for ever* — the everlasting dominion consummated.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-pounds-the-nobleman-receives-a-kingdom-and-returns-daniel-7-ezekiel-34'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 9:9 — *thy King cometh... lowly, and riding upon an ass, and upon a colt the foal of an ass* — the foretold entry of the King of Zion.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-king-comes-lowly-on-the-colt-blessed-is-he-the-stones-would-cry-out-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 118:26 — *Blessed be he that cometh in the name of Yahuah* — the pilgrim cry sung over the head of the corner.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-king-comes-lowly-on-the-colt-blessed-is-he-the-stones-would-cry-out-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 2:11 — *the stone shall cry out of the wall* — creation testifies the King when men fall silent.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-king-comes-lowly-on-the-colt-blessed-is-he-the-stones-would-cry-out-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 49:10-11 — *The sceptre shall not depart from Yahudah... binding his foal unto the vine* — the colt bound to the coming Shiloh.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-king-comes-lowly-on-the-colt-blessed-is-he-the-stones-would-cry-out-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 21:9 — *Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah* — the gospels'' one song at the gate.'
  FROM cross_reference_threads t, cross_references x, _lk19_lookup sv, _lk19_lookup tv
 WHERE t.slug='luke-19-the-king-comes-lowly-on-the-colt-blessed-is-he-the-stones-would-cry-out-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=19 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_20.sql -----
-- ============================================================================
-- Luke 20 — full-library cross-reference threads (NT DEPTH pass, THIN-ADD)
-- 3 NEW threads. DEDUP: do NOT re-anchor 20:9-18 (vineyard/one-vine) or
-- 20:34-38 (resurrection/equal-unto-angels) — those already exist.
--   T1 = 20:1-8   by what authority / John's baptism from heaven or of men
--   T2 = 20:17-18 the stone the builders rejected (anchored on 20:17, NOT 20:9)
--   T3 = 20:41-44 David's son AND David's Lord (Ps 110:1)
-- band base = 14000 + (20-1)*30 = 14570, step 3
-- ============================================================================

-- 3a. Temp view ---------------------------------------------------------------
CREATE TEMP VIEW _lk20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ---------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- ---- T1: 20:1-8 by what authority / the baptism of John ----
  ('canon','luke',20,2,'canon','exodus',2,14, 'free', E'*And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian?* (Exodus 2:14). The very challenge thrown at the deliverer Yahuah had raised up — *who made thee a prince?* — is the chief priests'' question to the Son in the temple: *by what authority doest thou these things?* The sent one is always met by those who refuse the One who sent him.'),
  ('canon','luke',20,2,'canon','numbers',16,3, 'free', E'*And they gathered themselves together against Moses and against Aaron... Ye take too much upon you, seeing all the congregation are holy... wherefore then lift ye up yourselves above the congregation of Yahuah (LORD)?* (Numbers 16:3). Korah''s rebellion is the pattern: ordained, heaven-given authority challenged by men who will not bow. The rulers who demand the Son''s credentials stand in Korah''s place, not Moses''.'),
  ('canon','luke',20,4,'canon','jeremiah',1,7, 'free', E'*But Yahuah (LORD) said unto me, Say not, I am a child: for thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (Jeremiah 1:7). The prophet''s authority is never his own — it is the Sender''s word in his mouth. John was a prophet *sent*; to ask whether his baptism was *from heaven, or of men* is to ask whether the rulers will receive heaven''s envoy at all.'),
  ('canon','luke',20,4,'canon','jeremiah',1,9, 'free', E'*Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth* (Jeremiah 1:9). The same hand that filled Jeremiah''s mouth filled John''s and now the Son''s. Their refusal to judge John — *they could not tell whence it was* (Luke 20:7) — exposes hearts that will not own the word of the One who sends.'),

  -- ---- T2: 20:17-18 the stone the builders rejected ----
  ('canon','luke',20,17,'canon','psalms',118,22, 'free', E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). Yahusha quotes it straight: *What is this then that is written, The stone which the builders rejected, the same is become the head of the corner?* (Luke 20:17). The builders are the very rulers standing before him — the rejected Stone is the Son they are about to cast out and kill, whom the Father will set as the head of the corner.'),
  ('canon','luke',20,18,'canon','isaiah',8,14, 'free', E'*And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel), for a gin and for a snare to the inhabitants of Jerusalem* (Isaiah 8:14). The Stone stumbles BOTH houses — Judah and Ephraim alike — not one cast off and the other kept. He is sanctuary to those who trust him and a rock of offence to those who refuse; the offence is unbelief, not the casting-away of the people (Romans 11:1-2).'),
  ('canon','luke',20,18,'canon','isaiah',8,15, 'free', E'*And many among them shall stumble, and fall, and be broken, and be snared, and be taken* (Isaiah 8:15). Yahusha''s *whosoever shall fall upon that stone shall be broken* (Luke 20:18) is Isaiah''s word made plain: the Stone laid for a sanctuary becomes a breaking to all who stumble at him in unbelief.'),
  ('canon','luke',20,17,'canon','isaiah',28,16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The Father himself lays the corner stone. The builders'' rejection cannot overturn the foundation Yahuah set in Zion; *he that believeth shall not make haste*.'),
  ('canon','luke',20,18,'canon','daniel',2,34, 'free', E'*Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces* (Daniel 2:34). The Stone that grinds to powder is the kingdom-stone of Nebuchadnezzar''s dream — cut without hands, not raised by men, smiting the kingdoms of the earth. *On whomsoever it shall fall, it will grind him to powder* (Luke 20:18).'),
  ('canon','luke',20,18,'canon','daniel',2,44, 'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). The rejected Stone is the everlasting kingdom set up by the Elohim of heaven — the Father — that breaks every rival dominion and stands for ever.'),
  ('canon','luke',20,17,'canon','1-peter',2,7, 'free', E'*Unto you therefore which believe he is precious: but unto them which be disobedient, the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7). Kepha gathers Psalm 118 and Isaiah 8 onto the Son just as Yahusha does here — precious to the believing, a head of the corner the builders disallowed.'),
  ('canon','luke',20,18,'canon','1-peter',2,8, 'free', E'*And a stone of stumbling, and a rock of offence, even to them which stumble at the word, being disobedient* (1 Peter 2:8). Isaiah 8:14 carried into the apostolic witness: the same Stone that is sanctuary to faith is a stone of stumbling to disobedience — the breaking of Luke 20:18.'),

  -- ---- T3: 20:41-44 David's son AND David's Lord ----
  ('canon','luke',20,42,'canon','psalms',110,1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). The verse Yahusha lays before them: *David himself saith in the book of Psalms, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Luke 20:42). Yahuah the Father speaks to David''s Lord — the Formed Son — and seats him at the right hand. David by the Ruach calls his own descendant *my Lord*; the Messiah is David''s son in the flesh AND David''s Lord, enthroned BY the Father.'),
  ('canon','luke',20,41,'canon','2-samuel',7,12, 'free', E'*And when thy days be fulfilled... I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). The Messiah is David''s son by this very promise — the seed from David''s own body whose kingdom is established. *How say they that Messiah (Christ) is David''s son?* (Luke 20:41) — he IS, and more.'),
  ('canon','luke',20,44,'canon','2-samuel',7,14, 'free', E'*I will be his father, and he shall be my son* (2 Samuel 7:14). The royal seed is owned as son BY the Father — the relationship that makes him more than David''s descendant. *David therefore calleth him Yahuah (Lord), how is he then his son?* (Luke 20:44): son of David in the flesh, Son of Elohim begotten, and so David''s Lord.'),
  ('canon','luke',20,44,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The begetting decree of the Father — the Son who HAS a Father, begotten and exalted by him, not co-equal-by-nature nor a mere creature. This is the answer to *how is he then his son?*: the Formed Son the Father has set above David.'),
  ('canon','luke',20,42,'canon','acts',2,34, 'free', E'*For David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34). At Shavuot Kepha presses the same Psalm 110 Yahusha pressed: David did not ascend — the One seated at the right hand is the risen Son. *Elohim (God) hath made that same Yahusha (Jesus)... both Lord and Messiah* (Acts 2:36): enthroned BY the Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _lk20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _lk20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads -----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-20-by-what-authority-and-the-baptism-of-john-from-heaven-or-of-men',
       E'By what authority? — and was John''s baptism from heaven, or of men? (Exodus 2; Numbers 16; Jeremiah 1)',
       E'The chief priests and scribes come upon the Son in the temple: *Tell us, by what authority doest thou these things? or who is he that gave thee this authority?* (Luke 20:2). It is the oldest challenge in the book — *Who made thee a prince and a judge over us?* (Exodus 2:14), the word flung at the deliverer Yahuah had raised; *Ye take too much upon you... wherefore then lift ye up yourselves above the congregation of Yahuah (LORD)?* (Numbers 16:3), Korah''s rebellion against heaven-given authority. The rulers stand with the rebels, not with Moses. So the Son turns the question on its hinge: *The baptism of John, was it from heaven, or of men?* (Luke 20:4). A true prophet''s authority is never his own — *Say not, I am a child: for thou shalt go to all that I shall send thee* (Jeremiah 1:7); *Behold, I have put my words in thy mouth* (Jeremiah 1:9). John was sent; to refuse to judge whence his baptism came — *they answered, that they could not tell whence it was* (Luke 20:7) — is to refuse heaven''s envoy and, behind him, the One who sends. Their evasion answers their own question: men who will not own the word of the Sender cannot be told by what authority the Sent One stands. The Torah and the Prophets are not abolished here; they are the very ground on which the Son exposes hearts that will not bow.',
       sv.verse_id, ev.verse_id, 'free', 14570
  FROM _lk20_lookup sv, _lk20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=20 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2',
       E'The stone the builders rejected — head of the corner, stumbling-stone to both houses, kingdom-stone (Psalm 118; Isaiah 8; Isaiah 28; Daniel 2)',
       E'When the rulers cry *Elohim (God) forbid* at the vineyard''s end, the Son fixes his eyes on them: *What is this then that is written, The stone which the builders rejected, the same is become the head of the corner?* (Luke 20:17). He quotes Psalm 118 word for word — *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). The builders are these very men; the rejected Stone is the Son they are plotting to cast out and kill, whom the Father will set as the corner. And the Stone has two faces. To the trusting he is sanctuary; to the unbelieving he is *a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* (Isaiah 8:14) — Judah AND Ephraim, both houses, not one kept and the other cast off. *And many among them shall stumble, and fall, and be broken* (Isaiah 8:15) — exactly Yahusha''s *Whosoever shall fall upon that stone shall be broken* (Luke 20:18). The offence is unbelief, never the casting-away of the people (Romans 11:1-2). The Father himself laid it: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16) — the builders'' rejection cannot overturn what Yahuah set. And the same Stone is the kingdom-stone of Daniel''s dream: *a stone was cut out without hands, which smote the image... and brake them to pieces* (Daniel 2:34), the kingdom the *Elohim (God) of heaven* sets up *which shall never be destroyed... and it shall stand for ever* (Daniel 2:44) — *on whomsoever it shall fall, it will grind him to powder* (Luke 20:18). The apostles carried the whole figure forward: *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7), *a stone of stumbling, and a rock of offence, even to them which stumble at the word* (1 Peter 2:8). One Stone, one library, one rejected-then-exalted Son.',
       sv.verse_id, ev.verse_id, 'free', 14573
  FROM _lk20_lookup sv, _lk20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=20 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-20-how-is-messiah-davids-son-and-davids-lord-psalm-110-2-samuel-7-psalm-2',
       E'David''s son AND David''s Lord — sit thou on my right hand (Psalm 110; 2 Samuel 7; Psalm 2)',
       E'The Son puts the riddle the scribes cannot untie: *How say they that Messiah (Christ) is David''s son?* (Luke 20:41). He IS David''s son — *I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12), the promised seed from David''s own body. But hear David himself: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1; Luke 20:42). Yahuah the Father speaks TO David''s Lord and seats him at the right hand. So David, by the Ruach, calls his own descendant *my Lord* — *David therefore calleth him Yahuah (Lord), how is he then his son?* (Luke 20:44). The answer is the whole gospel in one breath: he is son of David in the flesh and the Son the Father owns — *I will be his father, and he shall be my son* (2 Samuel 7:14) — begotten by the Father''s decree: *Thou art my Son; this day have I begotten thee* (Psalm 2:7). This is the Formed Son who HAS a Father: begotten, sent, and exalted BY the Father to his right hand — not a co-equal second person, not a created angel, but the One the Father seats in glory. Kepha pressed the same Psalm at Shavuot — *David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34) — and concluded that *Elohim (God) hath made that same Yahusha (Jesus)... both Lord and Messiah* (Acts 2:36). David''s son in the flesh; David''s Lord enthroned by the Father.',
       sv.verse_id, ev.verse_id, 'free', 14576
  FROM _lk20_lookup sv, _lk20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=41
   AND ev.edition_slug='canon' AND ev.book_slug='luke' AND ev.chapter_number=20 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members ----------------------------------------------------------
-- T1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:14 — *Who made thee a prince and a judge over us?* The old challenge to heaven''s deliverer, now flung at the Son in the temple.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-by-what-authority-and-the-baptism-of-john-from-heaven-or-of-men'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:3 — Korah''s rebellion: ordained authority defied. The rulers stand with the rebels, not with Moses.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-by-what-authority-and-the-baptism-of-john-from-heaven-or-of-men'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 1:7 — *thou shalt go to all that I shall send thee.* A prophet''s authority is the Sender''s word in his mouth; John was sent.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-by-what-authority-and-the-baptism-of-john-from-heaven-or-of-men'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 1:9 — *I have put my words in thy mouth.* The hand that filled the prophet filled John; refusing to judge his baptism exposes hearts that will not own the Sender.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-by-what-authority-and-the-baptism-of-john-from-heaven-or-of-men'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 118:22 — *The stone which the builders refused is become the head stone of the corner.* Quoted straight by Yahusha; the builders are the rulers before him.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 8:14 — *a stone of stumbling... to both the houses of Yashar''el (Israel).* Sanctuary to faith, offence to unbelief — both houses, not one cast off (Romans 11:1-2).'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 8:15 — *many among them shall stumble, and fall, and be broken.* Exactly Luke 20:18: *whosoever shall fall upon that stone shall be broken.*'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 28:16 — *Behold, I lay in Zion... a sure foundation.* The Father himself lays the corner stone; the builders cannot overturn it.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 2:34 — *a stone was cut out without hands... and brake them to pieces.* The kingdom-stone, not raised by men, smiting the kingdoms — the grinding to powder of Luke 20:18.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 2:44 — the everlasting kingdom the *Elohim (God) of heaven* sets up, which breaks all others and *shall stand for ever.* The rejected Stone is the kingdom that endures.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Peter 2:7 — *the stone which the builders disallowed, the same is made the head of the corner.* Kepha gathers Psalm 118 onto the Son.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Peter 2:8 — *a stone of stumbling, and a rock of offence... to them which stumble at the word.* Isaiah 8:14 carried into the apostolic witness — the breaking of Luke 20:18.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-the-stone-the-builders-rejected-the-head-of-the-corner-psalm-118-isaiah-8-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand.* Quoted by Yahusha; the Father seats David''s Lord — the Formed Son — at his right hand.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-how-is-messiah-davids-son-and-davids-lord-psalm-110-2-samuel-7-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 7:12 — *I will set up thy seed after thee... and I will establish his kingdom.* The Messiah IS David''s son by this promise.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-how-is-messiah-davids-son-and-davids-lord-psalm-110-2-samuel-7-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 7:14 — *I will be his father, and he shall be my son.* Owned as son BY the Father — the relationship that makes him more than David''s descendant.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-how-is-messiah-davids-son-and-davids-lord-psalm-110-2-samuel-7-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee.* The Father''s begetting decree — the Son who HAS a Father, exalted BY him, not co-equal-by-nature.'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-how-is-messiah-davids-son-and-davids-lord-psalm-110-2-samuel-7-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 2:34 — *David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord.* Kepha presses the same Psalm 110; the risen Son is enthroned BY the Father (Acts 2:36).'
  FROM cross_reference_threads t, cross_references x, _lk20_lookup sv, _lk20_lookup tv
 WHERE t.slug='luke-20-how-is-messiah-davids-son-and-davids-lord-psalm-110-2-samuel-7-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='luke' AND sv.chapter_number=20 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Luke (depth) cross-references complete.'
