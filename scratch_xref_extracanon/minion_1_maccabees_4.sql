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

