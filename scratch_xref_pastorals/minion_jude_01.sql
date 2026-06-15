-- ----- fragment: minion_jude_01.sql (S245 Jude) -----
-- =====================================================================
-- S245 minion — JUDE (Yahudah) FULL-LIBRARY cross-references — THE SHOWCASE
-- =====================================================================
-- Book: JUDE (one chapter, 25 verses). Tag: jude245 (temp view _s245_jude_lookup).
-- Sort band: floor 10210, step 3 (10210, 10213, 10216, 10219, 10222, 10225,
--            10228, 10231, 10234 used — 9 threads, within ~10240).
-- Source is ALWAYS the canon Jude verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — Jude is THE BOOK THAT VINDICATES THE EXTRA-CANONICAL LIBRARY FROM WITHIN
-- THE CANON. An apostle, the brother of James, writing to *them that are sanctified by Elohim*,
-- QUOTES 1 Enoch 1:9 by the named prophet *Enoch, the seventh from Adam* (v.14-15), invokes the
-- Watchers who *kept not their first estate* (v.6), and Michael's dispute over *the body of Moses*
-- (v.9, the Assumption of Moses). Jude writes to *earnestly contend for the faith which was once
-- delivered unto the saints* (v.3) against ungodly men who *turn the grace of our Elohim into
-- lasciviousness* (v.4) — antinomians who make grace a license to abandon the Torah. Jude's whole
-- weapon is the library's own judgment-history: the unbelieving wilderness, the Watchers, Sodom,
-- Cain, Balaam, Korah — every one a witness that Yahuah judges the lawless. The Torah and the whole
-- testimony stand; grace is no license. NO replacement theology, NO law-vs-grace antithesis (Jude
-- is explicitly anti-antinomian). Christology — the Formed: the Father *the only wise Elohim our
-- Saviour* (v.25); the Son *our Lord Yahusha HaMashiach* the Master through whom (v.4,21,25); no
-- co-equal-persons grammar. Titles preserved exactly as dump_canon returns.
--
-- PER-VERSE LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.4    grace turned into lasciviousness / the faith once delivered (v.3) — anti-antinomian frame
--          Tanakh: Deuteronomy 32:5 (corrupt, perverse generation), Deuteronomy 32:4 (the Rock just)
--          Extras: none warranted   NT: 2 Peter 2:1 (false teachers, denying the Lord — self-link)
--   v.5    Yahuah saved the people then destroyed them that believed not
--          Tanakh: Numbers 14:29,35-37 (carcases fall in the wilderness), Psalm 95:8-11 (sware in wrath)
--          Extras: none warranted   NT: 1 Corinthians 10:5,10 (overthrown in the wilderness — self-link)
--   v.6    the angels which kept not their first estate, reserved in everlasting chains — THE WATCHERS
--          Tanakh: Genesis 6:1-4 (the sons of Elohim, the daughters of men)
--          Extras: 1 Enoch 10:4-6,11-14 (Azazel and Semjaza bound), 12:4 (Enoch sent), 13:1 (no peace),
--                  21:11 (the prison of the angels for ever), Jubilees 5:6,10 (the Watchers bound)
--          NT: 1 Peter 3:19-20 (the spirits in prison — self-link, LIVE), 2 Peter 2:4 (angels that sinned — self-link, LIVE)
--   v.7    Sodom and Gomorrha set forth for an example, suffering eternal fire
--          Tanakh: Genesis 19:24-25 (brimstone and fire), Genesis 19:4-5 (the men of the city)
--          Extras: Wisdom of Solomon 10:6 (fled the fire that fell on the five cities)
--          NT: 2 Peter 2:6 (cities of Sodom turned into ashes — self-link)
--   v.9    Michael the archangel disputing about the body of Moses (the Assumption of Moses)
--          Tanakh: Zechariah 3:2 (Yahuah rebuke thee, O Satan), Deuteronomy 34:5-6 (no man knoweth
--                  his sepulchre), Daniel 10:13,21 (Michael one of the chief princes / your prince)
--          Extras: Assumption of Moses (named in prose — no clean witness in the library editions)
--          NT: 2 Peter 2:11 (angels bring not railing accusation — self-link)
--   v.11   the way of Cain, the error of Balaam, the gainsaying of Korah
--          Tanakh: Genesis 4:8 (Cain slew Abel), Numbers 31:16 / 22-24 (counsel of Balaam),
--                  Numbers 16:1,32-33 (Korah swallowed)
--          Extras: Wisdom of Solomon 10:3 (Cain who murdered his brother), Sirach 45:18-19 (Korah,
--                  Dathan, Abiram consumed)
--          NT: 1 John 3:12 (Cain who slew his brother — self-link), 2 Peter 2:15 (way of Balaam — self-link)
--   v.12-13 wandering stars, to whom is reserved the blackness of darkness for ever
--          Tanakh: Proverbs 25:14 (clouds and wind without rain), Isaiah 57:20 (the wicked like
--                  the troubled sea)
--          Extras: 1 Enoch 18:13-16 (the stars that transgressed, bound), 21:5-6 (the prison of the stars)
--          NT: 2 Peter 2:17 (wells without water, mist of darkness reserved — self-link)
--   v.14-15 Enoch the seventh from Adam prophesied — A DIRECT QUOTATION OF 1 ENOCH 1:9 — THE CAPSTONE
--          Tanakh: Deuteronomy 33:2 (he came with ten thousands of saints), Zechariah 14:5 (all the
--                  saints with thee), Genesis 5:18-24 (Enoch the seventh: Jared->Enoch / Enoch walked
--                  with Elohim and was not)
--          Extras: 1 Enoch 1:9 (Behold, He cometh with ten thousands of His set-apart ones... to convict
--                  all flesh of all the works of their ungodliness — THE VERSE JUDE QUOTES; SELF-LINK)
--          NT: none warranted (the quotation is the thread)
--   v.24-25 the doxology — to him that is able to keep you from falling — the only wise Elohim our Saviour
--          Tanakh: Psalm 121:3-4 (he that keepeth thee will not slumber), Deuteronomy 32:4 (the Rock,
--                  his work is perfect), Isaiah 45:21 (a just Elohim and a Saviour)
--          Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   10210 jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33   (Tanakh + Extras)  [★★★ CAPSTONE — SELF-LINK 1 ENOCH 1]
--   10213 jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10  (Tanakh + Extras + NT)  [★★★ WATCHERS — SELF-LINK 1 PETER 3 / 2 PETER 2]
--   10216 jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10   (Tanakh + NT)  [★★ ASSUMPTION OF MOSES]
--   10219 jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22  (Tanakh + Extras + NT)
--   10222 jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14  (Tanakh + NT)
--   10225 jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19  (Tanakh + Extras + NT)
--   10228 jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21  (Tanakh + Extras + NT)
--   10231 jude-1-able-to-keep-you-from-falling-psalm-121-deuteronomy-32  (Tanakh)
--   10234 jude-1-grace-turned-into-lasciviousness-the-faith-once-delivered-deuteronomy-32  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s245_jude_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33  [★★★ CAPSTONE]
  ('canon', 'jude', 1, 14, 'enoch', '1-enoch', 1, 9, 'extras', E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* (1 Enoch 1:9). This is the very verse Jude quotes: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints, To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him* (Jude 1:14-15). Word for word — *cometh with ten thousands,* *to execute judgment upon all,* *convict/convince all flesh... of all the works of their ungodliness which they have ungodly committed,* *the hard things/hard speeches which ungodly sinners have spoken against Him.* An apostle, the brother of James, names *Enoch, the seventh from Adam* a true prophet and cites his book as prophecy. The library is one; it ain''t new — the apostle reads the restored writing as the word it is.'),
  ('canon', 'jude', 1, 14, 'canon', 'deuteronomy', 33, 2, 'free', E'*And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* (Deuteronomy 33:2). The Tanakh root Enoch and Jude both draw on: Yahuah (LORD) *came with ten thousands of saints* — and Enoch prophesied, *Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). The fiery-law theophany at Sinai is the same coming-in-judgment the seventh from Adam foretold; from his right hand the Torah went forth, and grace is no escape from that law.'),
  ('canon', 'jude', 1, 14, 'canon', 'zechariah', 14, 5, 'free', E'*And ye shall flee to the valley of the mountains; for the valley of the mountains shall reach unto Azal: yea, ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah): and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). The same prophetic word: *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* — Enoch''s *ten thousands of his saints* (Jude 1:14), the day of Yahuah (LORD) when he comes to judge. Enoch the seventh, Moses at Sinai, and Zechariah all speak the one coming; Jude sets the antinomians under it.'),
  ('canon', 'jude', 1, 14, 'canon', 'genesis', 5, 18, 'free', E'*And Jared lived an hundred sixty and two years, and he begat Enoch:* (Genesis 5:18). The genealogy proves the title *the seventh from Adam* (Jude 1:14): Adam, Seth, Enos, Cainan, Mahalaleel, Jared, and then Enoch — the seventh. Jude does not invent the man; he names the patriarch of Genesis 5, the prophet whose book the library preserves, who *walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The seventh from Adam is no myth but the Enoch of the Torah''s own register.'),
  ('canon', 'jude', 1, 14, 'canon', 'genesis', 5, 24, 'free', E'*And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* (Genesis 5:24). The Torah''s own witness to the prophet Jude names: Enoch *walked with Elohim (God),* and was taken. The man whom Elohim (God) took is the *Enoch... the seventh from Adam* who *prophesied of these* (Jude 1:14) — the patriarch of Genesis 5 whose prophecy of the coming judgment the apostle cites as true. The one who walked with Elohim (God) spoke for Elohim (God).'),
  -- thread: jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10  [★★★ WATCHERS]
  ('canon', 'jude', 1, 6, 'canon', 'genesis', 6, 1, 'free', E'*And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them, That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:1-2). Here is the transgression Jude names: the angels *which kept not their first estate, but left their own habitation* (Jude 1:6) — *the sons of Elohim (God)* who *left their own habitation* in heaven and took the daughters of men, and *there were giants in the earth in those days* (Genesis 6:4). The bound order was broken; the Watchers are the angels Jude says are reserved in everlasting chains.'),
  ('canon', 'jude', 1, 6, 'enoch', '1-enoch', 10, 4, 'extras', E'*And again Yahuah (God) said to Raphael: Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4). This is precisely Jude''s *everlasting chains under darkness* (Jude 1:6): Azazel *bound hand and foot,* cast into the darkness, that *on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6). The library tells in full what Jude names in brief — the Watchers reserved in chains unto the judgment of the great day.'),
  ('canon', 'jude', 1, 6, 'enoch', '1-enoch', 10, 12, 'extras', E'*And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* (1 Enoch 10:12). Semjaza and his associates *bound fast... till the day of their judgement* — the very picture Jude gives: *reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). They *shall be led off to the abyss of fire... the prison in which they shall be confined for ever* (1 Enoch 10:13). The chains, the darkness, the appointed judgment — all here.'),
  ('canon', 'jude', 1, 6, 'enoch', '1-enoch', 13, 1, 'extras', E'*And Enoch went and said: Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds:* (1 Enoch 13:1). Enoch is sent to pronounce the sentence already gone forth — *a severe sentence... to put thee in bonds* — the bonds Jude calls *everlasting chains* (Jude 1:6). When Jude says these angels are *reserved... unto the judgment of the great day,* this is the scene: the proclamation that the rebel Watchers shall have no peace, no toleration, no request granted.'),
  ('canon', 'jude', 1, 6, 'enoch', '1-enoch', 21, 11, 'extras', E'*And he said unto me: This place is the prison of the angels, and here they will be imprisoned for ever.* (1 Enoch 21:11). Enoch is shown *the prison of the angels,* where *they will be imprisoned for ever* — Jude''s *everlasting chains under darkness* (Jude 1:6). The horrible place cleft as far as the abyss, full of descending columns of fire, is the prison reserved for the angels who kept not their first estate; the library names the very place Jude points to.'),
  ('canon', 'jude', 1, 6, 'jubilees', 'jubilees', 5, 6, 'extras', E'*And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* (Jubilees 5:6). Jubilees tells the same: the angels *bound in the depths of the earth,* kept separate — *after this they were bound in the depths of the earth for ever, until the day of the great condemnation* (Jubilees 5:10). This is Jude''s *everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), the Watchers bound until the judgment is executed on all who have corrupted their ways.'),
  ('canon', 'jude', 1, 6, 'canon', '1-peter', 3, 19, 'free', E'*By which also he went and preached unto the spirits in prison; Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing...* (1 Peter 3:19-20). Peter''s *spirits in prison... in the days of Noah* are Jude''s angels *reserved in everlasting chains under darkness* (Jude 1:6) — the same Watchers of Genesis 6, the Flood generation. The Formed Son proclaims the sentence already gone forth to the imprisoned spirits; this is the canon''s second pass over the Watchers, and Jude makes the third.'),
  ('canon', 'jude', 1, 6, 'canon', '2-peter', 2, 4, 'free', E'*For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Peter and Jude write the same sentence: *the angels that sinned... delivered into chains of darkness, to be reserved unto judgment* (2 Peter 2:4) is Jude''s *angels which kept not their first estate... reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). The two letters draw the Watchers from the one library — Genesis 6, 1 Enoch, Jubilees — as one settled witness that Yahuah (Lord) judges the lawless.'),
  -- thread: jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10  [★★ ASSUMPTION OF MOSES]
  ('canon', 'jude', 1, 9, 'canon', 'zechariah', 3, 2, 'free', E'*And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* (Zechariah 3:2). These are the exact words Michael speaks: *durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* (Jude 1:9). Where Zechariah saw the angel of Yahuah (LORD) and Satan standing to resist, and Yahuah (LORD) himself rebuking the accuser, Jude shows Michael disputing with the devil over the body of Moses and answering not with railing but with the one rebuke that belongs to Yahuah (LORD) alone.'),
  ('canon', 'jude', 1, 9, 'canon', 'deuteronomy', 34, 6, 'free', E'*And he buried him in a valley in the land of Moab, over against Beth-peor: but no man knoweth of his sepulchre unto this day.* (Deuteronomy 34:6). The Torah closes Moses'' story with a hidden grave — *no man knoweth of his sepulchre.* Jude tells what the Assumption of Moses preserved: that Michael *disputed about the body of Moses* (Jude 1:9). The unknown sepulchre is the very point of the dispute; the contest over the body of the servant of Yahuah (LORD) is why no man knows where he lies.'),
  ('canon', 'jude', 1, 9, 'canon', 'daniel', 10, 13, 'free', E'*But the prince of the kingdom of Persia withstood me one and twenty days: but, lo, Michael, one of the chief princes, came to help me; and I remained there with the kings of Persia.* (Daniel 10:13). Daniel names *Michael, one of the chief princes,* the warring prince of Yashar''el (Israel) — the same *Michael the archangel* who *contended with the devil* and *disputed about the body of Moses* (Jude 1:9). The one who stands up for Daniel''s people is the one who withstands the accuser over Moses'' body; Jude''s Michael is Daniel''s Michael.'),
  ('canon', 'jude', 1, 9, 'canon', 'daniel', 10, 21, 'free', E'*But I will shew thee that which is noted in the scripture of truth: and there is none that holdeth with me in these things, but Michael your prince.* (Daniel 10:21). *Michael your prince* — the guardian of Yashar''el (Israel), who *shall stand up... for the children of thy people* (Daniel 12:1). This is the Michael Jude names *the archangel,* contending with the devil over the body of Moses (Jude 1:9). Where the devil accuses, Michael does not rail but yields the rebuke to Yahuah (Lord); the prince of the people is no equal of the accuser, only Yahuah''s (Lord''s) servant.'),
  ('canon', 'jude', 1, 9, 'canon', '2-peter', 2, 11, 'free', E'*Whereas angels, which are greater in power and might, bring not railing accusation against them before Yahuah (Lord).* (2 Peter 2:11). Peter states the principle Jude shows in Michael: *angels, which are greater in power and might, bring not railing accusation* — even *Michael the archangel... durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* (Jude 1:9). The two letters teach the same restraint against the filthy dreamers who *speak evil of dignities* (Jude 1:8): the holy angels leave the rebuke to Yahuah (Lord).'),
  -- thread: jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22
  ('canon', 'jude', 1, 11, 'canon', 'genesis', 4, 8, 'free', E'*And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* (Genesis 4:8). The first of the three rebels Jude names: *they have gone in the way of Cain* (Jude 1:11). Cain, whose offering Yahuah (LORD) had not respected, *rose up against Abel his brother, and slew him* — the way of envy and bloodshed that despises the righteous. The antinomians walk it.'),
  ('canon', 'jude', 1, 11, 'canon', 'numbers', 31, 16, 'free', E'*Behold, these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor, and there was a plague among the congregation of Yahuah (LORD).* (Numbers 31:16). The second rebel: *ran greedily after the error of Balaam for reward* (Jude 1:11). Balaam, who *loved the wages of unrighteousness,* taught Balak to cast a stumblingblock before Yashar''el (Israel) — *the counsel of Balaam* that brought the plague at Peor. The error of Balaam is teaching Yahuah''s (LORD''s) people to sin for hire, the very thing the ungodly do who turn grace into lasciviousness.'),
  ('canon', 'jude', 1, 11, 'canon', 'numbers', 16, 32, 'free', E'*And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* (Numbers 16:32). The third rebel: *perished in the gainsaying of Core (Korah)* (Jude 1:11). Korah gathered the congregation against Moses and Aaron, and *the earth opened her mouth, and swallowed them up... They, and all that appertained to them, went down alive into the pit* (Numbers 16:32-33). The gainsaying of Korah is rebellion against the order Yahuah (LORD) appointed — and it perished. So shall the murmurers and complainers.'),
  ('canon', 'jude', 1, 11, 'apocrypha', 'the-wisdom-of-solomon', 10, 3, 'extras', E'*But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother.* (Wisdom of Solomon 10:3). The library reads Cain just as Jude does — *the way of Cain* (Jude 1:11) is the way of the unrighteous who *murdered his brother* and *perished... in the fury.* Wisdom traces the line of the wicked from Cain forward; Jude sets the antinomians in that same line of the firstborn rebel who slew the righteous.'),
  ('canon', 'jude', 1, 11, 'apocrypha', 'ecclesiasticus', 45, 18, 'extras', E'*Strangers conspired together against him, and maligned him in the wilderness, even the men that were of Dathan''s and Abiron''s side, and the congregation of Core, with fury and wrath.* (Sirach 45:18). Sirach remembers *the congregation of Core (Korah)* who conspired against Aaron — *This Yahuah (God) saw, and it displeased him, and in his wrathful indignation were they consumed: he did wonders upon them, to consume them with the fiery flame* (Sirach 45:19). Jude''s *gainsaying of Core (Korah)* (Jude 1:11) is exactly this rebellion against the priesthood Yahuah (God) appointed, consumed by the fiery flame.'),
  ('canon', 'jude', 1, 11, 'canon', '1-john', 3, 12, 'free', E'*Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* (1 John 3:12). John names the way of Cain as the way of the world that hates the righteous: *Cain, who was of that wicked one, and slew his brother... because his own works were evil.* Jude warns of those gone *in the way of Cain* (Jude 1:11); the brother of the Master and the disciple whom he loved read Cain the same way — the murderer of the righteous, the pattern of the ungodly.'),
  ('canon', 'jude', 1, 11, 'canon', '2-peter', 2, 15, 'free', E'*Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;* (2 Peter 2:15). Peter names the same error Jude names: *following the way of Balaam... who loved the wages of unrighteousness* is Jude''s *error of Balaam for reward* (Jude 1:11). Both apostles set the false teachers in Balaam''s path — the prophet who sold his gift for hire and taught Yahuah''s (Lord''s) people to sin.'),
  -- thread: jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14
  ('canon', 'jude', 1, 5, 'canon', 'numbers', 14, 29, 'free', E'*Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me,* (Numbers 14:29). Here is what Jude remembers: Yahuah (Lord), *having saved the people out of the land of Egypt, afterward destroyed them that believed not* (Jude 1:5). The generation he brought out *with a mighty hand* fell in the wilderness for unbelief — *Surely they shall not see the land which I sware unto their fathers* (Numbers 14:23). Salvation out of Egypt did not exempt the faithless from judgment; Jude wields this against those who presume on grace.'),
  ('canon', 'jude', 1, 5, 'canon', 'numbers', 14, 35, 'free', E'*I Yahuah (LORD) have said, I will surely do it unto all this evil congregation, that are gathered together against me: in this wilderness they shall be consumed, and there they shall die.* (Numbers 14:35). Yahuah (LORD) swore the unbelieving congregation *shall be consumed, and there they shall die* — Jude''s *afterward destroyed them that believed not* (Jude 1:5). The same people he saved at the Red Sea he destroyed in the wilderness for unbelief; the deliverance was real and the judgment was real. Grace is no licence.'),
  ('canon', 'jude', 1, 5, 'canon', 'psalms', 95, 8, 'free', E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness:* (Psalm 95:8). The Psalm holds up the wilderness as the warning: *Forty years long was I grieved with this generation... Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:10-11). This is Jude''s remembrance — the people saved out of Egypt whom Yahuah (Lord) *afterward destroyed... that believed not* (Jude 1:5). The hardened heart that provoked Yahuah (LORD) is the unbelief Jude sets before the antinomians.'),
  ('canon', 'jude', 1, 5, 'canon', '1-corinthians', 10, 5, 'free', E'*But with many of them Elohim (God) was not well pleased: for they were overthrown in the wilderness.* (1 Corinthians 10:5). Paul wields the same warning Jude does: *they were overthrown in the wilderness... Now all these things happened unto them for ensamples... Wherefore let him that thinketh he standeth take heed lest he fall* (1 Corinthians 10:5,11-12). The people Yahuah (Lord) saved out of Egypt and *afterward destroyed... that believed not* (Jude 1:5) are the ensample both apostles raise: the saved are not the secure if they fall into unbelief.'),
  ('canon', 'jude', 1, 5, 'canon', '1-corinthians', 10, 10, 'free', E'*Neither murmur ye, as some of them also murmured, and were destroyed of the destroyer.* (1 Corinthians 10:10). The murmurers *were destroyed of the destroyer* — and Jude marks the same men *murmurers, complainers, walking after their own lusts* (Jude 1:16), set under the judgment of the wilderness generation whom Yahuah (Lord) *afterward destroyed... that believed not* (Jude 1:5). Paul and Jude read the wilderness as one warning against presumption.'),
  -- thread: jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19
  ('canon', 'jude', 1, 7, 'canon', 'genesis', 19, 24, 'free', E'*Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven; And he overthrew those cities, and all the plain, and all the inhabitants of the cities, and that which grew upon the ground.* (Genesis 19:24-25). The vengeance Jude names: Sodom and Gomorrha *are set forth for an example, suffering the vengeance of eternal fire* (Jude 1:7). Yahuah (LORD) *rained... brimstone and fire... out of heaven* and overthrew the cities — the standing example of judgment on those who give themselves over to fornication and strange flesh, just as the Watchers transgressed the bound order in the verse before.'),
  ('canon', 'jude', 1, 7, 'canon', 'genesis', 19, 4, 'free', E'*But before they lay down, the men of the city, even the men of Sodom, compassed the house round, both old and young, all the people from every quarter: And they called unto Lot, and said unto him, Where are the men which came in to thee this night? bring them out unto us, that we may know them.* (Genesis 19:4-5). The sin of Sodom Jude marks as *going after strange flesh* (Jude 1:7): the men of the city sought to know the two angels who came to Lot — the same transgression of the appointed order as the Watchers who left their habitation (Jude 1:6). The cities *giving themselves over to fornication* are *set forth for an example.*'),
  ('canon', 'jude', 1, 7, 'apocrypha', 'the-wisdom-of-solomon', 10, 6, 'extras', E'*When the ungodly perished, she delivered the righteous man, who fled from the fire which fell down upon the five cities.* (Wisdom of Solomon 10:6). The library remembers Sodom as Jude does — *the fire which fell down upon the five cities,* the *waste land that smoketh... a testimony, and... a standing pillar of salt... a monument of an unbelieving soul* (Wisdom 10:7). Jude calls them *set forth for an example, suffering the vengeance of eternal fire* (Jude 1:7); Wisdom calls the smoking waste a perpetual testimony. The same fire, the same warning.'),
  ('canon', 'jude', 1, 7, 'canon', '2-peter', 2, 6, 'free', E'*And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly;* (2 Peter 2:6). Peter sets Sodom as the ensample exactly as Jude does: *the cities of Sodom and Gomorrha... an ensample unto those that after should live ungodly* is Jude''s *Sodom and Gomorrha... set forth for an example, suffering the vengeance of eternal fire* (Jude 1:7). Both letters stand the burned cities up beside the Watchers and the wilderness as witnesses that Yahuah (Lord) judges the ungodly.'),
  -- thread: jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21
  ('canon', 'jude', 1, 13, 'enoch', '1-enoch', 18, 13, 'extras', E'*I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 18:12-13). Jude''s *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13) is this Enoch vision: *the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times* (1 Enoch 18:14). The stars that left their courses are bound in the prison — the very figure for the lawless who left their place.'),
  ('canon', 'jude', 1, 13, 'enoch', '1-enoch', 21, 6, 'extras', E'*And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 21:6). Enoch is shown the prison of *the stars... which have transgressed the commandment of Yahuah (God),* bound *till the time when their guilt should be consummated* (1 Enoch 21:7). These are Jude''s *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13) — the stars that would not keep their appointed course, the very image of the ungodly who keep not the faith once delivered.'),
  ('canon', 'jude', 1, 12, 'canon', 'proverbs', 25, 14, 'free', E'*Whoso boasteth himself of a false gift is like clouds and wind without rain.* (Proverbs 25:14). Jude calls the ungodly *clouds they are without water, carried about of winds* (Jude 1:12) — Solomon''s *clouds and wind without rain,* the man who boasts a gift he does not give. They promise and yield nothing; the proverb names the emptiness Jude marks in the false teachers who feast among the saints and feed only themselves.'),
  ('canon', 'jude', 1, 13, 'canon', 'isaiah', 57, 20, 'free', E'*But the wicked are like the troubled sea, when it cannot rest, whose waters cast up mire and dirt.* (Isaiah 57:20). Jude''s *raging waves of the sea, foaming out their own shame* (Jude 1:13) is Isaiah''s *wicked... like the troubled sea... whose waters cast up mire and dirt.* The restless sea that throws up filth is the figure for the ungodly whose shame foams out of them — *There is no peace, saith my Elohim (God), to the wicked* (Isaiah 57:21).'),
  ('canon', 'jude', 1, 13, 'canon', '2-peter', 2, 17, 'free', E'*These are wells without water, clouds that are carried with a tempest; to whom the mist of darkness is reserved for ever.* (2 Peter 2:17). Peter writes Jude''s very words: *wells without water, clouds that are carried with a tempest; to whom the mist of darkness is reserved for ever* answers *clouds they are without water... wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:12-13). The two letters describe the same false teachers with the same images and the same sentence — darkness reserved for ever.'),
  -- thread: jude-1-able-to-keep-you-from-falling-psalm-121-deuteronomy-32
  ('canon', 'jude', 1, 24, 'canon', 'psalms', 121, 3, 'free', E'*He will not suffer thy foot to be moved: he that keepeth thee will not slumber. Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* (Psalm 121:3-4). The doxology rests on this: *Now unto him that is able to keep you from falling* (Jude 1:24). He *that keepeth thee will not slumber* — the Keeper of Yashar''el (Israel) who will not suffer the foot to be moved is the One able to keep his own from falling and present them faultless. Against the wandering stars and the fallen Watchers, the saints are kept by the Keeper who never sleeps.'),
  ('canon', 'jude', 1, 25, 'canon', 'deuteronomy', 32, 4, 'free', E'*He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he.* (Deuteronomy 32:4). Jude ends *To the only wise Elohim (God) our Saviour* (Jude 1:25) — and the Song of Moses names him *the Rock, his work is perfect... a Elohim (God) of truth and without iniquity, just and right.* The only wise Elohim (God) and Saviour is the Rock whose every way is judgment; the same righteous Judge who destroyed the unbelieving is the One able to present the faithful faultless.'),
  ('canon', 'jude', 1, 25, 'canon', 'isaiah', 45, 21, 'free', E'*Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* (Isaiah 45:21). Jude''s *the only wise Elohim (God) our Saviour* (Jude 1:25) is Isaiah''s *a just Elohim (God) and a Saviour; there is none beside me.* The Father is the source of salvation, the only Elohim (God) and Saviour; the glory and majesty, dominion and power are his *through Yahusha HaMashiach (Jesus Christ) our Master.* There is none beside him.'),
  -- thread: jude-1-grace-turned-into-lasciviousness-the-faith-once-delivered-deuteronomy-32
  ('canon', 'jude', 1, 4, 'canon', 'deuteronomy', 32, 5, 'free', E'*They have corrupted themselves, their spot is not the spot of his children: they are a perverse and crooked generation.* (Deuteronomy 32:5). Jude marks *certain men crept in unawares... ungodly men, turning the grace of our Elohim (God) into lasciviousness* (Jude 1:4) — Moses'' *perverse and crooked generation* that *corrupted themselves.* The faith was *once delivered unto the saints* (Jude 1:3); these crooked men pervert it, making grace a licence and denying *the only Yahuah Elohim (Lord God), and our Lord Yahusha HaMashiach (Lord Jesus Christ).*'),
  ('canon', 'jude', 1, 4, 'canon', '2-peter', 2, 1, 'free', E'*But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* (2 Peter 2:1). Peter and Jude name the same intruders: *false teachers... privily shall bring in damnable heresies, even denying Yahuah (Lord)* is Jude''s *certain men crept in unawares... denying the only Yahuah Elohim (Lord God), and our Lord Yahusha HaMashiach (Lord Jesus Christ)* (Jude 1:4). The grace they pervert into lasciviousness is the very denial of the Master who bought them; the faith once delivered stands against them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s245_jude_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s245_jude_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33',
       E'Enoch the seventh from Adam prophesied — Jude quotes 1 Enoch 1:9 by name (1 Enoch 1; Deuteronomy 33, Zechariah 14)',
       E'This is the capstone of the whole apparatus: an apostle, the brother of James, quotes the restored library by name. *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints, To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him* (Jude 1:14-15). This is a direct quotation of 1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him* (1 Enoch 1:9). Word for word: the ten thousands, the judgment upon all, the conviction of all flesh of all the works of their ungodliness which they have ungodly committed, the hard things which ungodly sinners have spoken against Him. Jude names the prophet — *Enoch, the seventh from Adam* — and the genealogy of the Torah proves the title: Adam, Seth, Enos, Cainan, Mahalaleel, Jared, *and he begat Enoch* (Genesis 5:18), the seventh, who *walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). And the word Enoch prophesied is itself rooted in the Tanakh both he and Jude draw on: *Yahuah (LORD) came from Sinai... and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2), and *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5). One coming, foretold from Sinai to Enoch to Zechariah, and cited by an apostle as prophecy. The library is one; it ain''t new. Jude wields the seventh from Adam''s prophecy against the ungodly who turn grace into lasciviousness — the Master cometh with ten thousands of his saints to execute judgment, and grace is no escape from that day.',
       sv.verse_id, ev.verse_id, 'extras', 10210
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10',
       E'The angels which kept not their first estate — the Watchers reserved in everlasting chains (Genesis 6; 1 Enoch 10, 13, 21; Jubilees 5; 1 Peter 3, 2 Peter 2)',
       E'*And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). These are the Watchers — the *sons of Elohim (God)* of Genesis 6 who *saw the daughters of men that they were fair; and they took them wives,* and *there were giants in the earth in those days* (Genesis 6:1-4). They left their own habitation and broke the bound order, and the library tells in full what Jude names in brief. Yahuah (God) commanded, *Bind Azâzêl hand and foot, and cast him into the darkness... on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:4-6); Semjaza and his associates were *bound fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12), to be *led off to the abyss of fire... the prison in which they shall be confined for ever* (1 Enoch 10:13). Enoch was sent to pronounce the sentence already gone forth: *Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds* (1 Enoch 13:1); and he was shown *the prison of the angels, and here they will be imprisoned for ever* (1 Enoch 21:11). Jubilees says the same: the angels are *bound in the depths of the earth... for ever, until the day of the great condemnation* (Jubilees 5:6,10). This is the third canonical pass over the Watchers — Peter wrote it twice: the *spirits in prison... in the days of Noah* to whom the Formed Son preached (1 Peter 3:19-20), and *the angels that sinned... delivered into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Jude, Peter, Genesis, 1 Enoch, and Jubilees hold one settled witness: the everlasting chains, the darkness, the judgment of the great day. The faith once delivered names the Watchers as Jude names them; the antinomians who left the faith are warned by the angels who left their estate.',
       sv.verse_id, ev.verse_id, 'extras', 10213
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10',
       E'Michael disputing about the body of Moses — the Master rebuke thee (the Assumption of Moses; Zechariah 3, Deuteronomy 34, Daniel 10)',
       E'*Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* (Jude 1:9). Jude draws this scene from the Assumption of Moses — the lost ending of that work, which told how Michael contended with the devil over the body of the servant of Yahuah (LORD). No clean witness of the Assumption of Moses survives in the restored editions of the library, but its roots run straight through the Tanakh. The Torah closes Moses'' story with a hidden grave: *he buried him in a valley in the land of Moab... but no man knoweth of his sepulchre unto this day* (Deuteronomy 34:6) — the unknown sepulchre is the very point of the dispute. The words Michael speaks are Zechariah''s: *Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan... is not this a brand plucked out of the fire?* (Zechariah 3:2), where the angel of Yahuah (LORD) stands against the accuser and leaves the rebuke to Yahuah (LORD) alone. And the Michael who contends is Daniel''s: *Michael, one of the chief princes* (Daniel 10:13), *Michael your prince* (Daniel 10:21), who *shall stand up... for the children of thy people* (Daniel 12:1) — the guardian of Yashar''el (Israel). Peter states the principle Jude shows: *angels, which are greater in power and might, bring not railing accusation against them before Yahuah (Lord)* (2 Peter 2:11). Even the archangel does not rail against the devil but yields the rebuke to the Master; how much less may the filthy dreamers who *speak evil of dignities* (Jude 1:8). The library and the canon hold one testimony, and the apostle reads the Assumption of Moses as the witness it is.',
       sv.verse_id, ev.verse_id, 'free', 10216
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22',
       E'The way of Cain, the error of Balaam, the gainsaying of Korah — three rebels of the Torah (Genesis 4, Numbers 16, Numbers 22-31; Wisdom 10, Sirach 45; 1 John 3, 2 Peter 2)',
       E'*Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core (Korah)* (Jude 1:11). Jude marshals three judgments of the Torah against the ungodly. The way of Cain: *Cain rose up against Abel his brother, and slew him* (Genesis 4:8) — the way of envy that hates and murders the righteous; the library reads him the same, *he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3), and so does John, *not as Cain, who was of that wicked one, and slew his brother... because his own works were evil, and his brother''s righteous* (1 John 3:12). The error of Balaam: the prophet who *loved the wages of unrighteousness* and by *the counsel of Balaam* taught Yashar''el (Israel) to trespass at Peor (Numbers 31:16) — *ran greedily after the error of Balaam for reward,* the same path Peter names, *following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15). The gainsaying of Korah: who rose against the order Yahuah (LORD) appointed, until *the earth opened her mouth, and swallowed them up... they went down alive into the pit* (Numbers 16:32-33); Sirach remembers *the congregation of Core (Korah)... in his wrathful indignation were they consumed... with the fiery flame* (Sirach 45:18-19). Envy, hire, and rebellion — three roads to ruin, every one a witness that Yahuah judges the lawless, and the antinomians who turn grace into lasciviousness walk all three.',
       sv.verse_id, ev.verse_id, 'extras', 10219
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14',
       E'The Master saved a people, and afterward destroyed them that believed not (Numbers 14, Psalm 95, 1 Corinthians 10)',
       E'*I will therefore put you in remembrance, though ye once knew this, how that Yahuah (Lord), having saved the people out of the land of Egypt, afterward destroyed them that believed not* (Jude 1:5). The first of Jude''s judgment-witnesses, and the sharpest against presumption: the same people Yahuah (Lord) brought out of Egypt with a mighty hand he afterward destroyed in the wilderness for unbelief. *Your carcases shall fall in this wilderness... which have murmured against me* (Numbers 14:29); *in this wilderness they shall be consumed, and there they shall die* (Numbers 14:35). The Psalm holds it up as the standing warning: *Harden not your heart, as in the provocation... Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:8,11). And Paul wields it exactly as Jude does: *they were overthrown in the wilderness... Now all these things happened unto them for ensamples... Wherefore let him that thinketh he standeth take heed lest he fall* (1 Corinthians 10:5,11-12), with the murmurers *destroyed of the destroyer* (1 Corinthians 10:10) — the very murmurers Jude marks (Jude 1:16). Salvation out of Egypt did not exempt the faithless from judgment; the redeemed who fall into unbelief fall under the same sentence. Grace is no licence, and the deliverance is no charm against the judgment of the great day.',
       sv.verse_id, ev.verse_id, 'free', 10222
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19',
       E'Sodom and Gomorrha set forth for an example, suffering the vengeance of eternal fire (Genesis 19; Wisdom 10; 2 Peter 2)',
       E'*Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire* (Jude 1:7). The third judgment-witness, set deliberately beside the Watchers of the verse before: the *going after strange flesh* of Sodom parallels the angels who left their habitation — the same transgression of the bound order. The men of the city *compassed the house round... bring them out unto us, that we may know them* (Genesis 19:4-5), seeking to know the two angels who came to Lot; and *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven; And he overthrew those cities* (Genesis 19:24-25). The library remembers the same fire — *the fire which fell down upon the five cities,* the smoking waste a *testimony,* the pillar of salt *a monument of an unbelieving soul* (Wisdom of Solomon 10:6-7). And Peter sets it as the ensample Jude does: *the cities of Sodom and Gomorrha into ashes... an ensample unto those that after should live ungodly* (2 Peter 2:6). The burned cities stand up beside the Watchers and the wilderness generation as one witness: Yahuah (Lord) judges the ungodly, and the example is written in brimstone.',
       sv.verse_id, ev.verse_id, 'extras', 10225
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21',
       E'Clouds without water, wandering stars, the blackness of darkness reserved for ever (1 Enoch 18, 21; Proverbs 25, Isaiah 57; 2 Peter 2)',
       E'*These are spots in your feasts of charity, when they feast with you, feeding themselves without fear: clouds they are without water, carried about of winds... Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:12-13). Jude paints the ungodly with images drawn from nature and from Enoch. The *clouds... without water* are Solomon''s empty boaster: *Whoso boasteth himself of a false gift is like clouds and wind without rain* (Proverbs 25:14). The *raging waves of the sea, foaming out their own shame* are Isaiah''s wicked: *the wicked are like the troubled sea... whose waters cast up mire and dirt* (Isaiah 57:20). But the *wandering stars, to whom is reserved the blackness of darkness for ever* are Enoch''s vision: the *seven stars like great burning mountains... a prison for the stars and the host of heaven* (1 Enoch 18:12-13), *the stars which roll over the fire... which have transgressed the commandment of Yahuah (God)... because they did not come forth at their appointed times* (1 Enoch 18:14 / 21:6), bound till their guilt should be consummated. The stars that would not keep their course are the figure for the lawless who keep not the faith once delivered. Peter writes the same indictment in the same words: *wells without water, clouds that are carried with a tempest; to whom the mist of darkness is reserved for ever* (2 Peter 2:17). Empty, restless, off-course — and the blackness of darkness reserved.',
       sv.verse_id, ev.verse_id, 'extras', 10228
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-able-to-keep-you-from-falling-psalm-121-deuteronomy-32',
       E'Able to keep you from falling — the only wise Elohim our Saviour (Psalm 121, Deuteronomy 32, Isaiah 45)',
       E'*Now unto him that is able to keep you from falling, and to present you faultless before the presence of his glory with exceeding joy, To the only wise Elohim (God) our Saviour, be glory and majesty, dominion and power, both now and ever. Amen* (Jude 1:24-25). The letter that has named the fallen Watchers and the wandering stars ends on the One able to keep his own from falling. The keeping is the Psalm''s: *He will not suffer thy foot to be moved: he that keepeth thee will not slumber. Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:3-4) — the Keeper of Yashar''el (Israel) who never sleeps is the One able to present the saints faultless. The One they trust is the Rock of the Song of Moses: *He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he* (Deuteronomy 32:4) — the same righteous Judge who destroyed the unbelieving is the One who keeps the faithful. And he is Isaiah''s only Saviour: *a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21). The Father is *the only wise Elohim (God) our Saviour,* the source of salvation, beside whom there is none else; the glory and majesty, dominion and power are his *through Yahusha HaMashiach (Jesus Christ) our Master.* Against every falling, the saints are kept by the Keeper who slumbers not.',
       sv.verse_id, ev.verse_id, 'free', 10231
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jude-1-grace-turned-into-lasciviousness-the-faith-once-delivered-deuteronomy-32',
       E'Turning the grace of our Elohim into lasciviousness — the faith once delivered to the saints (Deuteronomy 32, 2 Peter 2)',
       E'*Beloved... it was needful for me to write unto you, and exhort you that ye should earnestly contend for the faith which was once delivered unto the saints. For there are certain men crept in unawares... ungodly men, turning the grace of our Elohim (God) into lasciviousness, and denying the only Yahuah Elohim (Lord God), and our Lord Yahusha HaMashiach (Lord Jesus Christ)* (Jude 1:3-4). Here is the whole burden of the letter: the faith was *once delivered* — settled, whole, not to be remade — and the ungodly pervert grace into a licence for the flesh. This is the anti-antinomian heart of Jude: grace is no permit to abandon the Torah; the man who makes it so is *denying* the Master who bought him. Moses named such men a *perverse and crooked generation* that *corrupted themselves* (Deuteronomy 32:5). And Peter named the same intruders: *false teachers... who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them* (2 Peter 2:1). Against them Jude raises the whole judgment-history of the library — the wilderness, the Watchers, Sodom, Cain, Balaam, Korah — every witness that Yahuah judges the lawless. The faith once delivered stands; grace turned into lasciviousness is the lie the apostle writes to overthrow.',
       sv.verse_id, ev.verse_id, 'free', 10234
  FROM _s245_jude_lookup sv, _s245_jude_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='jude' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all... And to convict all flesh Of all the works of their ungodliness which they have ungodly committed* the very verse Jude quotes by name (Jude 1:14-15). SELF-LINK into the live 1 Enoch ch1 thread.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 33:2 — *Yahuah (LORD) came from Sinai... and he came with ten thousands of saints: from his right hand went a fiery law* the Tanakh root of Enoch''s *ten thousands of his saints* (Jude 1:14).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 14:5 — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* the same coming-with-the-saints Enoch foretold (Jude 1:14).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch* the genealogy proving *the seventh from Adam* (Jude 1:14): Adam, Seth, Enos, Cainan, Mahalaleel, Jared, Enoch.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* the Torah''s witness to the prophet Jude names, the patriarch whom Elohim (God) took (Jude 1:14).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-enoch-the-seventh-from-adam-prophesied-1-enoch-1-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:1 — *the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives* the Watchers who *left their own habitation* (Jude 1:6); *there were giants in the earth.*'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *Bind Azâzêl hand and foot, and cast him into the darkness* Jude''s *everlasting chains under darkness* (Jude 1:6), till the day of the great judgement he is cast into the fire.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* Semjaza''s host reserved unto judgment (Jude 1:6), led off to the abyss of fire.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 13:1 — *Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds* Enoch pronounces the sentence; the bonds are Jude''s *everlasting chains* (Jude 1:6).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 21:11 — *This place is the prison of the angels, and here they will be imprisoned for ever* the very prison Jude points to: reserved *unto the judgment of the great day* (Jude 1:6).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 5:6 — *He bade us to bind them in the depths of the earth, and behold they are bound* the Watchers bound *for ever, until the day of the great condemnation* (Jub 5:10); Jude''s everlasting chains unto judgment (Jude 1:6).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Peter 3:19 — *he went and preached unto the spirits in prison; Which sometime were disobedient... in the days of Noah* the Watchers self-link; the canon''s second pass over Genesis 6 (Jude 1:6 the third).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'2 Peter 2:4 — *Elohim (God) spared not the angels that sinned... delivered them into chains of darkness, to be reserved unto judgment* the twin of Jude 1:6 self-link; one settled Watchers witness.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-angels-which-kept-not-their-first-estate-the-watchers-1-enoch-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:2 — *Yahuah (LORD) rebuke thee, O Satan* the exact words Michael speaks, leaving the rebuke to Yahuah (Lord) alone (Jude 1:9).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 34:6 — *he buried him in a valley in the land of Moab... but no man knoweth of his sepulchre* the hidden grave that is the point of the dispute over the body of Moses (Jude 1:9).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 10:13 — *Michael, one of the chief princes, came to help me* the warring prince of Yashar''el (Israel), the Michael who disputes over Moses'' body (Jude 1:9).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 10:21 — *Michael your prince* the guardian of Yashar''el (Israel) who stands up for the people (Dan 12:1); Jude''s Michael the archangel (Jude 1:9).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Peter 2:11 — *angels, which are greater in power and might, bring not railing accusation... before Yahuah (Lord)* the principle Jude shows in Michael (Jude 1:9); self-link.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-michael-disputing-about-the-body-of-moses-zechariah-3-daniel-10'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *Cain rose up against Abel his brother, and slew him* the way of Cain, envy that murders the righteous (Jude 1:11).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 31:16 — *through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor* the error of Balaam for reward (Jude 1:11).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 16:32 — *the earth opened her mouth, and swallowed them up... and all the men that appertained unto Korah* the gainsaying of Core (Korah) that perished (Jude 1:11).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 10:3 — *he perished also in the fury with which he murdered his brother* the library reads the way of Cain as Jude does (Jude 1:11).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 45:18 — *the men that were of Dathan''s and Abiron''s side, and the congregation of Core* consumed with the fiery flame (45:19); the gainsaying of Korah (Jude 1:11).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=45 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 John 3:12 — *not as Cain, who was of that wicked one, and slew his brother... because his own works were evil* the way of Cain, the murderer of the righteous (Jude 1:11); self-link.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Peter 2:15 — *following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* the error of Balaam for reward (Jude 1:11); self-link.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-way-of-cain-the-error-of-balaam-the-gainsaying-of-korah-genesis-4-numbers-16-22'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 14:29 — *Your carcases shall fall in this wilderness... which have murmured against me* the people saved out of Egypt afterward destroyed for unbelief (Jude 1:5).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 14:35 — *in this wilderness they shall be consumed, and there they shall die* Yahuah (LORD)''s oath against the unbelieving congregation (Jude 1:5).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 95:8 — *Harden not your heart, as in the provocation... in the wilderness* the generation he sware should not enter his rest (Jude 1:5).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 10:5 — *they were overthrown in the wilderness* Paul''s same ensample: let him that thinketh he standeth take heed lest he fall (Jude 1:5).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 10:10 — *Neither murmur ye, as some of them also murmured, and were destroyed of the destroyer* the murmurers Jude also marks (Jude 1:16); the wilderness as warning (Jude 1:5).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-the-master-saved-a-people-and-destroyed-them-that-believed-not-numbers-14'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:24 — *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire... and overthrew those cities* the vengeance of eternal fire set forth for an example (Jude 1:7).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:4 — *the men of Sodom compassed the house round... bring them out unto us, that we may know them* the *going after strange flesh* that parallels the Watchers (Jude 1:6-7).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 10:6 — *the righteous man, who fled from the fire which fell down upon the five cities* the library''s witness to Sodom''s example (Jude 1:7).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:6 — *the cities of Sodom and Gomorrha into ashes... an ensample unto those that after should live ungodly* the twin of Jude 1:7; self-link.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-sodom-and-gomorrha-set-forth-for-an-example-genesis-19'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 18:13 — *a prison for the stars and the host of heaven... which have transgressed the commandment of Yahuah (God)* the *wandering stars* reserved to the blackness of darkness (Jude 1:13).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 21:6 — *the stars which... have transgressed the commandment of Yahuah (God)... because they did not come forth at their appointed times* bound in the prison; the wandering stars (Jude 1:13).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 25:14 — *Whoso boasteth himself of a false gift is like clouds and wind without rain* Jude''s *clouds... without water, carried about of winds* (Jude 1:12).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 57:20 — *the wicked are like the troubled sea... whose waters cast up mire and dirt* Jude''s *raging waves of the sea, foaming out their own shame* (Jude 1:13).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Peter 2:17 — *wells without water, clouds that are carried with a tempest; to whom the mist of darkness is reserved for ever* Jude''s very words and sentence (Jude 1:12-13); self-link.'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-wandering-stars-the-blackness-of-darkness-1-enoch-18-21'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-able-to-keep-you-from-falling-psalm-121-deuteronomy-32
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 121:3 — *he that keepeth thee will not slumber... he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* the Keeper able to keep the saints from falling (Jude 1:24).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-able-to-keep-you-from-falling-psalm-121-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:4 — *He is the Rock, his work is perfect: for all his ways are judgment... just and right is he* the only wise Elohim (God) our Saviour (Jude 1:25).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-able-to-keep-you-from-falling-psalm-121-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:21 — *a just Elohim (God) and a Saviour; there is none beside me* the Father the only Saviour of the doxology (Jude 1:25).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-able-to-keep-you-from-falling-psalm-121-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jude-1-grace-turned-into-lasciviousness-the-faith-once-delivered-deuteronomy-32
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:5 — *they are a perverse and crooked generation* Moses'' word for the men who corrupt themselves; Jude''s ungodly turning grace into lasciviousness (Jude 1:4).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-grace-turned-into-lasciviousness-the-faith-once-delivered-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:1 — *false teachers... who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them* the same intruders Jude names, denying the Master (Jude 1:4).'
  FROM cross_reference_threads t, cross_references x, _s245_jude_lookup sv, _s245_jude_lookup tv
 WHERE t.slug='jude-1-grace-turned-into-lasciviousness-the-faith-once-delivered-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='jude' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
