-- ----- fragment: minion_2adameve_16.sql (session253 2-adam-eve 16) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae16 (view _session253_2ae16_lookup). Sort band base 66375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-16-two-seed-lines
  ('adam-eve-conflict', '2-adam-eve', 16, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The children of Cain whom Mahalaleel forbids his people to mingle with are named by their father in 2 Adam & Eve 16:1.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 5, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To go down to the children of Cain (2 Adam & Eve 16:5) is to walk “the way of Cain” unto perishing.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 7, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Mahalaleel foresees in 16:7 the very mingling of the two lines that Genesis 6 records as the prelude to the flood.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 5, 'jubilees', 'jubilees', 4, 15, 'extras', E'Jubilees 4:15 — *...and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men...* Jubilees sets the mingling Mahalaleel guards against in 16:5 squarely in the days of his own son Jared.'),
  -- thread: 2-adam-eve-16-flood-foretold
  ('adam-eve-conflict', '2-adam-eve', 16, 6, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Mahalaleel''s foretelling of destruction by waters in 16:6 is Yahuah''s own sentence on the corrupted earth.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 6, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* Peter frames the flood Mahalaleel foresees in 16:6 as judgment on the ungodly out of which the kept seed alone is saved.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 6, 'enoch', '1-enoch', 10, 2, 'extras', E'1 Enoch 10:2 — *And said to him: ’Go to Noah and tell him in My Name “Hide thyself!” and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The same flood Mahalaleel announces in 16:6 is revealed to Noah by the watcher Uriel.'),
  -- thread: 2-adam-eve-16-cave-calling-name
  ('adam-eve-conflict', '2-adam-eve', 16, 2, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Mahalaleel''s praying and ministering before Adam''s body in 16:2 is the calling on the Name that began in Seth''s holy line.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 2, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount...* The Cave-of-Treasures ministry of 16:2 mirrors Enoch''s sanctuary incense kept on the holy mountain before the flood.'),
  -- thread: 2-adam-eve-16-embalmed-with-fathers
  ('adam-eve-conflict', '2-adam-eve', 16, 9, 'canon', 'genesis', 50, 2, 'free', E'Genesis 50:2 — *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel).* Mahalaleel''s charge to be embalmed in 16:9 keeps the same patriarchal burial Joseph renders to Jacob.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 12, 'canon', 'genesis', 50, 3, 'free', E'Genesis 50:3 — *And forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed: and the Egyptians mourned for him threescore and ten days.* The forty days of mourning over Mahalaleel in 16:12 match the forty days of embalming kept for Israel.'),
  ('adam-eve-conflict', '2-adam-eve', 16, 9, 'jubilees', 'jubilees', 4, 29, 'extras', E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Laying Mahalaleel by his fathers in 16:9 continues the burial in the holy line that began with Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-two-seed-lines',
       E'Watch over them: the holy seed kept from the children of Cain',
       E'Mahalaleel feeds his people *in righteousness and innocence*, watching *that they held no intercourse with the children of Cain* (2 Adam & Eve 16:1), and charges Jared, *not to let one of them go down from this Holy Mountain to the children of Cain, lest he perish with them* (16:5). It ain''t new: this is the seed-war drawn between two paternal lines from the very first generations outside the garden. John names the elder line by its father — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12) — and Jude marks the apostate path as *the way of Cain* (Jude 1:11). The whole disaster of Genesis 6 begins here, when the two lines are at last mingled and *the sons of Elohim (God) saw the daughters of men that they were fair* (Genesis 6:2). The Jubilee record sets the very mingling in Mahalaleel and Jared''s own days, when in Jared''s days *the angels of Yahuah (God) descended on the earth, those who are named the Watchers* (Jubilees 4:15). This is election and the kept seed, not race; the covenant line guarded down toward Noah.',
       sv.verse_id, ev.verse_id, 'extras', 66375
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-flood-foretold',
       E'A great destruction by waters: the flood foretold to Jared',
       E'Mahalaleel prophesies on his deathbed, *hereafter there shall come a great destruction upon this earth on account of them; Elohim (God) will be angry with the world, and will destroy them with waters* (2 Adam & Eve 16:6). The word is Yahuah''s own from Genesis: *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth* (Genesis 6:7). Peter reads the same flood as the judgment of an ungodly world out of which the righteous seed alone is kept — Elohim *spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly* (2 Peter 2:5). The same warning runs through the restored primeval history: Uriel is sent to Noah with the word *that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it* (1 Enoch 10:2). It ain''t new — the coming of the waters is announced to the holy line generations before it falls.',
       sv.verse_id, ev.verse_id, 'extras', 66378
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-cave-calling-name',
       E'Praying before the fathers in the Cave of Treasures',
       E'Mahalaleel *continued in the Cave of Treasures praying and ministering before the body of our father Adam, asking Elohim (God) for mercy on himself and on his people* (2 Adam & Eve 16:2), and charges Jared, *stand thou by my body and pray to Elohim (God)... and fulfil thy ministry before them* (16:9). This is the way kept before Sinai — the calling on the Name that begins in Seth''s line: *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The cave-ministry is a sanctuary of incense and intercession, the very pattern Jubilees records of Enoch, who *burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25). The holy seed keeps the Name and the offering generations before the law was written.',
       sv.verse_id, ev.verse_id, 'extras', 66381
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-16-embalmed-with-fathers',
       E'Laid by the bodies of his fathers: the patriarch''s burial',
       E'Mahalaleel charges, *When I die, embalm my body and lay it in the Cave of Treasures, by the bodies of my fathers* (2 Adam & Eve 16:9), and his children *embalmed him carefully, and laid him by the bodies of his fathers. Then they arose, and mourned for him forty days* (16:12). The pattern of the patriarch''s death — the embalming, the forty days, the gathering of his children for the blessing — is the same kept at the end of Genesis: *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel)* (Genesis 50:2), and *forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed* (Genesis 50:3). The restored primeval record marks the same continuity of burial in the line, when *Adam died, and all his sons buried him in the land of his creation* (Jubilees 4:29). It ain''t new — the deathbed charge and burial with the fathers run unbroken from Adam to Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 66384
  FROM _session253_2ae16_lookup sv, _session253_2ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-16-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The children of Cain whom Mahalaleel forbids his people to mingle with are named by their father in 2 Adam & Eve 16:1.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To go down to the children of Cain (2 Adam & Eve 16:5) is to walk “the way of Cain” unto perishing.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Mahalaleel foresees in 16:7 the very mingling of the two lines that Genesis 6 records as the prelude to the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:15 — *...and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men...* Jubilees sets the mingling Mahalaleel guards against in 16:5 squarely in the days of his own son Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-16-flood-foretold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Mahalaleel''s foretelling of destruction by waters in 16:6 is Yahuah''s own sentence on the corrupted earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-flood-foretold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* Peter frames the flood Mahalaleel foresees in 16:6 as judgment on the ungodly out of which the kept seed alone is saved.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-flood-foretold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:2 — *And said to him: ’Go to Noah and tell him in My Name “Hide thyself!” and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The same flood Mahalaleel announces in 16:6 is revealed to Noah by the watcher Uriel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-flood-foretold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-16-cave-calling-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Mahalaleel''s praying and ministering before Adam''s body in 16:2 is the calling on the Name that began in Seth''s holy line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-cave-calling-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount...* The Cave-of-Treasures ministry of 16:2 mirrors Enoch''s sanctuary incense kept on the holy mountain before the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-cave-calling-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-16-embalmed-with-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:2 — *And Joseph commanded his servants the physicians to embalm his father: and the physicians embalmed Yashar''el (Israel).* Mahalaleel''s charge to be embalmed in 16:9 keeps the same patriarchal burial Joseph renders to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-embalmed-with-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:3 — *And forty days were fulfilled for him; for so are fulfilled the days of those which are embalmed: and the Egyptians mourned for him threescore and ten days.* The forty days of mourning over Mahalaleel in 16:12 match the forty days of embalming kept for Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-embalmed-with-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:29 — *And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* Laying Mahalaleel by his fathers in 16:9 continues the burial in the holy line that began with Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae16_lookup sv, _session253_2ae16_lookup tv
 WHERE t.slug='2-adam-eve-16-embalmed-with-fathers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

