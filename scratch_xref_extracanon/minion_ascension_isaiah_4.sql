-- ----- fragment: minion_ascensionisaiah_04.sql (session403 ascension-isaiah 4) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci4 (view _session403_asci4_lookup). Sort band base 67575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-4-beliar-lawless-king
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', '2-thessalonians', 2, 3, 'free', E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* Paul''s lawless man of sin is the very Beliar Isaiah sees descending in the likeness of a man in Ascension of Isaiah 4:2.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', '1-john', 2, 18, 'free', E'1 John 2:18 — *Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time.* The expected antichrist John names is the king of this world whose descent Isaiah foresees in Ascension of Isaiah 4:2.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', 'revelation', 13, 1, 'free', E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s blaspheming beast is the same world-ruler Isaiah watches descend as a lawless king in Ascension of Isaiah 4:2.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', 'matthew', 24, 4, 'free', E'Matthew 24:4 — *And Yahusha (Jesus) answered and said unto them, Take heed that no man deceive you.* Yahusha''s warning against the deceiver answers the descent of Beliar in the likeness of a man in Ascension of Isaiah 4:2.'),
  -- thread: ascension-isaiah-4-i-am-god
  ('ascension-isaiah', 'ascension-isaiah', 4, 6, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Paul''s self-deifying man of sin speaks the very boast Beliar makes — ''I am Elohim'' — in Ascension of Isaiah 4:6.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 7, 'canon', 'revelation', 13, 4, 'free', E'Revelation 13:4 — *And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?* John''s whole-world worship of the beast is the universal belief Isaiah foresees in Ascension of Isaiah 4:7.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 8, 'canon', 'matthew', 24, 24, 'free', E'Matthew 24:24 — *For there shall arise false Christs, and false prophets, and shall shew great signs and wonders; insomuch that, if it were possible, they shall deceive the very elect.* Yahusha''s false christs who counterfeit signs match the one who speaks like the Beloved and is served as God in Ascension of Isaiah 4:8.'),
  -- thread: ascension-isaiah-4-lying-wonders-image
  ('ascension-isaiah', 'ascension-isaiah', 4, 10, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Paul''s lying wonders are the miracles in every city that Isaiah foresees in Ascension of Isaiah 4:10.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 11, 'canon', 'revelation', 13, 14, 'free', E'Revelation 13:14 — *And deceiveth them that dwell on the earth by the means of those miracles which he had power to do in the sight of the beast; saying to them that dwell on the earth, that they should make an image to the beast, which had the wound by a sword, and did live.* The image men are made to worship is the very image Beliar sets up in every city in Ascension of Isaiah 4:11.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 5, 'canon', 'revelation', 13, 13, 'free', E'Revelation 13:13 — *And he doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men,* the cosmic forgeries — fire from heaven — match Beliar making the sun rise at night and the moon appear at noon in Ascension of Isaiah 4:5.'),
  -- thread: ascension-isaiah-4-saints-flee-desert
  ('ascension-isaiah', 'ascension-isaiah', 4, 13, 'canon', 'matthew', 24, 16, 'free', E'Matthew 24:16 — *Then let them which be in Judaea flee into the mountains:* Yahusha''s command to flee is the very flight ''from desert to desert'' of the remnant awaiting the Beloved in Ascension of Isaiah 4:13.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 13, 'canon', 'matthew', 24, 22, 'free', E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening for the elect''s sake matches the few servants Isaiah says are left as they flee in Ascension of Isaiah 4:13.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 12, 'canon', 'revelation', 13, 5, 'free', E'Revelation 13:5 — *And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* The beast''s fixed forty-two-month tyranny matches the measured reign Beliar bears in Ascension of Isaiah 4:12.'),
  -- thread: ascension-isaiah-4-Lord-comes-beliar-gehenna
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', 'revelation', 19, 20, 'free', E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* John''s casting of the beast into the fiery lake is the Lord dragging Beliar into Gehenna in Ascension of Isaiah 4:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* Paul''s destruction of the Wicked by the Lord''s coming is the same drag of Beliar into Gehenna in Ascension of Isaiah 4:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude''s citation of Enoch''s coming-with-saints matches the Lord coming with the armies of the holy ones in Ascension of Isaiah 4:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', 'revelation', 19, 14, 'free', E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The heavenly armies following the Word are the armies of the holy ones who come from the seventh heaven in Ascension of Isaiah 4:14.'),
  -- thread: ascension-isaiah-4-saints-descend-garments
  ('ascension-isaiah', 'ascension-isaiah', 4, 16, 'canon', '1-thessalonians', 4, 16, 'free', E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s descent of the Lord with the dead rising is the saints coming with Yahuah from the seventh heaven in Ascension of Isaiah 4:16.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 17, 'canon', '1-thessalonians', 4, 17, 'free', E'1 Thessalonians 4:17 — *Then we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord).* The catching-up to meet the Lord is the saints turning themselves upward in their garments in Ascension of Isaiah 4:17.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 16, 'canon', 'revelation', 19, 8, 'free', E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* John''s white linen of the saints is the garments stored up on high that Isaiah''s saints come clothed in, in Ascension of Isaiah 4:16.'),
  -- thread: ascension-isaiah-4-resurrection-judgment-fire
  ('ascension-isaiah', 'ascension-isaiah', 4, 18, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s awakening of the sleepers to life or contempt is the resurrection and judgment Isaiah foresees in Ascension of Isaiah 4:18.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 18, 'canon', 'revelation', 20, 9, 'free', E'Revelation 20:9 — *And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them.* The fire from heaven that devours the wicked is the fire the Beloved causes to go forth and consume the godless in Ascension of Isaiah 4:18.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 18, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s throne-judgment of the dead is the judgment in their midst Isaiah sees in Ascension of Isaiah 4:18.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-beliar-lawless-king',
       E'Beliar descends — the lawless king, the son of perdition',
       E'*Beliar the great ruler, the king of this world, will descend, who hath ruled it since it came into being; yea, he will descent from his firmament in the likeness of a man, a lawless king, the slayer of his mother* (Ascension of Isaiah 4:2). Centuries before Paul, Isaiah sees the adversary clothing himself in a man and ruling as a *lawless king* — it ain''t new. Paul calls him *that man of sin... the son of perdition* (2 Thessalonians 2:3), and John, *as ye have heard that antichrist shall come, even now are there many antichrists* (1 John 2:18). Yahusha forewarned the deceit: *Take heed that no man deceive you* (Matthew 24:4), and the beast that rises *out of the sea* with *the name of blasphemy* upon him (Revelation 13:1) is the same lawless one wearing flesh.',
       sv.verse_id, ev.verse_id, 'extras', 67575
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-i-am-god',
       E'He says ''I am God'' — the false christ exalted in the temple',
       E'The lawless one *will do and speak like the Beloved and he will say: "I am Elohim (God) and before me there has been none"* (Ascension of Isaiah 4:6), and *all the people in the world will believe in him* (4:7), serving him: *"This is Elohim (God) and beside him there is no other"* (4:8). This is the self-deifying blasphemy Paul names exactly: he *exalteth himself above all that is called Elohim (God)... so that he as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4). The whole earth wonders and *worshipped the beast* (Revelation 13:4), and false christs *shew great signs and wonders; insomuch that, if it were possible, they shall deceive the very elect* (Matthew 24:24). The counterfeit aping of the Beloved is no new thing under the sun.',
       sv.verse_id, ev.verse_id, 'extras', 67578
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-lying-wonders-image',
       E'Lying wonders and the image set up in every city',
       E'*At his word the sun will rise at night and he will make the moon to appear at the sixth hour* (Ascension of Isaiah 4:5); *there will be the power of his miracles in every city and region* (4:10), and *he will set up his image before him in every city* (4:11). The forged signs and the demanded image are exactly the second beast''s work: *he doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men* (Revelation 13:13), and he commands *that they should make an image to the beast* (Revelation 13:14). Paul calls it a coming *after the working of Satan with all power and signs and lying wonders* (2 Thessalonians 2:9) — the counterfeit was foreseen long before.',
       sv.verse_id, ev.verse_id, 'extras', 67581
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-saints-flee-desert',
       E'The faithful few flee desert to desert, awaiting the Beloved',
       E'Of the believers in the crucified one — *Yahusha (Jesus) Yahuah (Lord) Messiah (Christ)* — *few in those days will be left as His servants, while they flee from desert to desert, awaiting the coming of the Beloved* (Ascension of Isaiah 4:13), under his reign of *three years and seven months and twenty-seven days* (4:12). This is the persecuted, fleeing remnant Yahusha foretold: *Then let them which be in Judaea flee into the mountains* (Matthew 24:16), and *except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened* (Matthew 24:22). The beast is given *power... to continue forty and two months* (Revelation 13:5) — the same hemmed-in season of the saints'' patience.',
       sv.verse_id, ev.verse_id, 'extras', 67584
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-Lord-comes-beliar-gehenna',
       E'The Lord comes with His armies and drags Beliar into Gehenna',
       E'*Yahuah (Lord) will come with His angels and with the armies of the holy ones from the seventh heaven with the glory of the seventh heaven, and He will drag Beliar into Gehenna and also his armies* (Ascension of Isaiah 4:14). This is the descent of the Word with His hosts to destroy the lawless one: *the armies which were in heaven followed him upon white horses* (Revelation 19:14), and the beast and false prophet *were cast alive into a lake of fire burning with brimstone* (Revelation 19:20). Paul: *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). Enoch the seventh from Adam said the same — *Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 67587
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-saints-descend-garments',
       E'The saints descend in their garments — the gathering and the rest',
       E'*The saints will come with Yahuah (Lord) with their garments which are (now) stored up on high in the seventh heaven... they will descend and be present in the world... and Yahuah (Lord) will minister to those who have kept watch in this world* (Ascension of Isaiah 4:16), and *afterwards they will turn themselves upward in their garments* (4:17). Paul tells the same mystery: *Yahuah (Lord) himself shall descend from heaven with a shout... and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16), and *we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air* (1 Thessalonians 4:17). The garments of white are *the righteousness of saints* (Revelation 19:8) — the watch-keepers'' reward is no new doctrine.',
       sv.verse_id, ev.verse_id, 'extras', 67590
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-resurrection-judgment-fire',
       E'Resurrection, judgment, and the fire that consumes the godless',
       E'*There will be a resurrection and a judgment in their midst in those days, and the Beloved will cause fire to go forth from Him, and it will consume all the godless, and they will be as though they had not been created* (Ascension of Isaiah 4:18). Daniel saw the awakening: *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). John saw the throne and the books: *the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12), and the consuming fire: *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The resurrection-judgment by fire is older than the gospel that proclaims it.',
       sv.verse_id, ev.verse_id, 'extras', 67593
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-4-beliar-lawless-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* Paul''s lawless man of sin is the very Beliar Isaiah sees descending in the likeness of a man in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 2:18 — *Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time.* The expected antichrist John names is the king of this world whose descent Isaiah foresees in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s blaspheming beast is the same world-ruler Isaiah watches descend as a lawless king in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:4 — *And Yahusha (Jesus) answered and said unto them, Take heed that no man deceive you.* Yahusha''s warning against the deceiver answers the descent of Beliar in the likeness of a man in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-i-am-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Paul''s self-deifying man of sin speaks the very boast Beliar makes — ''I am Elohim'' — in Ascension of Isaiah 4:6.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-i-am-god'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:4 — *And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?* John''s whole-world worship of the beast is the universal belief Isaiah foresees in Ascension of Isaiah 4:7.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-i-am-god'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:24 — *For there shall arise false Christs, and false prophets, and shall shew great signs and wonders; insomuch that, if it were possible, they shall deceive the very elect.* Yahusha''s false christs who counterfeit signs match the one who speaks like the Beloved and is served as God in Ascension of Isaiah 4:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-i-am-god'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-lying-wonders-image
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Paul''s lying wonders are the miracles in every city that Isaiah foresees in Ascension of Isaiah 4:10.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-lying-wonders-image'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:14 — *And deceiveth them that dwell on the earth by the means of those miracles which he had power to do in the sight of the beast; saying to them that dwell on the earth, that they should make an image to the beast, which had the wound by a sword, and did live.* The image men are made to worship is the very image Beliar sets up in every city in Ascension of Isaiah 4:11.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-lying-wonders-image'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:13 — *And he doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men,* the cosmic forgeries — fire from heaven — match Beliar making the sun rise at night and the moon appear at noon in Ascension of Isaiah 4:5.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-lying-wonders-image'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-saints-flee-desert
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:16 — *Then let them which be in Judaea flee into the mountains:* Yahusha''s command to flee is the very flight ''from desert to desert'' of the remnant awaiting the Beloved in Ascension of Isaiah 4:13.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-flee-desert'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening for the elect''s sake matches the few servants Isaiah says are left as they flee in Ascension of Isaiah 4:13.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-flee-desert'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:5 — *And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* The beast''s fixed forty-two-month tyranny matches the measured reign Beliar bears in Ascension of Isaiah 4:12.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-flee-desert'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-Lord-comes-beliar-gehenna
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* John''s casting of the beast into the fiery lake is the Lord dragging Beliar into Gehenna in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* Paul''s destruction of the Wicked by the Lord''s coming is the same drag of Beliar into Gehenna in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude''s citation of Enoch''s coming-with-saints matches the Lord coming with the armies of the holy ones in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The heavenly armies following the Word are the armies of the holy ones who come from the seventh heaven in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-saints-descend-garments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s descent of the Lord with the dead rising is the saints coming with Yahuah from the seventh heaven in Ascension of Isaiah 4:16.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 4:17 — *Then we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord).* The catching-up to meet the Lord is the saints turning themselves upward in their garments in Ascension of Isaiah 4:17.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* John''s white linen of the saints is the garments stored up on high that Isaiah''s saints come clothed in, in Ascension of Isaiah 4:16.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-resurrection-judgment-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s awakening of the sleepers to life or contempt is the resurrection and judgment Isaiah foresees in Ascension of Isaiah 4:18.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-resurrection-judgment-fire'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:9 — *And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them.* The fire from heaven that devours the wicked is the fire the Beloved causes to go forth and consume the godless in Ascension of Isaiah 4:18.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-resurrection-judgment-fire'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s throne-judgment of the dead is the judgment in their midst Isaiah sees in Ascension of Isaiah 4:18.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-resurrection-judgment-fire'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

