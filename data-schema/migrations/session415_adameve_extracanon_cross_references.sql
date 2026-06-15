-- =====================================================================
-- Session 415 — Adam & Eve FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session415_adameve_extracanon_cross_references.sql
-- =====================================================================

\echo 'session415 — Adam & Eve cross-references starting...'
BEGIN;

-- ----- fragment: minion_adameve_01.sql (session415 adam-eve 1) -----
-- Source anchor: pseudepigrapha/adam-eve ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam01 (view _session415_adam01_lookup). Sort band base 91500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-1-cain-and-abel-born
  ('pseudepigrapha', 'adam-eve', 1, 1, 'canon', 'genesis', 4, 1, 'free', E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* The opening of Adam & Eve, the man knowing his wife after the expulsion, is the very verse with which Moses begins the generations of Adam.'),
  ('pseudepigrapha', 'adam-eve', 1, 3, 'canon', 'genesis', 4, 2, 'free', E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The two sons Eve bears in Adam & Eve 1:3, Cain and Abel, are the same pair Moses names in their birth order.'),
  ('pseudepigrapha', 'adam-eve', 1, 3, 'jubilees', 'jubilees', 4, 1, 'free', E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ’Âwân.* The book of the fathers keeps the same two births, Cain then Abel, that Adam & Eve sets at its head.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-1-cain-and-abel-born',
       E'Cain and Abel born outside Paradise',
       E'The Life of Adam and Eve opens where Genesis leaves off — outside the garden, the man knowing his wife and the first sons coming forth: *And Adam knew his wife Eve and went upwards to the sun-rising* (Adam & Eve 1:1-2), and *Eve conceived and bare two sons; Adiaphotos, who is called Cain and Amilabes who is called Abel* (Adam & Eve 1:3). This is the very order Moses set down: *And Adam knew Eve his wife; and she conceived, and bare Cain* (Genesis 4:1), *And she again bare his brother Abel* (Genesis 4:2). The jubilee record keeps the same two births in the same sequence: *she gave birth to Cain, and in the fourth she gave birth to Abel* (Jubilees 4:1). It ain''t new — the two sons of Adam stand at the head of the line in Moses and in the books of the fathers alike.',
       sv.verse_id, ev.verse_id, 'extras', 91500
  FROM _session415_adam01_lookup sv, _session415_adam01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-1-cain-and-abel-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* The opening of Adam & Eve, the man knowing his wife after the expulsion, is the very verse with which Moses begins the generations of Adam.'
  FROM cross_reference_threads t, cross_references x, _session415_adam01_lookup sv, _session415_adam01_lookup tv
 WHERE t.slug='adam-eve-1-cain-and-abel-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The two sons Eve bears in Adam & Eve 1:3, Cain and Abel, are the same pair Moses names in their birth order.'
  FROM cross_reference_threads t, cross_references x, _session415_adam01_lookup sv, _session415_adam01_lookup tv
 WHERE t.slug='adam-eve-1-cain-and-abel-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ’Âwân.* The book of the fathers keeps the same two births, Cain then Abel, that Adam & Eve sets at its head.'
  FROM cross_reference_threads t, cross_references x, _session415_adam01_lookup sv, _session415_adam01_lookup tv
 WHERE t.slug='adam-eve-1-cain-and-abel-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_03.sql (session415 adam-eve 3) -----
-- Source anchor: pseudepigrapha/adam-eve ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam03 (view _session415_adam03_lookup). Sort band base 91550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-3-abel-murdered-by-cain
  ('pseudepigrapha', 'adam-eve', 3, 1, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Abel found murdered by his brother''s hand in Adam & Eve 3:1 is the slaying Moses records in the field.'),
  ('pseudepigrapha', 'adam-eve', 3, 1, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The blood Eve sees poured out in her dream is the blood that cries from the ground in Moses'' account.'),
  ('pseudepigrapha', 'adam-eve', 3, 1, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The murdered Abel of Adam & Eve 3:1 is the righteous one whose blood still speaks.'),
  ('pseudepigrapha', 'adam-eve', 3, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The hand of Cain in Adam & Eve 3:1 is the very fratricide John sets as the warning against hatred.'),
  ('pseudepigrapha', 'adam-eve', 3, 1, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah dates the shed blood of the righteous from this first murder of Abel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-3-abel-murdered-by-cain',
       E'Abel murdered by the hand of Cain',
       E'Eve''s dream of blood poured into Cain''s mouth is no riddle — it is the first murder seen before it is found: *they both went and found Abel murdered by the hand of Cain his brother* (Adam & Eve 3:1). Moses tells it plainly: *Cain rose up against Abel his brother, and slew him* (Genesis 4:8), and the blood Eve saw drunk in her dream is the blood the ground cries up: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The apostles weigh the two brothers by their works — Abel righteous and heard, Cain of the wicked one: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain... and by it he being dead yet speaketh* (Hebrews 11:4); *Not as Cain, who was of that wicked one, and slew his brother... Because his own works were evil, and his brother''s righteous* (1 John 3:12). The Messiah Himself dates the shed blood of the righteous from this slaying: *from the blood of righteous Abel* (Matthew 23:35). It ain''t new — the murder Eve foresaw is the crying blood of Moses and the witness of the apostles.',
       sv.verse_id, ev.verse_id, 'extras', 91550
  FROM _session415_adam03_lookup sv, _session415_adam03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-3-abel-murdered-by-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Abel found murdered by his brother''s hand in Adam & Eve 3:1 is the slaying Moses records in the field.'
  FROM cross_reference_threads t, cross_references x, _session415_adam03_lookup sv, _session415_adam03_lookup tv
 WHERE t.slug='adam-eve-3-abel-murdered-by-cain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The blood Eve sees poured out in her dream is the blood that cries from the ground in Moses'' account.'
  FROM cross_reference_threads t, cross_references x, _session415_adam03_lookup sv, _session415_adam03_lookup tv
 WHERE t.slug='adam-eve-3-abel-murdered-by-cain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The murdered Abel of Adam & Eve 3:1 is the righteous one whose blood still speaks.'
  FROM cross_reference_threads t, cross_references x, _session415_adam03_lookup sv, _session415_adam03_lookup tv
 WHERE t.slug='adam-eve-3-abel-murdered-by-cain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The hand of Cain in Adam & Eve 3:1 is the very fratricide John sets as the warning against hatred.'
  FROM cross_reference_threads t, cross_references x, _session415_adam03_lookup sv, _session415_adam03_lookup tv
 WHERE t.slug='adam-eve-3-abel-murdered-by-cain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah dates the shed blood of the righteous from this first murder of Abel.'
  FROM cross_reference_threads t, cross_references x, _session415_adam03_lookup sv, _session415_adam03_lookup tv
 WHERE t.slug='adam-eve-3-abel-murdered-by-cain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_04.sql (session415 adam-eve 4) -----
-- Source anchor: pseudepigrapha/adam-eve ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam04 (view _session415_adam04_lookup). Sort band base 91575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-4-seth-in-place-of-abel
  ('pseudepigrapha', 'adam-eve', 4, 2, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Adam''s word in Adam & Eve 4:2, a son in place of Abel whom Cain slew, is Moses'' account verbatim of the appointed seed.'),
  ('pseudepigrapha', 'adam-eve', 4, 1, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The Seth born to Adam in Adam & Eve 4:1 is the son begotten in Adam''s own likeness who heads the book of the generations.'),
  ('pseudepigrapha', 'adam-eve', 4, 2, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s resolve to give glory and sacrifice to Elohim through the new son is the very calling on the Name that returns with Seth''s line.'),
  ('pseudepigrapha', 'adam-eve', 4, 2, 'canon', 'luke', 3, 38, 'free', E'Luke 3:38 — *Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* The son given in Abel''s place stands in the Messiah''s own genealogy, the line from Adam preserved through Seth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-4-seth-in-place-of-abel',
       E'Seth begotten in place of Abel',
       E'Where Abel was cut off, Elohim raises another seed — and Adam answers the loss with worship: *we have begotten a son in place of Abel, whom Cain slew, let us give glory and sacrifice to Elohim (God)* (Adam & Eve 4:1-2). Moses sets it down in the same words: *she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25), and the third son carries the likeness of the first man: *Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3). Through this restored seed the calling on the Name returns — *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — and the line runs unbroken to the Messiah: *the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). It ain''t new — the son given in Abel''s place is Moses'' appointed seed, the head of the godly line.',
       sv.verse_id, ev.verse_id, 'extras', 91575
  FROM _session415_adam04_lookup sv, _session415_adam04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-4-seth-in-place-of-abel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Adam''s word in Adam & Eve 4:2, a son in place of Abel whom Cain slew, is Moses'' account verbatim of the appointed seed.'
  FROM cross_reference_threads t, cross_references x, _session415_adam04_lookup sv, _session415_adam04_lookup tv
 WHERE t.slug='adam-eve-4-seth-in-place-of-abel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The Seth born to Adam in Adam & Eve 4:1 is the son begotten in Adam''s own likeness who heads the book of the generations.'
  FROM cross_reference_threads t, cross_references x, _session415_adam04_lookup sv, _session415_adam04_lookup tv
 WHERE t.slug='adam-eve-4-seth-in-place-of-abel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s resolve to give glory and sacrifice to Elohim through the new son is the very calling on the Name that returns with Seth''s line.'
  FROM cross_reference_threads t, cross_references x, _session415_adam04_lookup sv, _session415_adam04_lookup tv
 WHERE t.slug='adam-eve-4-seth-in-place-of-abel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 3:38 — *Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* The son given in Abel''s place stands in the Messiah''s own genealogy, the line from Adam preserved through Seth.'
  FROM cross_reference_threads t, cross_references x, _session415_adam04_lookup sv, _session415_adam04_lookup tv
 WHERE t.slug='adam-eve-4-seth-in-place-of-abel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_05.sql (session415 adam-eve 5) -----
-- Source anchor: pseudepigrapha/adam-eve ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam05 (view _session415_adam05_lookup). Sort band base 91600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-5-nine-hundred-and-thirty-years
  ('pseudepigrapha', 'adam-eve', 5, 1, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The nine hundred and thirty years and the sickness unto death in Adam & Eve 5:1 are the exact span Moses sets down for the first man.'),
  ('pseudepigrapha', 'adam-eve', 5, 1, 'canon', 'hebrews', 9, 27, 'free', E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* The sickness that falls on Adam before he dies is the once-appointed death that came upon him and passed to all his seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-5-nine-hundred-and-thirty-years',
       E'Adam nine hundred and thirty years, and falls sick',
       E'Adam''s long life closes exactly as Moses measured it, and sickness comes upon him at the end: *Adam lived nine hundred and thirty years; and he fell sick and cried with a loud voice* (Adam & Eve 5:1), and he gathers his sons — *Let all my sons come to me that I may see them before I die* (Adam & Eve 5:2). The number is the number Moses gives: *all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5). The sickness that lays him down is the sentence appointed to all his seed: *as it is appointed unto men once to die, but after this the judgment* (Hebrews 9:27). It ain''t new — Adam''s nine hundred and thirty years and the death at their end are written in Moses, and the appointment to die once stands over every son of Adam.',
       sv.verse_id, ev.verse_id, 'extras', 91600
  FROM _session415_adam05_lookup sv, _session415_adam05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-5-nine-hundred-and-thirty-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The nine hundred and thirty years and the sickness unto death in Adam & Eve 5:1 are the exact span Moses sets down for the first man.'
  FROM cross_reference_threads t, cross_references x, _session415_adam05_lookup sv, _session415_adam05_lookup tv
 WHERE t.slug='adam-eve-5-nine-hundred-and-thirty-years'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* The sickness that falls on Adam before he dies is the once-appointed death that came upon him and passed to all his seed.'
  FROM cross_reference_threads t, cross_references x, _session415_adam05_lookup sv, _session415_adam05_lookup tv
 WHERE t.slug='adam-eve-5-nine-hundred-and-thirty-years'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_07.sql (session415 adam-eve 7) -----
-- Source anchor: pseudepigrapha/adam-eve ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam07 (view _session415_adam07_lookup). Sort band base 91650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-7-the-one-command
  ('pseudepigrapha', 'adam-eve', 7, 1, 'canon', 'genesis', 2, 16, 'free', E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat.* Adam''s words, that he was given power to eat of every tree, are Moses'' grant of the whole garden but for one.'),
  ('pseudepigrapha', 'adam-eve', 7, 1, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The one tree forbidden and the death through it in Adam & Eve 7:1 are the single command and its sentence Moses set down.'),
  ('pseudepigrapha', 'adam-eve', 7, 1, 'canon', 'genesis', 3, 3, 'free', E'Genesis 3:3 — *But of the fruit of the tree which is in the midst of the garden, Elohim (God) hath said, Ye shall not eat of it, neither shall ye touch it, lest ye die.* The charge Adam recalls is the same one Eve repeated to the serpent before she ate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-7-the-one-command',
       E'The one tree forbidden — and through it death',
       E'Adam tells his sons the root of all his sickness in a single charge broken: *He gave us power to eat of every tree which is in paradise, but, concerning that one only, He charged us not to eat of it, and through this one we are to die* (Adam & Eve 7:1). This is the command Moses records word for word — the freedom of every tree and the one exception that carries death: *Of every tree of the garden thou mayest freely eat* (Genesis 2:16), *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17). Eve herself rehearsed it to the serpent — *of the fruit of the tree which is in the midst of the garden, Elohim (God) hath said, Ye shall not eat of it, neither shall ye touch it, lest ye die* (Genesis 3:3). It ain''t new — the one forbidden tree and the death bound to it are Moses'' own words, the dying Adam only names them again.',
       sv.verse_id, ev.verse_id, 'extras', 91650
  FROM _session415_adam07_lookup sv, _session415_adam07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-7-the-one-command
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat.* Adam''s words, that he was given power to eat of every tree, are Moses'' grant of the whole garden but for one.'
  FROM cross_reference_threads t, cross_references x, _session415_adam07_lookup sv, _session415_adam07_lookup tv
 WHERE t.slug='adam-eve-7-the-one-command'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The one tree forbidden and the death through it in Adam & Eve 7:1 are the single command and its sentence Moses set down.'
  FROM cross_reference_threads t, cross_references x, _session415_adam07_lookup sv, _session415_adam07_lookup tv
 WHERE t.slug='adam-eve-7-the-one-command'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:3 — *But of the fruit of the tree which is in the midst of the garden, Elohim (God) hath said, Ye shall not eat of it, neither shall ye touch it, lest ye die.* The charge Adam recalls is the same one Eve repeated to the serpent before she ate.'
  FROM cross_reference_threads t, cross_references x, _session415_adam07_lookup sv, _session415_adam07_lookup tv
 WHERE t.slug='adam-eve-7-the-one-command'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_08.sql (session415 adam-eve 8) -----
-- Source anchor: pseudepigrapha/adam-eve ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam08 (view _session415_adam08_lookup). Sort band base 91675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-8-where-art-thou
  ('pseudepigrapha', 'adam-eve', 8, 1, 'canon', 'genesis', 3, 8, 'free', E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* Yahuah coming into paradise and the man hiding in Adam & Eve 8:1 is Moses'' scene of the voice in the garden.'),
  ('pseudepigrapha', 'adam-eve', 8, 1, 'canon', 'genesis', 3, 9, 'free', E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* The terrible call "Adam, where art thou" in Adam & Eve 8:1 is the very word Moses records first after the Fall.'),
  ('pseudepigrapha', 'adam-eve', 8, 1, 'canon', 'psalms', 139, 7, 'free', E'Psalms 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* Adam''s hiding face and the maker''s question, can the house hide from its builder, are answered by the psalmist: there is no fleeing the presence of the One who formed us.'),
  ('pseudepigrapha', 'adam-eve', 8, 1, 'canon', 'psalms', 139, 12, 'free', E'Psalms 139:12 — *Yea, the darkness hideth not from thee; but the night shineth as the day: the darkness and the light are both alike to thee.* The house cannot hide from its builder, says Adam & Eve 8:1; no darkness hides the creature from the Maker, says the psalm.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-8-where-art-thou',
       E'"Adam, where art thou?" — no hiding from the builder',
       E'Yahuah comes into paradise and calls the hidden man with the question that needs no answer: *Adam, where art thou? And why hidest thou from my face? Shall the house be able to hide itself from its builder?* (Adam & Eve 8:1). It is Moses'' own scene — the voice in the garden and the calling out: *they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves* (Genesis 3:8), *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* (Genesis 3:9). And the maker''s question — can the house hide from its builder? — is the psalmist''s confession that there is no fleeing the Spirit of the One who formed us: *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalms 139:7), *the darkness hideth not from thee; but the night shineth as the day* (Psalms 139:12). It ain''t new — "where art thou" is the first word after the Fall in Moses, and no creature hides from the Maker.',
       sv.verse_id, ev.verse_id, 'extras', 91675
  FROM _session415_adam08_lookup sv, _session415_adam08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-8-where-art-thou
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* Yahuah coming into paradise and the man hiding in Adam & Eve 8:1 is Moses'' scene of the voice in the garden.'
  FROM cross_reference_threads t, cross_references x, _session415_adam08_lookup sv, _session415_adam08_lookup tv
 WHERE t.slug='adam-eve-8-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* The terrible call "Adam, where art thou" in Adam & Eve 8:1 is the very word Moses records first after the Fall.'
  FROM cross_reference_threads t, cross_references x, _session415_adam08_lookup sv, _session415_adam08_lookup tv
 WHERE t.slug='adam-eve-8-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* Adam''s hiding face and the maker''s question, can the house hide from its builder, are answered by the psalmist: there is no fleeing the presence of the One who formed us.'
  FROM cross_reference_threads t, cross_references x, _session415_adam08_lookup sv, _session415_adam08_lookup tv
 WHERE t.slug='adam-eve-8-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 139:12 — *Yea, the darkness hideth not from thee; but the night shineth as the day: the darkness and the light are both alike to thee.* The house cannot hide from its builder, says Adam & Eve 8:1; no darkness hides the creature from the Maker, says the psalm.'
  FROM cross_reference_threads t, cross_references x, _session415_adam08_lookup sv, _session415_adam08_lookup tv
 WHERE t.slug='adam-eve-8-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_09.sql (session415 adam-eve 9) -----
-- Source anchor: pseudepigrapha/adam-eve ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam09 (view _session415_adam09_lookup). Sort band base 91700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-9-half-of-thy-trouble
  ('pseudepigrapha', 'adam-eve', 9, 2, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* Eve''s word that the trouble is on her account reaches for the sorrow Moses appointed the woman at the Fall.'),
  ('pseudepigrapha', 'adam-eve', 9, 2, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* Adam''s distress and toils in Adam & Eve 9:1-2 are the sorrow Moses laid on the man for hearkening to his wife.'),
  ('pseudepigrapha', 'adam-eve', 9, 2, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The trouble that beset Adam ends in the return to dust Moses pronounced over the first man.'),
  ('pseudepigrapha', 'adam-eve', 9, 2, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The sorrow and death come upon Adam by Eve''s own account are the sin and death the apostle traces to the one man, passing upon all.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-9-half-of-thy-trouble',
       E'Eve''s plea to bear half — the sorrow that entered by sin',
       E'Adam groans in great distress, and Eve, owning her part in the Fall, begs to carry it with him: *rise up and give me half of thy trouble and I will endure it; for it is on my account that this hath happened to thee* (Adam & Eve 9:1-2). The trouble she names is the very sorrow Moses says the Fall let loose — sorrow to the woman, sorrow and sweat to the man: *I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children* (Genesis 3:16), *in sorrow shalt thou eat of it all the days of thy life... In the sweat of thy face shalt thou eat bread, till thou return unto the ground* (Genesis 3:17-19). And the toils that beset Adam are the death the apostle traces to that one man: *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). It ain''t new — the trouble Eve would share is the sorrow Moses bound to the Fall, and the death the one man let in upon all.',
       sv.verse_id, ev.verse_id, 'extras', 91700
  FROM _session415_adam09_lookup sv, _session415_adam09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-9-half-of-thy-trouble
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* Eve''s word that the trouble is on her account reaches for the sorrow Moses appointed the woman at the Fall.'
  FROM cross_reference_threads t, cross_references x, _session415_adam09_lookup sv, _session415_adam09_lookup tv
 WHERE t.slug='adam-eve-9-half-of-thy-trouble'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* Adam''s distress and toils in Adam & Eve 9:1-2 are the sorrow Moses laid on the man for hearkening to his wife.'
  FROM cross_reference_threads t, cross_references x, _session415_adam09_lookup sv, _session415_adam09_lookup tv
 WHERE t.slug='adam-eve-9-half-of-thy-trouble'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The trouble that beset Adam ends in the return to dust Moses pronounced over the first man.'
  FROM cross_reference_threads t, cross_references x, _session415_adam09_lookup sv, _session415_adam09_lookup tv
 WHERE t.slug='adam-eve-9-half-of-thy-trouble'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The sorrow and death come upon Adam by Eve''s own account are the sin and death the apostle traces to the one man, passing upon all.'
  FROM cross_reference_threads t, cross_references x, _session415_adam09_lookup sv, _session415_adam09_lookup tv
 WHERE t.slug='adam-eve-9-half-of-thy-trouble'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_12.sql (session415 adam-eve 12) -----
-- Source anchor: pseudepigrapha/adam-eve ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam12 (view _session415_adam12_lookup). Sort band base 91775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-12-stand-off-from-the-image-of-elohim
  ('pseudepigrapha', 'adam-eve', 12, 1, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The "image of Elohim" Seth bids the beast stand off from is Moses'' man made in the image, given dominion over every beast.'),
  ('pseudepigrapha', 'adam-eve', 12, 1, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The repeated phrase "the image of Elohim" is taken straight from this verse.'),
  ('pseudepigrapha', 'adam-eve', 12, 1, 'canon', 'genesis', 1, 28, 'free', E'Genesis 1:28 — *And Elohim (God) blessed them... and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The plea that the beast "was made subject to the image of Elohim" recalls the dominion granted at creation.'),
  ('pseudepigrapha', 'adam-eve', 12, 1, 'canon', 'genesis', 9, 2, 'free', E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air... into your hand are they delivered.* The subjection of the beasts, fractured in Eden so that the beast now "fights with the image of Elohim," is the dominion renewed to Noah.'),
  ('pseudepigrapha', 'adam-eve', 12, 1, 'canon', 'romans', 8, 20, 'free', E'Romans 8:20 — *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope.* The beast''s transformed nature is creation subjected to vanity through man''s sin.'),
  ('pseudepigrapha', 'adam-eve', 12, 1, 'canon', 'romans', 8, 21, 'free', E'Romans 8:21 — *Because the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God).* The risen "rule of the beasts" waits, like Seth''s day of Judgment, to be delivered.'),
  ('pseudepigrapha', 'adam-eve', 12, 1, 'canon', 'romans', 8, 22, 'free', E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Seth''s "until the day of Judgment" is the same horizon the apostle gives the groaning creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-12-stand-off-from-the-image-of-elohim',
       E'Stand off from the image of Elohim — the dominion man forfeited',
       E'When the wild beast assails Seth on the road to paradise, Eve and Seth rebuke it on one ground — that man is the image of Elohim (God) and the beasts were once made subject to him: Eve cries *fearest thou not to fight with the image of Elohim (God)... For long ago wast thou made subject to the image of Elohim (God)* (Adam & Eve 10:3), and Seth commands *stand off from the image of Elohim (God) until the day of Judgment* (Adam & Eve 12:1). That is Moses'' own creation charter: *Let us make man in our image, after our likeness: and let them have dominion... over every creeping thing that creepeth upon the earth* (Genesis 1:26); *in the image of Elohim (God) created he him* (Genesis 1:27). The beast''s own answer — that "the rule of the beasts hath arisen" from Eve''s sin and "our nature also hath been transformed" — names what the apostle names: a creation dragged into bondage by man, that *groaneth and travaileth in pain together until now* (Romans 8:22) and waits, like Seth, for the day of Judgment when it *shall be delivered from the bondage of corruption*. The dread now between man and beast is what was renewed to Noah, *the fear of you and the dread of you shall be upon every beast of the earth* (Genesis 9:2). It ain''t new — the image of Elohim and its lost dominion, groaning for the resurrection, are written plainly in Genesis.',
       sv.verse_id, ev.verse_id, 'extras', 91775
  FROM _session415_adam12_lookup sv, _session415_adam12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-12-stand-off-from-the-image-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The "image of Elohim" Seth bids the beast stand off from is Moses'' man made in the image, given dominion over every beast.'
  FROM cross_reference_threads t, cross_references x, _session415_adam12_lookup sv, _session415_adam12_lookup tv
 WHERE t.slug='adam-eve-12-stand-off-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The repeated phrase "the image of Elohim" is taken straight from this verse.'
  FROM cross_reference_threads t, cross_references x, _session415_adam12_lookup sv, _session415_adam12_lookup tv
 WHERE t.slug='adam-eve-12-stand-off-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:28 — *And Elohim (God) blessed them... and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The plea that the beast "was made subject to the image of Elohim" recalls the dominion granted at creation.'
  FROM cross_reference_threads t, cross_references x, _session415_adam12_lookup sv, _session415_adam12_lookup tv
 WHERE t.slug='adam-eve-12-stand-off-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air... into your hand are they delivered.* The subjection of the beasts, fractured in Eden so that the beast now "fights with the image of Elohim," is the dominion renewed to Noah.'
  FROM cross_reference_threads t, cross_references x, _session415_adam12_lookup sv, _session415_adam12_lookup tv
 WHERE t.slug='adam-eve-12-stand-off-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 8:20 — *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope.* The beast''s transformed nature is creation subjected to vanity through man''s sin.'
  FROM cross_reference_threads t, cross_references x, _session415_adam12_lookup sv, _session415_adam12_lookup tv
 WHERE t.slug='adam-eve-12-stand-off-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 8:21 — *Because the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God).* The risen "rule of the beasts" waits, like Seth''s day of Judgment, to be delivered.'
  FROM cross_reference_threads t, cross_references x, _session415_adam12_lookup sv, _session415_adam12_lookup tv
 WHERE t.slug='adam-eve-12-stand-off-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Seth''s "until the day of Judgment" is the same horizon the apostle gives the groaning creation.'
  FROM cross_reference_threads t, cross_references x, _session415_adam12_lookup sv, _session415_adam12_lookup tv
 WHERE t.slug='adam-eve-12-stand-off-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_13.sql (session415 adam-eve 13) -----
-- Source anchor: pseudepigrapha/adam-eve ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam13 (view _session415_adam13_lookup). Sort band base 91800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-13-oil-of-mercy-in-the-end-of-the-times
  ('pseudepigrapha', 'adam-eve', 13, 2, 'canon', 'isaiah', 61, 1, 'free', E'Isaiah 61:1 — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound.* The oil of mercy "in the end of the times" is the anointing the prophet announces — mercy come for the broken.'),
  ('pseudepigrapha', 'adam-eve', 13, 2, 'canon', 'isaiah', 61, 3, 'free', E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness.* "The oil of joy for mourning" is the oil of mercy Seth and Eve weep for, deferred to the day it is poured out.'),
  ('pseudepigrapha', 'adam-eve', 13, 2, 'canon', 'psalms', 45, 7, 'free', E'Psalm 45:7 — *Thou lovest righteousness, and hatest wickedness: therefore Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows.* The tree "which floweth with oil" is fulfilled in the Anointed One anointed with the oil of gladness.'),
  ('pseudepigrapha', 'adam-eve', 13, 3, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life... and the leaves of the tree were for the healing of the nations.* The oil-flowing tree of paradise, barred from Adam now, is the tree of life restored when "the delights of paradise be given" at the great day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-13-oil-of-mercy-in-the-end-of-the-times',
       E'The oil of mercy — not now, but in the end of the times',
       E'Seth and Eve weep at the gate of paradise and beg the oil of mercy to anoint dying Adam, and Michael''s answer is the hinge of the whole book: *it shall not be thine now, but in the end of the times. Then shall all flesh be raised up from Adam till that great day... Then shall the delights of paradise be given to them and Elohim (God) shall be in their midst* (Adam & Eve 13:2-3). The mercy is not denied — it is deferred to the days of the Messiah, the very anointing the prophet foretold: *Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted* (Isaiah 61:1), to give *the oil of joy for mourning* (Isaiah 61:3) — the oil Adam could not have, poured out in the Anointed One *anointed... with the oil of gladness above thy fellows* (Psalm 45:7). And the tree that flows with that oil is the tree of life kept in paradise, restored at last in the city where *the leaves of the tree were for the healing of the nations* (Revelation 22:2). Michael''s promise that the evil heart shall be taken away and a new heart given is the new-covenant hope itself. It ain''t new — the oil of mercy withheld from Adam is the Messiah''s anointing the prophets named, given to all that mourn in the last days.',
       sv.verse_id, ev.verse_id, 'extras', 91800
  FROM _session415_adam13_lookup sv, _session415_adam13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=13 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-13-oil-of-mercy-in-the-end-of-the-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 61:1 — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound.* The oil of mercy "in the end of the times" is the anointing the prophet announces — mercy come for the broken.'
  FROM cross_reference_threads t, cross_references x, _session415_adam13_lookup sv, _session415_adam13_lookup tv
 WHERE t.slug='adam-eve-13-oil-of-mercy-in-the-end-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness.* "The oil of joy for mourning" is the oil of mercy Seth and Eve weep for, deferred to the day it is poured out.'
  FROM cross_reference_threads t, cross_references x, _session415_adam13_lookup sv, _session415_adam13_lookup tv
 WHERE t.slug='adam-eve-13-oil-of-mercy-in-the-end-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 45:7 — *Thou lovest righteousness, and hatest wickedness: therefore Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows.* The tree "which floweth with oil" is fulfilled in the Anointed One anointed with the oil of gladness.'
  FROM cross_reference_threads t, cross_references x, _session415_adam13_lookup sv, _session415_adam13_lookup tv
 WHERE t.slug='adam-eve-13-oil-of-mercy-in-the-end-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life... and the leaves of the tree were for the healing of the nations.* The oil-flowing tree of paradise, barred from Adam now, is the tree of life restored when "the delights of paradise be given" at the great day.'
  FROM cross_reference_threads t, cross_references x, _session415_adam13_lookup sv, _session415_adam13_lookup tv
 WHERE t.slug='adam-eve-13-oil-of-mercy-in-the-end-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_14.sql (session415 adam-eve 14) -----
-- Source anchor: pseudepigrapha/adam-eve ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam14 (view _session415_adam14_lookup). Sort band base 91825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-14-great-wrath-which-is-death
  ('pseudepigrapha', 'adam-eve', 14, 2, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Adam''s "great wrath which is death... lording it over all our race" is the death that passed upon all men through one transgression.'),
  ('pseudepigrapha', 'adam-eve', 14, 2, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The "death" Eve brought is the sentence attached to the one command from the beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-14-great-wrath-which-is-death',
       E'Great wrath which is death — by one woman, by one man',
       E'Adam, told his hour is fixed, names what Eve''s transgression brought into the race: *Thou hast brought upon us great wrath which is death, [lording it over all our race]* (Adam & Eve 14:2). That is the exact reckoning Moses gave when the one command was laid down — *in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17) — and the exact reckoning the apostle draws out: *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). Adam''s grief that death now lords it "over all our race" is Paul''s death passing upon all men. It ain''t new — that one transgression let in the death that reigns over the whole race is the plain teaching of Genesis, and the apostle only confirms it.',
       sv.verse_id, ev.verse_id, 'extras', 91825
  FROM _session415_adam14_lookup sv, _session415_adam14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=14 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-14-great-wrath-which-is-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Adam''s "great wrath which is death... lording it over all our race" is the death that passed upon all men through one transgression.'
  FROM cross_reference_threads t, cross_references x, _session415_adam14_lookup sv, _session415_adam14_lookup tv
 WHERE t.slug='adam-eve-14-great-wrath-which-is-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The "death" Eve brought is the sentence attached to the one command from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session415_adam14_lookup sv, _session415_adam14_lookup tv
 WHERE t.slug='adam-eve-14-great-wrath-which-is-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_17.sql (session415 adam-eve 17) -----
-- Source anchor: pseudepigrapha/adam-eve ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam17 (view _session415_adam17_lookup). Sort band base 91900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-17-satan-in-the-form-of-an-angel
  ('pseudepigrapha', 'adam-eve', 17, 2, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan appearing "in the form of an angel" and singing hymns at the wall of paradise is the very transformation the apostle warns of.'),
  ('pseudepigrapha', 'adam-eve', 17, 4, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The devil answering "through the mouth of the serpent" with "ye do not eat of every plant" is Moses'' subtil serpent and its opening question.'),
  ('pseudepigrapha', 'adam-eve', 17, 5, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Eve''s reply, that of the one tree "on the day on which ye eat of it, ye shall die the death," repeats the one command and its death sentence.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-17-satan-in-the-form-of-an-angel',
       E'Satan in the form of an angel — light borrowed to deceive',
       E'Eve tells how the deceiver came not openly but in counterfeit glory: when the angels went up to worship, *then Satan appeared in the form of an angel and sang hymns like the angels. And I bent over the wall and saw him, like an angel* (Adam & Eve 17:2). That is exactly the apostle''s warning — *Satan himself is transformed into an angel of light* (2 Corinthians 11:14). Then, speaking *through the mouth of the serpent* (Adam & Eve 17:4), he opens with the same probing question Moses recorded: *Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1) — Eve answering that of one tree only *Elohim (God) charged us not to eat... ye shall die the death*, the very sentence of Genesis 2:17. It ain''t new — that the adversary deceives by disguise, shining as an angel and speaking through the serpent, is the Eden account Moses gave and the apostle confirmed.',
       sv.verse_id, ev.verse_id, 'extras', 91900
  FROM _session415_adam17_lookup sv, _session415_adam17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=17 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-17-satan-in-the-form-of-an-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan appearing "in the form of an angel" and singing hymns at the wall of paradise is the very transformation the apostle warns of.'
  FROM cross_reference_threads t, cross_references x, _session415_adam17_lookup sv, _session415_adam17_lookup tv
 WHERE t.slug='adam-eve-17-satan-in-the-form-of-an-angel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The devil answering "through the mouth of the serpent" with "ye do not eat of every plant" is Moses'' subtil serpent and its opening question.'
  FROM cross_reference_threads t, cross_references x, _session415_adam17_lookup sv, _session415_adam17_lookup tv
 WHERE t.slug='adam-eve-17-satan-in-the-form-of-an-angel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Eve''s reply, that of the one tree "on the day on which ye eat of it, ye shall die the death," repeats the one command and its death sentence.'
  FROM cross_reference_threads t, cross_references x, _session415_adam17_lookup sv, _session415_adam17_lookup tv
 WHERE t.slug='adam-eve-17-satan-in-the-form-of-an-angel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_18.sql (session415 adam-eve 18) -----
-- Source anchor: pseudepigrapha/adam-eve ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam18 (view _session415_adam18_lookup). Sort band base 91925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-18-ye-shall-be-as-elohim
  ('pseudepigrapha', 'adam-eve', 18, 2, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The serpent''s "Fear not" is Moses'' "Ye shall not surely die" — the flat denial of the death sentence of Genesis 2:17.'),
  ('pseudepigrapha', 'adam-eve', 18, 2, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* "Ye too shall be as Elohim, in that ye shall know good and evil" is this verse almost word for word.'),
  ('pseudepigrapha', 'adam-eve', 18, 4, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof... ye shall be as gods.* The serpent''s slander that Elohim "envied you" and so said "Ye shall not eat of it" is this same insinuation — that the Maker forbids the fruit out of jealousy of the godhood it gives.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-18-ye-shall-be-as-elohim',
       E'Ye shall be as Elohim — the serpent''s lie word for word',
       E'When Eve hesitates for fear of Elohim''s word, the serpent presses with the precise lie Moses recorded — first denying the death sentence, then promising godhood: *Fear not, for as soon as thou eatest of it, ye too shall be as Elohim (God), in that ye shall know good and evil* (Adam & Eve 18:2). That is Genesis verbatim: the serpent''s *Ye shall not surely die* (Genesis 3:4) set against Elohim''s "thou shalt surely die," and the bait *ye shall be as gods, knowing good and evil* (Genesis 3:5). The added slander — that Elohim *envied you* and forbade the fruit to keep you down (Adam & Eve 18:4) — is the same twist on the Maker''s goodness, the serpent''s hint that Elohim withholds out of jealousy. It ain''t new — the temptation that toppled the first woman, the flat contradiction of Elohim''s word and the promise to be as gods, stands written in Genesis 3, and Eve only retells what Moses already told.',
       sv.verse_id, ev.verse_id, 'extras', 91925
  FROM _session415_adam18_lookup sv, _session415_adam18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-18-ye-shall-be-as-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The serpent''s "Fear not" is Moses'' "Ye shall not surely die" — the flat denial of the death sentence of Genesis 2:17.'
  FROM cross_reference_threads t, cross_references x, _session415_adam18_lookup sv, _session415_adam18_lookup tv
 WHERE t.slug='adam-eve-18-ye-shall-be-as-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* "Ye too shall be as Elohim, in that ye shall know good and evil" is this verse almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session415_adam18_lookup sv, _session415_adam18_lookup tv
 WHERE t.slug='adam-eve-18-ye-shall-be-as-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof... ye shall be as gods.* The serpent''s slander that Elohim "envied you" and so said "Ye shall not eat of it" is this same insinuation — that the Maker forbids the fruit out of jealousy of the godhood it gives.'
  FROM cross_reference_threads t, cross_references x, _session415_adam18_lookup sv, _session415_adam18_lookup tv
 WHERE t.slug='adam-eve-18-ye-shall-be-as-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_19.sql (session415 adam-eve 19) -----
-- Source anchor: pseudepigrapha/adam-eve ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam19 (view _session415_adam19_lookup). Sort band base 91950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-19-poison-which-is-lust
  ('pseudepigrapha', 'adam-eve', 19, 3, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* The lust the serpent pours on the fruit is exactly the bait by which James says a man is drawn away.'),
  ('pseudepigrapha', 'adam-eve', 19, 3, 'canon', 'james', 1, 15, 'free', E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* James spells out the chain Adam & Eve 19:3 names lust ''the root and beginning of every sin'' that ends in death.'),
  ('pseudepigrapha', 'adam-eve', 19, 3, 'canon', '1-john', 2, 16, 'free', E'1 John 2:16 — *For all that is in the world, the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world.* John, like the book, makes lust the world''s enticing root, not of the Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-19-poison-which-is-lust',
       E'The poison of his wickedness, which is lust, the root of every sin',
       E'When the serpent had taken Eve''s oath he poured upon the fruit *the poison of his wickedness, which is lust, the root and beginning of every sin* (Adam & Eve 19:3). The book names the inward mechanism of the Fall, and the apostles trace sin to the very same root. James sets out the whole chain from desire to death: *But every man is tempted, when he is drawn away of his own lust, and enticed.* (James 1:14), and *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* (James 1:15). John names the three lusts that are the substance of the world''s enticement: *For all that is in the world, the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world.* (1 John 2:16). It ain''t new — that lust is the seed of every sin is already the apostles'' diagnosis.',
       sv.verse_id, ev.verse_id, 'extras', 91950
  FROM _session415_adam19_lookup sv, _session415_adam19_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=19 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-19-poison-which-is-lust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* The lust the serpent pours on the fruit is exactly the bait by which James says a man is drawn away.'
  FROM cross_reference_threads t, cross_references x, _session415_adam19_lookup sv, _session415_adam19_lookup tv
 WHERE t.slug='adam-eve-19-poison-which-is-lust'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* James spells out the chain Adam & Eve 19:3 names lust ''the root and beginning of every sin'' that ends in death.'
  FROM cross_reference_threads t, cross_references x, _session415_adam19_lookup sv, _session415_adam19_lookup tv
 WHERE t.slug='adam-eve-19-poison-which-is-lust'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 2:16 — *For all that is in the world, the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world.* John, like the book, makes lust the world''s enticing root, not of the Father.'
  FROM cross_reference_threads t, cross_references x, _session415_adam19_lookup sv, _session415_adam19_lookup tv
 WHERE t.slug='adam-eve-19-poison-which-is-lust'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_20.sql (session415 adam-eve 20) -----
-- Source anchor: pseudepigrapha/adam-eve ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam20 (view _session415_adam20_lookup). Sort band base 91975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-20-stripped-of-the-glory
  ('pseudepigrapha', 'adam-eve', 20, 1, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Eve''s eyes opened and her flight to leaves (Adam & Eve 20:1,4-5, the fig tree alone) is this very verse told from within.'),
  ('pseudepigrapha', 'adam-eve', 20, 3, 'canon', 'romans', 3, 23, 'free', E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* The glory Eve says she was stripped of is the glory Paul says all have since come short of.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-20-stripped-of-the-glory',
       E'Bare of the righteousness with which I had been clothed',
       E'In the same hour Eve''s *eyes were opened, and forthwith I knew that I was bare of the righteousness with which I had been clothed* (Adam & Eve 20:1), deprived of *the glory with which I was clothed* (Adam & Eve 20:3), and she sought leaves to cover her shame (Adam & Eve 20:4). This is Eve''s first-person retelling of the moment Genesis records from outside: *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* (Genesis 3:7). Paul names what was lost in that hour — the glory of Elohim: *For all have sinned, and come short of the glory of Elohim (God);* (Romans 3:23). It ain''t new — the eyes opened, the glory stripped, the leaves gathered are the very words of Moses and Paul.',
       sv.verse_id, ev.verse_id, 'extras', 91975
  FROM _session415_adam20_lookup sv, _session415_adam20_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-20-stripped-of-the-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Eve''s eyes opened and her flight to leaves (Adam & Eve 20:1,4-5, the fig tree alone) is this very verse told from within.'
  FROM cross_reference_threads t, cross_references x, _session415_adam20_lookup sv, _session415_adam20_lookup tv
 WHERE t.slug='adam-eve-20-stripped-of-the-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* The glory Eve says she was stripped of is the glory Paul says all have since come short of.'
  FROM cross_reference_threads t, cross_references x, _session415_adam20_lookup sv, _session415_adam20_lookup tv
 WHERE t.slug='adam-eve-20-stripped-of-the-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_21.sql (session415 adam-eve 21) -----
-- Source anchor: pseudepigrapha/adam-eve ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam21 (view _session415_adam21_lookup). Sort band base 92000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-21-ye-shall-be-as-gods
  ('pseudepigrapha', 'adam-eve', 21, 3, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* ''Thou shalt be as a Elohim'' is the serpent''s promise of Genesis 3:5, now spoken through Eve to Adam.'),
  ('pseudepigrapha', 'adam-eve', 21, 5, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* Eve''s ''Fear not'' answer to Adam''s dread of Elohim''s wrath echoes the serpent''s first denial that death would follow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-21-ye-shall-be-as-gods',
       E'Thou shalt be as a god, knowing good and evil',
       E'With the devil speaking through her mouth, Eve urges Adam to eat *and thou shalt be as a Elohim (God)* (Adam & Eve 21:3), and when he fears Elohim''s wrath she answers *Fear not, for as soon as thou hast eaten thou shalt know good and evil* (Adam & Eve 21:5). This is the serpent''s lie carried to Adam through Eve — the very promise Genesis puts in the serpent''s mouth: *And the serpent said unto the woman, Ye shall not surely die:* (Genesis 3:4), and *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* (Genesis 3:5). It ain''t new — ''ye shall be as gods, knowing good and evil'' is the same deceit Moses recorded at the tree.',
       sv.verse_id, ev.verse_id, 'extras', 92000
  FROM _session415_adam21_lookup sv, _session415_adam21_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=21 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-21-ye-shall-be-as-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* ''Thou shalt be as a Elohim'' is the serpent''s promise of Genesis 3:5, now spoken through Eve to Adam.'
  FROM cross_reference_threads t, cross_references x, _session415_adam21_lookup sv, _session415_adam21_lookup tv
 WHERE t.slug='adam-eve-21-ye-shall-be-as-gods'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* Eve''s ''Fear not'' answer to Adam''s dread of Elohim''s wrath echoes the serpent''s first denial that death would follow.'
  FROM cross_reference_threads t, cross_references x, _session415_adam21_lookup sv, _session415_adam21_lookup tv
 WHERE t.slug='adam-eve-21-ye-shall-be-as-gods'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_22.sql (session415 adam-eve 22) -----
-- Source anchor: pseudepigrapha/adam-eve ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam22 (view _session415_adam22_lookup). Sort band base 92025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-22-trumpet-and-yahuah-comes-to-judge
  ('pseudepigrapha', 'adam-eve', 22, 3, 'canon', 'genesis', 3, 8, 'free', E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* Elohim''s appearing in paradise to judge Adam (Adam & Eve 22:2-3) is this coming of Yahuah into the garden, dramatised with trumpet and chariot.'),
  ('pseudepigrapha', 'adam-eve', 22, 2, 'canon', 'psalms', 50, 3, 'free', E'Psalm 50:3 — *Our Elohim (God) shall come, and shall not keep silence: a fire shall devour before him, and it shall be very tempestuous round about him.* The summons to ''hear the judgement'' is the Psalmist''s coming Elohim who will not keep silence.'),
  ('pseudepigrapha', 'adam-eve', 22, 2, 'canon', 'psalms', 50, 4, 'free', E'Psalm 50:4 — *He shall call to the heavens from above, and to the earth, that he may judge his people.* Michael''s call to the angels to come and hear the judgement matches the Psalm''s summons of heaven and earth to the judgment.'),
  ('pseudepigrapha', 'adam-eve', 22, 1, 'canon', '1-thessalonians', 4, 16, 'free', E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* The archangel and trumpet heralding Yahuah''s coming in Eden is the same figure Paul uses for the descent at the last day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-22-trumpet-and-yahuah-comes-to-judge',
       E'Michael''s trumpet, and Elohim comes to judge',
       E'Eve hears *the archangel Michael blowing with his trumpet* (Adam & Eve 22:1), and the call goes out, *Come with me to Paradise and hear the judgement with which I shall judge Adam* (Adam & Eve 22:2); then *Elohim (God) appeared in paradise, mounted on the chariot of his cherubim* (Adam & Eve 22:3). The book dramatises with a trumpet and chariot what Genesis tells plainly: *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day* (Genesis 3:8). The Psalmist sings the same theophany — Elohim coming, not silent, to judge: *Our Elohim (God) shall come, and shall not keep silence: a fire shall devour before him* (Psalm 50:3), *He shall call to the heavens from above, and to the earth, that he may judge his people.* (Psalm 50:4). And the trumpet and descending Yahuah the book pictures at Adam''s judging is the figure the apostle uses for the last: *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God)* (1 Thessalonians 4:16). It ain''t new — the coming of Elohim to judge, heralded by trumpet, is written from Eden to the prophets to the apostles.',
       sv.verse_id, ev.verse_id, 'extras', 92025
  FROM _session415_adam22_lookup sv, _session415_adam22_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=22 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-22-trumpet-and-yahuah-comes-to-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* Elohim''s appearing in paradise to judge Adam (Adam & Eve 22:2-3) is this coming of Yahuah into the garden, dramatised with trumpet and chariot.'
  FROM cross_reference_threads t, cross_references x, _session415_adam22_lookup sv, _session415_adam22_lookup tv
 WHERE t.slug='adam-eve-22-trumpet-and-yahuah-comes-to-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 50:3 — *Our Elohim (God) shall come, and shall not keep silence: a fire shall devour before him, and it shall be very tempestuous round about him.* The summons to ''hear the judgement'' is the Psalmist''s coming Elohim who will not keep silence.'
  FROM cross_reference_threads t, cross_references x, _session415_adam22_lookup sv, _session415_adam22_lookup tv
 WHERE t.slug='adam-eve-22-trumpet-and-yahuah-comes-to-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 50:4 — *He shall call to the heavens from above, and to the earth, that he may judge his people.* Michael''s call to the angels to come and hear the judgement matches the Psalm''s summons of heaven and earth to the judgment.'
  FROM cross_reference_threads t, cross_references x, _session415_adam22_lookup sv, _session415_adam22_lookup tv
 WHERE t.slug='adam-eve-22-trumpet-and-yahuah-comes-to-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* The archangel and trumpet heralding Yahuah''s coming in Eden is the same figure Paul uses for the descent at the last day.'
  FROM cross_reference_threads t, cross_references x, _session415_adam22_lookup sv, _session415_adam22_lookup tv
 WHERE t.slug='adam-eve-22-trumpet-and-yahuah-comes-to-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_23.sql (session415 adam-eve 23) -----
-- Source anchor: pseudepigrapha/adam-eve ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam23 (view _session415_adam23_lookup). Sort band base 92050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-23-adam-where-art-thou
  ('pseudepigrapha', 'adam-eve', 23, 1, 'canon', 'genesis', 3, 9, 'free', E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* The book''s opening call is this verse verbatim.'),
  ('pseudepigrapha', 'adam-eve', 23, 2, 'canon', 'genesis', 3, 10, 'free', E'Genesis 3:10 — *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself.* Adam''s plea that he hid for fear and nakedness is this answer.'),
  ('pseudepigrapha', 'adam-eve', 23, 3, 'canon', 'genesis', 3, 11, 'free', E'Genesis 3:11 — *And he said, Who told thee that thou wast naked? Hast thou eaten of the tree, whereof I commanded thee that thou shouldest not eat?* Elohim''s ''Who showed thee that thou art naked, unless thou hast forsaken my commandment'' is this question.'),
  ('pseudepigrapha', 'adam-eve', 23, 4, 'canon', 'genesis', 3, 12, 'free', E'Genesis 3:12 — *And the man said, The woman whom thou gavest to be with me, she gave me of the tree, and I did eat.* Adam turning to Eve, ''Why hast thou done this,'' is the blame Genesis records him passing to the woman.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-23-adam-where-art-thou',
       E'Adam, where art thou — and the blame passed to Eve',
       E'Elohim calls *Adam, where art thou* (Adam & Eve 23:1); Adam answers that he hid *because I am naked, and I was ashamed* (Adam & Eve 23:2); Elohim asks who showed him his nakedness *unless thou hast forsaken my commandment* (Adam & Eve 23:3); and Adam turns on Eve, *Why hast thou done this*, and she answers, *The serpent deceived me* (Adam & Eve 23:4). This is, almost word for word, the dialogue of Genesis. *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* (Genesis 3:9); his fear and nakedness — *I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself.* (Genesis 3:10); the charge of the broken command — *Hast thou eaten of the tree, whereof I commanded thee that thou shouldest not eat?* (Genesis 3:11); and the blame passed along — *The woman whom thou gavest to be with me, she gave me of the tree, and I did eat.* (Genesis 3:12). It ain''t new — ''Adam, where art thou'' and the blame that follows are the very interrogation Moses set down.',
       sv.verse_id, ev.verse_id, 'extras', 92050
  FROM _session415_adam23_lookup sv, _session415_adam23_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-23-adam-where-art-thou
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:9 — *And Yahuah Elohim (the LORD God) called unto Adam, and said unto him, Where art thou?* The book''s opening call is this verse verbatim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam23_lookup sv, _session415_adam23_lookup tv
 WHERE t.slug='adam-eve-23-adam-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:10 — *And he said, I heard thy voice in the garden, and I was afraid, because I was naked; and I hid myself.* Adam''s plea that he hid for fear and nakedness is this answer.'
  FROM cross_reference_threads t, cross_references x, _session415_adam23_lookup sv, _session415_adam23_lookup tv
 WHERE t.slug='adam-eve-23-adam-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:11 — *And he said, Who told thee that thou wast naked? Hast thou eaten of the tree, whereof I commanded thee that thou shouldest not eat?* Elohim''s ''Who showed thee that thou art naked, unless thou hast forsaken my commandment'' is this question.'
  FROM cross_reference_threads t, cross_references x, _session415_adam23_lookup sv, _session415_adam23_lookup tv
 WHERE t.slug='adam-eve-23-adam-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:12 — *And the man said, The woman whom thou gavest to be with me, she gave me of the tree, and I did eat.* Adam turning to Eve, ''Why hast thou done this,'' is the blame Genesis records him passing to the woman.'
  FROM cross_reference_threads t, cross_references x, _session415_adam23_lookup sv, _session415_adam23_lookup tv
 WHERE t.slug='adam-eve-23-adam-where-art-thou'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_24.sql (session415 adam-eve 24) -----
-- Source anchor: pseudepigrapha/adam-eve ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam24 (view _session415_adam24_lookup). Sort band base 92075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-24-thorns-and-the-sweat
  ('pseudepigrapha', 'adam-eve', 24, 1, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The ''hearkened to thy wife'' and ''cursed is the earth'' of Adam & Eve 24:1 is this verse.'),
  ('pseudepigrapha', 'adam-eve', 24, 1, 'canon', 'genesis', 3, 18, 'free', E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* The ''thorns and thistles shall spring up for thee'' is taken straight from this curse.'),
  ('pseudepigrapha', 'adam-eve', 24, 1, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* ''In the sweat of thy face shalt thou eat thy bread'' is this sentence verbatim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-24-thorns-and-the-sweat',
       E'Cursed is the earth — thorns, thistles, and the sweat of thy face',
       E'Elohim''s sentence on Adam: *Since thou hast disregarded my commandment and hast hearkened to thy wife, cursed is the earth in thy labours... thorns and thistles shall spring up for thee, and in the sweat of thy face shalt thou eat thy bread* (Adam & Eve 24:1), with the toil that never satisfies (Adam & Eve 24:3) and the beasts rising in rebellion (Adam & Eve 24:4). It is the curse of Genesis, scarcely altered: *Because thou hast hearkened unto the voice of thy wife... cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* (Genesis 3:17); *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* (Genesis 3:18); *In the sweat of thy face shalt thou eat bread, till thou return unto the ground* (Genesis 3:19). It ain''t new — the cursed ground, the thorns, and the bread bought by sweat are the words Moses set on Adam.',
       sv.verse_id, ev.verse_id, 'extras', 92075
  FROM _session415_adam24_lookup sv, _session415_adam24_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=24 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-24-thorns-and-the-sweat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The ''hearkened to thy wife'' and ''cursed is the earth'' of Adam & Eve 24:1 is this verse.'
  FROM cross_reference_threads t, cross_references x, _session415_adam24_lookup sv, _session415_adam24_lookup tv
 WHERE t.slug='adam-eve-24-thorns-and-the-sweat'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* The ''thorns and thistles shall spring up for thee'' is taken straight from this curse.'
  FROM cross_reference_threads t, cross_references x, _session415_adam24_lookup sv, _session415_adam24_lookup tv
 WHERE t.slug='adam-eve-24-thorns-and-the-sweat'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* ''In the sweat of thy face shalt thou eat thy bread'' is this sentence verbatim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam24_lookup sv, _session415_adam24_lookup tv
 WHERE t.slug='adam-eve-24-thorns-and-the-sweat'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_25.sql (session415 adam-eve 25) -----
-- Source anchor: pseudepigrapha/adam-eve ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam25 (view _session415_adam25_lookup). Sort band base 92100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-25-throes-of-travail
  ('pseudepigrapha', 'adam-eve', 25, 2, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The ''throes of travail'' and bearing children ''in much trembling'' is this curse on the woman.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-25-throes-of-travail',
       E'In throes of travail thou shalt bear children',
       E'Yahuah turns to Eve: *Since thou hast hearkened to the serpent, and turned a deaf ear to my commandment, thou shalt be in throes of travail and intolerable agonies; thou shalt bear children in much trembling* (Adam & Eve 25:1-2). It is the sentence on the woman in Genesis, the same sorrow over childbearing: *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* (Genesis 3:16). It ain''t new — the travail and sorrow of childbearing are the curse Moses recorded on the woman.',
       sv.verse_id, ev.verse_id, 'extras', 92100
  FROM _session415_adam25_lookup sv, _session415_adam25_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=25 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-25-throes-of-travail
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The ''throes of travail'' and bearing children ''in much trembling'' is this curse on the woman.'
  FROM cross_reference_threads t, cross_references x, _session415_adam25_lookup sv, _session415_adam25_lookup tv
 WHERE t.slug='adam-eve-25-throes-of-travail'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=25 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_26.sql (session415 adam-eve 26) -----
-- Source anchor: pseudepigrapha/adam-eve ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam26 (view _session415_adam26_lookup). Sort band base 92125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-26-cursed-upon-thy-belly
  ('pseudepigrapha', 'adam-eve', 26, 1, 'canon', 'genesis', 3, 14, 'free', E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* ''Accursed art thou among all beasts... on thy breast and belly shalt thou walk... feed on dust'' is this sentence.'),
  ('pseudepigrapha', 'adam-eve', 26, 3, 'jubilees', 'jubilees', 3, 28, 'free', E'Jubilees 3:28 — *And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue.* The serpent stripped of its power to ensnare and silenced among the beasts is the same Eden judgment Jubilees records, when every beast''s mouth was closed.'),
  -- thread: adam-eve-26-bruise-thy-head
  ('pseudepigrapha', 'adam-eve', 26, 4, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* ''I will put enmity between thee and his seed: he shall bruise thy head and thou shalt bruise his heel'' is the protoevangelium of Genesis verbatim.'),
  ('pseudepigrapha', 'adam-eve', 26, 4, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Paul reads the Eden promise as still unfolding ''until the day of Judgement'' — Elohim shall bruise Satan.'),
  ('pseudepigrapha', 'adam-eve', 26, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* ''That old serpent'' is the same enemy of Adam & Eve 26:4, his head now bruised by being cast down.'),
  ('pseudepigrapha', 'adam-eve', 26, 4, 'canon', 'revelation', 12, 17, 'free', E'Revelation 12:17 — *And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ).* The ''enmity between thee and his seed'' carries through to the dragon''s war on the woman''s remnant seed.'),
  ('pseudepigrapha', 'adam-eve', 26, 4, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The bruising of the serpent''s head is the fall of Satan the Messiah witnessed.'),
  ('pseudepigrapha', 'adam-eve', 26, 4, 'canon', 'luke', 10, 19, 'free', E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The seed''s heel set over the serpent is given to those who follow him, to tread on serpents.'),
  ('pseudepigrapha', 'adam-eve', 26, 4, 'canon', 'hebrews', 2, 14, 'free', E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* The bruising of the head is fulfilled in the seed destroying, through death, the devil who held the power of death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-26-cursed-upon-thy-belly',
       E'Accursed among all beasts — upon thy belly and dust shalt thou feed',
       E'Elohim turns to the serpent: *accursed art thou among all beasts. Thou shalt be deprived of the victual of which thou didst eat and shalt feed on dust all the days of thy life: on thy breast and thy belly shalt thou walk* (Adam & Eve 26:1-3). This is the first half of the serpent''s sentence in Genesis, almost unchanged: *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* (Genesis 3:14). The book even self-witnesses in Jubilees, where Eden and its sentence are retold and the beasts'' mouths are closed. It ain''t new — the serpent cursed above all beasts, on his belly, eating dust, is the word Moses set down.',
       sv.verse_id, ev.verse_id, 'extras', 92125
  FROM _session415_adam26_lookup sv, _session415_adam26_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=26 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-26-bruise-thy-head',
       E'He shall bruise thy head — the seed and the serpent',
       E'The keystone of the whole book: *and I will put enmity between thee and his seed: he shall bruise thy head and thou shalt bruise his heel until the day of Judgement* (Adam & Eve 26:4). This is the protoevangelium, the first gospel, spoken in Eden — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The apostles see it coming to its end: *And the Elohim (God) of peace shall bruise Satan under your feet shortly.* (Romans 16:20); the dragon cast down — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth* (Revelation 12:9) — who then *went to make war with the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17); the serpent''s fall and the seed''s dominion over him — *I beheld Satan as lightning fall from heaven.* (Luke 10:18), and *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy* (Luke 10:19); and the death-blow itself — *that through death he might destroy him that had the power of death, that is, the devil;* (Hebrews 2:14). It ain''t new — the bruised head, the enmity, the seed that overthrows the serpent are the gospel already promised at the tree.',
       sv.verse_id, ev.verse_id, 'extras', 92128
  FROM _session415_adam26_lookup sv, _session415_adam26_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=26 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-26-cursed-upon-thy-belly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* ''Accursed art thou among all beasts... on thy breast and belly shalt thou walk... feed on dust'' is this sentence.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-cursed-upon-thy-belly'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 3:28 — *And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue.* The serpent stripped of its power to ensnare and silenced among the beasts is the same Eden judgment Jubilees records, when every beast''s mouth was closed.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-cursed-upon-thy-belly'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: adam-eve-26-bruise-thy-head
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* ''I will put enmity between thee and his seed: he shall bruise thy head and thou shalt bruise his heel'' is the protoevangelium of Genesis verbatim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-bruise-thy-head'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Paul reads the Eden promise as still unfolding ''until the day of Judgement'' — Elohim shall bruise Satan.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-bruise-thy-head'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* ''That old serpent'' is the same enemy of Adam & Eve 26:4, his head now bruised by being cast down.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-bruise-thy-head'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:17 — *And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ).* The ''enmity between thee and his seed'' carries through to the dragon''s war on the woman''s remnant seed.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-bruise-thy-head'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The bruising of the serpent''s head is the fall of Satan the Messiah witnessed.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-bruise-thy-head'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The seed''s heel set over the serpent is given to those who follow him, to tread on serpents.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-bruise-thy-head'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* The bruising of the head is fulfilled in the seed destroying, through death, the devil who held the power of death.'
  FROM cross_reference_threads t, cross_references x, _session415_adam26_lookup sv, _session415_adam26_lookup tv
 WHERE t.slug='adam-eve-26-bruise-thy-head'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_28.sql (session415 adam-eve 28) -----
-- Source anchor: pseudepigrapha/adam-eve ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam28 (view _session415_adam28_lookup). Sort band base 92175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-28-guarded-from-the-tree-of-life
  ('pseudepigrapha', 'adam-eve', 28, 3, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* ''The cherubim with the flaming sword that turneth every way to guard it'' is this verse verbatim.'),
  ('pseudepigrapha', 'adam-eve', 28, 4, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree withheld now but promised at the Resurrection is the tree the Spirit promises the overcomer.'),
  ('pseudepigrapha', 'adam-eve', 28, 4, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The ''if thou shouldst keep thyself from all evil'' before the tree is restored matches the commandment-keepers who gain right to the tree.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-28-guarded-from-the-tree-of-life',
       E'The cherubim and the flaming sword guard the Tree of Life',
       E'Cast out, Adam begs to eat of the Tree of Life, and Yahuah answers: *Thou shalt not take of it now, for I have commanded the cherubim with the flaming sword that turneth (every way) to guard it from thee* (Adam & Eve 28:3) — yet with a promise: *when again the Resurrection hath come to pass, I will raise thee up and then there shall be given to thee the Tree of Life* (Adam & Eve 28:4). This is Genesis, where the way to the tree is barred: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24). And the deferred promise is the one the Spirit renews — the right to the tree restored to the overcomer: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* (Revelation 2:7), and *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* (Revelation 22:14). It ain''t new — the flaming sword that bars the tree, and the promise that it will yet be given, run from Moses to the Revelation.',
       sv.verse_id, ev.verse_id, 'extras', 92175
  FROM _session415_adam28_lookup sv, _session415_adam28_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=28 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=28 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-28-guarded-from-the-tree-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* ''The cherubim with the flaming sword that turneth every way to guard it'' is this verse verbatim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam28_lookup sv, _session415_adam28_lookup tv
 WHERE t.slug='adam-eve-28-guarded-from-the-tree-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The tree withheld now but promised at the Resurrection is the tree the Spirit promises the overcomer.'
  FROM cross_reference_threads t, cross_references x, _session415_adam28_lookup sv, _session415_adam28_lookup tv
 WHERE t.slug='adam-eve-28-guarded-from-the-tree-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The ''if thou shouldst keep thyself from all evil'' before the tree is restored matches the commandment-keepers who gain right to the tree.'
  FROM cross_reference_threads t, cross_references x, _session415_adam28_lookup sv, _session415_adam28_lookup tv
 WHERE t.slug='adam-eve-28-guarded-from-the-tree-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_29.sql (session415 adam-eve 29) -----
-- Source anchor: pseudepigrapha/adam-eve ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam29 (view _session415_adam29_lookup). Sort band base 92200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-29-sweet-spices-for-an-offering
  ('pseudepigrapha', 'adam-eve', 29, 3, 'jubilees', 'jubilees', 3, 27, 'free', E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* This is the same event — Adam taking spices from paradise to offer on his going forth — recorded in the brother-book.'),
  ('pseudepigrapha', 'adam-eve', 29, 6, 'canon', 'exodus', 30, 34, 'free', E'Exodus 30:34 — *And Yahuah (LORD) said unto Moses, Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight:* The four sweet spices Adam carries from paradise prefigure the holy incense Yahuah commands for the sanctuary.'),
  ('pseudepigrapha', 'adam-eve', 29, 5, 'canon', 'exodus', 30, 38, 'free', E'Exodus 30:38 — *Whosoever shall make like unto that, to smell thereto, shall even be cut off from his people.* The ''incense of sweet odour'' given to Adam is the kind set apart as holy in the law of the incense.'),
  ('pseudepigrapha', 'adam-eve', 29, 3, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake...* Adam''s offering ''that he hear me'' is the same sweet-savour worship Noah renews from the ark.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-29-sweet-spices-for-an-offering',
       E'Sweet spices and fragrant herbs for an offering',
       E'Going out of paradise, Adam asks *allow me to take away fragrant herbs from paradise, so that I may offer an offering to Elohim (God)* (Adam & Eve 29:3); Elohim grants *incense of sweet odour from paradise and seeds for his food* (Adam & Eve 29:5), and Adam takes *four kinds: crocus and nard and calamus and cinnamon* (Adam & Eve 29:6). The brother-book records the very offering: *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning* (Jubilees 3:27). The sweet incense Adam carries out is the same Yahuah will later command for the sanctuary: *Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense* (Exodus 30:34), holy to Yahuah (Exodus 30:38). And the offering of sweet savour is the worship Noah renews from the ark: *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21). It ain''t new — the sweet-savour offering, the spices of paradise, are the worship that runs from Adam to Noah to the altar of Moses.',
       sv.verse_id, ev.verse_id, 'extras', 92200
  FROM _session415_adam29_lookup sv, _session415_adam29_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=29 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=29 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-29-sweet-spices-for-an-offering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 3:27 — *And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun from the day when he covered his shame.* This is the same event — Adam taking spices from paradise to offer on his going forth — recorded in the brother-book.'
  FROM cross_reference_threads t, cross_references x, _session415_adam29_lookup sv, _session415_adam29_lookup tv
 WHERE t.slug='adam-eve-29-sweet-spices-for-an-offering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 30:34 — *And Yahuah (LORD) said unto Moses, Take unto thee sweet spices, stacte, and onycha, and galbanum; these sweet spices with pure frankincense: of each shall there be a like weight:* The four sweet spices Adam carries from paradise prefigure the holy incense Yahuah commands for the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session415_adam29_lookup sv, _session415_adam29_lookup tv
 WHERE t.slug='adam-eve-29-sweet-spices-for-an-offering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 30:38 — *Whosoever shall make like unto that, to smell thereto, shall even be cut off from his people.* The ''incense of sweet odour'' given to Adam is the kind set apart as holy in the law of the incense.'
  FROM cross_reference_threads t, cross_references x, _session415_adam29_lookup sv, _session415_adam29_lookup tv
 WHERE t.slug='adam-eve-29-sweet-spices-for-an-offering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=29 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake...* Adam''s offering ''that he hear me'' is the same sweet-savour worship Noah renews from the ark.'
  FROM cross_reference_threads t, cross_references x, _session415_adam29_lookup sv, _session415_adam29_lookup tv
 WHERE t.slug='adam-eve-29-sweet-spices-for-an-offering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_31.sql (session415 adam-eve 31) -----
-- Source anchor: pseudepigrapha/adam-eve ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam31 (view _session415_adam31_lookup). Sort band base 92250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-31-into-his-hands-who-gave-it
  ('pseudepigrapha', 'adam-eve', 31, 4, 'canon', 'psalms', 31, 5, 'free', E'Psalm 31:5 — *Into thine hand I commit my spirit: thou hast redeemed me, O Yahuah Elohim (LORD God) of truth.* Adam''s dying charge — give up my spirit into His hands who gave it me — is David''s same commitment of the spirit to its Maker''s hand.'),
  ('pseudepigrapha', 'adam-eve', 31, 4, 'canon', 'hebrews', 9, 27, 'free', E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* Adam meets his Maker not knowing wrath or mercy — the appointed death-then-reckoning every man of his seed inherits.'),
  ('pseudepigrapha', 'adam-eve', 31, 4, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sentence pronounced in Eden now comes due — Adam yields the spirit the dust must surrender.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-31-into-his-hands-who-gave-it',
       E'Pray till I give up my spirit into His hands who gave it',
       E'Adam, bound to die, will not loose his soul on his own terms but yields it back to its Giver: *now arise rather and pray to Elohim (God) till I give up my spirit into His hands who gave it me. For we know not how we are to meet our Maker, whether He be wroth with us, or be merciful and intend to pity and receive us* (Adam & Eve 31:4). David sings the very surrender Adam reaches for: *Into thine hand I commit my spirit: thou hast redeemed me, O Yahuah Elohim (LORD God) of truth* (Psalm 31:5), and death itself is the appointment all his seed must keep: *And as it is appointed unto men once to die, but after this the judgment* (Hebrews 9:27). The breath was loaned at the forming and is rendered at the end. It ain''t new — the first man dies committing his spirit to the hand that gave it.',
       sv.verse_id, ev.verse_id, 'extras', 92250
  FROM _session415_adam31_lookup sv, _session415_adam31_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=31 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=31 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-31-into-his-hands-who-gave-it
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 31:5 — *Into thine hand I commit my spirit: thou hast redeemed me, O Yahuah Elohim (LORD God) of truth.* Adam''s dying charge — give up my spirit into His hands who gave it me — is David''s same commitment of the spirit to its Maker''s hand.'
  FROM cross_reference_threads t, cross_references x, _session415_adam31_lookup sv, _session415_adam31_lookup tv
 WHERE t.slug='adam-eve-31-into-his-hands-who-gave-it'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* Adam meets his Maker not knowing wrath or mercy — the appointed death-then-reckoning every man of his seed inherits.'
  FROM cross_reference_threads t, cross_references x, _session415_adam31_lookup sv, _session415_adam31_lookup tv
 WHERE t.slug='adam-eve-31-into-his-hands-who-gave-it'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sentence pronounced in Eden now comes due — Adam yields the spirit the dust must surrender.'
  FROM cross_reference_threads t, cross_references x, _session415_adam31_lookup sv, _session415_adam31_lookup tv
 WHERE t.slug='adam-eve-31-into-his-hands-who-gave-it'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_32.sql (session415 adam-eve 32) -----
-- Source anchor: pseudepigrapha/adam-eve ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam32 (view _session415_adam32_lookup). Sort band base 92275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-32-i-have-sinned-against-thee
  ('pseudepigrapha', 'adam-eve', 32, 1, 'canon', 'psalms', 51, 1, 'free', E'Psalm 51:1 — *Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions.* Eve''s prostrate plea for pardon is David''s penitential opening — mercy sought from the offended Elohim.'),
  ('pseudepigrapha', 'adam-eve', 32, 1, 'canon', 'psalms', 51, 4, 'free', E'Psalm 51:4 — *Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest.* Eve says it first — I have sinned against Thee — the sin reckoned ultimately against Elohim himself.'),
  ('pseudepigrapha', 'adam-eve', 32, 1, 'canon', 'luke', 15, 18, 'free', E'Luke 15:18 — *I will arise and go to my father, and will say unto him, Father, I have sinned against heaven, and before thee.* The prodigal''s confession on the road home is the same threefold owning Eve makes — sinned against heaven, against the angels, before Elohim.'),
  ('pseudepigrapha', 'adam-eve', 32, 1, 'canon', 'luke', 15, 21, 'free', E'Luke 15:21 — *And the son said unto him, Father, I have sinned against heaven, and in thy sight, and am no more worthy to be called thy son.* The repeated I have sinned of the returning son echoes Eve''s repeated I have sinned, I have sinned, I have sinned against Thee.'),
  ('pseudepigrapha', 'adam-eve', 32, 1, 'canon', 'daniel', 9, 5, 'free', E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments.* Daniel confesses for the whole people what Eve confesses for the whole creation — all sin begun through her doing.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-32-i-have-sinned-against-thee',
       E'I have sinned, O Elohim, I have sinned against Thee',
       E'Eve falls on the ground and pours out the oldest confession of the race: *I have sinned, O Elohim (God), I have sinned, O Elohim (God) of All, I have sinned against Thee... I have sinned before Thee and all sin hath begun through my doing in the creation* (Adam & Eve 32:1). This is no new penitence — it is the very grammar David prays: *Have mercy upon me, O Elohim (God), according to thy lovingkindness... For I acknowledge my transgressions: and my sin is ever before me. Against thee, thee only, have I sinned* (Psalm 51:1,3,4). It is Daniel''s confession for the whole people: *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled* (Daniel 9:5). And it is the prodigal''s road home, the same threefold owning of guilt against heaven and before the Father: *Father, I have sinned against heaven, and before thee* (Luke 15:18). The first mother''s cry and the returning son''s cry are one cry. It ain''t new — the way back has always been to acknowledge the transgression and turn.',
       sv.verse_id, ev.verse_id, 'extras', 92275
  FROM _session415_adam32_lookup sv, _session415_adam32_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-32-i-have-sinned-against-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 51:1 — *Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions.* Eve''s prostrate plea for pardon is David''s penitential opening — mercy sought from the offended Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam32_lookup sv, _session415_adam32_lookup tv
 WHERE t.slug='adam-eve-32-i-have-sinned-against-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 51:4 — *Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest.* Eve says it first — I have sinned against Thee — the sin reckoned ultimately against Elohim himself.'
  FROM cross_reference_threads t, cross_references x, _session415_adam32_lookup sv, _session415_adam32_lookup tv
 WHERE t.slug='adam-eve-32-i-have-sinned-against-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 15:18 — *I will arise and go to my father, and will say unto him, Father, I have sinned against heaven, and before thee.* The prodigal''s confession on the road home is the same threefold owning Eve makes — sinned against heaven, against the angels, before Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam32_lookup sv, _session415_adam32_lookup tv
 WHERE t.slug='adam-eve-32-i-have-sinned-against-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 15:21 — *And the son said unto him, Father, I have sinned against heaven, and in thy sight, and am no more worthy to be called thy son.* The repeated I have sinned of the returning son echoes Eve''s repeated I have sinned, I have sinned, I have sinned against Thee.'
  FROM cross_reference_threads t, cross_references x, _session415_adam32_lookup sv, _session415_adam32_lookup tv
 WHERE t.slug='adam-eve-32-i-have-sinned-against-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments.* Daniel confesses for the whole people what Eve confesses for the whole creation — all sin begun through her doing.'
  FROM cross_reference_threads t, cross_references x, _session415_adam32_lookup sv, _session415_adam32_lookup tv
 WHERE t.slug='adam-eve-32-i-have-sinned-against-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_33.sql (session415 adam-eve 33) -----
-- Source anchor: pseudepigrapha/adam-eve ch33. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam33 (view _session415_adam33_lookup). Sort band base 92300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-33-chariot-of-light-four-eagles
  ('pseudepigrapha', 'adam-eve', 33, 2, 'canon', 'ezekiel', 1, 4, 'free', E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The chariot of light no man can tell the glory of is Ezekiel''s fiery throne-vision.'),
  ('pseudepigrapha', 'adam-eve', 33, 2, 'canon', 'ezekiel', 1, 10, 'free', E'Ezekiel 1:10 — *As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* The four bright eagles bearing the chariot draw straight from the four living creatures whose fourth face is the eagle.'),
  ('pseudepigrapha', 'adam-eve', 33, 2, 'canon', 'psalms', 18, 10, 'free', E'Psalm 18:10 — *And he rode upon a cherub, and did fly: yea, he did fly upon the wings of the wind.* David''s cherub-borne descent of Elohim is the same throne-chariot Eve beholds halting over Adam.'),
  ('pseudepigrapha', 'adam-eve', 33, 2, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* The chariot that bears Elijah whole into heaven is the same heavenly vehicle that comes for Adam''s soul.'),
  ('pseudepigrapha', 'adam-eve', 33, 5, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The angels'' censers and frankincense veiling the firmaments over Adam are John''s incense-and-prayers rising before the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-33-chariot-of-light-four-eagles',
       E'A chariot of light borne by four bright eagles',
       E'Eve gazes into the opened heaven and sees the Merkabah descend: *she gazed steadfastly into heaven, and beheld a chariot of light, borne by four bright eagles... angels going before the chariot* (Adam & Eve 33:2-3), and the Seraphim halt where Adam lies. The haggadah is reaching for Ezekiel''s throne-chariot: *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it* (Ezekiel 1:4), borne by *four living creatures* whose faces include *the face of an eagle* (Ezekiel 1:5,10). It is the chariot David sings of: *And he rode upon a cherub, and did fly: yea, he did fly upon the wings of the wind* (Psalm 18:10), and the very vehicle that carried Elijah whole into the heavens: *there appeared a chariot of fire, and horses of fire... and Elijah went up by a whirlwind into heaven* (2 Kings 2:11). The four bright eagles are no innovation. It ain''t new — the throne-chariot of the prophets comes down for the first man''s soul.',
       sv.verse_id, ev.verse_id, 'extras', 92300
  FROM _session415_adam33_lookup sv, _session415_adam33_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=33 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=33 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-33-chariot-of-light-four-eagles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The chariot of light no man can tell the glory of is Ezekiel''s fiery throne-vision.'
  FROM cross_reference_threads t, cross_references x, _session415_adam33_lookup sv, _session415_adam33_lookup tv
 WHERE t.slug='adam-eve-33-chariot-of-light-four-eagles'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:10 — *As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* The four bright eagles bearing the chariot draw straight from the four living creatures whose fourth face is the eagle.'
  FROM cross_reference_threads t, cross_references x, _session415_adam33_lookup sv, _session415_adam33_lookup tv
 WHERE t.slug='adam-eve-33-chariot-of-light-four-eagles'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 18:10 — *And he rode upon a cherub, and did fly: yea, he did fly upon the wings of the wind.* David''s cherub-borne descent of Elohim is the same throne-chariot Eve beholds halting over Adam.'
  FROM cross_reference_threads t, cross_references x, _session415_adam33_lookup sv, _session415_adam33_lookup tv
 WHERE t.slug='adam-eve-33-chariot-of-light-four-eagles'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 2:11 — *there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* The chariot that bears Elijah whole into heaven is the same heavenly vehicle that comes for Adam''s soul.'
  FROM cross_reference_threads t, cross_references x, _session415_adam33_lookup sv, _session415_adam33_lookup tv
 WHERE t.slug='adam-eve-33-chariot-of-light-four-eagles'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The angels'' censers and frankincense veiling the firmaments over Adam are John''s incense-and-prayers rising before the throne.'
  FROM cross_reference_threads t, cross_references x, _session415_adam33_lookup sv, _session415_adam33_lookup tv
 WHERE t.slug='adam-eve-33-chariot-of-light-four-eagles'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=33 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_36.sql (session415 adam-eve 36) -----
-- Source anchor: pseudepigrapha/adam-eve ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam36 (view _session415_adam36_lookup). Sort band base 92375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-36-sun-and-moon-cannot-shine
  ('pseudepigrapha', 'adam-eve', 36, 3, 'canon', 'job', 25, 5, 'free', E'Job 25:5 — *Behold even to the moon, and it shineth not; yea, the stars are not pure in his sight.* The luminaries that cannot shine before the Light of the Universe are Job''s moon and stars dimmed in their Maker''s presence.'),
  ('pseudepigrapha', 'adam-eve', 36, 2, 'canon', 'joel', 2, 10, 'free', E'Joel 2:10 — *The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining.* The black appearance of sun and moon over Adam is Joel''s darkening of the lights when Yahuah''s day draws near.'),
  ('pseudepigrapha', 'adam-eve', 36, 2, 'canon', 'revelation', 6, 12, 'free', E'Revelation 6:12 — *And I beheld when he had opened the sixth seal, and, lo, there was a great earthquake; and the sun became black as sackcloth of hair, and the moon became as blood.* The hidden light of the luminaries is John''s sun-black-as-sackcloth and blood-red moon at the great judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-36-sun-and-moon-cannot-shine',
       E'The sun and moon blackened before the Light of the Universe',
       E'Eve sees the two luminaries fallen down in prayer and gone dark, and Seth explains why: *they are the sun and moon and themselves fall down and pray on behalf of my father Adam* (Adam & Eve 36:1), yet *they cannot shine before the Light of the Universe, the Father of Light; and on this account their light hath been hidden from them* (Adam & Eve 36:3). Job already knew the moon and stars are nothing in their Maker''s presence: *Behold even to the moon, and it shineth not; yea, the stars are not pure in his sight* (Job 25:5). The prophets paint the same blackening when Yahuah draws near: *the sun and the moon shall be dark, and the stars shall withdraw their shining* (Joel 2:10), and John sees it at the sixth seal: *the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12). The greater light eclipses the lesser — no innovation. It ain''t new — before the Father of Light even the sun cannot shine.',
       sv.verse_id, ev.verse_id, 'extras', 92375
  FROM _session415_adam36_lookup sv, _session415_adam36_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=36 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-36-sun-and-moon-cannot-shine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 25:5 — *Behold even to the moon, and it shineth not; yea, the stars are not pure in his sight.* The luminaries that cannot shine before the Light of the Universe are Job''s moon and stars dimmed in their Maker''s presence.'
  FROM cross_reference_threads t, cross_references x, _session415_adam36_lookup sv, _session415_adam36_lookup tv
 WHERE t.slug='adam-eve-36-sun-and-moon-cannot-shine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=25 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:10 — *The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining.* The black appearance of sun and moon over Adam is Joel''s darkening of the lights when Yahuah''s day draws near.'
  FROM cross_reference_threads t, cross_references x, _session415_adam36_lookup sv, _session415_adam36_lookup tv
 WHERE t.slug='adam-eve-36-sun-and-moon-cannot-shine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:12 — *And I beheld when he had opened the sixth seal, and, lo, there was a great earthquake; and the sun became black as sackcloth of hair, and the moon became as blood.* The hidden light of the luminaries is John''s sun-black-as-sackcloth and blood-red moon at the great judgment.'
  FROM cross_reference_threads t, cross_references x, _session415_adam36_lookup sv, _session415_adam36_lookup tv
 WHERE t.slug='adam-eve-36-sun-and-moon-cannot-shine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_37.sql (session415 adam-eve 37) -----
-- Source anchor: pseudepigrapha/adam-eve ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam37 (view _session415_adam37_lookup). Sort band base 92400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-37-angels-pray-for-adams-soul
  ('pseudepigrapha', 'adam-eve', 37, 1, 'canon', 'revelation', 8, 2, 'free', E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* The angel''s trumpet over Adam and the standing host are John''s seven trumpet-bearing angels before the throne.'),
  ('pseudepigrapha', 'adam-eve', 37, 1, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The angels crying aloud on their faces for Adam mirror the censer-and-prayers offered at the heavenly altar.'),
  ('pseudepigrapha', 'adam-eve', 37, 2, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The angels'' plea — He hath pitied Adam — anticipates the ever-living intercession that saves to the uttermost those who come to Elohim.'),
  -- thread: adam-eve-37-bear-him-to-paradise-third-heaven
  ('pseudepigrapha', 'adam-eve', 37, 4, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago... such an one caught up to the third heaven.* Adam borne unto Paradise in the third heaven is the same third heaven Paul was caught up to.'),
  ('pseudepigrapha', 'adam-eve', 37, 4, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The Paradise to which Michael lifts Adam is the very Paradise Paul names as the third-heaven place of unspeakable words.'),
  ('pseudepigrapha', 'adam-eve', 37, 4, 'canon', 'daniel', 12, 13, 'free', E'Daniel 12:13 — *But go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days.* Adam left in Paradise until that fearful day of reckoning is Daniel''s righteous one kept at rest to stand in his lot at the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-37-angels-pray-for-adams-soul',
       E'The trumpet, and all the angels pray for Adam''s soul',
       E'An angel sounds the trumpet and the whole host falls on its face to intercede: *an angel blew the trumpet, and there stood up all the angels (and they were) lying on their faces, and they cried aloud... Blessed (be) the glory of Yahuah (Lord)... for He hath pitied Adam the creature of His hands* (Adam & Eve 37:1-2). The heavenly intercession is the apostolic pattern: *And to them were given seven trumpets* (Revelation 8:2), and another angel offers *much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3) — the same trumpet, censer and intercession the angels make for Adam. And the One who never fails to plead lives forever to do it: *he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). The trumpet and the prayers rising are no late invention. It ain''t new — heaven has interceded for the first man from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 92400
  FROM _session415_adam37_lookup sv, _session415_adam37_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=37 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-37-bear-him-to-paradise-third-heaven',
       E'Bear Adam to Paradise, unto the third Heaven',
       E'A seraph washes Adam thrice in the Acherusian lake, and the Father commits him to Michael: *Lift him up into Paradise unto the third Heaven, and leave him there until that fearful day of my reckoning, which I will make in the world* (Adam & Eve 37:4). The third-heaven Paradise is the very place Paul was caught up to: *such an one caught up to the third heaven* (2 Corinthians 12:2), *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). And the soul kept there until the day of reckoning is the prophets'' settled hope — the righteous laid up against the end: *go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days* (Daniel 12:13). The keeping is provisional, the reckoning sure. It ain''t new — Paradise in the third heaven holds the righteous till the day of His reckoning.',
       sv.verse_id, ev.verse_id, 'extras', 92403
  FROM _session415_adam37_lookup sv, _session415_adam37_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=37 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-37-angels-pray-for-adams-soul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* The angel''s trumpet over Adam and the standing host are John''s seven trumpet-bearing angels before the throne.'
  FROM cross_reference_threads t, cross_references x, _session415_adam37_lookup sv, _session415_adam37_lookup tv
 WHERE t.slug='adam-eve-37-angels-pray-for-adams-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The angels crying aloud on their faces for Adam mirror the censer-and-prayers offered at the heavenly altar.'
  FROM cross_reference_threads t, cross_references x, _session415_adam37_lookup sv, _session415_adam37_lookup tv
 WHERE t.slug='adam-eve-37-angels-pray-for-adams-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The angels'' plea — He hath pitied Adam — anticipates the ever-living intercession that saves to the uttermost those who come to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam37_lookup sv, _session415_adam37_lookup tv
 WHERE t.slug='adam-eve-37-angels-pray-for-adams-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: adam-eve-37-bear-him-to-paradise-third-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago... such an one caught up to the third heaven.* Adam borne unto Paradise in the third heaven is the same third heaven Paul was caught up to.'
  FROM cross_reference_threads t, cross_references x, _session415_adam37_lookup sv, _session415_adam37_lookup tv
 WHERE t.slug='adam-eve-37-bear-him-to-paradise-third-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The Paradise to which Michael lifts Adam is the very Paradise Paul names as the third-heaven place of unspeakable words.'
  FROM cross_reference_threads t, cross_references x, _session415_adam37_lookup sv, _session415_adam37_lookup tv
 WHERE t.slug='adam-eve-37-bear-him-to-paradise-third-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:13 — *But go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days.* Adam left in Paradise until that fearful day of reckoning is Daniel''s righteous one kept at rest to stand in his lot at the end.'
  FROM cross_reference_threads t, cross_references x, _session415_adam37_lookup sv, _session415_adam37_lookup tv
 WHERE t.slug='adam-eve-37-bear-him-to-paradise-third-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_39.sql (session415 adam-eve 39) -----
-- Source anchor: pseudepigrapha/adam-eve ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam39 (view _session415_adam39_lookup). Sort band base 92450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-39-throne-of-thy-deceiver
  ('pseudepigrapha', 'adam-eve', 39, 2, 'canon', 'revelation', 3, 21, 'free', E'Revelation 3:21 — *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne.* Adam set on the throne of his deceiver is the overcomer''s throne the Messiah grants to all who conquer.'),
  ('pseudepigrapha', 'adam-eve', 39, 3, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The deceiver cast into this place to see Adam sitting above him is the Adversary the Son beheld fall as lightning.'),
  ('pseudepigrapha', 'adam-eve', 39, 2, 'canon', 'romans', 5, 17, 'free', E'Romans 5:17 — *For if by one man''s offence death reigned by one; much more they which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ).* Adam''s grief turned to joy and his glory restored is Paul''s reign-in-life reversing the one man''s offence.'),
  ('pseudepigrapha', 'adam-eve', 39, 2, 'canon', '1-corinthians', 15, 49, 'free', E'1 Corinthians 15:49 — *And as we have borne the image of the earthy, we shall also bear the image of the heavenly.* Adam transformed to his former glory is the earthy man at last bearing the image of the heavenly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-39-throne-of-thy-deceiver',
       E'I will set thee on the throne of thy deceiver',
       E'Elohim promises the fallen man not only forgiveness but the very seat of the one who toppled him: *I will transform thee to thy former glory and set thee on the throne of thy deceiver. But he shall be cast into this place to see thee sitting above him, then he shall be condemned* (Adam & Eve 39:2-3). This is the Messiah''s promise to the overcomer made first to Adam: *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* (Revelation 3:21). The deceiver cast down to behold it is the Adversary the Son saw fall: *I beheld Satan as lightning fall from heaven* (Luke 10:18). The grief turned to joy, the reign restored, is Paul''s gospel — the second Adam undoing the first man''s ruin: *much more they which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ)* (Romans 5:17), and the dust-formed man bearing the heavenly image at last: *And as we have borne the image of the earthy, we shall also bear the image of the heavenly* (1 Corinthians 15:49). It ain''t new — the man fashioned of dust is restored to glory and seated above his deceiver.',
       sv.verse_id, ev.verse_id, 'extras', 92450
  FROM _session415_adam39_lookup sv, _session415_adam39_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=39 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=39 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-39-throne-of-thy-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 3:21 — *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne.* Adam set on the throne of his deceiver is the overcomer''s throne the Messiah grants to all who conquer.'
  FROM cross_reference_threads t, cross_references x, _session415_adam39_lookup sv, _session415_adam39_lookup tv
 WHERE t.slug='adam-eve-39-throne-of-thy-deceiver'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=39 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The deceiver cast into this place to see Adam sitting above him is the Adversary the Son beheld fall as lightning.'
  FROM cross_reference_threads t, cross_references x, _session415_adam39_lookup sv, _session415_adam39_lookup tv
 WHERE t.slug='adam-eve-39-throne-of-thy-deceiver'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:17 — *For if by one man''s offence death reigned by one; much more they which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ).* Adam''s grief turned to joy and his glory restored is Paul''s reign-in-life reversing the one man''s offence.'
  FROM cross_reference_threads t, cross_references x, _session415_adam39_lookup sv, _session415_adam39_lookup tv
 WHERE t.slug='adam-eve-39-throne-of-thy-deceiver'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=39 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:49 — *And as we have borne the image of the earthy, we shall also bear the image of the heavenly.* Adam transformed to his former glory is the earthy man at last bearing the image of the heavenly.'
  FROM cross_reference_threads t, cross_references x, _session415_adam39_lookup sv, _session415_adam39_lookup tv
 WHERE t.slug='adam-eve-39-throne-of-thy-deceiver'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=39 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_40.sql (session415 adam-eve 40) -----
-- Source anchor: pseudepigrapha/adam-eve ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam40 (view _session415_adam40_lookup). Sort band base 92475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-40-michael-gabriel-uriel-raphael
  ('pseudepigrapha', 'adam-eve', 40, 1, 'enoch', '1-enoch', 20, 5, 'free', E'1 Enoch 20:5 — *Michael, one of the holy and honoured angels, who is set over the best part of mankind and over chaos.* Michael, named first to bury Adam, is the chief of the holy angels in the Watcher-tradition''s own roster.'),
  ('pseudepigrapha', 'adam-eve', 40, 1, 'enoch', '1-enoch', 20, 7, 'free', E'1 Enoch 20:7 — *Gabriel, one of the holy angels, who is over Paradise and the serpents and the Cherubim.* Gabriel, sent to the third-heaven Paradise to prepare Adam, is the angel set over Paradise in Enoch''s list.'),
  ('pseudepigrapha', 'adam-eve', 40, 1, 'enoch', '1-enoch', 20, 2, 'free', E'1 Enoch 20:2 — *Uriel, one of the holy angels, who is over the world and over Tartarus.* Uriel, third of the four sent for the burial, stands in the same roster of named holy angels.'),
  ('pseudepigrapha', 'adam-eve', 40, 1, 'enoch', '1-enoch', 20, 3, 'free', E'1 Enoch 20:3 — *Raphael, one of the holy angels, who is over the spirits of men.* Raphael, fourth of the archangels named to bury Adam, is set over the spirits of men in Enoch''s catalogue.'),
  ('pseudepigrapha', 'adam-eve', 40, 6, 'canon', 'revelation', 8, 2, 'free', E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* The seven angels Elohim sends to Paradise with fragrant spices are the seven who stand before the throne.'),
  ('pseudepigrapha', 'adam-eve', 40, 2, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The Paradise in the third heaven where Adam is laid is the very Paradise Paul names as caught-up-into.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-40-michael-gabriel-uriel-raphael',
       E'Michael, Gabriel, Uriel and Raphael strew the linen clothes',
       E'Elohim sends the four named archangels to bury the first man in the third-heaven Paradise: *Then Elohim (God) spake to the archangel(s) Michael, (Gabriel, Uriel, and Raphael): ''Go away to Paradise in the third heaven, and strew linen clothes and cover the body of Adam and bring oil of the ''oil of fragrance'' and pour it over him* (Adam & Eve 40:1-2), and *Elohim (God) sent seven angels to paradise* who brought fragrant spices for the burial (Adam & Eve 40:6). The roster of named holy ones is the same the Watcher-tradition records — the haggadah reaches for the angelology already set down in Enoch: *Uriel, one of the holy angels, who is over the world... Raphael, one of the holy angels, who is over the spirits of men... Michael, one of the holy and honoured angels... Gabriel, one of the holy angels, who is over Paradise* (1 Enoch 20:2,3,5,7). The seven angels sent to Paradise are the seven who stand before the throne: *And I saw the seven angels which stood before Elohim (God)* (Revelation 8:2), and the Paradise itself is the third-heaven place Paul names: *How that he was caught up into paradise* (2 Corinthians 12:4). It ain''t new — the named archangels and the seven who stand before Elohim are already in Moses'' heirs and the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 92475
  FROM _session415_adam40_lookup sv, _session415_adam40_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=40 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-40-michael-gabriel-uriel-raphael
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 20:5 — *Michael, one of the holy and honoured angels, who is set over the best part of mankind and over chaos.* Michael, named first to bury Adam, is the chief of the holy angels in the Watcher-tradition''s own roster.'
  FROM cross_reference_threads t, cross_references x, _session415_adam40_lookup sv, _session415_adam40_lookup tv
 WHERE t.slug='adam-eve-40-michael-gabriel-uriel-raphael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 20:7 — *Gabriel, one of the holy angels, who is over Paradise and the serpents and the Cherubim.* Gabriel, sent to the third-heaven Paradise to prepare Adam, is the angel set over Paradise in Enoch''s list.'
  FROM cross_reference_threads t, cross_references x, _session415_adam40_lookup sv, _session415_adam40_lookup tv
 WHERE t.slug='adam-eve-40-michael-gabriel-uriel-raphael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 20:2 — *Uriel, one of the holy angels, who is over the world and over Tartarus.* Uriel, third of the four sent for the burial, stands in the same roster of named holy angels.'
  FROM cross_reference_threads t, cross_references x, _session415_adam40_lookup sv, _session415_adam40_lookup tv
 WHERE t.slug='adam-eve-40-michael-gabriel-uriel-raphael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 20:3 — *Raphael, one of the holy angels, who is over the spirits of men.* Raphael, fourth of the archangels named to bury Adam, is set over the spirits of men in Enoch''s catalogue.'
  FROM cross_reference_threads t, cross_references x, _session415_adam40_lookup sv, _session415_adam40_lookup tv
 WHERE t.slug='adam-eve-40-michael-gabriel-uriel-raphael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* The seven angels Elohim sends to Paradise with fragrant spices are the seven who stand before the throne.'
  FROM cross_reference_threads t, cross_references x, _session415_adam40_lookup sv, _session415_adam40_lookup tv
 WHERE t.slug='adam-eve-40-michael-gabriel-uriel-raphael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=40 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The Paradise in the third heaven where Adam is laid is the very Paradise Paul names as caught-up-into.'
  FROM cross_reference_threads t, cross_references x, _session415_adam40_lookup sv, _session415_adam40_lookup tv
 WHERE t.slug='adam-eve-40-michael-gabriel-uriel-raphael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_41.sql (session415 adam-eve 41) -----
-- Source anchor: pseudepigrapha/adam-eve ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam41 (view _session415_adam41_lookup). Sort band base 92500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-41-i-will-raise-thee-up-with-thy-seed
  ('pseudepigrapha', 'adam-eve', 41, 2, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Elohim''s promise to raise Adam from the dust is Daniel''s awakening of those who sleep in the dust of the earth.'),
  ('pseudepigrapha', 'adam-eve', 41, 2, 'canon', 'ezekiel', 37, 12, 'free', E'Ezekiel 37:12 — *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* I will raise thee up with every man of thy seed is Ezekiel''s opening of the graves of the whole people.'),
  ('pseudepigrapha', 'adam-eve', 41, 2, 'canon', '1-corinthians', 15, 21, 'free', E'1 Corinthians 15:21 — *For since by man came death, by man came also the resurrection of the dead.* The Resurrection promised to Adam and his seed is Paul''s resurrection coming by man, undoing the death that came by man.'),
  ('pseudepigrapha', 'adam-eve', 41, 2, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* Raising Adam with every man of his seed is Paul''s all-in-Adam-die, all-in-Messiah-made-alive — the same root and the same harvest.'),
  ('pseudepigrapha', 'adam-eve', 41, 2, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice.* Adam answering from the earth at Elohim''s call foreshadows the hour when all in the graves hear the Son''s voice and come forth.'),
  ('pseudepigrapha', 'adam-eve', 41, 2, 'canon', 'job', 19, 25, 'free', E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth.* The promise of resurrection to Adam is Job''s confidence in a living Redeemer who stands at the latter day.'),
  ('pseudepigrapha', 'adam-eve', 41, 2, 'canon', 'job', 19, 26, 'free', E'Job 19:26 — *And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God).* Raising Adam''s very body from the earth is Job''s hope of seeing Elohim in his own flesh after the body''s decay.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-41-i-will-raise-thee-up-with-thy-seed',
       E'Again I promise to thee the Resurrection',
       E'Over the buried dust Elohim calls the first man''s name and binds the sentence of dust to a promise of rising: *I told thee (that) earth thou art and to earth shalt thou return. Again I promise to thee the Resurrection; I will raise thee up in the Resurrection with every man who is of thy seed* (Adam & Eve 41:1-2). This is the beating heart of the book, and it is no new hope. Daniel saw it: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2). Ezekiel saw the graves themselves opened: *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12). Job clung to it in his own flesh: *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth... yet in my flesh shall I see Elohim (God)* (Job 19:25,26). Paul names Adam by name as the root of the whole resurrection: *For since by man came death, by man came also the resurrection of the dead. For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:21-22). And the Son will speak it from the throne to every man of Adam''s seed: *the hour is coming, in the which all that are in the graves shall hear his voice, And shall come forth* (John 5:28-29). It ain''t new — the resurrection of Adam''s body, and with him all his seed, was promised at the first grave.',
       sv.verse_id, ev.verse_id, 'extras', 92500
  FROM _session415_adam41_lookup sv, _session415_adam41_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=41 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-41-i-will-raise-thee-up-with-thy-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Elohim''s promise to raise Adam from the dust is Daniel''s awakening of those who sleep in the dust of the earth.'
  FROM cross_reference_threads t, cross_references x, _session415_adam41_lookup sv, _session415_adam41_lookup tv
 WHERE t.slug='adam-eve-41-i-will-raise-thee-up-with-thy-seed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:12 — *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* I will raise thee up with every man of thy seed is Ezekiel''s opening of the graves of the whole people.'
  FROM cross_reference_threads t, cross_references x, _session415_adam41_lookup sv, _session415_adam41_lookup tv
 WHERE t.slug='adam-eve-41-i-will-raise-thee-up-with-thy-seed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:21 — *For since by man came death, by man came also the resurrection of the dead.* The Resurrection promised to Adam and his seed is Paul''s resurrection coming by man, undoing the death that came by man.'
  FROM cross_reference_threads t, cross_references x, _session415_adam41_lookup sv, _session415_adam41_lookup tv
 WHERE t.slug='adam-eve-41-i-will-raise-thee-up-with-thy-seed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* Raising Adam with every man of his seed is Paul''s all-in-Adam-die, all-in-Messiah-made-alive — the same root and the same harvest.'
  FROM cross_reference_threads t, cross_references x, _session415_adam41_lookup sv, _session415_adam41_lookup tv
 WHERE t.slug='adam-eve-41-i-will-raise-thee-up-with-thy-seed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice.* Adam answering from the earth at Elohim''s call foreshadows the hour when all in the graves hear the Son''s voice and come forth.'
  FROM cross_reference_threads t, cross_references x, _session415_adam41_lookup sv, _session415_adam41_lookup tv
 WHERE t.slug='adam-eve-41-i-will-raise-thee-up-with-thy-seed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth.* The promise of resurrection to Adam is Job''s confidence in a living Redeemer who stands at the latter day.'
  FROM cross_reference_threads t, cross_references x, _session415_adam41_lookup sv, _session415_adam41_lookup tv
 WHERE t.slug='adam-eve-41-i-will-raise-thee-up-with-thy-seed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Job 19:26 — *And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God).* Raising Adam''s very body from the earth is Job''s hope of seeing Elohim in his own flesh after the body''s decay.'
  FROM cross_reference_threads t, cross_references x, _session415_adam41_lookup sv, _session415_adam41_lookup tv
 WHERE t.slug='adam-eve-41-i-will-raise-thee-up-with-thy-seed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_42.sql (session415 adam-eve 42) -----
-- Source anchor: pseudepigrapha/adam-eve ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam42 (view _session415_adam42_lookup). Sort band base 92525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-42-from-his-members-didst-thou-make-me
  ('pseudepigrapha', 'adam-eve', 42, 5, 'canon', 'genesis', 2, 22, 'free', E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* From his members didst thou make me is Eve naming her own forming from Adam''s rib.'),
  ('pseudepigrapha', 'adam-eve', 42, 5, 'canon', 'genesis', 2, 23, 'free', E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Eve''s plea not to be estranged from Adam''s body rests on being bone of his bones, taken out of the man.'),
  ('pseudepigrapha', 'adam-eve', 42, 6, 'canon', 'genesis', 2, 24, 'free', E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* Without separation from each other, both in paradise, is the one-flesh cleaving of the first marriage.'),
  ('pseudepigrapha', 'adam-eve', 42, 6, 'canon', 'ephesians', 5, 31, 'free', E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* Eve''s do-not-separate-us is Paul''s one-flesh union carried from Genesis.'),
  -- thread: adam-eve-42-receive-my-spirit
  ('pseudepigrapha', 'adam-eve', 42, 8, 'canon', 'psalms', 31, 5, 'free', E'Psalm 31:5 — *Into thine hand I commit my spirit: thou hast redeemed me, O Yahuah Elohim (LORD God) of truth.* Eve''s receive my spirit is David''s committing of the spirit into Elohim''s hand.'),
  ('pseudepigrapha', 'adam-eve', 42, 8, 'canon', 'acts', 7, 59, 'free', E'Acts 7:59 — *And they stoned Stephen, calling upon Elohim (God), and saying, Lord Yahusha (Lord Jesus), receive my spirit.* Eve''s dying cry — receive my spirit — is the very prayer Stephen breathes as he is martyred.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-42-from-his-members-didst-thou-make-me',
       E'From his members didst thou make me — do not separate us',
       E'Eve prays to be buried beside Adam, pleading the bond of her very making: *estrange not me thy handmaid from the body of Adam, for from his members didst thou make me* (Adam & Eve 42:5), that she might lie *with him in paradise, both without separation from each other... Even so, Yahuah (Lord), do not separate us now* (Adam & Eve 42:6-7). She reaches back to her forming from Adam''s rib: *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman* (Genesis 2:22), *bone of my bones, and flesh of my flesh* (Genesis 2:23), the one-flesh joining that the Messiah and the apostle both seal: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24), *and they two shall be one flesh* (Ephesians 5:31). It ain''t new — woman taken from the man''s side is one flesh with him from the first, not to be separated even in death.',
       sv.verse_id, ev.verse_id, 'extras', 92525
  FROM _session415_adam42_lookup sv, _session415_adam42_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=42 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-42-receive-my-spirit',
       E'Elohim of All, receive my spirit',
       E'Her prayer finished, Eve renders her soul to its Maker: *she gazed heavenwards and groaned aloud and smote her breast and said: ''Elohim (God) of All, receive my spirit,'' and straightway she delivered up her spirit to Elohim (God)* (Adam & Eve 42:8). This is the dying surrender David sings — the spirit handed back to the One who gave it: *Into thine hand I commit my spirit: thou hast redeemed me, O Yahuah Elohim (LORD God) of truth* (Psalm 31:5). It is the very prayer Stephen breathes as he falls asleep: *Lord Yahusha (Lord Jesus), receive my spirit* (Acts 7:59). The first mother and the first martyr die the same way — committing the spirit to the One who can receive it. It ain''t new — the faithful have always given up the spirit into the hand that gave it.',
       sv.verse_id, ev.verse_id, 'extras', 92528
  FROM _session415_adam42_lookup sv, _session415_adam42_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=42 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-42-from-his-members-didst-thou-make-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* From his members didst thou make me is Eve naming her own forming from Adam''s rib.'
  FROM cross_reference_threads t, cross_references x, _session415_adam42_lookup sv, _session415_adam42_lookup tv
 WHERE t.slug='adam-eve-42-from-his-members-didst-thou-make-me'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Eve''s plea not to be estranged from Adam''s body rests on being bone of his bones, taken out of the man.'
  FROM cross_reference_threads t, cross_references x, _session415_adam42_lookup sv, _session415_adam42_lookup tv
 WHERE t.slug='adam-eve-42-from-his-members-didst-thou-make-me'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* Without separation from each other, both in paradise, is the one-flesh cleaving of the first marriage.'
  FROM cross_reference_threads t, cross_references x, _session415_adam42_lookup sv, _session415_adam42_lookup tv
 WHERE t.slug='adam-eve-42-from-his-members-didst-thou-make-me'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* Eve''s do-not-separate-us is Paul''s one-flesh union carried from Genesis.'
  FROM cross_reference_threads t, cross_references x, _session415_adam42_lookup sv, _session415_adam42_lookup tv
 WHERE t.slug='adam-eve-42-from-his-members-didst-thou-make-me'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: adam-eve-42-receive-my-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 31:5 — *Into thine hand I commit my spirit: thou hast redeemed me, O Yahuah Elohim (LORD God) of truth.* Eve''s receive my spirit is David''s committing of the spirit into Elohim''s hand.'
  FROM cross_reference_threads t, cross_references x, _session415_adam42_lookup sv, _session415_adam42_lookup tv
 WHERE t.slug='adam-eve-42-receive-my-spirit'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:59 — *And they stoned Stephen, calling upon Elohim (God), and saying, Lord Yahusha (Lord Jesus), receive my spirit.* Eve''s dying cry — receive my spirit — is the very prayer Stephen breathes as he is martyred.'
  FROM cross_reference_threads t, cross_references x, _session415_adam42_lookup sv, _session415_adam42_lookup tv
 WHERE t.slug='adam-eve-42-receive-my-spirit'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=42 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=59
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_43.sql (session415 adam-eve 43) -----
-- Source anchor: pseudepigrapha/adam-eve ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam43 (view _session415_adam43_lookup). Sort band base 92550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-43-lay-out-every-man-till-the-resurrection
  ('pseudepigrapha', 'adam-eve', 43, 2, 'canon', '1-thessalonians', 4, 13, 'free', E'1 Thessalonians 4:13 — *But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope.* Mourn not beyond six days is Paul''s bounded grief — sorrow not as those without hope, because the dead are laid out only till the Resurrection.'),
  ('pseudepigrapha', 'adam-eve', 43, 2, 'canon', '1-thessalonians', 4, 14, 'free', E'1 Thessalonians 4:14 — *For if we believe that Yahusha (Jesus) died and rose again, even so them also which sleep in Yahusha (Jesus) will Elohim (God) bring with him.* Laying out every man till the day of the Resurrection rests on the same certainty — those who sleep will be raised.'),
  ('pseudepigrapha', 'adam-eve', 43, 3, 'canon', 'genesis', 2, 2, 'free', E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* On the seventh day rest and rejoice is the first Sabbath rest, the day on which Elohim himself rested.'),
  ('pseudepigrapha', 'adam-eve', 43, 3, 'canon', 'genesis', 2, 3, 'free', E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* The seventh day of rest and rejoicing the angels keep with the righteous soul is the day Elohim blessed and sanctified at the creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-43-lay-out-every-man-till-the-resurrection',
       E'Lay out every man that dieth till the day of the Resurrection',
       E'Michael gives Seth the burial rule and the measure of mourning, and grounds it all in hope: *Lay out in this wise every man that dieth till the day of the Resurrection. And after giving him this rule; he saith to him: ''Mourn not beyond six days, but on the seventh day, rest and rejoice on it, because on that very day, Elohim (God) rejoiceth (yea) and we angels (too) with the righteous soul, who hath passed away from the earth* (Adam & Eve 43:2-3). The seventh-day rest and rejoicing reach back to the first rest: *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day* (Genesis 2:2). The grief bounded by hope is Paul''s charge over the sleeping dead: *that ye sorrow not, even as others which have no hope. For if we believe that Yahusha (Jesus) died and rose again, even so them also which sleep in Yahusha (Jesus) will Elohim (God) bring with him* (1 Thessalonians 4:13-14). The body is laid out only till the Resurrection — the mourning has a term because the rising is sure. It ain''t new — the dead are buried in hope, and the seventh day is for rest and rejoicing.',
       sv.verse_id, ev.verse_id, 'extras', 92550
  FROM _session415_adam43_lookup sv, _session415_adam43_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=43 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=43 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-43-lay-out-every-man-till-the-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Thessalonians 4:13 — *But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope.* Mourn not beyond six days is Paul''s bounded grief — sorrow not as those without hope, because the dead are laid out only till the Resurrection.'
  FROM cross_reference_threads t, cross_references x, _session415_adam43_lookup sv, _session415_adam43_lookup tv
 WHERE t.slug='adam-eve-43-lay-out-every-man-till-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 4:14 — *For if we believe that Yahusha (Jesus) died and rose again, even so them also which sleep in Yahusha (Jesus) will Elohim (God) bring with him.* Laying out every man till the day of the Resurrection rests on the same certainty — those who sleep will be raised.'
  FROM cross_reference_threads t, cross_references x, _session415_adam43_lookup sv, _session415_adam43_lookup tv
 WHERE t.slug='adam-eve-43-lay-out-every-man-till-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* On the seventh day rest and rejoice is the first Sabbath rest, the day on which Elohim himself rested.'
  FROM cross_reference_threads t, cross_references x, _session415_adam43_lookup sv, _session415_adam43_lookup tv
 WHERE t.slug='adam-eve-43-lay-out-every-man-till-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=43 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* The seventh day of rest and rejoicing the angels keep with the righteous soul is the day Elohim blessed and sanctified at the creation.'
  FROM cross_reference_threads t, cross_references x, _session415_adam43_lookup sv, _session415_adam43_lookup tv
 WHERE t.slug='adam-eve-43-lay-out-every-man-till-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=43 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_47.sql (session415 adam-eve 47) -----
-- Source anchor: pseudepigrapha/adam-eve ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam47 (view _session415_adam47_lookup). Sort band base 92650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-47-animals-food-not-angels-food
  ('pseudepigrapha', 'adam-eve', 47, 2, 'canon', 'genesis', 3, 18, 'free', E'Gen 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* — the herb of the field, not the fruit of Eden, is now their portion.'),
  ('pseudepigrapha', 'adam-eve', 47, 2, 'canon', 'genesis', 3, 19, 'free', E'Gen 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* — the angels'' food is exchanged for bread by sweat under sentence of death.'),
  ('pseudepigrapha', 'adam-eve', 47, 3, 'canon', 'genesis', 3, 17, 'free', E'Gen 3:17 — *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* — the ground itself was cursed, so they lament and repent before the One who made them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-47-animals-food-not-angels-food',
       E'Animals'' food, not angels'' food — the bread of sweat',
       E'Outside paradise Adam and Eve find no fruit of Eden, "but found only animals'' food. And Adam said to Eve: ''This hath Yahuah (Lord) provided for animals and brutes to eat; but we used to have angels'' food." The loss of paradise-fare is the very sentence of the garden: the man who once ate of every tree must now eat the herb of the field and bread won by sweat. It ain''t new — the curse on the ground that drove them to brute-food is already spoken in Moses.',
       sv.verse_id, ev.verse_id, 'extras', 92650
  FROM _session415_adam47_lookup sv, _session415_adam47_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=47 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=47 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-47-animals-food-not-angels-food
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Gen 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* — the herb of the field, not the fruit of Eden, is now their portion.'
  FROM cross_reference_threads t, cross_references x, _session415_adam47_lookup sv, _session415_adam47_lookup tv
 WHERE t.slug='adam-eve-47-animals-food-not-angels-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Gen 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* — the angels'' food is exchanged for bread by sweat under sentence of death.'
  FROM cross_reference_threads t, cross_references x, _session415_adam47_lookup sv, _session415_adam47_lookup tv
 WHERE t.slug='adam-eve-47-animals-food-not-angels-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Gen 3:17 — *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* — the ground itself was cursed, so they lament and repent before the One who made them.'
  FROM cross_reference_threads t, cross_references x, _session415_adam47_lookup sv, _session415_adam47_lookup tv
 WHERE t.slug='adam-eve-47-animals-food-not-angels-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=47 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_49.sql (session415 adam-eve 49) -----
-- Source anchor: pseudepigrapha/adam-eve ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam49 (view _session415_adam49_lookup). Sort band base 92700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-49-fast-in-the-river-unclean-lips
  ('pseudepigrapha', 'adam-eve', 49, 1, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* — the fast in the river is this same turning with the whole heart.'),
  ('pseudepigrapha', 'adam-eve', 49, 2, 'canon', 'joel', 2, 13, 'free', E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful... and repenteth him of the evil.* — "perchance Yahuah Elohim will take pity upon us" rests on the same mercy.'),
  ('pseudepigrapha', 'adam-eve', 49, 1, 'canon', 'isaiah', 6, 5, 'free', E'Isa 6:5 — *Woe is me! for I am undone; because I am a man of unclean lips... for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts).* — "our lips are unclean" is the same dread of speaking before the Holy One.'),
  ('pseudepigrapha', 'adam-eve', 49, 1, 'canon', 'psalms', 51, 17, 'free', E'Ps 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* — the silent neck-deep fast offers the one sacrifice Elohim will not despise.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-49-fast-in-the-river-unclean-lips',
       E'Penitence in the river — fasting and unclean lips',
       E'Adam appoints the penance: "I will spend forty days fasting... stand on it in the water up to thy neck... let no speech proceed out of thy mouth, since we are unworthy to address Yahuah (Lord), for our lips are unclean from the unlawful and forbidden tree." The turning is not torn garments but a torn heart — fasting, weeping, silence, the broken spirit Elohim will not despise; and the man who would speak before Yahuah first confesses his lips unclean. It ain''t new — the rending of the heart in fasting and the cry of unclean lips are already the prophets'' way of return.',
       sv.verse_id, ev.verse_id, 'extras', 92700
  FROM _session415_adam49_lookup sv, _session415_adam49_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=49 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=49 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-49-fast-in-the-river-unclean-lips
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:12 — *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* — the fast in the river is this same turning with the whole heart.'
  FROM cross_reference_threads t, cross_references x, _session415_adam49_lookup sv, _session415_adam49_lookup tv
 WHERE t.slug='adam-eve-49-fast-in-the-river-unclean-lips'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful... and repenteth him of the evil.* — "perchance Yahuah Elohim will take pity upon us" rests on the same mercy.'
  FROM cross_reference_threads t, cross_references x, _session415_adam49_lookup sv, _session415_adam49_lookup tv
 WHERE t.slug='adam-eve-49-fast-in-the-river-unclean-lips'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=49 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isa 6:5 — *Woe is me! for I am undone; because I am a man of unclean lips... for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts).* — "our lips are unclean" is the same dread of speaking before the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session415_adam49_lookup sv, _session415_adam49_lookup tv
 WHERE t.slug='adam-eve-49-fast-in-the-river-unclean-lips'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ps 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* — the silent neck-deep fast offers the one sacrifice Elohim will not despise.'
  FROM cross_reference_threads t, cross_references x, _session415_adam49_lookup sv, _session415_adam49_lookup tv
 WHERE t.slug='adam-eve-49-fast-in-the-river-unclean-lips'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_51.sql (session415 adam-eve 51) -----
-- Source anchor: pseudepigrapha/adam-eve ch51. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam51 (view _session415_adam51_lookup). Sort band base 92750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam51_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-51-jordan-and-its-creatures-mourn
  ('pseudepigrapha', 'adam-eve', 51, 1, 'canon', 'psalms', 69, 1, 'free', E'Ps 69:1 — *Save me, O Elohim (God); for the waters are come in unto my soul.* — Adam stands neck-deep in Jordan with the same cry from the depths.'),
  ('pseudepigrapha', 'adam-eve', 51, 1, 'canon', 'psalms', 69, 2, 'free', E'Ps 69:2 — *I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me.* — the penitent in the deep waters of the river.'),
  ('pseudepigrapha', 'adam-eve', 51, 1, 'canon', 'jonah', 3, 7, 'free', E'Jonah 3:7 — *Let neither man nor beast, herd nor flock, taste any thing: let them not feed, nor drink water:* — the beasts of Nineveh fast with the guilty, as Jordan''s creatures mourn with Adam.'),
  ('pseudepigrapha', 'adam-eve', 51, 1, 'canon', 'jonah', 3, 8, 'free', E'Jonah 3:8 — *let man and beast be covered with sackcloth, and cry mightily unto Elohim (God): yea, let them turn every one from his evil way...* — man and beast together in the mourning of repentance.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam51_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam51_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-51-jordan-and-its-creatures-mourn',
       E'Let the waters and their creatures mourn with me',
       E'Adam, neck-deep in Jordan, calls the river itself to his penance: "water of Jordan, grieve with me, and assemble to me all swimming (creatures)... let them surround me and mourn in company with me. Not for themselves let them lament, but for me; for it is not they that have sinned, but I." The waters come in unto his soul as he confesses; and as at Nineveh, where man and beast alike were covered with sackcloth and cried unto Elohim, the dumb creatures join the one who alone has sinned. It ain''t new — the penitent sunk in deep waters and the beasts called to mourn with the guilty are already in the Psalms and in Jonah.',
       sv.verse_id, ev.verse_id, 'extras', 92750
  FROM _session415_adam51_lookup sv, _session415_adam51_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=51 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=51 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-51-jordan-and-its-creatures-mourn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 69:1 — *Save me, O Elohim (God); for the waters are come in unto my soul.* — Adam stands neck-deep in Jordan with the same cry from the depths.'
  FROM cross_reference_threads t, cross_references x, _session415_adam51_lookup sv, _session415_adam51_lookup tv
 WHERE t.slug='adam-eve-51-jordan-and-its-creatures-mourn'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 69:2 — *I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me.* — the penitent in the deep waters of the river.'
  FROM cross_reference_threads t, cross_references x, _session415_adam51_lookup sv, _session415_adam51_lookup tv
 WHERE t.slug='adam-eve-51-jordan-and-its-creatures-mourn'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jonah 3:7 — *Let neither man nor beast, herd nor flock, taste any thing: let them not feed, nor drink water:* — the beasts of Nineveh fast with the guilty, as Jordan''s creatures mourn with Adam.'
  FROM cross_reference_threads t, cross_references x, _session415_adam51_lookup sv, _session415_adam51_lookup tv
 WHERE t.slug='adam-eve-51-jordan-and-its-creatures-mourn'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jonah 3:8 — *let man and beast be covered with sackcloth, and cry mightily unto Elohim (God): yea, let them turn every one from his evil way...* — man and beast together in the mourning of repentance.'
  FROM cross_reference_threads t, cross_references x, _session415_adam51_lookup sv, _session415_adam51_lookup tv
 WHERE t.slug='adam-eve-51-jordan-and-its-creatures-mourn'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_52.sql (session415 adam-eve 52) -----
-- Source anchor: pseudepigrapha/adam-eve ch52. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam52 (view _session415_adam52_lookup). Sort band base 92775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam52_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-52-transformed-into-brightness-of-angels
  ('pseudepigrapha', 'adam-eve', 52, 1, 'canon', '2-corinthians', 11, 14, 'free', E'2 Cor 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* — the "brightness of angels" is exactly this counterfeit light.'),
  ('pseudepigrapha', 'adam-eve', 52, 3, 'canon', '2-corinthians', 11, 13, 'free', E'2 Cor 11:13 — *For such are false apostles, deceitful workers, transforming themselves into the apostles of Messiah (Christ).* — the devil feigns to be one of the interceding angels, a deceitful worker.'),
  ('pseudepigrapha', 'adam-eve', 52, 1, 'canon', 'genesis', 3, 13, 'free', E'Gen 3:13 — *And the woman said, The serpent beguiled me, and I did eat.* — Eve is beguiled a second time, by the same adversary in fairer disguise.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam52_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam52_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-52-transformed-into-brightness-of-angels',
       E'Satan in the brightness of angels — Eve beguiled a second time',
       E'While Eve keeps her penance in the Tigris, "Satan was wroth and transformed himself into the brightness of angels" and came feigning to grieve with her, lying that "all we angels have entreated on your behalf" and that he was sent to bring her out. It is the same craft as in the garden, worn a second time: the adversary cloaks himself in light, counterfeits an angel of Elohim, and beguiles the woman with false comfort. It ain''t new — the serpent who beguiled her in Eden is the same Satan transformed into an angel of light.',
       sv.verse_id, ev.verse_id, 'extras', 92775
  FROM _session415_adam52_lookup sv, _session415_adam52_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=52 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=52 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-52-transformed-into-brightness-of-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Cor 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* — the "brightness of angels" is exactly this counterfeit light.'
  FROM cross_reference_threads t, cross_references x, _session415_adam52_lookup sv, _session415_adam52_lookup tv
 WHERE t.slug='adam-eve-52-transformed-into-brightness-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=52 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Cor 11:13 — *For such are false apostles, deceitful workers, transforming themselves into the apostles of Messiah (Christ).* — the devil feigns to be one of the interceding angels, a deceitful worker.'
  FROM cross_reference_threads t, cross_references x, _session415_adam52_lookup sv, _session415_adam52_lookup tv
 WHERE t.slug='adam-eve-52-transformed-into-brightness-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=52 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Gen 3:13 — *And the woman said, The serpent beguiled me, and I did eat.* — Eve is beguiled a second time, by the same adversary in fairer disguise.'
  FROM cross_reference_threads t, cross_references x, _session415_adam52_lookup sv, _session415_adam52_lookup tv
 WHERE t.slug='adam-eve-52-transformed-into-brightness-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=52 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_56.sql (session415 adam-eve 56) -----
-- Source anchor: pseudepigrapha/adam-eve ch56. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam56 (view _session415_adam56_lookup). Sort band base 92875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam56_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-56-the-image-of-elohim-the-breath-of-life
  ('pseudepigrapha', 'adam-eve', 56, 2, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The very words the devil quotes — made in the image and likeness — are the words Moses set at the making of man.'),
  ('pseudepigrapha', 'adam-eve', 56, 2, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The image of Elohim that the angels were bidden to honour in Adam & Eve 56:2 is the image Moses says was stamped upon the man at his creation.'),
  ('pseudepigrapha', 'adam-eve', 56, 2, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The breath of life the devil says was blown into Adam in Adam & Eve 56:2 is the breath Moses says Yahuah Elohim breathed into the man''s nostrils.'),
  ('pseudepigrapha', 'adam-eve', 56, 2, 'canon', 'colossians', 1, 15, 'free', E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature.* The image of Elohim borne by the formed man in Adam & Eve 56:2 has its perfect pattern in the Son, the true image of the unseen Elohim.'),
  ('pseudepigrapha', 'adam-eve', 56, 2, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The command that Michael and the angels worship the image of Elohim in Adam & Eve 56:2 finds its true end in the firstbegotten, whom all the angels of Elohim are bidden to worship.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam56_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam56_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-56-the-image-of-elohim-the-breath-of-life',
       E'The breath of life and the image of Elohim — the angels bidden to worship',
       E'The devil confesses the very dignity he could not endure: when Adam was formed, the breath of life was blown into him and his face was made in the likeness of his Maker, and the angels were bidden to honour the image. *When Elohim (God) blew into thee the breath of life and thy face and likeness was made in the image of Elohim (God), Michael also brought thee and made (us) worship thee in the sight of Elohim (God); and Elohim (God) Yahuah (Lord) spake: Here is Adam. I have made thee in our image and likeness* (Adam & Eve 56:2). This is no new thing — Moses set it down at the head of the creation: the man was formed of dust and quickened by the breath, and made in the image and likeness of Elohim. The apostles know the same pattern: the unseen Elohim has His true image, and the firstbegotten is brought into the world that the angels of Elohim worship Him. It ain''t new — the honour the adversary begrudged the image of Elohim is the honour Moses recorded and the apostles confess.',
       sv.verse_id, ev.verse_id, 'extras', 92875
  FROM _session415_adam56_lookup sv, _session415_adam56_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=56 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=56 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-56-the-image-of-elohim-the-breath-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* The very words the devil quotes — made in the image and likeness — are the words Moses set at the making of man.'
  FROM cross_reference_threads t, cross_references x, _session415_adam56_lookup sv, _session415_adam56_lookup tv
 WHERE t.slug='adam-eve-56-the-image-of-elohim-the-breath-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=56 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The image of Elohim that the angels were bidden to honour in Adam & Eve 56:2 is the image Moses says was stamped upon the man at his creation.'
  FROM cross_reference_threads t, cross_references x, _session415_adam56_lookup sv, _session415_adam56_lookup tv
 WHERE t.slug='adam-eve-56-the-image-of-elohim-the-breath-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=56 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The breath of life the devil says was blown into Adam in Adam & Eve 56:2 is the breath Moses says Yahuah Elohim breathed into the man''s nostrils.'
  FROM cross_reference_threads t, cross_references x, _session415_adam56_lookup sv, _session415_adam56_lookup tv
 WHERE t.slug='adam-eve-56-the-image-of-elohim-the-breath-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=56 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature.* The image of Elohim borne by the formed man in Adam & Eve 56:2 has its perfect pattern in the Son, the true image of the unseen Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam56_lookup sv, _session415_adam56_lookup tv
 WHERE t.slug='adam-eve-56-the-image-of-elohim-the-breath-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=56 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The command that Michael and the angels worship the image of Elohim in Adam & Eve 56:2 finds its true end in the firstbegotten, whom all the angels of Elohim are bidden to worship.'
  FROM cross_reference_threads t, cross_references x, _session415_adam56_lookup sv, _session415_adam56_lookup tv
 WHERE t.slug='adam-eve-56-the-image-of-elohim-the-breath-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=56 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_58.sql (session415 adam-eve 58) -----
-- Source anchor: pseudepigrapha/adam-eve ch58. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam58 (view _session415_adam58_lookup). Sort band base 92925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam58_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-58-i-will-set-my-seat-above-the-stars
  ('pseudepigrapha', 'adam-eve', 58, 3, 'canon', 'isaiah', 14, 12, 'free', E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The adversary''s refusal in Adam & Eve 57:3 to honour his junior is the pride Isaiah laments in the one fallen from heaven.'),
  ('pseudepigrapha', 'adam-eve', 58, 3, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The boast of Adam & Eve 58:3 — to set his seat above the stars of heaven — is almost word for word the throne Isaiah''s fallen one would exalt above the stars of Elohim.'),
  ('pseudepigrapha', 'adam-eve', 58, 3, 'canon', 'isaiah', 14, 14, 'free', E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The devil''s last word in Adam & Eve 58:3 — ''I will be like the Highest'' — is the very claim Isaiah records, to be like the El Elyon.'),
  ('pseudepigrapha', 'adam-eve', 58, 1, 'canon', 'ezekiel', 28, 15, 'free', E'Ezekiel 28:15 — *Thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee.* The angels under the adversary who joined his refusal in Adam & Eve 58:1 followed one in whom, as Ezekiel says, iniquity was found after his perfect beginning.'),
  ('pseudepigrapha', 'adam-eve', 58, 1, 'canon', 'ezekiel', 28, 17, 'free', E'Ezekiel 28:17 — *Thine heart was lifted up because of thy beauty, thou hast corrupted thy wisdom by reason of thy brightness: I will cast thee to the ground, I will lay thee before kings, that they may behold thee.* The lifted-up heart that would not bow in Adam & Eve 57:3-58:3 is the corruption Ezekiel names in the covering cherub cast to the ground.'),
  ('pseudepigrapha', 'adam-eve', 58, 3, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The casting-out the devil confesses in Adam & Eve 59:1, that followed his refusal in 57:3, is the lightning-fall the Messiah testifies He beheld.'),
  ('pseudepigrapha', 'adam-eve', 58, 1, 'canon', 'revelation', 12, 7, 'free', E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels.* The banishing of the adversary and his angels from glory in Adam & Eve 59:1 is the war in heaven where Michael and his angels war against the dragon and his.'),
  ('pseudepigrapha', 'adam-eve', 58, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The expulsion onto the earth that the devil mourns in Adam & Eve 59:1 is the casting-out of the dragon and his angels into the earth that John saw.'),
  ('pseudepigrapha', 'adam-eve', 58, 3, 'enoch', '1-enoch', 6, 2, 'free', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The angels who rebelled with the adversary in Adam & Eve 58:1 are remembered in the book of the fathers as the Watchers, the children of heaven who forsook their estate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam58_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam58_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-58-i-will-set-my-seat-above-the-stars',
       E'I will set my seat above the stars — the pride and fall of the adversary',
       E'Here the devil names his own ruin in words the prophets already wrote. He would not bow to the younger being, and when warned of wrath he answered: *If He be wrath with me, I will set my seat above the stars of heaven and will be like the Highest* (Adam & Eve 58:3) — and so *Elohim (God) Yahuah (Lord) was wrath with me and banished me and my angels from our glory* (Adam & Eve 59:1). This is the very boast Isaiah set in the mouth of the fallen one, the iniquity Ezekiel found in the covering cherub, the lightning-fall the Messiah beheld, the war in heaven from which Michael cast the dragon down. It ain''t new — the adversary''s pride, his five ''I wills'', and his casting-out are written plainly in Moses and the Prophets, and the same Watcher-rebellion is remembered among the books of the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 92925
  FROM _session415_adam58_lookup sv, _session415_adam58_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=58 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-58-i-will-set-my-seat-above-the-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The adversary''s refusal in Adam & Eve 57:3 to honour his junior is the pride Isaiah laments in the one fallen from heaven.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The boast of Adam & Eve 58:3 — to set his seat above the stars of heaven — is almost word for word the throne Isaiah''s fallen one would exalt above the stars of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The devil''s last word in Adam & Eve 58:3 — ''I will be like the Highest'' — is the very claim Isaiah records, to be like the El Elyon.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 28:15 — *Thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee.* The angels under the adversary who joined his refusal in Adam & Eve 58:1 followed one in whom, as Ezekiel says, iniquity was found after his perfect beginning.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 28:17 — *Thine heart was lifted up because of thy beauty, thou hast corrupted thy wisdom by reason of thy brightness: I will cast thee to the ground, I will lay thee before kings, that they may behold thee.* The lifted-up heart that would not bow in Adam & Eve 57:3-58:3 is the corruption Ezekiel names in the covering cherub cast to the ground.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The casting-out the devil confesses in Adam & Eve 59:1, that followed his refusal in 57:3, is the lightning-fall the Messiah testifies He beheld.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels.* The banishing of the adversary and his angels from glory in Adam & Eve 59:1 is the war in heaven where Michael and his angels war against the dragon and his.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The expulsion onto the earth that the devil mourns in Adam & Eve 59:1 is the casting-out of the dragon and his angels into the earth that John saw.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The angels who rebelled with the adversary in Adam & Eve 58:1 are remembered in the book of the fathers as the Watchers, the children of heaven who forsook their estate.'
  FROM cross_reference_threads t, cross_references x, _session415_adam58_lookup sv, _session415_adam58_lookup tv
 WHERE t.slug='adam-eve-58-i-will-set-my-seat-above-the-stars'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=58 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_61.sql (session415 adam-eve 61) -----
-- Source anchor: pseudepigrapha/adam-eve ch61. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam61 (view _session415_adam61_lookup). Sort band base 93000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam61_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-61-eve-takes-the-blame
  ('pseudepigrapha', 'adam-eve', 61, 1, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The error Eve confesses in Adam & Eve 61:1, that she did not keep the commandment, is the taking and eating Moses records of the woman.'),
  ('pseudepigrapha', 'adam-eve', 61, 1, 'canon', '1-timothy', 2, 13, 'free', E'1 Timothy 2:13 — *For Adam was first formed, then Eve.* Eve''s word in Adam & Eve 61:1, that life is granted to Adam who erred neither first nor second, rests on the order Paul names — Adam first formed, then Eve.'),
  ('pseudepigrapha', 'adam-eve', 61, 1, 'canon', '1-timothy', 2, 14, 'free', E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Eve''s confession in Adam & Eve 61:1, ''I have erred and been led astray,'' is exactly Paul''s account that the woman, being deceived, was in the transgression.'),
  ('pseudepigrapha', 'adam-eve', 61, 1, 'canon', 'romans', 5, 14, 'free', E'Romans 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come.* Though Eve takes the blame in Adam & Eve 61:1, Paul fixes the reign of death upon Adam''s transgression — and names him the figure of Him that was to come.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam61_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam61_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-61-eve-takes-the-blame',
       E'Eve takes the blame — the woman who was deceived',
       E'Eve owns the transgression and asks that Adam be spared: *Live thou, my Lord, to thee life is granted, since thou hast committed neither the first nor the second error. But I have erred and been led astray for I have not kept the commandment of Elohim (God)* (Adam & Eve 61:1). The same ordering is in Moses and in Paul: the woman saw, took, and ate; Adam was formed first, then Eve; and the woman, being deceived, was in the transgression — yet death came to reign through Adam, the figure of Him that was to come. It ain''t new — the account of who erred and who was deceived is set down in Moses and confessed by the apostle, the haggadah only putting it on Eve''s own lips.',
       sv.verse_id, ev.verse_id, 'extras', 93000
  FROM _session415_adam61_lookup sv, _session415_adam61_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=61 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=61 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-61-eve-takes-the-blame
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The error Eve confesses in Adam & Eve 61:1, that she did not keep the commandment, is the taking and eating Moses records of the woman.'
  FROM cross_reference_threads t, cross_references x, _session415_adam61_lookup sv, _session415_adam61_lookup tv
 WHERE t.slug='adam-eve-61-eve-takes-the-blame'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 2:13 — *For Adam was first formed, then Eve.* Eve''s word in Adam & Eve 61:1, that life is granted to Adam who erred neither first nor second, rests on the order Paul names — Adam first formed, then Eve.'
  FROM cross_reference_threads t, cross_references x, _session415_adam61_lookup sv, _session415_adam61_lookup tv
 WHERE t.slug='adam-eve-61-eve-takes-the-blame'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* Eve''s confession in Adam & Eve 61:1, ''I have erred and been led astray,'' is exactly Paul''s account that the woman, being deceived, was in the transgression.'
  FROM cross_reference_threads t, cross_references x, _session415_adam61_lookup sv, _session415_adam61_lookup tv
 WHERE t.slug='adam-eve-61-eve-takes-the-blame'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come.* Though Eve takes the blame in Adam & Eve 61:1, Paul fixes the reign of death upon Adam''s transgression — and names him the figure of Him that was to come.'
  FROM cross_reference_threads t, cross_references x, _session415_adam61_lookup sv, _session415_adam61_lookup tv
 WHERE t.slug='adam-eve-61-eve-takes-the-blame'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_64.sql (session415 adam-eve 64) -----
-- Source anchor: pseudepigrapha/adam-eve ch64. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam64 (view _session415_adam64_lookup). Sort band base 93075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam64_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-64-eves-pangs-and-the-birth-of-cain
  ('pseudepigrapha', 'adam-eve', 64, 1, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The distress and pains that overtake Eve at her bearing in Adam & Eve 62:1 are the sorrow in childbearing Moses pronounced upon the woman.'),
  ('pseudepigrapha', 'adam-eve', 64, 3, 'canon', 'genesis', 4, 1, 'free', E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* The son Eve bears and names Cain in Adam & Eve 64:3 is the very firstborn Moses sets at the head of Adam''s generations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam64_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam64_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-64-eves-pangs-and-the-birth-of-cain',
       E'The pangs of childbearing and the birth of Cain',
       E'The curse upon the woman is now lived out: Eve travails in sorrow, cries to Yahuah, and at the angels'' help brings forth her firstborn. *Rise up now, and prepare thee to bear. And she bore a son and he was shining... and his name was called Cain* (Adam & Eve 64:2-3), after she had cried *Pity me, O Yahuah (Lord), assist me* (Adam & Eve 62:2). This is the sentence Moses set upon Eve and the birth he set at the head of the generations — sorrow multiplied in childbearing, and Cain the firstborn gotten by the woman. It ain''t new — the pangs and the first birth the angels attend are the curse and the conception Moses already wrote.',
       sv.verse_id, ev.verse_id, 'extras', 93075
  FROM _session415_adam64_lookup sv, _session415_adam64_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=64 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=64 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-64-eves-pangs-and-the-birth-of-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The distress and pains that overtake Eve at her bearing in Adam & Eve 62:1 are the sorrow in childbearing Moses pronounced upon the woman.'
  FROM cross_reference_threads t, cross_references x, _session415_adam64_lookup sv, _session415_adam64_lookup tv
 WHERE t.slug='adam-eve-64-eves-pangs-and-the-birth-of-cain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=64 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* The son Eve bears and names Cain in Adam & Eve 64:3 is the very firstborn Moses sets at the head of Adam''s generations.'
  FROM cross_reference_threads t, cross_references x, _session415_adam64_lookup sv, _session415_adam64_lookup tv
 WHERE t.slug='adam-eve-64-eves-pangs-and-the-birth-of-cain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=64 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_66.sql (session415 adam-eve 66) -----
-- Source anchor: pseudepigrapha/adam-eve ch66. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam66 (view _session415_adam66_lookup). Sort band base 93125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam66_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-66-cain-slays-abel-and-seth-is-born
  ('pseudepigrapha', 'adam-eve', 66, 1, 'canon', 'genesis', 4, 2, 'free', E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The two callings made for the brothers in Adam & Eve 66:1, Cain the husbandman and Abel the shepherd, are the very trades Moses assigns them.'),
  ('pseudepigrapha', 'adam-eve', 66, 2, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* The slaying of Abel by Cain in Adam & Eve 66:2 is the murder in the field Moses records.'),
  ('pseudepigrapha', 'adam-eve', 66, 2, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The murder told in Adam & Eve 66:2 is the deed John holds up as the pattern of hatred — Cain, of the wicked one, who slew his righteous brother.'),
  ('pseudepigrapha', 'adam-eve', 66, 1, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Adam''s word in Adam & Eve 67:1, that Seth is begotten in place of Abel whom Cain slew, is the very reckoning Moses sets at Seth''s naming.'),
  ('pseudepigrapha', 'adam-eve', 66, 2, 'canon', 'genesis', 5, 4, 'free', E'Genesis 5:4 — *And the days of Adam after he had begotten Seth were eight hundred years: and he begat sons and daughters.* The eight hundred years and the sons and daughters Adam begets after Seth in Adam & Eve 67:2 are the very span and increase Moses records in the generations of Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam66_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam66_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-66-cain-slays-abel-and-seth-is-born',
       E'The husbandman and the shepherd — Cain slays Abel, and Seth is born',
       E'The two callings, the murder, and the appointed seed all stand here as Moses set them: *they made Cain an husbandman, (but) Abel they made a shepherd* (Adam & Eve 66:1); *Cain slew Abel... And thereafter Adam knew his wife and he begat a son and called his name Seth* (Adam & Eve 66:2); *I have begotten a son, in place of Abel, whom Cain slew* (Adam & Eve 67:1); and Adam *lived eight hundred years and begat thirty sons and thirty daughters* (Adam & Eve 67:2). Moses gives the same trades, the same slaying in the field, the same Seth appointed instead of Abel, and the same eight hundred years and sons and daughters; and John names why Cain slew — because his works were evil and his brother''s righteous. It ain''t new — the shepherd and the husbandman, the first murder, and the seed appointed in Abel''s place are written in the book of the generations of Adam.',
       sv.verse_id, ev.verse_id, 'extras', 93125
  FROM _session415_adam66_lookup sv, _session415_adam66_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=66 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=66 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-66-cain-slays-abel-and-seth-is-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The two callings made for the brothers in Adam & Eve 66:1, Cain the husbandman and Abel the shepherd, are the very trades Moses assigns them.'
  FROM cross_reference_threads t, cross_references x, _session415_adam66_lookup sv, _session415_adam66_lookup tv
 WHERE t.slug='adam-eve-66-cain-slays-abel-and-seth-is-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* The slaying of Abel by Cain in Adam & Eve 66:2 is the murder in the field Moses records.'
  FROM cross_reference_threads t, cross_references x, _session415_adam66_lookup sv, _session415_adam66_lookup tv
 WHERE t.slug='adam-eve-66-cain-slays-abel-and-seth-is-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The murder told in Adam & Eve 66:2 is the deed John holds up as the pattern of hatred — Cain, of the wicked one, who slew his righteous brother.'
  FROM cross_reference_threads t, cross_references x, _session415_adam66_lookup sv, _session415_adam66_lookup tv
 WHERE t.slug='adam-eve-66-cain-slays-abel-and-seth-is-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Adam''s word in Adam & Eve 67:1, that Seth is begotten in place of Abel whom Cain slew, is the very reckoning Moses sets at Seth''s naming.'
  FROM cross_reference_threads t, cross_references x, _session415_adam66_lookup sv, _session415_adam66_lookup tv
 WHERE t.slug='adam-eve-66-cain-slays-abel-and-seth-is-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 5:4 — *And the days of Adam after he had begotten Seth were eight hundred years: and he begat sons and daughters.* The eight hundred years and the sons and daughters Adam begets after Seth in Adam & Eve 67:2 are the very span and increase Moses records in the generations of Adam.'
  FROM cross_reference_threads t, cross_references x, _session415_adam66_lookup sv, _session415_adam66_lookup tv
 WHERE t.slug='adam-eve-66-cain-slays-abel-and-seth-is-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_68.sql (session415 adam-eve 68) -----
-- Source anchor: pseudepigrapha/adam-eve ch68. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam68 (view _session415_adam68_lookup). Sort band base 93175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam68_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-68-caught-up-in-the-fiery-chariot
  ('pseudepigrapha', 'adam-eve', 68, 3, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* Adam''s being caught up into the Paradise of righteousness is the very experience Paul reports — a man caught up into paradise.'),
  ('pseudepigrapha', 'adam-eve', 68, 3, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago... such an one caught up to the third heaven.* The same word — caught up — and the same destination, the heavenly paradise.'),
  ('pseudepigrapha', 'adam-eve', 68, 3, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* Adam sees Yahuah seated on the chariot-throne exactly as Ezekiel saw the one enthroned above the wheels.'),
  ('pseudepigrapha', 'adam-eve', 68, 3, 'canon', 'ezekiel', 1, 4, 'free', E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it.* The chariot whose wheels were fiery and whose rider''s face was flaming fire matches the fire-enfolded vision the prophet saw.'),
  ('pseudepigrapha', 'adam-eve', 68, 3, 'canon', 'psalms', 18, 10, 'free', E'Psalm 18:10 — *And he rode upon a cherub, and did fly: yea, he did fly upon the wings of the wind.* The chariot like the wind on which Adam is borne up is the same imagery David sang of the riding-out of Yahuah.'),
  ('pseudepigrapha', 'adam-eve', 68, 3, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *there appeared a chariot of fire, and horses of fire... and Elijah went up by a whirlwind into heaven.* As Adam is caught up by the fiery chariot, so Elijah was taken up by the chariot of fire — the same heavenly vehicle in the same Scriptures.'),
  ('pseudepigrapha', 'adam-eve', 68, 3, 'canon', 'revelation', 4, 2, 'free', E'Revelation 4:2 — *and, behold, a throne was set in heaven, and one sat on the throne.* Adam sees Yahuah sitting enthroned in the paradise of righteousness, the same throne John was caught up to behold.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam68_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam68_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-68-caught-up-in-the-fiery-chariot',
       E'Adam caught up in the fiery chariot to Paradise',
       E'Before he dies Adam tells Seth the secret of his rapture: *there came to me Michael the archangel... And I saw a chariot like the wind and its wheels were fiery and I was caught up into the Paradise of righteousness, and I saw Yahuah (Lord) sitting and his face was flaming fire that could not be endured* (Adam & Eve 68:2-3). Every part of the vision is already in the Prophets and the apostles. Paul was *caught up into paradise* (2 Corinthians 12:4); Ezekiel saw the fiery wheels and, above them, *the likeness of a throne... and upon the likeness of the throne was the likeness as the appearance of a man* (Ezekiel 1:26); the Psalmist sang of One who *rode upon a cherub, and did fly* (Psalm 18:10); and Elijah went up by *a chariot of fire, and horses of fire* (2 Kings 2:11). John too was bidden *Come up hither* and saw *a throne... set in heaven, and one sat on the throne* (Revelation 4:2). It ain''t new — the fiery chariot, the throne of flame, the man caught up to paradise are written in Moses, the Prophets, and the apostles long before this telling.',
       sv.verse_id, ev.verse_id, 'extras', 93175
  FROM _session415_adam68_lookup sv, _session415_adam68_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=68 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-68-caught-up-in-the-fiery-chariot
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* Adam''s being caught up into the Paradise of righteousness is the very experience Paul reports — a man caught up into paradise.'
  FROM cross_reference_threads t, cross_references x, _session415_adam68_lookup sv, _session415_adam68_lookup tv
 WHERE t.slug='adam-eve-68-caught-up-in-the-fiery-chariot'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago... such an one caught up to the third heaven.* The same word — caught up — and the same destination, the heavenly paradise.'
  FROM cross_reference_threads t, cross_references x, _session415_adam68_lookup sv, _session415_adam68_lookup tv
 WHERE t.slug='adam-eve-68-caught-up-in-the-fiery-chariot'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* Adam sees Yahuah seated on the chariot-throne exactly as Ezekiel saw the one enthroned above the wheels.'
  FROM cross_reference_threads t, cross_references x, _session415_adam68_lookup sv, _session415_adam68_lookup tv
 WHERE t.slug='adam-eve-68-caught-up-in-the-fiery-chariot'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it.* The chariot whose wheels were fiery and whose rider''s face was flaming fire matches the fire-enfolded vision the prophet saw.'
  FROM cross_reference_threads t, cross_references x, _session415_adam68_lookup sv, _session415_adam68_lookup tv
 WHERE t.slug='adam-eve-68-caught-up-in-the-fiery-chariot'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 18:10 — *And he rode upon a cherub, and did fly: yea, he did fly upon the wings of the wind.* The chariot like the wind on which Adam is borne up is the same imagery David sang of the riding-out of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session415_adam68_lookup sv, _session415_adam68_lookup tv
 WHERE t.slug='adam-eve-68-caught-up-in-the-fiery-chariot'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Kings 2:11 — *there appeared a chariot of fire, and horses of fire... and Elijah went up by a whirlwind into heaven.* As Adam is caught up by the fiery chariot, so Elijah was taken up by the chariot of fire — the same heavenly vehicle in the same Scriptures.'
  FROM cross_reference_threads t, cross_references x, _session415_adam68_lookup sv, _session415_adam68_lookup tv
 WHERE t.slug='adam-eve-68-caught-up-in-the-fiery-chariot'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Revelation 4:2 — *and, behold, a throne was set in heaven, and one sat on the throne.* Adam sees Yahuah sitting enthroned in the paradise of righteousness, the same throne John was caught up to behold.'
  FROM cross_reference_threads t, cross_references x, _session415_adam68_lookup sv, _session415_adam68_lookup tv
 WHERE t.slug='adam-eve-68-caught-up-in-the-fiery-chariot'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=68 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_69.sql (session415 adam-eve 69) -----
-- Source anchor: pseudepigrapha/adam-eve ch69. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam69 (view _session415_adam69_lookup). Sort band base 93200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam69_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-69-behold-thou-diest
  ('pseudepigrapha', 'adam-eve', 69, 2, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The sentence Behold thou diest is the carrying-out of the very warning attached to the one forbidden tree.'),
  ('pseudepigrapha', 'adam-eve', 69, 2, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake.* Adam dies because he hearkened to the voice of his wife and passed by the word of Elohim — the same charge Moses set down.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam69_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam69_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-69-behold-thou-diest',
       E'Behold thou diest, for thou didst transgress',
       E'On the throne of flame the sentence first spoken in Eden is sealed: *Behold thou diest, since thou hast transgressed the commandment of Elohim (God), for thou didst hearken rather to the voice of thy wife... and didst pass by My words* (Adam & Eve 69:2). This is no new verdict — it is the word of Genesis word for word. Moses records the command, *of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17); and the charge against Adam, *Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree* (Genesis 3:17). It ain''t new — that Adam dies because he heeded the voice of his wife above the word of Elohim is the very indictment written in the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 93200
  FROM _session415_adam69_lookup sv, _session415_adam69_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=69 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=69 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-69-behold-thou-diest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The sentence Behold thou diest is the carrying-out of the very warning attached to the one forbidden tree.'
  FROM cross_reference_threads t, cross_references x, _session415_adam69_lookup sv, _session415_adam69_lookup tv
 WHERE t.slug='adam-eve-69-behold-thou-diest'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=69 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake.* Adam dies because he hearkened to the voice of his wife and passed by the word of Elohim — the same charge Moses set down.'
  FROM cross_reference_threads t, cross_references x, _session415_adam69_lookup sv, _session415_adam69_lookup tv
 WHERE t.slug='adam-eve-69-behold-thou-diest'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=69 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_72.sql (session415 adam-eve 72) -----
-- Source anchor: pseudepigrapha/adam-eve ch72. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam72 (view _session415_adam72_lookup). Sort band base 93275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam72_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-72-the-house-built-burnt-and-restored
  ('pseudepigrapha', 'adam-eve', 72, 4, 'canon', 'deuteronomy', 4, 36, 'free', E'Deuteronomy 4:36 — *Out of heaven he made thee to hear his voice, that he might instruct thee: and upon earth he shewed thee his great fire; and thou heardest his words out of the midst of the fire.* Yahuah appearing in a flame of fire to give commandments and statutes is the giving of the law at Sinai, out of the midst of the fire.'),
  ('pseudepigrapha', 'adam-eve', 72, 6, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The dispersion and the bringing-back foretold to Adam is the scattering-and-regathering Moses set before the people.'),
  ('pseudepigrapha', 'adam-eve', 72, 7, 'canon', 'haggai', 2, 9, 'free', E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace.* The house exalted in the last time greater than of old is the latter house whose glory the prophet promised would surpass the former.'),
  -- thread: adam-eve-72-elohim-shall-dwell-with-men
  ('pseudepigrapha', 'adam-eve', 72, 7, 'canon', 'zechariah', 8, 8, 'free', E'Zechariah 8:8 — *And I will bring them, and they shall dwell in the midst of Jerusalem: and they shall be my people, and I will be their Elohim (God), in truth and in righteousness.* The promise that Elohim will dwell with men and stir up a faithful people is the covenant word the prophet gives — they my people, I their Elohim.'),
  ('pseudepigrapha', 'adam-eve', 72, 7, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Elohim dwelling with men on earth, shown to Adam, is the same end John saw — the dwelling of Elohim with men at the last.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam72_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam72_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-72-the-house-built-burnt-and-restored',
       E'The house built, burnt, dispersed, and raised again',
       E'In the secrets shown to Adam he is given the whole course of the people of Elohim: *Yahuah (Lord) will appear in a flame of fire... He will give commandments and statutes... And then they will build a house to Yahuah (Lord) their Elohim (God)... and there they will transgress His statutes and their sanctuary will be burnt up... and they themselves will be dispersed... And once more He will cause them to come back from their dispersion; and again they will build the house of Elohim (God); and in the last time the house of Elohim (God) will be exalted greater than of old* (Adam & Eve 72:4-7). This is the very arc Moses and the Prophets foretold: the law given out of *the midst of the fire* (Deuteronomy 4:36); the scattering and the regathering, *Yahuah Elohayka (the LORD thy God) will turn thy captivity... and will return and gather thee from all the nations* (Deuteronomy 30:3); and the latter house, *The glory of this latter house shall be greater than of the former* (Haggai 2:9). It ain''t new — Sinai''s fire, the temple built and burnt, the dispersion and the return, and the greater house at the last are the settled testimony of the Torah and the Prophets.',
       sv.verse_id, ev.verse_id, 'extras', 93275
  FROM _session415_adam72_lookup sv, _session415_adam72_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=72 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=72 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-72-elohim-shall-dwell-with-men',
       E'Elohim shall dwell with men, and the just shall shine',
       E'The vision closes on the age to come: *thereafter Elohim (God) will dwell with men on earth... and the just shall shine like the sun, in the sight of Elohim (God). And in that time, shall men be purified by water from their sins. But those who are unwilling to be purified by water shall be condemned* (Adam & Eve 72:7,9-10). The Prophets and the apostles say the same. Zechariah: *I will bring them, and they shall dwell in the midst of Jerusalem: and they shall be my people, and I will be their Elohim (God)* (Zechariah 8:8); and John hears, *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people* (Revelation 21:3). It ain''t new — that Elohim will dwell with men, that the righteous shall shine, and that men are cleansed by water are the long hope of the Prophets, not a thing newly told.',
       sv.verse_id, ev.verse_id, 'extras', 93278
  FROM _session415_adam72_lookup sv, _session415_adam72_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=72 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=72 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-72-the-house-built-burnt-and-restored
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:36 — *Out of heaven he made thee to hear his voice, that he might instruct thee: and upon earth he shewed thee his great fire; and thou heardest his words out of the midst of the fire.* Yahuah appearing in a flame of fire to give commandments and statutes is the giving of the law at Sinai, out of the midst of the fire.'
  FROM cross_reference_threads t, cross_references x, _session415_adam72_lookup sv, _session415_adam72_lookup tv
 WHERE t.slug='adam-eve-72-the-house-built-burnt-and-restored'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=72 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The dispersion and the bringing-back foretold to Adam is the scattering-and-regathering Moses set before the people.'
  FROM cross_reference_threads t, cross_references x, _session415_adam72_lookup sv, _session415_adam72_lookup tv
 WHERE t.slug='adam-eve-72-the-house-built-burnt-and-restored'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=72 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace.* The house exalted in the last time greater than of old is the latter house whose glory the prophet promised would surpass the former.'
  FROM cross_reference_threads t, cross_references x, _session415_adam72_lookup sv, _session415_adam72_lookup tv
 WHERE t.slug='adam-eve-72-the-house-built-burnt-and-restored'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=72 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: adam-eve-72-elohim-shall-dwell-with-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 8:8 — *And I will bring them, and they shall dwell in the midst of Jerusalem: and they shall be my people, and I will be their Elohim (God), in truth and in righteousness.* The promise that Elohim will dwell with men and stir up a faithful people is the covenant word the prophet gives — they my people, I their Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam72_lookup sv, _session415_adam72_lookup tv
 WHERE t.slug='adam-eve-72-elohim-shall-dwell-with-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=72 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:3 — *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Elohim dwelling with men on earth, shown to Adam, is the same end John saw — the dwelling of Elohim with men at the last.'
  FROM cross_reference_threads t, cross_references x, _session415_adam72_lookup sv, _session415_adam72_lookup tv
 WHERE t.slug='adam-eve-72-elohim-shall-dwell-with-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=72 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_73.sql (session415 adam-eve 73) -----
-- Source anchor: pseudepigrapha/adam-eve ch73. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam73 (view _session415_adam73_lookup). Sort band base 93300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam73_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-73-assemble-my-sons-to-bless-them
  ('pseudepigrapha', 'adam-eve', 73, 1, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* Adam''s age at his death, nine hundred and thirty years, is the very number Moses records in the generations of Adam.'),
  ('pseudepigrapha', 'adam-eve', 73, 1, 'canon', 'genesis', 49, 1, 'free', E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* Adam gathering his sons to bless them before he dies sets the pattern Jacob keeps when he assembles his sons at the end of his life.'),
  ('pseudepigrapha', 'adam-eve', 73, 1, 'canon', 'deuteronomy', 33, 1, 'free', E'Deuteronomy 33:1 — *And this is the blessing, wherewith Moses the man of Elohim (God) blessed the children of Yashar''el (Israel) before his death.* The dying father''s blessing of his sons that begins with Adam continues with Moses, who blessed Israel before his death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam73_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam73_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-73-assemble-my-sons-to-bless-them',
       E'Adam at nine hundred and thirty assembles his sons to bless them',
       E'The father of all the living dies as the patriarchs after him will: *After Adam was nine hundred and thirty years old, since he knew that his days were coming to an end, he said: ''Let all my sons assemble themselves to me, that I may bless them before I die''* (Adam & Eve 73:1). Moses gives the same number for Adam''s life — *all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5) — and sets the pattern of the dying father gathering his sons: Jacob, *Gather yourselves together, that I may tell you that which shall befall you in the last days* (Genesis 49:1), and Moses, *the blessing, wherewith Moses the man of Elohim (God) blessed the children of Yashar''el (Israel) before his death* (Deuteronomy 33:1). It ain''t new — the dying patriarch who gathers his sons to bless them begins with Adam and runs straight through the fathers of Israel.',
       sv.verse_id, ev.verse_id, 'extras', 93300
  FROM _session415_adam73_lookup sv, _session415_adam73_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=73 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=73 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-73-assemble-my-sons-to-bless-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* Adam''s age at his death, nine hundred and thirty years, is the very number Moses records in the generations of Adam.'
  FROM cross_reference_threads t, cross_references x, _session415_adam73_lookup sv, _session415_adam73_lookup tv
 WHERE t.slug='adam-eve-73-assemble-my-sons-to-bless-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=73 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:1 — *And Jacob called unto his sons, and said, Gather yourselves together, that I may tell you that which shall befall you in the last days.* Adam gathering his sons to bless them before he dies sets the pattern Jacob keeps when he assembles his sons at the end of his life.'
  FROM cross_reference_threads t, cross_references x, _session415_adam73_lookup sv, _session415_adam73_lookup tv
 WHERE t.slug='adam-eve-73-assemble-my-sons-to-bless-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=73 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 33:1 — *And this is the blessing, wherewith Moses the man of Elohim (God) blessed the children of Yashar''el (Israel) before his death.* The dying father''s blessing of his sons that begins with Adam continues with Moses, who blessed Israel before his death.'
  FROM cross_reference_threads t, cross_references x, _session415_adam73_lookup sv, _session415_adam73_lookup tv
 WHERE t.slug='adam-eve-73-assemble-my-sons-to-bless-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=73 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_76.sql (session415 adam-eve 76) -----
-- Source anchor: pseudepigrapha/adam-eve ch76. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam76 (view _session415_adam76_lookup). Sort band base 93375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam76_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-76-two-angels-given-to-guard-us
  ('pseudepigrapha', 'adam-eve', 76, 1, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The two angels Elohim gives to guard Adam and Eve are the guardian charge the Psalmist names — angels given charge to keep his own.'),
  ('pseudepigrapha', 'adam-eve', 76, 2, 'canon', 'genesis', 2, 16, 'free', E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat.* The forbidden tree the devil draws Eve to, while the guardian angels were absent, is the one tree set apart from all the freely-given trees of the garden.'),
  ('pseudepigrapha', 'adam-eve', 76, 2, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The unlawful and forbidden tree to which the adversary led Eve is the single prohibition Moses records, guarded by the very command of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam76_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam76_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-76-two-angels-given-to-guard-us',
       E'Two angels given to guard the man and the woman',
       E'Adam tells his sons a detail Genesis leaves unspoken — that guardian angels were set over the first pair: *Elohim (God) Yahuah (Lord) gave us two angels to guard us. The hour came when the angels had ascended to worship in the sight of Elohim (God); forthwith the adversary [the devil] found an opportunity while the angels were absent* (Adam & Eve 76:1-2). The haggadah embellishes, but the root it reaches for is plain in Scripture: *For he shall give his angels charge over thee, to keep thee in all thy ways* (Psalm 91:11), and the one charge whose keeping the angels guarded was the word already given, *Of every tree of the garden thou mayest freely eat: But of the tree of the knowledge of good and evil, thou shalt not eat of it* (Genesis 2:16-17). It ain''t new — that Elohim gives his angels charge to keep his own, and that the one command stood from the beginning, is written plainly in the Psalms and in Moses.',
       sv.verse_id, ev.verse_id, 'extras', 93375
  FROM _session415_adam76_lookup sv, _session415_adam76_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=76 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=76 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-76-two-angels-given-to-guard-us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The two angels Elohim gives to guard Adam and Eve are the guardian charge the Psalmist names — angels given charge to keep his own.'
  FROM cross_reference_threads t, cross_references x, _session415_adam76_lookup sv, _session415_adam76_lookup tv
 WHERE t.slug='adam-eve-76-two-angels-given-to-guard-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=76 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:16 — *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat.* The forbidden tree the devil draws Eve to, while the guardian angels were absent, is the one tree set apart from all the freely-given trees of the garden.'
  FROM cross_reference_threads t, cross_references x, _session415_adam76_lookup sv, _session415_adam76_lookup tv
 WHERE t.slug='adam-eve-76-two-angels-given-to-guard-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=76 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The unlawful and forbidden tree to which the adversary led Eve is the single prohibition Moses records, guarded by the very command of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam76_lookup sv, _session415_adam76_lookup tv
 WHERE t.slug='adam-eve-76-two-angels-given-to-guard-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=76 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_79.sql (session415 adam-eve 79) -----
-- Source anchor: pseudepigrapha/adam-eve ch79. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam79 (view _session415_adam79_lookup). Sort band base 93450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam79_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-79-oil-of-the-tree-of-mercy
  ('pseudepigrapha', 'adam-eve', 79, 2, 'canon', 'isaiah', 61, 1, 'free', E'Isaiah 61:1 — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound;* the oil of mercy Adam begs to ease his pains is the anointing the prophet announces, sent to bind up the broken.'),
  ('pseudepigrapha', 'adam-eve', 79, 2, 'canon', 'isaiah', 61, 3, 'free', E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness;* the very oil Adam seeks, the oil of mercy that gives rest, is named here as the oil of joy poured out on them that mourn.'),
  ('pseudepigrapha', 'adam-eve', 79, 2, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree of His mercy whence the oil of life floweth is the tree of life John saw restored, its leaves for healing.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam79_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam79_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-79-oil-of-the-tree-of-mercy',
       E'The oil from the tree of His mercy',
       E'Dying, Adam sends Seth and Eve to the edge of paradise to beg one drop of the oil of mercy: *Perchance He will have pity (upon you) and send His angel across to the tree of His mercy, whence floweth the oil of life, and will give you a drop of it, to anoint me with it, that I may have rest from these pains* (Adam & Eve 79:2). The plea reaches for what the prophets already named — the anointing oil of joy for them that mourn: *he hath sent me to bind up the brokenhearted* (Isaiah 61:1), *the oil of joy for mourning* (Isaiah 61:3). The tree itself is the tree of life that John saw, whose *leaves of the tree were for the healing of the nations* (Revelation 22:2). It ain''t new — the oil of mercy Adam longed for is the anointing the prophets foretold and the apostle beheld restored at the end.',
       sv.verse_id, ev.verse_id, 'extras', 93450
  FROM _session415_adam79_lookup sv, _session415_adam79_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=79 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=79 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-79-oil-of-the-tree-of-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 61:1 — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound;* the oil of mercy Adam begs to ease his pains is the anointing the prophet announces, sent to bind up the broken.'
  FROM cross_reference_threads t, cross_references x, _session415_adam79_lookup sv, _session415_adam79_lookup tv
 WHERE t.slug='adam-eve-79-oil-of-the-tree-of-mercy'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=79 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness;* the very oil Adam seeks, the oil of mercy that gives rest, is named here as the oil of joy poured out on them that mourn.'
  FROM cross_reference_threads t, cross_references x, _session415_adam79_lookup sv, _session415_adam79_lookup tv
 WHERE t.slug='adam-eve-79-oil-of-the-tree-of-mercy'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=79 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The tree of His mercy whence the oil of life floweth is the tree of life John saw restored, its leaves for healing.'
  FROM cross_reference_threads t, cross_references x, _session415_adam79_lookup sv, _session415_adam79_lookup tv
 WHERE t.slug='adam-eve-79-oil-of-the-tree-of-mercy'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=79 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_80.sql (session415 adam-eve 80) -----
-- Source anchor: pseudepigrapha/adam-eve ch80. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam80 (view _session415_adam80_lookup). Sort band base 93475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam80_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-80-against-the-image-of-elohim
  ('pseudepigrapha', 'adam-eve', 80, 3, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* Eve pleads the very dignity Moses records, that man is the image of Elohim, which the beast dares to assail.'),
  ('pseudepigrapha', 'adam-eve', 80, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent loosing itself against the woman''s son is the enmity Yahuah set in Eden between the serpent and her seed.'),
  ('pseudepigrapha', 'adam-eve', 80, 2, 'canon', 'genesis', 3, 14, 'free', E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* Eve''s word that she is accursed for breaking the commandment recalls the curse first laid upon the serpent in the garden.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam80_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam80_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-80-against-the-image-of-elohim',
       E'The beast looses against the image of Elohim',
       E'On the road to paradise the serpent-beast attacks and bites Seth, and Eve cries out against it: *Accursed beast! how (is it that) thou hast not feared to let thyself loose against the image of Elohim (God), but hast dared to fight with it* (Adam & Eve 80:3). The dignity she pleads is the one Moses set at creation — man made in the divine image: *So Elohim (God) created man in his own image* (Genesis 1:27). And the old enmity she names is the sentence already passed on the serpent in Eden: *I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15). It ain''t new — the serpent''s rage against the image of Elohim, and the head-bruising enmity set against it, are written from the garden.',
       sv.verse_id, ev.verse_id, 'extras', 93475
  FROM _session415_adam80_lookup sv, _session415_adam80_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=80 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=80 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-80-against-the-image-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* Eve pleads the very dignity Moses records, that man is the image of Elohim, which the beast dares to assail.'
  FROM cross_reference_threads t, cross_references x, _session415_adam80_lookup sv, _session415_adam80_lookup tv
 WHERE t.slug='adam-eve-80-against-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=80 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The serpent loosing itself against the woman''s son is the enmity Yahuah set in Eden between the serpent and her seed.'
  FROM cross_reference_threads t, cross_references x, _session415_adam80_lookup sv, _session415_adam80_lookup tv
 WHERE t.slug='adam-eve-80-against-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=80 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:14 — *And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle, and above every beast of the field; upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* Eve''s word that she is accursed for breaking the commandment recalls the curse first laid upon the serpent in the garden.'
  FROM cross_reference_threads t, cross_references x, _session415_adam80_lookup sv, _session415_adam80_lookup tv
 WHERE t.slug='adam-eve-80-against-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=80 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_82.sql (session415 adam-eve 82) -----
-- Source anchor: pseudepigrapha/adam-eve ch82. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam82 (view _session415_adam82_lookup). Sort band base 93525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam82_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-82-avaunt-from-the-image-of-elohim
  ('pseudepigrapha', 'adam-eve', 82, 1, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* Seth''s word that drives the accursed enemy from the presence of the image is the fall of the adversary the Messiah declares.'),
  ('pseudepigrapha', 'adam-eve', 82, 1, 'canon', 'luke', 10, 19, 'free', E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* Seth bidding the serpent avaunt, and leaving its bite unharmed, is the authority over the serpent the Messiah grants His own.'),
  ('pseudepigrapha', 'adam-eve', 82, 1, 'canon', 'mark', 16, 18, 'free', E'Mark 16:18 — *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* Seth, bitten by the beast yet unhurt as he commands it away, prefigures the promise that the serpent''s bite shall not hurt the servants of the Messiah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam82_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam82_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-82-avaunt-from-the-image-of-elohim',
       E'Seth rebukes the serpent: Avaunt from the image',
       E'Seth, man of Elohim, silences the beast and drives it off until the judgement: *Be silent, be dumb, shut thy mouth, accursed enemy of Truth... Avaunt from the image of Elohim (God) till the day when Yahuah Elohim (the Lord God) shall order thee to be brought to the ordeal* (Adam & Eve 82:1). The serpent withdraws, and Seth, though bitten, is unhurt. This is the authority over the serpent the Messiah gives His own: *I beheld Satan as lightning fall from heaven* (Luke 10:18), *Behold, I give unto you power to tread on serpents and scorpions... and nothing shall by any means hurt you* (Luke 10:19), *They shall take up serpents... it shall not hurt them* (Mark 16:18). It ain''t new — the seed of the woman treading on the serpent, and the day reserved for its ordeal, were spoken from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 93525
  FROM _session415_adam82_lookup sv, _session415_adam82_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=82 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=82 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-82-avaunt-from-the-image-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* Seth''s word that drives the accursed enemy from the presence of the image is the fall of the adversary the Messiah declares.'
  FROM cross_reference_threads t, cross_references x, _session415_adam82_lookup sv, _session415_adam82_lookup tv
 WHERE t.slug='adam-eve-82-avaunt-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=82 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* Seth bidding the serpent avaunt, and leaving its bite unharmed, is the authority over the serpent the Messiah grants His own.'
  FROM cross_reference_threads t, cross_references x, _session415_adam82_lookup sv, _session415_adam82_lookup tv
 WHERE t.slug='adam-eve-82-avaunt-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=82 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 16:18 — *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* Seth, bitten by the beast yet unhurt as he commands it away, prefigures the promise that the serpent''s bite shall not hurt the servants of the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session415_adam82_lookup sv, _session415_adam82_lookup tv
 WHERE t.slug='adam-eve-82-avaunt-from-the-image-of-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=82 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_85.sql (session415 adam-eve 85) -----
-- Source anchor: pseudepigrapha/adam-eve ch85. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam85 (view _session415_adam85_lookup). Sort band base 93600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam85_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-85-king-messiah-son-of-elohim-baptized
  ('pseudepigrapha', 'adam-eve', 85, 2, 'canon', 'daniel', 9, 25, 'free', E'Daniel 9:25 — *Know therefore and understand, that from the going forth of the commandment to restore and to build Jerusalem unto the Messiah the Prince shall be seven weeks, and threescore and two weeks: the street shall be built again, and the wall, even in troublous times.* The fixed reckoning of years to the coming king Messiah matches Daniel''s numbered weeks unto the Messiah the Prince.'),
  ('pseudepigrapha', 'adam-eve', 85, 2, 'canon', 'daniel', 9, 24, 'free', E'Daniel 9:24 — *Seventy weeks are determined upon thy people and upon thy holy city, to finish the transgression, and to make an end of sins, and to make reconciliation for iniquity, and to bring in everlasting righteousness, and to seal up the vision and prophecy, and to anoint the most Holy.* The Messiah sent at the appointed end to make reconciliation is the anointed Holy One Daniel''s seventy weeks await.'),
  ('pseudepigrapha', 'adam-eve', 85, 2, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The Son of Elohim who comes to revive Adam''s body is the wounded servant by whose stripes healing comes.'),
  ('pseudepigrapha', 'adam-eve', 85, 2, 'canon', 'isaiah', 53, 11, 'free', E'Isaiah 53:11 — *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* The Messiah who revives the bodies of the dead is the righteous servant who, having borne iniquities, justifies many.'),
  ('pseudepigrapha', 'adam-eve', 85, 3, 'canon', 'matthew', 3, 16, 'free', E'Matthew 3:16 — *And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him:* the Son of Elohim baptized in Jordan, coming up out of the water, is fulfilled to the letter at His baptism, the Spirit descending as the oil of mercy.'),
  ('pseudepigrapha', 'adam-eve', 85, 3, 'canon', 'matthew', 3, 17, 'free', E'Matthew 3:17 — *And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* The most beloved Son whom Michael foretells is owned by the Father''s own voice at the Jordan — sent by the Father, not co-equal but His beloved.'),
  ('pseudepigrapha', 'adam-eve', 85, 3, 'canon', 'mark', 1, 9, 'free', E'Mark 1:9 — *And it came to pass in those days, that Yahusha (Jesus) came from Nazareth of Galilee, and was baptized of John in Jordan.* The prophecy that the Son will be baptized in the river of Jordan is met in the very place named, the Jordan.'),
  ('pseudepigrapha', 'adam-eve', 85, 3, 'canon', 'mark', 1, 11, 'free', E'Mark 1:11 — *And there came a voice from heaven, saying, Thou art my beloved Son, in whom I am well pleased.* The Father''s word over the baptized Son confirms the title Michael gives Him, the most beloved Son of Elohim.'),
  ('pseudepigrapha', 'adam-eve', 85, 2, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The Messiah who comes to revive the body of Adam and with him the bodies of the dead is the second Adam by whom all are made alive.'),
  ('pseudepigrapha', 'adam-eve', 85, 2, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* the reviving of the bodies of the dead is the resurrection hour the Son announces, when all in the graves hear His voice.'),
  ('pseudepigrapha', 'adam-eve', 85, 2, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The Messiah raising Adam and the dead is the same Son before whom all come forth to the resurrection.'),
  -- thread: adam-eve-85-oil-of-mercy-born-again-of-water-and-the-ruach
  ('pseudepigrapha', 'adam-eve', 85, 5, 'canon', 'john', 3, 5, 'free', E'John 3:5 — *Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God).* The promise of being born again of water and the Ruach HaKodesh to life eternal is the Messiah''s own words to the letter — born of water and of the Spirit.'),
  ('pseudepigrapha', 'adam-eve', 85, 3, 'canon', 'isaiah', 61, 1, 'free', E'Isaiah 61:1 — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted...* the Messiah anointing from the oil of mercy all that believe is the prophet''s anointing, the Spirit upon Him to bind up the broken.'),
  ('pseudepigrapha', 'adam-eve', 85, 4, 'canon', 'isaiah', 61, 3, 'free', E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness;* the oil of mercy given generation to generation is the oil of joy the prophet pours on them that mourn.'),
  ('pseudepigrapha', 'adam-eve', 85, 5, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *...was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Messiah leading Adam to the tree of mercy is the tree of life John saw restored, its leaves for the healing of the nations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam85_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam85_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-85-king-messiah-son-of-elohim-baptized',
       E'The most beloved king Messiah, the Son of Elohim',
       E'Michael answers that the oil of mercy cannot be had now, but only at the appointed end, in the One the Father will send: *then will come upon earth the most beloved king Messiah (Christ), the son of Elohim (God), to revive the body of Adam and with him to revive the bodies of the dead* (Adam & Eve 85:2); *He Himself, the Son of Elohim (God), when He comes will be baptized in the river of Jordan* (Adam & Eve 85:3). This is the deliverer Daniel set a reckoning to — *unto the Messiah the Prince* (Daniel 9:25), *to anoint the most Holy* (Daniel 9:24) — the servant *bruised for our iniquities... with his stripes we are healed* (Isaiah 53:5), who at Jordan is owned aloud by the Father: *This is my beloved Son, in whom I am well pleased* (Matthew 3:17). He is the second Adam who undoes the first man''s death: *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). It ain''t new — the beloved Son, sent by the Father to raise Adam''s body, is the Messiah the prophets numbered and the apostles beheld at the Jordan.',
       sv.verse_id, ev.verse_id, 'extras', 93600
  FROM _session415_adam85_lookup sv, _session415_adam85_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=85 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-85-oil-of-mercy-born-again-of-water-and-the-ruach',
       E'The oil of mercy — born again of water and the Ruach HaKodesh',
       E'Michael unfolds what the oil of mercy is and to whom it comes: *when He hath come out of the water of Jordan, then He will anoint from the oil of mercy all that believe in Him. And the oil of mercy shall be for generation to generation for those who are ready to be born again of water and the Ruach HaKodesh (Holy Spirit) to life eternal* (Adam & Eve 85:3-5). This is the prophet''s anointing carried to its end — *Yahuah (LORD) hath anointed me to preach good tidings... the oil of joy for mourning* (Isaiah 61:1,3) — and the very phrase the Messiah Himself uses: *Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5). The tree of His mercy yields at last the healing once denied Adam: *the leaves of the tree were for the healing of the nations* (Revelation 22:2). It ain''t new — the mercy deferred to Adam is poured out as the Spirit on all who believe, the new birth of water and the Ruach unto life eternal.',
       sv.verse_id, ev.verse_id, 'extras', 93603
  FROM _session415_adam85_lookup sv, _session415_adam85_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=85 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-85-king-messiah-son-of-elohim-baptized
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:25 — *Know therefore and understand, that from the going forth of the commandment to restore and to build Jerusalem unto the Messiah the Prince shall be seven weeks, and threescore and two weeks: the street shall be built again, and the wall, even in troublous times.* The fixed reckoning of years to the coming king Messiah matches Daniel''s numbered weeks unto the Messiah the Prince.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:24 — *Seventy weeks are determined upon thy people and upon thy holy city, to finish the transgression, and to make an end of sins, and to make reconciliation for iniquity, and to bring in everlasting righteousness, and to seal up the vision and prophecy, and to anoint the most Holy.* The Messiah sent at the appointed end to make reconciliation is the anointed Holy One Daniel''s seventy weeks await.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The Son of Elohim who comes to revive Adam''s body is the wounded servant by whose stripes healing comes.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:11 — *He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* The Messiah who revives the bodies of the dead is the righteous servant who, having borne iniquities, justifies many.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 3:16 — *And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him:* the Son of Elohim baptized in Jordan, coming up out of the water, is fulfilled to the letter at His baptism, the Spirit descending as the oil of mercy.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 3:17 — *And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* The most beloved Son whom Michael foretells is owned by the Father''s own voice at the Jordan — sent by the Father, not co-equal but His beloved.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Mark 1:9 — *And it came to pass in those days, that Yahusha (Jesus) came from Nazareth of Galilee, and was baptized of John in Jordan.* The prophecy that the Son will be baptized in the river of Jordan is met in the very place named, the Jordan.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Mark 1:11 — *And there came a voice from heaven, saying, Thou art my beloved Son, in whom I am well pleased.* The Father''s word over the baptized Son confirms the title Michael gives Him, the most beloved Son of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The Messiah who comes to revive the body of Adam and with him the bodies of the dead is the second Adam by whom all are made alive.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* the reviving of the bodies of the dead is the resurrection hour the Son announces, when all in the graves hear His voice.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The Messiah raising Adam and the dead is the same Son before whom all come forth to the resurrection.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-king-messiah-son-of-elohim-baptized'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: adam-eve-85-oil-of-mercy-born-again-of-water-and-the-ruach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 3:5 — *Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God).* The promise of being born again of water and the Ruach HaKodesh to life eternal is the Messiah''s own words to the letter — born of water and of the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-oil-of-mercy-born-again-of-water-and-the-ruach'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:1 — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted...* the Messiah anointing from the oil of mercy all that believe is the prophet''s anointing, the Spirit upon Him to bind up the broken.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-oil-of-mercy-born-again-of-water-and-the-ruach'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness;* the oil of mercy given generation to generation is the oil of joy the prophet pours on them that mourn.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-oil-of-mercy-born-again-of-water-and-the-ruach'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:2 — *...was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Messiah leading Adam to the tree of mercy is the tree of life John saw restored, its leaves for the healing of the nations.'
  FROM cross_reference_threads t, cross_references x, _session415_adam85_lookup sv, _session415_adam85_lookup tv
 WHERE t.slug='adam-eve-85-oil-of-mercy-born-again-of-water-and-the-ruach'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=85 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_88.sql (session415 adam-eve 88) -----
-- Source anchor: pseudepigrapha/adam-eve ch88. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam88 (view _session415_adam88_lookup). Sort band base 93675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam88_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-88-nine-hundred-and-thirty-years
  ('pseudepigrapha', 'adam-eve', 88, 2, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* Adam''s own word that he is nine hundred and thirty years old, and his death, is the exact span and end Moses records.'),
  ('pseudepigrapha', 'adam-eve', 88, 3, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam giving up the ghost fulfils the sentence laid in Eden, the return of the man of dust to the ground.'),
  ('pseudepigrapha', 'adam-eve', 88, 3, 'canon', 'hebrews', 9, 27, 'free', E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment:* Adam''s death at the appointed hour is the appointment laid on all men, death once, and judgment after.'),
  ('pseudepigrapha', 'adam-eve', 88, 3, 'canon', 'joel', 2, 10, 'free', E'Joel 2:10 — *The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining:* the sun darkened at Adam''s death is the heavens veiling themselves as the prophet foretold for the day of Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam88_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam88_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-88-nine-hundred-and-thirty-years',
       E'Adam dies at nine hundred and thirty years',
       E'Six days after Michael''s word, Adam''s hour comes: *Behold, I am nine hundred and thirty years old, and if I die, bury me towards the sunrising* (Adam & Eve 88:2); *And it came to pass that when he had finished all his discourse, he gave up the ghost* (Adam & Eve 88:3). Moses set down the same span and the same end: *all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5) — the wage of the sentence in Eden, *for dust thou art, and unto dust shalt thou return* (Genesis 3:19). And the apostle draws the universal rule from it: *as it is appointed unto men once to die, but after this the judgment* (Hebrews 9:27). As he dies the sun is darkened, the cosmos veiling itself as the prophets foretold: *the sun and the moon shall be dark, and the stars shall withdraw their shining* (Joel 2:10). It ain''t new — Adam''s nine hundred and thirty years and his return to dust are written word for word in Moses.',
       sv.verse_id, ev.verse_id, 'extras', 93675
  FROM _session415_adam88_lookup sv, _session415_adam88_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=88 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=88 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-88-nine-hundred-and-thirty-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* Adam''s own word that he is nine hundred and thirty years old, and his death, is the exact span and end Moses records.'
  FROM cross_reference_threads t, cross_references x, _session415_adam88_lookup sv, _session415_adam88_lookup tv
 WHERE t.slug='adam-eve-88-nine-hundred-and-thirty-years'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=88 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam giving up the ghost fulfils the sentence laid in Eden, the return of the man of dust to the ground.'
  FROM cross_reference_threads t, cross_references x, _session415_adam88_lookup sv, _session415_adam88_lookup tv
 WHERE t.slug='adam-eve-88-nine-hundred-and-thirty-years'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=88 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment:* Adam''s death at the appointed hour is the appointment laid on all men, death once, and judgment after.'
  FROM cross_reference_threads t, cross_references x, _session415_adam88_lookup sv, _session415_adam88_lookup tv
 WHERE t.slug='adam-eve-88-nine-hundred-and-thirty-years'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=88 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joel 2:10 — *The earth shall quake before them; the heavens shall tremble: the sun and the moon shall be dark, and the stars shall withdraw their shining:* the sun darkened at Adam''s death is the heavens veiling themselves as the prophet foretold for the day of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session415_adam88_lookup sv, _session415_adam88_lookup tv
 WHERE t.slug='adam-eve-88-nine-hundred-and-thirty-years'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=88 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_91.sql (session415 adam-eve 91) -----
-- Source anchor: pseudepigrapha/adam-eve ch91. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam91 (view _session415_adam91_lookup). Sort band base 93750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam91_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-91-in-thy-charge-till-the-day-of-judgement
  ('pseudepigrapha', 'adam-eve', 91, 2, 'canon', '2-peter', 2, 9, 'free', E'2 Peter 2:9 — *Yahuah (Lord) knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished:* Adam being kept in Michael''s charge till the day of Judgement is the apostle''s word that Yahuah reserves men unto that day.'),
  ('pseudepigrapha', 'adam-eve', 91, 2, 'canon', 'daniel', 12, 13, 'free', E'Daniel 12:13 — *But go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days.* The promise to keep Adam till the last years, his sorrow turned to joy, is the rest and the standing in his lot at the end given to Daniel.'),
  ('pseudepigrapha', 'adam-eve', 91, 2, 'canon', 'job', 14, 14, 'free', E'Job 14:14 — *If a man die, shall he live again? all the days of my appointed time will I wait, till my change come.* Adam''s sorrow held until the last years, then turned to joy, answers Job''s waiting through the appointed time till the change come.'),
  ('pseudepigrapha', 'adam-eve', 91, 3, 'canon', 'revelation', 3, 21, 'free', E'Revelation 3:21 — *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne.* Adam seated on the throne of his supplanter is the overcomer''s seat the Messiah grants, even as He sits with the Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam91_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam91_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-91-in-thy-charge-till-the-day-of-judgement',
       E'In Michael''s charge till the day of Judgement',
       E'Yahuah hands Adam over to Michael with a promise sealed against the end: *Let him be in thy charge till the day of Judgement in punishment, till the last years when I will convert his sorrow into joy. Then shall he sit on the throne of him who hath been his supplanter* (Adam & Eve 91:2-3). The dead are kept, not lost — *Yahuah (Lord) knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment* (2 Peter 2:9) — and Daniel was given the same word of rest and a standing at the end: *thou shalt rest, and stand in thy lot at the end of the days* (Daniel 12:13). Job had asked the question this answers: *If a man die, shall he live again? all the days of my appointed time will I wait, till my change come* (Job 14:14). And Adam''s seat on his supplanter''s throne is the overcomer''s promise — *To him that overcometh will I grant to sit with me in my throne* (Revelation 3:21). It ain''t new — the keeping of the dead till the day of Judgement, the change for which the righteous wait, and the throne given to the redeemed, are the hope Moses and the prophets and the apostles all carry.',
       sv.verse_id, ev.verse_id, 'extras', 93750
  FROM _session415_adam91_lookup sv, _session415_adam91_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=91 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=91 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-91-in-thy-charge-till-the-day-of-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 2:9 — *Yahuah (Lord) knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished:* Adam being kept in Michael''s charge till the day of Judgement is the apostle''s word that Yahuah reserves men unto that day.'
  FROM cross_reference_threads t, cross_references x, _session415_adam91_lookup sv, _session415_adam91_lookup tv
 WHERE t.slug='adam-eve-91-in-thy-charge-till-the-day-of-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=91 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:13 — *But go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days.* The promise to keep Adam till the last years, his sorrow turned to joy, is the rest and the standing in his lot at the end given to Daniel.'
  FROM cross_reference_threads t, cross_references x, _session415_adam91_lookup sv, _session415_adam91_lookup tv
 WHERE t.slug='adam-eve-91-in-thy-charge-till-the-day-of-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=91 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 14:14 — *If a man die, shall he live again? all the days of my appointed time will I wait, till my change come.* Adam''s sorrow held until the last years, then turned to joy, answers Job''s waiting through the appointed time till the change come.'
  FROM cross_reference_threads t, cross_references x, _session415_adam91_lookup sv, _session415_adam91_lookup tv
 WHERE t.slug='adam-eve-91-in-thy-charge-till-the-day-of-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=91 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 3:21 — *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne.* Adam seated on the throne of his supplanter is the overcomer''s seat the Messiah grants, even as He sits with the Father.'
  FROM cross_reference_threads t, cross_references x, _session415_adam91_lookup sv, _session415_adam91_lookup tv
 WHERE t.slug='adam-eve-91-in-thy-charge-till-the-day-of-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=91 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_92.sql (session415 adam-eve 92) -----
-- Source anchor: pseudepigrapha/adam-eve ch92. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam92 (view _session415_adam92_lookup). Sort band base 93775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam92_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-92-first-by-water-then-by-fire
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', '2-peter', 3, 6, 'free', E'2 Peter 3:6 — *Whereby the world that then was, being overflowed with water, perished.* The first of Eve''s two judgements — the race judged by water — is the apostle''s overflowed world that perished in the flood.'),
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', '2-peter', 3, 7, 'free', E'2 Peter 3:7 — *But the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment and perdition of ungodly men.* The second judgement Eve names — by fire — is Peter''s earth reserved unto fire against the day of judgment, the exact water-then-fire pairing.'),
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The first stroke Eve foretells — the whole race judged — is the flood verdict spoken over Adam''s children.'),
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* The judgement first by water is the flood of waters that destroys all flesh — Eve''s word made fact.'),
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', 'isaiah', 66, 15, 'free', E'Isaiah 66:15 — *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* Eve''s second judgement — by fire — is Isaiah''s day when Yahuah comes with fire to render his anger.'),
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', 'isaiah', 66, 16, 'free', E'Isaiah 66:16 — *For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many.* By fire Yahuah pleads with all flesh — the whole human race judged by fire, the second of the two Eve names.'),
  -- thread: adam-eve-92-as-the-days-of-noah
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', 'matthew', 24, 37, 'free', E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* The judgement Eve foretells by water is the flood the Messiah holds up as the figure of His coming — the days of Noah.'),
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', 'matthew', 24, 38, 'free', E'Matthew 24:38 — *For as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark.* The careless race before the flood is the same race Eve warns will be judged — unwarned till the waters come.'),
  ('pseudepigrapha', 'adam-eve', 92, 3, 'canon', 'matthew', 24, 39, 'free', E'Matthew 24:39 — *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be.* The flood that took them all away is the first judgement Eve names — and the Messiah''s seal that the second will come the same way.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam92_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam92_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-92-first-by-water-then-by-fire',
       E'First by water, the second time by fire',
       E'Dying Eve hands her children the word Michael gave at the Fall: *On account of your transgression, Our Lord will bring upon your race the anger of his judgement, first by water, the second time by fire; by these two, will Yahuah (Lord) judge the whole human race* (Adam & Eve 92:3). The first stroke fell in the flood, when Yahuah said *I will destroy man whom I have created from the face of the earth* (Genesis 6:7) and *I, even I, do bring a flood of waters upon the earth, to destroy all flesh* (Genesis 6:17). Peter sets the two judgements side by side as one apostolic word: *the world that then was, being overflowed with water, perished* (2 Peter 3:6), *but the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment* (2 Peter 3:7). And Isaiah saw the second: *behold, Yahuah (LORD) will come with fire... For by fire and by his sword will Yahuah (LORD) plead with all flesh* (Isaiah 66:15-16). It ain''t new — the water that drowned the old world and the fire reserved for the day of judgement are one verdict, spoken to Eve and sealed by the apostle.',
       sv.verse_id, ev.verse_id, 'extras', 93775
  FROM _session415_adam92_lookup sv, _session415_adam92_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=92 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-92-as-the-days-of-noah',
       E'As the days of Noah — the race judged in the flood',
       E'The judgement Eve receives from Michael — *Our Lord will bring upon your race the anger of his judgement, first by water* (Adam & Eve 92:3) — is the very pattern the Messiah set before His disciples for the end: *But as the days of Noe were, so shall also the coming of the Son of Adam be* (Matthew 24:37), *For as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38), and *knew not until the flood came, and took them all away* (Matthew 24:39). The flood that answered the first transgression becomes the figure of the last reckoning. It ain''t new — the water-judgement spoken to Eve is the Messiah''s own warning of the day that comes upon all.',
       sv.verse_id, ev.verse_id, 'extras', 93778
  FROM _session415_adam92_lookup sv, _session415_adam92_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=92 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-92-first-by-water-then-by-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 3:6 — *Whereby the world that then was, being overflowed with water, perished.* The first of Eve''s two judgements — the race judged by water — is the apostle''s overflowed world that perished in the flood.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-first-by-water-then-by-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:7 — *But the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment and perdition of ungodly men.* The second judgement Eve names — by fire — is Peter''s earth reserved unto fire against the day of judgment, the exact water-then-fire pairing.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-first-by-water-then-by-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The first stroke Eve foretells — the whole race judged — is the flood verdict spoken over Adam''s children.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-first-by-water-then-by-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* The judgement first by water is the flood of waters that destroys all flesh — Eve''s word made fact.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-first-by-water-then-by-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 66:15 — *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* Eve''s second judgement — by fire — is Isaiah''s day when Yahuah comes with fire to render his anger.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-first-by-water-then-by-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 66:16 — *For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many.* By fire Yahuah pleads with all flesh — the whole human race judged by fire, the second of the two Eve names.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-first-by-water-then-by-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: adam-eve-92-as-the-days-of-noah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* The judgement Eve foretells by water is the flood the Messiah holds up as the figure of His coming — the days of Noah.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-as-the-days-of-noah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:38 — *For as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark.* The careless race before the flood is the same race Eve warns will be judged — unwarned till the waters come.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-as-the-days-of-noah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:39 — *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be.* The flood that took them all away is the first judgement Eve names — and the Messiah''s seal that the second will come the same way.'
  FROM cross_reference_threads t, cross_references x, _session415_adam92_lookup sv, _session415_adam92_lookup tv
 WHERE t.slug='adam-eve-92-as-the-days-of-noah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=92 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_93.sql (session415 adam-eve 93) -----
-- Source anchor: pseudepigrapha/adam-eve ch93. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam93 (view _session415_adam93_lookup). Sort band base 93800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam93_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-93-tables-of-stone-and-clay
  ('pseudepigrapha', 'adam-eve', 93, 1, 'canon', 'job', 19, 23, 'free', E'Job 19:23 — *Oh that my words were now written! oh that they were printed in a book!* Eve''s charge to write all her life on tables is Job''s cry that his words be set down to outlast him.'),
  ('pseudepigrapha', 'adam-eve', 93, 2, 'canon', 'job', 19, 24, 'free', E'Job 19:24 — *That they were graven with an iron pen and lead in the rock for ever!* The tables of stone that remain when the clay dissolves are Job''s words graven in the rock for ever — a witness no judgement can erase.'),
  ('pseudepigrapha', 'adam-eve', 93, 1, 'canon', 'exodus', 31, 18, 'free', E'Exodus 31:18 — *And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God).* The tables of stone Eve commands echo the two tables of testimony at Sinai — the abiding written witness in stone.'),
  ('pseudepigrapha', 'adam-eve', 93, 2, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The antediluvian testimony did survive the flood — Enoch''s prophecy, preserved and quoted by the apostle, is the very record Eve sought to keep.'),
  ('pseudepigrapha', 'adam-eve', 93, 1, 'jubilees', 'jubilees', 4, 17, 'free', E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven... And he was the first to write a testimony.* Enoch the first writer is the pattern of Eve''s charge — the antediluvian life set down in a testimony that outlasts the generations.'),
  ('pseudepigrapha', 'adam-eve', 93, 2, 'jubilees', 'jubilees', 4, 24, 'free', E'Jubilees 4:24 — *And on account of it Elohim (God) brought the waters of the flood upon all the land of Eden; for there he was set as a sign and that he should testify against all the children of men, that he should recount all the deeds of the generations until the day of condemnation.* The written record carried through the flood-waters is the very thing Eve plans against the judgement by water.'),
  ('pseudepigrapha', 'adam-eve', 93, 1, 'jasher', 'jasher', 1, 1, 'free', E'Jasher 1:1 — *And Elohim (God) said, Let us make man in our image, after our likeness, and Elohim created man in his own image.* The antediluvian chronicle itself — the life of Adam and Eve recounted from the forming — is the kind of record Eve commands her children to engrave and preserve.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam93_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam93_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-93-tables-of-stone-and-clay',
       E'Tables of stone and clay — that the record outlast water or fire',
       E'Eve''s last charge is to set the record beyond the reach of either judgement: *Make ye then tables of stone and others of clay, and write on them, all my life and your father''s... If by water Yahuah (Lord) judge our race, the tables of clay will be dissolved and the tables of stone will remain; but if by fire, the tables of stone will be broken up and the tables of clay will be baked (hard)* (Adam & Eve 93:1-2). Job longed for the same imperishable witness: *Oh that my words were now written! oh that they were printed in a book!* (Job 19:23), *That they were graven with an iron pen and lead in the rock for ever!* (Job 19:24). The pattern of the stone tablet, written by Elohim''s own hand, comes at Sinai: *two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18). And the antediluvian word did survive — Enoch''s prophecy was carried through the flood and quoted by the apostle: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). It ain''t new — graving the testimony in stone that it outlast the day of judgement is Job''s longing, Sinai''s pattern, and the preserved word of Enoch.',
       sv.verse_id, ev.verse_id, 'extras', 93800
  FROM _session415_adam93_lookup sv, _session415_adam93_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=93 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-93-tables-of-stone-and-clay
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 19:23 — *Oh that my words were now written! oh that they were printed in a book!* Eve''s charge to write all her life on tables is Job''s cry that his words be set down to outlast him.'
  FROM cross_reference_threads t, cross_references x, _session415_adam93_lookup sv, _session415_adam93_lookup tv
 WHERE t.slug='adam-eve-93-tables-of-stone-and-clay'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 19:24 — *That they were graven with an iron pen and lead in the rock for ever!* The tables of stone that remain when the clay dissolves are Job''s words graven in the rock for ever — a witness no judgement can erase.'
  FROM cross_reference_threads t, cross_references x, _session415_adam93_lookup sv, _session415_adam93_lookup tv
 WHERE t.slug='adam-eve-93-tables-of-stone-and-clay'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 31:18 — *And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God).* The tables of stone Eve commands echo the two tables of testimony at Sinai — the abiding written witness in stone.'
  FROM cross_reference_threads t, cross_references x, _session415_adam93_lookup sv, _session415_adam93_lookup tv
 WHERE t.slug='adam-eve-93-tables-of-stone-and-clay'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The antediluvian testimony did survive the flood — Enoch''s prophecy, preserved and quoted by the apostle, is the very record Eve sought to keep.'
  FROM cross_reference_threads t, cross_references x, _session415_adam93_lookup sv, _session415_adam93_lookup tv
 WHERE t.slug='adam-eve-93-tables-of-stone-and-clay'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven... And he was the first to write a testimony.* Enoch the first writer is the pattern of Eve''s charge — the antediluvian life set down in a testimony that outlasts the generations.'
  FROM cross_reference_threads t, cross_references x, _session415_adam93_lookup sv, _session415_adam93_lookup tv
 WHERE t.slug='adam-eve-93-tables-of-stone-and-clay'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 4:24 — *And on account of it Elohim (God) brought the waters of the flood upon all the land of Eden; for there he was set as a sign and that he should testify against all the children of men, that he should recount all the deeds of the generations until the day of condemnation.* The written record carried through the flood-waters is the very thing Eve plans against the judgement by water.'
  FROM cross_reference_threads t, cross_references x, _session415_adam93_lookup sv, _session415_adam93_lookup tv
 WHERE t.slug='adam-eve-93-tables-of-stone-and-clay'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Jasher 1:1 — *And Elohim (God) said, Let us make man in our image, after our likeness, and Elohim created man in his own image.* The antediluvian chronicle itself — the life of Adam and Eve recounted from the forming — is the kind of record Eve commands her children to engrave and preserve.'
  FROM cross_reference_threads t, cross_references x, _session415_adam93_lookup sv, _session415_adam93_lookup tv
 WHERE t.slug='adam-eve-93-tables-of-stone-and-clay'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=93 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_adameve_94.sql (session415 adam-eve 94) -----
-- Source anchor: pseudepigrapha/adam-eve ch94. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: adam94 (view _session415_adam94_lookup). Sort band base 93825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session415_adam94_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: adam-eve-94-seventh-day-sign-of-the-resurrection
  ('pseudepigrapha', 'adam-eve', 94, 2, 'canon', 'genesis', 2, 2, 'free', E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Michael''s word — on the seventh day Yahuah rested from all His works — is the creation rest itself, the ground of the sign.'),
  ('pseudepigrapha', 'adam-eve', 94, 2, 'canon', 'genesis', 2, 3, 'free', E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* The day Michael names the sign of resurrection is the blessed and sanctified seventh day, set apart at the first.'),
  ('pseudepigrapha', 'adam-eve', 94, 2, 'canon', 'exodus', 20, 11, 'free', E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The fourth word grounds the very rest Michael invokes — six days of labour, the seventh hallowed as a sign.'),
  ('pseudepigrapha', 'adam-eve', 94, 2, 'canon', 'hebrews', 4, 9, 'free', E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* The rest of the age to come Michael foretells is the apostle''s remaining Sabbath-rest still kept for the people of Elohim.'),
  ('pseudepigrapha', 'adam-eve', 94, 2, 'canon', 'hebrews', 4, 10, 'free', E'Hebrews 4:10 — *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his.* Entering the rest as Elohim rested on the seventh day is the resurrection-rest Michael reads into the day.'),
  ('pseudepigrapha', 'adam-eve', 94, 2, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The seventh day as the sign of the resurrection is the blessed rest of the dead in Yahuah — labour ended, the age to come begun.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session415_adam94_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session415_adam94_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'adam-eve-94-seventh-day-sign-of-the-resurrection',
       E'The seventh day — the sign of the resurrection and the rest to come',
       E'Michael closes the book by reading the seventh day as prophecy: *mourn not for thy dead more than six days, for on the seventh day is the sign of the resurrection and the rest of the age to come; on the seventh day Yahuah (Lord) rested from all His works* (Adam & Eve 94:2). The rest reaches back to creation — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day... And Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:2-3) — sealed in the fourth word: *for in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day* (Exodus 20:11). The apostle turns that finished rest into the still-promised rest of the age to come: *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9), *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). And the dead who die in faith enter it: *Blessed are the dead which die in Yahuah (Lord)... that they may rest from their labours* (Revelation 14:13). It ain''t new — the seventh-day rest of creation is the sign of the resurrection and the Sabbath rest still kept for the people of Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 93825
  FROM _session415_adam94_lookup sv, _session415_adam94_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=94 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='adam-eve' AND ev.chapter_number=94 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: adam-eve-94-seventh-day-sign-of-the-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Michael''s word — on the seventh day Yahuah rested from all His works — is the creation rest itself, the ground of the sign.'
  FROM cross_reference_threads t, cross_references x, _session415_adam94_lookup sv, _session415_adam94_lookup tv
 WHERE t.slug='adam-eve-94-seventh-day-sign-of-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* The day Michael names the sign of resurrection is the blessed and sanctified seventh day, set apart at the first.'
  FROM cross_reference_threads t, cross_references x, _session415_adam94_lookup sv, _session415_adam94_lookup tv
 WHERE t.slug='adam-eve-94-seventh-day-sign-of-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The fourth word grounds the very rest Michael invokes — six days of labour, the seventh hallowed as a sign.'
  FROM cross_reference_threads t, cross_references x, _session415_adam94_lookup sv, _session415_adam94_lookup tv
 WHERE t.slug='adam-eve-94-seventh-day-sign-of-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* The rest of the age to come Michael foretells is the apostle''s remaining Sabbath-rest still kept for the people of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session415_adam94_lookup sv, _session415_adam94_lookup tv
 WHERE t.slug='adam-eve-94-seventh-day-sign-of-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 4:10 — *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his.* Entering the rest as Elohim rested on the seventh day is the resurrection-rest Michael reads into the day.'
  FROM cross_reference_threads t, cross_references x, _session415_adam94_lookup sv, _session415_adam94_lookup tv
 WHERE t.slug='adam-eve-94-seventh-day-sign-of-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Revelation 14:13 — *Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The seventh day as the sign of the resurrection is the blessed rest of the dead in Yahuah — labour ended, the age to come begun.'
  FROM cross_reference_threads t, cross_references x, _session415_adam94_lookup sv, _session415_adam94_lookup tv
 WHERE t.slug='adam-eve-94-seventh-day-sign-of-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='adam-eve' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session415 — Adam & Eve cross-references complete.'
