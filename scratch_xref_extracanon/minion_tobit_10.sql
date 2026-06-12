-- ----- fragment: minion_tobit_10.sql (session253 tobit 10) -----
-- Source anchor: apocrypha/tobit ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob10 (view _session253_tob10_lookup). Sort band base 59825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-10-mourning-the-delayed-son
  ('apocrypha', 'tobit', 10, 5, 'canon', 'genesis', 37, 34, 'free', E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* As Jacob mourned the son he thought lost, so Anna in Tobit 10:5 mourns Tobias as good as dead, her own eyes'' light gone.'),
  ('apocrypha', 'tobit', 10, 7, 'canon', 'genesis', 37, 35, 'free', E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Anna''s ceaseless nightly weeping in Tobit 10:7 is Jacob''s refusal to be comforted — a parent set on going down to the grave for a son not truly lost.'),
  ('apocrypha', 'tobit', 10, 4, 'canon', 'genesis', 42, 36, 'free', E'Genesis 42:36 — *And Jacob their father said unto them, Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away: all these things are against me.* When a son delays, the bereaved-feeling father is the same voice that cries in Tobit 10:4, "My son is dead, seeing he stayeth long."'),
  -- thread: tobit-10-the-father-looking-for-the-son
  ('apocrypha', 'tobit', 10, 7, 'canon', 'luke', 15, 20, 'free', E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The parents who "look no more to see" their son in Tobit 10:7 are the watching father of the parable, eyes fixed on the road for the child''s return.'),
  ('apocrypha', 'tobit', 10, 9, 'canon', 'genesis', 42, 38, 'free', E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s dread of mischief "by the way" mirrors the aged parents Tobias hurries home to in Tobit 10:9, lest grief bring down their gray hairs.'),
  -- thread: tobit-10-blessing-at-the-parting
  ('apocrypha', 'tobit', 10, 11, 'canon', 'genesis', 24, 60, 'free', E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* As Rebekah was blessed and sent from her father''s house to her bridegroom, so Raguel blesses Sara and sends the couple away with a prosperous journey in Tobit 10:11.'),
  ('apocrypha', 'tobit', 10, 11, 'canon', 'genesis', 28, 15, 'free', E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Raguel''s prayer that the God of heaven give a prosperous journey in Tobit 10:11 echoes the promise spoken over Jacob''s road — kept in all his ways and brought home again.'),
  ('apocrypha', 'tobit', 10, 12, 'canon', 'psalms', 128, 6, 'free', E'Psalms 128:6 — *Yea, thou shalt see thy children’s children, and peace upon Yashar''el (Israel).* Edna''s longing in Tobit 10:12 to see her daughter''s children before she dies is the very blessing of the Torah-faithful house — to see one''s children''s children, and peace upon Israel.'),
  -- thread: tobit-10-honour-father-and-mother
  ('apocrypha', 'tobit', 10, 12, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* Raguel''s charge to honour her parents in Tobit 10:12 is the fifth commandment itself, the covenant word carried into the household of the dispersion.'),
  ('apocrypha', 'tobit', 10, 12, 'canon', 'ephesians', 6, 2, 'free', E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names the very commandment Raguel presses upon his daughter in Tobit 10:12 as the first with promise, binding the apocryphal counsel to the apostolic word.'),
  ('apocrypha', 'tobit', 10, 12, 'canon', 'ephesians', 6, 3, 'free', E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents — long life, well-being — answers Raguel''s hope in Tobit 10:12 to "hear good report of you," the blessing of a household in covenant order.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-mourning-the-delayed-son',
       E'The mother counts the days and bewails her son',
       E'Anna will not be comforted: *Now I care for nothing, my son, since I have let you go, the light of my eyes* (Tobit 10:5), and *she went out every day into the way which they went, and did eat no meat on the daytime, and ceased not whole nights to bewail her son Tobias* (Tobit 10:7). It ain''t new — this is Jacob over Joseph, the patriarch refusing all comfort: *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days* (Genesis 37:34), and *all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning* (Genesis 35). The same father grieves again when a son tarries: *Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away* (Genesis 42:36). The seed kept in exile carries Israel''s oldest sorrow — and its oldest hope of return.',
       sv.verse_id, ev.verse_id, 'extras', 59825
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-the-father-looking-for-the-son',
       E'Let me go, for my father and mother look no more to see me',
       E'Tobias breaks from the wedding feast for the homeward road: *Then Tobias said to Raguel, Let me go, for my father and my mother look no more to see me* (Tobit 10:7), and again *let me go to my father* (Tobit 10:9). The whole feeling is the watching parent on the road, scanning the horizon — which is exactly the heart Yahusha gives the Father in the parable: *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20). The son who returns from a far country to a parent who has been watching every day — Tobit''s house already keeps that pattern, the scattered child gathered home.',
       sv.verse_id, ev.verse_id, 'extras', 59828
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-blessing-at-the-parting',
       E'Be the mother of thousands — the bride blessed and sent away',
       E'Raguel sends the couple off with a blessing on the journey: *And he blessed them, and sent them away, saying, Yahuah (God) of heaven give you a prosperous journey, my children* (Tobit 10:11), and Edna prays *grant that I may see your children of my daughter Sara before I die* (Tobit 10:12). It ain''t new — this is the marriage-blessing spoken over Rebekah as she is sent from her father''s house to her bridegroom: *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them* (Genesis 24:60). The same Spirit attends Sara, daughter of the exile: a bride sent forth, blessed for fruitfulness, the seed of Israel kept and multiplied.',
       sv.verse_id, ev.verse_id, 'extras', 59831
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-10-honour-father-and-mother',
       E'Honour your father and your mother in law',
       E'Raguel''s charge to his daughter is the fifth word of the covenant, spoken straight: *And he said to his daughter, Honour your father and your mother in law, which are now your parents, that I may hear good report of you* (Tobit 10:12). Torah kept in exile is never law-as-curse but the household''s living rule: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). And it is the one commandment Sha''ul names with promise: *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2), *that it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The same commandment, the same promise — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59834
  FROM _session253_tob10_lookup sv, _session253_tob10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-10-mourning-the-delayed-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* As Jacob mourned the son he thought lost, so Anna in Tobit 10:5 mourns Tobias as good as dead, her own eyes'' light gone.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-mourning-the-delayed-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Anna''s ceaseless nightly weeping in Tobit 10:7 is Jacob''s refusal to be comforted — a parent set on going down to the grave for a son not truly lost.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-mourning-the-delayed-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:36 — *And Jacob their father said unto them, Me have ye bereaved of my children: Joseph is not, and Simeon is not, and ye will take Benjamin away: all these things are against me.* When a son delays, the bereaved-feeling father is the same voice that cries in Tobit 10:4, "My son is dead, seeing he stayeth long."'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-mourning-the-delayed-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-10-the-father-looking-for-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The parents who "look no more to see" their son in Tobit 10:7 are the watching father of the parable, eyes fixed on the road for the child''s return.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-the-father-looking-for-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:38 — *And he said, My son shall not go down with you; for his brother is dead, and he is left alone: if mischief befall him by the way in the which ye go, then shall ye bring down my gray hairs with sorrow to the grave.* Jacob''s dread of mischief "by the way" mirrors the aged parents Tobias hurries home to in Tobit 10:9, lest grief bring down their gray hairs.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-the-father-looking-for-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-10-blessing-at-the-parting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* As Rebekah was blessed and sent from her father''s house to her bridegroom, so Raguel blesses Sara and sends the couple away with a prosperous journey in Tobit 10:11.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-blessing-at-the-parting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Raguel''s prayer that the God of heaven give a prosperous journey in Tobit 10:11 echoes the promise spoken over Jacob''s road — kept in all his ways and brought home again.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-blessing-at-the-parting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 128:6 — *Yea, thou shalt see thy children’s children, and peace upon Yashar''el (Israel).* Edna''s longing in Tobit 10:12 to see her daughter''s children before she dies is the very blessing of the Torah-faithful house — to see one''s children''s children, and peace upon Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-blessing-at-the-parting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-10-honour-father-and-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* Raguel''s charge to honour her parents in Tobit 10:12 is the fifth commandment itself, the covenant word carried into the household of the dispersion.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names the very commandment Raguel presses upon his daughter in Tobit 10:12 as the first with promise, binding the apocryphal counsel to the apostolic word.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents — long life, well-being — answers Raguel''s hope in Tobit 10:12 to "hear good report of you," the blessing of a household in covenant order.'
  FROM cross_reference_threads t, cross_references x, _session253_tob10_lookup sv, _session253_tob10_lookup tv
 WHERE t.slug='tobit-10-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

