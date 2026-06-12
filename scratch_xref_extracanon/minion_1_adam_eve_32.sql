-- ----- fragment: minion_1adameve_32.sql (session253 1-adam-eve 32) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae32 (view _session253_1ae32_lookup). Sort band base 64775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-32-penance-in-the-water
  ('adam-eve-conflict', '1-adam-eve', 32, 7, 'canon', 'psalms', 130, 1, 'free', E'Psalm 130:1 — *Out of the depths have I cried unto thee, O Yahuah (LORD).* Adam and Eve standing in the deep waters to plead for pardon are the living image of this cry out of the depths (1 Adam & Eve 32:7).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 7, 'canon', 'psalms', 130, 4, 'free', E'Psalm 130:4 — *But there is forgiveness with thee, that thou mayest be feared.* This is the very thing Adam besought when he asked Yahuah to forgive their offense (1 Adam & Eve 32:7).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 7, 'canon', '1-john', 1, 9, 'free', E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The apostle states as covenant promise what the first parents enact bodily in the water, confessing and beseeking forgiveness (1 Adam & Eve 32:7).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 5, 'canon', 'luke', 18, 13, 'free', E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* Adam''s charge to pray with burning heart to be forgiven is the publican''s posture from the first day outside Eden (1 Adam & Eve 32:5).'),
  -- thread: 1-adam-eve-32-fasting-with-burning-heart
  ('adam-eve-conflict', '1-adam-eve', 32, 5, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* Adam''s charge to pray with burning heart, fasting in the cave, is this prophet''s call to turn with the whole heart sounded at the dawn of the world (1 Adam & Eve 32:5).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 5, 'canon', 'joel', 2, 13, 'free', E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* The mercy Adam counts on when he tells Eve to pray for forgiveness is this gracious and merciful Yahuah (1 Adam & Eve 32:5).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 1, 'canon', 'daniel', 9, 3, 'free', E'Daniel 9:3 — *And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes:* Adam and Eve''s seven-day fast without bread or water in the cave is Daniel''s penitential fasting kept in the very first generation (1 Adam & Eve 32:1).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 2, 'jubilees', 'jubilees', 3, 27, 'extras', E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* Jubilees keeps the same memory of Adam worshipping at the garden''s edge that frames his prayers and offerings here (1 Adam & Eve 32:2).'),
  -- thread: 1-adam-eve-32-restore-us-to-the-garden
  ('adam-eve-conflict', '1-adam-eve', 32, 3, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* Adam''s plea to be taken back to the garden is granted to the overcomer in the restored paradise of Elohim (1 Adam & Eve 32:3).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 7, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The restoration to their former state that Adam and Eve beseech is fulfilled in the right of entry to the tree of life at the end (1 Adam & Eve 32:7).'),
  ('adam-eve-conflict', '1-adam-eve', 32, 7, 'canon', 'hebrews', 4, 16, 'free', E'Hebrews 4:16 — *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.* Adam and Eve standing afar off in the water to obtain mercy reach toward the same throne of grace the gospel opens (1 Adam & Eve 32:7).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-32-penance-in-the-water',
       E'Standing in the water — the cry of the penitent out of the depths',
       E'Cast out of the garden, Adam and Eve go down into the very sea that had nearly drowned them and stand in it praying: *Then Eve went down into the water, as Adam had commanded her. Adam also went down into the water; and they stood praying; and besought Yahuah (Lord) to forgive them their offense, and to restore them to their former state* (1 Adam & Eve 32:7). It ain''t new — this is the oldest cry of the contrite heart, sounded the moment the seed of the woman is first hunted. The psalmist takes it up from the same flood: *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1), and answers it with the mercy Adam besought — *But there is forgiveness with thee, that thou mayest be feared* (Psalm 130:4). The apostle frames the same transaction Adam and Eve enact bodily in the sea: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). And the publican standing afar off, smiting his breast, is the first parents over again: *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13).',
       sv.verse_id, ev.verse_id, 'extras', 64775
  FROM _session253_1ae32_lookup sv, _session253_1ae32_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=32 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-32-fasting-with-burning-heart',
       E'Seven days without bread — turning with the whole heart, with fasting and weeping',
       E'Before they go down to the water, Adam and Eve keep a fast of repentance in the Cave of Treasures: *And Adam and Eve remained in the Cave of Treasures until the seventh day; they neither ate of the fruit the earth, nor drank water* (1 Adam & Eve 32:1), and Adam bids Eve *pray to Elohim (God) with burning heart and a sweet voice, to forgive us* (1 Adam & Eve 32:5). This is the way of return kept long before Sinai, and the prophets call Yashar''el back to it: *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12) — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). Daniel sought the same mercy the same way: *And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes* (Daniel 9:3). And the offering Adam learns to bring at the garden''s edge is no innovation of the law — Jubilees keeps the memory of it: *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame* (Jubilees 3:27).',
       sv.verse_id, ev.verse_id, 'extras', 64778
  FROM _session253_1ae32_lookup sv, _session253_1ae32_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=32 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-32-restore-us-to-the-garden',
       E'Take us back to the garden — the longing for the tree of life',
       E'The whole burden of their prayer is restoration to the place they lost: *let us go to the sea of water we saw at first, and let us stand in it, praying that Elohim (God) will again be favorable to us and take us back to the garden* (1 Adam & Eve 32:3); they beseech Yahuah *to forgive them their offense, and to restore them to their former state* (1 Adam & Eve 32:7). This is the ache the Scriptures answer — the way back, barred at the fall, reopened to the overcomer: *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7), and at the last, *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The throne Adam approaches from afar by water is the same throne the gospel opens wide: *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need* (Hebrews 4:16). It ain''t new — from Adam''s first prayer outside Eden to the New Jerusalem, the cry is one: take us back to the garden.',
       sv.verse_id, ev.verse_id, 'extras', 64781
  FROM _session253_1ae32_lookup sv, _session253_1ae32_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=32 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-32-penance-in-the-water
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 130:1 — *Out of the depths have I cried unto thee, O Yahuah (LORD).* Adam and Eve standing in the deep waters to plead for pardon are the living image of this cry out of the depths (1 Adam & Eve 32:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-penance-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 130:4 — *But there is forgiveness with thee, that thou mayest be feared.* This is the very thing Adam besought when he asked Yahuah to forgive their offense (1 Adam & Eve 32:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-penance-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The apostle states as covenant promise what the first parents enact bodily in the water, confessing and beseeking forgiveness (1 Adam & Eve 32:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-penance-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* Adam''s charge to pray with burning heart to be forgiven is the publican''s posture from the first day outside Eden (1 Adam & Eve 32:5).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-penance-in-the-water'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-32-fasting-with-burning-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* Adam''s charge to pray with burning heart, fasting in the cave, is this prophet''s call to turn with the whole heart sounded at the dawn of the world (1 Adam & Eve 32:5).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-fasting-with-burning-heart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* The mercy Adam counts on when he tells Eve to pray for forgiveness is this gracious and merciful Yahuah (1 Adam & Eve 32:5).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-fasting-with-burning-heart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:3 — *And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes:* Adam and Eve''s seven-day fast without bread or water in the cave is Daniel''s penitential fasting kept in the very first generation (1 Adam & Eve 32:1).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-fasting-with-burning-heart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* Jubilees keeps the same memory of Adam worshipping at the garden''s edge that frames his prayers and offerings here (1 Adam & Eve 32:2).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-fasting-with-burning-heart'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-32-restore-us-to-the-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* Adam''s plea to be taken back to the garden is granted to the overcomer in the restored paradise of Elohim (1 Adam & Eve 32:3).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-restore-us-to-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The restoration to their former state that Adam and Eve beseech is fulfilled in the right of entry to the tree of life at the end (1 Adam & Eve 32:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-restore-us-to-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 4:16 — *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.* Adam and Eve standing afar off in the water to obtain mercy reach toward the same throne of grace the gospel opens (1 Adam & Eve 32:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae32_lookup sv, _session253_1ae32_lookup tv
 WHERE t.slug='1-adam-eve-32-restore-us-to-the-garden'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=32 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

