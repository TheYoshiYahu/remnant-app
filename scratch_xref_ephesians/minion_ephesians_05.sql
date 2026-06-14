-- ----- fragment: minion_ephesians_05.sql (S230 Ephesians 5) -----
-- =====================================================================
-- S230 minion — EPHESIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 5 (33 verses) — walk in love a sweetsmelling savour /
--          children of light / ★ THE BRIDEGROOM AND THE BRIDE.
-- Tag: ep05 (temp view _s230_ep05_lookup).
-- Sort band: floor 7500, step 3 (7500, 7503, 7506 used; under 7525).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Ephesians = the re-gathering of the one olive tree, the two houses made one,
-- grace unto the ordained works, the Torah affirmed not abolished, the Formed Son). Chapter 5 walks
-- the gathered called-out ones in love (an offering of a sweet savour, Leviticus 1-3), as children
-- of light (Isaiah 60), and unveils the great mystery: the marriage of Messiah (Christ) and the
-- assembly. ★ The bride is NOT a new bride replacing Yashar'el (Israel); she is the betrothed
-- covenant people RESTORED — the wife Yahuah married, divorced for her whoredoms, washed and
-- re-betrothed (Hosea 2:19-20, Ezekiel 16:8-14, Isaiah 54:5, Isaiah 62:5). 5:31-32 cites Genesis
-- 2:24 (*they two shall be one flesh*) and reads it of Messiah and the church; 5:26 (*the washing
-- of water by the word*) echoes Ezekiel 16:9 (*then washed I thee with water*). The marriage figure
-- is the covenant restored, not abrogated. No replacement theology.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   walk in love, an offering and a sacrifice for a sweetsmelling savour
--           Tanakh: Leviticus 1:9, Leviticus 3:5 (a sweet savour unto Yahuah), Exodus 29:18,
--                   Genesis 8:21 (Yahuah smelled a sweet savour)
--           Extras: none warranted   NT: none warranted (Messiah''s self-offering carried in prose)
--   v.3-7   fornication / no inheritance / wrath on the children of disobedience
--           Tanakh: none warranted (vice-list, no single load-bearing root)
--           Extras: none warranted   NT: none warranted
--   v.8-14  ye were darkness, now light in Yahuah; walk as children of light; awake from the dead
--           Tanakh: Isaiah 60:1 (Arise, shine; for thy light is come), Isaiah 26:19 (Awake and
--                   sing, ye that dwell in dust... the earth shall cast out the dead)
--           Extras: Wisdom of Solomon 5:6 (the light of righteousness has not shined to us),
--                   Wisdom of Solomon 18:1,4 (your saints had a very great light; the uncorrupt
--                   light of the law to be given to the world)
--           NT: none warranted (the light-of-life root is the Tanakh witness)
--   v.15-21 walk circumspectly / be filled with the Spirit / psalms and hymns / submitting
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (ethical, allusive)
--   v.22-33 ★ the marriage: husband head of the wife as Messiah head of the church; sanctify and
--           cleanse with the washing of water by the word; two shall be one flesh; a great mystery
--           Tanakh: Genesis 2:24 (they shall be one flesh), Ezekiel 16:8-9 (I sware unto thee, and
--                   entered into a covenant with thee... then washed I thee with water), Hosea
--                   2:19-20 (I will betroth thee unto me for ever), Isaiah 54:5 (thy Maker is thine
--                   husband), Isaiah 62:5 (as the bridegroom rejoiceth over the bride)
--           Extras: Tobit 8:6 (You madest Adam, and gavest him Eve his wife... It is not good that
--                   man should be alone) — the Genesis-2 marriage re-spoken in a wedding prayer
--           NT: Matthew 19:5 (For this cause shall a man leave father and mother... they twain
--                   shall be one flesh) — Yahusha (Jesus) citing the same Genesis 2:24
--
-- THREADS (slug -> target libraries):
--   7500 ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2  (Tanakh + Extras + NT)  ★ BLESSING
--   7503 ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3        (Tanakh)
--   7506 ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26              (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s230_ep05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2  ★ BLESSING
  ('canon', 'ephesians', 5, 31, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). This is the word Paul quotes and then unveils: *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh. This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:31-32). The first marriage in the garden, the man and the woman made one flesh, was always a figure of the deeper union — Messiah (Christ) and the gathered covenant people joined into one body. The two becoming one is the great mystery: not two peoples merged, but the betrothed restored to her Maker.'),
  ('canon', 'ephesians', 5, 32, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). Paul names the Genesis-2 word *a great mystery,* and reads it *concerning Messiah (Christ) and the church* (Ephesians 5:32). The one-flesh union spoken over Adam and the woman is the pattern of the covenant: the assembly is *members of his body, of his flesh, and of his bones* (Ephesians 5:30), bone of his bone as the woman was taken from the man. The mystery hidden in the garden is opened here — the bridegroom and the bride made one.'),
  ('canon', 'ephesians', 5, 25, 'canon', 'hosea', 2, 19, 'free', E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies.* (Hosea 2:19). Yahuah (LORD) speaks to the wife who played the harlot and was put away, and yet vows to take her back: *I will betroth thee unto me for ever.* This is the love Paul holds up to husbands: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). The bride of the church is the re-betrothed bride of Hosea — the same covenant wife, divorced for her whoredoms and wooed back in lovingkindness, not a new bride replacing Yashar''el (Israel).'),
  ('canon', 'ephesians', 5, 26, 'canon', 'ezekiel', 16, 9, 'free', E'*Then washed I thee with water; yea, I throughly washed away thy blood from thee, and I anointed thee with oil.* (Ezekiel 16:9). When Yahuah (LORD) took Jerusalem as his bride, he washed her: *I sware unto thee, and entered into a covenant with thee... and thou becamest mine. Then washed I thee with water* (Ezekiel 16:8-9). Paul re-speaks that washing of the bride: Messiah (Christ) gave himself for the church *That he might sanctify and cleanse it with the washing of water by the word* (Ephesians 5:26). The bridal washing of Ezekiel is the cleansing of the assembly; the bride is the covenant people whom Yahuah (LORD) washed, betrothed, and now sanctifies — the same bride, restored.'),
  ('canon', 'ephesians', 5, 25, 'canon', 'isaiah', 54, 5, 'free', E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* (Isaiah 54:5). Isaiah names the marriage outright: *thy Maker is thine husband.* The forsaken wife, grieved in spirit, is called back with everlasting kindness (Isaiah 54:6-8). Paul stands in that same marriage when he says Messiah (Christ) *loved the church, and gave himself for it* (Ephesians 5:25). The husband who is the Maker and Redeemer of Yashar''el (Israel) is the bridegroom of the church; the bride is the wife of his covenant, gathered again.'),
  ('canon', 'ephesians', 5, 27, 'canon', 'isaiah', 62, 5, 'free', E'*For as a young man marrieth a virgin, so shall thy sons marry thee: and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* (Isaiah 62:5). The forsaken and desolate land is renamed *Hephzi-bah* and *Beulah* — married — and Yahuah (LORD) rejoices over her *as the bridegroom rejoiceth over the bride* (Isaiah 62:4-5). Paul sets this bridegroom''s joy before us: Messiah (Christ) sanctifies the church *That he might present it to himself a glorious church, not having spot, or wrinkle... but that it should be holy and without blemish* (Ephesians 5:27). The glorious bride presented to Messiah (Christ) is the once-forsaken, now-married people over whom her Elohim (God) rejoices.'),
  ('canon', 'ephesians', 5, 31, 'apocrypha', 'tobit', 8, 6, 'extras', E'*You madest Adam, and gavest him Eve his wife for an helper and stay: of them came mankind: you have said, It is not good that man should be alone; let us make to him an aid like to himself.* (Tobit 8:6). On his wedding night Tobias rises to pray, and grounds his marriage in the garden: Yahuah (God) made Adam and gave him Eve, *for it is not good that man should be alone.* The restored library re-speaks the very Genesis-2 word Paul quotes — *For this cause shall a man leave his father and mother... and they two shall be one flesh* (Ephesians 5:31). The marriage that began in Eden is the figure honoured in the wedding prayer and unveiled by Paul as the mystery of Messiah (Christ) and the church.'),
  ('canon', 'ephesians', 5, 31, 'canon', 'matthew', 19, 5, 'free', E'*And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5). Yahusha (Jesus) himself cites Genesis 2:24, and adds, *Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6). Paul speaks the same word over the marriage of Messiah (Christ) and the church: *they two shall be one flesh. This is a great mystery* (Ephesians 5:31-32). The one-flesh joining the Master declares from creation is the joining Paul reads of the bridegroom and his bride — what Elohim (God) has joined, made one and not to be put asunder.'),
  -- thread: ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3
  ('canon', 'ephesians', 5, 2, 'canon', 'leviticus', 1, 9, 'free', E'*But his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 1:9). The burnt offering rises from the altar *a sweet savour unto Yahuah (LORD).* Paul names Messiah (Christ) by that very offering: *walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). The whole burnt offering of Leviticus, given up entirely to Elohim (God), is fulfilled in the self-giving of Messiah (Christ); and the walk of love into which we are called is the same sweet savour ascending to the Father.'),
  ('canon', 'ephesians', 5, 2, 'canon', 'leviticus', 3, 5, 'free', E'*And Aaron''s sons shall burn it on the altar upon the burnt sacrifice, which is upon the wood that is on the fire: it is an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 3:5). The peace offering too ascends *a sweet savour unto Yahuah (LORD)* — the offering that makes peace between Elohim (God) and his people. Paul reads Messiah''s sacrifice as exactly this: *an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). He who *is our peace* (Ephesians 2:14) is himself the peace offering, the sweet savour by which the gathered are reconciled and brought near.'),
  ('canon', 'ephesians', 5, 2, 'canon', 'exodus', 29, 18, 'free', E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD).* (Exodus 29:18). At the consecration of the priests the ram is wholly burned, *a sweet savour... an offering made by fire unto Yahuah (LORD).* Paul casts the love-walk and the self-offering of Messiah (Christ) in the same priestly terms: *given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). The offering that consecrated Aaron and his sons is taken up in the one offering that sanctifies the whole assembly of the called-out.'),
  ('canon', 'ephesians', 5, 2, 'canon', 'genesis', 8, 21, 'free', E'*And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake...* (Genesis 8:21). The first sweet savour in scripture rises from Noah''s altar after the flood, and Yahuah (LORD) answers it with covenant mercy. Paul names Messiah''s self-giving by that ancient fragrance: *an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). The savour that turned away the curse is fulfilled in the offering of Messiah (Christ), whose sacrifice secures the covenant and into whose love-walk the gathered are called.'),
  -- thread: ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26
  ('canon', 'ephesians', 5, 8, 'canon', 'isaiah', 60, 1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). Isaiah calls the people out of darkness into the risen light of Yahuah (LORD): *the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee* (Isaiah 60:2). Paul speaks the same passage from death to light: *For ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8). The light come upon Zion is the light now risen on the gathered; to walk as children of light is to live in the glory of Yahuah (LORD) arisen upon his people.'),
  ('canon', 'ephesians', 5, 14, 'canon', 'isaiah', 60, 1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). The summons *Arise, shine* is the very word Paul gathers up in the hymn he quotes: *Awake thou that sleepest, and arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14). Isaiah''s *thy light is come* becomes *Messiah (Christ) shall give thee light* — the rising of the glory of Yahuah (LORD) upon Zion fulfilled in the One who is the light, raising the sleeping and the dead to walk in his day.'),
  ('canon', 'ephesians', 5, 14, 'canon', 'isaiah', 26, 19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). Isaiah calls the dead to wake and rise: *Awake and sing, ye that dwell in dust... the earth shall cast out the dead.* Paul quotes a hymn in the same key: *Awake thou that sleepest, and arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14). The resurrection-call of Isaiah is the call to the children of light — to awake from the sleep of the works of darkness and rise in the light Messiah (Christ) gives.'),
  ('canon', 'ephesians', 5, 13, 'apocrypha', 'the-wisdom-of-solomon', 5, 6, 'extras', E'*Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us.* (Wisdom of Solomon 5:6). The ungodly confess too late that *the light of righteousness has not shined to us* — they walked the unfruitful works of darkness and never came to the light. Paul sets the children of light against exactly this: *all things that are reproved are made manifest by the light: for whatsoever doth make manifest is light* (Ephesians 5:13), having no fellowship with *the unfruitful works of darkness* (Ephesians 5:11). The restored library names the doom of those over whom the sun of righteousness never rose; the gathered are summoned out of that darkness into the light.'),
  ('canon', 'ephesians', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 18, 1, 'extras', E'*Nevertheless your saints had a very great light, whose voice they hearing, and not seeing their shape, because they also had not suffered the same things, they counted them happy.* (Wisdom of Solomon 18:1). When darkness fell on Egypt, *your saints had a very great light* — the covenant people set apart in light while the enemies were *imprisoned in darkness, who had kept your sons shut up, by whom the uncorrupt light of the law was to be given to the world* (Wisdom of Solomon 18:4). Paul writes the same divide into the assembly: *ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8). The saints'' great light, bound to the uncorrupt light of the law, is the children-of-light walk — the gathered shining where the world lies in darkness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2',
       E'The bridegroom and the bride: they two shall be one flesh (Genesis 2, Hosea 2, Ezekiel 16)',
       E'Paul lifts the marriage of husband and wife into its greatest meaning: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it; That he might sanctify and cleanse it with the washing of water by the word, That he might present it to himself a glorious church, not having spot, or wrinkle... but that it should be holy and without blemish* (Ephesians 5:25-27). Then he quotes the first marriage in the garden — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh* (Ephesians 5:31, citing *they shall be one flesh,* Genesis 2:24) — and names it outright: *This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:32). The one-flesh union of Adam and the woman was always the figure of this deeper union; and the gathered are *members of his body, of his flesh, and of his bones* (Ephesians 5:30), taken from his side as the woman was taken from the man. Mark well who this bride is. She is not a new bride brought in to replace Yashar''el (Israel); she is the covenant wife restored. Yahuah (LORD) took Jerusalem as his bride and washed her — *I sware unto thee, and entered into a covenant with thee, saith Adonai Yahuah (the Lord GOD), and thou becamest mine. Then washed I thee with water* (Ezekiel 16:8-9) — and that bridal washing is the cleansing Paul names, *the washing of water by the word* (Ephesians 5:26). She played the harlot and was put away, and yet her husband vowed to take her back: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). For *thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) — the forsaken wife called back with everlasting kindness; and *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5), the desolate land renamed Married. The restored library held the same garden-marriage in its wedding prayer: *You madest Adam, and gavest him Eve his wife for an helper and stay... It is not good that man should be alone* (Tobit 8:6). And Yahusha (Jesus) himself spoke the Genesis word over marriage — *they twain shall be one flesh... What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:5-6). So the great mystery is the covenant restored: the once-forsaken, washed, re-betrothed wife presented at last a glorious bride, the two made one, what Elohim (God) has joined never to be put asunder.',
       sv.verse_id, ev.verse_id, 'extras', 7500
  FROM _s230_ep05_lookup sv, _s230_ep05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=5 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3',
       E'Walk in love, an offering of a sweetsmelling savour (Leviticus 1-3)',
       E'*And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). Paul reads Messiah''s self-giving in the language of the altar. The burnt offering, wholly given up to Elohim (God), ascends *a sweet savour unto Yahuah (LORD)* (Leviticus 1:9); so does the peace offering that makes peace between Elohim (God) and his people — *an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 3:5); and the consecration ram of the priests, *a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18). The fragrance reaches back to the first altar after the flood, when *Yahuah (LORD) smelled a sweet savour* and answered with covenant mercy (Genesis 8:21). All of it is gathered up in the one offering of Messiah (Christ), who *is our peace* (Ephesians 2:14) and gave himself a sweetsmelling savour to the Father. And the figure is not left at the altar: the walk of love into which the gathered are called is itself that ascending savour — to love as Messiah (Christ) loved, to give as he gave, is to live the offering whose smoke rises pleasing to Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 7503
  FROM _s230_ep05_lookup sv, _s230_ep05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26',
       E'Walk as children of light: awake thou that sleepest, and arise from the dead (Isaiah 60, 26)',
       E'*For ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8). The passage from darkness to light is Isaiah''s great summons to Zion: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee. For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee* (Isaiah 60:1-2). The light come upon the city is the light now risen on the gathered. So when Paul quotes the hymn — *Wherefore he saith, Awake thou that sleepest, and arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14) — Isaiah''s *thy light is come* becomes *Messiah (Christ) shall give thee light,* and his *Arise, shine* joins the resurrection-call: *Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* (Isaiah 26:19). To walk as children of light is to wake from the sleep of *the unfruitful works of darkness* (Ephesians 5:11), for *all things that are reproved are made manifest by the light* (Ephesians 5:13). The restored library marks both sides of this divide. The ungodly confess too late, *the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* (Wisdom of Solomon 5:6); but the covenant people, even in the night of judgment that fell on their oppressors, were kept in light — *your saints had a very great light* (Wisdom of Solomon 18:1), the people *by whom the uncorrupt light of the law was to be given to the world* (Wisdom of Solomon 18:4). The children of light are that set-apart people, risen from the dead, shining where the world lies in darkness.',
       sv.verse_id, ev.verse_id, 'extras', 7506
  FROM _s230_ep05_lookup sv, _s230_ep05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *they shall be one flesh* the first marriage in the garden, quoted by Paul and read *concerning Messiah (Christ) and the church* (Ephesians 5:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *they shall be one flesh* the same word named *a great mystery* and applied to *Messiah (Christ) and the church* (Ephesians 5:32).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 16:9 — *Then washed I thee with water* the bridal washing of the covenant wife; *the washing of water by the word* by which Messiah (Christ) cleanses the church (Ephesians 5:26).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 2:19 — *I will betroth thee unto me for ever* the put-away wife wooed back; the love Messiah (Christ) shows the church, *gave himself for it* (Ephesians 5:25). The bride is Yashar''el (Israel) re-betrothed, not replaced.'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 54:5 — *thy Maker is thine husband* the forsaken wife called back with everlasting kindness; the bridegroom who *loved the church, and gave himself for it* (Ephesians 5:25).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 62:5 — *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* the desolate land renamed Married; the glorious bride Messiah (Christ) presents to himself (Ephesians 5:27).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Tobit 8:6 — *You madest Adam, and gavest him Eve his wife... It is not good that man should be alone* the garden-marriage re-spoken in a wedding prayer; the Genesis-2 word Paul quotes (Ephesians 5:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Matthew 19:5 — *they twain shall be one flesh* Yahusha (Jesus) citing Genesis 2:24, *what Elohim (God) hath joined... let not man put asunder*; the one-flesh joining Paul reads of the bridegroom and bride (Ephesians 5:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 1:9 — *a sweet savour unto Yahuah (LORD)* the whole burnt offering; Messiah (Christ) *gave himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 3:5 — *of a sweet savour unto Yahuah (LORD)* the peace offering that makes peace; he who *is our peace* (Ephesians 2:14) the sweetsmelling savour (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 29:18 — *a sweet savour, an offering made by fire unto Yahuah (LORD)* the consecration ram of the priests; the offering that sanctifies the assembly (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 8:21 — *Yahuah (LORD) smelled a sweet savour* the first altar after the flood answered with covenant mercy; the offering of Messiah (Christ) a sweetsmelling savour (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* the light risen on Zion; *ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:1 — *Arise, shine; for thy light is come* the summons fulfilled in the hymn Paul quotes: *arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:19 — *Awake and sing, ye that dwell in dust... the earth shall cast out the dead* the resurrection-call behind *Awake thou that sleepest, and arise from the dead* (Ephesians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:6 — *the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* the ungodly''s too-late confession; against the children of light who reprove *the unfruitful works of darkness* (Ephesians 5:11,13).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 18:1 — *your saints had a very great light* the covenant people kept in light in the night of judgment, *by whom the uncorrupt light of the law was to be given to the world* (18:4); the children-of-light walk (Ephesians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
