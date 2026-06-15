-- ----- fragment: minion_proverbs_7.sql (Proverbs 7) -----
-- Chapter: Proverbs 7 — the SECOND full strange-woman chapter: the seduction of the young man void of understanding, the harlot's house as the road to death, the climactic warning before ch8's Wisdom. The chapter opens on a Torah-keeping charge that is the anti-antinomian hinge of the whole passage — *Keep my commandments, and live; and my law as the apple of thine eye* (7:2) — then narrates a single seduction (7:6-23) as a window-scene cautionary tale, and closes on the destination figure — *Her house is the way to hell, going down to the chambers of death* (7:27). VICTIMS-NOT-ENEMIES: the seduced youth is a lost sheep, *a young man void of understanding* (7:7); the warning is for his deliverance, not his condemnation. The seventh commandment (Exodus 20:14 / Deuteronomy 5:18) stands behind the whole — Torah, not abolished.
-- Tag: pr07   Temp view: _s304_pr07_lookup
-- Sort band: base 28150, step 3 -> threads at 28150, 28153, 28156, 28159, 28162 (5 threads)
-- Source of EVERY row: 'canon','proverbs',7,v
--
-- Proverbs 7 coverage:
--   ★★ v.1-3 (My son, keep my words... Keep my commandments, and live; and my law as the apple of thine eye. Bind them upon thy fingers, write them upon the table of thine heart)
--        NT:     none warranted distinct (the keep-and-LIVE / Torah-on-the-heart figure carried whole by Deuteronomy + Proverbs 3 + Jeremiah 31; NT laterals belong to the heavier ch-3/ch-6 builds) -> THREAD 1
--        Extras: none warranted (Torah-internalization carried by canon laterals)
--        Tanakh: ★ Deuteronomy 6:6-8 (these words... shall be in thine heart... bind them for a sign upon thine hand); ★ Proverbs 3:1 (forget not my law; but let thine heart keep my commandments) + 3:3 (write them upon the table of thine heart); ★ Jeremiah 31:33 (I will put my law in their inward parts, and write it in their hearts); ★ Deuteronomy 32:10 (he kept him as the apple of his eye) -> THREAD 1 (load-bearing: keep-the-commandments-and-LIVE / Torah internalized, the anti-antinomian hinge)
--   v.4-5 (Say unto wisdom, Thou art my sister... That they may keep thee from the strange woman)
--        NT:     none warranted distinct
--        Extras: none warranted distinct
--        Tanakh: ★ Proverbs 2:3-4 (cry after knowledge... seekest her as silver); Proverbs 9:1 (Wisdom hath builded her house) -> THREAD 2 (wisdom as kin, the guard against the strange woman; anticipates ch8/9)
--   v.6-23 (the window-scene seduction: the young man void of understanding... she caught him... With her much fair speech she caused him to yield... He goeth after her... as an ox goeth to the slaughter)
--        NT:     ★ 2 Peter 2:14 (eyes full of adultery... beguiling unstable souls); ★ James 1:14-15 (drawn away of his own lust... lust hath conceived, it bringeth forth sin... death) -> THREAD 3
--        Extras: ★ Sirach 9:3 (Meet not with an harlot, lest you fall into her snares); Sirach 19:2 (he that cleaveth to harlots will become impudent) -> THREAD 3
--        Tanakh: ★ Proverbs 2:16-17 (the strange woman... which forsaketh the guide of her youth); ★ Proverbs 5:3-4 (the lips of a strange woman drop as an honeycomb... her end is bitter as wormwood); ★ Ecclesiastes 7:26 (the woman, whose heart is snares and nets... the sinner shall be taken by her) -> THREAD 3 (the seduction as the way-that-seemeth-right unto death)
--   ★ v.27 (Her house is the way to hell, going down to the chambers of death) + v.26 (she hath cast down many wounded)
--        NT:     ★ Matthew 7:13 (wide is the gate, and broad is the way, that leadeth to destruction) -> THREAD 4
--        Extras: none warranted distinct (the Sheol-destination carried by the Proverbs laterals + Matthew)
--        Tanakh: ★ Proverbs 2:18 (her house inclineth unto death, and her paths unto the dead); Proverbs 5:5 (Her feet go down to death; her steps take hold on hell); Proverbs 9:18 (the dead are there; her guests are in the depths of hell) -> THREAD 4 (the destination figure: the harlot's house = the road to Sheol)
--   v.24-26 (Hearken unto me... Let not thine heart decline to her ways... For she hath cast down many wounded: yea, many strong men have been slain by her)
--        NT:     none warranted distinct (the Decalogue ground carried by the seventh-commandment Tanakh members)
--        Extras: none warranted distinct
--        Tanakh: ★★ Exodus 20:14 (Thou shalt not commit adultery); ★ Deuteronomy 5:18 (Neither shalt thou commit adultery) -> THREAD 5 (the seventh commandment standing behind the whole chapter — Torah, not abolished)
--   PRUDENTIAL / NARRATIVE detail, none warranted distinct (folded into the seduction-narrative prose, no separate thread): v.6-7 (the window/casement scene, the simple ones), v.8-9 (passing through the street in the twilight), v.10-12 (the attire of an harlot, loud and stubborn), v.13-20 (the impudent face, peace offerings, the decked bed, the goodman gone a journey), v.21-23 (the much fair speech, the ox to slaughter, the dart through the liver, the bird to the snare): the seduction tableau itself, framed in THREAD 3 prose.
--
-- Threads (slug — target libraries):
--   1. proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye — Tanakh (Deuteronomy, Proverbs, Jeremiah) [free] (★★ the anti-antinomian hinge: keep-the-commandments-and-LIVE; the Torah bound on the hand, written on the heart, kept as the apple of the eye)
--   2. proverbs-7-say-unto-wisdom-thou-art-my-sister — Tanakh (Proverbs) [free] (wisdom as kinswoman, the guard against the strange woman; anticipates ch8/9)
--   3. proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding — Tanakh (Proverbs, Ecclesiastes) + NT (2 Peter, James) + Extras (Sirach) [extras] (the seduction narrative; the lost-sheep youth drawn away of his own lust unto death)
--   4. proverbs-7-her-house-is-the-way-to-hell-going-down-to-the-chambers-of-death — Tanakh (Proverbs) + NT (Matthew) [free] (★ the destination figure: the harlot's house = the broad road to Sheol)
--   5. proverbs-7-the-seventh-commandment-thou-shalt-not-commit-adultery — Tanakh (Exodus, Deuteronomy) [free] (the Decalogue standing behind the whole chapter — Torah, not abolished)
--
-- Framing notes:
--   ★★ THE HINGE (THREAD 1): the chapter does not open on the harlot but on the Torah — *My son, keep my words, and lay up my commandments with thee. Keep my commandments, and live; and my law as the apple of thine eye. Bind them upon thy fingers, write them upon the table of thine heart* (7:1-3). Keep-the-commandments-and-LIVE is the anti-antinomian hinge: the deliverance from the strange woman (7:5) is the KEPT Torah, internalized. The binding *upon thy fingers* and writing *upon the table of thine heart* is the Shema's own command — *these words... shall be in thine heart... thou shalt bind them for a sign upon thine hand* (Deuteronomy 6:6-8) — and the very thing the new covenant promises, never abolishing but internalizing: *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33). *The apple of thine eye* is the Torah held as Yahuah held Yashar'el (Israel): *he kept him as the apple of his eye* (Deuteronomy 32:10). Proverbs 3 said the same twice over — *forget not my law* (3:1), *write them upon the table of thine heart* (3:3).
--   ★ WISDOM AS KIN (THREAD 2): *Say unto wisdom, Thou art my sister; and call understanding thy kinswoman: That they may keep thee from the strange woman* (7:4-5). Wisdom embraced as kin is the guard against the seductress — the same seeking Proverbs 2 commanded — *if thou criest after knowledge... If thou seekest her as silver* (2:3-4) — and the hostess of ch9 who builds her house against Dame Folly — *Wisdom hath builded her house* (9:1). The chapter sets wise-Lady against strange-woman, anticipating the great Wisdom hymn of ch8.
--   ★ THE SEDUCTION (THREAD 3): the window-scene tableau (7:6-23) shows *a young man void of understanding* (7:7) drawn step by step to ruin: *With her much fair speech she caused him to yield* (7:21); *He goeth after her straightway, as an ox goeth to the slaughter* (7:22). VICTIMS-NOT-ENEMIES: he is a lost sheep, not an enemy; the warning is for his deliverance. This is the strange woman of ch2 — *which flattereth with her words... her house inclineth unto death* (2:16-18) — and ch5 — *the lips of a strange woman drop as an honeycomb... But her end is bitter as wormwood* (5:3-4). Qoheleth knows her too — *more bitter than death the woman, whose heart is snares and nets* (Ecclesiastes 7:26). The NT names the mechanism whole: *every man is tempted, when he is drawn away of his own lust, and enticed. Then when lust hath conceived, it bringeth forth sin: and sin... bringeth forth death* (James 1:14-15) — the very ox-to-slaughter arc; and *Having eyes full of adultery... beguiling unstable souls* (2 Peter 2:14). The restored witness warns plainly — *Meet not with an harlot, lest you fall into her snares* (Sirach 9:3).
--   ★ THE DESTINATION (THREAD 4): *Her house is the way to hell, going down to the chambers of death* (7:27). The figure runs through the book — *her house inclineth unto death, and her paths unto the dead* (2:18); *Her feet go down to death; her steps take hold on hell* (5:5); Dame Folly's guests *are in the depths of hell* (9:18). Yahusha (Jesus) names the same broad road: *wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13). The harlot's house is one mouth of that broad way.
--   ★★ THE SEVENTH COMMANDMENT (THREAD 5): the whole chapter is an exposition of one word of the Decalogue — *Thou shalt not commit adultery* (Exodus 20:14); *Neither shalt thou commit adultery* (Deuteronomy 5:18). The strange-woman warnings are not new ethics but the Torah's own seventh commandment unfolded as a cautionary tale; *she hath cast down many wounded: yea, many strong men have been slain by her* (7:26) shows the cost of breaking it. Torah, not abolished — the commandment stands behind the warning.
--   EXTRAS: Sirach (Ecclesiasticus) double-written edition 'apocrypha' + book 'ecclesiasticus'. Clean witnesses pulled: 9:3 (Meet not with an harlot, lest you fall into her snares), 19:2 (he that cleaveth to harlots will become impudent). Sirach 26:9-12 weighed but not forced (the chosen two carry the snare/cleaving figure cleanest, matching the seduction-narrative thread).

CREATE TEMP VIEW _s304_pr07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Keep my commandments, and live; the Torah as the apple of thine eye (the hinge)
    ('canon','proverbs',7,2,'canon','deuteronomy',6,6,'free',
      E'*And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6). The charge to *Keep my commandments, and live; and my law as the apple of thine eye* (Proverbs 7:2) is the Shema''s own command brought into the heart: the words of Yahuah (LORD) *shall be in thine heart*. The proverb does not invent a piety apart from the Torah — it internalizes the very Torah Moses laid up in the heart.'),
    ('canon','proverbs',7,3,'canon','deuteronomy',6,8,'free',
      E'*And thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8). *Bind them upon thy fingers, write them upon the table of thine heart* (Proverbs 7:3) speaks the Shema verbatim — Moses said *bind them for a sign upon thine hand*. The wisdom-father is teaching his son the same Torah-binding Yahuah commanded all Yashar''el (Israel); the commandments are to be worn on the hand and graven on the heart.'),
    ('canon','proverbs',7,2,'canon','proverbs',3,1,'free',
      E'*My son, forget not my law; but let thine heart keep my commandments* (Proverbs 3:1). The same book sounds the charge of *Keep my commandments, and live; and my law as the apple of thine eye* (Proverbs 7:2) twice: *forget not my law; but let thine heart keep my commandments*. The kept Torah is the life of the son — and the guard, in ch7, against the strange woman.'),
    ('canon','proverbs',7,3,'canon','proverbs',3,3,'free',
      E'*Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart* (Proverbs 3:3). The very words of *write them upon the table of thine heart* (Proverbs 7:3) stand in Proverbs 3:3 — *write them upon the table of thine heart*. The Torah is not an external code to be kept at arm''s length but an inscription on the inward man; what is written on the heart cannot be flattered away by a stranger''s lips.'),
    ('canon','proverbs',7,3,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). To *write them upon the table of thine heart* (Proverbs 7:3) is the very promise of the new covenant: *I will put my law in their inward parts, and write it in their hearts*. The new covenant is not the Torah abolished but the Torah internalized — exactly what the wisdom-father presses upon his son.'),
    ('canon','proverbs',7,2,'canon','deuteronomy',32,10,'free',
      E'*He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10). When the son is told to hold *my law as the apple of thine eye* (Proverbs 7:2), it is to hold the Torah as Yahuah (LORD) held Yashar''el (Israel) — *he kept him as the apple of his eye*. The Torah is to be guarded as the most precious and tender thing, the way Yahuah guarded His people in the wilderness.'),

    -- THREAD 2: Say unto wisdom, Thou art my sister (wisdom as kin, the guard)
    ('canon','proverbs',7,4,'canon','proverbs',2,3,'free',
      E'*Yea, if thou criest after knowledge, and liftest up thy voice for understanding* (Proverbs 2:3). To *Say unto wisdom, Thou art my sister; and call understanding thy kinswoman* (Proverbs 7:4) is the embrace Proverbs 2 commanded: *if thou criest after knowledge, and liftest up thy voice for understanding*. Wisdom claimed as kin is wisdom sought with the whole voice; the one who calls understanding his kinswoman is kept from the stranger.'),
    ('canon','proverbs',7,5,'canon','proverbs',2,16,'free',
      E'*To deliver thee from the strange woman, even from the stranger which flattereth with her words* (Proverbs 2:16). The very purpose of claiming wisdom as kin — *That they may keep thee from the strange woman, from the stranger which flattereth with her words* (Proverbs 7:5) — is word-for-word the deliverance of Proverbs 2:16: *to deliver thee from the strange woman... which flattereth with her words*. Wisdom embraced is the guard; the strange woman''s flattery is the danger both chapters name.'),
    ('canon','proverbs',7,4,'canon','proverbs',9,1,'free',
      E'*Wisdom hath builded her house, she hath hewn out her seven pillars* (Proverbs 9:1). The wisdom called *my sister* (Proverbs 7:4) is the Lady who, two chapters on, *hath builded her house* (Proverbs 9:1) and sets her table against Dame Folly. The chapter pairs wise-Lady against strange-woman; to call understanding thy kinswoman is to sit at Wisdom''s table, not Folly''s.')
,
    -- THREAD 3: The strange woman and the young man void of understanding (the seduction)
    ('canon','proverbs',7,7,'canon','proverbs',2,17,'free',
      E'*Which forsaketh the guide of her youth, and forgetteth the covenant of her Elohim (God)* (Proverbs 2:17). The harlot who meets *a young man void of understanding* (Proverbs 7:7) is the same strange woman of ch2, one *which forsaketh the guide of her youth, and forgetteth the covenant of her Elohim (God)*. Her seduction is covenant-breaking dressed as love; the youth, drawn in, is a victim of a snare she set first against her own covenant.'),
    ('canon','proverbs',7,21,'canon','proverbs',5,3,'free',
      E'*For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil* (Proverbs 5:3). *With her much fair speech she caused him to yield, with the flattering of her lips she forced him* (Proverbs 7:21) is the honeycomb-lips of Proverbs 5:3 at work: *the lips of a strange woman drop as an honeycomb*. The sweetness is the bait; the much fair speech is the smoothness that forces the unguarded heart.'),
    ('canon','proverbs',7,22,'canon','proverbs',5,4,'free',
      E'*But her end is bitter as wormwood, sharp as a twoedged sword* (Proverbs 5:4). The youth who *goeth after her straightway, as an ox goeth to the slaughter* (Proverbs 7:22) walks toward the end Proverbs 5:4 named: *her end is bitter as wormwood, sharp as a twoedged sword*. The honeycomb of her lips drops to a sword; the ox does not see the slaughter until the dart strikes the liver.'),
    ('canon','proverbs',7,23,'canon','ecclesiastes',7,26,'free',
      E'*And I find more bitter than death the woman, whose heart is snares and nets, and her hands as bands: whoso pleaseth Elohim (God) shall escape from her; but the sinner shall be taken by her* (Ecclesiastes 7:26). The snare into which the youth rushes — *as a bird hasteth to the snare, and knoweth not that it is for his life* (Proverbs 7:23) — is the very woman *whose heart is snares and nets* (Ecclesiastes 7:26). Qoheleth says the deliverance is the same the wisdom-father teaches: the one who pleases Elohim (God) — who keeps the commandments — escapes; the sinner is taken.'),
    ('canon','proverbs',7,22,'canon','james',1,14,'free',
      E'*But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14). The ox led to slaughter — *He goeth after her straightway, as an ox goeth to the slaughter* (Proverbs 7:22) — is Ya''aqob''s (James''s) every man *drawn away of his own lust, and enticed*. The strange woman''s fair speech works on a lust already in the youth; he is enticed, drawn, and led.'),
    ('canon','proverbs',7,23,'canon','james',1,15,'free',
      E'*Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:15). The dart through the liver, the snare that is *for his life* (Proverbs 7:23), is the end Ya''aqob (James) traces: *sin, when it is finished, bringeth forth death*. The whole window-scene is this one sentence acted out — lust conceives, brings forth sin, and the sin is finished in death.'),
    ('canon','proverbs',7,21,'canon','2-peter',2,14,'free',
      E'*Having eyes full of adultery, and that cannot cease from sin; beguiling unstable souls: an heart they have exercised with covetous practices; cursed children* (2 Peter 2:14). The flattery that *caused him to yield* (Proverbs 7:21) is the beguiling Kepha (Peter) names: those *having eyes full of adultery... beguiling unstable souls*. The young man void of understanding is exactly the unstable soul; the harlot is the beguiler whose eyes are full of adultery.'),
    ('canon','proverbs',7,7,'apocrypha','ecclesiasticus',9,3,'extras',
      E'*Meet not with an harlot, lest you fall into her snares* (Sirach 9:3). The restored witness gives the plain counsel the youth of Proverbs 7:7 did not heed: *Meet not with an harlot, lest you fall into her snares*. The young man *void of understanding* went the way to her house and fell into the very snare Sirach warns against.'),
    ('canon','proverbs',7,22,'apocrypha','ecclesiasticus',19,2,'extras',
      E'*Wine and women will make men of understanding to fall away: and he that cleaveth to harlots will become impudent* (Sirach 19:2). The ox-to-slaughter of Proverbs 7:22 is the falling-away Sirach names: *he that cleaveth to harlots will become impudent*. Even *men of understanding* are made to fall; how much more the young man void of understanding who goeth after her straightway.')
,
    -- THREAD 4: Her house is the way to hell (the destination figure)
    ('canon','proverbs',7,27,'canon','proverbs',2,18,'free',
      E'*For her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18). *Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27) is the verdict of Proverbs 2:18 sharpened: *her house inclineth unto death, and her paths unto the dead*. The strange woman''s door is the same door in both chapters — it opens onto Sheol.'),
    ('canon','proverbs',7,27,'canon','proverbs',5,5,'free',
      E'*Her feet go down to death; her steps take hold on hell* (Proverbs 5:5). The chambers of death of *Her house is the way to hell* (Proverbs 7:27) are where Proverbs 5:5 says her every step is going: *Her feet go down to death; her steps take hold on hell*. To follow her steps is to be carried down the way she herself walks.'),
    ('canon','proverbs',7,27,'canon','proverbs',9,18,'free',
      E'*But he knoweth not that the dead are there; and that her guests are in the depths of hell* (Proverbs 9:18). The going *down to the chambers of death* (Proverbs 7:27) is the table of Dame Folly in ch9: *the dead are there; and... her guests are in the depths of hell*. The harlot''s house and Folly''s house are one house; the guests do not know, until too late, where the table is set.'),
    ('canon','proverbs',7,27,'canon','matthew',7,13,'free',
      E'*Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13). The way of *Her house is the way to hell* (Proverbs 7:27) is one mouth of the broad way Yahusha (Jesus) names: *wide is the gate, and broad is the way, that leadeth to destruction*. The strange woman''s door is broad and easy; the strait gate is the kept Torah of 7:2 — and the many who go in at the broad way are the strong men she has slain.')
,
    -- THREAD 5: The seventh commandment standing behind the whole chapter
    ('canon','proverbs',7,25,'canon','exodus',20,14,'free',
      E'*Thou shalt not commit adultery* (Exodus 20:14). The charge *Let not thine heart decline to her ways, go not astray in her paths* (Proverbs 7:25) is one word of the Decalogue unfolded as a warning: *Thou shalt not commit adultery*. The whole chapter is an exposition of the seventh commandment — the strange-woman warning is not a new ethic but the Torah''s own word made vivid; the commandment stands behind it, not abolished.'),
    ('canon','proverbs',7,26,'canon','deuteronomy',5,18,'free',
      E'*Neither shalt thou commit adultery* (Deuteronomy 5:18). *For she hath cast down many wounded: yea, many strong men have been slain by her* (Proverbs 7:26) shows the cost of breaking the word repeated at Horeb: *Neither shalt thou commit adultery*. The many wounded and slain are the price of the commandment despised; the Torah''s word is the wall that would have kept them, and they went over it to their death.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye',
       E'Keep my commandments, and live — the Torah as the apple of thine eye',
       E'The strange-woman chapter does not open on the harlot but on the Torah, and that is the whole frame: *My son, keep my words, and lay up my commandments with thee. Keep my commandments, and live; and my law as the apple of thine eye. Bind them upon thy fingers, write them upon the table of thine heart* (Proverbs 7:1-3). Keep-the-commandments-and-LIVE is the anti-antinomian hinge of the passage — the deliverance from the seductress (7:5) is the KEPT Torah, internalized so deeply it cannot be flattered away. The binding *upon thy fingers* and writing *upon the table of thine heart* is the Shema''s own command: *And these words, which I command thee this day, shall be in thine heart... thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:6-8). The wisdom-father teaches his son nothing other than the Torah Moses laid up in the heart. And this internalizing is the very promise of the new covenant — not Torah abolished but Torah written within: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). To hold *my law as the apple of thine eye* is to hold it as Yahuah (LORD) held Yashar''el (Israel) in the wilderness: *he kept him as the apple of his eye* (Deuteronomy 32:10). The same book sounded the charge already, twice over — *forget not my law; but let thine heart keep my commandments* (3:1); *write them upon the table of thine heart* (3:3). The kept Torah, graven on the heart, is the son''s life and his guard.',
       sv.verse_id, ev.verse_id, 'free', 28150
  FROM _s304_pr07_lookup sv, _s304_pr07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=7 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-7-say-unto-wisdom-thou-art-my-sister',
       E'Say unto wisdom, Thou art my sister — the guard against the strange woman',
       E'Between the Torah-charge and the seduction the father sets the safeguard: *Say unto wisdom, Thou art my sister; and call understanding thy kinswoman: That they may keep thee from the strange woman, from the stranger which flattereth with her words* (Proverbs 7:4-5). Wisdom embraced as kin is the wall against the seductress — and the purpose-clause is word-for-word the deliverance of ch2: *To deliver thee from the strange woman, even from the stranger which flattereth with her words* (Proverbs 2:16). To claim wisdom as sister is to seek her as ch2 commanded — *if thou criest after knowledge, and liftest up thy voice for understanding* (2:3) — with the whole voice, not a casual nod. And the wisdom called *my sister* here is the Lady who, two chapters on, *hath builded her house, she hath hewn out her seven pillars* (9:1) and spreads her table against Dame Folly. The chapter sets wise-Lady against strange-woman, kinswoman against stranger; the one who sits at Wisdom''s table is kept from the harlot''s door. This is the bridge into the great Wisdom hymn of ch8.',
       sv.verse_id, ev.verse_id, 'free', 28153
  FROM _s304_pr07_lookup sv, _s304_pr07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding',
       E'The strange woman and the young man void of understanding',
       E'The heart of the chapter is a single window-scene tableau (Proverbs 7:6-23): the father looks out his casement and watches *a young man void of understanding* (7:7) pass through the street near her corner in the twilight, met by *a woman with the attire of an harlot, and subtil of heart* (7:10), until *With her much fair speech she caused him to yield, with the flattering of her lips she forced him* (7:21), and *He goeth after her straightway, as an ox goeth to the slaughter... as a bird hasteth to the snare, and knoweth not that it is for his life* (7:22-23). VICTIMS-NOT-ENEMIES: the youth is a lost sheep, not an enemy; the whole scene is told for his deliverance, a warning held up so the next simple one will not walk that street. The seductress is the strange woman of ch2 — *which forsaketh the guide of her youth, and forgetteth the covenant of her Elohim (God)* (2:17) — and of ch5, whose lips drop as a honeycomb to a bitter end: *the lips of a strange woman drop as an honeycomb... But her end is bitter as wormwood, sharp as a twoedged sword* (5:3-4). Qoheleth weighed her too: *more bitter than death the woman, whose heart is snares and nets... whoso pleaseth Elohim (God) shall escape from her; but the sinner shall be taken by her* (Ecclesiastes 7:26) — and names the same escape the wisdom-father teaches: the one who keeps the commandments gets free. The New Testament traces the exact mechanism: *every man is tempted, when he is drawn away of his own lust, and enticed. Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:14-15) — the ox-to-slaughter arc in one sentence; and Kepha (Peter) names the beguiler — *Having eyes full of adultery... beguiling unstable souls* (2 Peter 2:14), the unstable soul being just this young man void of understanding. The restored witness gives the plain counsel he did not heed: *Meet not with an harlot, lest you fall into her snares* (Sirach 9:3); *he that cleaveth to harlots will become impudent* (Sirach 19:2). From Torah-wisdom to apostle to the restored witnesses, the testimony is one: the lust within is drawn out by the flattery without, and the way that seemeth right ends in the chambers of death.',
       sv.verse_id, ev.verse_id, 'extras', 28156
  FROM _s304_pr07_lookup sv, _s304_pr07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-7-her-house-is-the-way-to-hell-going-down-to-the-chambers-of-death',
       E'Her house is the way to hell — going down to the chambers of death',
       E'The chapter closes on the destination, the figure the whole warning has been driving toward: *Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27). The seductress'' door is not the gate to the love she promised but the mouth of Sheol — and the book says so again and again. In ch2: *For her house inclineth unto death, and her paths unto the dead* (2:18). In ch5: *Her feet go down to death; her steps take hold on hell* (5:5) — to follow her steps is to be carried down the road she herself walks. In ch9, Dame Folly''s table is the same house: *he knoweth not that the dead are there; and that her guests are in the depths of hell* (9:18) — the guests do not know, until too late, where they have been seated. And Yahusha (Jesus) names the broad road of which the harlot''s house is one mouth: *wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13). Her door is broad and easy; the strait gate is the kept Torah of 7:2. The *many strong men* she has slain (7:26) are the many who go in at the broad way.',
       sv.verse_id, ev.verse_id, 'free', 28159
  FROM _s304_pr07_lookup sv, _s304_pr07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-7-the-seventh-commandment-thou-shalt-not-commit-adultery',
       E'The seventh commandment — Thou shalt not commit adultery',
       E'Behind the whole window-scene stands one word of the Decalogue, and the chapter is its exposition: *Thou shalt not commit adultery* (Exodus 20:14), the word repeated at Horeb — *Neither shalt thou commit adultery* (Deuteronomy 5:18). The strange-woman warning is not a new ethic improvised by a wisdom-teacher but the Torah''s own seventh commandment made vivid, dramatized in a single seduction so the simple one will see where it ends. The closing charge — *Let not thine heart decline to her ways, go not astray in her paths* (7:25) — is that commandment turned toward the heart, before the foot ever moves; and the toll — *For she hath cast down many wounded: yea, many strong men have been slain by her* (7:26) — is the cost of the commandment despised. The Torah''s word is the wall that would have kept the many wounded; they went over it to their death. Torah, not abolished: the commandment is the ground the whole chapter is built on.',
       sv.verse_id, ev.verse_id, 'free', 28162
  FROM _s304_pr07_lookup sv, _s304_pr07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6) — the keep-my-commandments of 7:2 is the Shema brought into the heart.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — *bind them upon thy fingers* of 7:3 is the Shema verbatim; the Torah worn on the hand.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*My son, forget not my law; but let thine heart keep my commandments* (Proverbs 3:1) — the same book sounds the keep-and-live charge of 7:2 already.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*write them upon the table of thine heart* (Proverbs 3:3) — the very words of 7:3; the Torah graven on the inward man.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — to write the Torah on the heart (7:3) is the new covenant itself; Torah internalized, not abolished.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he kept him as the apple of his eye* (Deuteronomy 32:10) — to hold the law as the apple of thine eye (7:2) is to hold it as Yahuah held Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-keep-my-commandments-and-live-the-torah-as-the-apple-of-thine-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if thou criest after knowledge, and liftest up thy voice for understanding* (Proverbs 2:3) — to call wisdom thy sister (7:4) is to seek her with the whole voice.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-say-unto-wisdom-thou-art-my-sister'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To deliver thee from the strange woman... which flattereth with her words* (Proverbs 2:16) — the purpose-clause of 7:5 word-for-word; wisdom embraced is the guard.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-say-unto-wisdom-thou-art-my-sister'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Wisdom hath builded her house, she hath hewn out her seven pillars* (Proverbs 9:1) — the sister-wisdom of 7:4 is the Lady whose table stands against Dame Folly.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-say-unto-wisdom-thou-art-my-sister'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Which forsaketh the guide of her youth, and forgetteth the covenant of her Elohim (God)* (Proverbs 2:17) — the harlot who meets the youth (7:7) is the covenant-breaking strange woman of ch2.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the lips of a strange woman drop as an honeycomb* (Proverbs 5:3) — the much fair speech that caused him to yield (7:21) is the honeycomb-lips at work.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*her end is bitter as wormwood, sharp as a twoedged sword* (Proverbs 5:4) — the ox-to-slaughter of 7:22 walks toward the end ch5 named.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the woman, whose heart is snares and nets... the sinner shall be taken by her* (Ecclesiastes 7:26) — the snare for his life (7:23); the one who pleases Elohim escapes, the sinner is taken.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14) — the ox led to slaughter (7:22) is the man drawn away of his own lust.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*sin, when it is finished, bringeth forth death* (James 1:15) — the dart through the liver (7:23) is lust conceived and finished in death.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Having eyes full of adultery... beguiling unstable souls* (2 Peter 2:14) — the flattery that caused him to yield (7:21) is Kepha''s beguiling; the youth is the unstable soul.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Meet not with an harlot, lest you fall into her snares* (Sirach 9:3) — the plain counsel the youth of 7:7 did not heed.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*he that cleaveth to harlots will become impudent* (Sirach 19:2) — even men of understanding fall away; how much more the young man void of understanding (7:22).'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=19 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-strange-woman-and-the-young-man-void-of-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18) — the way-to-hell of 7:27 is the verdict of ch2; the same door in both chapters.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-her-house-is-the-way-to-hell-going-down-to-the-chambers-of-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Her feet go down to death; her steps take hold on hell* (Proverbs 5:5) — to follow her steps (7:27) is to be carried down the road she herself walks.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-her-house-is-the-way-to-hell-going-down-to-the-chambers-of-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the dead are there; and... her guests are in the depths of hell* (Proverbs 9:18) — the chambers of death (7:27) are Dame Folly''s table; the guests do not know where they sit.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-her-house-is-the-way-to-hell-going-down-to-the-chambers-of-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*wide is the gate, and broad is the way, that leadeth to destruction* (Matthew 7:13) — the harlot''s house (7:27) is one mouth of the broad way; the strait gate is the kept Torah of 7:2.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-her-house-is-the-way-to-hell-going-down-to-the-chambers-of-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not commit adultery* (Exodus 20:14) — the charge of 7:25 is the seventh commandment unfolded; the whole chapter is its exposition.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-seventh-commandment-thou-shalt-not-commit-adultery'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Neither shalt thou commit adultery* (Deuteronomy 5:18) — the many wounded and slain of 7:26 are the cost of the word repeated at Horeb, despised.'
  FROM cross_reference_threads t
  JOIN _s304_pr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s304_pr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-7-the-seventh-commandment-thou-shalt-not-commit-adultery'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
