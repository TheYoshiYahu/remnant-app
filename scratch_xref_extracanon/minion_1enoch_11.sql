-- ----- fragment: minion_1enoch_11.sql (session250 1-enoch 11) -----
-- Source anchor: enoch/1-enoch ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en11 (view _session250_en11_lookup). Sort band base 50250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-11-bind-the-watchers
  ('enoch', '1-enoch', 11, 1, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very defilement Michael is sent to punish in Enoch 11:1 — the Watchers who united themselves with women.'),
  ('enoch', '1-enoch', 11, 1, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The shortening of days and the coming flood-judgement of Enoch 11 is the same sentence Yahuah pronounces in Genesis 6.'),
  ('enoch', '1-enoch', 11, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries forward the Watchers bound for judgement that Enoch 11:2 describes, chained until the day that is for ever and ever.'),
  ('enoch', '1-enoch', 11, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter and Enoch 11:2 give the same verdict: the sinning angels are bound fast and reserved unto judgement.'),
  ('enoch', '1-enoch', 11, 2, 'jubilees', 'jubilees', 5, 6, 'extras', E'Jubilees 5:6 — *And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* Jubilees tells the same binding Michael is commanded to perform in Enoch 11:2, in the depths of the earth.'),
  ('enoch', '1-enoch', 11, 2, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah lifts the binding of the Watchers in Enoch 11:2 to the day of judgement, when the host of the high ones is finally visited.'),
  -- thread: 1-enoch-11-abyss-of-fire-and-the-spirits
  ('enoch', '1-enoch', 11, 3, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The chaining and sealed prison of the abyss in Enoch 11:3 is the same binding John sees laid upon the dragon.'),
  ('enoch', '1-enoch', 11, 3, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The prison in which the rebels are confined in Enoch 11:3 is John''s bottomless pit, shut and sealed until the day of judgement.'),
  ('enoch', '1-enoch', 11, 5, 'jubilees', 'jubilees', 10, 5, 'extras', E'Jubilees 10:5 — *and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* Noah''s prayer asks for exactly what Enoch 11:5 commands — that the reprobate spirits and children of the Watchers be destroyed and bound away from mankind.'),
  ('enoch', '1-enoch', 11, 5, 'enoch', '1-enoch', 10, 9, 'extras', E'1 Enoch 10:9 — *And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men.* Enoch''s own earlier command to Gabriel is the twin of the order in Enoch 11:5 to destroy the spirits of the reprobate and the children of the Watchers.'),
  -- thread: 1-enoch-11-plant-of-righteousness-and-abundance
  ('enoch', '1-enoch', 11, 7, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The long life and completed days of the righteous in Enoch 11:7 are Isaiah''s elect whose days are as the days of a tree.'),
  ('enoch', '1-enoch', 11, 9, 'canon', 'isaiah', 65, 21, 'free', E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines planted and the wine in abundance of Enoch 11:9 are Isaiah''s restored people planting vineyards and eating their fruit.'),
  ('enoch', '1-enoch', 11, 9, 'canon', 'amos', 9, 13, 'free', E'Amos 9:13 — *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt.* The thousandfold seed and overflowing wine of Enoch 11:9 is Amos'' day of overtaking harvests and mountains dropping sweet wine.'),
  ('enoch', '1-enoch', 11, 6, 'jubilees', 'jubilees', 5, 11, 'extras', E'Jubilees 5:11 — *And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway.* The plant of righteousness and truth appearing in Enoch 11:6 is Jubilees'' new and righteous nature made for all His works after the flood-judgement.'),
  -- thread: 1-enoch-11-earth-cleansed-all-nations-worship
  ('enoch', '1-enoch', 11, 11, 'canon', 'zephaniah', 3, 9, 'free', E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The all-nations adoration of Enoch 11:11 is Zephaniah''s purified peoples calling on the Name with one consent.'),
  ('enoch', '1-enoch', 11, 11, 'canon', 'zechariah', 14, 9, 'free', E'Zechariah 14:9 — *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* When all nations worship Me in Enoch 11:11, it is Zechariah''s day when Yahuah is king over all the earth and His name is one.'),
  ('enoch', '1-enoch', 11, 11, 'canon', 'psalms', 22, 27, 'free', E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The universal worship of Enoch 11:11 is the Psalm''s ends of the world turning and all the kindreds of the nations worshipping before Him.'),
  ('enoch', '1-enoch', 11, 11, 'canon', 'isaiah', 2, 3, 'free', E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The nations'' worship in Enoch 11:11 is Isaiah''s peoples coming to walk in His paths under the Torah that goes forth from Zion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-bind-the-watchers',
       E'Bind Semjaza and his associates — the chained Watchers of Genesis 6',
       E'Michael is sent to bind the chief of the rebel Watchers: *And Yahuah (God) said to Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation* (1 Enoch 11:1–2). This is not a new story — it is the canon''s own Genesis 6 unfolded. There the sin is named: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and judgement is set: *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3). The New Testament knows this exact tradition and treats it as sober history: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6); *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Jubilees tells it the same way — *and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them* (Jubilees 5:6) — and Isaiah lifts it to the last day: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high* (Isaiah 24:21). The Watchers'' sin is rebellion against the Creator''s order, and the seed-war runs from here.',
       sv.verse_id, ev.verse_id, 'extras', 50250
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-abyss-of-fire-and-the-spirits',
       E'The abyss of fire and the destruction of the reprobate spirits',
       E'The Watchers and all condemned with them are led to the prison of fire: *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* *And whosoever shall be condemned and destroyed will from thenceforth be bound together with them to the end of all generations.* *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind* (1 Enoch 11:3–5). Revelation paints the same sealed prison and the same final fire: *And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand. And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years* (Revelation 20:1–2); *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more* (Revelation 20:3). The spirits of the reprobate — the evil spirits that proceeded from the slain giants — are the canon''s own unclean powers; Jubilees prays that they be locked away from the righteous: *imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant* (Jubilees 10:5). And Enoch''s own command against Gabriel''s targets is the twin of this verse: *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy ... the children of the Watchers from amongst men* (1 Enoch 10:9). This is judgement upon rebellion, not upon the keepers of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 50253
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-plant-of-righteousness-and-abundance',
       E'The plant of righteousness — the earth tilled and full of blessing',
       E'After judgement comes restoration: *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing* (1 Enoch 11:6); *And then shall all the righteous escape, and shall live until they beget thousands of children* (1 Enoch 11:7); *And then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing* (1 Enoch 11:8); *and the vine which they plant thereon shall yield wine in abundance, and as for all the seed which is sown thereon each measure (of it) shall bear a thousand* (1 Enoch 11:9). This is the kingdom-fruitfulness the prophets foresaw — for the righteous are a people, an elect planting, not a self-chosen class. Isaiah promises the same long-lived, vineyard-keeping seed: *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them* (Isaiah 65:21); *for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands* (Isaiah 65:22); *for they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23). Amos sees the wine overflowing the very mountains: *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt* (Amos 9:13). Jubilees names the renewal at the root: *And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway* (Jubilees 5:11). The plant of righteousness is the regathered, covenant-keeping people whom Yahuah replants in the cleansed land.',
       sv.verse_id, ev.verse_id, 'extras', 50256
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-11-earth-cleansed-all-nations-worship',
       E'The earth cleansed — all nations worship the One Yahuah',
       E'The chapter closes with the whole creation purged and turned to worship: *And cleanse thou the earth from all oppression, and from all unrighteousness, and from all sin: and all the uncleanness that is wrought upon the earth destroy from off the earth* (1 Enoch 11:10); *And all the children of men shall become righteous, and all nations shall offer adoration and shall praise Me, and all shall worship Me* (1 Enoch 11:11); *And the earth shall be cleansed from all defilement, and from all sin, and from all punishment* (1 Enoch 11:12). This is the prophets'' end of the matter — Yahuah alone king and all nations turned to Him. Zephaniah: *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). Zechariah seals the One Name: *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). The Psalm sings the nations bowing: *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee* (Psalm 22:27). And Isaiah shows them flowing up to learn His ways — *and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3): the nations worship by coming under the Torah that goes forth from Zion, not by abolishing it. The cleansing of the earth and the universal worship are one act of the same Yahuah of Spirits.',
       sv.verse_id, ev.verse_id, 'extras', 50259
  FROM _session250_en11_lookup sv, _session250_en11_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-11-bind-the-watchers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very defilement Michael is sent to punish in Enoch 11:1 — the Watchers who united themselves with women.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The shortening of days and the coming flood-judgement of Enoch 11 is the same sentence Yahuah pronounces in Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries forward the Watchers bound for judgement that Enoch 11:2 describes, chained until the day that is for ever and ever.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter and Enoch 11:2 give the same verdict: the sinning angels are bound fast and reserved unto judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:6 — *And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* Jubilees tells the same binding Michael is commanded to perform in Enoch 11:2, in the depths of the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah lifts the binding of the Watchers in Enoch 11:2 to the day of judgement, when the host of the high ones is finally visited.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-bind-the-watchers'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-11-abyss-of-fire-and-the-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The chaining and sealed prison of the abyss in Enoch 11:3 is the same binding John sees laid upon the dragon.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The prison in which the rebels are confined in Enoch 11:3 is John''s bottomless pit, shut and sealed until the day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:5 — *and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* Noah''s prayer asks for exactly what Enoch 11:5 commands — that the reprobate spirits and children of the Watchers be destroyed and bound away from mankind.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:9 — *And to Gabriel said Yahuah (God): ''Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men.* Enoch''s own earlier command to Gabriel is the twin of the order in Enoch 11:5 to destroy the spirits of the reprobate and the children of the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-abyss-of-fire-and-the-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-11-plant-of-righteousness-and-abundance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The long life and completed days of the righteous in Enoch 11:7 are Isaiah''s elect whose days are as the days of a tree.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines planted and the wine in abundance of Enoch 11:9 are Isaiah''s restored people planting vineyards and eating their fruit.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 9:13 — *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt.* The thousandfold seed and overflowing wine of Enoch 11:9 is Amos'' day of overtaking harvests and mountains dropping sweet wine.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:11 — *And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway.* The plant of righteousness and truth appearing in Enoch 11:6 is Jubilees'' new and righteous nature made for all His works after the flood-judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-plant-of-righteousness-and-abundance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-11-earth-cleansed-all-nations-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The all-nations adoration of Enoch 11:11 is Zephaniah''s purified peoples calling on the Name with one consent.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 14:9 — *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* When all nations worship Me in Enoch 11:11, it is Zechariah''s day when Yahuah is king over all the earth and His name is one.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The universal worship of Enoch 11:11 is the Psalm''s ends of the world turning and all the kindreds of the nations worshipping before Him.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The nations'' worship in Enoch 11:11 is Isaiah''s peoples coming to walk in His paths under the Torah that goes forth from Zion.'
  FROM cross_reference_threads t, cross_references x, _session250_en11_lookup sv, _session250_en11_lookup tv
 WHERE t.slug='1-enoch-11-earth-cleansed-all-nations-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

