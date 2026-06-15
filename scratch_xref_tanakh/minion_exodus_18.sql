-- ----- fragment: minion_exodus_18.sql (Exodus 18) -----
-- Chapter: Exodus 18 — Jethro the priest of Midian comes, rejoices, blesses Yahuah, confesses
--          Yahuah greater than all gods, offers sacrifice; counsels Moses to appoint able men
--          (rulers of thousands/hundreds/fifties/tens) as judges over the people.
-- Tag: ex18   Session: s305   Sort band base: 29425 (step 3)
--
-- Exodus 18 coverage:
--   v.1     NT: none warranted  Extras: none warranted  Tanakh: covered by thread 4 frame (report of redemption reaches Midian)
--   v.2-5   NT: none warranted  Extras: Jasher 79:17-18 (Zipporah sent to Reuel's house, remains till Exodus), Jubilees 48:1 (Midian sojourn)  Tanakh: none warranted  -> THREAD 4
--   v.6-7   NT: none warranted  Extras: none warranted  Tanakh: none warranted (narrative reunion)
--   v.8-12  NT: none warranted (forward note in summary)  Extras: none warranted  Tanakh: Joshua 2:9-11 (Rahab confesses), 1 Kings 8:41-43 (the stranger for thy name's sake), Psalm 86:8-10 (all nations come)  -> THREAD 1
--   v.11    NT: none warranted  Extras: none warranted  Tanakh: Exodus 5:2 (Who is Yahuah), Exodus 9:16 (my name declared), Exodus 15:11 (who is like thee among the gods)  -> THREAD 2 (lateral, Pharaoh's pride answered)
--   v.13-26 NT: Acts 6:2-4 (the seven appointed, men of honest report)  Extras: none warranted  Tanakh: Deuteronomy 1:9-18 (Moses recounts the delegation), Numbers 11:16-17 (the seventy elders)  -> THREAD 3
--   v.27    NT: none warranted  Extras: none warranted  Tanakh: none warranted (Jethro departs)
--
-- Threads (4):
--   1. exodus-18-now-i-know-yahuah-is-greater-than-all-gods   [FREE]  targets: canon Tanakh (Joshua, 1 Kings, Psalms)
--        Frame: the report of the redemption draws the stranger to confess the Name; the
--        Exodus testimony reaching outward; foreshadow of the nations gathered to Yashar'el's
--        Elohim — but Yahuah's acts FOR his covenant people are the cause; never replacement.
--   2. exodus-18-greater-than-all-gods-pharaohs-pride-answered  [FREE]  targets: canon Tanakh (Exodus laterals)
--        Frame: 18:11 measure-for-measure — in the thing wherein they dealt proudly he was
--        above them; Pharaoh's "Who is Yahuah" (5:2) answered, the Name declared (9:16), none
--        like Yahuah among the gods (15:11).
--   3. exodus-18-able-men-such-as-fear-elohim-shared-judgeship  [FREE]  targets: canon Tanakh (Deut, Numbers) + NT (Acts)
--        Frame: Jethro's counsel — delegated, qualified, Elohim-fearing leadership; the Torah's
--        pattern of just governance carried forward into the assembly (Acts 6 the seven).
--   4. exodus-18-zipporah-returned-to-the-house-of-reuel  [EXTRAS]  targets: Jasher, Jubilees
--        Frame: the reunion behind 18:2-5 (after he had sent her back) — Jasher/Jubilees retell
--        Moses in Midian and Zipporah remaining at Reuel's house until the Exodus.
--
-- Contested/load-bearing framing:
--   18:8-12 — Jethro's confession is NOT a Gentile-replaces-Israel proof-text. Yahuah's acts
--   are FOR Yashar'el his people (v.1,8); the stranger is drawn IN to the same Name and
--   covenant Elohim, never grafted as a new people. Rahab (Joshua 2:11), the stranger of
--   1 Kings 8:41-43, and Psalm 86:9 are the foreshadow of the nations confessing the ONE
--   Elohim of Yashar'el — the two-house ingathering's outward reach, never its substitution.

CREATE TEMP VIEW _s305_ex18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Now I know Yahuah is greater than all gods (the stranger confesses by the report)
    ('canon','exodus',18,9,'canon','joshua',2,9,'free',
      E'*And she said unto the men, I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you* (Joshua 2:9). What stirs Jethro to *rejoice for all the goodness which Yahuah (LORD) had done to Yashar''el (Israel)* (Exodus 18:9) is the same thing that melts Rahab in Jericho — the report of the redemption travelling outward. The outsider hears what Yahuah did and is drawn to the Name.'),
    ('canon','exodus',18,11,'canon','joshua',2,11,'free',
      E'*And as soon as we had heard these things, our hearts did melt... for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11). Jethro''s confession *Now I know that Yahuah (LORD) is greater than all gods* (Exodus 18:11) and Rahab''s *he is Elohim (God) in heaven above, and in earth beneath* are the same confession — the report of the Exodus draws the stranger to know the one Elohim of Yashar''el (Israel).'),
    ('canon','exodus',18,11,'canon','1-kings',8,41,'free',
      E'*Moreover concerning a stranger, that is not of thy people Yashar''el (Israel), but cometh out of a far country for thy name''s sake* (1 Kings 8:41). Solomon prays at the temple''s dedication for the very figure Jethro is — the stranger drawn from afar by the report of the Name. The confession *Yahuah (LORD) is greater than all gods* (Exodus 18:11) is the firstfruit of that prayer.'),
    ('canon','exodus',18,11,'canon','1-kings',8,43,'free',
      E'*Hear thou in heaven thy dwelling place, and do according to all that the stranger calleth to thee for: that all people of the earth may know thy name, to fear thee, as do thy people Yashar''el (Israel)* (1 Kings 8:43). The stranger is drawn to fear the Name *as do thy people Yashar''el* — IN to the same covenant Elohim, never grafted as a rival people. Jethro''s *Now I know that Yahuah (LORD) is greater than all gods* (Exodus 18:11) is exactly this knowing.'),
    ('canon','exodus',18,11,'canon','psalms',86,8,'free',
      E'*Among the gods there is none like unto thee, O Yahuah (Lord); neither are there any works like unto thy works* (Psalm 86:8). The Psalm sings Jethro''s very confession — *Now I know that Yahuah (LORD) is greater than all gods* (Exodus 18:11) — and turns it to praise; the works of the redemption are the proof there is none like Yahuah.'),
    ('canon','exodus',18,9,'canon','psalms',86,9,'free',
      E'*All nations whom thou hast made shall come and worship before thee, O Yahuah (Lord); and shall glorify thy name* (Psalm 86:9). Jethro''s rejoicing — *Jethro rejoiced for all the goodness which Yahuah (LORD) had done to Yashar''el (Israel)* (Exodus 18:9) — is the first drop of the nations'' worship the Psalm foresees, drawn by the report of what Yahuah did for his covenant people.'),

    -- THREAD 2: greater than all gods — Pharaoh's pride answered (lateral within Exodus)
    ('canon','exodus',18,11,'canon','exodus',5,2,'free',
      E'*And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD)* (Exodus 5:2). Pharaoh''s arrogant *Who is Yahuah* is answered by Jethro''s *Now I know that Yahuah (LORD) is greater than all gods: for in the thing wherein they dealt proudly he was above them* (Exodus 18:11). The proud king did not know him; the priest of Midian now does — measure for measure.'),
    ('canon','exodus',18,11,'canon','exodus',9,16,'free',
      E'*And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth* (Exodus 9:16). The plagues were aimed at exactly the outcome Jethro voices: the Name declared, the gods of Egypt overthrown. *In the thing wherein they dealt proudly he was above them* (Exodus 18:11) names the verdict the whole confrontation rendered.'),
    ('canon','exodus',18,11,'canon','exodus',15,11,'free',
      E'*Who is like unto thee, O Yahuah (LORD), among the gods? who is like thee, glorious in holiness, fearful in praises, doing wonders?* (Exodus 15:11). The Song at the sea asks the question; Jethro at the mount gives the answer — *Yahuah (LORD) is greater than all gods* (Exodus 18:11). Both rise from the same drowning of Egypt''s pride.'),

    -- THREAD 3: able men such as fear Elohim — shared, qualified judgeship
    ('canon','exodus',18,21,'canon','deuteronomy',1,15,'free',
      E'*So I took the chief of your tribes, wise men, and known, and made them heads over you, captains over thousands, and captains over hundreds, and captains over fifties, and captains over tens, and officers among your tribes* (Deuteronomy 1:15). Moses recounts the very pattern Jethro gave — *rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens* (Exodus 18:21) — as the abiding order of just governance in Yashar''el (Israel).'),
    ('canon','exodus',18,21,'canon','deuteronomy',1,17,'free',
      E'*Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man; for the judgment is Elohim''s (God''s)* (Deuteronomy 1:17). The charge fills out what *able men, such as fear Elohim (God), men of truth, hating covetousness* (Exodus 18:21) means — judges who fear Elohim and not the face of man, because the judgment belongs to Elohim.'),
    ('canon','exodus',18,18,'canon','numbers',11,16,'free',
      E'*And Yahuah (LORD) said unto Moses, Gather unto me seventy men of the elders of Yashar''el (Israel)... that they may stand there with thee* (Numbers 11:16). Jethro warned *thou wilt surely wear away... thou art not able to perform it thyself alone* (Exodus 18:18); at the seventy elders Yahuah himself enacts the same remedy — burden shared so Moses bears it not alone.'),
    ('canon','exodus',18,22,'canon','numbers',11,17,'free',
      E'*And I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17). Jethro''s counsel — *they shall bear the burden with thee* (Exodus 18:22) — is what Yahuah brings to pass by the spirit at the seventy; the shared burden is sealed by the Ruach.'),
    ('canon','exodus',18,21,'canon','acts',6,3,'free',
      E'*Wherefore, brethren, look ye out among you seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom, whom we may appoint over this business* (Acts 6:3). The apostles carry Jethro''s Torah-pattern into the assembly — *men of honest report* answering *men of truth* (Exodus 18:21) — qualified, Spirit-filled men set over the work so the leaders are not worn away.'),
    ('canon','exodus',18,18,'canon','acts',6,2,'free',
      E'*Then the twelve called the multitude of the disciples unto them, and said, It is not reason that we should leave the word of Elohim (God), and serve tables* (Acts 6:2). The apostles face Jethro''s very danger — *the thing is too heavy for thee; thou art not able to perform it thyself alone* (Exodus 18:18) — and answer it by delegation, freeing themselves *to prayer, and to the ministry of the word* (Acts 6:4).'),

    -- THREAD 4 (EXTRAS): Zipporah returned to the house of Reuel
    ('canon','exodus',18,2,'jasher','jasher',79,17,'extras',
      E'*And Aaron said to Moses, Send away the woman and her children that they may go to her father''s house, and Moses hearkened to the words of Aaron, and did so* (Jasher 79:17). Jasher fills the gap behind *Jethro... took Zipporah, Moses'' wife, after he had sent her back* (Exodus 18:2) — naming why Zipporah was sent home before the Exodus.'),
    ('canon','exodus',18,5,'jasher','jasher',79,18,'extras',
      E'*And Zipporah returned with her children, and they went to the house of Reuel, and remained there until the time arrived when Yahuah (the Lord) had visited his people, and brought them forth from Egypt* (Jasher 79:18). This is the home Jethro now travels from when he *came with his sons and his wife unto Moses into the wilderness* (Exodus 18:5) — Reuel''s house, where the family waited out the deliverance.'),
    ('canon','exodus',18,3,'jubilees','jubilees',48,1,'extras',
      E'*And in the sixth year of the third week of the forty-ninth jubilee you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt* (Jubilees 48:1). Jubilees dates the Midian sojourn behind Gershom''s name — *I have been an alien in a strange land* (Exodus 18:3) — the years Moses dwelt as a stranger before Yahuah sent him back to Egypt.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-18-now-i-know-yahuah-is-greater-than-all-gods',
       E'Now I Know That Yahuah Is Greater Than All Gods — the stranger drawn to confess the Name',
       E'When Jethro the priest of Midian hears *all that Yahuah (LORD) had done unto Pharaoh and to the Egyptians for Yashar''el''s (Israel''s) sake* (Exodus 18:8), he rejoices and breaks into confession: *Now I know that Yahuah (LORD) is greater than all gods* (Exodus 18:11), and he *took a burnt offering and sacrifices for Elohim (God)* (Exodus 18:12). The report of the redemption — Yahuah''s acts FOR his covenant people — reaches outward and draws the outsider to the Name.\n\nThis is the same melting that takes Rahab in Jericho: *I know that Yahuah (LORD) hath given you the land... for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:9, 11). It is the figure Solomon prays for at the temple — *concerning a stranger, that is not of thy people Yashar''el (Israel), but cometh out of a far country for thy name''s sake... that all people of the earth may know thy name, to fear thee, as do thy people Yashar''el* (1 Kings 8:41, 43). And it is the song of the Psalm: *Among the gods there is none like unto thee, O Yahuah (Lord)... All nations whom thou hast made shall come and worship before thee* (Psalm 86:8-9).\n\nThe stranger is drawn IN to the one Elohim of Yashar''el — to fear the Name *as do thy people Yashar''el* — never grafted as a rival people. Jethro''s confession is the firstfruit of the nations'' ingathering, and its cause is always Yahuah''s mighty acts for HIS covenant people.',
       sv.verse_id, ev.verse_id, 'free', 29425
  FROM _s305_ex18_lookup sv, _s305_ex18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=18 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-18-greater-than-all-gods-pharaohs-pride-answered',
       E'In the Thing Wherein They Dealt Proudly He Was Above Them — Pharaoh''s pride answered',
       E'Jethro''s confession carries a verdict on Egypt: *Now I know that Yahuah (LORD) is greater than all gods: for in the thing wherein they dealt proudly he was above them* (Exodus 18:11). The redemption was measure for measure — wherever Egypt exalted itself, Yahuah rose above it.\n\nIt answers Pharaoh''s opening arrogance directly: *Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD)* (Exodus 5:2). The proud king said he did not know Yahuah; the priest of Midian now says *Now I know*. The plagues were aimed at exactly this: *for to shew in thee my power; and that my name may be declared throughout all the earth* (Exodus 9:16). And the Song at the sea had already asked the question Jethro answers: *Who is like unto thee, O Yahuah (LORD), among the gods? who is like thee, glorious in holiness, fearful in praises, doing wonders?* (Exodus 15:11). Pharaoh''s pride drowned; the Name was declared; the stranger confessed.',
       sv.verse_id, ev.verse_id, 'free', 29428
  FROM _s305_ex18_lookup sv, _s305_ex18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=18 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-18-able-men-such-as-fear-elohim-shared-judgeship',
       E'Able Men, Such As Fear Elohim — the Torah pattern of shared, qualified judgeship',
       E'Jethro sees Moses judging the people alone *from the morning unto the evening* (Exodus 18:13) and warns him: *Thou wilt surely wear away, both thou, and this people that is with thee: for this thing is too heavy for thee; thou art not able to perform it thyself alone* (Exodus 18:18). His remedy is the Torah''s pattern of just governance: *provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness... rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens* (Exodus 18:21), that *they shall bear the burden with thee* (Exodus 18:22).\n\nMoses recounts this very pattern in Deuteronomy: *I took the chief of your tribes, wise men, and known, and made them heads over you, captains over thousands, and captains over hundreds, and captains over fifties, and captains over tens* (Deuteronomy 1:15), charging them *ye shall not respect persons in judgment... for the judgment is Elohim''s (God''s)* (Deuteronomy 1:17). At the seventy elders, Yahuah himself enacts the burden-sharing: *I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17).\n\nThe apostles carry the same pattern into the assembly — *look ye out among you seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom* (Acts 6:3) — so that the leaders give themselves *to prayer, and to the ministry of the word* (Acts 6:4). Shared, qualified, Elohim-fearing leadership is one continuous covenant order from the mount to the assembly.',
       sv.verse_id, ev.verse_id, 'free', 29431
  FROM _s305_ex18_lookup sv, _s305_ex18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=18 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-18-zipporah-returned-to-the-house-of-reuel',
       E'After He Had Sent Her Back — Zipporah returned to the house of Reuel',
       E'The chapter opens with a quiet domestic note: *Then Jethro, Moses'' father in law, took Zipporah, Moses'' wife, after he had sent her back, And her two sons* (Exodus 18:2-3), and Jethro *came with his sons and his wife unto Moses into the wilderness* (Exodus 18:5). The restored library fills in what stands behind *after he had sent her back*.\n\nJasher tells it plainly: *And Aaron said to Moses, Send away the woman and her children that they may go to her father''s house, and Moses hearkened to the words of Aaron, and did so* (Jasher 79:17); *And Zipporah returned with her children, and they went to the house of Reuel, and remained there until the time arrived when Yahuah (the Lord) had visited his people, and brought them forth from Egypt* (Jasher 79:18). The family waited out the deliverance at Reuel''s house — the very home Jethro now travels from.\n\nJubilees dates the long Midian sojourn behind Gershom''s name — *I have been an alien in a strange land* (Exodus 18:3): *you did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt* (Jubilees 48:1). Moses had been the stranger; now the stranger''s house comes to rejoice at the redemption.',
       sv.verse_id, ev.verse_id, 'extras', 29434
  FROM _s305_ex18_lookup sv, _s305_ex18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Rahab confesses *I know that Yahuah (LORD) hath given you the land* (Joshua 2:9) — the report of the redemption melts the outsider, as it stirs Jethro to rejoice.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=9
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-now-i-know-yahuah-is-greater-than-all-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11) — Rahab''s confession is Jethro''s *Yahuah (LORD) is greater than all gods*, the stranger knowing the one Elohim of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-now-i-know-yahuah-is-greater-than-all-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*A stranger... cometh out of a far country for thy name''s sake* (1 Kings 8:41) — Solomon prays for the very figure Jethro is, the outsider drawn by the report of the Name.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-now-i-know-yahuah-is-greater-than-all-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*That all people of the earth may know thy name, to fear thee, as do thy people Yashar''el (Israel)* (1 Kings 8:43) — the stranger is drawn IN to the same covenant Elohim, never grafted as a rival people.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-now-i-know-yahuah-is-greater-than-all-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Among the gods there is none like unto thee, O Yahuah (Lord); neither are there any works like unto thy works* (Psalm 86:8) — the Psalm turns Jethro''s confession into praise; the works are the proof.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=86 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-now-i-know-yahuah-is-greater-than-all-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*All nations whom thou hast made shall come and worship before thee... and shall glorify thy name* (Psalm 86:9) — Jethro''s rejoicing is the first drop of the nations'' worship, drawn by what Yahuah did for Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=9
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=86 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-now-i-know-yahuah-is-greater-than-all-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who is Yahuah (LORD), that I should obey his voice... I know not Yahuah (LORD)* (Exodus 5:2) — Pharaoh''s arrogant question answered by Jethro''s *Now I know*.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-greater-than-all-gods-pharaohs-pride-answered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*That my name may be declared throughout all the earth* (Exodus 9:16) — the plagues aimed at the very outcome Jethro voices, the Name declared and the proud brought low.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-greater-than-all-gods-pharaohs-pride-answered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Who is like unto thee, O Yahuah (LORD), among the gods?* (Exodus 15:11) — the Song at the sea asks; Jethro answers *Yahuah (LORD) is greater than all gods*. Both rise from Egypt''s drowned pride.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-greater-than-all-gods-pharaohs-pride-answered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Heads over you, captains over thousands... hundreds... fifties... and tens* (Deuteronomy 1:15) — Moses recounts the very pattern Jethro gave as the abiding order of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=21
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-able-men-such-as-fear-elohim-shared-judgeship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye shall not respect persons in judgment... for the judgment is Elohim''s (God''s)* (Deuteronomy 1:17) — fills out what *men of truth, hating covetousness* (Exodus 18:21) means: judges who fear Elohim, not the face of man.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=21
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-able-men-such-as-fear-elohim-shared-judgeship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Gather unto me seventy men of the elders of Yashar''el (Israel)... that they may stand there with thee* (Numbers 11:16) — Yahuah himself enacts Jethro''s remedy against *thou wilt surely wear away* (Exodus 18:18).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=18
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-able-men-such-as-fear-elohim-shared-judgeship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*They shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17) — Jethro''s *they shall bear the burden with thee* (Exodus 18:22) sealed by the Ruach at the seventy.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=22
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-able-men-such-as-fear-elohim-shared-judgeship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom* (Acts 6:3) — the apostles carry Jethro''s Torah-pattern into the assembly; *honest report* answers *men of truth* (Exodus 18:21).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=21
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-able-men-such-as-fear-elohim-shared-judgeship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*It is not reason that we should leave the word of Elohim (God), and serve tables* (Acts 6:2) — the apostles face Jethro''s danger (*the thing is too heavy for thee*, Exodus 18:18) and answer it by delegation.'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=18
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-able-men-such-as-fear-elohim-shared-judgeship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 (EXTRAS)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Send away the woman and her children that they may go to her father''s house... and Moses... did so* (Jasher 79:17) — Jasher fills the gap behind *after he had sent her back* (Exodus 18:2).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=2
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=79 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-zipporah-returned-to-the-house-of-reuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Zipporah returned with her children... to the house of Reuel, and remained there until... Yahuah... brought them forth from Egypt* (Jasher 79:18) — the home Jethro travels from in *came... unto Moses into the wilderness* (Exodus 18:5).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=79 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-zipporah-returned-to-the-house-of-reuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*You did depart and dwell in the land of Midian five weeks and one year. And you did return into Egypt* (Jubilees 48:1) — dates the sojourn behind Gershom''s name, *I have been an alien in a strange land* (Exodus 18:3).'
  FROM cross_reference_threads t
  JOIN _s305_ex18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s305_ex18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-18-zipporah-returned-to-the-house-of-reuel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
