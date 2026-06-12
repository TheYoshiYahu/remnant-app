-- ----- fragment: minion_jasher_74.sql (session252 jasher 74) -----
-- Source anchor: jasher/jasher ch74. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja74 (view _session252_ja74_lookup). Sort band base 56825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja74_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-74-edom-king-list
  ('jasher', 'jasher', 74, 1, 'canon', 'genesis', 36, 38, 'free', E'Genesis 36:38 — *And Saul died, and Baal-hanan the son of Achbor reigned in his stead.* The Torah''s own Edomite king-list names the exact succession Jasher 74:1 records — Saul of Edom dying and Baal Chanan son of Achbor reigning in his place.'),
  ('jasher', 'jasher', 74, 2, 'canon', '1-chronicles', 1, 49, 'free', E'1 Chronicles 1:49 — *And when Shaul was dead, Baal-hanan the son of Achbor reigned in his stead.* The Chronicler preserves the same handoff Jasher 74:2 dates to the reign of Moses over Cush — Baal Chanan son of Achbor over all the children of Edom.'),
  ('jasher', 'jasher', 74, 3, 'canon', 'genesis', 36, 35, 'free', E'Genesis 36:35 — *And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith.* Jasher 74:3 names the same Hadad son of Bedad who smote Midian and subdued Moab — the Torah''s note becomes Jasher''s backstory for Moab''s later revolt.'),
  ('jasher', 'jasher', 74, 4, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* Jasher 74:4''s account of Edom''s kings rising and the children of Moab withdrawing allegiance belongs to the same pre-monarchy Edomite king-era the Torah frames here.'),
  -- thread: jasher-74-chittim-ships-of-javan
  ('jasher', 'jasher', 74, 7, 'canon', 'genesis', 10, 4, 'free', E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* The children of Chittim whom Latinus reigns over in Jasher 74:7 are the Kittim the Table of Nations already counts among Javan''s sons.'),
  ('jasher', 'jasher', 74, 10, 'canon', 'numbers', 24, 24, 'free', E'Numbers 24:24 — *And ships shall come from the coast of Chittim, and shall afflict Asshur, and shall afflict Eber, and he also shall perish for ever.* Balaam''s oracle foresees the very seafaring Chittim that Jasher 74:10 shows coming in ships to make war — the canon named the sea-power before the legend narrated its battles.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja74_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja74_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-74-edom-king-list',
       E'The kings of Edom — Saul dies, Baal Chanan son of Achbor reigns',
       E'Jasher pauses its Cush-legend to keep the canon''s own chronicle of Edom: *In the end of years died Saul king of Edom, and Baal Chanan the son of Achbor reigned in his place* (Jasher 74:1), and *In his days Moab rebelled against the power of Edom, having been under Edom since the days of Hadad the son of Bedad, who smote them and Midian, and brought Moab under subjection to Edom* (Jasher 74:3). It ain''t new — this is the very king-list Moses set down in the Torah: *And Saul died, and Baal-hanan the son of Achbor reigned in his stead* (Genesis 36:38), and the same Hadad who *smote Midian in the field of Moab, reigned in his stead* (Genesis 36:35). The Chronicler kept the identical succession generations later (1 Chronicles 1:49). Edom is Esau''s line — the canon never forgets the brother-nation, and Jasher carries the record forward in step with it.',
       sv.verse_id, ev.verse_id, 'extras', 56825
  FROM _session252_ja74_lookup sv, _session252_ja74_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=74 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-74-chittim-ships-of-javan',
       E'Chittim and the ships — the seafaring sons of Javan',
       E'Jasher''s war-legend turns to the sea: *In the twenty-second year of the reign of Moses over the children of Cush, Latinus reigned over the children of Chittim forty-five years* (Jasher 74:7), and Latinus *assembled all his forces, and they came in ships, and went in it to fight with Azdrubal son of Angeas king of Africa* (Jasher 74:10). The campaigns of Carthage and Rome are pure Jasher legend with no canon parallel — but the name Chittim is no invention. The Torah lists *Kittim* among the sons of Javan (Genesis 10:4), and Balaam''s oracle already foresaw the sea-power: *And ships shall come from the coast of Chittim, and shall afflict Asshur, and shall afflict Eber* (Numbers 24:24). It ain''t new — the canon named the maritime nation of Chittim long before Jasher narrated its wars; only the legend is added, the name stands in Scripture.',
       sv.verse_id, ev.verse_id, 'extras', 56828
  FROM _session252_ja74_lookup sv, _session252_ja74_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=74 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-74-edom-king-list
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:38 — *And Saul died, and Baal-hanan the son of Achbor reigned in his stead.* The Torah''s own Edomite king-list names the exact succession Jasher 74:1 records — Saul of Edom dying and Baal Chanan son of Achbor reigning in his place.'
  FROM cross_reference_threads t, cross_references x, _session252_ja74_lookup sv, _session252_ja74_lookup tv
 WHERE t.slug='jasher-74-edom-king-list'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Chronicles 1:49 — *And when Shaul was dead, Baal-hanan the son of Achbor reigned in his stead.* The Chronicler preserves the same handoff Jasher 74:2 dates to the reign of Moses over Cush — Baal Chanan son of Achbor over all the children of Edom.'
  FROM cross_reference_threads t, cross_references x, _session252_ja74_lookup sv, _session252_ja74_lookup tv
 WHERE t.slug='jasher-74-edom-king-list'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 36:35 — *And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith.* Jasher 74:3 names the same Hadad son of Bedad who smote Midian and subdued Moab — the Torah''s note becomes Jasher''s backstory for Moab''s later revolt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja74_lookup sv, _session252_ja74_lookup tv
 WHERE t.slug='jasher-74-edom-king-list'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* Jasher 74:4''s account of Edom''s kings rising and the children of Moab withdrawing allegiance belongs to the same pre-monarchy Edomite king-era the Torah frames here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja74_lookup sv, _session252_ja74_lookup tv
 WHERE t.slug='jasher-74-edom-king-list'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-74-chittim-ships-of-javan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* The children of Chittim whom Latinus reigns over in Jasher 74:7 are the Kittim the Table of Nations already counts among Javan''s sons.'
  FROM cross_reference_threads t, cross_references x, _session252_ja74_lookup sv, _session252_ja74_lookup tv
 WHERE t.slug='jasher-74-chittim-ships-of-javan'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 24:24 — *And ships shall come from the coast of Chittim, and shall afflict Asshur, and shall afflict Eber, and he also shall perish for ever.* Balaam''s oracle foresees the very seafaring Chittim that Jasher 74:10 shows coming in ships to make war — the canon named the sea-power before the legend narrated its battles.'
  FROM cross_reference_threads t, cross_references x, _session252_ja74_lookup sv, _session252_ja74_lookup tv
 WHERE t.slug='jasher-74-chittim-ships-of-javan'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=74 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

