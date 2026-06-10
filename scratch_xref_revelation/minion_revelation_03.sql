-- ----- fragment: minion_revelation_03.sql (S224 Revelation 3) -----
-- =====================================================================
-- S224 minion — REVELATION 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 3 (22 verses) — the letters to Sardis, Philadelphia, Laodicea.
-- Tag: rv03 (temp view _s224_rv03_lookup).
-- Sort band: floor 9050, step 3 (9050, 9053, 9056, 9059, 9062, 9065, 9068 used; under 9075).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation is the consummation of the covenant story — the same Yahuah, the same
-- Torah, the same Yashar'el (Israel) brought to restoration. The overcomer of the seven letters is
-- the one who keeps the word and is not blotted out of the book of life; the destination is the new
-- Jerusalem coming DOWN (3:12), the city of the restored tribes (ch 21). The 3:9 *synagogue of Satan,
-- which say they are Yahudim (Jews), and are not* is read exactly as 2:9 is: a FALSE-CLAIM diagnostic
-- (those claiming the covenant name while opposing the Messiah and his commandment-keepers), NEVER a
-- charter for anti-Jewish replacement. The true Yashar'el is the one being gathered and sealed.
-- Christology: Yahusha is the Formed drawn from the Formless — *the Amen, the faithful and true
-- witness, the beginning of the creation of Elohim* (3:14), who has a Father and is *set down with my
-- Father in his throne* (3:21): Father and Formed Son distinguished, never collapsed, never co-equal-
-- persons. Names preserved exactly as the pull gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   Sardis: a name that thou livest and art dead; the book of life, names not blotted out
--           Tanakh: Exodus 32:32-33 (blot me out of thy book / whosoever sinned will I blot out),
--                   Daniel 12:1 (every one found written in the book delivered), Psalm 69:28 (let them
--                   be blotted out of the book of the living)
--           Extras: 1 Enoch 104:1 (the books of life, names written before the Most High), 1 Enoch
--                   108:3 (their names blotted out of the book of life)
--           NT: Matthew 10:32 (confess me before men, I will confess before my Father), Luke 12:8
--               (the Son of Adam confess before the angels of Elohim)
--   v.7-8   Philadelphia: the key of David, he that openeth and no man shutteth
--           Tanakh: Isaiah 22:22 (the key of the house of David, he shall open and none shut)
--           Extras: none warranted   NT: none warranted (carried in the throne thread at v.21)
--   v.9-11  the synagogue of Satan, which say they are Jews and are not — the FALSE-CLAIM diagnostic
--           Tanakh: Isaiah 65:15-16 (leave your name a curse, his servants called by another name,
--                   the Elohim of truth)
--           Extras: none warranted   NT: Romans 9:25-26 (I will call them my people which were not my
--                   people — the true reckoning is by the calling, not the bare claim)
--   v.12    the pillar in the temple, the name of the new Jerusalem written on the overcomer
--           Tanakh: Ezekiel 48:35 (the name of the city, Yahuah Shammah), Isaiah 62:2 (called by a new
--                   name which the mouth of Yahuah shall name)
--           Extras: Tobit 13:16 (Jerusalem built with sapphires and emeralds and gold)
--           NT: Revelation 21:2 (the new Jerusalem coming down from Elohim out of heaven)
--   v.13    He that hath an ear — refrain; none warranted
--   v.14    Laodicea: the Amen, the faithful and true witness, the beginning of the creation of Elohim
--           Tanakh: Isaiah 65:16 (the Elohim of truth — Hebrew Elohei Amen), Isaiah 44:6 (the first
--                   and the last), Proverbs 8:22 (Yahuah possessed me in the beginning of his way)
--           Extras: none warranted   NT: Colossians 1:15 (firstborn of every creature), 1:18 (the
--                   beginning, the firstborn from the dead)
--   v.15-18 lukewarm; buy of me gold tried in the fire and white raiment and eyesalve
--           Tanakh: Isaiah 55:1 (buy wine and milk without money and without price)
--           Extras: none warranted   NT: none warranted
--   v.19-20 I stand at the door and knock; whom I love I rebuke and chasten
--           Tanakh: Proverbs 8:34 (blessed is the man that heareth me, watching at my gates)
--           Extras: none warranted   NT: none warranted (woven into the door thread)
--   v.21-22 sit with me in my throne, even as I overcame and am set down with my Father in his throne
--           Tanakh: Daniel 7:9 (the Ancient of days did sit), Daniel 7:14 (dominion given him)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9050 revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12   (Tanakh + Extras + NT)
--   9053 revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22  (Tanakh)
--   9056 revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65  (Tanakh + NT)
--   9059 revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48  (Tanakh + Extras + NT)
--   9062 revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8  (Tanakh + NT)
--   9065 revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55  (Tanakh)
--   9068 revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s224_rv03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12
  ('canon', 'revelation', 3, 5, 'canon', 'exodus', 32, 32, 'free', E'*Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* (Exodus 32:32). Here is the book itself, named at the foot of Sinai: Moses pleads to be blotted out of *thy book which thou hast written* rather than see Yashar''el (Israel) lost. To Sardis the same book is the promise: *I will not blot out his name out of the book of life* (Revelation 3:5). The book the overcomer is kept written in is no new thing — it is the book Yahuah (LORD) has kept from the beginning, and to remain in it is to be kept among the living people of the covenant.'),
  ('canon', 'revelation', 3, 5, 'canon', 'exodus', 32, 33, 'free', E'*And Yahuah (LORD) said unto Moses, Whosoever hath sinned against me, him will I blot out of my book.* (Exodus 32:33). The blotting is real and it answers sin — *him will I blot out of my book.* So the word to Sardis is a warning held inside a promise: the assembly has *a name that thou livest, and art dead* (Revelation 3:1), and only the overcomer is told *I will not blot out his name out of the book of life* (Revelation 3:5). The name written can be struck; the call is to *be watchful, and strengthen the things which remain* (Revelation 3:2), to keep the place in the book that sin would forfeit.'),
  ('canon', 'revelation', 3, 5, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Daniel sees the deliverance run by the book — *every one that shall be found written in the book* is delivered through the time of trouble. This is the book Sardis is summoned to stay written in: *I will not blot out his name out of the book of life* (Revelation 3:5). To be kept in the book is to be among *thy people* delivered at the end; the overcomer of Sardis stands with the children of the covenant whom Michael guards.'),
  ('canon', 'revelation', 3, 5, 'canon', 'psalms', 69, 28, 'free', E'*Let them be blotted out of the book of the living, and not be written with the righteous.* (Psalm 69:28). The psalmist prays the blotting upon the persecutors of the righteous sufferer — *blotted out of the book of the living, and not be written with the righteous.* The promise to Sardis is the mirror of that judgment: the overcomer *shall be clothed in white raiment; and I will not blot out his name out of the book of life* (Revelation 3:5). The two books are one book; to be *written with the righteous* is to keep the white garments undefiled, while the name that defiles its garments is the name in danger of the blotting.'),
  ('canon', 'revelation', 3, 5, 'enoch', '1-enoch', 104, 1, 'extras', E'*And now I swear unto you, ye righteous, By the greatness of His splendour and His glory, By His greatness I swear unto you. That I have seen, and the light has shone upon me, And I have seen the holy ones of heaven, And I have beheld the books of life.* (1 Enoch 104:1-2). Enoch is shown the same books, and the same writing of the righteous in them: *your names are written in the books of life before the Most High* (1 Enoch 104:3). To Sardis the slain-yet-living one speaks of that very register: *I will not blot out his name out of the book of life* (Revelation 3:5). The restored library keeps the picture whole — the books of life are open before the Most High, and the names of the righteous stand written there.'),
  ('canon', 'revelation', 3, 5, 'enoch', '1-enoch', 108, 3, 'extras', E'*Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever* (1 Enoch 108:3). Enoch names the blotting that falls on the sinners — *their names shall be blotted out of the book of life.* That is the very sentence the overcomer of Sardis is promised exemption from: *I will not blot out his name out of the book of life* (Revelation 3:5). The same book, the same blotting, the same patience-unto-the-end — the Hebrew library and the Apocalypse speak one judgment, and the white-robed who endure are kept written.'),
  ('canon', 'revelation', 3, 5, 'canon', 'matthew', 10, 32, 'free', E'*Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* (Matthew 10:32). The promise to Sardis closes with this very confessing — *I will confess his name before my Father, and before his angels* (Revelation 3:5). The word the Messiah spoke in the gospel he now speaks from the throne to the overcomer: the one who held his name before men is owned by name before the Father. And mark the Christology the verse carries plainly: he confesses *before my Father* — the Formed Son before the Formless, the two distinguished, never collapsed.'),
  ('canon', 'revelation', 3, 5, 'canon', 'luke', 12, 8, 'free', E'*Also I say unto you, Whosoever shall confess me before men, him shall the Son of Adam also confess before the angels of Elohim (God)* (Luke 12:8). Luke records the same word, and names the confessor *the Son of Adam* — the seed of Adam who owns his own before the angels. To Sardis he keeps it: *I will confess his name before my Father, and before his angels* (Revelation 3:5). The confessing *before the angels of Elohim (God)* and *before his angels* are one promise; the overcomer who confessed the name on earth is confessed by the Son of Adam in heaven.'),
  -- thread: revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22
  ('canon', 'revelation', 3, 7, 'canon', 'isaiah', 22, 22, 'free', E'*And the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut; and he shall shut, and none shall open.* (Isaiah 22:22). The risen one announces himself to Philadelphia in Isaiah''s very words: *he that hath the key of David, he that openeth, and no man shutteth; and shutteth, and no man openeth* (Revelation 3:7). In Isaiah the key passes from faithless Shebna to faithful Eliakim, who is *a father to the inhabitants of Jerusalem* (Isaiah 22:21) — the steward who holds the sole authority over the house of David. That whole stewardship is gathered into the hand of the Messiah; the key of David is his, and the door he opens — *behold, I have set before thee an open door, and no man can shut it* (Revelation 3:8) — no man can close.'),
  -- thread: revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65
  ('canon', 'revelation', 3, 9, 'canon', 'isaiah', 65, 15, 'free', E'*And ye shall leave your name for a curse unto my chosen: for Adonai Yahuah (the Lord GOD) shall slay thee, and call his servants by another name* (Isaiah 65:15). Isaiah sets the line not between Yahudi (Jew) and non-Yahudi but between those who forsake Yahuah (LORD) and the servants he keeps: the rebels leave their name a curse, while *his servants* he calls by a name of his own giving. That is the very line drawn at Philadelphia: *them of the synagogue of Satan, which say they are Yahudim (Jews), and are not, but do lie* (Revelation 3:9). The claim is not the proof; the name is owned only where the covenant is kept. Those who *say they are Yahudim (Jews), and are not* claim the covenant name while opposing the Messiah and his keepers — and to the faithful he gives, as in Isaiah, a new name (Revelation 3:12). This is a diagnostic of false claim, never a charter against the people of Yahudah (Judah), whom the prophets gather home.'),
  ('canon', 'revelation', 3, 9, 'canon', 'isaiah', 65, 16, 'free', E'*That he who blesseth himself in the earth shall bless himself in the Elohim (God) of truth; and he that sweareth in the earth shall swear by the Elohim (God) of truth; because the former troubles are forgotten, and because they are hid from mine eyes.* (Isaiah 65:16). Twice Isaiah names him *the Elohim (God) of truth* — and the one who speaks to Philadelphia is *he that is holy, he that is true* (Revelation 3:7), the Amen who cannot lie. So the charge against the false claimants is precisely that they *do lie* (Revelation 3:9): they stand over against the Elohim (God) of truth. The reckoning is by truth, not by the bare word of the mouth; the true and holy one knows his own, and *I have loved thee* (Revelation 3:9) is spoken to the keepers, not the claimers.'),
  ('canon', 'revelation', 3, 9, 'canon', 'romans', 9, 25, 'free', E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved.* (Romans 9:25). Paul names the reckoning that decides the matter: the people of Yahuah (LORD) are *called* — *I will call them my people, which were not my people* — and the beloved are made beloved by his love, *which was not beloved.* So the synagogue of Satan are exposed not by ancestry but by their lie against the calling — they *say they are Yahudim (Jews), and are not* (Revelation 3:9) — while to the faithful of Philadelphia the loving word is sealed: *I will make them to come and worship before thy feet, and to know that I have loved thee* (Revelation 3:9). The beloved are those Yahuah (LORD) calls and loves, the scattered owned again as his people — not a people self-named by a claim the Messiah denies.'),
  -- thread: revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48
  ('canon', 'revelation', 3, 12, 'canon', 'ezekiel', 48, 35, 'free', E'*It was round about eighteen thousand measures: and the name of the city from that day shall be, Yahuah Shammah (The LORD is there).* (Ezekiel 48:35). Ezekiel ends his measured city with its name — *Yahuah Shammah (The LORD is there)* — the city of the twelve tribes whose twelve gates he has just named one by one. To the overcomer of Philadelphia the promise gathers that name onto the man himself: *I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem* (Revelation 3:12). The city whose name is Yahuah-is-there is the new Jerusalem, and to bear its name is to belong forever to the restored city of the tribes — *he shall go no more out.*'),
  ('canon', 'revelation', 3, 12, 'canon', 'isaiah', 62, 2, 'free', E'*And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name.* (Isaiah 62:2). Isaiah promises Jerusalem a new name spoken by the mouth of Yahuah (LORD) — the forsaken city renamed and married (Isaiah 62:4). The same new-naming falls on the overcomer: *I will write upon him my new name* (Revelation 3:12). The new name is no erasure of the city but its restoration — the people who were called Forsaken given a name out of the mouth of Yahuah (LORD), and the faithful written into that renamed city as pillars that go no more out.'),
  ('canon', 'revelation', 3, 12, 'apocrypha', 'tobit', 13, 16, 'extras', E'*For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold.* (Tobit 13:16). Tobit sings the new Jerusalem before John sees it — the city rebuilt of sapphire and emerald and gold, the gathered city of *the children of the just* (Tobit 13:13). That is the city whose name the overcomer is promised to bear: *the name of the city of my Elohim (God), which is new Jerusalem, which cometh down out of heaven from my Elohim (God)* (Revelation 3:12). The Hebrew library already held the hope of the jewelled city built up for the gathered people; Revelation shows it coming down, and writes its name on the faithful.'),
  ('canon', 'revelation', 3, 12, 'canon', 'revelation', 21, 2, 'free', E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* (Revelation 21:2). The name promised to the overcomer in the letter is the city John will see descend at the end: *new Jerusalem, coming down from Elohim (God) out of heaven.* What is written on the man at Philadelphia — *new Jerusalem, which cometh down out of heaven from my Elohim (God)* (Revelation 3:12) — is shown in full when the city itself comes down to the restored earth. The letter and the vision are one hope: not a flight away to heaven, but the holy city coming DOWN, and the faithful belonging to it as pillars that go no more out.'),
  -- thread: revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8
  ('canon', 'revelation', 3, 14, 'canon', 'isaiah', 65, 16, 'free', E'*That he who blesseth himself in the earth shall bless himself in the Elohim (God) of truth; and he that sweareth in the earth shall swear by the Elohim (God) of truth; because the former troubles are forgotten, and because they are hid from mine eyes.* (Isaiah 65:16). The title the Messiah takes to Laodicea — *the Amen, the faithful and true witness* (Revelation 3:14) — is Isaiah''s *Elohim (God) of truth*, the Elohei-Amen by whom the faithful bless and swear. He is the Amen because he is the truth that does not fail; the lukewarm assembly that thinks itself *rich, and increased with goods* (Revelation 3:17) is measured against the one who is himself the faithful and true witness, the Amen of Yahuah (LORD) standing where the false claims fall away.'),
  ('canon', 'revelation', 3, 14, 'canon', 'isaiah', 44, 6, 'free', E'*Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6). Isaiah''s King of Yashar''el (Israel) declares *I am the first, and I am the last* — the same one who names himself to Laodicea *the beginning of the creation of Elohim (God)* (Revelation 3:14). This is the Formed drawn from the Formless: the first-and-the-last of Isaiah is the one who speaks from the throne, Yahuah''s own self-naming carried by the Messiah, who *am set down with my Father in his throne* (Revelation 3:21). He is the beginning — not a creature among creatures, but the One in whom and by whom the creation begins.'),
  ('canon', 'revelation', 3, 14, 'canon', 'proverbs', 8, 22, 'free', E'*Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* (Proverbs 8:22). Wisdom speaks of standing with Yahuah (LORD) *in the beginning of his way, before his works of old* — *brought up with him* and *daily his delight* as the world was framed (Proverbs 8:30). The Messiah names himself to Laodicea in that very register: *the beginning of the creation of Elohim (God)* (Revelation 3:14). The beginning of the creation is the Formed who was with the Father before the works of old, by whom the heavens were prepared — the Wisdom of Proverbs given a face and a voice, speaking now to the assembly that knows not its own poverty.'),
  ('canon', 'revelation', 3, 14, 'canon', 'colossians', 1, 15, 'free', E'*Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15). Paul names the same one Laodicea hears: *the image of the invisible Elohim (God)* — the visible Formed of the invisible Formless — *the firstborn of every creature*, by whom *were all things created* (Colossians 1:16). That is precisely *the beginning of the creation of Elohim (God)* (Revelation 3:14): not the first thing made, but the firstborn over and the maker of all things, the image in whom the invisible Father is seen. The Amen who speaks to Laodicea is the one through whom and for whom the whole creation came to be.'),
  ('canon', 'revelation', 3, 14, 'canon', 'colossians', 1, 18, 'free', E'*And he is the head of the body, the church: who is the beginning, the firstborn from the dead; that in all things he might have the preeminence.* (Colossians 1:18). Paul calls him *the beginning, the firstborn from the dead* — the same word the Messiah takes at Laodicea: *the beginning of the creation of Elohim (God)* (Revelation 3:14). He is the beginning of the first creation and the beginning of the new — *the firstborn from the dead*, the first to rise into the life of the age to come. The faithful and true witness who counsels Laodicea to buy *white raiment* (Revelation 3:18) is the one in whom the new creation has already begun, having the preeminence in all things.'),
  -- thread: revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55
  ('canon', 'revelation', 3, 18, 'canon', 'isaiah', 55, 1, 'free', E'*Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* (Isaiah 55:1). Isaiah''s gospel-cry is the buying that costs nothing — *buy, and eat... without money and without price* — to the thirsty who have nothing. The Messiah turns it on Laodicea, who thinks she has everything: *I counsel thee to buy of me gold tried in the fire, that thou mayest be rich; and white raiment* (Revelation 3:18). The one who says *I am rich... and have need of nothing* (Revelation 3:17) is the truly poor; the riches worth having are bought of him, on Isaiah''s terms — come to the one who gives without price what gold cannot buy.'),
  ('canon', 'revelation', 3, 20, 'canon', 'proverbs', 8, 34, 'free', E'*Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors.* (Proverbs 8:34). Wisdom blesses the one who watches at her doors and waits at her posts — the hearer who keeps the threshold. At Laodicea the figure is turned: now it is the Messiah himself who waits at the door — *Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him* (Revelation 3:20). The blessing of Proverbs falls on the one who *heareth me*; the same hearing opens the door — *if any man hear my voice* — and the one who waited at wisdom''s posts now finds Wisdom himself knocking, ready to come in and sup.'),
  -- thread: revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7
  ('canon', 'revelation', 3, 21, 'canon', 'daniel', 7, 9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9). Daniel sees the thrones set and *the Ancient of days* take his seat — the Father in the vision-form of the throne-court. To that throne the overcomer of Laodicea is called up: *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* (Revelation 3:21). The Messiah is set down *with my Father* — the Formed Son distinguished from the Ancient of days who sits, never collapsed into him — and the faithful are granted to sit with the Son, drawn into the throne-court Daniel beheld.'),
  ('canon', 'revelation', 3, 21, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). To the one like the Son of Adam in Daniel''s vision is *given... dominion, and glory, and a kingdom* — the everlasting reign received from the Ancient of days. That granting is what the Messiah shares with his own at Laodicea: *To him that overcometh will I grant to sit with me in my throne* (Revelation 3:21). As the kingdom was given to him, so he grants the overcomers a seat in it; the everlasting dominion that *shall not pass away* is the throne the faithful are called to share with the one who overcame.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12',
       E'Sardis: a name that thou livest and art dead — the book of life, names not blotted out (Exodus 32, Daniel 12)',
       E'To Sardis, the assembly with *a name that thou livest, and art dead* (Revelation 3:1), the slain-yet-living one speaks of the book that decides the living from the dead. The overcomer *shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels* (Revelation 3:5). The book is not new. It is the book Moses pleaded over at the foot of Sinai — *blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32) — and the book whose blotting answers sin — *Whosoever hath sinned against me, him will I blot out of my book* (Exodus 32:33). It is the book Daniel saw run the deliverance: *at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). It is the book the psalmist named in his cry against the persecutors — *Let them be blotted out of the book of the living, and not be written with the righteous* (Psalm 69:28). And the restored library keeps the same picture whole: Enoch is shown *the books of life*, and *your names are written in the books of life before the Most High* (1 Enoch 104:1-3), while the sinners'' *names shall be blotted out of the book of life* (1 Enoch 108:3). So the warning to Sardis is a warning held inside a promise: the name written can be struck, therefore *be watchful, and strengthen the things which remain, that are ready to die* (Revelation 3:2) — keep the place in the book that defiling the garments would forfeit. And the promise closes with the confessing the Messiah spoke in the gospel: *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven* (Matthew 10:32); *Whosoever shall confess me before men, him shall the Son of Adam also confess before the angels of Elohim (God)* (Luke 12:8). The overcomer who held the name on earth is owned by name before the Father and his angels — the Formed Son confessing his own before the Formless.',
       sv.verse_id, ev.verse_id, 'extras', 9050
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22',
       E'Philadelphia: the key of David, he that openeth and no man shutteth (Isaiah 22)',
       E'The risen one announces himself to Philadelphia in the words of Isaiah: *These things saith he that is holy, he that is true, he that hath the key of David, he that openeth, and no man shutteth; and shutteth, and no man openeth* (Revelation 3:7). The key of David is Isaiah''s own image: *And the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut; and he shall shut, and none shall open* (Isaiah 22:22). In Isaiah the stewardship of the house of David passes from faithless Shebna to faithful Eliakim, who is made *a father to the inhabitants of Jerusalem, and to the house of Yahudah (Judah)* (Isaiah 22:21) — the steward who holds sole authority over the royal house, opening and shutting at his word alone. That whole stewardship is gathered into the hand of the Messiah, the true son of David: the key is his, and the door he opens no man can close. So to the assembly of little strength that *hast kept my word, and hast not denied my name* (Revelation 3:8), the promise is sure: *behold, I have set before thee an open door, and no man can shut it.* The one who holds the key of the house of David has opened the way home, and no power of man or synagogue can shut it against the faithful.',
       sv.verse_id, ev.verse_id, 'free', 9053
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65',
       E'The synagogue of Satan, which say they are Yahudim (Jews), and are not — the false-claim diagnostic (Isaiah 65)',
       E'This is the verse the inherited reading has bent into a weapon against the Yahudim (Jews); read in the prophets'' own frame it is nothing of the kind. *Behold, I will make them of the synagogue of Satan, which say they are Yahudim (Jews), and are not, but do lie; behold, I will make them to come and worship before thy feet, and to know that I have loved thee* (Revelation 3:9). The charge is not against the people of Yahudah (Judah), whom the prophets gather home; it is against those who CLAIM the covenant name *and are not, but do lie* — who wear the name while opposing the Messiah and his commandment-keepers. Isaiah drew exactly this line: not between Yahudi (Jew) and non-Yahudi, but between those who forsake Yahuah (LORD) and the servants he keeps. *Ye shall leave your name for a curse unto my chosen: for Adonai Yahuah (the Lord GOD) shall slay thee, and call his servants by another name* (Isaiah 65:15) — the rebels'' name becomes a curse, while the servants are called by a name of Yahuah''s (LORD''s) own giving, the new name promised to the overcomer at Philadelphia (Revelation 3:12). And Isaiah names the standard twice: the faithful bless and swear by *the Elohim (God) of truth* (Isaiah 65:16) — the very one who speaks here as *he that is holy, he that is true* (Revelation 3:7), the Amen who cannot lie. The false claimants *do lie*; they stand over against the Elohim (God) of truth. The reckoning is by truth, not by the bare word of the mouth — and the true word is settled by the calling, as Paul says: *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). The people of Yahuah (LORD) are those he calls and loves, the scattered owned again as his own — not a people self-named by a claim the Messiah denies. So to the faithful the loving word is sealed: *I have loved thee.* This is a diagnostic of the false claim, never a charter for anti-Yahudi replacement; the true Yashar''el (Israel) is the one being gathered and sealed.',
       sv.verse_id, ev.verse_id, 'free', 9056
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48',
       E'The pillar in the temple and the name of the new Jerusalem written on the overcomer (Ezekiel 48, Tobit 13)',
       E'The promise to Philadelphia gathers the whole hope of the restored city onto the overcomer himself: *Him that overcometh will I make a pillar in the temple of my Elohim (God), and he shall go no more out: and I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem, which cometh down out of heaven from my Elohim (God): and I will write upon him my new name* (Revelation 3:12). The name of the city is Ezekiel''s: at the close of his measured city of the twelve tribes, with its twelve gates named one by one, *the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* (Ezekiel 48:35). To bear that name is to belong forever to the restored city of the tribes — the pillar that goes no more out. And the new name is Isaiah''s promise to the city: *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2) — no erasure of Jerusalem but her restoration, the forsaken renamed and married. The Hebrew library already sang the jewelled city for the gathered people: *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16). What the letter writes on the man, the vision shows coming down in full: *I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). This is the restoration, not a flight away — the holy city of the tribes coming DOWN to the renewed earth, and the faithful written into it as pillars that go no more out.',
       sv.verse_id, ev.verse_id, 'extras', 9059
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8',
       E'The Amen, the faithful and true witness, the beginning of the creation of Elohim (God) (Isaiah 44, Proverbs 8)',
       E'To Laodicea the Messiah takes a title that names who he is in himself: *These things saith the Amen, the faithful and true witness, the beginning of the creation of Elohim (God)* (Revelation 3:14). He is the Amen — Isaiah''s *Elohim (God) of truth* (Isaiah 65:16), the Elohei-Amen by whom the faithful bless and swear, the truth that does not fail, set against the lukewarm assembly that thinks itself *rich, and increased with goods, and have need of nothing* (Revelation 3:17). And *the beginning of the creation of Elohim (God)* is the Formed drawn from the Formless. Isaiah''s King of Yashar''el (Israel) declares *I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6) — Yahuah''s (LORD''s) own self-naming, carried by the one who *am set down with my Father in his throne* (Revelation 3:21), the Son distinguished from the Father, never collapsed. Proverbs gives the same beginning a voice: Wisdom stood with Yahuah (LORD) *in the beginning of his way, before his works of old* (Proverbs 8:22), *brought up with him* as the heavens were framed. And Paul names him plainly: *the image of the invisible Elohim (God), the firstborn of every creature* by whom *were all things created* (Colossians 1:15-16), *the beginning, the firstborn from the dead* (Colossians 1:18). So the beginning of the creation is not the first thing made but the firstborn over and the maker of all things — the visible Formed of the invisible Formless, and the beginning of the new creation as the firstborn from the dead. The faithful and true witness who counsels Laodicea to buy *white raiment* (Revelation 3:18) is the one in whom the whole creation began and in whom it is made new.',
       sv.verse_id, ev.verse_id, 'free', 9062
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55',
       E'Buy of me gold tried in the fire, and I stand at the door and knock (Isaiah 55, Proverbs 8)',
       E'Laodicea is the assembly that has it backward — *Because thou sayest, I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor, and blind, and naked* (Revelation 3:17). The counsel turns her self-reckoning inside out: *I counsel thee to buy of me gold tried in the fire, that thou mayest be rich; and white raiment, that thou mayest be clothed... and anoint thine eyes with eyesalve, that thou mayest see* (Revelation 3:18). The buying is Isaiah''s gospel-cry, the purchase that costs nothing made to the ones who have nothing: *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price* (Isaiah 55:1). The truly poor is the one who thinks she has need of nothing; the riches worth having are bought of him on Isaiah''s terms — come, and receive without price what gold cannot buy. And the love behind the rebuke comes to the very threshold: *As many as I love, I rebuke and chasten: be zealous therefore, and repent. Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him, and will sup with him, and he with me* (Revelation 3:19-20). Wisdom blessed the one who waited at her doors — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors* (Proverbs 8:34) — and now Wisdom himself stands at the door and knocks, asking only to be heard and let in. The hearing opens the door; the one who *heareth me* finds him already there, ready to come in and sup.',
       sv.verse_id, ev.verse_id, 'free', 9065
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7',
       E'Sit with me in my throne, even as I overcame and am set down with my Father in his throne (Daniel 7)',
       E'The seven letters close with the highest promise of all: *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* (Revelation 3:21). The throne is Daniel''s throne-court. Daniel saw the thrones set and *the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame* (Daniel 7:9) — the Father in the vision-form of the court — and to the one like the Son of Adam who came to him was *given... dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14). The Messiah names that very scene: he overcame and *am set down with my Father in his throne* — the Formed Son seated WITH the Father, distinguished from the Ancient of days who sits, never collapsed into him, never a co-equal third. And the dominion given to him he shares with his own: as the everlasting kingdom was given to the Son, so he grants the overcomers to *sit with me in my throne.* The reign that shall not pass away is the throne the faithful are called to share with the one who overcame — the consummation toward which every letter''s *to him that overcometh* has been pointing.',
       sv.verse_id, ev.verse_id, 'free', 9068
  FROM _s224_rv03_lookup sv, _s224_rv03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:32 — *blot me, I pray thee, out of thy book which thou hast written* the book named at Sinai, Moses pleading for Yashar''el (Israel); the book the overcomer is kept written in (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 32:33 — *Whosoever hath sinned against me, him will I blot out of my book* the blotting answers sin; the warning held inside the Sardis promise (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *thy people shall be delivered, every one that shall be found written in the book* the deliverance run by the book; the overcomer kept among the people delivered at the end (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous* the blotting prayed on the persecutors; to be written with the righteous is to keep the white garments (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 104:1-2 — *I have beheld the books of life... your names are written in the books of life before the Most High* the restored library shows the books of life open and the righteous written there (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=104 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 108:3 — *their names shall be blotted out of the book of life* the blotting that falls on the sinners, the sentence the overcomer is promised exemption from (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 10:32 — *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven* the gospel word kept to the overcomer; the Formed Son confessing his own before the Formless Father (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Luke 12:8 — *Whosoever shall confess me before men, him shall the Son of Adam also confess before the angels of Elohim (God)* the same confessing, naming the confessor the Son of Adam who owns his own before the angels (Revelation 3:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sardis-the-book-of-life-names-not-blotted-out-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 22:22 — *the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut* the sole stewardship of David''s house, gathered into the Messiah''s hand; the open door no man can shut (Revelation 3:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:15 — *Ye shall leave your name for a curse unto my chosen... and call his servants by another name* the line drawn between those who forsake Yahuah (LORD) and the servants he keeps and renames, not between Yahudi (Jew) and non-Yahudi (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:16 — *he that sweareth in the earth shall swear by the Elohim (God) of truth* the standard is truth; the false claimants who *do lie* stand over against the Elohim (God) of truth, the holy and true one who speaks (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:25 — *I will call them my people, which were not my people; and her beloved, which was not beloved* the people of Yahuah (LORD) reckoned by his calling and love, the scattered owned again, not by a bare self-claim (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 48:35 — *the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* the name of the measured city of the twelve tribes, written on the overcomer as the new Jerusalem (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=48 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 62:2 — *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* the new name given to the city, the forsaken restored; written on the faithful as his new name (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:16 — *Jerusalem shall be built up with sapphires and emeralds, and precious stone... with pure gold* the restored library''s jewelled city for the gathered people, the new Jerusalem named on the overcomer (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:2 — *the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride* the name on the man shown in full when the city itself comes DOWN to the restored earth (Revelation 3:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-pillar-and-the-name-of-the-new-jerusalem-written-on-the-overcomer-ezekiel-48'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:16 — *the Elohim (God) of truth* the Elohei-Amen by whom the faithful bless and swear; the title the Messiah takes as *the Amen, the faithful and true witness* (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *I am the first, and I am the last; and beside me there is no Elohim (God)* Yahuah''s (LORD''s) own self-naming, carried by the Formed who is set down with his Father; the beginning of the creation (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* Wisdom with the Father before the works of old, the beginning of the creation given a voice (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:15 — *the image of the invisible Elohim (God), the firstborn of every creature* the visible Formed of the invisible Formless, by whom all things were created; the beginning of the creation (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:18 — *who is the beginning, the firstborn from the dead* the beginning of the new creation as well as the old; the firstborn from the dead, having the preeminence (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:1 — *come ye, buy, and eat; yea, come, buy wine and milk without money and without price* the gospel-buying that costs nothing, made to the truly poor; what Laodicea must buy of him (Revelation 3:18).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:34 — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors* Wisdom blesses the one at her door; now Wisdom himself stands at the door and knocks, asking to be heard (Revelation 3:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *the Ancient of days did sit, whose garment was white as snow* the Father in the vision-form of the throne-court; the Son set down WITH him, distinguished, never collapsed (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* the kingdom given to the one like the Son of Adam, shared with the overcomers who sit in his throne (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s224_rv03_lookup sv, _s224_rv03_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
