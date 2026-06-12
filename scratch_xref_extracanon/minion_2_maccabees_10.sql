-- ----- fragment: minion_2maccabees_10.sql (session253 2-maccabees 10) -----
-- Source anchor: apocrypha/2-maccabees ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac10 (view _session253_2mac10_lookup). Sort band base 62225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-10-dedication-eight-days
  ('apocrypha', '2-maccabees', 10, 7, 'canon', 'leviticus', 23, 40, 'free', E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The branches, boughs, and palms the Maccabees bore in 2-maccabees 10:7 are the prescribed Sukkot rite of Torah, kept out of season because they had been hunted in the mountains.'),
  ('apocrypha', '2-maccabees', 10, 6, 'canon', 'nehemiah', 8, 15, 'free', E'Nehemiah 8:15 — *And that they should publish and proclaim in all their cities, and in Jerusalem, saying, Go forth unto the mount, and fetch olive branches, and pine branches, and myrtle branches, and palm branches, and branches of thick trees, to make booths, as it is written.* As the returned remnant under Ezra rediscovered the booths-feast and proclaimed it, so the Maccabees in 2-maccabees 10:6 keep tabernacles as a people lately delivered out of the wilderness of dens and beasts.'),
  ('apocrypha', '2-maccabees', 10, 8, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The yearly winter feast the whole nation ordained in 2-maccabees 10:8 is the very Feast of Dedication the Messiah kept in the temple — He honoured the Maccabean rededication.'),
  ('apocrypha', '2-maccabees', 10, 8, 'apocrypha', '1-maccabees', 4, 59, 'extras', E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The brother book records the same eight-day statute on the twenty-fifth of Casleu that 2-maccabees 10:8 decrees for the whole nation.'),
  ('apocrypha', '2-maccabees', 10, 7, 'canon', 'zechariah', 14, 16, 'free', E'Zechariah 14:16 — *And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* The tabernacles-keeping with palms and psalms in 2-maccabees 10:7 prefigures the day all nations go up yearly to keep that same feast before the King.'),
  -- thread: 2-maccabees-10-altars-pulled-down-abomination
  ('apocrypha', '2-maccabees', 10, 2, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The heathen altars and chapels the Maccabees pull down in 2-maccabees 10:2 are exactly the abomination Daniel foresaw Antiochus placing in the polluted sanctuary.'),
  ('apocrypha', '2-maccabees', 10, 5, 'canon', 'daniel', 8, 13, 'free', E'Daniel 8:13 — *Then I heard one saint speaking, and another saint said unto that certain saint which spake, How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* The cleansing on the very day of the profanation in 2-maccabees 10:5 answers the angel''s ''how long'' over the trodden sanctuary.'),
  ('apocrypha', '2-maccabees', 10, 1, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The recovery of the defiled temple in 2-maccabees 10:1 is the historical first fulfillment of the abomination the Messiah warns will yet stand in the holy place.'),
  -- thread: 2-maccabees-10-chasten-with-mercy
  ('apocrypha', '2-maccabees', 10, 4, 'canon', '2-samuel', 24, 14, 'free', E'2 Samuel 24:14 — *And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (the LORD); for his mercies are great: and let me not fall into the hand of man.* David''s choice to fall into Yahuah''s merciful hand rather than man''s is precisely the prayer of 2-maccabees 10:4 — chasten us, but spare us the blasphemous nations.'),
  ('apocrypha', '2-maccabees', 10, 4, 'apocrypha', 'tobit', 13, 5, 'extras', E'Tobit 13:5 — *And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* Tobit voices the same covenant confidence the Maccabees pray in 2-maccabees 10:4 — the chastening of the scattered people ends in mercy and regathering, not abandonment.'),
  ('apocrypha', '2-maccabees', 10, 4, 'canon', 'hebrews', 8, 12, 'free', E'Hebrews 8:12 — *For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more.* The very mercy the Maccabees ask to be chastened with in 2-maccabees 10:4 is the covenant promise — corrected in mercy, their sins not held against them.'),
  -- thread: 2-maccabees-10-zeal-against-blasphemy
  ('apocrypha', '2-maccabees', 10, 35, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The young men ''inflamed with anger because of the blasphemies'' in 2-maccabees 10:35 act in the very zeal-for-Yahuah''s-sake that marked Phinehas.'),
  ('apocrypha', '2-maccabees', 10, 36, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting covenant given for Phinehas'' zeal is the inheritance the zealous Maccabean house claims as it burns out the blasphemers in 2-maccabees 10:36.'),
  -- thread: 2-maccabees-10-horsemen-from-heaven
  ('apocrypha', '2-maccabees', 10, 29, 'canon', '2-kings', 6, 17, 'free', E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The five comely horsemen from heaven who shield Maccabeus in 2-maccabees 10:29 are the same heavenly cavalry Elisha''s servant was given eyes to see.'),
  ('apocrypha', '2-maccabees', 10, 38, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The psalms and thanksgiving with which the people praise Yahuah for the victory in 2-maccabees 10:38 reprise the song Moses sang when the LORD overthrew horse and rider.'),
  ('apocrypha', '2-maccabees', 10, 30, 'canon', 'exodus', 15, 3, 'free', E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The heavenly riders who shoot arrows and lightnings to deliver Maccabeus in 2-maccabees 10:30 make plain that the battle belongs to Yahuah the man of war.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-dedication-eight-days',
       E'The Rededication Kept After the Manner of Tabernacles',
       E'When Maccabeus and his company recovered the sanctuary they did not invent a new thing — they kept the oldest thing. *And they kept the eight days with gladness, as in the feast of the tabernacles, remembering that not long afore they had held the feast of the tabernacles, when as they wandered in the mountains and dens like beasts. Therefore they bare branches, and fair boughs, and palms also, and sang psalms to him that had given them good success in cleansing his place* (2 Maccabees 10:6-7). The branches and palms are Torah: *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days* (Leviticus 23:40). The eight-day winter feast they ordained — *They ordained also by a common statute and decree, That every year those days should be kept of the whole nation of the Yahudim (Jews)* (2 Maccabees 10:8) — is the very feast the Messiah Himself walked in: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). It ain''t new — the brother book records the same ordinance: *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness* (1 Maccabees 4:59). And the regathered ingathering it patterns will be kept by all nations at the end: *And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16).',
       sv.verse_id, ev.verse_id, 'extras', 62225
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-altars-pulled-down-abomination',
       E'The Abomination Torn Down, the Sanctuary Cleansed',
       E'The first work of the recovered people is demolition of the kingdom-of-man''s worship. *But the altars which the heathen had built in the open street, and also the chapels, they pulled down* (2 Maccabees 10:2) — *Now upon the same day that the strangers profaned the temple, on the very same day it was cleansed again, even the five and twentieth day of the same month, which is Casleu* (2 Maccabees 10:5). This is the undoing of Antiochus the antichrist-type, the man Daniel saw in vision: *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31). The angel had asked how long the desolation would stand: *How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* (Daniel 8:13). 2 Maccabees 10 is the answer in history — yet the Messiah lifts the same abomination forward as a sign still to come: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Antiochus is the pattern of the system to be dismantled, not the law.',
       sv.verse_id, ev.verse_id, 'extras', 62228
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-chasten-with-mercy',
       E'Chasten Us With Mercy: the Covenant People Kept',
       E'Prostrate in the cleansed house, the people do not plead innocence but covenant. *When that was done, they fell flat down, and besought Yahuah (God) that they might come no more into such troubles; but if they sinned any more against him, that he himself would chasten them with mercy, and that they might not be delivered to the blasphemous and barbarous nations* (2 Maccabees 10:4). This is the heart of the kept seed — chastened, never cast off — and it is the same posture Tobit''s repentant Israel takes, owning the rod as a Father''s: *And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). The fathers had already framed the choice as mercy not curse — they would rather fall into the hand of Yahuah than of men: *Let us fall now into the hand of Yahuah (the LORD); for his mercies are great: and let me not fall into the hand of man* (2 Samuel 24:14). And the worst dread — to *be delivered to the blasphemous and barbarous nations* — is the very thing covenant mercy spares: *For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:12). The remnant asks to be corrected, not consumed; Torah is the Father''s discipline, not a sentence of death.',
       sv.verse_id, ev.verse_id, 'extras', 62231
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-zeal-against-blasphemy',
       E'Inflamed With Zeal Against the Blasphemers',
       E'When the besieged garrison *blasphemed exceedingly, and uttered wicked words* (2 Maccabees 10:34), the young men answer as Phinehas did. *Nevertheless upon the fifth day early twenty young men of Maccabeus'' company, inflamed with anger because of the blasphemies, assaulted the wall manly, and with a fierce courage killed all that they met withal* (2 Maccabees 10:35). This is covenant zeal, the very thing Yahuah credited to Phinehas in the wilderness: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy* (Numbers 25:11). For that zeal an everlasting covenant was given: *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13). The same Phinehas-zeal armed Mattathias'' house — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62234
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-10-horsemen-from-heaven',
       E'Five Comely Men Upon Horses From Heaven',
       E'Against Timotheus'' multitude the deliverance is openly angelic. *But when the battle waxed strong, there appeared to the enemies from heaven five comely men upon horses, with bridles of gold, and two of them led the Yahudim (Jews), And took Maccabeus between them, and covered him on every side weapons, and kept him safe, but shot arrows and lightnings against the enemies: so that being confounded with blindness, and full of trouble, they were killed* (2 Maccabees 10:29-30). The unseen host made visible is Elisha''s mountain: *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha* (2 Kings 6:17). And the people who pray before the battle (10:25-26) ascribe the victory to Yahuah the Warrior: *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name* (Exodus 15:3) — so that when it is done *they praised Yahuah (God) with psalms and thanksgiving, who had done so great things for Yashar''el (Israel)* (2 Maccabees 10:38), singing the song of the sea afresh: *I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1).',
       sv.verse_id, ev.verse_id, 'extras', 62237
  FROM _session253_2mac10_lookup sv, _session253_2mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=10 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-10-dedication-eight-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The branches, boughs, and palms the Maccabees bore in 2-maccabees 10:7 are the prescribed Sukkot rite of Torah, kept out of season because they had been hunted in the mountains.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:15 — *And that they should publish and proclaim in all their cities, and in Jerusalem, saying, Go forth unto the mount, and fetch olive branches, and pine branches, and myrtle branches, and palm branches, and branches of thick trees, to make booths, as it is written.* As the returned remnant under Ezra rediscovered the booths-feast and proclaimed it, so the Maccabees in 2-maccabees 10:6 keep tabernacles as a people lately delivered out of the wilderness of dens and beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The yearly winter feast the whole nation ordained in 2-maccabees 10:8 is the very Feast of Dedication the Messiah kept in the temple — He honoured the Maccabean rededication.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The brother book records the same eight-day statute on the twenty-fifth of Casleu that 2-maccabees 10:8 decrees for the whole nation.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=59
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zechariah 14:16 — *And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles.* The tabernacles-keeping with palms and psalms in 2-maccabees 10:7 prefigures the day all nations go up yearly to keep that same feast before the King.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-dedication-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-altars-pulled-down-abomination
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The heathen altars and chapels the Maccabees pull down in 2-maccabees 10:2 are exactly the abomination Daniel foresaw Antiochus placing in the polluted sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-altars-pulled-down-abomination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 8:13 — *Then I heard one saint speaking, and another saint said unto that certain saint which spake, How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot?* The cleansing on the very day of the profanation in 2-maccabees 10:5 answers the angel''s ''how long'' over the trodden sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-altars-pulled-down-abomination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The recovery of the defiled temple in 2-maccabees 10:1 is the historical first fulfillment of the abomination the Messiah warns will yet stand in the holy place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-altars-pulled-down-abomination'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-chasten-with-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 24:14 — *And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (the LORD); for his mercies are great: and let me not fall into the hand of man.* David''s choice to fall into Yahuah''s merciful hand rather than man''s is precisely the prayer of 2-maccabees 10:4 — chasten us, but spare us the blasphemous nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-chasten-with-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 13:5 — *And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* Tobit voices the same covenant confidence the Maccabees pray in 2-maccabees 10:4 — the chastening of the scattered people ends in mercy and regathering, not abandonment.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-chasten-with-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 8:12 — *For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more.* The very mercy the Maccabees ask to be chastened with in 2-maccabees 10:4 is the covenant promise — corrected in mercy, their sins not held against them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-chasten-with-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-zeal-against-blasphemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The young men ''inflamed with anger because of the blasphemies'' in 2-maccabees 10:35 act in the very zeal-for-Yahuah''s-sake that marked Phinehas.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-zeal-against-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting covenant given for Phinehas'' zeal is the inheritance the zealous Maccabean house claims as it burns out the blasphemers in 2-maccabees 10:36.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-zeal-against-blasphemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-10-horsemen-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The five comely horsemen from heaven who shield Maccabeus in 2-maccabees 10:29 are the same heavenly cavalry Elisha''s servant was given eyes to see.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-horsemen-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The psalms and thanksgiving with which the people praise Yahuah for the victory in 2-maccabees 10:38 reprise the song Moses sang when the LORD overthrew horse and rider.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-horsemen-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The heavenly riders who shoot arrows and lightnings to deliver Maccabeus in 2-maccabees 10:30 make plain that the battle belongs to Yahuah the man of war.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac10_lookup sv, _session253_2mac10_lookup tv
 WHERE t.slug='2-maccabees-10-horsemen-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=10 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

