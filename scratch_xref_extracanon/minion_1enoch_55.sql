-- ----- fragment: minion_1enoch_55.sql (session250 1-enoch 55) -----
-- Source anchor: enoch/1-enoch ch55. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en55 (view _session250_en55_lookup). Sort band base 51350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en55_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-55-no-second-flood-of-waters
  ('enoch', '1-enoch', 55, 1, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The Father''s inward resolve in Genesis is exactly the Head of Days saying ''In vain have I destroyed all who dwell on the earth'' in Enoch 55:1.'),
  ('enoch', '1-enoch', 55, 2, 'canon', 'genesis', 9, 11, 'free', E'Genesis 9:11 — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth.* The oath the Head of Days swears by His great name in Enoch 55:2 is the very flood-covenant Genesis records.'),
  ('enoch', '1-enoch', 55, 2, 'canon', 'isaiah', 54, 9, 'free', E'Isaiah 54:9 — *For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee.* Isaiah binds the no-more-flood oath to Yahuah''s everlasting mercy on Israel, the same sworn pledge of good faith Enoch 55:2 names.'),
  ('enoch', '1-enoch', 55, 2, 'jubilees', 'jubilees', 6, 4, 'extras', E'Jubilees 6:4 — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth; that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever.* Jubilees retells the same savour-and-oath that the Head of Days speaks in Enoch 55:1-2.'),
  -- thread: 1-enoch-55-the-bow-set-in-heaven
  ('enoch', '1-enoch', 55, 2, 'canon', 'genesis', 9, 13, 'free', E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The ''sign in the heaven'' that the Head of Days sets as a pledge of good faith in Enoch 55:2 is the rainbow-bow Genesis appoints.'),
  ('enoch', '1-enoch', 55, 2, 'canon', 'genesis', 9, 15, 'free', E'Genesis 9:15 — *And I will remember my covenant, which is between me and you and every living creature of all flesh; and the waters shall no more become a flood to destroy all flesh.* The bow keeps the no-flood pledge ''for ever'' just as Enoch 55:2 says, so long as heaven is above the earth.'),
  ('enoch', '1-enoch', 55, 2, 'jubilees', 'jubilees', 6, 16, 'extras', E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees names the same heavenly sign of eternal covenant that Enoch 55:2 calls a pledge of good faith for ever.'),
  -- thread: 1-enoch-55-day-of-tribulation-chastisement
  ('enoch', '1-enoch', 55, 3, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Azazel''s sentence decreed in the Watcher-judgment is the ''day of tribulation and pain'' whose chastisement abides in Enoch 55:3.'),
  ('enoch', '1-enoch', 55, 3, 'enoch', '1-enoch', 10, 13, 'extras', E'1 Enoch 10:13 — *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* The wrath that ''will abide upon them'' in Enoch 55:3 is this everlasting torment already pronounced on the Watchers.'),
  ('enoch', '1-enoch', 55, 3, 'canon', 'revelation', 20, 10, 'free', E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* John sees the abiding wrath of Enoch 55:3 consummated on the deceiver and all his host.'),
  -- thread: 1-enoch-55-elect-one-throne-of-glory-judges-azazel
  ('enoch', '1-enoch', 55, 4, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names the same throne of glory on which the Elect One sits to judge in Enoch 55:4.'),
  ('enoch', '1-enoch', 55, 4, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph — *one like the Son of Adam*, who resembles mortal-man because He took on flesh — while Enoch 55:4 NAMES that same One the Elect One enthroned before the Head of Days.'),
  ('enoch', '1-enoch', 55, 4, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* Isaiah''s righteous Judge is the Elect One who in Enoch 55:4 judges Azazel and his hosts in the name of Yahuah of Spirits.'),
  ('enoch', '1-enoch', 55, 4, 'enoch', '1-enoch', 61, 8, 'extras', E'1 Enoch 61:8 — *And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* Enoch repeats the very enthronement of 55:4 — the Father seats the Formed Son to judge.'),
  ('enoch', '1-enoch', 55, 4, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* John shows the sealing of the deceiver that fulfills the Elect One''s judgment of Azazel and all his hosts in Enoch 55:4.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en55_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en55_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-55-no-second-flood-of-waters',
       E'The Head of Days repents and swears no second flood of waters',
       E'Enoch hears the Father grieve over the Flood and bind Himself by oath against ever drowning the earth again: *And after that the Head of Days repented and said: ''In vain have I destroyed all who dwell on the earth.''* (1 Enoch 55:1) and *And He sware by His great name: ''Henceforth I will not do so to all who dwell on the earth...''* (1 Enoch 55:2). This is the canon''s own post-Flood word, the very heart-speech of Genesis: *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* (Genesis 8:21), sealed in covenant — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth.* (Genesis 9:11). The same oath becomes Isaiah''s pledge of mercy to scattered Israel: *For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee.* (Isaiah 54:9). Jubilees carries the identical scene of the savour and the sworn covenant: *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth...* (Jubilees 6:4). It ain''t new — the Head of Days is the formless Father whose word stands from Genesis to Enoch.',
       sv.verse_id, ev.verse_id, 'extras', 51350
  FROM _session250_en55_lookup sv, _session250_en55_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=55 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-55-the-bow-set-in-heaven',
       E'A sign set in the heaven — the bow of the covenant',
       E'The oath is given a visible token: *...and I will set a sign in the heaven: and this shall be a pledge of good faith between Me and them for ever, so long as heaven is above the earth.* (1 Enoch 55:2). This is the rainbow of Genesis, the bow set in the cloud as the everlasting sign: *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* (Genesis 9:13), and *And I will remember my covenant, which is between me and you and every living creature of all flesh; and the waters shall no more become a flood to destroy all flesh.* (Genesis 9:15). Jubilees names the same bow precisely: *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* (Jubilees 6:16). The lights and signs of heaven keep faith because the Creator''s order keeps faith — the sign in Enoch''s heaven is the canon''s own bow, no new thing.',
       sv.verse_id, ev.verse_id, 'extras', 51353
  FROM _session250_en55_lookup sv, _session250_en55_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=55 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-55-day-of-tribulation-chastisement',
       E'The day of tribulation — chastisement on the host',
       E'The mercy toward earth''s dwellers does not spare the rebel host: *When I have desired to take hold of them by the hand of the angels on the day of tribulation and pain because of this, I will cause My chastisement and My wrath to abide upon them, saith Elohim (God), Yahuah (God) of Spirits.* (1 Enoch 55:3). The wrath reserved for ''the day of the great judgement'' was decreed back in the Watcher-judgment: *And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:6), and the bound rebels *shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* (1 Enoch 10:13). Revelation seals the same end for the great deceiver and his hosts: *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* (Revelation 20:10). The Father stays His hand toward the earth but His chastisement abides upon the Watchers and their seed — the Creator''s order holds.',
       sv.verse_id, ev.verse_id, 'extras', 51356
  FROM _session250_en55_lookup sv, _session250_en55_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=55 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-55-elect-one-throne-of-glory-judges-azazel',
       E'Mine Elect One on the throne of glory judges Azazel and all his hosts',
       E'The Father seats the Formed Son to judge: *Ye †mighty kings† who dwell on the earth, ye shall have to behold Mine Elect One, how he sits on the throne of glory and judges Azâzêl, and all his associates, and all his hosts in the name of Yahuah (God) of Spirits.* (1 Enoch 55:4). Enoch NAMES the Elect One enthroned — the Messiah, the Formed who proceeds from the Head of Days and judges in the Father''s name, the same scene Enoch repeats elsewhere: *And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above...* (1 Enoch 61:8). Yahusha speaks it plainly in flesh: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31). Daniel, by contrast, keeps the kaph — he sees *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13): the Formed cloud-rider RESEMBLES mortal-man because He took on flesh, yet Enoch NAMES that same One, the Elect One ordered under the Head of Days, worshipped-with yet distinct. His rule is Isaiah''s righteous judge — *with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). The kings ''who dwell on the earth'' must behold Him; Azazel and his host are sealed for the very pit Revelation shows: *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more...* (Revelation 20:3). The Elect One is no created angel and no mere man — He is the named Son who judges the Watchers in the name of Yahuah of Spirits.',
       sv.verse_id, ev.verse_id, 'extras', 51359
  FROM _session250_en55_lookup sv, _session250_en55_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=55 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-55-no-second-flood-of-waters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The Father''s inward resolve in Genesis is exactly the Head of Days saying ''In vain have I destroyed all who dwell on the earth'' in Enoch 55:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-no-second-flood-of-waters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:11 — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth.* The oath the Head of Days swears by His great name in Enoch 55:2 is the very flood-covenant Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-no-second-flood-of-waters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:9 — *For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee.* Isaiah binds the no-more-flood oath to Yahuah''s everlasting mercy on Israel, the same sworn pledge of good faith Enoch 55:2 names.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-no-second-flood-of-waters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 6:4 — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth; that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever.* Jubilees retells the same savour-and-oath that the Head of Days speaks in Enoch 55:1-2.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-no-second-flood-of-waters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-55-the-bow-set-in-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The ''sign in the heaven'' that the Head of Days sets as a pledge of good faith in Enoch 55:2 is the rainbow-bow Genesis appoints.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-the-bow-set-in-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:15 — *And I will remember my covenant, which is between me and you and every living creature of all flesh; and the waters shall no more become a flood to destroy all flesh.* The bow keeps the no-flood pledge ''for ever'' just as Enoch 55:2 says, so long as heaven is above the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-the-bow-set-in-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees names the same heavenly sign of eternal covenant that Enoch 55:2 calls a pledge of good faith for ever.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-the-bow-set-in-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-55-day-of-tribulation-chastisement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Azazel''s sentence decreed in the Watcher-judgment is the ''day of tribulation and pain'' whose chastisement abides in Enoch 55:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-day-of-tribulation-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:13 — *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* The wrath that ''will abide upon them'' in Enoch 55:3 is this everlasting torment already pronounced on the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-day-of-tribulation-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* John sees the abiding wrath of Enoch 55:3 consummated on the deceiver and all his host.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-day-of-tribulation-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-55-elect-one-throne-of-glory-judges-azazel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names the same throne of glory on which the Elect One sits to judge in Enoch 55:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-elect-one-throne-of-glory-judges-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph — *one like the Son of Adam*, who resembles mortal-man because He took on flesh — while Enoch 55:4 NAMES that same One the Elect One enthroned before the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-elect-one-throne-of-glory-judges-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* Isaiah''s righteous Judge is the Elect One who in Enoch 55:4 judges Azazel and his hosts in the name of Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-elect-one-throne-of-glory-judges-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 61:8 — *And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* Enoch repeats the very enthronement of 55:4 — the Father seats the Formed Son to judge.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-elect-one-throne-of-glory-judges-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=61 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* John shows the sealing of the deceiver that fulfills the Elect One''s judgment of Azazel and all his hosts in Enoch 55:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en55_lookup sv, _session250_en55_lookup tv
 WHERE t.slug='1-enoch-55-elect-one-throne-of-glory-judges-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=55 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

