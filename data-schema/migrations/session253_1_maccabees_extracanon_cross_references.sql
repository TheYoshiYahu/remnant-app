-- =====================================================================
-- Session 253 — 1 Maccabees FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_1_maccabees_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — 1 Maccabees cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_1maccabees_02.sql (session253 1-maccabees 2) -----
-- Source anchor: apocrypha/1-maccabees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac2 (view _session253_1mac2_lookup). Sort band base 61525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-2-sanctuary-profaned
  ('apocrypha', '1-maccabees', 2, 12, 'apocrypha', '1-maccabees', 1, 54, 'extras', E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* This is the very profaning Mattathias mourns when he cries that the sanctuary is laid waste in 1 Maccabees 2:12.'),
  ('apocrypha', '1-maccabees', 2, 12, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold the polluting of the holy place that 1 Maccabees 2:12 sees come to pass under Antiochus.'),
  ('apocrypha', '1-maccabees', 2, 12, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah names the same desolating abomination as still to come, the antichrist pattern Mattathias already grieves in 1 Maccabees 2:12.'),
  -- thread: 1-maccabees-2-zeal-of-phinehas
  ('apocrypha', '1-maccabees', 2, 26, 'canon', 'numbers', 25, 7, 'free', E'Numbers 25:7 — *And when Phinehas, the son of Eleazar, the son of Aaron the priest, saw it, he rose up from among the congregation, and took a javelin in his hand;* This is the deed 1 Maccabees 2:26 names as the very pattern of Mattathias'' zeal upon the altar.'),
  ('apocrypha', '1-maccabees', 2, 26, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting priesthood granted for Phinehas'' zeal is the covenant Mattathias the priest is acting in when he is inflamed with zeal in 1 Maccabees 2:26.'),
  ('apocrypha', '1-maccabees', 2, 24, 'canon', 'psalms', 106, 30, 'free', E'Psalm 106:30 — *Then stood up Phinehas, and executed judgment: and so the plague was stayed.* As Phinehas rose and executed judgment to stay the plague, so Mattathias rises and slays the apostate at the altar in 1 Maccabees 2:24.'),
  ('apocrypha', '1-maccabees', 2, 24, 'canon', 'psalms', 106, 31, 'free', E'Psalm 106:31 — *And that was counted unto him for righteousness unto all generations for evermore.* The zeal counted to Phinehas as everlasting righteousness is the same righteousness reckoned to Mattathias when he shows his anger according to judgment in 1 Maccabees 2:24.'),
  -- thread: 1-maccabees-2-die-rather-than-profane-sabbath
  ('apocrypha', '1-maccabees', 2, 37, 'apocrypha', '1-maccabees', 1, 63, 'extras', E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* The same choosing-to-die-rather-than-defile-the-covenant is the resolve of those who say let us die in our innocency in 1 Maccabees 2:37.'),
  ('apocrypha', '1-maccabees', 2, 38, 'canon', 'hebrews', 11, 37, 'free', E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* These slain saints of the faith-cloud are the very kind slaughtered with their wives and children on the sabbath in 1 Maccabees 2:38.'),
  ('apocrypha', '1-maccabees', 2, 38, 'canon', 'hebrews', 11, 38, 'free', E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful who wandered in deserts and caves are those who went down into the wilderness and were slain there in 1 Maccabees 2:38.'),
  -- thread: 1-maccabees-2-give-your-lives-for-the-covenant
  ('apocrypha', '1-maccabees', 2, 62, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The Messiah''s call not to fear the killer of the body is the very counsel Mattathias gives when he says fear not the words of a sinful man in 1 Maccabees 2:62.'),
  ('apocrypha', '1-maccabees', 2, 50, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* To give your lives for the covenant in 1 Maccabees 2:50 is to die for his laws in the hope that the King of the world will raise you up.'),
  ('apocrypha', '1-maccabees', 2, 63, 'canon', 'psalms', 37, 36, 'free', E'Psalm 37:36 — *Yet he passed away, and, lo, he was not: yea, I sought him, but he could not be found.* The wicked who passes away and cannot be found is the very fate Mattathias pronounces over the tyrant who today is lifted up and tomorrow shall not be found in 1 Maccabees 2:63.'),
  -- thread: 1-maccabees-2-rollcall-of-the-faithful
  ('apocrypha', '1-maccabees', 2, 52, 'canon', 'genesis', 15, 6, 'free', E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* This is the reckoning Mattathias recalls when he asks whether Abraham was not found faithful and it was imputed to him for righteousness in 1 Maccabees 2:52.'),
  ('apocrypha', '1-maccabees', 2, 52, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The trying of Abraham that Hebrews names is the temptation in which 1 Maccabees 2:52 says he was found faithful.'),
  ('apocrypha', '1-maccabees', 2, 57, 'canon', 'hebrews', 11, 33, 'free', E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* David and the faithful who subdued kingdoms through faith are the same fathers Mattathias rehearses, of whom David possessed the throne of an everlasting kingdom in 1 Maccabees 2:57.'),
  -- thread: 1-maccabees-2-elijah-three-children-daniel
  ('apocrypha', '1-maccabees', 2, 58, 'canon', 'james', 5, 17, 'free', E'James 5:17 — *Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months.* The zealous and fervent Elias whom Mattathias names in 1 Maccabees 2:58 is the same prophet James holds up as an example of fervent prayer.'),
  ('apocrypha', '1-maccabees', 2, 59, 'canon', 'daniel', 3, 17, 'free', E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* The confidence of the three is the believing by which 1 Maccabees 2:59 says Ananias, Azarias, and Misael were saved out of the flame.'),
  ('apocrypha', '1-maccabees', 2, 60, 'canon', 'daniel', 6, 22, 'free', E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* The shutting of the lions'' mouths for the innocency found in Daniel is exactly the deliverance 1 Maccabees 2:60 recalls.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-sanctuary-profaned',
       E'The sanctuary profaned — the abomination on the altar',
       E'Mattathias takes up the lament over a desecrated house: *And, behold, our sanctuary, even our beauty and our glory, is laid waste, and the Gentiles have profaned it.* (1 Maccabees 2:12). The same defilement is named a chapter before, when Antiochus'' men *set up the abomination of desolation upon the altar* (1 Maccabees 1:54) — and that abomination is no new thing under the sun. Daniel had foreseen it: *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31). And the Messiah Himself points to it still standing ahead: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). The kingdom of man profaning the holy place is the one antichrist pattern, from Antiochus to the end — the SYSTEM the faithful are called to refuse.',
       sv.verse_id, ev.verse_id, 'extras', 61525
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-zeal-of-phinehas',
       E'Inflamed with zeal — as Phinehas did',
       E'When an apostate steps forward to sacrifice on the heathen altar, Mattathias does not flinch: *Which thing when Mattathias saw, he was inflamed with zeal, and his reins trembled, neither could he forbear to shew his anger according to judgment: wherefore he ran, and slew him upon the altar.* (1 Maccabees 2:24), and the text names the pattern outright — *Thus dealt he zealously for the law of Yahuah (God) like as Phinees did to Zambri the son of Salom.* (1 Maccabees 2:26). The original act is in the Torah: *And when Phinehas, the son of Eleazar, the son of Aaron the priest, saw it, he rose up from among the congregation, and took a javelin in his hand;* (Numbers 25:7), and Yahuah seals it with a covenant — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* (Numbers 25:13). The Psalm preserves it as righteousness for ever: *Then stood up Phinehas, and executed judgment: and so the plague was stayed. And that was counted unto him for righteousness unto all generations for evermore.* (Psalm 106:30-31). It ain''t new — Mattathias'' zeal is Phinehas'' zeal, the same covenant jealousy for a holy people.',
       sv.verse_id, ev.verse_id, 'extras', 61528
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-die-rather-than-profane-sabbath',
       E'Let us die in our innocency — covenant kept unto death',
       E'Hunted into the wilderness and attacked on the sabbath, the faithful will not lift a hand to defile the day: *But they said, We will not come forth, neither will we do the king''s commandment, to profane the sabbath day.* (1 Maccabees 2:34); *But said, Let us die all in our innocency: heaven and earth will testify for us, that you put us to death wrongfully.* (1 Maccabees 2:37). This is Torah-faithfulness unto death, never law-as-curse — the same resolve named the chapter before, when the people *chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* (1 Maccabees 1:63). And it is the cloud Hebrews gathers: *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* (Hebrews 11:37) — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* (Hebrews 11:38). The Maccabean martyrs in the secret places of the wilderness are written into that very roll.',
       sv.verse_id, ev.verse_id, 'extras', 61531
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-give-your-lives-for-the-covenant',
       E'Be zealous for the law — give your lives for the covenant',
       E'Mattathias'' dying charge holds the whole framework in a line: *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* (1 Maccabees 2:50) — and he refuses fear of the tyrant: *Fear not then the words of a sinful man: for his glory shall be dung and worms.* (1 Maccabees 2:62); *To day he shall be lifted up and to morrow he shall not be found, because he is returned into his dust, and his thought is come to nothing.* (1 Maccabees 2:63). The Torah stands; the kingdom of man passes. The Messiah''s own word seals the charge: *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* (Matthew 10:28). And the better hope behind dying for the covenant is the resurrection his brethren confess — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9).',
       sv.verse_id, ev.verse_id, 'extras', 61534
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=50
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-rollcall-of-the-faithful',
       E'Call to remembrance the fathers — the same cloud of witnesses',
       E'Mattathias rehearses the fathers who were faithful in trial: *Call to remembrance what acts our fathers did in their time; so shall you receive great honour and an everlasting name.* (1 Maccabees 2:51) — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). It is the very roll Hebrews unrolls. Abraham reckoned righteous: *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6), tried at the altar — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* (Hebrews 11:17). David and the prophets: *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* (Hebrews 11:33). It ain''t new — the deathbed roll-call of 1 Maccabees and the faith-chapter of Hebrews are the same cloud of witnesses, the same covenant people kept.',
       sv.verse_id, ev.verse_id, 'extras', 61537
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=51
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=57
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-elijah-three-children-daniel',
       E'Elijah, the three children, Daniel — delivered by trust',
       E'The roll-call presses on to those delivered through fire and lions: *Elias for being zealous and fervent for the law was taken up into heaven.* (1 Maccabees 2:58) — *Ananias, Azarias, and Misael, by believing were saved out of the flame.* (1 Maccabees 2:59) — *Daniel for his innocency was delivered from the mouth of lions.* (1 Maccabees 2:60), and the lesson sealed: *And thus consider you throughout all ages, that none that put their trust in him shall be overcome.* (1 Maccabees 2:61). The accounts stand in the canon. Elijah''s fervent zeal: *Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months.* (James 5:17). The three saved out of the flame: *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* (Daniel 3:17). Daniel and the lions: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). None that trust are overcome — the same faithful witness, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61540
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=58
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=61
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-2-sanctuary-profaned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* This is the very profaning Mattathias mourns when he cries that the sanctuary is laid waste in 1 Maccabees 2:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-sanctuary-profaned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold the polluting of the holy place that 1 Maccabees 2:12 sees come to pass under Antiochus.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-sanctuary-profaned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah names the same desolating abomination as still to come, the antichrist pattern Mattathias already grieves in 1 Maccabees 2:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-sanctuary-profaned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-zeal-of-phinehas
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:7 — *And when Phinehas, the son of Eleazar, the son of Aaron the priest, saw it, he rose up from among the congregation, and took a javelin in his hand;* This is the deed 1 Maccabees 2:26 names as the very pattern of Mattathias'' zeal upon the altar.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting priesthood granted for Phinehas'' zeal is the covenant Mattathias the priest is acting in when he is inflamed with zeal in 1 Maccabees 2:26.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 106:30 — *Then stood up Phinehas, and executed judgment: and so the plague was stayed.* As Phinehas rose and executed judgment to stay the plague, so Mattathias rises and slays the apostate at the altar in 1 Maccabees 2:24.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 106:31 — *And that was counted unto him for righteousness unto all generations for evermore.* The zeal counted to Phinehas as everlasting righteousness is the same righteousness reckoned to Mattathias when he shows his anger according to judgment in 1 Maccabees 2:24.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-die-rather-than-profane-sabbath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* The same choosing-to-die-rather-than-defile-the-covenant is the resolve of those who say let us die in our innocency in 1 Maccabees 2:37.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-die-rather-than-profane-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* These slain saints of the faith-cloud are the very kind slaughtered with their wives and children on the sabbath in 1 Maccabees 2:38.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-die-rather-than-profane-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful who wandered in deserts and caves are those who went down into the wilderness and were slain there in 1 Maccabees 2:38.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-die-rather-than-profane-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-give-your-lives-for-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The Messiah''s call not to fear the killer of the body is the very counsel Mattathias gives when he says fear not the words of a sinful man in 1 Maccabees 2:62.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-give-your-lives-for-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* To give your lives for the covenant in 1 Maccabees 2:50 is to die for his laws in the hope that the King of the world will raise you up.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-give-your-lives-for-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=50
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:36 — *Yet he passed away, and, lo, he was not: yea, I sought him, but he could not be found.* The wicked who passes away and cannot be found is the very fate Mattathias pronounces over the tyrant who today is lifted up and tomorrow shall not be found in 1 Maccabees 2:63.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-give-your-lives-for-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-rollcall-of-the-faithful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* This is the reckoning Mattathias recalls when he asks whether Abraham was not found faithful and it was imputed to him for righteousness in 1 Maccabees 2:52.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-rollcall-of-the-faithful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The trying of Abraham that Hebrews names is the temptation in which 1 Maccabees 2:52 says he was found faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-rollcall-of-the-faithful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* David and the faithful who subdued kingdoms through faith are the same fathers Mattathias rehearses, of whom David possessed the throne of an everlasting kingdom in 1 Maccabees 2:57.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-rollcall-of-the-faithful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-elijah-three-children-daniel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:17 — *Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months.* The zealous and fervent Elias whom Mattathias names in 1 Maccabees 2:58 is the same prophet James holds up as an example of fervent prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-elijah-three-children-daniel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* The confidence of the three is the believing by which 1 Maccabees 2:59 says Ananias, Azarias, and Misael were saved out of the flame.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-elijah-three-children-daniel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* The shutting of the lions'' mouths for the innocency found in Daniel is exactly the deliverance 1 Maccabees 2:60 recalls.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-elijah-three-children-daniel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_03.sql (session253 1-maccabees 3) -----
-- Source anchor: apocrypha/1-maccabees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac3 (view _session253_1mac3_lookup). Sort band base 61550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-3-lion-of-judah-rises
  ('apocrypha', '1-maccabees', 3, 4, 'canon', 'genesis', 49, 9, 'free', E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Jacob''s blessing on Judah is the wellspring of the lion-imagery laid on Judas, the whelp of that tribe roaring against Israel''s oppressors.'),
  ('apocrypha', '1-maccabees', 3, 4, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion-whelp Judas points forward to the Lion of Judah Himself, who alone prevails to deliver His people utterly.'),
  -- thread: 1-maccabees-3-victory-not-in-the-host
  ('apocrypha', '1-maccabees', 3, 19, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan''s confidence at the garrison is the exact creed Judas preaches to his small company at Bethhoron.'),
  ('apocrypha', '1-maccabees', 3, 19, 'canon', '2-chronicles', 14, 11, 'free', E'2 Chronicles 14:11 — *And Asa cried unto Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee, and in thy name we go against this multitude. O Yahuah (LORD), thou art our Elohim (God); let not man prevail against thee.* Asa facing a million is Judas facing Seron''s host: the help of Yahuah makes the multitude and the few all one.'),
  ('apocrypha', '1-maccabees', 3, 19, 'canon', 'psalms', 33, 16, 'free', E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The Psalter states as settled doctrine the truth Judas applies on the field — the host saves no one; deliverance is from heaven.'),
  ('apocrypha', '1-maccabees', 3, 19, 'canon', 'zechariah', 4, 6, 'free', E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word to the rebuilder is the same word in the Maccabee''s mouth: strength comes not from the arm of flesh but from the Spirit of Yahuah.'),
  ('apocrypha', '1-maccabees', 3, 18, 'apocrypha', '2-maccabees', 8, 18, 'extras', E'2 Maccabees 8:18 — *For they, said he, trust in their weapons and boldness; but our confidence is in the Almighty who at a beck can cast down both them that come against us, and also all the world.* The sister-account preserves Judas confessing the very contrast he draws here — the enemy''s multitude against the Almighty who delivers with great host or small.'),
  -- thread: 1-maccabees-3-we-fight-for-our-lives-and-our-laws
  ('apocrypha', '1-maccabees', 3, 21, 'canon', 'deuteronomy', 32, 47, 'free', E'Deuteronomy 32:47 — *For it is not a vain thing for you; because it is your life: and through this thing ye shall prolong your days in the land, whither ye go over Jordan to possess it.* Moses called the law Israel''s very life, which is precisely why the Maccabees would die fighting for their laws rather than see them abolished.'),
  ('apocrypha', '1-maccabees', 3, 60, 'canon', 'matthew', 26, 39, 'free', E'Matthew 26:39 — *And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* Judas'' surrender of the battle''s outcome to heaven''s will foreshadows the Messiah''s own Gethsemane submission, the same heart that bows to the Father against the kingdom of man.'),
  -- thread: 1-maccabees-3-antiochus-roots-out-the-strength-of-israel
  ('apocrypha', '1-maccabees', 3, 35, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold Antiochus'' very decree to pollute the sanctuary and abolish the law that Judas now rises to resist.'),
  ('apocrypha', '1-maccabees', 3, 35, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reads Antiochus'' desolation as the type of the last abomination, the same kingdom-of-man system the Maccabees confronted made manifest again.'),
  ('apocrypha', '1-maccabees', 3, 29, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Antiochus'' war on the ancient laws is the same self-exalting man-of-sin pattern Paul names — the antichrist system, not merely one tyrant.'),
  -- thread: 1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh
  ('apocrypha', '1-maccabees', 3, 44, 'canon', '2-chronicles', 20, 3, 'free', E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* Jehoshaphat''s proclaimed fast before the great company is the very pattern the congregation keeps at Mizpeh before facing Antiochus'' host.'),
  ('apocrypha', '1-maccabees', 3, 53, 'canon', '2-chronicles', 20, 12, 'free', E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s plea of helplessness with eyes fixed on Yahuah is the same cry the assembly raises — except thou be our help, how shall we stand?'),
  ('apocrypha', '1-maccabees', 3, 47, 'canon', 'joel', 2, 15, 'free', E'Joel 2:15 — *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly:* Joel''s command for a sanctified fast and solemn assembly is fulfilled to the letter at Mizpeh, where they fast, mourn, and then sound the trumpets.'),
  ('apocrypha', '1-maccabees', 3, 45, 'apocrypha', '1-maccabees', 1, 39, 'extras', E'1 Maccabees 1:39 — *Her sanctuary was laid waste like a wilderness, her feasts were turned into mourning, her sabbaths into reproach her honour into contempt.* The opening lament over the desolated sanctuary and silenced feasts is the grief now driving the congregation to fast and pray for the city laid void as a wilderness.'),
  -- thread: 1-maccabees-3-captains-of-thousands-and-the-war-exemptions
  ('apocrypha', '1-maccabees', 3, 55, 'canon', 'exodus', 18, 21, 'free', E'Exodus 18:21 — *Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens:* Jethro''s counsel to Moses set the very ranks of thousands, hundreds, fifties, and tens that Judas now ordains over his army.'),
  ('apocrypha', '1-maccabees', 3, 56, 'canon', 'deuteronomy', 20, 5, 'free', E'Deuteronomy 20:5 — *And the officers shall speak unto the people, saying, What man is there that hath built a new house, and hath not dedicated it? let him go and return to his house, lest he die in the battle, and another man dedicate it.* The Torah''s release of the man with a new house is the first of the exemptions Judas keeps to the letter, sending such men home according to the law.'),
  ('apocrypha', '1-maccabees', 3, 56, 'canon', 'deuteronomy', 20, 8, 'free', E'Deuteronomy 20:8 — *And the officers shall speak further unto the people, and they shall say, What man is there that is fearful and fainthearted? let him go and return unto his house, lest his brethren''s heart faint as well as his heart.* The dismissal of the fearful in Judas'' muster comes straight from this war-statute, the Maccabee ordering his camp according to the law of Moses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-lion-of-judah-rises',
       E'Judas the lion-whelp rises in his father''s stead',
       E'Mattathias is gathered to his fathers and his son takes up the zeal: *Then his son Judas, called Maccabeus, rose up in his stead. And all his brothers helped him... and they fought with cheerfulness the battle of Yashar''el (Israel)* (1 Maccabees 3:1-2). Of him the chronicler writes, *In his acts he was like a lion, and like a lion''s whelp roaring for his prey* (1 Maccabees 3:4) — and that figure is no accident, for it is the very blessing Jacob laid on the tribe from which the Hasmoneans came: *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9). The lion of Judah stirs against the kingdom of man, *destroying the ungodly... and turning away wrath from Yashar''el (Israel)* (1 Maccabees 3:8) — the same Lion who at the last *hath prevailed to open the book*: *Behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book* (Revelation 5:5). This is no new thing; the covenant seed is kept, and one whelp of Judah after another roars until the Lion Himself comes.',
       sv.verse_id, ev.verse_id, 'extras', 61550
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-victory-not-in-the-host',
       E'The victory standeth not in the multitude, but strength cometh from heaven',
       E'★ At Bethhoron the few faced the many, faint with fasting, and asked *How shall we be able, being so few, to fight against so great a multitude...?* (1 Maccabees 3:17). Judas answered with the marrow of the whole Scripture: *It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company: For the victory of battle stands not in the multitude of an host; but strength comes from heaven* (1 Maccabees 3:18-19). It ain''t new. Jonathan said it at the garrison: *there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). Asa cried it before the million of Zerah: *it is nothing with thee to help, whether with many, or with them that have no power... let not man prevail against thee* (2 Chronicles 14:11). The Psalmist sang it: *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalm 33:16). And the prophet sealed it as the word of Yahuah: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The brother-book confesses the same against the kingdom of man: *they trust in their weapons and boldness; but our confidence is in the Almighty* (2 Maccabees 8:18). The arm of flesh fails; strength comes from heaven.',
       sv.verse_id, ev.verse_id, 'extras', 61553
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-we-fight-for-our-lives-and-our-laws',
       E'We fight for our lives and our laws — the covenant unto death',
       E'The Maccabean cause is not empire but covenant: *They come against us in much pride and iniquity to destroy us, and our wives and children, and to spoil us: But we fight for our lives and our laws* (1 Maccabees 3:20-21). This is Torah-faithfulness unto death — never law-as-curse, but the law loved as life against the kingdom of man that would abolish it. So Judas resolves the host before Emmaus: *it is better for us to die in battle, than to behold the calamities of our people and our sanctuary* (1 Maccabees 3:59), bowing all to heaven, *as the will of Yahuah (God) is in heaven, so let him do* (1 Maccabees 3:60) — the very prayer the Messiah would pray, *not as I will, but as thou wilt* (Matthew 26:39). They fought for the law because, as Moses charged, *it is not a vain thing for you; because it is your life* (Deuteronomy 32:47). To die rather than see the covenant trodden down is the witness of the seed kept.',
       sv.verse_id, ev.verse_id, 'extras', 61556
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-antiochus-roots-out-the-strength-of-israel',
       E'Antiochus decrees to root out Israel and abolish the law — the abomination',
       E'The kingdom of man shows its true face: Antiochus charges Lysias *that he should send an army against them, to destroy and root out the strength of Yashar''el (Israel), and the remnant of Jerusalem, and to take away their memorial from that place* (1 Maccabees 3:35), the same king who waged war *in taking away the laws which had been of old time* (1 Maccabees 3:29). This is the antichrist pattern Daniel saw long before Antiochus came: *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31). The Messiah Himself reaches back through Antiochus to the end: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place...* (Matthew 24:15). It is the same system in every age — the man of sin who *opposeth and exalteth himself above all that is called Elohim* (2 Thessalonians 2:4). What the Maccabees fought is what the saints will yet overcome: the dismantling of the kingdom of man, not the people of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 61559
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh',
       E'Fasting in sackcloth at Mizpeh — the assembly that asks mercy before battle',
       E'★ Before they draw the sword they bow the knee: the congregation gathers *that they might pray, and ask mercy and compassion* (1 Maccabees 3:44), mourning that *Jerusalem lay void as a wilderness... and joy was taken from Jacob, and the pipe with the harp ceased* (1 Maccabees 3:45). At Mizpeh, the old place of prayer, *Then they fasted that day, and put on sackcloth, and cast ashes upon their heads, and rent their clothes* (1 Maccabees 3:47), crying *How shall we be able to stand against them, except you, O Yahuah (God), be our help?* (1 Maccabees 3:53). This is no new liturgy. Jehoshaphat did exactly so against the great company: *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3), pleading *we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee* (2 Chronicles 20:12). And the prophet Joel commanded the very assembly the Maccabees keep: *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15) — the trumpet they then sound (1 Maccabees 3:54). The sanctuary laid waste, the feasts turned to mourning, was already lamented in the first chapter: *Her sanctuary was laid waste like a wilderness, her feasts were turned into mourning, her sabbaths into reproach* (1 Maccabees 1:39). The covenant people seek mercy first; the battle belongs to Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 61562
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-captains-of-thousands-and-the-war-exemptions',
       E'Captains over thousands and the Torah war-exemptions kept',
       E'Judas orders the host by the pattern Moses set in the wilderness: *Then Judas ordained captains over the people, even captains over thousands, and over hundreds, and over fifties, and over tens* (1 Maccabees 3:55) — the very ranks Jethro counselled and Moses appointed: *and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens* (Exodus 18:21). And his muster keeps the law''s own mercy, sending home *such as were building houses, or had betrothed wives, or were planting vineyards, or were fearful... every man to his own house, according to the law* (1 Maccabees 3:56). It ain''t new — this is Deuteronomy''s war-charge word for word: the officers release *what man is there that hath built a new house... that hath planted a vineyard... that hath betrothed a wife... that is fearful and fainthearted* (Deuteronomy 20:5-8). Even in his rising the Maccabee fights *according to the law*, the covenant kept down to the order of the camp.',
       sv.verse_id, ev.verse_id, 'extras', 61565
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=55
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=56
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-3-lion-of-judah-rises
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Jacob''s blessing on Judah is the wellspring of the lion-imagery laid on Judas, the whelp of that tribe roaring against Israel''s oppressors.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-lion-of-judah-rises'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion-whelp Judas points forward to the Lion of Judah Himself, who alone prevails to deliver His people utterly.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-lion-of-judah-rises'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-victory-not-in-the-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan''s confidence at the garrison is the exact creed Judas preaches to his small company at Bethhoron.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 14:11 — *And Asa cried unto Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee, and in thy name we go against this multitude. O Yahuah (LORD), thou art our Elohim (God); let not man prevail against thee.* Asa facing a million is Judas facing Seron''s host: the help of Yahuah makes the multitude and the few all one.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The Psalter states as settled doctrine the truth Judas applies on the field — the host saves no one; deliverance is from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word to the rebuilder is the same word in the Maccabee''s mouth: strength comes not from the arm of flesh but from the Spirit of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 8:18 — *For they, said he, trust in their weapons and boldness; but our confidence is in the Almighty who at a beck can cast down both them that come against us, and also all the world.* The sister-account preserves Judas confessing the very contrast he draws here — the enemy''s multitude against the Almighty who delivers with great host or small.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=8 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-we-fight-for-our-lives-and-our-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:47 — *For it is not a vain thing for you; because it is your life: and through this thing ye shall prolong your days in the land, whither ye go over Jordan to possess it.* Moses called the law Israel''s very life, which is precisely why the Maccabees would die fighting for their laws rather than see them abolished.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-we-fight-for-our-lives-and-our-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 26:39 — *And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* Judas'' surrender of the battle''s outcome to heaven''s will foreshadows the Messiah''s own Gethsemane submission, the same heart that bows to the Father against the kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-we-fight-for-our-lives-and-our-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-antiochus-roots-out-the-strength-of-israel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold Antiochus'' very decree to pollute the sanctuary and abolish the law that Judas now rises to resist.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-antiochus-roots-out-the-strength-of-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reads Antiochus'' desolation as the type of the last abomination, the same kingdom-of-man system the Maccabees confronted made manifest again.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-antiochus-roots-out-the-strength-of-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Antiochus'' war on the ancient laws is the same self-exalting man-of-sin pattern Paul names — the antichrist system, not merely one tyrant.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-antiochus-roots-out-the-strength-of-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* Jehoshaphat''s proclaimed fast before the great company is the very pattern the congregation keeps at Mizpeh before facing Antiochus'' host.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s plea of helplessness with eyes fixed on Yahuah is the same cry the assembly raises — except thou be our help, how shall we stand?'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:15 — *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly:* Joel''s command for a sanctified fast and solemn assembly is fulfilled to the letter at Mizpeh, where they fast, mourn, and then sound the trumpets.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:39 — *Her sanctuary was laid waste like a wilderness, her feasts were turned into mourning, her sabbaths into reproach her honour into contempt.* The opening lament over the desolated sanctuary and silenced feasts is the grief now driving the congregation to fast and pray for the city laid void as a wilderness.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=45
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-captains-of-thousands-and-the-war-exemptions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 18:21 — *Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens:* Jethro''s counsel to Moses set the very ranks of thousands, hundreds, fifties, and tens that Judas now ordains over his army.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-captains-of-thousands-and-the-war-exemptions'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 20:5 — *And the officers shall speak unto the people, saying, What man is there that hath built a new house, and hath not dedicated it? let him go and return to his house, lest he die in the battle, and another man dedicate it.* The Torah''s release of the man with a new house is the first of the exemptions Judas keeps to the letter, sending such men home according to the law.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-captains-of-thousands-and-the-war-exemptions'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 20:8 — *And the officers shall speak further unto the people, and they shall say, What man is there that is fearful and fainthearted? let him go and return unto his house, lest his brethren''s heart faint as well as his heart.* The dismissal of the fearful in Judas'' muster comes straight from this war-statute, the Maccabee ordering his camp according to the law of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-captains-of-thousands-and-the-war-exemptions'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_04.sql (session253 1-maccabees 4) -----
-- Source anchor: apocrypha/1-maccabees ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac4 (view _session253_1mac4_lookup). Sort band base 61575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-4-cry-to-heaven-red-sea
  ('apocrypha', '1-maccabees', 4, 9, 'canon', 'exodus', 14, 13, 'free', E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* Judas names this very Red-Sea deliverance as the ground of his hope in 1 Maccabees 4:9.'),
  ('apocrypha', '1-maccabees', 4, 9, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The fathers stood still while Yahuah fought Pharaoh, the pattern Judas invokes in 1 Maccabees 4:9.'),
  ('apocrypha', '1-maccabees', 4, 11, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* David''s confession that the battle is Yahuah''s matches Judas'' aim in 1 Maccabees 4:11, that all the heathen may know there is one who saves Yashar''el.'),
  -- thread: 1-maccabees-4-the-war-of-faith
  ('apocrypha', '1-maccabees', 4, 34, 'canon', 'hebrews', 11, 34, 'free', E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The praise of those who turned the armies of the aliens to flight reads as a portrait of the Maccabean victory of 1 Maccabees 4:34.'),
  ('apocrypha', '1-maccabees', 4, 30, 'canon', 'hebrews', 11, 33, 'free', E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* — the faith that subdued kingdoms is the faith of Judas, who prays for the host to be given into his hand in 1 Maccabees 4:30.'),
  ('apocrypha', '1-maccabees', 4, 30, 'canon', '1-samuel', 17, 45, 'free', E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* Judas appeals to this very deliverance by the hand of David in 1 Maccabees 4:30.'),
  -- thread: 1-maccabees-4-song-of-thanksgiving-mercy
  ('apocrypha', '1-maccabees', 4, 24, 'canon', 'psalms', 136, 1, 'free', E'Psalm 136:1 — *O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever.* The song of thanksgiving in 1 Maccabees 4:24 quotes this hallel refrain exactly — because it is good, because his mercy endureth forever.'),
  ('apocrypha', '1-maccabees', 4, 24, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The delivered army''s song in 1 Maccabees 4:24 is the song of the sea sung again after a like deliverance.'),
  -- thread: 1-maccabees-4-cleanse-the-sanctuary
  ('apocrypha', '1-maccabees', 4, 38, 'canon', 'daniel', 8, 14, 'free', E'Daniel 8:14 — *And he said unto me, Unto two thousand and three hundred days; then shall the sanctuary be cleansed.* Daniel''s promise that the sanctuary would be cleansed is fulfilled in the cleansing Judas begins at the desolate sanctuary of 1 Maccabees 4:38.'),
  ('apocrypha', '1-maccabees', 4, 38, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The profaned altar and desolate sanctuary of 1 Maccabees 4:38 is the same abomination of desolation the Messiah warns would stand again.'),
  ('apocrypha', '1-maccabees', 4, 43, 'canon', '2-chronicles', 29, 15, 'free', E'2 Chronicles 29:15 — *And they gathered their brethren, and sanctified themselves, and came, according to the commandment of the king, by the words of Yahuah (LORD), to cleanse the house of Yahuah (LORD).* Hezekiah''s gathering of blameless brethren to cleanse the house is the very work the chosen priests do in 1 Maccabees 4:43.'),
  -- thread: 1-maccabees-4-altar-of-whole-stones
  ('apocrypha', '1-maccabees', 4, 47, 'canon', 'exodus', 20, 25, 'free', E'Exodus 20:25 — *And if thou wilt make me an altar of stone, thou shalt not build it of hewn stone: for if thou lift up thy tool upon it, thou hast polluted it.* The whole, unhewn stones of the new altar in 1 Maccabees 4:47 are built exactly to this Sinai command.'),
  ('apocrypha', '1-maccabees', 4, 47, 'canon', 'deuteronomy', 27, 6, 'free', E'Deuteronomy 27:6 — *Thou shalt build the altar of Yahuah Elohayka (the LORD thy God) of whole stones: and thou shalt offer burnt offerings thereon unto Yahuah Elohayka (the LORD thy God):* The Maccabees'' new altar of whole stones for burnt offerings in 1 Maccabees 4:47 keeps this Torah ordinance.'),
  ('apocrypha', '1-maccabees', 4, 48, 'canon', 'exodus', 40, 10, 'free', E'Exodus 40:10 — *And thou shalt anoint the altar of the burnt offering, and all his vessels, and sanctify the altar: and it shall be an altar most holy.* The hallowing of the sanctuary and its vessels in 1 Maccabees 4:48 repeats the first sanctifying of the altar and its vessels.'),
  -- thread: 1-maccabees-4-feast-of-dedication
  ('apocrypha', '1-maccabees', 4, 59, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The eight-day dedication the Maccabees ordain forever in 1 Maccabees 4:59 is the very feast of the dedication the Messiah is found keeping.'),
  ('apocrypha', '1-maccabees', 4, 59, 'canon', 'john', 10, 23, 'free', E'John 10:23 — *And Yahusha (Jesus) walked in the temple in Solomon''s porch.* The Messiah himself walks in the temple at the feast 1 Maccabees 4:59 commands to be kept from year to year.'),
  ('apocrypha', '1-maccabees', 4, 54, 'canon', 'psalms', 30, 11, 'free', E'Psalm 30:11 — *Thou hast turned for me my mourning into dancing: thou hast put off my sackcloth, and girded me with gladness;* This song at the dedication of the house matches the dedication kept with songs and gladness in 1 Maccabees 4:54.'),
  ('apocrypha', '1-maccabees', 4, 56, 'apocrypha', '2-maccabees', 10, 6, 'extras', E'2 Maccabees 10:6 — *And they kept the eight days with gladness, as in the feast of the tabernacles, remembering that not long afore they had held the feast of the tabernacles, when as they wandered in the mountains and dens like beasts.* The sister-account confirms the same eight days of gladness that 1 Maccabees 4:56 records.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-4-cry-to-heaven-red-sea',
       E'Cry to heaven — delivered as at the Red Sea',
       E'Outnumbered and ill-armed, Judas turns the men not to their swords but to the covenant: *Remember how our fathers were delivered in the Red sea, when Pharaoh pursued them with an army. Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day* (1 Maccabees 4:9-10). It is the very posture of the deliverance he names: *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day* (Exodus 14:13), for *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). The plea rests on remembered covenant, not on the strength of the camp — *That so all the heathen may know that there is one who delivers and saves Yashar''el (Israel))* (1 Maccabees 4:11), the same confession David carried into the valley: *for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). It ain''t new: the same Elohim who drowned Pharaoh routs the host at Emmaus.',
       sv.verse_id, ev.verse_id, 'extras', 61575
  FROM _session253_1mac4_lookup sv, _session253_1mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-4-the-war-of-faith',
       E'Turned to flight the armies of the aliens',
       E'Three thousand without armour scatter the harnessed host, and the next year ten thousand break the sixty thousand of Lysias: *So they joined battle; and there were slain of the host of Lysias about five thousand men, even before them were they slain* (1 Maccabees 4:34). This is the war of faith the cloud of witnesses is praised for: *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33), they *escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens* (Hebrews 11:34). Before the battle Judas prays to the one who threw down Goliath: *Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David* (1 Maccabees 4:30) — the same name David carried: *but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel)* (1 Samuel 17:45). Hebrews 11 is not pointing at a church but at this very seed kept through the sword.',
       sv.verse_id, ev.verse_id, 'extras', 61578
  FROM _session253_1mac4_lookup sv, _session253_1mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=4 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-4-song-of-thanksgiving-mercy',
       E'His mercy endureth forever',
       E'Returning from the rout, the people do what Yashar''el has always done after deliverance — they sing: *After this they went home, and sung a song of thanksgiving, and praised Yahuah (God) in heaven: because it is good, because his mercy endureth forever* (1 Maccabees 4:24). The refrain is lifted word for word from the great hallel: *O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever* (Psalm 136:1). And the song itself is the song of the sea Judas had just remembered: *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD)... I will sing unto Yahuah (LORD), for he hath triumphed gloriously* (Exodus 15:1). It ain''t new — the song of Moses is still the song in the mouth of the delivered remnant.',
       sv.verse_id, ev.verse_id, 'extras', 61581
  FROM _session253_1mac4_lookup sv, _session253_1mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-4-cleanse-the-sanctuary',
       E'Let us go up to cleanse the sanctuary',
       E'With the enemy discomfited, Judas turns to the desolated house: *Behold, our enemies are discomfited: let us go up to cleanse and dedicate the sanctuary* (1 Maccabees 4:36). They find it ruined — *the sanctuary desolate, and the altar profaned, and the gates burned up, and shrubs growing in the courts as in a forest* (1 Maccabees 4:38) — the abomination Daniel foresaw: *How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* with its promised end, *then shall the sanctuary be cleansed* (Daniel 8:13-14). It is the desolation the Messiah named as still to come: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* (Matthew 24:15). And the cleansing is no new rite — it is Hezekiah''s again: *And they gathered their brethren, and sanctified themselves, and came, according to the commandment of the king, by the words of Yahuah (LORD), to cleanse the house of Yahuah (LORD)* (2 Chronicles 29:15). Antiochus is the man-of-sin''s type — the SYSTEM dismantled, the house reclaimed.',
       sv.verse_id, ev.verse_id, 'extras', 61584
  FROM _session253_1mac4_lookup sv, _session253_1mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=4 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-4-altar-of-whole-stones',
       E'Whole stones according to the law',
       E'The defiled altar of burnt offerings they will not reuse — *they pulled it down, And laid up the stones in the mountain of the temple in a convenient place, until there should come a prophet to shew what should be done with them* (1 Maccabees 4:45-46). Then they build by the book: *Then they took whole stones according to the law, and built a new altar according to the former* (1 Maccabees 4:47). The law they keep is Sinai''s: *And if thou wilt make me an altar of stone, thou shalt not build it of hewn stone: for if thou lift up thy tool upon it, thou hast polluted it* (Exodus 20:25), repeated for the land: *Thou shalt build the altar of Yahuah Elohayka (the LORD thy God) of whole stones* (Deuteronomy 27:6). And the hallowing of the new sanctuary and its vessels (1 Maccabees 4:48-49) follows the first hallowing: *And thou shalt anoint the altar of the burnt offering, and all his vessels, and sanctify the altar: and it shall be an altar most holy* (Exodus 40:10). Torah-faithfulness even in the rubble — the seed keeps the commandment, not law-as-curse but law as the very form of the new altar.',
       sv.verse_id, ev.verse_id, 'extras', 61587
  FROM _session253_1mac4_lookup sv, _session253_1mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=47
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=4 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-4-feast-of-dedication',
       E'The feast of the dedication — eight days with gladness',
       E'On the very day the heathen had defiled it, the altar is dedicated: *Look, at what time and what day the heathen had profaned it, even in that was it dedicated with songs, and citherns, and harps, and cymbals* (1 Maccabees 4:54), *And so they kept the dedication of the altar eight days and offered burnt offerings with gladness* (1 Maccabees 4:56), and they ordain *that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days* (1 Maccabees 4:59). This is Hanukkah — and the Messiah himself kept it: *And it was at Jerusalem the feast of the dedication, and it was winter. And Yahusha (Jesus) walked in the temple in Solomon''s porch* (John 10:22-23). Its sister-book records the same eight days: *And they kept the eight days with gladness, as in the feast of the tabernacles* (2 Maccabees 10:6). And dedicating the house with songs is itself a Davidic title — *a song at the dedication of the house*: *Thou hast turned for me my mourning into dancing: thou hast put off my sackcloth, and girded me with gladness* (Psalm 30:11). The feast kept here is the feast the Messiah walked in — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61590
  FROM _session253_1mac4_lookup sv, _session253_1mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=54
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=4 AND ev.verse_number=59
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-4-cry-to-heaven-red-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* Judas names this very Red-Sea deliverance as the ground of his hope in 1 Maccabees 4:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-cry-to-heaven-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The fathers stood still while Yahuah fought Pharaoh, the pattern Judas invokes in 1 Maccabees 4:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-cry-to-heaven-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* David''s confession that the battle is Yahuah''s matches Judas'' aim in 1 Maccabees 4:11, that all the heathen may know there is one who saves Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-cry-to-heaven-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-4-the-war-of-faith
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The praise of those who turned the armies of the aliens to flight reads as a portrait of the Maccabean victory of 1 Maccabees 4:34.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-the-war-of-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* — the faith that subdued kingdoms is the faith of Judas, who prays for the host to be given into his hand in 1 Maccabees 4:30.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-the-war-of-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* Judas appeals to this very deliverance by the hand of David in 1 Maccabees 4:30.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-the-war-of-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-4-song-of-thanksgiving-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 136:1 — *O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever.* The song of thanksgiving in 1 Maccabees 4:24 quotes this hallel refrain exactly — because it is good, because his mercy endureth forever.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-song-of-thanksgiving-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The delivered army''s song in 1 Maccabees 4:24 is the song of the sea sung again after a like deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-song-of-thanksgiving-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-4-cleanse-the-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 8:14 — *And he said unto me, Unto two thousand and three hundred days; then shall the sanctuary be cleansed.* Daniel''s promise that the sanctuary would be cleansed is fulfilled in the cleansing Judas begins at the desolate sanctuary of 1 Maccabees 4:38.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-cleanse-the-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The profaned altar and desolate sanctuary of 1 Maccabees 4:38 is the same abomination of desolation the Messiah warns would stand again.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-cleanse-the-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 29:15 — *And they gathered their brethren, and sanctified themselves, and came, according to the commandment of the king, by the words of Yahuah (LORD), to cleanse the house of Yahuah (LORD).* Hezekiah''s gathering of blameless brethren to cleanse the house is the very work the chosen priests do in 1 Maccabees 4:43.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-cleanse-the-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=29 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-4-altar-of-whole-stones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:25 — *And if thou wilt make me an altar of stone, thou shalt not build it of hewn stone: for if thou lift up thy tool upon it, thou hast polluted it.* The whole, unhewn stones of the new altar in 1 Maccabees 4:47 are built exactly to this Sinai command.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-altar-of-whole-stones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 27:6 — *Thou shalt build the altar of Yahuah Elohayka (the LORD thy God) of whole stones: and thou shalt offer burnt offerings thereon unto Yahuah Elohayka (the LORD thy God):* The Maccabees'' new altar of whole stones for burnt offerings in 1 Maccabees 4:47 keeps this Torah ordinance.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-altar-of-whole-stones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 40:10 — *And thou shalt anoint the altar of the burnt offering, and all his vessels, and sanctify the altar: and it shall be an altar most holy.* The hallowing of the sanctuary and its vessels in 1 Maccabees 4:48 repeats the first sanctifying of the altar and its vessels.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-altar-of-whole-stones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-4-feast-of-dedication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The eight-day dedication the Maccabees ordain forever in 1 Maccabees 4:59 is the very feast of the dedication the Messiah is found keeping.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-feast-of-dedication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:23 — *And Yahusha (Jesus) walked in the temple in Solomon''s porch.* The Messiah himself walks in the temple at the feast 1 Maccabees 4:59 commands to be kept from year to year.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-feast-of-dedication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 30:11 — *Thou hast turned for me my mourning into dancing: thou hast put off my sackcloth, and girded me with gladness;* This song at the dedication of the house matches the dedication kept with songs and gladness in 1 Maccabees 4:54.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-feast-of-dedication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 10:6 — *And they kept the eight days with gladness, as in the feast of the tabernacles, remembering that not long afore they had held the feast of the tabernacles, when as they wandered in the mountains and dens like beasts.* The sister-account confirms the same eight days of gladness that 1 Maccabees 4:56 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac4_lookup sv, _session253_1mac4_lookup tv
 WHERE t.slug='1-maccabees-4-feast-of-dedication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=4 AND sv.verse_number=56
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_05.sql (session253 1-maccabees 5) -----
-- Source anchor: apocrypha/1-maccabees ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac5 (view _session253_1mac5_lookup). Sort band base 61600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-5-brethren-regathered
  ('apocrypha', '1-maccabees', 5, 45, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Judas gathering the Israelites of Galaad back into Judea is the Torah''s gathering-promise enacted in miniature.'),
  ('apocrypha', '1-maccabees', 5, 45, 'canon', 'deuteronomy', 30, 4, 'free', E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The brethren fetched out of Bosora, Maked, and Carnaim answer to the promise that none of His are too far driven to be brought home.'),
  ('apocrypha', '1-maccabees', 5, 23, 'canon', 'jeremiah', 31, 10, 'free', E'Jeremiah 31:10 — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* Simon bringing those of Galilee with their wives and children into Judea with great joy is the Shepherd gathering His flock.'),
  ('apocrypha', '1-maccabees', 5, 9, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The heathen assembling to destroy the Israelites only sets the stage for the LORD''s own promise to take His children from among the heathen.'),
  ('apocrypha', '1-maccabees', 5, 45, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The dispersed brethren of Galaad assembled from the least to the greatest foreshadow the assembling of the outcasts from the four corners.'),
  -- thread: 1-maccabees-5-the-battle-is-yahuahs
  ('apocrypha', '1-maccabees', 5, 33, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Judas crying with prayer against Timotheus'' great host owns the same truth — the battle belongs to Elohim, not the multitude.'),
  ('apocrypha', '1-maccabees', 5, 33, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* The trumpets and prayer of Judas'' three companies confess what David confessed before Goliath: the LORD saveth not by the sword.'),
  ('apocrypha', '1-maccabees', 5, 33, 'canon', 'exodus', 17, 11, 'free', E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar''el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* Judas prevailing as he cried with prayer is the lifted hands of Moses over Amalek again — the victory flows from heaven, not the arm.'),
  ('apocrypha', '1-maccabees', 5, 33, 'apocrypha', '1-maccabees', 4, 10, 'extras', E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day.* The same crying to heaven and pleading the covenant that armed Judas at Emmaus arms him again at Carnaim.'),
  -- thread: 1-maccabees-5-mount-sion-with-joy
  ('apocrypha', '1-maccabees', 5, 54, 'canon', 'jeremiah', 31, 11, 'free', E'Jeremiah 31:11 — *For Yahuah (LORD) hath redeemed Jacob, and ransomed him from the hand of him that was stronger than he.* Going up to Sion with joy, not one slain, is Jacob ransomed from the hand of the stronger — the heathen host that would have consumed them.'),
  ('apocrypha', '1-maccabees', 5, 23, 'canon', 'zechariah', 10, 9, 'free', E'Zechariah 10:9 — *And I will sow them among the people: and they shall remember me in far countries; and they shall live with their children, and turn again.* The brethren of Galilee brought back with their wives and children, turning again to Judea, are the sown remnant remembering and returning.'),
  ('apocrypha', '1-maccabees', 5, 54, 'canon', 'john', 10, 16, 'free', E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The scattered brethren gathered to mount Sion prefigure the one fold the Shepherd Himself goes out to bring home.'),
  -- thread: 1-maccabees-5-the-appointed-deliverer
  ('apocrypha', '1-maccabees', 5, 62, 'apocrypha', '2-maccabees', 8, 23, 'extras', E'2 Maccabees 8:23 — *Also he appointed Eleazar to read the holy book: and when he had given them this watchword, The help of Yahuah (God); himself leading the first band,* The watchword ''The help of Yahuah'' is exactly what Joseph and Azarias forsook when they went out to get themselves a name rather than wait on the appointed hand.'),
  ('apocrypha', '1-maccabees', 5, 60, 'apocrypha', '2-maccabees', 8, 24, 'extras', E'2 Maccabees 8:24 — *And by the help of the Almighty they slew above nine thousand of their enemies, and wounded and maimed the most part of Nicanor''s host, and so put all to flight;* Where the Almighty''s help is sought there is great slaughter of the enemy; where it is presumed upon, two thousand of Israel fall instead.'),
  ('apocrypha', '1-maccabees', 5, 62, 'apocrypha', '1-maccabees', 4, 30, 'extras', E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* Deliverance comes by the chosen hand — David''s, Jonathan''s, Judas'' — not by men who came not of that seed.'),
  ('apocrypha', '1-maccabees', 5, 61, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The overthrow of those who sought a name for themselves underscores that the battle is the LORD''s, won by obedience, not self-willed valour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-brethren-regathered',
       E'Deliver our brethren — the covenant people gathered out of the nations',
       E'Hemmed in among the heathen of Galaad and Galilee, the besieged brethren send to Judas: *Come now therefore, and deliver us from their hands, for many of us are slain* (1 Maccabees 5:12), and he goes out to bring them home — *Then Judas gathered together all the Israelites that were in the country of Galaad, from the least to the greatest, even their wives, and their children, and their stuff, a very great host, to the end they might come into the land of Judea* (1 Maccabees 5:45). This is no new thing under Antiochus'' sword; it is the ancient promise unfolding. Moses had sworn it from the first: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3), *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee* (Deuteronomy 30:4). The prophets carry the same word — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10); *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The Maccabean rescue is a small, true picture of the great Ingathering — not a church replacing the seed but the very children of Jacob kept: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21).',
       sv.verse_id, ev.verse_id, 'extras', 61600
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-the-battle-is-yahuahs',
       E'They cried with prayer — for the battle is the LORD''s',
       E'When the battle was joined Judas did not trust in numbers but in heaven: *So he went forth behind them in three companies, who sounded their trumpets, and cried with prayer* (1 Maccabees 5:33). It is the old way of war in Yashar''el, where the sword is lifted but the victory is owned to Yahuah. So Jehoshaphat was told, *Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15), and the issue was *set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you* (2 Chronicles 20:17). David said it over Goliath — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47) — and Moses showed it with lifted hands: *And it came to pass, when Moses held up his hand, that Yashar''el (Israel) prevailed: and when he let down his hand, Amalek prevailed* (Exodus 17:11). The Maccabees carry the same testimony in the same chapter: *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day* (1 Maccabees 4:10).',
       sv.verse_id, ev.verse_id, 'extras', 61603
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-mount-sion-with-joy',
       E'Up to mount Sion with joy — the redeemed brought home',
       E'The deliverance ends where every true gathering ends — at the holy mountain, in worship and gladness: *So they went up to mount Sion with joy and gladness, where they offered burnt offerings, because not one of them were slain until they had returned in peace* (1 Maccabees 5:54). Simon''s company likewise *brought them into Judea with great joy* (1 Maccabees 5:23). This is the prophets'' very note — the ransom of Jacob ending in singing on the height of Zion: *For Yahuah (LORD) hath redeemed Jacob, and ransomed him from the hand of him that was stronger than he* (Jeremiah 31:11). The returning are not a fraction lost but the whole flock kept — *I will sow them among the people: and they shall remember me in far countries; and they shall live with their children, and turn again* (Zechariah 10:9) — and the Good Shepherd Himself names the one fold gathered: *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). Not one of the rescued slain is the earnest of that keeping.',
       sv.verse_id, ev.verse_id, 'extras', 61606
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-5-the-appointed-deliverer',
       E'Not of the seed by whose hand deliverance was given',
       E'When Joseph and Azarias, left to keep Judea, presumed to *get us a name* and went to fight unbidden, they were routed: *Thus was there a great overthrow among the children of Yashar''el (Israel), because they were not obedient to Judas and his brothers, but thought to do some valiant act* (1 Maccabees 5:61), *Moreover these men came not of the seed of those, by whose hand deliverance was given to Yashar''el (Israel)* (1 Maccabees 5:62). Deliverance is not seized by zeal-for-self; it comes by the appointed hand and a cry to heaven. The same chapter shows the right way — *And by the help of the Almighty they slew above nine thousand of their enemies* (2 Maccabees 8:24) — for victory is *The help of Yahuah (God)* (2 Maccabees 8:23), the watchword Judas gave. So Judas pleaded the LORD who *did quell the violence of the mighty man by the hand of your servant David* (1 Maccabees 4:30): deliverance flows through the seed and servant Yahuah chooses, and is owed back to His name — *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15).',
       sv.verse_id, ev.verse_id, 'extras', 61609
  FROM _session253_1mac5_lookup sv, _session253_1mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=55
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=5 AND ev.verse_number=62
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-5-brethren-regathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Judas gathering the Israelites of Galaad back into Judea is the Torah''s gathering-promise enacted in miniature.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The brethren fetched out of Bosora, Maked, and Carnaim answer to the promise that none of His are too far driven to be brought home.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:10 — *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* Simon bringing those of Galilee with their wives and children into Judea with great joy is the Shepherd gathering His flock.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The heathen assembling to destroy the Israelites only sets the stage for the LORD''s own promise to take His children from among the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The dispersed brethren of Galaad assembled from the least to the greatest foreshadow the assembling of the outcasts from the four corners.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-brethren-regathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-5-the-battle-is-yahuahs
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Judas crying with prayer against Timotheus'' great host owns the same truth — the battle belongs to Elohim, not the multitude.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* The trumpets and prayer of Judas'' three companies confess what David confessed before Goliath: the LORD saveth not by the sword.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar''el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* Judas prevailing as he cried with prayer is the lifted hands of Moses over Amalek again — the victory flows from heaven, not the arm.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day.* The same crying to heaven and pleading the covenant that armed Judas at Emmaus arms him again at Carnaim.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-5-mount-sion-with-joy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:11 — *For Yahuah (LORD) hath redeemed Jacob, and ransomed him from the hand of him that was stronger than he.* Going up to Sion with joy, not one slain, is Jacob ransomed from the hand of the stronger — the heathen host that would have consumed them.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-mount-sion-with-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 10:9 — *And I will sow them among the people: and they shall remember me in far countries; and they shall live with their children, and turn again.* The brethren of Galilee brought back with their wives and children, turning again to Judea, are the sown remnant remembering and returning.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-mount-sion-with-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The scattered brethren gathered to mount Sion prefigure the one fold the Shepherd Himself goes out to bring home.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-mount-sion-with-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-5-the-appointed-deliverer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 8:23 — *Also he appointed Eleazar to read the holy book: and when he had given them this watchword, The help of Yahuah (God); himself leading the first band,* The watchword ''The help of Yahuah'' is exactly what Joseph and Azarias forsook when they went out to get themselves a name rather than wait on the appointed hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=62
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 8:24 — *And by the help of the Almighty they slew above nine thousand of their enemies, and wounded and maimed the most part of Nicanor''s host, and so put all to flight;* Where the Almighty''s help is sought there is great slaughter of the enemy; where it is presumed upon, two thousand of Israel fall instead.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=60
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=8 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* Deliverance comes by the chosen hand — David''s, Jonathan''s, Judas'' — not by men who came not of that seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=62
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The overthrow of those who sought a name for themselves underscores that the battle is the LORD''s, won by obedience, not self-willed valour.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac5_lookup sv, _session253_1mac5_lookup tv
 WHERE t.slug='1-maccabees-5-the-appointed-deliverer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=5 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_06.sql (session253 1-maccabees 6) -----
-- Source anchor: apocrypha/1-maccabees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac6 (view _session253_1mac6_lookup). Sort band base 61625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-6-fall-of-the-proud-king
  ('apocrypha', '1-maccabees', 6, 8, 'canon', 'isaiah', 14, 11, 'free', E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The taunt over the fallen king of Babylon is the dirge for Antiochus, who laid him down upon his bed and fell sick for grief in 1 Maccabees 6:8.'),
  ('apocrypha', '1-maccabees', 6, 13, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The pride that exalted itself above Elohim is exactly what Antiochus now confesses brought his troubles upon him in 1 Maccabees 6:13.'),
  ('apocrypha', '1-maccabees', 6, 13, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proverb states the law that Antiochus learns on his deathbed as he perishes through great grief in a strange land in 1 Maccabees 6:13.'),
  ('apocrypha', '1-maccabees', 6, 12, 'canon', 'daniel', 11, 36, 'free', E'Daniel 11:36 — *And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* Daniel foresaw this very king whose blasphemies against the sanctuary Antiochus now remembers with dread in 1 Maccabees 6:12.'),
  ('apocrypha', '1-maccabees', 6, 9, 'apocrypha', '2-maccabees', 9, 5, 'extras', E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts.* The sister book names the heaven-sent stroke behind the grief that wasted Antiochus many days until he made account that he should die in 1 Maccabees 6:9.'),
  -- thread: 1-maccabees-6-the-abomination-pulled-down
  ('apocrypha', '1-maccabees', 6, 7, 'canon', 'daniel', 11, 37, 'free', E'Daniel 11:37 — *Neither shall he regard the Elohim (God) of his fathers, nor the desire of women, nor regard any god: for he shall magnify himself above all.* This is the very king who set up the abomination upon the altar that Yahudah''s people have now pulled down in 1 Maccabees 6:7.'),
  ('apocrypha', '1-maccabees', 6, 13, 'canon', 'daniel', 11, 45, 'free', E'Daniel 11:45 — *And he shall plant the tabernacles of his palace between the seas in the glorious holy mountain; yet he shall come to his end, and none shall help him.* The decreed end of the abomination-builder is precisely the lonely death in a strange land that Antiochus foresees for himself in 1 Maccabees 6:13.'),
  ('apocrypha', '1-maccabees', 6, 12, 'canon', 'psalms', 73, 18, 'free', E'Psalm 73:18 — *Surely thou didst set them in slippery places: thou castedst them down into destruction.* The psalmist''s vision of the end of the proud is fulfilled as Antiochus remembers the evils he did at Jerusalem and watches them come back upon his own head in 1 Maccabees 6:12.'),
  -- thread: 1-maccabees-6-sabbath-of-the-land
  ('apocrypha', '1-maccabees', 6, 53, 'canon', 'leviticus', 25, 4, 'free', E'Leviticus 25:4 — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard.* The very commandment the defenders kept is why it was the seventh year and their store was spent in 1 Maccabees 6:53.'),
  ('apocrypha', '1-maccabees', 6, 49, 'canon', 'leviticus', 25, 20, 'free', E'Leviticus 25:20 — *And if ye shall say, What shall we eat the seventh year? behold, we shall not sow, nor gather in our increase.* The anxious question Yahuah anticipates is the exact plight of Bethsura, with no victuals to endure the siege because it was a year of rest to the land in 1 Maccabees 6:49.'),
  ('apocrypha', '1-maccabees', 6, 49, 'canon', 'leviticus', 25, 21, 'free', E'Leviticus 25:21 — *Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years.* The promise attached to the land-sabbath is the trust the faithful were exercising even as the famine pressed them in 1 Maccabees 6:49.'),
  ('apocrypha', '1-maccabees', 6, 54, 'canon', 'exodus', 23, 11, 'free', E'Exodus 23:11 — *But the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat: and what they leave the beasts of the field shall eat. In like manner thou shalt deal with thy vineyard, and with thy oliveyard.* The Torah''s repeated sabbath-of-the-land is the law the few left in the sanctuary honoured though the famine scattered them in 1 Maccabees 6:54.'),
  -- thread: 1-maccabees-6-eleazar-better-resurrection
  ('apocrypha', '1-maccabees', 6, 44, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The faith chapter points back to the Maccabean martyrs, naming the better resurrection that crowns the perpetual name Eleazar sought when he gave his life for his people in 1 Maccabees 6:44.'),
  ('apocrypha', '1-maccabees', 6, 46, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The sister book voices the hope that makes sense of Eleazar''s death under the elephant for his people''s deliverance in 1 Maccabees 6:46.'),
  ('apocrypha', '1-maccabees', 6, 44, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The resurrection of the dust is the perpetual name Eleazar truly secured when he put himself in jeopardy to deliver his people in 1 Maccabees 6:44.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-fall-of-the-proud-king',
       E'The proud king brought down — Antiochus dies of grief',
       E'The blasphemer who exalted himself against Yahuah''s sanctuary is broken on his bed: *Now when the king heard these words, he was astonished and sore moved: whereupon he laid him down upon his bed, and fell sick for grief, because it had not befallen him as he looked for* (1 Maccabees 6:8), and *I perceive therefore that for this cause these troubles are come upon me, and, behold, I perish through great grief in a strange land* (1 Maccabees 6:13). This is the ancient pattern of the kingdom-of-man that lifts its throne above Elohim and is cast down. Isaiah sang it over Babylon''s king: *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee* (Isaiah 14:11), the same one who said *I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13). The proverb names the law of it plainly — *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). Daniel had already seen this very king in the spirit, the one who *shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36); and the sister book records the same hand of judgment falling — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague* (2 Maccabees 9:5). The antichrist system always ends here.',
       sv.verse_id, ev.verse_id, 'extras', 61625
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-the-abomination-pulled-down',
       E'The abomination torn down — the man-system undone',
       E'The good news that breaks the tyrant is that the defilement is gone: *Also that they had pulled down the abomination, which he had set up upon the altar in Jerusalem, and that they had compassed about the sanctuary with high walls, as before* (1 Maccabees 6:7), and the king himself confesses, *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause* (1 Maccabees 6:12). This is the abomination of desolation, the kingdom-of-man enthroned in Yahuah''s holy place. Daniel named the man who builds it — *Neither shall he regard the Elohim (God) of his fathers, nor the desire of women, nor regard any god: for he shall magnify himself above all* (Daniel 11:37) — and named his end: *yet he shall come to his end, and none shall help him* (Daniel 11:45). The psalmist had seen the whole arc from the sanctuary: *Surely thou didst set them in slippery places: thou castedst them down into destruction* (Psalm 73:18). The covenant people do not negotiate with the abomination; they pull it down.',
       sv.verse_id, ev.verse_id, 'extras', 61628
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-sabbath-of-the-land',
       E'The sabbath-year famine — keeping Torah unto hunger',
       E'The faithful in the sanctuary starve rather than break the land-sabbath: *Yet at the last, their vessels being without victuals, (for that it was the seventh year, and they in Judea that were delivered from the Gentiles, had eaten up the residue of the store;)* (1 Maccabees 6:53), so that *the famine did so prevail against them, that they were fain to disperse themselves, every man to his own place* (1 Maccabees 6:54). Even besieged, they kept the commandment — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard* (Leviticus 25:4), and *the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat* (Exodus 23:11). This is never law-as-curse; it is covenant faithfulness leaning on a promise. Yahuah Himself answered the anxious question they were living out — *And if ye shall say, What shall we eat the seventh year? behold, we shall not sow, nor gather in our increase* (Leviticus 25:20) — with *Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years* (Leviticus 25:21). The remnant keeps Torah and trusts the Provider.',
       sv.verse_id, ev.verse_id, 'extras', 61631
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=49
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-eleazar-better-resurrection',
       E'Eleazar lays down his life — the better resurrection',
       E'One man spends his life for his people and a name that outlasts death: *Eleazar also, surnamed Savaran, perceiving that one of the beasts, armed with royal harness, was higher than all the rest, and supposing that the king was upon him* (1 Maccabees 6:43), *put himself in jeopardy, to the end he might deliver his people, and get him a perpetual name* (1 Maccabees 6:44), and *he crept under the elephant, and thrust him under, and slew him: whereupon the elephant fell down upon him, and there he died* (1 Maccabees 6:46). The hope underwriting such a death is resurrection. The sister book gives the words of the martyred brother — *You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). Daniel had promised it — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2) — and Hebrews points straight back to these very Maccabean sufferers — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The perpetual name Eleazar sought is kept in the resurrection of the just.',
       sv.verse_id, ev.verse_id, 'extras', 61634
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-6-fall-of-the-proud-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The taunt over the fallen king of Babylon is the dirge for Antiochus, who laid him down upon his bed and fell sick for grief in 1 Maccabees 6:8.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The pride that exalted itself above Elohim is exactly what Antiochus now confesses brought his troubles upon him in 1 Maccabees 6:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proverb states the law that Antiochus learns on his deathbed as he perishes through great grief in a strange land in 1 Maccabees 6:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 11:36 — *And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* Daniel foresaw this very king whose blasphemies against the sanctuary Antiochus now remembers with dread in 1 Maccabees 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts.* The sister book names the heaven-sent stroke behind the grief that wasted Antiochus many days until he made account that he should die in 1 Maccabees 6:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-6-the-abomination-pulled-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:37 — *Neither shall he regard the Elohim (God) of his fathers, nor the desire of women, nor regard any god: for he shall magnify himself above all.* This is the very king who set up the abomination upon the altar that Yahudah''s people have now pulled down in 1 Maccabees 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-the-abomination-pulled-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:45 — *And he shall plant the tabernacles of his palace between the seas in the glorious holy mountain; yet he shall come to his end, and none shall help him.* The decreed end of the abomination-builder is precisely the lonely death in a strange land that Antiochus foresees for himself in 1 Maccabees 6:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-the-abomination-pulled-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 73:18 — *Surely thou didst set them in slippery places: thou castedst them down into destruction.* The psalmist''s vision of the end of the proud is fulfilled as Antiochus remembers the evils he did at Jerusalem and watches them come back upon his own head in 1 Maccabees 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-the-abomination-pulled-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-6-sabbath-of-the-land
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:4 — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard.* The very commandment the defenders kept is why it was the seventh year and their store was spent in 1 Maccabees 6:53.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 25:20 — *And if ye shall say, What shall we eat the seventh year? behold, we shall not sow, nor gather in our increase.* The anxious question Yahuah anticipates is the exact plight of Bethsura, with no victuals to endure the siege because it was a year of rest to the land in 1 Maccabees 6:49.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 25:21 — *Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years.* The promise attached to the land-sabbath is the trust the faithful were exercising even as the famine pressed them in 1 Maccabees 6:49.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 23:11 — *But the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat: and what they leave the beasts of the field shall eat. In like manner thou shalt deal with thy vineyard, and with thy oliveyard.* The Torah''s repeated sabbath-of-the-land is the law the few left in the sanctuary honoured though the famine scattered them in 1 Maccabees 6:54.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-6-eleazar-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The faith chapter points back to the Maccabean martyrs, naming the better resurrection that crowns the perpetual name Eleazar sought when he gave his life for his people in 1 Maccabees 6:44.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-eleazar-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The sister book voices the hope that makes sense of Eleazar''s death under the elephant for his people''s deliverance in 1 Maccabees 6:46.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-eleazar-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The resurrection of the dust is the perpetual name Eleazar truly secured when he put himself in jeopardy to deliver his people in 1 Maccabees 6:44.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-eleazar-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_07.sql (session253 1-maccabees 7) -----
-- Source anchor: apocrypha/1-maccabees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac7 (view _session253_1mac7_lookup). Sort band base 61650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-7-spread-the-blasphemy
  ('apocrypha', '1-maccabees', 7, 37, 'canon', '2-kings', 19, 14, 'free', E'2 Kings 19:14 — *And Hezekiah received the letter of the hand of the messengers, and read it: and Hezekiah went up into the house of Yahuah (LORD), and spread it before Yahuah (LORD).* As the priests carry Nicanor''s threat to the altar, so Hezekiah carries the blasphemer''s letter into the same house and lays it open before Yahuah.'),
  ('apocrypha', '1-maccabees', 7, 38, 'canon', '2-kings', 19, 19, 'free', E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* Hezekiah''s plea that Yahuah avenge His own name is the very plea the priests pray when they ask Him to remember Nicanor''s blasphemies.'),
  ('apocrypha', '1-maccabees', 7, 37, 'canon', 'psalms', 79, 1, 'free', E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Asaph''s lament over the profaned house is the same grief that drives the priests to plead for the house called by Yahuah''s name.'),
  -- thread: 1-maccabees-7-thy-angel-went-out
  ('apocrypha', '1-maccabees', 7, 41, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas quotes this deliverance almost word for word, pleading the same angel and the same number against Nicanor.'),
  ('apocrypha', '1-maccabees', 7, 42, 'canon', 'psalms', 79, 6, 'free', E'Psalm 79:6 — *Pour out thy wrath upon the heathen that have not known thee, and upon the kingdoms that have not called upon thy name.* Judas'' cry to destroy the blaspheming host echoes Asaph''s prayer that Yahuah''s wrath fall on the nations that defy His name.'),
  ('apocrypha', '1-maccabees', 7, 42, 'canon', 'psalms', 79, 10, 'free', E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* Judas asks Yahuah to make Himself known by judging Nicanor, the very vindication Asaph sought for the blood of the servants.'),
  -- thread: 1-maccabees-7-pit-he-digged
  ('apocrypha', '1-maccabees', 7, 47, 'canon', 'psalms', 7, 15, 'free', E'Psalm 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Nicanor, who dug the snare for Judas and threatened the temple, is himself first slain and his proud hand hung up — fallen into his own ditch.'),
  ('apocrypha', '1-maccabees', 7, 47, 'canon', 'psalms', 7, 16, 'free', E'Psalm 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* The head and right hand Nicanor stretched out so proudly are struck off and hung toward Jerusalem — his violent dealing come down upon his own pate.'),
  ('apocrypha', '1-maccabees', 7, 47, 'canon', 'proverbs', 26, 27, 'free', E'Proverbs 26:27 — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him.* The proverb''s law of the pit-digger is enacted exactly in Nicanor, who plotted Judas'' ruin and met his own.'),
  ('apocrypha', '1-maccabees', 7, 43, 'canon', 'esther', 9, 25, 'free', E'Esther 9:25 — *But when Esther came before the king, he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows.* As Haman''s device returned on his own head and he was hanged up, so Nicanor''s host is broken on the thirteenth of Adar and his hand hung up toward Jerusalem.'),
  -- thread: 1-maccabees-7-day-of-gladness-ordained
  ('apocrypha', '1-maccabees', 7, 49, 'canon', 'esther', 9, 27, 'free', E'Esther 9:27 — *The Yahudim (Jews) ordained, and took upon them, and upon their seed, and upon all such as joined themselves unto them, so as it should not fail, that they would keep these two days according to their writing, and according to their appointed time every year.* As Purim was ordained yearly for the deliverance from Haman, so the thirteenth of Adar is ordained yearly for the deliverance from Nicanor — the same covenant memory.'),
  ('apocrypha', '1-maccabees', 7, 48, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The memorial days the Maccabees ordained were kept down to the Messiah''s own day, who walked the temple at the dedication the brethren established.'),
  -- thread: 1-maccabees-7-blood-of-the-saints
  ('apocrypha', '1-maccabees', 7, 17, 'canon', 'psalms', 79, 2, 'free', E'Psalm 79:2 — *The dead bodies of thy servants have they given to be meat unto the fowls of the heaven, the flesh of thy saints unto the beasts of the earth.* The cry over the slain Assideans, the flesh of the saints cast out, is drawn straight from Asaph''s lament over the bodies of Yahuah''s servants.'),
  ('apocrypha', '1-maccabees', 7, 17, 'canon', 'psalms', 79, 3, 'free', E'Psalm 79:3 — *Their blood have they shed like water round about Jerusalem; and there was none to bury them.* The chapter''s words — blood shed round about Jerusalem with none to bury them — are Psalm 79''s words exactly, the same desolation a covenant age later.'),
  ('apocrypha', '1-maccabees', 7, 18, 'canon', 'daniel', 11, 30, 'free', E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Daniel names the very players of this chapter: the system that rages against the holy covenant working through Israelites like Alcimus who forsake it.'),
  ('apocrypha', '1-maccabees', 7, 17, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah gathers all such shed righteous blood — the Assideans'' among it — into one reckoning that Yahuah will avenge.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-spread-the-blasphemy',
       E'The blasphemy spread before Yahuah',
       E'When Nicanor swears in his wrath, *Unless Judas and his host be now delivered into my hands, if ever I come again in safety, I will burn up this house: and with that he went out in a great rage* (1 Maccabees 7:35), the priests do not arm — they stand before the altar and lay the threat at the feet of the One whose name the house bears: *You, O Yahuah (God), did choose this house to be called by your name, and to be a house of prayer and petition for your people* (1 Maccabees 7:37), *Be avenged of this man and his host, and let them fall by the sword: remember their blasphemies, and suffer them not to continue any longer* (1 Maccabees 7:38). It ain''t new. When the Assyrian sent his blasphemy in a letter, Hezekiah did the same — *And Hezekiah received the letter of the hand of the messengers, and read it: and Hezekiah went up into the house of Yahuah (LORD), and spread it before Yahuah (LORD)* (2 Kings 19:14) — and prayed, *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only* (2 Kings 19:19). And Asaph had cried over a temple already defiled, *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps* (Psalm 79:1). The covenant people do not match blasphemy with blasphemy; they bring it before the Name and let Him answer for His own house.',
       sv.verse_id, ev.verse_id, 'extras', 61650
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-thy-angel-went-out',
       E'Thy angel that smote the Assyrians',
       E'Before the battle Judas pitches at Adasa and prays, reaching back across the centuries to the great deliverance: *O Yahuah (God), when they that were sent from the king of the Assyrians blasphemed, your angel went out, and struck an hundred fourscore and five thousand of them* (1 Maccabees 7:41), *Even so destroy you this host before us this day, that the rest may know that he has spoken blasphemously against your sanctuary, and judge you him according to his wickedness* (1 Maccabees 7:42). The number is no flourish — it is quoted straight out of the Tanakh: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (2 Kings 19:35). Judas prays the precedent: the same Yahuah who answered blasphemy then will answer it now. And Asaph framed the verdict Judas asks for — *Pour out thy wrath upon the heathen that have not known thee, and upon the kingdoms that have not called upon thy name* (Psalm 79:6), *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed* (Psalm 79:10). It ain''t new: deliverance is asked on the ground of what He has already done.',
       sv.verse_id, ev.verse_id, 'extras', 61653
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-pit-he-digged',
       E'His mischief returned on his own head',
       E'Nicanor, who had laughed at the priests and *spoke proudly* (1 Maccabees 7:34) and stretched out his hand against the sanctuary, is the first to fall: *So the thirteenth day of the month Adar the hosts joined battle: but Nicanor''s host was discomfited, and he himself was first slain in the battle* (1 Maccabees 7:43), and then *they took the spoils, and the prey, and struck off Nicanors head, and his right hand, which he stretched out so proudly, and brought them away, and hanged them up toward Jerusalem* (1 Maccabees 7:47). This is the oldest law of the wicked man''s end. David sang it: *He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15), *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). Wisdom said it plainly — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27). And the same Adar gallows had already swallowed another enemy of the covenant people: *he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows* (Esther 9:25). The proud right hand stretched against Yahuah''s house is the hand hung up before it.',
       sv.verse_id, ev.verse_id, 'extras', 61656
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-day-of-gladness-ordained',
       E'Ordained yearly: a day of great gladness',
       E'The deliverance is not let slip but written into the calendar of the covenant people: *For this cause the people rejoiced greatly, and they kept that day a day of great gladness* (1 Maccabees 7:48), *Moreover they ordained to keep yearly this day, being the thirteenth of Adar* (1 Maccabees 7:49). It ain''t new — this is how Yashar''el remembers what Yahuah does: *The Yahudim (Jews) ordained, and took upon them, and upon their seed, and upon all such as joined themselves unto them, so as it should not fail, that they would keep these two days according to their writing, and according to their appointed time every year* (Esther 9:27). Adar''s deliverance from Haman and Adar''s deliverance from Nicanor stand side by side, both made a yearly remembrance. And the Maccabean memorials were no dead custom: the Messiah Himself walked the temple at the feast the brethren ordained — *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The appointed days of this very deliverance the covenant people kept, and the Son of Yahuah kept them too.',
       sv.verse_id, ev.verse_id, 'extras', 61659
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=48
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-7-blood-of-the-saints',
       E'The blood of the saints, none to bury them',
       E'Alcimus the false priest, having sworn peace, slaughters the Assideans who trusted his priestly oath: *Whereupon they believed him: howbeit he took of them threescore men, and slew them in one day, according to the words which he wrote* (1 Maccabees 7:16), so that the people cry, *The flesh of your saints have they cast out, and their blood have they shed round about Jerusalem, and there was none to bury them* (1 Maccabees 7:17), *for they have broken the covenant and oath that they made* (1 Maccabees 7:18). The lament is lifted almost verbatim from Asaph over an earlier desolation: *The dead bodies of thy servants have they given to be meat unto the fowls of the heaven, the flesh of thy saints unto the beasts of the earth* (Psalm 79:2), *Their blood have they shed like water round about Jerusalem; and there was none to bury them* (Psalm 79:3). This is the work of the abomination Daniel foresaw, the kingdom of man that wars on the covenant — *he shall even return, and have intelligence with them that forsake the holy covenant* (Daniel 11:30) — the same spirit the Messiah charged on the murderers of the prophets, *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). The covenant-keepers die at the hand of the covenant-breakers, and Yahuah remembers their blood.',
       sv.verse_id, ev.verse_id, 'extras', 61662
  FROM _session253_1mac7_lookup sv, _session253_1mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-7-spread-the-blasphemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:14 — *And Hezekiah received the letter of the hand of the messengers, and read it: and Hezekiah went up into the house of Yahuah (LORD), and spread it before Yahuah (LORD).* As the priests carry Nicanor''s threat to the altar, so Hezekiah carries the blasphemer''s letter into the same house and lays it open before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-spread-the-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* Hezekiah''s plea that Yahuah avenge His own name is the very plea the priests pray when they ask Him to remember Nicanor''s blasphemies.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-spread-the-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Asaph''s lament over the profaned house is the same grief that drives the priests to plead for the house called by Yahuah''s name.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-spread-the-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-thy-angel-went-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas quotes this deliverance almost word for word, pleading the same angel and the same number against Nicanor.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-thy-angel-went-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 79:6 — *Pour out thy wrath upon the heathen that have not known thee, and upon the kingdoms that have not called upon thy name.* Judas'' cry to destroy the blaspheming host echoes Asaph''s prayer that Yahuah''s wrath fall on the nations that defy His name.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-thy-angel-went-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* Judas asks Yahuah to make Himself known by judging Nicanor, the very vindication Asaph sought for the blood of the servants.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-thy-angel-went-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-pit-he-digged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Nicanor, who dug the snare for Judas and threatened the temple, is himself first slain and his proud hand hung up — fallen into his own ditch.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* The head and right hand Nicanor stretched out so proudly are struck off and hung toward Jerusalem — his violent dealing come down upon his own pate.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:27 — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him.* The proverb''s law of the pit-digger is enacted exactly in Nicanor, who plotted Judas'' ruin and met his own.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Esther 9:25 — *But when Esther came before the king, he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows.* As Haman''s device returned on his own head and he was hanged up, so Nicanor''s host is broken on the thirteenth of Adar and his hand hung up toward Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-pit-he-digged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-day-of-gladness-ordained
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:27 — *The Yahudim (Jews) ordained, and took upon them, and upon their seed, and upon all such as joined themselves unto them, so as it should not fail, that they would keep these two days according to their writing, and according to their appointed time every year.* As Purim was ordained yearly for the deliverance from Haman, so the thirteenth of Adar is ordained yearly for the deliverance from Nicanor — the same covenant memory.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-day-of-gladness-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The memorial days the Maccabees ordained were kept down to the Messiah''s own day, who walked the temple at the dedication the brethren established.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-day-of-gladness-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-7-blood-of-the-saints
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:2 — *The dead bodies of thy servants have they given to be meat unto the fowls of the heaven, the flesh of thy saints unto the beasts of the earth.* The cry over the slain Assideans, the flesh of the saints cast out, is drawn straight from Asaph''s lament over the bodies of Yahuah''s servants.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 79:3 — *Their blood have they shed like water round about Jerusalem; and there was none to bury them.* The chapter''s words — blood shed round about Jerusalem with none to bury them — are Psalm 79''s words exactly, the same desolation a covenant age later.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Daniel names the very players of this chapter: the system that rages against the holy covenant working through Israelites like Alcimus who forsake it.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah gathers all such shed righteous blood — the Assideans'' among it — into one reckoning that Yahuah will avenge.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac7_lookup sv, _session253_1mac7_lookup tv
 WHERE t.slug='1-maccabees-7-blood-of-the-saints'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_08.sql (session253 1-maccabees 8) -----
-- Source anchor: apocrypha/1-maccabees ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac8 (view _session253_1mac8_lookup). Sort band base 61675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-8-fourth-kingdom
  ('apocrypha', '1-maccabees', 8, 4, 'canon', 'daniel', 2, 40, 'free', E'Daniel 2:40 — *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things: and as iron that breaketh all these, shall it break in pieces and bruise.* The Rome whose conquests 1 Maccabees 8:4 rehearses is Daniel''s iron fourth kingdom that subdues all the earth.'),
  ('apocrypha', '1-maccabees', 8, 11, 'canon', 'daniel', 7, 7, 'free', E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The empire that 1 Maccabees 8:11 says destroyed and brought under its dominion all kingdoms is Daniel''s iron-toothed beast.'),
  ('apocrypha', '1-maccabees', 8, 13, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The power of 1 Maccabees 8:13 that sets up and displaces kings at pleasure is the self-exalting horn that wears out the saints.'),
  -- thread: 1-maccabees-8-arm-of-flesh
  ('apocrypha', '1-maccabees', 8, 17, 'canon', 'jeremiah', 17, 5, 'free', E'Jeremiah 17:5 — *Thus saith Yahuah (LORD); Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD).* To send to Rome and make it Israel''s arm, as in 1 Maccabees 8:17, is exactly the leaning Jeremiah warns against.'),
  ('apocrypha', '1-maccabees', 8, 17, 'canon', 'psalms', 146, 3, 'free', E'Psalm 146:3 — *Put not your trust in princes, nor in the son of Adam, in whom there is no help.* The Roman senate Judas courts in 1 Maccabees 8:17 are the princes in whom there is no lasting help.'),
  ('apocrypha', '1-maccabees', 8, 6, 'canon', 'psalms', 33, 16, 'free', E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The hundred-and-twenty elephants and great army of 1 Maccabees 8:6 are the multitude of an host that cannot save.'),
  ('apocrypha', '1-maccabees', 8, 18, 'canon', 'isaiah', 31, 1, 'free', E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The plea to Rome to take off the yoke in 1 Maccabees 8:18 is the new going-down-to-Egypt for help.'),
  -- thread: 1-maccabees-8-deliverance-from-heaven
  ('apocrypha', '1-maccabees', 8, 20, 'apocrypha', '1-maccabees', 4, 10, 'extras', E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day:* Judas'' own counsel before Emmaus shows the truer recourse than the Roman confederacy he seeks in 1 Maccabees 8:20.'),
  ('apocrypha', '1-maccabees', 8, 20, 'apocrypha', '1-maccabees', 4, 30, 'extras', E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The Saviour of Israel who felled Goliath, not the senate of 1 Maccabees 8:20, is Israel''s deliverer.'),
  ('apocrypha', '1-maccabees', 8, 19, 'canon', 'psalms', 20, 7, 'free', E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* The long journey to Rome in 1 Maccabees 8:19 is a trust in chariots when the name of God is the surer shield.'),
  ('apocrypha', '1-maccabees', 8, 20, 'canon', 'psalms', 118, 8, 'free', E'Psalm 118:8 — *It is better to trust in Yahuah (LORD) than to put confidence in man.* The confederacy and friendship sought in 1 Maccabees 8:20 is the confidence in man the psalm sets second to trust in Yahuah.'),
  -- thread: 1-maccabees-8-kingdom-that-stands
  ('apocrypha', '1-maccabees', 8, 15, 'canon', 'daniel', 2, 44, 'free', E'Daniel 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* The well-ordered Roman senate of 1 Maccabees 8:15 is one of the kingdoms that the everlasting Kingdom will break in pieces.'),
  ('apocrypha', '1-maccabees', 8, 16, 'canon', 'daniel', 7, 27, 'free', E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* The single yearly ruler all obey in 1 Maccabees 8:16 foreshadows by contrast the dominion given to the saints, whom all kingdoms shall serve.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-fourth-kingdom',
       E'The Fourth Beast: Israel turns from one world-empire to another',
       E'Judas, having driven back the Greek, now hears of a mightier arm to lean upon: *Now Judas had heard of the Romans, that they were mighty and valiant men, and such as would lovingly accept all that joined themselves to them, and make a league of amity with all that came to them;* (1 Maccabees 8:1) — *Also that, whom they would help to a kingdom, those reign; and whom again they would, they displace: finally, that they were greatly exalted:* (1 Maccabees 8:13). The chronicler is honest about Rome''s reach, and the reader who knows Daniel hears the warning under the praise: this is the next head of the kingdom-of-man, the iron empire that breaks all. *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things: and as iron that breaketh all these, shall it break in pieces and bruise.* (Daniel 2:40) — Rome is the iron Daniel foresaw, and Judas is reaching to take its yoke upon his neck. *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* (Daniel 7:7) — the very empire whose teeth would one day tread Jerusalem is the friend Israel now seeks. Antiochus was the abomination dismantled; Rome is the dreadful beast rising. *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25) — the spirit that exalts itself and wears out the saints does not die with one tyrant; it changes its dress and offers a league.',
       sv.verse_id, ev.verse_id, 'extras', 61675
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-arm-of-flesh',
       E'Trust not in the arm of flesh: the league as a leaning',
       E'The chapter''s pivot is a turning of the eyes — from heaven, which had already given the victories, to a distant arm of flesh: *In consideration of these things, Judas chose Eupolemus the son of John, the son of Accos, and Jason the son of Eleazar, and sent them to Rome, to make a league of amity and confederacy with them,* (1 Maccabees 8:17) — *And to intreat them that they would take the yoke from them; for they saw that the kingdom of the Grecians did oppress Yashar''el (Israel) with servitude.* (1 Maccabees 8:18). The text invites the old caution, and we weave it honestly. *Thus saith Yahuah (LORD); Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD).* (Jeremiah 17:5) — to make Rome the arm is the very thing the prophet names. *Put not your trust in princes, nor in the son of Adam, in whom there is no help.* (Psalm 146:3) — the Roman senate is princes, and their help is the help of dust. *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* (Psalm 33:16) — Rome''s hundred-and-twenty elephants and great army do not save. *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1) — the embassy to Rome is the new going-down-to-Egypt. This is not to condemn Judas, whose zeal for the covenant was true; it is the reader''s quiet warning, that even the faithful are tempted to lean where they should kneel.',
       sv.verse_id, ev.verse_id, 'extras', 61678
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-deliverance-from-heaven',
       E'By whom Israel is delivered: cry to heaven, not to a senate',
       E'Set against the embassy to Rome stands the witness of this very book a few chapters back, where deliverance came not from a league but from the covenant God. The envoys carry Israel''s plea to the senate: *Judas Maccabeus with his brothers, and the people of the Yahudim (Jews), have sent us to you, to make a confederacy and peace with you, and that we might be registered your confederates and friends.* (1 Maccabees 8:20). But Judas himself had taught the truer recourse before Emmaus: *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day:* (1 Maccabees 4:10) — the covenant of the fathers, not a confederacy of brass, was the wall. *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* (1 Maccabees 4:30) — the One who felled Goliath and routed the Philistines is the Saviour of Israel, who needs no senate. The Psalms know the contrast by heart: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* (Psalm 20:7) — and *It is better to trust in Yahuah (LORD) than to put confidence in man.* (Psalm 118:8). The seed kept is kept by the covenant, not by the kingdom-of-man''s friendship.',
       sv.verse_id, ev.verse_id, 'extras', 61681
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-kingdom-that-stands',
       E'No crown, no purple, a senate of brass: the order that cannot stand',
       E'The chronicler marvels at Rome''s polity — its restraint, its yearly rule, its tireless council: *Yet for all this none of them wore a crown or was clothed in purple, to be magnified thereby:* (1 Maccabees 8:14) — *Moreover how they had made for themselves a senate house, in which three hundred and twenty men sat in council daily, consulting alway for the people, to the end they might be well ordered:* (1 Maccabees 8:15) — *And that they committed their government to one man every year, who ruled over all their country, and that all were obedient to that one, and that there was neither envy nor emmulation among them.* (1 Maccabees 8:16). It is the kingdom-of-man at its most admirable, ordering itself wisely — and yet it is still the fourth kingdom, mortal as iron mixed with clay. Daniel sets over against every such order the one Kingdom that will not pass: *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44) — Rome''s brass tables are a memorial of peace, but this Kingdom alone stands for ever. *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27) — the dominion is not Rome''s senate but the saints'', and all the well-ordered empires of men shall at last serve and obey Him.',
       sv.verse_id, ev.verse_id, 'extras', 61684
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-8-fourth-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:40 — *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things: and as iron that breaketh all these, shall it break in pieces and bruise.* The Rome whose conquests 1 Maccabees 8:4 rehearses is Daniel''s iron fourth kingdom that subdues all the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The empire that 1 Maccabees 8:11 says destroyed and brought under its dominion all kingdoms is Daniel''s iron-toothed beast.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The power of 1 Maccabees 8:13 that sets up and displaces kings at pleasure is the self-exalting horn that wears out the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-8-arm-of-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 17:5 — *Thus saith Yahuah (LORD); Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD).* To send to Rome and make it Israel''s arm, as in 1 Maccabees 8:17, is exactly the leaning Jeremiah warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 146:3 — *Put not your trust in princes, nor in the son of Adam, in whom there is no help.* The Roman senate Judas courts in 1 Maccabees 8:17 are the princes in whom there is no lasting help.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The hundred-and-twenty elephants and great army of 1 Maccabees 8:6 are the multitude of an host that cannot save.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The plea to Rome to take off the yoke in 1 Maccabees 8:18 is the new going-down-to-Egypt for help.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-8-deliverance-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day:* Judas'' own counsel before Emmaus shows the truer recourse than the Roman confederacy he seeks in 1 Maccabees 8:20.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The Saviour of Israel who felled Goliath, not the senate of 1 Maccabees 8:20, is Israel''s deliverer.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* The long journey to Rome in 1 Maccabees 8:19 is a trust in chariots when the name of God is the surer shield.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 118:8 — *It is better to trust in Yahuah (LORD) than to put confidence in man.* The confederacy and friendship sought in 1 Maccabees 8:20 is the confidence in man the psalm sets second to trust in Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-8-kingdom-that-stands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* The well-ordered Roman senate of 1 Maccabees 8:15 is one of the kingdoms that the everlasting Kingdom will break in pieces.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-kingdom-that-stands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* The single yearly ruler all obey in 1 Maccabees 8:16 foreshadows by contrast the dominion given to the saints, whom all kingdoms shall serve.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-kingdom-that-stands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_09.sql (session253 1-maccabees 9) -----
-- Source anchor: apocrypha/1-maccabees ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac9 (view _session253_1mac9_lookup). Sort band base 61700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-9-how-is-the-valiant-fallen
  ('apocrypha', '1-maccabees', 9, 21, 'canon', '2-samuel', 1, 19, 'free', E'2 Samuel 1:19 — *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* David''s opening lament over Saul and Jonathan supplies the very cry Israel raises over Judas, the valiant man fallen that delivered Israel.'),
  ('apocrypha', '1-maccabees', 9, 21, 'canon', '2-samuel', 1, 25, 'free', E'2 Samuel 1:25 — *How are the mighty fallen in the midst of the battle! O Jonathan, thou wast slain in thine high places.* The mighty falling in the midst of the battle is exactly Judas''s end at Eleasa, the same dirge for a fallen captain of Israel.'),
  ('apocrypha', '1-maccabees', 9, 21, 'canon', '2-samuel', 1, 27, 'free', E'2 Samuel 1:27 — *How are the mighty fallen, and the weapons of war perished!* The closing refrain of David''s song echoes in Israel''s lament for Judas, whose noble acts were too many to be written.'),
  ('apocrypha', '1-maccabees', 9, 20, 'canon', '2-samuel', 3, 38, 'free', E'2 Samuel 3:38 — *And the king said unto his servants, Know ye not that there is a prince and a great man fallen this day in Yashar''el (Israel)?* As David named the loss of a great man in Israel, so Jonathan and Simon bury their brother and Israel mourns a prince fallen.'),
  -- thread: 1-maccabees-9-die-manfully-for-our-brothers
  ('apocrypha', '1-maccabees', 9, 10, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Judas''s resolve to die manfully for his brothers rather than flee is this very love made flesh in the field.'),
  ('apocrypha', '1-maccabees', 9, 10, 'canon', 'hebrews', 11, 34, 'free', E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith chapter enrolls the Maccabean valiant who, like Judas at Eleasa, were made strong out of weakness.'),
  ('apocrypha', '1-maccabees', 9, 10, 'apocrypha', '1-maccabees', 3, 18, 'extras', E'1 Maccabees 3:18 — *To whom Judas answered, It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company:* The same Judas who once heartened the few now will not flee, choosing to die manfully with his brothers.'),
  -- thread: 1-maccabees-9-save-by-many-or-by-few
  ('apocrypha', '1-maccabees', 9, 6, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* The eight hundred who stayed with Judas embody Jonathan''s faith that the LORD saves by many or by few.'),
  ('apocrypha', '1-maccabees', 9, 9, 'apocrypha', '1-maccabees', 3, 19, 'extras', E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Against the counsel to flee because they were but few, Judas''s own creed answers that the victory is not in numbers but from heaven.'),
  ('apocrypha', '1-maccabees', 9, 6, 'canon', 'zechariah', 4, 6, 'free', E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word grounds the courage of the few: deliverance is by the Spirit, not by the size of the host.'),
  -- thread: 1-maccabees-9-cry-ye-now-to-heaven
  ('apocrypha', '1-maccabees', 9, 46, 'canon', 'psalms', 79, 9, 'free', E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* The psalm of the defiled temple is exactly the cry Jonathan commands his trapped company to raise to heaven for deliverance.'),
  ('apocrypha', '1-maccabees', 9, 46, 'apocrypha', '1-maccabees', 3, 19, 'extras', E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Jonathan''s order to cry to heaven rests on the family creed that the strength to be delivered comes down from heaven, not from their own number.'),
  -- thread: 1-maccabees-9-the-sword-ceased-the-seed-kept
  ('apocrypha', '1-maccabees', 9, 73, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* Jonathan destroying the ungodly out of Israel carries forward Phinehas''s zeal that turns away wrath and keeps the people.'),
  ('apocrypha', '1-maccabees', 9, 73, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The Maccabean zeal that purges Israel is rewarded as Phinehas''s was, the covenant kept through the zealous seed.'),
  ('apocrypha', '1-maccabees', 9, 42, 'canon', 'psalms', 79, 10, 'free', E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* When the brothers avenged fully the blood of John their brother, they enacted the psalm''s plea for the revenging of the blood of His servants.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-how-is-the-valiant-fallen',
       E'How is the valiant man fallen',
       E'Judas Maccabeus, who broke the abomination''s host and cleansed the sanctuary, falls in battle, and all Israel takes up the lament: *Judas also was killed, and the remnant fled* (1 Maccabees 9:18), *Moreover they bewailed him, and all Yashar''el (Israel) made great lamentation for him, and mourned many days, saying,* (1 Maccabees 9:20), *How is the valiant man fallen, that delivered Yashar''el (Israel)!* (1 Maccabees 9:21). It ain''t new — the dirge is David''s over the fallen of the LORD''s people: *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* (2 Samuel 1:19), *How are the mighty fallen in the midst of the battle! O Jonathan, thou wast slain in thine high places.* (2 Samuel 1:25), and the refrain that closes the song, *How are the mighty fallen, and the weapons of war perished!* (2 Samuel 1:27). And as David honoured even Abner — *Know ye not that there is a prince and a great man fallen this day in Yashar''el (Israel)?* (2 Samuel 3:38) — so the covenant people honour the deliverer who spent himself for them. The mourning is not despair but covenant memory; the hope of such a man is the resurrection (2 Maccabees 7) to which all Israel''s fallen look.',
       sv.verse_id, ev.verse_id, 'extras', 61700
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-die-manfully-for-our-brothers',
       E'Let us die manfully for our brothers',
       E'Forsaken by all but eight hundred, Judas will not flee: *Then Judas said, Yahuah (God) forbid that I should do this thing, and flee away from them: if our time be come, let us die manfully for our brothers, and let us not stain our honour.* (1 Maccabees 9:10). This is the Torah-faithful courage that lays down life for the covenant brethren, the very love the Messiah names: *Greater love hath no man than this, that a man lay down his life for his friends.* (John 15:13). Judas had spoken the same faith before, when the host was small against a multitude — *To whom Judas answered, It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company:* (1 Maccabees 3:18). And the faith roll of Hebrews gathers up these very Maccabean fighters who *out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* (Hebrews 11:34). It ain''t new: to die rather than abandon the brethren is covenant faithfulness, not law-as-curse.',
       sv.verse_id, ev.verse_id, 'extras', 61703
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-save-by-many-or-by-few',
       E'No restraint to save by many or by few',
       E'When the few saw the great army, they would have fled — *Who seeing the multitude of the other army to be so great were sore afraid; whereupon many conveyed themselves out of the host, insomuch as abode of them no more but eight hundred men.* (1 Maccabees 9:6) — yet Judas held to a faith that does not count heads. It is Jonathan''s faith at Michmash: *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* (1 Samuel 14:6). Judas himself had confessed it — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* (1 Maccabees 3:19) — and the prophets seal it: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6). It ain''t new: deliverance was never in numbers but in heaven.',
       sv.verse_id, ev.verse_id, 'extras', 61706
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-cry-ye-now-to-heaven',
       E'Cry ye now to heaven, that ye may be delivered',
       E'Hemmed by Jordan and the marsh, Jonathan turns the trapped remnant to prayer: *Wherefore cry you now to heaven, that you may be delivered from the hand of your enemies.* (1 Maccabees 9:46), and then *With that they joined battle, and Jonathan stretched forth his hand to smite Bacchides* (1 Maccabees 9:47). It ain''t new — this is the afflicted covenant people''s plea in the Psalms: *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* (Psalm 79:9), a psalm written over the very temple Antiochus had defiled. And the cry rests on the same faith Judas confessed, that *strength comes from heaven* (1 Maccabees 3:19). The remnant is not delivered by its own arm but by crying to heaven and then standing in faith.',
       sv.verse_id, ev.verse_id, 'extras', 61709
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-the-sword-ceased-the-seed-kept',
       E'The sword ceased; the ungodly purged',
       E'The chapter closes with the covenant seed kept and the land at rest: *Thus the sword ceased from Yashar''el (Israel): but Jonathan dwelt at Machmas, and began to govern the people; and he destroyed the ungodly men out of Yashar''el (Israel).* (1 Maccabees 9:73). Jonathan''s zeal to purge the ungodly out of Israel is the zeal of Phinehas, who turned away wrath by standing for the LORD: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* (Numbers 25:11), and for it received *the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* (Numbers 25:13). And the avenging of the brethren''s blood answers the psalm''s plea: *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* (Psalm 79:10). It ain''t new: the covenant people are kept, the ungodly purged, the seed preserved — not a church replacing Israel but Israel held to the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 61712
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=73
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=73
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-9-how-is-the-valiant-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 1:19 — *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* David''s opening lament over Saul and Jonathan supplies the very cry Israel raises over Judas, the valiant man fallen that delivered Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 1:25 — *How are the mighty fallen in the midst of the battle! O Jonathan, thou wast slain in thine high places.* The mighty falling in the midst of the battle is exactly Judas''s end at Eleasa, the same dirge for a fallen captain of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 1:27 — *How are the mighty fallen, and the weapons of war perished!* The closing refrain of David''s song echoes in Israel''s lament for Judas, whose noble acts were too many to be written.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Samuel 3:38 — *And the king said unto his servants, Know ye not that there is a prince and a great man fallen this day in Yashar''el (Israel)?* As David named the loss of a great man in Israel, so Jonathan and Simon bury their brother and Israel mourns a prince fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=3 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-die-manfully-for-our-brothers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Judas''s resolve to die manfully for his brothers rather than flee is this very love made flesh in the field.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-die-manfully-for-our-brothers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith chapter enrolls the Maccabean valiant who, like Judas at Eleasa, were made strong out of weakness.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-die-manfully-for-our-brothers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 3:18 — *To whom Judas answered, It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company:* The same Judas who once heartened the few now will not flee, choosing to die manfully with his brothers.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-die-manfully-for-our-brothers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-save-by-many-or-by-few
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* The eight hundred who stayed with Judas embody Jonathan''s faith that the LORD saves by many or by few.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-save-by-many-or-by-few'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Against the counsel to flee because they were but few, Judas''s own creed answers that the victory is not in numbers but from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-save-by-many-or-by-few'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word grounds the courage of the few: deliverance is by the Spirit, not by the size of the host.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-save-by-many-or-by-few'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-cry-ye-now-to-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* The psalm of the defiled temple is exactly the cry Jonathan commands his trapped company to raise to heaven for deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-cry-ye-now-to-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Jonathan''s order to cry to heaven rests on the family creed that the strength to be delivered comes down from heaven, not from their own number.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-cry-ye-now-to-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-the-sword-ceased-the-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* Jonathan destroying the ungodly out of Israel carries forward Phinehas''s zeal that turns away wrath and keeps the people.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-the-sword-ceased-the-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The Maccabean zeal that purges Israel is rewarded as Phinehas''s was, the covenant kept through the zealous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-the-sword-ceased-the-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* When the brothers avenged fully the blood of John their brother, they enacted the psalm''s plea for the revenging of the blood of His servants.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-the-sword-ceased-the-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_10.sql (session253 1-maccabees 10) -----
-- Source anchor: apocrypha/1-maccabees ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac10 (view _session253_1mac10_lookup). Sort band base 61725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-10-build-the-walls
  ('apocrypha', '1-maccabees', 10, 11, 'canon', 'nehemiah', 2, 17, 'free', E'Nehemiah 2:17 — *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* Jonathan walling Mount Sion with square stones takes up Nehemiah''s very labour — the reproach of a broken Jerusalem answered with rebuilt walls.'),
  ('apocrypha', '1-maccabees', 10, 11, 'canon', 'nehemiah', 4, 6, 'free', E'Nehemiah 4:6 — *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.* As Nehemiah''s people had a mind to work, so Jonathan''s workmen build and it is done — the same single-minded restoration of the city.'),
  ('apocrypha', '1-maccabees', 10, 11, 'canon', 'psalms', 51, 18, 'free', E'Psalm 51:18 — *Do good in thy good pleasure unto Zion: build thou the walls of Jerusalem.* The psalmist''s plea for Zion''s walls is answered in Jonathan''s command to wall the mount Sion with fortified stone.'),
  ('apocrypha', '1-maccabees', 10, 45, 'canon', 'isaiah', 60, 10, 'free', E'Isaiah 60:10 — *And the sons of strangers shall build up thy walls, and their kings shall minister unto thee: for in my wrath I smote thee, but in my favour have I had mercy on thee.* The pagan king''s accounts paying for Jerusalem''s walls is the strangers and their kings made to minister to Zion just as Isaiah foretold.'),
  -- thread: 1-maccabees-10-high-priest-holy-robe
  ('apocrypha', '1-maccabees', 10, 21, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The Maccabean priesthood Jonathan now wears descends from Phinehas'' zeal — the same fire for the covenant that turns away wrath.'),
  ('apocrypha', '1-maccabees', 10, 20, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* Jonathan''s ordination to the high priesthood is the covenant of an everlasting priesthood given to the zealous, kept alive in the house of Mattathias.'),
  ('apocrypha', '1-maccabees', 10, 21, 'canon', 'exodus', 28, 2, 'free', E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* The holy robe Jonathan puts on is the very priestly vesture Yahuah commanded for Aaron, for glory and for beauty — the office restored, not replaced.'),
  ('apocrypha', '1-maccabees', 10, 21, 'canon', 'zechariah', 3, 4, 'free', E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* As Joshua the high priest was stripped of filthy garments and re-clothed, so the defiled high priesthood is cleansed and re-vested when Jonathan dons the holy robe.'),
  -- thread: 1-maccabees-10-feasts-sabbaths-newmoons
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts and solemn days the king frees for the Yahudim are the very feasts Yahuah claims as His own holy convocations.'),
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'numbers', 28, 11, 'free', E'Numbers 28:11 — *And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot.* The new moons set free in the king''s decree are the beginnings of months Torah appoints for offering unto Yahuah.'),
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'isaiah', 1, 14, 'free', E'Isaiah 1:14 — *Your new moons and your appointed feasts my soul hateth: they are a trouble unto me; I am weary to bear them.* The same feasts and new moons Jonathan''s people are freed to keep are despised only when emptied of justice — the prophet rebukes the heart, not the calendar.'),
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'colossians', 2, 16, 'free', E'Colossians 2:16 — *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days.* Paul names the very triad freed here — holyday, new moon, sabbath — guarding the keeping of them from the judgment of men, not abolishing them.'),
  -- thread: 1-maccabees-10-accusers-flee-clothed-in-honor
  ('apocrypha', '1-maccabees', 10, 62, 'canon', 'zechariah', 3, 4, 'free', E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* Jonathan stripped of his garments and clothed in purple before the king is Joshua the high priest re-robed before the accuser — the reproach removed, the servant honoured.'),
  ('apocrypha', '1-maccabees', 10, 64, 'canon', 'zechariah', 3, 5, 'free', E'Zechariah 3:5 — *And I said, Let them set a fair mitre upon his head. So they set a fair mitre upon his head, and clothed him with garments. And the angel of Yahuah (LORD) stood by.* As Joshua was crowned with a fair mitre and the accusing satan silenced, so Jonathan is clothed in purple and his accusers flee all away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-build-the-walls',
       E'Build and repair the city — the walls of Zion rise again',
       E'With the tower''s hostages restored to their parents, Jonathan turns at once to stone and mortar: *This done, Jonathan settled himself in Jerusalem, and began to build and repair the city.* *And he commanded the workmen to build the walls and the mount Sion and about with square stones for fortification; and they did so.* (1 Maccabees 10:10-11). And when even the foreign kings are made to bankroll it — *Yea, and for the building of the walls of Jerusalem, and the fortifying thereof round about, expences shall be given out of the king''s accounts* (1 Maccabees 10:45) — this is no new thing. It is Nehemiah''s cry come round again: *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* (Nehemiah 2:17), answered by the same single mind: *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.* (Nehemiah 4:6). It is the prayer of the psalmist made stone: *Do good in thy good pleasure unto Zion: build thou the walls of Jerusalem.* (Psalm 51:18) — and the promise that even Gentile kings would be bent to the work: *And the sons of strangers shall build up thy walls, and their kings shall minister unto thee: for in my wrath I smote thee, but in my favour have I had mercy on thee.* (Isaiah 60:10). The covenant people are not replaced; they are rebuilt, the same wall on the same mount.',
       sv.verse_id, ev.verse_id, 'extras', 61725
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-high-priest-holy-robe',
       E'The high priesthood restored — Jonathan puts on the holy robe',
       E'The office that Antiochus had defiled is set right again upon a son of the zealous house: *Wherefore now this day we ordain you to be the high priest of your nation... (and therewithal he sent him a purple robe and a crown of gold)* (1 Maccabees 10:20), and Jonathan answers it on the appointed day — *So in the seventh month of the hundred and sixtieth year, at the feast of the tabernacles, Jonathan put on the holy robe, and gathered together forces* (1 Maccabees 10:21). The priesthood comes to the Hasmoneans as heirs of the original zeal, the covenant first sworn to Phinehas: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* (Numbers 25:11), *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* (Numbers 25:13) — the Maccabees'' zeal for the law was Phinehas'' zeal renewed. The holy robe Jonathan dons is the very vesture commanded at Sinai: *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* (Exodus 28:2). And the picture of a high priest re-clothed after defilement is Joshua the high priest in the prophet''s vision: *Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4) — the priesthood is not abolished but cleansed and re-vested.',
       sv.verse_id, ev.verse_id, 'extras', 61728
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-feasts-sabbaths-newmoons',
       E'The feasts, sabbaths, and new moons kept free',
       E'When the king''s grant secures the calendar of Yahuah for all the people — *Furthermore I will that all the feasts, and sabbaths, and new moons, and solemn days, and the three days before the feast, and the three days after the feast shall be all of immunity and freedom for all the Yahudim (Jews) in my realm.* (1 Maccabees 10:34) — what is freed is precisely the appointed times Yahuah named His own: *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2). The new moons stand in that same Torah list: *And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot* (Numbers 28:11). These are no abolished shadows to be despised — when kept in faith they are honoured, and only divorced from a right heart does the prophet rebuke them: *Your new moons and your appointed feasts my soul hateth: they are a trouble unto me; I am weary to bear them.* (Isaiah 1:14). Paul, far from cancelling them, calls them the body''s own forecast: *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days* (Colossians 2:16) — the feast, the new moon, the sabbath, freed for the faithful in Jonathan''s day as in our own.',
       sv.verse_id, ev.verse_id, 'extras', 61731
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-accusers-flee-clothed-in-honor',
       E'The accusers flee — the servant clothed in honour',
       E'When the wicked of Yashar''el rise to slander Jonathan before the king, the king will not hear them, and reverses their accusation into vindication: *Yea more than that, the king commanded to take off his garments, and clothe him in purple: and they did so.* (1 Maccabees 10:62), *Now when his accusers saw that he was honored according to the proclamation, and clothed in purple, they fled all away.* (1 Maccabees 10:64). This is the prophet''s courtroom vision exactly: the adversary stands to accuse the high priest, and the verdict is not condemnation but re-robing — *Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4), *And I said, Let them set a fair mitre upon his head. So they set a fair mitre upon his head, and clothed him with garments. And the angel of Yahuah (LORD) stood by.* (Zechariah 3:5). The faithful servant accused before the throne is stripped of reproach and clothed in glory; the accusers, like the satan silenced, flee away.',
       sv.verse_id, ev.verse_id, 'extras', 61734
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=61
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=64
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-10-build-the-walls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 2:17 — *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* Jonathan walling Mount Sion with square stones takes up Nehemiah''s very labour — the reproach of a broken Jerusalem answered with rebuilt walls.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 4:6 — *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.* As Nehemiah''s people had a mind to work, so Jonathan''s workmen build and it is done — the same single-minded restoration of the city.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:18 — *Do good in thy good pleasure unto Zion: build thou the walls of Jerusalem.* The psalmist''s plea for Zion''s walls is answered in Jonathan''s command to wall the mount Sion with fortified stone.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 60:10 — *And the sons of strangers shall build up thy walls, and their kings shall minister unto thee: for in my wrath I smote thee, but in my favour have I had mercy on thee.* The pagan king''s accounts paying for Jerusalem''s walls is the strangers and their kings made to minister to Zion just as Isaiah foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-10-high-priest-holy-robe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The Maccabean priesthood Jonathan now wears descends from Phinehas'' zeal — the same fire for the covenant that turns away wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* Jonathan''s ordination to the high priesthood is the covenant of an everlasting priesthood given to the zealous, kept alive in the house of Mattathias.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* The holy robe Jonathan puts on is the very priestly vesture Yahuah commanded for Aaron, for glory and for beauty — the office restored, not replaced.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* As Joshua the high priest was stripped of filthy garments and re-clothed, so the defiled high priesthood is cleansed and re-vested when Jonathan dons the holy robe.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-10-feasts-sabbaths-newmoons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts and solemn days the king frees for the Yahudim are the very feasts Yahuah claims as His own holy convocations.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 28:11 — *And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot.* The new moons set free in the king''s decree are the beginnings of months Torah appoints for offering unto Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:14 — *Your new moons and your appointed feasts my soul hateth: they are a trouble unto me; I am weary to bear them.* The same feasts and new moons Jonathan''s people are freed to keep are despised only when emptied of justice — the prophet rebukes the heart, not the calendar.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 2:16 — *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days.* Paul names the very triad freed here — holyday, new moon, sabbath — guarding the keeping of them from the judgment of men, not abolishing them.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-10-accusers-flee-clothed-in-honor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* Jonathan stripped of his garments and clothed in purple before the king is Joshua the high priest re-robed before the accuser — the reproach removed, the servant honoured.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-accusers-flee-clothed-in-honor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 3:5 — *And I said, Let them set a fair mitre upon his head. So they set a fair mitre upon his head, and clothed him with garments. And the angel of Yahuah (LORD) stood by.* As Joshua was crowned with a fair mitre and the accusing satan silenced, so Jonathan is clothed in purple and his accusers flee all away.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-accusers-flee-clothed-in-honor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_11.sql (session253 1-maccabees 11) -----
-- Source anchor: apocrypha/1-maccabees ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac11 (view _session253_1mac11_lookup). Sort band base 61750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-11-shifting-crowns
  ('apocrypha', '1-maccabees', 11, 13, 'canon', 'daniel', 11, 6, 'free', E'Daniel 11:6 — *And in the end of years they shall join themselves together; for the king’s daughter of the south shall come to the king of the north to make an agreement: but she shall not retain the power of the arm; neither shall he stand, nor his arm: but she shall be given up, and they that brought her, and he that begat her, and he that strengthened her in these times.* Daniel had already mapped this very marriage-alliance of the Ptolemaic daughter and the seizing of two crowns in 1 Maccabees 11:13.'),
  ('apocrypha', '1-maccabees', 11, 18, 'canon', 'psalms', 146, 4, 'free', E'Psalm 146:4 — *His breath goeth forth, he returneth to his earth; in that very day his thoughts perish.* Ptolemee crowns himself king of two realms and dies the third day after (1 Maccabees 11:18), his thoughts perishing exactly as the psalm warns of every son of Adam.'),
  ('apocrypha', '1-maccabees', 11, 17, 'canon', 'job', 12, 21, 'free', E'Job 12:21 — *He poureth contempt upon princes, and weakeneth the strength of the mighty.* Alexander’s head sent to Ptolemee and Ptolemee’s own swift fall (1 Maccabees 11:17) are Yahuah’s hand emptying the mighty of their strength.'),
  ('apocrypha', '1-maccabees', 11, 12, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Ptolemee’s taking back his daughter and forsaking Alexander (1 Maccabees 11:12) only enacts a turning of kings’ hearts already held in Yahuah’s hand.'),
  -- thread: 1-maccabees-11-covenant-kept
  ('apocrypha', '1-maccabees', 11, 33, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Demetrius is moved to do good and confirm the covenant-keeping Yahudim (1 Maccabees 11:33) because the heathen king’s heart is itself a river in Yahuah’s hand.'),
  ('apocrypha', '1-maccabees', 11, 27, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar’el (Israel).* The priesthood confirmed to Jonathan (1 Maccabees 11:27) descends from the everlasting priesthood Yahuah covenanted to zealous Phinehas, the same zeal the Maccabean house carries.'),
  ('apocrypha', '1-maccabees', 11, 37, 'canon', 'deuteronomy', 27, 8, 'free', E'Deuteronomy 27:8 — *And thou shalt write upon the stones all the words of this law very plainly.* Setting the confirming decree upon the holy mount in a conspicuous place (1 Maccabees 11:37) echoes Israel’s command to publish the covenant words plainly upon the mountain stones.'),
  -- thread: 1-maccabees-11-faithful-deliver-the-king
  ('apocrypha', '1-maccabees', 11, 47, 'canon', 'joshua', 23, 10, 'free', E'Joshua 23:10 — *One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you.* The three thousand Yahudim routing the great city (1 Maccabees 11:47) enact the promise that the LORD multiplies the kept seed, one chasing a thousand.'),
  ('apocrypha', '1-maccabees', 11, 44, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan sending only three thousand strong men to Antioch (1 Maccabees 11:44) trusts the same truth his namesake spoke, that Yahuah saves by few as easily as by many.'),
  ('apocrypha', '1-maccabees', 11, 48, 'canon', 'job', 12, 18, 'free', E'Job 12:18 — *He looseth the bond of kings, and girdeth their loins with a girdle.* The faithful delivering and re-establishing the king (1 Maccabees 11:48) is Yahuah’s own loosing and girding of kings worked through His covenant people.'),
  -- thread: 1-maccabees-11-rent-clothes-and-prayed
  ('apocrypha', '1-maccabees', 11, 71, 'canon', 'joshua', 7, 6, 'free', E'Joshua 7:6 — *And Joshua rent his clothes, and fell to the earth upon his face before the ark of Yahuah (LORD) until the eventide, he and the elders of Yashar’el (Israel), and put dust upon their heads.* Jonathan rending his clothes and casting earth on his head when the battle failed (1 Maccabees 11:71) is the very mourning-before-Yahuah of Joshua at Ai.'),
  ('apocrypha', '1-maccabees', 11, 71, 'canon', '1-samuel', 7, 8, 'free', E'1 Samuel 7:8 — *And the children of Yashar’el (Israel) said to Samuel, Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us, that he will save us out of the hand of the Philistines.* Jonathan’s prayer in the dust (1 Maccabees 11:71) follows Israel’s pattern: deliverance comes through the cry to Yahuah, not the strength of the host.'),
  ('apocrypha', '1-maccabees', 11, 72, 'canon', 'exodus', 17, 11, 'free', E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar’el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* That Jonathan prevails only after he prays (1 Maccabees 11:72) echoes Amalek’s defeat hanging on uplifted hands of intercession rather than the sword alone.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-shifting-crowns',
       E'Two crowns upon one head — the kings of the north and the south',
       E'The chapter opens with Ptolemee marching north through deceit, *And the king of Egypt gathered together a great host, like the sand that lieth upon the sea shore, and many ships, and went about through deceit to get Alexander’s kingdom, and join it to his own* (1 Maccabees 11:1), until *Then Ptolemee entered into Antioch, where he set two crowns upon his head, the crown of Asia, and of Egypt* (1 Maccabees 11:13) — yet within days Alexander is beheaded and Ptolemee himself dies: *King Ptolemee also died the third day after, and they that were in the strong holds were slain one of another* (1 Maccabees 11:18). This is the very wrestle Daniel foresaw two centuries before, the king of the south and the king of the north grinding against each other, *And in the end of years they shall join themselves together; for the king’s daughter of the south shall come to the king of the north to make an agreement: but she shall not retain the power of the arm; neither shall he stand, nor his arm: but she shall be given up, and they that brought her, and he that begat her, and he that strengthened her in these times* (Daniel 11:6) — for here the daughter is taken from Alexander and given to Demetrius. It ain’t new: the kingdom-of-man rises and topples on schedule, and it is Yahuah who governs the turning. *He poureth contempt upon princes, and weakeneth the strength of the mighty* (Job 12:21), and *His breath goeth forth, he returneth to his earth; in that very day his thoughts perish* (Psalm 146:4). The crowns change heads while the King of the world keeps His covenant.',
       sv.verse_id, ev.verse_id, 'extras', 61750
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-covenant-kept',
       E'Because they keep covenants with us — the priesthood confirmed',
       E'Demetrius writes to ratify the standing of the remnant, *We are determined to do good to the people of the Yahudim (Jews), who are our friends, and keep covenants with us, because of their good will toward us* (1 Maccabees 11:33), and the king *confirmed him in the high priesthood, and in all the honours that he had before, and gave him preeminence among his chief friends* (1 Maccabees 11:27), even ordering that the decree be *set upon the holy mount in a conspicuous place* (1 Maccabees 11:37). Note the witness the heathen king bears: this people *keep covenants*. That is the whole testimony of the seed Yahuah preserves — the covenant people kept, not a new people replacing them. It ain’t new: the high priesthood confirmed here descends from the everlasting priesthood Yahuah swore at Peor, *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar’el (Israel)* (Numbers 25:13) — the zeal of Phinehas, the zeal of the Maccabean house. And the publishing of the decree on the holy mount is the old command, *And thou shalt write upon the stones all the words of this law very plainly* (Deuteronomy 27:8). The honours rest on the same covenant Yahuah swore to Israel, and the document stands as a perpetual witness, *And nothing of this shall be revoked from this time forth for ever* (1 Maccabees 11:36).',
       sv.verse_id, ev.verse_id, 'extras', 61753
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-faithful-deliver-the-king',
       E'The Yahudim came at once and delivered the king',
       E'When Antioch rose against Demetrius, *the king called to the Yahudim (Jews) for help, who came to him all at once, and dispersing themselves through the city slew that day in the city to the number of an hundred thousand* (1 Maccabees 11:47), so that *Also they set fire on the city, and got many spoils that day, and delivered the king* (1 Maccabees 11:48). Three thousand of the faithful (1 Maccabees 11:44) overcome a city of a hundred and twenty thousand — the few against the many, as always with the remnant. It ain’t new: this is the old confidence of Jonathan son of Saul, *Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). The deliverance is not the strength of three thousand swords but the covenant promise, *One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you* (Joshua 23:10). And the loosing and re-establishing of the king is itself the LORD’s work, *He looseth the bond of kings, and girdeth their loins with a girdle* (Job 12:18).',
       sv.verse_id, ev.verse_id, 'extras', 61756
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-11-rent-clothes-and-prayed',
       E'He rent his clothes, cast earth on his head, and prayed',
       E'At the plain of Nasor the ambush breaks Jonathan’s host so that *Insomuch as there was not one of them left, except Mattathias the son of Absalom, and Judas the son of Calphi, the captains of the host* (1 Maccabees 11:70) — and then the decisive act: *Then Jonathan rent his clothes, and cast earth upon his head, and prayed* (1 Maccabees 11:71). Only after the prayer does the tide turn, *Afterwards turning again to battle, he put them to flight, and so they ran away* (1 Maccabees 11:72). This is the posture of the man of the covenant in the dust before Yahuah, the very image of Joshua before the ark, *And Joshua rent his clothes, and fell to the earth upon his face before the ark of Yahuah (LORD) until the eventide, he and the elders of Yashar’el (Israel), and put dust upon their heads* (Joshua 7:6). It ain’t new: Israel’s victory was never in the sword but in the cry, *And the children of Yashar’el (Israel) said to Samuel, Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us, that he will save us out of the hand of the Philistines* (1 Samuel 7:8). Jonathan prays, and the rout becomes a pursuit, *So there were slain of the heathen that day about three thousand men: but Jonathan returned to Jerusalem* (1 Maccabees 11:74) — the captain back at the holy city by the hand of Yahuah, not his own arm.',
       sv.verse_id, ev.verse_id, 'extras', 61759
  FROM _session253_1mac11_lookup sv, _session253_1mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=70
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=11 AND ev.verse_number=74
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-11-shifting-crowns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:6 — *And in the end of years they shall join themselves together; for the king’s daughter of the south shall come to the king of the north to make an agreement: but she shall not retain the power of the arm; neither shall he stand, nor his arm: but she shall be given up, and they that brought her, and he that begat her, and he that strengthened her in these times.* Daniel had already mapped this very marriage-alliance of the Ptolemaic daughter and the seizing of two crowns in 1 Maccabees 11:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 146:4 — *His breath goeth forth, he returneth to his earth; in that very day his thoughts perish.* Ptolemee crowns himself king of two realms and dies the third day after (1 Maccabees 11:18), his thoughts perishing exactly as the psalm warns of every son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 12:21 — *He poureth contempt upon princes, and weakeneth the strength of the mighty.* Alexander’s head sent to Ptolemee and Ptolemee’s own swift fall (1 Maccabees 11:17) are Yahuah’s hand emptying the mighty of their strength.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Ptolemee’s taking back his daughter and forsaking Alexander (1 Maccabees 11:12) only enacts a turning of kings’ hearts already held in Yahuah’s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-shifting-crowns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-11-covenant-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Demetrius is moved to do good and confirm the covenant-keeping Yahudim (1 Maccabees 11:33) because the heathen king’s heart is itself a river in Yahuah’s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-covenant-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar’el (Israel).* The priesthood confirmed to Jonathan (1 Maccabees 11:27) descends from the everlasting priesthood Yahuah covenanted to zealous Phinehas, the same zeal the Maccabean house carries.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-covenant-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 27:8 — *And thou shalt write upon the stones all the words of this law very plainly.* Setting the confirming decree upon the holy mount in a conspicuous place (1 Maccabees 11:37) echoes Israel’s command to publish the covenant words plainly upon the mountain stones.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-covenant-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-11-faithful-deliver-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 23:10 — *One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you.* The three thousand Yahudim routing the great city (1 Maccabees 11:47) enact the promise that the LORD multiplies the kept seed, one chasing a thousand.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-faithful-deliver-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan sending only three thousand strong men to Antioch (1 Maccabees 11:44) trusts the same truth his namesake spoke, that Yahuah saves by few as easily as by many.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-faithful-deliver-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 12:18 — *He looseth the bond of kings, and girdeth their loins with a girdle.* The faithful delivering and re-establishing the king (1 Maccabees 11:48) is Yahuah’s own loosing and girding of kings worked through His covenant people.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-faithful-deliver-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-11-rent-clothes-and-prayed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 7:6 — *And Joshua rent his clothes, and fell to the earth upon his face before the ark of Yahuah (LORD) until the eventide, he and the elders of Yashar’el (Israel), and put dust upon their heads.* Jonathan rending his clothes and casting earth on his head when the battle failed (1 Maccabees 11:71) is the very mourning-before-Yahuah of Joshua at Ai.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-rent-clothes-and-prayed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=71
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 7:8 — *And the children of Yashar’el (Israel) said to Samuel, Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us, that he will save us out of the hand of the Philistines.* Jonathan’s prayer in the dust (1 Maccabees 11:71) follows Israel’s pattern: deliverance comes through the cry to Yahuah, not the strength of the host.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-rent-clothes-and-prayed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=71
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 17:11 — *And it came to pass, when Moses held up his hand, that Yashar’el (Israel) prevailed: and when he let down his hand, Amalek prevailed.* That Jonathan prevails only after he prays (1 Maccabees 11:72) echoes Amalek’s defeat hanging on uplifted hands of intercession rather than the sword alone.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac11_lookup sv, _session253_1mac11_lookup tv
 WHERE t.slug='1-maccabees-11-rent-clothes-and-prayed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=11 AND sv.verse_number=72
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_12.sql (session253 1-maccabees 12) -----
-- Source anchor: apocrypha/1-maccabees ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac12 (view _session253_1mac12_lookup). Sort band base 61775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-12-stock-of-abraham
  ('apocrypha', '1-maccabees', 12, 21, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The stock of Abraham the Spartans claim in 1 Maccabees 12:21 is the innumerable seed Yahuah promised to grow until it filled the nations.'),
  ('apocrypha', '1-maccabees', 12, 21, 'canon', 'genesis', 17, 5, 'free', E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Abraham being made a father of many nations is the writing that lets a far people in 1 Maccabees 12:21 still be reckoned brothers of the Yahudim.'),
  ('apocrypha', '1-maccabees', 12, 21, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant to Abraham''s seed is the deeper league standing under the friendship renewed in 1 Maccabees 12:21.'),
  ('apocrypha', '1-maccabees', 12, 6, 'apocrypha', '2-maccabees', 1, 2, 'extras', E'2 Maccabees 1:2 — *Yahuah (God) be gracious to you, and remember his covenant that he made with Abraham, Isaac, and Jacob, his faithful servants;* The brotherhood greeting Jonathan sends in 1 Maccabees 12:6 leans on the same covenant of the fathers that frames the Jerusalem brethren''s letter to their kin.'),
  -- thread: 1-maccabees-12-help-from-heaven
  ('apocrypha', '1-maccabees', 12, 15, 'apocrypha', '2-maccabees', 15, 7, 'extras', E'2 Maccabees 15:7 — *But Maccabeus had ever sure confidence that Yahuah (God) would help him:* The help from heaven Jonathan names in 1 Maccabees 12:15 is the same sure confidence in which his brother house fought, trusting deliverance to come from above.'),
  ('apocrypha', '1-maccabees', 12, 15, 'apocrypha', '2-maccabees', 15, 8, 'extras', E'2 Maccabees 15:8 — *Wherefore he exhorted his people not to fear the coming of the heathen against them, but to remember the help which in former times they had received from heaven, and now to expect the victory and aid, which should come to them from the Almighty.* The help from heaven that succoureth in 1 Maccabees 12:15 is exactly the remembered aid the Maccabees set against the dread of the heathen.'),
  ('apocrypha', '1-maccabees', 12, 9, 'apocrypha', '2-maccabees', 15, 34, 'extras', E'2 Maccabees 15:34 — *So every man praised toward the heaven the glorious Yahuah (God), saying, Blessed be he that has kept his own place undefiled.* Where 1 Maccabees 12:9 finds comfort in the holy books and heaven''s aid, the deliverance ends in praise lifted toward the same heaven that keeps its own place undefiled.'),
  -- thread: 1-maccabees-12-snare-of-the-trusting
  ('apocrypha', '1-maccabees', 12, 46, 'canon', 'psalms', 41, 9, 'free', E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Jonathan believing Tryphon and being taken in 1 Maccabees 12:46 is the ancient wound of the trusting betrayed by the friend who shared his table.'),
  ('apocrypha', '1-maccabees', 12, 43, 'canon', 'john', 13, 18, 'free', E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* The honour and gifts with which Tryphon masks his snare in 1 Maccabees 12:43 foreshadow the betrayal-by-friendship the Messiah names at His own table.'),
  ('apocrypha', '1-maccabees', 12, 44, 'canon', 'proverbs', 26, 25, 'free', E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* Tryphon''s fair words in 1 Maccabees 12:44 — there is no war between us — are the smooth speech the proverb warns hides a heart full of hidden malice.'),
  ('apocrypha', '1-maccabees', 12, 46, 'apocrypha', 'ecclesiasticus', 12, 10, 'extras', E'Sirach 12:10 — *Never trust your enemy: for like as iron rusteth, so is his wickedness.* Jonathan trusting and disarming himself in 1 Maccabees 12:46 is the very thing the wisdom of Sirach forbids — the enemy''s wickedness only waits, like rust, for its hour.'),
  -- thread: 1-maccabees-12-lamentation-no-captain
  ('apocrypha', '1-maccabees', 12, 53, 'canon', 'psalms', 41, 5, 'free', E'Psalm 41:5 — *Mine enemies speak evil of me, When shall he die, and his name perish?* The heathen plotting in 1 Maccabees 12:53 to take away Israel''s memorial speak the very wish of the psalmist''s foes — that the righteous die and his name be blotted out.'),
  ('apocrypha', '1-maccabees', 12, 52, 'canon', 'psalms', 41, 2, 'free', E'Psalm 41:2 — *Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth: and thou wilt not deliver him unto the will of his enemies.* Against all Israel''s lamentation in 1 Maccabees 12:52, the psalm answers that Yahuah will not give the trusting over to the will of their enemies.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-stock-of-abraham',
       E'Of the stock of Abraham — the kindred claimed',
       E'When the Lacedemonians write to the high priest, the bond they name is not treaty but blood: *It is found in writing, that the Lacedemonians and Yahudim (Jews) are brothers, and that they are of the stock of Abraham* (1 Maccabees 12:21). It ain''t new — the seed of Abraham was promised to spread until *thy seed* could not be numbered: *Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). The covenant that grew that seed made him *a father of many nations* (Genesis 17:5), the everlasting covenant *between me and thee and thy seed after thee in their generations* (Genesis 17:7). And so the regathered brothers remember one another *both in our feasts, and other convenient days... in the sacrifices which we offer, and in our prayers* (1 Maccabees 12:11) — the covenant people kept, scattered yet still kin, not a stranger-nation replacing them.',
       sv.verse_id, ev.verse_id, 'extras', 61775
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-help-from-heaven',
       E'We have help from heaven — and the holy books in our hands',
       E'Jonathan''s letter waves away need of foreign aid because the true succour is elsewhere: *we have the holy books of scripture in our hands to comfort us* (1 Maccabees 12:9), and *we have help from heaven that succoureth us, so as we are delivered from our enemies, and our enemies are brought under foot* (1 Maccabees 12:15). It ain''t new — this is the unbroken Maccabean confidence: *But Maccabeus had ever sure confidence that Yahuah (God) would help him* (2 Maccabees 15:7), bidding his people *to remember the help which in former times they had received from heaven* (2 Maccabees 15:8). The deliverance is heaven''s, and the praise returns there: *So every man praised toward the heaven the glorious Yahuah (God), saying, Blessed be he that has kept his own place undefiled* (2 Maccabees 15:34). Not the arm of Rome but the help from above brings the enemy under foot.',
       sv.verse_id, ev.verse_id, 'extras', 61778
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-snare-of-the-trusting',
       E'Believing him — the snare of the trusting',
       E'Tryphon cannot break Jonathan in the field, so he breaks him with a kiss of friendship: he *received him honourably, and commended him to all his friends, and gave him gifts* (1 Maccabees 12:43), then said, *seeing there is no war between us... come you with me to Ptolemais, for I will give it you* (1 Maccabees 12:44-45). *So Jonathan believing him did as he told him, and sent away his host* (1 Maccabees 12:46) — and was taken. It ain''t new — this is the oldest grief of the righteous, the table-friend who turns: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). The Messiah will name that same psalm over His own betrayer: *He that eateth bread with me hath lifted up his heel against me* (John 13:18). And the swordless treachery wears a fair face: *When he speaketh fair, believe him not: for there are seven abominations in his heart* (Proverbs 26:25).',
       sv.verse_id, ev.verse_id, 'extras', 61781
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-lamentation-no-captain',
       E'All Israel made great lamentation — no captain to help',
       E'With Jonathan taken, the heathen smell a leaderless flock: *all Yashar''el (Israel) made great lamentation* (1 Maccabees 12:52), and the nations round about say, *They have no captain, nor any to help them: now therefore let us make war upon them, and take away their memorial from among men* (1 Maccabees 12:53). It ain''t new — the cry that goes up is the cry of Psalm 41, the shepherdless people whose enemies wait for the name to perish: *Mine enemies speak evil of me, When shall he die, and his name perish?* (Psalm 41:5). Yet the same psalm answers the threat to take away their memorial: *Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth: and thou wilt not deliver him unto the will of his enemies* (Psalm 41:2). The captain falls, but the help is from heaven (1 Maccabees 12:15) — and the seed of Abraham is not blotted out from among men.',
       sv.verse_id, ev.verse_id, 'extras', 61784
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=52
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-12-stock-of-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The stock of Abraham the Spartans claim in 1 Maccabees 12:21 is the innumerable seed Yahuah promised to grow until it filled the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Abraham being made a father of many nations is the writing that lets a far people in 1 Maccabees 12:21 still be reckoned brothers of the Yahudim.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant to Abraham''s seed is the deeper league standing under the friendship renewed in 1 Maccabees 12:21.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 1:2 — *Yahuah (God) be gracious to you, and remember his covenant that he made with Abraham, Isaac, and Jacob, his faithful servants;* The brotherhood greeting Jonathan sends in 1 Maccabees 12:6 leans on the same covenant of the fathers that frames the Jerusalem brethren''s letter to their kin.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-12-help-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 15:7 — *But Maccabeus had ever sure confidence that Yahuah (God) would help him:* The help from heaven Jonathan names in 1 Maccabees 12:15 is the same sure confidence in which his brother house fought, trusting deliverance to come from above.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-help-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 15:8 — *Wherefore he exhorted his people not to fear the coming of the heathen against them, but to remember the help which in former times they had received from heaven, and now to expect the victory and aid, which should come to them from the Almighty.* The help from heaven that succoureth in 1 Maccabees 12:15 is exactly the remembered aid the Maccabees set against the dread of the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-help-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 15:34 — *So every man praised toward the heaven the glorious Yahuah (God), saying, Blessed be he that has kept his own place undefiled.* Where 1 Maccabees 12:9 finds comfort in the holy books and heaven''s aid, the deliverance ends in praise lifted toward the same heaven that keeps its own place undefiled.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-help-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-12-snare-of-the-trusting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Jonathan believing Tryphon and being taken in 1 Maccabees 12:46 is the ancient wound of the trusting betrayed by the friend who shared his table.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* The honour and gifts with which Tryphon masks his snare in 1 Maccabees 12:43 foreshadow the betrayal-by-friendship the Messiah names at His own table.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* Tryphon''s fair words in 1 Maccabees 12:44 — there is no war between us — are the smooth speech the proverb warns hides a heart full of hidden malice.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 12:10 — *Never trust your enemy: for like as iron rusteth, so is his wickedness.* Jonathan trusting and disarming himself in 1 Maccabees 12:46 is the very thing the wisdom of Sirach forbids — the enemy''s wickedness only waits, like rust, for its hour.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-12-lamentation-no-captain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:5 — *Mine enemies speak evil of me, When shall he die, and his name perish?* The heathen plotting in 1 Maccabees 12:53 to take away Israel''s memorial speak the very wish of the psalmist''s foes — that the righteous die and his name be blotted out.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-lamentation-no-captain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 41:2 — *Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth: and thou wilt not deliver him unto the will of his enemies.* Against all Israel''s lamentation in 1 Maccabees 12:52, the psalm answers that Yahuah will not give the trusting over to the will of their enemies.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-lamentation-no-captain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_13.sql (session253 1-maccabees 13) -----
-- Source anchor: apocrypha/1-maccabees ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac13 (view _session253_1mac13_lookup). Sort band base 61800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-13-simon-chosen-leader
  ('apocrypha', '1-maccabees', 13, 8, 'apocrypha', '1-maccabees', 9, 30, 'extras', E'1 Maccabees 9:30 — *Now therefore we have chosen you this day to be our prince and captain in his stead, that you may fight our battles.* The same acclamation once given to Jonathan now passes to Simon in 1-maccabees 13:8 — the remnant''s leadership handed brother to brother, unbroken.'),
  ('apocrypha', '1-maccabees', 13, 5, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Simon''s refusal to spare his own life for the nation in 1-maccabees 13:5 is the shape of the love the Messiah names and then perfects.'),
  ('apocrypha', '1-maccabees', 13, 9, 'canon', 'zechariah', 9, 13, 'free', E'Zechariah 9:13 — *When I have bent Yahudah (Judah) for me, filled the bow with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece, and made thee as the sword of a mighty man.* The people pledging Simon to fight their battles in 1-maccabees 13:9 is the prophet''s bow of Judah bent against the sons of Greece.'),
  -- thread: 1-maccabees-13-brothers-slain-better-resurrection
  ('apocrypha', '1-maccabees', 13, 3, 'apocrypha', '1-maccabees', 2, 50, 'extras', E'1 Maccabees 2:50 — *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* Simon''s reckoning in 1-maccabees 13:3 of all the house has done for the laws and the sanctuary is the fulfilment of Mattathias'' dying charge.'),
  ('apocrypha', '1-maccabees', 13, 4, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The brothers slain for Israel''s sake in 1-maccabees 13:4 carry the priestly zeal of Phinehas, who stood for the covenant.'),
  ('apocrypha', '1-maccabees', 13, 4, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The brothers slain in 1-maccabees 13:4 are among those tortured who looked past deliverance to the better resurrection.'),
  ('apocrypha', '1-maccabees', 13, 4, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The hope behind the brothers'' deaths in 1-maccabees 13:4 is voiced plainly by the martyr brother under the same persecution.'),
  ('apocrypha', '1-maccabees', 13, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel had already sealed the everlasting life that crowns the brothers fallen for Israel in 1-maccabees 13:4.'),
  -- thread: 1-maccabees-13-yoke-removed-first-year
  ('apocrypha', '1-maccabees', 13, 42, 'canon', 'leviticus', 25, 10, 'free', E'Leviticus 25:10 — *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* Israel''s new reckoning from the first year of Simon in 1-maccabees 13:42 is the jubilee proclamation of liberty written into their dating itself.'),
  ('apocrypha', '1-maccabees', 13, 41, 'canon', 'isaiah', 9, 4, 'free', E'Isaiah 9:4 — *For thou hast broken the yoke of his burden, and the staff of his shoulder, the rod of his oppressor, as in the day of Midian.* The heathen yoke taken away in 1-maccabees 13:41 is the broken yoke Isaiah sang of in the day of the Child to be born.'),
  ('apocrypha', '1-maccabees', 13, 41, 'canon', 'isaiah', 10, 27, 'free', E'Isaiah 10:27 — *And it shall come to pass in that day, that his burden shall be taken away from off thy shoulder, and his yoke from off thy neck, and the yoke shall be destroyed because of the anointing.* The yoke destroyed because of the anointing answers the heathen yoke lifted from Israel in 1-maccabees 13:41.'),
  ('apocrypha', '1-maccabees', 13, 41, 'canon', 'isaiah', 14, 25, 'free', E'Isaiah 14:25 — *That I will break the Assyrian in my land, and upon my mountains tread him under foot: then shall his yoke depart from off them, and his burden depart from off their shoulders.* Yahuah''s pledge to break the oppressor and lift the burden from the shoulder is realized when the yoke departs from Israel in 1-maccabees 13:41.'),
  -- thread: 1-maccabees-13-cleansed-citadel-feast
  ('apocrypha', '1-maccabees', 13, 52, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon''s ordaining the day of the cleansed citadel to be kept every year in 1-maccabees 13:52 belongs to the same feast of dedication the Messiah Himself kept in Jerusalem.'),
  ('apocrypha', '1-maccabees', 13, 47, 'canon', 'ezekiel', 36, 25, 'free', E'Ezekiel 36:25 — *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* Simon cleansing the houses of the idols in 1-maccabees 13:47 enacts the promised cleansing of the covenant people from their idols.'),
  ('apocrypha', '1-maccabees', 13, 48, 'canon', 'isaiah', 52, 1, 'free', E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Simon putting all uncleanness out and setting law-keepers there in 1-maccabees 13:48 is the holy city into which the unclean shall come no more.'),
  ('apocrypha', '1-maccabees', 13, 48, 'canon', 'zechariah', 14, 21, 'free', E'Zechariah 14:21 — *Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts): and all they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* Simon''s purged stronghold of law-keepers in 1-maccabees 13:48 foreshadows the day when all Jerusalem is holiness and no defiled thing remains.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-simon-chosen-leader',
       E'They chose Simon: be thou our leader',
       E'When Tryphon comes up to destroy Judea and the people quail, Simon stands in the gap and they raise him over them: *And they answered with a loud voice, saying, You shall be our leader instead of Judas and Jonathan your brother.* (1 Maccabees 13:8) — *Fight you our battles, and whatsoever, you commandest us, that will we do.* (1 Maccabees 13:9). This is the same covenant cry the brethren had raised over Jonathan when Judas fell — *Now therefore we have chosen you this day to be our prince and captain in his stead, that you may fight our battles.* (1 Maccabees 9:30): the leadership of the faithful remnant passes brother to brother, never broken, the seed kept against the kingdom-of-man. And Simon does not spare himself — he will spend his own life for the nation, which is the very measure the Messiah names: *Greater love hath no man than this, that a man lay down his life for his friends.* (John 15:13). The little flock of Yahudah is bent like a bow against Greece exactly as the prophet foresaw: *When I have bent Yahudah (Judah) for me, filled the bow with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece, and made thee as the sword of a mighty man.* (Zechariah 9:13).',
       sv.verse_id, ev.verse_id, 'extras', 61800
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-brothers-slain-better-resurrection',
       E'All my brothers are slain for Israel''s sake',
       E'Simon counts the cost his house has paid for the laws and the sanctuary: *By reason of which all my brothers are slain for Yashar''el (Israel)''s sake, and I am left alone.* (1 Maccabees 13:4) — the Torah-faithful giving their lives rather than surrender the covenant, the charge their father laid on them: *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* (1 Maccabees 2:50). It is the priestly zeal of Phinehas, who stood for Yahuah and turned wrath away: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* (Numbers 25:11). And the hope under that dying is never the grave but the rising: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* (Hebrews 11:35) — the very faith confessed by the brother under Antiochus'' torments, *the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9), which the prophet Daniel had already sealed: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 61803
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-yoke-removed-first-year',
       E'The yoke taken away: the first year of Simon',
       E'The deliverance is reckoned not as conquest but as release: *Thus the yoke of the heathen was taken away from Yashar''el (Israel) in the hundred and seventieth year.* (1 Maccabees 13:41) — *Then the people of Yashar''el (Israel) began to write in their instruments and contracts, In the first year of Simon the high priest, the governor and leader of the Yahudim (Jews).* (1 Maccabees 13:42). A new reckoning of years, a first year — this is the language of the jubilee, the year of liberty: *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* (Leviticus 25:10). The breaking of the heathen yoke is the very deliverance Yeshayahu sang of the Messiah''s day: *For thou hast broken the yoke of his burden, and the staff of his shoulder, the rod of his oppressor, as in the day of Midian.* (Isaiah 9:4) — *And it shall come to pass in that day, that his burden shall be taken away from off thy shoulder, and his yoke from off thy neck, and the yoke shall be destroyed because of the anointing.* (Isaiah 10:27). The oppressor''s kingdom is dismantled and the burden lifted from the shoulder: *That I will break the Assyrian in my land, and upon my mountains tread him under foot: then shall his yoke depart from off them, and his burden depart from off their shoulders.* (Isaiah 14:25).',
       sv.verse_id, ev.verse_id, 'extras', 61806
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-cleansed-citadel-feast',
       E'He cleansed the houses of idols and kept the day',
       E'Simon takes Gaza, then at last the citadel that had defiled Jerusalem, and enters not with plunder but with purging: *but put them out of the city, and cleansed the houses in which the idols were, and so entered into it with songs and thanksgiving.* (1 Maccabees 13:47) — *Yea, he put all uncleanness out of it, and placed such men there as would keep the law, and made it stronger than it was before, and built in it a dwellingplace for himself.* (1 Maccabees 13:48). He enters the tower with palm branches and harps and hymns, and *ordained also that that day should be kept every year with gladness* (1 Maccabees 13:52) — a feast born of cleansing the sanctuary, the kind the Messiah Himself would keep: *And it was at Jerusalem the feast of the dedication, and it was winter.* (John 10:22). The casting out of idols is the promised cleansing of the covenant people: *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* (Ezekiel 36:25) — until the holy city holds nothing unclean: *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* (Isaiah 52:1), every vessel made holiness to Yahuah: *Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts): and all they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* (Zechariah 14:21).',
       sv.verse_id, ev.verse_id, 'extras', 61809
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=47
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-13-simon-chosen-leader
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 9:30 — *Now therefore we have chosen you this day to be our prince and captain in his stead, that you may fight our battles.* The same acclamation once given to Jonathan now passes to Simon in 1-maccabees 13:8 — the remnant''s leadership handed brother to brother, unbroken.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-simon-chosen-leader'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=9 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Simon''s refusal to spare his own life for the nation in 1-maccabees 13:5 is the shape of the love the Messiah names and then perfects.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-simon-chosen-leader'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 9:13 — *When I have bent Yahudah (Judah) for me, filled the bow with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece, and made thee as the sword of a mighty man.* The people pledging Simon to fight their battles in 1-maccabees 13:9 is the prophet''s bow of Judah bent against the sons of Greece.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-simon-chosen-leader'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-13-brothers-slain-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 2:50 — *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* Simon''s reckoning in 1-maccabees 13:3 of all the house has done for the laws and the sanctuary is the fulfilment of Mattathias'' dying charge.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The brothers slain for Israel''s sake in 1-maccabees 13:4 carry the priestly zeal of Phinehas, who stood for the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The brothers slain in 1-maccabees 13:4 are among those tortured who looked past deliverance to the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The hope behind the brothers'' deaths in 1-maccabees 13:4 is voiced plainly by the martyr brother under the same persecution.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel had already sealed the everlasting life that crowns the brothers fallen for Israel in 1-maccabees 13:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-13-yoke-removed-first-year
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:10 — *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* Israel''s new reckoning from the first year of Simon in 1-maccabees 13:42 is the jubilee proclamation of liberty written into their dating itself.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:4 — *For thou hast broken the yoke of his burden, and the staff of his shoulder, the rod of his oppressor, as in the day of Midian.* The heathen yoke taken away in 1-maccabees 13:41 is the broken yoke Isaiah sang of in the day of the Child to be born.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 10:27 — *And it shall come to pass in that day, that his burden shall be taken away from off thy shoulder, and his yoke from off thy neck, and the yoke shall be destroyed because of the anointing.* The yoke destroyed because of the anointing answers the heathen yoke lifted from Israel in 1-maccabees 13:41.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 14:25 — *That I will break the Assyrian in my land, and upon my mountains tread him under foot: then shall his yoke depart from off them, and his burden depart from off their shoulders.* Yahuah''s pledge to break the oppressor and lift the burden from the shoulder is realized when the yoke departs from Israel in 1-maccabees 13:41.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-13-cleansed-citadel-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon''s ordaining the day of the cleansed citadel to be kept every year in 1-maccabees 13:52 belongs to the same feast of dedication the Messiah Himself kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:25 — *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* Simon cleansing the houses of the idols in 1-maccabees 13:47 enacts the promised cleansing of the covenant people from their idols.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Simon putting all uncleanness out and setting law-keepers there in 1-maccabees 13:48 is the holy city into which the unclean shall come no more.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 14:21 — *Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts): and all they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* Simon''s purged stronghold of law-keepers in 1-maccabees 13:48 foreshadows the day when all Jerusalem is holiness and no defiled thing remains.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_14.sql (session253 1-maccabees 14) -----
-- Source anchor: apocrypha/1-maccabees ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac14 (view _session253_1mac14_lookup). Sort band base 61825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-14-vine-and-fig-tree
  ('apocrypha', '1-maccabees', 14, 12, 'canon', 'micah', 4, 4, 'free', E'Micah 4:4 — *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it.* The very phrase 1 Maccabees 14:12 uses for Simon''s peace is Micah''s portrait of the last-days kingdom, none to fray them.'),
  ('apocrypha', '1-maccabees', 14, 12, 'canon', 'zechariah', 3, 10, 'free', E'Zechariah 3:10 — *In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree.* Zechariah binds the vine-and-fig-tree rest to the day of the BRANCH, the same shalom Simon''s rule briefly foreshadows in 1 Maccabees 14:12.'),
  ('apocrypha', '1-maccabees', 14, 12, 'canon', '1-kings', 4, 25, 'free', E'1 Kings 4:25 — *And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon.* Simon''s quiet land in 1 Maccabees 14:12 is Solomon''s golden peace recovered, a sign of the greater Son of David''s reign.'),
  ('apocrypha', '1-maccabees', 14, 8, 'canon', 'leviticus', 26, 4, 'free', E'Leviticus 26:4 — *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit.* The earth giving her increase and the trees their fruit in 1 Maccabees 14:8 is Torah''s own covenant blessing on a people who walk in the statutes — never law-as-curse, but obedience answered with fruit.'),
  -- thread: 1-maccabees-14-law-searched-sanctuary
  ('apocrypha', '1-maccabees', 14, 14, 'canon', 'leviticus', 26, 6, 'free', E'Leviticus 26:6 — *And I will give peace in the land, and ye shall lie down, and none shall make you afraid: and I will rid evil beasts out of the land, neither shall the sword go through your land.* Simon searching out the law and taking away every contemner in 1 Maccabees 14:14 is the covenant condition under which Yahuah promises this very peace and rest.'),
  ('apocrypha', '1-maccabees', 14, 14, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Torah-faithful Simon strengthened in 1 Maccabees 14:14 are the very people Hebrews crowns, who held the law unto a better resurrection rather than break the covenant.'),
  ('apocrypha', '1-maccabees', 14, 14, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The law Simon searches out in 1 Maccabees 14:14 is the same law for which the seven brothers died, certain the King of the world would raise them up.'),
  ('apocrypha', '1-maccabees', 14, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The seed kept faithful to the law in 1 Maccabees 14:14 looks to Daniel''s promised awakening, the resurrection that is the true hope of the covenant-keepers.'),
  -- thread: 1-maccabees-14-enduring-priesthood
  ('apocrypha', '1-maccabees', 14, 26, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The house confirmed to Simon and his sons in 1 Maccabees 14:26 stands in the line of Phinehas, whose zeal won the covenant of an everlasting priesthood for his seed.'),
  ('apocrypha', '1-maccabees', 14, 49, 'apocrypha', '1-maccabees', 2, 54, 'extras', E'1 Maccabees 2:54 — *Phinees our father in being zealous and fervent obtained the covenant of an everlasting priesthood.* Mattathias'' own deathbed roll-call names the very pattern fulfilled when Simon and his sons are given the enduring priesthood in 1 Maccabees 14:49.'),
  ('apocrypha', '1-maccabees', 14, 41, 'canon', 'zechariah', 3, 8, 'free', E'Zechariah 3:8 — *Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH.* Simon holds the high priesthood only until a faithful prophet arise (1 Maccabees 14:41); Zechariah names the One it waits for, the BRANCH who is Priest and King.'),
  -- thread: 1-maccabees-14-house-established
  ('apocrypha', '1-maccabees', 14, 26, 'canon', 'micah', 4, 6, 'free', E'Micah 4:6 — *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted.* Simon establishing Yashar''el and strengthening the brought-low in 1 Maccabees 14:26 mirrors Yahuah''s own promise to assemble the afflicted and driven-out.'),
  ('apocrypha', '1-maccabees', 14, 26, 'canon', 'micah', 4, 7, 'free', E'Micah 4:7 — *And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever.* The liberty Simon confirms to a re-established Israel in 1 Maccabees 14:26 foreshadows the remnant made a strong nation under Yahuah''s everlasting reign in Zion.'),
  -- thread: 1-maccabees-14-feast-rededication
  ('apocrypha', '1-maccabees', 14, 15, 'apocrypha', '1-maccabees', 4, 59, 'extras', E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The sanctuary Simon beautifies in 1 Maccabees 14:15 is the one Judas first rededicated, founding the eight-day feast kept year by year.'),
  ('apocrypha', '1-maccabees', 14, 15, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon beautifying and guarding the cleansed sanctuary in 1 Maccabees 14:15 stands behind the feast of dedication that the Messiah himself kept in Jerusalem.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-vine-and-fig-tree',
       E'Every man under his vine and fig tree',
       E'When Simon''s hand held the land, Yashar''el tasted the messianic shalom: *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit* (1 Maccabees 14:8), and *For every man sat under his vine and his fig tree, and there was none to fray them* (1 Maccabees 14:12). This is no new picture — it is the prophets'' very emblem of the kingdom. Micah set it in the last days: *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). Zechariah hung it on the day of the BRANCH: *In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10). It was Solomon''s golden reign remembered: *And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon* (1 Kings 4:25). And it is Torah''s own covenant promise to the obedient: *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit* (Leviticus 26:4). Simon''s peace is a firstfruits foretaste of the rest the Messiah brings — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61825
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-law-searched-sanctuary',
       E'The law he searched out, the sanctuary he beautified',
       E'Simon''s peace was no mere prosperity; it was covenant-keeping made visible: *Moreover he strengthened all those of his people that were brought low: the law he searched out; and every contemner of the law and wicked person he took away* (1 Maccabees 14:14), and *He beautified the sanctuary, and multiplied vessels of the temple* (1 Maccabees 14:15). This is the Torah-faithfulness that the whole Maccabean witness defends unto death. Leviticus tied the land''s safety to exactly such walking: *And I will give peace in the land, and ye shall lie down, and none shall make you afraid: and I will rid evil beasts out of the land, neither shall the sword go through your land* (Leviticus 26:6). And the hope of those who searched out the law and would not break it was resurrection — the same hope Hebrews honours: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). Their own brothers had confessed it: *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). The law searched out is the seed kept for the day Daniel foresaw: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 61828
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-enduring-priesthood',
       E'The covenant of an enduring priesthood',
       E'The nation cried, *What thanks shall we give to Simon and his sons? For he and his brothers and the house of his father have established Yashar''el (Israel)* (1 Maccabees 14:25-26), and they confirmed the high priesthood to his house: *Also that the Yahudim (Jews) and priests were well pleased that Simon should be their governor and high priest for ever, until there should arise a faithful prophet* (1 Maccabees 14:41), engraving it in brass that *Simon and his sons might have them* (1 Maccabees 14:49). This is the pattern of Phinehas, whose zeal won an enduring house: *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13). Their own fathers had named it so: *Phinees our father in being zealous and fervent obtained the covenant of an everlasting priesthood* (1 Maccabees 2:54). Yet the priesthood is held *until there should arise a faithful prophet* — it points beyond itself to Zechariah''s vision, where the high priest is reclothed and the true Priest-King is promised: *Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH* (Zechariah 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 61831
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-house-established',
       E'He established Israel and gathered her low',
       E'The people''s thanksgiving was that Simon *established Yashar''el (Israel), and chased away in fight their enemies from them, and confirmed their liberty* (1 Maccabees 14:26), having *strengthened all those of his people that were brought low* (1 Maccabees 14:14). This is the covenant people kept and regathered — never a church replacing Yashar''el, but the very remnant the prophets promised to assemble. Micah set the gathering in the same kingdom-day as the vine and fig tree: *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted* (Micah 4:6), *And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:7). The brought-low strengthened, the driven-out established — Simon''s work is a token of the Shepherd-King who gathers the scattered house.',
       sv.verse_id, ev.verse_id, 'extras', 61834
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-feast-rededication',
       E'The sanctuary multiplied — the feast the Messiah kept',
       E'Simon *beautified the sanctuary, and multiplied vessels of the temple* (1 Maccabees 14:15) and took charge *over the sanctuary* (1 Maccabees 14:42), guarding the holy place the Maccabees had cleansed and rededicated. That rededication became a feast Yahusha himself kept: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The Messiah walked in Solomon''s porch at the very feast born of the Maccabean cleansing Simon now defends — it ain''t new; the One who fulfils the temple honoured the festival of its restoration.',
       sv.verse_id, ev.verse_id, 'extras', 61837
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-14-vine-and-fig-tree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 4:4 — *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it.* The very phrase 1 Maccabees 14:12 uses for Simon''s peace is Micah''s portrait of the last-days kingdom, none to fray them.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 3:10 — *In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree.* Zechariah binds the vine-and-fig-tree rest to the day of the BRANCH, the same shalom Simon''s rule briefly foreshadows in 1 Maccabees 14:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 4:25 — *And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon.* Simon''s quiet land in 1 Maccabees 14:12 is Solomon''s golden peace recovered, a sign of the greater Son of David''s reign.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 26:4 — *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit.* The earth giving her increase and the trees their fruit in 1 Maccabees 14:8 is Torah''s own covenant blessing on a people who walk in the statutes — never law-as-curse, but obedience answered with fruit.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-law-searched-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:6 — *And I will give peace in the land, and ye shall lie down, and none shall make you afraid: and I will rid evil beasts out of the land, neither shall the sword go through your land.* Simon searching out the law and taking away every contemner in 1 Maccabees 14:14 is the covenant condition under which Yahuah promises this very peace and rest.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Torah-faithful Simon strengthened in 1 Maccabees 14:14 are the very people Hebrews crowns, who held the law unto a better resurrection rather than break the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The law Simon searches out in 1 Maccabees 14:14 is the same law for which the seven brothers died, certain the King of the world would raise them up.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The seed kept faithful to the law in 1 Maccabees 14:14 looks to Daniel''s promised awakening, the resurrection that is the true hope of the covenant-keepers.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-enduring-priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The house confirmed to Simon and his sons in 1 Maccabees 14:26 stands in the line of Phinehas, whose zeal won the covenant of an everlasting priesthood for his seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-enduring-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 2:54 — *Phinees our father in being zealous and fervent obtained the covenant of an everlasting priesthood.* Mattathias'' own deathbed roll-call names the very pattern fulfilled when Simon and his sons are given the enduring priesthood in 1 Maccabees 14:49.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-enduring-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=49
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 3:8 — *Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH.* Simon holds the high priesthood only until a faithful prophet arise (1 Maccabees 14:41); Zechariah names the One it waits for, the BRANCH who is Priest and King.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-enduring-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-house-established
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 4:6 — *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted.* Simon establishing Yashar''el and strengthening the brought-low in 1 Maccabees 14:26 mirrors Yahuah''s own promise to assemble the afflicted and driven-out.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-house-established'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 4:7 — *And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever.* The liberty Simon confirms to a re-established Israel in 1 Maccabees 14:26 foreshadows the remnant made a strong nation under Yahuah''s everlasting reign in Zion.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-house-established'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-feast-rededication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The sanctuary Simon beautifies in 1 Maccabees 14:15 is the one Judas first rededicated, founding the eight-day feast kept year by year.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-feast-rededication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=59
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon beautifying and guarding the cleansed sanctuary in 1 Maccabees 14:15 stands behind the feast of dedication that the Messiah himself kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-feast-rededication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_15.sql (session253 1-maccabees 15) -----
-- Source anchor: apocrypha/1-maccabees ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac15 (view _session253_1mac15_lookup). Sort band base 61850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-15-flatteries-of-the-king
  ('apocrypha', '1-maccabees', 15, 9, 'canon', 'daniel', 11, 21, 'free', E'Daniel 11:21 — *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* The Seleucid honours of 1 Maccabees 15:9 are flatteries of the king-of-man, who gains by smooth words what he cannot hold by right.'),
  ('apocrypha', '1-maccabees', 15, 9, 'canon', 'isaiah', 49, 23, 'free', E'Isaiah 49:23 — *And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* The honour Antiochus dangles in 1 Maccabees 15:9 is a counterfeit of the true exaltation Yahuah gives the people who wait for Him.'),
  -- thread: 1-maccabees-15-nations-acknowledge-the-gathered
  ('apocrypha', '1-maccabees', 15, 19, 'canon', 'isaiah', 49, 22, 'free', E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* The Roman decree of 1 Maccabees 15:19 protecting the Jews among the nations foreshadows the day Yahuah moves the Gentiles to carry His scattered people home.'),
  ('apocrypha', '1-maccabees', 15, 23, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The catalogue of nations addressed on Israel''s behalf in 1 Maccabees 15:23 anticipates the Gentiles and their kings drawn toward the light of the regathered people.'),
  ('apocrypha', '1-maccabees', 15, 17, 'canon', 'zechariah', 8, 22, 'free', E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The ambassadors of the high priest renewing league with the nations in 1 Maccabees 15:17 prefigure the strong nations turning toward Jerusalem and her God.'),
  -- thread: 1-maccabees-15-inheritance-of-the-fathers
  ('apocrypha', '1-maccabees', 15, 33, 'canon', 'leviticus', 25, 23, 'free', E'Leviticus 25:23 — *The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me.* Simon''s plea in 1 Maccabees 15:33 that they hold only the inheritance of their fathers rests on Yahuah''s claim that the land is His gift to Israel, not man''s to barter.'),
  ('apocrypha', '1-maccabees', 15, 34, 'apocrypha', '1-maccabees', 14, 8, 'extras', E'1 Maccabees 14:8 — *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit.* When the inheritance of the fathers is held in faithfulness as Simon insists in 1 Maccabees 15:34, the covenant land yields its increase in peace.'),
  -- thread: 1-maccabees-15-the-king-breaks-the-covenant
  ('apocrypha', '1-maccabees', 15, 27, 'canon', 'daniel', 9, 26, 'free', E'Daniel 9:26 — *And after threescore and two weeks shall Messiah be cut off, but not for himself: and the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood, and unto the end of the war desolations are determined.* Antiochus breaking all his covenants in 1 Maccabees 15:27 is the same treachery of the prince-to-come, whose word lasts only as long as it serves him.'),
  ('apocrypha', '1-maccabees', 15, 27, 'apocrypha', '1-maccabees', 8, 23, 'extras', E'1 Maccabees 8:23 — *Good success be to the Romans, and to the people of the Yahudim (Jews), by sea and by land for ever: the sword also and enemy be far from them,* Against Antiochus, who in 1 Maccabees 15:27 brake every covenant, stands the league Israel sought as a word meant to stand for ever.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-flatteries-of-the-king',
       E'The king who comes in by flatteries',
       E'Antiochus VII, pressing his claim, courts Simon with a sheaf of honours: *Now therefore I confirm to you all the oblations which the kings before me granted you, and whatsoever gifts besides they granted.* (1 Maccabees 15:5), promising *we will honour you, and your nation, and your temple, with great honour, so that your honour shall be known throughout the world.* (1 Maccabees 15:9). It is the kingdom-of-man''s old craft — not the sword first but the smooth word, the same way Daniel foresaw the vile one rising: *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* (Daniel 11:21). Yet the true honour of the nations bowing to the covenant people is no Seleucid grant; it is Yahuah''s promise: *And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* (Isaiah 49:23). The system of man flatters to seize; the kingdom of Elohim exalts those who wait for Him.',
       sv.verse_id, ev.verse_id, 'extras', 61850
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-nations-acknowledge-the-gathered',
       E'The nations write to spare the regathered people',
       E'Rome''s consul sends letters to every king and country on behalf of the Jews: *We thought it good therefore to write to the kings and countries, that they should do them no harm, nor fight against them, their cities, or countries, nor yet aid their enemies against them.* (1 Maccabees 15:19), and the roll of nations is read out — *And to all the countries and to Sampsames, and the Lacedemonians, and to Delus, and Myndus, and Sicyon, and Caria, and Samos, and Pamphylia, and Lycia, and Halicarnassus, and Rhodus, and Aradus, and Cos, and Side, and Aradus, and Gortyna, and Cnidus, and Cyprus, and Cyrene.* (1 Maccabees 15:23) — the dispersed of Israel acknowledged across the isles of the sea. This is the prophets'' picture of the ingathering, when the Gentiles themselves carry the covenant people home: *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* (Isaiah 49:22). Isaiah saw the kings drawn to her light — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* (Isaiah 60:3) — and Zechariah the strong nations seeking Yahuah in Jerusalem: *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* (Zechariah 8:22). The nations bending toward the gathered remnant is the covenant kept — not a people replaced, but Israel honoured among the kingdoms.',
       sv.verse_id, ev.verse_id, 'extras', 61853
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-inheritance-of-the-fathers',
       E'We hold the inheritance of our fathers',
       E'When Athenobius demands Joppa and Gazera back, Simon answers from the covenant: *We have neither taken other men''s land, nor holden that which appertaineth to others, but the inheritance of our fathers, which our enemies had wrongfully in possession a certain time.* (1 Maccabees 15:33), and presses it home — *Wherefore we, having opportunity, hold the inheritance of our fathers.* (1 Maccabees 15:34). The land is no spoil of conquest but the grant of Yahuah, who alone owns it and gave it to Israel''s fathers: *The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me.* (Leviticus 25:23). And when the inheritance is held in faithfulness, the land itself answers, as it did under Simon: *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit.* (1 Maccabees 14:8). Simon claims no empire of man; he keeps the portion the covenant assigned.',
       sv.verse_id, ev.verse_id, 'extras', 61856
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-the-king-breaks-the-covenant',
       E'He brake all the covenants he had made',
       E'Once Tryphon is cornered, Antiochus no longer needs Simon, and his fair words turn: *Nevertheless he would not receive them, but brake all the covenants which he had made with him afore, and became strange to him.* (1 Maccabees 15:27). This is the signature of the kingdom-of-man — the league made only to be broken when the advantage shifts, as Daniel foresaw of the prince to come: *And after threescore and two weeks shall Messiah be cut off, but not for himself: and the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood, and unto the end of the war desolations are determined.* (Daniel 9:26). Set against the faithless Antiochus stands the league Israel sought with steadfastness, recorded as a perpetual word: *Good success be to the Romans, and to the people of the Yahudim (Jews), by sea and by land for ever: the sword also and enemy be far from them,* (1 Maccabees 8:23). The system of man swears and forswears; the covenant of Yahuah endures, and His people keep faith though kings do not.',
       sv.verse_id, ev.verse_id, 'extras', 61859
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-15-flatteries-of-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:21 — *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* The Seleucid honours of 1 Maccabees 15:9 are flatteries of the king-of-man, who gains by smooth words what he cannot hold by right.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-flatteries-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:23 — *And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* The honour Antiochus dangles in 1 Maccabees 15:9 is a counterfeit of the true exaltation Yahuah gives the people who wait for Him.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-flatteries-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-15-nations-acknowledge-the-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* The Roman decree of 1 Maccabees 15:19 protecting the Jews among the nations foreshadows the day Yahuah moves the Gentiles to carry His scattered people home.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-nations-acknowledge-the-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The catalogue of nations addressed on Israel''s behalf in 1 Maccabees 15:23 anticipates the Gentiles and their kings drawn toward the light of the regathered people.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-nations-acknowledge-the-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The ambassadors of the high priest renewing league with the nations in 1 Maccabees 15:17 prefigure the strong nations turning toward Jerusalem and her God.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-nations-acknowledge-the-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-15-inheritance-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:23 — *The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me.* Simon''s plea in 1 Maccabees 15:33 that they hold only the inheritance of their fathers rests on Yahuah''s claim that the land is His gift to Israel, not man''s to barter.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-inheritance-of-the-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 14:8 — *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit.* When the inheritance of the fathers is held in faithfulness as Simon insists in 1 Maccabees 15:34, the covenant land yields its increase in peace.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-inheritance-of-the-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=34
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-15-the-king-breaks-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:26 — *And after threescore and two weeks shall Messiah be cut off, but not for himself: and the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood, and unto the end of the war desolations are determined.* Antiochus breaking all his covenants in 1 Maccabees 15:27 is the same treachery of the prince-to-come, whose word lasts only as long as it serves him.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-the-king-breaks-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 8:23 — *Good success be to the Romans, and to the people of the Yahudim (Jews), by sea and by land for ever: the sword also and enemy be far from them,* Against Antiochus, who in 1 Maccabees 15:27 brake every covenant, stands the league Israel sought as a word meant to stand for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-the-king-breaks-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1maccabees_16.sql (session253 1-maccabees 16) -----
-- Source anchor: apocrypha/1-maccabees ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac16 (view _session253_1mac16_lookup). Sort band base 61875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-16-be-strong-charge
  ('apocrypha', '1-maccabees', 16, 3, 'canon', 'deuteronomy', 31, 6, 'free', E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* As aged Simon sends his sons out with *the help from heaven*, it is Moses'' own charge — the fight is the LORD''s, who does not fail the next generation.'),
  ('apocrypha', '1-maccabees', 16, 3, 'canon', 'deuteronomy', 31, 7, 'free', E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* Simon handing the war to Judas and John echoes Moses charging Joshua — the covenant commission passes from the dying captain to the young.'),
  ('apocrypha', '1-maccabees', 16, 2, 'canon', 'deuteronomy', 31, 23, 'free', E'Deuteronomy 31:23 — *And he gave Joshua the son of Nun a charge, and said, Be strong and of a good courage: for thou shalt bring the children of Yashar''el (Israel) into the land which I sware unto them: and I will be with thee.* Simon''s recital of *my father''s house* that *delivered Yashar''el (Israel) often* is the same chain of deliverance entrusted, generation to generation, with the promise *I will be with thee*.'),
  -- thread: 1-maccabees-16-holy-trumpets
  ('apocrypha', '1-maccabees', 16, 8, 'canon', 'numbers', 10, 9, 'free', E'Numbers 10:9 — *And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies.* The *holy trumpets* that put Cendebeus to flight are this very Torah ordinance — sounded, the host is remembered before the LORD and saved.'),
  ('apocrypha', '1-maccabees', 16, 8, 'canon', 'numbers', 10, 8, 'free', E'Numbers 10:8 — *And the sons of Aaron, the priests, shall blow with the trumpets; and they shall be to you for an ordinance for ever throughout your generations.* The trumpets are called *holy* because they are the priests'' ordinance for ever — the Maccabean priest-house wages even its wars within the worship of the Torah.'),
  -- thread: 1-maccabees-16-feast-of-betrayal
  ('apocrypha', '1-maccabees', 16, 16, 'canon', 'psalms', 41, 9, 'free', E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Ptolemee was Simon''s son-in-law who *made them a great banquet* before he slew them — the familiar friend who shares the bread and then lifts the heel.'),
  ('apocrypha', '1-maccabees', 16, 16, 'canon', '2-samuel', 20, 9, 'free', E'2 Samuel 20:9 — *And Joab said to Amasa, Art thou in health, my brother? And Joab took Amasa by the beard with the right hand to kiss him.* As Joab drew his kinsman near with a brother''s greeting to kill him, Ptolemee received Simon and his sons *deceitfully* with a banquet before the weapons rose.'),
  ('apocrypha', '1-maccabees', 16, 16, 'canon', '2-samuel', 20, 10, 'free', E'2 Samuel 20:10 — *But Amasa took no heed to the sword that was in Joab''s hand: so he smote him therewith in the fifth rib, and shed out his bowels to the ground, and struck him not again; and he died. So Joab and Abishai his brother pursued after Sheba the son of Bichri.* The hidden sword struck Amasa unawares at the greeting, as the hidden men *rose up, and took their weapons* upon Simon when he had drunk largely.'),
  ('apocrypha', '1-maccabees', 16, 17, 'canon', 'john', 13, 18, 'free', E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* At His own table the Messiah names the table-treachery of Psalm 41 — the same betrayal-by-banquet by which Ptolemee committed *a great treachery* against Simon.'),
  ('apocrypha', '1-maccabees', 16, 17, 'canon', 'romans', 12, 17, 'free', E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* The verdict on Ptolemee is its exact inversion — he *recompensed evil for good*, the very thing the covenant people are forbidden to do.'),
  -- thread: 1-maccabees-16-john-hyrcanus-chronicles
  ('apocrypha', '1-maccabees', 16, 23, 'canon', '1-kings', 11, 41, 'free', E'1 Kings 11:41 — *And the rest of the acts of Solomon, and all that he did, and his wisdom, are they not written in the book of the acts of Solomon?* The closing line on John — *the rest of the acts of John... are written in the chronicles of his priesthood* — is the same annalist''s cadence by which the canon seals the record of its leaders.'),
  ('apocrypha', '1-maccabees', 16, 24, 'canon', 'deuteronomy', 31, 7, 'free', E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* John made high priest *after his father* is the Torah handing-on of office — the line kept unbroken from Mattathias'' house through the treachery to the next high priest.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-be-strong-charge',
       E'Be Strong: The Old Captain Hands the War to His Sons',
       E'Simon, last of the warring brothers, lays the charge upon Judas and John: *I, and my brothers, and my father''s house, have ever from my youth to this day fought against the enemies of Yashar''el (Israel); and things have prospered so well in our hands, that we have delivered Yashar''el (Israel) often* (1 Maccabees 16:2). *But now I am old, and you, by the mercy of Yahuah (God), are of a sufficient age: be you instead of me and my brother, and go and fight for our nation, and the help from heaven be with you* (1 Maccabees 16:3). It ain''t new — this is the Torah handing-on of the covenant fight from one generation to the next. Moses, at the end, gives the same charge to the people and to his successor: *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). And to Joshua by name: *Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it* (Deuteronomy 31:7). The seed is kept not by a dynasty''s strength but by the help from heaven passed down the line.',
       sv.verse_id, ev.verse_id, 'extras', 61875
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-holy-trumpets',
       E'The Holy Trumpets and the Help From Heaven',
       E'Outnumbered by the enemy''s horsemen, Simon''s sons sound the alarm: *Then sounded they with the holy trumpets: whereupon Cendebeus and his host were put to flight, so that many of them were slain, and the remnant got them to the strong hold* (1 Maccabees 16:8). It ain''t new — these are the silver trumpets of the Torah, the ordinance that turns a battle into a remembrance before Yahuah: *And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). They are *holy* trumpets because only the priesthood may sound them: *And the sons of Aaron, the priests, shall blow with the trumpets; and they shall be to you for an ordinance for ever throughout your generations* (Numbers 10:8). The rout of Cendebeus is no chance of war but the covenant ordinance answered from heaven.',
       sv.verse_id, ev.verse_id, 'extras', 61878
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-feast-of-betrayal',
       E'The Feast of Betrayal: Evil for Good at the Banquet',
       E'Simon''s own son-in-law Ptolemee plots his death, and chooses a feast for the deed: *Where the son of Abubus receiving them deceitfully into a little hold, called Docus, which he had built, made them a great banquet: howbeit he had hid men there* (1 Maccabees 16:15). *So when Simon and his sons had drunk largely, Ptolemee and his men rose up, and took their weapons, and came upon Simon into the banqueting place, and slew him, and his two sons, and certain of his servants* (1 Maccabees 16:16). *In which doing he committed a great treachery, and recompensed evil for good* (1 Maccabees 16:17). It ain''t new — the bread-and-table betrayal is the oldest treachery in the covenant. David sang it: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). Joab worked it with a kinsman''s greeting: *And Joab said to Amasa, Art thou in health, my brother? And Joab took Amasa by the beard with the right hand to kiss him* (2 Samuel 20:9) — *But Amasa took no heed to the sword that was in Joab''s hand: so he smote him therewith in the fifth rib, and shed out his bowels to the ground* (2 Samuel 20:10). And the Messiah, at His own table, took that same Psalm onto His lips of Judas: *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me* (John 13:18). Over against the treachery stands the covenant way the apostle commands: *Recompense to no man evil for evil. Provide things honest in the sight of all men* (Romans 12:17) — Ptolemee did the opposite, and *recompensed evil for good*.',
       sv.verse_id, ev.verse_id, 'extras', 61881
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-john-hyrcanus-chronicles',
       E'The Rest of the Acts: The Priesthood Passes and the Book Closes',
       E'Warned in time, John escapes the assassins, and the book ends on the regnal-chronicle formula of the kings of old: *As concerning the rest of the acts of John, and his wars, and worthy deeds which he did, and the building of the walls which he made, and his doings, Behold, these are written in the chronicles of his priesthood, from the time he was made high priest after his father* (1 Maccabees 16:23-24). It ain''t new — this is the very closing cadence the Scriptures use for the deeds of a leader committed to the record: *And the rest of the acts of Solomon, and all that he did, and his wisdom, are they not written in the book of the acts of Solomon?* (1 Kings 11:41). And the priesthood passing *after his father* is the Torah succession of office — *And Moses called unto Joshua... Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers* (Deuteronomy 31:7). The Maccabean witness closes the way the canon closes its annals — the office handed on, the deeds kept in the chronicles, the covenant line unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 61884
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-16-be-strong-charge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* As aged Simon sends his sons out with *the help from heaven*, it is Moses'' own charge — the fight is the LORD''s, who does not fail the next generation.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-be-strong-charge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* Simon handing the war to Judas and John echoes Moses charging Joshua — the covenant commission passes from the dying captain to the young.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-be-strong-charge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 31:23 — *And he gave Joshua the son of Nun a charge, and said, Be strong and of a good courage: for thou shalt bring the children of Yashar''el (Israel) into the land which I sware unto them: and I will be with thee.* Simon''s recital of *my father''s house* that *delivered Yashar''el (Israel) often* is the same chain of deliverance entrusted, generation to generation, with the promise *I will be with thee*.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-be-strong-charge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-16-holy-trumpets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 10:9 — *And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies.* The *holy trumpets* that put Cendebeus to flight are this very Torah ordinance — sounded, the host is remembered before the LORD and saved.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-holy-trumpets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 10:8 — *And the sons of Aaron, the priests, shall blow with the trumpets; and they shall be to you for an ordinance for ever throughout your generations.* The trumpets are called *holy* because they are the priests'' ordinance for ever — the Maccabean priest-house wages even its wars within the worship of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-holy-trumpets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-16-feast-of-betrayal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Ptolemee was Simon''s son-in-law who *made them a great banquet* before he slew them — the familiar friend who shares the bread and then lifts the heel.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 20:9 — *And Joab said to Amasa, Art thou in health, my brother? And Joab took Amasa by the beard with the right hand to kiss him.* As Joab drew his kinsman near with a brother''s greeting to kill him, Ptolemee received Simon and his sons *deceitfully* with a banquet before the weapons rose.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=20 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 20:10 — *But Amasa took no heed to the sword that was in Joab''s hand: so he smote him therewith in the fifth rib, and shed out his bowels to the ground, and struck him not again; and he died. So Joab and Abishai his brother pursued after Sheba the son of Bichri.* The hidden sword struck Amasa unawares at the greeting, as the hidden men *rose up, and took their weapons* upon Simon when he had drunk largely.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* At His own table the Messiah names the table-treachery of Psalm 41 — the same betrayal-by-banquet by which Ptolemee committed *a great treachery* against Simon.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* The verdict on Ptolemee is its exact inversion — he *recompensed evil for good*, the very thing the covenant people are forbidden to do.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-16-john-hyrcanus-chronicles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 11:41 — *And the rest of the acts of Solomon, and all that he did, and his wisdom, are they not written in the book of the acts of Solomon?* The closing line on John — *the rest of the acts of John... are written in the chronicles of his priesthood* — is the same annalist''s cadence by which the canon seals the record of its leaders.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-john-hyrcanus-chronicles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* John made high priest *after his father* is the Torah handing-on of office — the line kept unbroken from Mattathias'' house through the treachery to the next high priest.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-john-hyrcanus-chronicles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — 1 Maccabees cross-references complete.'
