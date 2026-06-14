-- =====================================================================
-- Session 411 — 2 Enoch FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/repair3-wt/data-schema/migrations/session411_2enoch_extracanon_cross_references.sql
-- =====================================================================

\echo 'session411 — 2 Enoch cross-references starting...'
BEGIN;

-- ----- fragment: minion_2enoch_01.sql (session411 2-enoch 1) -----
-- Source anchor: pseudepigrapha/2-enoch ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en01 (view _session411_2en01_lookup). Sort band base 82000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-1-enoch-taken-up
  ('pseudepigrapha', '2-enoch', 1, 1, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The wise man Yahuah conceived love for and received is the Enoch the Torah says was taken, who walked with Elohim and was not.'),
  ('pseudepigrapha', '2-enoch', 1, 10, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The charge to ascend into heaven this very day is the translation the apostle names, the man who pleased Elohim taken up without seeing death.'),
  ('pseudepigrapha', '2-enoch', 1, 1, 'enoch', '1-enoch', 70, 1, 'extras', E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white [and their raiment], And their faces shone like snow.* The uppermost dwellings this book promises Enoch will behold are the heavens the older Enoch book already says his spirit was translated into — a self-witness across the two books.'),
  -- thread: 2-enoch-1-two-shining-men
  ('pseudepigrapha', '2-enoch', 1, 6, 'canon', 'genesis', 18, 2, 'free', E'Genesis 18:2 — *And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground.* The sudden appearing of heavenly men in human form, met with reverence, is the pattern the Torah sets at Abraham''s tent.'),
  ('pseudepigrapha', '2-enoch', 1, 6, 'canon', 'acts', 1, 10, 'free', E'Acts 1:10 — *And while they looked stedfastly toward heaven as he went up, behold, two men stood by them in white apparel.* The two shining men whose faces are like the sun, attending the one about to ascend, match the two men in white who stand by at the ascension.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-1-enoch-taken-up',
       E'Enoch the wise man taken up — he was not, for Elohim took him',
       E'The Secrets of Enoch opens on the very man the Torah dismissed in a single line: *There was a wise man, a great artificer, and Yahuah (Lord) conceived love for him and received him, that he should behold the uppermost dwellings* (2 Enoch 1:1), and *the eternal Elohim (God) sent us to you, and lo! You shalt to-day ascend with us into heaven* (2 Enoch 1:10). This is no new figure — it is the walk that ended without death: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The apostle names the manner of it: *By faith Enoch was translated that he should not see death... for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). And the same translation the older Enoch book records of itself — *my spirit was translated And it ascended into the heavens* (1 Enoch 70:1) — is the very ascent this book sets out to tell. It ain''t new: the man Yahuah received is the man Moses already said was not.',
       sv.verse_id, ev.verse_id, 'extras', 82000
  FROM _session411_2en01_lookup sv, _session411_2en01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-1-two-shining-men',
       E'The two shining men at the head of the bed',
       E'Two heavenly messengers stand over the sleeping patriarch: *And there appeared to me two men, exceeding big, so that I never saw such on earth; their faces were shining like the sun... their hands whiter than snow* (2 Enoch 1:6), *standing at the head of my bed* (2 Enoch 1:7). The pattern of the visiting two — or three — is old. Abraham saw it at his tent: *and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground* (Genesis 18:2). And at another ascent into heaven, two men in shining apparel stood by the watchers: *behold, two men stood by them in white apparel* (Acts 1:10). The shining ones who attend a man being taken up are not new to this book; the canon stations them at the tent and at the Mount of Olives.',
       sv.verse_id, ev.verse_id, 'extras', 82003
  FROM _session411_2en01_lookup sv, _session411_2en01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-1-enoch-taken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The wise man Yahuah conceived love for and received is the Enoch the Torah says was taken, who walked with Elohim and was not.'
  FROM cross_reference_threads t, cross_references x, _session411_2en01_lookup sv, _session411_2en01_lookup tv
 WHERE t.slug='2-enoch-1-enoch-taken-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The charge to ascend into heaven this very day is the translation the apostle names, the man who pleased Elohim taken up without seeing death.'
  FROM cross_reference_threads t, cross_references x, _session411_2en01_lookup sv, _session411_2en01_lookup tv
 WHERE t.slug='2-enoch-1-enoch-taken-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white [and their raiment], And their faces shone like snow.* The uppermost dwellings this book promises Enoch will behold are the heavens the older Enoch book already says his spirit was translated into — a self-witness across the two books.'
  FROM cross_reference_threads t, cross_references x, _session411_2en01_lookup sv, _session411_2en01_lookup tv
 WHERE t.slug='2-enoch-1-enoch-taken-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=70 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-1-two-shining-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:2 — *And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground.* The sudden appearing of heavenly men in human form, met with reverence, is the pattern the Torah sets at Abraham''s tent.'
  FROM cross_reference_threads t, cross_references x, _session411_2en01_lookup sv, _session411_2en01_lookup tv
 WHERE t.slug='2-enoch-1-two-shining-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 1:10 — *And while they looked stedfastly toward heaven as he went up, behold, two men stood by them in white apparel.* The two shining men whose faces are like the sun, attending the one about to ascend, match the two men in white who stand by at the ascension.'
  FROM cross_reference_threads t, cross_references x, _session411_2en01_lookup sv, _session411_2en01_lookup tv
 WHERE t.slug='2-enoch-1-two-shining-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_02.sql (session411 2-enoch 2) -----
-- Source anchor: pseudepigrapha/2-enoch ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en02 (view _session411_2en02_lookup). Sort band base 82025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-2-turn-not-from-elohim-the-maker
  ('pseudepigrapha', '2-enoch', 2, 1, 'canon', 'deuteronomy', 4, 39, 'free', E'Deuteronomy 4:39 — *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* Enoch''s charge to turn not from Elohim to the vain is Moses'' command to fix in the heart that Yahuah alone is Elohim of heaven and earth.'),
  ('pseudepigrapha', '2-enoch', 2, 1, 'canon', 'jeremiah', 10, 11, 'free', E'Jeremiah 10:11 — *Thus shall ye say unto them, The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens.* Enoch''s warning that the vain who made not heaven and earth shall perish is Jeremiah''s own verdict, almost word for word.'),
  ('pseudepigrapha', '2-enoch', 2, 1, 'canon', 'isaiah', 2, 8, 'free', E'Isaiah 2:8 — *Their land also is full of idols; they worship the work of their own hands, that which their own fingers have made.* The vain that Enoch bids his sons not turn to are the idols Isaiah names — the work of men''s own hands.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-2-turn-not-from-elohim-the-maker',
       E'Turn not to the vain who made not heaven and earth',
       E'Before he ascends, Enoch charges his sons with the first commandment''s substance: *turn not from Elohim (God) before the face of the vain, who made not Heaven and earth, for these shall perish and those who worship them, and may Yahuah (Lord) make confident your hearts in the fear of him* (2 Enoch 2:1). The dividing line he draws — the Maker against the made — is Moses'' and the prophets'' own line. Moses set it as the day''s whole knowledge: *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). Jeremiah names the doom of the false gods in nearly the same breath as Enoch: *The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens* (Jeremiah 10:11). And Isaiah exposes the vanity Enoch warns against: *they worship the work of their own hands, that which their own fingers have made* (Isaiah 2:8). It ain''t new — the patriarch''s parting word is the Shema''s own fence.',
       sv.verse_id, ev.verse_id, 'extras', 82025
  FROM _session411_2en02_lookup sv, _session411_2en02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-2-turn-not-from-elohim-the-maker
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:39 — *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* Enoch''s charge to turn not from Elohim to the vain is Moses'' command to fix in the heart that Yahuah alone is Elohim of heaven and earth.'
  FROM cross_reference_threads t, cross_references x, _session411_2en02_lookup sv, _session411_2en02_lookup tv
 WHERE t.slug='2-enoch-2-turn-not-from-elohim-the-maker'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:11 — *Thus shall ye say unto them, The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens.* Enoch''s warning that the vain who made not heaven and earth shall perish is Jeremiah''s own verdict, almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session411_2en02_lookup sv, _session411_2en02_lookup tv
 WHERE t.slug='2-enoch-2-turn-not-from-elohim-the-maker'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 2:8 — *Their land also is full of idols; they worship the work of their own hands, that which their own fingers have made.* The vain that Enoch bids his sons not turn to are the idols Isaiah names — the work of men''s own hands.'
  FROM cross_reference_threads t, cross_references x, _session411_2en02_lookup sv, _session411_2en02_lookup tv
 WHERE t.slug='2-enoch-2-turn-not-from-elohim-the-maker'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_03.sql (session411 2-enoch 3) -----
-- Source anchor: pseudepigrapha/2-enoch ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en03 (view _session411_2en03_lookup). Sort band base 82050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-3-waters-above-the-firmament
  ('pseudepigrapha', '2-enoch', 3, 1, 'canon', 'genesis', 1, 7, 'free', E'Genesis 1:7 — *And Elohim (God) made the firmament, and divided the waters which were under the firmament from the waters which were above the firmament: and it was so.* The great sea Enoch sees on the first heaven is the upper water the Torah set above the firmament at creation.'),
  ('pseudepigrapha', '2-enoch', 3, 1, 'canon', 'psalms', 148, 4, 'free', E'Psalms 148:4 — *Praise him, ye heavens of heavens, and ye waters that be above the heavens.* The sea greater than the earthly sea, seen overhead, is the water above the heavens the Psalmist summons to praise.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-3-waters-above-the-firmament',
       E'The great sea on the first heaven — the waters above the firmament',
       E'Borne up on the clouds, Enoch is set on the first heaven and shown a sea above the earth: *they placed me on the first heaven and showed me a very great Sea, greater than the earthly sea* (2 Enoch 3:1). The waters set in the heights are not a new cosmology — the Torah divided them at creation: *Let there be a firmament in the midst of the waters, and let it divide the waters from the waters* (Genesis 1:6), and Elohim *divided the waters which were under the firmament from the waters which were above the firmament* (Genesis 1:7). The Psalmist calls those very heavenly waters to praise: *Praise him, ye heavens of heavens, and ye waters that be above the heavens* (Psalms 148:4). The sea Enoch sees overhead is the upper water Moses already set above the firmament.',
       sv.verse_id, ev.verse_id, 'extras', 82050
  FROM _session411_2en03_lookup sv, _session411_2en03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-3-waters-above-the-firmament
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:7 — *And Elohim (God) made the firmament, and divided the waters which were under the firmament from the waters which were above the firmament: and it was so.* The great sea Enoch sees on the first heaven is the upper water the Torah set above the firmament at creation.'
  FROM cross_reference_threads t, cross_references x, _session411_2en03_lookup sv, _session411_2en03_lookup tv
 WHERE t.slug='2-enoch-3-waters-above-the-firmament'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:4 — *Praise him, ye heavens of heavens, and ye waters that be above the heavens.* The sea greater than the earthly sea, seen overhead, is the water above the heavens the Psalmist summons to praise.'
  FROM cross_reference_threads t, cross_references x, _session411_2en03_lookup sv, _session411_2en03_lookup tv
 WHERE t.slug='2-enoch-3-waters-above-the-firmament'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_04.sql (session411 2-enoch 4) -----
-- Source anchor: pseudepigrapha/2-enoch ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en04 (view _session411_2en04_lookup). Sort band base 82075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-4-rulers-of-the-stellar-orders
  ('pseudepigrapha', '2-enoch', 4, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The rulers of the stellar orders, who govern the stars'' services to the heavens, attend the very lights the Torah set for signs and seasons.'),
  ('pseudepigrapha', '2-enoch', 4, 1, 'canon', 'psalms', 148, 6, 'free', E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars set under rulers and services in 2 Enoch 4 are the host the Psalmist says Yahuah established under a decree that shall not pass.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-4-rulers-of-the-stellar-orders',
       E'The elders and rulers of the stellar orders',
       E'The first heaven shows Enoch the appointed governors of the lights: *They brought before my face the elders and rulers of the stellar orders, and showed me two hundred angels, who rule the stars and their services to the heavens* (2 Enoch 4:1). That the host of heaven is set under order and appointment is the Torah''s own account — the lights were made to govern times: *Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). And the Psalmist binds those same hosts under decree: *Let them praise the name of Yahuah (LORD): for he commanded, and they were created. He hath also stablished them for ever and ever: he hath made a decree which shall not pass* (Psalms 148:5-6). The rulers of the stellar orders Enoch sees serve the very ordinances Moses and the Psalms appoint; the embellishment of a count is not the point — the governed heaven is.',
       sv.verse_id, ev.verse_id, 'extras', 82075
  FROM _session411_2en04_lookup sv, _session411_2en04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-4-rulers-of-the-stellar-orders
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The rulers of the stellar orders, who govern the stars'' services to the heavens, attend the very lights the Torah set for signs and seasons.'
  FROM cross_reference_threads t, cross_references x, _session411_2en04_lookup sv, _session411_2en04_lookup tv
 WHERE t.slug='2-enoch-4-rulers-of-the-stellar-orders'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:6 — *He hath also stablished them for ever and ever: he hath made a decree which shall not pass.* The stars set under rulers and services in 2 Enoch 4 are the host the Psalmist says Yahuah established under a decree that shall not pass.'
  FROM cross_reference_threads t, cross_references x, _session411_2en04_lookup sv, _session411_2en04_lookup tv
 WHERE t.slug='2-enoch-4-rulers-of-the-stellar-orders'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_05.sql (session411 2-enoch 5) -----
-- Source anchor: pseudepigrapha/2-enoch ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en05 (view _session411_2en05_lookup). Sort band base 82100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-5-treasure-houses-of-the-snow
  ('pseudepigrapha', '2-enoch', 5, 1, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The treasure-houses of the snow Enoch is shown are the treasures of the snow Yahuah challenged Job to enter.'),
  ('pseudepigrapha', '2-enoch', 5, 1, 'canon', 'psalms', 148, 8, 'free', E'Psalms 148:8 — *Fire, and hail; snow, and vapour; stormy wind fulfilling his word.* The snow kept in heavenly store-houses, with the clouds it goes out from, is the snow and vapour the Psalmist says fulfil Yahuah''s word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-5-treasure-houses-of-the-snow',
       E'The treasure-houses of the snow',
       E'Enoch is shown the heavenly stores of winter: *I looked down and saw the treasure-houses of the snow, and the angels who keep their terrible store-houses, and the clouds whence they come out and into which they go* (2 Enoch 5:1). This is the very question Yahuah put to Job out of the whirlwind — and answered: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail, Which I have reserved against the time of trouble, against the day of battle and war?* (Job 38:22-23). The Psalmist musters that same snow under the Maker''s word: *Fire, and hail; snow, and vapour; stormy wind fulfilling his word* (Psalms 148:8). The storehouses Enoch beholds are the treasures of the snow the Almighty kept reserved before Job.',
       sv.verse_id, ev.verse_id, 'extras', 82100
  FROM _session411_2en05_lookup sv, _session411_2en05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-5-treasure-houses-of-the-snow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* The treasure-houses of the snow Enoch is shown are the treasures of the snow Yahuah challenged Job to enter.'
  FROM cross_reference_threads t, cross_references x, _session411_2en05_lookup sv, _session411_2en05_lookup tv
 WHERE t.slug='2-enoch-5-treasure-houses-of-the-snow'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:8 — *Fire, and hail; snow, and vapour; stormy wind fulfilling his word.* The snow kept in heavenly store-houses, with the clouds it goes out from, is the snow and vapour the Psalmist says fulfil Yahuah''s word.'
  FROM cross_reference_threads t, cross_references x, _session411_2en05_lookup sv, _session411_2en05_lookup tv
 WHERE t.slug='2-enoch-5-treasure-houses-of-the-snow'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_06.sql (session411 2-enoch 6) -----
-- Source anchor: pseudepigrapha/2-enoch ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en06 (view _session411_2en06_lookup). Sort band base 82125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-6-treasure-house-of-the-dew
  ('pseudepigrapha', '2-enoch', 6, 1, 'canon', 'job', 38, 28, 'free', E'Job 38:28 — *Hath the rain a father? or who hath begotten the drops of dew?* The treasure-house of the dew Enoch sees belongs to the One whom Yahuah''s whirlwind-questions reveal as the begetter of the drops of dew.'),
  ('pseudepigrapha', '2-enoch', 6, 1, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The treasure-houses that shut and open in 2 Enoch 6 are Jeremiah''s treasures from which Yahuah brings forth the elements at His word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-6-treasure-house-of-the-dew',
       E'The treasure-house of the dew',
       E'Beside the stores of snow stands the store of dew: *They showed me the treasure-house of the dew, like oil of the olive, and the appearance of its form, as of all the flowers of the earth; further many angels guarding the treasure-houses of these things, and how they are made to shut and open* (2 Enoch 6:1). The dew, too, is a thing Yahuah questioned Job about: *Hath the rain a father? or who hath begotten the drops of dew?* (Job 38:28). It is the heaven''s own gift over Israel: *also his heavens shall drop down dew* (Deuteronomy 33:28). And the treasures that shut and open are Jeremiah''s own image of the Maker drawing forth what He has stored: *he maketh lightnings with rain, and bringeth forth the wind out of his treasures* (Jeremiah 10:13). The dew-house Enoch is shown belongs to the One whom Job confessed begets the drops of dew.',
       sv.verse_id, ev.verse_id, 'extras', 82125
  FROM _session411_2en06_lookup sv, _session411_2en06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=6 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-6-treasure-house-of-the-dew
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:28 — *Hath the rain a father? or who hath begotten the drops of dew?* The treasure-house of the dew Enoch sees belongs to the One whom Yahuah''s whirlwind-questions reveal as the begetter of the drops of dew.'
  FROM cross_reference_threads t, cross_references x, _session411_2en06_lookup sv, _session411_2en06_lookup tv
 WHERE t.slug='2-enoch-6-treasure-house-of-the-dew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The treasure-houses that shut and open in 2 Enoch 6 are Jeremiah''s treasures from which Yahuah brings forth the elements at His word.'
  FROM cross_reference_threads t, cross_references x, _session411_2en06_lookup sv, _session411_2en06_lookup tv
 WHERE t.slug='2-enoch-6-treasure-house-of-the-dew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_07.sql (session411 2-enoch 7) -----
-- Source anchor: pseudepigrapha/2-enoch ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en07 (view _session411_2en07_lookup). Sort band base 82150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-7-apostate-angels-bound-in-darkness
  ('pseudepigrapha', '2-enoch', 7, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The dark prisoners awaiting the great and boundless judgment are Peter''s angels that sinned, delivered into chains of darkness reserved unto judgment.'),
  ('pseudepigrapha', '2-enoch', 7, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The apostates who obeyed not Elohim''s commands but turned away are Jude''s angels who kept not their first estate, reserved in chains under darkness.'),
  ('pseudepigrapha', '2-enoch', 7, 1, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The prisoners hanging in darkness till the judgment are Isaiah''s high ones gathered as prisoners in the pit, shut up until they are visited.'),
  ('pseudepigrapha', '2-enoch', 7, 2, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The apostate angels held for the great judgment are the Watchers the older Enoch book says were bound till the day of their judgement — a self-witness across the two Enoch books.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-7-apostate-angels-bound-in-darkness',
       E'The apostate angels held in darkness awaiting judgment',
       E'On the second heaven Enoch sees the rebel angels in chains: *there I saw prisoners hanging, watched, awaiting the great and boundless judgment, and these angels were dark-looking, more than earthly darkness* (2 Enoch 7:1); they are *Elohim''s (God''s) apostates, who obeyed not Elohim''s (God''s) commands, but took counsel with their own will, and turned away with their prince* (2 Enoch 7:2). This is precisely the apostolic word about the angels that sinned. Peter: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Jude: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). Isaiah saw the same shutting-up of the high ones: *they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited* (Isaiah 24:22). And the older Enoch book already named the binding: *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12). It ain''t new — the prisoners awaiting the great judgment are the angels Peter and Jude say are chained in darkness.',
       sv.verse_id, ev.verse_id, 'extras', 82150
  FROM _session411_2en07_lookup sv, _session411_2en07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-7-apostate-angels-bound-in-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The dark prisoners awaiting the great and boundless judgment are Peter''s angels that sinned, delivered into chains of darkness reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session411_2en07_lookup sv, _session411_2en07_lookup tv
 WHERE t.slug='2-enoch-7-apostate-angels-bound-in-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The apostates who obeyed not Elohim''s commands but turned away are Jude''s angels who kept not their first estate, reserved in chains under darkness.'
  FROM cross_reference_threads t, cross_references x, _session411_2en07_lookup sv, _session411_2en07_lookup tv
 WHERE t.slug='2-enoch-7-apostate-angels-bound-in-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The prisoners hanging in darkness till the judgment are Isaiah''s high ones gathered as prisoners in the pit, shut up until they are visited.'
  FROM cross_reference_threads t, cross_references x, _session411_2en07_lookup sv, _session411_2en07_lookup tv
 WHERE t.slug='2-enoch-7-apostate-angels-bound-in-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The apostate angels held for the great judgment are the Watchers the older Enoch book says were bound till the day of their judgement — a self-witness across the two Enoch books.'
  FROM cross_reference_threads t, cross_references x, _session411_2en07_lookup sv, _session411_2en07_lookup tv
 WHERE t.slug='2-enoch-7-apostate-angels-bound-in-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_08.sql (session411 2-enoch 8) -----
-- Source anchor: pseudepigrapha/2-enoch ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en08 (view _session411_2en08_lookup). Sort band base 82175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-8-third-heaven-is-paradise
  ('pseudepigrapha', '2-enoch', 8, 1, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* The third heaven Enoch is led up to is the very third heaven Paul says a man in Messiah was caught up to.'),
  ('pseudepigrapha', '2-enoch', 8, 3, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* Paul names the third heaven and paradise as one place — exactly as 2 Enoch sets the tree of life in the third heaven, the place whereon Yahuah rests when he goes up into paradise.'),
  ('pseudepigrapha', '2-enoch', 8, 3, 'canon', 'luke', 23, 43, 'free', E'Luke 23:43 — *And Yahusha (Jesus) said unto him, Verily I say unto thee, To day shalt thou be with me in paradise.* The paradise whereon Yahuah rests, where Enoch is set, is the paradise the Messiah promised the dying thief that very day.'),
  -- thread: 2-enoch-8-tree-of-life-in-the-midst
  ('pseudepigrapha', '2-enoch', 8, 3, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The tree of life in the midst of paradise that Enoch beholds is the tree of life the Torah set in the midst of the garden of Eden.'),
  ('pseudepigrapha', '2-enoch', 8, 3, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree of life in the third-heaven paradise is the same tree in the midst of the paradise of Elohim the Spirit promises to the overcomer.'),
  ('pseudepigrapha', '2-enoch', 8, 3, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* Enoch''s tree that has produce from all fruits, in a place where there is no unfruitful tree, is John''s tree of life bearing twelve manner of fruits in the New Jerusalem.'),
  -- thread: 2-enoch-8-four-rivers-of-eden
  ('pseudepigrapha', '2-enoch', 8, 6, 'canon', 'genesis', 2, 10, 'free', E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The springs of paradise that separate into four parts and go down into the paradise of Eden are the one river of Eden that parted into four heads.'),
  ('pseudepigrapha', '2-enoch', 8, 6, 'canon', 'revelation', 22, 1, 'free', E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The springs sending forth honey, milk, oil and wine from the tree''s root are the river of water of life John sees proceeding from the throne in the paradise to come.'),
  ('pseudepigrapha', '2-enoch', 8, 8, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Enoch''s paradise where there is no unfruitful tree and every place is blessed is Ezekiel''s river-fed trees that never fade and never fail of fruit.'),
  -- thread: 2-enoch-8-angels-keep-the-garden
  ('pseudepigrapha', '2-enoch', 8, 9, 'canon', 'ezekiel', 28, 13, 'free', E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond... in the day that thou wast created.* The bright angels who keep the garden in 2 Enoch 8 attend the garden of Elohim, the Eden Ezekiel describes adorned with every precious stone.'),
  ('pseudepigrapha', '2-enoch', 8, 9, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The angels who serve Yahuah with never-silent voices throughout all days and hours echo the living creatures who rest not day and night before the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-8-third-heaven-is-paradise',
       E'The third heaven is paradise — caught up where Paul was caught up',
       E'Enoch is borne to the third heaven and finds it is the garden of Elohim: *those men took me thence, and led me up on to the third heaven, and placed me there* (2 Enoch 8:1), where stands *that of life, in that place whereon Yahuah (Lord) rests, when he goes up into paradise* (2 Enoch 8:3). This is the very geography Paul reports of his own catching-up — and he names the third heaven and paradise as one place: *such an one caught up to the third heaven* (2 Corinthians 12:2), *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). The Messiah promised the same paradise to the dying thief: *To day shalt thou be with me in paradise* (Luke 23:43). It ain''t new — the third heaven Enoch is set in is the paradise Paul was caught up into, the same paradise the Messiah opened from the tree.',
       sv.verse_id, ev.verse_id, 'extras', 82175
  FROM _session411_2en08_lookup sv, _session411_2en08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-8-tree-of-life-in-the-midst',
       E'The tree of life in the midst — from Eden to the New Jerusalem',
       E'At the heart of paradise stands the one tree: *And in the midst of the trees that of life... and this tree is of ineffable goodness and fragrance, and adorned more than every existing thing... and it has produce from all fruits* (2 Enoch 8:3); *here there is no unfruitful tree, and every place is blessed* (2 Enoch 8:8). The tree of life in the midst is Eden''s own: *the tree of life also in the midst of the garden* (Genesis 2:9). The Messiah grants it to the overcomer in the same paradise: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). And John sees it bearing every fruit at the end, as Enoch sees it bearing produce from all fruits: *the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). It ain''t new — the one tree in the midst runs unbroken from Eden through paradise to the New Jerusalem.',
       sv.verse_id, ev.verse_id, 'extras', 82178
  FROM _session411_2en08_lookup sv, _session411_2en08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-8-four-rivers-of-eden',
       E'The springs that part into four — the rivers of Eden',
       E'From the root of the tree the waters of paradise go out and divide: *two springs come out which send forth honey and milk, and their springs send forth oil and wine, and they separate into four parts... and go down into the PARADISE OF EDEN* (2 Enoch 8:6), the tree''s *root is in the garden at the earth''s end* (2 Enoch 8:4). The fourfold parting of the waters is Eden''s own river: *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads* (Genesis 2:10). John sees the same life-river flow from the throne at the end: *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). And Ezekiel''s temple-river feeds the trees whose leaf does not fade: *all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine* (Ezekiel 47:12). The four-parted springs of paradise are Eden''s four-headed river, the river of life that waters the unfading trees.',
       sv.verse_id, ev.verse_id, 'extras', 82181
  FROM _session411_2en08_lookup sv, _session411_2en08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-8-angels-keep-the-garden',
       E'The angels that keep the garden and serve continually',
       E'Paradise is kept and served without ceasing: *there are three hundred angels very bright, who keep the garden, and with incessant sweet singing and never-silent voices serve Yahuah (Lord) throughout all days and hours* (2 Enoch 8:9). That the garden of Elohim is guarded and full of His own is the canon''s witness — Eden itself was set under heavenly keeping, and Ezekiel places man amid the stones of fire in *Eden the garden of Elohim (God); every precious stone was thy covering... in the day that thou wast created* (Ezekiel 28:13). And the ceaseless service Enoch hears among the bright ones is the unresting praise the prophets and the apostle hear before the throne — *they rest not day and night, saying, Holy, holy, holy* (Revelation 4:8). The keepers of paradise serving day and hour are no new invention; they are the guarded garden and the unceasing praise the Scriptures already record.',
       sv.verse_id, ev.verse_id, 'extras', 82184
  FROM _session411_2en08_lookup sv, _session411_2en08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-8-third-heaven-is-paradise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* The third heaven Enoch is led up to is the very third heaven Paul says a man in Messiah was caught up to.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-third-heaven-is-paradise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* Paul names the third heaven and paradise as one place — exactly as 2 Enoch sets the tree of life in the third heaven, the place whereon Yahuah rests when he goes up into paradise.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-third-heaven-is-paradise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 23:43 — *And Yahusha (Jesus) said unto him, Verily I say unto thee, To day shalt thou be with me in paradise.* The paradise whereon Yahuah rests, where Enoch is set, is the paradise the Messiah promised the dying thief that very day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-third-heaven-is-paradise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-8-tree-of-life-in-the-midst
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The tree of life in the midst of paradise that Enoch beholds is the tree of life the Torah set in the midst of the garden of Eden.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-tree-of-life-in-the-midst'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree of life in the third-heaven paradise is the same tree in the midst of the paradise of Elohim the Spirit promises to the overcomer.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-tree-of-life-in-the-midst'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* Enoch''s tree that has produce from all fruits, in a place where there is no unfruitful tree, is John''s tree of life bearing twelve manner of fruits in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-tree-of-life-in-the-midst'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-8-four-rivers-of-eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The springs of paradise that separate into four parts and go down into the paradise of Eden are the one river of Eden that parted into four heads.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-four-rivers-of-eden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The springs sending forth honey, milk, oil and wine from the tree''s root are the river of water of life John sees proceeding from the throne in the paradise to come.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-four-rivers-of-eden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Enoch''s paradise where there is no unfruitful tree and every place is blessed is Ezekiel''s river-fed trees that never fade and never fail of fruit.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-four-rivers-of-eden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-8-angels-keep-the-garden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 28:13 — *Thou hast been in Eden the garden of Elohim (God); every precious stone was thy covering, the sardius, topaz, and the diamond... in the day that thou wast created.* The bright angels who keep the garden in 2 Enoch 8 attend the garden of Elohim, the Eden Ezekiel describes adorned with every precious stone.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-angels-keep-the-garden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The angels who serve Yahuah with never-silent voices throughout all days and hours echo the living creatures who rest not day and night before the throne.'
  FROM cross_reference_threads t, cross_references x, _session411_2en08_lookup sv, _session411_2en08_lookup tv
 WHERE t.slug='2-enoch-8-angels-keep-the-garden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=8 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_09.sql (session411 2-enoch 9) -----
-- Source anchor: pseudepigrapha/2-enoch ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en09 (view _session411_2en09_lookup). Sort band base 82200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-9-place-prepared-for-the-righteous
  ('pseudepigrapha', '2-enoch', 9, 1, 'canon', 'matthew', 25, 34, 'free', E'Matthew 25:34 — *Then shall the King say unto them on his right hand, Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world.* The place prepared for the righteous as an eternal inheritance is the King''s own kingdom, prepared from the foundation of the world.'),
  ('pseudepigrapha', '2-enoch', 9, 1, 'canon', 'matthew', 25, 46, 'free', E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* Enoch''s righteous who walk faultless before the face of Yahuah enter the same life eternal the King grants the sheep.'),
  ('pseudepigrapha', '2-enoch', 9, 1, 'canon', 'psalms', 31, 19, 'free', E'Psalms 31:19 — *Oh how great is thy goodness, which thou hast laid up for them that fear thee; which thou hast wrought for them that trust in thee before the sons of men!* The place prepared for those who serve Yahuah alone is the goodness laid up for them that fear Him.'),
  ('pseudepigrapha', '2-enoch', 9, 1, 'canon', 'isaiah', 64, 4, 'free', E'Isaiah 64:4 — *For since the beginning of the world men have not heard, nor perceived by the ear, neither hath the eye seen, O Elohim, beside thee, what he hath prepared for him that waiteth for him.* The prepared place Enoch is shown is what Isaiah says no eye had seen — kept for him that waiteth on Yahuah.'),
  ('pseudepigrapha', '2-enoch', 9, 1, 'canon', '1-corinthians', 2, 9, 'free', E'1 Corinthians 2:9 — *But as it is written, Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim hath prepared for them that love him.* Paul draws on Isaiah''s same word for the things prepared — the eternal inheritance shown to Enoch for those who love and serve Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-9-place-prepared-for-the-righteous',
       E'The place prepared for the righteous — inherit the kingdom',
       E'Enoch is shown paradise overflowing into a place kept for those who walked uprightly: *This place, O Enoch, is prepared for the righteous... and for them is prepared this place for eternal inheritance* (2 Enoch 9:1). It ain''t new — this is the King''s own welcome: *Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world* (Matthew 25:34), and *the righteous into life eternal* (Matthew 25:46). The good laid up is exactly what the Psalmist sang — *Oh how great is thy goodness, which thou hast laid up for them that fear thee* (Psalms 31:19) — and what no eye had seen until it was revealed: *neither hath the eye seen, O Elohim, beside thee, what he hath prepared for him that waiteth for him* (Isaiah 64:4), *the things which Elohim hath prepared for them that love him* (1 Corinthians 2:9). The very deeds Enoch names — bread to the hungering, clothing the naked, raising the fallen, helping the orphan — are the works the King will own at the judgment. The reward is not new; it was prepared from the foundation of the world.',
       sv.verse_id, ev.verse_id, 'extras', 82200
  FROM _session411_2en09_lookup sv, _session411_2en09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-9-place-prepared-for-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:34 — *Then shall the King say unto them on his right hand, Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world.* The place prepared for the righteous as an eternal inheritance is the King''s own kingdom, prepared from the foundation of the world.'
  FROM cross_reference_threads t, cross_references x, _session411_2en09_lookup sv, _session411_2en09_lookup tv
 WHERE t.slug='2-enoch-9-place-prepared-for-the-righteous'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* Enoch''s righteous who walk faultless before the face of Yahuah enter the same life eternal the King grants the sheep.'
  FROM cross_reference_threads t, cross_references x, _session411_2en09_lookup sv, _session411_2en09_lookup tv
 WHERE t.slug='2-enoch-9-place-prepared-for-the-righteous'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 31:19 — *Oh how great is thy goodness, which thou hast laid up for them that fear thee; which thou hast wrought for them that trust in thee before the sons of men!* The place prepared for those who serve Yahuah alone is the goodness laid up for them that fear Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en09_lookup sv, _session411_2en09_lookup tv
 WHERE t.slug='2-enoch-9-place-prepared-for-the-righteous'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 64:4 — *For since the beginning of the world men have not heard, nor perceived by the ear, neither hath the eye seen, O Elohim, beside thee, what he hath prepared for him that waiteth for him.* The prepared place Enoch is shown is what Isaiah says no eye had seen — kept for him that waiteth on Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en09_lookup sv, _session411_2en09_lookup tv
 WHERE t.slug='2-enoch-9-place-prepared-for-the-righteous'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 2:9 — *But as it is written, Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim hath prepared for them that love him.* Paul draws on Isaiah''s same word for the things prepared — the eternal inheritance shown to Enoch for those who love and serve Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en09_lookup sv, _session411_2en09_lookup tv
 WHERE t.slug='2-enoch-9-place-prepared-for-the-righteous'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_10.sql (session411 2-enoch 10) -----
-- Source anchor: pseudepigrapha/2-enoch ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en10 (view _session411_2en10_lookup). Sort band base 82225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-10-place-of-torment-unquenched-fire
  ('pseudepigrapha', '2-enoch', 10, 1, 'canon', 'matthew', 25, 41, 'free', E'Matthew 25:41 — *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels.* The terrible place of murky flaming fire prepared for the ungodly is the everlasting fire the King consigns the cursed to.'),
  ('pseudepigrapha', '2-enoch', 10, 1, 'canon', 'isaiah', 66, 24, 'free', E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The constantly flaming fire Enoch is shown is Isaiah''s fire that shall not be quenched upon the transgressors.'),
  ('pseudepigrapha', '2-enoch', 10, 1, 'canon', 'mark', 9, 44, 'free', E'Mark 9:44 — *Where their worm dieth not, and the fire is not quenched.* The Messiah takes Isaiah''s image onto His own lips for the place of torment — the same fire that never rests that Enoch sees on the northern side.'),
  -- thread: 2-enoch-10-prepared-for-those-who-dishonour-elohim
  ('pseudepigrapha', '2-enoch', 10, 3, 'canon', 'revelation', 21, 8, 'free', E'Revelation 21:8 — *But the fearful, and unbelieving, and the abominable, and murderers, and whoremongers, and sorcerers, and idolaters, and all liars, shall have their part in the lake which burneth with fire and brimstone: which is the second death.* John''s roll of the murderers, sorcerers, fornicators, idolaters and liars is the very company Enoch sees the place of torment prepared for.'),
  ('pseudepigrapha', '2-enoch', 10, 3, 'canon', 'revelation', 20, 15, 'free', E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* Those who dishonour Elohim and knew not their creator, kept for eternal torment, are those not found written in the book of life cast into the lake of fire.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-10-place-of-torment-unquenched-fire',
       E'The place of torment — the fire that is not quenched',
       E'On the northern side Enoch is shown the opposite of paradise: *a very terrible place, and there were all manner of tortures... murky fire constantly flaming aloft, and there is a fiery river coming forth* (2 Enoch 10:1), *prepared for those who dishonour Elohim* (2 Enoch 10:3). It ain''t new — this is the everlasting fire the King names: *Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels* (Matthew 25:41), and the abhorring Isaiah saw: *for their worm shall not die, neither shall their fire be quenched* (Isaiah 66:24), which the Messiah set on His own lips — *the fire that never shall be quenched: where their worm dieth not* (Mark 9:43-44). John saw the same end: *whosoever was not found written in the book of life was cast into the lake of fire* (Revelation 20:15). The place of torment is not a later invention; it is the unquenchable fire Moses'' prophets and the Messiah already named.',
       sv.verse_id, ev.verse_id, 'extras', 82225
  FROM _session411_2en10_lookup sv, _session411_2en10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-10-prepared-for-those-who-dishonour-elohim',
       E'Prepared for those who dishonour Elohim — the lake of fire',
       E'Enoch is told who the place is kept for: *those who dishonour Elohim, who on earth practice sin against nature... magic-making, enchantments and devilish witchcrafts... stealing, lies, calumnies, envy... fornication, murder... and bowed to the soulless and lifeless gods* (2 Enoch 10:3). It ain''t new — that very roll of the condemned is John''s list at the lake of fire: *the fearful, and unbelieving, and the abominable, and murderers, and whoremongers, and sorcerers, and idolaters, and all liars, shall have their part in the lake which burneth with fire and brimstone* (Revelation 21:8), where *whosoever was not found written in the book of life was cast into the lake of fire* (Revelation 20:15). The sins that earn the place — sorcery, murder, fornication, lying, idolatry — are weighed by the same standard Moses'' Torah set down; the apostle''s catalogue only echoes them.',
       sv.verse_id, ev.verse_id, 'extras', 82228
  FROM _session411_2en10_lookup sv, _session411_2en10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-10-place-of-torment-unquenched-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:41 — *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels.* The terrible place of murky flaming fire prepared for the ungodly is the everlasting fire the King consigns the cursed to.'
  FROM cross_reference_threads t, cross_references x, _session411_2en10_lookup sv, _session411_2en10_lookup tv
 WHERE t.slug='2-enoch-10-place-of-torment-unquenched-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The constantly flaming fire Enoch is shown is Isaiah''s fire that shall not be quenched upon the transgressors.'
  FROM cross_reference_threads t, cross_references x, _session411_2en10_lookup sv, _session411_2en10_lookup tv
 WHERE t.slug='2-enoch-10-place-of-torment-unquenched-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 9:44 — *Where their worm dieth not, and the fire is not quenched.* The Messiah takes Isaiah''s image onto His own lips for the place of torment — the same fire that never rests that Enoch sees on the northern side.'
  FROM cross_reference_threads t, cross_references x, _session411_2en10_lookup sv, _session411_2en10_lookup tv
 WHERE t.slug='2-enoch-10-place-of-torment-unquenched-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-10-prepared-for-those-who-dishonour-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:8 — *But the fearful, and unbelieving, and the abominable, and murderers, and whoremongers, and sorcerers, and idolaters, and all liars, shall have their part in the lake which burneth with fire and brimstone: which is the second death.* John''s roll of the murderers, sorcerers, fornicators, idolaters and liars is the very company Enoch sees the place of torment prepared for.'
  FROM cross_reference_threads t, cross_references x, _session411_2en10_lookup sv, _session411_2en10_lookup tv
 WHERE t.slug='2-enoch-10-prepared-for-those-who-dishonour-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* Those who dishonour Elohim and knew not their creator, kept for eternal torment, are those not found written in the book of life cast into the lake of fire.'
  FROM cross_reference_threads t, cross_references x, _session411_2en10_lookup sv, _session411_2en10_lookup tv
 WHERE t.slug='2-enoch-10-prepared-for-those-who-dishonour-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_11.sql (session411 2-enoch 11) -----
-- Source anchor: pseudepigrapha/2-enoch ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en11 (view _session411_2en11_lookup). Sort band base 82250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-11-courses-of-sun-and-moon
  ('pseudepigrapha', '2-enoch', 11, 2, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* Enoch''s finding that the sun''s light is greater than the moon''s is simply the greater and lesser lights Moses records at creation.'),
  ('pseudepigrapha', '2-enoch', 11, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The goings of sun and moon Enoch is shown are the lights set in the firmament for signs and seasons.'),
  ('pseudepigrapha', '2-enoch', 11, 3, 'canon', 'psalms', 19, 6, 'free', E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun''s ceaseless circuit that has no rest by day or night is the Psalmist''s circuit of the sun from one end of heaven to the other.'),
  ('pseudepigrapha', '2-enoch', 11, 1, 'enoch', '1-enoch', 72, 2, 'extras', E'1 Enoch 72:2 — *And this is the first law of the luminaries: the luminary the Sun has its rising in the eastern portals of the heaven, and its setting in the western portals of the heaven.* Enoch''s own Astronomical Book already set down the courses of the sun he is here shown again in the fourth heaven.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-11-courses-of-sun-and-moon',
       E'The fourth heaven — the courses of the sun and moon',
       E'Led to the fourth heaven, Enoch is shown the ordered machinery of the lights: *all the successive goings, and all the rays of the light of sun and moon* (2 Enoch 11:1), and *the sun''s light is greater than the moon''s* (2 Enoch 11:2). It ain''t new — this is Genesis read upward: *Let there be lights in the firmament of the heaven... And Elohim made two great lights; the greater light to rule the day, and the lesser light to rule the night* (Genesis 1:14,16). The sun''s tireless circuit Enoch sees — *day and night it has no rest* (2 Enoch 11:3) — is the Psalmist''s tabernacle for the sun: *His going forth is from the end of the heaven, and his circuit unto the ends of it* (Psalms 19:6). The Astronomical Book Enoch wrote already laid the same courses out: *the luminary the Sun has its rising in the eastern portals of the heaven, and its setting in the western portals* (1 Enoch 72:2). The lights are not riddles; they are the appointed signs of Moses'' first chapter.',
       sv.verse_id, ev.verse_id, 'extras', 82250
  FROM _session411_2en11_lookup sv, _session411_2en11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-11-courses-of-sun-and-moon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* Enoch''s finding that the sun''s light is greater than the moon''s is simply the greater and lesser lights Moses records at creation.'
  FROM cross_reference_threads t, cross_references x, _session411_2en11_lookup sv, _session411_2en11_lookup tv
 WHERE t.slug='2-enoch-11-courses-of-sun-and-moon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:14 — *And Elohim said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The goings of sun and moon Enoch is shown are the lights set in the firmament for signs and seasons.'
  FROM cross_reference_threads t, cross_references x, _session411_2en11_lookup sv, _session411_2en11_lookup tv
 WHERE t.slug='2-enoch-11-courses-of-sun-and-moon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun''s ceaseless circuit that has no rest by day or night is the Psalmist''s circuit of the sun from one end of heaven to the other.'
  FROM cross_reference_threads t, cross_references x, _session411_2en11_lookup sv, _session411_2en11_lookup tv
 WHERE t.slug='2-enoch-11-courses-of-sun-and-moon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 72:2 — *And this is the first law of the luminaries: the luminary the Sun has its rising in the eastern portals of the heaven, and its setting in the western portals of the heaven.* Enoch''s own Astronomical Book already set down the courses of the sun he is here shown again in the fourth heaven.'
  FROM cross_reference_threads t, cross_references x, _session411_2en11_lookup sv, _session411_2en11_lookup tv
 WHERE t.slug='2-enoch-11-courses-of-sun-and-moon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_12.sql (session411 2-enoch 12) -----
-- Source anchor: pseudepigrapha/2-enoch ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en12 (view _session411_2en12_lookup). Sort band base 82275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-12-the-sun-revolves-and-goes-down
  ('pseudepigrapha', '2-enoch', 12, 2, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The sun that revolves and goes, its course passing under the earth, is the Psalmist''s sun that knows its appointed going down.'),
  ('pseudepigrapha', '2-enoch', 12, 2, 'canon', 'psalms', 19, 5, 'free', E'Psalms 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The sun that revolves and rises and runs its incessant course is the Psalmist''s bridegroom-sun rejoicing to run its race across the heaven.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-12-the-sun-revolves-and-goes-down',
       E'The sun revolves and goes down — its appointed circuit',
       E'Past the winged embellishments of the solar elements, the genuine root stands plain: *Thus the sun revolves and goes, and rises under the heaven, and its course goes under the earth with the light of its rays incessantly* (2 Enoch 12:2). It ain''t new — the sun''s revolving and its appointed setting are the Psalmist''s word: *He appointed the moon for seasons: the sun knoweth his going down* (Psalms 104:19), and the bridegroom-sun who *rejoiceth as a strong man to run a race. His going forth is from the end of the heaven, and his circuit unto the ends of it* (Psalms 19:5-6). The phoenix-talk is the seer''s embroidery; the running circuit underneath it is the ordinance Moses set in the firmament and the Psalms sing — the sun that knows its going down.',
       sv.verse_id, ev.verse_id, 'extras', 82275
  FROM _session411_2en12_lookup sv, _session411_2en12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-12-the-sun-revolves-and-goes-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The sun that revolves and goes, its course passing under the earth, is the Psalmist''s sun that knows its appointed going down.'
  FROM cross_reference_threads t, cross_references x, _session411_2en12_lookup sv, _session411_2en12_lookup tv
 WHERE t.slug='2-enoch-12-the-sun-revolves-and-goes-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The sun that revolves and rises and runs its incessant course is the Psalmist''s bridegroom-sun rejoicing to run its race across the heaven.'
  FROM cross_reference_threads t, cross_references x, _session411_2en12_lookup sv, _session411_2en12_lookup tv
 WHERE t.slug='2-enoch-12-the-sun-revolves-and-goes-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_13.sql (session411 2-enoch 13) -----
-- Source anchor: pseudepigrapha/2-enoch ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en13 (view _session411_2en13_lookup). Sort band base 82300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-13-suns-gates-and-the-seasons
  ('pseudepigrapha', '2-enoch', 13, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The sun going forth by its gates to regulate the seasons and months of the year is the lights set from creation for signs and seasons.'),
  ('pseudepigrapha', '2-enoch', 13, 2, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah; If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The whole year finished after the returns of the four seasons rests on the ordinances of heaven and earth Yahuah appointed.'),
  ('pseudepigrapha', '2-enoch', 13, 2, 'enoch', '1-enoch', 72, 3, 'extras', E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals.* The six gates of the sun Enoch measures here are the six portals his own Astronomical Book had already numbered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-13-suns-gates-and-the-seasons',
       E'The sun''s gates — the regulation of the seasons and the year',
       E'At the east Enoch is placed at the sun''s gates, *where the sun goes forth according to the regulation of the seasons and the circuit of the months of the whole year* (2 Enoch 13:1), and shown *six gates open... through which the sun goes forth... thus the period of the whole year is finished after the returns of the four seasons* (2 Enoch 13:2). It ain''t new — the lights were set *for signs, and for seasons, and for days, and years* (Genesis 1:14) from the beginning. Enoch''s own Astronomical Book numbered the same gates: *And I saw six portals out of which the sun rises, and six portals in which the sun sets* (1 Enoch 72:3). The regulation of the seasons by the sun''s gates is the order Yahuah covenanted with day and night — *the ordinances of heaven and earth* (Jeremiah 33:25). The year is governed not by chance but by the appointed courses of the lights.',
       sv.verse_id, ev.verse_id, 'extras', 82300
  FROM _session411_2en13_lookup sv, _session411_2en13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-13-suns-gates-and-the-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The sun going forth by its gates to regulate the seasons and months of the year is the lights set from creation for signs and seasons.'
  FROM cross_reference_threads t, cross_references x, _session411_2en13_lookup sv, _session411_2en13_lookup tv
 WHERE t.slug='2-enoch-13-suns-gates-and-the-seasons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:25 — *Thus saith Yahuah; If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The whole year finished after the returns of the four seasons rests on the ordinances of heaven and earth Yahuah appointed.'
  FROM cross_reference_threads t, cross_references x, _session411_2en13_lookup sv, _session411_2en13_lookup tv
 WHERE t.slug='2-enoch-13-suns-gates-and-the-seasons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 72:3 — *And I saw six portals out of which the sun rises, and six portals in which the sun sets and the moon rises and sets in those portals.* The six gates of the sun Enoch measures here are the six portals his own Astronomical Book had already numbered.'
  FROM cross_reference_threads t, cross_references x, _session411_2en13_lookup sv, _session411_2en13_lookup tv
 WHERE t.slug='2-enoch-13-suns-gates-and-the-seasons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_14.sql (session411 2-enoch 14) -----
-- Source anchor: pseudepigrapha/2-enoch ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en14 (view _session411_2en14_lookup). Sort band base 82325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-14-western-gates-and-the-year
  ('pseudepigrapha', '2-enoch', 14, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The western gates counted by the days of the year are the lights appointed from creation for days and years.'),
  ('pseudepigrapha', '2-enoch', 14, 2, 'canon', 'psalms', 19, 6, 'free', E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun going down to the western gates and passing under the earth is the full circuit of the sun from one end of heaven to the other.'),
  ('pseudepigrapha', '2-enoch', 14, 2, 'enoch', '1-enoch', 72, 5, 'extras', E'1 Enoch 72:5 — *And the sun rises from that fourth portal, and sets in the fourth, the western one.* The sun''s descent through the western gates that Enoch is shown is the setting his own Astronomical Book had already recorded at the western portal.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-14-western-gates-and-the-year',
       E'The western gates — the sun draws away its light, the days of the year',
       E'At the western parts Enoch is shown gates *corresponding to the eastern gates, opposite to where the sun sets, according to the number of the days* of the year (2 Enoch 14:1), where the sun *goes down to the western gates, and draws away its light... under the earth* (2 Enoch 14:2). It ain''t new — the lights were appointed *for days, and years* (Genesis 1:14), and the Psalmist already traced the sun''s full arc: *His going forth is from the end of the heaven, and his circuit unto the ends of it* (Psalms 19:6). Enoch''s own Astronomical Book had marked the same setting: *And the sun rises from that fourth portal, and sets in the fourth, the western one* (1 Enoch 72:5). The sun''s evening descent and the counted days of the year are the ordered courses Yahuah set, not a secret of the seer''s own making.',
       sv.verse_id, ev.verse_id, 'extras', 82325
  FROM _session411_2en14_lookup sv, _session411_2en14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-14-western-gates-and-the-year
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The western gates counted by the days of the year are the lights appointed from creation for days and years.'
  FROM cross_reference_threads t, cross_references x, _session411_2en14_lookup sv, _session411_2en14_lookup tv
 WHERE t.slug='2-enoch-14-western-gates-and-the-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The sun going down to the western gates and passing under the earth is the full circuit of the sun from one end of heaven to the other.'
  FROM cross_reference_threads t, cross_references x, _session411_2en14_lookup sv, _session411_2en14_lookup tv
 WHERE t.slug='2-enoch-14-western-gates-and-the-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 72:5 — *And the sun rises from that fourth portal, and sets in the fourth, the western one.* The sun''s descent through the western gates that Enoch is shown is the setting his own Astronomical Book had already recorded at the western portal.'
  FROM cross_reference_threads t, cross_references x, _session411_2en14_lookup sv, _session411_2en14_lookup tv
 WHERE t.slug='2-enoch-14-western-gates-and-the-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_15.sql (session411 2-enoch 15) -----
-- Source anchor: pseudepigrapha/2-enoch ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en15 (view _session411_2en15_lookup). Sort band base 82350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-15-creation-sings-at-the-giver-of-light
  ('pseudepigrapha', '2-enoch', 15, 1, 'canon', 'psalms', 148, 3, 'free', E'Psalms 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The birds and elements breaking into song at sunrise join the Psalmist''s call for sun, moon and stars to praise their Maker.'),
  ('pseudepigrapha', '2-enoch', 15, 1, 'canon', 'psalms', 148, 5, 'free', E'Psalms 148:5 — *Let them praise the name of Yahuah: for he commanded, and they were created.* The song that breaks out at the command of Yahuah is the creation praising the One who commanded and they were made.'),
  ('pseudepigrapha', '2-enoch', 15, 2, 'canon', 'psalms', 19, 1, 'free', E'Psalms 19:1 — *The heavens declare the glory of Elohim; and the firmament sheweth his handywork.* The giver of light brightening the whole world, greeted with song, is the heavens declaring the glory of Elohim.'),
  -- thread: 2-enoch-15-gates-the-calculation-of-the-year
  ('pseudepigrapha', '2-enoch', 15, 3, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun called a great creation, governing the calculation of the year, is the greater of the two great lights Elohim made to rule the day.'),
  ('pseudepigrapha', '2-enoch', 15, 3, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah; If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The gates that govern the calculation of the hours of the year are the ordinances of heaven Yahuah appointed and keeps.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-15-creation-sings-at-the-giver-of-light',
       E'Every bird sings at the giver of light — creation''s praise',
       E'When the sun rises Enoch hears the creatures break into song: *every bird flutters with its wings, rejoicing at the giver of light, and they broke into song at the command of Yahuah* (2 Enoch 15:1); *The giver of light comes to give brightness to the whole world* (2 Enoch 15:2). It ain''t new — this is the Psalter''s call to the lights and the living to praise: *Praise ye him, sun and moon: praise him, all ye stars of light* (Psalms 148:3), *Let them praise the name of Yahuah: for he commanded, and they were created* (Psalms 148:5), naming *flying fowl* among the praisers (Psalms 148:10). The heavens themselves do it: *The heavens declare the glory of Elohim; and the firmament sheweth his handywork* (Psalms 19:1). The birds greeting the dawn are not worshipping the sun but rejoicing at its Giver — at the command of Yahuah, exactly as the Psalmist sings.',
       sv.verse_id, ev.verse_id, 'extras', 82350
  FROM _session411_2en15_lookup sv, _session411_2en15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-15-gates-the-calculation-of-the-year',
       E'The gates — the calculation of the hours of the year',
       E'Enoch is shown that the gates the sun enters *are the great gates of the calculation of the hours of the year; for this reason the sun is a great creation* (2 Enoch 15:3). It ain''t new — the sun is *a great creation* because Yahuah made it so: *And Elohim made two great lights; the greater light to rule the day* (Genesis 1:16), set *for signs, and for seasons, and for days, and years* (Genesis 1:14). The reckoning of the year''s hours by the sun''s gates rests on the covenant Yahuah keeps with the heavens: *If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25). The sun''s greatness is its faithfulness to an appointed reckoning — the calculation Moses'' first chapter set in motion.',
       sv.verse_id, ev.verse_id, 'extras', 82353
  FROM _session411_2en15_lookup sv, _session411_2en15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-15-creation-sings-at-the-giver-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The birds and elements breaking into song at sunrise join the Psalmist''s call for sun, moon and stars to praise their Maker.'
  FROM cross_reference_threads t, cross_references x, _session411_2en15_lookup sv, _session411_2en15_lookup tv
 WHERE t.slug='2-enoch-15-creation-sings-at-the-giver-of-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:5 — *Let them praise the name of Yahuah: for he commanded, and they were created.* The song that breaks out at the command of Yahuah is the creation praising the One who commanded and they were made.'
  FROM cross_reference_threads t, cross_references x, _session411_2en15_lookup sv, _session411_2en15_lookup tv
 WHERE t.slug='2-enoch-15-creation-sings-at-the-giver-of-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 19:1 — *The heavens declare the glory of Elohim; and the firmament sheweth his handywork.* The giver of light brightening the whole world, greeted with song, is the heavens declaring the glory of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en15_lookup sv, _session411_2en15_lookup tv
 WHERE t.slug='2-enoch-15-creation-sings-at-the-giver-of-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-15-gates-the-calculation-of-the-year
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun called a great creation, governing the calculation of the year, is the greater of the two great lights Elohim made to rule the day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en15_lookup sv, _session411_2en15_lookup tv
 WHERE t.slug='2-enoch-15-gates-the-calculation-of-the-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:25 — *Thus saith Yahuah; If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth.* The gates that govern the calculation of the hours of the year are the ordinances of heaven Yahuah appointed and keeps.'
  FROM cross_reference_threads t, cross_references x, _session411_2en15_lookup sv, _session411_2en15_lookup tv
 WHERE t.slug='2-enoch-15-gates-the-calculation-of-the-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_16.sql (session411 2-enoch 16) -----
-- Source anchor: pseudepigrapha/2-enoch ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en16 (view _session411_2en16_lookup). Sort band base 82375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-16-the-courses-of-the-moon
  ('pseudepigrapha', '2-enoch', 16, 1, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The moon''s course through twelve gates is the lesser light Elohim made to rule the night.'),
  ('pseudepigrapha', '2-enoch', 16, 1, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon going in and out of the customary times through its gates is the moon Yahuah appointed for seasons.'),
  ('pseudepigrapha', '2-enoch', 16, 2, 'enoch', '1-enoch', 74, 2, 'extras', E'1 Enoch 74:2 — *And the moon also rises and sets through these portals, and in the first portal her light is full on the fifteenth day...* The moon''s reckoning through its gates day by day is the lunar course Enoch''s own Astronomical Book had already set down through the portals.'),
  -- thread: 2-enoch-16-solar-and-lunar-year
  ('pseudepigrapha', '2-enoch', 16, 3, 'canon', 'jeremiah', 31, 35, 'free', E'Jeremiah 31:35 — *Thus saith Yahuah, which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night... Yahuah Tseva''ot is his name.* The solar and lunar reckonings Enoch is shown rest on the ordinances of the moon and stars Yahuah gives for a light by night.'),
  ('pseudepigrapha', '2-enoch', 16, 3, 'enoch', '1-enoch', 74, 11, 'extras', E'1 Enoch 74:11 — *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* The lunar year of 354 days lacking against the solar is the very deficiency Enoch''s own Astronomical Book reckoned.'),
  ('pseudepigrapha', '2-enoch', 16, 3, 'jubilees', 'jubilees', 6, 36, 'extras', E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon—now (it) disturbs the seasons and comes in from year to year ten days too soon.* The lunar shortfall against the solar year that Enoch measures is the drift Jubilees warns will disturb the appointed seasons.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-16-the-courses-of-the-moon',
       E'The courses of the moon — the lesser light for seasons',
       E'Now the moon''s turn: *the other course, that of the moon, twelve great gates, crowned from west to east, by which the moon goes in and out of the customary times* (2 Enoch 16:1), reckoned out month by month through its gates. It ain''t new — the moon is the lesser light Moses records, *the lesser light to rule the night* (Genesis 1:16), and the Psalmist''s appointed timekeeper: *He appointed the moon for seasons: the sun knoweth his going down* (Psalms 104:19). Enoch''s own Astronomical Book had already traced the moon''s portals: *And the moon also rises and sets through these portals, and in the first portal her light is full on the fifteenth day* (1 Enoch 74:2). The moon''s circuit through its gates is not augury; it is the lesser light keeping its appointed seasons as Moses and the Psalms declare.',
       sv.verse_id, ev.verse_id, 'extras', 82375
  FROM _session411_2en16_lookup sv, _session411_2en16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=16 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-16-solar-and-lunar-year',
       E'The solar year and the lunar year — the ordinances of the lights',
       E'Enoch is shown the two reckonings side by side: the moon *accomplishes the three hundred and sixty-five and a quarter days of the solar year, while the lunar year has three hundred fifty-four, and there are wanting to it twelve days* (2 Enoch 16:3), with longer cycles closing the gap. It ain''t new — the sun and moon keep distinct ordinances by Yahuah''s appointment: *which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35). Enoch''s own Astronomical Book had weighed the same difference: *the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days* (1 Enoch 74:11) — and Jubilees warns of the lunar drift: *now (it) disturbs the seasons and comes in from year to year ten days too soon* (Jubilees 6:36). The lights keep their separate counts by ordinance, not by chance.',
       sv.verse_id, ev.verse_id, 'extras', 82378
  FROM _session411_2en16_lookup sv, _session411_2en16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=16 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-16-the-courses-of-the-moon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The moon''s course through twelve gates is the lesser light Elohim made to rule the night.'
  FROM cross_reference_threads t, cross_references x, _session411_2en16_lookup sv, _session411_2en16_lookup tv
 WHERE t.slug='2-enoch-16-the-courses-of-the-moon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon going in and out of the customary times through its gates is the moon Yahuah appointed for seasons.'
  FROM cross_reference_threads t, cross_references x, _session411_2en16_lookup sv, _session411_2en16_lookup tv
 WHERE t.slug='2-enoch-16-the-courses-of-the-moon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 74:2 — *And the moon also rises and sets through these portals, and in the first portal her light is full on the fifteenth day...* The moon''s reckoning through its gates day by day is the lunar course Enoch''s own Astronomical Book had already set down through the portals.'
  FROM cross_reference_threads t, cross_references x, _session411_2en16_lookup sv, _session411_2en16_lookup tv
 WHERE t.slug='2-enoch-16-the-courses-of-the-moon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-16-solar-and-lunar-year
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:35 — *Thus saith Yahuah, which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night... Yahuah Tseva''ot is his name.* The solar and lunar reckonings Enoch is shown rest on the ordinances of the moon and stars Yahuah gives for a light by night.'
  FROM cross_reference_threads t, cross_references x, _session411_2en16_lookup sv, _session411_2en16_lookup tv
 WHERE t.slug='2-enoch-16-solar-and-lunar-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 74:11 — *And therefore the days are deficient in the intercalated months by thirty days, for the lunar year is three hundred and fifty-four days, and the solar year three hundred and sixty-four days.* The lunar year of 354 days lacking against the solar is the very deficiency Enoch''s own Astronomical Book reckoned.'
  FROM cross_reference_threads t, cross_references x, _session411_2en16_lookup sv, _session411_2en16_lookup tv
 WHERE t.slug='2-enoch-16-solar-and-lunar-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:36 — *For there will be those who will assuredly make observations of the moon—now (it) disturbs the seasons and comes in from year to year ten days too soon.* The lunar shortfall against the solar year that Enoch measures is the drift Jubilees warns will disturb the appointed seasons.'
  FROM cross_reference_threads t, cross_references x, _session411_2en16_lookup sv, _session411_2en16_lookup tv
 WHERE t.slug='2-enoch-16-solar-and-lunar-year'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_17.sql (session411 2-enoch 17) -----
-- Source anchor: pseudepigrapha/2-enoch ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en17 (view _session411_2en17_lookup). Sort band base 82400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-17-angelic-hosts-singing-before-yahuah
  ('pseudepigrapha', '2-enoch', 17, 1, 'canon', 'psalms', 148, 2, 'free', E'Psalms 148:2 — *Praise ye him, all his angels: praise ye him, all his hosts.* The angelic soldiers serving Yahuah with incessant song are the angels and hosts the Psalmist summons to praise.'),
  ('pseudepigrapha', '2-enoch', 17, 1, 'canon', 'psalms', 150, 4, 'free', E'Psalms 150:4 — *Praise him with the timbrel and dance: praise him with stringed instruments and organs.* The tympana and organs of the heavenly singers are the very instruments of praise the Psalter names for worship of Yahuah.'),
  ('pseudepigrapha', '2-enoch', 17, 1, 'canon', 'revelation', 5, 11, 'free', E'Revelation 5:11 — *And I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands.* The marvellous singing of the angelic host Enoch hears is the numberless choir John heard round about the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-17-angelic-hosts-singing-before-yahuah',
       E'The hosts of heaven singing before Yahuah',
       E'In the midst of the heavens Enoch sees ranked angels at worship: *armed soldiers, serving Yahuah, with tympana and organs, with incessant voice... so wonderful and marvellous is the singing of those angels* (2 Enoch 17:1). It ain''t new — the Psalter commands this very host: *Praise ye him, all his angels: praise ye him, all his hosts* (Psalms 148:2), and names the instruments of their praise: *Praise him with the timbrel and dance: praise him with stringed instruments and organs* (Psalms 150:4). John heard the same numberless choir: *I heard the voice of many angels round about the throne... and the number of them was ten thousand times ten thousand* (Revelation 5:11). The angels'' ceaseless song Enoch delights in is the worship the Scriptures already record before the throne — not a new heaven, but the host of the Psalms.',
       sv.verse_id, ev.verse_id, 'extras', 82400
  FROM _session411_2en17_lookup sv, _session411_2en17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=17 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-17-angelic-hosts-singing-before-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 148:2 — *Praise ye him, all his angels: praise ye him, all his hosts.* The angelic soldiers serving Yahuah with incessant song are the angels and hosts the Psalmist summons to praise.'
  FROM cross_reference_threads t, cross_references x, _session411_2en17_lookup sv, _session411_2en17_lookup tv
 WHERE t.slug='2-enoch-17-angelic-hosts-singing-before-yahuah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 150:4 — *Praise him with the timbrel and dance: praise him with stringed instruments and organs.* The tympana and organs of the heavenly singers are the very instruments of praise the Psalter names for worship of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en17_lookup sv, _session411_2en17_lookup tv
 WHERE t.slug='2-enoch-17-angelic-hosts-singing-before-yahuah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:11 — *And I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands.* The marvellous singing of the angelic host Enoch hears is the numberless choir John heard round about the throne.'
  FROM cross_reference_threads t, cross_references x, _session411_2en17_lookup sv, _session411_2en17_lookup tv
 WHERE t.slug='2-enoch-17-angelic-hosts-singing-before-yahuah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_18.sql (session411 2-enoch 18) -----
-- Source anchor: pseudepigrapha/2-enoch ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en18 (view _session411_2en18_lookup). Sort band base 82425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-18-grigori-descended-to-hermon
  ('pseudepigrapha', '2-enoch', 18, 3, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Grigori who saw the daughters of men and took to themselves wives are the sons of Elohim of Genesis 6.'),
  ('pseudepigrapha', '2-enoch', 18, 3, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants and marvellous big men born of the Grigori''s befouling are the giants Genesis records in those days.'),
  ('pseudepigrapha', '2-enoch', 18, 3, 'enoch', '1-enoch', 6, 6, 'extras', E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The descent to the place Ermon and the breaking of their vows on the hill is the very rebellion Enoch''s own book names on Mount Hermon.'),
  ('pseudepigrapha', '2-enoch', 18, 3, 'enoch', '1-enoch', 7, 2, 'extras', E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells.* The giants born of the Watchers'' union, Enoch''s own book records, are the marvellous big men 2 Enoch sees the Grigori condemned for.'),
  -- thread: 2-enoch-18-watchers-reserved-for-the-great-judgment
  ('pseudepigrapha', '2-enoch', 18, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The Grigori punished on Yahuah''s great day are the angels Jude says are reserved in chains under darkness for the judgment of the great day.'),
  ('pseudepigrapha', '2-enoch', 18, 5, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* The Watchers condemned to be under earth till heaven and earth end are the sinning angels Peter says were cast down and reserved unto judgment.'),
  ('pseudepigrapha', '2-enoch', 18, 5, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The sentence that the Grigori be kept under earth till the world''s end is the binding Enoch''s own book first pronounced upon the Watchers.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-18-grigori-descended-to-hermon',
       E'The Grigori descended to Hermon — sons of Elohim took wives',
       E'In the fifth heaven Enoch meets the mourning Grigori, and learns their fall: *three of them went down on to earth from Yahuah''s throne, to the place Ermon, and broke through their vows on the shoulder of the hill Ermon and saw the daughters of men how good they are, and took to themselves wives, and befouled the earth with their deeds... and giants are born* (2 Enoch 18:3). It ain''t new — this is Moses'' brief, terrible record: *the sons of Elohim saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), *There were giants in the earth in those days* (Genesis 6:4). Enoch''s own book names the rebellion in full: *the angels, the children of the heaven, saw and lusted after them* (1 Enoch 6:2), *who descended in the days of Yered on the summit of Mount Hermon* (1 Enoch 6:6), *and they bare great giants* (1 Enoch 7:2). The Watchers'' sin is no late legend; it is the very thing Genesis sets down before the flood.',
       sv.verse_id, ev.verse_id, 'extras', 82425
  FROM _session411_2en18_lookup sv, _session411_2en18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-18-watchers-reserved-for-the-great-judgment',
       E'The Watchers reserved under the earth for the great day',
       E'Enoch is told the Watchers'' sentence: *Elohim judged them with great judgment, and they weep for their brethren and they will be punished on Yahuah''s great day* (2 Enoch 18:4); *Yahuah has condemned them to be under earth till the existing heaven and earth shall end for ever* (2 Enoch 18:5). It ain''t new — the apostles preach this same reserved judgment: *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 6), and *Elohim spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Enoch''s own book pronounced the very sentence: *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12). The bound Watchers awaiting the great day are not 2 Enoch''s invention; Jude and Peter preach the same chains, and 1 Enoch first wrote them down.',
       sv.verse_id, ev.verse_id, 'extras', 82428
  FROM _session411_2en18_lookup sv, _session411_2en18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-18-grigori-descended-to-hermon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Grigori who saw the daughters of men and took to themselves wives are the sons of Elohim of Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session411_2en18_lookup sv, _session411_2en18_lookup tv
 WHERE t.slug='2-enoch-18-grigori-descended-to-hermon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants and marvellous big men born of the Grigori''s befouling are the giants Genesis records in those days.'
  FROM cross_reference_threads t, cross_references x, _session411_2en18_lookup sv, _session411_2en18_lookup tv
 WHERE t.slug='2-enoch-18-grigori-descended-to-hermon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The descent to the place Ermon and the breaking of their vows on the hill is the very rebellion Enoch''s own book names on Mount Hermon.'
  FROM cross_reference_threads t, cross_references x, _session411_2en18_lookup sv, _session411_2en18_lookup tv
 WHERE t.slug='2-enoch-18-grigori-descended-to-hermon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells.* The giants born of the Watchers'' union, Enoch''s own book records, are the marvellous big men 2 Enoch sees the Grigori condemned for.'
  FROM cross_reference_threads t, cross_references x, _session411_2en18_lookup sv, _session411_2en18_lookup tv
 WHERE t.slug='2-enoch-18-grigori-descended-to-hermon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-18-watchers-reserved-for-the-great-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The Grigori punished on Yahuah''s great day are the angels Jude says are reserved in chains under darkness for the judgment of the great day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en18_lookup sv, _session411_2en18_lookup tv
 WHERE t.slug='2-enoch-18-watchers-reserved-for-the-great-judgment'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* The Watchers condemned to be under earth till heaven and earth end are the sinning angels Peter says were cast down and reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session411_2en18_lookup sv, _session411_2en18_lookup tv
 WHERE t.slug='2-enoch-18-watchers-reserved-for-the-great-judgment'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The sentence that the Grigori be kept under earth till the world''s end is the binding Enoch''s own book first pronounced upon the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session411_2en18_lookup sv, _session411_2en18_lookup tv
 WHERE t.slug='2-enoch-18-watchers-reserved-for-the-great-judgment'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_19.sql (session411 2-enoch 19) -----
-- Source anchor: pseudepigrapha/2-enoch ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en19 (view _session411_2en19_lookup). Sort band base 82450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-19-ordered-ranks-recording-deeds
  ('pseudepigrapha', '2-enoch', 19, 3, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The angels who write all the deeds of men before His face in 2 Enoch 19:3 are the ministering thousands and the opened books Daniel saw at the throne.'),
  ('pseudepigrapha', '2-enoch', 19, 3, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The recording of every soul and deed in 2 Enoch 19:3 is the book of remembrance Malachi says is written before Him.'),
  ('pseudepigrapha', '2-enoch', 19, 1, 'canon', 'psalms', 103, 20, 'free', E'Psalms 103:20 — *Bless Yahuah (LORD), ye his angels, that excel in strength, that do his commandments, hearkening unto the voice of his word.* The bright ranks who make the orders and govern the world in 2 Enoch 19:1 are the strong angels the Psalm bids bless Him for doing His commandments.'),
  ('pseudepigrapha', '2-enoch', 19, 3, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six six-winged ones singing with one voice before His footstool in 2 Enoch 19:3 are the six-winged living creatures John saw resting not day or night.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-19-ordered-ranks-recording-deeds',
       E'The ordered angelic ranks who record the deeds of men',
       E'In the sixth heaven Enoch sees the angels set in ranks, ordering the lights and watching over the world: among them *the angels who write all the souls of men, and all their deeds, and their lives before Yahuah''s (Lord''s) face* (2 Enoch 19:3). This is no new invention — the prophets already saw the recording host before the throne. Daniel watched *the judgment was set, and the books were opened* (Daniel 7:10), and Malachi names the very ledger: *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16). And these angels who measure life and govern seasons are the same hosts the Psalm bids bless their Maker: *Bless Yahuah (LORD), ye his angels, that excel in strength, that do his commandments, hearkening unto the voice of his word* (Psalms 103:20). It ain''t new — the angels who write before His face are the angels Moses, David, and the prophets already knew.',
       sv.verse_id, ev.verse_id, 'extras', 82450
  FROM _session411_2en19_lookup sv, _session411_2en19_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=19 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-19-ordered-ranks-recording-deeds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The angels who write all the deeds of men before His face in 2 Enoch 19:3 are the ministering thousands and the opened books Daniel saw at the throne.'
  FROM cross_reference_threads t, cross_references x, _session411_2en19_lookup sv, _session411_2en19_lookup tv
 WHERE t.slug='2-enoch-19-ordered-ranks-recording-deeds'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The recording of every soul and deed in 2 Enoch 19:3 is the book of remembrance Malachi says is written before Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en19_lookup sv, _session411_2en19_lookup tv
 WHERE t.slug='2-enoch-19-ordered-ranks-recording-deeds'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 103:20 — *Bless Yahuah (LORD), ye his angels, that excel in strength, that do his commandments, hearkening unto the voice of his word.* The bright ranks who make the orders and govern the world in 2 Enoch 19:1 are the strong angels the Psalm bids bless Him for doing His commandments.'
  FROM cross_reference_threads t, cross_references x, _session411_2en19_lookup sv, _session411_2en19_lookup tv
 WHERE t.slug='2-enoch-19-ordered-ranks-recording-deeds'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six six-winged ones singing with one voice before His footstool in 2 Enoch 19:3 are the six-winged living creatures John saw resting not day or night.'
  FROM cross_reference_threads t, cross_references x, _session411_2en19_lookup sv, _session411_2en19_lookup tv
 WHERE t.slug='2-enoch-19-ordered-ranks-recording-deeds'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_20.sql (session411 2-enoch 20) -----
-- Source anchor: pseudepigrapha/2-enoch ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en20 (view _session411_2en20_lookup). Sort band base 82475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-20-cherubim-seraphim-thrones-dominions
  ('pseudepigrapha', '2-enoch', 20, 1, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The thrones, dominions, orders and governments Enoch sees in 2 Enoch 20:1 are the very ranks Paul names among the things created by Him.'),
  ('pseudepigrapha', '2-enoch', 20, 1, 'canon', 'ezekiel', 1, 18, 'free', E'Ezekiel 1:18 — *As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* The many-eyed ones among the cherubim in 2 Enoch 20:1 are the living creatures Ezekiel saw, full of eyes round about.'),
  ('pseudepigrapha', '2-enoch', 20, 4, 'canon', 'psalms', 103, 21, 'free', E'Psalms 103:21 — *Bless ye Yahuah (LORD), all ye his hosts; ye ministers of his, that do his pleasure.* The heavenly troops that bow according to their rank and serve Him gloriously in 2 Enoch 20:4 are the ministering hosts the Psalm calls to do His pleasure.'),
  ('pseudepigrapha', '2-enoch', 20, 1, 'enoch', '1-enoch', 61, 10, 'extras', E'1 Enoch 61:10 — *And He will summon all the host of the heavens, and all the holy ones above, and the host of Elohim (God), the Cherubim, Seraphim and Ophanim, and all the angels of power, and all the angels of principalities... on that day.* The cherubim, seraphim, and ordered powers of 2 Enoch 20:1 are the same summoned host the elder Enoch names before the throne of glory.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-20-cherubim-seraphim-thrones-dominions',
       E'Cherubim and seraphim, thrones and dominions before the light',
       E'Borne to the seventh heaven, Enoch sees the full muster of the host: *fiery troops of great archangels, incorporeal forces, and dominions, orders and governments, cherubim and seraphim, thrones and many-eyed ones* (2 Enoch 20:1). This is the very ordering the apostle names of the unseen creation — *whether they be thrones, or dominions, or principalities, or powers: all things were created by him* (Colossians 1:16). The many-eyed ones standing in their ranks are Ezekiel''s living creatures, *their rings were full of eyes round about them four* (Ezekiel 1:18), and the troops that come and bow according to their rank are the hosts the Psalm sends to serve: *Bless ye Yahuah (LORD), all ye his hosts; ye ministers of his, that do his pleasure* (Psalms 103:21). It ain''t new — the orders, dominions, and many-eyed ones are the heavenly company Ezekiel saw and Paul confessed His handiwork.',
       sv.verse_id, ev.verse_id, 'extras', 82475
  FROM _session411_2en20_lookup sv, _session411_2en20_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=20 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-20-cherubim-seraphim-thrones-dominions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The thrones, dominions, orders and governments Enoch sees in 2 Enoch 20:1 are the very ranks Paul names among the things created by Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en20_lookup sv, _session411_2en20_lookup tv
 WHERE t.slug='2-enoch-20-cherubim-seraphim-thrones-dominions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:18 — *As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* The many-eyed ones among the cherubim in 2 Enoch 20:1 are the living creatures Ezekiel saw, full of eyes round about.'
  FROM cross_reference_threads t, cross_references x, _session411_2en20_lookup sv, _session411_2en20_lookup tv
 WHERE t.slug='2-enoch-20-cherubim-seraphim-thrones-dominions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 103:21 — *Bless ye Yahuah (LORD), all ye his hosts; ye ministers of his, that do his pleasure.* The heavenly troops that bow according to their rank and serve Him gloriously in 2 Enoch 20:4 are the ministering hosts the Psalm calls to do His pleasure.'
  FROM cross_reference_threads t, cross_references x, _session411_2en20_lookup sv, _session411_2en20_lookup tv
 WHERE t.slug='2-enoch-20-cherubim-seraphim-thrones-dominions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 61:10 — *And He will summon all the host of the heavens, and all the holy ones above, and the host of Elohim (God), the Cherubim, Seraphim and Ophanim, and all the angels of power, and all the angels of principalities... on that day.* The cherubim, seraphim, and ordered powers of 2 Enoch 20:1 are the same summoned host the elder Enoch names before the throne of glory.'
  FROM cross_reference_threads t, cross_references x, _session411_2en20_lookup sv, _session411_2en20_lookup tv
 WHERE t.slug='2-enoch-20-cherubim-seraphim-thrones-dominions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=61 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_21.sql (session411 2-enoch 21) -----
-- Source anchor: pseudepigrapha/2-enoch ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en21 (view _session411_2en21_lookup). Sort band base 82500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-21-holy-holy-holy-before-the-throne
  ('pseudepigrapha', '2-enoch', 21, 1, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim''s song in 2 Enoch 21:1, "Holy, holy, holy... heavens and earth are full of Your glory," is the very cry Isaiah heard in the temple.'),
  ('pseudepigrapha', '2-enoch', 21, 1, 'canon', 'isaiah', 6, 2, 'free', E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* The six-winged ones covering the throne in 2 Enoch 21:1 are Isaiah''s six-winged seraphim standing above it.'),
  ('pseudepigrapha', '2-enoch', 21, 1, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six-winged, many-eyed ones who never depart, singing the sanctus in 2 Enoch 21:1, are the living creatures John heard resting not day or night.'),
  -- thread: 2-enoch-21-fell-on-his-face-glorious-one-sent
  ('pseudepigrapha', '2-enoch', 21, 3, 'canon', 'ezekiel', 1, 28, 'free', E'Ezekiel 1:28 — *...This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Enoch falling on his face in dread at the throne in 2 Enoch 21:3 is Ezekiel''s own fall before the likeness of the glory of Yahuah.'),
  ('pseudepigrapha', '2-enoch', 21, 4, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *...thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The glorious one Gabriel sent to raise Enoch in 2 Enoch 21:4 is one of the ministering thousands Daniel saw before the throne — the same Gabriel who later strengthens him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-21-holy-holy-holy-before-the-throne',
       E'Holy, holy, holy — the seraphim about the throne',
       E'The cherubim and seraphim never leave their place: *standing before Yahuah''s (Lord''s) face doing his will, and cover his whole throne, singing with gentle voice... Holy, holy, holy, Yahuah (Lord) Ruler of Sabaoth, heavens and earth are full of Your glory* (2 Enoch 21:1). This is word for word the song Isaiah heard in the temple — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3) — and the unceasing praise John heard at the throne: *they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty* (Revelation 4:8). The very six wings the seraphim bear are Isaiah''s own: *each one had six wings* (Isaiah 6:2). It ain''t new — the threefold sanctus Enoch hears in the seventh heaven is the cry Isaiah and John both set down.',
       sv.verse_id, ev.verse_id, 'extras', 82500
  FROM _session411_2en21_lookup sv, _session411_2en21_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=21 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-21-fell-on-his-face-glorious-one-sent',
       E'Enoch falls on his face; a glorious one is sent to him',
       E'Left alone at the end of the seventh heaven, the seer is overcome: *I... fell on my face and said to myself: Woe is me, what has befallen me?* (2 Enoch 21:3), until *Yahuah (Lord) sent one of his glorious ones, the archangel Gabriel* (2 Enoch 21:4) to raise and bring him on. This is the prophets'' own posture before the glory. Ezekiel, seeing the likeness of the glory of Yahuah, *fell upon my face, and I heard a voice of one that spake* (Ezekiel 1:28); and Daniel, who saw the same Gabriel, was strengthened by the heavenly messenger when terror had unmanned him. Enoch here is the trembling, honored seer — not a divine figure, but a man lifted by a sent angel. It ain''t new — the dread and the strengthening hand are Ezekiel''s and Daniel''s before him.',
       sv.verse_id, ev.verse_id, 'extras', 82503
  FROM _session411_2en21_lookup sv, _session411_2en21_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-21-holy-holy-holy-before-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim''s song in 2 Enoch 21:1, "Holy, holy, holy... heavens and earth are full of Your glory," is the very cry Isaiah heard in the temple.'
  FROM cross_reference_threads t, cross_references x, _session411_2en21_lookup sv, _session411_2en21_lookup tv
 WHERE t.slug='2-enoch-21-holy-holy-holy-before-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* The six-winged ones covering the throne in 2 Enoch 21:1 are Isaiah''s six-winged seraphim standing above it.'
  FROM cross_reference_threads t, cross_references x, _session411_2en21_lookup sv, _session411_2en21_lookup tv
 WHERE t.slug='2-enoch-21-holy-holy-holy-before-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six-winged, many-eyed ones who never depart, singing the sanctus in 2 Enoch 21:1, are the living creatures John heard resting not day or night.'
  FROM cross_reference_threads t, cross_references x, _session411_2en21_lookup sv, _session411_2en21_lookup tv
 WHERE t.slug='2-enoch-21-holy-holy-holy-before-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-21-fell-on-his-face-glorious-one-sent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:28 — *...This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Enoch falling on his face in dread at the throne in 2 Enoch 21:3 is Ezekiel''s own fall before the likeness of the glory of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en21_lookup sv, _session411_2en21_lookup tv
 WHERE t.slug='2-enoch-21-fell-on-his-face-glorious-one-sent'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *...thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The glorious one Gabriel sent to raise Enoch in 2 Enoch 21:4 is one of the ministering thousands Daniel saw before the throne — the same Gabriel who later strengthens him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en21_lookup sv, _session411_2en21_lookup tv
 WHERE t.slug='2-enoch-21-fell-on-his-face-glorious-one-sent'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_22.sql (session411 2-enoch 22) -----
-- Source anchor: pseudepigrapha/2-enoch ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en22 (view _session411_2en22_lookup). Sort band base 82525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-22-appearance-of-the-face-like-fire
  ('pseudepigrapha', '2-enoch', 22, 1, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The face like glowing iron emitting sparks in 2 Enoch 22:1 is the fiery-flamed throne of the Ancient of days Daniel saw.'),
  ('pseudepigrapha', '2-enoch', 22, 1, 'canon', 'ezekiel', 1, 27, 'free', E'Ezekiel 1:27 — *And I saw as the colour of amber, as the appearance of fire round about within it... I saw as it were the appearance of fire, and it had brightness round about.* The burning appearance of the face in 2 Enoch 22:1 is the fire and brightness round about that Ezekiel saw of the glory.'),
  ('pseudepigrapha', '2-enoch', 22, 3, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *...thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The troops of cherubim and seraphim standing round Him whose number Enoch cannot tell in 2 Enoch 22:3 are the ministering thousands Daniel counted before the throne.'),
  -- thread: 2-enoch-22-stripped-and-clothed-in-garments-of-glory
  ('pseudepigrapha', '2-enoch', 22, 9, 'canon', '2-corinthians', 3, 18, 'free', E'2 Corinthians 3:18 — *But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord).* Enoch made like one of the glorious ones in 2 Enoch 22:9 is the changing from glory to glory Paul says comes to all who behold Him.'),
  ('pseudepigrapha', '2-enoch', 22, 9, 'canon', 'philippians', 3, 21, 'free', E'Philippians 3:21 — *Who shall change our vile body, that it may be fashioned like unto his glorious body, according to the working whereby he is able even to subdue all things unto himself.* The earthly garments stripped and the body made glorious in 2 Enoch 22:8-9 are the changing of the vile body into His glorious likeness Paul promises.'),
  ('pseudepigrapha', '2-enoch', 22, 8, 'canon', 'zechariah', 3, 4, 'free', E'Zechariah 3:4 — *...Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* Michael taking Enoch out of his earthly garments and clothing him in glory in 2 Enoch 22:8 is the stripping and re-robing of Joshua the priest before the angel.'),
  ('pseudepigrapha', '2-enoch', 22, 9, 'canon', 'exodus', 34, 29, 'free', E'Exodus 34:29 — *...when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* The anointing that made Enoch shine like the sun''s ray in 2 Enoch 22:9 is the shining Moses bore after speaking with Yahuah on the mount — an honored man transfigured, not deified.'),
  ('pseudepigrapha', '2-enoch', 22, 9, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *...a great multitude, which no man could number... stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands.* The garments of glory put on Enoch in 2 Enoch 22:8 are the white robes of the multitude John saw standing before the throne.'),
  ('pseudepigrapha', '2-enoch', 22, 9, 'enoch', '1-enoch', 71, 1, 'extras', E'1 Enoch 71:1 — *...And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white, and their raiment, And their faces shone like snow.* Enoch made like one of the glorious ones in 2 Enoch 22:9 echoes the elder Enoch''s own ascent, where the holy ones wore white raiment and shone like snow.'),
  -- thread: 2-enoch-22-pravuil-bring-out-the-books
  ('pseudepigrapha', '2-enoch', 22, 10, 'canon', 'revelation', 5, 1, 'free', E'Revelation 5:1 — *And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals.* The books brought out of His store-houses and given to Enoch in 2 Enoch 22:10 are the throne-side book John saw in the hand of Him that sat.'),
  ('pseudepigrapha', '2-enoch', 22, 10, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *...the judgment was set, and the books were opened.* The store-house of books from which Enoch is to write in 2 Enoch 22:10 is the heavenly library Daniel saw opened in the court of the Ancient of days.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-22-appearance-of-the-face-like-fire',
       E'The appearance of the face, like iron glowing in fire',
       E'Brought to the highest heaven, Enoch sees what he cannot describe: *I saw the appearance of Yahuah''s (Lord''s) face, like iron made to glow in fire, and brought out, emitting sparks, and it burns* (2 Enoch 22:1), and he *fell prone and bowed down* (2 Enoch 22:4). This is the fiery throne the prophets saw and lived. Daniel beheld the Ancient of days, *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9); Ezekiel saw *the colour of amber, as the appearance of fire round about within it... and it had brightness round about* (Ezekiel 1:27). Enoch''s confession that the face is *ineffable* and that he cannot tell the host *standing round him, troops of cherubim and seraphim* (2 Enoch 22:3) is the same uncountable ministry Daniel numbered. It ain''t new — the burning face and the surrounding host are the throne-vision Daniel and Ezekiel already bore.',
       sv.verse_id, ev.verse_id, 'extras', 82525
  FROM _session411_2en22_lookup sv, _session411_2en22_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=22 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-22-stripped-and-clothed-in-garments-of-glory',
       E'Stripped of earthly garments, clothed in the garments of glory',
       E'At the Lord''s word *the archistratege Michael* takes Enoch *out of his earthly garments, and anoint[s] him with... sweet ointment, and put[s] him into the garments of My glory* (2 Enoch 22:8), and the seer testifies *I looked at myself, and I was like one of his glorious ones* (2 Enoch 22:9). This is no deifying of a man — it is the change scripture promises every servant who stands before the glory. Moses came down with a shining face after speaking with Yahuah (Exodus 34:29); Joshua the priest was stripped and re-robed before the angel — *Take away the filthy garments from him... I will clothe thee with change of raiment* (Zechariah 3:4); and the redeemed are seen *clothed with white robes* before the throne (Revelation 7:9). The apostle names the very transformation: *we all, with open face beholding... the glory of Yahuah (Lord), are changed into the same image from glory to glory* (2 Corinthians 3:18), and He *shall change our vile body, that it may be fashioned like unto his glorious body* (Philippians 3:21). It ain''t new — Enoch re-robed in glory is the honored seer transfigured as Moses, Joshua, and every saint shall be.',
       sv.verse_id, ev.verse_id, 'extras', 82528
  FROM _session411_2en22_lookup sv, _session411_2en22_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=22 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-22-pravuil-bring-out-the-books',
       E'Pravuil brings out the books and the reed of quick-writing',
       E'The Lord summons the archangel *who wrote all the deeds of Yahuah (Lord)* and bids him *Bring out the books from my store-houses, and a reed of quick-writing, and give it to Enoch* (2 Enoch 22:10). The heavenly books and the recording scribe are already scripture''s furniture. John saw *in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals* (Revelation 5:1), and Daniel saw the court where *the books were opened* (Daniel 7:10). It ain''t new — the store-house of books and the swift reed handed to the seer are the written witness the canon keeps before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 82531
  FROM _session411_2en22_lookup sv, _session411_2en22_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=22 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-22-appearance-of-the-face-like-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The face like glowing iron emitting sparks in 2 Enoch 22:1 is the fiery-flamed throne of the Ancient of days Daniel saw.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-appearance-of-the-face-like-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:27 — *And I saw as the colour of amber, as the appearance of fire round about within it... I saw as it were the appearance of fire, and it had brightness round about.* The burning appearance of the face in 2 Enoch 22:1 is the fire and brightness round about that Ezekiel saw of the glory.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-appearance-of-the-face-like-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:10 — *...thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The troops of cherubim and seraphim standing round Him whose number Enoch cannot tell in 2 Enoch 22:3 are the ministering thousands Daniel counted before the throne.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-appearance-of-the-face-like-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-22-stripped-and-clothed-in-garments-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 3:18 — *But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord).* Enoch made like one of the glorious ones in 2 Enoch 22:9 is the changing from glory to glory Paul says comes to all who behold Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-stripped-and-clothed-in-garments-of-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 3:21 — *Who shall change our vile body, that it may be fashioned like unto his glorious body, according to the working whereby he is able even to subdue all things unto himself.* The earthly garments stripped and the body made glorious in 2 Enoch 22:8-9 are the changing of the vile body into His glorious likeness Paul promises.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-stripped-and-clothed-in-garments-of-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 3:4 — *...Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* Michael taking Enoch out of his earthly garments and clothing him in glory in 2 Enoch 22:8 is the stripping and re-robing of Joshua the priest before the angel.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-stripped-and-clothed-in-garments-of-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:29 — *...when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* The anointing that made Enoch shine like the sun''s ray in 2 Enoch 22:9 is the shining Moses bore after speaking with Yahuah on the mount — an honored man transfigured, not deified.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-stripped-and-clothed-in-garments-of-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 7:9 — *...a great multitude, which no man could number... stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands.* The garments of glory put on Enoch in 2 Enoch 22:8 are the white robes of the multitude John saw standing before the throne.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-stripped-and-clothed-in-garments-of-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 71:1 — *...And I saw the holy sons of Elohim (God). They were stepping on flames of fire: Their garments were white, and their raiment, And their faces shone like snow.* Enoch made like one of the glorious ones in 2 Enoch 22:9 echoes the elder Enoch''s own ascent, where the holy ones wore white raiment and shone like snow.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-stripped-and-clothed-in-garments-of-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=71 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-22-pravuil-bring-out-the-books
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 5:1 — *And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals.* The books brought out of His store-houses and given to Enoch in 2 Enoch 22:10 are the throne-side book John saw in the hand of Him that sat.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-pravuil-bring-out-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *...the judgment was set, and the books were opened.* The store-house of books from which Enoch is to write in 2 Enoch 22:10 is the heavenly library Daniel saw opened in the court of the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _session411_2en22_lookup sv, _session411_2en22_lookup tv
 WHERE t.slug='2-enoch-22-pravuil-bring-out-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_23.sql (session411 2-enoch 23) -----
-- Source anchor: pseudepigrapha/2-enoch ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en23 (view _session411_2en23_lookup). Sort band base 82550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-23-sit-and-write-the-souls-of-mankind
  ('pseudepigrapha', '2-enoch', 23, 2, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *...and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Enoch writing all the souls and the places prepared for them in 2 Enoch 23:2 is the book of remembrance Malachi says is written before Him.'),
  ('pseudepigrapha', '2-enoch', 23, 3, 'canon', 'exodus', 24, 4, 'free', E'Exodus 24:4 — *And Moses wrote all the words of Yahuah (LORD), and rose up early in the morning, and builded an altar under the hill, and twelve pillars, according to the twelve tribes of Yashar''el (Israel).* Enoch writing out all things exactly in 2 Enoch 23:3 stands in the line of Moses, who wrote all the words of Yahuah.'),
  ('pseudepigrapha', '2-enoch', 23, 2, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *...the judgment was set, and the books were opened.* The places prepared to eternity for every soul that Enoch writes in 2 Enoch 23:2 are recorded in the same heavenly books Daniel saw opened at the judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-23-sit-and-write-the-souls-of-mankind',
       E'Sit and write — the souls and the books of remembrance',
       E'The archangel teaches Enoch the works of heaven and earth, then sets him to the scribe''s task: *Sit and write all the souls of mankind, however many of them are born, and the places prepared for them to eternity* (2 Enoch 23:2), so that *I wrote out all things exactly* (2 Enoch 23:3). The three hundred and sixty-six books are the apocalypse''s own embellishment, but the root is scripture''s: that what is feared and done before Yahuah is written down. Malachi names the ledger — *a book of remembrance was written before him for them that feared Yahuah (LORD)* (Malachi 3:16); and Moses himself was a scribe who *wrote all the words of Yahuah (LORD)* (Exodus 24:4). It ain''t new — Enoch set to write before the throne stands in the line of Moses with the pen and the book of remembrance.',
       sv.verse_id, ev.verse_id, 'extras', 82550
  FROM _session411_2en23_lookup sv, _session411_2en23_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=23 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=23 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-23-sit-and-write-the-souls-of-mankind
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *...and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Enoch writing all the souls and the places prepared for them in 2 Enoch 23:2 is the book of remembrance Malachi says is written before Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en23_lookup sv, _session411_2en23_lookup tv
 WHERE t.slug='2-enoch-23-sit-and-write-the-souls-of-mankind'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:4 — *And Moses wrote all the words of Yahuah (LORD), and rose up early in the morning, and builded an altar under the hill, and twelve pillars, according to the twelve tribes of Yashar''el (Israel).* Enoch writing out all things exactly in 2 Enoch 23:3 stands in the line of Moses, who wrote all the words of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en23_lookup sv, _session411_2en23_lookup tv
 WHERE t.slug='2-enoch-23-sit-and-write-the-souls-of-mankind'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:10 — *...the judgment was set, and the books were opened.* The places prepared to eternity for every soul that Enoch writes in 2 Enoch 23:2 are recorded in the same heavenly books Daniel saw opened at the judgment.'
  FROM cross_reference_threads t, cross_references x, _session411_2en23_lookup sv, _session411_2en23_lookup tv
 WHERE t.slug='2-enoch-23-sit-and-write-the-souls-of-mankind'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_24.sql (session411 2-enoch 24) -----
-- Source anchor: pseudepigrapha/2-enoch ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en24 (view _session411_2en24_lookup). Sort band base 82575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-24-created-from-non-being-visible-from-invisible
  ('pseudepigrapha', '2-enoch', 24, 2, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* God creating the visible from the invisible in 2 Enoch 24:2 is the worlds framed by His word, the seen not made of things which appear.'),
  ('pseudepigrapha', '2-enoch', 24, 2, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *...even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Creating all from non-being in 2 Enoch 24:2 is the God Paul names who calls the things that be not as though they were.'),
  ('pseudepigrapha', '2-enoch', 24, 2, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* That He alone made all the visible things in 2 Enoch 24:2 is the witness of John, that all things were made by Him.'),
  ('pseudepigrapha', '2-enoch', 24, 4, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him.* The making of visible from invisible in 2 Enoch 24:4 is the creating of things visible and invisible Paul confesses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-24-created-from-non-being-visible-from-invisible',
       E'All things created from non-being, the visible from the invisible',
       E'The Lord begins to open the secret of creation to His seer: *all that I created from non-being, and visible things from invisible* (2 Enoch 24:2), a thing told not even to the angels (2 Enoch 24:3). This is the apostles'' own confession of the making. By faith *the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3); the God *who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17); and *all things were made by him; and without him was not any thing made that was made* (John 1:3). It ain''t new — that He made the visible from the invisible, the something from nothing, is what Hebrews, Paul, and John already declare.',
       sv.verse_id, ev.verse_id, 'extras', 82575
  FROM _session411_2en24_lookup sv, _session411_2en24_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=24 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-24-created-from-non-being-visible-from-invisible
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* God creating the visible from the invisible in 2 Enoch 24:2 is the worlds framed by His word, the seen not made of things which appear.'
  FROM cross_reference_threads t, cross_references x, _session411_2en24_lookup sv, _session411_2en24_lookup tv
 WHERE t.slug='2-enoch-24-created-from-non-being-visible-from-invisible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 4:17 — *...even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Creating all from non-being in 2 Enoch 24:2 is the God Paul names who calls the things that be not as though they were.'
  FROM cross_reference_threads t, cross_references x, _session411_2en24_lookup sv, _session411_2en24_lookup tv
 WHERE t.slug='2-enoch-24-created-from-non-being-visible-from-invisible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* That He alone made all the visible things in 2 Enoch 24:2 is the witness of John, that all things were made by Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en24_lookup sv, _session411_2en24_lookup tv
 WHERE t.slug='2-enoch-24-created-from-non-being-visible-from-invisible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him.* The making of visible from invisible in 2 Enoch 24:4 is the creating of things visible and invisible Paul confesses.'
  FROM cross_reference_threads t, cross_references x, _session411_2en24_lookup sv, _session411_2en24_lookup tv
 WHERE t.slug='2-enoch-24-created-from-non-being-visible-from-invisible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_25.sql (session411 2-enoch 25) -----
-- Source anchor: pseudepigrapha/2-enoch ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en25 (view _session411_2en25_lookup). Sort band base 82600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-25-let-the-visible-come-out-light-from-light
  ('pseudepigrapha', '2-enoch', 25, 3, 'canon', 'genesis', 1, 3, 'free', E'Genesis 1:3 — *And Elohim (God) said, Let there be light: and there was light.* The great light commanded to come out of the invisible in 2 Enoch 25:2-3 is the light Elohim called forth on the first day.'),
  ('pseudepigrapha', '2-enoch', 25, 4, 'canon', 'genesis', 1, 4, 'free', E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* Enoch''s record that "I saw that it was good" in 2 Enoch 25:4 is the very verdict Moses sets down over the first light.'),
  ('pseudepigrapha', '2-enoch', 25, 2, 'canon', 'psalms', 33, 9, 'free', E'Psalms 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* The visible coming out of the invisible at the Lord''s spoken command in 2 Enoch 25:2 is the spoken creation of the Psalm: He spake, and it was done.'),
  ('pseudepigrapha', '2-enoch', 25, 3, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The great light and the age that came forth from the invisible in 2 Enoch 25:3 are the worlds framed by His word, the seen not made of things which appear.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-25-let-the-visible-come-out-light-from-light',
       E'Let the visible come out — a great light at the word',
       E'The Lord commands the visible to come forth from the invisible, and at His word the light breaks out: *let the visible come out of you... and a great light came out... there came forth a great age, and showed all creation* (2 Enoch 25:2-3), and *I saw that it was good* (2 Enoch 25:4). Under the named figure of Adoil the apocalypse reaches for the first morning of Genesis, where *Elohim (God) said, Let there be light: and there was light* (Genesis 1:3), and where God *saw the light, that it was good*. The Psalm sets down the same word-and-deed making: *By the word of Yahuah (LORD) were the heavens made... For he spake, and it was done; he commanded, and it stood fast* (Psalms 33:6,9). It ain''t new — light coming forth at His command, and pronounced good, is Moses'' own account of the first day.',
       sv.verse_id, ev.verse_id, 'extras', 82600
  FROM _session411_2en25_lookup sv, _session411_2en25_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=25 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-25-let-the-visible-come-out-light-from-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:3 — *And Elohim (God) said, Let there be light: and there was light.* The great light commanded to come out of the invisible in 2 Enoch 25:2-3 is the light Elohim called forth on the first day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en25_lookup sv, _session411_2en25_lookup tv
 WHERE t.slug='2-enoch-25-let-the-visible-come-out-light-from-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* Enoch''s record that "I saw that it was good" in 2 Enoch 25:4 is the very verdict Moses sets down over the first light.'
  FROM cross_reference_threads t, cross_references x, _session411_2en25_lookup sv, _session411_2en25_lookup tv
 WHERE t.slug='2-enoch-25-let-the-visible-come-out-light-from-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=25 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* The visible coming out of the invisible at the Lord''s spoken command in 2 Enoch 25:2 is the spoken creation of the Psalm: He spake, and it was done.'
  FROM cross_reference_threads t, cross_references x, _session411_2en25_lookup sv, _session411_2en25_lookup tv
 WHERE t.slug='2-enoch-25-let-the-visible-come-out-light-from-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=25 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The great light and the age that came forth from the invisible in 2 Enoch 25:3 are the worlds framed by His word, the seen not made of things which appear.'
  FROM cross_reference_threads t, cross_references x, _session411_2en25_lookup sv, _session411_2en25_lookup tv
 WHERE t.slug='2-enoch-25-let-the-visible-come-out-light-from-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_26.sql (session411 2-enoch 26) -----
-- Source anchor: pseudepigrapha/2-enoch ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en26 (view _session411_2en26_lookup). Sort band base 82625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-26-foundation-for-the-lower-things-from-the-invisible
  ('pseudepigrapha', '2-enoch', 26, 3, 'canon', 'genesis', 1, 2, 'free', E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The great, dark age that came forth bearing the lower creation in 2 Enoch 26:3 is the formless, dark deep at the beginning of Moses'' account.'),
  ('pseudepigrapha', '2-enoch', 26, 1, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *...even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Archas called forth hard from the invisible in 2 Enoch 26:1 is the God Paul names who calls the things that be not as though they were.'),
  ('pseudepigrapha', '2-enoch', 26, 4, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* The lower foundation made firm to uphold the lower things in 2 Enoch 26:4 is the holding-together of all things by Him that Paul confesses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-26-foundation-for-the-lower-things-from-the-invisible',
       E'A foundation for the lower things, called forth from the invisible',
       E'Now the Lord summons the lower creation, *Let Archas come forth hard, and he came forth hard from the invisible* (2 Enoch 26:1), and bids it *be a foundation for the lower things* (2 Enoch 26:4). Under this named figure the apocalypse reaches for the second movement of Genesis — the dark deep before the dividing, *the earth was without form, and void; and darkness was upon the face of the deep* (Genesis 1:2) — and for the laying of the world''s foundations that Yahuah pressed upon Job and that the apostle confesses of the Maker: *by him all things consist* (Colossians 1:17). That He calls forth even the lower, dark foundation from the invisible is Paul''s God *who... calleth those things which be not as though they were* (Romans 4:17). It ain''t new — the dark foundation summoned from nothing and made firm is the deep of Genesis and the upholding word of the apostles.',
       sv.verse_id, ev.verse_id, 'extras', 82625
  FROM _session411_2en26_lookup sv, _session411_2en26_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=26 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-26-foundation-for-the-lower-things-from-the-invisible
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The great, dark age that came forth bearing the lower creation in 2 Enoch 26:3 is the formless, dark deep at the beginning of Moses'' account.'
  FROM cross_reference_threads t, cross_references x, _session411_2en26_lookup sv, _session411_2en26_lookup tv
 WHERE t.slug='2-enoch-26-foundation-for-the-lower-things-from-the-invisible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=26 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 4:17 — *...even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Archas called forth hard from the invisible in 2 Enoch 26:1 is the God Paul names who calls the things that be not as though they were.'
  FROM cross_reference_threads t, cross_references x, _session411_2en26_lookup sv, _session411_2en26_lookup tv
 WHERE t.slug='2-enoch-26-foundation-for-the-lower-things-from-the-invisible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* The lower foundation made firm to uphold the lower things in 2 Enoch 26:4 is the holding-together of all things by Him that Paul confesses.'
  FROM cross_reference_threads t, cross_references x, _session411_2en26_lookup sv, _session411_2en26_lookup tv
 WHERE t.slug='2-enoch-26-foundation-for-the-lower-things-from-the-invisible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_27.sql (session411 2-enoch 27) -----
-- Source anchor: pseudepigrapha/2-enoch ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en27 (view _session411_2en27_lookup). Sort band base 82650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-27-dividing-the-waters-light-from-darkness
  ('pseudepigrapha', '2-enoch', 27, 1, 'canon', 'genesis', 1, 2, 'free', E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The bottomless waters the Lord makes firm in 2 Enoch 27:1 are the deep over which the Spirit moved at the first.'),
  ('pseudepigrapha', '2-enoch', 27, 1, 'canon', 'psalms', 33, 6, 'free', E'Psalms 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The Lord''s spreading out and making firm of the waters is the heavens made by His word, as the psalmist confesses.'),
  ('pseudepigrapha', '2-enoch', 27, 2, 'canon', 'genesis', 1, 4, 'free', E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* The separating of light from darkness in 2 Enoch 27:2 is the dividing Moses records on the first day.'),
  ('pseudepigrapha', '2-enoch', 27, 2, 'canon', 'genesis', 1, 5, 'free', E'Genesis 1:5 — *And Elohim (God) called the light Day, and the darkness he called Night. And the evening and the morning were the first day.* The Lord''s naming of day and night and "there was evening and there was morning the first day" is word for word the close of Genesis'' first day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-27-dividing-the-waters-light-from-darkness',
       E'The waters made firm, the light divided from the darkness',
       E'The Lord shows Enoch the work of creation in His own voice: He takes light and darkness, makes firm the waters, and *separated between light and between darkness... and I said to the light, that it should be the day, and to the darkness, that it should be the night, and there was evening and there was morning the first day* (2 Enoch 27:1-2). This is no new cosmology — it is the opening of Moses'' own book. The deep and the dividing are there from the first page: *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2); *And Elohim (God) called the light Day, and the darkness he called Night. And the evening and the morning were the first day* (Genesis 1:5). And the prophets confess that this firmament stood at a word: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalms 33:6). It ain''t new — the seven circles and the crystal waters are an embellished retelling of the first day that Genesis set down plainly.',
       sv.verse_id, ev.verse_id, 'extras', 82650
  FROM _session411_2en27_lookup sv, _session411_2en27_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=27 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=27 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-27-dividing-the-waters-light-from-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The bottomless waters the Lord makes firm in 2 Enoch 27:1 are the deep over which the Spirit moved at the first.'
  FROM cross_reference_threads t, cross_references x, _session411_2en27_lookup sv, _session411_2en27_lookup tv
 WHERE t.slug='2-enoch-27-dividing-the-waters-light-from-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=27 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The Lord''s spreading out and making firm of the waters is the heavens made by His word, as the psalmist confesses.'
  FROM cross_reference_threads t, cross_references x, _session411_2en27_lookup sv, _session411_2en27_lookup tv
 WHERE t.slug='2-enoch-27-dividing-the-waters-light-from-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=27 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* The separating of light from darkness in 2 Enoch 27:2 is the dividing Moses records on the first day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en27_lookup sv, _session411_2en27_lookup tv
 WHERE t.slug='2-enoch-27-dividing-the-waters-light-from-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 1:5 — *And Elohim (God) called the light Day, and the darkness he called Night. And the evening and the morning were the first day.* The Lord''s naming of day and night and "there was evening and there was morning the first day" is word for word the close of Genesis'' first day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en27_lookup sv, _session411_2en27_lookup tv
 WHERE t.slug='2-enoch-27-dividing-the-waters-light-from-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_28.sql (session411 2-enoch 28) -----
-- Source anchor: pseudepigrapha/2-enoch ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en28 (view _session411_2en28_lookup). Sort band base 82675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-28-dry-land-gathered-the-sea-bounded
  ('pseudepigrapha', '2-enoch', 28, 2, 'canon', 'genesis', 1, 9, 'free', E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* The gathering of the lower water and the appearing of the dry in 2 Enoch 28:1-2 is the third day''s command in Moses.'),
  ('pseudepigrapha', '2-enoch', 28, 2, 'canon', 'genesis', 1, 10, 'free', E'Genesis 1:10 — *And Elohim (God) called the dry land Earth; and the gathering together of the waters called he Seas: and Elohim (God) saw that it was good.* The Lord''s calling the dry "earth" and gathering the sea in one place is the naming Genesis records.'),
  ('pseudepigrapha', '2-enoch', 28, 3, 'canon', 'psalms', 33, 7, 'free', E'Psalms 33:7 — *He gathereth the waters of the sea together as an heap: he layeth up the depth in storehouses.* The eternal limit and yoke set upon the sea in 2 Enoch 28:3 is the gathering of the waters the psalmist sings.'),
  ('pseudepigrapha', '2-enoch', 28, 3, 'canon', 'psalms', 33, 9, 'free', E'Psalms 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* The sea holding to the bound it was given answers the psalmist''s word that what He commands stands fast.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-28-dry-land-gathered-the-sea-bounded',
       E'The waters gathered, the dry land called earth, the sea given its bound',
       E'The Lord gathers the lower waters into one whole, and *from the rock I piled up the dry, and the dry I called earth... I collected the sea in one place and bound it together with a yoke* (2 Enoch 28:2), telling the sea, *Behold I give you your eternal limits, and you shalt not break loose* (2 Enoch 28:3). This is the third utterance of Genesis: *Let the waters under the heaven be gathered together unto one place, and let the dry land appear... And Elohim (God) called the dry land Earth; and the gathering together of the waters called he Seas* (Genesis 1:9-10). The bound set upon the sea is the same decree the prophets praise: *He gathereth the waters of the sea together as an heap: he layeth up the depth in storehouses* (Psalms 33:7), for *he spake, and it was done; he commanded, and it stood fast* (Psalms 33:9). It ain''t new — the yoke laid on the sea here is the limit Yahuah set in the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 82675
  FROM _session411_2en28_lookup sv, _session411_2en28_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=28 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-28-dry-land-gathered-the-sea-bounded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* The gathering of the lower water and the appearing of the dry in 2 Enoch 28:1-2 is the third day''s command in Moses.'
  FROM cross_reference_threads t, cross_references x, _session411_2en28_lookup sv, _session411_2en28_lookup tv
 WHERE t.slug='2-enoch-28-dry-land-gathered-the-sea-bounded'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:10 — *And Elohim (God) called the dry land Earth; and the gathering together of the waters called he Seas: and Elohim (God) saw that it was good.* The Lord''s calling the dry "earth" and gathering the sea in one place is the naming Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session411_2en28_lookup sv, _session411_2en28_lookup tv
 WHERE t.slug='2-enoch-28-dry-land-gathered-the-sea-bounded'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 33:7 — *He gathereth the waters of the sea together as an heap: he layeth up the depth in storehouses.* The eternal limit and yoke set upon the sea in 2 Enoch 28:3 is the gathering of the waters the psalmist sings.'
  FROM cross_reference_threads t, cross_references x, _session411_2en28_lookup sv, _session411_2en28_lookup tv
 WHERE t.slug='2-enoch-28-dry-land-gathered-the-sea-bounded'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* The sea holding to the bound it was given answers the psalmist''s word that what He commands stands fast.'
  FROM cross_reference_threads t, cross_references x, _session411_2en28_lookup sv, _session411_2en28_lookup tv
 WHERE t.slug='2-enoch-28-dry-land-gathered-the-sea-bounded'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_29.sql (session411 2-enoch 29) -----
-- Source anchor: pseudepigrapha/2-enoch ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en29 (view _session411_2en29_lookup). Sort band base 82700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-29-the-angelic-orders-created-from-fire
  ('pseudepigrapha', '2-enoch', 29, 2, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The orders of angels imaged from fire in 2 Enoch 29:2 are among the invisible thrones and powers Paul says were all created by Him.'),
  ('pseudepigrapha', '2-enoch', 29, 2, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The making of the angelic troops confirms that not any thing, in heaven or earth, was made apart from the Word.'),
  ('pseudepigrapha', '2-enoch', 29, 2, 'enoch', '1-enoch', 69, 20, 'extras', E'1 Enoch 69:20 — *and the heaven was suspended before the world was created, and for ever.* The hosts standing in their fiery order rest on the same created foundation 1 Enoch confesses, suspended by Him before the world was.'),
  ('pseudepigrapha', '2-enoch', 29, 2, 'jubilees', 'jubilees', 2, 2, 'extras', E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire...* Jubilees lists the very hosts 2 Enoch sees imaged from fire, all created on the first day.'),
  -- thread: 2-enoch-29-satanail-cast-down
  ('pseudepigrapha', '2-enoch', 29, 3, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The rebel''s thought in 2 Enoch 29:3 to set his throne higher and be equal to the Lord''s power is the boast Isaiah lays bare.'),
  ('pseudepigrapha', '2-enoch', 29, 4, 'canon', 'isaiah', 14, 15, 'free', E'Isaiah 14:15 — *Yet thou shalt be brought down to hell, to the sides of the pit.* The throwing of the rebel out from the height answers the prophet''s word that the proud one is brought down.'),
  ('pseudepigrapha', '2-enoch', 29, 4, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The Messiah''s own testimony names the fall 2 Enoch 29:4 describes — the rebel cast from the height.'),
  ('pseudepigrapha', '2-enoch', 29, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The casting out "with his angels" matches John''s vision of the dragon and his angels cast to the earth.'),
  ('pseudepigrapha', '2-enoch', 29, 4, 'enoch', '1-enoch', 18, 13, 'extras', E'1 Enoch 18:13 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* 1 Enoch''s bound transgressor-host is the same rebellion in heaven 2 Enoch sees thrown down.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-29-the-angelic-orders-created-from-fire',
       E'The hosts of heaven made — all things created by Him',
       E'Before the rebel falls, the Lord shows that the angelic hosts themselves are made things: *from the fire I created the orders of the incorporeal ten troops of angels, and their weapons are fiery and their raiment a burning flame, and I commanded that each one should stand in his order* (2 Enoch 29:2). The thrones and powers of heaven are not eternal beside the Creator; they were made by Him and for Him: *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him* (Colossians 1:16); *All things were made by him; and without him was not any thing made that was made* (John 1:3). Jubilees lists these same first-day hosts — *the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire* (Jubilees 2:2) — and 1 Enoch confesses the foundation older than the world: *the heaven was suspended before the world was created, and for ever* (1 Enoch 69:20). It ain''t new — the troops of fire stand in their order because the One who is *self-eternal* set them there.',
       sv.verse_id, ev.verse_id, 'extras', 82700
  FROM _session411_2en29_lookup sv, _session411_2en29_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=29 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-29-satanail-cast-down',
       E'The rebel who would exalt his throne — cast out from the height',
       E'One of the angelic order *conceived an impossible thought, to place his throne higher than the clouds above the earth, that he might become equal in rank to my power. And I threw him out from the height with his angels* (2 Enoch 29:3-4). This is the very pride and fall Isaiah unmasks: *How art thou fallen from heaven, O Lucifer, son of the morning!... For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:12-14) — *Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:15). The Messiah named the fall He witnessed: *I beheld Satan as lightning fall from heaven* (Luke 10:18); and the Revelation seals it: *And the great dragon was cast out, that old serpent, called the Devil, and Satan... he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). 1 Enoch saw the bound rebels too: *the stars... which have transgressed the commandment of Yahuah (God) in the beginning of their rising* (1 Enoch 18:13). It ain''t new — the casting down of the proud spirit is testified from Moses'' first heaven to John''s last.',
       sv.verse_id, ev.verse_id, 'extras', 82703
  FROM _session411_2en29_lookup sv, _session411_2en29_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=29 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-29-the-angelic-orders-created-from-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The orders of angels imaged from fire in 2 Enoch 29:2 are among the invisible thrones and powers Paul says were all created by Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-the-angelic-orders-created-from-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The making of the angelic troops confirms that not any thing, in heaven or earth, was made apart from the Word.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-the-angelic-orders-created-from-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 69:20 — *and the heaven was suspended before the world was created, and for ever.* The hosts standing in their fiery order rest on the same created foundation 1 Enoch confesses, suspended by Him before the world was.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-the-angelic-orders-created-from-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=69 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire...* Jubilees lists the very hosts 2 Enoch sees imaged from fire, all created on the first day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-the-angelic-orders-created-from-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-29-satanail-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The rebel''s thought in 2 Enoch 29:3 to set his throne higher and be equal to the Lord''s power is the boast Isaiah lays bare.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-satanail-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:15 — *Yet thou shalt be brought down to hell, to the sides of the pit.* The throwing of the rebel out from the height answers the prophet''s word that the proud one is brought down.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-satanail-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The Messiah''s own testimony names the fall 2 Enoch 29:4 describes — the rebel cast from the height.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-satanail-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The casting out "with his angels" matches John''s vision of the dragon and his angels cast to the earth.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-satanail-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 18:13 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* 1 Enoch''s bound transgressor-host is the same rebellion in heaven 2 Enoch sees thrown down.'
  FROM cross_reference_threads t, cross_references x, _session411_2en29_lookup sv, _session411_2en29_lookup tv
 WHERE t.slug='2-enoch-29-satanail-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_30.sql (session411 2-enoch 30) -----
-- Source anchor: pseudepigrapha/2-enoch ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en30 (view _session411_2en30_lookup). Sort band base 82725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-30-the-lights-and-the-living-creatures
  ('pseudepigrapha', '2-enoch', 30, 3, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The great lights set on the fourth day in 2 Enoch 30:3-6, marking months and seasons, are the lights Moses appoints for signs and seasons.'),
  ('pseudepigrapha', '2-enoch', 30, 5, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun for the day and the moon and stars for the night in 2 Enoch 30:5 are the two great lights and the stars of Genesis.'),
  ('pseudepigrapha', '2-enoch', 30, 8, 'canon', 'genesis', 1, 20, 'free', E'Genesis 1:20 — *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* The sea bringing forth fishes and birds on the fifth day is the fifth day''s command in Moses.'),
  ('pseudepigrapha', '2-enoch', 30, 8, 'canon', 'genesis', 1, 21, 'free', E'Genesis 1:21 — *And Elohim (God) created great whales, and every living creature that moveth, which the waters brought forth abundantly, after their kind, and every winged fowl after his kind: and Elohim (God) saw that it was good.* The living creatures and feathered birds, male and female, every soul breathing life, are the swarming kinds Genesis records.'),
  -- thread: 2-enoch-30-man-formed-in-the-image-set-to-rule
  ('pseudepigrapha', '2-enoch', 30, 10, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Beneath 2 Enoch''s seven components — flesh from the earth, soul from my breath — is the dust-formed, breath-quickened man Moses records.'),
  ('pseudepigrapha', '2-enoch', 30, 12, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth.* The Lord appointing man "as ruler to rule on earth" in 2 Enoch 30:12 is the image-bearing dominion Genesis grants.'),
  ('pseudepigrapha', '2-enoch', 30, 12, 'canon', 'psalms', 8, 5, 'free', E'Psalms 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* Man named "a second angel, honourable, great and glorious" echoes the psalmist''s man crowned with glory and honour, a little lower than the angels.'),
  ('pseudepigrapha', '2-enoch', 30, 12, 'canon', 'psalms', 8, 6, 'free', E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet.* The dominion appointed to man in 2 Enoch 30:12 is the rule the psalmist sings, all things put under his feet.'),
  -- thread: 2-enoch-30-the-two-ways-free-will-and-death
  ('pseudepigrapha', '2-enoch', 30, 13, 'canon', 'ecclesiastes', 7, 29, 'free', E'Ecclesiastes 7:29 — *Lo, this only have I found, that Elohim (God) hath made man upright; but they have sought out many inventions.* The two ways shown to Adam, with man made good and left to choose, is the upright man and his self-sought inventions the preacher names.'),
  ('pseudepigrapha', '2-enoch', 30, 15, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The Lord''s word "After sin what is there but death?" is the very death Paul says entered by one man''s sin.'),
  -- thread: 2-enoch-30-the-rib-and-the-mother-of-the-living
  ('pseudepigrapha', '2-enoch', 30, 16, 'canon', 'genesis', 2, 21, 'free', E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* The sleep put into Adam and the rib taken in 2 Enoch 30:16 is the deep sleep and the rib of Genesis.'),
  ('pseudepigrapha', '2-enoch', 30, 16, 'canon', 'genesis', 2, 22, 'free', E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* The wife created from Adam''s rib, called mother, is the woman Genesis makes from the rib.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-30-the-lights-and-the-living-creatures',
       E'The lights set for seasons, the waters and air filled with life',
       E'The Lord continues the ordered days: trees and seed and Paradise on the third, then *On the fourth day I commanded that there should be great lights on the heavenly circles* (2 Enoch 30:3), the sun for the day and *the moon and stars for the illumination of night* (2 Enoch 30:5), set to run *according to each constellation, twelve, and I appointed the succession of the months* (2 Enoch 30:6); then on the fifth He bids the sea bring forth fishes and *feathered birds of many varieties, and all animals creeping over the earth... male sex and female, and every soul breathing the spirit of life* (2 Enoch 30:8). This is the fourth and fifth days of Moses: *Let there be lights in the firmament of the heaven... and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14); *Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth* (Genesis 1:20). It ain''t new — the planet-names and circles are an embellished frame around the calendar of lights and the swarming life that Genesis set in their days.',
       sv.verse_id, ev.verse_id, 'extras', 82725
  FROM _session411_2en30_lookup sv, _session411_2en30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=30 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-30-man-formed-in-the-image-set-to-rule',
       E'Man formed of the earth, image of Elohim, set as ruler over the earth',
       E'On the sixth day the Lord forms man — and though 2 Enoch tells it as a making from *seven consistencies: one, his flesh from the earth... seven, his soul from my breath* (2 Enoch 30:10), the kernel is Moses'' own account: man is of the dust and of the breath of Elohim, and is set as His regent. The Lord names him *a second angel, honourable, great and glorious, and I appointed him as ruler to rule on earth* (2 Enoch 30:12). Genesis says it plainly: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7); *Let us make man in our image, after our likeness: and let them have dominion* (Genesis 1:26). The psalmist marvels at this same crowning: *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?... thou hast crowned him with glory and honour. Thou madest him to have dominion over the works of thy hands* (Psalms 8:4-6). It ain''t new — strip the seven parts and the four-star etymology, and what remains is the dust-formed, breath-quickened, image-bearing man Genesis sets to rule.',
       sv.verse_id, ev.verse_id, 'extras', 82728
  FROM _session411_2en30_lookup sv, _session411_2en30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=30 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-30-the-two-ways-free-will-and-death',
       E'The two ways set before Adam — made upright, free, and warned of death',
       E'The Lord shows Adam *the two ways, the light and the darkness* (2 Enoch 30:13), to prove *whether he has love towards me, or hatred* (2 Enoch 30:14), and warns, *After sin what is there but death?* (2 Enoch 30:15). Man is made good and given a true choice — exactly as the preacher confesses: *Lo, this only have I found, that Elohim (God) hath made man upright; but they have sought out many inventions* (Ecclesiastes 7:29). And the wage of the sin to come is the death the apostle traces back to this same Adam: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). It ain''t new — the two ways set before Adam are the upright man and the open choice Moses'' prophets and Paul both confess.',
       sv.verse_id, ev.verse_id, 'extras', 82731
  FROM _session411_2en30_lookup sv, _session411_2en30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=13
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=30 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-30-the-rib-and-the-mother-of-the-living',
       E'The sleep, the rib, and the woman called mother',
       E'The chapter closes with the forming of the woman: *And I put sleep into him and he fell asleep. And I took from him a rib, and created him a wife... and I took his last word and called her name mother, that is to say, Eva* (2 Enoch 30:16). This is the close of Moses'' second chapter: *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof* (Genesis 2:21); *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* (Genesis 2:22). It ain''t new — the sleep, the rib, and the woman are told here just as Genesis first told them.',
       sv.verse_id, ev.verse_id, 'extras', 82734
  FROM _session411_2en30_lookup sv, _session411_2en30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=16
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=30 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-30-the-lights-and-the-living-creatures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The great lights set on the fourth day in 2 Enoch 30:3-6, marking months and seasons, are the lights Moses appoints for signs and seasons.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-lights-and-the-living-creatures'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun for the day and the moon and stars for the night in 2 Enoch 30:5 are the two great lights and the stars of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-lights-and-the-living-creatures'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:20 — *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* The sea bringing forth fishes and birds on the fifth day is the fifth day''s command in Moses.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-lights-and-the-living-creatures'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 1:21 — *And Elohim (God) created great whales, and every living creature that moveth, which the waters brought forth abundantly, after their kind, and every winged fowl after his kind: and Elohim (God) saw that it was good.* The living creatures and feathered birds, male and female, every soul breathing life, are the swarming kinds Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-lights-and-the-living-creatures'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-30-man-formed-in-the-image-set-to-rule
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Beneath 2 Enoch''s seven components — flesh from the earth, soul from my breath — is the dust-formed, breath-quickened man Moses records.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-man-formed-in-the-image-set-to-rule'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth.* The Lord appointing man "as ruler to rule on earth" in 2 Enoch 30:12 is the image-bearing dominion Genesis grants.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-man-formed-in-the-image-set-to-rule'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* Man named "a second angel, honourable, great and glorious" echoes the psalmist''s man crowned with glory and honour, a little lower than the angels.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-man-formed-in-the-image-set-to-rule'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet.* The dominion appointed to man in 2 Enoch 30:12 is the rule the psalmist sings, all things put under his feet.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-man-formed-in-the-image-set-to-rule'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-30-the-two-ways-free-will-and-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 7:29 — *Lo, this only have I found, that Elohim (God) hath made man upright; but they have sought out many inventions.* The two ways shown to Adam, with man made good and left to choose, is the upright man and his self-sought inventions the preacher names.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-two-ways-free-will-and-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The Lord''s word "After sin what is there but death?" is the very death Paul says entered by one man''s sin.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-two-ways-free-will-and-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-30-the-rib-and-the-mother-of-the-living
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* The sleep put into Adam and the rib taken in 2 Enoch 30:16 is the deep sleep and the rib of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-rib-and-the-mother-of-the-living'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* The wife created from Adam''s rib, called mother, is the woman Genesis makes from the rib.'
  FROM cross_reference_threads t, cross_references x, _session411_2en30_lookup sv, _session411_2en30_lookup tv
 WHERE t.slug='2-enoch-30-the-rib-and-the-mother-of-the-living'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=30 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_31.sql (session411 2-enoch 31) -----
-- Source anchor: pseudepigrapha/2-enoch ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en31 (view _session411_2en31_lookup). Sort band base 82750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-31-the-garden-in-eden-and-the-command
  ('pseudepigrapha', '2-enoch', 31, 1, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The garden created in Eden in the east in 2 Enoch 31:1 is the garden eastward in Eden Moses records.'),
  ('pseudepigrapha', '2-enoch', 31, 1, 'canon', 'genesis', 2, 16, 'free', E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat.* The command Adam is set to keep is the charge Yahuah Elohim gave the man in the garden.'),
  ('pseudepigrapha', '2-enoch', 31, 1, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The testament and command Adam must keep is the one forbidden tree and its warning of death in Moses.'),
  -- thread: 2-enoch-31-the-devil-seduced-eve
  ('pseudepigrapha', '2-enoch', 31, 5, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The devil who entered and seduced Eve in 2 Enoch 31:5 is the subtil serpent who first spoke to the woman in Eden.'),
  ('pseudepigrapha', '2-enoch', 31, 5, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Paul names the very beguiling of Eve that 2 Enoch 31:5 records — the serpent''s subtilty against the woman.'),
  ('pseudepigrapha', '2-enoch', 31, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world.* The fugitive Satanail of 2 Enoch 31:4 is the old serpent John names the Devil and Satan, the deceiver of the world.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-31-the-garden-in-eden-and-the-command',
       E'A garden in Eden in the east, that he should keep the command',
       E'The Lord sets the man in his place: *I created a garden in Eden in the east, that he should observe the testament and keep the command* (2 Enoch 31:1), and Adam is *lord on earth, to rule and control it* (2 Enoch 31:3). This is Moses'' planted garden and its charge: *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed* (Genesis 2:8); *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat: But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:16-17). It ain''t new — the garden in the east and the command to keep are Genesis word for word.',
       sv.verse_id, ev.verse_id, 'extras', 82750
  FROM _session411_2en31_lookup sv, _session411_2en31_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=31 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-31-the-devil-seduced-eve',
       E'Satanail the fugitive — the evil spirit who seduced Eve',
       E'The fallen one of chapter 29 returns to work ruin: *The devil is the evil spirit of the lower places, as a fugitive he made Sotona from the heavens as his name was Satanail* (2 Enoch 31:4), and *he conceived thought against Adam, in such form he entered and seduced Eva, but did not touch Adam* (2 Enoch 31:5). This is the serpent of Eden, and the apostle names him as such: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). Moses sets the scene — *Now the serpent was more subtil than any beast of the field* (Genesis 3:1) — and the Revelation names him the same accuser: *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). It ain''t new — the seducer of Eve here is the subtil serpent of Genesis and the old serpent of John.',
       sv.verse_id, ev.verse_id, 'extras', 82753
  FROM _session411_2en31_lookup sv, _session411_2en31_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=31 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-31-the-garden-in-eden-and-the-command
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The garden created in Eden in the east in 2 Enoch 31:1 is the garden eastward in Eden Moses records.'
  FROM cross_reference_threads t, cross_references x, _session411_2en31_lookup sv, _session411_2en31_lookup tv
 WHERE t.slug='2-enoch-31-the-garden-in-eden-and-the-command'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat.* The command Adam is set to keep is the charge Yahuah Elohim gave the man in the garden.'
  FROM cross_reference_threads t, cross_references x, _session411_2en31_lookup sv, _session411_2en31_lookup tv
 WHERE t.slug='2-enoch-31-the-garden-in-eden-and-the-command'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The testament and command Adam must keep is the one forbidden tree and its warning of death in Moses.'
  FROM cross_reference_threads t, cross_references x, _session411_2en31_lookup sv, _session411_2en31_lookup tv
 WHERE t.slug='2-enoch-31-the-garden-in-eden-and-the-command'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-31-the-devil-seduced-eve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The devil who entered and seduced Eve in 2 Enoch 31:5 is the subtil serpent who first spoke to the woman in Eden.'
  FROM cross_reference_threads t, cross_references x, _session411_2en31_lookup sv, _session411_2en31_lookup tv
 WHERE t.slug='2-enoch-31-the-devil-seduced-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Paul names the very beguiling of Eve that 2 Enoch 31:5 records — the serpent''s subtilty against the woman.'
  FROM cross_reference_threads t, cross_references x, _session411_2en31_lookup sv, _session411_2en31_lookup tv
 WHERE t.slug='2-enoch-31-the-devil-seduced-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world.* The fugitive Satanail of 2 Enoch 31:4 is the old serpent John names the Devil and Satan, the deceiver of the world.'
  FROM cross_reference_threads t, cross_references x, _session411_2en31_lookup sv, _session411_2en31_lookup tv
 WHERE t.slug='2-enoch-31-the-devil-seduced-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_32.sql (session411 2-enoch 32) -----
-- Source anchor: pseudepigrapha/2-enoch ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en32 (view _session411_2en32_lookup). Sort band base 82775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-32-earth-thou-art-and-to-earth-return
  ('pseudepigrapha', '2-enoch', 32, 1, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The Lord''s word "Earth you are, and into the earth... you shalt go" is the dust-to-dust sentence Moses records over fallen Adam.'),
  ('pseudepigrapha', '2-enoch', 32, 1, 'canon', 'psalms', 90, 3, 'free', E'Psalms 90:3 — *Thou turnest man to destruction; and sayest, Return, ye children of men.* The sending of man back whence he was taken echoes the psalmist''s word that the Lord turns man to dust and bids him return.'),
  -- thread: 2-enoch-32-blessed-the-seventh-day-the-sabbath
  ('pseudepigrapha', '2-enoch', 32, 4, 'canon', 'genesis', 2, 3, 'free', E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* The Lord blessing the seventh day, the Sabbath of rest, in 2 Enoch 32:4 is the seventh day Moses blessed and sanctified at creation.'),
  ('pseudepigrapha', '2-enoch', 32, 4, 'canon', 'hebrews', 4, 4, 'free', E'Hebrews 4:4 — *For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works.* The Sabbath rest at the close of creation is the seventh-day rest Hebrews recalls and carries forward to the people of Elohim.'),
  ('pseudepigrapha', '2-enoch', 32, 4, 'jubilees', 'jubilees', 2, 1, 'extras', E'Jubilees 2:1 — *...how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works.* Jubilees seals the same seventh-day Sabbath 2 Enoch blesses, hallowed for all ages as a sign.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-32-earth-thou-art-and-to-earth-return',
       E'"Earth you are, and into the earth shalt you go"',
       E'After the fall the Lord pronounces the sentence of dust: *Earth you are, and into the earth whence I took you you shalt go, and I will not ruin you, but send you whence I took you. Then I can again receive you at My second presence* (2 Enoch 32:1-2). This is Moses'' own sentence upon the fallen man: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The psalmist confesses the same turning: *Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalms 90:3). It ain''t new — "earth thou art, to earth return" is the curse of Genesis carried whole, and the hope of being received again rests on the One who made the dust.',
       sv.verse_id, ev.verse_id, 'extras', 82775
  FROM _session411_2en32_lookup sv, _session411_2en32_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=32 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-32-blessed-the-seventh-day-the-sabbath',
       E'The seventh day blessed — the Sabbath of rest',
       E'The week of creation closes as it does in Moses: *And I blessed the seventh day, which is the Sabbath, on which he rested from all his works* (2 Enoch 32:4). This is Genesis word for word: *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). Hebrews carries the same rest forward — *And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4) — and Jubilees binds it as a sign for all ages: *in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages* (Jubilees 2:1). It ain''t new — the Sabbath blessed at creation here is the seventh-day rest Moses sanctified, which the Sabbath of God''s people still keeps.',
       sv.verse_id, ev.verse_id, 'extras', 82778
  FROM _session411_2en32_lookup sv, _session411_2en32_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=32 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=32 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-32-earth-thou-art-and-to-earth-return
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The Lord''s word "Earth you are, and into the earth... you shalt go" is the dust-to-dust sentence Moses records over fallen Adam.'
  FROM cross_reference_threads t, cross_references x, _session411_2en32_lookup sv, _session411_2en32_lookup tv
 WHERE t.slug='2-enoch-32-earth-thou-art-and-to-earth-return'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 90:3 — *Thou turnest man to destruction; and sayest, Return, ye children of men.* The sending of man back whence he was taken echoes the psalmist''s word that the Lord turns man to dust and bids him return.'
  FROM cross_reference_threads t, cross_references x, _session411_2en32_lookup sv, _session411_2en32_lookup tv
 WHERE t.slug='2-enoch-32-earth-thou-art-and-to-earth-return'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-32-blessed-the-seventh-day-the-sabbath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* The Lord blessing the seventh day, the Sabbath of rest, in 2 Enoch 32:4 is the seventh day Moses blessed and sanctified at creation.'
  FROM cross_reference_threads t, cross_references x, _session411_2en32_lookup sv, _session411_2en32_lookup tv
 WHERE t.slug='2-enoch-32-blessed-the-seventh-day-the-sabbath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=32 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 4:4 — *For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works.* The Sabbath rest at the close of creation is the seventh-day rest Hebrews recalls and carries forward to the people of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en32_lookup sv, _session411_2en32_lookup tv
 WHERE t.slug='2-enoch-32-blessed-the-seventh-day-the-sabbath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=32 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 2:1 — *...how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works.* Jubilees seals the same seventh-day Sabbath 2 Enoch blesses, hallowed for all ages as a sign.'
  FROM cross_reference_threads t, cross_references x, _session411_2en32_lookup sv, _session411_2en32_lookup tv
 WHERE t.slug='2-enoch-32-blessed-the-seventh-day-the-sabbath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=32 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_33.sql (session411 2-enoch 33) -----
-- Source anchor: pseudepigrapha/2-enoch ch33. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en33 (view _session411_2en33_lookup). Sort band base 82800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-33-the-eighth-day-the-age-to-come
  ('pseudepigrapha', '2-enoch', 33, 1, 'canon', '2-peter', 3, 8, 'free', E'2 Peter 3:8 — *But, beloved, be not ignorant of this one thing, that one day is with the Lord as a thousand years, and a thousand years as one day.* The "seventh thousand" and the eighth thousand of 2 Enoch 33:1 rest on the apostle''s measure of a day as a thousand years before the Lord.'),
  ('pseudepigrapha', '2-enoch', 33, 1, 'canon', 'psalms', 90, 4, 'free', E'Psalms 90:4 — *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night.* The thousand-year reckoning behind the eighth-day age is the psalmist''s word that a thousand years are as a day in the Lord''s sight.'),
  ('pseudepigrapha', '2-enoch', 33, 1, 'canon', 'hebrews', 4, 9, 'free', E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* The endless time of not-counting at the beginning of the eighth thousand is the sabbath-rest that still remains for the people of Elohim.'),
  ('pseudepigrapha', '2-enoch', 33, 1, 'canon', 'revelation', 21, 1, 'free', E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The endless eighth age, with neither years nor months nor days, is John''s new heaven and new earth when the first order has passed away.'),
  -- thread: 2-enoch-33-the-self-eternal-creator-no-other-elohim
  ('pseudepigrapha', '2-enoch', 33, 9, 'canon', 'deuteronomy', 4, 39, 'free', E'Deuteronomy 4:39 — *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* The Lord''s word that men shall know "there is no other Elohim but me" is the confession Moses set in Israel''s heart.'),
  ('pseudepigrapha', '2-enoch', 33, 9, 'canon', 'isaiah', 45, 18, 'free', E'Isaiah 45:18 — *For thus saith Yahuah (LORD) that created the heavens; Elohim (God) himself that formed the earth and made it... I am Yahuah (LORD); and there is none else.* The self-eternal Creator of 2 Enoch 33 who alone made all things is Isaiah''s Yahuah that created the heavens, beside whom there is none else.'),
  ('pseudepigrapha', '2-enoch', 33, 2, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The Lord''s devising and creating all things "from the uppermost foundation to the lower" is the framing of the worlds by His word that Hebrews confesses.'),
  ('pseudepigrapha', '2-enoch', 33, 4, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* "My wisdom and my word are made" — all forces created by Him, none resisting — is the Word by whom all things were made.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-33-the-eighth-day-the-age-to-come',
       E'The eighth day — the endless age of rest after the seven thousand',
       E'Here is the keystone the Lord lays for Enoch: *I appointed the eighth day also, that the eighth day should be the first-created after my work, and that the first seven revolve in the form of the seventh thousand, and that at the beginning of the eighth thousand there should be a time of not-counting, endless, with neither years nor months nor weeks nor days nor hours* (2 Enoch 33:1). The reckoning of a day as a thousand years is the apostle''s own measure: *be not ignorant of this one thing, that one day is with the Lord as a thousand years, and a thousand years as one day* (2 Peter 3:8) — for to Him *a thousand years in thy sight are but as yesterday when it is past* (Psalms 90:4). And the seventh-day rest opens onto a rest still remaining: *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9), when the old order passes: *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away* (Revelation 21:1). It ain''t new — the eighth day beyond the seven thousand is the everlasting sabbath-rest the Torah''s seventh day always pointed toward, measured by the Lord''s own thousand-year day.',
       sv.verse_id, ev.verse_id, 'extras', 82800
  FROM _session411_2en33_lookup sv, _session411_2en33_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=33 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-33-the-self-eternal-creator-no-other-elohim',
       E'The self-eternal Creator — none other Elohim but Him',
       E'The Lord seals the secrets of creation by naming Himself: *I am self-eternal, not made with hands, and without change. My thought is my counsellor... there is no counsellor nor inheritor to my creations* (2 Enoch 33:3-4), and the books are given that men *will know me for the creator of all things, and will understand how there is no other Elohim (God) but me* (2 Enoch 33:9). This is the bare confession of Moses and the prophets: *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39); *thus saith Yahuah (LORD) that created the heavens... I am Yahuah (LORD); and there is none else* (Isaiah 45:18). And the worlds were framed by His word alone: *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3). It ain''t new — "no other Elohim but me" is the Shema''s own ground, the Creator confessing Himself as Moses, Isaiah, and the apostles confess Him.',
       sv.verse_id, ev.verse_id, 'extras', 82803
  FROM _session411_2en33_lookup sv, _session411_2en33_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=33 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-33-the-eighth-day-the-age-to-come
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 3:8 — *But, beloved, be not ignorant of this one thing, that one day is with the Lord as a thousand years, and a thousand years as one day.* The "seventh thousand" and the eighth thousand of 2 Enoch 33:1 rest on the apostle''s measure of a day as a thousand years before the Lord.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-eighth-day-the-age-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 90:4 — *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night.* The thousand-year reckoning behind the eighth-day age is the psalmist''s word that a thousand years are as a day in the Lord''s sight.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-eighth-day-the-age-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* The endless time of not-counting at the beginning of the eighth thousand is the sabbath-rest that still remains for the people of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-eighth-day-the-age-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The endless eighth age, with neither years nor months nor days, is John''s new heaven and new earth when the first order has passed away.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-eighth-day-the-age-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-33-the-self-eternal-creator-no-other-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:39 — *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* The Lord''s word that men shall know "there is no other Elohim but me" is the confession Moses set in Israel''s heart.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-self-eternal-creator-no-other-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:18 — *For thus saith Yahuah (LORD) that created the heavens; Elohim (God) himself that formed the earth and made it... I am Yahuah (LORD); and there is none else.* The self-eternal Creator of 2 Enoch 33 who alone made all things is Isaiah''s Yahuah that created the heavens, beside whom there is none else.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-self-eternal-creator-no-other-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The Lord''s devising and creating all things "from the uppermost foundation to the lower" is the framing of the worlds by His word that Hebrews confesses.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-self-eternal-creator-no-other-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* "My wisdom and my word are made" — all forces created by Him, none resisting — is the Word by whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session411_2en33_lookup sv, _session411_2en33_lookup tv
 WHERE t.slug='2-enoch-33-the-self-eternal-creator-no-other-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=33 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_34.sql (session411 2-enoch 34) -----
-- Source anchor: pseudepigrapha/2-enoch ch34. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en34 (view _session411_2en34_lookup). Sort band base 82825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-34-rejected-my-commandments-the-deluge
  ('pseudepigrapha', '2-enoch', 34, 1, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The wickedness 2 Enoch 34:1 says laded the whole earth is the wickedness Moses records before the flood.'),
  ('pseudepigrapha', '2-enoch', 34, 1, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The earth laden with offences and unclean wickedness in 2 Enoch 34:1 is the corrupt, violence-filled earth of Genesis.'),
  ('pseudepigrapha', '2-enoch', 34, 2, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* The deluge the Lord declares in 2 Enoch 34:2 to destroy all men is the very flood of waters Genesis sets down.'),
  ('pseudepigrapha', '2-enoch', 34, 2, 'jubilees', 'jubilees', 5, 4, 'extras', E'Jubilees 5:4 — *And He said: “I shall destroy man and all flesh upon the face of the earth which I have created.”* The sentence 2 Enoch 34:2 records, to bring the deluge and destroy all men, is the same word Jubilees preserves over the corrupt generation.'),
  ('pseudepigrapha', '2-enoch', 34, 1, 'jasher', 'jasher', 4, 17, 'extras', E'Jasher 4:17 — *And every man made to himself a god, and they robbed and plundered every man his neighbor as well as his relative, and they corrupted the earth, and the earth was filled with violence.* 2 Enoch 34:1''s charge that they bowed to vain gods and denied His unity is Jasher''s account of the generation that drew down the flood.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-34-rejected-my-commandments-the-deluge',
       E'Worthless seed, rejected commandments, and the deluge',
       E'The Lord foresees the generation that turns from Him: *They have rejected my commandments and my yoke, worthless seed has come up, not fearing Elohim (God)... and denied my unity, and have laden the whole earth with untruths, offences, abominable lecheries* (2 Enoch 34:1), *and therefore I will bring down a deluge upon the earth and will destroy all men* (2 Enoch 34:2). It ain''t new — this is Moses'' own account of the days before the flood: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5), *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11), and the sentence that follows, *behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh* (Genesis 6:17). The restored chronicles say the same — Jubilees: *And Elohim (God) looked upon the earth, and behold it was corrupt... And He said: I shall destroy man and all flesh upon the face of the earth which I have created* (Jubilees 5:3-4); and Jasher names the rejected unity, *every man made to himself a god... and the earth was filled with violence* (Jasher 4:17). 2 Enoch adds no new judgment; it confirms the one Moses recorded.',
       sv.verse_id, ev.verse_id, 'extras', 82825
  FROM _session411_2en34_lookup sv, _session411_2en34_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=34 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-34-rejected-my-commandments-the-deluge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The wickedness 2 Enoch 34:1 says laded the whole earth is the wickedness Moses records before the flood.'
  FROM cross_reference_threads t, cross_references x, _session411_2en34_lookup sv, _session411_2en34_lookup tv
 WHERE t.slug='2-enoch-34-rejected-my-commandments-the-deluge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The earth laden with offences and unclean wickedness in 2 Enoch 34:1 is the corrupt, violence-filled earth of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session411_2en34_lookup sv, _session411_2en34_lookup tv
 WHERE t.slug='2-enoch-34-rejected-my-commandments-the-deluge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* The deluge the Lord declares in 2 Enoch 34:2 to destroy all men is the very flood of waters Genesis sets down.'
  FROM cross_reference_threads t, cross_references x, _session411_2en34_lookup sv, _session411_2en34_lookup tv
 WHERE t.slug='2-enoch-34-rejected-my-commandments-the-deluge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=34 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:4 — *And He said: “I shall destroy man and all flesh upon the face of the earth which I have created.”* The sentence 2 Enoch 34:2 records, to bring the deluge and destroy all men, is the same word Jubilees preserves over the corrupt generation.'
  FROM cross_reference_threads t, cross_references x, _session411_2en34_lookup sv, _session411_2en34_lookup tv
 WHERE t.slug='2-enoch-34-rejected-my-commandments-the-deluge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=34 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 4:17 — *And every man made to himself a god, and they robbed and plundered every man his neighbor as well as his relative, and they corrupted the earth, and the earth was filled with violence.* 2 Enoch 34:1''s charge that they bowed to vain gods and denied His unity is Jasher''s account of the generation that drew down the flood.'
  FROM cross_reference_threads t, cross_references x, _session411_2en34_lookup sv, _session411_2en34_lookup tv
 WHERE t.slug='2-enoch-34-rejected-my-commandments-the-deluge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_35.sql (session411 2-enoch 35) -----
-- Source anchor: pseudepigrapha/2-enoch ch35. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en35 (view _session411_2en35_lookup). Sort band base 82850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-35-a-generation-shall-read-the-books
  ('pseudepigrapha', '2-enoch', 35, 3, 'canon', 'psalms', 78, 6, 'free', E'Psalms 78:6 — *That the generation to come might know them, even the children which should be born; who should arise and declare them to their children.* The later generation of 2 Enoch 35:3 that reads and tells the next is the generation-to-come the psalm commits the testimony to.'),
  ('pseudepigrapha', '2-enoch', 35, 2, 'canon', 'psalms', 78, 4, 'free', E'Psalms 78:4 — *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done.* The books of the fathers'' handwriting revealed to the faithful in 2 Enoch 35:2 are the works not to be hidden but shown to the generation to come.'),
  ('pseudepigrapha', '2-enoch', 35, 2, 'enoch', '1-enoch', 81, 3, 'extras', E'1 Enoch 81:3 — *And in those days the Lord called me, And said to me: ‘Enoch, thou scribe of righteousness, Go tell thy children and the children of thy children All the works of righteousness which thou hast seen, And the words of truth which thou hast heard.’* The books of Enoch''s handwriting that a later generation will read in 2 Enoch 35:2 are the witness the scribe of righteousness was charged to leave his children.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-35-a-generation-shall-read-the-books',
       E'A later generation that reads the books and tells the next',
       E'Beyond the flood the Lord promises a faithful remnant who will recover the written witness: *Behold from their seed shall arise another generation... He who raises that generation, shall reveal to them the books of your handwriting, of your fathers... to the faithful men and workers of my pleasure* (2 Enoch 35:1-2), *And they shall tell another generation, and those others having read shall be glorified thereafter* (2 Enoch 35:3). It ain''t new — this is the very charge of the law, that the witness be written and handed on: *That the generation to come might know them, even the children which should be born; who should arise and declare them to their children* (Psalms 78:6), *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD)* (Psalms 78:4). Enoch himself was given this commission in his own book: *Enoch, thou scribe of righteousness, Go tell thy children and the children of thy children All the works of righteousness which thou hast seen* (1 Enoch 81:3). The handing-down of the books is the handing-down Moses and the prophets command.',
       sv.verse_id, ev.verse_id, 'extras', 82850
  FROM _session411_2en35_lookup sv, _session411_2en35_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=35 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=35 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-35-a-generation-shall-read-the-books
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 78:6 — *That the generation to come might know them, even the children which should be born; who should arise and declare them to their children.* The later generation of 2 Enoch 35:3 that reads and tells the next is the generation-to-come the psalm commits the testimony to.'
  FROM cross_reference_threads t, cross_references x, _session411_2en35_lookup sv, _session411_2en35_lookup tv
 WHERE t.slug='2-enoch-35-a-generation-shall-read-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=35 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 78:4 — *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done.* The books of the fathers'' handwriting revealed to the faithful in 2 Enoch 35:2 are the works not to be hidden but shown to the generation to come.'
  FROM cross_reference_threads t, cross_references x, _session411_2en35_lookup sv, _session411_2en35_lookup tv
 WHERE t.slug='2-enoch-35-a-generation-shall-read-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 81:3 — *And in those days the Lord called me, And said to me: ‘Enoch, thou scribe of righteousness, Go tell thy children and the children of thy children All the works of righteousness which thou hast seen, And the words of truth which thou hast heard.’* The books of Enoch''s handwriting that a later generation will read in 2 Enoch 35:2 are the witness the scribe of righteousness was charged to leave his children.'
  FROM cross_reference_threads t, cross_references x, _session411_2en35_lookup sv, _session411_2en35_lookup tv
 WHERE t.slug='2-enoch-35-a-generation-shall-read-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=81 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_36.sql (session411 2-enoch 36) -----
-- Source anchor: pseudepigrapha/2-enoch ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en36 (view _session411_2en36_lookup). Sort band base 82875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-36-no-other-god-teach-your-sons
  ('pseudepigrapha', '2-enoch', 36, 1, 'canon', 'deuteronomy', 6, 4, 'free', E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* Enoch''s charge in 2 Enoch 36:1 that his sons know there is no other Elohim but Him is the Shema''s confession of the one Yahuah.'),
  ('pseudepigrapha', '2-enoch', 36, 1, 'canon', 'deuteronomy', 6, 7, 'free', E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* The thirty-day charge to gather the household and teach them in 2 Enoch 36:1 is Moses'' command to teach the words diligently to one''s children.'),
  ('pseudepigrapha', '2-enoch', 36, 2, 'canon', 'deuteronomy', 6, 2, 'free', E'Deuteronomy 6:2 — *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments, which I command thee, thou, and thy son, and thy son’s son, all the days of thy life.* That his household always keep His commandments in 2 Enoch 36:2 is the keeping Moses commands across the generations of son and son''s son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-36-no-other-god-teach-your-sons',
       E'No other Elohim but me — teach and keep the commandments',
       E'Enoch is sent back for thirty days with a single charge for his house: *tell your sons and all your household... how there is no other Elohim (God) but me. And that they may always keep my commandments, and begin to read and take in the books of your handwriting* (2 Enoch 36:1-2). It ain''t new — this is the Shema and its commission word for word: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4), and *these words, which I command thee this day, shall be in thine heart: And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house* (Deuteronomy 6:6-7). The keeping of His commandments is the keeping the prophet records of Enoch''s own children: *Go tell thy children... All the works of righteousness which thou hast seen, And the words of truth which thou hast heard* (1 Enoch 81:3). 2 Enoch teaches no new God and no new law — only the One and His commandments, handed to the sons.',
       sv.verse_id, ev.verse_id, 'extras', 82875
  FROM _session411_2en36_lookup sv, _session411_2en36_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=36 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=36 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-36-no-other-god-teach-your-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* Enoch''s charge in 2 Enoch 36:1 that his sons know there is no other Elohim but Him is the Shema''s confession of the one Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en36_lookup sv, _session411_2en36_lookup tv
 WHERE t.slug='2-enoch-36-no-other-god-teach-your-sons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=36 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* The thirty-day charge to gather the household and teach them in 2 Enoch 36:1 is Moses'' command to teach the words diligently to one''s children.'
  FROM cross_reference_threads t, cross_references x, _session411_2en36_lookup sv, _session411_2en36_lookup tv
 WHERE t.slug='2-enoch-36-no-other-god-teach-your-sons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=36 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 6:2 — *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments, which I command thee, thou, and thy son, and thy son’s son, all the days of thy life.* That his household always keep His commandments in 2 Enoch 36:2 is the keeping Moses commands across the generations of son and son''s son.'
  FROM cross_reference_threads t, cross_references x, _session411_2en36_lookup sv, _session411_2en36_lookup tv
 WHERE t.slug='2-enoch-36-no-other-god-teach-your-sons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_37.sql (session411 2-enoch 37) -----
-- Source anchor: pseudepigrapha/2-enoch ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en37 (view _session411_2en37_lookup). Sort band base 82900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-37-his-face-frozen-so-men-can-behold
  ('pseudepigrapha', '2-enoch', 37, 2, 'canon', 'exodus', 34, 29, 'free', E'Exodus 34:29 — *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses’ hand... that Moses wist not that the skin of his face shone while he talked with him.* As Enoch''s face had to be frozen lest no man behold it (2 Enoch 37:2), so Moses came down from the glory with a face transfigured.'),
  ('pseudepigrapha', '2-enoch', 37, 2, 'canon', 'exodus', 34, 30, 'free', E'Exodus 34:30 — *And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him.* That no man could behold Enoch''s face in 2 Enoch 37:2 is Israel''s fear before the shining face of Moses fresh from the mount.'),
  ('pseudepigrapha', '2-enoch', 37, 1, 'canon', 'exodus', 33, 20, 'free', E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* Enoch''s inability to endure the terror of Yahuah in 2 Enoch 37:1 stands within the boundary the Lord set with Moses: no man sees His face and lives.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-37-his-face-frozen-so-men-can-behold',
       E'Enoch''s face frozen — that men might be able to behold him',
       E'Before Enoch returns to earth an angel *froze my face, because I could not endure the terror of Yahuah (Lord)... And Yahuah (Lord) said to me: Enoch, if your face be not frozen here, no man will be able to behold your face* (2 Enoch 37:1-2). It ain''t new — this is the very thing recorded of Moses, who came down from the mount changed by standing near the glory: *Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29), and *when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him* (Exodus 34:30). The reason no man could behold Enoch''s unaltered face is the boundary the Lord set with Moses: *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). A man who has stood before that face must be veiled or shielded before his fellows — the seer is honored, not deified.',
       sv.verse_id, ev.verse_id, 'extras', 82900
  FROM _session411_2en37_lookup sv, _session411_2en37_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=37 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-37-his-face-frozen-so-men-can-behold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:29 — *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses’ hand... that Moses wist not that the skin of his face shone while he talked with him.* As Enoch''s face had to be frozen lest no man behold it (2 Enoch 37:2), so Moses came down from the glory with a face transfigured.'
  FROM cross_reference_threads t, cross_references x, _session411_2en37_lookup sv, _session411_2en37_lookup tv
 WHERE t.slug='2-enoch-37-his-face-frozen-so-men-can-behold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=37 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:30 — *And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him.* That no man could behold Enoch''s face in 2 Enoch 37:2 is Israel''s fear before the shining face of Moses fresh from the mount.'
  FROM cross_reference_threads t, cross_references x, _session411_2en37_lookup sv, _session411_2en37_lookup tv
 WHERE t.slug='2-enoch-37-his-face-frozen-so-men-can-behold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=37 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* Enoch''s inability to endure the terror of Yahuah in 2 Enoch 37:1 stands within the boundary the Lord set with Moses: no man sees His face and lives.'
  FROM cross_reference_threads t, cross_references x, _session411_2en37_lookup sv, _session411_2en37_lookup tv
 WHERE t.slug='2-enoch-37-his-face-frozen-so-men-can-behold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_38.sql (session411 2-enoch 38) -----
-- Source anchor: pseudepigrapha/2-enoch ch38. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en38 (view _session411_2en38_lookup). Sort band base 82925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-38-gather-the-household-to-hear
  ('pseudepigrapha', '2-enoch', 38, 3, 'canon', 'genesis', 49, 1, 'free', E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* Enoch''s call to gather his household and tell them everything in 2 Enoch 38:3 is Jacob''s gathering of his sons before his end.'),
  ('pseudepigrapha', '2-enoch', 38, 3, 'canon', 'deuteronomy', 31, 12, 'free', E'Deuteronomy 31:12 — *Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law.* That all his household come together to hear in 2 Enoch 38:3 is the assembling-to-hear the law commands.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-38-gather-the-household-to-hear',
       E'Let all my household come together, that I tell them everything',
       E'Returned to earth, Enoch finds Methuselah keeping watch, and his first word is to assemble his house: *Let all my household come together, that I tell them everything* (2 Enoch 38:3). It ain''t new — this is the patriarch''s own posture, gathering his sons to hear before he departs: *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days* (Genesis 49:1), *Gather yourselves together, and hear, ye sons of Jacob* (Genesis 49:2). And it is the command of the law for the whole assembly: *Gather the people together, men, and women, and children... that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law* (Deuteronomy 31:12). The gathering of the household to hear the father''s witness is the gathering Moses and Jacob already command.',
       sv.verse_id, ev.verse_id, 'extras', 82925
  FROM _session411_2en38_lookup sv, _session411_2en38_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=38 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-38-gather-the-household-to-hear
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* Enoch''s call to gather his household and tell them everything in 2 Enoch 38:3 is Jacob''s gathering of his sons before his end.'
  FROM cross_reference_threads t, cross_references x, _session411_2en38_lookup sv, _session411_2en38_lookup tv
 WHERE t.slug='2-enoch-38-gather-the-household-to-hear'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:12 — *Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law.* That all his household come together to hear in 2 Enoch 38:3 is the assembling-to-hear the law commands.'
  FROM cross_reference_threads t, cross_references x, _session411_2en38_lookup sv, _session411_2en38_lookup tv
 WHERE t.slug='2-enoch-38-gather-the-household-to-hear'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_39.sql (session411 2-enoch 39) -----
-- Source anchor: pseudepigrapha/2-enoch ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en39 (view _session411_2en39_lookup). Sort band base 82950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-39-not-my-lips-but-the-lords
  ('pseudepigrapha', '2-enoch', 39, 2, 'canon', 'deuteronomy', 18, 18, 'free', E'Deuteronomy 18:18 — *I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.* Enoch announcing not from his own lips but from Yahuah''s (2 Enoch 39:2) is the prophet whose mouth carries the words Yahuah puts in it.'),
  ('pseudepigrapha', '2-enoch', 39, 2, 'canon', 'psalms', 78, 1, 'free', E'Psalms 78:1 — *Give ear, O my people, to my law: incline your ears to the words of my mouth.* Enoch''s appeal that his children hear the words of his lips because they come from Yahuah (2 Enoch 39:2-3) is the psalmist''s call to incline the ear to the law set in his mouth.'),
  -- thread: 2-enoch-39-i-have-seen-the-lords-face
  ('pseudepigrapha', '2-enoch', 39, 3, 'canon', 'isaiah', 6, 1, 'free', E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Enoch''s testimony that he has seen Yahuah''s face (2 Enoch 39:3) is Isaiah''s own sight of the Lord enthroned, high and lifted up.'),
  ('pseudepigrapha', '2-enoch', 39, 4, 'canon', 'job', 42, 5, 'free', E'Job 42:5 — *I have heard of thee by the hearing of the ear: but now mine eye seeth thee.* Enoch contrasting hearing with having seen Yahuah''s eyes (2 Enoch 39:4) is Job''s passage from hearsay to sight of the Almighty.'),
  ('pseudepigrapha', '2-enoch', 39, 3, 'canon', 'john', 1, 18, 'free', E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* Enoch''s seeing of Yahuah''s face in 2 Enoch 39:3 is held within the boundary John names — what is beheld is the glory afar, not the unseen Father uncovered.'),
  ('pseudepigrapha', '2-enoch', 39, 5, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* Enoch''s beholding of Yahuah''s right hand filling heaven (2 Enoch 39:5) is the same order of vision as Paul caught up into paradise to hear unspeakable things.'),
  -- thread: 2-enoch-39-fearful-to-come-before-the-ruler-of-heaven
  ('pseudepigrapha', '2-enoch', 39, 8, 'canon', 'isaiah', 6, 5, 'free', E'Isaiah 6:5 — *Then said I, Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts).* Enoch''s dread of coming before the ruler of heaven (2 Enoch 39:8) is Isaiah''s undoing before the King his eyes had seen.'),
  ('pseudepigrapha', '2-enoch', 39, 8, 'canon', 'deuteronomy', 6, 13, 'free', E'Deuteronomy 6:13 — *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name.* The terror of standing before the controller of quick and dead in 2 Enoch 39:8 is the fear of Yahuah the law lays on every soul.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-39-not-my-lips-but-the-lords',
       E'Not from my lips, but from Yahuah''s lips',
       E'Enoch tells his children that what he speaks is not his own: *I have been let come to you to-day, and announce to you, not from my lips, but from Yahuah''s (Lord''s) lips, all that is and was... and all that will be till judgment-day* (2 Enoch 39:2), *You hear therefore the words of my lips... but I am one who has seen Yahuah''s (Lord''s) face* (2 Enoch 39:3). It ain''t new — this is the prophet''s whole standing, the spokesman who carries another''s words: *Give ear, O my people, to my law: incline your ears to the words of my mouth. I will open my mouth in a parable: I will utter dark sayings of old* (Psalms 78:1-2), and the law''s promise of the mouth that speaks not its own, *I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The seer claims no authority of his own — only the lips of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 82950
  FROM _session411_2en39_lookup sv, _session411_2en39_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=39 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-39-i-have-seen-the-lords-face',
       E'I have seen Yahuah''s face — the seer who beheld from afar',
       E'Enoch sets his frail manhood against what he has been shown: *I am one who has seen Yahuah''s (Lord''s) face, like iron made to glow from fire* (2 Enoch 39:3), *but I have seen Yahuah''s (Lord''s) eyes, shining like the sun''s rays* (2 Enoch 39:4), *but I have seen Yahuah''s (Lord''s) right hand filling heaven as he helped me* (2 Enoch 39:5). It ain''t new — this is the prophets'' own witness of beholding the Holy One on His throne: *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1); and Job, taught at last by sight, *I have heard of thee by the hearing of the ear: but now mine eye seeth thee* (Job 42:5). Yet the boundary holds — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18) — so what the seer beholds is the glory afar, the likeness Paul too was caught up to, *caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). Enoch beholds, and is undone, as every true seer is.',
       sv.verse_id, ev.verse_id, 'extras', 82953
  FROM _session411_2en39_lookup sv, _session411_2en39_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=39 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-39-fearful-to-come-before-the-ruler-of-heaven',
       E'How fearful to come before the face of the ruler of heaven',
       E'Enoch closes by weighing the dread of the heavenly court: *how fearful and awful it is to come before the face of the ruler of the earth, how much more terrible and awful it is to come before the face of the ruler of heaven, the controller of quick and dead... Who can endure that endless pain?* (2 Enoch 39:8). It ain''t new — this is the fear of Yahuah the wise have always known: *The fear of Yahuah (LORD) is the beginning of wisdom* — and the prophet''s cry before the throne, *Woe is me! for I am undone; because I am a man of unclean lips... for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts)* (Isaiah 6:5). The One who judges quick and dead is the One Moses bids Israel fear: *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him* (Deuteronomy 6:13). The seer''s trembling is the trembling every flesh owes the Maker.',
       sv.verse_id, ev.verse_id, 'extras', 82956
  FROM _session411_2en39_lookup sv, _session411_2en39_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=39 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-39-not-my-lips-but-the-lords
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:18 — *I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.* Enoch announcing not from his own lips but from Yahuah''s (2 Enoch 39:2) is the prophet whose mouth carries the words Yahuah puts in it.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-not-my-lips-but-the-lords'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 78:1 — *Give ear, O my people, to my law: incline your ears to the words of my mouth.* Enoch''s appeal that his children hear the words of his lips because they come from Yahuah (2 Enoch 39:2-3) is the psalmist''s call to incline the ear to the law set in his mouth.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-not-my-lips-but-the-lords'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-39-i-have-seen-the-lords-face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Enoch''s testimony that he has seen Yahuah''s face (2 Enoch 39:3) is Isaiah''s own sight of the Lord enthroned, high and lifted up.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-i-have-seen-the-lords-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 42:5 — *I have heard of thee by the hearing of the ear: but now mine eye seeth thee.* Enoch contrasting hearing with having seen Yahuah''s eyes (2 Enoch 39:4) is Job''s passage from hearsay to sight of the Almighty.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-i-have-seen-the-lords-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=42 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* Enoch''s seeing of Yahuah''s face in 2 Enoch 39:3 is held within the boundary John names — what is beheld is the glory afar, not the unseen Father uncovered.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-i-have-seen-the-lords-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* Enoch''s beholding of Yahuah''s right hand filling heaven (2 Enoch 39:5) is the same order of vision as Paul caught up into paradise to hear unspeakable things.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-i-have-seen-the-lords-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-39-fearful-to-come-before-the-ruler-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:5 — *Then said I, Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts).* Enoch''s dread of coming before the ruler of heaven (2 Enoch 39:8) is Isaiah''s undoing before the King his eyes had seen.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-fearful-to-come-before-the-ruler-of-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:13 — *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name.* The terror of standing before the controller of quick and dead in 2 Enoch 39:8 is the fear of Yahuah the law lays on every soul.'
  FROM cross_reference_threads t, cross_references x, _session411_2en39_lookup sv, _session411_2en39_lookup tv
 WHERE t.slug='2-enoch-39-fearful-to-come-before-the-ruler-of-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=39 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_40.sql (session411 2-enoch 40) -----
-- Source anchor: pseudepigrapha/2-enoch ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en40 (view _session411_2en40_lookup). Sort band base 82975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-40-the-measures-and-foundations-written
  ('pseudepigrapha', '2-enoch', 40, 9, 'canon', 'job', 38, 5, 'free', E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* Enoch measuring out the whole earth and its bounds in 2 Enoch 40:9 records the measures Yahuah asks Job who laid.'),
  ('pseudepigrapha', '2-enoch', 40, 9, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The earth''s measures and mountains Enoch writes in 2 Enoch 40:9 are the foundations Yahuah laid before any man could declare them.'),
  ('pseudepigrapha', '2-enoch', 40, 3, 'canon', 'proverbs', 8, 27, 'free', E'Proverbs 8:27 — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth.* Enoch''s measuring of the stars and the sun''s circle in 2 Enoch 40:3,5 traces the ordered heavens Wisdom watched Yahuah set with the compass.'),
  ('pseudepigrapha', '2-enoch', 40, 5, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch counting the sun''s circle and hours in 2 Enoch 40:5 records the appointed courses the psalm gives the sun and moon.'),
  -- thread: 2-enoch-40-the-prisoners-awaiting-judgment-written
  ('pseudepigrapha', '2-enoch', 40, 10, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* The prisoners in pain expecting the limitless judgment in 2 Enoch 40:10 are the bound reserved unto judgment Peter describes.'),
  ('pseudepigrapha', '2-enoch', 40, 11, 'canon', 'ecclesiastes', 12, 14, 'free', E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* Enoch writing down all who are judged with their works and sentences (2 Enoch 40:11) is the bringing of every work into judgment Solomon declares.'),
  ('pseudepigrapha', '2-enoch', 40, 11, 'enoch', '1-enoch', 81, 2, 'extras', E'1 Enoch 81:2 — *And I observed everything on the heavenly tablets, And read everything which was written (thereon), And understood everything... All the works of men.* The works and sentences Enoch writes down in 2 Enoch 40:11 are the works of men he read on the heavenly tablets in his own book.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-40-the-measures-and-foundations-written',
       E'The measures of the stars, sun, and earth — written down',
       E'Enoch testifies he was shown and wrote the ordinances of creation: *I have measured and described the stars, the great countless multitude of them* (2 Enoch 40:3), *I measured the sun''s circle, and measured its rays, counted the hours* (2 Enoch 40:5), *And I measured out the whole earth, its mountains, and all hills, fields, trees, stones, rivers... the height from earth to the seventh heaven* (2 Enoch 40:9). It ain''t new — these are the very measures Yahuah laid out and pressed upon Job: *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding. Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* (Job 38:4-5). They are the works of Wisdom present at creation, *When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27), and the appointed lights of the psalm, *He appointed the moon for seasons: the sun knoweth his going down* (Psalms 104:19). What Enoch wrote, the prophets confess: the Maker set every measure.',
       sv.verse_id, ev.verse_id, 'extras', 82975
  FROM _session411_2en40_lookup sv, _session411_2en40_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=40 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-40-the-prisoners-awaiting-judgment-written',
       E'The prisoners in pain and all that are judged — written down',
       E'Enoch''s books reach past the lights to the place of sentence: *I saw how the prisoners are in pain, expecting the limitless judgment. And I wrote down all those being judged by the judge, and all their judgment and sentences and all their works* (2 Enoch 40:10-11). It ain''t new — this is the bound waiting for judgment Peter and Jude name: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). And the writing-down of every work for the judgment is the books of remembrance the prophets keep — what Enoch was charged to record in his own book: *Observe, Enoch, these heavenly tablets, And read what is written thereon... All the works of men* (1 Enoch 81:1-2). Enoch''s ledger of works and sentences is the very ledger the judgment opens.',
       sv.verse_id, ev.verse_id, 'extras', 82978
  FROM _session411_2en40_lookup sv, _session411_2en40_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=40 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-40-the-measures-and-foundations-written
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* Enoch measuring out the whole earth and its bounds in 2 Enoch 40:9 records the measures Yahuah asks Job who laid.'
  FROM cross_reference_threads t, cross_references x, _session411_2en40_lookup sv, _session411_2en40_lookup tv
 WHERE t.slug='2-enoch-40-the-measures-and-foundations-written'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The earth''s measures and mountains Enoch writes in 2 Enoch 40:9 are the foundations Yahuah laid before any man could declare them.'
  FROM cross_reference_threads t, cross_references x, _session411_2en40_lookup sv, _session411_2en40_lookup tv
 WHERE t.slug='2-enoch-40-the-measures-and-foundations-written'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:27 — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth.* Enoch''s measuring of the stars and the sun''s circle in 2 Enoch 40:3,5 traces the ordered heavens Wisdom watched Yahuah set with the compass.'
  FROM cross_reference_threads t, cross_references x, _session411_2en40_lookup sv, _session411_2en40_lookup tv
 WHERE t.slug='2-enoch-40-the-measures-and-foundations-written'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch counting the sun''s circle and hours in 2 Enoch 40:5 records the appointed courses the psalm gives the sun and moon.'
  FROM cross_reference_threads t, cross_references x, _session411_2en40_lookup sv, _session411_2en40_lookup tv
 WHERE t.slug='2-enoch-40-the-measures-and-foundations-written'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-40-the-prisoners-awaiting-judgment-written
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* The prisoners in pain expecting the limitless judgment in 2 Enoch 40:10 are the bound reserved unto judgment Peter describes.'
  FROM cross_reference_threads t, cross_references x, _session411_2en40_lookup sv, _session411_2en40_lookup tv
 WHERE t.slug='2-enoch-40-the-prisoners-awaiting-judgment-written'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* Enoch writing down all who are judged with their works and sentences (2 Enoch 40:11) is the bringing of every work into judgment Solomon declares.'
  FROM cross_reference_threads t, cross_references x, _session411_2en40_lookup sv, _session411_2en40_lookup tv
 WHERE t.slug='2-enoch-40-the-prisoners-awaiting-judgment-written'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 81:2 — *And I observed everything on the heavenly tablets, And read everything which was written (thereon), And understood everything... All the works of men.* The works and sentences Enoch writes down in 2 Enoch 40:11 are the works of men he read on the heavenly tablets in his own book.'
  FROM cross_reference_threads t, cross_references x, _session411_2en40_lookup sv, _session411_2en40_lookup tv
 WHERE t.slug='2-enoch-40-the-prisoners-awaiting-judgment-written'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=40 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=81 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_41.sql (session411 2-enoch 41) -----
-- Source anchor: pseudepigrapha/2-enoch ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en41 (view _session411_2en41_lookup). Sort band base 83000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-41-weeping-over-adams-transgression
  ('pseudepigrapha', '2-enoch', 41, 1, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The ruin and dishonour of Adam Enoch weeps over in 2 Enoch 41:1 is the curse of dust and death pronounced in Eden.'),
  ('pseudepigrapha', '2-enoch', 41, 1, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Enoch''s grief over the forefathers'' ruin in 2 Enoch 41:1-2 is the death that passed on all men from the one man''s transgression.'),
  -- thread: 2-enoch-41-blessed-is-the-man-who-sins-not
  ('pseudepigrapha', '2-enoch', 41, 3, 'canon', 'psalms', 1, 1, 'free', E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* Enoch''s blessing on the man who shall not sin before Yahuah''s face (2 Enoch 41:3) is the Psalter''s opening beatitude on the man who keeps from the way of sinners.'),
  ('pseudepigrapha', '2-enoch', 41, 3, 'canon', 'ecclesiastes', 7, 20, 'free', E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* Enoch''s longing for the man who shall not sin (2 Enoch 41:3) is set against the preacher''s truth that no man on earth is wholly without sin.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-41-weeping-over-adams-transgression',
       E'Weeping over the ruin of Adam and the forefathers',
       E'Enoch sees the fathers and is broken over the fall that bound them: *I saw all forefathers from all time with Adam and Eva, and I sighed and broke into tears and said of the ruin of their dishonour: Woe is me for my infirmity and for that of my forefathers* (2 Enoch 41:1-2). It ain''t new — this is the ruin Moses records when the man hearkened and the ground was cursed: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life... for dust thou art, and unto dust shalt thou return* (Genesis 3:17,19). It is the entrance of death the apostle traces to that one man: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). Enoch weeps not over a new doctrine but over the old wound the whole Scripture mourns.',
       sv.verse_id, ev.verse_id, 'extras', 83000
  FROM _session411_2en41_lookup sv, _session411_2en41_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=41 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=41 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-41-blessed-is-the-man-who-sins-not',
       E'Blessed is the man who shall not sin before Yahuah''s face',
       E'Out of his weeping Enoch utters a beatitude: *Blessed is the man who has not been born or who has been born and shall not sin before Yahuah''s (Lord''s) face, that he come not into this place, nor bring the yoke of this place* (2 Enoch 41:3). It ain''t new — the Psalter opens with the same blessing on the one who keeps clear of sin''s way: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalms 1:1). And it holds the same sober truth the preacher tells, that none is clean of himself: *For there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20). Enoch''s blessing is the Psalm''s blessing — happy the man who does not bring the yoke of sin upon himself.',
       sv.verse_id, ev.verse_id, 'extras', 83003
  FROM _session411_2en41_lookup sv, _session411_2en41_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=41 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=41 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-41-weeping-over-adams-transgression
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The ruin and dishonour of Adam Enoch weeps over in 2 Enoch 41:1 is the curse of dust and death pronounced in Eden.'
  FROM cross_reference_threads t, cross_references x, _session411_2en41_lookup sv, _session411_2en41_lookup tv
 WHERE t.slug='2-enoch-41-weeping-over-adams-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=41 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Enoch''s grief over the forefathers'' ruin in 2 Enoch 41:1-2 is the death that passed on all men from the one man''s transgression.'
  FROM cross_reference_threads t, cross_references x, _session411_2en41_lookup sv, _session411_2en41_lookup tv
 WHERE t.slug='2-enoch-41-weeping-over-adams-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=41 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-41-blessed-is-the-man-who-sins-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* Enoch''s blessing on the man who shall not sin before Yahuah''s face (2 Enoch 41:3) is the Psalter''s opening beatitude on the man who keeps from the way of sinners.'
  FROM cross_reference_threads t, cross_references x, _session411_2en41_lookup sv, _session411_2en41_lookup tv
 WHERE t.slug='2-enoch-41-blessed-is-the-man-who-sins-not'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* Enoch''s longing for the man who shall not sin (2 Enoch 41:3) is set against the preacher''s truth that no man on earth is wholly without sin.'
  FROM cross_reference_threads t, cross_references x, _session411_2en41_lookup sv, _session411_2en41_lookup tv
 WHERE t.slug='2-enoch-41-blessed-is-the-man-who-sins-not'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_42.sql (session411 2-enoch 42) -----
-- Source anchor: pseudepigrapha/2-enoch ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en42 (view _session411_2en42_lookup). Sort band base 83025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-42-the-lords-works-are-right
  ('pseudepigrapha', '2-enoch', 42, 1, 'canon', 'deuteronomy', 32, 4, 'free', E'Deuteronomy 32:4 — *He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he.* That all Yahuah''s works are right in 2 Enoch 42:1 is the confession of Moses'' song, that the Rock''s work is perfect and just.'),
  ('pseudepigrapha', '2-enoch', 42, 1, 'canon', 'psalms', 145, 17, 'free', E'Psalms 145:17 — *Yahuah (LORD) is righteous in all his ways, and holy in all his works.* Enoch''s sight that Yahuah''s works are right (2 Enoch 42:1) is the psalm''s praise of Him as righteous in all His ways.'),
  ('pseudepigrapha', '2-enoch', 42, 1, 'canon', 'matthew', 7, 20, 'free', E'Matthew 7:20 — *Wherefore by their fruits ye shall know them.* That those who lie evilly are known in their works (2 Enoch 42:1) is the Master''s rule that men are known by their fruits.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-42-the-lords-works-are-right',
       E'All Yahuah''s works are right; man''s works are known',
       E'Past the guards of hell Enoch sets the Lord''s works against man''s: *I saw all Yahuah''s (Lord''s) works, how they are right, while the works of man are some good, and others bad, and in their works are known those who lie evilly* (2 Enoch 42:1). It ain''t new — Moses'' song confesses the same of the Maker: *He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he* (Deuteronomy 32:4), and the psalm, *Yahuah (LORD) is righteous in all his ways, and holy in all his works* (Psalms 145:17). And that men are known by their deeds is the Master''s own test: *Wherefore by their fruits ye shall know them* (Matthew 7:20). 2 Enoch adds nothing — the works of Yahuah are right, and a man''s works lay him bare.',
       sv.verse_id, ev.verse_id, 'extras', 83025
  FROM _session411_2en42_lookup sv, _session411_2en42_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=42 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-42-the-lords-works-are-right
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:4 — *He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he.* That all Yahuah''s works are right in 2 Enoch 42:1 is the confession of Moses'' song, that the Rock''s work is perfect and just.'
  FROM cross_reference_threads t, cross_references x, _session411_2en42_lookup sv, _session411_2en42_lookup tv
 WHERE t.slug='2-enoch-42-the-lords-works-are-right'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 145:17 — *Yahuah (LORD) is righteous in all his ways, and holy in all his works.* Enoch''s sight that Yahuah''s works are right (2 Enoch 42:1) is the psalm''s praise of Him as righteous in all His ways.'
  FROM cross_reference_threads t, cross_references x, _session411_2en42_lookup sv, _session411_2en42_lookup tv
 WHERE t.slug='2-enoch-42-the-lords-works-are-right'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:20 — *Wherefore by their fruits ye shall know them.* That those who lie evilly are known in their works (2 Enoch 42:1) is the Master''s rule that men are known by their fruits.'
  FROM cross_reference_threads t, cross_references x, _session411_2en42_lookup sv, _session411_2en42_lookup tv
 WHERE t.slug='2-enoch-42-the-lords-works-are-right'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_43.sql (session411 2-enoch 43) -----
-- Source anchor: pseudepigrapha/2-enoch ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en43 (view _session411_2en43_lookup). Sort band base 83050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-43-none-better-than-he-who-fears-god
  ('pseudepigrapha', '2-enoch', 43, 2, 'canon', 'ecclesiastes', 12, 13, 'free', E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* Enoch''s verdict that none is better than he who fears Elohim (2 Enoch 43:2) is the preacher''s conclusion of the whole matter.'),
  ('pseudepigrapha', '2-enoch', 43, 2, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* That the fearer of Elohim is best of all in 2 Enoch 43:2 rests on the proverb that the fear of Yahuah is wisdom''s beginning.'),
  ('pseudepigrapha', '2-enoch', 43, 2, 'canon', '1-samuel', 2, 30, 'free', E'1 Samuel 2:30 — *...for them that honour me I will honour, and they that despise me shall be lightly esteemed.* That the man who fears Elohim shall be more glorious in time to come (2 Enoch 43:2) is Yahuah''s pledge to honour those who honour Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-43-none-better-than-he-who-fears-god',
       E'None better than he who fears Elohim',
       E'Enoch weighs the kinds of honour among men — possessions, wisdom, strength, comeliness — and lays them all beneath one: *let it be heard everywhere, but there is none better than he who fears Elohim (God), he shall be more glorious in time to come* (2 Enoch 43:2). It ain''t new — this is the conclusion of the whole matter the preacher reaches: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13), and the beginning of all true wisdom, *The fear of Yahuah (LORD) is the beginning of wisdom* (Proverbs 9:10). The honour Enoch promises in time to come rests on the word Yahuah spoke at Shiloh: *them that honour me I will honour, and they that despise me shall be lightly esteemed* (1 Samuel 2:30). Above every earthly excellence, the fearer of Elohim is most glorious — as Moses and the prophets have always said.',
       sv.verse_id, ev.verse_id, 'extras', 83050
  FROM _session411_2en43_lookup sv, _session411_2en43_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=43 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-43-none-better-than-he-who-fears-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* Enoch''s verdict that none is better than he who fears Elohim (2 Enoch 43:2) is the preacher''s conclusion of the whole matter.'
  FROM cross_reference_threads t, cross_references x, _session411_2en43_lookup sv, _session411_2en43_lookup tv
 WHERE t.slug='2-enoch-43-none-better-than-he-who-fears-god'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* That the fearer of Elohim is best of all in 2 Enoch 43:2 rests on the proverb that the fear of Yahuah is wisdom''s beginning.'
  FROM cross_reference_threads t, cross_references x, _session411_2en43_lookup sv, _session411_2en43_lookup tv
 WHERE t.slug='2-enoch-43-none-better-than-he-who-fears-god'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:30 — *...for them that honour me I will honour, and they that despise me shall be lightly esteemed.* That the man who fears Elohim shall be more glorious in time to come (2 Enoch 43:2) is Yahuah''s pledge to honour those who honour Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en43_lookup sv, _session411_2en43_lookup tv
 WHERE t.slug='2-enoch-43-none-better-than-he-who-fears-god'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_44.sql (session411 2-enoch 44) -----
-- Source anchor: pseudepigrapha/2-enoch ch44. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en44 (view _session411_2en44_lookup). Sort band base 83075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en44_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-44-man-in-the-likeness-of-gods-face
  ('pseudepigrapha', '2-enoch', 44, 1, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* That Yahuah made man in the likeness of His own face (2 Enoch 44:1) is the image of Elohim Moses sets at creation.'),
  ('pseudepigrapha', '2-enoch', 44, 1, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea...* The likeness of His own face in which man was made (2 Enoch 44:1) is the image and likeness Elohim purposed at the forming of man.'),
  ('pseudepigrapha', '2-enoch', 44, 2, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* That he who spits on or reviles the face of man is cut down at Yahuah''s judgment (2 Enoch 44:2) follows the law that reckons violence to man by the image of Elohim he bears.'),
  ('pseudepigrapha', '2-enoch', 44, 2, 'canon', 'james', 3, 9, 'free', E'James 3:9 — *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God).* Reviling and abhorring the face of man as despising Yahuah''s face (2 Enoch 44:2) is the very contradiction James names — cursing men made after the similitude of Elohim.'),
  -- thread: 2-enoch-44-charity-to-the-needy-and-the-scales
  ('pseudepigrapha', '2-enoch', 44, 3, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The blessing on him who does charity to the needy and takes his reward by measure (2 Enoch 44:3) is the proverb that pity to the poor is a loan to Yahuah, repaid.'),
  ('pseudepigrapha', '2-enoch', 44, 3, 'canon', 'proverbs', 14, 31, 'free', E'Proverbs 14:31 — *He that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor.* That helping the broken down and the needy is blessed (2 Enoch 44:3) is the proverb that mercy to the poor honours their Maker.'),
  ('pseudepigrapha', '2-enoch', 44, 3, 'canon', 'matthew', 25, 40, 'free', E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* That charity to the needy is weighed for reward at the great judgment (2 Enoch 44:3) is the Master''s reckoning of mercy to the least as done unto Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en44_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en44_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-44-man-in-the-likeness-of-gods-face',
       E'Man made in the likeness of His face — revile man, despise Yahuah',
       E'The heart of Enoch''s testament: *Yahuah (Lord) with his hands having created man, in the likeness of his own face... Whoever reviles the ruler''s face, and abhors Yahuah''s (Lord''s) face, has despised Yahuah''s (Lord''s) face... he who spits on the face of man reproachfully, will be cut down at Yahuah''s (Lord''s) great judgment* (2 Enoch 44:1-2). It ain''t new — to wound the man is to insult his Maker, because the man bears His image: *And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26), *So Elohim (God) created man in his own image* (Genesis 1:27), and the blood-guilt itself is reckoned by that image, *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). James names the very contradiction Enoch condemns: *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God)* (James 3:9). To revile the face of man is to despise the likeness of Elohim — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 83075
  FROM _session411_2en44_lookup sv, _session411_2en44_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=44 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-44-charity-to-the-needy-and-the-scales',
       E'Charity to the needy, and every measure weighed at judgment',
       E'Enoch turns the image-bearing of man into a charge of mercy: *Blessed is the man who does not direct his heart with malice against any man, and helps the injured and condemned, and raises the broken down, and shall do charity to the needy* (2 Enoch 44:3) — *because on the day of the great judgment every weight, every measure and every makeweight will be... hung on scales... and according to his measure shall take his reward* (2 Enoch 44:3). It ain''t new — to help the poor is to lend to Yahuah Himself: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17), and *He that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor* (Proverbs 14:31). The Master makes the same the measure of the judgment: *Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me* (Matthew 25:40). The scales Enoch foresees are the scales of the law — mercy to the image-bearer is mercy reckoned to his Maker.',
       sv.verse_id, ev.verse_id, 'extras', 83078
  FROM _session411_2en44_lookup sv, _session411_2en44_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=44 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-44-man-in-the-likeness-of-gods-face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* That Yahuah made man in the likeness of His own face (2 Enoch 44:1) is the image of Elohim Moses sets at creation.'
  FROM cross_reference_threads t, cross_references x, _session411_2en44_lookup sv, _session411_2en44_lookup tv
 WHERE t.slug='2-enoch-44-man-in-the-likeness-of-gods-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea...* The likeness of His own face in which man was made (2 Enoch 44:1) is the image and likeness Elohim purposed at the forming of man.'
  FROM cross_reference_threads t, cross_references x, _session411_2en44_lookup sv, _session411_2en44_lookup tv
 WHERE t.slug='2-enoch-44-man-in-the-likeness-of-gods-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* That he who spits on or reviles the face of man is cut down at Yahuah''s judgment (2 Enoch 44:2) follows the law that reckons violence to man by the image of Elohim he bears.'
  FROM cross_reference_threads t, cross_references x, _session411_2en44_lookup sv, _session411_2en44_lookup tv
 WHERE t.slug='2-enoch-44-man-in-the-likeness-of-gods-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 3:9 — *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God).* Reviling and abhorring the face of man as despising Yahuah''s face (2 Enoch 44:2) is the very contradiction James names — cursing men made after the similitude of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en44_lookup sv, _session411_2en44_lookup tv
 WHERE t.slug='2-enoch-44-man-in-the-likeness-of-gods-face'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-44-charity-to-the-needy-and-the-scales
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The blessing on him who does charity to the needy and takes his reward by measure (2 Enoch 44:3) is the proverb that pity to the poor is a loan to Yahuah, repaid.'
  FROM cross_reference_threads t, cross_references x, _session411_2en44_lookup sv, _session411_2en44_lookup tv
 WHERE t.slug='2-enoch-44-charity-to-the-needy-and-the-scales'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 14:31 — *He that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor.* That helping the broken down and the needy is blessed (2 Enoch 44:3) is the proverb that mercy to the poor honours their Maker.'
  FROM cross_reference_threads t, cross_references x, _session411_2en44_lookup sv, _session411_2en44_lookup tv
 WHERE t.slug='2-enoch-44-charity-to-the-needy-and-the-scales'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* That charity to the needy is weighed for reward at the great judgment (2 Enoch 44:3) is the Master''s reckoning of mercy to the least as done unto Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en44_lookup sv, _session411_2en44_lookup tv
 WHERE t.slug='2-enoch-44-charity-to-the-needy-and-the-scales'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_45.sql (session411 2-enoch 45) -----
-- Source anchor: pseudepigrapha/2-enoch ch45. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en45 (view _session411_2en45_lookup). Sort band base 83100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en45_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-45-pure-hearts-not-sacrifice
  ('pseudepigrapha', '2-enoch', 45, 3, 'canon', '1-samuel', 15, 22, 'free', E'1 Samuel 15:22 — *And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams.* Enoch''s word that the sacrifice without a pure heart is "nothing" is Samuel''s own verdict over Saul.'),
  ('pseudepigrapha', '2-enoch', 45, 3, 'canon', 'psalms', 51, 17, 'free', E'Psalms 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* The pure heart Elohim demands in 2 Enoch 45:3 is David''s broken and contrite heart, the sacrifice He will not despise.'),
  ('pseudepigrapha', '2-enoch', 45, 3, 'canon', 'psalms', 51, 16, 'free', E'Psalms 51:16 — *For thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering.* That bread and beasts and offerings are "nothing" without the heart is the psalm''s own confession that Yahuah does not desire mere sacrifice.'),
  ('pseudepigrapha', '2-enoch', 45, 3, 'canon', 'hosea', 6, 6, 'free', E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* Enoch''s contrast of pure hearts against the flesh of beasts is the very word Yahuah spoke through Hosea.'),
  ('pseudepigrapha', '2-enoch', 45, 3, 'canon', 'matthew', 9, 13, 'free', E'Matthew 9:13 — *But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.* The Messiah sends His hearers back to Hosea''s word, the same word Enoch teaches his sons — the heart, not the offering.'),
  ('pseudepigrapha', '2-enoch', 45, 1, 'canon', 'proverbs', 15, 8, 'free', E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* He who hastens to offer with a false heart gains nothing; Solomon already named the wicked man''s sacrifice an abomination.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en45_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en45_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-45-pure-hearts-not-sacrifice',
       E'Elohim demands pure hearts, not the abundance of offerings',
       E'Enoch tells his sons that the heaping up of gifts buys nothing if the heart is false: *When Yahuah (Lord) demands bread, or candles, or the flesh of beasts, or any other sacrifice, then that is nothing; but Elohim (God) demands pure hearts, and with all that only tests the heart of man* (2 Enoch 45:3). This is no new teaching against the altar — it is the verdict Moses and the Prophets already gave. Samuel told Saul, *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22); the psalmist confessed, *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalms 51:17); Hosea heard Yahuah say, *For I desired mercy, and not sacrifice* (Hosea 6:6); and the Messiah sent the proud back to that very word: *go ye and learn what that meaneth, I will have mercy, and not sacrifice* (Matthew 9:13). It ain''t new — the One who tests the heart has always weighed it before the gift.',
       sv.verse_id, ev.verse_id, 'extras', 83100
  FROM _session411_2en45_lookup sv, _session411_2en45_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=45 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=45 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-45-pure-hearts-not-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 15:22 — *And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams.* Enoch''s word that the sacrifice without a pure heart is "nothing" is Samuel''s own verdict over Saul.'
  FROM cross_reference_threads t, cross_references x, _session411_2en45_lookup sv, _session411_2en45_lookup tv
 WHERE t.slug='2-enoch-45-pure-hearts-not-sacrifice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* The pure heart Elohim demands in 2 Enoch 45:3 is David''s broken and contrite heart, the sacrifice He will not despise.'
  FROM cross_reference_threads t, cross_references x, _session411_2en45_lookup sv, _session411_2en45_lookup tv
 WHERE t.slug='2-enoch-45-pure-hearts-not-sacrifice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 51:16 — *For thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering.* That bread and beasts and offerings are "nothing" without the heart is the psalm''s own confession that Yahuah does not desire mere sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session411_2en45_lookup sv, _session411_2en45_lookup tv
 WHERE t.slug='2-enoch-45-pure-hearts-not-sacrifice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* Enoch''s contrast of pure hearts against the flesh of beasts is the very word Yahuah spoke through Hosea.'
  FROM cross_reference_threads t, cross_references x, _session411_2en45_lookup sv, _session411_2en45_lookup tv
 WHERE t.slug='2-enoch-45-pure-hearts-not-sacrifice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 9:13 — *But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.* The Messiah sends His hearers back to Hosea''s word, the same word Enoch teaches his sons — the heart, not the offering.'
  FROM cross_reference_threads t, cross_references x, _session411_2en45_lookup sv, _session411_2en45_lookup tv
 WHERE t.slug='2-enoch-45-pure-hearts-not-sacrifice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* He who hastens to offer with a false heart gains nothing; Solomon already named the wicked man''s sacrifice an abomination.'
  FROM cross_reference_threads t, cross_references x, _session411_2en45_lookup sv, _session411_2en45_lookup tv
 WHERE t.slug='2-enoch-45-pure-hearts-not-sacrifice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=45 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_46.sql (session411 2-enoch 46) -----
-- Source anchor: pseudepigrapha/2-enoch ch46. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en46 (view _session411_2en46_lookup). Sort band base 83125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en46_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-46-gift-with-evil-in-the-heart
  ('pseudepigrapha', '2-enoch', 46, 2, 'canon', 'proverbs', 21, 2, 'free', E'Proverbs 21:2 — *Every way of a man is right in his own eyes: but Yahuah (LORD) pondereth the hearts.* Enoch''s ruler who detects the disloyal heart behind the gift is the shadow of Yahuah who weighs the hearts no flattery can hide.'),
  ('pseudepigrapha', '2-enoch', 46, 2, 'canon', 'proverbs', 15, 8, 'free', E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* The gift of the disloyal man, refused by the ruler in 2 Enoch 46:2, is the wicked man''s sacrifice Solomon calls an abomination.'),
  ('pseudepigrapha', '2-enoch', 46, 3, 'canon', 'psalms', 28, 3, 'free', E'Psalms 28:3 — *Draw me not away with the wicked, and with the workers of iniquity, which speak peace to their neighbours, but mischief is in their hearts.* The man who appears good "by deceit of tongue, but have evil in his heart" is the very deceiver David prays to be parted from.'),
  -- thread: 2-enoch-46-the-great-light-judges-just-and-unjust
  ('pseudepigrapha', '2-enoch', 46, 4, 'canon', 'ecclesiastes', 12, 14, 'free', E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* Enoch''s day when "no one shall escape notice" is the Preacher''s judgment of every secret thing.'),
  ('pseudepigrapha', '2-enoch', 46, 4, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened... and the dead were judged out of those things which were written in the books, according to their works.* The great light bringing judgment for just and unjust in 2 Enoch 46:4 is the open-book judgment John was shown.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en46_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en46_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-46-gift-with-evil-in-the-heart',
       E'The gift refused when the heart is treacherous',
       E'Enoch reasons from the earthly court to the heavenly one: a ruler refuses the gift of a disloyal man, *If any one bring any gifts to an earthly ruler, and have disloyal thoughts in his heart... will he not be angry with him, and not refuse his gifts* (2 Enoch 46:2), and the man who flatters with his tongue while hiding evil is condemned, *make himself appear good to another by deceit of tongue, but have evil in his heart... and himself be condemned* (2 Enoch 46:3). This is no new doctrine of the heart — Yahuah weighs what the eye cannot: *Every way of a man is right in his own eyes: but Yahuah (LORD) pondereth the hearts* (Proverbs 21:2), and the offering of the false man is already named: *The sacrifice of the wicked is an abomination to Yahuah (LORD)* (Proverbs 15:8). It ain''t new — the One who searches the heart sees through the gift.',
       sv.verse_id, ev.verse_id, 'extras', 83125
  FROM _session411_2en46_lookup sv, _session411_2en46_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=46 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=46 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-46-the-great-light-judges-just-and-unjust',
       E'A great light, and judgment for the just and the unjust',
       E'Enoch ends the chapter at the open court of the last day: *And when Yahuah (Lord) shall send a great light, then there will be judgment for the just and the unjust, and there no one shall escape notice* (2 Enoch 46:4). This is no new threat — the Preacher closed his book the same way, *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14); and the seer of the Revelation saw the books opened, *and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). It ain''t new — the day when none escapes notice is the day the prophets and the apostle alike foresaw.',
       sv.verse_id, ev.verse_id, 'extras', 83128
  FROM _session411_2en46_lookup sv, _session411_2en46_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=46 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-46-gift-with-evil-in-the-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:2 — *Every way of a man is right in his own eyes: but Yahuah (LORD) pondereth the hearts.* Enoch''s ruler who detects the disloyal heart behind the gift is the shadow of Yahuah who weighs the hearts no flattery can hide.'
  FROM cross_reference_threads t, cross_references x, _session411_2en46_lookup sv, _session411_2en46_lookup tv
 WHERE t.slug='2-enoch-46-gift-with-evil-in-the-heart'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=46 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:8 — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight.* The gift of the disloyal man, refused by the ruler in 2 Enoch 46:2, is the wicked man''s sacrifice Solomon calls an abomination.'
  FROM cross_reference_threads t, cross_references x, _session411_2en46_lookup sv, _session411_2en46_lookup tv
 WHERE t.slug='2-enoch-46-gift-with-evil-in-the-heart'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=46 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 28:3 — *Draw me not away with the wicked, and with the workers of iniquity, which speak peace to their neighbours, but mischief is in their hearts.* The man who appears good "by deceit of tongue, but have evil in his heart" is the very deceiver David prays to be parted from.'
  FROM cross_reference_threads t, cross_references x, _session411_2en46_lookup sv, _session411_2en46_lookup tv
 WHERE t.slug='2-enoch-46-gift-with-evil-in-the-heart'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=28 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-46-the-great-light-judges-just-and-unjust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* Enoch''s day when "no one shall escape notice" is the Preacher''s judgment of every secret thing.'
  FROM cross_reference_threads t, cross_references x, _session411_2en46_lookup sv, _session411_2en46_lookup tv
 WHERE t.slug='2-enoch-46-the-great-light-judges-just-and-unjust'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened... and the dead were judged out of those things which were written in the books, according to their works.* The great light bringing judgment for just and unjust in 2 Enoch 46:4 is the open-book judgment John was shown.'
  FROM cross_reference_threads t, cross_references x, _session411_2en46_lookup sv, _session411_2en46_lookup tv
 WHERE t.slug='2-enoch-46-the-great-light-judges-just-and-unjust'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_47.sql (session411 2-enoch 47) -----
-- Source anchor: pseudepigrapha/2-enoch ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en47 (view _session411_2en47_lookup). Sort band base 83150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-47-observe-the-handwriting-add-not
  ('pseudepigrapha', '2-enoch', 47, 4, 'canon', 'deuteronomy', 4, 2, 'free', E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* Enoch''s charge to observe his handwriting and not sin is Moses'' charge to keep the word whole, adding nothing and taking nothing away.'),
  ('pseudepigrapha', '2-enoch', 47, 4, 'canon', 'deuteronomy', 12, 32, 'free', E'Deuteronomy 12:32 — *What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it.* The handwriting to be observed without sinning in 2 Enoch 47:4 keeps the same fence Moses set: observe to do it, add not, diminish not.'),
  ('pseudepigrapha', '2-enoch', 47, 4, 'canon', 'psalms', 119, 160, 'free', E'Psalms 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* Enoch''s books that teach all from the beginning to the end of time echo the psalmist''s word, true from the beginning and enduring for ever.'),
  -- thread: 2-enoch-47-foundations-in-the-unknown
  ('pseudepigrapha', '2-enoch', 47, 5, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* Enoch''s foundations placed "in the unknown" are the very foundations Yahuah challenges Job to account for from the whirlwind.'),
  ('pseudepigrapha', '2-enoch', 47, 5, 'canon', 'isaiah', 40, 12, 'free', E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* Enoch''s unanswerable "who has counted the water... or the dust of the earth" is Isaiah''s own measuring of the Creator''s hand.'),
  ('pseudepigrapha', '2-enoch', 47, 5, 'canon', 'psalms', 104, 5, 'free', E'Psalms 104:5 — *Who laid the foundations of the earth, that it should not be removed for ever.* That Yahuah placed the foundations and fixed the earth on the waters (2 Enoch 47:5) is the psalmist''s praise of the earth laid never to be removed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-47-observe-the-handwriting-add-not',
       E'Observe the handwriting and you shall not sin',
       E'Enoch lays his books on his sons as a charge to keep: *if you will observe my handwriting, you will not sin against Yahuah (Lord); because there is no other except Yahuah (Lord), neither in heaven, nor in earth* (2 Enoch 47:4). The charge to keep the word whole, neither adding nor diminishing, is Moses'' own: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2), and again, *thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). And the confession that there is no other beside Him is the Shema''s own ground. It ain''t new — the seer hands down what Moses already commanded: keep it whole, and do not sin.',
       sv.verse_id, ev.verse_id, 'extras', 83150
  FROM _session411_2en47_lookup sv, _session411_2en47_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=47 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-47-foundations-in-the-unknown',
       E'He placed the foundations in the unknown',
       E'Enoch turns to the Maker no man can measure: *Yahuah (Lord) has placed the foundations in the unknown, and has spread forth heavens visible and invisible; he fixed the earth on the waters... who has counted the water... or the dust of the earth, or the sand of the sea... or the drops of the rain?* (2 Enoch 47:5). This is the very voice from the whirlwind: *Where wast thou when I laid the foundations of the earth?... Whereupon are the foundations thereof fastened?* (Job 38:4,6); and Isaiah''s: *Who hath measured the waters in the hollow of his hand... and comprehended the dust of the earth in a measure?* (Isaiah 40:12); and the psalmist''s praise, *Who laid the foundations of the earth, that it should not be removed for ever* (Psalms 104:5). It ain''t new — the unsearchable Maker Enoch confesses is the Creator Job, Isaiah, and the psalms already adored.',
       sv.verse_id, ev.verse_id, 'extras', 83153
  FROM _session411_2en47_lookup sv, _session411_2en47_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=47 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-47-observe-the-handwriting-add-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* Enoch''s charge to observe his handwriting and not sin is Moses'' charge to keep the word whole, adding nothing and taking nothing away.'
  FROM cross_reference_threads t, cross_references x, _session411_2en47_lookup sv, _session411_2en47_lookup tv
 WHERE t.slug='2-enoch-47-observe-the-handwriting-add-not'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 12:32 — *What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it.* The handwriting to be observed without sinning in 2 Enoch 47:4 keeps the same fence Moses set: observe to do it, add not, diminish not.'
  FROM cross_reference_threads t, cross_references x, _session411_2en47_lookup sv, _session411_2en47_lookup tv
 WHERE t.slug='2-enoch-47-observe-the-handwriting-add-not'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* Enoch''s books that teach all from the beginning to the end of time echo the psalmist''s word, true from the beginning and enduring for ever.'
  FROM cross_reference_threads t, cross_references x, _session411_2en47_lookup sv, _session411_2en47_lookup tv
 WHERE t.slug='2-enoch-47-observe-the-handwriting-add-not'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=160
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-47-foundations-in-the-unknown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* Enoch''s foundations placed "in the unknown" are the very foundations Yahuah challenges Job to account for from the whirlwind.'
  FROM cross_reference_threads t, cross_references x, _session411_2en47_lookup sv, _session411_2en47_lookup tv
 WHERE t.slug='2-enoch-47-foundations-in-the-unknown'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* Enoch''s unanswerable "who has counted the water... or the dust of the earth" is Isaiah''s own measuring of the Creator''s hand.'
  FROM cross_reference_threads t, cross_references x, _session411_2en47_lookup sv, _session411_2en47_lookup tv
 WHERE t.slug='2-enoch-47-foundations-in-the-unknown'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:5 — *Who laid the foundations of the earth, that it should not be removed for ever.* That Yahuah placed the foundations and fixed the earth on the waters (2 Enoch 47:5) is the psalmist''s praise of the earth laid never to be removed.'
  FROM cross_reference_threads t, cross_references x, _session411_2en47_lookup sv, _session411_2en47_lookup tv
 WHERE t.slug='2-enoch-47-foundations-in-the-unknown'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=47 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_48.sql (session411 2-enoch 48) -----
-- Source anchor: pseudepigrapha/2-enoch ch48. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en48 (view _session411_2en48_lookup). Sort band base 83175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en48_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-48-the-courses-of-the-sun
  ('pseudepigrapha', '2-enoch', 48, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The sun''s appointed circles and the count of days in 2 Enoch 48:1 are the lights set for signs and seasons on the fourth day.'),
  ('pseudepigrapha', '2-enoch', 48, 1, 'canon', 'psalms', 104, 19, 'free', E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch''s sun that "go down on a short day" and rests on its thrones is the psalmist''s sun that knows its going down by Yahuah''s appointment.'),
  ('pseudepigrapha', '2-enoch', 48, 3, 'canon', 'psalms', 19, 6, 'free', E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The measured course Enoch says was fixed "by his wisdom" is the sun''s circuit the psalmist sings, ordered from end to end of heaven.'),
  -- thread: 2-enoch-48-from-the-invisible-he-made-visible
  ('pseudepigrapha', '2-enoch', 48, 4, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* Enoch''s "from the invisible he made all things visible" is the very faith Hebrews names: the seen not made of things that appear.'),
  ('pseudepigrapha', '2-enoch', 48, 4, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *...even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The invisible Maker who brings the visible from the unseen (2 Enoch 48:4) is the God Paul confesses, who calls into being the things that are not.'),
  -- thread: 2-enoch-48-bear-the-yoke-of-the-books
  ('pseudepigrapha', '2-enoch', 48, 7, 'canon', 'matthew', 11, 29, 'free', E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* Enoch''s blessing on the man who bears the yoke of the books is answered in the Messiah''s yoke, which the lowly take up and find rest.'),
  ('pseudepigrapha', '2-enoch', 48, 7, 'canon', 'matthew', 11, 30, 'free', E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* The yoke that ends in release on the day of judgment (2 Enoch 48:7) is the easy yoke and light burden the Messiah lays on those who learn of Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en48_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en48_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-48-the-courses-of-the-sun',
       E'The sun along its heavenly circles, by measure and wisdom',
       E'Enoch recounts the ordered courses of the sun, its short day and big day, its rising and going down by appointed measure: *the sun go along the seven heavenly circles... he has two thrones on which he rests* (2 Enoch 48:1), *All this he measured, with good measurement of hours, and fixed a measure by his wisdom* (2 Enoch 48:3). The lights set in their courses are the work of the fourth day: *let them be for signs, and for seasons, and for days, and years* (Genesis 1:14); the sun that knows its going down, *He appointed the moon for seasons: the sun knoweth his going down* (Psalms 104:19); and the sun running its circuit, *His going forth is from the end of the heaven, and his circuit unto the ends of it* (Psalms 19:6). It ain''t new — the solar machinery Enoch describes is the ordinance Yahuah fixed in Genesis and the psalms.',
       sv.verse_id, ev.verse_id, 'extras', 83175
  FROM _session411_2en48_lookup sv, _session411_2en48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=48 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-48-from-the-invisible-he-made-visible',
       E'From the invisible He made all things visible',
       E'Enoch confesses how the worlds came to be: *From the invisible he made all things visible, himself being invisible* (2 Enoch 48:4). This is the apostle''s own confession of faith: *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3); and Paul''s word of the God *who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). It ain''t new — that the seen came from the unseen by the word of the invisible Elohim is what Hebrews and Romans already declare.',
       sv.verse_id, ev.verse_id, 'extras', 83178
  FROM _session411_2en48_lookup sv, _session411_2en48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=48 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-48-bear-the-yoke-of-the-books',
       E'Blessed is the man who bears their yoke',
       E'Enoch closes the giving of the books with a blessing on the one who takes them up: *Blessed is the man who shall bear their yoke and shall drag them along, for he shall be released on the day of the great judgment* (2 Enoch 48:7). The yoke that blesses rather than crushes is the Messiah''s own offer: *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29). It ain''t new — the yoke of Yahuah''s word, borne in love, is the easy yoke that gives rest.',
       sv.verse_id, ev.verse_id, 'extras', 83181
  FROM _session411_2en48_lookup sv, _session411_2en48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=48 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-48-the-courses-of-the-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The sun''s appointed circles and the count of days in 2 Enoch 48:1 are the lights set for signs and seasons on the fourth day.'
  FROM cross_reference_threads t, cross_references x, _session411_2en48_lookup sv, _session411_2en48_lookup tv
 WHERE t.slug='2-enoch-48-the-courses-of-the-sun'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* Enoch''s sun that "go down on a short day" and rests on its thrones is the psalmist''s sun that knows its going down by Yahuah''s appointment.'
  FROM cross_reference_threads t, cross_references x, _session411_2en48_lookup sv, _session411_2en48_lookup tv
 WHERE t.slug='2-enoch-48-the-courses-of-the-sun'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The measured course Enoch says was fixed "by his wisdom" is the sun''s circuit the psalmist sings, ordered from end to end of heaven.'
  FROM cross_reference_threads t, cross_references x, _session411_2en48_lookup sv, _session411_2en48_lookup tv
 WHERE t.slug='2-enoch-48-the-courses-of-the-sun'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-48-from-the-invisible-he-made-visible
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* Enoch''s "from the invisible he made all things visible" is the very faith Hebrews names: the seen not made of things that appear.'
  FROM cross_reference_threads t, cross_references x, _session411_2en48_lookup sv, _session411_2en48_lookup tv
 WHERE t.slug='2-enoch-48-from-the-invisible-he-made-visible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 4:17 — *...even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The invisible Maker who brings the visible from the unseen (2 Enoch 48:4) is the God Paul confesses, who calls into being the things that are not.'
  FROM cross_reference_threads t, cross_references x, _session411_2en48_lookup sv, _session411_2en48_lookup tv
 WHERE t.slug='2-enoch-48-from-the-invisible-he-made-visible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-48-bear-the-yoke-of-the-books
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* Enoch''s blessing on the man who bears the yoke of the books is answered in the Messiah''s yoke, which the lowly take up and find rest.'
  FROM cross_reference_threads t, cross_references x, _session411_2en48_lookup sv, _session411_2en48_lookup tv
 WHERE t.slug='2-enoch-48-bear-the-yoke-of-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* The yoke that ends in release on the day of judgment (2 Enoch 48:7) is the easy yoke and light burden the Messiah lays on those who learn of Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en48_lookup sv, _session411_2en48_lookup tv
 WHERE t.slug='2-enoch-48-bear-the-yoke-of-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=48 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_49.sql (session411 2-enoch 49) -----
-- Source anchor: pseudepigrapha/2-enoch ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en49 (view _session411_2en49_lookup). Sort band base 83200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-49-swear-not-let-your-word-be-yea-yea
  ('pseudepigrapha', '2-enoch', 49, 1, 'canon', 'matthew', 5, 34, 'free', E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God’s) throne.* Enoch''s "I swear not by any oath, neither by heaven nor by earth" (2 Enoch 49:1) is word for word the Messiah''s "swear not at all; neither by heaven."'),
  ('pseudepigrapha', '2-enoch', 49, 1, 'canon', 'matthew', 5, 35, 'free', E'Matthew 5:35 — *Nor by the earth; for it is his footstool: neither by Jerusalem; for it is the city of the great King.* The refusal to swear by heaven or earth or any creature (2 Enoch 49:1) is the Messiah''s same refusal — neither by earth, His footstool.'),
  ('pseudepigrapha', '2-enoch', 49, 3, 'canon', 'matthew', 5, 37, 'free', E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* Enoch''s rule "let them swear by the words, Yea, yea, or else, Nay, nay" (2 Enoch 49:3) is the Messiah''s own "let your communication be, Yea, yea; Nay, nay."'),
  ('pseudepigrapha', '2-enoch', 49, 3, 'canon', 'james', 5, 12, 'free', E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* The apostle seals the same teaching Enoch hands down: swear not by heaven or earth, but let yea be yea and nay be nay.'),
  -- thread: 2-enoch-49-a-place-prepared-for-every-soul
  ('pseudepigrapha', '2-enoch', 49, 4, 'canon', 'jeremiah', 1, 5, 'free', E'Jeremiah 1:5 — *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.* Enoch''s word that the soul is reckoned before it is in the mother''s womb (2 Enoch 49:4) is Yahuah''s own word to Jeremiah, known before the belly formed him.'),
  ('pseudepigrapha', '2-enoch', 49, 5, 'canon', 'john', 14, 2, 'free', E'John 14:2 — *In my Father’s house are many mansions: if it were not so, I would have told you. I go to prepare a place for you.* The place "previously prepared... for every soul of man" (2 Enoch 49:5) for its repose is the prepared place the Messiah promises in the Father''s house.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-49-swear-not-let-your-word-be-yea-yea',
       E'Swear not — let your word be Yea, yea, and Nay, nay',
       E'This is the centerpiece of Enoch''s testament, and the most striking "it ain''t new" of the whole book. Enoch will not bind his word with an oath: *I swear to you, my children, but I swear not by any oath, neither by heaven nor by earth, nor by any other creature which Elohim (God) created* (2 Enoch 49:1); Yahuah''s own word is the only sure thing, *There is no oath in me, nor injustice, but truth* (2 Enoch 49:2); and the rule he hands down is plain, *If there is no truth in men, let them swear by the words, Yea, yea, or else, Nay, nay* (2 Enoch 49:3). Centuries later the Messiah teaches the very words: *Swear not at all; neither by heaven; for it is Elohim''s (God’s) throne; Nor by the earth; for it is his footstool* (Matthew 5:34-35), *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* (Matthew 5:37); and James seals it, *swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay* (James 5:12). It ain''t new — when the Messiah said "swear not at all," He was confirming a word already kept by the man who walked with Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 83200
  FROM _session411_2en49_lookup sv, _session411_2en49_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=49 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-49-a-place-prepared-for-every-soul',
       E'A place prepared for the repose of every soul',
       E'Enoch tells his sons that no soul is unprovided for: *there has been no man in his mother''s womb, but that already before, even to each one there is a place prepared for the repose of that soul* (2 Enoch 49:4), *there has been previously prepared a place for every soul of man* (2 Enoch 49:5). The place prepared for those who keep the truth is the promise the Messiah made His own: *I go to prepare a place for you* — and the soul known before the womb is the word Yahuah spoke to Jeremiah, *Before I formed thee in the belly I knew thee* (Jeremiah 1:5). It ain''t new — that the soul is known and a place appointed before birth is what the prophet and the Messiah both attest.',
       sv.verse_id, ev.verse_id, 'extras', 83203
  FROM _session411_2en49_lookup sv, _session411_2en49_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=49 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-49-swear-not-let-your-word-be-yea-yea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God’s) throne.* Enoch''s "I swear not by any oath, neither by heaven nor by earth" (2 Enoch 49:1) is word for word the Messiah''s "swear not at all; neither by heaven."'
  FROM cross_reference_threads t, cross_references x, _session411_2en49_lookup sv, _session411_2en49_lookup tv
 WHERE t.slug='2-enoch-49-swear-not-let-your-word-be-yea-yea'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:35 — *Nor by the earth; for it is his footstool: neither by Jerusalem; for it is the city of the great King.* The refusal to swear by heaven or earth or any creature (2 Enoch 49:1) is the Messiah''s same refusal — neither by earth, His footstool.'
  FROM cross_reference_threads t, cross_references x, _session411_2en49_lookup sv, _session411_2en49_lookup tv
 WHERE t.slug='2-enoch-49-swear-not-let-your-word-be-yea-yea'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* Enoch''s rule "let them swear by the words, Yea, yea, or else, Nay, nay" (2 Enoch 49:3) is the Messiah''s own "let your communication be, Yea, yea; Nay, nay."'
  FROM cross_reference_threads t, cross_references x, _session411_2en49_lookup sv, _session411_2en49_lookup tv
 WHERE t.slug='2-enoch-49-swear-not-let-your-word-be-yea-yea'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* The apostle seals the same teaching Enoch hands down: swear not by heaven or earth, but let yea be yea and nay be nay.'
  FROM cross_reference_threads t, cross_references x, _session411_2en49_lookup sv, _session411_2en49_lookup tv
 WHERE t.slug='2-enoch-49-swear-not-let-your-word-be-yea-yea'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-49-a-place-prepared-for-every-soul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:5 — *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.* Enoch''s word that the soul is reckoned before it is in the mother''s womb (2 Enoch 49:4) is Yahuah''s own word to Jeremiah, known before the belly formed him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en49_lookup sv, _session411_2en49_lookup tv
 WHERE t.slug='2-enoch-49-a-place-prepared-for-every-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:2 — *In my Father’s house are many mansions: if it were not so, I would have told you. I go to prepare a place for you.* The place "previously prepared... for every soul of man" (2 Enoch 49:5) for its repose is the prepared place the Messiah promises in the Father''s house.'
  FROM cross_reference_threads t, cross_references x, _session411_2en49_lookup sv, _session411_2en49_lookup tv
 WHERE t.slug='2-enoch-49-a-place-prepared-for-every-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=49 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_50.sql (session411 2-enoch 50) -----
-- Source anchor: pseudepigrapha/2-enoch ch50. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en50 (view _session411_2en50_lookup). Sort band base 83225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en50_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-50-every-work-in-writing-nothing-hidden
  ('pseudepigrapha', '2-enoch', 50, 1, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened... and the dead were judged out of those things which were written in the books, according to their works.* Enoch''s "every man''s work in writing" that none can hide (2 Enoch 50:1) is the opened books by which John saw the dead judged.'),
  ('pseudepigrapha', '2-enoch', 50, 1, 'canon', 'ecclesiastes', 12, 14, 'free', E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* That no work can "remain concealed" (2 Enoch 50:1-2) is the Preacher''s verdict, every secret thing brought into judgment.'),
  ('pseudepigrapha', '2-enoch', 50, 1, 'enoch', '1-enoch', 98, 7, 'extras', E'1 Enoch 98:7 — *And do not think in your spirit nor say in your heart that ye do not know and that ye do not see That every sin is every day recorded in heaven in the presence of the Most High.* The record kept so that none is hidden (2 Enoch 50:1) is the daily recording of every sin in heaven that Enoch''s first book already warns of.'),
  -- thread: 2-enoch-50-return-not-evil-the-lord-avenges
  ('pseudepigrapha', '2-enoch', 50, 5, 'canon', 'proverbs', 20, 22, 'free', E'Proverbs 20:22 — *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee.* Enoch''s charge to "return them not" but let Yahuah be the avenger (2 Enoch 50:5) is Solomon''s own "say not... I will recompense evil."'),
  ('pseudepigrapha', '2-enoch', 50, 5, 'canon', 'romans', 12, 17, 'free', E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* That ill-requitals are not to be returned to neighbour or enemy (2 Enoch 50:5) is the apostle''s "recompense to no man evil for evil."'),
  ('pseudepigrapha', '2-enoch', 50, 5, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* Enoch''s reason — "Yahuah will return them for you and be your avenger" (2 Enoch 50:5) — is the apostle''s reason: vengeance belongs to Yahuah, who repays.'),
  -- thread: 2-enoch-50-treasure-in-the-world-to-come
  ('pseudepigrapha', '2-enoch', 50, 6, 'canon', 'matthew', 6, 20, 'free', E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal.* Enoch''s "ample treasure in the world to come" for what is spent on a brother (2 Enoch 50:6) is the Messiah''s treasure laid up in heaven.'),
  ('pseudepigrapha', '2-enoch', 50, 7, 'canon', 'exodus', 22, 22, 'free', E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child.* Enoch''s "injure not widows nor orphans" lest wrath come (2 Enoch 50:7) is the law Moses gave, with its same warning of Yahuah''s wrath.'),
  ('pseudepigrapha', '2-enoch', 50, 7, 'canon', 'deuteronomy', 24, 17, 'free', E'Deuteronomy 24:17 — *Thou shalt not pervert the judgment of the stranger, nor of the fatherless; nor take a widow’s raiment to pledge.* That the stranger, with the widow and orphan, is not to be injured (2 Enoch 50:7) is Moses'' charge guarding the stranger and the fatherless.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en50_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en50_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-50-every-work-in-writing-nothing-hidden',
       E'Every man''s work in writing — none can remain hidden',
       E'Enoch says the record is already kept: *I have put every man''s work in writing and none born on earth can remain hidden nor his works remain concealed. I see all things* (2 Enoch 50:1-2). This is no new bookkeeping of heaven — the seer of the Revelation saw it opened, *and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12), and the Preacher closed his book the same way, *For Elohim (God) shall bring every work into judgment, with every secret thing* (Ecclesiastes 12:14). His own earlier book says it too — that every sin is *recorded in heaven in the presence of the Most High* (1 Enoch 98:7). It ain''t new — the works set down where nothing is hidden are the works the books will read on the last day.',
       sv.verse_id, ev.verse_id, 'extras', 83225
  FROM _session411_2en50_lookup sv, _session411_2en50_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=50 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-50-return-not-evil-the-lord-avenges',
       E'Return not evil — Yahuah will be your avenger',
       E'Enoch forbids requital and leaves vengeance to Yahuah: *If ill-requitals befall you, return them not either to neighbour or enemy, because Yahuah (Lord) will return them for you and be your avenger on the day of great judgment, that there be no avenging here among men* (2 Enoch 50:5). This is no new restraint — Solomon already said, *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22); and Paul gathers it up, *Recompense to no man evil for evil* (Romans 12:17), *avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). It ain''t new — that the wronged man leaves the reckoning to Yahuah is the teaching of the Proverbs and the apostle alike.',
       sv.verse_id, ev.verse_id, 'extras', 83228
  FROM _session411_2en50_lookup sv, _session411_2en50_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=50 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-50-treasure-in-the-world-to-come',
       E'Ample treasure in the world to come',
       E'Enoch promises a heavenly return for what is spent on a brother, and warns against oppressing the helpless: *Whoever of you spends gold or silver for his brother''s sake, he will receive ample treasure in the world to come* (2 Enoch 50:6); *Injure not widows nor orphans nor strangers, lest Elohim''s (God''s) wrath come upon you* (2 Enoch 50:7). The treasure laid up above is the Messiah''s own word, *lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt* (Matthew 6:20); the guarding of widow, orphan, and stranger is Moses'' law, *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22), *Thou shalt not pervert the judgment of the stranger, nor of the fatherless* (Deuteronomy 24:17). It ain''t new — treasure above and mercy to the helpless are the law of Moses and the word of the Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 83231
  FROM _session411_2en50_lookup sv, _session411_2en50_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=50 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-50-every-work-in-writing-nothing-hidden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened... and the dead were judged out of those things which were written in the books, according to their works.* Enoch''s "every man''s work in writing" that none can hide (2 Enoch 50:1) is the opened books by which John saw the dead judged.'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-every-work-in-writing-nothing-hidden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* That no work can "remain concealed" (2 Enoch 50:1-2) is the Preacher''s verdict, every secret thing brought into judgment.'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-every-work-in-writing-nothing-hidden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 98:7 — *And do not think in your spirit nor say in your heart that ye do not know and that ye do not see That every sin is every day recorded in heaven in the presence of the Most High.* The record kept so that none is hidden (2 Enoch 50:1) is the daily recording of every sin in heaven that Enoch''s first book already warns of.'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-every-work-in-writing-nothing-hidden'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=98 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-50-return-not-evil-the-lord-avenges
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 20:22 — *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee.* Enoch''s charge to "return them not" but let Yahuah be the avenger (2 Enoch 50:5) is Solomon''s own "say not... I will recompense evil."'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-return-not-evil-the-lord-avenges'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* That ill-requitals are not to be returned to neighbour or enemy (2 Enoch 50:5) is the apostle''s "recompense to no man evil for evil."'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-return-not-evil-the-lord-avenges'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* Enoch''s reason — "Yahuah will return them for you and be your avenger" (2 Enoch 50:5) — is the apostle''s reason: vengeance belongs to Yahuah, who repays.'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-return-not-evil-the-lord-avenges'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-50-treasure-in-the-world-to-come
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal.* Enoch''s "ample treasure in the world to come" for what is spent on a brother (2 Enoch 50:6) is the Messiah''s treasure laid up in heaven.'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-treasure-in-the-world-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child.* Enoch''s "injure not widows nor orphans" lest wrath come (2 Enoch 50:7) is the law Moses gave, with its same warning of Yahuah''s wrath.'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-treasure-in-the-world-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 24:17 — *Thou shalt not pervert the judgment of the stranger, nor of the fatherless; nor take a widow’s raiment to pledge.* That the stranger, with the widow and orphan, is not to be injured (2 Enoch 50:7) is Moses'' charge guarding the stranger and the fatherless.'
  FROM cross_reference_threads t, cross_references x, _session411_2en50_lookup sv, _session411_2en50_lookup tv
 WHERE t.slug='2-enoch-50-treasure-in-the-world-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_51.sql (session411 2-enoch 51) -----
-- Source anchor: pseudepigrapha/2-enoch ch51. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en51 (view _session411_2en51_lookup). Sort band base 83250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en51_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-51-stretch-out-your-hands-to-the-poor
  ('pseudepigrapha', '2-enoch', 51, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Enoch''s "stretch out your hands to the poor" (2 Enoch 51:1) is Solomon''s pity on the poor, lent to Yahuah and repaid.'),
  ('pseudepigrapha', '2-enoch', 51, 1, 'canon', 'isaiah', 58, 7, 'free', E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* The hand stretched to the poor (2 Enoch 51:1) is the fast Isaiah names — bread to the hungry, the naked covered.'),
  ('pseudepigrapha', '2-enoch', 51, 2, 'canon', 'luke', 12, 33, 'free', E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* Enoch''s "hide not your silver in the earth" (2 Enoch 51:2) is the Messiah''s call to give alms rather than hoard, for treasure in the heavens that fails not.'),
  -- thread: 2-enoch-51-morning-midday-evening-into-the-dwelling
  ('pseudepigrapha', '2-enoch', 51, 5, 'canon', 'psalms', 55, 17, 'free', E'Psalms 55:17 — *Evening, and morning, and at noon, will I pray, and cry aloud: and he shall hear my voice.* Enoch''s "morning, midday, and evening" into Yahuah''s dwelling (2 Enoch 51:5) is David''s evening, morning, and noon of prayer.'),
  ('pseudepigrapha', '2-enoch', 51, 5, 'canon', 'daniel', 6, 10, 'free', E'Daniel 6:10 — *...he kneeled upon his knees three times a day, and prayed, and gave thanks before his Elohim (God), as he did aforetime.* The thrice-daily going into Yahuah''s dwelling (2 Enoch 51:5) is Daniel''s three times a day of prayer and thanks.'),
  ('pseudepigrapha', '2-enoch', 51, 6, 'canon', 'psalms', 150, 6, 'free', E'Psalms 150:6 — *Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD).* Enoch''s "every breathing thing glorifies him" (2 Enoch 51:6) is the psalter''s closing call for all that breathes to praise Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en51_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en51_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-51-stretch-out-your-hands-to-the-poor',
       E'Stretch out your hands to the poor',
       E'Enoch turns the testament toward open hands: *Stretch out your hands to the poor according to your strength. Hide not your silver in the earth. Help the faithful man in affliction* (2 Enoch 51:1-3). This is no new charity — Solomon already promised the lender''s reward, *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17); Isaiah named the very deeds, *Is it not to deal thy bread to the hungry... when thou seest the naked, that thou cover him?* (Isaiah 58:7); and the Messiah turns buried silver into heavenly treasure, *give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not* (Luke 12:33). It ain''t new — the open hand to the poor is the way Moses, the Prophets, and the Messiah all command.',
       sv.verse_id, ev.verse_id, 'extras', 83250
  FROM _session411_2en51_lookup sv, _session411_2en51_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=51 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-51-morning-midday-evening-into-the-dwelling',
       E'Morning, midday, and evening into Yahuah''s dwelling',
       E'Enoch commends a settled life of praise: *It is good to go morning, midday, and evening into Yahuah''s (Lord''s) dwelling, for the glory of your creator. Because every breathing thing glorifies him* (2 Enoch 51:5-6). This is no new devotion — David kept the same hours, *Evening, and morning, and at noon, will I pray, and cry aloud: and he shall hear my voice* (Psalms 55:17); Daniel did likewise, kneeling *three times a day* (Daniel 6:10); and the psalter ends as Enoch does, calling all that breathes to praise, *Let every thing that hath breath praise Yahuah (LORD)* (Psalms 150:6). It ain''t new — thrice-daily prayer and the praise of every breathing thing are the worship of David and the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 83253
  FROM _session411_2en51_lookup sv, _session411_2en51_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=51 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-51-stretch-out-your-hands-to-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Enoch''s "stretch out your hands to the poor" (2 Enoch 51:1) is Solomon''s pity on the poor, lent to Yahuah and repaid.'
  FROM cross_reference_threads t, cross_references x, _session411_2en51_lookup sv, _session411_2en51_lookup tv
 WHERE t.slug='2-enoch-51-stretch-out-your-hands-to-the-poor'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* The hand stretched to the poor (2 Enoch 51:1) is the fast Isaiah names — bread to the hungry, the naked covered.'
  FROM cross_reference_threads t, cross_references x, _session411_2en51_lookup sv, _session411_2en51_lookup tv
 WHERE t.slug='2-enoch-51-stretch-out-your-hands-to-the-poor'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:33 — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth.* Enoch''s "hide not your silver in the earth" (2 Enoch 51:2) is the Messiah''s call to give alms rather than hoard, for treasure in the heavens that fails not.'
  FROM cross_reference_threads t, cross_references x, _session411_2en51_lookup sv, _session411_2en51_lookup tv
 WHERE t.slug='2-enoch-51-stretch-out-your-hands-to-the-poor'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-51-morning-midday-evening-into-the-dwelling
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 55:17 — *Evening, and morning, and at noon, will I pray, and cry aloud: and he shall hear my voice.* Enoch''s "morning, midday, and evening" into Yahuah''s dwelling (2 Enoch 51:5) is David''s evening, morning, and noon of prayer.'
  FROM cross_reference_threads t, cross_references x, _session411_2en51_lookup sv, _session411_2en51_lookup tv
 WHERE t.slug='2-enoch-51-morning-midday-evening-into-the-dwelling'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 6:10 — *...he kneeled upon his knees three times a day, and prayed, and gave thanks before his Elohim (God), as he did aforetime.* The thrice-daily going into Yahuah''s dwelling (2 Enoch 51:5) is Daniel''s three times a day of prayer and thanks.'
  FROM cross_reference_threads t, cross_references x, _session411_2en51_lookup sv, _session411_2en51_lookup tv
 WHERE t.slug='2-enoch-51-morning-midday-evening-into-the-dwelling'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 150:6 — *Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD).* Enoch''s "every breathing thing glorifies him" (2 Enoch 51:6) is the psalter''s closing call for all that breathes to praise Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en51_lookup sv, _session411_2en51_lookup tv
 WHERE t.slug='2-enoch-51-morning-midday-evening-into-the-dwelling'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=51 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_52.sql (session411 2-enoch 52) -----
-- Source anchor: pseudepigrapha/2-enoch ch52. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en52 (view _session411_2en52_lookup). Sort band base 83275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en52_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-52-blessing-and-cursing-from-the-same-lips
  ('pseudepigrapha', '2-enoch', 52, 2, 'canon', 'james', 3, 9, 'free', E'James 3:9 — *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God).* Enoch''s curse on the man who reviles his neighbour and so "brings Elohim into contempt" (2 Enoch 52:2) is James''s blessing of God and cursing of men made in His similitude.'),
  ('pseudepigrapha', '2-enoch', 52, 2, 'canon', 'james', 3, 10, 'free', E'James 3:10 — *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* The blessed lips and cursed lips of 2 Enoch 52:1-4 are James''s one mouth from which blessing and cursing ought not both to proceed.'),
  ('pseudepigrapha', '2-enoch', 52, 4, 'canon', 'psalms', 34, 13, 'free', E'Psalms 34:13 — *Keep thy tongue from evil, and thy lips from speaking guile.* The curse on lips that curse and abuse (2 Enoch 52:4) is David''s charge to keep the tongue from evil and the lips from guile.'),
  -- thread: 2-enoch-52-raise-the-fallen-honour-the-creators-works
  ('pseudepigrapha', '2-enoch', 52, 8, 'canon', 'proverbs', 17, 5, 'free', E'Proverbs 17:5 — *Whoso mocketh the poor reproacheth his Maker: and he that is glad at calamities shall not be unpunished.* The curse on him "eager for the destruction of what is not his" (2 Enoch 52:8) is Solomon''s warning against the one glad at calamities, who reproaches his Maker.'),
  ('pseudepigrapha', '2-enoch', 52, 6, 'canon', 'psalms', 145, 10, 'free', E'Psalms 145:10 — *All thy works shall praise thee, O Yahuah (LORD); and thy saints shall bless thee.* The blessing on him who blesses all Yahuah''s works (2 Enoch 52:5-6) is the psalmist''s word that all His works praise Him.'),
  -- thread: 2-enoch-52-keep-the-foundations-of-the-fathers
  ('pseudepigrapha', '2-enoch', 52, 9, 'canon', 'deuteronomy', 19, 14, 'free', E'Deuteronomy 19:14 — *Thou shalt not remove thy neighbour’s landmark, which they of old time have set in thine inheritance, which thou shalt inherit in the land that Yahuah Elohayka (the LORD thy God) giveth thee to possess it.* Enoch''s blessing on keeping "the foundations of his fathers made firm from the beginning" (2 Enoch 52:9) is Moses'' charge not to remove the landmark of old.'),
  ('pseudepigrapha', '2-enoch', 52, 10, 'canon', 'proverbs', 22, 28, 'free', E'Proverbs 22:28 — *Remove not the ancient landmark, which thy fathers have set.* The curse on him who "perverts the decrees of his forefathers" (2 Enoch 52:10) is Solomon''s word against removing the ancient landmark the fathers set.'),
  -- thread: 2-enoch-52-peace-and-the-tongue-that-hides-a-sword
  ('pseudepigrapha', '2-enoch', 52, 11, 'canon', 'matthew', 5, 9, 'free', E'Matthew 5:9 — *Blessed are the peacemakers: for they shall be called the children of Elohim (God).* Enoch''s "blessed is he who imparts peace and love" (2 Enoch 52:11) is the Messiah''s beatitude on the peacemakers, called the children of Elohim.'),
  ('pseudepigrapha', '2-enoch', 52, 14, 'canon', 'psalms', 28, 3, 'free', E'Psalms 28:3 — *Draw me not away with the wicked, and with the workers of iniquity, which speak peace to their neighbours, but mischief is in their hearts.* Enoch''s curse on him who "speaks peace with his tongue, while in his heart there is... a sword" (2 Enoch 52:14) is David''s word against those who speak peace with mischief in their hearts.'),
  ('pseudepigrapha', '2-enoch', 52, 11, 'canon', 'psalms', 34, 14, 'free', E'Psalms 34:14 — *Depart from evil, and do good; seek peace, and pursue it.* The blessing on imparting peace and love (2 Enoch 52:11) is David''s charge to seek peace and pursue it.'),
  -- thread: 2-enoch-52-weighed-in-the-scales-and-the-books
  ('pseudepigrapha', '2-enoch', 52, 15, 'canon', 'daniel', 5, 27, 'free', E'Daniel 5:27 — *TEKEL; Thou art weighed in the balances, and art found wanting.* Enoch''s "weighing-scales" of the great judgment (2 Enoch 52:15) are the balances in which Belshazzar was weighed and found wanting.'),
  ('pseudepigrapha', '2-enoch', 52, 15, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *...and the books were opened... and the dead were judged out of those things which were written in the books, according to their works.* Enoch''s "books, on the day of the great judgment" (2 Enoch 52:15) are the opened books by which John saw the dead judged according to their works.'),
  ('pseudepigrapha', '2-enoch', 52, 15, 'canon', 'isaiah', 40, 12, 'free', E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand... and weighed the mountains in scales, and the hills in a balance?* That all is laid bare "in the weighing-scales" (2 Enoch 52:15) reaches for the same balance in Isaiah, the hand that weighs the hills.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en52_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en52_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-52-blessing-and-cursing-from-the-same-lips',
       E'Blessing and cursing — the mouth toward Elohim and neighbour',
       E'Enoch opens the litany at the lips: *Blessed is the man who opens his lips in praise of Elohim (God)... Cursed every man who opens his lips for the bringing into contempt and calumny of his neighbour, because he brings Elohim (God) into contempt* (2 Enoch 52:1-2). The reason — that to revile a man is to revile his Maker — is the apostle''s own: *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God). Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be* (James 3:9-10); and David''s charge, *Keep thy tongue from evil, and thy lips from speaking guile* (Psalms 34:13). It ain''t new — that one mouth must not both bless Elohim and curse the man made in His likeness is James''s very teaching.',
       sv.verse_id, ev.verse_id, 'extras', 83275
  FROM _session411_2en52_lookup sv, _session411_2en52_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=52 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-52-raise-the-fallen-honour-the-creators-works',
       E'Blessed is he who raises the fallen and honours the creation',
       E'The litany turns to deeds toward the helpless and toward the works of Elohim: *Blessed is he who looks down and raises the fallen. Cursed is he who looks to and is eager for the destruction of what is not his* (2 Enoch 52:7-8); *Blessed is he who blesses all Yahuah''s (Lord''s) works. Cursed is he who brings Yahuah''s (Lord''s) creation into contempt* (2 Enoch 52:5-6). To mock or covet what belongs to another is to reproach the Maker, as Solomon warns, *Whoso mocketh the poor reproacheth his Maker* (Proverbs 17:5); and all His works return Him praise, *All thy works shall praise thee, O Yahuah (LORD)* (Psalms 145:10). It ain''t new — to lift the fallen and honour the creation is to honour its Creator, as the Proverbs and the psalms teach.',
       sv.verse_id, ev.verse_id, 'extras', 83278
  FROM _session411_2en52_lookup sv, _session411_2en52_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=52 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-52-keep-the-foundations-of-the-fathers',
       E'Keep the foundations of the fathers — pervert not their decrees',
       E'Enoch blesses faithfulness to the inheritance and curses its overturning: *Blessed is he who keeps the foundations of his fathers made firm from the beginning. Cursed is he who perverts the decrees of his forefathers* (2 Enoch 52:9-10). This is no new conservatism — it is Moses'' own boundary, *Thou shalt not remove thy neighbour''s landmark, which they of old time have set in thine inheritance* (Deuteronomy 19:14), and Solomon''s, *Remove not the ancient landmark, which thy fathers have set* (Proverbs 22:28). It ain''t new — to keep what the fathers set firm and not pervert their decrees is the law of the landmark Moses and Solomon both fixed.',
       sv.verse_id, ev.verse_id, 'extras', 83281
  FROM _session411_2en52_lookup sv, _session411_2en52_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=9
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=52 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-52-peace-and-the-tongue-that-hides-a-sword',
       E'Peace imparted, and the tongue that hides a sword',
       E'The blessings of peace close the litany: *Blessed is he who imparts peace and love. Cursed is he who disturbs those that love their neighbours* (2 Enoch 52:11-12); *Blessed is he who speaks with humble tongue and heart to all. Cursed is he who speaks peace with his tongue, while in his heart there is no peace but a sword* (2 Enoch 52:13-14). The Messiah blesses the same, *Blessed are the peacemakers: for they shall be called the children of Elohim (God)* (Matthew 5:9); David curses the same false mouth, *which speak peace to their neighbours, but mischief is in their hearts* (Psalms 28:3), and bids, *seek peace, and pursue it* (Psalms 34:14). It ain''t new — the peacemaker blessed and the smooth tongue that hides a sword cursed are the very judgments of the psalms and the Sermon on the Mount.',
       sv.verse_id, ev.verse_id, 'extras', 83284
  FROM _session411_2en52_lookup sv, _session411_2en52_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=11
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=52 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-52-weighed-in-the-scales-and-the-books',
       E'All laid bare in the weighing-scales and the books',
       E'Enoch seals every blessing and curse at the last assize: *For all these things will be laid bare in the weighing-scales and in the books, on the day of the great judgment* (2 Enoch 52:15). This is no new reckoning — the writing on Belshazzar''s wall declared it, *TEKEL; Thou art weighed in the balances, and art found wanting* (Daniel 5:27); and the seer saw the books, *the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12); even the works themselves are weighed by Yahuah, *the waters in the hollow of his hand... and the hills in a balance* (Isaiah 40:12). It ain''t new — the scales and the books of the great day are the balance of Daniel and the opened books of the Revelation.',
       sv.verse_id, ev.verse_id, 'extras', 83287
  FROM _session411_2en52_lookup sv, _session411_2en52_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=15
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=52 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-52-blessing-and-cursing-from-the-same-lips
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 3:9 — *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God).* Enoch''s curse on the man who reviles his neighbour and so "brings Elohim into contempt" (2 Enoch 52:2) is James''s blessing of God and cursing of men made in His similitude.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-blessing-and-cursing-from-the-same-lips'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:10 — *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* The blessed lips and cursed lips of 2 Enoch 52:1-4 are James''s one mouth from which blessing and cursing ought not both to proceed.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-blessing-and-cursing-from-the-same-lips'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 34:13 — *Keep thy tongue from evil, and thy lips from speaking guile.* The curse on lips that curse and abuse (2 Enoch 52:4) is David''s charge to keep the tongue from evil and the lips from guile.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-blessing-and-cursing-from-the-same-lips'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-52-raise-the-fallen-honour-the-creators-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:5 — *Whoso mocketh the poor reproacheth his Maker: and he that is glad at calamities shall not be unpunished.* The curse on him "eager for the destruction of what is not his" (2 Enoch 52:8) is Solomon''s warning against the one glad at calamities, who reproaches his Maker.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-raise-the-fallen-honour-the-creators-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 145:10 — *All thy works shall praise thee, O Yahuah (LORD); and thy saints shall bless thee.* The blessing on him who blesses all Yahuah''s works (2 Enoch 52:5-6) is the psalmist''s word that all His works praise Him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-raise-the-fallen-honour-the-creators-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-52-keep-the-foundations-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 19:14 — *Thou shalt not remove thy neighbour’s landmark, which they of old time have set in thine inheritance, which thou shalt inherit in the land that Yahuah Elohayka (the LORD thy God) giveth thee to possess it.* Enoch''s blessing on keeping "the foundations of his fathers made firm from the beginning" (2 Enoch 52:9) is Moses'' charge not to remove the landmark of old.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-keep-the-foundations-of-the-fathers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:28 — *Remove not the ancient landmark, which thy fathers have set.* The curse on him who "perverts the decrees of his forefathers" (2 Enoch 52:10) is Solomon''s word against removing the ancient landmark the fathers set.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-keep-the-foundations-of-the-fathers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-52-peace-and-the-tongue-that-hides-a-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:9 — *Blessed are the peacemakers: for they shall be called the children of Elohim (God).* Enoch''s "blessed is he who imparts peace and love" (2 Enoch 52:11) is the Messiah''s beatitude on the peacemakers, called the children of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-peace-and-the-tongue-that-hides-a-sword'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 28:3 — *Draw me not away with the wicked, and with the workers of iniquity, which speak peace to their neighbours, but mischief is in their hearts.* Enoch''s curse on him who "speaks peace with his tongue, while in his heart there is... a sword" (2 Enoch 52:14) is David''s word against those who speak peace with mischief in their hearts.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-peace-and-the-tongue-that-hides-a-sword'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=28 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 34:14 — *Depart from evil, and do good; seek peace, and pursue it.* The blessing on imparting peace and love (2 Enoch 52:11) is David''s charge to seek peace and pursue it.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-peace-and-the-tongue-that-hides-a-sword'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-52-weighed-in-the-scales-and-the-books
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 5:27 — *TEKEL; Thou art weighed in the balances, and art found wanting.* Enoch''s "weighing-scales" of the great judgment (2 Enoch 52:15) are the balances in which Belshazzar was weighed and found wanting.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-weighed-in-the-scales-and-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:12 — *...and the books were opened... and the dead were judged out of those things which were written in the books, according to their works.* Enoch''s "books, on the day of the great judgment" (2 Enoch 52:15) are the opened books by which John saw the dead judged according to their works.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-weighed-in-the-scales-and-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand... and weighed the mountains in scales, and the hills in a balance?* That all is laid bare "in the weighing-scales" (2 Enoch 52:15) reaches for the same balance in Isaiah, the hand that weighs the hills.'
  FROM cross_reference_threads t, cross_references x, _session411_2en52_lookup sv, _session411_2en52_lookup tv
 WHERE t.slug='2-enoch-52-weighed-in-the-scales-and-the-books'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=52 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_53.sql (session411 2-enoch 53) -----
-- Source anchor: pseudepigrapha/2-enoch ch53. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en53 (view _session411_2en53_lookup). Sort band base 83300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en53_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-53-no-man-prays-away-anothers-sin
  ('pseudepigrapha', '2-enoch', 53, 1, 'canon', 'ezekiel', 18, 20, 'free', E'Ezekiel 18:20 — *The soul that sinneth, it shall die. The son shall not bear the iniquity of the father, neither shall the father bear the iniquity of the son: the righteousness of the righteous shall be upon him, and the wickedness of the wicked shall be upon him.* Enoch''s word that no father intercedes for a son''s sin is Ezekiel''s law of the soul that bears its own iniquity.'),
  ('pseudepigrapha', '2-enoch', 53, 1, 'canon', 'psalms', 49, 7, 'free', E'Psalms 49:7 — *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him:* The sons cannot lean on their father''s prayer; the Psalm declares no man can redeem his brother or pay his ransom to Elohim.'),
  ('pseudepigrapha', '2-enoch', 53, 1, 'canon', 'jeremiah', 31, 30, 'free', E'Jeremiah 31:30 — *But every one shall die for his own iniquity: every man that eateth the sour grape, his teeth shall be set on edge.* "No helper of any man who has sinned" is Jeremiah''s new-covenant word that every one shall die for his own iniquity.'),
  ('pseudepigrapha', '2-enoch', 53, 1, 'canon', 'romans', 14, 12, 'free', E'Romans 14:12 — *So then every one of us shall give account of himself to Elohim (God).* Each son answers for himself, as Paul says every one shall give his own account to Elohim.'),
  ('pseudepigrapha', '2-enoch', 53, 1, 'canon', 'galatians', 6, 5, 'free', E'Galatians 6:5 — *For every man shall bear his own burden.* Enoch''s "no helper of any man who has sinned" is Paul''s word that every man bears his own burden.'),
  ('pseudepigrapha', '2-enoch', 53, 1, 'canon', '1-timothy', 2, 5, 'free', E'1 Timothy 2:5 — *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus);* Because no father can pray away a son''s sin, the canon names the only Mediator who stands between Elohim and men.'),
  -- thread: 2-enoch-53-all-works-written-the-vain-imaginings
  ('pseudepigrapha', '2-enoch', 53, 2, 'canon', 'matthew', 12, 36, 'free', E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Enoch''s written record of all works and the vain imaginings of the heart is the same reckoning the Messiah names — account given for every idle word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en53_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en53_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-53-no-man-prays-away-anothers-sin',
       E'No man stands to pray away another''s sin — each bears his own',
       E'Enoch forbids his sons a comforting lie — that their translated father will intercede and cancel their guilt: *do not say: Our father is standing before Elohim (God), and is praying for our sins, for there is there no helper of any man who has sinned* (2 Enoch 53:1). This is no new word; it is the Law and the Prophets. Ezekiel sets the soul''s account on its own head: *The son shall not bear the iniquity of the father, neither shall the father bear the iniquity of the son* (Ezekiel 18:20), and Jeremiah''s new-covenant word agrees, *every one shall die for his own iniquity* (Jeremiah 31:30). The Psalm shuts the door on any man buying his brother off: *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalms 49:7). Paul carries it into the day of reckoning — *every one of us shall give account of himself to Elohim* (Romans 14:12), *every man shall bear his own burden* (Galatians 6:5). And because no father, prophet, or patriarch can stand in that gap, the canon names the only one who can: *there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). It ain''t new — Enoch points past himself to the one Mediator.',
       sv.verse_id, ev.verse_id, 'extras', 83300
  FROM _session411_2en53_lookup sv, _session411_2en53_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=53 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-53-all-works-written-the-vain-imaginings',
       E'All works written before creation — the vain imaginings of the heart',
       E'Enoch testifies that every deed is recorded and every secret thought seen: *I wrote all works of every man... because Yahuah (Lord) see all imaginings of man, how they are vain, where they lie in the treasure-houses of the heart* (2 Enoch 53:2). This is the canon''s own witness — that the imaginations of the heart lie open before Yahuah, and that even the idle word is brought to account: *every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36). It ain''t new — the books Enoch keeps are the books opened at the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 83303
  FROM _session411_2en53_lookup sv, _session411_2en53_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=53 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-53-no-man-prays-away-anothers-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:20 — *The soul that sinneth, it shall die. The son shall not bear the iniquity of the father, neither shall the father bear the iniquity of the son: the righteousness of the righteous shall be upon him, and the wickedness of the wicked shall be upon him.* Enoch''s word that no father intercedes for a son''s sin is Ezekiel''s law of the soul that bears its own iniquity.'
  FROM cross_reference_threads t, cross_references x, _session411_2en53_lookup sv, _session411_2en53_lookup tv
 WHERE t.slug='2-enoch-53-no-man-prays-away-anothers-sin'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 49:7 — *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him:* The sons cannot lean on their father''s prayer; the Psalm declares no man can redeem his brother or pay his ransom to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en53_lookup sv, _session411_2en53_lookup tv
 WHERE t.slug='2-enoch-53-no-man-prays-away-anothers-sin'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:30 — *But every one shall die for his own iniquity: every man that eateth the sour grape, his teeth shall be set on edge.* "No helper of any man who has sinned" is Jeremiah''s new-covenant word that every one shall die for his own iniquity.'
  FROM cross_reference_threads t, cross_references x, _session411_2en53_lookup sv, _session411_2en53_lookup tv
 WHERE t.slug='2-enoch-53-no-man-prays-away-anothers-sin'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 14:12 — *So then every one of us shall give account of himself to Elohim (God).* Each son answers for himself, as Paul says every one shall give his own account to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en53_lookup sv, _session411_2en53_lookup tv
 WHERE t.slug='2-enoch-53-no-man-prays-away-anothers-sin'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Galatians 6:5 — *For every man shall bear his own burden.* Enoch''s "no helper of any man who has sinned" is Paul''s word that every man bears his own burden.'
  FROM cross_reference_threads t, cross_references x, _session411_2en53_lookup sv, _session411_2en53_lookup tv
 WHERE t.slug='2-enoch-53-no-man-prays-away-anothers-sin'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Timothy 2:5 — *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus);* Because no father can pray away a son''s sin, the canon names the only Mediator who stands between Elohim and men.'
  FROM cross_reference_threads t, cross_references x, _session411_2en53_lookup sv, _session411_2en53_lookup tv
 WHERE t.slug='2-enoch-53-no-man-prays-away-anothers-sin'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-53-all-works-written-the-vain-imaginings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Enoch''s written record of all works and the vain imaginings of the heart is the same reckoning the Messiah names — account given for every idle word.'
  FROM cross_reference_threads t, cross_references x, _session411_2en53_lookup sv, _session411_2en53_lookup tv
 WHERE t.slug='2-enoch-53-all-works-written-the-vain-imaginings'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=53 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_54.sql (session411 2-enoch 54) -----
-- Source anchor: pseudepigrapha/2-enoch ch54. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en54 (view _session411_2en54_lookup). Sort band base 83325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en54_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-54-hand-down-the-books-for-an-inheritance
  ('pseudepigrapha', '2-enoch', 54, 2, 'canon', 'deuteronomy', 6, 6, 'free', E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* Enoch''s books left as an inheritance to instruct the children echo Moses'' charge that the words be in the heart and taught to the next generation.'),
  ('pseudepigrapha', '2-enoch', 54, 2, 'canon', 'psalms', 78, 4, 'free', E'Psalms 78:4 — *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done.* "That they may see Yahuah''s very great and marvellous works" is the Psalm''s resolve to show the generation to come the wonderful works of Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en54_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en54_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-54-hand-down-the-books-for-an-inheritance',
       E'Hand down the books — an inheritance for the generations',
       E'Enoch entrusts the written witness to his sons as a heritage to be passed on: *let these books which I have given you be for an inheritance of your peace. Hand them to all who want them, and instruct them, that they may see Yahuah''s (Lord''s) very great and marvellous works* (2 Enoch 54:1-2). This is the very charge of Moses and of the Psalm of Asaph — that the words and wonders of Yahuah be laid up in the heart and handed to the children: *these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6), and *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD)... his wonderful works that he hath done* (Psalms 78:4). It ain''t new — the handing-down of the marvellous works is the duty Moses set on every father.',
       sv.verse_id, ev.verse_id, 'extras', 83325
  FROM _session411_2en54_lookup sv, _session411_2en54_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=54 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=54 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-54-hand-down-the-books-for-an-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* Enoch''s books left as an inheritance to instruct the children echo Moses'' charge that the words be in the heart and taught to the next generation.'
  FROM cross_reference_threads t, cross_references x, _session411_2en54_lookup sv, _session411_2en54_lookup tv
 WHERE t.slug='2-enoch-54-hand-down-the-books-for-an-inheritance'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=54 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 78:4 — *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done.* "That they may see Yahuah''s very great and marvellous works" is the Psalm''s resolve to show the generation to come the wonderful works of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en54_lookup sv, _session411_2en54_lookup tv
 WHERE t.slug='2-enoch-54-hand-down-the-books-for-an-inheritance'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=54 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_55.sql (session411 2-enoch 55) -----
-- Source anchor: pseudepigrapha/2-enoch ch55. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en55 (view _session411_2en55_lookup). Sort band base 83350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en55_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-55-going-up-to-the-uppermost-jerusalem
  ('pseudepigrapha', '2-enoch', 55, 3, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Enoch''s going up to heaven to his eternal inheritance is the very taking Moses records — he was not, for Elohim took him.'),
  ('pseudepigrapha', '2-enoch', 55, 3, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The day of Enoch''s term and departure is the translation the apostle names — he should not see death, for Elohim had translated him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en55_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en55_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-55-going-up-to-the-uppermost-jerusalem',
       E'Going up to the uppermost Jerusalem — Enoch''s eternal inheritance',
       E'Enoch tells his sons his term has come and the angels wait to bear him away: *to-morrow I shall go up on to heaven, to the uppermost Jerusalem to my eternal inheritance* (2 Enoch 55:3). The canon records this very departure — that Enoch was not, for Elohim took him, and that by faith he was translated without seeing death: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), *By faith Enoch was translated that he should not see death... because Elohim (God) had translated him* (Hebrews 11:5). It ain''t new — the seer''s going-up is the translation Moses recorded and the apostle confirmed.',
       sv.verse_id, ev.verse_id, 'extras', 83350
  FROM _session411_2en55_lookup sv, _session411_2en55_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=55 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=55 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-55-going-up-to-the-uppermost-jerusalem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Enoch''s going up to heaven to his eternal inheritance is the very taking Moses records — he was not, for Elohim took him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en55_lookup sv, _session411_2en55_lookup tv
 WHERE t.slug='2-enoch-55-going-up-to-the-uppermost-jerusalem'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The day of Enoch''s term and departure is the translation the apostle names — he should not see death, for Elohim had translated him.'
  FROM cross_reference_threads t, cross_references x, _session411_2en55_lookup sv, _session411_2en55_lookup tv
 WHERE t.slug='2-enoch-55-going-up-to-the-uppermost-jerusalem'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_56.sql (session411 2-enoch 56) -----
-- Source anchor: pseudepigrapha/2-enoch ch56. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en56 (view _session411_2en56_lookup). Sort band base 83375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en56_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-56-anointed-with-glory-no-earthly-food
  ('pseudepigrapha', '2-enoch', 56, 1, 'canon', 'hebrews', 13, 2, 'free', E'Hebrews 13:2 — *Be not forgetful to entertain strangers: for thereby some have entertained angels unawares.* Methuselah''s desire to set a table before his father keeps the canon''s charge to entertain strangers, by which some have received angels unawares.'),
  ('pseudepigrapha', '2-enoch', 56, 1, 'canon', 'genesis', 18, 2, 'free', E'Genesis 18:2 — *And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground,* The offered hospitality of Enoch''s house echoes Abraham running to meet the three men at his tent door.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en56_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en56_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-56-anointed-with-glory-no-earthly-food',
       E'Anointed with the ointment of glory — no earthly food remains in him',
       E'Methuselah would set a table and have his father bless their dwellings, but Enoch, now clothed in the heavenly order, declines: *from the time when Yahuah (Lord) anointed me with the ointment of his glory, there has been no food in me, and my soul remembers not earthly enjoyment* (2 Enoch 56:2). Yet the canon keeps the host''s open table as a duty, for through it the holy ones have been received unawares: *Be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2) — as Abraham did when the men stood by him at his tent door: *he ran to meet them from the tent door, and bowed himself toward the ground* (Genesis 18:2). It ain''t new — Methuselah keeps Abraham''s hospitality, while Enoch, anointed for glory, no longer needs the bread of earth.',
       sv.verse_id, ev.verse_id, 'extras', 83375
  FROM _session411_2en56_lookup sv, _session411_2en56_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=56 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=56 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-56-anointed-with-glory-no-earthly-food
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 13:2 — *Be not forgetful to entertain strangers: for thereby some have entertained angels unawares.* Methuselah''s desire to set a table before his father keeps the canon''s charge to entertain strangers, by which some have received angels unawares.'
  FROM cross_reference_threads t, cross_references x, _session411_2en56_lookup sv, _session411_2en56_lookup tv
 WHERE t.slug='2-enoch-56-anointed-with-glory-no-earthly-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=56 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:2 — *And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground,* The offered hospitality of Enoch''s house echoes Abraham running to meet the three men at his tent door.'
  FROM cross_reference_threads t, cross_references x, _session411_2en56_lookup sv, _session411_2en56_lookup tv
 WHERE t.slug='2-enoch-56-anointed-with-glory-no-earthly-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=56 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_58.sql (session411 2-enoch 58) -----
-- Source anchor: pseudepigrapha/2-enoch ch58. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en58 (view _session411_2en58_lookup). Sort band base 83425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en58_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-58-adam-named-the-beasts-set-lord-over-all
  ('pseudepigrapha', '2-enoch', 58, 4, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Adam appointed ruler over all the beasts is the dominion Elohim grants the man made in His image.'),
  ('pseudepigrapha', '2-enoch', 58, 3, 'canon', 'genesis', 2, 19, 'free', E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Enoch''s account of the beasts brought before Adam to be named is Moses'' own record of the naming of every living creature.'),
  ('pseudepigrapha', '2-enoch', 58, 4, 'canon', 'psalms', 8, 6, 'free', E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* The man appointed ruler with all things subject under his hands is the dominion the Psalm sings over the works of Elohim''s hands.'),
  -- thread: 2-enoch-58-the-souls-of-beasts-shall-accuse
  ('pseudepigrapha', '2-enoch', 58, 7, 'canon', 'proverbs', 12, 10, 'free', E'Proverbs 12:10 — *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* The souls of beasts that accuse the man who feeds them ill confirm the Proverb — the righteous man regards the life of his beast, the cruel man stands condemned.'),
  ('pseudepigrapha', '2-enoch', 58, 7, 'canon', 'matthew', 12, 36, 'free', E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Enoch''s "great judgment" where the beasts accuse the man is the day of judgment in which men give account, named by the Messiah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en58_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en58_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-58-adam-named-the-beasts-set-lord-over-all',
       E'Adam named the beasts and was set lord over all',
       E'Enoch rehearses the sixth-day order: Yahuah brought the living creatures before Adam, who named them, and was appointed their ruler — *Yahuah (Lord) called all the beasts of the earth... and brought them all before the face of our father Adam. And Adam gave the names to all things living on earth. And Yahuah (Lord) appointed him ruler over all* (2 Enoch 58:2-4). This is Genesis verse for verse: the dominion granted at creation, *let them have dominion over the fish of the sea, and over the fowl of the air* (Genesis 1:26), the bringing of the creatures to be named, *brought them unto Adam to see what he would call them* (Genesis 2:19), and the Psalm that sums it, *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalms 8:6). It ain''t new — Enoch is reading Moses'' account of the man set over the works of Elohim''s hands.',
       sv.verse_id, ev.verse_id, 'extras', 83425
  FROM _session411_2en58_lookup sv, _session411_2en58_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=58 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=58 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-58-the-souls-of-beasts-shall-accuse',
       E'The souls of beasts have a place, and shall accuse the man who feeds them ill',
       E'Enoch teaches that the dominion is no licence for cruelty: the beasts have their place, and at the last they will rise against the man who abused them — *beasts will not perish, nor all souls of beasts which Yahuah (Lord) created, till the great judgment, and they will accuse man, if he feed them ill* (2 Enoch 58:7). This dominion was always bound to mercy, for the Law of Moses and the Proverbs guard the creature: *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel* (Proverbs 12:10). And the reckoning Enoch foretells is the Messiah''s own — that men shall give account in the day of judgment: *every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36). It ain''t new — the rule over the beasts carries the righteous man''s regard for their life.',
       sv.verse_id, ev.verse_id, 'extras', 83428
  FROM _session411_2en58_lookup sv, _session411_2en58_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=58 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=58 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-58-adam-named-the-beasts-set-lord-over-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Adam appointed ruler over all the beasts is the dominion Elohim grants the man made in His image.'
  FROM cross_reference_threads t, cross_references x, _session411_2en58_lookup sv, _session411_2en58_lookup tv
 WHERE t.slug='2-enoch-58-adam-named-the-beasts-set-lord-over-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=58 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Enoch''s account of the beasts brought before Adam to be named is Moses'' own record of the naming of every living creature.'
  FROM cross_reference_threads t, cross_references x, _session411_2en58_lookup sv, _session411_2en58_lookup tv
 WHERE t.slug='2-enoch-58-adam-named-the-beasts-set-lord-over-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* The man appointed ruler with all things subject under his hands is the dominion the Psalm sings over the works of Elohim''s hands.'
  FROM cross_reference_threads t, cross_references x, _session411_2en58_lookup sv, _session411_2en58_lookup tv
 WHERE t.slug='2-enoch-58-adam-named-the-beasts-set-lord-over-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=58 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-58-the-souls-of-beasts-shall-accuse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 12:10 — *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* The souls of beasts that accuse the man who feeds them ill confirm the Proverb — the righteous man regards the life of his beast, the cruel man stands condemned.'
  FROM cross_reference_threads t, cross_references x, _session411_2en58_lookup sv, _session411_2en58_lookup tv
 WHERE t.slug='2-enoch-58-the-souls-of-beasts-shall-accuse'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=58 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Enoch''s "great judgment" where the beasts accuse the man is the day of judgment in which men give account, named by the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en58_lookup sv, _session411_2en58_lookup tv
 WHERE t.slug='2-enoch-58-the-souls-of-beasts-shall-accuse'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=58 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_59.sql (session411 2-enoch 59) -----
-- Source anchor: pseudepigrapha/2-enoch ch59. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en59 (view _session411_2en59_lookup). Sort band base 83450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en59_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-59-clean-sacrifice-a-cure-for-the-soul
  ('pseudepigrapha', '2-enoch', 59, 2, 'canon', 'leviticus', 1, 4, 'free', E'Leviticus 1:4 — *And he shall put his hand upon the head of the burnt offering; and it shall be accepted for him to make atonement for him.* Enoch''s clean sacrifice for sin that brings cure of the soul is the burnt offering accepted to make atonement for the man.'),
  ('pseudepigrapha', '2-enoch', 59, 2, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The clean animal brought for a cure of the soul is the blood given on the altar to make atonement for the soul.'),
  ('pseudepigrapha', '2-enoch', 59, 4, 'canon', 'genesis', 9, 3, 'free', E'Genesis 9:3 — *Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things.* "All is given you for food" is the grant Yahuah made to Noah — every living thing for meat, as the green herb.'),
  -- thread: 2-enoch-59-who-defiles-a-beasts-soul-defiles-his-own
  ('pseudepigrapha', '2-enoch', 59, 6, 'canon', 'deuteronomy', 22, 6, 'free', E'Deuteronomy 22:6 — *If a bird''s nest chance to be before thee in the way in any tree, or on the ground, whether they be young ones, or eggs, and the dam sitting upon the young, or upon the eggs, thou shalt not take the dam with the young:* Enoch''s ban on injuring a beast in secret keeps the Law''s own care for the creature — not taking the dam with her young.'),
  ('pseudepigrapha', '2-enoch', 59, 6, 'canon', 'deuteronomy', 22, 7, 'free', E'Deuteronomy 22:7 — *But thou shalt in any wise let the dam go, and take the young to thee; that it may be well with thee, and that thou mayest prolong thy days.* The mercy to the creature Enoch commands carries the Law''s blessing — let the dam go, that it may be well with thee and thy days be prolonged.'),
  ('pseudepigrapha', '2-enoch', 59, 1, 'canon', 'proverbs', 12, 10, 'free', E'Proverbs 12:10 — *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* "Whoever defiles the soul of beasts, defiles his own soul" weighs the man as the Proverb does — the righteous regards his beast''s life, the wicked''s mercies are cruelty.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en59_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en59_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-59-clean-sacrifice-a-cure-for-the-soul',
       E'Right sacrifice — clean animals bring a cure for the soul',
       E'Enoch sets the lawful offering against cruelty: *man brings clean animals to make sacrifice for sin, that he may have cure of his soul... bind it by the four feet, that is to make good the cure* (2 Enoch 59:2-4). This is the Levitical altar — that the offering is accepted to make atonement, the life given for the soul: *he shall put his hand upon the head of the burnt offering; and it shall be accepted for him to make atonement for him* (Leviticus 1:4), *the life of the flesh is in the blood... it is the blood that maketh an atonement for the soul* (Leviticus 17:11). And the food granted to man is the grant of Noah after the flood: *Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things* (Genesis 9:3). It ain''t new — Enoch distinguishes the lawful sacrifice that cures the soul from the wanton killing that defiles it.',
       sv.verse_id, ev.verse_id, 'extras', 83450
  FROM _session411_2en59_lookup sv, _session411_2en59_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=59 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-59-who-defiles-a-beasts-soul-defiles-his-own',
       E'Whoever defiles the soul of a beast defiles his own soul',
       E'Enoch names cruelty to the creature a defiling of the man himself: *Whoever defiles the soul of beasts, defiles his own soul* (2 Enoch 59:1); *whoever kills beast without wounds, kills his own souls and defiles his own flesh... he who does any beast any injury whatsoever, in secret, it is evil practice, and he defiles his own soul* (2 Enoch 59:5-6). The Law that guards the mother bird already binds mercy to the creature, with blessing for those who keep it: *thou shalt not take the dam with the young... let the dam go, and take the young to thee; that it may be well with thee, and that thou mayest prolong thy days* (Deuteronomy 22:6-7); and the Proverb measures the man by it — *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel* (Proverbs 12:10). It ain''t new — the secret injury to a beast is the wickedness Moses and the Proverbs already condemn.',
       sv.verse_id, ev.verse_id, 'extras', 83453
  FROM _session411_2en59_lookup sv, _session411_2en59_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=59 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-59-clean-sacrifice-a-cure-for-the-soul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 1:4 — *And he shall put his hand upon the head of the burnt offering; and it shall be accepted for him to make atonement for him.* Enoch''s clean sacrifice for sin that brings cure of the soul is the burnt offering accepted to make atonement for the man.'
  FROM cross_reference_threads t, cross_references x, _session411_2en59_lookup sv, _session411_2en59_lookup tv
 WHERE t.slug='2-enoch-59-clean-sacrifice-a-cure-for-the-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The clean animal brought for a cure of the soul is the blood given on the altar to make atonement for the soul.'
  FROM cross_reference_threads t, cross_references x, _session411_2en59_lookup sv, _session411_2en59_lookup tv
 WHERE t.slug='2-enoch-59-clean-sacrifice-a-cure-for-the-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:3 — *Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things.* "All is given you for food" is the grant Yahuah made to Noah — every living thing for meat, as the green herb.'
  FROM cross_reference_threads t, cross_references x, _session411_2en59_lookup sv, _session411_2en59_lookup tv
 WHERE t.slug='2-enoch-59-clean-sacrifice-a-cure-for-the-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-59-who-defiles-a-beasts-soul-defiles-his-own
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 22:6 — *If a bird''s nest chance to be before thee in the way in any tree, or on the ground, whether they be young ones, or eggs, and the dam sitting upon the young, or upon the eggs, thou shalt not take the dam with the young:* Enoch''s ban on injuring a beast in secret keeps the Law''s own care for the creature — not taking the dam with her young.'
  FROM cross_reference_threads t, cross_references x, _session411_2en59_lookup sv, _session411_2en59_lookup tv
 WHERE t.slug='2-enoch-59-who-defiles-a-beasts-soul-defiles-his-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 22:7 — *But thou shalt in any wise let the dam go, and take the young to thee; that it may be well with thee, and that thou mayest prolong thy days.* The mercy to the creature Enoch commands carries the Law''s blessing — let the dam go, that it may be well with thee and thy days be prolonged.'
  FROM cross_reference_threads t, cross_references x, _session411_2en59_lookup sv, _session411_2en59_lookup tv
 WHERE t.slug='2-enoch-59-who-defiles-a-beasts-soul-defiles-his-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 12:10 — *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* "Whoever defiles the soul of beasts, defiles his own soul" weighs the man as the Proverb does — the righteous regards his beast''s life, the wicked''s mercies are cruelty.'
  FROM cross_reference_threads t, cross_references x, _session411_2en59_lookup sv, _session411_2en59_lookup tv
 WHERE t.slug='2-enoch-59-who-defiles-a-beasts-soul-defiles-his-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_60.sql (session411 2-enoch 60) -----
-- Source anchor: pseudepigrapha/2-enoch ch60. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en60 (view _session411_2en60_lookup). Sort band base 83475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en60_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-60-who-kills-a-mans-soul-kills-his-own
  ('pseudepigrapha', '2-enoch', 60, 1, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* "He who kills a man''s soul kills his own soul" is the word given Noah — the shedder of man''s blood has his own blood shed, for man bears Elohim''s image.'),
  ('pseudepigrapha', '2-enoch', 60, 2, 'canon', 'matthew', 7, 12, 'free', E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* The snare that catches the man who set it confirms the golden rule — do to others as you would have them do, which is the law and the prophets.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en60_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en60_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-60-who-kills-a-mans-soul-kills-his-own',
       E'He who kills a man''s soul kills his own soul',
       E'Enoch turns from the beast to the man, and the warning sharpens: *He who works the killing of a man''s soul, kills his own soul, and kills his own body, and there is no cure for him for all time* (2 Enoch 60:1); the snare laid for another catches the one who set it — *He who puts a man in any snare, shall stick in it himself* (2 Enoch 60:2). This is the blood-for-blood word given to Noah, grounded in the image of Elohim borne by every man: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). And it is the Messiah''s golden rule, the Law and the Prophets in one line: *all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets* (Matthew 7:12). It ain''t new — to take a man''s soul is to forfeit your own, because man bears the image of Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 83475
  FROM _session411_2en60_lookup sv, _session411_2en60_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=60 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=60 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-60-who-kills-a-mans-soul-kills-his-own
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* "He who kills a man''s soul kills his own soul" is the word given Noah — the shedder of man''s blood has his own blood shed, for man bears Elohim''s image.'
  FROM cross_reference_threads t, cross_references x, _session411_2en60_lookup sv, _session411_2en60_lookup tv
 WHERE t.slug='2-enoch-60-who-kills-a-mans-soul-kills-his-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* The snare that catches the man who set it confirms the golden rule — do to others as you would have them do, which is the law and the prophets.'
  FROM cross_reference_threads t, cross_references x, _session411_2en60_lookup sv, _session411_2en60_lookup tv
 WHERE t.slug='2-enoch-60-who-kills-a-mans-soul-kills-his-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=60 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_61.sql (session411 2-enoch 61) -----
-- Source anchor: pseudepigrapha/2-enoch ch61. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en61 (view _session411_2en61_lookup). Sort band base 83500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en61_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-61-do-to-every-soul-as-for-thine-own
  ('pseudepigrapha', '2-enoch', 61, 1, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* "So let him do to every living soul" is Moses'' command to love thy neighbour as thyself.'),
  ('pseudepigrapha', '2-enoch', 61, 1, 'canon', 'matthew', 7, 12, 'free', E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* Enoch''s rule to do for every soul as a man asks for his own is the Messiah''s golden rule, the law and the prophets.'),
  -- thread: 2-enoch-61-much-inheritance-prepared-the-good-houses
  ('pseudepigrapha', '2-enoch', 61, 2, 'canon', 'john', 14, 2, 'free', E'John 14:2 — *In my Father''s house are many mansions: if it were not so, I would have told you. I go to prepare a place for you.* The good houses prepared, "much inheritance... without number many," are the many mansions the Messiah goes to prepare in the Father''s house.'),
  ('pseudepigrapha', '2-enoch', 61, 1, 'canon', 'matthew', 25, 34, 'free', E'Matthew 25:34 — *Then shall the King say unto them on his right hand, Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world:* The inheritance prepared, good for the good, is the kingdom prepared from the foundation of the world for the blessed.'),
  ('pseudepigrapha', '2-enoch', 61, 3, 'canon', 'matthew', 6, 20, 'free', E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* The good thought and labour brought before Yahuah''s face that fills the good house is the treasure laid up in heaven the Messiah commends.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en61_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en61_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-61-do-to-every-soul-as-for-thine-own',
       E'Do to every living soul as a man asks for his own',
       E'Enoch lays down the rule that binds all the rest: *Just as a man asks something for his own soul from Elohim (God), so let him do to every living soul* (2 Enoch 61:1). This is the Law of Moses and the word of the Messiah in one breath — love measured by the love a man wants for himself: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18), and *all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets* (Matthew 7:12). It ain''t new — Enoch''s measure for every living soul is the second great commandment.',
       sv.verse_id, ev.verse_id, 'extras', 83500
  FROM _session411_2en61_lookup sv, _session411_2en61_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=61 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-61-much-inheritance-prepared-the-good-houses',
       E'Much inheritance prepared — the good houses and the bad',
       E'Enoch unfolds the world to come as dwellings already made ready, lot for lot: *in the great time to come there is much inheritance prepared for men, good for the good, and bad for the bad... Blessed are those who enter the good houses, for in the bad houses there is no peace* (2 Enoch 61:1-2). The Messiah speaks the same: the many dwellings in the Father''s house, and the kingdom prepared from the foundation of the world — *In my Father''s house are many mansions... I go to prepare a place for you* (John 14:2), *Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world* (Matthew 25:34). And the treasure that fills the good house is the treasure laid up in heaven: *lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:20-21). It ain''t new — the prepared inheritance Enoch sees is the place the Messiah goes to prepare.',
       sv.verse_id, ev.verse_id, 'extras', 83503
  FROM _session411_2en61_lookup sv, _session411_2en61_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=61 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-61-do-to-every-soul-as-for-thine-own
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* "So let him do to every living soul" is Moses'' command to love thy neighbour as thyself.'
  FROM cross_reference_threads t, cross_references x, _session411_2en61_lookup sv, _session411_2en61_lookup tv
 WHERE t.slug='2-enoch-61-do-to-every-soul-as-for-thine-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* Enoch''s rule to do for every soul as a man asks for his own is the Messiah''s golden rule, the law and the prophets.'
  FROM cross_reference_threads t, cross_references x, _session411_2en61_lookup sv, _session411_2en61_lookup tv
 WHERE t.slug='2-enoch-61-do-to-every-soul-as-for-thine-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-61-much-inheritance-prepared-the-good-houses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:2 — *In my Father''s house are many mansions: if it were not so, I would have told you. I go to prepare a place for you.* The good houses prepared, "much inheritance... without number many," are the many mansions the Messiah goes to prepare in the Father''s house.'
  FROM cross_reference_threads t, cross_references x, _session411_2en61_lookup sv, _session411_2en61_lookup tv
 WHERE t.slug='2-enoch-61-much-inheritance-prepared-the-good-houses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=61 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:34 — *Then shall the King say unto them on his right hand, Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world:* The inheritance prepared, good for the good, is the kingdom prepared from the foundation of the world for the blessed.'
  FROM cross_reference_threads t, cross_references x, _session411_2en61_lookup sv, _session411_2en61_lookup tv
 WHERE t.slug='2-enoch-61-much-inheritance-prepared-the-good-houses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* The good thought and labour brought before Yahuah''s face that fills the good house is the treasure laid up in heaven the Messiah commends.'
  FROM cross_reference_threads t, cross_references x, _session411_2en61_lookup sv, _session411_2en61_lookup tv
 WHERE t.slug='2-enoch-61-much-inheritance-prepared-the-good-houses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_62.sql (session411 2-enoch 62) -----
-- Source anchor: pseudepigrapha/2-enoch ch62. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en62 (view _session411_2en62_lookup). Sort band base 83525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en62_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-62-pay-the-vow-bring-the-gift
  ('pseudepigrapha', '2-enoch', 62, 1, 'canon', 'deuteronomy', 23, 21, 'free', E'Deuteronomy 23:21 — *When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee; and it would be sin in thee.* Enoch''s charge to bring the gift and not take back the promise is Moses'' law that the vow must be paid and not slacked.'),
  ('pseudepigrapha', '2-enoch', 62, 2, 'canon', 'deuteronomy', 23, 23, 'free', E'Deuteronomy 23:23 — *That which is gone out of thy lips thou shalt keep and perform; even a freewill offering, according as thou hast vowed unto Yahuah Elohayka (the LORD thy God), which thou hast promised with thy mouth.* The promise that must be done "of his own will" in 2 Enoch 62:2 is the freewill offering Moses says must be kept and performed.'),
  ('pseudepigrapha', '2-enoch', 62, 2, 'canon', 'ecclesiastes', 5, 4, 'free', E'Ecclesiastes 5:4 — *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed.* Taking back the words before the time in 2 Enoch 62:2 is the deferred and unpaid vow the Preacher warns against.'),
  ('pseudepigrapha', '2-enoch', 62, 2, 'canon', 'ecclesiastes', 5, 5, 'free', E'Ecclesiastes 5:5 — *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay.* The man with no repentance because he did not do what he promised in 2 Enoch 62:2 is the unpaid vower the Preacher says had better never have vowed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en62_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en62_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-62-pay-the-vow-bring-the-gift',
       E'Bring your gift in faith, and pay what you vow before His face',
       E'Enoch''s testament turns to the gift and the vow: *Blessed is the man who in his patience brings his gifts with faith before Yahuah''s (Lord''s) face, because he will find forgiveness of sins* (2 Enoch 62:1), but *if he take back his words before the time, there is no repentance for him; and if the time pass and he do not of his own will what is promised, there is no repentance after death* (2 Enoch 62:2). This is not a new rule — it is Moses'' law of the vow word for word: *When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee; and it would be sin in thee* (Deuteronomy 23:21), *That which is gone out of thy lips thou shalt keep and perform* (Deuteronomy 23:23). The Preacher says the same: *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed* (Ecclesiastes 5:4). It ain''t new — the man who brings his gift in faith and pays what he promised is the man Moses and the Preacher already named.',
       sv.verse_id, ev.verse_id, 'extras', 83525
  FROM _session411_2en62_lookup sv, _session411_2en62_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=62 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-62-pay-the-vow-bring-the-gift
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 23:21 — *When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee; and it would be sin in thee.* Enoch''s charge to bring the gift and not take back the promise is Moses'' law that the vow must be paid and not slacked.'
  FROM cross_reference_threads t, cross_references x, _session411_2en62_lookup sv, _session411_2en62_lookup tv
 WHERE t.slug='2-enoch-62-pay-the-vow-bring-the-gift'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 23:23 — *That which is gone out of thy lips thou shalt keep and perform; even a freewill offering, according as thou hast vowed unto Yahuah Elohayka (the LORD thy God), which thou hast promised with thy mouth.* The promise that must be done "of his own will" in 2 Enoch 62:2 is the freewill offering Moses says must be kept and performed.'
  FROM cross_reference_threads t, cross_references x, _session411_2en62_lookup sv, _session411_2en62_lookup tv
 WHERE t.slug='2-enoch-62-pay-the-vow-bring-the-gift'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=62 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 5:4 — *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed.* Taking back the words before the time in 2 Enoch 62:2 is the deferred and unpaid vow the Preacher warns against.'
  FROM cross_reference_threads t, cross_references x, _session411_2en62_lookup sv, _session411_2en62_lookup tv
 WHERE t.slug='2-enoch-62-pay-the-vow-bring-the-gift'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=62 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 5:5 — *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay.* The man with no repentance because he did not do what he promised in 2 Enoch 62:2 is the unpaid vower the Preacher says had better never have vowed.'
  FROM cross_reference_threads t, cross_references x, _session411_2en62_lookup sv, _session411_2en62_lookup tv
 WHERE t.slug='2-enoch-62-pay-the-vow-bring-the-gift'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=62 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_63.sql (session411 2-enoch 63) -----
-- Source anchor: pseudepigrapha/2-enoch ch63. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en63 (view _session411_2en63_lookup). Sort band base 83550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en63_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-63-clothe-the-naked-feed-the-hungry
  ('pseudepigrapha', '2-enoch', 63, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The reward from Elohim for clothing the naked and feeding the hungry in 2 Enoch 63:1 is the repayment Solomon promises to him who pities the poor.'),
  ('pseudepigrapha', '2-enoch', 63, 2, 'canon', 'proverbs', 21, 13, 'free', E'Proverbs 21:13 — *Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard.* The murmuring heart that forfeits its reward in 2 Enoch 63:2 is the ear stopped at the poor man''s cry, that shall itself cry unheard.'),
  ('pseudepigrapha', '2-enoch', 63, 1, 'canon', 'matthew', 25, 40, 'free', E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* Enoch''s reward for feeding the hungry and clothing the naked in 2 Enoch 63:1 is the deed the King counts as done unto Himself at the judgment.'),
  -- thread: 2-enoch-63-the-proud-and-the-false-tongue
  ('pseudepigrapha', '2-enoch', 63, 4, 'canon', 'mark', 12, 42, 'free', E'Mark 12:42 — *And there came a certain poor widow, and she threw in two mites, which make a farthing.* Over against the proud, boasting giver in 2 Enoch 63:4, the widow''s two mites are the small gift the Messiah lifts above all the rich abundance.'),
  ('pseudepigrapha', '2-enoch', 63, 4, 'canon', 'mark', 12, 43, 'free', E'Mark 12:43 — *And he called unto him his disciples, and saith unto them, Verily I say unto you, That this poor widow hath cast more in, than all they which have cast into the treasury.* The gift weighed by the heart, not the amount, in 2 Enoch 63 is the very measure by which the Messiah declares the widow gave more than the proud.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en63_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en63_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-63-clothe-the-naked-feed-the-hungry',
       E'Clothe the naked and feed the hungry — the reward from Elohim',
       E'Enoch sets the gift to the poor at the heart of the testament: *When man clothes the naked and fills the hungry, he will find reward from Elohim (God)* (2 Enoch 63:1) — but the gift soured by a murmuring heart forfeits all (2 Enoch 63:2). This is not new counsel. Solomon names the lender behind the poor man''s need: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17), and warns him who shuts his ear: *Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard* (Proverbs 21:13). And the King at the judgment counts the very deeds Enoch counts: *Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me* (Matthew 25:40). It ain''t new — the bread to the hungry and the cloak to the naked are the works Moses'' wisdom and the Messiah Himself reward.',
       sv.verse_id, ev.verse_id, 'extras', 83550
  FROM _session411_2en63_lookup sv, _session411_2en63_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=63 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=63 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-63-the-proud-and-the-false-tongue',
       E'The proud and the false tongue, hateful before the Lord',
       E'Against the giver who murmurs Enoch sets the proud, boasting man and the lie: *Every proud and magniloquent man is hateful to Yahuah (Lord), and every false speech, clothed in untruth; it will be cut with the blade of the sword of death, and thrown into the fire, and shall burn for all time* (2 Enoch 63:4). This is the catalogue Solomon already drew up: *A poor man that oppresseth the poor is like a sweeping rain which leaveth no food* — and the proud heart Yahuah hates. The poor man''s gift, despised in his offering, brings down the same judgment David''s Psalm pronounces on the murmurer; and the widow''s two mites stand as the Messiah''s witness that the small gift in faith outweighs the proud abundance: *And there came a certain poor widow, and she threw in two mites, which make a farthing* (Mark 12:42), *That this poor widow hath cast more in, than all they which have cast into the treasury* (Mark 12:43). It ain''t new — the gift weighed by the heart, not the amount, is the Messiah''s own measure.',
       sv.verse_id, ev.verse_id, 'extras', 83553
  FROM _session411_2en63_lookup sv, _session411_2en63_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=63 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=63 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-63-clothe-the-naked-feed-the-hungry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The reward from Elohim for clothing the naked and feeding the hungry in 2 Enoch 63:1 is the repayment Solomon promises to him who pities the poor.'
  FROM cross_reference_threads t, cross_references x, _session411_2en63_lookup sv, _session411_2en63_lookup tv
 WHERE t.slug='2-enoch-63-clothe-the-naked-feed-the-hungry'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=63 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:13 — *Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard.* The murmuring heart that forfeits its reward in 2 Enoch 63:2 is the ear stopped at the poor man''s cry, that shall itself cry unheard.'
  FROM cross_reference_threads t, cross_references x, _session411_2en63_lookup sv, _session411_2en63_lookup tv
 WHERE t.slug='2-enoch-63-clothe-the-naked-feed-the-hungry'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=63 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:40 — *And the King shall answer and say unto them, Verily I say unto you, Inasmuch as ye have done it unto one of the least of these my brethren, ye have done it unto me.* Enoch''s reward for feeding the hungry and clothing the naked in 2 Enoch 63:1 is the deed the King counts as done unto Himself at the judgment.'
  FROM cross_reference_threads t, cross_references x, _session411_2en63_lookup sv, _session411_2en63_lookup tv
 WHERE t.slug='2-enoch-63-clothe-the-naked-feed-the-hungry'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=63 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-63-the-proud-and-the-false-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Mark 12:42 — *And there came a certain poor widow, and she threw in two mites, which make a farthing.* Over against the proud, boasting giver in 2 Enoch 63:4, the widow''s two mites are the small gift the Messiah lifts above all the rich abundance.'
  FROM cross_reference_threads t, cross_references x, _session411_2en63_lookup sv, _session411_2en63_lookup tv
 WHERE t.slug='2-enoch-63-the-proud-and-the-false-tongue'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=63 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 12:43 — *And he called unto him his disciples, and saith unto them, Verily I say unto you, That this poor widow hath cast more in, than all they which have cast into the treasury.* The gift weighed by the heart, not the amount, in 2 Enoch 63 is the very measure by which the Messiah declares the widow gave more than the proud.'
  FROM cross_reference_threads t, cross_references x, _session411_2en63_lookup sv, _session411_2en63_lookup tv
 WHERE t.slug='2-enoch-63-the-proud-and-the-false-tongue'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=63 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_64.sql (session411 2-enoch 64) -----
-- Source anchor: pseudepigrapha/2-enoch ch64. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en64 (view _session411_2en64_lookup). Sort band base 83575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en64_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-64-enoch-whom-the-lord-chose
  ('pseudepigrapha', '2-enoch', 64, 5, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Enoch the people bless as one Yahuah "chose, rather than all men on earth" in 2 Enoch 64:5 is the man Moses records as walking with Elohim and being taken — honored, not deified.'),
  ('pseudepigrapha', '2-enoch', 64, 5, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The chosen seer honored in 2 Enoch 64:5 is the Enoch whose testimony, the apostle says, was that he pleased Elohim — a man of faith, not a divine figure.'),
  ('pseudepigrapha', '2-enoch', 64, 4, 'apocrypha', 'ecclesiasticus', 44, 16, 'extras', E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* The blessing the elders pronounce on Enoch in 2 Enoch 64:4 names the same man the fathers'' wisdom honors as one who pleased Yahuah and was translated.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en64_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en64_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-64-enoch-whom-the-lord-chose',
       E'Enoch, whom the Lord chose — the honored seer, not a god',
       E'The people gather and bow before Enoch as one set apart: *may you be blessed of Yahuah (Lord), the eternal ruler* (2 Enoch 64:4), *since Yahuah (Lord) chose you, rather than all men on earth, and designated you writer of all his creation* (2 Enoch 64:5). Their honor is not worship of a god — Enoch is the man Moses records as walking with Elohim and being taken: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The apostle says the same of his faith, not his divinity: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The wisdom of the fathers names him the same way — a man who pleased Yahuah: *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16). It ain''t new — the people honor a chosen, pleasing man, the Enoch the Torah, the apostle, and the fathers all knew.',
       sv.verse_id, ev.verse_id, 'extras', 83575
  FROM _session411_2en64_lookup sv, _session411_2en64_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=64 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-64-enoch-whom-the-lord-chose
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Enoch the people bless as one Yahuah "chose, rather than all men on earth" in 2 Enoch 64:5 is the man Moses records as walking with Elohim and being taken — honored, not deified.'
  FROM cross_reference_threads t, cross_references x, _session411_2en64_lookup sv, _session411_2en64_lookup tv
 WHERE t.slug='2-enoch-64-enoch-whom-the-lord-chose'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=64 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The chosen seer honored in 2 Enoch 64:5 is the Enoch whose testimony, the apostle says, was that he pleased Elohim — a man of faith, not a divine figure.'
  FROM cross_reference_threads t, cross_references x, _session411_2en64_lookup sv, _session411_2en64_lookup tv
 WHERE t.slug='2-enoch-64-enoch-whom-the-lord-chose'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=64 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* The blessing the elders pronounce on Enoch in 2 Enoch 64:4 names the same man the fathers'' wisdom honors as one who pleased Yahuah and was translated.'
  FROM cross_reference_threads t, cross_references x, _session411_2en64_lookup sv, _session411_2en64_lookup tv
 WHERE t.slug='2-enoch-64-enoch-whom-the-lord-chose'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_65.sql (session411 2-enoch 65) -----
-- Source anchor: pseudepigrapha/2-enoch ch65. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en65 (view _session411_2en65_lookup). Sort band base 83600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en65_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-65-the-one-aeon-and-the-great-light
  ('pseudepigrapha', '2-enoch', 65, 6, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The aeon with no labour, sickness, or sorrow in 2 Enoch 65:6 is the world John saw where the former things are passed away and every tear is wiped.'),
  ('pseudepigrapha', '2-enoch', 65, 6, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The "neither night, nor darkness, but great light" of 2 Enoch 65:6 is John''s city where there is no night and Yahuah Himself is the light.'),
  ('pseudepigrapha', '2-enoch', 65, 6, 'canon', 'isaiah', 60, 19, 'free', E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The great light of the aeon to come in 2 Enoch 65:6 is the everlasting light Isaiah promised, where Yahuah Himself replaces sun and moon.'),
  ('pseudepigrapha', '2-enoch', 65, 7, 'canon', '1-corinthians', 15, 53, 'free', E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality.* The "paradise bright and incorruptible, for all corruptible things shall pass away" of 2 Enoch 65:7 is Paul''s mystery, that the corruptible puts on incorruption in the age to come.'),
  ('pseudepigrapha', '2-enoch', 65, 6, 'canon', '1-corinthians', 15, 52, 'free', E'1 Corinthians 15:52 — *In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* The gathering of the righteous into eternal life in 2 Enoch 65:6 is the changing of the raised at the last trump Paul declares.'),
  -- thread: 2-enoch-65-he-divided-time-and-counts-the-works
  ('pseudepigrapha', '2-enoch', 65, 2, 'canon', 'isaiah', 65, 17, 'free', E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The end of all creation and the one aeon that follows in 2 Enoch 65 is the new heavens and new earth Yahuah declares through Isaiah.'),
  ('pseudepigrapha', '2-enoch', 65, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The writing of every man''s work, good and bad, for the great judgment in 2 Enoch 65:4-5 is the awaking to everlasting life or contempt Daniel foretold.'),
  ('pseudepigrapha', '2-enoch', 65, 6, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The righteous gathered into the great light of the aeon in 2 Enoch 65:6 are those Daniel says shall shine as the firmament and the stars for ever.'),
  ('pseudepigrapha', '2-enoch', 65, 7, 'canon', '2-peter', 3, 13, 'free', E'2 Peter 3:13 — *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness.* The incorruptible paradise that follows the passing of all corruptible things in 2 Enoch 65:7 is the new heavens and new earth of righteousness Peter says we look for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en65_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en65_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-65-the-one-aeon-and-the-great-light',
       E'When time ends — the one aeon, the great light incorruptible',
       E'Enoch''s last great word is of the age to come: when all creation shall end, *all time shall perish, and the years, and thenceforward there will be neither months nor days nor hours* (2 Enoch 65:5); *There will be one aeon... the great aeon will begin, and they will live eternally, and then too there will be amongst them neither labour, nor sickness, nor humiliation, nor anxiety, nor need, nor brutality, nor night, nor darkness, but great light* (2 Enoch 65:6); a *paradise bright and incorruptible, for all corruptible things shall pass away, and there will be eternal life* (2 Enoch 65:7). This is the very world John was shown: *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4), *And there shall be no night there... for Yahuah Elohim (the Lord God) giveth them light* (Revelation 22:5) — which Isaiah saw first: *the sun shall be no more thy light by day... but Yahuah (LORD) shall be unto thee an everlasting light* (Isaiah 60:19). And the incorruption Enoch promises is Paul''s mystery: *we shall all be changed... the dead shall be raised incorruptible* (1 Corinthians 15:51-52), *For this corruptible must put on incorruption* (1 Corinthians 15:53). It ain''t new — the one aeon of great light is the new heaven and new earth the prophets and apostles already saw.',
       sv.verse_id, ev.verse_id, 'extras', 83600
  FROM _session411_2en65_lookup sv, _session411_2en65_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=65 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-65-he-divided-time-and-counts-the-works',
       E'He made man and divided time — the works written, none hidden',
       E'Before the aeon, Enoch tells how the present age was ordered: Yahuah *created man in the likeness of his own form, and put into him eyes to see, and ears to hear, and heart to reflect* (2 Enoch 65:2), and *divided time, from time he fixed the years... the months... the days, and of days he appointed seven* (2 Enoch 65:3), that man might *write his work bad and good; because no work is hidden before Yahuah (Lord)* (2 Enoch 65:4). This is Moses'' own account: man made in the divine image and the lights set *for signs, and for seasons, and for days, and years* — and the seventh day hallowed. And the writing of every work points where Daniel pointed, to the awaking and the judgment: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2), *And they that be wise shall shine as the brightness of the firmament* (Daniel 12:3) — the same shining Enoch promises the righteous. It ain''t new — the dividing of time and the recording of works are creation and judgment as Moses and Daniel taught them.',
       sv.verse_id, ev.verse_id, 'extras', 83603
  FROM _session411_2en65_lookup sv, _session411_2en65_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=65 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-65-the-one-aeon-and-the-great-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The aeon with no labour, sickness, or sorrow in 2 Enoch 65:6 is the world John saw where the former things are passed away and every tear is wiped.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-the-one-aeon-and-the-great-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The "neither night, nor darkness, but great light" of 2 Enoch 65:6 is John''s city where there is no night and Yahuah Himself is the light.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-the-one-aeon-and-the-great-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The great light of the aeon to come in 2 Enoch 65:6 is the everlasting light Isaiah promised, where Yahuah Himself replaces sun and moon.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-the-one-aeon-and-the-great-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality.* The "paradise bright and incorruptible, for all corruptible things shall pass away" of 2 Enoch 65:7 is Paul''s mystery, that the corruptible puts on incorruption in the age to come.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-the-one-aeon-and-the-great-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 15:52 — *In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* The gathering of the righteous into eternal life in 2 Enoch 65:6 is the changing of the raised at the last trump Paul declares.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-the-one-aeon-and-the-great-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-65-he-divided-time-and-counts-the-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The end of all creation and the one aeon that follows in 2 Enoch 65 is the new heavens and new earth Yahuah declares through Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-he-divided-time-and-counts-the-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The writing of every man''s work, good and bad, for the great judgment in 2 Enoch 65:4-5 is the awaking to everlasting life or contempt Daniel foretold.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-he-divided-time-and-counts-the-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The righteous gathered into the great light of the aeon in 2 Enoch 65:6 are those Daniel says shall shine as the firmament and the stars for ever.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-he-divided-time-and-counts-the-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 3:13 — *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness.* The incorruptible paradise that follows the passing of all corruptible things in 2 Enoch 65:7 is the new heavens and new earth of righteousness Peter says we look for.'
  FROM cross_reference_threads t, cross_references x, _session411_2en65_lookup sv, _session411_2en65_lookup tv
 WHERE t.slug='2-enoch-65-he-divided-time-and-counts-the-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=65 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_66.sql (session411 2-enoch 66) -----
-- Source anchor: pseudepigrapha/2-enoch ch66. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en66 (view _session411_2en66_lookup). Sort band base 83625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en66_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-66-walk-before-his-face-serve-him-alone
  ('pseudepigrapha', '2-enoch', 66, 2, 'canon', 'deuteronomy', 10, 12, 'free', E'Deuteronomy 10:12 — *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul.* To walk before His face in trembling and serve Him alone in 2 Enoch 66:2 is the whole of what Moses says Yahuah requires.'),
  ('pseudepigrapha', '2-enoch', 66, 2, 'canon', 'micah', 6, 8, 'free', E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* Enoch''s charge to walk before His face and bring just offerings in 2 Enoch 66:2-3 is Micah''s word to do justly and walk humbly with Elohim.'),
  ('pseudepigrapha', '2-enoch', 66, 2, 'canon', 'psalms', 96, 9, 'free', E'Psalms 96:9 — *O worship Yahuah (LORD) in the beauty of holiness: fear before him, all the earth.* The terror and trembling before His face in 2 Enoch 66:2 is the fear and worship in holiness the Psalm calls all the earth to render.'),
  -- thread: 2-enoch-66-just-offerings-not-unjust-he-sees-all
  ('pseudepigrapha', '2-enoch', 66, 3, 'canon', 'isaiah', 1, 11, 'free', E'Isaiah 1:11 — *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats.* Enoch''s demand for just offerings, since Yahuah hates the unjust, in 2 Enoch 66:3 is Isaiah''s refusal of the sacrifice He has no delight in.'),
  ('pseudepigrapha', '2-enoch', 66, 3, 'canon', 'isaiah', 1, 17, 'free', E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* The just offering Yahuah receives in 2 Enoch 66:3 is the doing of well and the judging of the oppressed Isaiah sets in place of empty sacrifice.'),
  ('pseudepigrapha', '2-enoch', 66, 5, 'canon', 'psalms', 139, 8, 'free', E'Psalms 139:8 — *If I ascend up into heaven, thou art there: if I make my bed in hell, behold, thou art there.* The "if you look to heaven, the Lord is there... and all the under-earth, the Lord is there" of 2 Enoch 66:5 is David''s confession that Yahuah fills heaven and the depth alike.'),
  ('pseudepigrapha', '2-enoch', 66, 4, 'canon', 'ecclesiastes', 12, 14, 'free', E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* That every thought is always before Yahuah in 2 Enoch 66:4 is the Preacher''s word that Elohim brings every secret work into judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en66_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en66_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-66-walk-before-his-face-serve-him-alone',
       E'Walk before His face in fear, and serve Him alone',
       E'Enoch''s charge gathers all the Law into one posture: *Walk before his face with terror and trembling and serve him alone* (2 Enoch 66:2), *Bow down to the true Elohim (God), not to dumb idols... and bring all just offerings before Yahuah''s (Lord''s) face* (2 Enoch 66:3). This is the whole of what Moses said Yahuah requires: *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart* (Deuteronomy 10:12); and what Micah distilled: *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). The Psalm sets the same trembling worship: *O worship Yahuah (LORD) in the beauty of holiness: fear before him, all the earth* (Psalms 96:9). It ain''t new — to walk before His face and serve Him alone is the first commandment Moses, Micah, and David already pressed home.',
       sv.verse_id, ev.verse_id, 'extras', 83625
  FROM _session411_2en66_lookup sv, _session411_2en66_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=66 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-66-just-offerings-not-unjust-he-sees-all',
       E'Just offerings, not the unjust — for He sees all and judges all',
       E'Enoch turns the sacrifice itself toward justice: *bring all just offerings before Yahuah''s (Lord''s) face. Yahuah (Lord) hates what is unjust* (2 Enoch 66:3); *For Yahuah (Lord) sees all things... every thought is always before Yahuah (Lord)* (2 Enoch 66:4); *If you look to heaven, Yahuah Shammah (the Lord is there)... and all the under-earth, Yahuah Shammah (the Lord is there)* (2 Enoch 66:5). This is Isaiah''s verdict on the offering of cruelty: *To what purpose is the multitude of your sacrifices unto me?... I delight not in the blood of bullocks* (Isaiah 1:11) — *put away the evil of your doings... cease to do evil* (Isaiah 1:16). And the seeing God who is in heaven and the deep is David''s: *If I ascend up into heaven, thou art there: if I make my bed in hell, behold, thou art there* (Psalms 139:8). The Preacher seals the conclusion Enoch reaches: *Fear Elohim (God), and keep his commandments... For Elohim (God) shall bring every work into judgment* (Ecclesiastes 12:13-14). It ain''t new — the offering He receives is justice, and from the seeing God who fills heaven and deep nothing is hidden.',
       sv.verse_id, ev.verse_id, 'extras', 83628
  FROM _session411_2en66_lookup sv, _session411_2en66_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=66 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-66-walk-before-his-face-serve-him-alone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:12 — *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul.* To walk before His face in trembling and serve Him alone in 2 Enoch 66:2 is the whole of what Moses says Yahuah requires.'
  FROM cross_reference_threads t, cross_references x, _session411_2en66_lookup sv, _session411_2en66_lookup tv
 WHERE t.slug='2-enoch-66-walk-before-his-face-serve-him-alone'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* Enoch''s charge to walk before His face and bring just offerings in 2 Enoch 66:2-3 is Micah''s word to do justly and walk humbly with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session411_2en66_lookup sv, _session411_2en66_lookup tv
 WHERE t.slug='2-enoch-66-walk-before-his-face-serve-him-alone'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 96:9 — *O worship Yahuah (LORD) in the beauty of holiness: fear before him, all the earth.* The terror and trembling before His face in 2 Enoch 66:2 is the fear and worship in holiness the Psalm calls all the earth to render.'
  FROM cross_reference_threads t, cross_references x, _session411_2en66_lookup sv, _session411_2en66_lookup tv
 WHERE t.slug='2-enoch-66-walk-before-his-face-serve-him-alone'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-66-just-offerings-not-unjust-he-sees-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:11 — *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats.* Enoch''s demand for just offerings, since Yahuah hates the unjust, in 2 Enoch 66:3 is Isaiah''s refusal of the sacrifice He has no delight in.'
  FROM cross_reference_threads t, cross_references x, _session411_2en66_lookup sv, _session411_2en66_lookup tv
 WHERE t.slug='2-enoch-66-just-offerings-not-unjust-he-sees-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* The just offering Yahuah receives in 2 Enoch 66:3 is the doing of well and the judging of the oppressed Isaiah sets in place of empty sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session411_2en66_lookup sv, _session411_2en66_lookup tv
 WHERE t.slug='2-enoch-66-just-offerings-not-unjust-he-sees-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 139:8 — *If I ascend up into heaven, thou art there: if I make my bed in hell, behold, thou art there.* The "if you look to heaven, the Lord is there... and all the under-earth, the Lord is there" of 2 Enoch 66:5 is David''s confession that Yahuah fills heaven and the depth alike.'
  FROM cross_reference_threads t, cross_references x, _session411_2en66_lookup sv, _session411_2en66_lookup tv
 WHERE t.slug='2-enoch-66-just-offerings-not-unjust-he-sees-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* That every thought is always before Yahuah in 2 Enoch 66:4 is the Preacher''s word that Elohim brings every secret work into judgment.'
  FROM cross_reference_threads t, cross_references x, _session411_2en66_lookup sv, _session411_2en66_lookup tv
 WHERE t.slug='2-enoch-66-just-offerings-not-unjust-he-sees-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=66 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_67.sql (session411 2-enoch 67) -----
-- Source anchor: pseudepigrapha/2-enoch ch67. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en67 (view _session411_2en67_lookup). Sort band base 83650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en67_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-67-enoch-taken-up-and-was-no-more-found
  ('pseudepigrapha', '2-enoch', 67, 1, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The taking up of Enoch to the highest heaven in 2 Enoch 67:1 is the very thing Moses records in five words: Elohim took him, and he was not.'),
  ('pseudepigrapha', '2-enoch', 67, 2, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* That the people "saw and understood not how Enoch had been taken" in 2 Enoch 67:2 is the apostle''s word that Enoch was translated and was not found.'),
  ('pseudepigrapha', '2-enoch', 67, 1, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* The bearing of Enoch to the highest heaven in 2 Enoch 67:1 is the same heavenward taking Israel saw when Elijah went up by the whirlwind.'),
  ('pseudepigrapha', '2-enoch', 67, 1, 'enoch', '1-enoch', 70, 3, 'extras', E'1 Enoch 70:3 — *And the angel Michael seized me by my right hand, And lifted me up and led me forth into all the secrets, And he showed me all the secrets of righteousness.* The taking of Enoch up to where Yahuah is in 2 Enoch 67:1 is the seizing and lifting up by Michael that Enoch''s own earlier vision recounts.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en67_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en67_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-67-enoch-taken-up-and-was-no-more-found',
       E'Enoch taken up — he was no more found on the earth',
       E'The book closes on the wonder Genesis records in five words: *they took Enoch up on to the highest heaven, where Yahuah (Lord) is; and he received him and placed him before his face* (2 Enoch 67:1); *And the people saw and understood not how Enoch had been taken* (2 Enoch 67:2). This is the very thing Moses set down: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The apostle reads it as the reward of faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5). And it is the same heavenward taking Israel saw with Elijah: *there appeared a chariot of fire... and Elijah went up by a whirlwind into heaven* (2 Kings 2:11). Enoch''s own earlier vision tells of the seizing and the ascent: *And the angel Michael seized me by my right hand, And lifted me up* (1 Enoch 70:3). It ain''t new — the man who was no more found is the Enoch Moses, the apostle, and the prophets all knew was taken.',
       sv.verse_id, ev.verse_id, 'extras', 83650
  FROM _session411_2en67_lookup sv, _session411_2en67_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=67 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-67-enoch-taken-up-and-was-no-more-found
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The taking up of Enoch to the highest heaven in 2 Enoch 67:1 is the very thing Moses records in five words: Elohim took him, and he was not.'
  FROM cross_reference_threads t, cross_references x, _session411_2en67_lookup sv, _session411_2en67_lookup tv
 WHERE t.slug='2-enoch-67-enoch-taken-up-and-was-no-more-found'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* That the people "saw and understood not how Enoch had been taken" in 2 Enoch 67:2 is the apostle''s word that Enoch was translated and was not found.'
  FROM cross_reference_threads t, cross_references x, _session411_2en67_lookup sv, _session411_2en67_lookup tv
 WHERE t.slug='2-enoch-67-enoch-taken-up-and-was-no-more-found'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=67 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* The bearing of Enoch to the highest heaven in 2 Enoch 67:1 is the same heavenward taking Israel saw when Elijah went up by the whirlwind.'
  FROM cross_reference_threads t, cross_references x, _session411_2en67_lookup sv, _session411_2en67_lookup tv
 WHERE t.slug='2-enoch-67-enoch-taken-up-and-was-no-more-found'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 70:3 — *And the angel Michael seized me by my right hand, And lifted me up and led me forth into all the secrets, And he showed me all the secrets of righteousness.* The taking of Enoch up to where Yahuah is in 2 Enoch 67:1 is the seizing and lifting up by Michael that Enoch''s own earlier vision recounts.'
  FROM cross_reference_threads t, cross_references x, _session411_2en67_lookup sv, _session411_2en67_lookup tv
 WHERE t.slug='2-enoch-67-enoch-taken-up-and-was-no-more-found'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=70 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2enoch_68.sql (session411 2-enoch 68) -----
-- Source anchor: pseudepigrapha/2-enoch ch68. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2en68 (view _session411_2en68_lookup). Sort band base 83675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session411_2en68_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-enoch-68-methuselah-and-the-line-of-the-fathers
  ('pseudepigrapha', '2-enoch', 68, 6, 'canon', 'genesis', 5, 25, 'free', E'Genesis 5:25 — *And Methuselah lived an hundred eighty and seven years, and begat Lamech.* The Methosalam and sons of Enoch who carry on in 2 Enoch 68:6 are the Methuselah and his line Moses sets down in the genealogy of the fathers.'),
  ('pseudepigrapha', '2-enoch', 68, 6, 'canon', 'genesis', 5, 27, 'free', E'Genesis 5:27 — *And all the days of Methuselah were nine hundred sixty and nine years: and he died.* The succession of Enoch''s sons in 2 Enoch 68:6 is the same line of the fathers whose days and deaths Moses numbers in Genesis 5.'),
  ('pseudepigrapha', '2-enoch', 68, 9, 'canon', 'hebrews', 7, 24, 'free', E'Hebrews 7:24 — *But this man, because he continueth ever, hath an unchangeable priesthood.* The witness handed on "from generation to generation, from age to age" in 2 Enoch 68:9, past every father who dies, looks to the One whose priesthood, the apostle says, continues for ever.'),
  -- thread: 2-enoch-68-the-altar-at-achuzan-and-the-offering
  ('pseudepigrapha', '2-enoch', 68, 7, 'canon', 'numbers', 18, 7, 'free', E'Numbers 18:7 — *Therefore thou and thy sons with thee shall keep your priest''s office for every thing of the altar, and within the vail; and ye shall serve: I have given your priest''s office unto you as a service of gift: and the stranger that cometh nigh shall be put to death.* The altar raised and the sacrifice offered before His face by Enoch''s sons in 2 Enoch 68:6-7 is the priestly service of the altar Moses gives as a gift to the fathers'' line.'),
  ('pseudepigrapha', '2-enoch', 68, 7, 'jubilees', 'jubilees', 7, 3, 'extras', E'Jubilees 7:3 — *And he celebrated with joy the day of this feast, and he made a burnt sacrifice to Yahuah (God), one young ox and one ram, and seven sheep, each a year old, and a kid of the goats, that he might make atonement thereby for himself and his sons.* The sacrificial oxen offered before His face in 2 Enoch 68:7 are the same patriarchal burnt offering Noah, of Enoch''s house, makes upon the altar in Jubilees.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session411_2en68_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session411_2en68_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-68-methuselah-and-the-line-of-the-fathers',
       E'Methuselah and the sons of Enoch — the line of the fathers',
       E'The book ends in the genealogy Moses keeps: Enoch *lived three hundred and sixty-five years* (2 Enoch 68:1), and *Methosalam and his brethren, all the sons of Enoch* (2 Enoch 68:6) carry on. This is the fifth chapter of Genesis, the chain from Enoch to his son: *And Methuselah lived an hundred eighty and seven years, and begat Lamech* (Genesis 5:25), *And all the days of Methuselah were nine hundred sixty and nine years: and he died* (Genesis 5:27). And the handing of the witness *to their sons from generation to generation, from age to age* (2 Enoch 68:9) is the unbroken succession the apostle says the better priesthood fulfils: where the many *were not suffered to continue by reason of death* (Hebrews 7:23), there is One *because he continueth ever, hath an unchangeable priesthood* (Hebrews 7:24). It ain''t new — Methuselah and the sons of Enoch are the line Moses recorded, and the witness handed on awaits the Priest who continues for ever.',
       sv.verse_id, ev.verse_id, 'extras', 83675
  FROM _session411_2en68_lookup sv, _session411_2en68_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=68 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-enoch-68-the-altar-at-achuzan-and-the-offering',
       E'The altar at Achuzan — the offering before the Lord''s face',
       E'Where Enoch was taken, his sons raise an altar: *Methosalam and his brethren... erected an altar at that place called Achuzan, whence and where Enoch had been taken up* (2 Enoch 68:6), and *took sacrificial oxen and summoned all people and sacrificed the sacrifice before Yahuah''s (Lord''s) face* (2 Enoch 68:7). This is the patriarchal worship Moses records, and the priest''s charge to keep the altar: *Therefore thou and thy sons with thee shall keep your priest''s office for every thing of the altar... I have given your priest''s office unto you as a service of gift* (Numbers 18:7). It is the same altar and burnt offering Enoch''s house keeps in the Jubilee record, when Noah after the flood *made a burnt sacrifice to Yahuah (God), one young ox and one ram* (Jubilees 7:3). It ain''t new — the altar at Achuzan and the oxen offered before His face are the patriarchal worship the Torah and the book of Jubilees keep.',
       sv.verse_id, ev.verse_id, 'extras', 83678
  FROM _session411_2en68_lookup sv, _session411_2en68_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=68 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-enoch' AND ev.chapter_number=68 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-enoch-68-methuselah-and-the-line-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:25 — *And Methuselah lived an hundred eighty and seven years, and begat Lamech.* The Methosalam and sons of Enoch who carry on in 2 Enoch 68:6 are the Methuselah and his line Moses sets down in the genealogy of the fathers.'
  FROM cross_reference_threads t, cross_references x, _session411_2en68_lookup sv, _session411_2en68_lookup tv
 WHERE t.slug='2-enoch-68-methuselah-and-the-line-of-the-fathers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=68 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:27 — *And all the days of Methuselah were nine hundred sixty and nine years: and he died.* The succession of Enoch''s sons in 2 Enoch 68:6 is the same line of the fathers whose days and deaths Moses numbers in Genesis 5.'
  FROM cross_reference_threads t, cross_references x, _session411_2en68_lookup sv, _session411_2en68_lookup tv
 WHERE t.slug='2-enoch-68-methuselah-and-the-line-of-the-fathers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=68 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 7:24 — *But this man, because he continueth ever, hath an unchangeable priesthood.* The witness handed on "from generation to generation, from age to age" in 2 Enoch 68:9, past every father who dies, looks to the One whose priesthood, the apostle says, continues for ever.'
  FROM cross_reference_threads t, cross_references x, _session411_2en68_lookup sv, _session411_2en68_lookup tv
 WHERE t.slug='2-enoch-68-methuselah-and-the-line-of-the-fathers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=68 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-enoch-68-the-altar-at-achuzan-and-the-offering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 18:7 — *Therefore thou and thy sons with thee shall keep your priest''s office for every thing of the altar, and within the vail; and ye shall serve: I have given your priest''s office unto you as a service of gift: and the stranger that cometh nigh shall be put to death.* The altar raised and the sacrifice offered before His face by Enoch''s sons in 2 Enoch 68:6-7 is the priestly service of the altar Moses gives as a gift to the fathers'' line.'
  FROM cross_reference_threads t, cross_references x, _session411_2en68_lookup sv, _session411_2en68_lookup tv
 WHERE t.slug='2-enoch-68-the-altar-at-achuzan-and-the-offering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=68 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 7:3 — *And he celebrated with joy the day of this feast, and he made a burnt sacrifice to Yahuah (God), one young ox and one ram, and seven sheep, each a year old, and a kid of the goats, that he might make atonement thereby for himself and his sons.* The sacrificial oxen offered before His face in 2 Enoch 68:7 are the same patriarchal burnt offering Noah, of Enoch''s house, makes upon the altar in Jubilees.'
  FROM cross_reference_threads t, cross_references x, _session411_2en68_lookup sv, _session411_2en68_lookup tv
 WHERE t.slug='2-enoch-68-the-altar-at-achuzan-and-the-offering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-enoch' AND sv.chapter_number=68 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session411 — 2 Enoch cross-references complete.'
