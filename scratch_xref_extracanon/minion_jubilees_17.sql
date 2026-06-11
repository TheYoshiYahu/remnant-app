-- ----- fragment: minion_jubilees_17.sql (session251 jubilees 17) -----
-- Source anchor: jubilees/jubilees ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju17 (view _session251_ju17_lookup). Sort band base 53400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-17-weaning-feast
  ('jubilees', 'jubilees', 17, 1, 'canon', 'genesis', 21, 8, 'free', E'Genesis 21:8 — *And the child grew, and was weaned: and Abraham made a great feast the same day that Isaac was weaned.* Jubilees 17:1 retells the same weaning feast, only it pins it to the third month in the fifth week of the jubilee.'),
  -- thread: jubilees-17-cast-out-bondwoman-two-covenants
  ('jubilees', 'jubilees', 17, 4, 'canon', 'genesis', 21, 10, 'free', E'Genesis 21:10 — *Wherefore she said unto Abraham, Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Isaac.* Jubilees 17:4 carries Sarah''s words straight from this verse.'),
  ('jubilees', 'jubilees', 17, 6, 'canon', 'genesis', 21, 12, 'free', E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* The election of the line through Isaac, which Jubilees 17:6 repeats verbatim.'),
  ('jubilees', 'jubilees', 17, 4, 'canon', 'galatians', 4, 22, 'free', E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul builds the allegory of the covenants on the very two sons Jubilees 17 sets side by side.'),
  ('jubilees', 'jubilees', 17, 6, 'canon', 'galatians', 4, 30, 'free', E'Galatians 4:30 — *Nevertheless what saith the scripture? Cast out the bondwoman and her son: for the son of the bondwoman shall not be heir with the son of the freewoman.* Paul cites the casting-out of Jubilees 17:4-6 to mark off the seed born by promise.'),
  -- thread: jubilees-17-elohim-heard-the-lad
  ('jubilees', 'jubilees', 17, 11, 'canon', 'genesis', 21, 17, 'free', E'Genesis 21:17 — *And Elohim (God) heard the voice of the lad; and the angel of Elohim (God) called to Hagar out of heaven, and said unto her, What aileth thee, Hagar? fear not; for Elohim (God) hath heard the voice of the lad where he is.* Jubilees 17:11 gives the same angelic word, that Elohim has heard the lad.'),
  ('jubilees', 'jubilees', 17, 12, 'canon', 'genesis', 21, 20, 'free', E'Genesis 21:20 — *And Elohim (God) was with the lad; and he grew, and dwelt in the wilderness, and became an archer.* The same growth into an archer that Jubilees 17:12 records.'),
  ('jubilees', 'jubilees', 17, 7, 'canon', 'genesis', 16, 11, 'free', E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* Ishmael''s name means ''God hears'' — the hearing Jubilees 17:7-11 makes good when He spares the lad and promises him a nation.'),
  -- thread: jubilees-17-mastema-provokes-the-testing
  ('jubilees', 'jubilees', 17, 16, 'canon', 'job', 1, 6, 'free', E'Job 1:6 — *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* Mastema standing before Elohim in Jubilees 17:16 is the same heavenly-court accuser who provokes the testing.'),
  ('jubilees', 'jubilees', 17, 16, 'canon', 'job', 1, 9, 'free', E'Job 1:9 — *Then Satan answered Yahuah (LORD), and said, Doth Job fear Elohim (God) for nought?* The accuser''s dare — prove the love is real — is exactly Mastema''s challenge over Abraham in Jubilees 17:16.'),
  ('jubilees', 'jubilees', 17, 16, 'canon', 'genesis', 22, 1, 'free', E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* The testing Mastema asks for in Jubilees 17:16 becomes the binding of Isaac in Genesis 22.'),
  ('jubilees', 'jubilees', 17, 17, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son.* The faithfulness Jubilees 17:17 declares is the faith Hebrews names in the same trial.'),
  ('jubilees', 'jubilees', 17, 17, 'canon', 'james', 2, 21, 'free', E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* Jubilees 17 makes the same point Mastema forces: faith is proven faithful in the doing, not by claim alone.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-17-weaning-feast',
       E'Isaac weaned, the great banquet — it ain''t new',
       E'Jubilees dates the day: *And in the first year of the fifth week Isaac was weaned in this jubilee, and Abraham made a great banquet in the third month, on the day his son Isaac was weaned.* (Jubilees 17:1). This is the Genesis scene set on the heavenly-tablet timeline — *And the child grew, and was weaned: and Abraham made a great feast the same day that Isaac was weaned.* (Genesis 21:8). And Abraham''s joy is not in the heir only but in seed at all upon the earth, the promise made good: *and he rejoiced because Yahuah (God) had given him seed upon the earth to inherit the earth, and he blessed with all his mouth the Creator of all things* (Jubilees 17:3). The retelling quotes Genesis and fixes the date — the same story, older than it looks.',
       sv.verse_id, ev.verse_id, 'extras', 53400
  FROM _session251_ju17_lookup sv, _session251_ju17_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=17 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-17-cast-out-bondwoman-two-covenants',
       E'Cast out the bondwoman — the allegory of the two covenants',
       E'Sarah''s demand stands in Jubilees almost word for word from Genesis: *Cast out this bondwoman and her son; for the son of this bondwoman will not be heir with my son, Isaac.* (Jubilees 17:4), and Elohim confirms the line of promise — *in all that Sarah has said to you, hearken to her words and do (them); for in Isaac shall your name and seed be called* (Jubilees 17:6). Genesis is the source: *Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Isaac* (Genesis 21:10), *for in Isaac shall thy seed be called* (Genesis 21:12). Paul reads this very household as the gospel: *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman* (Galatians 4:22), *Which things are an allegory: for these are the two covenants* (Galatians 4:24), and he quotes the casting-out itself — *Cast out the bondwoman and her son: for the son of the bondwoman shall not be heir with the son of the freewoman* (Galatians 4:30). The free seed is the seed kept, born by promise (cf. Jubilees 20, 22 on the seed kept separate from the nations).',
       sv.verse_id, ev.verse_id, 'extras', 53403
  FROM _session251_ju17_lookup sv, _session251_ju17_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=17 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-17-elohim-heard-the-lad',
       E'Elohim heard the voice of the lad — Ishmael a great nation',
       E'Hagar wanders, the water spent, and in Jubilees the angel speaks: *Why weep you, Hagar? Arise, take the child, and hold him in your hand; for Elohim (God) has heard your voice, and has seen the child.* (Jubilees 17:11), and the lad lives — *And the child grew and became an archer, and Elohim (God) was with him* (Jubilees 17:12). Genesis is the spring of it: *And Elohim (God) heard the voice of the lad; and the angel of Elohim (God) called to Hagar out of heaven... fear not; for Elohim (God) hath heard the voice of the lad where he is* (Genesis 21:17), *And Elohim (God) was with the lad; and he grew, and dwelt in the wilderness, and became an archer* (Genesis 21:20). And the promise that Ishmael becomes a nation reaches back to his naming, where hearing is already written into the name — *Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction* (Genesis 16:11). Even the cast-out son is kept of Abraham''s seed: *But as for the son of this bondwoman I will make him a great nation, because he is of your seed* (Jubilees 17:7).',
       sv.verse_id, ev.verse_id, 'extras', 53406
  FROM _session251_ju17_lookup sv, _session251_ju17_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=17 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-17-mastema-provokes-the-testing',
       E'Mastema provokes the testing — faith proven by works',
       E'Jubilees frames the binding of Isaac the way Job frames Job''s trial: heaven speaks of a faithful man, and the adversary stands up to provoke the test. *There were voices in heaven regarding Abraham, that he was faithful in all that He told him, and that he loved Yahuah (God), and that in every affliction he was faithful.* (Jubilees 17:16-anchor v14 in this parse), then — *And the prince Mastêmâ came and said before Elohim (God), ''Behold, Abraham loves Isaac his son... bid him offer him as a burnt-offering on the altar, and You will see if he will do this command, and You will know if he is faithful''* (Jubilees 17:16). This is the courtroom of Job: *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them* (Job 1:6); *Doth Job fear Elohim (God) for nought?* (Job 1:9). Yahuah needs no proof — *And Yahuah (God) knew that Abraham was faithful in all his afflictions* (Jubilees 17:17) — yet He lets the Akedah unfold (Jubilees 18, retelling Genesis 22) so the faith is shown in deed: *And it came to pass after these things, that Elohim (God) did tempt Abraham* (Genesis 22:1); *By faith Abraham, when he was tried, offered up Isaac* (Hebrews 11:17); *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21). The strife provokes, but Torah-faith stands — proven, not invented.',
       sv.verse_id, ev.verse_id, 'extras', 53409
  FROM _session251_ju17_lookup sv, _session251_ju17_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=17 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-17-weaning-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:8 — *And the child grew, and was weaned: and Abraham made a great feast the same day that Isaac was weaned.* Jubilees 17:1 retells the same weaning feast, only it pins it to the third month in the fifth week of the jubilee.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-weaning-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-17-cast-out-bondwoman-two-covenants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:10 — *Wherefore she said unto Abraham, Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Isaac.* Jubilees 17:4 carries Sarah''s words straight from this verse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-cast-out-bondwoman-two-covenants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* The election of the line through Isaac, which Jubilees 17:6 repeats verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-cast-out-bondwoman-two-covenants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul builds the allegory of the covenants on the very two sons Jubilees 17 sets side by side.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-cast-out-bondwoman-two-covenants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 4:30 — *Nevertheless what saith the scripture? Cast out the bondwoman and her son: for the son of the bondwoman shall not be heir with the son of the freewoman.* Paul cites the casting-out of Jubilees 17:4-6 to mark off the seed born by promise.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-cast-out-bondwoman-two-covenants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-17-elohim-heard-the-lad
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:17 — *And Elohim (God) heard the voice of the lad; and the angel of Elohim (God) called to Hagar out of heaven, and said unto her, What aileth thee, Hagar? fear not; for Elohim (God) hath heard the voice of the lad where he is.* Jubilees 17:11 gives the same angelic word, that Elohim has heard the lad.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-elohim-heard-the-lad'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 21:20 — *And Elohim (God) was with the lad; and he grew, and dwelt in the wilderness, and became an archer.* The same growth into an archer that Jubilees 17:12 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-elohim-heard-the-lad'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* Ishmael''s name means ''God hears'' — the hearing Jubilees 17:7-11 makes good when He spares the lad and promises him a nation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-elohim-heard-the-lad'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-17-mastema-provokes-the-testing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:6 — *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* Mastema standing before Elohim in Jubilees 17:16 is the same heavenly-court accuser who provokes the testing.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-mastema-provokes-the-testing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 1:9 — *Then Satan answered Yahuah (LORD), and said, Doth Job fear Elohim (God) for nought?* The accuser''s dare — prove the love is real — is exactly Mastema''s challenge over Abraham in Jubilees 17:16.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-mastema-provokes-the-testing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* The testing Mastema asks for in Jubilees 17:16 becomes the binding of Isaac in Genesis 22.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-mastema-provokes-the-testing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son.* The faithfulness Jubilees 17:17 declares is the faith Hebrews names in the same trial.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-mastema-provokes-the-testing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* Jubilees 17 makes the same point Mastema forces: faith is proven faithful in the doing, not by claim alone.'
  FROM cross_reference_threads t, cross_references x, _session251_ju17_lookup sv, _session251_ju17_lookup tv
 WHERE t.slug='jubilees-17-mastema-provokes-the-testing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

