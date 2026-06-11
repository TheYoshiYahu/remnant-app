-- ----- fragment: minion_1enoch_100.sql (session250 1-enoch 100) -----
-- Source anchor: enoch/1-enoch ch100. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en100 (view _session250_en100_lookup). Sort band base 52475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en100_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-100-blood-to-the-bridle
  ('enoch', '1-enoch', 100, 3, 'canon', 'revelation', 14, 20, 'free', E'Revelation 14:20 — *And the winepress was trodden without the city, and blood came out of the winepress, even unto the horse bridles, by the space of a thousand and six hundred furlongs.* John''s winepress runs blood to the horse bridle, the very measure Enoch gives when the horse walks up to its breast in the blood of sinners (100:3).'),
  ('enoch', '1-enoch', 100, 1, 'canon', 'joel', 3, 13, 'free', E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow; for their wickedness is great.* Joel''s overflowing winepress is the harvest of judgement whose streams flow with blood in Enoch 100:1.'),
  ('enoch', '1-enoch', 100, 2, 'canon', 'joel', 3, 14, 'free', E'Joel 3:14 — *Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the valley of decision.* The valley of decision names the place where the slaying from dawn till sunset (100:2) falls.'),
  ('enoch', '1-enoch', 100, 1, 'canon', 'isaiah', 34, 3, 'free', E'Isaiah 34:3 — *Their slain also shall be cast out, and their stink shall come up out of their carcases, and the mountains shall be melted with their blood.* Isaiah''s mountains melted with blood match Enoch''s streams flowing with the blood of the smitten (100:1).'),
  -- thread: 1-enoch-100-supper-of-the-great-elohim
  ('enoch', '1-enoch', 100, 4, 'canon', 'revelation', 19, 17, 'free', E'Revelation 19:17 — *And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God);* John''s gathering angel matches the angels who descend to gather all the workers of sin into one place for the great judgement of Enoch 100:4.'),
  ('enoch', '1-enoch', 100, 4, 'canon', 'revelation', 19, 18, 'free', E'Revelation 19:18 — *That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men, and the flesh of horses, and of them that sit on them, and the flesh of all men, both free and bond, both small and great.* The feast over kings and mighty is the end of the sinners gathered for the Most High''s judgement in Enoch 100:4.'),
  ('enoch', '1-enoch', 100, 4, 'canon', 'isaiah', 34, 2, 'free', E'Isaiah 34:2 — *For the indignation of Yahuah (LORD) is upon all nations, and his fury upon all their armies: he hath utterly destroyed them, he hath delivered them to the slaughter.* Isaiah''s indignation delivered to the slaughter is the great judgement the Most High arises to execute in Enoch 100:4.'),
  ('enoch', '1-enoch', 100, 4, 'canon', 'zephaniah', 1, 17, 'free', E'Zephaniah 1:17 — *And I will bring distress upon men, that they shall walk like blind men, because they have sinned against Yahuah (LORD): and their blood shall be poured out as dust, and their flesh as the dung.* The day of distress on those who sinned is the day of judgement the Most High rises for in Enoch 100:4.'),
  -- thread: 1-enoch-100-apple-of-an-eye
  ('enoch', '1-enoch', 100, 5, 'canon', 'deuteronomy', 32, 10, 'free', E'Deuteronomy 32:10 — *He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye.* Moses'' picture of Yahuah guarding His people as the apple of His eye is the very care the holy-angel guardians give the righteous in Enoch 100:5.'),
  ('enoch', '1-enoch', 100, 5, 'canon', 'zechariah', 2, 8, 'free', E'Zechariah 2:8 — *For thus saith Yahuah Tseva''ot (LORD of hosts); After the glory hath he sent me unto the nations which spoiled you: for he that toucheth you toucheth the apple of his eye.* To touch the guarded righteous is to touch the apple of Yahuah''s eye, the protection Enoch 100:5 assigns the angels to keep.'),
  ('enoch', '1-enoch', 100, 5, 'canon', 'psalms', 91, 11, 'free', E'Psalms 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angelic charge to keep the faithful is exactly the guardians from among the holy angels appointed over the righteous in Enoch 100:5.'),
  ('enoch', '1-enoch', 100, 5, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom''s guarded souls in the hand of Elohim match the long sleep with nought to fear of the righteous in Enoch 100:5.'),
  -- thread: 1-enoch-100-riches-shall-not-save
  ('enoch', '1-enoch', 100, 6, 'canon', 'zephaniah', 1, 18, 'free', E'Zephaniah 1:18 — *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy: for he shall make even a speedy riddance of all them that dwell in the land.* Silver and gold that cannot deliver in the day of wrath is the very lesson the children of the earth learn in Enoch 100:6 — riches shall not save.'),
  ('enoch', '1-enoch', 100, 7, 'canon', 'james', 5, 1, 'free', E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James'' woe to the rich on the coming miseries is the same woe Enoch sounds on the sinners on the day of strong anguish (100:7).'),
  ('enoch', '1-enoch', 100, 7, 'canon', 'james', 5, 3, 'free', E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The hoarded riches that eat the flesh like fire match Enoch''s burning requital on those who burned the righteous with fire (100:7).'),
  ('enoch', '1-enoch', 100, 7, 'canon', 'isaiah', 5, 8, 'free', E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on the land-engrossers names the oppression for which Enoch''s sinners are requited according to their works (100:7).'),
  ('enoch', '1-enoch', 100, 6, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The vain question of the rich at judgement echoes the children of the earth recognizing their riches cannot save them in Enoch 100:6.'),
  -- thread: 1-enoch-100-rain-withheld-witness
  ('enoch', '1-enoch', 100, 11, 'canon', 'deuteronomy', 28, 23, 'free', E'Deuteronomy 28:23 — *And thy heaven that is over thy head shall be brass, and the earth that is under thee shall be iron.* The brass heaven that yields no rain is the covenant curse standing behind the cloud, dew, and rain withheld from the sinners in Enoch 100:11.'),
  ('enoch', '1-enoch', 100, 13, 'canon', 'deuteronomy', 28, 24, 'free', E'Deuteronomy 28:24 — *Yahuah (LORD) shall make the rain of thy land powder and dust: from heaven shall it come down upon thee, until thou be destroyed.* The rain turned to powder and the destroying weather match the snow-storms and plagues the sinners cannot stand before in Enoch 100:13.'),
  ('enoch', '1-enoch', 100, 11, 'canon', 'leviticus', 26, 19, 'free', E'Leviticus 26:19 — *And I will break the pride of your power; and I will make your heaven as iron, and your earth as brass:* The iron heaven for a broken covenant is the Torah ground of the rain and dew withheld as a witness against the sinners in Enoch 100:11.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en100_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en100_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-100-blood-to-the-bridle',
       E'The blood to the horse''s breast — the day of slaughter',
       E'Enoch sees the day of judgement run with blood: *And the horse shall walk up to the breast in the blood of sinners, And the chariot shall be submerged to its height.* (1 Enoch 100:3) — the kindred fall on one another from dawn till sunset until *the streams flow with their blood.* (1 Enoch 100:1) John sees the very same winepress at the end: *And the winepress was trodden without the city, and blood came out of the winepress, even unto the horse bridles, by the space of a thousand and six hundred furlongs.* (Revelation 14:20) — blood to the bridle, the exact measure Enoch gives. Joel had already set the harvest and the place: *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow; for their wickedness is great.* (Joel 3:13) — and named the place of reckoning: *Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the valley of decision.* (Joel 3:14) Isaiah saw the same slaughter-mountains: *Their slain also shall be cast out, and their stink shall come up out of their carcases, and the mountains shall be melted with their blood.* (Isaiah 34:3) It ain''t new — the day Enoch foresaw is the day the prophets and the Revelation alike measure by blood.',
       sv.verse_id, ev.verse_id, 'extras', 52475
  FROM _session250_en100_lookup sv, _session250_en100_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=100 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-100-supper-of-the-great-elohim',
       E'The Most High arises — the supper of the great Elohim',
       E'When the slaughter is full, judgement comes from above: *In those days the angels shall descend into the secret places And gather together into one place all those who brought down sin, And the Most High will arise on that day of judgement To execute great judgement amongst sinners.* (1 Enoch 100:4) The same gathering-angel stands in Revelation, summoning the carrion-feast over the fallen: *And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God);* (Revelation 19:17) — *That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men, and the flesh of horses, and of them that sit on them, and the flesh of all men, both free and bond, both small and great.* (Revelation 19:18) Zephaniah had already pronounced the day on the same terms: *And I will bring distress upon men, that they shall walk like blind men, because they have sinned against Yahuah (LORD): and their blood shall be poured out as dust, and their flesh as the dung.* (Zephaniah 1:17) — and Isaiah named the sentence the angels carry down: *For the indignation of Yahuah (LORD) is upon all nations, and his fury upon all their armies: he hath utterly destroyed them, he hath delivered them to the slaughter.* (Isaiah 34:2) The judgement falls on the systems of sin gathered into one place, not on a scattered conscience — the Most High rises to break the unrighteous order He has long borne.',
       sv.verse_id, ev.verse_id, 'extras', 52478
  FROM _session250_en100_lookup sv, _session250_en100_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=100 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-100-apple-of-an-eye',
       E'Guardians for the righteous — kept as the apple of an eye',
       E'In the day of slaughter the righteous are not abandoned: *And over all the righteous and holy He will appoint guardians from amongst the holy angels To guard them as the apple of an eye, Until He makes an end of all wickedness and all sin, And though the righteous sleep a long sleep, they have nought to fear.* (1 Enoch 100:5) The phrase is Moses'' own picture of Yahuah''s covenant care: *He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye.* (Deuteronomy 32:10) — and the prophet''s warning that to touch the elect is to touch Him: *For thus saith Yahuah Tseva''ot (LORD of hosts); After the glory hath he sent me unto the nations which spoiled you: for he that toucheth you toucheth the apple of his eye.* (Zechariah 2:8) The angelic charge is the Psalm''s promise: *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11) And the long sleep with nought to fear is no annihilation but a guarded rest the dead will wake from — the same hope the apocrypha holds: *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* (Wisdom of Solomon 3:1) The elect are a guarded people, kept through the judgement, never a self-selected class.',
       sv.verse_id, ev.verse_id, 'extras', 52481
  FROM _session250_en100_lookup sv, _session250_en100_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=100 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-100-riches-shall-not-save',
       E'Woe to the rich oppressor — riches shall not save',
       E'The children of the earth will see plainly that wealth is no refuge: *And shall understand all the words of this book, And recognize that their riches shall not be able to save them In the overthrow of their sins.* (1 Enoch 100:6) — and the woe falls on those who burned the righteous: *Woe to you, Sinners, on the day of strong anguish, Ye who afflict the righteous and burn them with fire: Ye shall be requited according to your works.* (1 Enoch 100:7) James pronounces the identical woe on the hoarding rich: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* (James 5:1) — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* (James 5:3) Isaiah''s woe is the same indictment of the land-engrossers: *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* (Isaiah 5:8) — and Yahusha (Jesus) speaks it from the mountain: *But woe unto you that are rich! for ye have received your consolation.* (Luke 6:24) Zephaniah seals it: *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy* (Zephaniah 1:18) — and Wisdom asks the empty question: *What has pride profited us? or what good has riches with our vaunting brought us?* (Wisdom of Solomon 5:8) The woes fall on the system of oppression and the riches built on it, not on persons as such — dismantle the injustice; requital is according to works.',
       sv.verse_id, ev.verse_id, 'extras', 52484
  FROM _session250_en100_lookup sv, _session250_en100_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=100 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-100-rain-withheld-witness',
       E'Heaven testifies — the rain and dew withheld',
       E'Enoch declares that the very lights and waters will testify against the sinners: *And now, know ye that from the angels He will inquire as to your deeds in heaven, from the sun and from the moon and from the stars in reference to your sins because upon the earth ye execute judgement on the righteous.* (1 Enoch 100:10) — and the sky itself becomes a witness and a plague: *And He will summon to testify against you every cloud and mist and dew and rain; for they shall all be withheld because of you from descending upon you, and they shall be mindful of your sins.* (1 Enoch 100:11) The covenant curse spoke this long before: *And thy heaven that is over thy head shall be brass, and the earth that is under thee shall be iron.* (Deuteronomy 28:23) — *Yahuah (LORD) shall make the rain of thy land powder and dust: from heaven shall it come down upon thee, until thou be destroyed.* (Deuteronomy 28:24) Leviticus binds the same sentence to broken covenant: *And I will break the pride of your power; and I will make your heaven as iron, and your earth as brass:* (Leviticus 26:19) The withheld rain is no arbitrary wrath but the Torah''s own curse for the covenant broken against the righteous — the bribe Enoch mocks (presents to the rain, gold and silver to buy the dew, 100:12) cannot reverse it. Torah stands; the heavens keep its terms.',
       sv.verse_id, ev.verse_id, 'extras', 52487
  FROM _session250_en100_lookup sv, _session250_en100_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=100 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-100-blood-to-the-bridle
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 14:20 — *And the winepress was trodden without the city, and blood came out of the winepress, even unto the horse bridles, by the space of a thousand and six hundred furlongs.* John''s winepress runs blood to the horse bridle, the very measure Enoch gives when the horse walks up to its breast in the blood of sinners (100:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-blood-to-the-bridle'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow; for their wickedness is great.* Joel''s overflowing winepress is the harvest of judgement whose streams flow with blood in Enoch 100:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-blood-to-the-bridle'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 3:14 — *Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the valley of decision.* The valley of decision names the place where the slaying from dawn till sunset (100:2) falls.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-blood-to-the-bridle'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 34:3 — *Their slain also shall be cast out, and their stink shall come up out of their carcases, and the mountains shall be melted with their blood.* Isaiah''s mountains melted with blood match Enoch''s streams flowing with the blood of the smitten (100:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-blood-to-the-bridle'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-100-supper-of-the-great-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:17 — *And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God);* John''s gathering angel matches the angels who descend to gather all the workers of sin into one place for the great judgement of Enoch 100:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-supper-of-the-great-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 19:18 — *That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men, and the flesh of horses, and of them that sit on them, and the flesh of all men, both free and bond, both small and great.* The feast over kings and mighty is the end of the sinners gathered for the Most High''s judgement in Enoch 100:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-supper-of-the-great-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 34:2 — *For the indignation of Yahuah (LORD) is upon all nations, and his fury upon all their armies: he hath utterly destroyed them, he hath delivered them to the slaughter.* Isaiah''s indignation delivered to the slaughter is the great judgement the Most High arises to execute in Enoch 100:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-supper-of-the-great-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zephaniah 1:17 — *And I will bring distress upon men, that they shall walk like blind men, because they have sinned against Yahuah (LORD): and their blood shall be poured out as dust, and their flesh as the dung.* The day of distress on those who sinned is the day of judgement the Most High rises for in Enoch 100:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-supper-of-the-great-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-100-apple-of-an-eye
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:10 — *He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye.* Moses'' picture of Yahuah guarding His people as the apple of His eye is the very care the holy-angel guardians give the righteous in Enoch 100:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-apple-of-an-eye'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 2:8 — *For thus saith Yahuah Tseva''ot (LORD of hosts); After the glory hath he sent me unto the nations which spoiled you: for he that toucheth you toucheth the apple of his eye.* To touch the guarded righteous is to touch the apple of Yahuah''s eye, the protection Enoch 100:5 assigns the angels to keep.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-apple-of-an-eye'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angelic charge to keep the faithful is exactly the guardians from among the holy angels appointed over the righteous in Enoch 100:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-apple-of-an-eye'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom''s guarded souls in the hand of Elohim match the long sleep with nought to fear of the righteous in Enoch 100:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-apple-of-an-eye'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-100-riches-shall-not-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zephaniah 1:18 — *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy: for he shall make even a speedy riddance of all them that dwell in the land.* Silver and gold that cannot deliver in the day of wrath is the very lesson the children of the earth learn in Enoch 100:6 — riches shall not save.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-riches-shall-not-save'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James'' woe to the rich on the coming miseries is the same woe Enoch sounds on the sinners on the day of strong anguish (100:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-riches-shall-not-save'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The hoarded riches that eat the flesh like fire match Enoch''s burning requital on those who burned the righteous with fire (100:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-riches-shall-not-save'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on the land-engrossers names the oppression for which Enoch''s sinners are requited according to their works (100:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-riches-shall-not-save'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The vain question of the rich at judgement echoes the children of the earth recognizing their riches cannot save them in Enoch 100:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-riches-shall-not-save'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-100-rain-withheld-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 28:23 — *And thy heaven that is over thy head shall be brass, and the earth that is under thee shall be iron.* The brass heaven that yields no rain is the covenant curse standing behind the cloud, dew, and rain withheld from the sinners in Enoch 100:11.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-rain-withheld-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:24 — *Yahuah (LORD) shall make the rain of thy land powder and dust: from heaven shall it come down upon thee, until thou be destroyed.* The rain turned to powder and the destroying weather match the snow-storms and plagues the sinners cannot stand before in Enoch 100:13.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-rain-withheld-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:19 — *And I will break the pride of your power; and I will make your heaven as iron, and your earth as brass:* The iron heaven for a broken covenant is the Torah ground of the rain and dew withheld as a witness against the sinners in Enoch 100:11.'
  FROM cross_reference_threads t, cross_references x, _session250_en100_lookup sv, _session250_en100_lookup tv
 WHERE t.slug='1-enoch-100-rain-withheld-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=100 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

