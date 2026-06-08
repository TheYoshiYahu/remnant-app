-- =====================================================================
-- S212 extras-library cross-references — LUKE 16-19
-- Minion tag: l1619   Temp view: _s212_l1619_lookup
-- sort_order band: 3520-3549
-- =====================================================================
-- These are the MISSING outside-canon (extras-library) cross-references
-- for Luke 16-19. Mark/Luke/John carried ZERO extras member-rows; the
-- S185 Luke canon migration quoted some of these extras inside summary_md
-- (1 Enoch 22, Sirach 31, the days-of-Noach extras) but never inserted
-- them as edition-aware member rows. This fragment promotes those quoted-
-- but-unlinked extras into real cross_reference + thread_member rows, and
-- adds the framework-bearing gathering-of-the-tribes connection Luke 19:10
-- warrants. The SOURCE is always the canon Luke verse; the TARGET is the
-- extras verse; tier_required='extras'.
--
-- Canon coverage already present in S185 (NOT duplicated here): the
-- rich-man-and-Lazaros sheol thread (canon targets), the unjust-steward
-- thread (canon targets), the kingdom-of-Elohim-within thread, the
-- importunate-widow thread, the Pharisee-and-publican thread, the
-- days-of-Noach canon thread (Matthew parallels), and the Sirach-31
-- thread anchored at MATTHEW 6:24. This fragment ADDS the Luke-anchored
-- extras member-rows those threads were stripped of, under new slugs.
--
-- New threads (slug → target editions):
--   1. luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach
--        → apocrypha (Ecclesiasticus / Sirach 31)                  sort 3520
--   2. luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras
--        → enoch (1 Enoch 22), apocrypha (2 Esdras)                sort 3521
--   3. luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees
--        → enoch (1 Enoch 10), jubilees (Jubilees 5)               sort 3522
--   4. luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch
--        → apocrypha (Ecclesiasticus / Sirach 36), enoch (1 Enoch 90)  sort 3523
--
-- 14 cross_references rows; 14 thread_member rows; 4 threads.
-- Chapter 18 (importunate widow, Pharisee/publican, rich ruler, third
-- passion prediction, blind Bartimaeus): NO extras add. Every framework-
-- bearing extras connection Luke 18 surfaces — the post-harvest sifting
-- standing-question, the flesh-credential register, the woes-on-the-rich
-- (1 Enoch 94-100) — is already carried as a canon-anchored member of an
-- existing thread (`woes-on-the-rich-and-riches-cannot-save-in-1-enoch`,
-- `when-the-son-of-adam-cometh-...`) at the rigour the migration requires;
-- no NEW Luke-18-anchored extras thread clears the 12-point checklist
-- without duplicating an existing thread's target tuples.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

CREATE TEMP VIEW _s212_l1619_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id  = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ---------------------------------------------------------------------
-- A. Insert 11 extras-tier cross_references rows.
--    Source = canon Luke verse; target = extras verse.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach
  ('canon', 'luke', 16, 13, 'apocrypha', 'ecclesiasticus', 31, 5,
   E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Sirach / Ecclesiasticus 31:5). The Lukan placement seals the unjust-steward parable with the mammon-verdict: *Ye cannot serve Elohim (God) and mammon* (Luke 16:13). The wisdom-stream had already named the disqualification at the gold-love level — the gold-lover *shall not be justified.* The King names the same architecture as a forced-choice of masters: the divided heart that holds to mammon cannot stand justified before the Father whose service is whole-heart. The Lukan setting is distinct from the Sermon — here the verdict closes a steward-parable about deploying mammon shrewdly before the books are called.'),
  ('canon', 'luke', 16, 13, 'apocrypha', 'ecclesiasticus', 31, 6,
   E'*Gold has been the ruin of many, and their destruction was present* (Sirach 31:6). The wisdom-stream''s gold-as-ruin diagnostic stands behind Luke 16:13''s either/or. The mammon-servant at Luke 16:13 walks toward the same ruin the wisdom-stream had named; the steward of the parable just before (vv.1-8) is shrewd precisely because he treats mammon as the perishing thing it is, not the master.'),
  ('canon', 'luke', 16, 13, 'apocrypha', 'ecclesiasticus', 31, 7,
   E'*It is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it* (Sirach 31:7). The wisdom-stream identifies gold as an object of worship that captures its devotees — *them that sacrifice to it.* Luke 16:13''s *Ye cannot serve Elohim (God) and mammon* treats mammon as a competing master for exactly this reason: the wisdom-stream had already named gold as the master that takes those who sacrifice to it. To serve mammon is to sacrifice to the stumblingblock.'),

  -- Thread 2: luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras
  ('canon', 'luke', 16, 22, 'enoch', '1-enoch', 22, 9,
   E'*And there was in it four hollow places, deep and wide and very smooth. How smooth are the hollow places and deep and dark to look at* (1 Enoch 22:9). Enoch is shown the holding-places of the dead — distinct compartments hewn in the great mountain. Luke 16:22''s carrying of Lazaros *by the angels into Avraham''s (Abraham''s) bosom* while the rich man is *buried* and lifts his eyes in another place walks the same architecture the Hebrew library named: the dead are held in separated compartments pending the judgment, not annihilated into nothing and not dispatched to a final eternal destination.'),
  ('canon', 'luke', 16, 23, 'enoch', '1-enoch', 22, 10,
   E'*These hollow places have been created for this very purpose, that the spirits of the souls of the dead should assemble therein, yea that all the souls of the children of men should assemble here* (1 Enoch 22:10). The conscious-souls-of-the-dead-assembled register against the inherited soul-sleep misread. Luke 16:23''s rich man *in hell (hadēs) lift up his eyes, being in torments, and seeth Avraham (Abraham) afar off, and Lazaros in his bosom* assumes exactly this architecture — the spirits of the dead are gathered, aware, and identifiable, held in the hollow places the Hebrew library named.'),
  ('canon', 'luke', 16, 26, 'enoch', '1-enoch', 22, 11,
   E'*And these places have been made for them until the day of their judgement and until their appointed period, till the great judgement comes upon them* (1 Enoch 22:11). The hollow places are TEMPORAL — *until the day of their judgement.* This is the framework''s key against both inherited errors: sheol is real and conscious (against soul-sleep) AND it is a holding-state pending the resurrection-and-judgment (against eternal-conscious-torment-as-the-final-destination). Luke 16:26''s *between us and you there is a great gulf fixed* names the separation of the same two compartments the Hebrew library named, held until the great judgment.'),
  ('canon', 'luke', 16, 31, 'apocrypha', '2-esdras', 7, 32,
   E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them* (2 Esdras 7:32). The secret-places-deliver-the-committed-souls register — the chambers of the dead give back what was entrusted to them at the resurrection. Luke 16:31''s *neither will they be persuaded, though one rose from the dead* assumes the same resurrection-from-the-holding-state architecture: the souls held in the secret places are restored at the appointed day, the resurrection the rich man''s brothers must be persuaded toward before it comes.'),

  -- Thread 3: luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees
  ('canon', 'luke', 17, 26, 'enoch', '1-enoch', 10, 2,
   E'*Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it* (1 Enoch 10:2). The Hebrew library names the days-of-Noach as the deluge-warning issued against a corrupted earth. Luke 17:26''s *as it was in the days of Noach (Noah), so shall it be also in the days of the Son of Adam* draws the comparison the framework reads in the Watcher-rebellion-judgment pattern: the flood came upon an earth corrupted by the Watchers'' works, and the day of the Son of Adam comes upon an earth corrupted in the same register.'),
  ('canon', 'luke', 17, 27, 'enoch', '1-enoch', 10, 3,
   E'*And now instruct him that he may escape and his seed may be preserved for all the generations of the world* (1 Enoch 10:3). The preservation-of-the-righteous-seed-through-the-flood register. Luke 17:27''s *until the day that Noach (Noah) entered into the ark, and the flood came, and destroyed them all* names the same two-outcome architecture: the seed preserved through the ark, the rest destroyed. The framework reads the days-of-the-Son-of-Adam as the same separation — the gathered-seed preserved, the corrupt judged.'),
  ('canon', 'luke', 17, 27, 'jubilees', 'jubilees', 5, 2,
   E'*And lawlessness increased on the earth and all flesh corrupted its way... and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually* (Jubilees 5:2). The Hebrew library names the days-of-Noach as the total-corruption of all flesh — the Watcher-rebellion''s offspring driving the earth into lawlessness. Luke 17:27''s *they did eat, they drank, they married wives, they were given in marriage* names the ordinary-life surface over the same corruption-judgment the flood answered; the framework reads the eating-and-drinking not as innocence but as obliviousness on the eve of the appointed judgment.'),
  ('canon', 'luke', 17, 27, 'jubilees', 'jubilees', 5, 4,
   E'*And He said: "I shall destroy man and all flesh upon the face of the earth which I have created"* (Jubilees 5:4). The Hebrew library names the flood-decree of total judgment that fell in the days of Noach. Luke 17:27''s *and the flood came, and destroyed them all* walks the same decree; the *destroyed them all* of the gospel is the *I shall destroy... all flesh* of the wisdom of Jubilees. The days-of-the-Son-of-Adam comparison the King draws rests on this flood-judgment pattern the Hebrew library carried in full.'),

  -- Thread 4: luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch
  ('canon', 'luke', 19, 10, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning* (Sirach / Ecclesiasticus 36:11). The wisdom-stream''s explicit prayer for the gathering of ALL the tribes of Ya''aqov (Jacob) — not Yahudah (Judah) alone, but all the scattered houses, *as from the beginning.* Luke 19:10''s *the Son of Adam is come to seek and to save that which was lost* names the King''s own programmatic statement of that same gathering-mission: the seeking-and-saving of the lost is the gathering of the scattered tribes the Hebrew library had been praying for, not a categorical-nations inclusion.'),
  ('canon', 'luke', 19, 10, 'apocrypha', 'ecclesiasticus', 36, 12,
   E'*O Yahuah (God), have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn* (Sirach 36:12). The wisdom-stream names the object of the gathering: Yashar''el, the firstborn called by the Name. Luke 19:10''s lost-that-must-be-sought is this firstborn-people scattered and gone Lo-Ammi; the Son of Adam comes to seek and save precisely *the lost sheep of the house of Yashar''el.* The mercy the wisdom-stream prays for the firstborn is the mercy the King enacts in seeking the lost.'),
  ('canon', 'luke', 19, 10, 'enoch', '1-enoch', 90, 3,
   E'*And that great horn cried aloud to the sheep, and the sheep began to gather together to it* (1 Enoch 90:3). The animal-apocalypse names the gathering of the dispersed sheep to the great horn at the appointed time. Luke 19:10''s *the Son of Adam is come to seek and to save that which was lost* names the same shepherd-gathers-the-scattered-sheep architecture in the King''s own programmatic voice — the lost sheep gathered to the one who cries aloud to them, the framework''s seeking-and-saving as the ingathering of the scattered house, not a self-selected community drawn from the nations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l1619_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug     = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number   = i.src_v
  JOIN _s212_l1619_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug     = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number   = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- B. Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach',
       E'Ye cannot serve Elohim and mammon — gold as snare in Sirach',
       E'Luke-specific placement. The unjust-steward parable (vv.1-8) closes not with a commendation of dishonesty but with a verdict on masters: *No servant can serve two masters... Ye cannot serve Elohim (God) and mammon* (Luke 16:13). The Hebrew library''s wisdom-stream had already named the architecture at the gold-as-snare level. Sirach (Ecclesiasticus) 31:5 names the disqualification: *he that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* Sirach 31:6 names the ruin: *gold has been the ruin of many, and their destruction was present.* Sirach 31:7 names gold-as-stumblingblock-for-those-who-sacrifice-to-it: *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* The wisdom-stream identifies wealth as an object of worship that captures its devotees; the King names the same at the forced-choice level — the divided heart cannot stand justified before the Father whose service is whole-heart. The Sermon carries the same Sirach material at Matthew 6:24; the Lukan setting is distinct, sealing a steward-parable about deploying mammon shrewdly before the books are called.',
       sv.verse_id, ev.verse_id, 'extras', 3520
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 16 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras',
       E'The rich man and Lazaros — the hollow places of the dead in 1 Enoch and 2 Esdras',
       E'Luke-specific. FRAMEWORK-MAJOR for the framework-honest sheol register the inherited soul-sleep doctrine and the inherited eternal-conscious-torment doctrine BOTH misread. Lazaros is carried by the angels into Avraham''s (Abraham''s) bosom; the rich man is buried, lifts his eyes in torments, and sees across a fixed gulf (Luke 16:22-26). The Hebrew library names the architecture the parable assumes. 1 Enoch 22 shows Enoch the holding-places of the dead: *there was in it four hollow places, deep and wide and very smooth* (22:9); *these hollow places have been created for this very purpose, that the spirits of the souls of the dead should assemble therein* (22:10); *and these places have been made for them until the day of their judgement and until their appointed period* (22:11). Three pieces the framework holds: sheol is real, conscious, and compartmented (against soul-sleep), AND temporal-pending-the-judgment (against eternal-conscious-torment-as-the-final-destination). 2 Esdras 7:32 names the resurrection-from-the-holding-state: *the secret places shall deliver those souls that were committed to them.* Luke 16:31''s *though one rose from the dead* assumes exactly this resurrection from the chambers the Hebrew library named. The S185 canon thread carries the Tanakh anchors and the Mosheh-and-the-prophets standing-test; this thread promotes the Hebrew-library hollow-places witness into edition-aware member-rows.',
       sv.verse_id, ev.verse_id, 'extras', 3521
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 19
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 16 AND ev.verse_number = 31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees',
       E'As it was in the days of Noach — the flood judgment in 1 Enoch and Jubilees',
       E'Luke-specific. The King draws the days-of-the-Son-of-Adam comparison from the days-of-Noach: *as it was in the days of Noach (Noah), so shall it be also in the days of the Son of Adam... until the day that Noach (Noah) entered into the ark, and the flood came, and destroyed them all* (Luke 17:26-27). The framework reads the flood not as a generic moral lesson but as the Watcher-rebellion-judgment pattern the Hebrew library carries in full. 1 Enoch 10:2 names the deluge-warning against the corrupted earth: *reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come.* 1 Enoch 10:3 names the preservation of the righteous seed through the flood: *that he may escape and his seed may be preserved for all the generations of the world.* Jubilees 5:2 names the total-corruption that brought the flood: *lawlessness increased on the earth and all flesh corrupted its way.* Jubilees 5:4 names the flood-decree: *I shall destroy man and all flesh upon the face of the earth which I have created.* The eating-and-drinking-and-marrying surface of Luke 17:27 is obliviousness on the eve of the appointed judgment, not innocence; the days-of-the-Son-of-Adam is the same two-outcome separation — the gathered-seed preserved, the corrupt judged. The S185 canon thread carries the Matthew parallel; this thread promotes the 1 Enoch and Jubilees flood-judgment witness into edition-aware member-rows.',
       sv.verse_id, ev.verse_id, 'extras', 3522
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 26
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 17 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch',
       E'The Son of Adam is come to seek and save the lost — the gathering of the tribes of Jacob in Sirach and 1 Enoch',
       E'Luke-specific. The King''s programmatic statement at Zakkay''s (Zacchaeus''s) house — *the Son of Adam is come to seek and to save that which was lost* (Luke 19:10) — names the gathering-mission the framework reads as the ingathering of the scattered house of Yashar''el (Israel), not a categorical-nations inclusion. The Hebrew library had already been praying the gathering. Sirach (Ecclesiasticus) 36:11 names it directly: *gather all the tribes of Jacob together, and inherit you them, as from the beginning* — all the tribes, not Yahudah (Judah) alone. Sirach 36:12 names the object: *have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* 1 Enoch 90:3 names the gathering in the animal-apocalypse: *that great horn cried aloud to the sheep, and the sheep began to gather together to it.* The lost that the Son of Adam seeks is the firstborn-people scattered and gone Lo-Ammi; the seeking-and-saving is the shepherd-gathers-the-scattered-sheep architecture the Hebrew library had been praying and seeing in vision. The wisdom-stream''s prayer and Enoch''s vision name the gathering; the King enacts it.',
       sv.verse_id, ev.verse_id, 'extras', 3523
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 19 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- C. Link cross_references to their threads (member rows).
-- ---------------------------------------------------------------------

-- Thread 1: luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 31:5 — *he that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* The wisdom-stream''s gold-love-disqualifies architecture; Luke 16:13''s *Ye cannot serve Elohim (God) and mammon* names the same at the forced-choice-of-masters level.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 31:6 — *gold has been the ruin of many, and their destruction was present.* The gold-as-ruin diagnostic; the mammon-servant of Luke 16:13 walks toward the same ruin the wisdom-stream named.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 31:7 — *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Gold-as-stumblingblock-for-its-devotees; mammon is a competing master at Luke 16:13 because the wisdom-stream had already named gold as the master that takes those who sacrifice to it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 22:9 — *there was in it four hollow places, deep and wide and very smooth.* Enoch shown the compartmented holding-places of the dead; Luke 16:22''s carrying of Lazaros into Avraham''s (Abraham''s) bosom while the rich man is held elsewhere walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 22
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 22:10 — *the spirits of the souls of the dead should assemble therein.* The conscious-souls-assembled register against soul-sleep; Luke 16:23''s rich man lifting his eyes and seeing across the gulf assumes exactly this gathered-and-aware architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 22:11 — *these places have been made for them until the day of their judgement and until their appointed period.* The holding-places are TEMPORAL; the framework''s key against both soul-sleep and eternal-conscious-torment-as-final-destination. Luke 16:26''s *great gulf fixed* names the same compartments held until the great judgment.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 26
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 7:32 — *the secret places shall deliver those souls that were committed to them.* The resurrection-from-the-holding-state register; Luke 16:31''s *though one rose from the dead* assumes the chambers give back what was committed to them at the appointed day.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 31
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 7 AND tv.verse_number = 32
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:2 — *reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth.* The deluge-warning against the corrupted earth; Luke 17:26''s days-of-Noach comparison reads in the Watcher-rebellion-judgment pattern.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 26
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:3 — *that he may escape and his seed may be preserved for all the generations of the world.* The preservation-of-the-righteous-seed-through-the-flood; Luke 17:27''s ark-entered-then-flood-came names the same two-outcome architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 27
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:2 — *lawlessness increased on the earth and all flesh corrupted its way.* The total-corruption that brought the flood; Luke 17:27''s eating-drinking-marrying surface is obliviousness over the same corruption-judgment the flood answered.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 27
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 5 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:4 — *I shall destroy man and all flesh upon the face of the earth which I have created.* The flood-decree of total judgment; Luke 17:27''s *the flood came, and destroyed them all* walks the same decree the Hebrew library carried in full.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 27
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 5 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The wisdom-stream''s prayer for the gathering of ALL the tribes; Luke 19:10''s seek-and-save-the-lost names the King''s enactment of that gathering-mission.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 36:12 — *have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* The object of the gathering — the firstborn-people called by the Name; Luke 19:10''s lost-that-must-be-sought is this firstborn scattered Lo-Ammi.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 90:3 — *that great horn cried aloud to the sheep, and the sheep began to gather together to it.* The animal-apocalypse gathering of the dispersed sheep; Luke 19:10''s seek-and-save-the-lost names the same shepherd-gathers-the-scattered architecture in the King''s own voice.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s212_l1619_lookup;
