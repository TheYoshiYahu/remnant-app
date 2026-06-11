-- S227 enrichment — Revelation 9: the abyss/locusts (1 Enoch territory)
-- ADD-only: new cross_references + new thread members on the existing live ch9 threads
-- (built in session224). References the shared view _s227_rev_lookup defined by the
-- assembled migration. No rewrites, no deletes; ON CONFLICT DO NOTHING throughout.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the fallen star and the key of the bottomless pit (extras) — promote more of 1 Enoch's prison-of-stars
  ('canon','revelation',9,1,'enoch','1-enoch',18,11,'extras', E'*And beyond that abyss I saw a place which had no firmament of the heaven above, and no firmly founded earth beneath it: there was no water upon it, and no birds, but it was a waste and horrible place* (1 Enoch 18:11). The bottomless pit the seer sees unlocked (Revelation 9:1) is the waste place at the end of heaven and earth that Enoch was shown — neither firmament above nor earth beneath, the very abyss the fallen star is given the key to open.'),
  ('canon','revelation',9,1,'enoch','1-enoch',18,13,'extras', E'*And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times* (1 Enoch 18:13). The star fallen from heaven (Revelation 9:1) is one of these transgressing stars Enoch named — the host that broke the commandment and was bound in the prison-pit; the fall the seer watches is the fall the older library had already charted.'),
  ('canon','revelation',9,2,'enoch','1-enoch',18,15,'extras', E'*a great fire there which burnt and blazed, and the place was cleft as far as the abyss, being full of great descending columns of fire* (1 Enoch 18:15). The smoke that rises *as the smoke of a great furnace* (Revelation 9:2) is the smoke of this fire Enoch saw — the abyss cleft and full of descending columns of fire, the furnace-chamber whose mouth the trumpet now opens.'),
  ('canon','revelation',9,1,'enoch','1-enoch',21,5,'extras', E'*This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven* (1 Enoch 21:5). The pit unlocked at the fifth trumpet (Revelation 9:1) is the prison-house Enoch was twice shown — the appointed cell of the fallen stars and the host of heaven, held until their guilt should be consummated and the appointed hour come.'),
  ('canon','revelation',9,1,'enoch','1-enoch',88,3,'extras', E'*and gathered and took all the great stars whose privy members were like those of horses, and bound them all hand and foot, and cast them in an abyss of the earth* (1 Enoch 88:3). The binding Enoch saw — the stars bound hand and foot and cast into the abyss of the earth — is the other end of the loosing John sees: the long-bound fallen ones, and the star given the key when the appointed time is come (Revelation 9:1).'),
  -- thread: the locusts out of the smoke, and the sealed spared (free) — add prophetic Joel
  ('canon','revelation',9,3,'canon','joel',1,5,'free', E'*Awake, ye drunkards, and weep; and howl, all ye drinkers of wine, because of the new wine; for it is cut off from your mouth* (Joel 1:5). Joel''s locust-day is a summons that strips the careless of their ease; so the locusts out of the smoke (Revelation 9:3) come upon the men who have not the seal, the day of Yahuah (LORD) waking the secure to the torment they cannot escape.'),
  -- thread: five months torment, and men seeking death (free, P=jeremiah only) — add Job and Hosea
  ('canon','revelation',9,6,'canon','job',3,20,'free', E'*Wherefore is light given to him that is in misery, and life unto the bitter in soul* (Job 3:20). Job''s cry — why is life given to the bitter in soul who would be rid of it — is the very anguish of the fifth trumpet, when men *seek death, and shall not find it* (Revelation 9:6); life is held on them as a torment, the light a burden to the soul that longs for the grave.'),
  ('canon','revelation',9,6,'canon','job',3,22,'free', E'*Which rejoice exceedingly, and are glad, when they can find the grave?* (Job 3:22). Job names those who would *rejoice exceedingly* could they but find the grave; so the men of the trumpet *desire to die, and death shall flee from them* (Revelation 9:6) — the grave they crave is denied, the gladness Job spoke of forever out of reach for the five months appointed.'),
  ('canon','revelation',9,6,'canon','job',7,15,'free', E'*So that my soul chooseth strangling, and death rather than my life* (Job 7:15). The soul that *chooseth... death rather than my life* is the soul of the scorpion-stung who *shall desire to die* (Revelation 9:6). Job''s extremity is theirs — to choose death over life and be refused even that choice, the torment outlasting the will to live.'),
  ('canon','revelation',9,6,'canon','hosea',10,8,'free', E'*and they shall say to the mountains, Cover us; and to the hills, Fall on us* (Hosea 10:8). The cry Hosea put in the mouth of the judged — *Cover us... Fall on us* — is the same flight from a life become unbearable; the men of the fifth trumpet *shall seek death, and shall not find it* (Revelation 9:6), begging the grave to take them as Hosea''s people begged the hills to fall.'),
  -- thread: the shapes of the locusts, like Joel's army (free, P=joel) — add more Joel 2
  ('canon','revelation',9,7,'canon','joel',2,6,'free', E'*Before their face the people shall be much pained: all faces shall gather blackness* (Joel 2:6). Joel''s locust-army brings dread upon every face; so the trumpet-locusts, *their faces... as the faces of men* (Revelation 9:7), advance as Joel''s host before which the people are *much pained.* The shape of the swarm is the prophet''s day-of-Yahuah army made vision.'),
  ('canon','revelation',9,9,'canon','joel',2,7,'free', E'*They shall run like mighty men; they shall climb the wall like men of war; and they shall march every one on his ways, and they shall not break their ranks* (Joel 2:7). The ordered, unbreakable advance of Joel''s host — *they shall not break their ranks* — is the war-array of the locusts whose *sound of their wings was as the sound of chariots of many horses running to battle* (Revelation 9:9): a marshalled army, not a scattered swarm.'),
  ('canon','revelation',9,9,'canon','joel',2,9,'free', E'*They shall run to and fro in the city; they shall run upon the wall, they shall climb up upon the houses; they shall enter in at the windows like a thief* (Joel 2:9). Joel''s locusts overrun the city wall and house and window; the chariot-loud swarm of the fifth trumpet (Revelation 9:9) is that same all-pervading host, the prophet''s relentless army loosed to torment the unsealed.'),
  -- thread: Abaddon, Apollyon, the angel of the bottomless pit (extras) — promote more of 1 Enoch's bound destroyer
  ('canon','revelation',9,11,'enoch','1-enoch',10,5,'extras', E'*And place upon him rough and jagged rocks, and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light* (1 Enoch 10:5). The bound chief of the fallen, sealed under rocks and darkness until judgment, is the angel of the bottomless pit (Revelation 9:11) — held in the pit Enoch described, the king of the swarm loosed only at the appointed trumpet.'),
  ('canon','revelation',9,11,'enoch','1-enoch',10,6,'extras', E'*And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6). The destroyer''s end is the fire of the great judgment; the angel of the bottomless pit whose name is Destruction (Revelation 9:11) is bound now and reserved for the fire — loosed for the torment of the five months, but kept for the judgment Enoch foretold.'),
  ('canon','revelation',9,11,'enoch','1-enoch',20,2,'extras', E'*Uriel, one of the holy angels, who is over the world and over Tartarus* (1 Enoch 20:2). The library knew an angel set over the abyss itself — Uriel, *over... Tartarus* — and the king of the locusts is *the angel of the bottomless pit* (Revelation 9:11): the deep place has its appointed powers, and from it the destroyer ascends when the seal is opened.'),
  -- thread: four angels bound at the Euphrates, and the horsemen (free, P=isaiah/jeremiah, E=0) — add 1 Enoch host + more prophets
  ('canon','revelation',9,15,'enoch','1-enoch',56,5,'extras', E'*And in those days the angels shall return And hurl themselves to the east upon the Parthians and Medes: They shall stir up the kings, so that a spirit of unrest shall come upon them, And they shall rouse them from their thrones* (1 Enoch 56:5). The four angels loosed at the Euphrates to slay the third part (Revelation 9:15) do the very work Enoch saw — angels hurled to the east who *stir up the kings* and rouse the eastern host to war; the loosing of the bound angels is the loosing of the army upon the kingdoms.'),
  ('canon','revelation',9,16,'enoch','1-enoch',56,6,'extras', E'*And they shall go up and tread under foot the land of His elect ones, And the land of His elect ones shall be before them a threshing-floor and a highway* (1 Enoch 56:6). The numberless cavalry of the sixth trumpet (Revelation 9:16) is Enoch''s eastern multitude that goes up to tread the land underfoot — the angel-stirred host from beyond the river, loosed to do its appointed slaughter.'),
  ('canon','revelation',9,15,'enoch','1-enoch',56,7,'extras', E'*Till there be no number of the corpses through their slaughter, And their punishment be not in vain* (1 Enoch 56:7). The host loosed at the Euphrates is *to slay the third part of men* (Revelation 9:15); Enoch foretold the same — slaughter *till there be no number of the corpses,* the punishment of the appointed hour not in vain.'),
  ('canon','revelation',9,17,'canon','isaiah',5,27,'free', E'*None shall be weary nor stumble among them; none shall slumber nor sleep; neither shall the girdle of their loins be loosed, nor the latchet of their shoes be broken* (Isaiah 5:27). Isaiah''s summoned army is tireless and unbreakable; the lion-headed horsemen out of whose mouths *issued fire and smoke and brimstone* (Revelation 9:17) are that very host — none weary, none slumbering, the day-of-vengeance cavalry the prophet described.'),
  ('canon','revelation',9,15,'canon','jeremiah',46,6,'free', E'*Let not the swift flee away, nor the mighty man escape; they shall stumble, and fall toward the north by the river Euphrates* (Jeremiah 46:6). Jeremiah set the slaughter at the very river — *they shall... fall toward the north by the river Euphrates* — where the four angels are bound and loosed to slay (Revelation 9:15); the covenant river is the appointed place of the falling, in the prophet and in the trumpet alike.'),
  -- thread: they repented not of worshipping devils and idols (extras) — add prophetic + 1 Enoch
  ('canon','revelation',9,20,'canon','daniel',5,23,'free', E'*and thou hast praised the gods of silver, and gold, of brass, iron, wood, and stone, which see not, nor hear, nor know* (Daniel 5:23). Daniel''s charge against Belshazzar names the very idols the survivors will not forsake — *gods of silver, and gold, of brass, iron, wood, and stone* — the made-things *which see not, nor hear, nor know,* exactly the *idols of gold, and silver, and brass, and stone, and of wood* of which they *repented not* (Revelation 9:20).'),
  ('canon','revelation',9,20,'canon','psalms',135,16,'free', E'*They have mouths, but they speak not; eyes have they, but they see not* (Psalm 135:16). The Psalter''s litany of the dead idols — *mouths, but they speak not; eyes... but they see not* — is the seer''s own *which neither can see, nor hear, nor walk* (Revelation 9:20); the breathless gods the unrepentant cling to are the speechless, sightless made-things the psalm had long exposed.'),
  ('canon','revelation',9,20,'canon','psalms',115,6,'free', E'*They have ears, but they hear not: noses have they, but they smell not* (Psalm 115:6). The psalm names sense after sense the idols lack — *ears, but they hear not* — the very catalogue the seer takes up against the idols of gold and silver of which the survivors *repented not* (Revelation 9:20); the worshippers cling to gods more dead than themselves.'),
  ('canon','revelation',9,20,'enoch','1-enoch',99,7,'extras', E'*And they who worship stones, and grave images of gold and silver and wood and clay, And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them* (1 Enoch 99:7). The restored library binds the two charges into one, just as the seer does: those who *worship... grave images of gold and silver and wood* and *worship impure spirits and demons* — idol-worship and devil-worship together, exactly *the works of their hands, that they should not worship devils, and idols of gold, and silver* (Revelation 9:20). And, as Enoch warns, the idols *shall get no manner of help from them*: the plagues fall and the breathless gods cannot save.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== thread members =====
-- members: revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14 (existing 1..8)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 18:11 — *a place which had no firmament of the heaven above, and no firmly founded earth beneath it... a waste and horrible place* the waste abyss at the end of heaven and earth, the pit the fallen star unlocks (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 18:13 — *the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God)* the transgressing stars bound for breaking the commandment; the fallen star is one of them (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 18:15 — *a great fire there which burnt and blazed, and the place was cleft as far as the abyss, being full of great descending columns of fire* the furnace-chamber whose smoke rises as the smoke of a great furnace (Revelation 9:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'1 Enoch 21:5 — *This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven* the appointed prison of the fallen stars, the pit unlocked at the fifth trumpet (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 25, E'1 Enoch 88:3 — *bound them all hand and foot, and cast them in an abyss of the earth* the fallen stars bound and cast into the abyss; the loosing John sees is the other end of this binding (Revelation 9:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-fallen-star-and-the-key-of-the-bottomless-pit-the-smoke-of-the-furnace-genesis-19-isaiah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=88 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9 (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 1:5 — *Awake, ye drunkards, and weep... for the new wine... is cut off from your mouth* the locust-day wakes the careless to judgment; the locusts of the smoke come on the unsealed (Revelation 9:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-locusts-out-of-the-smoke-and-the-sealed-spared-joel-1-exodus-10-ezekiel-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8 (existing 1..2)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Job 3:20 — *Wherefore is light given to him that is in misery, and life unto the bitter in soul* life held on the bitter soul as a torment; men seek death and find it not (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Job 3:22 — *Which rejoice exceedingly, and are glad, when they can find the grave?* the gladness of finding the grave, denied the men of the fifth trumpet who desire to die (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Job 7:15 — *my soul chooseth strangling, and death rather than my life* the soul choosing death over life, the extremity of the scorpion-stung (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'Hosea 10:8 — *they shall say to the mountains, Cover us; and to the hills, Fall on us* the flight from a life made unbearable, the death the trumpet-men beg for and are refused (Revelation 9:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-five-months-torment-and-men-seeking-death-job-3-jeremiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2 (existing 1..4)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 2:6 — *Before their face the people shall be much pained: all faces shall gather blackness* the dread of Joel''s host before which every face blackens, the advancing locusts with faces as men (Revelation 9:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:7 — *they shall march every one on his ways, and they shall not break their ranks* the marshalled, unbreakable war-array of Joel''s host, the chariot-loud locust-army (Revelation 9:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Joel 2:9 — *they shall run upon the wall, they shall climb up upon the houses; they shall enter in at the windows like a thief* the all-pervading host overrunning wall and house, the relentless swarm of the fifth trumpet (Revelation 9:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-shapes-of-the-locusts-like-joels-army-of-horses-joel-1-and-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88 (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 10:5 — *cover him with darkness, and let him abide there for ever, and cover his face that he may not see light* the bound chief sealed under darkness until judgment, the angel of the bottomless pit (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire* the destroyer reserved for the fire of judgment; loosed for the torment but kept for the end (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 20:2 — *Uriel, one of the holy angels, who is over the world and over Tartarus* an angel set over the abyss itself; the king of the swarm is the angel of the bottomless pit (Revelation 9:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-abaddon-apollyon-the-angel-of-the-bottomless-pit-job-26-proverbs-15-psalm-88'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5 (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 56:5 — *the angels shall return And hurl themselves to the east upon the Parthians and Medes: They shall stir up the kings... And they shall rouse them from their thrones* the angels loosed to stir up the eastern host, the four angels loosed at the Euphrates (Revelation 9:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 56:6 — *they shall go up and tread under foot the land of His elect ones... a threshing-floor and a highway* the numberless eastern multitude that treads the land, the cavalry of the sixth trumpet (Revelation 9:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=56 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 56:7 — *Till there be no number of the corpses through their slaughter, And their punishment be not in vain* the appointed slaughter without number, the host loosed to slay the third part of men (Revelation 9:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=56 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'Isaiah 5:27 — *None shall be weary nor stumble among them; none shall slumber nor sleep* Isaiah''s tireless summoned army, the lion-headed horsemen of the sixth trumpet (Revelation 9:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 25, E'Jeremiah 46:6 — *they shall stumble, and fall toward the north by the river Euphrates* the slaughter set at the very river where the four angels are bound and loosed (Revelation 9:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-the-four-angels-bound-at-the-euphrates-and-the-horsemen-genesis-15-jeremiah-46-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=46 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115 (existing 1..6)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 5:23 — *thou hast praised the gods of silver, and gold, of brass, iron, wood, and stone, which see not, nor hear, nor know* Daniel''s charge naming the very idols of which the survivors repented not (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 135:16 — *They have mouths, but they speak not; eyes have they, but they see not* the Psalter''s litany of dead idols, *which neither can see, nor hear, nor walk* (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Psalm 115:6 — *They have ears, but they hear not: noses have they, but they smell not* sense after sense the idols lack; the breathless gods the unrepentant cling to (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'1 Enoch 99:7 — *they who worship stones, and grave images of gold and silver and wood... And those who worship impure spirits and demons* the library binds idol-worship and devil-worship as one charge, exactly the seer''s (Revelation 9:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-9-they-repented-not-of-worshipping-devils-and-idols-of-gold-deuteronomy-32-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
