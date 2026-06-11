-- ----- fragment: minion_1enoch_17.sql (session250 1-enoch 17) -----
-- Source anchor: enoch/1-enoch ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en17 (view _session250_en17_lookup). Sort band base 50400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-17-place-of-fire-river-of-fire
  ('enoch', '1-enoch', 17, 1, 'canon', 'psalms', 104, 4, 'free', E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The people who appear as flaming fire and then as men (1 Enoch 17:1) are the canon''s own fire-ministers of Yahuah.'),
  ('enoch', '1-enoch', 17, 4, 'canon', 'deuteronomy', 32, 22, 'free', E'Deuteronomy 32:22 — *For a fire is kindled in mine anger, and shall burn unto the lowest hell, and shall consume the earth with her increase, and set on fire the foundations of the mountains.* The river of fire that flows like water (1 Enoch 17:4) is the same kindled fire Moses says burns to the lowest depths.'),
  ('enoch', '1-enoch', 17, 3, 'canon', 'psalms', 18, 14, 'free', E'Psalms 18:14 — *Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them.* The fiery bow, arrows and lightnings Enoch sees stored in the depths (1 Enoch 17:3) are Yahuah''s own weaponry of judgement.'),
  -- thread: 1-enoch-17-great-darkness-waters-of-the-deep
  ('enoch', '1-enoch', 17, 5, 'canon', 'job', 38, 16, 'free', E'Job 38:16 — *Hast thou entered into the springs of the sea? or hast thou walked in the search of the depth?* The place where no flesh walks and the waters of the deep (1 Enoch 17:5-6) are the springs of the sea Yahuah challenges Job to enter.'),
  ('enoch', '1-enoch', 17, 6, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The treasuries of winter''s darkness and the waters of the deep that Enoch sees (1 Enoch 17:6) are the hidden treasures Yahuah keeps from Job.'),
  ('enoch', '1-enoch', 17, 8, 'canon', 'psalms', 104, 2, 'free', E'Psalms 104:2 — *Who coverest thyself with light as with a garment: who stretchest out the heavens like a curtain:* The wisdom by which He ordered all creation and founded the world (1 Enoch 17:8) is the psalm''s God who stretches out the heavens.'),
  -- thread: 1-enoch-17-cornerstone-four-winds-pillars
  ('enoch', '1-enoch', 17, 9, 'canon', 'job', 38, 6, 'free', E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch is shown (1 Enoch 17:9) is the very corner stone Yahuah challenges Job to name.'),
  ('enoch', '1-enoch', 17, 10, 'canon', 'job', 26, 11, 'free', E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* The winds that stand between heaven and earth as the pillars of the heaven (1 Enoch 17:10) are Job''s pillars of heaven that tremble before Yahuah.'),
  ('enoch', '1-enoch', 17, 9, 'canon', 'psalms', 104, 5, 'free', E'Psalms 104:5 — *Who laid the foundations of the earth, that it should not be removed for ever.* The four winds that bear the earth (1 Enoch 17:9) uphold the same unmoveable foundation the psalm ascribes to Yahuah.'),
  -- thread: 1-enoch-17-throne-mountain-of-sapphire
  ('enoch', '1-enoch', 17, 15, 'canon', 'exodus', 24, 10, 'free', E'Exodus 24:10 — *And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* The throne-mountain topped with sapphire (1 Enoch 17:15) matches the sapphire pavement the elders saw beneath Yahuah on the mountain.'),
  ('enoch', '1-enoch', 17, 15, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire summit of Enoch''s throne-mountain (1 Enoch 17:15) is the same sapphire throne Ezekiel saw above the firmament.'),
  -- thread: 1-enoch-17-prison-of-the-stars-bound-till-judgement
  ('enoch', '1-enoch', 17, 21, 'enoch', '1-enoch', 21, 7, 'extras', E'1 Enoch 21:7 — *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* Enoch revisits the same prison of the stars later in the journey, repeating the binding-till-judgement of 1 Enoch 17:21 word for word.'),
  ('enoch', '1-enoch', 17, 20, 'canon', 'psalms', 148, 6, 'free', E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars are bound because they transgressed the commandment and missed their appointed times (1 Enoch 17:20) — they broke the very decree the psalm says shall not pass.'),
  ('enoch', '1-enoch', 17, 19, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* The prison for the stars and the host of heaven (1 Enoch 17:19) is Jude''s wandering stars reserved to the blackness of darkness.'),
  ('enoch', '1-enoch', 17, 21, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The host bound till their guilt is consummated (1 Enoch 17:21) is Peter''s angels reserved in chains of darkness unto judgement.'),
  ('enoch', '1-enoch', 17, 19, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Enoch''s prison for the host of heaven (1 Enoch 17:19) is Isaiah''s host of the high ones shut up and visited after many days.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-place-of-fire-river-of-fire',
       E'The place of fire and the river of fire',
       E'Enoch''s cosmic journey opens in fire: *And they took me to a place in which people were like flaming fire, and, when they wished, they appeared as men.* (1 Enoch 17:1) — and on to *the river of fire in which the fire flows like water and discharges itself into the great sea towards the west.* (1 Enoch 17:4), with *a fiery bow, arrows and their quiver, a fiery sword and all the lightnings.* (1 Enoch 17:3). It ain''t new. The Tanakh already knows the ministers of Yahuah as fire: *Who maketh his angels spirits; his ministers a flaming fire:* (Psalms 104:4) — the very fire-men Enoch sees. The kindled fire that runs to the depths is Moses'' own warning: *For a fire is kindled in mine anger, and shall burn unto the lowest hell, and shall consume the earth with her increase, and set on fire the foundations of the mountains.* (Deuteronomy 32:22). And the fiery bow and lightnings are the LORD''s arsenal in the psalm: *Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them.* (Psalms 18:14). The Watcher-host has rebelled against the Creator''s order, but the fire and the arrows belong to Yahuah, not to them — the weaponry of judgement is His.',
       sv.verse_id, ev.verse_id, 'extras', 50400
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-great-darkness-waters-of-the-deep',
       E'The great darkness and the waters of the deep',
       E'Enoch passes *to the great darkness, and went to the place where no flesh walks* (1 Enoch 17:5), sees *the place whence all the waters of the deep flow* (1 Enoch 17:6) and *the mouth of the deep* (1 Enoch 17:7), then confesses the design behind it all: *I saw how He has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 17:8). It ain''t new — this is the very tour Yahuah gives Job out of the whirlwind. The place no flesh walks is the door Job never entered: *Hast thou entered into the springs of the sea? or hast thou walked in the search of the depth?* (Job 38:16). The treasuries Enoch keeps seeing are Job''s hidden stores: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* (Job 38:22). And the wisdom that ordered and founded the world is the psalmist''s God who *stretchest out the heavens like a curtain: Who layeth the beams of his chambers in the waters* (Psalms 104:2-3 — quoted of v2). The Creator''s wise ordering stands; the Watchers transgressed it but could not unmake it.',
       sv.verse_id, ev.verse_id, 'extras', 50403
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-cornerstone-four-winds-pillars',
       E'The cornerstone of the earth and the pillars of heaven',
       E'The journey shows Enoch the structure of the world: *And I saw the cornerstone of the earth: then I saw the four winds which bear the earth and the firmament of the heaven.* (1 Enoch 17:9), how *the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 17:10). It ain''t new. Job is asked the same questions from the whirlwind: *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* (Job 38:4), and *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* (Job 38:6) — Enoch is shown the very cornerstone Job could not name. The pillars are Job''s too: *The pillars of heaven tremble and are astonished at his reproof.* (Job 26:11). And the unmoveable foundation is the psalm''s: *Who laid the foundations of the earth, that it should not be removed for ever.* (Psalms 104:5). The Creator''s architecture holds the cosmos in place — the same wise order the rebel host could not overthrow.',
       sv.verse_id, ev.verse_id, 'extras', 50406
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-throne-mountain-of-sapphire',
       E'The throne-mountain of sapphire',
       E'Among the seven mountains of precious stones Enoch sees one that towers above the rest: *But the middle one reached to heaven like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 17:15). It ain''t new — the sapphire throne is the canon''s own vision of the place of Yahuah. When the elders of Yashar''el went up the mountain they saw it underfoot: *And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* (Exodus 24:10). And Ezekiel, lifted to the firmament, saw the throne itself: *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone* (Ezekiel 1:26). Enoch''s middle mountain is no pagan peak — it is shaped like the sapphire throne the Tanakh already knows, the seat of the Creator whose order the journey everywhere displays.',
       sv.verse_id, ev.verse_id, 'extras', 50409
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-17-prison-of-the-stars-bound-till-judgement',
       E'The prison of the stars bound till judgement',
       E'Beyond the waste place Enoch sees the prison-house of the rebel host: *I saw there seven stars like great burning mountains... ’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 17:19), *the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 17:20), and *He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 17:21). It ain''t new — and Enoch himself sees it again, word for word: *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 21:7). Their crime is breaking the Creator''s fixed order, the decree the psalm says the stars cannot transgress: *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* (Psalms 148:6). The NT carries the binding forward as settled doctrine — these are the *wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13), the *angels that sinned... cast... down to hell, and delivered... into chains of darkness, to be reserved unto judgment:* (2 Peter 2:4). Isaiah names the same prison and the same delayed reckoning: *Yahuah (LORD) shall punish the host of the high ones that are on high... they shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:21 — quoted of v21). The host is not destroyed but held — bound till the reckoning, exactly as Revelation binds the dragon (Revelation 20:2). Torah''s order stands; the rebellion against it awaits judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50412
  FROM _session250_en17_lookup sv, _session250_en17_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=19
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=17 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-17-place-of-fire-river-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The people who appear as flaming fire and then as men (1 Enoch 17:1) are the canon''s own fire-ministers of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-place-of-fire-river-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:22 — *For a fire is kindled in mine anger, and shall burn unto the lowest hell, and shall consume the earth with her increase, and set on fire the foundations of the mountains.* The river of fire that flows like water (1 Enoch 17:4) is the same kindled fire Moses says burns to the lowest depths.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-place-of-fire-river-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 18:14 — *Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them.* The fiery bow, arrows and lightnings Enoch sees stored in the depths (1 Enoch 17:3) are Yahuah''s own weaponry of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-place-of-fire-river-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-great-darkness-waters-of-the-deep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:16 — *Hast thou entered into the springs of the sea? or hast thou walked in the search of the depth?* The place where no flesh walks and the waters of the deep (1 Enoch 17:5-6) are the springs of the sea Yahuah challenges Job to enter.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-great-darkness-waters-of-the-deep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The treasuries of winter''s darkness and the waters of the deep that Enoch sees (1 Enoch 17:6) are the hidden treasures Yahuah keeps from Job.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-great-darkness-waters-of-the-deep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:2 — *Who coverest thyself with light as with a garment: who stretchest out the heavens like a curtain:* The wisdom by which He ordered all creation and founded the world (1 Enoch 17:8) is the psalm''s God who stretches out the heavens.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-great-darkness-waters-of-the-deep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-cornerstone-four-winds-pillars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch is shown (1 Enoch 17:9) is the very corner stone Yahuah challenges Job to name.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-cornerstone-four-winds-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 26:11 — *The pillars of heaven tremble and are astonished at his reproof.* The winds that stand between heaven and earth as the pillars of the heaven (1 Enoch 17:10) are Job''s pillars of heaven that tremble before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-cornerstone-four-winds-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:5 — *Who laid the foundations of the earth, that it should not be removed for ever.* The four winds that bear the earth (1 Enoch 17:9) uphold the same unmoveable foundation the psalm ascribes to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-cornerstone-four-winds-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-throne-mountain-of-sapphire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:10 — *And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness.* The throne-mountain topped with sapphire (1 Enoch 17:15) matches the sapphire pavement the elders saw beneath Yahuah on the mountain.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-throne-mountain-of-sapphire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire summit of Enoch''s throne-mountain (1 Enoch 17:15) is the same sapphire throne Ezekiel saw above the firmament.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-throne-mountain-of-sapphire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-17-prison-of-the-stars-bound-till-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:7 — *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* Enoch revisits the same prison of the stars later in the journey, repeating the binding-till-judgement of 1 Enoch 17:21 word for word.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=21
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars are bound because they transgressed the commandment and missed their appointed times (1 Enoch 17:20) — they broke the very decree the psalm says shall not pass.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* The prison for the stars and the host of heaven (1 Enoch 17:19) is Jude''s wandering stars reserved to the blackness of darkness.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The host bound till their guilt is consummated (1 Enoch 17:21) is Peter''s angels reserved in chains of darkness unto judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Enoch''s prison for the host of heaven (1 Enoch 17:19) is Isaiah''s host of the high ones shut up and visited after many days.'
  FROM cross_reference_threads t, cross_references x, _session250_en17_lookup sv, _session250_en17_lookup tv
 WHERE t.slug='1-enoch-17-prison-of-the-stars-bound-till-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=17 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

