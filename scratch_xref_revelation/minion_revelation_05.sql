-- ----- fragment: minion_revelation_05.sql (S224 Revelation 5) -----
-- =====================================================================
-- S224 minion — REVELATION 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 5 (14 verses) — the sealed scroll and the Lamb.
-- Tag: rv05 (temp view _s224_rv05_lookup).
-- Sort band: floor 9100, step 3 (9100, 9103, 9106, 9109, 9112, 9115 used; under 9125).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Revelation 5 is the throne-room hinge of the whole book — the One who *sat on
-- the throne* (the Father, 5:1,7,13) holds a scroll *written within and on the backside, sealed with
-- seven seals* (5:1), and no creature can open it until *the Lion of the tribe of Juda, the Root of
-- David* (5:5) is shown to be *a Lamb as it had been slain* (5:6). The CHRISTOLOGY is the slain-yet-
-- reigning Formed: Yahusha (Jesus) is the Lion who is the Lamb, the Root of David from whom David
-- sprang, the One who took on flesh and was slain and yet lives to reign. He is DISTINGUISHED FROM
-- *him that sat upon the throne* (the Father) — he *came and took the book out of the right hand* of
-- the One on the throne (5:7) — and yet he receives the SAME worship as the Father (5:13): *Blessing,
-- and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for
-- ever and ever.* The Formed who is Yahuah and has a Father — not a co-equal second person, not the
-- Father himself. His blood *redeemed us to Elohim (God)... out of every kindred, and tongue, and
-- people, and nation* (5:9) and *made us unto our Elohim (God) kings and priests* (5:10) — the Exodus
-- 19:6 covenant vocation restored, the gathered seed made a kingdom of priests, NOT a replacement
-- people. No Trinitarian co-equal-persons grammar; no modalist collapse; the Lamb and the One on the
-- throne are two, and the worship belongs to the One.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   the scroll written within and on the backside, sealed with seven seals; none worthy
--           Tanakh: Ezekiel 2:9-10 (the roll written within and without, lamentations and woe),
--                   Isaiah 29:11 (the vision become as a book that is sealed), Daniel 12:4 (seal the
--                   book even to the time of the end)
--           Extras: none warranted   NT: none warranted (the worthy One enters at v.5)
--   v.5     the Lion of the tribe of Juda, the Root of David, hath prevailed
--           Tanakh: Genesis 49:9 (Yahudah is a lion's whelp), 49:10 (the sceptre shall not depart
--                   until Shiloh come), Isaiah 11:1 (a rod out of the stem of Jesse, a Branch),
--                   Isaiah 11:10 (a root of Jesse, an ensign of the people)
--           Extras: none warranted   NT: none warranted (carried; the Lamb-witness is John 1)
--   v.6     a Lamb as it had been slain, seven horns, seven eyes, the seven Spirits
--           Tanakh: Isaiah 53:7 (brought as a lamb to the slaughter, openeth not his mouth),
--                   Exodus 12:6 (the whole assembly shall kill it — the Passover lamb),
--                   Zechariah 4:10 (the seven; the eyes of Yahuah run to and fro through the earth),
--                   Zechariah 3:9 (upon one stone seven eyes)
--           Extras: none warranted   NT: John 1:29 (Behold the Lamb of Elohim which taketh away sin)
--   v.7-8   the Lamb takes the book from the right hand of him on the throne; harps and odours
--           Tanakh: none warranted (the prayers/odours carried lightly; weight is on the taking)
--           Extras: none warranted   NT: carried into the worthy/worship threads
--   v.9-10  the new song: thou wast slain, hast redeemed us, made us kings and priests
--           Tanakh: Exodus 19:6 (a kingdom of priests, an holy nation), Psalm 33:3 (sing a new
--                   song), Psalm 40:3 (a new song in my mouth, praise unto our Elohim)
--           Extras: none warranted   NT: Revelation 1:6 (made us kings and priests unto Elohim and
--                   his Father), Revelation 1:5 (washed us from our sins in his own blood)
--   v.11-12 ten thousand times ten thousand — the myriads worshipping the Lamb
--           Tanakh: Daniel 7:10 (thousand thousands ministered, ten thousand times ten thousand
--                   stood before him)
--           Extras: 1 Enoch 40:1 (thousands of thousands and myriads of myriads before Yahuah of
--                   Spirits), 1 Enoch 14:21 (the ten-thousand reckonings of the throne-vision)
--           NT: none warranted
--   v.13-14 every creature: blessing to him on the throne AND to the Lamb — the worship of the Formed
--           Tanakh: Daniel 7:14 (dominion, glory, a kingdom, that all should serve him — everlasting)
--           Extras: none warranted   NT: Philippians 2:10 (every knee should bow), Philippians 2:11
--                   (every tongue confess Yahusha HaMashiach is Lord, to the glory of the Father)
--
-- THREADS (slug -> target libraries):
--   9100 revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2          (Tanakh)
--   9103 revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49              (Tanakh)
--   9106 revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53    (Tanakh + NT)
--   9109 revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19 (Tanakh + NT)
--   9112 revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7   (Tanakh + Extras)
--   9115 revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2 (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s224_rv05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
  ('canon', 'revelation', 5, 1, 'canon', 'ezekiel', 2, 9, 'free', E'*And when I looked, behold, an hand was sent unto me; and, lo, a roll of a book was therein* (Ezekiel 2:9). John sees the very thing Ezekiel saw, held out from the throne: *And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals* (Revelation 5:1). The seer has Ezekiel''s roll in his ear — the scroll handed forth from heaven, the prophetic decree that no man writes and no man may open of himself. What Ezekiel received to eat and to speak, John sees sealed, awaiting the only One found worthy to break it.'),
  ('canon', 'revelation', 5, 1, 'canon', 'ezekiel', 2, 10, 'free', E'*And he spread it before me; and it was written within and without: and there was written therein lamentations, and mourning, and woe* (Ezekiel 2:10). This is the exact shape of John''s scroll: *a book written within and on the backside* (Revelation 5:1) — written on both faces, front and back, the same overflowing decree Ezekiel saw, *written within and without.* The roll crammed full on both sides is the full and finished counsel of Yahuah (LORD), and what it holds is judgment and the working-out of all things; it is no light word, but the sealed sentence the slain Lamb alone can loose.'),
  ('canon', 'revelation', 5, 1, 'canon', 'isaiah', 29, 11, 'free', E'*And the vision of all is become unto you as the words of a book that is sealed, which men deliver to one that is learned, saying, Read this, I pray thee: and he saith, I cannot; for it is sealed* (Isaiah 29:11). Isaiah names the very helplessness John weeps over: a *book that is sealed* that no man can read. *And no man in heaven, nor in earth, neither under the earth, was able to open the book* (Revelation 5:3). The learned cannot, the unlearned cannot; the sealed word stays shut to every creature — until the One the prophets pointed to is found worthy, and the sealing that shut out all flesh is undone by the Lamb.'),
  ('canon', 'revelation', 5, 4, 'canon', 'daniel', 12, 4, 'free', E'*But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased* (Daniel 12:4). Daniel was told to *seal the book, even to the time of the end* — and so it stayed sealed, and John *wept much, because no man was found worthy to open and to read the book* (Revelation 5:4). The grief is the grief of a sealed prophecy with no one to break it. But the sealing was *to the time of the end,* and the time has come: the Lamb who *hath prevailed to open the book, and to loose the seven seals thereof* (Revelation 5:5) is the One for whom Daniel''s scroll waited.'),
  -- thread: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
  ('canon', 'revelation', 5, 5, 'canon', 'genesis', 49, 9, 'free', E'*Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9). When the elder says *behold, the Lion of the tribe of Juda... hath prevailed* (Revelation 5:5), he is naming Jacob''s dying blessing over his son — the lion of the tribe of Yahudah (Judah), the royal beast who couches and none dares rouse. The Lion who prevails to open the scroll is the promised one of Yahudah''s line, the Messiah sprung from the kingly tribe, come up *from the prey* having conquered.'),
  ('canon', 'revelation', 5, 5, 'canon', 'genesis', 49, 10, 'free', E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The same blessing carries the sceptre and the gathering: the rule stays in Yahudah (Judah) *until Shiloh come,* and *unto him shall the gathering of the people be.* This is the One who *hath prevailed* (Revelation 5:5) — Shiloh come at last, the rightful King of Yahudah''s line to whom the gathering of the people belongs, the One whose blood *redeemed us to Elohim (God)... out of every kindred, and tongue, and people, and nation* (Revelation 5:9). The Lion who opens the scroll is the King who gathers the seed home.'),
  ('canon', 'revelation', 5, 5, 'canon', 'isaiah', 11, 1, 'free', E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). The elder names him twice — *the Lion of the tribe of Juda, the Root of David* (Revelation 5:5) — and the second title is Isaiah''s: the shoot from Jesse''s stem, David''s father, the Branch from the royal root. He is the rod out of the stem of Jesse, the One in whom *the spirit of Yahuah (LORD)* rests (Isaiah 11:2), the very seven-fold Spirit John sees as *seven eyes... the seven Spirits of Elohim (God)* (Revelation 5:6).'),
  ('canon', 'revelation', 5, 5, 'canon', 'isaiah', 11, 10, 'free', E'*And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious* (Isaiah 11:10). *The Root of David* (Revelation 5:5) is the *root of Jesse* of Isaiah — and mark the title: not merely a branch from the root, but the Root itself, the One from whom David sprang and in whom David''s house stands. He is set up *for an ensign of the people,* the banner the gathered seek, the One whose prevailing opens the scroll and whose redeemed are drawn *out of every kindred, and tongue, and people, and nation* (Revelation 5:9).'),
  -- thread: revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53
  ('canon', 'revelation', 5, 6, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). John looks for the Lion and sees *a Lamb as it had been slain* (Revelation 5:6) — and this is the lamb Isaiah foretold, *brought as a lamb to the slaughter.* The Lion of Yahudah (Judah) prevails not by devouring but by being slain; the conquering King is the silent sacrificial lamb, the suffering servant of Isaiah who *bare the sin of many* (Isaiah 53:12). The slain-yet-standing Lamb is the Lion''s victory.'),
  ('canon', 'revelation', 5, 6, 'canon', 'exodus', 12, 6, 'free', E'*And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6). The *Lamb as it had been slain* (Revelation 5:6) carries the Passover lamb in its body — the lamb *without blemish, a male of the first year* (Exodus 12:5) that the whole congregation killed, whose blood on the door turned aside the destroyer. The slain Lamb in the midst of the throne is the true Passover, by whose blood the gathered are redeemed: *thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9).'),
  ('canon', 'revelation', 5, 6, 'canon', 'zechariah', 4, 10, 'free', E'*For who hath despised the day of small things? for they shall rejoice, and shall see the plummet in the hand of Zerubbabel with those seven; they are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10). The Lamb''s *seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6) are Zechariah''s *eyes of Yahuah (LORD), which run to and fro through the whole earth.* The all-seeing eyes of Yahuah (LORD) himself are the Lamb''s eyes — the Formed bearing what is the Father''s own, the seven-fold Spirit going out into all the earth.'),
  ('canon', 'revelation', 5, 6, 'canon', 'zechariah', 3, 9, 'free', E'*For behold the stone that I have laid before Joshua; upon one stone shall be seven eyes: behold, I will engrave the graving thereof, saith Yahuah Tseva''ot (LORD of hosts), and I will remove the iniquity of that land in one day* (Zechariah 3:9). The *seven eyes* on Zechariah''s engraved stone — beside the promise *I will remove the iniquity of that land in one day* — meet the *seven eyes* of the Lamb (Revelation 5:6) who *wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9). The stone with seven eyes and the iniquity removed in one day foreshadow the slain Lamb who bears the seven Spirits and takes away sin in the one day of his offering.'),
  ('canon', 'revelation', 5, 6, 'canon', 'john', 1, 29, 'free', E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29). What the Witness pointed to at the Jordan, the seer beholds in heaven: *Behold the Lamb of Elohim (God)* and *a Lamb as it had been slain* (Revelation 5:6) name one and the same — Yahusha (Jesus), the Lamb of Elohim (God) who takes away sin. The Lamb hailed at his coming is the Lamb enthroned in the midst of the throne, slain and yet standing, the One *who taketh away the sin of the world.*'),
  -- thread: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
  ('canon', 'revelation', 5, 10, 'canon', 'exodus', 19, 6, 'free', E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). The new song says *and hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:10) — and this is the Sinai covenant vocation restored: *a kingdom of priests, and an holy nation,* the word Yahuah (LORD) spoke to the children of Yashar''el (Israel) at the mount. The Lamb''s blood does not make a new people in Israel''s place; it brings the covenant people into the priestly kingship they were always called to, *and we shall reign on the earth.*'),
  ('canon', 'revelation', 5, 9, 'canon', 'psalms', 33, 3, 'free', E'*Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3). The four beasts and the elders *sung a new song* (Revelation 5:9) — the very thing the psalm calls for, *sing unto him a new song.* A new song is sung for a new and mighty work of Yahuah (LORD); here the new work is the slain Lamb who *wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9), and the harps of heaven take up the psalm''s summons before the throne.'),
  ('canon', 'revelation', 5, 9, 'canon', 'psalms', 40, 3, 'free', E'*And he hath put a new song in my mouth, even praise unto our Elohim (God): many shall see it, and fear, and shall trust in Yahuah (LORD)* (Psalm 40:3). The *new song* of heaven (Revelation 5:9) is the song the psalmist was given — *a new song in my mouth, even praise unto our Elohim (God).* It is the song of the redeemed, sung by those drawn up out of the pit; and the heavenly choir sings it of the One who *wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9), praise unto our Elohim (God) for the redemption the Lamb has wrought.'),
  ('canon', 'revelation', 5, 10, 'canon', 'revelation', 1, 6, 'free', E'*And hath made us kings and priests unto Elohim (God) and his Father; to him be glory and dominion for ever and ever. Amen* (Revelation 1:6). What the book opened with, the new song now sings: *and hast made us unto our Elohim (God) kings and priests* (Revelation 5:10). And mark how the opening verse distinguishes the Formed from the Father even as it names the gift — the Lamb made us kings and priests *unto Elohim (God) and his Father.* He is the One who has a Father; his blood makes the redeemed a royal priesthood unto the Elohim (God) who is also his Father.'),
  ('canon', 'revelation', 5, 9, 'canon', 'revelation', 1, 5, 'free', E'*And from Yahusha HaMashiach (Jesus Christ), who is the faithful witness, and the first begotten of the dead, and the prince of the kings of the earth. Unto him that loved us, and washed us from our sins in his own blood* (Revelation 1:5). The new song''s *thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9) is the same redemption the book named at the first: *washed us from our sins in his own blood.* The blood of the slain Lamb is the price of the redemption — his own blood poured out, by which the gathered are washed and bought back to Elohim (God).'),
  -- thread: revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7
  ('canon', 'revelation', 5, 11, 'canon', 'daniel', 7, 10, 'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). John''s count of the worshippers is Daniel''s exact number: *the number of them was ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11). The myriads who stood before the Ancient of days in Daniel''s throne-vision are the myriads round about the throne in John''s — and where Daniel saw *the books were opened,* John sees the sealed book opened by the Lamb. The same heavenly court, the same uncountable host, gathered now to cry *Worthy is the Lamb that was slain* (Revelation 5:12).'),
  ('canon', 'revelation', 5, 11, 'enoch', '1-enoch', 40, 1, 'extras', E'*And after that I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits* (1 Enoch 40:1). The Hebrew library saw the same innumerable host before the throne that John saw: *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits.* John''s *ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11) breathes the same air — the countless angelic court round the throne, lifting praise. Enoch heard their voices bless *Yahuah (God) of Spirits* and bless *the Elect One* beside him (1 Enoch 40:5); John hears them cry *Worthy is the Lamb that was slain* (Revelation 5:12) — the One on the throne and the Elect One, the Father and the slain Lamb, praised together by the myriads.'),
  ('canon', 'revelation', 5, 11, 'enoch', '1-enoch', 14, 21, 'extras', E'*And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 14:21). In the same throne-vision where Enoch saw the mountain *like the throne of Yahuah (God)* (1 Enoch 14:15) and the columns of heavenly fire, the measure *ten thousand* sounds — the very scale John reaches for at the throne: *ten thousand times ten thousand* (Revelation 5:11). The myriad-numbered host of heaven and the ten-thousand reckonings of the throne-vision are the world Revelation 5 stands in: the innumerable court gathered before the One who sits, now lifting its voice to the Lamb.'),
  -- thread: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
  ('canon', 'revelation', 5, 13, 'canon', 'philippians', 2, 10, 'free', E'*That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The whole creation''s worship of the Lamb is Paul''s *every knee should bow... of things in heaven, and things in earth, and things under the earth* — the same threefold sweep: *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). To the slain Lamb, exalted and given the name above every name, all that is bows.'),
  ('canon', 'revelation', 5, 13, 'canon', 'philippians', 2, 11, 'free', E'*And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11). Here is the Christology held exactly: every tongue confesses the Lamb *to the glory of Elohim (God) the Father.* In John''s vision the worship goes *unto him that sitteth upon the throne, and unto the Lamb* (Revelation 5:13) — the Father and the Formed Son, two and distinguished, the Lamb who *came and took the book out of the right hand of him that sat upon the throne* (Revelation 5:7) — and yet the Lamb receives the same blessing and honour and glory and power, for the glory of the exalted Son is the glory of the Father. Worship of the Lamb is not worship of a rival but the Father glorified in him.'),
  ('canon', 'revelation', 5, 12, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The sevenfold acclamation *Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12) is the giving Daniel saw: to the one like the Son of Adam was *given... dominion, and glory, and a kingdom,* that all should serve him, *an everlasting dominion.* The Lamb who receives power and glory and an everlasting reign is the Son of Adam of Daniel''s vision, come to the throne to take what is everlastingly his.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2',
       E'The scroll written within and on the backside, sealed with seven seals (Ezekiel 2, Isaiah 29, Daniel 12)',
       E'John''s vision opens with a book no creature can open: *And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals* (Revelation 5:1). Every line of it is drawn from the prophets. The roll itself is Ezekiel''s — *and, lo, a roll of a book was therein* (Ezekiel 2:9), and Ezekiel saw it just as John does: *it was written within and without: and there was written therein lamentations, and mourning, and woe* (Ezekiel 2:10) — a scroll crammed full on both faces, the overflowing decree of Yahuah (LORD). The sealing is Isaiah''s: *the vision of all is become unto you as the words of a book that is sealed, which men deliver to one that is learned, saying, Read this, I pray thee: and he saith, I cannot; for it is sealed* (Isaiah 29:11) — the helplessness John weeps over, *and no man in heaven, nor in earth, neither under the earth, was able to open the book* (Revelation 5:3). The learned cannot, the unlearned cannot; no creature can break it. And the term of the sealing is Daniel''s: *shut up the words, and seal the book, even to the time of the end* (Daniel 12:4). So the book stayed shut, and John *wept much, because no man was found worthy* (Revelation 5:4). But the seal was set *to the time of the end* — and the time has come. *Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof* (Revelation 5:5). The prophetic scroll the prophets themselves were told to seal is the scroll the slain Lamb alone is worthy to open.',
       sv.verse_id, ev.verse_id, 'free', 9100
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49',
       E'The Lion of the tribe of Juda, the Root of David, hath prevailed (Genesis 49, Isaiah 11)',
       E'The elder answers John''s weeping with two titles, and both are the prophets'' own: *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof* (Revelation 5:5). *The Lion of the tribe of Juda* is Jacob''s dying blessing over his fourth son — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9) — and that same blessing names the King who would come of the tribe and the gathering that would be his: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The Lion who prevails is Shiloh come, the rightful King of Yahudah''s (Judah''s) line. *The Root of David* is Isaiah''s — *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1), and *in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* (Isaiah 11:10). Mark the title: not merely a branch from the root but *the Root of David* itself — the One from whom David sprang and in whom David''s house stands, the ensign the gathered seek. The Lion who conquers and the Root who is set up for a banner are one: the Messiah of Yahudah''s (Judah''s) line, who *hath prevailed,* and whose blood would draw the redeemed *out of every kindred, and tongue, and people, and nation* (Revelation 5:9), the gathering of the people come home to their King.',
       sv.verse_id, ev.verse_id, 'free', 9103
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53',
       E'A Lamb as it had been slain, with seven horns and seven eyes (Isaiah 53, Exodus 12, Zechariah 3 and 4, John 1)',
       E'John turns to see the Lion and beholds a Lamb — and the whole gospel is in the turning. *And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6). The Lion of Yahudah (Judah) prevails not by devouring but by being slain. This is Isaiah''s lamb: *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7) — the suffering servant who *bare the sin of many* (Isaiah 53:12). It is the Passover lamb: *the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6), the lamb without blemish whose blood turned aside the destroyer — so the slain Lamb *wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9). The Witness at the Jordan had already pointed to him: *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29) — the Lamb hailed at his coming is the Lamb enthroned, slain and yet standing. And the *seven eyes* are the eyes of Yahuah (LORD) himself: *they are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10), the *seven eyes* engraved upon the one stone beside the promise *I will remove the iniquity of that land in one day* (Zechariah 3:9). The Formed bears what is the Father''s own — the seven-fold Spirit, the all-seeing eyes, sent forth into all the earth. The slain Lamb who carries the eyes of Yahuah (LORD) and takes away the world''s sin is the slain-yet-reigning One: the Lion who is the Lamb.',
       sv.verse_id, ev.verse_id, 'free', 9106
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19',
       E'Thou hast redeemed us and made us kings and priests — the new song (Exodus 19, Psalms 33 and 40, Revelation 1)',
       E'When the Lamb takes the book, heaven breaks into a new song, and its words are the covenant''s own. *And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation; And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:9-10). The *new song* is the song the psalms summon — *sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3) — the song of the redeemed drawn up out of the pit: *he hath put a new song in my mouth, even praise unto our Elohim (God)* (Psalm 40:3). A new song is sung for a new and mighty work, and the work here is the blood of the slain Lamb. And the crown of the song — *made us unto our Elohim (God) kings and priests* — is the Sinai vocation restored: *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6), the word Yahuah (LORD) spoke to the children of Yashar''el (Israel) at the mount. The Lamb''s blood does not make a new people in Israel''s place; it brings the covenant people into the priestly kingship they were always called to. The book named it at the first — *washed us from our sins in his own blood* (Revelation 1:5), and *hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6) — and the new song sings it before the throne. Mark even here the Christology: the redeemed are made kings and priests *unto our Elohim (God),* unto *Elohim (God) and his Father* — the Lamb is the One who has a Father, and his blood makes the gathered a royal priesthood unto the Elohim (God) who is also his Father.',
       sv.verse_id, ev.verse_id, 'free', 9109
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7',
       E'Ten thousand times ten thousand — the myriads before the throne (Daniel 7, 1 Enoch)',
       E'Around the throne John hears a host beyond counting take up the praise of the Lamb: *And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11). The count is Daniel''s, word for word: *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). The myriads who stood before the Ancient of days in Daniel''s throne-vision are the myriads round about the throne in John''s — and where Daniel saw *the books were opened,* John has just seen the sealed book opened by the Lamb. The same uncountable court appears in the Hebrew library''s throne-visions: *I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits* (1 Enoch 40:1) — and Enoch heard their voices bless *Yahuah (God) of Spirits* and bless *the Elect One* beside him, the very pattern of Revelation 5, where the One on the throne and the Lamb are praised together. The throne-vision world of *ten thousand* reckonings runs through these texts (1 Enoch 14:21). And the host''s cry is the sevenfold acclamation: *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12). The innumerable court that stood before the Father now lifts its voice to the slain Lamb.',
       sv.verse_id, ev.verse_id, 'extras', 9112
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2',
       E'Worthy is the Lamb, worshipped with him that sat on the throne (Philippians 2, Daniel 7)',
       E'The chapter closes with the worship of the whole creation, and it lands on two seated together: *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). The threefold sweep of *every creature... in heaven, and on the earth, and under the earth* is Paul''s: *that at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). And Paul gives the Christology its exact frame: every tongue confesses the Lamb *to the glory of Elohim (God) the Father* (Philippians 2:11). Here is the whole mystery held without collapse. The Lamb *came and took the book out of the right hand of him that sat upon the throne* (Revelation 5:7) — he is not the One on the throne but receives the book from his hand; the Father and the Formed Son are two, distinguished. And yet the worship goes *unto him that sitteth upon the throne, and unto the Lamb* alike — the same blessing and honour and glory and power, for ever and ever. This is no rival worship and no second god; it is the Father glorified in the exalted Son, the slain Lamb who receives what Daniel saw given to the Son of Adam: *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). *Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12) — the slain-yet-reigning Formed, who is Yahuah (LORD) and has a Father, worshipped with him that sat on the throne while *the four and twenty elders fell down and worshipped him that liveth for ever and ever* (Revelation 5:14).',
       sv.verse_id, ev.verse_id, 'free', 9115
  FROM _s224_rv05_lookup sv, _s224_rv05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 2:9 — *a roll of a book was therein* the scroll handed forth from heaven, the prophetic roll John sees in the right hand of him on the throne (Revelation 5:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 2:10 — *it was written within and without* the exact shape of John''s scroll *written within and on the backside*, the overflowing decree of judgment (Revelation 5:1).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 29:11 — *the words of a book that is sealed... I cannot; for it is sealed* the sealed book no man can read, the helplessness John weeps over (Revelation 5:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:4 — *seal the book, even to the time of the end* the term of the sealing; the book stayed shut till the time came, and the Lamb is the One who prevails to open it (Revelation 5:4-5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp* Jacob''s blessing names the lion of the tribe of Yahudah (Judah), the royal beast the elder hails as having prevailed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:10 — *until Shiloh come; and unto him shall the gathering of the people be* the sceptre kept in Yahudah (Judah) for Shiloh, the King who gathers the people, the One who prevailed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:1 — *a rod out of the stem of Jesse, and a Branch shall grow out of his roots* the Branch from David''s royal root, the Root of David the elder names (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:10 — *a root of Jesse, which shall stand for an ensign of the people* the Root of David set up as a banner the gathered seek, his blood drawing them from every nation (Revelation 5:5,9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter... so he openeth not his mouth* the suffering servant''s lamb, the Lion who prevails by being slain (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:6 — *the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* the Passover lamb whose blood turned aside the destroyer, the true Passover by whose blood the gathered are redeemed (Revelation 5:6,9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:10 — *the eyes of Yahuah (LORD), which run to and fro through the whole earth* the seven eyes of the Lamb are the eyes of Yahuah (LORD) himself, the Formed bearing the Father''s own (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 3:9 — *upon one stone shall be seven eyes... I will remove the iniquity of that land in one day* the seven eyes on the engraved stone and the iniquity removed in one day foreshadow the slain Lamb bearing the seven Spirits (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 1:29 — *Behold the Lamb of Elohim (God), which taketh away the sin of the world* the Lamb hailed at the Jordan is the Lamb enthroned, slain and yet standing (Revelation 5:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-a-lamb-as-it-had-been-slain-with-seven-horns-and-seven-eyes-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:6 — *ye shall be unto me a kingdom of priests, and an holy nation* the Sinai covenant vocation restored; the Lamb''s blood brings the covenant people into the priestly kingship they were always called to (Revelation 5:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 33:3 — *Sing unto him a new song; play skilfully with a loud noise* the psalm''s summons taken up by the harps of heaven for the new work of the slain Lamb (Revelation 5:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 40:3 — *he hath put a new song in my mouth, even praise unto our Elohim (God)* the song of the redeemed drawn up out of the pit, sung of the One who redeemed us by his blood (Revelation 5:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 1:6 — *hath made us kings and priests unto Elohim (God) and his Father* the book''s opening word now sung; the Lamb is the One who has a Father, his blood making the gathered a royal priesthood (Revelation 5:10).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 1:5 — *washed us from our sins in his own blood* the redemption named at the book''s first; the blood of the slain Lamb is the price by which the gathered are bought back to Elohim (God) (Revelation 5:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* John''s count word for word; the myriads before the Ancient of days, where Daniel saw the books opened and John sees the sealed book opened by the Lamb (Revelation 5:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 40:1 — *thousands of thousands and myriads of myriads... standing before Yahuah (God) of Spirits* the Hebrew library''s innumerable court before the throne, whose voices bless both Yahuah (God) of Spirits and the Elect One beside him (Revelation 5:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 14:21 — *bound them till the time when their guilt should be consummated (even) for ten thousand years* the ten-thousand reckonings of Enoch''s throne-vision, the world Revelation 5''s myriad-numbered host stands in (Revelation 5:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-ten-thousand-times-ten-thousand-the-myriads-before-the-throne-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:10 — *every knee should bow, of things in heaven, and things in earth, and things under the earth* the threefold sweep of every creature''s worship of the Lamb, the name above every name (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:11 — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* the Christology held without collapse: the Lamb worshipped to the glory of the Father, two and distinguished, not a rival worship (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom... an everlasting dominion* the sevenfold acclamation of the Lamb is the giving Daniel saw to the one like the Son of Adam, come to the throne to take what is everlastingly his (Revelation 5:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv05_lookup sv, _s224_rv05_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
