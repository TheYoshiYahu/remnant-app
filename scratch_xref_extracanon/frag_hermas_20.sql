-- ----- fragment: minion_hermas_20.sql (session253 hermas 20) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm20 (view _session253_herm20_lookup). Sort band base 71975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-20-wheat-and-tares-grow-together
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 30, 'free', E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The righteous and the sinners dwelling alike in this world, indistinguishable, are the wheat and the tares the Master leaves growing together until the harvest.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 38, 'free', E'Matthew 13:38 — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one;* Hermas''s trees are ''they that dwell in this world,'' the very field the Master names where the children of the kingdom and the children of the wicked one stand together.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 29, 'free', E'Matthew 13:29 — *But he said, Nay; lest while ye gather up the tares, ye root up also the wheat with them.* That the just and the sinners cannot now be distinguished is why the householder forbids the early uprooting — wheat and tare look alike in the winter of this world.'),
  -- thread: hermas-20-one-event-to-righteous-and-wicked
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'ecclesiastes', 9, 2, 'free', E'Ecclesiastes 9:2 — *All things come alike to all: there is one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean; to him that sacrificeth, and to him that sacrificeth not: as is the good, so is the sinner; and he that sweareth, as he that feareth an oath.* The Shepherd''s word that the just and the sinners are not distinguishable in this world is the Preacher''s one event that comes alike to all under the sun.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'ecclesiastes', 9, 1, 'free', E'Ecclesiastes 9:1 — *For all this I considered in my heart even to declare all this, that the righteous, and the wise, and their works, are in the hand of Elohim (God): no man knoweth either love or hatred by all that is before them.* That none can now tell the withered tree from the living mirrors Qoheleth''s word that no man knows, by all that is before him, who stands in love and who in hatred — it is hidden in the hand of Elohim.'),
  -- thread: hermas-20-then-shall-ye-discern
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'malachi', 3, 18, 'free', E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The winter in which the just and the sinners cannot be told apart gives way to the very discerning Malachi promised — then, not now, shall the righteous be known from the wicked.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Though the righteous wither indistinguishably among the sinners now, a book of remembrance is already written for them — the wintered faithful are not forgotten.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The trees that look alike and withered in this world''s winter shall, at the harvest, be parted — and the righteous shall shine forth as the sun, no longer hidden among the tares.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-20-wheat-and-tares-grow-together',
       E'The trees in winter — wheat and tares grow together till the harvest',
       E'The Shepherd unfolds the third similitude: *He showed me many trees which had no leaves, but they seemed to me to be, as it were, withered ; for they were all alike... ‘These trees that thou seest are they that dwell in this world.’... ‘neither the righteous are distinguishable, nor the sinners in this world, but they are alike. For this world is winter to the righteous, and they are not distinguishable, as they dwell with the sinners.’* (Hermas 20:1) It ain''t new — the Master had already set the same picture in the field, the just and the lawless growing side by side until the reaping: *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* (Matthew 13:30) And He names the field as Hermas names the trees — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one* (Matthew 13:38). The wintered trees that none can tell apart are the wheat and the tares left standing together till the end of the age.',
       sv.verse_id, ev.verse_id, 'extras', 71975
  FROM _session253_herm20_lookup sv, _session253_herm20_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-20-one-event-to-righteous-and-wicked',
       E'One event to the righteous and the wicked — all alike under the sun',
       E'Why are the trees alike? *‘Because,’ saith he, ‘neither the righteous are distinguishable, nor the sinners in this world, but they are alike. For as in the winter the trees, having shed their leaves, are alike, and are not distinguishable, which are withered, and which alive, so also in this world neither the just nor the sinners are distinguishable, but they are all alike.’* (Hermas 20:1) It ain''t new — the Preacher saw the same riddle under the sun: *All things come alike to all: there is one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean... as is the good, so is the sinner* (Ecclesiastes 9:2). Even the wise man''s works, said Qoheleth, *are in the hand of Elohim (God): no man knoweth either love or hatred by all that is before them* (Ecclesiastes 9:1). The wintering of the righteous among the sinners, where outward lot cannot tell the living tree from the withered, is the old wisdom of the ages — the verdict waits.',
       sv.verse_id, ev.verse_id, 'extras', 71978
  FROM _session253_herm20_lookup sv, _session253_herm20_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-20-then-shall-ye-discern',
       E'Then shall ye discern — winter passes and the righteous are known',
       E'The whole point of the wintering is that it will not last: *For this world is winter to the righteous, and they are not distinguishable, as they dwell with the sinners.* (Hermas 20:1) The winter is THIS world only; a discerning is coming. It ain''t new — Malachi closed the matter long before: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* (Malachi 3:18) And the book of remembrance is already written for the wintering faithful: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him* (Malachi 3:16). When the harvest comes the Master''s word seals it — *Then shall the righteous shine forth as the sun in the kingdom of their Father* (Matthew 13:43). The trees indistinguishable in winter will be told apart in the day of jewels; the verdict only waits for the season.',
       sv.verse_id, ev.verse_id, 'extras', 71981
  FROM _session253_herm20_lookup sv, _session253_herm20_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-20-wheat-and-tares-grow-together
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The righteous and the sinners dwelling alike in this world, indistinguishable, are the wheat and the tares the Master leaves growing together until the harvest.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-wheat-and-tares-grow-together'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:38 — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one;* Hermas''s trees are ''they that dwell in this world,'' the very field the Master names where the children of the kingdom and the children of the wicked one stand together.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-wheat-and-tares-grow-together'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:29 — *But he said, Nay; lest while ye gather up the tares, ye root up also the wheat with them.* That the just and the sinners cannot now be distinguished is why the householder forbids the early uprooting — wheat and tare look alike in the winter of this world.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-wheat-and-tares-grow-together'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-20-one-event-to-righteous-and-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 9:2 — *All things come alike to all: there is one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean; to him that sacrificeth, and to him that sacrificeth not: as is the good, so is the sinner; and he that sweareth, as he that feareth an oath.* The Shepherd''s word that the just and the sinners are not distinguishable in this world is the Preacher''s one event that comes alike to all under the sun.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-one-event-to-righteous-and-wicked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 9:1 — *For all this I considered in my heart even to declare all this, that the righteous, and the wise, and their works, are in the hand of Elohim (God): no man knoweth either love or hatred by all that is before them.* That none can now tell the withered tree from the living mirrors Qoheleth''s word that no man knows, by all that is before him, who stands in love and who in hatred — it is hidden in the hand of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-one-event-to-righteous-and-wicked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-20-then-shall-ye-discern
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The winter in which the just and the sinners cannot be told apart gives way to the very discerning Malachi promised — then, not now, shall the righteous be known from the wicked.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-then-shall-ye-discern'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Though the righteous wither indistinguishably among the sinners now, a book of remembrance is already written for them — the wintered faithful are not forgotten.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-then-shall-ye-discern'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The trees that look alike and withered in this world''s winter shall, at the harvest, be parted — and the righteous shall shine forth as the sun, no longer hidden among the tares.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-then-shall-ye-discern'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

