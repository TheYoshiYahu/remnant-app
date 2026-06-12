-- ----- fragment: minion_2esdras_08.sql (session253 2-esdras 8) -----
-- Source anchor: apocrypha/2-esdras ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd8 (view _session253_2esd8_lookup). Sort band base 63175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-8-world-to-come-few-saved
  ('apocrypha', '2-esdras', 8, 1, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha''s wide-and-narrow ways are Esdras''s world-for-many and world-to-come-for-few.'),
  ('apocrypha', '2-esdras', 8, 3, 'canon', 'matthew', 22, 14, 'free', E'Matthew 22:14 — *For many are called, but few are chosen.* The Messiah''s epigram says in one line what 2 Esdras 8:3 says of the many created but the few saved.'),
  ('apocrypha', '2-esdras', 8, 1, 'canon', 'isaiah', 65, 17, 'free', E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The age Esdras calls ''the world to come'' is Isaiah''s new heavens and new earth.'),
  -- thread: 2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law
  ('apocrypha', '2-esdras', 8, 8, 'canon', 'psalms', 139, 13, 'free', E'Psalm 139:13 — *For thou hast possessed my reins: thou hast covered me in my mother’s womb.* David''s covering in the womb is Esdras''s creature fashioned and preserved nine months in the mother''s womb.'),
  ('apocrypha', '2-esdras', 8, 8, 'canon', 'psalms', 139, 14, 'free', E'Psalm 139:14 — *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well.* The fearful, wonderful making of the body answers the great labour with which 2 Esdras 8:8 says the creature is fashioned.'),
  -- thread: 2-esdras-8-no-man-but-hath-sinned-mercy-without-works
  ('apocrypha', '2-esdras', 8, 35, 'canon', 'romans', 3, 23, 'free', E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul''s verdict is Esdras''s — no man born but he hath sinned, none of the faithful but hath done amiss.'),
  ('apocrypha', '2-esdras', 8, 35, 'canon', 'ecclesiastes', 7, 20, 'free', E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The Preacher''s ''not a just man upon earth'' is precisely 2 Esdras 8:35''s ''no man... but he has dealt wickedly.'''),
  ('apocrypha', '2-esdras', 8, 32, 'canon', 'psalms', 143, 2, 'free', E'Psalm 143:2 — *And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* David, like Esdras in 8:32, flees judgment-by-works and pleads to be counted among those who have no works of righteousness but mercy.'),
  -- thread: 2-esdras-8-humbled-thyself-justified
  ('apocrypha', '2-esdras', 8, 49, 'canon', 'luke', 18, 13, 'free', E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* The publican who dares not be glorified is the very humility for which Esdras is commended in 8:49.'),
  ('apocrypha', '2-esdras', 8, 49, 'canon', 'luke', 18, 14, 'free', E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Yahusha''s rule — the humble exalted — is why Esdras''s not-judging-himself-worthy is commended above all in 8:49.'),
  -- thread: 2-esdras-8-paradise-tree-of-life-immortality
  ('apocrypha', '2-esdras', 8, 52, 'canon', 'luke', 23, 43, 'free', E'Luke 23:43 — *And Yahusha (Jesus) said unto him, Verily I say unto thee, To day shalt thou be with me in paradise.* The paradise Esdras says is ''opened'' to the lowly is the paradise the Messiah opens from the tree to the thief in 8:52.'),
  ('apocrypha', '2-esdras', 8, 52, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees planted in the builded city the very tree of life Esdras names in 8:52.'),
  ('apocrypha', '2-esdras', 8, 54, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The passing of sorrows in 2 Esdras 8:54 is John''s wiping away of all tears.'),
  ('apocrypha', '2-esdras', 8, 54, 'canon', '2-timothy', 1, 10, 'free', E'2 Timothy 1:10 — *But is now made manifest by the appearing of our Saviour Yahusha HaMashiach (Jesus Christ), who hath abolished death, and hath brought life and immortality to light through the gospel:* The ''treasure of immortality'' shewed in the end (8:54) is brought to light through the Besorah.'),
  -- thread: 2-esdras-8-shewn-to-thee-and-a-few-like-thee
  ('apocrypha', '2-esdras', 8, 62, 'canon', 'matthew', 22, 14, 'free', E'Matthew 22:14 — *For many are called, but few are chosen.* The ''few like you'' to whom alone these things are shewed (8:62) are the chosen few of the Messiah''s word.'),
  ('apocrypha', '2-esdras', 8, 62, 'canon', '2-timothy', 1, 9, 'free', E'2 Timothy 1:9 — *Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began,* The few to whom the wonders are shewn in 8:62 are kept by purpose and grace, election before works.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-world-to-come-few-saved',
       E'This world for many, the world to come for few',
       E'The Most High answers Ezra on the two ages and the narrow remnant: *And he answered me, saying, The most High has made this world for many, but the world to come for few* (2 Esdras 8:1), *There be many created, but few shall be saved* (2 Esdras 8:3). It ain''t new. Yahusha speaks the very same strait gate: *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13), and seals it in a sentence — *For many are called, but few are chosen* (Matthew 22:14). And the world to come itself the Tanakh foresaw: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17). Esdras and the Gospel measure the same two ways and the same few who walk the narrow one.',
       sv.verse_id, ev.verse_id, 'extras', 63175
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law',
       E'Fashioned in the womb, nurtured in thy law',
       E'Ezra pleads the Maker''s own care over the creature He forms: *For when the body is fashioned now in the mother’s womb, and you give it members, your creature is preserved in fire and water, and nine months does your workmanship endure your creature which is created in her* (2 Esdras 8:8), *You broughtest it up with your righteousness, and nurturedst it in your law, and reformedst it with your judgment* (2 Esdras 8:12). It ain''t new. David sang it first: *For thou hast possessed my reins: thou hast covered me in my mother’s womb* (Psalm 139:13), *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well* (Psalm 139:14). The Hand that knits the body in the womb is the Hand that rears it in the Torah — formation and instruction are one work of the same Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 63178
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-no-man-but-hath-sinned-mercy-without-works',
       E'No man born but hath sinned; mercy to them without works',
       E'Ezra confesses the universal fall and casts the people on mercy, not merit: *For in truth them is no man among them that be born, but he has dealt wickedly; and among the faithful there is none which has not done amiss* (2 Esdras 8:35), and *For if you have a desire to have mercy upon us, you shall be called merciful, to us namely, that have no works of righteousness* (2 Esdras 8:32). It ain''t new. Sha''ul says it flat: *For all have sinned, and come short of the glory of Elohim* (Romans 3:23); the Preacher said it long before — *For there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20); and David prayed it at the throne: *And enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). Esdras stands exactly where the Tanakh and the Besorah stand — none righteous, all upon mercy.',
       sv.verse_id, ev.verse_id, 'extras', 63181
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-humbled-thyself-justified',
       E'Thou hast humbled thyself — and so art commended',
       E'The Most High commends Ezra not for his glory but for his lowliness: *In that you have humbled thyself, as it becometh you, and have not judged thyself worthy to be much glorified among the righteous* (2 Esdras 8:49). It ain''t new. Yahusha tells the very parable: the publican *standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim be merciful to me a sinner* (Luke 18:13) — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 18:14). Esdras refuses to reckon himself worthy of glory and is therefore commended above all; the publican who will not lift his eyes goes home justified. The same law of the lowly runs through both.',
       sv.verse_id, ev.verse_id, 'extras', 63184
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=47
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-paradise-tree-of-life-immortality',
       E'Paradise opened, the tree of life planted, the treasure of immortality',
       E'To the lowly the Most High names the inheritance laid up: *For to you is paradise opened, the tree of life is planted, the time to come is prepared, plenteousness is made ready, a city is builded, and rest is allowed, yes, perfect goodness and wisdom* (2 Esdras 8:52), *Sorrows are passed, and in the end is shewed the treasure of immortality* (2 Esdras 8:54). It ain''t new. Yahusha opened that paradise from the tree: *And Yahusha said unto him, Verily I say unto thee, To day shalt thou be with me in paradise* (Luke 23:43). The tree of life John saw restored — *the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2) — and the city without sorrow: *and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4). And the treasure of immortality the Besorah brings to light: *who hath abolished death, and hath brought life and immortality to light through the gospel* (2 Timothy 1:10). Every promise to the humble in Esdras is opened in the Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 63187
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=52
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-8-shewn-to-thee-and-a-few-like-thee',
       E'These things shewed to thee, and a few like thee',
       E'The Most High reserves the secret of the last times for the faithful remnant: *These things have I not shewed to all men, but to you, and a few like you* (2 Esdras 8:62), *Behold, O Yahuah, now have you shewed me the multitude of the wonders, which you will begin to do in the last times: but at what time, you have not shewed me* (2 Esdras 8:63). It ain''t new — and it is not the church for Israel. The faithful few are the kept remnant of both houses, not a replacement: *For many are called, but few are chosen* (Matthew 22:14), and the saving is by election and grace, *not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha before the world began* (2 Timothy 1:9). The mysteries of the last times are entrusted to the chosen few, as they always were.',
       sv.verse_id, ev.verse_id, 'extras', 63190
  FROM _session253_2esd8_lookup sv, _session253_2esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=62
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=8 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-8-world-to-come-few-saved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha''s wide-and-narrow ways are Esdras''s world-for-many and world-to-come-for-few.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-world-to-come-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 22:14 — *For many are called, but few are chosen.* The Messiah''s epigram says in one line what 2 Esdras 8:3 says of the many created but the few saved.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-world-to-come-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The age Esdras calls ''the world to come'' is Isaiah''s new heavens and new earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-world-to-come-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:13 — *For thou hast possessed my reins: thou hast covered me in my mother’s womb.* David''s covering in the womb is Esdras''s creature fashioned and preserved nine months in the mother''s womb.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:14 — *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well.* The fearful, wonderful making of the body answers the great labour with which 2 Esdras 8:8 says the creature is fashioned.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-fashioned-in-the-womb-nurtured-in-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-no-man-but-hath-sinned-mercy-without-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul''s verdict is Esdras''s — no man born but he hath sinned, none of the faithful but hath done amiss.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-no-man-but-hath-sinned-mercy-without-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The Preacher''s ''not a just man upon earth'' is precisely 2 Esdras 8:35''s ''no man... but he has dealt wickedly.'''
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-no-man-but-hath-sinned-mercy-without-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 143:2 — *And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* David, like Esdras in 8:32, flees judgment-by-works and pleads to be counted among those who have no works of righteousness but mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-no-man-but-hath-sinned-mercy-without-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=143 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-humbled-thyself-justified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* The publican who dares not be glorified is the very humility for which Esdras is commended in 8:49.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-humbled-thyself-justified'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Yahusha''s rule — the humble exalted — is why Esdras''s not-judging-himself-worthy is commended above all in 8:49.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-humbled-thyself-justified'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-paradise-tree-of-life-immortality
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 23:43 — *And Yahusha (Jesus) said unto him, Verily I say unto thee, To day shalt thou be with me in paradise.* The paradise Esdras says is ''opened'' to the lowly is the paradise the Messiah opens from the tree to the thief in 8:52.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* John sees planted in the builded city the very tree of life Esdras names in 8:52.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The passing of sorrows in 2 Esdras 8:54 is John''s wiping away of all tears.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 1:10 — *But is now made manifest by the appearing of our Saviour Yahusha HaMashiach (Jesus Christ), who hath abolished death, and hath brought life and immortality to light through the gospel:* The ''treasure of immortality'' shewed in the end (8:54) is brought to light through the Besorah.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-paradise-tree-of-life-immortality'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-8-shewn-to-thee-and-a-few-like-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 22:14 — *For many are called, but few are chosen.* The ''few like you'' to whom alone these things are shewed (8:62) are the chosen few of the Messiah''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-shewn-to-thee-and-a-few-like-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 1:9 — *Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began,* The few to whom the wonders are shewn in 8:62 are kept by purpose and grace, election before works.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd8_lookup sv, _session253_2esd8_lookup tv
 WHERE t.slug='2-esdras-8-shewn-to-thee-and-a-few-like-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=8 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

