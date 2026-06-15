-- ----- fragment: minion_proverbs_4.sql (Proverbs 4) -----
-- Chapter: Proverbs 4 — THE FATHER'S TRANSMITTED INSTRUCTION and THE TWO WAYS by light and darkness.
--   The wisdom-father hands down what HIS father taught him (4:3-4 covenant transmission), pressing
--   "forsake ye not my torah" (4:2) and "Get wisdom... Wisdom is the principal thing" (4:5,7), the
--   crown of wisdom (4:8-9). Then the two paths: ★ the path of the just as the shining light that
--   shineth more and more unto the perfect day vs the way of the wicked as darkness (4:18-19);
--   ★ keep thy heart, for out of it are the issues of life (4:23) — the heart as the wellspring; and
--   the straight path with eyes/mouth/feet kept, turn not to the right hand nor to the left (4:24-27).
-- Tag: pr04   Session prefix: s304   Temp view: _s304_pr04_lookup
-- Sort band: base 28075, step 3 -> 28075, 28078, 28081, 28084, 28087, 28090 (6 threads)
-- Source of EVERY row: 'canon','proverbs',4,v
--
-- Proverbs 4 coverage:
--   ★ v.1-9 (Hear, ye children, the instruction of a father... For I give you good doctrine, forsake ye not my law... I was my father's son... He taught me also... Get wisdom... Wisdom is the principal thing... a crown of glory shall she deliver to thee)
--        NT:     none warranted distinct for the transmission frame (the get-wisdom heart of v.7 is given its own forward-weave thread; the generational handing-down is carried by the Tanakh laterals)
--        Extras: ★ Sirach 4:11-13 (Wisdom exalteth her children... He that holdeth her fast shall inherit glory); Sirach 6:18 (My son, gather instruction from your youth up) — THREAD 1
--        Tanakh: ★ Deuteronomy 6:6-7 (these words... shall be in thine heart: And thou shalt teach them diligently unto thy children); Psalm 78:4-6 (shewing to the generation to come... that they should make them known to their children); Proverbs 1:8 (My son, hear the instruction of thy father, and forsake not the law of thy mother) — THREAD 1 (load-bearing: covenant transmission of Torah/wisdom father-to-son)
--   ★ v.7 (Wisdom is the principal thing; therefore get wisdom: and with all thy getting get understanding)
--        NT:     Matthew 13:44 (treasure hid in a field... selleth all that he hath, and buyeth that field); Matthew 13:45-46 (the pearl of great price); James 1:5 (If any of you lack wisdom, let him ask of Elohim) — THREAD 2
--        Extras: none warranted distinct (the get-wisdom-at-all-cost is carried by the treasure/pearl forward-weave; Sirach's holding-fast gathered in THREAD 3)
--        Tanakh: ★ Job 28:28 (the fear of Yahuah, that is wisdom; and to depart from evil is understanding) — THREAD 2 (load-bearing)
--   ★ v.13 (Take fast hold of instruction; let her not go: keep her; for she is thy life)
--        NT:     none warranted distinct (the holding-fast-of-life is carried by the Extras witnesses + the THREAD-2 forward-weave; no closer clean NT member)
--        Extras: ★ Sirach 6:26-27 (Come to her with your whole heart... when you have got hold of her, let her not go) — THREAD 3
--        Tanakh: none warranted distinct (the keep-her-she-is-thy-life carried by Sirach's verbatim parallel; Proverbs 3:18 tree-of-life threaded on ch 3 already)
--   ★★ v.18-19 (the path of the just is as the shining light, that shineth more and more unto the perfect day. The way of the wicked is as darkness: they know not at what they stumble)
--        NT:     ★ John 8:12 (I am the light of the world: he that followeth me shall not walk in darkness); 1 John 1:7 (if we walk in the light, as he is in the light); 1 John 2:9-11 (he that loveth his brother abideth in the light... he that hateth his brother... walketh in darkness); Philippians 2:15 (ye shine as lights in the world) — THREAD 4
--        Extras: ★ Wisdom of Solomon 5:6 (the light of righteousness has not shined to us, and the sun of righteousness rose not upon us) — THREAD 4
--        Tanakh: ★ Isaiah 2:5 (O house of Jacob, come ye, and let us walk in the light of Yahuah); Daniel 12:3 (they that be wise shall shine as the brightness of the firmament) — THREAD 4 (load-bearing: the two ways by light vs darkness)
--   ★★ v.20-23 (My son, attend to my words... For they are life unto those that find them, and health to all their flesh. Keep thy heart with all diligence; for out of it are the issues of life)
--        NT:     ★ Matthew 12:34-35 (out of the abundance of the heart the mouth speaketh); Matthew 15:18-19 (out of the heart proceed evil thoughts); Luke 6:45 (out of the good treasure of his heart bringeth forth that which is good) — THREAD 5
--        Extras: none warranted distinct (the heart-as-wellspring carried whole by the synoptic forward-weave; Proverbs 23:7 the lateral)
--        Tanakh: ★ Proverbs 23:7 (as he thinketh in his heart, so is he) — THREAD 5 (load-bearing lateral)
--   ★ v.24-27 (Put away from thee a froward mouth... Let thine eyes look right on... Ponder the path of thy feet... Turn not to the right hand nor to the left: remove thy foot from evil)
--        NT:     Hebrews 12:13 (make straight paths for your feet, lest that which is lame be turned out of the way) — THREAD 6
--        Extras: none warranted distinct (the turn-not-aside carried by the Torah laterals + Hebrews; no closer clean extras witness)
--        Tanakh: ★ Deuteronomy 5:32 (ye shall not turn aside to the right hand or to the left); Deuteronomy 28:14 (thou shalt not go aside... to the right hand, or to the left); Isaiah 35:8 (an highway... The way of holiness) — THREAD 6 (load-bearing: the straight path, turn-not-aside, Torah-affirmed)
--   v.10-12,14-17 — carried within the threads above (10-12 the years-many / led-in-right-paths-not-straitened folded into THREAD 1 transmission and THREAD 6 straight-path; 14-17 enter-not-the-path-of-the-wicked is the dark counter-way of THREAD 4)
--
-- Threads (slug — target libraries):
--   1. proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction — Tanakh (Deuteronomy, Psalm, Proverbs 1) + Extras (Sirach) [extras] (★ covenant transmission of Torah/wisdom)
--   2. proverbs-4-wisdom-is-the-principal-thing-therefore-get-wisdom — Tanakh (Job) + NT (Matthew, James) [free] (★ get-wisdom-at-all-cost; the treasure/pearl)
--   3. proverbs-4-take-fast-hold-of-instruction-let-her-not-go-she-is-thy-life — Extras (Sirach) [extras] (★ hold her fast, she is thy life)
--   4. proverbs-4-the-path-of-the-just-is-as-the-shining-light — Tanakh (Isaiah, Daniel) + NT (John, 1 John, Philippians) + Extras (Wisdom of Solomon) [extras] (★★ the two ways by light vs darkness)
--   5. proverbs-4-keep-thy-heart-for-out-of-it-are-the-issues-of-life — Tanakh (Proverbs 23) + NT (Matthew, Luke) [free] (★★ the heart as the wellspring)
--   6. proverbs-4-ponder-the-path-of-thy-feet-turn-not-to-the-right-hand-nor-to-the-left — Tanakh (Deuteronomy, Isaiah) + NT (Hebrews) [free] (★ the straight path, turn-not-aside, Torah-affirmed)
--
-- Framing notes:
--   ★ TRANSMISSION (THREAD 1): *He taught me also, and said unto me, Let thine heart retain my words: keep my commandments, and live* (4:4). The wisdom-father teaches the son what HIS father taught HIM — covenant transmission, paternal bloodline AND covenant-word together. *forsake ye not my law* (4:2) is the Shema's own demand — *teach them diligently unto thy children* (Deut 6:7) — and the Psalmist's charge to the generation to come (Ps 78:4-6). Sirach keeps it: *Wisdom exalteth her children* (Sirach 4:11), matching *Exalt her, and she shall promote thee... a crown of glory shall she deliver to thee* (4:8-9).
--   ★★ THE TWO WAYS BY LIGHT (THREAD 4): *the path of the just is as the shining light, that shineth more and more unto the perfect day. The way of the wicked is as darkness: they know not at what they stumble* (4:18-19). The seed-war read by conduct — two ways, light vs darkness, never two ethnicities. Yahusha the Formed Light: *I am the light of the world: he that followeth me shall not walk in darkness* (John 8:12); the walk-in-the-light test of 1 John; the wise who *shall shine as the brightness of the firmament* (Dan 12:3); and the call *O house of Jacob, come ye, and let us walk in the light of Yahuah* (Isa 2:5). WisSol 5:6 the dark counter-confession.
--   ★★ THE HEART-WELLSPRING (THREAD 5): *Keep thy heart with all diligence; for out of it are the issues of life* (4:23). Yahusha presses the same root — *out of the abundance of the heart the mouth speaketh* (Matt 12:34), *out of the heart proceed evil thoughts* (Matt 15:19) — the kept heart is the kept walk; the words are *life... and health to all their flesh* (4:22).
--   ★ STRAIGHT PATH (THREAD 6): *Turn not to the right hand nor to the left: remove thy foot from evil* (4:27) is the Torah's own charge — *ye shall not turn aside to the right hand or to the left* (Deut 5:32; 28:14) — carried forward to *make straight paths for your feet* (Heb 12:13). The way kept straight is the way of holiness (Isa 35:8), Torah-affirmed.
--   EXTRAS: Sirach DOUBLE-WRITTEN edition 'apocrypha' + book 'ecclesiasticus'; Wisdom of Solomon DOUBLE-WRITTEN edition 'apocrypha' + book 'the-wisdom-of-solomon'. Sirach 4:11-13 (wisdom exalts her children, hold her fast, inherit glory), 6:18/6:26-27 (gather instruction from youth, get hold of her, let her not go) — clean witnesses both. WisSol 5:6 (the dark men's confession that the light of righteousness shined not on them). No Jubilees/Jasher/Enoch witness warranted for a wisdom-poem of paternal instruction.
--   VERSES WITH NO STANDALONE THREAD: v.10-12 (receive my sayings... I have led thee in right paths... thou shalt not stumble) folded into THREAD 1 (transmission) and THREAD 6 (the unstraitened straight path); v.14-17 (enter not into the path of the wicked... they eat the bread of wickedness) is the dark counter-way carried within THREAD 4.

CREATE TEMP VIEW _s304_pr04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Forsake ye not my torah — the father's transmitted instruction (covenant transmission)
    ('canon','proverbs',4,2,'canon','deuteronomy',6,6,'free',
      E'*And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6). The father''s charge — *For I give you good doctrine, forsake ye not my law* (Proverbs 4:2) — is the Shema''s own demand: the words commanded are to live *in thine heart*. The wisdom-father does not invent a new instruction; he hands down the Torah that Moshe (Moses) set in the heart of Yashar''el (Israel).'),
    ('canon','proverbs',4,4,'canon','deuteronomy',6,7,'free',
      E'*And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up* (Deuteronomy 6:7). The father teaching the son — *He taught me also, and said unto me, Let thine heart retain my words: keep my commandments, and live* (Proverbs 4:4) — is the Shema''s command to *teach them diligently unto thy children*. The generational handing-down of the commandments, father to son, is the very thing Proverbs 4 enacts before the reader''s eyes.'),
    ('canon','proverbs',4,1,'canon','psalms',78,4,'free',
      E'*We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done* (Psalm 78:4). *Hear, ye children, the instruction of a father* (Proverbs 4:1) is the same handing-down the Psalmist vows: the fathers *will not hide them from their children*. The instruction is a deposit passed down the covenant line, never withheld from the generation to come.'),
    ('canon','proverbs',4,4,'canon','psalms',78,5,'free',
      E'*For he established a testimony in Jacob, and appointed a law in Yashar''el (Israel), which he commanded our fathers, that they should make them known to their children* (Psalm 78:5). The father''s *keep my commandments, and live* (Proverbs 4:4) carries forward the appointed law of Psalm 78 — *a law in Yashar''el (Israel)... that they should make them known to their children*. The Torah commanded to the fathers is to be made known to the children; the wisdom-father is one link in that chain.'),
    ('canon','proverbs',4,1,'canon','proverbs',1,8,'free',
      E'*My son, hear the instruction of thy father, and forsake not the law of thy mother* (Proverbs 1:8). The opening call — *Hear, ye children, the instruction of a father, and attend to know understanding* (Proverbs 4:1) — repeats the book''s own first charge: *hear the instruction of thy father, and forsake not the law of thy mother*. The instruction of the father and the torah of the mother are one inheritance; to hear is to keep.'),
    ('canon','proverbs',4,8,'apocrypha','ecclesiasticus',4,11,'extras',
      E'*Wisdom exalteth her children, and layeth hold of them that seek her* (Sirach 4:11). The promise *Exalt her, and she shall promote thee: she shall bring thee to honour, when thou dost embrace her* (Proverbs 4:8) is matched in the restored witness: *Wisdom exalteth her children, and layeth hold of them that seek her*. He that exalts her is exalted by her; the embrace is mutual — Wisdom lays hold of those who lay hold of her.'),
    ('canon','proverbs',4,1,'apocrypha','ecclesiasticus',6,18,'extras',
      E'*My son, gather instruction from your youth up: so shall you find wisdom till your old age* (Sirach 6:18). The father''s *Hear, ye children, the instruction of a father* (Proverbs 4:1) is the same counsel the restored witness gives the son: *gather instruction from your youth up*. The instruction received in youth ripens into the wisdom of age — the lifelong fruit of the handed-down teaching.'),

    -- THREAD 2: Wisdom is the principal thing — therefore get wisdom (get-wisdom-at-all-cost)
    ('canon','proverbs',4,7,'canon','job',28,28,'free',
      E'*And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). The chapter''s crown — *Wisdom is the principal thing; therefore get wisdom: and with all thy getting get understanding* (Proverbs 4:7) — is named by Job: *the fear of Yahuah, that is wisdom; and to depart from evil is understanding*. The principal thing to get is the fear of Yahuah; the understanding sought is to depart from evil.'),
    ('canon','proverbs',4,7,'canon','matthew',13,44,'free',
      E'*Again, the kingdom of heaven is like unto treasure hid in a field; the which when a man hath found, he hideth, and for joy thereof goeth and selleth all that he hath, and buyeth that field* (Matthew 13:44). To *get wisdom* with *all thy getting* (Proverbs 4:7) is the man who sells all for the hidden treasure: *for joy thereof goeth and selleth all that he hath, and buyeth that field*. Wisdom is the principal thing — worth the giving of everything else to gain it.'),
    ('canon','proverbs',4,7,'canon','matthew',13,46,'free',
      E'*Who, when he had found one pearl of great price, went and sold all that he had, and bought it* (Matthew 13:46). The merchant of *with all thy getting get understanding* (Proverbs 4:7) finds the pearl and *sold all that he had, and bought it*. The principal thing is the pearl of great price; all the getting is spent to obtain the one understanding worth more than all.'),
    ('canon','proverbs',4,7,'canon','james',1,5,'free',
      E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). *Wisdom is the principal thing; therefore get wisdom* (Proverbs 4:7) — and Ya''aqov (James) names how it is gotten: *let him ask of Elohim (God), that giveth to all men liberally*. The principal thing is sought by asking of the One who gives it freely; the getting is the asking.'),

    -- THREAD 3: Take fast hold of instruction — let her not go (hold her fast, she is thy life)
    ('canon','proverbs',4,13,'apocrypha','ecclesiasticus',4,13,'extras',
      E'*He that holdeth her fast shall inherit glory; and wherever she entereth, Yahuah (God) will bless* (Sirach 4:13). *Take fast hold of instruction; let her not go: keep her; for she is thy life* (Proverbs 4:13) is the very counsel of the restored witness: *He that holdeth her fast shall inherit glory*. To take fast hold of Wisdom and not let her go is to inherit glory and the blessing of Yahuah; she is the holder''s life.'),
    ('canon','proverbs',4,13,'apocrypha','ecclesiasticus',6,27,'extras',
      E'*Search, and seek, and she shall be made known to you: and when you have got hold of her, let her not go* (Sirach 6:27). The command *let her not go: keep her; for she is thy life* (Proverbs 4:13) is repeated word for word in the restored witness: *when you have got hold of her, let her not go*. Wisdom is sought, found, and held fast — the grip never loosened, for she is the seeker''s life.'),
    ('canon','proverbs',4,13,'apocrypha','ecclesiasticus',6,26,'extras',
      E'*Come to her with your whole heart, and keep her ways with all your power* (Sirach 6:26). To *Take fast hold of instruction* (Proverbs 4:13) is to come to Wisdom *with your whole heart, and keep her ways with all your power*. The fast hold is the whole-hearted keeping; Wisdom is grasped not with half a heart but with all one''s power.'),

    -- THREAD 4: The path of the just is as the shining light (the two ways by light vs darkness)
    ('canon','proverbs',4,18,'canon','john',8,12,'free',
      E'*Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). *the path of the just is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18) finds its source in the Formed Son: *I am the light of the world: he that followeth me shall not walk in darkness*. The just walk in the light because they follow the Light; the path that shines toward the perfect day is the walk after Yahusha (Jesus).'),
    ('canon','proverbs',4,18,'canon','1-john',1,7,'free',
      E'*But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7). The shining path of the just — *as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18) — is the walk Yochanan (John) commands: *if we walk in the light, as he is in the light*. The just walk in the light; fellowship and cleansing belong to that walk, and the darkness has no part in it.'),
    ('canon','proverbs',4,19,'canon','1-john',2,11,'free',
      E'*But he that hateth his brother is in darkness, and walketh in darkness, and knoweth not whither he goeth, because that darkness hath blinded his eyes* (1 John 2:11). *The way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:19) is Yochanan''s (John''s) very portrait of the brother-hater: *walketh in darkness, and knoweth not whither he goeth, because that darkness hath blinded his eyes*. The blind stumbling of the wicked way is the blindness of the one who hates and walks in the dark.'),
    ('canon','proverbs',4,18,'canon','philippians',2,15,'free',
      E'*That ye may be blameless and harmless, the sons of Elohim (God), without rebuke, in the midst of a crooked and perverse nation, among whom ye shine as lights in the world* (Philippians 2:15). The just whose path is *as the shining light* (Proverbs 4:18) are the sons of Elohim who *shine as lights in the world*. The shining of the righteous path is the shining of the blameless sons set in the midst of a crooked nation — light against the surrounding dark.'),
    ('canon','proverbs',4,18,'canon','daniel',12,3,'free',
      E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). The path *as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18) opens into Daniel''s everlasting shining: *they that be wise shall shine as the brightness of the firmament... as the stars for ever and ever*. The just who walk the brightening path are the wise who shine at the last like the stars — the perfect day is the resurrection brightness.'),
    ('canon','proverbs',4,18,'canon','isaiah',2,5,'free',
      E'*O house of Jacob, come ye, and let us walk in the light of Yahuah (LORD)* (Isaiah 2:5). The path of the just *as the shining light* (Proverbs 4:18) is the walk Isaiah calls the covenant house to: *O house of Jacob, come ye, and let us walk in the light of Yahuah (LORD)*. The light the just walk by is the light of Yahuah Himself; the call is to the whole house of Jacob to take the shining path.'),
    ('canon','proverbs',4,19,'apocrypha','the-wisdom-of-solomon',5,6,'extras',
      E'*Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* (Wisdom of Solomon 5:6). *The way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:19) is the very confession the wicked make too late in the restored witness: *the light of righteousness has not shined to us, and the sun of righteousness rose not upon us*. They erred from the way of truth and walked in darkness; the light they refused never dawned upon their path.'),

    -- THREAD 5: Keep thy heart — for out of it are the issues of life (the heart as the wellspring)
    ('canon','proverbs',4,23,'canon','matthew',12,34,'free',
      E'*O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh* (Matthew 12:34). *Keep thy heart with all diligence; for out of it are the issues of life* (Proverbs 4:23) is pressed by Yahusha (Jesus): *out of the abundance of the heart the mouth speaketh*. The heart is the wellspring; what fills it issues out in word and deed — therefore it must be kept with all diligence.'),
    ('canon','proverbs',4,23,'canon','matthew',12,35,'free',
      E'*A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things* (Matthew 12:35). The *issues of life* that flow from the kept heart (Proverbs 4:23) are the treasure Yahusha (Jesus) names: *A good man out of the good treasure of the heart bringeth forth good things*. The heart is the store from which the life issues; a good treasure within yields good without.'),
    ('canon','proverbs',4,23,'canon','matthew',15,19,'free',
      E'*For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies* (Matthew 15:19). *out of it are the issues of life* (Proverbs 4:23) — and Yahusha (Jesus) names the issues of the unkept heart: *out of the heart proceed evil thoughts, murders, adulteries*. Because the heart is the source of all that defiles or cleanses, it is the one thing to be kept above all keeping.'),
    ('canon','proverbs',4,23,'canon','luke',6,45,'free',
      E'*A good man out of the good treasure of his heart bringeth forth that which is good; and an evil man out of the evil treasure of his heart bringeth forth that which is evil: for of the abundance of the heart his mouth speaketh* (Luke 6:45). The wellspring of *out of it are the issues of life* (Proverbs 4:23) is the heart''s treasure: *out of the good treasure of his heart bringeth forth that which is good... for of the abundance of the heart his mouth speaketh*. Guard the spring and the stream is clean; the kept heart is the kept life.'),
    ('canon','proverbs',4,23,'canon','proverbs',23,7,'free',
      E'*For as he thinketh in his heart, so is he: Eat and drink, saith he to thee; but his heart is not with thee* (Proverbs 23:7). The reason to *Keep thy heart with all diligence* (Proverbs 4:23) is the proverb''s own law of the inward man: *as he thinketh in his heart, so is he*. The man is what his heart is; therefore the keeping of the heart is the keeping of the whole man, for from it are the issues of life.'),

    -- THREAD 6: Ponder the path of thy feet — turn not to the right hand nor to the left (the straight path)
    ('canon','proverbs',4,27,'canon','deuteronomy',5,32,'free',
      E'*Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32). *Turn not to the right hand nor to the left: remove thy foot from evil* (Proverbs 4:27) is the Torah''s own charge word for word: *ye shall not turn aside to the right hand or to the left*. The straight path the son is to keep is the path of obedience Moshe (Moses) set — neither to the right nor to the left of the commandment.'),
    ('canon','proverbs',4,27,'canon','deuteronomy',28,14,'free',
      E'*And thou shalt not go aside from any of the words which I command thee this day, to the right hand, or to the left, to go after other gods to serve them* (Deuteronomy 28:14). *Turn not to the right hand nor to the left* (Proverbs 4:27) is the covenant''s blessing-condition: *thou shalt not go aside from any of the words which I command thee... to the right hand, or to the left*. To turn aside is to go after other gods; the kept-straight path is the kept covenant.'),
    ('canon','proverbs',4,26,'canon','isaiah',35,8,'free',
      E'*And an highway shall be there, and a way, and it shall be called The way of holiness; the unclean shall not pass over it; but it shall be for those: the wayfaring men, though fools, shall not err therein* (Isaiah 35:8). To *Ponder the path of thy feet, and let all thy ways be established* (Proverbs 4:26) is to walk the way Isaiah names: *The way of holiness... the wayfaring men, though fools, shall not err therein*. The pondered, established path is the highway of holiness on which the walker does not err.'),
    ('canon','proverbs',4,26,'canon','hebrews',12,13,'free',
      E'*And make straight paths for your feet, lest that which is lame be turned out of the way; but let it rather be healed* (Hebrews 12:13). *Ponder the path of thy feet, and let all thy ways be established* (Proverbs 4:26) is taken up whole by the writer to the Hebrews: *make straight paths for your feet, lest that which is lame be turned out of the way*. The pondered, established path is the straight path made for the feet, that the walker not be turned aside but healed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction',
       E'Forsake ye not my torah — the father''s transmitted instruction',
       E'The chapter opens on the handing-down of wisdom along the covenant line: *Hear, ye children, the instruction of a father, and attend to know understanding. For I give you good doctrine, forsake ye not my law* (Proverbs 4:1-2). And the father names where his own teaching came from — his father before him: *For I was my father''s son, tender and only beloved in the sight of my mother. He taught me also, and said unto me, Let thine heart retain my words: keep my commandments, and live* (Proverbs 4:3-4). This is covenant transmission — the paternal line and the covenant-word together, the Torah passed from father to son to son. It is the Shema''s own demand: *And these words, which I command thee this day, shall be in thine heart: And thou shalt teach them diligently unto thy children* (Deuteronomy 6:6-7). The Psalmist vows the same unbroken handing-down: *We will not hide them from their children, shewing to the generation to come* (Psalm 78:4), *he... appointed a law in Yashar''el (Israel), which he commanded our fathers, that they should make them known to their children* (Psalm 78:5). And the book''s own first charge is sounded again: *My son, hear the instruction of thy father, and forsake not the law of thy mother* (Proverbs 1:8). The restored witness keeps the same promise to the one who holds the inheritance — *Wisdom exalteth her children, and layeth hold of them that seek her* (Sirach 4:11), matching *Exalt her, and she shall promote thee: she shall bring thee to honour... a crown of glory shall she deliver to thee* (Proverbs 4:8-9) — and presses the lifelong gathering: *My son, gather instruction from your youth up: so shall you find wisdom till your old age* (Sirach 6:18). The torah is not the father''s invention but the deposit handed to him and handed on; to forsake it is to break the chain, to keep it is to live.',
       sv.verse_id, ev.verse_id, 'extras', 28075
  FROM _s304_pr04_lookup sv, _s304_pr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-4-wisdom-is-the-principal-thing-therefore-get-wisdom',
       E'Wisdom is the principal thing — therefore get wisdom',
       E'The father presses the one acquisition above all others: *Wisdom is the principal thing; therefore get wisdom: and with all thy getting get understanding* (Proverbs 4:7). Whatever else a man gets, with all his getting he is to get understanding — for wisdom is the principal, the first and chief, thing. Job names what that principal thing is: *Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). The wisdom to be gotten is the fear of Yahuah; the understanding sought is the departing from evil. And Yahusha (Jesus) shows the man who reckons it the principal thing — he sells everything else to gain it: *the kingdom of heaven is like unto treasure hid in a field; the which when a man hath found, he hideth, and for joy thereof goeth and selleth all that he hath, and buyeth that field* (Matthew 13:44); *Who, when he had found one pearl of great price, went and sold all that he had, and bought it* (Matthew 13:46). The principal thing is the treasure and the pearl, worth the giving of all the rest. And Ya''aqov (James) names how the lacking man gets it: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). The principal thing is gotten by selling all and by asking of the One who gives it freely — get wisdom, and with all thy getting get understanding.',
       sv.verse_id, ev.verse_id, 'free', 28078
  FROM _s304_pr04_lookup sv, _s304_pr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-4-take-fast-hold-of-instruction-let-her-not-go-she-is-thy-life',
       E'Take fast hold of instruction — let her not go, for she is thy life',
       E'Having charged the son to get wisdom, the father charges him to keep his grip on her and never loosen it: *Take fast hold of instruction; let her not go: keep her; for she is thy life* (Proverbs 4:13). Wisdom once gotten is not to be set down; she is the holder''s very life, to be gripped fast. The restored witness keeps the same counsel almost word for word. The reward of the fast grip: *He that holdeth her fast shall inherit glory; and wherever she entereth, Yahuah (God) will bless* (Sirach 4:13) — to hold Wisdom fast is to inherit glory and the blessing of Yahuah. The manner of the grip: *Come to her with your whole heart, and keep her ways with all your power* (Sirach 6:26) — the fast hold is the whole-hearted keeping, with all one''s power. And the very command repeated: *Search, and seek, and she shall be made known to you: and when you have got hold of her, let her not go* (Sirach 6:27) — *let her not go*, the same words the father speaks. Wisdom is sought, found, gripped, and never released; for she is not a possession among others but the life of the one who holds her.',
       sv.verse_id, ev.verse_id, 'extras', 28081
  FROM _s304_pr04_lookup sv, _s304_pr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-4-the-path-of-the-just-is-as-the-shining-light',
       E'The path of the just is as the shining light — the two ways by light and darkness',
       E'Here stand the two ways, drawn as light against darkness: *But the path of the just is as the shining light, that shineth more and more unto the perfect day. The way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:18-19). Two paths, two lights, two ends — the just brightening toward the perfect day, the wicked stumbling blind in the dark. This is the seed-war read by conduct, never by ethnicity: not two bloodlines but two walks. The light the just walk by is the Formed Son Himself: *I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). Yochanan (John) makes the walk-in-the-light the very test of the brethren — *if we walk in the light, as he is in the light, we have fellowship one with another* (1 John 1:7) — and paints the wicked way exactly as Proverbs does: *he that hateth his brother is in darkness, and walketh in darkness, and knoweth not whither he goeth, because that darkness hath blinded his eyes* (1 John 2:11) — the blind stumbling of *they know not at what they stumble*. The just shine as set lights against the dark: *the sons of Elohim (God), without rebuke, in the midst of a crooked and perverse nation, among whom ye shine as lights in the world* (Philippians 2:15); and their shining reaches the resurrection brightness — *they that be wise shall shine as the brightness of the firmament... as the stars for ever and ever* (Daniel 12:3) — the perfect day toward which the path shines. Isaiah sounds the call to take that path: *O house of Jacob, come ye, and let us walk in the light of Yahuah (LORD)* (Isaiah 2:5). And the restored witness gives the wicked''s own late confession from within the dark: *Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* (Wisdom of Solomon 5:6). The light of righteousness shines on the just unto the perfect day; on the wicked it never dawns, and they stumble where they cannot see.',
       sv.verse_id, ev.verse_id, 'extras', 28084
  FROM _s304_pr04_lookup sv, _s304_pr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-4-keep-thy-heart-for-out-of-it-are-the-issues-of-life',
       E'Keep thy heart — for out of it are the issues of life',
       E'The father turns to the spring of the whole man: *My son, attend to my words; incline thine ear unto my sayings... For they are life unto those that find them, and health to all their flesh. Keep thy heart with all diligence; for out of it are the issues of life* (Proverbs 4:20-23). The heart is the wellspring; everything a man does flows out of it, and so it is to be kept above all keeping. Yahusha (Jesus) presses the same truth again and again: *out of the abundance of the heart the mouth speaketh* (Matthew 12:34); *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things* (Matthew 12:35); *For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies* (Matthew 15:19). Luke gathers it whole: *A good man out of the good treasure of his heart bringeth forth that which is good... for of the abundance of the heart his mouth speaketh* (Luke 6:45). The issues of life flow from the heart''s treasure; guard the spring and the stream runs clean. And the proverb''s own law of the inward man names why: *For as he thinketh in his heart, so is he* (Proverbs 23:7) — the man is what his heart is. Therefore the one keeping that matters most is the keeping of the heart, for out of it are all the issues of life.',
       sv.verse_id, ev.verse_id, 'free', 28087
  FROM _s304_pr04_lookup sv, _s304_pr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=4 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-4-ponder-the-path-of-thy-feet-turn-not-to-the-right-hand-nor-to-the-left',
       E'Ponder the path of thy feet — turn not to the right hand nor to the left',
       E'The chapter closes on the body kept straight upon the path — mouth, eyes, and feet all set toward the one way: *Put away from thee a froward mouth, and perverse lips put far from thee. Let thine eyes look right on, and let thine eyelids look straight before thee. Ponder the path of thy feet, and let all thy ways be established. Turn not to the right hand nor to the left: remove thy foot from evil* (Proverbs 4:24-27). The last charge is the Torah''s own word, almost letter for letter: *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32); and the covenant''s blessing-condition, *thou shalt not go aside from any of the words which I command thee this day, to the right hand, or to the left, to go after other gods to serve them* (Deuteronomy 28:14). To turn aside is to leave the commandment and go after other gods; the kept-straight path is the kept covenant. The pondered, established path is the way Isaiah names: *an highway shall be there, and a way, and it shall be called The way of holiness... the wayfaring men, though fools, shall not err therein* (Isaiah 35:8). And the writer to the Hebrews takes the charge up whole: *And make straight paths for your feet, lest that which is lame be turned out of the way; but let it rather be healed* (Hebrews 12:13). The eyes looking right on, the feet pondered, the way neither to the right nor to the left — this is the straight walk of holiness, Torah-affirmed, on which the lame is healed and not turned out of the way.',
       sv.verse_id, ev.verse_id, 'free', 28090
  FROM _s304_pr04_lookup sv, _s304_pr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=4 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6) — the *forsake ye not my law* of 4:2 is the Shema''s demand; the torah set in the heart.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt teach them diligently unto thy children* (Deuteronomy 6:7) — the father teaching the son of 4:4 is the Shema''s command to hand the commandments down the covenant line.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*shewing to the generation to come... his wonderful works* (Psalm 78:4) — the *Hear, ye children* of 4:1 is the same handing-down; the fathers will not hide them from the children.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he... appointed a law in Yashar''el (Israel)... that they should make them known to their children* (Psalm 78:5) — the *keep my commandments* of 4:4 carries the appointed law down the generations.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*My son, hear the instruction of thy father, and forsake not the law of thy mother* (Proverbs 1:8) — the book''s own first charge sounded again at 4:1; father''s instruction and mother''s torah, one inheritance.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Wisdom exalteth her children, and layeth hold of them that seek her* (Sirach 4:11) — restored witness matching *Exalt her, and she shall promote thee* (4:8); the embrace is mutual.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*My son, gather instruction from your youth up: so shall you find wisdom till your old age* (Sirach 6:18) — the *Hear, ye children* of 4:1; instruction received young ripens to the wisdom of age.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-forsake-ye-not-my-torah-the-fathers-transmitted-instruction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28) — Job names the principal thing of 4:7; the wisdom to get is the fear of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-wisdom-is-the-principal-thing-therefore-get-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*treasure hid in a field... selleth all that he hath, and buyeth that field* (Matthew 13:44) — the get-wisdom-with-all-thy-getting of 4:7; the principal thing is worth selling all.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-wisdom-is-the-principal-thing-therefore-get-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*one pearl of great price... sold all that he had, and bought it* (Matthew 13:46) — the principal thing of 4:7 is the pearl; all the getting spent to gain the one understanding.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-wisdom-is-the-principal-thing-therefore-get-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally* (James 1:5) — how the principal thing of 4:7 is gotten: by asking of the One who gives it freely.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-wisdom-is-the-principal-thing-therefore-get-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He that holdeth her fast shall inherit glory... Yahuah (God) will bless* (Sirach 4:13) — the *Take fast hold... let her not go* of 4:13; the fast grip inherits glory.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-take-fast-hold-of-instruction-let-her-not-go-she-is-thy-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Come to her with your whole heart, and keep her ways with all your power* (Sirach 6:26) — the fast hold of 4:13 is the whole-hearted keeping, with all one''s power.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-take-fast-hold-of-instruction-let-her-not-go-she-is-thy-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when you have got hold of her, let her not go* (Sirach 6:27) — the very words of 4:13 (*let her not go*) repeated in the restored witness; the grip never loosened.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-take-fast-hold-of-instruction-let-her-not-go-she-is-thy-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am the light of the world: he that followeth me shall not walk in darkness* (John 8:12) — the shining path of the just (4:18) sources in the Formed Son; the just walk in the light because they follow the Light.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=18
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-the-path-of-the-just-is-as-the-shining-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*if we walk in the light, as he is in the light, we have fellowship* (1 John 1:7) — the shining path of 4:18 is the commanded walk; fellowship and cleansing belong to the light.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=18
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-the-path-of-the-just-is-as-the-shining-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*walketh in darkness, and knoweth not whither he goeth, because that darkness hath blinded his eyes* (1 John 2:11) — the dark way of 4:19 (*they know not at what they stumble*); the brother-hater''s blind stumbling.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-the-path-of-the-just-is-as-the-shining-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the sons of Elohim (God)... among whom ye shine as lights in the world* (Philippians 2:15) — the shining path of 4:18; the just shine as set lights in the midst of a crooked nation.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=18
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-the-path-of-the-just-is-as-the-shining-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*they that be wise shall shine as the brightness of the firmament... as the stars for ever and ever* (Daniel 12:3) — the path shining *unto the perfect day* (4:18); the resurrection brightness of the wise.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=18
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-the-path-of-the-just-is-as-the-shining-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*O house of Jacob, come ye, and let us walk in the light of Yahuah (LORD)* (Isaiah 2:5) — the call to take the shining path of 4:18; the light is the light of Yahuah Himself.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=18
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-the-path-of-the-just-is-as-the-shining-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* (Wisdom of Solomon 5:6) — the wicked''s late confession from within the dark way of 4:19; the light they refused never dawned.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-the-path-of-the-just-is-as-the-shining-light'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*out of the abundance of the heart the mouth speaketh* (Matthew 12:34) — the issues of life of 4:23 flow from the heart; what fills it issues out in word.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-keep-thy-heart-for-out-of-it-are-the-issues-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*out of the good treasure of the heart bringeth forth good things* (Matthew 12:35) — the issues of 4:23 are the heart''s treasure; a good store within yields good without.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-keep-thy-heart-for-out-of-it-are-the-issues-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*out of the heart proceed evil thoughts, murders, adulteries* (Matthew 15:19) — why the heart of 4:23 must be kept: it is the source of all that defiles.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-keep-thy-heart-for-out-of-it-are-the-issues-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*out of the good treasure of his heart bringeth forth that which is good... of the abundance of the heart his mouth speaketh* (Luke 6:45) — the wellspring of 4:23 whole; guard the spring and the stream runs clean.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-keep-thy-heart-for-out-of-it-are-the-issues-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For as he thinketh in his heart, so is he* (Proverbs 23:7) — the proverb''s law of the inward man behind 4:23; the man is what his heart is, so the heart is kept above all.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-keep-thy-heart-for-out-of-it-are-the-issues-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32) — the Torah''s word verbatim behind *Turn not to the right hand nor to the left* (4:27); the straight path is the path of obedience.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=27
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-ponder-the-path-of-thy-feet-turn-not-to-the-right-hand-nor-to-the-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt not go aside... to the right hand, or to the left, to go after other gods* (Deuteronomy 28:14) — the covenant''s blessing-condition behind 4:27; to turn aside is to go after other gods.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=27
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-ponder-the-path-of-thy-feet-turn-not-to-the-right-hand-nor-to-the-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*an highway... The way of holiness... the wayfaring men, though fools, shall not err therein* (Isaiah 35:8) — the pondered, established path of 4:26 is the highway of holiness on which the walker does not err.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=26
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-ponder-the-path-of-thy-feet-turn-not-to-the-right-hand-nor-to-the-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*make straight paths for your feet, lest that which is lame be turned out of the way; but let it rather be healed* (Hebrews 12:13) — *Ponder the path of thy feet* (4:26) taken up whole; the straight path heals the lame.'
  FROM cross_reference_threads t
  JOIN _s304_pr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=4 AND sv.verse_number=26
  JOIN _s304_pr04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-4-ponder-the-path-of-thy-feet-turn-not-to-the-right-hand-nor-to-the-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
