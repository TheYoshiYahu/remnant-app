-- ----- fragment: minion_1enoch_12.sql (session250 1-enoch 12) -----
-- Source anchor: enoch/1-enoch ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en12 (view _session250_en12_lookup). Sort band base 50275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-12-enoch-hidden-walked-with-god
  ('enoch', '1-enoch', 12, 1, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Torah''s terse note that Enoch was taken is exactly the hiddenness 1 Enoch 12:1 describes — no man knew where he abode.'),
  ('enoch', '1-enoch', 12, 2, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New Testament names the translation that put Enoch''s days among the holy ones (1 Enoch 12:2).'),
  -- thread: 1-enoch-12-scribe-sent-to-watchers-genesis-6
  ('enoch', '1-enoch', 12, 4, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very descent and taking-of-wives that Enoch is sent to confront in 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' leaving the high heaven (1 Enoch 12:4) as settled apostolic doctrine.'),
  ('enoch', '1-enoch', 12, 4, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter likewise grounds his warning in the angels that sinned, the Watchers of 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'enoch', '1-enoch', 15, 3, 'extras', E'1 Enoch 15:3 — *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men and taken to yourselves wives, and done like the children of earth, and begotten giants (as your) sons?* Yahuah Himself repeats Enoch''s indictment of 1 Enoch 12:4 when the Watchers'' petition is refused.'),
  ('enoch', '1-enoch', 12, 4, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees recounts the same descent and taking-of-wives that Enoch is sent to declare in 1 Enoch 12:4.'),
  -- thread: 1-enoch-12-great-destruction-on-the-earth
  ('enoch', '1-enoch', 12, 4, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants are the great destruction Enoch lays at the Watchers'' feet in 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The filled-with-violence earth is the very ruin Enoch names in 1 Enoch 12:4.'),
  ('enoch', '1-enoch', 12, 4, 'apocrypha', 'ecclesiasticus', 16, 7, 'extras', E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* Ben Sira remembers the giants and the destruction of 1 Enoch 12:4 as proof that Elohim does not relent toward the rebellious.'),
  ('enoch', '1-enoch', 12, 4, 'apocrypha', 'the-wisdom-of-solomon', 14, 6, 'extras', E'the Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom ties the perishing of the giants of 1 Enoch 12:4 to the seed preserved in the ark.'),
  -- thread: 1-enoch-12-no-peace-no-forgiveness
  ('enoch', '1-enoch', 12, 5, 'canon', 'isaiah', 57, 21, 'free', E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* Isaiah''s verdict is the very ''no peace'' Enoch pronounces over the Watchers in 1 Enoch 12:5.'),
  ('enoch', '1-enoch', 12, 5, 'canon', 'isaiah', 57, 20, 'free', E'Isaiah 57:20 — *But the wicked are like the troubled sea, when it cannot rest, whose waters cast up mire and dirt.* The restless, unforgiven wicked of Isaiah picture the Watchers who attain no peace in 1 Enoch 12:5.'),
  ('enoch', '1-enoch', 12, 5, 'enoch', '1-enoch', 13, 1, 'extras', E'1 Enoch 13:1 — *And Enoch went and said: ’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds.* Enoch carries the same ''no peace'' sentence of 1 Enoch 12:5 to Azazel by name.'),
  ('enoch', '1-enoch', 12, 6, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* Yahuah''s own decree spells out the murder of the beloved children the Watchers must watch in 1 Enoch 12:6.'),
  ('enoch', '1-enoch', 12, 6, 'jubilees', 'jubilees', 5, 10, 'extras', E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees confirms the supplication of 1 Enoch 12:6 wins no mercy — the binding holds until the great judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-enoch-hidden-walked-with-god',
       E'Enoch hidden, his days with the holy ones',
       E'The chapter opens after Enoch is taken out of the company of men: *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him. And his activities had to do with the Watchers, and his days were with the holy ones* (1 Enoch 12:1-2). Torah records the same removal in a single line — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24) — and Messiah''s assembly confesses it as faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). It ain''t new: the canon already says Enoch was hidden and walked among the holy ones; 1 Enoch only tells us what his days among them were for — a scribe of righteousness commissioned to confront the Watchers. The man counted righteous is set apart and kept, election preceding any word he speaks.',
       sv.verse_id, ev.verse_id, 'extras', 50275
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-scribe-sent-to-watchers-genesis-6',
       E'The scribe of righteousness sent to the Watchers who left heaven',
       E'Enoch is given his commission: *’Enoch, thou scribe of righteousness, go, declare to the Watchers of the heaven who have left the high heaven, the holy eternal place, and have defiled themselves with women, and have done as the children of earth do, and have taken unto themselves wives* (1 Enoch 12:3-4). This is the canon''s own Genesis 6 unfolded — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2) — and both apostolic witnesses carry it forward as fact, not myth: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6); *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Within Enoch the charge is repeated when Yahuah Himself answers — *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men* (1 Enoch 15:3) — and Jubilees tells the same descent: *the angels of Elohim (God) saw them... and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1). The Watchers'' sin is rebellion against the Creator''s order; the seed-war that scatters tares among the wheat runs from this descent.',
       sv.verse_id, ev.verse_id, 'extras', 50278
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-great-destruction-on-the-earth',
       E'Ye have wrought great destruction on the earth',
       E'Enoch''s word to the Watchers names the ruin they have brought: *Ye have wrought great destruction on the earth* (1 Enoch 12:4). Torah measures that destruction in the giants they sired and the violence that filled the world — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4); *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11). The apocrypha remembers the same giants and the same wrath without softening it: *He was not pacified toward the old giants, who fell away in the strength of their foolishness* (Ecclesiasticus 16:7); *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation* (the Wisdom of Solomon 14:6). It ain''t new — the destruction Enoch charges is the corrupted, violence-filled earth the whole canon mourns, and the seed preserved in the ark is the line through which righteousness survives the war.',
       sv.verse_id, ev.verse_id, 'extras', 50281
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-12-no-peace-no-forgiveness',
       E'No peace nor forgiveness for the Watchers',
       E'Enoch''s sentence on the Watchers is final and without remedy: *And ye shall have no peace nor forgiveness of sin: and inasmuch as they delight themselves in their children, The murder of their beloved ones shall they see, and over the destruction of their children shall they lament, and shall make supplication unto eternity, but mercy and peace shall ye not attain* (1 Enoch 12:5-6). The prophets speak the same verdict over the wicked — *But the wicked are like the troubled sea, when it cannot rest, whose waters cast up mire and dirt. There is no peace, saith my Elohim (God), to the wicked* (Isaiah 57:20-21). Within Enoch the same words fall on Azazel — *’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds* (1 Enoch 13:1) — and the murder of the beloved children is decreed by Yahuah to Michael: *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12). Jubilees confirms the petition will not be heard: *and after this they were bound in the depths of the earth for ever, until the day of the great condemnation* (Jubilees 5:10). The covenant order stands — the rebel against the Creator finds no peace, and supplication does not overturn a righteous sentence.',
       sv.verse_id, ev.verse_id, 'extras', 50284
  FROM _session250_en12_lookup sv, _session250_en12_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-12-enoch-hidden-walked-with-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Torah''s terse note that Enoch was taken is exactly the hiddenness 1 Enoch 12:1 describes — no man knew where he abode.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-enoch-hidden-walked-with-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The New Testament names the translation that put Enoch''s days among the holy ones (1 Enoch 12:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-enoch-hidden-walked-with-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-12-scribe-sent-to-watchers-genesis-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* This is the very descent and taking-of-wives that Enoch is sent to confront in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' leaving the high heaven (1 Enoch 12:4) as settled apostolic doctrine.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter likewise grounds his warning in the angels that sinned, the Watchers of 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 15:3 — *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men and taken to yourselves wives, and done like the children of earth, and begotten giants (as your) sons?* Yahuah Himself repeats Enoch''s indictment of 1 Enoch 12:4 when the Watchers'' petition is refused.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees recounts the same descent and taking-of-wives that Enoch is sent to declare in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-scribe-sent-to-watchers-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-12-great-destruction-on-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants are the great destruction Enoch lays at the Watchers'' feet in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The filled-with-violence earth is the very ruin Enoch names in 1 Enoch 12:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* Ben Sira remembers the giants and the destruction of 1 Enoch 12:4 as proof that Elohim does not relent toward the rebellious.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'the Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom ties the perishing of the giants of 1 Enoch 12:4 to the seed preserved in the ark.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-great-destruction-on-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-12-no-peace-no-forgiveness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* Isaiah''s verdict is the very ''no peace'' Enoch pronounces over the Watchers in 1 Enoch 12:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:20 — *But the wicked are like the troubled sea, when it cannot rest, whose waters cast up mire and dirt.* The restless, unforgiven wicked of Isaiah picture the Watchers who attain no peace in 1 Enoch 12:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 13:1 — *And Enoch went and said: ’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds.* Enoch carries the same ''no peace'' sentence of 1 Enoch 12:5 to Azazel by name.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* Yahuah''s own decree spells out the murder of the beloved children the Watchers must watch in 1 Enoch 12:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees confirms the supplication of 1 Enoch 12:6 wins no mercy — the binding holds until the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en12_lookup sv, _session250_en12_lookup tv
 WHERE t.slug='1-enoch-12-no-peace-no-forgiveness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

