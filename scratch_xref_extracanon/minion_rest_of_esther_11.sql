-- ----- fragment: minion_therestofesther_11.sql (session253 the-rest-of-esther 11) -----
-- Source anchor: apocrypha/the-rest-of-esther ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe11 (view _session253_roe11_lookup). Sort band base 60425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-11-two-dragons-sea-war
  ('apocrypha', 'the-rest-of-esther', 11, 6, 'canon', 'daniel', 7, 2, 'free', E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* The troubled sea of the nations is the same churning waters from which Mordecai''s two dragons come forth ready to fight.'),
  ('apocrypha', 'the-rest-of-esther', 11, 6, 'canon', 'daniel', 7, 3, 'free', E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The beasts rising from the sea are kin to the great dragons of Mordecai''s dream, the kingdoms arrayed against the saints.'),
  ('apocrypha', 'the-rest-of-esther', 11, 6, 'canon', 'revelation', 12, 7, 'free', E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* unveiling the heavenly front of the very dragon-war Mordecai foresaw in Rest of Esther 11:6.'),
  ('apocrypha', 'the-rest-of-esther', 11, 7, 'canon', 'revelation', 12, 17, 'free', E'Revelation 12:17 — *And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ).* The nations prepared to fight against the righteous people are the dragon making war on the commandment-keeping seed.'),
  -- thread: rest-of-esther-11-day-of-darkness-tribulation
  ('apocrypha', 'the-rest-of-esther', 11, 8, 'canon', 'zephaniah', 1, 15, 'free', E'Zephaniah 1:15 — *That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* the prophet''s day of darkness matching the day of darkness and obscurity of Rest of Esther 11:8.'),
  ('apocrypha', 'the-rest-of-esther', 11, 9, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The righteous nation troubled and ready to perish is the people delivered in the unequalled time of trouble.'),
  -- thread: rest-of-esther-11-cried-to-yahuah-flood
  ('apocrypha', 'the-rest-of-esther', 11, 10, 'canon', 'joel', 2, 32, 'free', E'Joel 2:32 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* The nation crying to Yahuah and being delivered is the remnant calling on the Name unto deliverance.'),
  ('apocrypha', 'the-rest-of-esther', 11, 10, 'canon', 'psalms', 18, 6, 'free', E'Psalms 18:6 — *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears.* David''s cry from distress heard by Yahuah is the very pattern of the righteous nation''s cry in Rest of Esther 11:10.'),
  ('apocrypha', 'the-rest-of-esther', 11, 10, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The flood of much water rising from a little fountain is Yahuah Himself fighting for the people who cried out, as at the sea.'),
  -- thread: rest-of-esther-11-light-rose-lowly-exalted
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The light and the sun rising up in Mordecai''s dream is the risen glory of Yahuah over His delivered people.'),
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', 'isaiah', 9, 2, 'free', E'Isaiah 9:2 — *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined.* The sun rising after the day of darkness is the great light shining on the people of Rest of Esther 11:11.'),
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', '1-samuel', 2, 7, 'free', E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song of the great reversal is exactly the lowly exalted and the glorious devoured in Rest of Esther 11:11.'),
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Miriam''s Magnificat carries the same covenant overturning — the lowly raised over the glorious — that crowns Mordecai''s dream.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-two-dragons-sea-war',
       E'Two great dragons, the beasts from the troubled sea',
       E'Mordecai''s dream opens with the cosmic seed-war behind the whole Esther deliverance: *And, behold, two great dragons came forth ready to fight, and their cry was great* (Rest of Esther 11:6), *And at their cry all nations were prepared to battle, that they might fight against the righteous people* (Rest of Esther 11:7). It ain''t new — Daniel saw the same vision: *I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea* (Daniel 7:2), and *And four great beasts came up from the sea, diverse one from another* (Daniel 7:3). The dragon''s war is named at the last in the Revelation: *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels* (Revelation 12:7), the old serpent who *went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17). The two dragons are the system of the nations marshalled against the kept seed — never against flesh and blood only, but the spiritual battle behind Haman the Agagite.',
       sv.verse_id, ev.verse_id, 'extras', 60425
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-day-of-darkness-tribulation',
       E'A day of darkness, the time of trouble for the righteous nation',
       E'The dream turns to a day of dread: *And lo a day of darkness and obscurity, tribulation and anguish, affliction and great uproar, upon earth* (Rest of Esther 11:8), *And the whole righteous nation was troubled, fearing their own evils, and were ready to perish* (Rest of Esther 11:9). This is the great-tribulation language of the prophets. Zephaniah named it: *That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15). Daniel set it over Mordecai''s own people: *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). The righteous nation ready to perish is delivered, as ever, not by its own strength but by the One who fights for them.',
       sv.verse_id, ev.verse_id, 'extras', 60428
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-cried-to-yahuah-flood',
       E'They cried to Yahuah, and the little fountain became a flood',
       E'At the brink of perishing the nation does the one thing that delivers: *Then they cried to Yahuah (God), and upon their cry, as it were from a little fountain, was made a great flood, even much water* (Rest of Esther 11:10). This is the covenant promise — call on the Name and be delivered. Joel set it down: *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). David cried the same cry: *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears* (Psalms 18:6). And the deliverance is Yahuah''s own war, not ours: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). The little fountain swelling to a great flood is Esther herself, the small and lowly one through whom the saving river runs.',
       sv.verse_id, ev.verse_id, 'extras', 60431
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-light-rose-lowly-exalted',
       E'The light and the sun rose up, and the lowly were exalted',
       E'The dream ends in reversal and dawn: *The light and the sun rose up, and the lowly were exalted, and devoured the glorious* (Rest of Esther 11:11). After the day of darkness comes the rising light — Isaiah''s dawn over Zion: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1), and the people in darkness who *have seen a great light* (Isaiah 9:2). And the lowly exalted over the glorious is the great covenant overturning that Hannah sang and Miriam echoed: *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7); *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The lowly captive Mordecai, the orphan Esther, are lifted to devour the glory of Haman — Yahuah''s settled way of saving His people through the small.',
       sv.verse_id, ev.verse_id, 'extras', 60434
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-11-two-dragons-sea-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* The troubled sea of the nations is the same churning waters from which Mordecai''s two dragons come forth ready to fight.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The beasts rising from the sea are kin to the great dragons of Mordecai''s dream, the kingdoms arrayed against the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* unveiling the heavenly front of the very dragon-war Mordecai foresaw in Rest of Esther 11:6.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:17 — *And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ).* The nations prepared to fight against the righteous people are the dragon making war on the commandment-keeping seed.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-11-day-of-darkness-tribulation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zephaniah 1:15 — *That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* the prophet''s day of darkness matching the day of darkness and obscurity of Rest of Esther 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-day-of-darkness-tribulation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The righteous nation troubled and ready to perish is the people delivered in the unequalled time of trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-day-of-darkness-tribulation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-11-cried-to-yahuah-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:32 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* The nation crying to Yahuah and being delivered is the remnant calling on the Name unto deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-cried-to-yahuah-flood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 18:6 — *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears.* David''s cry from distress heard by Yahuah is the very pattern of the righteous nation''s cry in Rest of Esther 11:10.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-cried-to-yahuah-flood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The flood of much water rising from a little fountain is Yahuah Himself fighting for the people who cried out, as at the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-cried-to-yahuah-flood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-11-light-rose-lowly-exalted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The light and the sun rising up in Mordecai''s dream is the risen glory of Yahuah over His delivered people.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:2 — *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined.* The sun rising after the day of darkness is the great light shining on the people of Rest of Esther 11:11.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song of the great reversal is exactly the lowly exalted and the glorious devoured in Rest of Esther 11:11.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Miriam''s Magnificat carries the same covenant overturning — the lowly raised over the glorious — that crowns Mordecai''s dream.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

