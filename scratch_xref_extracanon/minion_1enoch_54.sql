-- ----- fragment: minion_1enoch_54.sql (session250 1-enoch 54) -----
-- Source anchor: enoch/1-enoch ch54. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en54 (view _session250_en54_lookup). Sort band base 51325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en54_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-54-burning-valley-lake-of-fire
  ('enoch', '1-enoch', 54, 1, 'canon', 'revelation', 20, 10, 'free', E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* John''s lake of fire is Enoch''s deep valley of burning fire, the appointed end of the rebel host.'),
  ('enoch', '1-enoch', 54, 2, 'canon', 'revelation', 19, 20, 'free', E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* As Enoch sees the kings and the mighty cast into the valley, John sees the deceiving powers cast alive into the same burning.'),
  ('enoch', '1-enoch', 54, 1, 'canon', 'matthew', 25, 41, 'free', E'Matthew 25:41 — *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels:* Yahusha names the burning valley as fire prepared beforehand for the rebel angels, exactly the host Enoch watches being consigned to it.'),
  -- thread: 1-enoch-54-chains-prepared-host-of-azazel
  ('enoch', '1-enoch', 54, 5, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s everlasting chains reserved unto the great day are Enoch''s iron chains prepared for the host of Azazel, kept for the great day of judgement.'),
  ('enoch', '1-enoch', 54, 5, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s chains of darkness reserved unto judgment match the iron chains forged for Azazel''s hosts to be cast into the abyss of complete condemnation.'),
  ('enoch', '1-enoch', 54, 6, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host of the high ones gathered as prisoners and shut up until visited is the same reserving-until-the-great-day that the archangels execute upon Azazel''s hosts in Enoch.'),
  ('enoch', '1-enoch', 54, 6, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Enoch''s earlier sentence on Azazel — bound now, cast into the fire on the great judgement day — is fulfilled in this vision where the archangels cast his hosts into the burning furnace on that great day.'),
  -- thread: 1-enoch-54-chambers-of-waters-the-flood
  ('enoch', '1-enoch', 54, 7, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Enoch''s chambers of waters above the heavens and fountains beneath the earth are Genesis'' windows of heaven opened and fountains of the great deep broken up — the same Flood, named from both sides.'),
  ('enoch', '1-enoch', 54, 9, 'canon', 'genesis', 7, 21, 'free', E'Genesis 7:21 — *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast, and of every creeping thing that creepeth upon the earth, and every man:* Genesis records the outcome Enoch foresees — the joined waters destroying all who dwell on the earth.'),
  ('enoch', '1-enoch', 54, 7, 'canon', '2-peter', 3, 6, 'free', E'2 Peter 3:6 — *Whereby the world that then was, being overflowed with water, perished:* Peter names the Flood as the former world-judgement and pattern of the judgement to come, the very framing of Enoch''s Noachic fragment on the first world judgement.'),
  ('enoch', '1-enoch', 54, 7, 'enoch', '1-enoch', 10, 2, 'extras', E'1 Enoch 10:2 — *Go to Noah and tell him in My Name “Hide thyself!” and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* Enoch''s earlier announcement of the deluge to Noah is the same first water-judgement this chapter recalls as Yahuah of Spirits opens the chambers of waters.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en54_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en54_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-54-burning-valley-lake-of-fire',
       E'The deep valley of burning fire — the lake of fire prepared',
       E'Enoch is shown the doom of the rebel host and the kings who served them: *And I looked and turned to another part of the earth, and saw there a deep valley with burning fire.* (1 Enoch 54:1) — *And they brought the kings and the mighty, and began to cast them into this deep valley.* (1 Enoch 54:2). This is the burning end John names plainly. The same furnace receives the deceiver and his servants: *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* (Revelation 20:10), and the kings'' captains of deception go in first — *These both were cast alive into a lake of fire burning with brimstone.* (Revelation 19:20). Yahusha (Jesus) had already declared the fire was not made for men but for the rebel powers: *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels* (Matthew 25:41). Enoch sees the valley; the Gospels and Revelation name the One who pronounces the sentence and the fire that was prepared. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51325
  FROM _session250_en54_lookup sv, _session250_en54_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=54 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-54-chains-prepared-host-of-azazel',
       E'Iron chains prepared for the hosts of Azazel — reserved unto judgement',
       E'Enoch asks about the fetters being forged: *And there mine eyes saw how they made these their instruments, iron chains of immeasurable weight.* (1 Enoch 54:3), and the angel answers — *These are being prepared for the hosts of Azâzêl, so that they may take them and cast them into the abyss of complete condemnation... as Yahuah (God) of Spirits commanded.* (1 Enoch 54:5), to be executed by the archangels who *shall take hold of them on that great day, and cast them on that day into the burning furnace* (1 Enoch 54:6). This is the canon''s own doctrine of the bound Watchers: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6) — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Isaiah saw the same host shut up: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21), *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). Enoch''s own earlier vision already gave the sentence on the chief: Yahuah told Raphael, *Bind Azâzêl hand and foot, and cast him into the darkness... And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:4, 6). The judgement is for rebellion against the Creator''s order, not for keeping His way — and Jude and Peter carry this binding straight into the canon. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51328
  FROM _session250_en54_lookup sv, _session250_en54_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=54 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-54-chambers-of-waters-the-flood',
       E'The chambers of waters opened — the Flood as the former judgement',
       E'The Noachic fragment recalls the first world-judgement, the judgement of water: *And in those days shall punishment come from Yahuah (God) of Spirits, and He will open all the chambers of waters which are above the heavens, and of the fountains which are beneath the earth.* (1 Enoch 54:7), so that *all the waters shall be joined with the waters* (1 Enoch 54:8) and *shall destroy all who dwell on the earth* (1 Enoch 54:9). This is Genesis told from heaven''s side: *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* (Genesis 7:11) — the very pairing of fountains beneath and waters above — and its end, *And all flesh died that moved upon the earth* (Genesis 7:21). Peter sets that water-judgement as the pattern of the fire to come: *Whereby the world that then was, being overflowed with water, perished* (2 Peter 3:6). Enoch''s own Watcher vision had already announced the deluge to Noah: *the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* (1 Enoch 10:2). The men perish by their own unrighteousness recognized too late (54:10) — the Flood stands in the canon as the first witness that the Judge of Spirits has judged a rebellious world before, and will again. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51331
  FROM _session250_en54_lookup sv, _session250_en54_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=54 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-54-burning-valley-lake-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* John''s lake of fire is Enoch''s deep valley of burning fire, the appointed end of the rebel host.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-burning-valley-lake-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* As Enoch sees the kings and the mighty cast into the valley, John sees the deceiving powers cast alive into the same burning.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-burning-valley-lake-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:41 — *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels:* Yahusha names the burning valley as fire prepared beforehand for the rebel angels, exactly the host Enoch watches being consigned to it.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-burning-valley-lake-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-54-chains-prepared-host-of-azazel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s everlasting chains reserved unto the great day are Enoch''s iron chains prepared for the host of Azazel, kept for the great day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chains-prepared-host-of-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s chains of darkness reserved unto judgment match the iron chains forged for Azazel''s hosts to be cast into the abyss of complete condemnation.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chains-prepared-host-of-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host of the high ones gathered as prisoners and shut up until visited is the same reserving-until-the-great-day that the archangels execute upon Azazel''s hosts in Enoch.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chains-prepared-host-of-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Enoch''s earlier sentence on Azazel — bound now, cast into the fire on the great judgement day — is fulfilled in this vision where the archangels cast his hosts into the burning furnace on that great day.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chains-prepared-host-of-azazel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-54-chambers-of-waters-the-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Enoch''s chambers of waters above the heavens and fountains beneath the earth are Genesis'' windows of heaven opened and fountains of the great deep broken up — the same Flood, named from both sides.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chambers-of-waters-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:21 — *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast, and of every creeping thing that creepeth upon the earth, and every man:* Genesis records the outcome Enoch foresees — the joined waters destroying all who dwell on the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chambers-of-waters-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:6 — *Whereby the world that then was, being overflowed with water, perished:* Peter names the Flood as the former world-judgement and pattern of the judgement to come, the very framing of Enoch''s Noachic fragment on the first world judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chambers-of-waters-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:2 — *Go to Noah and tell him in My Name “Hide thyself!” and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* Enoch''s earlier announcement of the deluge to Noah is the same first water-judgement this chapter recalls as Yahuah of Spirits opens the chambers of waters.'
  FROM cross_reference_threads t, cross_references x, _session250_en54_lookup sv, _session250_en54_lookup tv
 WHERE t.slug='1-enoch-54-chambers-of-waters-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=54 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

