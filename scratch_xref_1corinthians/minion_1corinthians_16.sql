-- ----- fragment: minion_1corinthians_16.sql (S228 1 Corinthians 16) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 16 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 16 (24 verses) — THE CLOSING CHAPTER.
-- Tag: co16 (temp view _s228_co16_lookup).
-- Sort band: floor 6975, step 3 (6975, 6978, 6981 used; under 7000 — 2 Corinthians starts at 7000).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. The letter closes on practical matters: the collection for the saints, Paul''s
-- travel plans, the charge to stand fast, greetings, and the Maranatha. Three blocks are load-bearing
-- and warrant threads; the rest is personal commendation and greeting that warrants no parallel.
--   (1) THE COLLECTION FOR THE SAINTS (16:1-4) is the Jerusalem relief — the nations ministering
--       material things to Israel. Paul orders a weekly setting-aside *upon the first day of the week*
--       (16:2). **This is a collection day, NOT a sabbath-change.** The phrase names the day on which
--       each one lays by in store for the relief fund — a regular gathering-up so there be no
--       last-minute collecting when Paul comes. It says NOTHING about transferring the seventh-day
--       Sabbath; it is a fund-administration instruction, and to read a sabbath-change into it is to
--       read into the text what is not there. The frame is the debt of the nations to Israel (Romans
--       15:27, *their debtors they are*) and the relief sent to Judaea (Acts 11:29-30, 24:17).
--   (2) THE BE-STRONG CHARGE (16:13) *Watch ye, stand fast in the faith, quit you like men, be strong*
--       re-speaks the Torah charge to Joshua and the people on the edge of the inheritance: *Be strong
--       and of a good courage... he will not fail thee, nor forsake thee* (Deuteronomy 31:6), *be
--       strong and very courageous, that thou mayest observe to do according to all the law* (Joshua
--       1:7), *be of good courage, and he shall strengthen your heart* (Psalm 31:24).
--   (3) THE MARANATHA (16:22) *let him be Anathema Maranatha* — Maranatha, the Lord cometh. The coming
--       One who judges is the hope of the Tanakh, *he cometh to judge the earth* (Psalm 96:13, 98:9),
--       and the closing cry of the Revelation, *Surely I come quickly... Even so, come, Lord Yahusha*
--       (Revelation 22:20). Note the NT-Lord rule: 16:22''s *the Lord Yahusha HaMashiach* is Yahusha
--       titular and stays *Lord*; the Tanakh judge-texts render *Yahuah (LORD)* as the pull gives them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   the collection for the saints, first day of the week lay by in store, liberality to Jerusalem
--           Tanakh: none warranted (the relief frame is an apostolic-era act; the debt-of-nations root
--                   is carried by Romans 15, an NT witness; no clean Tanakh quotation underlies it)
--           Extras: none warranted   NT: Acts 11:29-30 (relief sent to Judaea by Barnabas and Saul),
--                   Acts 24:17 (I came to bring alms to my nation, and offerings), Romans 15:25-27
--                   (to minister unto the saints... their debtors they are, the nations'' carnal duty)
--   v.5-12  Paul''s travel plans (Macedonia, Ephesus, Pentecost), Timotheus and Apollos
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (personal itinerary;
--                   no load-bearing parallel — *a great door and effectual is opened* 16:9 is a passing
--                   metaphor, not a thread-bearing citation)
--   v.13-14 Watch ye, stand fast in the faith, quit you like men, be strong; all done with charity
--           Tanakh: Deuteronomy 31:6 (be strong and of a good courage... he will not fail thee),
--                   Joshua 1:6-7,9 (be strong and very courageous... observe to do according to all
--                   the law), Psalm 31:24 (be of good courage, and he shall strengthen your heart)
--           Extras: none warranted   NT: none warranted (the charge is the Tanakh courage-formula)
--   v.15-21 the house of Stephanas, the firstfruits of Achaia; greetings, the holy kiss, Paul''s hand
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (commendations and
--                   salutations; *firstfruits of Achaia* 16:15 is local idiom, not the Leviticus-23
--                   firstfruits offering — no add)
--   v.22    if any man love not the Lord Yahusha HaMashiach, let him be Anathema Maranatha
--           Tanakh: Psalm 96:13 (he cometh, for he cometh to judge the earth), Psalm 98:9 (he cometh
--                   to judge the earth, with righteousness shall he judge the world)
--           Extras: none warranted   NT: Revelation 22:20 (Surely I come quickly... come, Lord Yahusha)
--   v.23-24 the grace of our Lord Yahusha HaMashiach; my love be with you all; the subscription
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (closing benediction)
--
-- THREADS (slug -> target libraries):
--   6975 1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15  (NT)
--   6978 1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1  (Tanakh)
--   6981 1-corinthians-16-anathema-maranatha-the-lord-cometh-psalm-96-revelation-22  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15
  ('canon', '1-corinthians', 16, 1, 'canon', 'acts', 11, 29, 'free', E'*Then the disciples, every man according to his ability, determined to send relief unto the brethren which dwelt in Judæa: Which also they did, and sent it to the elders by the hands of Barnabas and Saul.* (Acts 11:29-30). This is the same relief Paul now organizes among the assemblies: *Now concerning the collection for the saints, as I have given order to the churches of Galatia, even so do ye* (1 Corinthians 16:1). When dearth was foretold, the disciples sent help to the brethren in Judaea by the hands of Barnabas and Saul — and Saul, now Paul, gathers the same kind of relief from Corinth and Galatia for the saints at Jerusalem. The ministry of material things to the mother-assembly in the land is the one continuous act: the gathered seed of the nations succoring Yashar''el (Israel).'),
  ('canon', '1-corinthians', 16, 3, 'canon', 'acts', 24, 17, 'free', E'*Now after many years I came to bring alms to my nation, and offerings.* (Acts 24:17). Paul tells Felix the reason he came up to Jerusalem: *to bring alms to my nation, and offerings.* That is the very collection of which he writes, *whomsoever ye shall approve by your letters, them will I send to bring your liberality unto Jerusalem* (1 Corinthians 16:3). The *liberality* carried to Jerusalem is the *alms to my nation* — the gift of the nations brought up to Yashar''el (Israel), alongside offerings, the material ministry of the scattered-and-gathered to the saints in the land.'),
  ('canon', '1-corinthians', 16, 1, 'canon', 'romans', 15, 26, 'free', E'*For it hath pleased them of Macedonia and Achaia to make a certain contribution for the poor saints which are at Jerusalem. It hath pleased them verily; and their debtors they are. For if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things.* (Romans 15:26-27). Paul names the principle beneath *the collection for the saints* (1 Corinthians 16:1): the nations are *debtors* to Yashar''el (Israel). Having been *made partakers of their spiritual things* — grafted into the commonwealth, the covenants, the oracles — *their duty is also to minister unto them in carnal things.* The collection is not charity from outsiders but the paying of a debt of love from the grafted-in branches to the root, the same contribution from Macedonia and Achaia that Romans records.'),
  ('canon', '1-corinthians', 16, 2, 'canon', 'romans', 15, 25, 'free', E'*But now I go unto Jerusalem to minister unto the saints.* (Romans 15:25). The weekly setting-aside Paul commands — *Upon the first day of the week let every one of you lay by him in store, as Elohim (God) hath prospered him, that there be no gatherings when I come* (1 Corinthians 16:2) — is for this errand: to *minister unto the saints* at Jerusalem. The first-day collection is a fund-day, a regular laying-by so the gift is ready and no scrambling is needed when Paul arrives; it is the orderly administration of the relief, not a re-ordering of the Sabbath. What is gathered each week is carried up to minister to the saints in the land.')
  ,
  -- thread: 1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1
  ('canon', '1-corinthians', 16, 13, 'canon', 'deuteronomy', 31, 6, 'free', E'*Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* (Deuteronomy 31:6). Moses charged Yashar''el (Israel) on the edge of the inheritance with the courage-word, grounded not in their own strength but in the Presence that goes with them. Paul gives the assembly the same charge: *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13). To *be strong* and *stand fast* is the very command Moses spoke — fear not, be of a good courage, for the One who *will not fail thee, nor forsake thee* goes with his people still.'),
  ('canon', '1-corinthians', 16, 13, 'canon', 'joshua', 1, 7, 'free', E'*Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest.* (Joshua 1:7). Yahuah (LORD) charged Joshua to *be thou strong and very courageous,* and bound that courage to keeping the Torah — *observe to do according to all the law.* Paul''s charge *quit you like men, be strong* (1 Corinthians 16:13) is the same summons to courageous faithfulness; to *stand fast in the faith* is to stand where Joshua stood, strong and unswerving, turning neither to the right hand nor to the left from the way commanded.'),
  ('canon', '1-corinthians', 16, 13, 'canon', 'joshua', 1, 9, 'free', E'*Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* (Joshua 1:9). The threefold charge to Joshua — *be strong and of a good courage; be not afraid, neither be thou dismayed* — is the Tanakh shape of Paul''s closing exhortation, *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13). The ground of the courage is the same: not the strength of the people but the abiding Presence, *Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.*'),
  ('canon', '1-corinthians', 16, 13, 'canon', 'psalms', 31, 24, 'free', E'*Be of good courage, and he shall strengthen your heart, all ye that hope in Yahuah (LORD).* (Psalm 31:24). David ends his psalm of trust with the courage-word addressed to all the faithful: *be of good courage, and he shall strengthen your heart, all ye that hope in Yahuah (LORD).* Paul ends his letter the same way — *quit you like men, be strong* (1 Corinthians 16:13) — and the strengthening is the LORD''s own work in the heart of those who hope in him. The strength commanded is the strength supplied; to *be strong* is to lean on the One who *shall strengthen your heart.*')
  ,
  -- thread: 1-corinthians-16-anathema-maranatha-the-lord-cometh-psalm-96-revelation-22
  ('canon', '1-corinthians', 16, 22, 'canon', 'psalms', 96, 13, 'free', E'*Before Yahuah (LORD): for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth.* (Psalm 96:13). The Maranatha that seals the letter — *let him be Anathema Maranatha* (1 Corinthians 16:22), the Lord cometh — is the hope the psalm sings twice over: *he cometh, for he cometh to judge the earth.* The coming of the Lord is no new dread but the long-sung joy and reckoning of the Tanakh; the one who *love not the Lord Yahusha HaMashiach (Lord Jesus Christ)* is left under the judgment of the One who comes to judge the world *with righteousness.*'),
  ('canon', '1-corinthians', 16, 22, 'canon', 'psalms', 98, 9, 'free', E'*Before Yahuah (LORD); for he cometh to judge the earth: with righteousness shall he judge the world, and the people with equity.* (Psalm 98:9). The psalm announces with trumpet and cornet that *he cometh to judge the earth.* That coming is the Maranatha Paul cries at the close: *Anathema Maranatha* (1 Corinthians 16:22) — the Lord cometh. The one who does not love the Lord faces the righteous and equitable judgment of the One whose coming the whole earth is summoned to greet with joy; the curse and the coming are two sides of the same advent.'),
  ('canon', '1-corinthians', 16, 22, 'canon', 'revelation', 22, 20, 'free', E'*He which testifieth these things saith, Surely I come quickly. Amen. Even so, come, Lord Yahusha (Lord Jesus).* (Revelation 22:20). John''s book closes on the same cry Paul''s letter closes on: *Maranatha* — the Lord cometh — answered by *Even so, come, Lord Yahusha (Lord Jesus).* Paul writes *If any man love not the Lord Yahusha HaMashiach (Lord Jesus Christ), let him be Anathema Maranatha* (1 Corinthians 16:22): the same longing for the Master''s return that the Spirit and the bride breathe at the end of the Revelation. To those who love him it is the bridal *come;* to those who love him not it is the *Anathema* — but the Lord cometh, quickly, either way.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15',
       E'The collection for the saints — the nations ministering to Jerusalem (Acts 11, Romans 15)',
       E'Paul opens the closing chapter with the relief fund: *Now concerning the collection for the saints, as I have given order to the churches of Galatia, even so do ye. Upon the first day of the week let every one of you lay by him in store, as Elohim (God) hath prospered him, that there be no gatherings when I come* (1 Corinthians 16:1-2). This is the Jerusalem relief — material help carried up to the saints in the land — and the first-day collection is its administration, a weekly laying-by so the gift is ready and no scramble is needed when Paul arrives. Mark it well: this names a collection day, not a sabbath-change; it says nothing of transferring the seventh-day Sabbath, and to read that into it is to read in what is not there. The act is the same relief sent earlier from Antioch when dearth was foretold: *the disciples, every man according to his ability, determined to send relief unto the brethren which dwelt in Judæa... by the hands of Barnabas and Saul* (Acts 11:29-30). It is the errand Paul names before Felix: *Now after many years I came to bring alms to my nation, and offerings* (Acts 24:17) — the *liberality* of 16:3 carried up to Jerusalem is the *alms to my nation.* And it rests on the debt of the nations to Yashar''el (Israel): *it hath pleased them of Macedonia and Achaia to make a certain contribution for the poor saints which are at Jerusalem... and their debtors they are. For if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things* (Romans 15:26-27). The grafted-in branches owe the root; having received the spiritual riches of the covenant, they minister back the carnal — *I go unto Jerusalem to minister unto the saints* (Romans 15:25). The collection is no outsiders'' charity but the paying of a debt of love, the gathered seed of the nations succoring Israel in the land.',
       sv.verse_id, ev.verse_id, 'free', 6975
  FROM _s228_co16_lookup sv, _s228_co16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1',
       E'Watch ye, stand fast, quit you like men, be strong (Deuteronomy 31, Joshua 1, Psalm 31)',
       E'Paul''s closing charge is the Tanakh courage-formula re-spoken to the assembly: *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13). It is the very word Moses laid on Yashar''el (Israel) at the edge of the inheritance: *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). It is the charge Yahuah (LORD) gave Joshua, bound to faithfulness to the Torah: *Only be thou strong and very courageous, that thou mayest observe to do according to all the law... turn not from it to the right hand or to the left* (Joshua 1:7), and again *Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). To *stand fast in the faith* is to stand where Joshua stood, unswerving, neither to the right hand nor to the left. And it is the word David sang to all the faithful: *Be of good courage, and he shall strengthen your heart, all ye that hope in Yahuah (LORD)* (Psalm 31:24). The ground of the courage is never the strength of the people but the abiding Presence and the LORD''s own strengthening of the heart; the strength commanded is the strength supplied. Paul ends his letter as Moses, Joshua, and David spoke — be strong, for he goes with you and will not forsake you.',
       sv.verse_id, ev.verse_id, 'free', 6978
  FROM _s228_co16_lookup sv, _s228_co16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-16-anathema-maranatha-the-lord-cometh-psalm-96-revelation-22',
       E'Anathema Maranatha — the Lord cometh (Psalm 96, Psalm 98, Revelation 22)',
       E'Paul seals the letter with a curse and a longing in one breath: *If any man love not the Lord Yahusha HaMashiach (Lord Jesus Christ), let him be Anathema Maranatha* (1 Corinthians 16:22). Maranatha — the Lord cometh. The coming One who judges is the hope the Tanakh sings: *he cometh, for he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth* (Psalm 96:13), and again, with trumpet and cornet, *he cometh to judge the earth: with righteousness shall he judge the world, and the people with equity* (Psalm 98:9). The advent is no new dread but the long-sung joy and reckoning of Yahuah (LORD)''s own coming. And it is the cry that closes the whole canon: *He which testifieth these things saith, Surely I come quickly. Amen. Even so, come, Lord Yahusha (Lord Jesus)* (Revelation 22:20). The Maranatha of Paul and the *come, Lord Yahusha* of John are one longing — the Spirit and the bride breathing the same word. To those who love him the coming is the bridal *come;* to those who love him not it is the *Anathema,* the curse of being found outside on the day the Lord comes to judge the earth. But the Lord cometh, quickly, either way.',
       sv.verse_id, ev.verse_id, 'free', 6981
  FROM _s228_co16_lookup sv, _s228_co16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=16 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 11:29-30 — *the disciples... determined to send relief unto the brethren which dwelt in Judæa... by the hands of Barnabas and Saul* the same Jerusalem relief Paul now organizes; *the collection for the saints* (1 Corinthians 16:1).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 15:26-27 — *their debtors they are... if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things* the debt of the nations to Yashar''el (Israel) beneath *the collection for the saints* (1 Corinthians 16:1).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 15:25 — *now I go unto Jerusalem to minister unto the saints* the errand the first-day fund serves; *lay by him in store... that there be no gatherings when I come* (1 Corinthians 16:2) is collection-day administration, not a sabbath-change.'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 24:17 — *I came to bring alms to my nation, and offerings* the liberality carried up to Jerusalem; *them will I send to bring your liberality unto Jerusalem* (1 Corinthians 16:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-the-collection-for-the-saints-the-nations-ministering-to-jerusalem-acts-11-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not... he will not fail thee, nor forsake thee* Moses'' charge to Yashar''el (Israel); *quit you like men, be strong* (1 Corinthians 16:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:7 — *be thou strong and very courageous, that thou mayest observe to do according to all the law* courage bound to Torah-keeping; *stand fast in the faith... be strong* (1 Corinthians 16:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 1:9 — *Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee* the threefold charge; *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 31:24 — *Be of good courage, and he shall strengthen your heart, all ye that hope in Yahuah (LORD)* the strength commanded is the strength supplied; *be strong* (1 Corinthians 16:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-watch-ye-stand-fast-quit-you-like-men-be-strong-deuteronomy-31-joshua-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-16-anathema-maranatha-the-lord-cometh-psalm-96-revelation-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 96:13 — *he cometh, for he cometh to judge the earth: he shall judge the world with righteousness* the Tanakh hope of the coming One; Maranatha, *let him be Anathema Maranatha* (1 Corinthians 16:22).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-anathema-maranatha-the-lord-cometh-psalm-96-revelation-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 98:9 — *he cometh to judge the earth: with righteousness shall he judge the world, and the people with equity* the coming announced with trumpet; the Maranatha curse-and-coming (1 Corinthians 16:22).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-anathema-maranatha-the-lord-cometh-psalm-96-revelation-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=98 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:20 — *Surely I come quickly. Amen. Even so, come, Lord Yahusha (Lord Jesus)* the canon''s closing cry, the same longing as Paul''s *Maranatha* (1 Corinthians 16:22).'
  FROM cross_reference_threads t, cross_references x, _s228_co16_lookup sv, _s228_co16_lookup tv
 WHERE t.slug='1-corinthians-16-anathema-maranatha-the-lord-cometh-psalm-96-revelation-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=16 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
