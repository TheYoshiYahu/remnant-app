-- ----- fragment: minion_1enoch_68.sql (session250 1-enoch 68) -----
-- Source anchor: enoch/1-enoch ch68. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en68 (view _session250_en68_lookup). Sort band base 51675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en68_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-68-watchers-descend-hermon
  ('enoch', '1-enoch', 68, 1, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very descent Enoch''s roster commemorates is Moses'' own account of the sons of Elohim taking wives.'),
  ('enoch', '1-enoch', 68, 1, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The two hundred who descended on Hermon are the fathers of Genesis 6''s giants.'),
  ('enoch', '1-enoch', 68, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same Watchers who left heaven for Hermon, already bound for the judgment.'),
  ('enoch', '1-enoch', 68, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter seals the same sentence on the angels who sinned that Enoch''s roster identifies by name.'),
  ('enoch', '1-enoch', 68, 1, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the same descent, fixing it in its jubilee-reckoning.'),
  -- thread: 1-enoch-68-forbidden-arts-corruption
  ('enoch', '1-enoch', 68, 8, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* Enoch''s "they became corrupt in all their ways" is Moses'' own verdict on the same generation.'),
  ('enoch', '1-enoch', 68, 9, 'canon', 'deuteronomy', 18, 10, 'free', E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* The enchantments and star-reading the Watchers taught are exactly the arts the Torah forbids Israel.'),
  ('enoch', '1-enoch', 68, 7, 'jubilees', 'jubilees', 5, 2, 'extras', E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth... and every imagination of the thoughts of all men (was) thus evil continually.* Jubilees echoes the same total corruption that the Watchers'' teaching unleashed.'),
  ('enoch', '1-enoch', 68, 7, 'enoch', '1-enoch', 8, 1, 'extras', E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them...* Enoch tells the same teaching of Azazel earlier in his own book — this chapter is the recapitulation.'),
  -- thread: 1-enoch-68-cry-went-up-judgment
  ('enoch', '1-enoch', 68, 10, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The cry that goes up answers in Isaiah''s punishment of the host on high — the same heavenly rebels Enoch named.'),
  ('enoch', '1-enoch', 68, 10, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The Watchers'' binding in the abyss until the judgment is Isaiah''s host shut in the pit until they are visited.'),
  ('enoch', '1-enoch', 68, 10, 'canon', 'revelation', 20, 10, 'free', E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* The cry rising to heaven finds its final answer in the great-day sentence on the deceiver and his powers.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en68_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en68_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-68-watchers-descend-hermon',
       E'Two hundred who swore on Hermon — the angels who left their estate',
       E'Enoch names the rebels and the place of the crime: *And these are the names of the chiefs of the two hundred angels who went down in the days of Jared on the summit of Mount Hermon, And they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* (1 Enoch 68:1). This is no new doctrine smuggled in from the margins — it is the canon''s own Genesis 6, told in fuller detail. Moses records the descent: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2), and the offspring: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4). The New Testament reads it exactly the same way — not as myth but as covenant rebellion already under sentence: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 6); *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Jubilees carries the same descent into the same jubilee-reckoning: *the angels of Elohim (God) saw them... and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* (Jubilees 5:1). The Watchers are Genesis 6 — the rebellion against the Creator''s order from which the whole seed-war runs.',
       sv.verse_id, ev.verse_id, 'extras', 51675
  FROM _session250_en68_lookup sv, _session250_en68_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=68 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-68-forbidden-arts-corruption',
       E'Azazel taught the arts — and the earth was filled with corruption',
       E'Enoch records what the Watchers taught and what it bred: *And these are the names of the chiefs who taught mankind: Azâzêl taught men to make swords, and knives, and shields, and breastplates, And made known to them the metals of the earth and the art of working them... And all kinds of costly stones, and all colouring tinctures.* (1 Enoch 68:7), with sorcery added — *Semjâzâ taught enchantments, and root-cuttings... Barâqîjâl (taught) astrology, Kôkabêl the constellations, Êzêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Samsiêl the signs of the sun, and Sariêl the course of the moon.* (1 Enoch 68:9). The fruit is named plainly: *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* (1 Enoch 68:8) — which is word-for-word the verdict of Genesis: *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* (Genesis 6:11). And these very arts — divination, enchantment, the reading of times and the heavens — are the abominations the Torah forbids: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* (Deuteronomy 18:10). The teaching is not knowledge but rebellion against the Creator''s order; Torah stands as the line the Watchers crossed.',
       sv.verse_id, ev.verse_id, 'extras', 51678
  FROM _session250_en68_lookup sv, _session250_en68_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=68 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-68-cry-went-up-judgment',
       E'Their cry went up to heaven — the host reserved unto judgment',
       E'The chapter closes on the groan of the ruined earth: *And as men perished, they cried, and their cry went up to heaven.* (1 Enoch 68:10). That cry does not go unanswered. Isaiah foresees the very sentence that awaits the Watchers — the host of heaven shut in the pit, exactly as Enoch''s Watchers are bound: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21); *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). The New Testament holds them in the same chains *unto judgment* (2 Peter 2:4 / Jude 6), and Revelation carries the sentence to its end, the deceiver and his powers given over for ever: *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* (Revelation 20:10). It ain''t new: the cry that rises in Enoch 68 is the same cry the whole canon answers with the great day of judgment.',
       sv.verse_id, ev.verse_id, 'extras', 51681
  FROM _session250_en68_lookup sv, _session250_en68_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=68 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-68-watchers-descend-hermon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very descent Enoch''s roster commemorates is Moses'' own account of the sons of Elohim taking wives.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-watchers-descend-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The two hundred who descended on Hermon are the fathers of Genesis 6''s giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-watchers-descend-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same Watchers who left heaven for Hermon, already bound for the judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-watchers-descend-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter seals the same sentence on the angels who sinned that Enoch''s roster identifies by name.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-watchers-descend-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:1 — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the same descent, fixing it in its jubilee-reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-watchers-descend-hermon'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-68-forbidden-arts-corruption
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* Enoch''s "they became corrupt in all their ways" is Moses'' own verdict on the same generation.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-forbidden-arts-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:10 — *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* The enchantments and star-reading the Watchers taught are exactly the arts the Torah forbids Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-forbidden-arts-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth... and every imagination of the thoughts of all men (was) thus evil continually.* Jubilees echoes the same total corruption that the Watchers'' teaching unleashed.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-forbidden-arts-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them...* Enoch tells the same teaching of Azazel earlier in his own book — this chapter is the recapitulation.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-forbidden-arts-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-68-cry-went-up-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The cry that goes up answers in Isaiah''s punishment of the host on high — the same heavenly rebels Enoch named.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-cry-went-up-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The Watchers'' binding in the abyss until the judgment is Isaiah''s host shut in the pit until they are visited.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-cry-went-up-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:10 — *And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.* The cry rising to heaven finds its final answer in the great-day sentence on the deceiver and his powers.'
  FROM cross_reference_threads t, cross_references x, _session250_en68_lookup sv, _session250_en68_lookup tv
 WHERE t.slug='1-enoch-68-cry-went-up-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=68 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

