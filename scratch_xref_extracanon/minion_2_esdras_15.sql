-- ----- fragment: minion_2esdras_15.sql (session253 2-esdras 15) -----
-- Source anchor: apocrypha/2-esdras ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd15 (view _session253_2esd15_lookup). Sort band base 63350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-15-sword-sent-who-may-turn
  ('apocrypha', '2-esdras', 15, 5, 'canon', 'jeremiah', 25, 29, 'free', E'Jeremiah 25:29 — *For, lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished: for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts).* The plagues Ezra hears decreed on the world are the very sword Jeremiah is told Yahuah will call upon all the inhabitants of the earth.'),
  ('apocrypha', '2-esdras', 15, 8, 'canon', 'jeremiah', 25, 31, 'free', E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* When Ezra''s Yahuah declares He will hold His tongue no more, it is this controversy with the nations breaking its long silence.'),
  ('apocrypha', '2-esdras', 15, 5, 'canon', 'revelation', 6, 8, 'free', E'Revelation 6:8 — *And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth.* The sword, famine, death and destruction loosed on Ezra''s world ride out under the fourth seal as the pale horse over the earth.'),
  -- thread: 2-esdras-15-innocent-blood-cries
  ('apocrypha', '2-esdras', 15, 8, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The souls of the just that complain continually in Ezra are the souls under the altar crying how long for the avenging of their blood.'),
  ('apocrypha', '2-esdras', 15, 9, 'canon', 'revelation', 18, 24, 'free', E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Yahuah''s vow to receive to Himself all the innocent blood is answered when that blood is found in Babylon and she is judged for it.'),
  ('apocrypha', '2-esdras', 15, 9, 'canon', 'jeremiah', 25, 31, 'free', E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* The avenging Yahuah promises in Ezra is His standing controversy with the nations over the blood of His own.'),
  -- thread: 2-esdras-15-egypt-plagues-mighty-hand
  ('apocrypha', '2-esdras', 15, 11, 'canon', 'deuteronomy', 4, 34, 'free', E'Deuteronomy 4:34 — *Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation, by temptations, by signs, and by wonders, and by war, and by a mighty hand, and by a stretched out arm, and by great terrors, according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt before your eyes?* Ezra''s ''mighty hand and stretched out arm'' against Egypt is the very Exodus formula of Yahuah''s redeeming arm.'),
  ('apocrypha', '2-esdras', 15, 11, 'canon', 'ezekiel', 30, 4, 'free', E'Ezekiel 30:4 — *And the sword shall come upon Egypt, and great pain shall be in Ethiopia, when the slain shall fall in Egypt, and they shall take away her multitude, and her foundations shall be broken down.* The plagues Ezra sees smiting Egypt and its foundations are Ezekiel''s day-of-Yahuah sword falling on Egypt''s slain and foundations.'),
  ('apocrypha', '2-esdras', 15, 12, 'canon', 'ezekiel', 30, 13, 'free', E'Ezekiel 30:13 — *Thus saith Adonai Yahuah (the Lord GOD); I will also destroy the idols, and I will cause their images to cease out of Noph; and there shall be no more a prince of the land of Egypt: and I will put a fear in the land of Egypt.* Egypt''s mourning under the plague in Ezra matches the fear Yahuah puts in the land when He strikes its idols and foundations in Ezekiel.'),
  -- thread: 2-esdras-15-woe-keep-not-commandments
  ('apocrypha', '2-esdras', 15, 24, 'canon', 'jeremiah', 25, 15, 'free', E'Jeremiah 25:15 — *For thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) unto me; Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it.* The woe and plagues poured on the commandment-breakers in Ezra are this cup of fury Yahuah causes all the nations to drink.'),
  ('apocrypha', '2-esdras', 15, 25, 'canon', 'revelation', 18, 4, 'free', E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* Yahuah''s ''go your way, you children, from the power, defile not my sanctuary'' is the same call to come out of Babylon lest His people share her plagues.'),
  ('apocrypha', '2-esdras', 15, 24, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The woe on those who keep not the commandments answers the cry of the slain for Yahuah''s holy and true judgment on them that dwell on the earth.'),
  -- thread: 2-esdras-15-babylon-fallen-plagues-one-day
  ('apocrypha', '2-esdras', 15, 43, 'canon', 'revelation', 18, 2, 'free', E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon Ezra''s avengers go stedfastly to make afraid is the Babylon the angel cries is fallen, is fallen.'),
  ('apocrypha', '2-esdras', 15, 49, 'canon', 'revelation', 18, 8, 'free', E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* The widowhood, famine, sword and pestilence Yahuah sends on Asia are the very plagues — death, mourning, famine, burning — that fall on Babylon in one day.'),
  ('apocrypha', '2-esdras', 15, 56, 'canon', 'revelation', 18, 6, 'free', E'Revelation 18:6 — *Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double.* Yahuah''s ''like as you have done to my chosen, even so shall Yahuah do to you'' is the lex talionis the seer cries over fallen Babylon.'),
  ('apocrypha', '2-esdras', 15, 53, 'canon', 'revelation', 18, 24, 'free', E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Asia is judged because ''you had always slain my chosen'' — the same charge of the blood of saints found in Babylon.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-sword-sent-who-may-turn',
       E'The sword is sent: I will hold my tongue no more',
       E'Yahuah lifts the restraint on judgment: *Behold, says Yahuah (God), I will bring plagues upon the world; the sword, famine, death, and destruction* (2 Esdras 15:5), for *I will hold my tongue no more as touching their wickedness* (2 Esdras 15:8). This is the prophets'' controversy with all flesh — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD)* (Jeremiah 25:31). The four scourges of Ezra are the four sore judgments of Ezekiel — *for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts)* (Jeremiah 25:29). It ain''t new: the same sword that hangs over the nations in the prophets is the sword the seer of Ezra still sees coming.',
       sv.verse_id, ev.verse_id, 'extras', 63350
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-innocent-blood-cries',
       E'The innocent blood cries to me',
       E'The martyrs are not forgotten: *behold, the innocent and righteous blood cries to me, and the souls of the just complain continually* (2 Esdras 15:8), and so *I will surely avenge them, and receive to me all the innocent blood from among them* (2 Esdras 15:9). This is the cry under the altar — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The blood that cries is the blood Babylon is finally charged with — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24). It ain''t new: from Abel onward the righteous blood cries up from the ground, and Yahuah hears.',
       sv.verse_id, ev.verse_id, 'extras', 63353
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-egypt-plagues-mighty-hand',
       E'I will smite Egypt with plagues as before',
       E'The deliverance is rehearsed in judgment''s key: *I will bring them with a mighty hand and a stretched out arm, and smite Egypt with plagues, as before, and will destroy all the land thereof* (2 Esdras 15:11). The mighty-hand-and-stretched-arm is the Exodus formula — *Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation... by a mighty hand, and by a stretched out arm... according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt before your eyes?* (Deuteronomy 4:34). And the renewed sword upon Egypt is Ezekiel''s oracle — *And the sword shall come upon Egypt, and great pain shall be in Ethiopia, when the slain shall fall in Egypt* (Ezekiel 30:4). It ain''t new: the Arm that broke Egypt once breaks the proud world-system again.',
       sv.verse_id, ev.verse_id, 'extras', 63356
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-woe-keep-not-commandments',
       E'Woe to them that keep not my commandments',
       E'The woe falls on the world for covenant-breaking: *Woe to them that sin, and keep not my commandments! says Yahuah (God)* (2 Esdras 15:24), and *defile not my sanctuary* (2 Esdras 15:25). The cup of fury is passed to every nation — *Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it* (Jeremiah 25:15). And the call to come out before the plagues fall is Babylon''s own — *Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4). It ain''t new: Torah stands, and the woe is on those who keep not the commandments, never on those who do; the kept seed is called out before wrath.',
       sv.verse_id, ev.verse_id, 'extras', 63359
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-15-babylon-fallen-plagues-one-day',
       E'Babylon made afraid: the plagues in one day',
       E'The vision turns on Babylon and her partner Asia: *They shall go stedfastly to Babylon, and make her afraid* (2 Esdras 15:43), and to Asia — *I will send plagues upon you; widowhood, poverty, famine, sword, and pestilence* (2 Esdras 15:49). This is the fall the seer of Patmos saw — *Babylon the great is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2) — her plagues converging in a single day — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire* (Revelation 18:8). And the harlot''s recompense for slaying the chosen — *Reward her even as she rewarded you, and double unto her double according to her works* (Revelation 18:6) — is Ezra''s *Like as you have done to my chosen... even so shall Yahuah (God) do to you* (2 Esdras 15:56). The system is dismantled; the eagle-empire and her glory are burned. It ain''t new: the Babylon of the prophets is the Babylon of the seer is the Babylon of Ezra.',
       sv.verse_id, ev.verse_id, 'extras', 63362
  FROM _session253_2esd15_lookup sv, _session253_2esd15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=15 AND ev.verse_number=56
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-15-sword-sent-who-may-turn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 25:29 — *For, lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished: for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts).* The plagues Ezra hears decreed on the world are the very sword Jeremiah is told Yahuah will call upon all the inhabitants of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-sword-sent-who-may-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* When Ezra''s Yahuah declares He will hold His tongue no more, it is this controversy with the nations breaking its long silence.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-sword-sent-who-may-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:8 — *And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth.* The sword, famine, death and destruction loosed on Ezra''s world ride out under the fourth seal as the pale horse over the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-sword-sent-who-may-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-innocent-blood-cries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The souls of the just that complain continually in Ezra are the souls under the altar crying how long for the avenging of their blood.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-innocent-blood-cries'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Yahuah''s vow to receive to Himself all the innocent blood is answered when that blood is found in Babylon and she is judged for it.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-innocent-blood-cries'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 25:31 — *A noise shall come even to the ends of the earth; for Yahuah (LORD) hath a controversy with the nations, he will plead with all flesh; he will give them that are wicked to the sword, saith Yahuah (LORD).* The avenging Yahuah promises in Ezra is His standing controversy with the nations over the blood of His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-innocent-blood-cries'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-egypt-plagues-mighty-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:34 — *Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation, by temptations, by signs, and by wonders, and by war, and by a mighty hand, and by a stretched out arm, and by great terrors, according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt before your eyes?* Ezra''s ''mighty hand and stretched out arm'' against Egypt is the very Exodus formula of Yahuah''s redeeming arm.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-egypt-plagues-mighty-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 30:4 — *And the sword shall come upon Egypt, and great pain shall be in Ethiopia, when the slain shall fall in Egypt, and they shall take away her multitude, and her foundations shall be broken down.* The plagues Ezra sees smiting Egypt and its foundations are Ezekiel''s day-of-Yahuah sword falling on Egypt''s slain and foundations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-egypt-plagues-mighty-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 30:13 — *Thus saith Adonai Yahuah (the Lord GOD); I will also destroy the idols, and I will cause their images to cease out of Noph; and there shall be no more a prince of the land of Egypt: and I will put a fear in the land of Egypt.* Egypt''s mourning under the plague in Ezra matches the fear Yahuah puts in the land when He strikes its idols and foundations in Ezekiel.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-egypt-plagues-mighty-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=30 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-woe-keep-not-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 25:15 — *For thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) unto me; Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it.* The woe and plagues poured on the commandment-breakers in Ezra are this cup of fury Yahuah causes all the nations to drink.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-woe-keep-not-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* Yahuah''s ''go your way, you children, from the power, defile not my sanctuary'' is the same call to come out of Babylon lest His people share her plagues.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-woe-keep-not-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The woe on those who keep not the commandments answers the cry of the slain for Yahuah''s holy and true judgment on them that dwell on the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-woe-keep-not-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-15-babylon-fallen-plagues-one-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon Ezra''s avengers go stedfastly to make afraid is the Babylon the angel cries is fallen, is fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* The widowhood, famine, sword and pestilence Yahuah sends on Asia are the very plagues — death, mourning, famine, burning — that fall on Babylon in one day.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 18:6 — *Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double.* Yahuah''s ''like as you have done to my chosen, even so shall Yahuah do to you'' is the lex talionis the seer cries over fallen Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 18:24 — *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.* Asia is judged because ''you had always slain my chosen'' — the same charge of the blood of saints found in Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd15_lookup sv, _session253_2esd15_lookup tv
 WHERE t.slug='2-esdras-15-babylon-fallen-plagues-one-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=15 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

