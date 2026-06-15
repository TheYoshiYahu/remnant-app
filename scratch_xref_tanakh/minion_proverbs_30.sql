-- ----- fragment: minion_proverbs_30.sql (Proverbs 30) -----
-- Chapter: Proverbs 30 — THE WORDS OF AGUR. The framework heavyweight is ★★★ 30:4: *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son's name, if thou canst tell?* — the riddle names BOTH the Formless Father (the One who established the ends of the earth) AND His Son (the Formed One who ascended and descended). Then 30:5-6 the purity of the word + the prohibition on adding to it; 30:7-9 Agur's prayer for daily provision; 30:11-14 the four self-righteous generations; 30:15-33 the numbered creation-sayings (the small but wise).
-- Tag: pr30   Temp view: _s304_pr30_lookup   Session prefix: s304
-- Sort band: base 28725, step 3 -> threads at 28725, 28728, 28731, 28734, 28737 (5 threads)
-- Source of EVERY row: 'canon','proverbs',30,v
--
-- Proverbs 30 coverage:
--   v.1-3 (The words of Agur... I neither learned wisdom, nor have the knowledge of the holy)
--        NT/Extras/Tanakh: none warranted distinct (Agur's prologue of humility is carried INTO the 30:4 thread as its setup — the man who confesses he has not the knowledge of the holy poses the riddle of the Name and the Son's name; no standalone thread)
--   ★★★ v.4 (Who hath ascended up into heaven, or descended?... what is his name, and what is his son's name)
--        NT:     ★ John 3:13 (no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam); Ephesians 4:9-10 (he that descended is the same also that ascended); Romans 10:6-7 (Who shall ascend into heaven? that is, to bring Messiah down); Psalm 2:7 (Thou art my Son); John 1:3 (All things were made by him); Colossians 1:16 (by him were all things created); Mark 4:39 (he rebuked the wind, and said unto the sea, Peace, be still) — THREAD 1
--        Extras: Wisdom of Solomon 9:1 (made all things with your word); Sirach 18:4 (To whom has he given power to declare his works?) — THREAD 1
--        Tanakh: Deuteronomy 30:12 (Who shall go up for us to heaven); Job 38:4 (Where wast thou when I laid the foundations of the earth?); Proverbs 8:22,27 (Yahuah possessed me in the beginning of his way... When he prepared the heavens, I was there) — THREAD 1 (the Formed Son, agent of creation, who commands wind and waters)
--   ★★ v.5-6 (Every word of Elohim is pure: he is a shield... Add thou not unto his words)
--        NT:     Revelation 22:18 (If any man shall add unto these things) — THREAD 2
--        Extras: Sirach 18:6 (neither may any thing be put to them, neither can the ground of them be found out) — THREAD 2
--        Tanakh: Psalm 12:6 (The words of Yahuah are pure words); Psalm 18:30 (the word of Yahuah is tried: he is a buckler); Deuteronomy 4:2 (Ye shall not add unto the word); Deuteronomy 12:32 (thou shalt not add thereto, nor diminish) — THREAD 2 (Torah-affirmed, the canon guarded)
--   ★ v.7-9 (give me neither poverty nor riches; feed me with food convenient for me)
--        NT:     Matthew 6:11 (Give us this day our daily bread); 1 Timothy 6:8 (having food and raiment let us be therewith content) — THREAD 3
--        Extras: none warranted distinct (the contentment witness is carried by Matthew + 1 Timothy + Deuteronomy 8; no closer extras witness)
--        Tanakh: Deuteronomy 8:3 (man doth not live by bread only, but by every word); Deuteronomy 8:18 (it is he that giveth thee power to get wealth) — THREAD 3
--   v.10 (Accuse not a servant unto his master) — NT/Extras/Tanakh: none warranted distinct (proverb in its own right; no framework weave)
--   ★ v.11-14 (the four generations: curse father, pure in own eyes, lofty eyes, devour the poor)
--        NT:     Luke 18:11 (the Pharisee... I am not as other men are) — THREAD 4
--        Extras: none warranted distinct (the self-righteous generation is carried by Isaiah 65:5 + Luke 18; no closer extras witness)
--        Tanakh: Proverbs 6:17 (A proud look... hands that shed innocent blood); Isaiah 65:5 (I am holier than thou) — THREAD 4
--   v.15-23 (the horseleach; three/four never satisfied; too wonderful for me; the earth disquieted) — NT/Extras/Tanakh: none warranted distinct (the numerical sayings are wisdom-observation; no clean framework witness; kept un-threaded to stay curated)
--   ★ v.24-28 (four things little upon the earth, but exceeding wise: ants, conies, locusts, spider)
--        NT:     none warranted distinct (the creature-wisdom motif is a Tanakh lateral; no NT witness warranted)
--        Extras: none warranted distinct (carried by Job 12 + Proverbs 6; no closer extras witness)
--        Tanakh: Proverbs 6:6 (Go to the ant, thou sluggard; consider her ways, and be wise); Job 12:7-8 (ask now the beasts, and they shall teach thee) — THREAD 5
--   v.29-33 (three/four comely in going; the lion; the churning of milk) — NT/Extras/Tanakh: none warranted distinct (wisdom-observation closing; no framework weave)
--
-- Threads (slug — target libraries):
--   1. proverbs-30-who-hath-ascended-the-father-and-his-sons-name — Tanakh (Deut, Job, Prov 8) + NT (John 3, Eph, Rom, Ps 2, John 1, Col, Mark) + Extras (WisSol, Sirach) [extras] (★★★ the Formless Father AND the Formed Son named; the ascended/descended One who commands wind/waters; agent of creation)
--   2. proverbs-30-every-word-of-elohim-is-pure-add-thou-not — Tanakh (Ps 12, Ps 18, Deut 4, Deut 12) + NT (Revelation) + Extras (Sirach) [extras] (★★ the purity/sufficiency of the word; the prohibition on adding; canon guarded, Torah-affirmed)
--   3. proverbs-30-neither-poverty-nor-riches-food-convenient — Tanakh (Deut 8) + NT (Matthew, 1 Timothy) [free] (Agur's prayer for daily provision; contentment; man lives by every word)
--   4. proverbs-30-the-generation-pure-in-their-own-eyes — Tanakh (Prov 6, Isaiah) + NT (Luke) [free] (the self-righteous/oppressive generation; pure in own eyes, not washed)
--   5. proverbs-30-little-upon-the-earth-but-exceeding-wise — Tanakh (Prov 6, Job) [free] (wisdom from creation; the small but wise creatures teach)
--
-- Framing notes:
--   ★★★ THE FATHER AND HIS SON'S NAME (THREAD 1, 30:4 — FLAGGED FOR YOSHI'S REVIEW): *Who hath ascended up into heaven, or descended?... what is his name, and what is his son's name, if thou canst tell?* The riddle of Agur names TWO: the Formless Father (Yahuah, the One who *established all the ends of the earth*, named FIRST) AND the Formed Son (*his son's name* — the One who *ascended... or descended*, who *gathered the wind in his fists* and *bound the waters in a garment*). This is framed in Yoshi's Formed/Formless lens, NOT co-equal Trinitarian grammar — the SON has a Father, and the Father is named first; and NOT a created creature — the Son is the agent of creation, the One BY whom all things were made. The ascending/descending is the Formed One's own signature: *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam* (John 3:13); *he that descended is the same also that ascended* (Ephesians 4:9-10); *Who shall ascend into heaven? (that is, to bring Messiah down)* (Romans 10:6). His sonship is declared in *Thou art my Son; this day have I begotten thee* (Psalm 2:7). His command of the wind and waters of 30:4 is the agent-of-creation of *Yahuah possessed me in the beginning of his way... When he prepared the heavens, I was there* (Proverbs 8:22,27), *All things were made by him* (John 1:3), *by him were all things created* (Colossians 1:16) — and the disciples in the boat ask the very riddle of Agur: *What manner of man is this, that even the wind and the sea obey him?* (Mark 4:39-41). Deuteronomy 30:12 (the word not in heaven) and Job 38:4 (where wast thou when I laid the foundations) frame the unsearchable question; the restored witnesses keep the same — *who have made all things with your word* (WisSol 9:1), *To whom has he given power to declare his works?* (Sirach 18:4).
--   ★★ EVERY WORD IS PURE — ADD THOU NOT (THREAD 2, 30:5-6): *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him. Add thou not unto his words* — the purity and sufficiency of the word, the shield to them that trust, and the prohibition on adding. The Torah-given seal: *Ye shall not add unto the word which I command you, neither shall ye diminish* (Deuteronomy 4:2), *thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32); the pure-word refrain *The words of Yahuah are pure words* (Psalm 12:6), *the word of Yahuah is tried: he is a buckler* (Psalm 18:30); the canon's closing guard *If any man shall add unto these things* (Revelation 22:18); the restored witness *neither may any thing be put to them* (Sirach 18:6).
--   ★ NEITHER POVERTY NOR RICHES (THREAD 3, 30:7-9): Agur's prayer for daily bread, that he be neither so full he denies Yahuah nor so poor he steals. Fills forward to *Give us this day our daily bread* (Matthew 6:11) and *having food and raiment let us be therewith content* (1 Timothy 6:8), rooted in *man doth not live by bread only, but by every word* (Deuteronomy 8:3) and *it is he that giveth thee power to get wealth* (Deuteronomy 8:18).
--   ★ THE GENERATION PURE IN ITS OWN EYES (THREAD 4, 30:11-14): the four self-righteous, oppressive generations — *pure in their own eyes, and yet is not washed from their filthiness*. Lateral to the proud look Yahuah hates (*A proud look, a lying tongue* — Proverbs 6:17), the self-sanctifying *I am holier than thou* (Isaiah 65:5), and the Pharisee *I thank thee, that I am not as other men are* (Luke 18:11).
--   ★ LITTLE BUT EXCEEDING WISE (THREAD 5, 30:24-28): one curated thread on the creation-teaches-wisdom motif — *four things which are little upon the earth, but they are exceeding wise* (the ants, conies, locusts, spider). Lateral to *Go to the ant, thou sluggard* (Proverbs 6:6) and *ask now the beasts, and they shall teach thee* (Job 12:7-8). The numbered list (v.15-23, 29-33) is left otherwise un-threaded to stay curated.
--   VERSES WITH NO ADD: v.1-3 (folded into THREAD 1 as Agur's setup); v.10 (a standalone servant-proverb, no framework weave); v.15-23 and v.29-33 (the numerical wisdom-sayings — deliberately not over-threaded per brief; one creature-wisdom thread on v.24-28 suffices).

CREATE TEMP VIEW _s304_pr30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Who hath ascended — the Father and his Son's name (30:4)
    ('canon','proverbs',30,4,'canon','john',3,13,'free',
      E'*And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* (John 3:13). Agur''s riddle — *Who hath ascended up into heaven, or descended?... what is his name, and what is his son''s name, if thou canst tell?* (Proverbs 30:4) — is answered by the Formed Son himself: *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam*. The One who ascended and descended is the Son whose name Agur could not yet tell — the Formed One drawn from the Formless Father, who came down and went up.'),
    ('canon','proverbs',30,4,'canon','ephesians',4,9,'free',
      E'*(Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* (Ephesians 4:9-10). The double motion of *Who hath ascended up into heaven, or descended?* (Proverbs 30:4) is the very signature of the Son: *he that descended is the same also that ascended up far above all heavens*. The riddle''s ascending-and-descending One is the Formed Son who descended to the lower parts and ascended above all heavens.'),
    ('canon','proverbs',30,4,'canon','romans',10,6,'free',
      E'*But the righteousness which is of faith speaketh on this wise, Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* (Romans 10:6). Sha''ul (Paul) reads the question *Who hath ascended up into heaven, or descended?* (Proverbs 30:4) — drawn from Deuteronomy 30:12 — as a question about the Messiah: *Who shall ascend into heaven? (that is, to bring Messiah down from above)*. The ascending and descending of Agur''s riddle is the descent and ascent of the Formed Son; he need not be fetched, for he has come.'),
    ('canon','proverbs',30,4,'canon','psalms',2,7,'free',
      E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). Agur asks *what is his name, and what is his son''s name* (Proverbs 30:4) — and the decree of the second Psalm answers the second half: the Father says to the Son, *Thou art my Son; this day have I begotten thee*. The Son has a name and a Father who names him; not a co-equal person but the begotten Son, the Formed One declared by the Most High.'),
    ('canon','proverbs',30,4,'canon','proverbs',8,22,'free',
      E'*Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22). The One who *hath gathered the wind in his fists* and *established all the ends of the earth* (Proverbs 30:4) is the Wisdom-Son of the same book: *Yahuah possessed me in the beginning of his way, before his works of old*. The Son named in 30:4 is the agent of creation, brought forth before the works, by whom the ends of the earth were established.'),
    ('canon','proverbs',30,4,'canon','proverbs',8,27,'free',
      E'*When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27). Agur asks who *bound the waters in a garment* and *established all the ends of the earth* (Proverbs 30:4); Wisdom answers, *When he prepared the heavens, I was there: when he set a compass upon the face of the depth*. The Formed Son was present at the binding of the waters and the founding of the earth — the agent, not a creature, of the Father''s creating work.'),
    ('canon','proverbs',30,4,'canon','john',1,3,'free',
      E'*All things were made by him; and without him was not any thing made that was made* (John 1:3). The One who gathered the wind and bound the waters and *established all the ends of the earth* (Proverbs 30:4) is the Word by whom *All things were made... and without him was not any thing made that was made*. The Son whose name Agur sought is the Formed Word, the agent through whom the Father made all — the wind, the waters, and the ends of the earth alike.'),
    ('canon','proverbs',30,4,'canon','colossians',1,16,'free',
      E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him* (Colossians 1:16). The Son who controls wind and waters and *established all the ends of the earth* (Proverbs 30:4) is the One of whom it is written, *by him were all things created... all things were created by him, and for him*. The Formed Son is the firstborn agent of creation — by him the ends of the earth Agur names were made.'),
    ('canon','proverbs',30,4,'canon','mark',4,39,'free',
      E'*And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm* (Mark 4:39). The riddle asks who *hath gathered the wind in his fists* and *bound the waters in a garment* (Proverbs 30:4); in the boat the disciples watch the answer — the Formed Son *rebuked the wind, and said unto the sea, Peace, be still* — and cry, *What manner of man is this, that even the wind and the sea obey him?* The wind and the waters obey the Son because they were his to command from the beginning.'),
    ('canon','proverbs',30,4,'canon','deuteronomy',30,12,'free',
      E'*It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:12). Agur''s *Who hath ascended up into heaven, or descended?* (Proverbs 30:4) echoes Moshe (Moses): *Who shall go up for us to heaven, and bring it unto us?* The word need not be fetched from heaven, for the One who descended from heaven has brought it — the same question Sha''ul (Paul) reads of the Messiah in Romans 10:6.'),
    ('canon','proverbs',30,4,'canon','job',38,4,'free',
      E'*Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* (Job 38:4). Agur''s humbling riddle — *who hath established all the ends of the earth?... if thou canst tell* (Proverbs 30:4) — is the question Yahuah himself put to Iyob (Job): *Where wast thou when I laid the foundations of the earth?* No man was there; only the Father and the Formed Son by whom the foundations were laid. The question silences the creature and names the Maker.'),
    ('canon','proverbs',30,4,'apocrypha','the-wisdom-of-solomon',9,1,'extras',
      E'*O Yahuah (God) of my fathers, and Yahuah (God) of mercy, who have made all things with your word* (Wisdom of Solomon 9:1). The riddle of who *established all the ends of the earth* (Proverbs 30:4) is answered in the restored witness: the Father *have made all things with your word* — the Word being the Formed Son, the agent of creation, present when the world was made. The Son''s name Agur sought is the Word by whom all things were made.'),
    ('canon','proverbs',30,4,'apocrypha','ecclesiasticus',18,4,'extras',
      E'*To whom has he given power to declare his works? and who shall find out his noble acts?* (Sirach 18:4). Agur''s *if thou canst tell* (Proverbs 30:4) is the same confession of the unsearchable Maker: *To whom has he given power to declare his works?* The works of the One who gathered the wind and established the earth are beyond the creature to declare — the riddle is not answered by man but by the descended-and-ascended Son.'),

    -- THREAD 2: Every word of Elohim is pure — add thou not (30:5-6)
    ('canon','proverbs',30,5,'canon','psalms',12,6,'free',
      E'*The words of Yahuah (LORD) are pure words: as silver tried in a furnace of earth, purified seven times* (Psalm 12:6). The declaration *Every word of Elohim (God) is pure* (Proverbs 30:5) is sung in the Psalter: *The words of Yahuah are pure words: as silver tried in a furnace of earth, purified seven times*. The word is refined, tried, without dross — there is nothing in it to add to and nothing to take from.'),
    ('canon','proverbs',30,5,'canon','psalms',18,30,'free',
      E'*As for Elohim (God), his way is perfect: the word of Yahuah (LORD) is tried: he is a buckler to all those that trust in him* (Psalm 18:30). The pure word that is *a shield unto them that put their trust in him* (Proverbs 30:5) is the very buckler of the Psalm: *the word of Yahuah is tried: he is a buckler to all those that trust in him*. The tried word is the shield; trust in it is the covering.'),
    ('canon','proverbs',30,6,'canon','deuteronomy',4,2,'free',
      E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you* (Deuteronomy 4:2). The charge *Add thou not unto his words* (Proverbs 30:6) is the Torah''s own seal: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it*. The word is sufficient and guarded — to add or diminish is to break it, that the commandments may be kept whole.'),
    ('canon','proverbs',30,6,'canon','deuteronomy',12,32,'free',
      E'*What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). Agur''s *Add thou not unto his words, lest he reprove thee* (Proverbs 30:6) repeats the Torah''s guard verbatim: *thou shalt not add thereto, nor diminish from it*. What is commanded is to be observed and done — neither swollen with man''s additions nor stripped of any part.'),
    ('canon','proverbs',30,6,'canon','revelation',22,18,'free',
      E'*For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book* (Revelation 22:18). The warning *Add thou not unto his words, lest he reprove thee, and thou be found a liar* (Proverbs 30:6) seals the whole canon at its close: *If any man shall add unto these things, Elohim shall add unto him the plagues*. From Torah to Agur to the Revelation, the word is guarded against the hand that would add to it.'),
    ('canon','proverbs',30,6,'apocrypha','ecclesiasticus',18,6,'extras',
      E'*As for the wondrous works of Yahuah (God), there may nothing be taken from them, neither may any thing be put to them, neither can the ground of them be found out* (Sirach 18:6). The restored witness keeps both halves of 30:5-6 at once — the unsearchable purity and the prohibition on adding: *there may nothing be taken from them, neither may any thing be put to them, neither can the ground of them be found out*. Nothing may be added, nothing taken; the works and the words of Yahuah are perfect and complete.'),

    -- THREAD 3: Neither poverty nor riches — food convenient (30:7-9)
    ('canon','proverbs',30,8,'canon','matthew',6,11,'free',
      E'*Give us this day our daily bread* (Matthew 6:11). Agur''s prayer *feed me with food convenient for me* (Proverbs 30:8) is the petition Yahusha (Jesus) teaches: *Give us this day our daily bread*. Not riches, not want — only the bread sufficient for the day, that the heart be kept from both denial and theft.'),
    ('canon','proverbs',30,8,'canon','1-timothy',6,8,'free',
      E'*And having food and raiment let us be therewith content* (1 Timothy 6:8). The prayer for *neither poverty nor riches* but *food convenient for me* (Proverbs 30:8) is the contentment Sha''ul (Paul) commends: *having food and raiment let us be therewith content*. Sufficiency, not abundance, is the safe portion; godliness with contentment is great gain.'),
    ('canon','proverbs',30,9,'canon','deuteronomy',8,3,'free',
      E'*And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). Agur fears that being full he will *deny thee, and say, Who is Yahuah?* (Proverbs 30:9); the wilderness taught the same lesson — *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah*. The daily portion is given that the heart remember the Giver, not forget him in fullness.'),
    ('canon','proverbs',30,9,'canon','deuteronomy',8,18,'free',
      E'*But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers* (Deuteronomy 8:18). Agur dreads the fullness that says *Who is Yahuah?* (Proverbs 30:9); Moshe (Moses) warns of the very forgetting — *thou shalt remember Yahuah... for it is he that giveth thee power to get wealth*. The wealth that makes a man forget its Giver is the snare Agur prays to be spared.'),

    -- THREAD 4: The generation pure in its own eyes (30:11-14)
    ('canon','proverbs',30,12,'canon','proverbs',6,17,'free',
      E'*A proud look, a lying tongue, and hands that shed innocent blood* (Proverbs 6:17). The generation with *lofty... eyes* and *eyelids... lifted up* (Proverbs 30:13) that devours the poor (30:14) is the very thing Yahuah hates: *A proud look, a lying tongue, and hands that shed innocent blood*. The proud look heads the list of abominations; the self-exalting generation of Agur is the catalogue of what Yahuah cannot bear.'),
    ('canon','proverbs',30,12,'canon','isaiah',65,5,'free',
      E'*Which say, Stand by thyself, come not near to me; for I am holier than thou. These are a smoke in my nose, a fire that burneth all the day* (Isaiah 65:5). The generation *pure in their own eyes, and yet is not washed from their filthiness* (Proverbs 30:12) speaks with Isaiah''s self-sanctifiers: *I am holier than thou*. To Yahuah this self-cleanness is not purity but provocation — *a smoke in my nose* — the unwashed who imagine themselves clean.'),
    ('canon','proverbs',30,12,'canon','luke',18,11,'free',
      E'*The Pharisee stood and prayed thus with himself, Elohim (God), I thank thee, that I am not as other men are, extortioners, unjust, adulterers, or even as this publican* (Luke 18:11). The generation *pure in their own eyes, and yet is not washed from their filthiness* (Proverbs 30:12) stands in the temple as the Pharisee: *I thank thee, that I am not as other men are*. The man sure of his own cleanness goes down unjustified; the self-pure eye sees everything but its own filthiness.'),

    -- THREAD 5: Little upon the earth but exceeding wise (30:24-28)
    ('canon','proverbs',30,25,'canon','proverbs',6,6,'free',
      E'*Go to the ant, thou sluggard; consider her ways, and be wise* (Proverbs 6:6). Agur names the ant first among the *four things which are little upon the earth, but they are exceeding wise* — *The ants are a people not strong, yet they prepare their meat in the summer* (Proverbs 30:25). The same teacher had sent the sluggard to her school: *Go to the ant, thou sluggard; consider her ways, and be wise*. The smallest creature carries a wisdom the proud man lacks.'),
    ('canon','proverbs',30,24,'canon','job',12,7,'free',
      E'*But ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee* (Job 12:7). The *four things which are little upon the earth, but they are exceeding wise* (Proverbs 30:24) are creation''s own teachers, as Iyob (Job) knew: *ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee*. The ant, the cony, the locust, and the spider preach the wisdom of their Maker to the man who will consider them.'),
    ('canon','proverbs',30,24,'canon','job',12,8,'free',
      E'*Or speak to the earth, and it shall teach thee: and the fishes of the sea shall declare unto thee* (Job 12:8). The little-but-wise creatures of 30:24-28 are part of the whole creation that instructs: *speak to the earth, and it shall teach thee: and the fishes of the sea shall declare unto thee*. The wisdom Agur could not learn from men (30:3) the small creatures teach freely — the earth itself is a tutor in the ways of Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-30-who-hath-ascended-the-father-and-his-sons-name',
       E'Who hath ascended — the Father and his Son''s name',
       E'Agur opens confessing he has not the knowledge of the holy (Proverbs 30:3), and then poses the riddle that names the unsearchable Maker AND his Son: *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* (Proverbs 30:4). The question names TWO. First the Formless Father, Yahuah the Most High, who *established all the ends of the earth* — named first, the Source. And then *his son''s name* — the Formed Son, drawn from the Formless, the One who *hath ascended up into heaven, or descended*, who *gathered the wind in his fists* and *bound the waters in a garment*. This is not a co-equal trinity of persons (the Son has a Father, and the Father is named first), and it is not a created creature (the Son is the agent BY whom the wind, the waters, and the ends of the earth were made). The ascending-and-descending is the Son''s own signature: *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam* (John 3:13); *he that descended is the same also that ascended up far above all heavens* (Ephesians 4:9-10); and Sha''ul (Paul) reads the question itself of the Messiah — *Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above)* (Romans 10:6), drawing on Moshe (Moses): *Who shall go up for us to heaven, and bring it unto us?* (Deuteronomy 30:12). His sonship is the decree of the second Psalm: *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). And his command of the wind and waters is the agent-of-creation of his own book — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22), *When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27) — fulfilled in *All things were made by him; and without him was not any thing made that was made* (John 1:3) and *by him were all things created... all things were created by him, and for him* (Colossians 1:16). The disciples in the storm ask Agur''s very riddle aloud: he *rebuked the wind, and said unto the sea, Peace, be still* (Mark 4:39), and they cry, *What manner of man is this, that even the wind and the sea obey him?* The humbling silence of *Where wast thou when I laid the foundations of the earth?* (Job 38:4) is broken only by the Father and the Formed Son who were there; the restored witnesses keep the same — *who have made all things with your word* (Wisdom of Solomon 9:1), *To whom has he given power to declare his works?* (Sirach 18:4). Agur could not tell the Son''s name; the whole library tells it after him.',
       sv.verse_id, ev.verse_id, 'extras', 28725
  FROM _s304_pr30_lookup sv, _s304_pr30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=30 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-30-every-word-of-elohim-is-pure-add-thou-not',
       E'Every word of Elohim is pure — add thou not',
       E'After the riddle of the Name comes the seal upon the word: *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him. Add thou not unto his words, lest he reprove thee, and thou be found a liar* (Proverbs 30:5-6). The word is pure — tried, refined, without dross — and it is a shield to all who trust it. Therefore nothing may be added to it. The Psalter sings the purity: *The words of Yahuah (LORD) are pure words: as silver tried in a furnace of earth, purified seven times* (Psalm 12:6), and names the shield: *the word of Yahuah (LORD) is tried: he is a buckler to all those that trust in him* (Psalm 18:30). The prohibition on adding is the Torah''s own seal, given twice by Moshe (Moses): *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2), and *What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). The same guard closes the whole canon: *If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book* (Revelation 22:18). And the restored witness holds both the unsearchable purity and the prohibition together: *As for the wondrous works of Yahuah (God), there may nothing be taken from them, neither may any thing be put to them, neither can the ground of them be found out* (Sirach 18:6). The word is whole, pure, and sufficient — a shield to them that trust, sealed against every hand that would add or diminish.',
       sv.verse_id, ev.verse_id, 'extras', 28728
  FROM _s304_pr30_lookup sv, _s304_pr30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=30 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-30-neither-poverty-nor-riches-food-convenient',
       E'Neither poverty nor riches — food convenient for me',
       E'Agur asks two things before he dies: truth, and a measured portion — *Remove far from me vanity and lies: give me neither poverty nor riches; feed me with food convenient for me: Lest I be full, and deny thee, and say, Who is Yahuah (LORD)? or lest I be poor, and steal, and take the name of my Elohim (God) in vain* (Proverbs 30:8-9). Both fullness and want are snares: fullness tempts to forget the Giver, want to dishonour his Name. The same daily-portion prayer Yahusha (Jesus) teaches — *Give us this day our daily bread* (Matthew 6:11) — neither hoard nor lack, but the bread of the day. Sha''ul (Paul) names it contentment: *And having food and raiment let us be therewith content* (1 Timothy 6:8). And the wilderness taught the root of it: the manna came day by day *that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD)* (Deuteronomy 8:3); and the warning against the fullness that forgets — *thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth* (Deuteronomy 8:18). Agur''s fear is the wilderness lesson exactly: the full heart that says *Who is Yahuah?* is the heart that forgot the Giver of the bread. The safe portion is the measured one — enough to keep the Name honoured, the hand from stealing, and the heart remembering.',
       sv.verse_id, ev.verse_id, 'free', 28731
  FROM _s304_pr30_lookup sv, _s304_pr30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=30 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-30-the-generation-pure-in-their-own-eyes',
       E'The generation pure in their own eyes',
       E'Agur sees four generations of self-exaltation and oppression: *There is a generation that curseth their father, and doth not bless their mother. There is a generation that are pure in their own eyes, and yet is not washed from their filthiness. There is a generation, O how lofty are their eyes! and their eyelids are lifted up. There is a generation, whose teeth are as swords, and their jaw teeth as knives, to devour the poor from off the earth, and the needy from among men* (Proverbs 30:11-14). The lifted-up eyes and the devouring of the poor are the very things Yahuah hates, named first in his own catalogue: *A proud look, a lying tongue, and hands that shed innocent blood* (Proverbs 6:17). The generation *pure in their own eyes, and yet is not washed from their filthiness* speaks with Isaiah''s self-sanctifiers, who to Yahuah are not clean but a stench: *Which say, Stand by thyself, come not near to me; for I am holier than thou. These are a smoke in my nose, a fire that burneth all the day* (Isaiah 65:5). And the same self-cleanness stands in the temple in the Pharisee: *Elohim (God), I thank thee, that I am not as other men are, extortioners, unjust, adulterers, or even as this publican* (Luke 18:11) — and goes down unjustified. The eye sure of its own purity is the eye that cannot see its filthiness; the generation that exalts itself is the generation Yahuah abhors.',
       sv.verse_id, ev.verse_id, 'free', 28734
  FROM _s304_pr30_lookup sv, _s304_pr30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=30 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-30-little-upon-the-earth-but-exceeding-wise',
       E'Little upon the earth, but exceeding wise',
       E'Among Agur''s numbered sayings is a school of small teachers: *There be four things which are little upon the earth, but they are exceeding wise: The ants are a people not strong, yet they prepare their meat in the summer; The conies are but a feeble folk, yet make they their houses in the rocks; The locusts have no king, yet go they forth all of them by bands; The spider taketh hold with her hands, and is in kings'' palaces* (Proverbs 30:24-28). The smallest and weakest creatures carry a wisdom the proud man lacks. The same teacher had already sent the sluggard to the first of them: *Go to the ant, thou sluggard; consider her ways, and be wise* (Proverbs 6:6). And Iyob (Job) knew that all creation is a tutor in the ways of its Maker: *But ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee* (Job 12:7); *Or speak to the earth, and it shall teach thee: and the fishes of the sea shall declare unto thee* (Job 12:8). The wisdom Agur could not learn from men — *I neither learned wisdom, nor have the knowledge of the holy* (Proverbs 30:3) — the ant, the cony, the locust, and the spider teach freely; the creation preaches the wisdom of Yahuah to whoever will consider it.',
       sv.verse_id, ev.verse_id, 'free', 28737
  FROM _s304_pr30_lookup sv, _s304_pr30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=30 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam* (John 3:13) — the Formed Son answers Agur''s riddle: the ascending-descending One is the Son who came down from heaven.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he that descended is the same also that ascended up far above all heavens* (Ephesians 4:9-10) — the double motion of 30:4 is the Son''s signature: he descended to the lower parts and ascended above all heavens.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above)* (Romans 10:6) — Sha''ul (Paul) reads Agur''s very question of the Messiah; the descended Son need not be fetched.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou art my Son; this day have I begotten thee* (Psalm 2:7) — answers *what is his son''s name* (30:4): the Father names the begotten Son, who has a Father and is named after him.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22) — the Son who established the ends of the earth (30:4) is the Wisdom-Son brought forth before the works; the agent, not a creature.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27) — the Son was present at the binding of the waters and the founding of the earth Agur names (30:4).'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*All things were made by him; and without him was not any thing made that was made* (John 1:3) — the Son whose name Agur sought is the Word by whom the wind, waters, and ends of the earth were made.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*by him were all things created... all things were created by him, and for him* (Colossians 1:16) — the Formed Son commands wind and waters because he is the agent of creation; the ends of the earth Agur names were made by him.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*he... rebuked the wind, and said unto the sea, Peace, be still* (Mark 4:39) — the disciples ask Agur''s riddle aloud: *what manner of man is this, that even the wind and the sea obey him?* The One who gathered the wind in his fists (30:4) commands it still.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=4 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*It is not in heaven, that thou shouldest say, Who shall go up for us to heaven* (Deuteronomy 30:12) — Moshe (Moses) frames Agur''s *Who hath ascended up into heaven* (30:4); the word need not be fetched, for the One who descended has brought it.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*Where wast thou when I laid the foundations of the earth?* (Job 38:4) — the humbling question of *if thou canst tell* (30:4); no man was there, only the Father and the Formed Son by whom the foundations were laid.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'*O Yahuah (God) of my fathers... who have made all things with your word* (Wisdom of Solomon 9:1) — the restored witness names the Word as the maker; the Son''s name Agur sought is the Word by whom all things were made.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'*To whom has he given power to declare his works? and who shall find out his noble acts?* (Sirach 18:4) — the restored witness keeps the unsearchable confession of *if thou canst tell* (30:4); the Maker''s works are beyond the creature to declare.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=4
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-who-hath-ascended-the-father-and-his-sons-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The words of Yahuah (LORD) are pure words: as silver tried in a furnace of earth, purified seven times* (Psalm 12:6) — the purity of *Every word of Elohim is pure* (30:5) sung in the Psalter; the word refined, without dross.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=5
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-every-word-of-elohim-is-pure-add-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the word of Yahuah (LORD) is tried: he is a buckler to all those that trust in him* (Psalm 18:30) — the shield of *he is a shield unto them that put their trust in him* (30:5); the tried word is the buckler.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=5
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-every-word-of-elohim-is-pure-add-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it* (Deuteronomy 4:2) — the Torah''s own seal behind *Add thou not unto his words* (30:6); the word guarded against addition and subtraction.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=6
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-every-word-of-elohim-is-pure-add-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32) — Agur''s charge (30:6) repeats the Torah guard verbatim; what is commanded is observed and done, whole.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=6
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-every-word-of-elohim-is-pure-add-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*If any man shall add unto these things, Elohim (God) shall add unto him the plagues* (Revelation 22:18) — the same guard of *Add thou not* (30:6) sealing the close of the whole canon.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=6
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-every-word-of-elohim-is-pure-add-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*there may nothing be taken from them, neither may any thing be put to them, neither can the ground of them be found out* (Sirach 18:6) — the restored witness holds both the purity and the prohibition of 30:5-6 together; nothing added, nothing taken.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=6
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-every-word-of-elohim-is-pure-add-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Give us this day our daily bread* (Matthew 6:11) — Agur''s *food convenient for me* (30:8) is the petition Yahusha (Jesus) teaches: the measured bread of the day, neither hoard nor lack.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=8
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-neither-poverty-nor-riches-food-convenient'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And having food and raiment let us be therewith content* (1 Timothy 6:8) — the *neither poverty nor riches* of 30:8 is the contentment Sha''ul (Paul) commends; sufficiency, not abundance, the safe portion.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=8
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-neither-poverty-nor-riches-food-convenient'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD)* (Deuteronomy 8:3) — Agur''s fear of the fullness that says *Who is Yahuah?* (30:9) is the wilderness lesson: the bread is given that the heart remember the Giver.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=9
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-neither-poverty-nor-riches-food-convenient'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth* (Deuteronomy 8:18) — the fullness that forgets the Giver is the snare of 30:9; the wealth that makes a man say *Who is Yahuah?* is what Agur prays to be spared.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=9
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-neither-poverty-nor-riches-food-convenient'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A proud look, a lying tongue, and hands that shed innocent blood* (Proverbs 6:17) — the lofty eyes and devouring of the poor (30:13-14) head the catalogue of what Yahuah hates; the proud look first.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=12
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-the-generation-pure-in-their-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am holier than thou. These are a smoke in my nose, a fire that burneth all the day* (Isaiah 65:5) — the generation *pure in their own eyes... not washed* (30:12) speaks with Isaiah''s self-sanctifiers, a stench to Yahuah, not purity.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=12
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-the-generation-pure-in-their-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Elohim (God), I thank thee, that I am not as other men are* (Luke 18:11) — the self-pure eye of 30:12 stands in the temple as the Pharisee, sure of his cleanness, and goes down unjustified.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=12
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-the-generation-pure-in-their-own-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Go to the ant, thou sluggard; consider her ways, and be wise* (Proverbs 6:6) — the ant heads Agur''s little-but-wise (30:25); the same teacher had sent the sluggard to her school.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=25
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-little-upon-the-earth-but-exceeding-wise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*ask now the beasts, and they shall teach thee; and the fowls of the air, and they shall tell thee* (Job 12:7) — the little creatures of 30:24-28 are creation''s teachers, as Iyob (Job) knew.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=24
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-little-upon-the-earth-but-exceeding-wise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*speak to the earth, and it shall teach thee: and the fishes of the sea shall declare unto thee* (Job 12:8) — the wisdom Agur could not learn from men (30:3) the whole creation teaches freely.'
  FROM cross_reference_threads t
  JOIN _s304_pr30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=30 AND sv.verse_number=24
  JOIN _s304_pr30_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-30-little-upon-the-earth-but-exceeding-wise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
