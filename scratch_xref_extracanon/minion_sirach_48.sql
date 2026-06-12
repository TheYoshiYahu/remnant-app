-- ----- fragment: minion_ecclesiasticus_48.sql (session253 ecclesiasticus 48) -----
-- Source anchor: apocrypha/ecclesiasticus ch48. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir48 (view _session253_sir48_lookup). Sort band base 59475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir48_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-48-elias-fire-shut-heaven
  ('apocrypha', 'ecclesiasticus', 48, 3, 'canon', '1-kings', 18, 38, 'free', E'1 Kings 18:38 — *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench.* This is the fire Ben Sira praises when he says Elias *also three times brought down fire* in Sirach 48:3.'),
  ('apocrypha', 'ecclesiasticus', 48, 1, 'canon', '1-kings', 18, 37, 'free', E'1 Kings 18:37 — *Hear me, O Yahuah (LORD), hear me, that this people may know that thou art Yahuah Elohim (the LORD God), and that thou hast turned their heart back again.* Elijah''s burning word, the lamp of Sirach 48:1, is the prayer that turns the people''s heart back at Carmel.'),
  -- thread: sirach-48-elias-raised-the-dead
  ('apocrypha', 'ecclesiasticus', 48, 5, 'canon', '1-kings', 17, 21, 'free', E'1 Kings 17:21 — *And he stretched himself upon the child three times, and cried unto Yahuah (LORD), and said, O Yahuah (LORD) my Elohim (God), I pray thee, let this child''s soul come into him again.* This is the raising Ben Sira praises in Sirach 48:5, the dead man''s soul called back from the place of the dead.'),
  ('apocrypha', 'ecclesiasticus', 48, 5, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The widow''s son raised by Elijah in Sirach 48:5 is named among the great cloud of the faith who tasted the resurrection.'),
  -- thread: sirach-48-elias-whirlwind-restore-tribes
  ('apocrypha', 'ecclesiasticus', 48, 9, 'canon', '2-kings', 2, 11, 'free', E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* This is the very whirlwind and chariot of fiery horses Ben Sira describes in Sirach 48:9.'),
  ('apocrypha', 'ecclesiasticus', 48, 10, 'canon', 'malachi', 4, 5, 'free', E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* Sirach 48:10''s Elias ''ordained for reproofs in their times... before it brake forth into fury'' is Malachi''s Elijah sent ahead of the dreadful day.'),
  ('apocrypha', 'ecclesiasticus', 48, 10, 'canon', 'malachi', 4, 6, 'free', E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* Ben Sira quotes this very turning of the heart ''of the father to the son'' in Sirach 48:10.'),
  ('apocrypha', 'ecclesiasticus', 48, 10, 'canon', 'matthew', 17, 11, 'free', E'Matthew 17:11 — *And Yahusha (Jesus) answered and said unto them, Elias truly shall first come, and restore all things.* The Messiah affirms the Elijah-restoration Sirach 48:10 looks for: to restore the tribes of Jacob.'),
  ('apocrypha', 'ecclesiasticus', 48, 10, 'canon', 'luke', 1, 17, 'free', E'Luke 1:17 — *And he shall go before him in the spirit and power of Elias, to turn the hearts of the fathers to the children, and the disobedient to the wisdom of the just; to make ready a people prepared for Yahuah (Lord).* The Elias-spirit that turns the fathers'' hearts in Sirach 48:10 rests on the forerunner who prepares the gathered people.'),
  -- thread: sirach-48-eliseus-double-portion-wonders-in-death
  ('apocrypha', 'ecclesiasticus', 48, 12, 'canon', '2-kings', 2, 9, 'free', E'2 Kings 2:9 — *And it came to pass, when they were gone over, that Elijah said unto Elisha, Ask what I shall do for thee, before I be taken away from thee. And Elisha said, I pray thee, let a double portion of thy spirit be upon me.* This is the spirit of Elijah that filled Eliseus in Sirach 48:12.'),
  ('apocrypha', 'ecclesiasticus', 48, 14, 'canon', '2-kings', 13, 21, 'free', E'2 Kings 13:21 — *And it came to pass, as they were burying a man, that, behold, they spied a band of men; and they cast the man into the sepulchre of Elisha: and when the man was let down, and touched the bones of Elisha, he revived, and stood up on his feet.* This is the marvel at his death that Ben Sira praises in Sirach 48:14 — his very bones gave life.'),
  -- thread: sirach-48-ezekias-fortified-the-city
  ('apocrypha', 'ecclesiasticus', 48, 22, 'canon', '2-kings', 18, 5, 'free', E'2 Kings 18:5 — *He trusted in Yahuah Elohim (the LORD God) of Yashar''el (Israel); so that after him was none like him among all the kings of Yahudah (Judah), nor any that were before him.* This is the Ezekias who ''had done the thing that pleased Yahuah'' and ''was strong in the ways of David'' in Sirach 48:22.'),
  ('apocrypha', 'ecclesiasticus', 48, 18, 'canon', '2-kings', 18, 13, 'free', E'2 Kings 18:13 — *Now in the fourteenth year of king Hezekiah did Sennacherib king of Assyria come up against all the fenced cities of Yahudah (Judah), and took them.* This is the Sennacherib who ''came up... and lifted up his hand against Sion'' in Sirach 48:18.'),
  -- thread: sirach-48-the-angel-smote-the-assyrians
  ('apocrypha', 'ecclesiasticus', 48, 20, 'canon', '2-kings', 19, 19, 'free', E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* This is the crying out to merciful Yahuah that Sirach 48:20 says the Holy One heard out of heaven.'),
  ('apocrypha', 'ecclesiasticus', 48, 21, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* This is the angel that ''destroyed them'' and ''struck the host of the Assyrians'' in Sirach 48:21.'),
  -- thread: sirach-48-esay-sun-backward-saw-the-last-things
  ('apocrypha', 'ecclesiasticus', 48, 23, 'canon', '2-kings', 20, 11, 'free', E'2 Kings 20:11 — *And Isaiah the prophet cried unto Yahuah (LORD): and he brought the shadow ten degrees backward, by which it had gone down in the dial of Ahaz.* This is the sun going backward and the king''s life lengthened in Sirach 48:23, done at Isaiah''s word.'),
  ('apocrypha', 'ecclesiasticus', 48, 22, 'canon', 'isaiah', 1, 1, 'free', E'Isaiah 1:1 — *The vision of Isaiah the son of Amoz, which he saw concerning Yahudah (Judah) and Jerusalem in the days of Uzziah, Jotham, Ahaz, and Hezekiah, kings of Yahudah (Judah).* This is the Esay ''great and faithful in his vision'' of Sirach 48:22, the prophet of Hezekiah''s days.'),
  ('apocrypha', 'ecclesiasticus', 48, 24, 'canon', 'isaiah', 40, 1, 'free', E'Isaiah 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God).* This is the prophet''s comfort to ''them that mourned in Sion'' that Ben Sira praises in Sirach 48:24.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir48_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir48_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-48-elias-fire-shut-heaven',
       E'Elias stood up as fire — shut the heaven, called down fire',
       E'Ben Sira lifts up the Tishbite first of all the latter fathers: *Then stood up Elias the prophet as fire, and his word burned like a lamp* (Ecclesiasticus 48:1), *He brought a sore famine upon them, and by his zeal he diminished their number* (Ecclesiasticus 48:2), *By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire* (Ecclesiasticus 48:3). It ain''t new — this is the Carmel man drawn straight from the Tanakh, where Elijah prays and *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench* (1 Kings 18:38), the same prophet whose word turns the heart of the people, *that thou hast turned their heart back again* (1 Kings 18:37). The same library, the same fire-tongued witness.',
       sv.verse_id, ev.verse_id, 'extras', 59475
  FROM _session253_sir48_lookup sv, _session253_sir48_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=48 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-48-elias-raised-the-dead',
       E'Who raised a dead man from death',
       E'*Who did raise up a dead man from death, and his soul from the place of the dead, by the word of the Most High* (Ecclesiasticus 48:5). Ben Sira remembers Zarephath, where Elijah *stretched himself upon the child three times, and cried unto Yahuah (LORD), and said, O Yahuah (LORD) my Elohim (God), I pray thee, let this child''s soul come into him again* (1 Kings 17:21), and the child *revived* (1 Kings 17:22). The deuterocanon and the Tanakh hold one resurrection witness, which the writer to the Hebrews gathers up: *Women received their dead raised to life again* (Hebrews 11:35). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59478
  FROM _session253_sir48_lookup sv, _session253_sir48_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=48 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-48-elias-whirlwind-restore-tribes',
       E'Taken up in a whirlwind — to come again and restore the tribes',
       E'*Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Ecclesiasticus 48:9), *Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob* (Ecclesiasticus 48:10). This is Sinai-grammar at the seam of the ages. The Tanakh records the ascent — *Elijah went up by a whirlwind into heaven* (2 Kings 2:11) — and seals the promise of his return: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5), *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse* (Malachi 4:6). Yahusha the Messiah confirms it stands still future — *Elias truly shall first come, and restore all things* (Matthew 17:11) — and the angel says of John, *And he shall go before him in the spirit and power of Elias, to turn the hearts of the fathers to the children, and the disobedient to the wisdom of the just; to make ready a people prepared for Yahuah (Lord)* (Luke 1:17). The restoring of the tribes of Jacob — the gathering — is Ben Sira''s own word.',
       sv.verse_id, ev.verse_id, 'extras', 59481
  FROM _session253_sir48_lookup sv, _session253_sir48_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=48 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-48-eliseus-double-portion-wonders-in-death',
       E'Eliseus filled with his spirit — wonders even in death',
       E'*Elias it was, who was covered with a whirlwind: and Eliseus was filled with his spirit* (Ecclesiasticus 48:12); *He did wonders in his life, and at his death were his works marvellous* (Ecclesiasticus 48:14). The double portion is the Tanakh''s own granting: Elisha asks, *let a double portion of thy spirit be upon me* (2 Kings 2:9), and the wonder in death is recorded plainly — a dead man cast into the prophet''s grave *touched the bones of Elisha... revived, and stood up on his feet* (2 Kings 13:21). The marvel after death that Ben Sira praises is no new invention; it stands written.',
       sv.verse_id, ev.verse_id, 'extras', 59484
  FROM _session253_sir48_lookup sv, _session253_sir48_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=48 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-48-ezekias-fortified-the-city',
       E'Ezekias fortified Sion and trusted in Yahuah',
       E'*Ezekias fortified his city, and brought in water into the midst thereof: he digged the hard rock with iron, and made wells for waters* (Ecclesiasticus 48:17); *For Ezekias had done the thing that pleased Yahuah (God), and was strong in the ways of David his father* (Ecclesiasticus 48:22). The Tanakh''s testimony of him is identical: *He trusted in Yahuah Elohim (the LORD God) of Yashar''el (Israel); so that after him was none like him among all the kings of Yahudah (Judah)* (2 Kings 18:5), and when Sennacherib came (*Now in the fourteenth year of king Hezekiah did Sennacherib king of Assyria come up against all the fenced cities of Yahudah (Judah), and took them* — 2 Kings 18:13) the king who pleased Yahuah was the king who stood. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59487
  FROM _session253_sir48_lookup sv, _session253_sir48_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=48 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-48-the-angel-smote-the-assyrians',
       E'They called upon Yahuah — His angel destroyed the host',
       E'*But they called upon Yahuah (God) which is merciful, and stretched out their hands toward him: and immediately the Holy One heard them out of heaven, and delivered them by the ministry of Esay* (Ecclesiasticus 48:20); *He struck the host of the Assyrians, and his angel destroyed them* (Ecclesiasticus 48:21). The deliverance is the Tanakh''s, word for deed: Hezekiah prayed, *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand* (2 Kings 19:19), and *the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand* (2 Kings 19:35). Ben Sira''s angel-deliverance by the ministry of Isaiah is the same night of salvation.',
       sv.verse_id, ev.verse_id, 'extras', 59490
  FROM _session253_sir48_lookup sv, _session253_sir48_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=48 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-48-esay-sun-backward-saw-the-last-things',
       E'Esay — the sun went backward, and he saw the last things',
       E'*In his time the sun went backward, and he lengthened the king''s life* (Ecclesiasticus 48:23); *He saw by an excellent spirit what should come to pass at the last, and he comforted them that mourned in Sion* (Ecclesiasticus 48:24); *He shewed what should come to pass for ever, and secret things or ever they came* (Ecclesiasticus 48:25). The sign of the dial is the Tanakh''s: *And Isaiah the prophet cried unto Yahuah (LORD): and he brought the shadow ten degrees backward, by which it had gone down in the dial of Ahaz* (2 Kings 20:11), the prophet who said *I will add unto thy days fifteen years* (Isaiah 38:5). And the seer who comforts mourning Sion is the same whose scroll opens, *The vision of Isaiah the son of Amoz, which he saw concerning Yahudah (Judah) and Jerusalem... in the days of... Hezekiah* (Isaiah 1:1), and whose word of comfort is *Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1). It ain''t new — Ben Sira reads the last things in the great prophet''s own scroll.',
       sv.verse_id, ev.verse_id, 'extras', 59493
  FROM _session253_sir48_lookup sv, _session253_sir48_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=48 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-48-elias-fire-shut-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 18:38 — *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench.* This is the fire Ben Sira praises when he says Elias *also three times brought down fire* in Sirach 48:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-fire-shut-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 18:37 — *Hear me, O Yahuah (LORD), hear me, that this people may know that thou art Yahuah Elohim (the LORD God), and that thou hast turned their heart back again.* Elijah''s burning word, the lamp of Sirach 48:1, is the prayer that turns the people''s heart back at Carmel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-fire-shut-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-48-elias-raised-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 17:21 — *And he stretched himself upon the child three times, and cried unto Yahuah (LORD), and said, O Yahuah (LORD) my Elohim (God), I pray thee, let this child''s soul come into him again.* This is the raising Ben Sira praises in Sirach 48:5, the dead man''s soul called back from the place of the dead.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-raised-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The widow''s son raised by Elijah in Sirach 48:5 is named among the great cloud of the faith who tasted the resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-raised-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-48-elias-whirlwind-restore-tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 2:11 — *And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven.* This is the very whirlwind and chariot of fiery horses Ben Sira describes in Sirach 48:9.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-whirlwind-restore-tribes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:5 — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD):* Sirach 48:10''s Elias ''ordained for reproofs in their times... before it brake forth into fury'' is Malachi''s Elijah sent ahead of the dreadful day.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-whirlwind-restore-tribes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:6 — *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* Ben Sira quotes this very turning of the heart ''of the father to the son'' in Sirach 48:10.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-whirlwind-restore-tribes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 17:11 — *And Yahusha (Jesus) answered and said unto them, Elias truly shall first come, and restore all things.* The Messiah affirms the Elijah-restoration Sirach 48:10 looks for: to restore the tribes of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-whirlwind-restore-tribes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 1:17 — *And he shall go before him in the spirit and power of Elias, to turn the hearts of the fathers to the children, and the disobedient to the wisdom of the just; to make ready a people prepared for Yahuah (Lord).* The Elias-spirit that turns the fathers'' hearts in Sirach 48:10 rests on the forerunner who prepares the gathered people.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-elias-whirlwind-restore-tribes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-48-eliseus-double-portion-wonders-in-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 2:9 — *And it came to pass, when they were gone over, that Elijah said unto Elisha, Ask what I shall do for thee, before I be taken away from thee. And Elisha said, I pray thee, let a double portion of thy spirit be upon me.* This is the spirit of Elijah that filled Eliseus in Sirach 48:12.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-eliseus-double-portion-wonders-in-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 13:21 — *And it came to pass, as they were burying a man, that, behold, they spied a band of men; and they cast the man into the sepulchre of Elisha: and when the man was let down, and touched the bones of Elisha, he revived, and stood up on his feet.* This is the marvel at his death that Ben Sira praises in Sirach 48:14 — his very bones gave life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-eliseus-double-portion-wonders-in-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-48-ezekias-fortified-the-city
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 18:5 — *He trusted in Yahuah Elohim (the LORD God) of Yashar''el (Israel); so that after him was none like him among all the kings of Yahudah (Judah), nor any that were before him.* This is the Ezekias who ''had done the thing that pleased Yahuah'' and ''was strong in the ways of David'' in Sirach 48:22.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-ezekias-fortified-the-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 18:13 — *Now in the fourteenth year of king Hezekiah did Sennacherib king of Assyria come up against all the fenced cities of Yahudah (Judah), and took them.* This is the Sennacherib who ''came up... and lifted up his hand against Sion'' in Sirach 48:18.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-ezekias-fortified-the-city'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-48-the-angel-smote-the-assyrians
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* This is the crying out to merciful Yahuah that Sirach 48:20 says the Holy One heard out of heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-the-angel-smote-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* This is the angel that ''destroyed them'' and ''struck the host of the Assyrians'' in Sirach 48:21.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-the-angel-smote-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-48-esay-sun-backward-saw-the-last-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 20:11 — *And Isaiah the prophet cried unto Yahuah (LORD): and he brought the shadow ten degrees backward, by which it had gone down in the dial of Ahaz.* This is the sun going backward and the king''s life lengthened in Sirach 48:23, done at Isaiah''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-esay-sun-backward-saw-the-last-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 1:1 — *The vision of Isaiah the son of Amoz, which he saw concerning Yahudah (Judah) and Jerusalem in the days of Uzziah, Jotham, Ahaz, and Hezekiah, kings of Yahudah (Judah).* This is the Esay ''great and faithful in his vision'' of Sirach 48:22, the prophet of Hezekiah''s days.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-esay-sun-backward-saw-the-last-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God).* This is the prophet''s comfort to ''them that mourned in Sion'' that Ben Sira praises in Sirach 48:24.'
  FROM cross_reference_threads t, cross_references x, _session253_sir48_lookup sv, _session253_sir48_lookup tv
 WHERE t.slug='sirach-48-esay-sun-backward-saw-the-last-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=48 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

