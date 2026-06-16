-- ----- fragment: minion_matthew_07.sql (S260 Matthew depth) -----
-- Matthew 7 full-library cross-reference threads (NT DEPTH pass)
-- 8 threads, band 11180 step +3

-- ============================================================
-- 3a. Temp view
-- ============================================================
CREATE TEMP VIEW _mt07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. cross_references rows
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- (a) 7:1-5 judge not / mote & beam
  ('canon','matthew',7,1,'canon','leviticus',19,15, 'free', E'*Ye shall do no unrighteousness in judgment... but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). The Torah never bans judging; it commands righteous judgment without respect of persons.'),
  ('canon','matthew',7,1,'canon','proverbs',24,23, 'free', E'*These things also belong to the wise. It is not good to have respect of persons in judgment* (Proverbs 24:23). The wisdom root of the same warning.'),
  ('canon','matthew',7,2,'canon','psalms',18,25, 'free', E'*With the merciful thou wilt shew thyself merciful; with an upright man thou wilt shew thyself upright* (Psalm 18:25). The measure ye mete is the measure measured back.'),
  ('canon','matthew',7,2,'canon','psalms',18,26, 'free', E'*With the pure thou wilt shew thyself pure; and with the froward thou wilt shew thyself froward* (Psalm 18:26). The mirror-law of judgment, spoken by David long before.'),
  ('canon','matthew',7,5,'canon','2-samuel',12,7, 'free', E'*And Nathan said to David, Thou art the man* (2 Samuel 12:7). David passed swift sentence on the rich man of the parable — and the beam was in his own eye.'),
  ('canon','matthew',7,1,'canon','leviticus',19,17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). Rebuke is commanded; the beam must come out first.'),

  -- (b) 7:6 pearls before swine
  ('canon','matthew',7,6,'canon','proverbs',9,7, 'free', E'*He that reproveth a scorner getteth to himself shame: and he that rebuketh a wicked man getteth himself a blot* (Proverbs 9:7). The holy thing flung at the scorner turns to rending.'),
  ('canon','matthew',7,6,'canon','proverbs',9,8, 'free', E'*Reprove not a scorner, lest he hate thee: rebuke a wise man, and he will love thee* (Proverbs 9:8). Discern the hearer — give the wise man what the scorner will trample.'),
  ('canon','matthew',7,6,'canon','proverbs',23,9, 'free', E'*Speak not in the ears of a fool: for he will despise the wisdom of thy words* (Proverbs 23:9). The pearl is wasted on the despiser.'),

  -- (c) 7:7-11 ask seek knock / good gifts
  ('canon','matthew',7,7,'canon','jeremiah',29,13, 'free', E'*And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). The promise to the scattered exiles: seek and ye shall find.'),
  ('canon','matthew',7,7,'canon','jeremiah',29,12, 'free', E'*Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you* (Jeremiah 29:12). Ask, and it shall be given — the Father hearkens.'),
  ('canon','matthew',7,7,'canon','isaiah',55,6, 'free', E'*Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The open door of Isaiah''s gospel call.'),
  ('canon','matthew',7,7,'canon','proverbs',8,17, 'free', E'*I love them that love me; and those that seek me early shall find me* (Proverbs 8:17). Wisdom''s own promise to the seeker.'),
  ('canon','matthew',7,11,'canon','psalms',34,10, 'free', E'*The young lions do lack, and suffer hunger: but they that seek Yahuah (LORD) shall not want any good thing* (Psalm 34:10). The Father gives good things to them that ask him.'),
  ('canon','matthew',7,7,'apocrypha','the-wisdom-of-solomon',6,12, 'extras', E'*Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her* (Wisdom of Solomon 6:12). Found of such as seek her — the very rhythm of ask-seek-knock.'),
  ('canon','matthew',7,7,'apocrypha','the-wisdom-of-solomon',6,14, 'extras', E'*Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors* (Wisdom of Solomon 6:14). She is found waiting at the door for the one who knocks.'),

  -- (d) 7:12 the golden rule — law and prophets
  ('canon','matthew',7,12,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge... but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The golden rule is Torah summed, not Torah replaced.'),
  ('canon','matthew',7,12,'canon','leviticus',19,34, 'free', E'*But the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself* (Leviticus 19:34). The same love commanded toward the grafted-in stranger.'),
  ('canon','matthew',7,12,'apocrypha','tobit',4,15, 'extras', E'*Do that to no man which you hatest* (Tobit 4:15). The negative form of the golden rule, already in the mouth of righteous Tobit centuries before — the library is one.'),

  -- (e) 7:13-14 strait gate / two ways
  ('canon','matthew',7,13,'canon','deuteronomy',30,15, 'free', E'*See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15). Moses set the Two Ways before Yashar''el (Israel) first.'),
  ('canon','matthew',7,13,'canon','deuteronomy',30,19, 'free', E'*I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). Choose life — the strait gate is the chosen way.'),
  ('canon','matthew',7,13,'canon','jeremiah',21,8, 'free', E'*Behold, I set before you the way of life, and the way of death* (Jeremiah 21:8). The prophet repeats Moses'' two ways.'),
  ('canon','matthew',7,14,'canon','psalms',1,6, 'free', E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). Two ways, two ends — the whole Psalter opens here.'),
  ('canon','matthew',7,13,'canon','proverbs',14,12, 'free', E'*There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). The broad way looks right and leadeth to destruction.'),
  ('canon','matthew',7,13,'apocrypha','ecclesiasticus',15,17, 'extras', E'*Before man is life and death; and whether him liketh shall be given him* (Sirach 15:17). Ben Sira sets the same choice before every man.'),

  -- (f) 7:15-20 false prophets / by their fruits
  ('canon','matthew',7,15,'canon','deuteronomy',13,3, 'free', E'*Thou shalt not hearken unto the words of that prophet... for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem with all your heart* (Deuteronomy 13:3). The Torah''s own test of the false prophet.'),
  ('canon','matthew',7,15,'canon','deuteronomy',13,5, 'free', E'*And that prophet... shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)* (Deuteronomy 13:5). The wolf in sheep''s clothing draws away from the commandment.'),
  ('canon','matthew',7,15,'canon','deuteronomy',18,22, 'free', E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass... the prophet hath spoken it presumptuously* (Deuteronomy 18:22). The fruit-test of the word.'),
  ('canon','matthew',7,15,'canon','jeremiah',23,16, 'free', E'*Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart* (Jeremiah 23:16). The false prophets of Jeremiah''s day, by their fruits known.'),
  ('canon','matthew',7,15,'canon','ezekiel',22,27, 'free', E'*Her princes in the midst thereof are like wolves ravening the prey, to shed blood, and to destroy souls, to get dishonest gain* (Ezekiel 22:27). The ravening wolves named by Ezekiel.'),
  ('canon','matthew',7,16,'canon','isaiah',5,7, 'free', E'*For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)... and he looked for judgment, but behold oppression* (Isaiah 5:7). The vineyard that brought forth wild grapes — known by its fruit.'),
  ('canon','matthew',7,16,'canon','luke',6,44, 'free', E'*For every tree is known by his own fruit. For of thorns men do not gather figs, nor of a bramble bush gather they grapes* (Luke 6:44). The same word in Luke''s plain.'),

  -- (g) 7:21-23 not every one that saith Lord Lord
  ('canon','matthew',7,23,'canon','psalms',6,8, 'free', E'*Depart from me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (Psalm 6:8). The very sentence Yahusha (Jesus) pronounces — depart from me, ye that work iniquity.'),
  ('canon','matthew',7,21,'canon','hosea',8,2, 'free', E'*Yashar''el (Israel) shall cry unto me, My Elohim (God), we know thee* (Hosea 8:2). They cry Lord, Lord, and claim to know him.'),
  ('canon','matthew',7,21,'canon','hosea',8,3, 'free', E'*Yashar''el (Israel) hath cast off the thing that is good: the enemy shall pursue him* (Hosea 8:3). To cast off the good — the commandment — is to be unknown of him, though the mouth confess.'),

  -- (h) 7:24-27 wise & foolish builders / the rock
  ('canon','matthew',7,24,'canon','isaiah',28,16, 'free', E'*Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The sure foundation on which the wise man builds.'),
  ('canon','matthew',7,24,'canon','proverbs',10,25, 'free', E'*As the whirlwind passeth, so is the wicked no more: but the righteous is an everlasting foundation* (Proverbs 10:25). The storm that sweeps the wicked cannot move the founded house.'),
  ('canon','matthew',7,26,'canon','ezekiel',13,11, 'free', E'*Say unto them which daub it with untempered morter, that it shall fall: there shall be an overflowing shower... and a stormy wind shall rend it* (Ezekiel 13:11). The untempered wall is the house on the sand.'),
  ('canon','matthew',7,26,'canon','ezekiel',13,14, 'free', E'*So will I break down the wall that ye have daubed with untempered morter... and it shall fall, and ye shall be consumed in the midst thereof* (Ezekiel 13:14). Great was the fall of it.'),
  ('canon','matthew',7,24,'canon','luke',6,48, 'free', E'*He is like a man which built an house, and digged deep, and laid the foundation on a rock: and when the flood arose, the stream beat vehemently upon that house, and could not shake it* (Luke 6:48). The same parable in Luke''s telling.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24',
       E'Judge not, that ye be not judged — the mote and the beam (Leviticus 19; Proverbs 24; 2 Samuel 12)',
       E'*Judge not, that ye be not judged* (Matthew 7:1) is no ban on discernment — Yahusha (Jesus) is forbidding the hypocrite''s crooked scale, not the righteous eye. The Torah commands judgment: *Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15), and the wise echo it — *It is not good to have respect of persons in judgment* (Proverbs 24:23). The measure is a mirror: *With the merciful thou wilt shew thyself merciful; with an upright man thou wilt shew thyself upright* (Psalm 18:25); *With the pure thou wilt shew thyself pure; and with the froward thou wilt shew thyself froward* (Psalm 18:26) — *with what measure ye mete, it shall be measured to you again* (Matthew 7:2). And the great living parable of the beam: David thundered sentence on the rich man, *the man that hath done this thing shall surely die* — and Nathan answered, *Thou art the man* (2 Samuel 12:7). First cast out thine own beam. Even then the brother is not abandoned: *thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The commandment stands; only the hypocrisy is cast out.',
       sv.verse_id, ev.verse_id, 'free', 11180
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23',
       E'Give not that which is holy unto the dogs — pearls before swine (Proverbs 9; Proverbs 23)',
       E'*Give not that which is holy unto the dogs, neither cast ye your pearls before swine, lest they trample them under their feet, and turn again and rend you* (Matthew 7:6). This is the wisdom of discernment — the same lesson the Proverbs press hard. *He that reproveth a scorner getteth to himself shame: and he that rebuketh a wicked man getteth himself a blot* (Proverbs 9:7); *Reprove not a scorner, lest he hate thee: rebuke a wise man, and he will love thee* (Proverbs 9:8). Know the hearer before you spend the holy thing on him. And again: *Speak not in the ears of a fool: for he will despise the wisdom of thy words* (Proverbs 23:9). The pearl is precious; do not waste it on the one who will only trample and rend. Yahusha (Jesus) is teaching the same shepherd-prudence the wisdom books taught Yashar''el (Israel) long before.',
       sv.verse_id, sv.verse_id, 'free', 11183
  FROM _mt07_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6',
       E'Ask, and it shall be given — seek and find, knock and it shall be opened (Jeremiah 29; Isaiah 55; Wisdom 6)',
       E'*Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7) — this is not new; it is the ancient promise to a seeking people. To the exiles Yahuah (Yahuah) said, *Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you* (Jeremiah 29:12), *And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). The prophet''s open door: *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). Wisdom''s own pledge: *I love them that love me; and those that seek me early shall find me* (Proverbs 8:17). The Father withholds no good thing from the seeker: *they that seek Yahuah (LORD) shall not want any good thing* (Psalm 34:10) — *how much more shall your Father which is in heaven give good things to them that ask him* (Matthew 7:11). The Wisdom of Solomon sings the same: *she is easily seen of them that love her, and found of such as seek her* (Wisdom of Solomon 6:12); *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors* (Wisdom of Solomon 6:14) — found waiting at the door for the one who knocks. The Formed Son teaches us to address THE FATHER, who is the giver of every good gift.',
       sv.verse_id, ev.verse_id, 'extras', 11186
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4',
       E'The golden rule — for this is the law and the prophets (Leviticus 19; Tobit 4)',
       E'*Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets* (Matthew 7:12). Hear the seal he sets on it — *this IS the law and the prophets.* Yahusha (Jesus) does not abolish the Torah here; he SUMS it. The golden rule is the heart-distillation of the commandment given through Moses: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18), a love that reaches the grafted-in stranger too — *the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself* (Leviticus 19:34). And the witness of the library reaches back further still: righteous Tobit charged his son, *Do that to no man which you hatest* (Tobit 4:15) — the negative form of the very same rule, generations before the Sermon on the Mount. One law, one love, one library. Messiah is its summing-up, never its end.',
       sv.verse_id, sv.verse_id, 'extras', 11189
  FROM _mt07_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1',
       E'Enter ye in at the strait gate — the Two Ways (Deuteronomy 30; Jeremiah 21; Psalm 1; Sirach 15)',
       E'*Enter ye in at the strait gate... strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:13-14). This is the oldest sermon in Yashar''el (Israel) — the Two Ways. Moses set it before the people on the plains of Moab: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The prophet says it plain: *Behold, I set before you the way of life, and the way of death* (Jeremiah 21:8). The Psalter opens on it: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). And the warning against the broad way that only seems right: *There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). Ben Sira sets the same choice before every soul: *Before man is life and death; and whether him liketh shall be given him* (Sirach 15:17). The strait gate is the chosen way of the commandment; the broad way is the way of him who casts it off.',
       sv.verse_id, ev.verse_id, 'extras', 11192
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5',
       E'Beware of false prophets — by their fruits ye shall know them (Deuteronomy 13 & 18; Jeremiah 23; Ezekiel 22; Isaiah 5)',
       E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves. Ye shall know them by their fruits* (Matthew 7:15-16). The Torah armed Yashar''el (Israel) with this test long ago. The fruit-test of the heart: the lying prophet may even give a sign, *Thou shalt not hearken unto the words of that prophet... for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem with all your heart* (Deuteronomy 13:3); for *he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)* (Deuteronomy 13:5) — the wolf draws you off the commandment. And the fruit-test of the word: *if the thing follow not, nor come to pass... the prophet hath spoken it presumptuously* (Deuteronomy 18:22). The prophets named the same wolves: *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16); *Her princes in the midst thereof are like wolves ravening the prey... to get dishonest gain* (Ezekiel 22:27). And the vineyard that bore wild grapes is Yashar''el judged by her fruit: *the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)... and he looked for judgment, but behold oppression* (Isaiah 5:7). Yahusha (Jesus) gathers it all and says it twice over in Luke''s plain: *every tree is known by his own fruit. For of thorns men do not gather figs, nor of a bramble bush gather they grapes* (Luke 6:44).',
       sv.verse_id, ev.verse_id, 'free', 11195
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8',
       E'Not every one that saith Lord, Lord — but he that DOETH the will (Psalm 6; Hosea 8)',
       E'*Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven* (Matthew 7:21). Here is the anti-antinomian seal of the whole Sermon: the confession of the lips is not the entrance — DOING the Father''s will is, and the Father''s will is his commandment. And mark the sentence Yahusha (Jesus) pronounces on the workers of lawlessness, *depart from me, ye that work iniquity* (Matthew 7:23) — it is David''s own word, *Depart from me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (Psalm 6:8). Hosea showed the same hollow cry centuries before: *Yashar''el (Israel) shall cry unto me, My Elohim (God), we know thee* (Hosea 8:2) — yet *Yashar''el (Israel) hath cast off the thing that is good: the enemy shall pursue him* (Hosea 8:3). To cry "we know thee" while casting off the good — the Torah — is to be answered, *I never knew you.* The doing is the knowing.',
       sv.verse_id, ev.verse_id, 'free', 11198
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13',
       E'The wise and foolish builders — built upon a rock (Isaiah 28; Proverbs 10; Ezekiel 13; Luke 6)',
       E'*Whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24) — and the doer''s house *fell not: for it was founded upon a rock* (Matthew 7:25), while the house upon the sand fell, *and great was the fall of it* (Matthew 7:27). The sure foundation was laid in Zion long before: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The wisdom root: *As the whirlwind passeth, so is the wicked no more: but the righteous is an everlasting foundation* (Proverbs 10:25). And the house on the sand is Ezekiel''s untempered wall — they built and *daubed it with untempered morter*, but *there shall be an overflowing shower... and a stormy wind shall rend it* (Ezekiel 13:11); *So will I break down the wall that ye have daubed... and it shall fall, and ye shall be consumed in the midst thereof* (Ezekiel 13:14). Hearing without doing is daubing with untempered morter; the rock is the heard word DONE. Luke tells the same: *He is like a man which built an house, and digged deep, and laid the foundation on a rock... and could not shake it* (Luke 6:48).',
       sv.verse_id, ev.verse_id, 'free', 11201
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. thread_members
-- ============================================================
-- (a) judge not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:15 — *but in righteousness shalt thou judge thy neighbour.* Torah commands righteous judgment.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:23 — *It is not good to have respect of persons in judgment.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 18:25 — *with an upright man thou wilt shew thyself upright* — the measure is a mirror.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 18:26 — *with the froward thou wilt shew thyself froward* — as ye mete, so measured back.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Samuel 12:7 — *Thou art the man.* David judged the parable and the beam was his own.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Leviticus 19:17 — *thou shalt in any wise rebuke thy neighbour* — rebuke commanded once the beam is out.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (b) pearls before swine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 9:7 — *he that rebuketh a wicked man getteth himself a blot.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:8 — *Reprove not a scorner, lest he hate thee.* Discern the hearer.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 23:9 — *Speak not in the ears of a fool: for he will despise the wisdom of thy words.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (c) ask seek knock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 29:13 — *ye shall seek me, and find me, when ye shall search for me with all your heart.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 29:12 — *ye shall... pray unto me, and I will hearken unto you.* Ask, and it is given.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:6 — *Seek ye Yahuah (LORD) while he may be found.* The open door.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:17 — *those that seek me early shall find me.* Wisdom''s pledge to the seeker.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 34:10 — *they that seek Yahuah (LORD) shall not want any good thing.* The Father gives good gifts.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 6:12 — *found of such as seek her.* The rhythm of ask-seek-knock.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Wisdom of Solomon 6:14 — *he shall find her sitting at his doors* — found waiting for the one who knocks.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (d) golden rule
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself.* The golden rule is Torah summed.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:34 — *thou shalt love him as thyself* — the same love toward the grafted-in stranger.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:15 — *Do that to no man which you hatest* — the negative golden rule, generations before.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (e) two ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *I have set before thee this day life and good, and death and evil.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *therefore choose life* — the strait gate is the chosen way.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 21:8 — *Behold, I set before you the way of life, and the way of death.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 1:6 — *the way of the righteous... the way of the ungodly shall perish.* Two ways, two ends.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 14:12 — *a way which seemeth right... but the end thereof are the ways of death.* The broad way.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 15:17 — *Before man is life and death.* Ben Sira sets the same choice before every man.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (f) false prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:3 — *the LORD your God proveth you, to know whether ye love* him. The heart-test.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 13:5 — *he hath spoken to turn you away* from Yahuah. The wolf draws off the commandment.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:22 — *if the thing follow not... the prophet hath spoken it presumptuously.* The fruit-test.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 23:16 — *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 22:27 — *Her princes... are like wolves ravening the prey.* The ravening wolves named.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 5:7 — the vineyard of Yashar''el (Israel) that brought forth wild grapes, known by its fruit.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 6:44 — *every tree is known by his own fruit.* The same word in Luke''s plain.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (g) Lord Lord
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 6:8 — *Depart from me, all ye workers of iniquity.* The very sentence Yahusha pronounces.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 8:2 — *Yashar''el (Israel) shall cry unto me, My Elohim (God), we know thee.* The hollow confession.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 8:3 — *Yashar''el (Israel) hath cast off the thing that is good* — to cast off the Torah is to be unknown of him.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (h) builders
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *a tried stone, a precious corner stone, a sure foundation.* The rock for the wise builder.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 10:25 — *the righteous is an everlasting foundation.* The storm cannot move the founded house.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 13:11 — the untempered wall: *a stormy wind shall rend it.* The house on the sand.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 13:14 — *it shall fall, and ye shall be consumed in the midst thereof.* Great was the fall of it.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 6:48 — *laid the foundation on a rock... could not shake it.* The same parable in Luke.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
