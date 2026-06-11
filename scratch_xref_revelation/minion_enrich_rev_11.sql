-- S227 enrichment — Revelation 11: the two witnesses (two houses), the beast,
--   the seventh trumpet, the ark of the testament.
-- ADD-only: new cross_references + new thread members on the existing live ch11 threads.
-- NOTE: ch11 was corrected in session225 (two-witnesses = the two houses, Ezekiel 37
--   two sticks). The two-witnesses, fire/shut-heaven, spirit-of-life, and kingdoms
--   threads already carry their S225 members (Ezek 37:16/17/19/22; Rev 20:11-12 frame);
--   nothing here duplicates them. References the shared view _s227_rev_lookup. No rewrites.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the reed to measure the temple (extras thread, P-adds free) — add Zechariah 2:2, Daniel 8:14
  ('canon','revelation',11,1,'canon','zechariah',2,2,'free', E'*And he said unto me, To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof* (Zechariah 2:2). The reed given to *measure the temple of Elohim (God), and the altar* (Revelation 11:1) is the measuring-line of Zechariah, sent *to measure Jerusalem.* And that measuring ended not in ruin but in restoration — Yahuah (LORD) a wall of fire about her and the glory in her midst; so the measured temple is marked off for keeping, not for demolition.'),
  ('canon','revelation',11,2,'canon','daniel',8,14,'free', E'*And he said unto me, Unto two thousand and three hundred days; then shall the sanctuary be cleansed* (Daniel 8:14). The holy city *trodden under foot forty and two months* (Revelation 11:2) is the trodden sanctuary of Daniel, given over for a numbered season — *then shall the sanctuary be cleansed.* The treading is measured and bounded; like Daniel''s days, it runs its appointed count and ends in the cleansing of the holy place.'),
  -- thread: the two witnesses, two olive trees, two candlesticks (P=ezekiel/zechariah) — Ezek 37 done in S225; add Zechariah 4:2, 4:6, 4:12
  ('canon','revelation',11,4,'canon','zechariah',4,2,'free', E'*I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps* (Zechariah 4:2). The two witnesses are *the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4), named from Zechariah''s golden lampstand fed by its bowl and pipes. The lamps that burn before Yahuah (LORD) are the witness of his people — the two houses bearing his light through the dark days of the treading-down.'),
  ('canon','revelation',11,3,'canon','zechariah',4,6,'free', E'*This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The two witnesses *prophesy a thousand two hundred and threescore days* (Revelation 11:3) in the power Zechariah named over the lampstand — *Not by might, nor by power, but by my spirit.* The two houses testify not by their own strength but by the Spirit of Yahuah (LORD), the oil that feeds the lamps through the whole appointed time.'),
  ('canon','revelation',11,4,'canon','zechariah',4,12,'free', E'*What be these two olive branches which through the two golden pipes empty the golden oil out of themselves?* (Zechariah 4:12). The *two olive trees* of the witnesses (Revelation 11:4) are Zechariah''s two branches pouring out the golden oil into the lamps — the two houses supplying the light with the Spirit''s oil, feeding the one lampstand of the testimony out of themselves.'),
  -- thread: the beast from the pit slays them, the great city Sodom (free, P=daniel/isaiah) — add Daniel 7:25, Ezekiel 16:49, Isaiah 1:21
  ('canon','revelation',11,7,'canon','daniel',7,25,'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time* (Daniel 7:25). The beast that *make war against them, and... overcome them, and kill them* (Revelation 11:7) is the horn that *wear out the saints of the El Elyon (most High)* — given the saints into his hand for a measured season, *a time and times and the dividing of time,* the very span of the witnesses'' treading-down. The prevailing is bounded, the law-changing beast loosed only for the appointed hour.'),
  ('canon','revelation',11,8,'canon','ezekiel',16,49,'free', E'*Behold, this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness was in her and in her daughters, neither did she strengthen the hand of the poor and needy* (Ezekiel 16:49). The great city where the witnesses lie dead is *spiritually... called Sodom* (Revelation 11:8) — and Ezekiel had already named the covenant city Sodom''s sister, charging her with Sodom''s very iniquity. The city earns the name not by her place but by her deeds, the pride and hardness Ezekiel laid to the unfaithful daughter.'),
  ('canon','revelation',11,8,'canon','isaiah',1,21,'free', E'*How is the faithful city become an harlot! it was full of judgment; righteousness lodged in it; but now murderers* (Isaiah 1:21). The city *spiritually... called Sodom and Egypt, where also our Lord was crucified* (Revelation 11:8) is Isaiah''s faithful city *become an harlot* — once full of judgment, now full of murderers, the city that slays the prophets. Sodom by her deeds and a harlot by her unfaithfulness: the prophets'' own charge against the covenant city in her rebellion.'),
  -- thread: the kingdoms become the kingdoms of our Lord (free, P=daniel/zechariah, E where real) — add Daniel 2:35, 7:18, Obadiah 1:21, 2 Esdras 12:32
  ('canon','revelation',11,15,'canon','daniel',2,35,'free', E'*and the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35). *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* (Revelation 11:15): this is the stone of Daniel grown to fill the earth — the image of the kingdoms broken to chaff, and the stone *became a great mountain, and filled the whole earth.* The seventh trumpet declares come what Daniel saw: the everlasting kingdom filling all.'),
  ('canon','revelation',11,18,'canon','daniel',7,18,'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever* (Daniel 7:18). The trumpet gives *reward unto thy servants the prophets, and to the saints* (Revelation 11:18); Daniel foretold that very inheritance — *the saints of the El Elyon (most High) shall take the kingdom... for ever and ever.* The kingdom that becomes the Lord''s is the kingdom the saints possess with him; the reward of the seventh trumpet is the everlasting reign shared.'),
  ('canon','revelation',11,15,'canon','obadiah',1,21,'free', E'*And saviours shall come up on mount Zion to judge the mount of Esau; and the kingdom shall be the LORD’S* (Obadiah 1:21). The cry that *the kingdoms of this world are become the kingdoms of our Lord* (Revelation 11:15) is Obadiah''s closing word — *and the kingdom shall be the LORD’S.* The end of all the prophets'' hope is the one reign, the kingdom restored to Yahuah (LORD) from mount Zion, declared come at the seventh trumpet.'),
  ('canon','revelation',11,18,'apocrypha','2-esdras',12,32,'extras', E'*This is the anointed, which the Highest has kept for them and for their wickedness to the end: he shall reprove them, and shall upbraid them with their cruelty* (2 Esdras 12:32). The seventh trumpet names *the time of the dead, that they should be judged,* and the wrath come on *them which destroy the earth* (Revelation 11:18). The restored library saw the same — the anointed *kept... to the end* to reprove the nations and judge their cruelty; the Messiah of his Father held in reserve until the appointed reckoning, then set forth to judge the destroyers of the earth.'),
  -- thread: the temple opened and the ark of his testament seen (P=0,E=0 -> add Jeremiah + 2 Maccabees)
  ('canon','revelation',11,19,'canon','jeremiah',3,16,'free', E'*they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more* (Jeremiah 3:16). The ark hidden and unremembered in Jeremiah''s day is *seen in his temple* at the last — *the ark of his testament* (Revelation 11:19). The prophet foretold the day the ark would no more be visited on earth; the seer is shown where it is — opened in heaven, the covenant not lost but enthroned.'),
  ('canon','revelation',11,19,'canon','jeremiah',3,17,'free', E'*At that time they shall call Jerusalem the throne of Yahuah (LORD); and all the nations shall be gathered unto it, to the name of Yahuah (LORD)* (Jeremiah 3:17). When *the temple of Elohim (God) was opened in heaven, and there was seen... the ark of his testament* (Revelation 11:19), it is the day Jeremiah named — Jerusalem *the throne of Yahuah (LORD)* and the nations gathered to his name. The showing of the ark is the dawning of that gathering: the covenant-throne revealed, the peoples drawn to it.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,4,'extras', E'*the prophet, being warned of Yahuah (God), commanded the tabernacle and the ark to go with him, as he went forth into the mountain, where Moses climbed up, and saw the heritage of Yahuah (God)* (2 Maccabees 2:4). The library kept the memory of the ark hidden away — Jeremiah, *warned of Yahuah (God),* taking *the tabernacle and the ark* into the mountain. The ark *seen in his temple* (Revelation 11:19) is the hidden ark brought to light at last, the thing concealed against the day of restoration now openly shown.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,5,'extras', E'*And when Jeremy came thither, he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door* (2 Maccabees 2:5). The ark Jeremiah *laid* in the hollow cave and *stopped the door* upon is the ark now *seen in his temple* in heaven (Revelation 11:19). What the prophet sealed away in the mountain against the appointed time is unsealed in the vision — the door of the cave answered by the opening of the heavenly temple.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,7,'extras', E'*As for that place, it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy* (2 Maccabees 2:7). The ark was to stay hidden *until the time that Yahuah (God) gather his people again together* — and at the seventh trumpet, when the kingdom is come and the people gathered, *the ark of his testament* is seen (Revelation 11:19). The showing of the ark is the sign that the appointed gathering has arrived, the covenant brought back into view for the regathered people.'),
  ('canon','revelation',11,19,'apocrypha','2-maccabees',2,8,'extras', E'*Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also, as it was shewed under Moses* (2 Maccabees 2:8). The library foretold that at the gathering *Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also* — and so it is: *the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament* (Revelation 11:19), with the lightnings and thunderings of Sinai. The hidden ark shown, the glory and the cloud returned, exactly as the library said it would be at the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== thread members =====
-- members: revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40 (existing 1..7)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 2:2 — *To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof* the measuring-line of Jerusalem that ends in restoration, the reed marking off the temple (Revelation 11:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 8:14 — *Unto two thousand and three hundred days; then shall the sanctuary be cleansed* the trodden sanctuary given over a numbered season, then cleansed; the city trodden forty-two months (Revelation 11:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-reed-to-measure-the-temple-of-elohim-and-the-altar-ezekiel-40'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4 (existing 1..3 S224 + 4..7 S225)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 4:2 — *a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon* the golden lampstand whose lamps are the witness of his people, the two candlesticks of the two houses (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Zechariah 4:6 — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* the power in which the two witnesses prophesy, the Spirit''s oil feeding the lamps of the two houses (Revelation 11:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Zechariah 4:12 — *these two olive branches which through the two golden pipes empty the golden oil out of themselves* the two olive trees pouring the golden oil into the lamps, the two houses supplying the testimony (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7 (existing 1..3)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:25 — *shall wear out the saints of the El Elyon (most High), and think to change times and laws... until a time and times and the dividing of time* the law-changing horn that wears out the saints for a measured season, the beast that slays the witnesses (Revelation 11:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 16:49 — *this was the iniquity of thy sister Sodom, pride, fulness of bread, and abundance of idleness* the covenant city named Sodom''s sister by her deeds, the great city spiritually called Sodom (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Isaiah 1:21 — *How is the faithful city become an harlot!... but now murderers* the faithful city turned harlot and murderous, the city that slays the prophets and the witnesses (Revelation 11:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-beast-from-the-pit-slays-them-in-the-great-city-called-sodom-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7 (existing 1..7)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 2:35 — *the stone that smote the image became a great mountain, and filled the whole earth* the stone grown to fill the earth, the everlasting kingdom now declared come (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the kingdom the saints possess with the Messiah; the trumpet rewards the servants and saints (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Obadiah 1:21 — *and the kingdom shall be the LORD’S* the prophets'' closing hope, the one reign restored to Yahuah (LORD) from mount Zion (Revelation 11:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Esdras 12:32 — *This is the anointed, which the Highest has kept for them... to the end: he shall reprove them, and shall upbraid them with their cruelty* the anointed kept in reserve to judge the nations; the wrath come on them that destroy the earth (Revelation 11:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25 (existing 1..4)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 3:16 — *they shall say no more, The ark of the covenant of Yahuah (LORD)... neither shall they remember it* the ark hidden and unremembered in Jeremiah''s day, now seen openly in the heavenly temple (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 3:17 — *At that time they shall call Jerusalem the throne of Yahuah (LORD); and all the nations shall be gathered unto it* the day of the gathering when the ark-throne is revealed and the nations drawn to his name (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Maccabees 2:4 — *the prophet... commanded the tabernacle and the ark to go with him, as he went forth into the mountain* Jeremiah hiding the ark in the mountain; the ark now seen openly in the temple of heaven (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Maccabees 2:5 — *he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door* the ark sealed in the cave against the appointed time, unsealed when the heavenly temple is opened (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 25, E'2 Maccabees 2:7 — *it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy* the ark hidden until the gathering; the showing of the ark is the sign the gathering has come (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 26, E'2 Maccabees 2:8 — *Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also, as it was shewed under Moses* the hidden ark shown and the glory-cloud returned at the gathering, exactly as the heavenly temple is opened (Revelation 11:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-11-the-temple-opened-and-the-ark-of-his-testament-seen-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
