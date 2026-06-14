-- ----- fragment: minion_hermas_21.sql (session253 hermas 21) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm21 (view _session253_herm21_lookup). Sort band base 72000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-21-summer-reveals-the-righteous
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Hermas''s summer that makes the fruits of the righteous manifest is the Master''s own harvest, where the righteous shine forth as the sun (Hermas 21:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'malachi', 3, 18, 'free', E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The summer that reveals who serves Elohim and who does not is Malachi''s promised day of discerning — it ain''t new (Hermas 21:1).'),
  -- thread: hermas-21-tree-by-water-versus-the-chaff
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* Hermas''s sprouting, fruit-bearing trees of the righteous are the Psalmist''s tree by the rivers of water whose leaf does not wither (Hermas 21:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'psalms', 1, 4, 'free', E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The withered, unfruitful trees burnt up as fuel are the Psalmist''s chaff that the wind drives away — the same two ways, the same two ends (Hermas 21:1).'),
  -- thread: hermas-21-bear-fruit-burned-as-fuel
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'matthew', 13, 30, 'free', E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The withered burnt as fuel and the fruitful gathered unto the world to come are the Master''s tares bound to burn and wheat gathered into the barn (Hermas 21:1).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-21-summer-reveals-the-righteous',
       E'The summer to come — the righteous made manifest and shining forth',
       E'Where the third Similitude showed all trees alike withered in winter, the fourth turns to summer: *He showed me many trees again, some of them sprouting, and others withered... ‘These trees,’ saith he, ‘that are sprouting are the righteous, who shall dwell in the world to come; for the world to come is summer to the righteous, but winter to the sinners. When then the mercy of Yahuah (Lord) shall shine forth, then they that serve Elohim (God) shall be made manifest; yea, and all men shall be made manifest. For as in summer the fruits of each several tree are made manifest, and are recognised of what sort they are, so also the fruits of the righteous shall be manifest...’* (Hermas 21:1) It ain''t new — the Master closed His own parable of wheat and tares with the very summer Hermas saw: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43) And the day that sorts the sprouting from the withered is Malachi''s day of discerning: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* (Malachi 3:18) The age to come does not change who a man is; it reveals it.',
       sv.verse_id, ev.verse_id, 'extras', 72000
  FROM _session253_herm21_lookup sv, _session253_herm21_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=21 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-21-tree-by-water-versus-the-chaff',
       E'The sprouting tree and the withered — the green by the water and the chaff',
       E'The Shepherd parts the orchard in two: the sprouting *are the righteous, who shall dwell in the world to come*, while *the Gentiles and the sinners, just as thou sawest the trees which were withered, even such shall they be found, withered and unfruitful in that world, and shall be burnt up as fuel... For the sinners shall be burned, because they sinned and repented not.* (Hermas 21:1) It ain''t new — the very first Psalm drew the same two trees. The righteous man: *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3) And the wicked, the withered and rootless: *The ungodly are not so: but are like the chaff which the wind driveth away.* (Psalm 1:4) The fruit-bearing tree by the water and the chaff that is burned — the Shepherd is reading the orchard the Psalmist planted.',
       sv.verse_id, ev.verse_id, 'extras', 72003
  FROM _session253_herm21_lookup sv, _session253_herm21_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=21 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-21-bear-fruit-burned-as-fuel',
       E'Bear fruit for that summer — the fruitless burned, the wheat gathered in',
       E'The Shepherd turns the vision into a charge: the withered *shall be burnt up as fuel... For the sinners shall be burned, because they sinned and repented not... Do thou therefore bear fruit, that in that summer thy fruit may be known... If therefore thou doest these things, thou shalt be able to bear fruit unto the world to come.* (Hermas 21:1) It ain''t new — the Master''s harvest sorts the field exactly so: *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* (Matthew 13:30) The fruitless are bound and burned; the fruitful are gathered in. The whole call of the Shepherd of repentance is that you be found wheat in that summer, bearing fruit unto the world to come.',
       sv.verse_id, ev.verse_id, 'extras', 72006
  FROM _session253_herm21_lookup sv, _session253_herm21_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=21 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-21-summer-reveals-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Hermas''s summer that makes the fruits of the righteous manifest is the Master''s own harvest, where the righteous shine forth as the sun (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-summer-reveals-the-righteous'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The summer that reveals who serves Elohim and who does not is Malachi''s promised day of discerning — it ain''t new (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-summer-reveals-the-righteous'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-21-tree-by-water-versus-the-chaff
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* Hermas''s sprouting, fruit-bearing trees of the righteous are the Psalmist''s tree by the rivers of water whose leaf does not wither (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-tree-by-water-versus-the-chaff'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The withered, unfruitful trees burnt up as fuel are the Psalmist''s chaff that the wind drives away — the same two ways, the same two ends (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-tree-by-water-versus-the-chaff'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-21-bear-fruit-burned-as-fuel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The withered burnt as fuel and the fruitful gathered unto the world to come are the Master''s tares bound to burn and wheat gathered into the barn (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-bear-fruit-burned-as-fuel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

