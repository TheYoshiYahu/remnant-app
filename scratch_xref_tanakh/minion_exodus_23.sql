-- ----- fragment: minion_exodus_23.sql (Exodus 23) -----
-- Chapter: Exodus 23 (close of the Mishpatim — righteous-judgment Torah, the Sabbath/land-rest,
--          the three pilgrimage feasts, and the Angel bearing the Name)
-- Tag: ex23   Session: s305   Sort band base: 29550 (step 3)
--
-- Exodus 23 coverage:
--   v.1-9 (civil/ethical Torah: false report, no bribe, love the stranger):
--        NT:     Matthew 5:7 (merciful), James 2:8 (royal law love-neighbour) — thread righteous-judgment
--        Extras: none warranted (covered by canon Torah/NT)
--        Tanakh: Leviticus 19:18/33/34 (love neighbour + stranger), Deuteronomy 16:18-19 (just judgment, gift blinds — near-verbatim of 23:8)
--   v.10-11 (sabbatical seventh-year land rest):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Leviticus 25:2/4 (the land-Sabbath) — thread Sabbath-and-land-rest
--   v.12 (seventh-day Sabbath reaffirmed):
--        NT:     none warranted (creation-rooted Torah)
--        Extras: Jubilees 2:1 (angel of presence: six days, kept Sabbath on the seventh, hallowed for all ages)
--        Tanakh: Genesis 2:2-3 (creation rest), Exodus 20:11 (Sabbath grounded in creation) — thread Sabbath-and-land-rest
--   v.13 (make no mention of the name of other gods):
--        NT/Extras/Tanakh: none warranted (folded into chapter ethic; no standalone thread)
--   v.14-17 (THREE pilgrimage feasts: unleavened bread, harvest/firstfruits, ingathering):
--        NT:     1 Corinthians 5:7/8 (Messiah our passover, keep the feast), Acts 2:1 (Pentecost/Shavuot=harvest), John 7:2/37 (Tabernacles/ingathering) — thread the-appointed-times
--        Extras: none warranted (Jubilees feast-law fits but NT fill carries the thread; kept clean)
--        Tanakh: Leviticus 23 (the feasts of Yahuah), Deuteronomy 16:16 (three times in a year) — thread the-appointed-times
--   v.18-19 (sacrifice not with leaven; firstfruits; kid in mother's milk):
--        Tanakh: tied to feast thread via firstfruits; no standalone thread (none warranted)
--   v.20-23 (THE Angel before thee; my name is in him; he will not pardon transgressions):
--        NT:     John 8:58 (Before Abraham was, I am), 1 Corinthians 10:4 (Rock=Messiah), 1 Corinthians 10:9 (tempted Messiah) — thread the-angel-bearing-the-name
--        Extras: Jubilees 1:29 (angel of presence who went before the camp), Jubilees 2:1 (angel of presence spake to Moses)
--        Tanakh: Exodus 3:2 (angel of Yahuah in the bush), Exodus 33:14 (my presence shall go), Isaiah 63:9 (angel of his presence saved them) — thread the-angel-bearing-the-name
--   v.24-26, 27-33 (drive out nations; serve Yahuah, he shall bless thy bread/water, take sickness away):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deuteronomy 7:15 (take away all sickness) — thread serve-yahuah-he-shall-bless
--
-- THREADS (5):
--   exodus-23-three-times-keep-a-feast-the-appointed-times       [Tanakh + NT]        free
--   exodus-23-the-angel-bearing-the-name-the-formed-son          [Tanakh + NT + extras] extras
--   exodus-23-the-sabbath-and-the-land-sabbath-rest              [Tanakh + extras]    extras
--   exodus-23-righteous-judgment-and-the-stranger-torah-forward  [Tanakh + NT]        free
--   exodus-23-serve-yahuah-and-he-shall-bless-thy-bread          [Tanakh]             free
--
-- Contested/load-bearing framing:
--   * 23:14-17 the three feasts are the architecture the NT FILLS (Messiah our passover, Shavuot poured,
--     Tabernacles consummated) — the moedim KEPT, never abolished.
--   * 23:20-21 "my name is in him" = the Formed Son, the Angel of Yahuah who IS Yahuah and has a Father;
--     1 Cor 10:4/9 makes the Rock that led them the Messiah they tempted. NOT a created angel; NOT a co-equal person.

CREATE TEMP VIEW _s305_ex23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- ---- THREAD 1: the appointed times (three pilgrimage feasts) ----
    ('canon','exodus',23,14,'canon','leviticus',23,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). Exodus 23''s *Three times thou shalt keep a feast unto me in the year* (23:14) is the seed Leviticus 23 unfolds into the full calendar — Passover, Unleavened Bread, Firstfruits, Weeks, Trumpets, Atonement, Tabernacles. They are *my feasts*, Yahuah''s appointed times, not Israel''s invention and not abolished.'),
    ('canon','exodus',23,15,'canon','deuteronomy',16,16,'free',
      E'*Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty* (Deuteronomy 16:16). Deuteronomy names the three pilgrimage feasts Exodus 23:14-17 commanded — unleavened bread, harvest/weeks, ingathering/tabernacles — and repeats Exodus''s charge *none shall appear before me empty* (23:15). One calendar, twice given.'),
    ('canon','exodus',23,15,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The feast of unleavened bread of Exodus 23:15 is not retired but FILLED: the Passover lamb is the Messiah, and the unleavened bread is the people purged of malice. The moed is the architecture; Messiah is what it always pointed to.'),
    ('canon','exodus',23,15,'canon','1-corinthians',5,8,'free',
      E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). Paul''s plain imperative — *let us keep the feast* — is the unleavened-bread command of Exodus 23:15 still in force, kept now in the body of Messiah. The appointed time is observed, not abolished.'),
    ('canon','exodus',23,16,'canon','acts',2,1,'free',
      E'*And when the day of Pentecost was fully come, they were all with one accord in one place* (Acts 2:1). *The feast of harvest, the firstfruits of thy labours* (Exodus 23:16) is the feast of Weeks/Shavuot — Pentecost — when the Ruach HaKodesh (Holy Spirit) was poured out. The harvest feast of Exodus is the day the firstfruits of the regathered people were reaped.'),
    ('canon','exodus',23,16,'canon','john',7,2,'free',
      E'*Now the Yahudim''s (Jews’) feast of tabernacles was at hand* (John 7:2). *The feast of ingathering, which is in the end of the year, when thou hast gathered in thy labours out of the field* (Exodus 23:16) is the feast of Tabernacles — the great ingathering feast Yahusha (Jesus) kept and filled, crying *If any man thirst, let him come unto me, and drink* (John 7:37) on its last great day.'),
    ('canon','exodus',23,16,'canon','john',7,37,'free',
      E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). On the last great day of the feast of ingathering/Tabernacles — the very feast of *ingathering... when thou hast gathered in thy labours out of the field* (Exodus 23:16) — the Messiah declares himself its consummation, the living water of the final ingathering.'),
    -- ---- THREAD 2: the Angel bearing the Name (the Formed Son) ----
    ('canon','exodus',23,20,'canon','exodus',3,2,'free',
      E'*And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed* (Exodus 3:2). The Angel Yahuah sends in *Behold, I send an Angel before thee... for my name is in him* (Exodus 23:20-21) is the same Angel of Yahuah who spoke from the bush as Elohim Himself (3:6) — the Formed Son who bears the Name and IS Yahuah, yet is sent.'),
    ('canon','exodus',23,21,'canon','exodus',33,14,'free',
      E'*And he said, My presence shall go with thee, and I will give thee rest* (Exodus 33:14). The Angel in whom *my name is in him* (Exodus 23:21) is Yahuah''s own Presence going before the camp — not a deputed creature but the visible Glory of Yahuah Himself leading Yashar''el (Israel), the Formed Son who is the Father''s face.'),
    ('canon','exodus',23,21,'canon','isaiah',63,9,'free',
      E'*In all their affliction he was afflicted, and the angel of his presence saved them: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old* (Isaiah 63:9). Isaiah names exactly the Angel of Exodus 23:21 — *the angel of his presence* — as the One who saved, redeemed, and carried Yashar''el (Israel) through the wilderness. The Angel who bears the Name is the Redeemer.'),
    ('canon','exodus',23,21,'canon','john',8,58,'free',
      E'*Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Before Abraham was, I am* (John 8:58). The Angel in whom Yahuah''s Name dwells (Exodus 23:21) is the Formed Son who later took flesh and claimed the Name of the bush — *I am* — declaring himself the One who led the fathers before Abraham was.'),
    ('canon','exodus',23,21,'canon','1-corinthians',10,4,'free',
      E'*And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). Paul identifies the One who led Yashar''el (Israel) through the wilderness — the Angel bearing the Name of Exodus 23:20-21 — as the Messiah: the Rock that followed them WAS Messiah, the Formed Son present in the Exodus.'),
    ('canon','exodus',23,21,'canon','1-corinthians',10,9,'free',
      E'*Neither let us tempt Messiah (Christ), as some of them also tempted, and were destroyed of serpents* (1 Corinthians 10:9). Exodus warns *provoke him not; for he will not pardon your transgressions* (23:21); Paul says the One they provoked in the wilderness was the Messiah. To provoke the Angel who bears the Name is to tempt the Formed Son.'),
    ('canon','exodus',23,20,'jubilees','jubilees',1,29,'extras',
      E'*And the angel of the presence who went before the camp of Yashar’el (Israel) took the tables of the divisions of the years –from the time of the creation–of the law and of the testimony of the weeks, of the jubilees* (Jubilees 1:29). Jubilees calls the One who *went before the camp of Yashar’el* the angel of the presence — the same Angel Yahuah sends *before thee* in Exodus 23:20 — the Formed Son who carries the Name and the testimony.'),
    ('canon','exodus',23,21,'jubilees','jubilees',2,1,'extras',
      E'*And the angel of the presence spake to Moses according to the word of Yahuah (God), saying: Write the complete history of the creation* (Jubilees 2:1). The angel of the presence who dictates the Torah to Moses in Jubilees is the same Angel in whom *my name is in him* (Exodus 23:21): the Formed Son speaking *according to the word of Yahuah*, bearing the Name yet sent by the Father.'),
    -- ---- THREAD 3: the Sabbath and the land-Sabbath rest ----
    ('canon','exodus',23,12,'canon','genesis',2,2,'free',
      E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). The seventh-day rest of Exodus 23:12 — *on the seventh day thou shalt rest* — is rooted in creation itself, woven into the order of the world before any nation existed. The Sabbath is creation-anchored, not a temporary statute.'),
    ('canon','exodus',23,12,'canon','exodus',20,11,'free',
      E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The Sabbath command repeated in Exodus 23:12 carries the reason given at Sinai: Yahuah Himself rested and hallowed the seventh day. The rest that even reaches *thine ox... and the stranger* (23:12) is the creation Sabbath.'),
    ('canon','exodus',23,11,'canon','leviticus',25,4,'free',
      E'*But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard* (Leviticus 25:4). Exodus 23:10-11''s *the seventh year thou shalt let it rest and lie still* is the land-Sabbath Leviticus 25 unfolds in full — the land itself keeps a sabbath unto Yahuah, the weekly rest written into the very soil.'),
    ('canon','exodus',23,12,'jubilees','jubilees',2,1,'extras',
      E'*how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1). Jubilees grounds the seventh-day rest of Exodus 23:12 where the Torah does — in creation — and declares it hallowed *for all ages*: the Sabbath is a perpetual sign, never abolished.'),
    -- ---- THREAD 4: righteous judgment and the stranger (Torah carried forward) ----
    ('canon','exodus',23,8,'canon','deuteronomy',16,19,'free',
      E'*Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous* (Deuteronomy 16:19). Deuteronomy restates Exodus 23:8 almost word for word — *thou shalt take no gift: for the gift blindeth the wise, and perverteth the words of the righteous* — the righteous-judgment Torah that binds judges to incorruptible justice.'),
    ('canon','exodus',23,9,'canon','leviticus',19,34,'free',
      E'*But the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:34). The command not to oppress the stranger *for ye know the heart of a stranger, seeing ye were strangers in the land of Egypt* (Exodus 23:9) is the same love-the-stranger Torah Leviticus 19 grounds in the same memory of Egypt.'),
    ('canon','exodus',23,4,'canon','leviticus',19,18,'free',
      E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). Exodus 23:4-5 commands returning *thine enemy''s ox* and helping *the ass of him that hateth thee* — the love-of-neighbour Torah enacted toward the one who hates you, the very royal-law principle Leviticus 19:18 names.'),
    ('canon','exodus',23,4,'canon','matthew',5,7,'free',
      E'*Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7). The mercy Exodus 23:4-5 commands toward an enemy''s straying ox is the Torah Yahusha (Jesus) carries forward in the Sermon on the Mount — not a new ethic but the deepening of the same righteous-judgment Torah, mercy that obtains mercy.'),
    ('canon','exodus',23,9,'canon','james',2,8,'free',
      E'*If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* (James 2:8). The stranger-love and neighbour-justice of Exodus 23:1-9 is what James calls *the royal law* — Torah upheld as the standing rule of the assembly, fulfilled, not abolished.'),
    -- ---- THREAD 5: serve Yahuah and he shall bless thy bread ----
    ('canon','exodus',23,25,'canon','deuteronomy',7,15,'free',
      E'*And Yahuah (LORD) will take away from thee all sickness, and will put none of the evil diseases of Egypt, which thou knowest, upon thee; but will lay them upon all them that hate thee* (Deuteronomy 7:15). The covenant blessing of Exodus 23:25 — *he shall bless thy bread, and thy water; and I will take sickness away from the midst of thee* — is the same promise Deuteronomy renews: covenant service answered with health and provision.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-23-three-times-keep-a-feast-the-appointed-times',
       E'Three times thou shalt keep a feast — the appointed times the NT fills',
       E'*Three times thou shalt keep a feast unto me in the year* (Exodus 23:14): the feast of unleavened bread, the feast of harvest (firstfruits), and the feast of ingathering (23:15-16). These are not Israel''s invention but Yahuah''s own calendar — *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2) — and Deuteronomy names the same three: *in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles* (Deuteronomy 16:16). The New Testament does not retire these appointed times; it FILLS them. Unleavened Bread: *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7), and the plain command stands — *let us keep the feast, not with old leaven... but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). Harvest/Weeks: *when the day of Pentecost was fully come* (Acts 2:1) the Ruach HaKodesh (Holy Spirit) was poured as the firstfruits of the regathered people. Ingathering/Tabernacles: *the Yahudim''s (Jews’) feast of tabernacles was at hand* (John 7:2), and on its last great day Yahusha (Jesus) cried *If any man thirst, let him come unto me, and drink* (John 7:37). The moedim are the architecture; the Messiah is what they always pointed to.',
       sv.verse_id, ev.verse_id, 'free', 29550
  FROM _s305_ex23_lookup sv, _s305_ex23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=23 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=23 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-23-the-angel-bearing-the-name-the-formed-son',
       E'Behold, I send an Angel — my name is in him — the Formed Son',
       E'*Behold, I send an Angel before thee, to keep thee in the way... Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:20-21). This is no created messenger: the Name of Yahuah dwells in him, and to disobey him is unpardonable. He is the Angel of Yahuah who spoke from the bush as Elohim Himself — *the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush* (Exodus 3:2) — and the Presence that leads the camp: *My presence shall go with thee, and I will give thee rest* (Exodus 33:14). Isaiah names him exactly: *the angel of his presence saved them: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old* (Isaiah 63:9). He is the Formed Son, who is Yahuah and yet has a Father — the One who later took flesh and claimed the Name of the bush: *Before Abraham was, I am* (John 8:58). Paul makes it explicit: the One who led Yashar''el (Israel) through the wilderness was the Messiah — *that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4) — and to provoke him is to *tempt Messiah (Christ), as some of them also tempted* (1 Corinthians 10:9), the very warning of *provoke him not* (23:21). The restored witnesses agree: *the angel of the presence who went before the camp of Yashar’el (Israel)* (Jubilees 1:29) and who *spake to Moses according to the word of Yahuah (God)* (Jubilees 2:1) — the Formed Son bearing the Name, sent by the Most High.',
       sv.verse_id, ev.verse_id, 'extras', 29553
  FROM _s305_ex23_lookup sv, _s305_ex23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=23 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=23 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-23-the-sabbath-and-the-land-sabbath-rest',
       E'On the seventh day thou shalt rest — the Sabbath and the land-Sabbath',
       E'Exodus 23 reaffirms two Sabbaths. The weekly: *Six days thou shalt do thy work, and on the seventh day thou shalt rest: that thine ox and thine ass may rest, and the son of thy handmaid, and the stranger, may be refreshed* (23:12) — a rest so wide it reaches the beast and the sojourner. And the land''s: *six years thou shalt sow thy land... But the seventh year thou shalt let it rest and lie still* (23:10-11). The weekly Sabbath is rooted in creation itself — *on the seventh day Elohim (God)... rested... from all his work which he had made* (Genesis 2:2) — and Sinai gives the reason plainly: *in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The seventh-year rest is the land-Sabbath Leviticus unfolds: *in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD)* (Leviticus 25:4). The restored witness binds the same to creation: Yahuah *kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1) — a perpetual sign written into the week and into the very soil.',
       sv.verse_id, ev.verse_id, 'extras', 29556
  FROM _s305_ex23_lookup sv, _s305_ex23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=23 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=23 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-23-righteous-judgment-and-the-stranger-torah-forward',
       E'Take no gift, love the stranger — the righteous-judgment Torah carried forward',
       E'The close of the Mishpatim opens with the Torah of righteous judgment: *Thou shalt not raise a false report... Thou shalt not wrest the judgment of thy poor in his cause... thou shalt take no gift: for the gift blindeth the wise, and perverteth the words of the righteous... thou shalt not oppress a stranger: for ye know the heart of a stranger, seeing ye were strangers in the land of Egypt* (Exodus 23:1-9). Even an enemy''s straying ox must be returned and his fallen ass helped (23:4-5). Deuteronomy restates the bribe law nearly verbatim — *neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous* (Deuteronomy 16:19) — and Leviticus grounds the stranger-love in the same memory: *the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt* (Leviticus 19:34), the neighbour-love of *thou shalt love thy neighbour as thyself* (Leviticus 19:18). This is the Torah Yahusha (Jesus) carries forward, not abolishes — *Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7) — and which James calls *the royal law according to the scripture, Thou shalt love thy neighbour as thyself* (James 2:8). Righteous judgment is Torah, and Torah stands.',
       sv.verse_id, ev.verse_id, 'free', 29559
  FROM _s305_ex23_lookup sv, _s305_ex23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=23 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-23-serve-yahuah-and-he-shall-bless-thy-bread',
       E'Serve Yahuah, and he shall bless thy bread — the covenant blessing',
       E'*And ye shall serve Yahuah Elohaychem (the LORD your God), and he shall bless thy bread, and thy water; and I will take sickness away from the midst of thee* (Exodus 23:25). Covenant service is answered with provision and health — the same promise Deuteronomy renews: *Yahuah (LORD) will take away from thee all sickness, and will put none of the evil diseases of Egypt, which thou knowest, upon thee* (Deuteronomy 7:15). The blessing is not a wage earned but the fruit of walking with Yahuah in the covenant He gave.',
       sv.verse_id, ev.verse_id, 'free', 29562
  FROM _s305_ex23_lookup sv, _s305_ex23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=23 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=23 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1: appointed times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (23,14,'canon','leviticus',23,2,1,E'*even these are my feasts* (Leviticus 23:2) — Exodus''s three feasts unfold into Yahuah''s full appointed-times calendar.'),
    (23,15,'canon','deuteronomy',16,16,2,E'*the feast of unleavened bread, and... weeks, and... tabernacles* (Deuteronomy 16:16) — the same three pilgrimage feasts, *none shall appear... empty*.'),
    (23,15,'canon','1-corinthians',5,7,3,E'*Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — Unleavened Bread filled in the Messiah.'),
    (23,15,'canon','1-corinthians',5,8,4,E'*let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8) — the feast still kept.'),
    (23,16,'canon','acts',2,1,5,E'*when the day of Pentecost was fully come* (Acts 2:1) — the harvest/Weeks feast, the Spirit poured as firstfruits.'),
    (23,16,'canon','john',7,2,6,E'*the feast of tabernacles was at hand* (John 7:2) — the feast of ingathering Yahusha kept.'),
    (23,16,'canon','john',7,37,7,E'*If any man thirst, let him come unto me, and drink* (John 7:37) — Tabernacles/ingathering consummated.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-23-three-times-keep-a-feast-the-appointed-times'
  JOIN _s305_ex23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex23_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the Angel bearing the Name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (23,20,'canon','exodus',3,2,1,E'*the angel of Yahuah (LORD) appeared... out of the midst of a bush* (Exodus 3:2) — the same Angel who spoke as Elohim.'),
    (23,21,'canon','exodus',33,14,2,E'*My presence shall go with thee* (Exodus 33:14) — the Name-bearing Angel is Yahuah''s own Presence.'),
    (23,21,'canon','isaiah',63,9,3,E'*the angel of his presence saved them... he bare them, and carried them* (Isaiah 63:9) — named exactly, the Redeemer.'),
    (23,21,'canon','john',8,58,4,E'*Before Abraham was, I am* (John 8:58) — the Formed Son claims the Name of the bush.'),
    (23,21,'canon','1-corinthians',10,4,5,E'*that Rock was Messiah (Christ)* (1 Corinthians 10:4) — the One who led Yashar''el in the wilderness.'),
    (23,21,'canon','1-corinthians',10,9,6,E'*Neither let us tempt Messiah (Christ), as some of them also tempted* (1 Corinthians 10:9) — to provoke him is to tempt Messiah.'),
    (23,20,'jubilees','jubilees',1,29,7,E'*the angel of the presence who went before the camp of Yashar’el* (Jubilees 1:29) — the restored witness names the Name-bearer.'),
    (23,21,'jubilees','jubilees',2,1,8,E'*the angel of the presence spake to Moses according to the word of Yahuah* (Jubilees 2:1) — bearing the Name, sent by the Father.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-23-the-angel-bearing-the-name-the-formed-son'
  JOIN _s305_ex23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex23_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: Sabbath and land-Sabbath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (23,12,'canon','genesis',2,2,1,E'*he rested on the seventh day from all his work* (Genesis 2:2) — the Sabbath rooted in creation.'),
    (23,12,'canon','exodus',20,11,2,E'*Yahuah (LORD)... rested the seventh day: wherefore... blessed the sabbath day, and hallowed it* (Exodus 20:11) — Sinai''s creation reason.'),
    (23,11,'canon','leviticus',25,4,3,E'*in the seventh year shall be a sabbath of rest unto the land* (Leviticus 25:4) — the land-Sabbath of 23:10-11.'),
    (23,12,'jubilees','jubilees',2,1,4,E'*kept Sabbath on the seventh day and hallowed it for all ages* (Jubilees 2:1) — a perpetual sign.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-23-the-sabbath-and-the-land-sabbath-rest'
  JOIN _s305_ex23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex23_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: righteous judgment and the stranger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (23,8,'canon','deuteronomy',16,19,1,E'*a gift doth blind the eyes of the wise* (Deuteronomy 16:19) — Exodus 23:8 restated almost verbatim.'),
    (23,9,'canon','leviticus',19,34,2,E'*the stranger... shall be unto you as one born among you... for ye were strangers in the land of Egypt* (Leviticus 19:34) — same stranger-love, same memory.'),
    (23,4,'canon','leviticus',19,18,3,E'*thou shalt love thy neighbour as thyself* (Leviticus 19:18) — the principle behind returning even an enemy''s ox.'),
    (23,4,'canon','matthew',5,7,4,E'*Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7) — Torah mercy carried forward.'),
    (23,9,'canon','james',2,8,5,E'*the royal law... Thou shalt love thy neighbour as thyself* (James 2:8) — Torah upheld as the standing rule.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-23-righteous-judgment-and-the-stranger-torah-forward'
  JOIN _s305_ex23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex23_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: serve Yahuah and be blessed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (23,25,'canon','deuteronomy',7,15,1,E'*Yahuah (LORD) will take away from thee all sickness* (Deuteronomy 7:15) — the covenant blessing renewed.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-23-serve-yahuah-and-he-shall-bless-thy-bread'
  JOIN _s305_ex23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex23_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
