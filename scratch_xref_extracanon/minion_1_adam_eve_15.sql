-- ----- fragment: minion_1adameve_15.sql (session253 1-adam-eve 15) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae15 (view _session253_1ae15_lookup). Sort band base 64350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-15-shut-out-until-the-days
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* This is the very expulsion 1-adam-eve 15:1 weeps over, the LORD''s word that they should not return to the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The flaming sword is why Adam and Eve in 1-adam-eve 15:1 may not return until the days decreed are fulfilled.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* — the fulfillment of the days decreed in 1-adam-eve 15:1 is the appointed coming of the seed of the woman.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The barred return of 1-adam-eve 15:1 ends here, when the way to the tree of life is opened again at the fulfillment of the days.'),
  -- thread: 1-adam-eve-15-he-should-suffer-for-their-salvation
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Elohim who in 1-adam-eve 15:1 told Adam He should suffer for their salvation is the eternal Word, the Logos who speaks with Adam outside the garden.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise of 1-adam-eve 15:1 — that Elohim should suffer — is kept when the Word takes flesh to suffer for our salvation.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* — Adam hears in 1-adam-eve 15:1 of a salvation already foreordained before the world, manifest only in the last times.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* — the same Elohim who spake to Adam in 1-adam-eve 15:1 with the word of His coming suffering.'),
  -- thread: 1-adam-eve-15-the-seed-promise-mercy
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The suffering Elohim foretold in 1-adam-eve 15:1 is the bruised heel of the woman''s seed crushing the serpent''s head.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The salvation Adam mourns over in 1-adam-eve 15:1 is exactly this — the Son manifested to suffer and undo the works of the serpent.'),
  ('adam-eve-conflict', '1-adam-eve', 15, 1, 'canon', '1-peter', 1, 19, 'free', E'1 Peter 1:19 — *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* — the suffering for salvation promised in 1-adam-eve 15:1 is purchased by the spotless blood of the Lamb.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-15-shut-out-until-the-days',
       E'Shut out of the garden until the days be fulfilled',
       E'*Then Adam and Eve cried and sorrowed by reason of Elohim''s (God''s) word to them, that they should not return to the garden until the fulfillment of the days decreed on them.* The first sorrow outside Eden is exile — the same drawn sword the LORD set behind them: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23), *and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). The way back to the tree of life is barred for a set season, until the days decreed are fulfilled — *but when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). And the return is sure at the end of the days: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). It ain''t new — the exile and the appointed homecoming are written from the very first day outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 64350
  FROM _session253_1ae15_lookup sv, _session253_1ae15_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=15 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-15-he-should-suffer-for-their-salvation',
       E'Elohim should suffer for their salvation — the Word foretold from the first day',
       E'*...but mostly because Elohim (God) had told them that He should suffer for their salvation.* On the first day outside Eden the Word Himself has already promised the cross. This is the Logos who spoke with Adam — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1) — the same Word who *was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The suffering Saviour was no afterthought but settled before the world began: *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20). The God who spake to Adam by His own voice spoke at last by the Son — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets, hath in these last days spoken unto us by his Son* (Hebrews 1:1-2). It ain''t new: the gospel of the suffering Messiah is preached to Adam on day one.',
       sv.verse_id, ev.verse_id, 'extras', 64353
  FROM _session253_1ae15_lookup sv, _session253_1ae15_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=15 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-15-the-seed-promise-mercy',
       E'The seed-war and the mercy that keeps the seed',
       E'Behind Adam''s tears in *Elohim (God) had told them that He should suffer for their salvation* stands the first gospel-word, the seed promise spoken in the garden itself: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The bruised heel is the suffering of the Saviour; its very purpose is the undoing of the serpent — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). And the price of that salvation is no corruptible thing but blood — *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). The suffering Elohim of 1-adam-eve 15:1 is the woman''s seed bruising the serpent''s head; the seed-war is opened on the first day, and so is the mercy that keeps the seed.',
       sv.verse_id, ev.verse_id, 'extras', 64356
  FROM _session253_1ae15_lookup sv, _session253_1ae15_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=15 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-15-shut-out-until-the-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* This is the very expulsion 1-adam-eve 15:1 weeps over, the LORD''s word that they should not return to the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-shut-out-until-the-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The flaming sword is why Adam and Eve in 1-adam-eve 15:1 may not return until the days decreed are fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-shut-out-until-the-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* — the fulfillment of the days decreed in 1-adam-eve 15:1 is the appointed coming of the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-shut-out-until-the-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The barred return of 1-adam-eve 15:1 ends here, when the way to the tree of life is opened again at the fulfillment of the days.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-shut-out-until-the-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-15-he-should-suffer-for-their-salvation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Elohim who in 1-adam-eve 15:1 told Adam He should suffer for their salvation is the eternal Word, the Logos who speaks with Adam outside the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-he-should-suffer-for-their-salvation'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The promise of 1-adam-eve 15:1 — that Elohim should suffer — is kept when the Word takes flesh to suffer for our salvation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-he-should-suffer-for-their-salvation'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* — Adam hears in 1-adam-eve 15:1 of a salvation already foreordained before the world, manifest only in the last times.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-he-should-suffer-for-their-salvation'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* — the same Elohim who spake to Adam in 1-adam-eve 15:1 with the word of His coming suffering.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-he-should-suffer-for-their-salvation'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-15-the-seed-promise-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The suffering Elohim foretold in 1-adam-eve 15:1 is the bruised heel of the woman''s seed crushing the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-the-seed-promise-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The salvation Adam mourns over in 1-adam-eve 15:1 is exactly this — the Son manifested to suffer and undo the works of the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-the-seed-promise-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:19 — *But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* — the suffering for salvation promised in 1-adam-eve 15:1 is purchased by the spotless blood of the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae15_lookup sv, _session253_1ae15_lookup tv
 WHERE t.slug='1-adam-eve-15-the-seed-promise-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

