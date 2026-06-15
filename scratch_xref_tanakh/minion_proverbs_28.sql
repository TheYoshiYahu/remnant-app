-- ----- fragment: minion_proverbs_28.sql (Proverbs 28) -----
-- Chapter: Proverbs 28 — a chapter of antithetic couplets carrying a FRAMEWORK HEAVYWEIGHT at v.9: *He that turneth away his ear from hearing the law, even his prayer shall be abomination* (28:9). The chapter sets the Torah-keeper against the Torah-forsaker throughout — *They that forsake the law praise the wicked: but such as keep the law contend with them* (28:4); *Whoso keepeth the law is a wise son* (28:7); *they that seek Yahuah (LORD) understand all things* (28:5) — and binds acceptable prayer to a heard Torah. Around it run the conscience of the wicked vs the boldness of the righteous (28:1), confession-and-forsaking (28:13), the fear of Yahuah vs trusting one's own heart (28:14,26), and open-handed mercy to the poor (28:27).
-- Tag: pr28   Temp view: _s304_pr28_lookup
-- Sort band: base 28675, step 3 -> threads at 28675, 28678, 28681, 28684, 28687 (5 threads)
-- Source of EVERY row: 'canon','proverbs',28,v
--
-- Proverbs 28 coverage:
--   ★ v.1 (The wicked flee when no man pursueth: but the righteous are bold as a lion)
--        NT:     Romans 8:31 (If Elohim be for us, who can be against us) — THREAD 1
--        Extras: none warranted (the conscience/covenant figure is carried whole by Leviticus 26 + Romans 8)
--        Tanakh: ★ Leviticus 26:17 (ye shall flee when none pursueth you); Leviticus 26:36 (the sound of a shaken leaf shall chase them... they shall fall when none pursueth) — THREAD 1 (load-bearing: the covenant-curse on the conscience of the law-breaker)
--   v.4 (They that forsake the law praise the wicked: but such as keep the law contend with them)
--        NT/Extras/Tanakh: folded into THREAD 2 (the Torah-keeper / Torah-forsaker frame the heavyweight stands in)
--   v.5 (Evil men understand not judgment: but they that seek Yahuah understand all things)
--        folded into THREAD 2 (seeking Yahuah = understanding; the forsaker understands not)
--   v.7 (Whoso keepeth the law is a wise son: but he that is a companion of riotous men shameth his father)
--        Extras: Sirach 35:1 (He that keepeth the law brings offerings enough) — folded into THREAD 2
--        folded into THREAD 2 (Torah-keeping = wisdom; reinforces the Torah-thread)
--   ★★ v.9 (He that turneth away his ear from hearing the law, even his prayer shall be abomination) — THE FRAMEWORK HEAVYWEIGHT
--        NT:     ★ John 9:31 (Elohim heareth not sinners); 1 John 3:22 (whatsoever we ask, we receive, because we keep his commandments) — THREAD 2
--        Extras: ★ Sirach 34:24 (When one prayeth, and another curses, whose voice will Yahuah hear); Sirach 34:26 (a man that fasteth for his sins, and goes again... who will hear his prayer); Sirach 35:1 (He that keepeth the law brings offerings enough) — THREAD 2
--        Tanakh: ★★ Isaiah 1:15 (when ye make many prayers, I will not hear: your hands are full of blood); Jeremiah 6:19 (because they have not hearkened... nor to my law, but rejected it); Jeremiah 7:24 (they hearkened not, nor inclined their ear); Zechariah 7:13 (so they cried, and I would not hear); Proverbs 15:8 (the prayer of the upright is his delight); Proverbs 15:29 (he heareth the prayer of the righteous) — THREAD 2 (load-bearing centerpiece: Torah-hearing inseparable from acceptable prayer)
--   v.13 (He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy)
--        NT:     1 John 1:9 (if we confess our sins, he is faithful and just to forgive); Luke 18:13-14 (the publican... went down justified) — THREAD 3
--        Extras: none warranted distinct (the confession figure carried whole by Psalm 32 + 1 John + Luke)
--        Tanakh: ★ Psalm 32:5 (I will confess my transgressions unto Yahuah; and thou forgavest the iniquity) — THREAD 3
--   v.14 / v.26 (Happy is the man that feareth alway / He that trusteth in his own heart is a fool)
--        NT:     none warranted distinct (the heart/fear couplet carried by Proverbs laterals + Jeremiah)
--        Extras: none warranted distinct
--        Tanakh: ★ Proverbs 1:7 (the fear of Yahuah is the beginning of knowledge); Proverbs 3:5-7 (Trust in Yahuah with all thine heart; lean not unto thine own understanding); Jeremiah 17:9 (the heart is deceitful above all things) — THREAD 4
--   v.18 (Whoso walketh uprightly shall be saved: but he that is perverse in his ways shall fall at once)
--        folded into THREAD 2 (uprightness = the kept-law walk that contends with the wicked)
--   ★ v.27 (He that giveth unto the poor shall not lack: but he that hideth his eyes shall have many a curse)
--        NT:     2 Corinthians 9:7 (Elohim loveth a cheerful giver); Matthew 25:40 (Inasmuch as ye have done it unto one of the least of these) — THREAD 5
--        Extras: ★ Sirach 3:30 (alms makes an atonement for sins); Sirach 4:1 (defraud not the poor of his living); Sirach 4:6 (if he curse you... his prayer shall be heard of him that made him) — THREAD 5
--        Tanakh: ★ Deuteronomy 15:7-8 (thou shalt not harden thine heart, nor shut thine hand... open thine hand wide); Deuteronomy 15:11 (Thou shalt open thine hand wide unto thy brother); Proverbs 19:17 (He that hath pity upon the poor lendeth unto Yahuah) — THREAD 5
--   PRUDENTIAL COUPLETS, none warranted (folded contextually or merely-prudential, no thread): v.2 (transgression of a land/princes), v.3 (poor that oppresseth the poor), v.6 (better is the poor that walketh uprightly — touched in THREAD 5 prose), v.8 (usury gathered for him that will pity the poor — touched in THREAD 5 prose), v.10 (causeth righteous astray/own pit), v.11 (rich wise in own conceit — touched in THREAD 4 prose), v.12/v.28 (when wicked rise men hide — touched in THREAD 1 prose), v.15-17 (roaring lion ruler/oppressor/violence to blood), v.19-25 (tilleth land/faithful man/respect of persons/hasteth to be rich/rebuke vs flattery/robbeth father/proud heart): merely-prudential or civic, no framework-bearing weave warranted.
--
-- Threads (slug — target libraries):
--   1. proverbs-28-the-wicked-flee-the-righteous-bold-as-a-lion — Tanakh (Leviticus) + NT (Romans) [free] (the conscience of the wicked = the covenant-curse; the boldness of the righteous)
--   2. proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination — Tanakh (Isaiah, Jeremiah, Zechariah, Proverbs) + NT (John, 1 John) + Extras (Sirach) [extras] (★★ THE HEAVYWEIGHT: Torah-hearing inseparable from acceptable prayer; the anti-antinomian centerpiece)
--   3. proverbs-28-whoso-confesseth-and-forsaketh-his-sins-shall-have-mercy — Tanakh (Psalm) + NT (1 John, Luke) [free] (confession-and-forsaking; the publican justified)
--   4. proverbs-28-happy-is-the-man-that-feareth-but-the-fool-trusteth-his-own-heart — Tanakh (Proverbs, Jeremiah) [free] (the fear of Yahuah vs trusting one's deceitful heart)
--   5. proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack — Tanakh (Deuteronomy, Proverbs) + NT (2 Corinthians, Matthew) + Extras (Sirach) [extras] (the Torah's open hand; mercy to the poor lent unto Yahuah)
--
-- Framing notes:
--   ★★ THE HEAVYWEIGHT (THREAD 2): *He that turneth away his ear from hearing the law, even his prayer shall be abomination* (28:9). This is the framework's anti-antinomian centerpiece — Torah-hearing is INSEPARABLE from acceptable prayer. The man who shuts his ear to the Torah has his very prayer turned into an abomination; the Spirit and the Torah cannot be divided. The chapter itself frames the verse: *They that forsake the law praise the wicked: but such as keep the law contend with them* (28:4), *Whoso keepeth the law is a wise son* (28:7), *they that seek Yahuah (LORD) understand all things* (28:5). Isaiah pronounces the same rejected prayer when the hands forsake the law — *when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15). Jeremiah names the turned-away ear — *because they have not hearkened unto my words, nor to my law, but rejected it* (6:19); *they hearkened not, nor inclined their ear* (7:24). Zechariah closes the circle — *as he cried, and they would not hear; so they cried, and I would not hear, saith Yahuah Tseva'ot* (7:13). And the NT keeps the SAME measure, never abolishing it: *Now we know that Elohim (God) heareth not sinners: but if any man... doeth his will, him he heareth* (John 9:31); *whatsoever we ask, we receive of him, because we keep his commandments* (1 John 3:22). The restored witness states it bluntly — *He that keepeth the law brings offerings enough* (Sirach 35:1) — and asks the very question Proverbs answers: *When one prayeth, and another curses, whose voice will Yahuah (God) hear?* (Sirach 34:24). Acceptable prayer flows from a heard Torah; the ear that turns from the law makes the prayer an abomination.
--   ★ CONSCIENCE / COVENANT (THREAD 1): *The wicked flee when no man pursueth: but the righteous are bold as a lion* (28:1). The fleeing-when-none-pursueth is verbatim the Leviticus 26 covenant-curse on the law-breaker — *ye shall flee when none pursueth you* (26:17), *the sound of a shaken leaf shall chase them... they shall fall when none pursueth* (26:36). The guilty conscience IS the curse at work; the righteous, by contrast, are *bold as a lion* — for *If Elohim (God) be for us, who can be against us?* (Romans 8:31).
--   ★ CONFESSION (THREAD 3): *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (28:13). David sang the covering vs confessing — *I acknowledged my sin... I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest* (Psalm 32:5); Yochanan keeps it — *If we confess our sins, he is faithful and just to forgive* (1 John 1:9); and the publican shows it — *Elohim (God) be merciful to me a sinner... this man went down to his house justified* (Luke 18:13-14). Note the proverb demands BOTH halves: confess AND forsake — the same repentance the whole library teaches.
--   ★ FEAR vs OWN HEART (THREAD 4): *Happy is the man that feareth alway: but he that hardeneth his heart shall fall into mischief* (28:14); *He that trusteth in his own heart is a fool: but whoso walketh wisely, he shall be delivered* (28:26). The fear-of-Yahuah motif of Proverbs 1 and 9 — *The fear of Yahuah (LORD) is the beginning of knowledge* (1:7) — set against the deceitful heart Jeremiah exposes — *The heart is deceitful above all things, and desperately wicked: who can know it?* (17:9). The counsel is the Proverbs 3 charge: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (3:5).
--   ★ THE POOR (THREAD 5): *He that giveth unto the poor shall not lack: but he that hideth his eyes shall have many a curse* (28:27). This is the Torah's own open-hand command — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother: But thou shalt open thine hand wide unto him* (Deuteronomy 15:7-8). Proverbs makes the giving a loan to Yahuah Himself — *He that hath pity upon the poor lendeth unto Yahuah (LORD)* (19:17) — which the NT consummates: *Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me* (Matthew 25:40); *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The restored witness binds alms to atonement and to heard prayer — *alms makes an atonement for sins* (Sirach 3:30); *if he curse you in the bitterness of his soul, his prayer shall be heard of him that made him* (Sirach 4:6) — tying THREAD 5 back to the heard-prayer of THREAD 2.
--   EXTRAS: Sirach (Ecclesiasticus) double-written edition 'apocrypha' + book 'ecclesiasticus'. Clean witnesses pulled: 34:24, 34:26, 35:1 (offering/prayer of the wicked unheard), 3:30, 4:1, 4:6 (alms/the poor). Sirach 34:18-22 and 35:12-17 weighed but not all forced (the chosen three each carry the prayer-and-law nexus cleanest).

CREATE TEMP VIEW _s304_pr28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: The wicked flee when no man pursueth (conscience / covenant-curse)
    ('canon','proverbs',28,1,'canon','leviticus',26,17,'free',
      E'*And I will set my face against you, and ye shall be slain before your enemies: they that hate you shall reign over you; and ye shall flee when none pursueth you* (Leviticus 26:17). The fleeing wicked of *The wicked flee when no man pursueth* (Proverbs 28:1) speak the very covenant-curse Yahuah set against the law-breaker: *ye shall flee when none pursueth you*. The guilty conscience is the curse already at work — the man who has forsaken the covenant runs from a sword that is not there.'),
    ('canon','proverbs',28,1,'canon','leviticus',26,36,'free',
      E'*And upon them that are left alive of you I will send a faintness into their hearts in the lands of their enemies; and the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth* (Leviticus 26:36). Here the curse of *The wicked flee when no man pursueth* (Proverbs 28:1) is drawn out in full — *the sound of a shaken leaf shall chase them... and they shall fall when none pursueth*. The faintness Yahuah sends into the heart of the covenant-breaker is the dread the wicked of the proverb carry with them.'),
    ('canon','proverbs',28,1,'canon','romans',8,31,'free',
      E'*What shall we then say to these things? If Elohim (God) be for us, who can be against us?* (Romans 8:31). Against the trembling of the wicked stands the lion-boldness of *the righteous are bold as a lion* (Proverbs 28:1): *If Elohim (God) be for us, who can be against us?* The righteous do not flee, for the One who set His face against the law-breaker is FOR them; the boldness is not their own nerve but their standing in the covenant.'),

    -- THREAD 2: He that turneth away his ear from the law, his prayer abomination (THE HEAVYWEIGHT)
    ('canon','proverbs',28,9,'canon','isaiah',1,15,'free',
      E'*And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15). This is *even his prayer shall be abomination* (Proverbs 28:9) pronounced over a whole people: when the hands that lift in prayer have forsaken the law, *when ye make many prayers, I will not hear*. The prayer is not refused for want of fervour but because the ear was first turned from the Torah; the lifted hands are full of blood.'),
    ('canon','proverbs',28,9,'canon','jeremiah',6,19,'free',
      E'*Hear, O earth: behold, I will bring evil upon this people, even the fruit of their thoughts, because they have not hearkened unto my words, nor to my law, but rejected it* (Jeremiah 6:19). Jeremiah names the very turning of *He that turneth away his ear from hearing the law* (Proverbs 28:9): the judgment comes *because they have not hearkened unto my words, nor to my law, but rejected it*. The rejected law and the unheard prayer are one verdict — the ear that will not hear the Torah is the ear Yahuah will not answer.'),
    ('canon','proverbs',28,9,'canon','jeremiah',7,24,'free',
      E'*But they hearkened not, nor inclined their ear, but walked in the counsels and in the imagination of their evil heart, and went backward, and not forward* (Jeremiah 7:24). The turned-away ear of Proverbs 28:9 is exactly this — *they hearkened not, nor inclined their ear*. Yahuah had asked only *Obey my voice, and I will be your Elohim (God)* (7:23); the people inclined no ear, and so their cry, when it came, found a hidden face.'),
    ('canon','proverbs',28,9,'canon','zechariah',7,13,'free',
      E'*Therefore it is come to pass, that as he cried, and they would not hear; so they cried, and I would not hear, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 7:13). Zechariah states the law of Proverbs 28:9 as a perfect mirror: because *they would not hear* the Torah and the prophets, *so they cried, and I would not hear*. The shut ear is answered by a shut ear; the abomination of the law-forsaker''s prayer is its going unheard.'),
    ('canon','proverbs',28,9,'canon','proverbs',15,8,'free',
      E'*The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8). The same book sets the measure twice: as *even his prayer shall be abomination* (28:9), so *the sacrifice of the wicked is an abomination to Yahuah*. Sacrifice and prayer alike are abomination when offered by the law-forsaker, while *the prayer of the upright is his delight* — acceptance turns on whether the ear has heard the Torah.'),
    ('canon','proverbs',28,9,'canon','proverbs',15,29,'free',
      E'*Yahuah (LORD) is far from the wicked: but he heareth the prayer of the righteous* (Proverbs 15:29). The hearing and the not-hearing of Proverbs 28:9 are stated plain: *Yahuah (LORD) is far from the wicked: but he heareth the prayer of the righteous*. The righteous, who keep His law, are heard; the wicked, who turn the ear away, find Him far off.'),
    ('canon','proverbs',28,9,'canon','john',9,31,'free',
      E'*Now we know that Elohim (God) heareth not sinners: but if any man be a worshipper of Elohim (God), and doeth his will, him he heareth* (John 9:31). The NT keeps the very rule of Proverbs 28:9, never abolishing it: *Elohim (God) heareth not sinners: but if any man... doeth his will, him he heareth*. Hearing the prayer is bound to doing His will — to a hearkened, not a turned-away, ear.'),
    ('canon','proverbs',28,9,'canon','1-john',3,22,'free',
      E'*And whatsoever we ask, we receive of him, because we keep his commandments, and do those things that are pleasing in his sight* (1 John 3:22). Yochanan states the positive of Proverbs 28:9: where turning the ear from the law makes the prayer an abomination, *we receive of him, because we keep his commandments*. Answered prayer and kept commandments are inseparable on both sides of the library — the Torah-hearing is the ground of the heard prayer.'),
    ('canon','proverbs',28,9,'apocrypha','ecclesiasticus',34,24,'extras',
      E'*When one prayeth, and another curses, whose voice will Yahuah (God) hear?* (Sirach 34:24). The restored witness asks the very question Proverbs 28:9 answers — *whose voice will Yahuah (God) hear?* — when the one praying has turned his ear from the law. The unjust offering and the unhearkened Torah make the prayer no prayer Yahuah will hear.'),
    ('canon','proverbs',28,9,'apocrypha','ecclesiasticus',34,26,'extras',
      E'*So is it with a man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer? or what does his humbling profit him?* (Sirach 34:26). The abomination-prayer of Proverbs 28:9 is here the fast of the unrepentant: *a man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer?* The ear turned from the law cannot be covered by ritual; the prayer of the one who will not hearken profits him nothing.'),
    ('canon','proverbs',28,9,'apocrypha','ecclesiasticus',35,1,'extras',
      E'*He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Sirach 35:1). Where Proverbs 28:9 makes the law-forsaker''s prayer an abomination, the restored witness makes the law-keeper''s very obedience an offering: *He that keepeth the law brings offerings enough*. The kept Torah IS the acceptable approach; the turned-away ear is the rejected one.'),

    -- THREAD 3: Whoso confesseth and forsaketh his sins shall have mercy
    ('canon','proverbs',28,13,'canon','psalms',32,5,'free',
      E'*I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin. Selah* (Psalm 32:5). David sings the two halves of *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13): he would no longer cover — *mine iniquity have I not hid* — but confessed, *and thou forgavest the iniquity of my sin*. The uncovered sin is the forgiven sin.'),
    ('canon','proverbs',28,13,'canon','1-john',1,9,'free',
      E'*If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). Yochanan keeps the promise of *whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13): *If we confess our sins, he is faithful and just to forgive*. The covering hand of the proverb is opened in confession, and the mercy answers — faithful and just.'),
    ('canon','proverbs',28,13,'canon','luke',18,13,'free',
      E'*And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13). The publican does what *whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13) commends — he covers nothing, but smites his breast: *Elohim (God) be merciful to me a sinner*. The confessed sin, not the hidden one, is the one met with mercy.'),
    ('canon','proverbs',28,13,'canon','luke',18,14,'free',
      E'*I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 18:14). The mercy of *whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13) lands on the publican: *this man went down to his house justified rather than the other*. The Pharisee covered his sin under his works and did not prosper; the publican confessed and found mercy.'),

    -- THREAD 4: Happy is the man that feareth — the fool trusteth his own heart
    ('canon','proverbs',28,14,'canon','proverbs',1,7,'free',
      E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). The blessing of *Happy is the man that feareth alway* (Proverbs 28:14) rests on the doorway of the whole book: *The fear of Yahuah (LORD) is the beginning of knowledge*. The man who fears always walks in the knowledge that fear begins; the one who hardens his heart is the fool who despises instruction.'),
    ('canon','proverbs',28,26,'canon','proverbs',3,5,'free',
      E'*Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5). The folly of *He that trusteth in his own heart is a fool* (Proverbs 28:26) is the exact thing this charge forbids: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding*. The wise walk is to lean on Yahuah, not on the heart''s own counsel; to trust the self is named folly in both places.'),
    ('canon','proverbs',28,26,'canon','jeremiah',17,9,'free',
      E'*The heart is deceitful above all things, and desperately wicked: who can know it?* (Jeremiah 17:9). Jeremiah tells WHY *He that trusteth in his own heart is a fool* (Proverbs 28:26): *The heart is deceitful above all things, and desperately wicked*. To trust a heart no man can even know is folly; the wise walk is the one delivered out from under that deceit, leaning on Yahuah instead.'),

    -- THREAD 5: He that giveth unto the poor shall not lack (the open hand)
    ('canon','proverbs',28,27,'canon','deuteronomy',15,7,'free',
      E'*If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). The hidden eyes of *he that hideth his eyes shall have many a curse* (Proverbs 28:27) are the hardened heart and shut hand the Torah forbids: *thou shalt not harden thine heart, nor shut thine hand from thy poor brother*. The proverb is the Torah''s own open-hand command set as a couplet.'),
    ('canon','proverbs',28,27,'canon','deuteronomy',15,11,'free',
      E'*For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The giving of *He that giveth unto the poor shall not lack* (Proverbs 28:27) is a standing command, not a mood: *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy*. The wide-open hand of the Torah is the hand that does not lack.'),
    ('canon','proverbs',28,27,'canon','proverbs',19,17,'free',
      E'*He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). Why *He that giveth unto the poor shall not lack* (Proverbs 28:27)? Because, the same book says, *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again*. The gift to the poor is a loan to Yahuah, and He is no man''s debtor.'),
    ('canon','proverbs',28,27,'canon','2-corinthians',9,7,'free',
      E'*Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The open hand of *He that giveth unto the poor shall not lack* (Proverbs 28:27) is kept whole in the NT: *Elohim (God) loveth a cheerful giver*. The giving that does not lack is the giving that is glad, not grudging — the heart behind the open hand.'),
    ('canon','proverbs',28,27,'canon','matthew',25,40,'free',
      E'*And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me* (Matthew 25:40). The poor of *He that giveth unto the poor shall not lack* (Proverbs 28:27) are the very ones the King receives as Himself: *Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me*. The loan to Yahuah of Proverbs 19:17 is repaid at the judgment; the hidden eyes inherit the curse.'),
    ('canon','proverbs',28,27,'apocrypha','ecclesiasticus',3,30,'extras',
      E'*Water will quench a flaming fire; and alms makes an atonement for sins* (Sirach 3:30). The restored witness binds the giving of *He that giveth unto the poor shall not lack* (Proverbs 28:27) to atonement itself: *alms makes an atonement for sins*. Mercy to the poor is not a small prudence but a weighty thing before Yahuah — as water to fire, so alms to sin.'),
    ('canon','proverbs',28,27,'apocrypha','ecclesiasticus',4,1,'extras',
      E'*My son, defraud not the poor of his living, and make not the needy eyes to wait long* (Sirach 4:1). The hidden eyes of *he that hideth his eyes shall have many a curse* (Proverbs 28:27) are here the defrauding that *make[s] the needy eyes to wait long*. The same charge runs through the restored witness: do not turn the eye away from the poor man''s need.'),
    ('canon','proverbs',28,27,'apocrypha','ecclesiasticus',4,6,'extras',
      E'*For if he curse you in the bitterness of his soul, his prayer shall be heard of him that made him* (Sirach 4:6). The *many a curse* upon him that hides his eyes (Proverbs 28:27) is here made fearful: *if he curse you in the bitterness of his soul, his prayer shall be heard of him that made him*. The poor man''s cry is heard — the very heard-prayer of THREAD 2 — and the one who shut his hand stands under it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-28-the-wicked-flee-the-righteous-bold-as-a-lion',
       E'The wicked flee when no man pursueth — the righteous bold as a lion',
       E'The chapter opens on the two consciences: *The wicked flee when no man pursueth: but the righteous are bold as a lion* (Proverbs 28:1). The wicked man''s flight from a pursuer who is not there is no random fear — it is the Leviticus 26 covenant-curse on the law-breaker working in his own heart: *I will set my face against you... and ye shall flee when none pursueth you* (Leviticus 26:17), *the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth* (Leviticus 26:36). The faintness Yahuah sends into the heart of the one who forsook the covenant is the very dread the proverb sees. The righteous, by contrast, stand *bold as a lion* — and the ground of that boldness is not nerve but standing: *What shall we then say to these things? If Elohim (God) be for us, who can be against us?* (Romans 8:31). The one who keeps the covenant has the Judge of the law-breaker FOR him, and so does not flee. (The same picture closes the chapter — *When the wicked rise, men hide themselves: but when they perish, the righteous increase* (28:28) — the trembling wicked and the steadfast righteous bracketing the whole.)',
       sv.verse_id, ev.verse_id, 'free', 28675
  FROM _s304_pr28_lookup sv, _s304_pr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=28 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (THE HEAVYWEIGHT)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination',
       E'He that turneth his ear from the Torah — even his prayer an abomination',
       E'The framework heavyweight of the chapter stands at its center: *He that turneth away his ear from hearing the law, even his prayer shall be abomination* (Proverbs 28:9). Torah-hearing is INSEPARABLE from acceptable prayer. The man who shuts his ear to the instruction of Yahuah does not merely sin in conduct — his very prayer is turned into an abomination; the Spirit and the Torah cannot be divided, and there is no acceptable approach to Yahuah over a stopped ear. The chapter itself frames the verse, setting the Torah-keeper against the Torah-forsaker on every side: *They that forsake the law praise the wicked: but such as keep the law contend with them* (28:4); *they that seek Yahuah (LORD) understand all things* (28:5); *Whoso keepeth the law is a wise son* (28:7); *Whoso walketh uprightly shall be saved* (28:18). Isaiah pronounces the rejected prayer over a whole people whose hands have forsaken the law: *when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15). Jeremiah names the turned-away ear exactly — *because they have not hearkened unto my words, nor to my law, but rejected it* (6:19), *they hearkened not, nor inclined their ear, but walked in... the imagination of their evil heart* (7:24). Zechariah closes the circle into a perfect mirror: *as he cried, and they would not hear; so they cried, and I would not hear, saith Yahuah Tseva''ot (LORD of hosts)* (7:13). The same book of Proverbs states the measure twice more — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (15:8); *Yahuah (LORD) is far from the wicked: but he heareth the prayer of the righteous* (15:29). And — this is the anti-antinomian hinge — the New Testament keeps the SAME rule, never abolishing it: *Now we know that Elohim (God) heareth not sinners: but if any man... doeth his will, him he heareth* (John 9:31); *whatsoever we ask, we receive of him, because we keep his commandments* (1 John 3:22). The restored witness puts it bluntly and asks the very question Proverbs answers: *He that keepeth the law brings offerings enough* (Sirach 35:1); *When one prayeth, and another curses, whose voice will Yahuah (God) hear?* (Sirach 34:24); *a man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer?* (Sirach 34:26). From Torah to prophets to Proverbs to the apostles to the restored witnesses, the testimony is one: acceptable prayer flows from a heard Torah, and the ear that turns from the law makes even the prayer an abomination.',
       sv.verse_id, ev.verse_id, 'extras', 28678
  FROM _s304_pr28_lookup sv, _s304_pr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=28 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-28-whoso-confesseth-and-forsaketh-his-sins-shall-have-mercy',
       E'Whoso confesseth and forsaketh his sins shall have mercy',
       E'Against the covering of sin the chapter sets the uncovering: *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13). Note the proverb demands BOTH halves — confess AND forsake — the whole turning the library calls repentance. David sang the contrast of the covered and the confessed sin: *I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5) — the uncovered sin is the forgiven sin. Yochanan keeps the same promise whole: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). And Yahusha (Jesus) sets the proverb living in a parable: the Pharisee covered his sin under his own works and went home unjustified, while *the publican... smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13) — and *this man went down to his house justified rather than the other* (Luke 18:14). The mercy of the proverb lands on the one who covers nothing; the man who hides his sin does not prosper.',
       sv.verse_id, ev.verse_id, 'free', 28681
  FROM _s304_pr28_lookup sv, _s304_pr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=28 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-28-happy-is-the-man-that-feareth-but-the-fool-trusteth-his-own-heart',
       E'Happy is the man that feareth — but the fool trusteth his own heart',
       E'The chapter twins a blessing and a folly around the heart: *Happy is the man that feareth alway: but he that hardeneth his heart shall fall into mischief* (Proverbs 28:14), and *He that trusteth in his own heart is a fool: but whoso walketh wisely, he shall be delivered* (Proverbs 28:26). The happy man is the one who fears Yahuah always; the fool is the one who leans on the counsel of his own heart. The blessing rests on the doorway of the whole book — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7) — and the folly is exactly what the great charge of Proverbs 3 forbids: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (3:5). And Jeremiah tells why trusting the self is folly: *The heart is deceitful above all things, and desperately wicked: who can know it?* (Jeremiah 17:9). To lean on a heart no man can even know is to lean on a thing that will betray him; the wise walk — the one *delivered* — leans on Yahuah instead, in the fear that is the beginning of wisdom.',
       sv.verse_id, ev.verse_id, 'free', 28684
  FROM _s304_pr28_lookup sv, _s304_pr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=28 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack',
       E'He that giveth unto the poor shall not lack — the open hand',
       E'The chapter''s mercy-couplet binds the open hand to its sure reward: *He that giveth unto the poor shall not lack: but he that hideth his eyes shall have many a curse* (Proverbs 28:27). This is no new ethic but the Torah''s own open-hand command set as a proverb: *thou shalt not harden thine heart, nor shut thine hand from thy poor brother: But thou shalt open thine hand wide unto him* (Deuteronomy 15:7-8), *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The hidden eyes of the proverb are the hardened heart and shut hand the Torah forbids. And the giving does not lack because, the same book says, it is a loan to Yahuah Himself: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). The New Testament keeps the open hand whole — *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) — and tells when the loan is repaid: *Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me* (Matthew 25:40). The restored witness weighs the matter heavier still, binding alms to atonement and the poor man''s cry to the heard prayer: *alms makes an atonement for sins* (Sirach 3:30); *defraud not the poor of his living, and make not the needy eyes to wait long* (Sirach 4:1); *if he curse you in the bitterness of his soul, his prayer shall be heard of him that made him* (Sirach 4:6) — the very heard-prayer of the Torah-hearing thread, now turned against the man who shut his hand. The open hand does not lack; the hidden eyes inherit the curse.',
       sv.verse_id, ev.verse_id, 'extras', 28687
  FROM _s304_pr28_lookup sv, _s304_pr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=28 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*and ye shall flee when none pursueth you* (Leviticus 26:17) — the fleeing wicked of 28:1 speak the verbatim covenant-curse on the law-breaker; the guilty conscience is the curse at work.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=1
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-the-wicked-flee-the-righteous-bold-as-a-lion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the sound of a shaken leaf shall chase them... they shall fall when none pursueth* (Leviticus 26:36) — the curse of 28:1 drawn out in full; the faintness Yahuah sends into the law-breaker''s heart.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=1
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-the-wicked-flee-the-righteous-bold-as-a-lion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*If Elohim (God) be for us, who can be against us?* (Romans 8:31) — the lion-boldness of 28:1 grounded: the righteous do not flee, for the Judge of the law-breaker is FOR them.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=1
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-the-wicked-flee-the-righteous-bold-as-a-lion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15) — the abomination-prayer of 28:9 over a whole people; the lifted hands have forsaken the law.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*because they have not hearkened unto my words, nor to my law, but rejected it* (Jeremiah 6:19) — the turned-away ear of 28:9 named; rejected law and unheard prayer are one verdict.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they hearkened not, nor inclined their ear* (Jeremiah 7:24) — the very turning of 28:9; Yahuah asked only obedience, and the people inclined no ear.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*so they cried, and I would not hear, saith Yahuah Tseva''ot* (Zechariah 7:13) — the perfect mirror of 28:9: the shut ear answered by a shut ear.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8) — the same measure set twice; acceptance turns on the heard Torah.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah (LORD) is far from the wicked: but he heareth the prayer of the righteous* (Proverbs 15:29) — the hearing and not-hearing of 28:9 stated plain.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Elohim (God) heareth not sinners: but if any man... doeth his will, him he heareth* (John 9:31) — the NT keeps the rule of 28:9, never abolishing it; hearing bound to doing His will.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*whatsoever we ask, we receive of him, because we keep his commandments* (1 John 3:22) — the positive of 28:9; answered prayer and kept commandments inseparable.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*When one prayeth, and another curses, whose voice will Yahuah (God) hear?* (Sirach 34:24) — the restored witness asks the very question 28:9 answers.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*a man that fasteth for his sins, and goes again, and doeth the same: who will hear his prayer?* (Sirach 34:26) — the abomination-prayer of 28:9 as the fast of the unrepentant; ritual cannot cover the turned-away ear.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*He that keepeth the law brings offerings enough* (Sirach 35:1) — where 28:9 makes the forsaker''s prayer abomination, the kept Torah IS the acceptable approach.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-turneth-his-ear-from-the-torah-his-prayer-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5) — David sings the two halves of 28:13; the uncovered sin is the forgiven sin.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=13
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-whoso-confesseth-and-forsaketh-his-sins-shall-have-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If we confess our sins, he is faithful and just to forgive* (1 John 1:9) — Yochanan keeps the promise of 28:13; the covering hand opened in confession, the mercy answers.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=13
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-whoso-confesseth-and-forsaketh-his-sins-shall-have-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the publican... smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13) — the publican does what 28:13 commends, covering nothing.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=13
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-whoso-confesseth-and-forsaketh-his-sins-shall-have-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*this man went down to his house justified rather than the other* (Luke 18:14) — the mercy of 28:13 lands on the confessor, not the self-covering Pharisee.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=13
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-whoso-confesseth-and-forsaketh-his-sins-shall-have-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) — the blessing of 28:14 rests on the book''s own doorway.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=14
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-happy-is-the-man-that-feareth-but-the-fool-trusteth-his-own-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5) — the folly of 28:26 is the exact thing this charge forbids.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=26
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-happy-is-the-man-that-feareth-but-the-fool-trusteth-his-own-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The heart is deceitful above all things, and desperately wicked: who can know it?* (Jeremiah 17:9) — why trusting one''s own heart (28:26) is folly; a heart no man can even know will betray him.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=26
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-happy-is-the-man-that-feareth-but-the-fool-trusteth-his-own-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7) — the hidden eyes of 28:27 are the hardened heart and shut hand the Torah forbids.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* (Deuteronomy 15:11) — the giving of 28:27 is a standing Torah command, not a mood.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17) — why the giver of 28:27 does not lack: the gift is a loan to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) — the NT keeps the open hand of 28:27 whole; the giving that does not lack is glad, not grudging.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me* (Matthew 25:40) — the loan to Yahuah of 28:27 repaid at the judgment; the King receives the poor as Himself.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Water will quench a flaming fire; and alms makes an atonement for sins* (Sirach 3:30) — the restored witness binds the giving of 28:27 to atonement itself.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*defraud not the poor of his living, and make not the needy eyes to wait long* (Sirach 4:1) — the hidden eyes of 28:27 as the defrauding that makes the needy wait.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*if he curse you in the bitterness of his soul, his prayer shall be heard of him that made him* (Sirach 4:6) — the *many a curse* of 28:27 made fearful; the poor man''s heard cry ties back to the heard-prayer of the Torah-hearing thread.'
  FROM cross_reference_threads t
  JOIN _s304_pr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=28 AND sv.verse_number=27
  JOIN _s304_pr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-28-he-that-giveth-unto-the-poor-shall-not-lack'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
