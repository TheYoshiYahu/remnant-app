-- ----- fragment: minion_acts_17.sql (S217 Acts 17) -----
-- =====================================================================
-- S217 minion — ACTS 17 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 17.  Tag: a17 (temp view _s217_a17_lookup).  Sort band: 5675-5699 (step 3).
-- Source is ALWAYS the canon Acts 17 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #7/#11/#12, Christology, son-of-Adam):
--  * Thessalonica (17:2-3): Paul reasons OUT OF THE SCRIPTURES three sabbaths — Messiah
--    must SUFFER and RISE. The Tanakh is the test, not a new revelation: Isaiah 53 (the
--    smitten servant), Psalm 16:10 (the Holy One who sees no corruption), and the Master's
--    own *thus it behoved Messiah (Christ) to suffer, and to rise* (Luke 24:46). The
--    suffering-then-glory is read FROM Moses and the prophets, never against them.
--  * "Turned the world upside down" / "another king, one Yahusha (Jesus)" (17:6-7): the
--    kingdom that shall never be destroyed (Daniel 2:44) on the throne of David (Isaiah 9:7)
--    — the everlasting dominion of the Formed, not a sedition against Torah.
--  * The Bereans (17:11): *searched the scriptures daily, whether those things were so* — the
--    noble standard is the Tanakh as the test (Isaiah 8:20 *to the law and to the testimony*;
--    John 5:39 the scriptures testify of him). The 1234-filter posture in narrative form.
--  * THE AREOPAGUS (17:22-31) — read as the CREATOR's claim on the nations within his ordering
--    of the earth, NOT a natural-theology inclusion gospel. The Maker of heaven and earth who
--    *dwelleth not in temples made with hands* (1 Kings 8:27; Isaiah 66:1-2), who *giveth to
--    all life, and breath* (Isaiah 42:5; Genesis 2:7), who *made of one blood all nations …
--    and the bounds of their habitation* (Deuteronomy 32:8 — the nations apportioned around
--    the children of Yashar'el), summoning *that they should seek Yahuah (Lord)* (Isaiah 45:18-22;
--    Wisdom 13:6). The idols are nothing (Isaiah 45:20; Wisdom 13:10). NOT the nations grafted
--    into the seed by confession — the Maker summoning the formed within his ordering.
--  * The appointed Man / day of judgment (17:31): *he will judge the world in righteousness*
--    (Psalm 96:13) by the Man he ordained — the one *like the Son of Adam* given everlasting
--    dominion and committed all judgment (Daniel 7:13-14; John 5:27, *because he is the Son of
--    Adam*). The kaph at Daniel 7:13 is preserved in the pull and is incarnation-honoring:
--    Yahusha himself, the Formed cloud-rider who took on flesh. The assurance is the
--    resurrection — the firstfruits raised (Psalm 16:10; 1 Corinthians 15:20-23).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 17:
--   v.1-2   Thessalonica synagogue       Tanakh: none added (narrative; the scriptures-reasoned carried at v.3)  Extras: none warranted  NT: none warranted
--   v.2-3   Messiah must suffer and rise Tanakh: Isaiah 53:5, Isaiah 53:8, Psalm 16:10  Extras: none warranted  NT: Luke 24:26, Luke 24:46
--   v.4     some believed / devout Greeks Tanakh: none added (the gathering carried elsewhere)  Extras: none warranted  NT: none warranted
--   v.5-9   envy / uproar / Jason        Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.6-7   world upside down / another king Tanakh: Daniel 2:44, Isaiah 9:6, Isaiah 9:7  Extras: none warranted  NT: none added (kingdom carried by Daniel/Isaiah)
--   v.10    sent to Berea                Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.11    Bereans searched daily       Tanakh: Isaiah 8:20  Extras: none warranted  NT: John 5:39
--   v.12-15 many believed / to Athens    Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.16-21 stirred at idolatry / Areopagus Tanakh: none added (idolatry carried at v.29 thread)  Extras: none warranted  NT: none warranted (narrative setup)
--   v.23-25 UNKNOWN GOD / made the world / no temple Tanakh: 1 Kings 8:27, Isaiah 66:1, Isaiah 66:2, Isaiah 42:5  Extras: Wisdom of Solomon 13:5  NT: none added
--   v.26    of one blood / bounds of habitation Tanakh: Deuteronomy 32:8  Extras: none warranted (Jubilees 8 weighed — apparatus-heavy place-names, not quoted)  NT: none warranted
--   v.27-29 seek Yahuah / not gold or silver Tanakh: Isaiah 45:18, Isaiah 45:20, Isaiah 45:22  Extras: Wisdom of Solomon 13:6, Wisdom of Solomon 13:10  NT: none added
--   v.30-31 appointed Man / judge in righteousness Tanakh: Psalm 96:13, Daniel 7:13, Daniel 7:14  Extras: none warranted  NT: John 5:27
--   v.31-32 raised from the dead / assurance Tanakh: Psalm 16:10  Extras: none warranted  NT: 1 Corinthians 15:20, 1 Corinthians 15:23
--   v.33-34 Dionysius / Damaris believe   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5675 acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise        (Tanakh + NT)
--   5678 acts-17-these-that-have-turned-the-world-upside-down-another-king          (Tanakh)
--   5681 acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so (Tanakh + NT)
--   5684 acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands          (Tanakh + Extras)
--   5687 acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation        (Tanakh)
--   5690 acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations        (Tanakh + Extras)
--   5693 acts-17-the-appointed-man-the-day-of-judgment-in-righteousness             (Tanakh + NT)
--   5696 acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given        (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise
  ('canon', 'acts', 17, 3, 'canon', 'isaiah', 53, 5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). For three sabbath days Paul *reasoned with them out of the scriptures, opening and alleging, that Messiah (Christ) must needs have suffered* (Acts 17:2-3). This is the scripture he opened: the servant wounded for transgressions, bruised for iniquities. The suffering of the Messiah is not a stumbling-block read against the prophets but the very thing the prophet wrote — read out of the scriptures, not against them.'),
  ('canon', 'acts', 17, 3, 'canon', 'isaiah', 53, 8, 'free', E'*He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). Paul alleges *that Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:3). The servant *cut off out of the land of the living* for the transgression of the people is the suffering the prophet foretold; the rising again answers the cutting-off, the One stricken not held by death.'),
  ('canon', 'acts', 17, 3, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). Paul reasons that Messiah (Christ) *must needs have suffered, and risen again from the dead* (Acts 17:3). The rising is written in the Psalm David sang: the Holy One whose soul is not left in the grave, whose flesh sees no corruption. The resurrection Paul preaches is the scripture opened, not a new doctrine — *whom I preach unto you, is Messiah (Christ)* (Acts 17:3).'),
  ('canon', 'acts', 17, 3, 'canon', 'luke', 24, 26, 'free', E'*Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26). What Paul reasons three sabbaths in Thessalonica is what the risen Master taught on the Emmaus road: the suffering came first, then the glory. *That Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:3) is the same opening of the same scriptures — suffering then glory, the pattern the prophets wrote.'),
  ('canon', 'acts', 17, 3, 'canon', 'luke', 24, 46, 'free', E'*And said unto them, Thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day:* (Luke 24:46). The Master said *thus it is written* — and Paul, *as his manner was,* goes into the synagogue and out of those same writings shows *that Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:2-3). The apostle preaches what the Master opened: the written word, that the Messiah suffer and rise.'),
  -- thread: acts-17-these-that-have-turned-the-world-upside-down-another-king
  ('canon', 'acts', 17, 7, 'canon', 'daniel', 2, 44, 'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44). The accusation rings out: *these all do contrary to the decrees of Cæsar, saying that there is another king, one Yahusha (Jesus)* (Acts 17:7). The other king is no rival to Rome''s order but the King of the kingdom Daniel saw — the kingdom of the Elohim (God) of heaven that shall never be destroyed, set up in the days of the kings of the earth and standing for ever.'),
  ('canon', 'acts', 17, 7, 'canon', 'isaiah', 9, 7, 'free', E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this.* (Isaiah 9:7). The city is troubled that there is *another king, one Yahusha (Jesus)* (Acts 17:7). The prophet named the throne of that king long before Caesar: the government upon his shoulder, the throne of David, the kingdom established with judgment and justice for ever. The King the rulers fear is the King the zeal of Yahuah Tseva''ot (LORD of hosts) was always going to seat.'),
  -- thread: acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so
  ('canon', 'acts', 17, 11, 'canon', 'isaiah', 8, 20, 'free', E'*To the law and to the testimony: if they speak not according to this word, it is because there is no light in them.* (Isaiah 8:20). The Bereans *received the word with all readiness of mind, and searched the scriptures daily, whether those things were so* (Acts 17:11). This is the test Isaiah set: bring every word to the law and to the testimony. The noble Berean does not believe Paul because Paul is eloquent; he weighs the preaching against the written word — and what speaks according to that word has the light in it.'),
  ('canon', 'acts', 17, 11, 'canon', 'john', 5, 39, 'free', E'*Search the scriptures; for in them ye think ye have eternal life: and they are they which testify of me.* (John 5:39). The Master commanded the very searching the Bereans practised — *searched the scriptures daily, whether those things were so* (Acts 17:11). And the searching finds what the Master said it would find: the scriptures testify of him. The Bereans search the writings to test the preaching, and the writings bear witness to the One preached.'),
  -- thread: acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands
  ('canon', 'acts', 17, 24, 'canon', '1-kings', 8, 27, 'free', E'*But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). On Mars'' hill Paul declares the unknown God: *Elohim (God) that made the world and all things therein … dwelleth not in temples made with hands* (Acts 17:24). It is the word Solomon spoke at the dedication of the temple itself — the heaven of heavens cannot contain him, how much less a house of hands. The Maker is not housed by what he made.'),
  ('canon', 'acts', 17, 24, 'canon', 'isaiah', 66, 1, 'free', E'*Thus saith Yahuah (LORD), The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest?* (Isaiah 66:1). Paul preaches the One who *dwelleth not in temples made with hands* (Acts 17:24). Isaiah set the question to the temple-builders centuries before: the heaven is his throne, the earth his footstool — what house could men build for the One who fills both? The unknown God of the altar is the Maker the prophet declared.'),
  ('canon', 'acts', 17, 24, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). *Elohim (God) that made the world and all things therein* (Acts 17:24) needs no house of hands, for *all those things hath mine hand made.* The God who needs nothing looks not to the temple men build but to the contrite heart that trembles at his word — the seeking he calls for on the Areopagus.'),
  ('canon', 'acts', 17, 25, 'canon', 'isaiah', 42, 5, 'free', E'*Thus saith Elohim (God) Yahuah (LORD), he that created the heavens, and stretched them out; he that spread forth the earth, and that which cometh out of it; he that giveth breath unto the people upon it, and spirit to them that walk therein:* (Isaiah 42:5). Paul says the Maker is not *worshipped with men''s hands, as though he needed any thing, seeing he giveth to all life, and breath, and all things* (Acts 17:25). Isaiah named him just so: the One who created the heavens and *giveth breath unto the people upon it.* He is not served as one in need; he is the giver of the breath of every man who would serve him.'),
  ('canon', 'acts', 17, 25, 'apocrypha', 'the-wisdom-of-solomon', 13, 5, 'extras', E'*For by the greatness and beauty of the creatures proportionably the maker of them is seen.* (Wisdom of Solomon 13:5). Paul stands among men who worship they know not what, and declares *Elohim (God) that made the world and all things therein* (Acts 17:24), who *giveth to all life, and breath* (Acts 17:25). The wisdom of the fathers had said the same: the maker is seen by the greatness and beauty of the creatures — the works point past themselves to the One who made them, the unknown God whom the Athenians ignorantly worship.'),
  -- thread: acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation
  ('canon', 'acts', 17, 26, 'canon', 'deuteronomy', 32, 8, 'free', E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* (Deuteronomy 32:8). Paul says the Maker *hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). Moses had already sung it: the El Elyon (most High) who separated the sons of Adam and *set the bounds of the people* — the nations apportioned and ordered around the children of Yashar''el (Israel). The bounds of the Areopagus are the bounds of the Song of Moses: the Maker''s ordering of the earth he made.'),
  -- thread: acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations
  ('canon', 'acts', 17, 27, 'canon', 'isaiah', 45, 18, 'free', E'*For thus saith Yahuah (LORD) that created the heavens; Elohim (God) himself that formed the earth and made it; he hath established it, he created it not in vain, he formed it to be inhabited: I am Yahuah (LORD); and there is none else.* (Isaiah 45:18). The Maker set the bounds of habitation *that they should seek Yahuah (Lord), if haply they might feel after him, and find him* (Acts 17:27). Isaiah declares the same Maker and the same end: the One who *formed the earth … to be inhabited,* beside whom there is none else. He made the earth to be dwelt in so that those who dwell in it would seek the One who is.'),
  ('canon', 'acts', 17, 27, 'apocrypha', 'the-wisdom-of-solomon', 13, 6, 'extras', E'*But yet for this they are the less to be blamed: for they perhaps err, seeking Yahuah (God), and desirous to find him.* (Wisdom of Solomon 13:6). Paul names the appointed end of the bounded habitation: *that they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27). The wisdom of the fathers had named the same groping after the Maker — men *seeking Yahuah (God), and desirous to find him,* feeling after the One who set them in their place. The seeking is the Maker''s summons, the finding never far off.'),
  ('canon', 'acts', 17, 29, 'canon', 'isaiah', 45, 20, 'free', E'*Assemble yourselves and come; draw near together, ye that are escaped of the nations: they have no knowledge that set up the wood of their graven image, and pray unto a god that cannot save.* (Isaiah 45:20). Paul says *we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). Isaiah had already exposed the graven image: the wood set up, the prayer to a god that cannot save, the no-knowledge of those who carry it. The city wholly given to idolatry (Acts 17:16) is the city Isaiah called to draw near to the One who can save.'),
  ('canon', 'acts', 17, 29, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'*But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* (Wisdom of Solomon 13:10). Paul says *we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). The wisdom of the fathers named the misery already: hope set in dead things, gods of gold and silver and stone, the works of men''s hands. The offspring of the living Maker are not to fashion him after the dead works of their own art.'),
  -- thread: acts-17-the-appointed-man-the-day-of-judgment-in-righteousness
  ('canon', 'acts', 17, 31, 'canon', 'psalms', 96, 13, 'free', E'*Before Yahuah (LORD): for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth.* (Psalm 96:13). Paul declares that the Maker *hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:31). The Psalm sang the coming judgment: he cometh to *judge the world with righteousness.* The appointed day of the Areopagus is the day the Psalmist saw — the Maker who summons the nations is the Judge who comes to try them in righteousness.'),
  ('canon', 'acts', 17, 31, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). The world will be judged *by that man whom he hath ordained* (Acts 17:31). Daniel saw the ordaining: one *like the Son of Adam* brought near before the Ancient of days — the Formed who took on flesh, resembling mortal-man, coming with the clouds to receive what is given. The appointed Man is the One the night vision brought before the throne.'),
  ('canon', 'acts', 17, 31, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). Paul preaches *that man whom he hath ordained* to judge the world (Acts 17:31). To the One like the Son of Adam was given dominion over *all people, nations, and languages* — the nations Paul says were made of one blood and set in their bounds (Acts 17:26) are the nations given to serve the ordained Man. The Judge of the appointed day holds the everlasting dominion that shall not pass away.'),
  ('canon', 'acts', 17, 31, 'canon', 'john', 5, 27, 'free', E'*And hath given him authority to execute judgment also, because he is the Son of Adam.* (John 5:27). The Maker will judge the world *by that man whom he hath ordained* (Acts 17:31). The Master named the ground of his authority to judge: *because he is the Son of Adam* — the seed of Adam come in flesh, to whom the Father committed all judgment. The appointed Man of the Areopagus is the Son of Adam to whom the executing of judgment is given.'),
  -- thread: acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given
  ('canon', 'acts', 17, 31, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). The Maker *hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31). The raising was written in the Psalm: the Holy One whose soul is not left in the grave, whose flesh sees no corruption. The assurance of the appointed day is the resurrection the Psalmist foresaw — the Judge already raised, the pledge already given.'),
  ('canon', 'acts', 17, 32, 'canon', '1-corinthians', 15, 20, 'free', E'*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* (1 Corinthians 15:20). When the Athenians *heard of the resurrection of the dead, some mocked* (Acts 17:32) — yet the resurrection is the firstfruits of a harvest. Messiah (Christ) is *risen from the dead, and become the firstfruits of them that slept;* the One raised is not the only one to rise but the first sheaf of the gathering, the assurance that the dead the appointed Man will judge are the dead who shall be raised.'),
  ('canon', 'acts', 17, 32, 'canon', '1-corinthians', 15, 23, 'free', E'*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* (1 Corinthians 15:23). The resurrection the philosophers mocked (Acts 17:32) has an order: *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The raising that is the assurance of the appointed day (Acts 17:31) is the first of the order — the firstfruits gone before, the harvest of his own to follow at his coming.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise',
       E'Reasoning out of the scriptures — Messiah (Christ) must suffer and rise',
       E'In the synagogue at Thessalonica Paul, *as his manner was, went in unto them, and three sabbath days reasoned with them out of the scriptures, opening and alleging, that Messiah (Christ) must needs have suffered, and risen again from the dead* (Acts 17:2-3). The suffering and the rising are not preached against the prophets but out of them. The wounding is Isaiah''s: *he was wounded for our transgressions, he was bruised for our iniquities … and with his stripes we are healed* (Isaiah 53:5), the servant *cut off out of the land of the living: for the transgression of my people was he stricken* (Isaiah 53:8). The rising is David''s: *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). And it is the very pattern the risen Master opened on the Emmaus road — *Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26), *thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46). Suffering then glory, written in Moses and the prophets and the psalms, reasoned three sabbaths from the scriptures the Yahudim (Jews) already held.',
       sv.verse_id, ev.verse_id, 'free', 5675
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-these-that-have-turned-the-world-upside-down-another-king',
       E'These that have turned the world upside down — another king, one Yahusha (Jesus)',
       E'The mob drags Jason before the rulers, crying *These that have turned the world upside down are come hither also* (Acts 17:6), and the charge is sedition: *these all do contrary to the decrees of Cæsar, saying that there is another king, one Yahusha (Jesus)* (Acts 17:7). The accusation is truer than the accusers know — but the other king is no rival pretender to Caesar''s throne. He is the King of the kingdom Daniel saw rise in the days of the kings of the earth: *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed … and it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). The prophet had named that king''s throne long before Caesar reigned: *the government shall be upon his shoulder … upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:7). The world is indeed turned upside down — the kingdoms of men give way to the everlasting dominion of the King the zeal of Yahuah was always going to seat.',
       sv.verse_id, ev.verse_id, 'free', 5678
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so',
       E'The Bereans searched the scriptures daily, whether those things were so',
       E'The brethren send Paul and Silas by night to Berea, and there the synagogue does the noble thing: *these were more noble than those in Thessalonica, in that they received the word with all readiness of mind, and searched the scriptures daily, whether those things were so* (Acts 17:11). They do not believe Paul because he is persuasive; they weigh his preaching against the written word. It is the test Isaiah set for every word that claims to be from above: *to the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:20). And the searching finds exactly what the Master promised it would find — *Search the scriptures; for in them ye think ye have eternal life: and they are they which testify of me* (John 5:39). The Bereans search the writings to test the preaching, and the writings bear witness to the One preached. *Therefore many of them believed* (Acts 17:12) — not against the scriptures, but because the scriptures, searched daily, said the things were so.',
       sv.verse_id, ev.verse_id, 'free', 5681
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands',
       E'The unknown God — the Maker needs no temple made with hands',
       E'On Mars'' hill Paul finds an altar inscribed TO THE UNKNOWN GOD, and declares *Whom therefore ye ignorantly worship, him declare I unto you* (Acts 17:23): *Elohim (God) that made the world and all things therein, seeing that he is Yahuah (Lord) of heaven and earth, dwelleth not in temples made with hands; neither is worshipped with men''s hands, as though he needed any thing, seeing he giveth to all life, and breath, and all things* (Acts 17:24-25). This is no new god of the philosophers but the Maker the prophets and the fathers already declared. Solomon said it at the dedication of the temple itself: *behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). Isaiah set the question to the temple-builders: *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1) — *for all those things hath mine hand made* (Isaiah 66:2). He needs nothing from men''s hands, for he is the giver: *Thus saith Elohim (God) Yahuah (LORD), he that created the heavens … he that giveth breath unto the people upon it* (Isaiah 42:5). And the wisdom of the fathers had taught the same seeing: *by the greatness and beauty of the creatures proportionably the maker of them is seen* (Wisdom of Solomon 13:5). The unknown God is the Maker of heaven and earth, housed by nothing he made, the giver of the very breath of every man who would worship him.',
       sv.verse_id, ev.verse_id, 'extras', 5684
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation',
       E'Of one blood all nations — and the bounds of their habitation',
       E'Paul presses the Maker''s claim further: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). This is the Song of Moses set in the mouth of the apostle. Moses sang of the same apportioning of the same nations by the same Maker: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The bounds of the Areopagus are the bounds of the Song: the El Elyon (most High) who separated the sons of Adam and set every people in its place — the nations ordered around the children of Yashar''el (Israel), the times and the borders determined by the One who made of one blood all nations of men. The Maker''s claim on the nations is his ordering of the earth he made, not a flattening of the seed he set at the centre of it.',
       sv.verse_id, ev.verse_id, 'free', 5687
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations',
       E'That they should seek Yahuah (Lord) — the Maker summoning the nations',
       E'The Maker set the times and the bounds *that they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27). The end of the ordering is the seeking. Isaiah declared the same Maker for the same purpose: *he formed the earth … he created it not in vain, he formed it to be inhabited: I am Yahuah (LORD); and there is none else* (Isaiah 45:18) — and to the ends of the earth he calls, *Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else* (Isaiah 45:22). The wisdom of the fathers named the groping itself: men *seeking Yahuah (God), and desirous to find him* (Wisdom of Solomon 13:6), feeling after the One who set them in their place. But the seeking is no warrant for the idol — *we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device* (Acts 17:29). Isaiah exposed the graven image: *they have no knowledge that set up the wood of their graven image, and pray unto a god that cannot save* (Isaiah 45:20); and the fathers'' wisdom: *in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver* (Wisdom of Solomon 13:10). The Maker summons the nations he formed to seek him — not to fashion him after the dead works of their own hands, but to find the living One who is not far off.',
       sv.verse_id, ev.verse_id, 'extras', 5690
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-the-appointed-man-the-day-of-judgment-in-righteousness',
       E'The appointed Man — the day of judgment in righteousness',
       E'Paul brings the Areopagus to its edge: *the times of this ignorance Elohim (God) winked at; but now commandeth all men every where to repent: Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:30-31). The appointed day is the day the Psalmist sang: *he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth* (Psalm 96:13). And the ordained Man is the One Daniel saw in the night vision: *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — the Formed who took on flesh, resembling mortal-man, brought near before the throne — *and there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). The nations made of one blood and set in their bounds (Acts 17:26) are the nations given to serve the ordained Man. And the Master named the ground of his right to judge them: *hath given him authority to execute judgment also, because he is the Son of Adam* (John 5:27). The Judge of the appointed day is the Son of Adam, the seed of Adam come in flesh, to whom the Father committed all judgment — the Maker who summons the nations is the One who will try them by the Man he ordained.',
       sv.verse_id, ev.verse_id, 'free', 5693
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given',
       E'Raised from the dead — the firstfruits and the assurance given',
       E'The assurance of the appointed day is not a sign yet to come but one already given: *whereof he hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31). The raising was written in the Psalm David sang: *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). When the Athenians *heard of the resurrection of the dead, some mocked* (Acts 17:32) — yet the resurrection they mocked is the firstfruits of a harvest, not a single isolated wonder. *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20); and the harvest has its order — *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23). The One raised is the first sheaf gone before; the dead whom the appointed Man will judge are the dead who shall be raised. The resurrection is the pledge the Maker has already laid down that the day is fixed and the Judge is seated — the firstfruits the assurance of the gathering to come.',
       sv.verse_id, ev.verse_id, 'free', 5696
  FROM _s217_a17_lookup sv, _s217_a17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=17 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *he was wounded for our transgressions … with his stripes we are healed* the suffering Paul reasons out of the scriptures (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:8 — *he was cut off out of the land of the living: for the transgression of my people was he stricken* the servant whose cutting-off the rising answers (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* the rising written in the Psalm, the resurrection Paul preaches (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 24:26 — *Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* the suffering-then-glory the Master opened (Acts 17:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 24:46 — *thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* the written word Paul shows in the synagogue (Acts 17:2-3).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-reasoning-from-the-scriptures-messiah-must-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-these-that-have-turned-the-world-upside-down-another-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:44 — *the Elohim (God) of heaven set up a kingdom, which shall never be destroyed … it shall stand for ever* the kingdom of the other King (Acts 17:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-these-that-have-turned-the-world-upside-down-another-king'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:7 — *upon the throne of David, and upon his kingdom … for ever* the throne of the King the rulers fear (Acts 17:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-these-that-have-turned-the-world-upside-down-another-king'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:20 — *to the law and to the testimony: if they speak not according to this word … there is no light in them* the test the Bereans applied (Acts 17:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:39 — *Search the scriptures … they are they which testify of me* the searching the Bereans practised, the witness they found (Acts 17:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-bereans-searched-the-scriptures-daily-whether-those-things-were-so'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 8:27 — *the heaven and heaven of heavens cannot contain thee; how much less this house* Solomon''s word at the temple itself, that the Maker is not housed by hands (Acts 17:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:1 — *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* the Maker who dwells not in temples made with hands (Acts 17:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:2 — *all those things hath mine hand made … but to this man will I look … that trembleth at my word* the Maker who looks to the contrite heart, not the house (Acts 17:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 42:5 — *he that giveth breath unto the people upon it, and spirit to them that walk therein* the Maker who needs nothing and gives all life and breath (Acts 17:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 13:5 — *by the greatness and beauty of the creatures proportionably the maker of them is seen* the works pointing past themselves to the unknown God (Acts 17:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-unknown-god-the-maker-needs-no-temple-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* the Song of Moses behind the bounds of habitation (Acts 17:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-of-one-blood-all-nations-and-the-bounds-of-their-habitation'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 45:18 — *he formed the earth … he formed it to be inhabited: I am Yahuah (LORD); and there is none else* the Maker who formed the earth to be dwelt in, that men might seek him (Acts 17:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:6 — *they perhaps err, seeking Yahuah (God), and desirous to find him* the groping after the Maker, the seeking that is his summons (Acts 17:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:20 — *they have no knowledge that set up the wood of their graven image, and pray unto a god that cannot save* the idol Paul says the offspring of Elohim (God) must not fashion (Acts 17:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 13:10 — *in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver* the dead works the living Maker is not to be likened to (Acts 17:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-that-they-should-seek-yahuah-the-maker-summoning-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-the-appointed-man-the-day-of-judgment-in-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 96:13 — *he cometh to judge the earth: he shall judge the world with righteousness* the appointed day of judgment the Psalmist sang (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the ordained Man brought before the throne; the kaph honours the Formed who took on flesh (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *there was given him dominion … all people, nations, and languages, should serve him* the nations of one blood given to serve the ordained Man (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:27 — *hath given him authority to execute judgment also, because he is the Son of Adam* the ground of the ordained Man''s right to judge (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-the-appointed-man-the-day-of-judgment-in-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* the raising written in the Psalm, the assurance given (Acts 17:31).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:20 — *now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* the resurrection the Athenians mocked is the firstfruits of a harvest (Acts 17:32).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:23 — *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* the order of the harvest the first sheaf assures (Acts 17:32).'
  FROM cross_reference_threads t, cross_references x, _s217_a17_lookup sv, _s217_a17_lookup tv
 WHERE t.slug='acts-17-raised-from-the-dead-the-firstfruits-and-the-assurance-given'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=17 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
