-- ----- fragment: minion_thewisdomofsolomon_05.sql (session253 the-wisdom-of-solomon 5) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis05 (view _session253_wis05_lookup). Sort band base 58100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-5-too-late-confession
  ('apocrypha', 'the-wisdom-of-solomon', 5, 3, 'enoch', '1-enoch', 62, 9, 'extras', E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The mighty whom the Son of Adam casts down are the very ones who, in Wisdom of Solomon 5:3, repent and groan when they see the righteous exalted.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 4, 'enoch', '1-enoch', 63, 8, 'extras', E'1 Enoch 63:8 — *And one portion of them shall look on the other, And they shall be terrified, And their countenance shall fall, And pain shall seize them, When they see that Son of Adam Sitting on the throne of his glory.* The fools who accounted his life madness (Wisdom of Solomon 5:4) are the kings whose faces fall when they at last behold him enthroned.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 5, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains.* The astonished cry of Wisdom of Solomon 5:5 over the saint numbered among the children of Yahuah is the same dread that drives the mighty to hide at the day of wrath.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 3, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The proud who once held the righteous in derision (Wisdom of Solomon 5:3) become stubble in the burning day.'),
  -- thread: wisdom-5-righteous-shine-vindicated
  ('apocrypha', 'the-wisdom-of-solomon', 5, 1, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The boldness with which the righteous man stands before his afflicters (Wisdom of Solomon 5:1) is his shining forth as the sun in the Father''s kingdom.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 15, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The promise that the righteous live for evermore (Wisdom of Solomon 5:15) is Daniel''s vision of the wise shining as stars for ever.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 16, 'canon', 'malachi', 4, 2, 'free', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The glorious kingdom and crown given from the hand of Yahuah (Wisdom of Solomon 5:16) belong to those over whom the Sun of righteousness rises.'),
  -- thread: wisdom-5-hope-of-ungodly-chaff
  ('apocrypha', 'the-wisdom-of-solomon', 5, 14, 'canon', 'psalms', 1, 4, 'free', E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The hope of the ungodly blown away like dust and smoke (Wisdom of Solomon 5:14) is the Psalmist''s chaff driven off by the wind.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 14, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The vanishing of the ungodly''s hope (Wisdom of Solomon 5:14) is the perishing of the way of the ungodly known to Yahuah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ungodly whose hope is dust without honour (Wisdom of Solomon 5:14) awake to shame and everlasting contempt.'),
  -- thread: wisdom-5-armour-of-zeal
  ('apocrypha', 'the-wisdom-of-solomon', 5, 18, 'canon', 'isaiah', 59, 17, 'free', E'Isaiah 59:17 — *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* The breastplate of righteousness and helmet of judgment Yahuah dons (Wisdom of Solomon 5:18) is drawn straight from Isaiah''s armed Avenger.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 17, 'canon', 'isaiah', 59, 18, 'free', E'Isaiah 59:18 — *According to their deeds, accordingly he will repay, fury to his adversaries, recompence to his enemies; to the islands he will repay recompence.* The jealousy taken as complete armour for revenge on His enemies (Wisdom of Solomon 5:17) is Isaiah''s repayment of fury to His adversaries.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 19, 'canon', 'ephesians', 6, 13, 'free', E'Ephesians 6:13 — *Wherefore take unto you the whole armour of Elohim (God), that ye may be able to withstand in the evil day, and having done all, to stand.* The invincible shield Yahuah takes (Wisdom of Solomon 5:19) is the whole armour of Elohim Paul bids the saints put on to stand.'),
  ('apocrypha', 'the-wisdom-of-solomon', 5, 20, 'canon', 'ephesians', 6, 17, 'free', E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* The sharpened sword of Yahuah''s wrath (Wisdom of Solomon 5:20) is handed to the elect as the sword of the Spirit, the word of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-too-late-confession',
       E'The Too-Late Confession of the Ungodly',
       E'At the judgment the proud are undone by the sight of the one they despised: *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach* (Wisdom of Solomon 5:3), and they cry, *We fools accounted his life madness, and his end to be without honour* (Wisdom of Solomon 5:4) — only to confess too late, *How is he numbered among the children of Yahuah (God), and his lot is among the saints!* (Wisdom of Solomon 5:5). This is no new thing. The LIVE Enoch apparatus already shows the same scene: *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners* (1 Enoch 62:9), and when the mighty behold him *one portion of them shall look on the other, And they shall be terrified, And their countenance shall fall, And pain shall seize them, When they see that Son of Adam Sitting on the throne of his glory* (1 Enoch 63:8). John sees the same too-late terror: *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains* (Revelation 6:15). Malachi warned it long before: *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble* (Malachi 4:1). The proud are confounded; the despised is vindicated.',
       sv.verse_id, ev.verse_id, 'extras', 58100
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-righteous-shine-vindicated',
       E'The Righteous Stand and Shine',
       E'Over against the confounded proud, *Then shall the righteous man stand in great boldness before the face of such as have afflicted him, and made no account of his labours* (Wisdom of Solomon 5:1), for *the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High* (Wisdom of Solomon 5:15), and *Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them* (Wisdom of Solomon 5:16). It ain''t new — Yahusha says the same: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* (Matthew 13:43); Daniel saw it: *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3); and Malachi names the rising light, *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2). The election is vindicated and crowned.',
       sv.verse_id, ev.verse_id, 'extras', 58103
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-hope-of-ungodly-chaff',
       E'The Hope of the Ungodly Like Chaff',
       E'The proud who derided the righteous have built on nothing: *For the hope of the ungodly is like dust that is blown away with the wind; like a thin froth that is driven away with the storm; like as the smoke which is dispersed here and there with a tempest, and passeth away as the remembrance of a guest that tarrieth but a day* (Wisdom of Solomon 5:14). The Psalter said it first: *The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4), and *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). And the great divide of the resurrection answers both: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The two ways — chaff and crown — are no new doctrine.',
       sv.verse_id, ev.verse_id, 'extras', 58106
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-5-armour-of-zeal',
       E'Yahuah Takes His Armour of Zeal',
       E'The chapter ends with the Warrior arming Himself for His people: *He shall take to him his jealousy for complete armour, and make the creature his weapon for the revenge of his enemies* (Wisdom of Solomon 5:17); *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* (Wisdom of Solomon 5:18); *He shall take holiness for an invincible shield* (Wisdom of Solomon 5:19); *His severe wrath shall he sharpen for a sword, and the world shall fight with him against the unwise* (Wisdom of Solomon 5:20). This is lifted whole from Isaiah: *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke* (Isaiah 59:17), the same garments of recompence, *According to their deeds, accordingly he will repay, fury to his adversaries, recompence to his enemies* (Isaiah 59:18). Paul then hands that very armour of Elohim to the saints: *Wherefore take unto you the whole armour of Elohim (God), that ye may be able to withstand in the evil day, and having done all, to stand* (Ephesians 6:13), *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The breastplate and helmet of the Avenger become the inheritance of His elect.',
       sv.verse_id, ev.verse_id, 'extras', 58109
  FROM _session253_wis05_lookup sv, _session253_wis05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-5-too-late-confession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The mighty whom the Son of Adam casts down are the very ones who, in Wisdom of Solomon 5:3, repent and groan when they see the righteous exalted.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 63:8 — *And one portion of them shall look on the other, And they shall be terrified, And their countenance shall fall, And pain shall seize them, When they see that Son of Adam Sitting on the throne of his glory.* The fools who accounted his life madness (Wisdom of Solomon 5:4) are the kings whose faces fall when they at last behold him enthroned.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=63 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains.* The astonished cry of Wisdom of Solomon 5:5 over the saint numbered among the children of Yahuah is the same dread that drives the mighty to hide at the day of wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The proud who once held the righteous in derision (Wisdom of Solomon 5:3) become stubble in the burning day.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-too-late-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-5-righteous-shine-vindicated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The boldness with which the righteous man stands before his afflicters (Wisdom of Solomon 5:1) is his shining forth as the sun in the Father''s kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-righteous-shine-vindicated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The promise that the righteous live for evermore (Wisdom of Solomon 5:15) is Daniel''s vision of the wise shining as stars for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-righteous-shine-vindicated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The glorious kingdom and crown given from the hand of Yahuah (Wisdom of Solomon 5:16) belong to those over whom the Sun of righteousness rises.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-righteous-shine-vindicated'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-5-hope-of-ungodly-chaff
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The hope of the ungodly blown away like dust and smoke (Wisdom of Solomon 5:14) is the Psalmist''s chaff driven off by the wind.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-hope-of-ungodly-chaff'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The vanishing of the ungodly''s hope (Wisdom of Solomon 5:14) is the perishing of the way of the ungodly known to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-hope-of-ungodly-chaff'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ungodly whose hope is dust without honour (Wisdom of Solomon 5:14) awake to shame and everlasting contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-hope-of-ungodly-chaff'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-5-armour-of-zeal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 59:17 — *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* The breastplate of righteousness and helmet of judgment Yahuah dons (Wisdom of Solomon 5:18) is drawn straight from Isaiah''s armed Avenger.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 59:18 — *According to their deeds, accordingly he will repay, fury to his adversaries, recompence to his enemies; to the islands he will repay recompence.* The jealousy taken as complete armour for revenge on His enemies (Wisdom of Solomon 5:17) is Isaiah''s repayment of fury to His adversaries.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:13 — *Wherefore take unto you the whole armour of Elohim (God), that ye may be able to withstand in the evil day, and having done all, to stand.* The invincible shield Yahuah takes (Wisdom of Solomon 5:19) is the whole armour of Elohim Paul bids the saints put on to stand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* The sharpened sword of Yahuah''s wrath (Wisdom of Solomon 5:20) is handed to the elect as the sword of the Spirit, the word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis05_lookup sv, _session253_wis05_lookup tv
 WHERE t.slug='wisdom-5-armour-of-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

