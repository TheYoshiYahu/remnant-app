-- ----- fragment: minion_1enoch_18.sql (session250 1-enoch 18) -----
-- Source anchor: enoch/1-enoch ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en18 (view _session250_en18_lookup). Sort band base 50425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-18-treasuries-of-the-winds
  ('enoch', '1-enoch', 18, 1, 'canon', 'jeremiah', 10, 12, 'free', E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The same founding-of-the-world-by-wisdom Enoch sees at 18:1, where He has ordered all creation by His wisdom.'),
  ('enoch', '1-enoch', 18, 1, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah names the very wind-treasuries Enoch is shown at 18:1.'),
  ('enoch', '1-enoch', 18, 1, 'canon', 'proverbs', 8, 28, 'free', E'Proverbs 8:28 — *When he established the clouds above: when he strengthened the fountains of the deep:* Wisdom stands at the founding Enoch tours at 18:1, where the world is ordered by His wisdom.'),
  ('enoch', '1-enoch', 18, 5, 'canon', 'psalms', 104, 3, 'free', E'Psalm 104:3 — *Who layeth the beams of his chambers in the waters: who maketh the clouds his chariot: who walketh upon the wings of the wind:* The same winds that carry the clouds in Enoch 18:5 bear the Creator Himself.'),
  -- thread: 1-enoch-18-cornerstone-and-pillars
  ('enoch', '1-enoch', 18, 2, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Creator''s question to Job is the very founding of the earth Enoch is permitted to see at 18:2.'),
  ('enoch', '1-enoch', 18, 2, 'canon', 'job', 38, 6, 'free', E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch sees at 18:2 is the one the Creator names to Job.'),
  ('enoch', '1-enoch', 18, 2, 'canon', 'job', 38, 7, 'free', E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* At the founding Enoch tours, the stars and the sons of Elohim still kept their order — before the stars of 18:13 transgressed it.'),
  ('enoch', '1-enoch', 18, 3, 'canon', 'proverbs', 8, 29, 'free', E'Proverbs 8:29 — *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth:* The pillars and stations of heaven Enoch sees fixed at 18:3 are the appointed foundations Wisdom witnessed laid.'),
  -- thread: 1-enoch-18-seven-stars-transgressed-their-times
  ('enoch', '1-enoch', 18, 13, 'canon', 'job', 38, 31, 'free', E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The fixed star-order Job cannot command is the very order the seven stars transgressed in Enoch 18:13.'),
  ('enoch', '1-enoch', 18, 13, 'canon', 'job', 38, 33, 'free', E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* The ordinances of heaven the stars broke by not coming forth at their appointed times (Enoch 18:13).'),
  ('enoch', '1-enoch', 18, 13, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s wandering stars, with darkness reserved, are Enoch''s stars that strayed from their appointed times and are bound (18:13-14).'),
  -- thread: 1-enoch-18-prison-of-the-stars-and-host
  ('enoch', '1-enoch', 18, 12, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The host of the high ones Isaiah sees punished is the host of heaven imprisoned in Enoch 18:12.'),
  ('enoch', '1-enoch', 18, 12, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prison-pit, holding the host until they are visited, is Enoch''s prison for the stars and the host of heaven (18:12), bound till their guilt is consummated (18:14).'),
  ('enoch', '1-enoch', 18, 14, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s angels reserved in chains unto judgment are the host Enoch sees bound till their guilt should be consummated (18:14).'),
  ('enoch', '1-enoch', 18, 14, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s reserved angels are the bound host of Enoch 18:14, kept under darkness unto the great-day reckoning.'),
  -- thread: 1-enoch-18-prison-of-the-angels-for-ever
  ('enoch', '1-enoch', 18, 18, 'enoch', '1-enoch', 21, 11, 'extras', E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s second tour names the very same prison of the angels he first reaches at 18:18, fixing it as a station of the cosmic order.'),
  ('enoch', '1-enoch', 18, 18, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The shut-up, sealed pit of John is the prison of the angels Enoch reaches at 18:18 — a holding, kept till the appointed time.'),
  ('enoch', '1-enoch', 18, 18, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The great-day reckoning toward which the imprisoned angels of Enoch 18:18 are held — the books opened, judgment by works.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-treasuries-of-the-winds',
       E'The treasuries of the winds — the world founded by wisdom',
       E'Enoch is shown the storehouses out of which the Creator orders the cosmos: *I saw the treasuries of all the winds: I saw how He has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 18:1). The canon keeps the same chambered winds and the same wisdom-founding. Jeremiah names the very storehouses Enoch saw — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* (Jeremiah 10:12) — *and bringeth forth the wind out of his treasures.* (Jeremiah 10:13). Wisdom herself stands at the founding in *When he established the clouds above: when he strengthened the fountains of the deep:* (Proverbs 8:28), and the winds bear the Creator in *who maketh the clouds his chariot: who walketh upon the wings of the wind:* (Psalm 104:3). This is the Creator''s order, not blind nature: the rebellion of the Watchers and the stars (later in this very chapter) is rebellion against THIS founding wisdom. It ain''t new — the wind-treasuries Enoch toured are the same the prophets and the psalmist confessed.',
       sv.verse_id, ev.verse_id, 'extras', 50425
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-cornerstone-and-pillars',
       E'The cornerstone of the earth and the pillars of heaven',
       E'Enoch is shown the load-bearing structure of the world: *And I saw the cornerstone of the earth: then I saw the four winds which bear the earth and the firmament of the heaven.* (1 Enoch 18:2), *And I saw how the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 18:3). This is the Creator''s catechism to Job, point for point. He demands, *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* (Job 38:4), and asks who laid *the corner stone thereof;* (Job 38:6) — the very cornerstone Enoch is shown — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* (Job 38:7). Wisdom set the same bound: *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth:* (Proverbs 8:29), and the psalmist confesses Him *Who laid the foundations of the earth, that it should not be removed for ever.* (Psalm 104:5). The point stands: the cosmos has a fixed, founded order — and the rebellion the chapter turns to next is a crime against this architecture, not a flaw in it.',
       sv.verse_id, ev.verse_id, 'extras', 50428
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-seven-stars-transgressed-their-times',
       E'The stars that did not come forth at their appointed times',
       E'The angel explains why the seven stars are bound: *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 18:13), *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 18:14). Their sin is breaking the Creator''s fixed order — the very ordinances Job is asked whether he can command: *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31), *Canst thou bring forth Mazzaroth in his season? or canst thou guide Arcturus with his sons?* (Job 38:32), *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* (Job 38:33). The lights were appointed to keep their times (the moedim of Genesis 1:14); these refused, and Jude names their kind: *wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13). This is the Watcher-pattern carried to the host of heaven — rebellion against the Creator''s order, not a fault in the order — and the ten-thousand-year binding is a held sentence, not annihilation.',
       sv.verse_id, ev.verse_id, 'extras', 50431
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-prison-of-the-stars-and-host',
       E'A prison for the stars and the host of heaven, held to the reckoning',
       E'At the end of heaven and earth Enoch is shown the holding-place of the rebel host: *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 18:12), and they are bound *till the time when their guilt should be consummated (even) for ten thousand years.* (1 Enoch 18:14). Isaiah sees the same host shut in the same pit and held to a later visitation: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21), *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). Peter and Jude carry the same chains forward: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4), *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). The framework holds throughout: the rebel host is bound, not destroyed — held till the reckoning, just as Sheol holds the dead till they are visited.',
       sv.verse_id, ev.verse_id, 'extras', 50434
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-18-prison-of-the-angels-for-ever',
       E'The prison of the angels — held till the great day',
       E'Beyond the abyss Enoch comes to a place worse than the first: *And from thence I went to another place, which was still more horrible than the former, and I saw a horrible thing: a great fire there which burnt and blazed, and the place was cleft as far as the abyss, being full of great descending columns of fire* (1 Enoch 18:15), and Uriel names it: *This place is the prison of the angels, and here they will be imprisoned for ever.* (1 Enoch 18:18). Enoch will be shown this same prison again — *And he said unto me: This place is the prison of the angels, and here they will be imprisoned for ever.* (1 Enoch 21:11) — confirming it as a fixed station of the cosmic order. Revelation shows the binding-and-holding pattern at the great reckoning: the rebel is *cast into the bottomless pit, and shut up, and set a seal upon him* (Revelation 20:3), and at last *the books were opened* and *the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). The framework stands: the abyss is a holding-prison, not the final sentence — the bound rebel host is kept until the judgment of the great day, the same reckoning that gives back the dead from Sheol.',
       sv.verse_id, ev.verse_id, 'extras', 50437
  FROM _session250_en18_lookup sv, _session250_en18_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=15
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=18 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-18-treasuries-of-the-winds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The same founding-of-the-world-by-wisdom Enoch sees at 18:1, where He has ordered all creation by His wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah names the very wind-treasuries Enoch is shown at 18:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:28 — *When he established the clouds above: when he strengthened the fountains of the deep:* Wisdom stands at the founding Enoch tours at 18:1, where the world is ordered by His wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 104:3 — *Who layeth the beams of his chambers in the waters: who maketh the clouds his chariot: who walketh upon the wings of the wind:* The same winds that carry the clouds in Enoch 18:5 bear the Creator Himself.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-treasuries-of-the-winds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-cornerstone-and-pillars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Creator''s question to Job is the very founding of the earth Enoch is permitted to see at 18:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* The cornerstone of the earth Enoch sees at 18:2 is the one the Creator names to Job.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* At the founding Enoch tours, the stars and the sons of Elohim still kept their order — before the stars of 18:13 transgressed it.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:29 — *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth:* The pillars and stations of heaven Enoch sees fixed at 18:3 are the appointed foundations Wisdom witnessed laid.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-cornerstone-and-pillars'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-seven-stars-transgressed-their-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The fixed star-order Job cannot command is the very order the seven stars transgressed in Enoch 18:13.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-seven-stars-transgressed-their-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* The ordinances of heaven the stars broke by not coming forth at their appointed times (Enoch 18:13).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-seven-stars-transgressed-their-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s wandering stars, with darkness reserved, are Enoch''s stars that strayed from their appointed times and are bound (18:13-14).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-seven-stars-transgressed-their-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-prison-of-the-stars-and-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The host of the high ones Isaiah sees punished is the host of heaven imprisoned in Enoch 18:12.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s prison-pit, holding the host until they are visited, is Enoch''s prison for the stars and the host of heaven (18:12), bound till their guilt is consummated (18:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s angels reserved in chains unto judgment are the host Enoch sees bound till their guilt should be consummated (18:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s reserved angels are the bound host of Enoch 18:14, kept under darkness unto the great-day reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-stars-and-host'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-18-prison-of-the-angels-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s second tour names the very same prison of the angels he first reaches at 18:18, fixing it as a station of the cosmic order.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The shut-up, sealed pit of John is the prison of the angels Enoch reaches at 18:18 — a holding, kept till the appointed time.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The great-day reckoning toward which the imprisoned angels of Enoch 18:18 are held — the books opened, judgment by works.'
  FROM cross_reference_threads t, cross_references x, _session250_en18_lookup sv, _session250_en18_lookup tv
 WHERE t.slug='1-enoch-18-prison-of-the-angels-for-ever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

