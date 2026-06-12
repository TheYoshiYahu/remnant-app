-- ----- fragment: minion_1maccabees_01.sql (session253 1-maccabees 1) -----
-- Source anchor: apocrypha/1-maccabees ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac1 (view _session253_1mac1_lookup). Sort band base 61500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-1-wicked-root-antichrist
  ('apocrypha', '1-maccabees', 1, 10, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Antiochus'' decree to forbid the Sabbath and the law is the very "changing of times and laws" Daniel foresaw rising out of the Greek beast.'),
  ('apocrypha', '1-maccabees', 1, 10, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Epiphanes, "god manifest," enthroning his idol in the sanctuary is the foreshadow of the man of sin Paul says will sit in the temple of Elohim.'),
  ('apocrypha', '1-maccabees', 1, 10, 'canon', '1-john', 2, 18, 'free', E'1 John 2:18 — *Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time.* The wicked root of 1 Maccabees 1:10 is one of the many antichrists whose spirit John says was already at work and points to the last.'),
  -- thread: 1-maccabees-1-uncircumcised-broke-covenant
  ('apocrypha', '1-maccabees', 1, 15, 'canon', 'genesis', 17, 10, 'free', E'Genesis 17:10 — *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* The wicked who "made themselves uncircumcised" undid the very sign Yahuah set as His everlasting covenant with the seed.'),
  ('apocrypha', '1-maccabees', 1, 15, 'canon', 'genesis', 17, 14, 'free', E'Genesis 17:14 — *And the uncircumcised man child whose flesh of his foreskin is not circumcised, that soul shall be cut off from his people; he hath broken my covenant.* To forsake circumcision was, by Torah''s own word, to break covenant and be cut off — exactly the "forsook the holy covenant" of 1 Maccabees 1:15.'),
  ('apocrypha', '1-maccabees', 1, 11, 'canon', 'deuteronomy', 12, 30, 'free', E'Deuteronomy 12:30 — *Take heed to thyself that thou be not snared by following them, after that they be destroyed from before thee; and that thou enquire not after their gods, saying, How did these nations serve their gods? even so will I do likewise.* The apostates'' "let us make a covenant with the heathen" walks straight into the very snare Moses warned of.'),
  -- thread: 1-maccabees-1-sanctuary-spoiled-defiled
  ('apocrypha', '1-maccabees', 1, 21, 'canon', 'ezekiel', 7, 21, 'free', E'Ezekiel 7:21 — *And I will give it into the hands of the strangers for a prey, and to the wicked of the earth for a spoil; and they shall pollute it.* Antiochus entering proudly to strip the golden altar and vessels is the stranger''s spoil and pollution Ezekiel foretold.'),
  ('apocrypha', '1-maccabees', 1, 37, 'canon', 'ezekiel', 7, 24, 'free', E'Ezekiel 7:24 — *Wherefore I will bring the worst of the heathen, and they shall possess their houses: I will also make the pomp of the strong to cease; and their holy places shall be defiled.* The innocent blood shed about the sanctuary and its defiling answer Ezekiel''s word that the heathen would defile the holy places.'),
  ('apocrypha', '1-maccabees', 1, 21, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The proud plunder of the sanctuary is the type of the beast given power to make war on the saints.'),
  -- thread: 1-maccabees-1-feasts-turned-to-mourning
  ('apocrypha', '1-maccabees', 1, 39, 'canon', 'lamentations', 1, 4, 'free', E'Lamentations 1:4 — *The ways of Zion do mourn, because none come to the solemn feasts: all her gates are desolate: her priests sigh, her virgins are afflicted, and she is in bitterness.* The feasts turned into mourning and the laid-waste sanctuary of 1 Maccabees 1:39 are Jeremiah''s lament come round again.'),
  ('apocrypha', '1-maccabees', 1, 39, 'canon', 'amos', 8, 10, 'free', E'Amos 8:10 — *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* Amos names the very judgment 1 Maccabees 1:39 records: feasts turned to mourning.'),
  ('apocrypha', '1-maccabees', 1, 39, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The feasts mourned here would be restored in the rededication the Messiah Himself kept, the feast of dedication walking in the temple.'),
  -- thread: 1-maccabees-1-abomination-of-desolation
  ('apocrypha', '1-maccabees', 1, 54, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* 1 Maccabees 1:54 is the literal fulfilment: the abomination of desolation set up upon the altar of Yahuah.'),
  ('apocrypha', '1-maccabees', 1, 54, 'canon', 'daniel', 12, 11, 'free', E'Daniel 12:11 — *And from the time that the daily sacrifice shall be taken away, and the abomination that maketh desolate set up, there shall be a thousand two hundred and ninety days.* The taking away of sacrifice and setting up of the abomination Daniel times is enacted in 1 Maccabees 1:54-59.'),
  ('apocrypha', '1-maccabees', 1, 54, 'canon', 'daniel', 9, 27, 'free', E'Daniel 9:27 — *And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate.* The ceasing of sacrifice and overspreading abomination of Daniel 9 is mirrored in Antiochus'' idol-altar upon Yahuah''s altar.'),
  ('apocrypha', '1-maccabees', 1, 54, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah declares the abomination of 1 Maccabees 1:54 a still-future sign, the type yet to stand in the holy place.'),
  ('apocrypha', '1-maccabees', 1, 59, 'canon', 'isaiah', 65, 4, 'free', E'Isaiah 65:4 — *Which remain among the graves, and lodge in the monuments, which eat swine''s flesh, and broth of abominable things is in their vessels.* The swine sacrificed upon Yahuah''s altar in 1 Maccabees 1:59 is the very abomination Isaiah names against the rebellious.'),
  -- thread: 1-maccabees-1-chose-to-die-rather-than-defile
  ('apocrypha', '1-maccabees', 1, 63, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* The faithful who would not be "defiled with meats" held fast the very Torah law of clean and unclean, dying rather than break it.'),
  ('apocrypha', '1-maccabees', 1, 63, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Maccabean martyrs who "chose rather to die" are the very ones "tortured, not accepting deliverance" whom Hebrews crowns with hope of a better resurrection.'),
  ('apocrypha', '1-maccabees', 1, 62, 'apocrypha', '2-maccabees', 6, 19, 'extras', E'2 Maccabees 6:19 — *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment.* Eleazar embodies the resolve of 1 Maccabees 1:62 not to eat any unclean thing, choosing death over defilement.'),
  ('apocrypha', '1-maccabees', 1, 63, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The brothers who died for the laws name the resurrection-hope that crowns those who, like 1 Maccabees 1:63, chose to die rather than profane the covenant.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-1-wicked-root-antichrist',
       E'A wicked root: the king who exalts himself',
       E'From Alexander''s Greek conquest springs a horn: *And there came out of them a wicked root Antiochus surnamed Epiphanes, son of Antiochus the king, who had been an hostage at Rome, and he reigned in the hundred and thirty and seventh year of the kingdom of the Greeks* (1 Maccabees 1:10), the man whose heart *was lifted up* (1 Maccabees 1:3). This is the prophets'' pattern of the kingdom of man that thinks itself a god. Daniel saw the same horn out of the Greek beast: *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time* (Daniel 7:25) — Antiochus forbidding Torah, Sabbath, and circumcision IS the changing of times and laws in the flesh. Paul carries it forward to the last man of sin: *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — Epiphanes ("god manifest") is the type, antichrist the antitype. John names the spirit: *Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time* (1 John 2:18). The system, not merely the man, is to be dismantled.',
       sv.verse_id, ev.verse_id, 'extras', 61500
  FROM _session253_1mac1_lookup sv, _session253_1mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-1-uncircumcised-broke-covenant',
       E'They forsook the holy covenant',
       E'The crisis begins not with the king but with apostates within: *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief* (1 Maccabees 1:15), having said *Let us go and make a covenant with the heathen that are round about us* (1 Maccabees 1:11). Torah named circumcision the everlasting sign and warned the cost of undoing it: *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised* (Genesis 17:10), and *the uncircumcised man child whose flesh of his foreskin is not circumcised, that soul shall be cut off from his people; he hath broken my covenant* (Genesis 17:14). And Moses had foreseen the snare of imitating the nations: *Take heed to thyself that thou be not snared by following them, after that they be destroyed from before thee; and that thou enquire not after their gods, saying, How did these nations serve their gods? even so will I do likewise* (Deuteronomy 12:30). This is covenant broken from within — never Torah made a curse, but Torah forsaken.',
       sv.verse_id, ev.verse_id, 'extras', 61503
  FROM _session253_1mac1_lookup sv, _session253_1mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-1-sanctuary-spoiled-defiled',
       E'He spoiled and defiled the sanctuary',
       E'Antiochus plunders the house of Yahuah: *And entered proudly into the sanctuary, and took away the golden altar, and the candlestick of light, and all the vessels thereof* (1 Maccabees 1:21), so that *Thus they shed innocent blood on every side of the sanctuary, and defiled it* (1 Maccabees 1:37). Ezekiel had prophesied this defiling by strangers: *And I will give it into the hands of the strangers for a prey, and to the wicked of the earth for a spoil; and they shall pollute it* (Ezekiel 7:21), and *I will also make the pomp of the strong to cease; and their holy places shall be defiled* (Ezekiel 7:24). And the end of the matter is what John sees given to the beast: *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations* (Revelation 13:7) — the same proud arm spoiling the holy people across the ages.',
       sv.verse_id, ev.verse_id, 'extras', 61506
  FROM _session253_1mac1_lookup sv, _session253_1mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=1 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-1-feasts-turned-to-mourning',
       E'Her feasts turned into mourning',
       E'The desolation strikes the appointed times themselves: *Her sanctuary was laid waste like a wilderness, her feasts were turned into mourning, her sabbaths into reproach her honour into contempt* (1 Maccabees 1:39), so that *all the house of Jacob was covered with confusion* (1 Maccabees 1:28). This is the lament of Zion that the prophets sang. Jeremiah: *The ways of Zion do mourn, because none come to the solemn feasts: all her gates are desolate: her priests sigh, her virgins are afflicted, and she is in bitterness* (Lamentations 1:4). And Amos foretold the exact reversal: *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day* (Amos 8:10). Yet the feast is not abolished but to be restored — for the Messiah Himself would keep the very rededication this assault forced: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22).',
       sv.verse_id, ev.verse_id, 'extras', 61509
  FROM _session253_1mac1_lookup sv, _session253_1mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=1 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-1-abomination-of-desolation',
       E'The abomination of desolation set up',
       E'Here is the heart of the chapter and one of Scripture''s pivotal fulfilments: *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side* (1 Maccabees 1:54), so that *the five and twentieth day of the month they did sacrifice upon the idol altar, which was upon the altar of Yahuah (God)* (1 Maccabees 1:59), with command *To the end they might forget the law, and change all the ordinances* (1 Maccabees 1:49). This is Daniel''s own phrase made history: *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31), and *from the time that the daily sacrifice shall be taken away, and the abomination that maketh desolate set up* (Daniel 12:11). Daniel 9 names the same: *for the overspreading of abominations he shall make it desolate* (Daniel 9:27). Yet the Messiah said it was not exhausted in Antiochus but would stand again: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15) — and John sees the final image that men are forced to worship (Revelation 13:15). The swine and the strange altars were the heathen abomination Torah forbids: *which eat swine''s flesh, and broth of abominable things is in their vessels* (Isaiah 65:4).',
       sv.verse_id, ev.verse_id, 'extras', 61512
  FROM _session253_1mac1_lookup sv, _session253_1mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=54
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=1 AND ev.verse_number=59
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-1-chose-to-die-rather-than-defile',
       E'They chose to die rather than profane the covenant',
       E'Against the decree of death the faithful answer with their lives: *Howbeit many in Yashar''el (Israel) were fully resolved and confirmed in themselves not to eat any unclean thing* (1 Maccabees 1:62); *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died* (1 Maccabees 1:63). Torah had set swine outside the covenant table: *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8). This is the faith the writer to the Hebrews crowns — not law as a curse but Torah held faithful unto death for a better resurrection: *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). Their sister-witness is Eleazar, who *choosing rather to die gloriously, than to live stained with such an abomination, spit it forth* (2 Maccabees 6:19), and the seven brothers whose hope was the rising again: *but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). The very resurrection Hebrews 11:35 looks back to is theirs.',
       sv.verse_id, ev.verse_id, 'extras', 61515
  FROM _session253_1mac1_lookup sv, _session253_1mac1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=62
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=1 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-1-wicked-root-antichrist
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* Antiochus'' decree to forbid the Sabbath and the law is the very "changing of times and laws" Daniel foresaw rising out of the Greek beast.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-wicked-root-antichrist'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Epiphanes, "god manifest," enthroning his idol in the sanctuary is the foreshadow of the man of sin Paul says will sit in the temple of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-wicked-root-antichrist'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 2:18 — *Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time.* The wicked root of 1 Maccabees 1:10 is one of the many antichrists whose spirit John says was already at work and points to the last.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-wicked-root-antichrist'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-1-uncircumcised-broke-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:10 — *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* The wicked who "made themselves uncircumcised" undid the very sign Yahuah set as His everlasting covenant with the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-uncircumcised-broke-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:14 — *And the uncircumcised man child whose flesh of his foreskin is not circumcised, that soul shall be cut off from his people; he hath broken my covenant.* To forsake circumcision was, by Torah''s own word, to break covenant and be cut off — exactly the "forsook the holy covenant" of 1 Maccabees 1:15.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-uncircumcised-broke-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 12:30 — *Take heed to thyself that thou be not snared by following them, after that they be destroyed from before thee; and that thou enquire not after their gods, saying, How did these nations serve their gods? even so will I do likewise.* The apostates'' "let us make a covenant with the heathen" walks straight into the very snare Moses warned of.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-uncircumcised-broke-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-1-sanctuary-spoiled-defiled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 7:21 — *And I will give it into the hands of the strangers for a prey, and to the wicked of the earth for a spoil; and they shall pollute it.* Antiochus entering proudly to strip the golden altar and vessels is the stranger''s spoil and pollution Ezekiel foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-sanctuary-spoiled-defiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 7:24 — *Wherefore I will bring the worst of the heathen, and they shall possess their houses: I will also make the pomp of the strong to cease; and their holy places shall be defiled.* The innocent blood shed about the sanctuary and its defiling answer Ezekiel''s word that the heathen would defile the holy places.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-sanctuary-spoiled-defiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The proud plunder of the sanctuary is the type of the beast given power to make war on the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-sanctuary-spoiled-defiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-1-feasts-turned-to-mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 1:4 — *The ways of Zion do mourn, because none come to the solemn feasts: all her gates are desolate: her priests sigh, her virgins are afflicted, and she is in bitterness.* The feasts turned into mourning and the laid-waste sanctuary of 1 Maccabees 1:39 are Jeremiah''s lament come round again.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-feasts-turned-to-mourning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 8:10 — *And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day.* Amos names the very judgment 1 Maccabees 1:39 records: feasts turned to mourning.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-feasts-turned-to-mourning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The feasts mourned here would be restored in the rededication the Messiah Himself kept, the feast of dedication walking in the temple.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-feasts-turned-to-mourning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-1-abomination-of-desolation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* 1 Maccabees 1:54 is the literal fulfilment: the abomination of desolation set up upon the altar of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:11 — *And from the time that the daily sacrifice shall be taken away, and the abomination that maketh desolate set up, there shall be a thousand two hundred and ninety days.* The taking away of sacrifice and setting up of the abomination Daniel times is enacted in 1 Maccabees 1:54-59.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:27 — *And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate.* The ceasing of sacrifice and overspreading abomination of Daniel 9 is mirrored in Antiochus'' idol-altar upon Yahuah''s altar.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah declares the abomination of 1 Maccabees 1:54 a still-future sign, the type yet to stand in the holy place.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 65:4 — *Which remain among the graves, and lodge in the monuments, which eat swine''s flesh, and broth of abominable things is in their vessels.* The swine sacrificed upon Yahuah''s altar in 1 Maccabees 1:59 is the very abomination Isaiah names against the rebellious.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-1-chose-to-die-rather-than-defile
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* The faithful who would not be "defiled with meats" held fast the very Torah law of clean and unclean, dying rather than break it.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-chose-to-die-rather-than-defile'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Maccabean martyrs who "chose rather to die" are the very ones "tortured, not accepting deliverance" whom Hebrews crowns with hope of a better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-chose-to-die-rather-than-defile'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 6:19 — *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment.* Eleazar embodies the resolve of 1 Maccabees 1:62 not to eat any unclean thing, choosing death over defilement.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-chose-to-die-rather-than-defile'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=62
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The brothers who died for the laws name the resurrection-hope that crowns those who, like 1 Maccabees 1:63, chose to die rather than profane the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac1_lookup sv, _session253_1mac1_lookup tv
 WHERE t.slug='1-maccabees-1-chose-to-die-rather-than-defile'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=1 AND sv.verse_number=63
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

