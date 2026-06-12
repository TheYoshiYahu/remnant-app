-- ----- fragment: minion_2esdras_02.sql (session253 2-esdras 2) -----
-- Source anchor: apocrypha/2-esdras ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd2 (view _session253_2esd2_lookup). Sort band base 63025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-2-mother-zion-forsaken-comforted
  ('apocrypha', '2-esdras', 2, 2, 'canon', 'isaiah', 49, 14, 'free', E'Isaiah 49:14 — *But Zion said, Yahuah (LORD) hath forsaken me, and my Lord hath forgotten me.* Zion''s cry that she is a widow and forsaken in 2 Esdras 2:2 is the prophet''s own word in the mother''s mouth.'),
  ('apocrypha', '2-esdras', 2, 4, 'canon', 'isaiah', 54, 7, 'free', E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The forsaking the mother laments in 2 Esdras 2:4 is answered by the great-mercy gathering Isaiah promises the widowed Zion.'),
  ('apocrypha', '2-esdras', 2, 15, 'canon', 'isaiah', 54, 5, 'free', E'Isaiah 54:5 — *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* The ''I have chosen you'' that lifts the widow in 2 Esdras 2:15 names Yahuah himself as the husband of the once-forsaken mother.'),
  ('apocrypha', '2-esdras', 2, 17, 'canon', 'romans', 11, 2, 'free', E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel), saying,* The ''Fear not... for I have chosen you'' of 2 Esdras 2:17 is Paul''s own guard against supersession: election stands, the people are not cast away.'),
  -- thread: 2-esdras-2-kingdom-tree-of-life-tabernacles
  ('apocrypha', '2-esdras', 2, 12, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree of life given to Zion''s children in 2 Esdras 2:12 is John''s restored tree in the holy city.'),
  ('apocrypha', '2-esdras', 2, 12, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree of life of 2 Esdras 2:12 is the overcomer''s reward in the paradise of Elohim.'),
  ('apocrypha', '2-esdras', 2, 11, 'canon', 'revelation', 22, 3, 'free', E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him:* The everlasting tabernacles prepared in 2 Esdras 2:11 are the curse-free dwelling of the throne where the servants serve.'),
  -- thread: 2-esdras-2-raise-the-dead-from-the-graves
  ('apocrypha', '2-esdras', 2, 16, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The raising of the dead from the graves in 2 Esdras 2:16 is Daniel''s awakening of those who sleep in the dust.'),
  ('apocrypha', '2-esdras', 2, 16, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The ''bring them out of the graves'' of 2 Esdras 2:16 is the hour when all in the graves hear the voice of the Son.'),
  ('apocrypha', '2-esdras', 2, 23, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The ''first place in my resurrection'' offered in 2 Esdras 2:23 is the resurrection of life Yahusha names for those who have done good.'),
  -- thread: 2-esdras-2-do-right-to-the-widow-and-poor
  ('apocrypha', '2-esdras', 2, 20, 'canon', 'matthew', 25, 35, 'free', E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The ''give to the poor, defend the orphan'' of 2 Esdras 2:20 is the mercy the King counts at his judgment of the nations.'),
  ('apocrypha', '2-esdras', 2, 21, 'canon', 'matthew', 25, 36, 'free', E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* The ''clothe the naked... heal the broken and the weak'' of 2 Esdras 2:21 is named verbatim among the works the King receives.'),
  ('apocrypha', '2-esdras', 2, 20, 'canon', 'matthew', 25, 40, 'free', E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* The mercy-works commanded in 2 Esdras 2:20 are reckoned by the King as done unto himself.'),
  -- thread: 2-esdras-2-look-for-your-shepherd-everlasting-light
  ('apocrypha', '2-esdras', 2, 34, 'canon', 'john', 10, 11, 'free', E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep.* The Shepherd nigh at hand whom the heathen are bidden to look for in 2 Esdras 2:34 is Yahusha the Good Shepherd who gives his life for the sheep.'),
  ('apocrypha', '2-esdras', 2, 35, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The everlasting light promised in 2 Esdras 2:35 is the lampless, sunless light of the city where the redeemed reign for ever.'),
  -- thread: 2-esdras-2-receive-thy-number-o-sion-sealed-in-white
  ('apocrypha', '2-esdras', 2, 41, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The ''receive thy number, O Sion... is fulfilled'' of 2 Esdras 2:41 is John''s roll completing only when the white-robed are fulfilled.'),
  ('apocrypha', '2-esdras', 2, 40, 'canon', 'revelation', 7, 14, 'free', E'Revelation 7:14 — *And I said unto him, Sir, thou knowest. And he said to me, These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb.* Those clothed in white in 2 Esdras 2:40 are John''s company robed white through great tribulation.'),
  ('apocrypha', '2-esdras', 2, 40, 'canon', 'revelation', 14, 12, 'free', E'Revelation 14:12 — *Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus).* Those ''which have fulfilled the law of Yahuah'' in 2 Esdras 2:40 are John''s saints who keep the commandments and the faith — Torah stands.'),
  -- thread: 2-esdras-2-great-multitude-crowned-by-the-son-of-elohim
  ('apocrypha', '2-esdras', 2, 42, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* The great people on mount Sion whom Esdras could not number, receiving palms, in 2 Esdras 2:42 is John''s innumerable palm-bearing multitude before the throne.'),
  ('apocrypha', '2-esdras', 2, 43, 'canon', 'revelation', 14, 1, 'free', E'Revelation 14:1 — *And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.* The young man of high stature on mount Sion who crowns the people in 2 Esdras 2:43 stands where John sees the Lamb on mount Sion with the Name-bearing company.'),
  ('apocrypha', '2-esdras', 2, 45, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Those crowned for confessing the Name in 2 Esdras 2:45 are John''s faithful-unto-death who receive the crown of life.'),
  ('apocrypha', '2-esdras', 2, 47, 'canon', 'revelation', 7, 17, 'free', E'Revelation 7:17 — *For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes.* The Son of Elohim standing in the midst of the multitude and crowning them in 2 Esdras 2:47 is the Lamb in the midst of the throne who shepherds them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-mother-zion-forsaken-comforted',
       E'The forsaken mother bidden to embrace her children again',
       E'Mother Zion grieves her scattered children, then is chosen and comforted: *The mother that bare them says to them, Go your way, you children; for I am a widow and forsaken.* (2 Esdras 2:2) and *Mother, embrace your children, and bring them up with gladness, make their feet as fast as a pillar: for I have chosen you, says Yahuah.* (2 Esdras 2:15). This is the very arc of the Servant-Songs: the forsaken wife of youth gathered with everlasting mercy — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* (Isaiah 54:7) — and the woman who thinks herself abandoned, answered by a mother''s compassion — *But Zion said, Yahuah hath forsaken me, and my Lord hath forgotten me.* (Isaiah 49:14). The forfeiting generation does not end the election: the faithful remnant of the houses keeps the inheritance, for *Elohim hath not cast away his people which he foreknew.* (Romans 11:2). It ain''t new — the widow-mother of 2 Esdras is the forsaken-then-regathered Zion of the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 63025
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-kingdom-tree-of-life-tabernacles',
       E'The kingdom prepared, the everlasting tabernacles, the tree of life',
       E'The prepared kingdom is handed to the faithful with the tree of life and the everlasting dwellings: *Thus says Yahuah to Esdras, Tell my people that I will give them the kingdom of Jerusalem, which I would have given to Yashar''el. Their glory also will I take to me, and give these the everlasting tabernacles, which I had prepared for them.* (2 Esdras 2:10-11) and *They shall have the tree of life for an ointment of sweet savour; they shall neither labour, nor be weary.* (2 Esdras 2:12). This is the close of the Apocalypse: the river and the tree restored in the city — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2) — promised to the overcomer — *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim.* (Revelation 2:7). The Esdras vision and the live Revelation apparatus see the same prepared inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 63028
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-raise-the-dead-from-the-graves',
       E'I will raise up the dead from their graves',
       E'The promise that crowns the chapter''s comfort is bodily resurrection: *And those that be dead will I raise up again from their places, and bring them out of the graves: for I have known my name in Yashar''el.* (2 Esdras 2:16) and *Wherever you findest the dead, take them and bury them, and I will give you the first place in my resurrection.* (2 Esdras 2:23). This is Daniel''s awakening of the dust — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2) — and the Son''s voice that empties the graves — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* (John 5:28) and *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* (John 5:29). The resurrection 2 Esdras pledges to mother Zion''s children is the resurrection Daniel sealed and Yahusha unsealed.',
       sv.verse_id, ev.verse_id, 'extras', 63031
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-do-right-to-the-widow-and-poor',
       E'Do right to the widow, clothe the naked, bury the dead',
       E'The comfort is yoked to covenant mercy-works: *Do right to the widow, judge for the fatherless, give to the poor, defend the orphan, clothe the naked, Heal the broken and the weak, laugh not a lame man to scorn, defend the maimed, and let the blind man come into the sight of my clearness.* (2 Esdras 2:20-21). This is the very ledger of the judgment of the nations — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* (Matthew 25:35) and *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* (Matthew 25:36) — reckoned as done to the King himself — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* (Matthew 25:40). It ain''t new: the mercy-Torah of 2 Esdras 2 is the standard of the throne in Matthew 25.',
       sv.verse_id, ev.verse_id, 'extras', 63034
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-look-for-your-shepherd-everlasting-light',
       E'Look for your Shepherd; the everlasting light shall shine',
       E'The heathen who hear are turned to the coming Shepherd and the unfading light: *And therefore I say to you, O you heathen, that hear and understand, look for your Shepherd, he shall give you everlasting rest; for he is nigh at hand, that shall come in the end of the world.* (2 Esdras 2:34) and *Be ready to the reward of the kingdom, for the everlasting light shall shine upon you for evermore.* (2 Esdras 2:35). The Shepherd nigh at hand is the Good Shepherd who lays down his life — *I am the good shepherd: the good shepherd giveth his life for the sheep.* (John 10:11) — and the everlasting light is the lampless city — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* (Revelation 22:5). Here the Son genuinely in view in 2 Esdras is Yahusha the Shepherd and the Light.',
       sv.verse_id, ev.verse_id, 'extras', 63037
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-receive-thy-number-o-sion-sealed-in-white',
       E'Receive thy number, O Sion; the sealed in white robes',
       E'The vision turns to the completed roll of the redeemed, robed and sealed: *Arise up and stand, behold the number of those that be sealed in the feast of Yahuah;* (2 Esdras 2:38) and *Take your number, O Sion, and shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah.* (2 Esdras 2:40). This is the completed number that waits in Revelation — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* (Revelation 6:11) — robed white through the tribulation — *And I said unto him, Sir, thou knowest. And he said to me, These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb.* (Revelation 7:14) — those who keep Torah and the faith — *Here is the patience of the saints: here are they that keep the commandments of Elohim, and the faith of Yahusha.* (Revelation 14:12). The ''number, O Sion'' of Esdras is the sealed remnant of the live Revelation pack — and Torah stands, for these have fulfilled the law of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 63040
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-2-great-multitude-crowned-by-the-son-of-elohim',
       E'The great multitude crowned by the Son of Elohim on mount Sion',
       E'Esdras sees the climactic vision — an unnumbered people on mount Sion, crowned and palm-bearing, set by the Son of Elohim himself: *I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah with songs.* (2 Esdras 2:42) and *He answered and said to me, These be they that have put off the mortal clothing, and put on the immortal, and have confessed the name of Yahuah: now are they crowned, and receive palms.* (2 Esdras 2:45) and *So he answered and said to me, It is the Son of Yahuah, whom they have confessed in the world.* (2 Esdras 2:47). This is the throne-vision of the Apocalypse, the very self-link of the live Revelation apparatus: the innumerable palm-bearing multitude — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* (Revelation 7:9) — the Lamb on mount Sion with the Name in their foreheads — *And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.* (Revelation 14:1) — and the crown the faithful-unto-death receive — *be thou faithful unto death, and I will give thee a crown of life.* (Revelation 2:10). The messianic Son of Elohim who crowns them is genuinely the Messiah: the Son confessed in the world is Yahusha, and Esdras commends those who stand stiffly for his Name.',
       sv.verse_id, ev.verse_id, 'extras', 63043
  FROM _session253_2esd2_lookup sv, _session253_2esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=42
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=2 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-2-mother-zion-forsaken-comforted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:14 — *But Zion said, Yahuah (LORD) hath forsaken me, and my Lord hath forgotten me.* Zion''s cry that she is a widow and forsaken in 2 Esdras 2:2 is the prophet''s own word in the mother''s mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The forsaking the mother laments in 2 Esdras 2:4 is answered by the great-mercy gathering Isaiah promises the widowed Zion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:5 — *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* The ''I have chosen you'' that lifts the widow in 2 Esdras 2:15 names Yahuah himself as the husband of the once-forsaken mother.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel), saying,* The ''Fear not... for I have chosen you'' of 2 Esdras 2:17 is Paul''s own guard against supersession: election stands, the people are not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-mother-zion-forsaken-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-kingdom-tree-of-life-tabernacles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree of life given to Zion''s children in 2 Esdras 2:12 is John''s restored tree in the holy city.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-kingdom-tree-of-life-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree of life of 2 Esdras 2:12 is the overcomer''s reward in the paradise of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-kingdom-tree-of-life-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:3 — *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him:* The everlasting tabernacles prepared in 2 Esdras 2:11 are the curse-free dwelling of the throne where the servants serve.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-kingdom-tree-of-life-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-raise-the-dead-from-the-graves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The raising of the dead from the graves in 2 Esdras 2:16 is Daniel''s awakening of those who sleep in the dust.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-raise-the-dead-from-the-graves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The ''bring them out of the graves'' of 2 Esdras 2:16 is the hour when all in the graves hear the voice of the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-raise-the-dead-from-the-graves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The ''first place in my resurrection'' offered in 2 Esdras 2:23 is the resurrection of life Yahusha names for those who have done good.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-raise-the-dead-from-the-graves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-do-right-to-the-widow-and-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The ''give to the poor, defend the orphan'' of 2 Esdras 2:20 is the mercy the King counts at his judgment of the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-do-right-to-the-widow-and-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me.* The ''clothe the naked... heal the broken and the weak'' of 2 Esdras 2:21 is named verbatim among the works the King receives.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-do-right-to-the-widow-and-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* The mercy-works commanded in 2 Esdras 2:20 are reckoned by the King as done unto himself.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-do-right-to-the-widow-and-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-look-for-your-shepherd-everlasting-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:11 — *I am the good shepherd: the good shepherd giveth his life for the sheep.* The Shepherd nigh at hand whom the heathen are bidden to look for in 2 Esdras 2:34 is Yahusha the Good Shepherd who gives his life for the sheep.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-look-for-your-shepherd-everlasting-light'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The everlasting light promised in 2 Esdras 2:35 is the lampless, sunless light of the city where the redeemed reign for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-look-for-your-shepherd-everlasting-light'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-receive-thy-number-o-sion-sealed-in-white
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The ''receive thy number, O Sion... is fulfilled'' of 2 Esdras 2:41 is John''s roll completing only when the white-robed are fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-receive-thy-number-o-sion-sealed-in-white'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:14 — *And I said unto him, Sir, thou knowest. And he said to me, These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb.* Those clothed in white in 2 Esdras 2:40 are John''s company robed white through great tribulation.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-receive-thy-number-o-sion-sealed-in-white'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 14:12 — *Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus).* Those ''which have fulfilled the law of Yahuah'' in 2 Esdras 2:40 are John''s saints who keep the commandments and the faith — Torah stands.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-receive-thy-number-o-sion-sealed-in-white'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-2-great-multitude-crowned-by-the-son-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* The great people on mount Sion whom Esdras could not number, receiving palms, in 2 Esdras 2:42 is John''s innumerable palm-bearing multitude before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:1 — *And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.* The young man of high stature on mount Sion who crowns the people in 2 Esdras 2:43 stands where John sees the Lamb on mount Sion with the Name-bearing company.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Those crowned for confessing the Name in 2 Esdras 2:45 are John''s faithful-unto-death who receive the crown of life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 7:17 — *For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes.* The Son of Elohim standing in the midst of the multitude and crowning them in 2 Esdras 2:47 is the Lamb in the midst of the throne who shepherds them.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd2_lookup sv, _session253_2esd2_lookup tv
 WHERE t.slug='2-esdras-2-great-multitude-crowned-by-the-son-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=2 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

