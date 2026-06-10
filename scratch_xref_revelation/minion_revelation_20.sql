-- ----- fragment: minion_revelation_20.sql (S224 Revelation 20) -----
-- =====================================================================
-- S224 minion — REVELATION 20 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 20 (15 verses) — the thousand years, the dragon bound and loosed,
--          Gog and Magog, the first resurrection, the great white throne, the books opened,
--          death and hell cast into the lake of fire (the second death).
-- Tag: rv20 (temp view _s224_rv20_lookup).
-- Sort band: floor 9475, step 3 (9475, 9478, 9481, 9484, 9487, 9490, 9493, 9496 used; under 9500).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the whole-book frame — the consummation of the covenant story, the same
-- Yahuah, the same Torah, the same Yashar'el brought to restoration; not a rapture-escape, not a
-- replacement-church, not a Torah abolished). Revelation 20 is woven entirely out of Daniel,
-- Ezekiel, Isaiah, Genesis — the seer has a Tanakh text in his ear at every verse and never says
-- *it is written*. Read inside the frame:
--   * 20:1-3 the dragon bound — he is named *that old serpent* of Genesis 3, the enmity-serpent
--     whose head is bruised (Genesis 3:15); the *host of the high ones... gathered in the pit, and
--     shut up in the prison* of Isaiah 24:21-22; the leviathan no man can bind but Yahuah (Job 41).
--     The rebel-angel binding of 1 Enoch 10 is the same architecture (bind, cast into the abyss,
--     reserved unto the day of judgement).
--   * 20:4-6 the first resurrection and the thrones of judgment — Daniel 7:9,22 (the thrones set,
--     judgment given to the saints), Ezekiel 37:10-12 (the slain raised, the graves opened), Isaiah
--     26:19 (*thy dead men shall live*); the *blessed and holy* who reign are *priests of Elohim*,
--     the Exodus-19 / Isaiah-61 kingdom of priests — the destination of the gathered seed, NOT a
--     disembodied heaven.
--   * 20:7-9 Gog and Magog gathered, the fire from heaven — Ezekiel 38-39 (the named Gog war), the
--     *sand of the sea* of the Avrahamic promise inverted into the number of the deceived (Genesis
--     22:17), the fire-and-brimstone of Ezekiel 38:22, the Elijah-fire of 2 Kings 1, the Sodom-fire
--     of Genesis 19:24.
--   * 20:11-15 the great white throne and the books — Daniel 7:10 (*the judgment was set, and the
--     books were opened*), Daniel 12:1-2 (*written in the book*... *many that sleep... shall awake*),
--     Psalm 69:28 (*blotted out of the book of the living*), Malachi 3:16 (the book of remembrance),
--     Isaiah 65:6 (*it is written before me*); the great-image stone of Daniel 2:35 and the
--     garment-heavens of Psalm 102 / Isaiah 51 for the fleeing earth; death swallowed up — Hosea
--     13:14, Isaiah 25:8. Extras: 1 Enoch 47:3 and 90:12 (*the books of the living were opened before
--     the Head of Days*), 2 Esdras 7:32 (*the earth shall restore those that are asleep in her*).
-- Christology: the great white throne and *him that sat on it* is the One on the throne; the souls
-- of the beheaded *lived and reigned with Messiah (Christ)* (the Father and the Formed Son in view
-- together) — preserved as the pull gives. No co-equal-persons grammar; no modalist collapse. The
-- *book of life* is *the book of life of the Lamb slain from the foundation of the world* (Rev 13:8)
-- — names written before the foundation, blotted out but never added.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the dragon, that old serpent, bound in the bottomless pit a thousand years
--           Tanakh: Genesis 3:1 (the serpent more subtil), Genesis 3:15 (enmity, bruise thy head),
--                   Isaiah 24:21-22 (the host of the high ones gathered in the pit, shut in the
--                   prison, visited after many days), Job 41:1 (leviathan none can draw out / bind)
--           Extras: 1 Enoch 10:12 (bind them fast... in the valleys of the earth, till the day of
--                   their judgement), 1 Enoch 10:13 (led off to the abyss of fire... the prison)
--           NT: Revelation 12:9 (the great dragon... that old serpent... the Devil, and Satan — the
--               same titles, cast down before he is bound)
--   v.4-5   thrones of judgment, the souls of the beheaded reigning, the first resurrection
--           Tanakh: Daniel 7:9 (the thrones... the Ancient of days did sit), Daniel 7:22 (judgment
--                   given to the saints... possessed the kingdom), Ezekiel 37:10 (the breath came...
--                   they lived, and stood up... an exceeding great army), Isaiah 26:19 (thy dead
--                   men shall live... awake and sing, ye that dwell in dust)
--           Extras: 2 Esdras 7:32 (the earth shall restore those that are asleep in her... the
--                   secret places shall deliver those souls)
--           NT: 1 Corinthians 15:23 (every man in his own order: Messiah the firstfruits; afterward
--               they that are Messiah's at his coming — the order of the resurrection)
--   v.6     blessed and holy, priests of Elohim and of Messiah, reigning a thousand years
--           Tanakh: Exodus 19:6 (a kingdom of priests, and an holy nation), Isaiah 61:6 (ye shall
--                   be named the Priests of Yahuah)
--           Extras: none warranted (the priesthood-of-the-reigning root is the Exodus-19 covenant
--                   word; carried there)
--           NT: none warranted (the priests-and-reign echo carried in the Rev-1:6 / 5:10 book frame)
--   v.7-8   Satan loosed, Gog and Magog gathered, the number as the sand of the sea
--           Tanakh: Ezekiel 38:2 (set thy face against Gog, the land of Magog), Ezekiel 38:15-16
--                   (come from the north... against my people... in the latter days), Ezekiel 39:1
--                   (prophesy against Gog), Genesis 22:17 (thy seed as the sand upon the sea shore —
--                   the promise-number inverted into the number of the deceived)
--           Extras: none warranted (the Gog war is the canon Ezekiel architecture)
--           NT: none warranted
--   v.9     fire came down from Elohim out of heaven and devoured them
--           Tanakh: Ezekiel 38:22 (fire, and brimstone... rain upon him), Ezekiel 39:6 (a fire on
--                   Magog), 2 Kings 1:10 (let fire come down from heaven, and consume), Genesis 19:24
--                   (Yahuah rained upon Sodom... brimstone and fire from Yahuah out of heaven)
--           Extras: none warranted   NT: none warranted
--   v.10    the devil cast into the lake of fire — carried in the v.14 second-death thread
--           Tanakh: none added (carried at v.14)   Extras: none warranted   NT: none warranted
--   v.11    the great white throne; the earth and the heaven fled away
--           Tanakh: Daniel 2:35 (the image... no place found for them... the stone filled the earth),
--                   Psalm 102:25-26 (the heavens... shall wax old like a garment... be changed),
--                   Isaiah 51:6 (the heavens shall vanish away like smoke... the earth wax old)
--           Extras: none warranted   NT: none warranted
--   v.12    the books opened; another book, the book of life; judged according to works
--           Tanakh: Daniel 7:10 (the judgment was set, and the books were opened), Daniel 12:1-2
--                   (every one found written in the book... many that sleep shall awake), Psalm 69:28
--                   (blotted out of the book of the living), Malachi 3:16 (a book of remembrance),
--                   Isaiah 65:6 (it is written before me... I will recompense)
--           Extras: 1 Enoch 47:3 (the Head of Days... the books of the living were opened before
--                   Him), 1 Enoch 90:12 (the Lord of the sheep opened the books of the living)
--           NT: Revelation 13:8 (the book of life of the Lamb slain from the foundation of the world)
--   v.13    the sea, death and hell delivered up the dead — carried in the v.14 second-death thread
--           Tanakh: none added (carried at v.14)   Extras: none warranted   NT: none warranted
--   v.14-15 death and hell cast into the lake of fire; the second death; not found written
--           Tanakh: Hosea 13:14 (O death, I will be thy plagues; O grave, I will be thy destruction),
--                   Isaiah 25:8 (He will swallow up death in victory)
--           Extras: none warranted
--           NT: 1 Corinthians 15:54 (Death is swallowed up in victory), 1 Corinthians 15:55 (O
--               death, where is thy sting? O grave, where is thy victory?)
--
-- THREADS (slug -> target libraries):
--   9475 revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24   (Tanakh + Extras + NT)
--   9478 revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37          (Tanakh + Extras + NT)
--   9481 revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19                      (Tanakh)
--   9484 revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38             (Tanakh)
--   9487 revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38           (Tanakh)
--   9490 revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2                  (Tanakh)
--   9493 revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12                      (Tanakh + Extras + NT)
--   9496 revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13             (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s224_rv20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24
  ('canon', 'revelation', 20, 2, 'canon', 'genesis', 3, 1, 'free', E'*Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1). When the angel *laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years* (Revelation 20:2), the seer names him by the oldest name in the book — *that old serpent.* He is the serpent of the garden, the one who first asked *hath Elohim said,* the deceiver from the beginning. The whole war that opened in Eden is here brought to its binding; the subtil one who beguiled the woman is laid hold of and shut up.'),
  ('canon', 'revelation', 20, 2, 'canon', 'genesis', 3, 15, 'free', E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The first promise spoken over the serpent was that the seed of the woman would bruise his head; the binding of *that old serpent... a thousand years* (Revelation 20:2) is that bruising worked out in the consummation. The enmity declared at the gate of Eden runs the length of the canon and lands here — the head of the serpent under the heel of the seed, the dragon laid hold of and chained.'),
  ('canon', 'revelation', 20, 3, 'canon', 'isaiah', 24, 22, 'free', E'*And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). Isaiah saw the very shape of this binding — *Yahuah (LORD) shall punish the host of the high ones that are on high* (Isaiah 24:21), and they are *gathered in the pit... shut up in the prison... and after many days... visited.* So the dragon is *cast into the bottomless pit, and shut up... that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season* (Revelation 20:3). The pit, the prison, the shutting-up, and the after-many-days visitation are the prophet''s own; the seer re-speaks them over the bound serpent.'),
  ('canon', 'revelation', 20, 2, 'canon', 'job', 41, 1, 'free', E'*Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* (Job 41:1). Yahuah (LORD) asked Job whether any man could draw out or bind the great serpent of the deep — *wilt thou bind him for thy maidens?* (Job 41:5) — and the answer was no; *upon earth there is not his like* (Job 41:33). What no man could do, the angel from heaven does: *he laid hold on the dragon, that old serpent... and bound him a thousand years* (Revelation 20:2). The leviathan no mortal could chain is laid hold of and bound by the hand sent down from the throne.'),
  ('canon', 'revelation', 20, 2, 'enoch', '1-enoch', 10, 12, 'extras', E'*And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* (1 Enoch 10:12). The Hebrew library carries the same architecture the seer re-speaks: the rebel powers *bound fast... in the valleys of the earth, till the day of their judgement.* So the dragon is *bound... a thousand years* (Revelation 20:2) and held until his loosing and his end — a binding that reserves the prisoner unto the judgment, not a destruction that ends him.'),
  ('canon', 'revelation', 20, 3, 'enoch', '1-enoch', 10, 13, 'extras', E'*In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* (1 Enoch 10:13). The abyss, the prison, the confining — Enoch saw them before John did. The dragon is *cast into the bottomless pit, and shut up* (Revelation 20:3), and at the last *the devil that deceived them was cast into the lake of fire and brimstone... and shall be tormented day and night for ever and ever* (Revelation 20:10). The prison that holds him for the season and the lake of fire that holds him for ever are the two stages the older witness already names — the confining, and then the torment for ever.'),
  ('canon', 'revelation', 20, 2, 'canon', 'revelation', 12, 9, 'free', E'*And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9). Earlier in the book the same four names are stacked on the same enemy — *the great dragon... that old serpent, called the Devil, and Satan* — when he is cast down out of heaven to the earth. Now the same one, named the same way, *the dragon, that old serpent, which is the Devil, and Satan* (Revelation 20:2), is laid hold of and bound. The casting-down of chapter 12 and the binding of chapter 20 are two strokes against one adversary, the deceiver of the whole world brought to his chain.'),
  -- thread: revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37
  ('canon', 'revelation', 20, 4, 'canon', 'daniel', 7, 9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9). When John writes *And I saw thrones, and they sat upon them, and judgment was given unto them* (Revelation 20:4), he is seeing Daniel''s vision again — the thrones set, the court seated for judgment. Daniel saw the thrones and the Ancient of days take his seat; the seer sees the thrones filled and the judgment given. The same heavenly assize opens in both.'),
  ('canon', 'revelation', 20, 4, 'canon', 'daniel', 7, 22, 'free', E'*Until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom.* (Daniel 7:22). Daniel was shown that the judgment would be *given to the saints* and that they would *possess the kingdom* — and so it is: *judgment was given unto them... and they lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4). The ones who suffered under the beast are the ones who now sit on the thrones; the saints worn out by the horn are the saints given the kingdom. The reign of the thousand years is the saints possessing the kingdom Daniel foresaw.'),
  ('canon', 'revelation', 20, 4, 'canon', 'ezekiel', 37, 10, 'free', E'*So I prophesied as he commanded me, and the breath came into them, and they lived, and stood up upon their feet, an exceeding great army.* (Ezekiel 37:10). The valley of dry bones stood up alive at the word of Yahuah (LORD) — *they lived, and stood up upon their feet.* So the souls of the slain *lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4), and *this is the first resurrection* (Revelation 20:5). What Ezekiel saw figured in the bones — the breath entering the slain, the dead made to live and stand — the seer sees in the souls of the beheaded raised to reign. The resurrection of the slain is the same hope in both.'),
  ('canon', 'revelation', 20, 5, 'canon', 'ezekiel', 37, 12, 'free', E'*Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* (Ezekiel 37:12). The opening of the graves and the bringing-up of the people is the promise behind *this is the first resurrection* (Revelation 20:5). Yahuah (LORD) swore to open the graves of his people and raise them; the first resurrection is that opening — the slain of the witness brought up to live and reign while *the rest of the dead lived not again until the thousand years were finished* (Revelation 20:5).'),
  ('canon', 'revelation', 20, 4, 'canon', 'isaiah', 26, 19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). Isaiah''s word is the resurrection-hope in its clearest Tanakh voice — *thy dead men shall live... awake and sing, ye that dwell in dust.* The souls of the beheaded who *lived and reigned with Messiah (Christ)* (Revelation 20:4) are the dead made to live, the dwellers in dust awakened. The first resurrection is the casting-out of the dead from the earth that Isaiah sang.'),
  ('canon', 'revelation', 20, 5, 'apocrypha', '2-esdras', 7, 32, 'extras', E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* (2 Esdras 7:32). The Hebrew library names the very thing the first resurrection accomplishes — *the earth shall restore those that are asleep in her... the secret places shall deliver those souls.* So *the rest of the dead lived not again until the thousand years were finished. This is the first resurrection* (Revelation 20:5): the earth gives back her sleepers, the secret places yield up the souls committed to them, and the dead stand to be judged. The seer''s first resurrection and the older witness''s restoring-earth are one expectation.'),
  ('canon', 'revelation', 20, 4, 'canon', '1-corinthians', 15, 23, 'free', E'*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* (1 Corinthians 15:23). Paul names the order of the resurrection — *Messiah the firstfruits; afterward they that are Messiah''s at his coming* — and Revelation shows that order kept: the slain who *lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4) in *the first resurrection,* and then *the rest of the dead* who *lived not again until the thousand years were finished* (Revelation 20:5). Every man in his own order: the firstfruits, those that are his, and then the rest — the resurrection comes in ranks, as Paul said.'),
  -- thread: revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19
  ('canon', 'revelation', 20, 6, 'canon', 'exodus', 19, 6, 'free', E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* (Exodus 19:6). The word spoken at Sinai over the gathered people — *a kingdom of priests, and an holy nation* — is the word fulfilled in *they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years* (Revelation 20:6). The *blessed and holy* who share the first resurrection are the holy nation come into its calling: the priesthood promised to Yashar''el (Israel) at the mountain, now reigning. The reign of the saints is the kingdom of priests Sinai named.'),
  ('canon', 'revelation', 20, 6, 'canon', 'isaiah', 61, 6, 'free', E'*But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God): ye shall eat the riches of the Gentiles, and in their glory shall ye boast yourselves.* (Isaiah 61:6). Isaiah names the gathered people *the Priests of Yahuah (LORD)... the Ministers of our Elohim (God)* — the priestly office the restored seed carry to the nations. So those in the first resurrection *shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years* (Revelation 20:6). The priesthood Isaiah promised to the comforted of Zion is the priesthood of the *blessed and holy* who reign — the kingdom of priests over whom *the second death hath no power.*'),
  -- thread: revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38
  ('canon', 'revelation', 20, 8, 'canon', 'ezekiel', 38, 2, 'free', E'*Son of Adam, set thy face against Gog, the land of Magog, the chief prince of Meshech and Tubal, and prophesy against him,* (Ezekiel 38:2). The names the seer reaches for are Ezekiel''s own — *Gog and Magog* — when Satan is loosed to *deceive the nations which are in the four quarters of the earth, Gog and Magog, to gather them together to battle* (Revelation 20:8). Ezekiel was sent to set his face against Gog of the land of Magog; the last gathering of the deceived nations against the camp of the saints is named with the prophet''s names for the great hostile muster.'),
  ('canon', 'revelation', 20, 8, 'canon', 'ezekiel', 38, 16, 'free', E'*And thou shalt come up against my people of Yashar''el (Israel), as a cloud to cover the land; it shall be in the latter days, and I will bring thee against my land, that the heathen may know me, when I shall be sanctified in thee, O Gog, before their eyes.* (Ezekiel 38:16). Ezekiel set the Gog war *in the latter days,* the great host coming up *against my people... as a cloud to cover the land.* So Satan loosed gathers the nations *to battle... and they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city* (Revelation 20:8-9). The latter-day muster against the people of Yahuah (LORD), the host covering the land, is the war the prophet foresaw against the gathered people.'),
  ('canon', 'revelation', 20, 8, 'canon', 'ezekiel', 39, 1, 'free', E'*Therefore, thou son of Adam, prophesy against Gog, and say, Thus saith Adonai Yahuah (the Lord GOD); Behold, I am against thee, O Gog, the chief prince of Meshech and Tubal:* (Ezekiel 39:1). The second of Ezekiel''s two Gog oracles opens *Behold, I am against thee, O Gog* — and the end is sure: Gog falls on the mountains and the land is cleansed. So the gathered Gog-and-Magog of *to gather them together to battle* (Revelation 20:8) go up only to be devoured by fire; the prophet who was sent to prophesy against Gog already declared the One who stands against him.'),
  ('canon', 'revelation', 20, 8, 'canon', 'genesis', 22, 17, 'free', E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* (Genesis 22:17). The promise to Abraham measured his seed *as the sand which is upon the sea shore* — the blessing-number of the covenant people. The seer sets the deceived host against that promise: the gathered nations, *the number of whom is as the sand of the sea* (Revelation 20:8), the uncountable muster of the enemies of the seed. The sand-of-the-sea that named the multitude of the blessed names here the multitude of the deceived who compass the beloved city — and they are devoured.'),
  -- thread: revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38
  ('canon', 'revelation', 20, 9, 'canon', 'ezekiel', 38, 22, 'free', E'*And I will plead against him with pestilence and with blood; and I will rain upon him, and upon his bands, and upon the many people that are with him, an overflowing rain, and great hailstones, fire, and brimstone.* (Ezekiel 38:22). The end of the Gog war in Ezekiel is *fire, and brimstone* rained from above — Yahuah (LORD) pleading against the host with fire. So when Gog and Magog compass the camp, *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The seer''s fire from heaven is the prophet''s fire and brimstone upon Gog''s bands — the same judgment poured on the same gathered enemy.'),
  ('canon', 'revelation', 20, 9, 'canon', 'ezekiel', 39, 6, 'free', E'*And I will send a fire on Magog, and among them that dwell carelessly in the isles: and they shall know that I am Yahuah (LORD).* (Ezekiel 39:6). Ezekiel''s word was *I will send a fire on Magog* — fire as the verdict on the land of the hostile host. So *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9), the gathered Gog and Magog burned up before the camp of the saints. The fire on Magog the prophet announced is the fire from heaven the seer sees fall.'),
  ('canon', 'revelation', 20, 9, 'canon', '2-kings', 1, 10, 'free', E'*And Elijah answered and said to the captain of fifty, If I be a man of Elohim (God), then let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty.* (2 Kings 1:10). Fire came down from heaven at Elijah''s word and consumed those sent against the prophet — *there came down fire from heaven, and consumed him.* The same heavenly fire falls on the host that compasses the camp of the saints: *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The fire that defended the man of Elohim (God) on the hill defends the beloved city against the gathered nations.'),
  ('canon', 'revelation', 20, 9, 'canon', 'genesis', 19, 24, 'free', E'*Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* (Genesis 19:24). The oldest fire-judgment in the canon is Sodom — *brimstone and fire from Yahuah (LORD) out of heaven.* When the deceived nations go up against the camp of the saints, *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The fire-from-heaven that overthrew the cities of the plain is the same fire that devours the last muster of the enemies of the people of Yahuah (LORD).'),
  -- thread: revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2
  ('canon', 'revelation', 20, 11, 'canon', 'daniel', 2, 35, 'free', E'*Then was the iron, the clay, the brass, the silver, and the gold, broken to pieces together, and became like the chaff of the summer threshingfloors; and the wind carried them away, that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth.* (Daniel 2:35). When the great image was struck it was carried away *that no place was found for them.* So before the great white throne *the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11). The kingdoms of man that no place could be found for, and the old earth and heaven for which no place is found, flee alike before the One who sits — and the stone-kingdom that filled the earth remains.'),
  ('canon', 'revelation', 20, 11, 'canon', 'psalms', 102, 26, 'free', E'*They shall perish, but thou shalt endure: yea, all of them shall wax old like a garment; as a vesture shalt thou change them, and they shall be changed:* (Psalm 102:26). The psalm sets the perishing of the heavens against the enduring of Yahuah (LORD) — *all of them shall wax old like a garment... and they shall be changed,* while *thou art the same, and thy years shall have no end* (Psalm 102:27). So *from whose face the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11): the garment-heavens pass, the One on the throne endures. The fleeing of earth and heaven is the changing of the garment the psalmist sang.'),
  ('canon', 'revelation', 20, 11, 'canon', 'isaiah', 51, 6, 'free', E'*Lift up your eyes to the heavens, and look upon the earth beneath: for the heavens shall vanish away like smoke, and the earth shall wax old like a garment, and they that dwell therein shall die in like manner: but my salvation shall be for ever, and my righteousness shall not be abolished.* (Isaiah 51:6). Isaiah saw the heavens *vanish away like smoke* and the earth *wax old like a garment* — yet the salvation of Yahuah (LORD) standing for ever. So *the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11) before the great white throne. The vanishing heavens and aging earth of the prophet are the fleeing earth and heaven of the seer; what abides is the One who sits and his everlasting salvation.'),
  -- thread: revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12
  ('canon', 'revelation', 20, 12, 'canon', 'daniel', 7, 10, 'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10). Daniel saw the court of heaven seated and *the judgment was set, and the books were opened.* The seer sees the same: *the dead, small and great, stand before Elohim (God); and the books were opened* (Revelation 20:12). The opened books of Daniel''s assize are the opened books of the great white throne — the same court, the same record brought out, the dead judged from what is written.'),
  ('canon', 'revelation', 20, 12, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Daniel was told deliverance comes to *every one that shall be found written in the book.* So at the throne *another book was opened, which is the book of life* (Revelation 20:12), and *whosoever was not found written in the book of life was cast into the lake of fire* (Revelation 20:15). The book in which the delivered are written is the book of life opened at the last; to be found written in it is to be delivered, as Daniel said.'),
  ('canon', 'revelation', 20, 12, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Daniel named the two awakenings — *some to everlasting life, and some to shame and everlasting contempt.* The great white throne is where that division falls: *the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12), some found written in the book of life and some cast into the lake of fire. The awakening of the sleepers in the dust to life or to contempt is the judgment of the dead, small and great, before the throne.'),
  ('canon', 'revelation', 20, 12, 'canon', 'psalms', 69, 28, 'free', E'*Let them be blotted out of the book of the living, and not be written with the righteous.* (Psalm 69:28). The psalm knows *the book of the living* — and that a name can be blotted out of it, *not... written with the righteous.* So the throne opens *the book of life* (Revelation 20:12), and the verdict turns on whether a name is *found written* in it. The book of the living the psalmist appealed to is the book of life the dead are judged by; the names are written, and the warning of the psalm is that a name can be blotted out.'),
  ('canon', 'revelation', 20, 12, 'canon', 'malachi', 3, 16, 'free', E'*Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16). Malachi names *a book of remembrance... written before him* for those who feared Yahuah (LORD) — the record of the faithful kept in heaven. At the throne *the books were opened: and another book was opened, which is the book of life* (Revelation 20:12). The book of remembrance for them that feared the name and the book of life opened at the last are the same heavenly record: the works and the names of the faithful are not forgotten but written before him.'),
  ('canon', 'revelation', 20, 12, 'canon', 'isaiah', 65, 6, 'free', E'*Behold, it is written before me: I will not keep silence, but will recompense, even recompense into their bosom,* (Isaiah 65:6). Isaiah heard Yahuah (LORD) say of the deeds of men *it is written before me... I will... recompense* — the works recorded and repaid. So *the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). The writing-before-him and the recompense Isaiah announced is the books opened and the judgment according to works at the great white throne.'),
  ('canon', 'revelation', 20, 12, 'enoch', '1-enoch', 47, 3, 'extras', E'*In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3). The Hebrew library shows the very scene — *the Head of Days... seated Himself upon the throne of His glory, And the books of the living were opened before Him.* So at the great white throne *the books were opened: and another book was opened, which is the book of life* (Revelation 20:12). The seated One, the throne of glory, and the books of the living opened before him are in Enoch what they are in the Apocalypse — the judgment-court of heaven with its record laid bare.'),
  ('canon', 'revelation', 20, 12, 'enoch', '1-enoch', 90, 12, 'extras', E'*And after that I saw in the vision that the Lord of the sheep opened the books of the living, and the books of the sinners were opened.* (1 Enoch 90:12). Enoch''s vision of the flock has the same two records — *the books of the living... and the books of the sinners* both opened before the Lord of the sheep, and the judgment falling. So *the books were opened: and another book was opened, which is the book of life... and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). The book of the living and the books of the deeds, opened together for the judgment, are the books of the great white throne.'),
  ('canon', 'revelation', 20, 12, 'canon', 'revelation', 13, 8, 'free', E'*And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* (Revelation 13:8). Earlier the book names the book — *the book of life of the Lamb slain from the foundation of the world.* The names are written from the foundation, before ever the worship of the beast was offered. So at the throne *another book was opened, which is the book of life* (Revelation 20:12), and *whosoever was not found written in the book of life was cast into the lake of fire* (Revelation 20:15). The Lamb''s book of life, with its names written before the world was, is the book that decides the judgment of the dead.'),
  -- thread: revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13
  ('canon', 'revelation', 20, 14, 'canon', 'hosea', 13, 14, 'free', E'*I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction: repentance shall be hid from mine eyes.* (Hosea 13:14). Hosea heard Yahuah (LORD) speak death and the grave themselves under judgment — *O death, I will be thy plagues; O grave, I will be thy destruction.* So at the end *death and hell were cast into the lake of fire. This is the second death* (Revelation 20:14). The grave that swallowed the dead is itself destroyed; death is plagued and undone. The destruction Hosea pronounced over death and the grave is their casting into the lake of fire.'),
  ('canon', 'revelation', 20, 14, 'canon', 'isaiah', 25, 8, 'free', E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* (Isaiah 25:8). Isaiah promised that *he will swallow up death in victory* — death itself undone, the tears wiped away. So *death and hell were cast into the lake of fire. This is the second death* (Revelation 20:14): death swallowed up, abolished, cast out. The victory over death Isaiah sang on the mountain is the casting of death and the grave into the lake of fire.'),
  ('canon', 'revelation', 20, 14, 'canon', '1-corinthians', 15, 54, 'free', E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory.* (1 Corinthians 15:54). Paul names the saying brought to pass at the resurrection — *Death is swallowed up in victory* — quoting Isaiah''s own word. The bringing-to-pass is here: *death and hell were cast into the lake of fire. This is the second death* (Revelation 20:14). The swallowing-up of death Paul looked for is its casting into the lake of fire; the saying written is fulfilled when death itself is destroyed.'),
  ('canon', 'revelation', 20, 14, 'canon', '1-corinthians', 15, 55, 'free', E'*O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55). Paul''s taunt over a beaten enemy — *O death, where is thy sting? O grave, where is thy victory?* — echoes Hosea''s *O death... O grave* and finds its answer at the throne: *death and hell were cast into the lake of fire. This is the second death* (Revelation 20:14). The sting drawn and the victory taken away is death and hell themselves destroyed; the grave that held the dead delivers them up and is itself cast into the fire.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24',
       E'The dragon, that old serpent, bound a thousand years and shut in the pit (Isaiah 24, Genesis 3)',
       E'*And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand. And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years* (Revelation 20:1-2). The seer names the enemy by the oldest name in the book — *that old serpent* — and the whole library answers. He is the serpent of the garden: *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* (Genesis 3:1), the one over whom the first promise was spoken — *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The binding is that head-bruising worked out to its consummation. Isaiah saw its very shape: *Yahuah (LORD) shall punish the host of the high ones that are on high... And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited* (Isaiah 24:21-22) — the pit, the prison, the shutting-up, and the after-many-days visitation that the seer re-speaks: *And cast him into the bottomless pit, and shut him up... till the thousand years should be fulfilled: and after that he must be loosed a little season* (Revelation 20:3). He is the leviathan no man could chain — *Canst thou draw out leviathan with an hook?... wilt thou bind him for thy maidens?* (Job 41:1,5) — laid hold of and bound by the hand sent down from the throne. The Hebrew library carries the same architecture: the rebel powers *bind them fast... in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12), *led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever* (1 Enoch 10:13) — the binding that reserves the prisoner unto judgment, then the torment for ever, the two stages the seer names in the chaining and then the lake of fire. And the four names stacked here are the four stacked earlier when he was cast down: *the great dragon... that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). The casting-down and the binding are two strokes against one adversary — the deceiver of the whole world brought at last to his chain.',
       sv.verse_id, ev.verse_id, 'extras', 9475
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37',
       E'The thrones of judgment and the first resurrection (Daniel 7, Ezekiel 37, Isaiah 26)',
       E'*And I saw thrones, and they sat upon them, and judgment was given unto them... and they lived and reigned with Messiah (Christ) a thousand years... This is the first resurrection* (Revelation 20:4-5). John is seeing Daniel''s court again: *I beheld till the thrones were cast down, and the Ancient of days did sit... his throne was like the fiery flame* (Daniel 7:9), and the verdict Daniel was shown is the verdict here — *judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22). The ones worn out by the beast are the ones now on the thrones; the reign of the thousand years is the saints possessing the kingdom Daniel foresaw. And the raising of the slain is Ezekiel''s valley stood up alive: *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10), for Yahuah (LORD) had sworn, *Behold, O my people, I will open your graves, and cause you to come up out of your graves* (Ezekiel 37:12). It is the hope Isaiah sang plainest: *Thy dead men shall live... Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* (Isaiah 26:19). The Hebrew library names the same restoring: *the earth shall restore those that are asleep in her... and the secret places shall deliver those souls that were committed to them* (2 Esdras 7:32). And it comes in ranks, as Paul taught: *every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23) — the first resurrection of the slain who reign, and then *the rest of the dead* who *lived not again until the thousand years were finished* (Revelation 20:5). The thrones set, the graves opened, the dust awakened — the slain of the witness raised to reign.',
       sv.verse_id, ev.verse_id, 'extras', 9478
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19',
       E'Priests of Elohim (God) — the blessed and holy who reign (Exodus 19, Isaiah 61)',
       E'*Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years* (Revelation 20:6). The reign of the saints is a priesthood, and the priesthood is the word spoken at Sinai over the gathered people: *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). The *blessed and holy* are that holy nation come into its calling — the kingdom of priests Sinai named, now reigning. Isaiah carried the same promise forward to the comforted of Zion: *But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* (Isaiah 61:6) — the priestly office the restored seed bear. So those in the first resurrection, over whom *the second death hath no power,* are priests of Elohim (God) and of Messiah (Christ): not a disembodied heaven, but the gathered seed brought into the priesthood promised at the mountain and renewed by the prophet, reigning with him.',
       sv.verse_id, ev.verse_id, 'free', 9481
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38',
       E'Gog and Magog gathered, the number as the sand of the sea (Ezekiel 38, Genesis 22)',
       E'*And when the thousand years are expired, Satan shall be loosed out of his prison, And shall go out to deceive the nations which are in the four quarters of the earth, Gog and Magog, to gather them together to battle: the number of whom is as the sand of the sea* (Revelation 20:7-8). The names are Ezekiel''s own. The prophet was sent against them: *Son of Adam, set thy face against Gog, the land of Magog, the chief prince of Meshech and Tubal, and prophesy against him* (Ezekiel 38:2); and he set the war in the latter days, the great host coming up *against my people of Yashar''el (Israel), as a cloud to cover the land; it shall be in the latter days* (Ezekiel 38:16) — the very muster the seer sees go up *on the breadth of the earth* to compass *the camp of the saints... and the beloved city* (Revelation 20:9). Ezekiel''s second oracle declares the One who stands against the host: *Behold, I am against thee, O Gog, the chief prince of Meshech and Tubal* (Ezekiel 39:1). And the seer measures the deceived against the covenant promise itself: Abraham''s seed was promised *as the sand which is upon the sea shore* (Genesis 22:17) — the blessing-number of the people of Yahuah (LORD); here that number is turned to name the enemy, *the number of whom is as the sand of the sea,* the uncountable muster of the deceived who compass the beloved city. The promise-number that counted the blessed counts the nations gathered to battle — and they are devoured.',
       sv.verse_id, ev.verse_id, 'free', 9484
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38',
       E'Fire came down from Elohim (God) out of heaven and devoured them (Ezekiel 38, 2 Kings 1, Genesis 19)',
       E'*And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The fire that ends the Gog war is the prophet''s fire. Ezekiel heard Yahuah (LORD) say of Gog''s host, *I will rain upon him, and upon his bands... great hailstones, fire, and brimstone* (Ezekiel 38:22), and again, *I will send a fire on Magog, and among them that dwell carelessly in the isles: and they shall know that I am Yahuah (LORD)* (Ezekiel 39:6). The seer''s fire from heaven upon Gog and Magog is the prophet''s fire and brimstone upon the same gathered enemy. It is the fire that defended the man of Elohim (God) on the hill: *If I be a man of Elohim (God), then let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty* (2 Kings 1:10). And it is the oldest fire-judgment in the canon, Sodom: *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). The brimstone-and-fire that overthrew the cities of the plain, the fire that defended Elijah, the fire on Magog the prophet announced — all are the one fire from heaven that devours the last muster of the enemies of the people of Yahuah (LORD) about the beloved city.',
       sv.verse_id, ev.verse_id, 'free', 9487
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2',
       E'The great white throne; the earth and the heaven fled away (Daniel 2, Psalm 102, Isaiah 51)',
       E'*And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11). The fleeing of earth and heaven re-speaks three Tanakh witnesses at once. When Daniel''s great image was struck, the kingdoms of man were carried away *that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35) — the same *no place was found for them* the seer says of the old earth and heaven, while the stone-kingdom remains. The psalm sets the perishing of the heavens against the enduring of the One who sits: *all of them shall wax old like a garment; as a vesture shalt thou change them, and they shall be changed* (Psalm 102:26), for *thou art the same, and thy years shall have no end* (Psalm 102:27). And Isaiah saw the same: *the heavens shall vanish away like smoke, and the earth shall wax old like a garment... but my salvation shall be for ever* (Isaiah 51:6). The garment-heavens pass and the aging earth flees; what abides before the great white throne is *him that sat on it* and his everlasting salvation. The earth and heaven flee; the One on the throne endures, and the dead stand before him.',
       sv.verse_id, ev.verse_id, 'free', 9490
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12',
       E'The books were opened, and the book of life (Daniel 7 and 12, Malachi 3)',
       E'*And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). This is Daniel''s court of heaven: *the judgment was set, and the books were opened* (Daniel 7:10). Daniel was told deliverance comes to *every one that shall be found written in the book* (Daniel 12:1), and that *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2) — the very division that falls at the throne, some found written in the book of life and some cast into the lake of fire. The book of the living the psalmist knew can be written in or blotted out — *Let them be blotted out of the book of the living, and not be written with the righteous* (Psalm 69:28) — names written, never added, but able to be blotted out. Malachi names the same heavenly record kept for the faithful: *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16). And the works are recorded and repaid, as Isaiah heard: *Behold, it is written before me: I will not keep silence, but will recompense* (Isaiah 65:6). The Hebrew library shows the scene itself — *the Head of Days... seated Himself upon the throne of His glory, And the books of the living were opened before Him* (1 Enoch 47:3); *the Lord of the sheep opened the books of the living, and the books of the sinners were opened* (1 Enoch 90:12). And the book of life is named already in the Apocalypse: *the book of life of the Lamb slain from the foundation of the world* (Revelation 13:8) — the names written before the world was. The books of works and the book of life are opened together; *whosoever was not found written in the book of life was cast into the lake of fire* (Revelation 20:15).',
       sv.verse_id, ev.verse_id, 'extras', 9493
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13',
       E'Death and hell cast into the lake of fire — the second death (Hosea 13, Isaiah 25)',
       E'*And death and hell were cast into the lake of fire. This is the second death* (Revelation 20:14). Death and the grave that swallowed the dead are themselves swallowed up. Hosea heard Yahuah (LORD) speak death and the grave under judgment: *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14). And Isaiah promised death itself undone on the mountain: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8). Paul gathered both into one shout, naming the saying brought to pass at the resurrection: *then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54), and the taunt over the beaten enemy — *O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55), echoing Hosea''s own *O death... O grave.* The bringing-to-pass is here at the throne: the sea and *death and hell delivered up the dead which were in them* (Revelation 20:13), and then death and hell themselves are cast into the lake of fire. The destruction Hosea pronounced over the grave, the victory Isaiah sang over death, the sting drawn that Paul looked for — all are this: death itself destroyed, the second death.',
       sv.verse_id, ev.verse_id, 'free', 9496
  FROM _s224_rv20_lookup sv, _s224_rv20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=20 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field* the seer names the dragon *that old serpent*; he is the serpent of the garden, the first deceiver, now laid hold of (Revelation 20:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *it shall bruise thy head, and thou shalt bruise his heel* the first promise over the serpent; the binding is that head-bruising worked out to its consummation (Revelation 20:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:22 — *gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited* the prophet''s own pit, prison, shutting-up, and after-many-days visitation re-spoken over the bound dragon (Revelation 20:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 41:1 — *Canst thou draw out leviathan with an hook?* the leviathan no mortal could bind is laid hold of and chained by the hand sent down from the throne (Revelation 20:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 10:12 — *bind them fast... in the valleys of the earth, till the day of their judgement* the rebel-power binding that reserves the prisoner unto judgment, the architecture the seer re-speaks (Revelation 20:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 10:13 — *led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever* the abyss and prison the seer names in the chaining and then the lake of fire (Revelation 20:3).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Revelation 12:9 — *the great dragon... that old serpent, called the Devil, and Satan* the same four names stacked when he was cast down; casting-down and binding are two strokes against one adversary (Revelation 20:2).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit* John sees Daniel''s court again, the thrones set and the judgment seated (Revelation 20:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:22 — *judgment was given to the saints... the saints possessed the kingdom* the reign of the thousand years is the saints possessing the kingdom Daniel foresaw (Revelation 20:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:10 — *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* the valley of dry bones stood up alive; the resurrection of the slain (Revelation 20:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:12 — *I will open your graves, and cause you to come up out of your graves* the opening of the graves behind *this is the first resurrection* (Revelation 20:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 26:19 — *Thy dead men shall live... Awake and sing, ye that dwell in dust* the resurrection-hope in its clearest Tanakh voice; the dust awakened to reign (Revelation 20:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 7:32 — *the earth shall restore those that are asleep in her... the secret places shall deliver those souls* the restoring-earth the first resurrection accomplishes (Revelation 20:5).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Corinthians 15:23 — *every man in his own order: Messiah the firstfruits; afterward they that are Messiah''s at his coming* the resurrection in ranks: the first resurrection, then the rest of the dead (Revelation 20:4).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:6 — *a kingdom of priests, and an holy nation* the Sinai word fulfilled in the *blessed and holy* who reign as priests of Elohim (God) and of Messiah (Christ) (Revelation 20:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:6 — *ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* the priesthood promised to the comforted of Zion, the office the reigning *blessed and holy* carry (Revelation 20:6).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 38:2 — *set thy face against Gog, the land of Magog* the seer reaches for the prophet''s own names for the great hostile muster (Revelation 20:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 38:16 — *thou shalt come up against my people... as a cloud to cover the land; it shall be in the latter days* the latter-day muster against the gathered people the seer sees compass the camp (Revelation 20:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 39:1 — *Behold, I am against thee, O Gog* the second oracle declares the One who stands against the host the seer sees gathered and devoured (Revelation 20:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=39 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 22:17 — *thy seed as the stars of the heaven, and as the sand which is upon the sea shore* the covenant blessing-number inverted to count the deceived, *the number of whom is as the sand of the sea* (Revelation 20:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 38:22 — *I will rain upon him... great hailstones, fire, and brimstone* the fire-and-brimstone that ends the Gog war is the seer''s fire from heaven (Revelation 20:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 39:6 — *I will send a fire on Magog* the fire on Magog the prophet announced is the fire from heaven the seer sees fall (Revelation 20:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=39 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 1:10 — *let fire come down from heaven, and consume thee and thy fifty* the fire that defended the man of Elohim (God) defends the beloved city (Revelation 20:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 19:24 — *Yahuah (LORD) rained upon Sodom... brimstone and fire from Yahuah (LORD) out of heaven* the oldest fire-judgment, the same fire that devours the last muster of enemies (Revelation 20:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:35 — *the wind carried them away, that no place was found for them* the kingdoms of man and the old earth and heaven flee, *there was found no place for them*; the stone-kingdom remains (Revelation 20:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 102:26 — *all of them shall wax old like a garment; as a vesture shalt thou change them* the garment-heavens pass while the One on the throne endures (Revelation 20:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 51:6 — *the heavens shall vanish away like smoke, and the earth shall wax old like a garment... but my salvation shall be for ever* the vanishing heavens of the prophet, the fleeing earth and heaven of the seer; the salvation that abides (Revelation 20:11).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *the judgment was set, and the books were opened* the opened books of Daniel''s assize are the opened books of the great white throne (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *every one that shall be found written in the book* the book in which the delivered are written is the book of life opened at the last (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame* the two awakenings, the division that falls at the throne (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 69:28 — *Let them be blotted out of the book of the living* the book of the living can be written in or blotted out; names written, never added (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 3:16 — *a book of remembrance was written before him for them that feared Yahuah (LORD)* the heavenly record of the faithful, the same book of remembrance opened at the last (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 65:6 — *it is written before me... I will... recompense* the works recorded and repaid, the judgment according to works at the throne (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 47:3 — *the Head of Days... seated Himself upon the throne of His glory, And the books of the living were opened before Him* the very scene of the judgment-court with its record laid bare (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Enoch 90:12 — *the Lord of the sheep opened the books of the living, and the books of the sinners were opened* the two records opened together for the judgment, as at the great white throne (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=90 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Revelation 13:8 — *the book of life of the Lamb slain from the foundation of the world* the names written before the world was; the Lamb''s book that decides the judgment (Revelation 20:12).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-the-books-were-opened-and-the-book-of-life-daniel-7-and-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 13:14 — *O death, I will be thy plagues; O grave, I will be thy destruction* death and the grave themselves under judgment, cast into the lake of fire (Revelation 20:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears* death itself undone, the victory sung on the mountain, fulfilled in the lake of fire (Revelation 20:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:54 — *Death is swallowed up in victory* Paul names the saying brought to pass at the resurrection; the swallowing-up is the casting into the lake of fire (Revelation 20:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:55 — *O death, where is thy sting? O grave, where is thy victory?* the taunt over the beaten enemy; the sting drawn is death and hell destroyed (Revelation 20:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv20_lookup sv, _s224_rv20_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=55
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
