-- ----- fragment: minion_jasher_58.sql (session252 jasher 58) -----
-- Source anchor: jasher/jasher ch58. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja58 (view _session252_ja58_lookup). Sort band base 56425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja58_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-58-joseph-reigns-yahuah-with-him
  ('jasher', 'jasher', 58, 11, 'canon', 'genesis', 39, 2, 'free', E'Genesis 39:2 — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian.* The same refrain — Yahuah with Joseph, prospering all his ways — that Jasher 58:11 carries into his forty-year reign over Egypt.'),
  ('jasher', 'jasher', 58, 11, 'canon', 'acts', 7, 10, 'free', E'Acts 7:10 — *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* Stephen names the favor and wisdom and governorship that Jasher 58:11 says Yahuah gave Joseph over all the land.'),
  -- thread: jasher-58-seed-multiplies-secure-in-egypt
  ('jasher', 'jasher', 58, 13, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The very increase Jasher 58:13 records of the sons of Jacob multiplying exceedingly in the land all the days of Joseph.'),
  ('jasher', 'jasher', 58, 13, 'jubilees', 'jubilees', 46, 1, 'extras', E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar’el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* Jubilees tells the same multiplying-and-secure years of Jasher 58:13 — the seed growing into a nation while Joseph lives.'),
  -- thread: jasher-58-edomite-king-list-bela-jobab-husham
  ('jasher', 'jasher', 58, 20, 'canon', 'genesis', 36, 32, 'free', E'Genesis 36:32 — *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah.* The same Bela son of Beor, king of the children of Esau, whose fall Jasher 58:20 records in battle against the sons of Jacob.'),
  ('jasher', 'jasher', 58, 26, 'canon', 'genesis', 36, 33, 'free', E'Genesis 36:33 — *And Bela died, and Jobab the son of Zerah of Bozrah reigned in his stead.* Genesis names the very succession Jasher 58:26 narrates — Jobab the son of Zarach from Botzrah set up to reign over Edom after Bela''s death.'),
  ('jasher', 'jasher', 58, 29, 'canon', 'genesis', 36, 34, 'free', E'Genesis 36:34 — *And Jobab died, and Husham of the land of Temani reigned in his stead.* The same third king, Chusham of the land of Teman, whom Jasher 58:29 raises over Edom after Jobab''s death.'),
  ('jasher', 'jasher', 58, 20, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The heading over the very king-list — Bela, Jobab, Husham — whose deaths and reigns Jasher 58:20-29 unfolds as war-history.'),
  -- thread: jasher-58-esau-perpetual-hatred-of-jacob
  ('jasher', 'jasher', 58, 28, 'canon', 'genesis', 27, 41, 'free', E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* The root of the hatred Jasher 58:28 says grew very strong between Esau''s children and Jacob''s all the days.'),
  ('jasher', 'jasher', 58, 28, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* The prophet''s verdict on the very Esau-against-Jacob enmity Jasher 58:28 records as enduring to this day.'),
  ('jasher', 'jasher', 58, 28, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* Yahuah''s word of election standing over the brother-enmity Jasher 58:28 fixes between Esau and Jacob.'),
  ('jasher', 'jasher', 58, 28, 'canon', 'malachi', 1, 3, 'free', E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The final answer to Edom''s strong and lasting hatred of Jacob that Jasher 58:28 records — Esau set apart from the elect seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja58_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja58_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-58-joseph-reigns-yahuah-with-him',
       E'Joseph governs Egypt — and Yahuah was with him',
       E'When Pharaoh dies and his son Magron takes the throne, the whole government devolves on Joseph: *And Joseph was successful in all his ways, and Yahuah (the Lord) was with him, and Yahuah (the Lord) gave Joseph additional wisdom, and honor, and glory, and love toward him in the hearts of the Egyptians and throughout the land, and Joseph reigned over the whole country forty years.* (Jasher 58:11). This is the same favor Genesis names from his very first days in Egypt — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian.* (Genesis 39:2) — and that Stephen rehearses before the council: *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* (Acts 7:10). It ain''t new: the wisdom and the rule are gifts of Yahuah, not the man''s own arm.',
       sv.verse_id, ev.verse_id, 'extras', 56425
  FROM _session252_ja58_lookup sv, _session252_ja58_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=58 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-58-seed-multiplies-secure-in-egypt',
       E'The sons of Jacob fruitful and multiplying in the land',
       E'While Joseph reigns, his brethren flourish: *And also all his brethren the sons of Jacob dwelt securely in the land, all the days of Joseph, and they were fruitful and multiplied exceedingly in the land, and they served Yahuah (the Lord) all their days, as their father Jacob had commanded them.* (Jasher 58:13). This is the seed of Abraham swelling into the nation, exactly as Exodus opens — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* (Exodus 1:7) — and exactly as Jubilees tells it of these same years: *And it came to pass that after Jacob died the children of Yashar’el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* (Jubilees 46:1). Three witnesses to one promise kept; and Jasher adds that they served Yahuah all their days — Torah before Sinai, the fathers keeping the way.',
       sv.verse_id, ev.verse_id, 'extras', 56428
  FROM _session252_ja58_lookup sv, _session252_ja58_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=58 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-58-edomite-king-list-bela-jobab-husham',
       E'The kings of Edom — Bela, then Jobab of Bozrah, then Husham of Teman',
       E'Jasher names the succession of Edom''s kings in war and death: their king *Bela the son of Beor fell with them in the battle* (Jasher 58:20); then *they hastened and took a man from the people of the children of the east; his name was Jobab the son of Zarach, from the land of Botzrah, and they caused him to reign over them instead of Bela their king* (Jasher 58:26); and after ten years *the children of Esau took a man whose name was Chusham, from the land of Teman, and they made him king over them instead of Jobab* (Jasher 58:29). This is precisely the Edomite king-list Genesis preserves — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* (Genesis 36:31); *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah.* (Genesis 36:32); *And Bela died, and Jobab the son of Zerah of Bozrah reigned in his stead.* (Genesis 36:33); *And Jobab died, and Husham of the land of Temani reigned in his stead.* (Genesis 36:34). It ain''t new — Jasher''s legendary war is hung on the canon''s own roll of Edom''s kings, the line of Esau set apart from the elect seed.',
       sv.verse_id, ev.verse_id, 'extras', 56431
  FROM _session252_ja58_lookup sv, _session252_ja58_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=58 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-58-esau-perpetual-hatred-of-jacob',
       E'From that day the children of Esau hated the sons of Jacob',
       E'When Edom is beaten back, Jasher fixes the old enmity in place: *But from that day forward the children of Esau hated the sons of Jacob, and the hatred and enmity were very strong between them all the days, to this day.* (Jasher 58:28). This is the grudge born at the stolen blessing — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* (Genesis 27:41) — that the prophets carry to its end: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* (Obadiah 1:10), and the word that frames election itself, *Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob, And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* (Malachi 1:2-3). Esau set apart from the elect; the seed kept; the hatred answered by Yahuah''s own choosing.',
       sv.verse_id, ev.verse_id, 'extras', 56434
  FROM _session252_ja58_lookup sv, _session252_ja58_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=58 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-58-joseph-reigns-yahuah-with-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:2 — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian.* The same refrain — Yahuah with Joseph, prospering all his ways — that Jasher 58:11 carries into his forty-year reign over Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-joseph-reigns-yahuah-with-him'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:10 — *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* Stephen names the favor and wisdom and governorship that Jasher 58:11 says Yahuah gave Joseph over all the land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-joseph-reigns-yahuah-with-him'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-58-seed-multiplies-secure-in-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The very increase Jasher 58:13 records of the sons of Jacob multiplying exceedingly in the land all the days of Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-seed-multiplies-secure-in-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar’el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* Jubilees tells the same multiplying-and-secure years of Jasher 58:13 — the seed growing into a nation while Joseph lives.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-seed-multiplies-secure-in-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-58-edomite-king-list-bela-jobab-husham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:32 — *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah.* The same Bela son of Beor, king of the children of Esau, whose fall Jasher 58:20 records in battle against the sons of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-edomite-king-list-bela-jobab-husham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:33 — *And Bela died, and Jobab the son of Zerah of Bozrah reigned in his stead.* Genesis names the very succession Jasher 58:26 narrates — Jobab the son of Zarach from Botzrah set up to reign over Edom after Bela''s death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-edomite-king-list-bela-jobab-husham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 36:34 — *And Jobab died, and Husham of the land of Temani reigned in his stead.* The same third king, Chusham of the land of Teman, whom Jasher 58:29 raises over Edom after Jobab''s death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-edomite-king-list-bela-jobab-husham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The heading over the very king-list — Bela, Jobab, Husham — whose deaths and reigns Jasher 58:20-29 unfolds as war-history.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-edomite-king-list-bela-jobab-husham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-58-esau-perpetual-hatred-of-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* The root of the hatred Jasher 58:28 says grew very strong between Esau''s children and Jacob''s all the days.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-esau-perpetual-hatred-of-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* The prophet''s verdict on the very Esau-against-Jacob enmity Jasher 58:28 records as enduring to this day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-esau-perpetual-hatred-of-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* Yahuah''s word of election standing over the brother-enmity Jasher 58:28 fixes between Esau and Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-esau-perpetual-hatred-of-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The final answer to Edom''s strong and lasting hatred of Jacob that Jasher 58:28 records — Esau set apart from the elect seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja58_lookup sv, _session252_ja58_lookup tv
 WHERE t.slug='jasher-58-esau-perpetual-hatred-of-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=58 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

