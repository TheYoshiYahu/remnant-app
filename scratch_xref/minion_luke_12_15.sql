-- =====================================================================
-- S212 — Luke 12-15 extras-library cross-references (tag: l1215)
-- =====================================================================
-- Adds the MISSING outside-canon (extras-library) cross-references for
-- Luke 12, 13, 14, 15. The existing canon migration
-- (session185_luke_xref_members_and_threads.sql) already carries canon
-- threads for these chapters — the rich fool (Ecclesiastes/Job/Psalms),
-- the except-ye-repent warning, the daughter-of-Abraham loosing, the
-- lowest-seat recompense, the great supper, count-the-cost, the lost
-- coin, and the prodigal-and-elder-brother two-house gathering — but
-- inserted ZERO extras-library member rows. This migration promotes the
-- framework-bearing extras connections those chapters warrant into real
-- edition-aware member rows. It ADDS to the canon coverage; it does not
-- duplicate it (every source verse is the Luke gospel verse; every
-- target is an extras-edition verse the canon threads never touched).
--
-- The Luke 12-15 reading-target across the four chapters: the rich fool
-- who lays up treasure not toward Elohim (12:16-21) and the sell-and-
-- give-alms treasure-in-the-heavens-that-faileth-not (12:33); the
-- come-from-east-and-west gathering at the strait gate (13:24-30); and
-- the lost-sheep / lost-coin / prodigal-son recovery of the lost
-- (ch.15) — framework-central as the gathering of scattered / lost
-- Yashar'el (Israel) home to the Father. The Hebrew library's extras-
-- tier witness carries each architecture at the verse-level: the
-- rich-fool-who-knows-not-his-time (Sirach 11:18-19); the treasure-
-- laid-up-by-alms-against-the-day (Tobit 4:9-10, Sirach 29:11-12); the
-- look-toward-the-east, your-children-gathered-from-west-to-east
-- gathering (Baruch 4:36-37, 5:5) and the gather-all-the-tribes-of-
-- Jacob prayer (Sirach 36:11); and the shepherd-who-brings-again-his-
-- flock mercy (Sirach 18:13) with the ten-tribes-regathered (2 Esdras
-- 13:39-40) and the bring-out-the-children-and-show-mercy promise
-- (2 Esdras 2:31-32).
--
-- Four new threads at extras-tier (sort band 3490-3519):
--   1. luke-12-the-rich-fool-who-knows-not-his-time-in-sirach
--        targets: apocrypha (Sirach/Ecclesiasticus)                  (sort 3490)
--   2. luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach
--        targets: apocrypha (Tobit, Sirach/Ecclesiasticus)           (sort 3491)
--   3. luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach
--        targets: apocrypha (Baruch, Sirach/Ecclesiasticus)          (sort 3492)
--   4. luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras
--        targets: apocrypha (Sirach/Ecclesiasticus, 2 Esdras)        (sort 3493)
--
-- 13 new cross_references rows + 13 thread_members, all tier_required='extras'.
-- Luke 14: no extras add. The chapter's strongest connections (the
-- lowest-seat wisdom-proverb, the resurrection-of-the-just, the great
-- supper as the gathering, count-the-cost) are canon-anchored and
-- already carried in S185 (Proverbs 25, Deuteronomy 14, Revelation 20,
-- 1 Thessalonians 4, Isaiah 35, Ezekiel 37, Romans 11). No extras-
-- library verse surfaces a framework-bearing connection at the rigour
-- the migration requires that the canon threads do not already carry.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

CREATE TEMP VIEW _s212_l1215_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- ---------------------------------------------------------------------
-- Insert 13 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: luke-12-the-rich-fool-who-knows-not-his-time-in-sirach
  ('canon', 'luke', 12, 19, 'apocrypha', 'ecclesiasticus', 11, 19,
   E'*Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* Sirach (Ecclesiasticus) 11:19 names the rich-fool architecture word-for-word in the Hebrew library, centuries before the King speaks the parable. The man who says *I have found rest, and now will eat continually of my goods* is the man of Luke 12:19 who says to his soul *take thine ease, eat, drink, and be merry* — and the wisdom-stream had already named the two things he does not reckon with: *he knoweth not what time shall come upon him,* and *he must leave those things to others, and die.* The barns get pulled down; the soul gets required this night; the goods get left to another. The gospel walks the architecture the wisdom-stream already carried.'),
  ('canon', 'luke', 12, 20, 'apocrypha', 'ecclesiasticus', 11, 18,
   E'*There is that waxeth rich by his wariness and pinching, and this is the portion of his reward.* Sirach (Ecclesiasticus) 11:18 names the portion-of-the-reward of the man who waxes rich by hoarding — the verse that sets up the verdict of v.19. Luke 12:20''s *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* lands the same reckoning: the wariness-and-pinching gain is no portion at all when the soul is required. The wisdom-stream names the hollow reward; the gospel names the night it comes due.'),

  -- Thread 2: luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach
  ('canon', 'luke', 12, 33, 'apocrypha', 'tobit', 4, 9,
   E'*For you layest up a good treasure for thyself against the day of necessity.* Tobit 4:9 names the lay-up-treasure-against-the-day architecture directly in the Hebrew library — the verse stands inside Tobit''s charge to give alms (Tobit 4:7-8). Luke 12:33''s *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not* walks the same architecture: the alms given now is the treasure laid up against the day. The wisdom-stream names the treasure laid up by the open hand; the gospel names the heaven-bag that faileth not.'),
  ('canon', 'luke', 12, 33, 'apocrypha', 'tobit', 4, 10,
   E'*Because that alms do deliver from death, and suffers not to come into darkness.* Tobit 4:10 names the alms-as-deliverer-from-death architecture — the treasure laid up by the open hand protects the giver. Luke 12:33''s *a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth* walks the same protection-against-loss architecture at the heavenly-treasure level. The Hebrew library names the deliverance the open hand purchases; the gospel names the storehouse no thief can reach and no moth can corrupt.'),
  ('canon', 'luke', 12, 33, 'apocrypha', 'ecclesiasticus', 29, 11,
   E'*Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* Sirach (Ecclesiasticus) 29:11 names the lay-up-treasure-by-the-commandments architecture explicitly — the treasure laid up by the commandment-keeper who helps the poor for the commandment''s sake (Sirach 29:9). Luke 12:33''s *provide yourselves bags which wax not old, a treasure in the heavens that faileth not* is the gospel-form of the wisdom-stream''s same teaching: the treasure of the open-handed commandment-keeper outlasts gold because it is laid up where gold cannot reach.'),
  ('canon', 'luke', 12, 33, 'apocrypha', 'ecclesiasticus', 29, 12,
   E'*Shut up alms in your storehouses: and it shall deliver you from all affliction.* Sirach (Ecclesiasticus) 29:12 names the storehouse-of-alms architecture — the treasure laid up against affliction. Luke 12:33''s *a treasure in the heavens that faileth not* walks the same Hebrew library architecture: the kingdom-citizen who lays up alms in the heavenly storehouse holds what the earthly storehouse cannot keep. The next verse seals it — *for where your treasure is, there will your heart be also* (Luke 12:34).'),

  -- Thread 3: luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach
  ('canon', 'luke', 13, 29, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 36,
   E'*O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* Baruch 4:36 turns Jerusalem''s face toward the east to behold the gathering-joy — the prophetic-gathering register the King names at Luke 13:29''s *they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim (God).* The Hebrew library names the direction of the coming; the gospel names the four quarters the scattered seed comes from to sit down in the kingdom. This is not categorical-Gentile-inclusion — it is the gathering of the dispersed children of Yashar''el (Israel) from the territories of their scattering.'),
  ('canon', 'luke', 13, 29, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37,
   E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* Baruch 4:37 names the gathering directly: the sons whom Jerusalem *sentest away* — the scattered into exile — *come gathered together from the east to the west.* Luke 13:29''s *they shall come from the east, and from the west* walks the same architecture. The ones gathered are the sent-away sons coming home, not strangers added; the Hebrew library names them as Jerusalem''s own scattered children regathered by the word of the Holy One.'),
  ('canon', 'luke', 13, 29, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5,
   E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch 5:5 names the gathering-from-the-quarters in the same register Luke 13:29 walks: *your children gathered from the west to the east.* The children gathered are Jerusalem''s own — *they departed from you on foot, and were led away of their enemies: but Yahuah (God) brings them to you exalted with glory, as children of the kingdom* (Baruch 5:6). The come-from-east-and-west of the gospel IS this prophetic-gathering of the scattered covenant-children home as children of the kingdom.'),
  ('canon', 'luke', 13, 29, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 names the gathering as a prayer — *gather all the tribes of Jacob together* — the petition for the regathering of the twelve tribes *as from the beginning.* Luke 13:29''s come-from-the-four-quarters to sit down in the kingdom is the answer to this prayer: the scattered tribes of Jacob gathered home. The wisdom-stream prays the gathering the gospel announces; the firstborn Yashar''el (Israel) whom Yahuah named (Sirach 36:12) is the people gathered, not a substitute people installed in their place.'),

  -- Thread 4: luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras
  ('canon', 'luke', 15, 5, 'apocrypha', 'ecclesiasticus', 18, 13,
   E'*The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* Sirach (Ecclesiasticus) 18:13 names the shepherd-who-brings-again-his-flock architecture in the Hebrew library. Luke 15:5''s *and when he hath found it, he layeth it on his shoulders, rejoicing* is the same shepherd-brings-again substance walked into the lost-sheep parable. The wisdom-stream names the mercy that *brings again, as a shepherd his flock*; the gospel names the shepherd going after the one lost until he finds it and carries it home. The bringing-again is the gathering of the lost.'),
  ('canon', 'luke', 15, 6, 'apocrypha', '2-esdras', 13, 40,
   E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* 2 Esdras 13:40 names the ten tribes carried away into the land of their scattering — the lost-of-the-house-of-Yashar''el (Israel) the framework holds. Luke 15:6''s *Rejoice with me; for I have found my sheep which was lost* names the recovery of exactly this lost: the scattered northern house regathered. 2 Esdras names them lost in the further country; the gospel names the joy when the lost is found. *Now when he shall begin to come* (2 Esdras 13:46) is the regathering the parable rejoices over.'),
  ('canon', 'luke', 15, 24, 'apocrypha', '2-esdras', 2, 31,
   E'*Remember your children that sleep, for I shall bring them out of the sides of the earth, and shew mercy to them: for I am merciful, says Yahuah (God) Almighty.* 2 Esdras 2:31 names the bring-out-the-children-and-show-mercy promise — the Father bringing his scattered children home with mercy. Luke 15:24''s *for this my son was dead, and is alive again; he was lost, and is found* walks the same architecture: the son brought out of the far country, the dead made alive, the lost found, the mercy shown. The prodigal''s homecoming is the Father''s own *I will bring them out... and shew mercy to them* in parable-form — the scattered child of Yashar''el (Israel) gathered home.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l1215_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l1215_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-12-the-rich-fool-who-knows-not-his-time-in-sirach',
       'The rich fool who knows not his time in Sirach',
       E'Luke 12:16-21''s parable of the rich fool — the man whose ground brought forth plentifully, who pulls down his barns to build greater, and who says to his soul *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* — walks an architecture the Hebrew library''s wisdom-stream had already named word-for-word. Sirach (Ecclesiasticus) 11:18 names the hollow reward of the hoarder: *there is that waxeth rich by his wariness and pinching, and this is the portion of his reward.* Sirach 11:19 lands the verdict the parable lands: *whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* The two things the rich fool does not reckon with — *he knoweth not what time shall come upon him,* and *he must leave those things to others, and die* — are exactly the two things Luke 12:20 names: *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The wisdom-stream named the rich fool centuries before the King spoke the parable; the gospel walks the same architecture and seals it with the verdict — *so is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21).',
       sv.verse_id, ev.verse_id, 'extras', 3490
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 12 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach',
       'Treasure in the heavens laid up by alms in Tobit and Sirach',
       E'Luke 12:33-34''s sell-and-give-alms teaching — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth. For where your treasure is, there will your heart be also* — walks an architecture the Hebrew library had already named at the verse-level. Tobit 4:9 names the laid-up-treasure-against-the-day teaching directly: *for you layest up a good treasure for thyself against the day of necessity.* Tobit 4:10 names the protection-economy: *because that alms do deliver from death, and suffers not to come into darkness.* Sirach (Ecclesiasticus) 29:11 names the lay-up-treasure-by-the-commandments architecture: *lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* Sirach 29:12 names the storehouse-of-alms protection: *shut up alms in your storehouses: and it shall deliver you from all affliction.* The Hebrew library uses the same *lay up* and *storehouse* and *treasure against the day* images the gospel walks; the gospel names the heaven-bag that faileth not, where no thief approaches and no moth corrupts — the treasure the open hand of the alms-giver lays up where loss cannot reach.',
       sv.verse_id, ev.verse_id, 'extras', 3491
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 12 AND ev.verse_number = 34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach',
       'They shall come from east and west — the gathering of the tribes in Baruch and Sirach',
       E'Luke 13:29''s *they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim (God)* — spoken at the strait gate against those who eat and drink in his presence yet hear *I know you not whence ye are* (Luke 13:25-28) — walks the Hebrew library''s prophetic-gathering of the scattered seed home. This is not categorical-Gentile-inclusion; it is the regathering of the dispersed children of Yashar''el (Israel) from the four quarters of their scattering, and the Hebrew library names them as such. Baruch 4:36 turns the face east: *O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* Baruch 4:37 names who comes: *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* Baruch 5:5 names the gathering-from-the-quarters again: *behold your children gathered from the west to the east by the word of the Holy One* — *led away of their enemies* but now *brought to you exalted with glory, as children of the kingdom* (Baruch 5:6). Sirach (Ecclesiasticus) 36:11 prays the gathering: *gather all the tribes of Jacob together, and inherit you them, as from the beginning* — the petition for the regathering of the twelve tribes, the firstborn Yashar''el (Israel) whom Yahuah named (Sirach 36:12). The come-from-east-and-west of the gospel IS this prophetic-gathering of the sent-away sons home as children of the kingdom — the scattered seed, not a substitute people installed in their place.',
       sv.verse_id, ev.verse_id, 'extras', 3492
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 13 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras',
       'The shepherd bringing again his flock and the gathering of the lost in Sirach and 2 Esdras',
       E'Luke 15''s three parables — the lost sheep, the lost coin, the prodigal son — are one substance: the recovery of the lost, the gathering of scattered / lost Yashar''el (Israel) home to the Father, against the Pharisees'' murmur that *this man receiveth sinners, and eateth with them* (Luke 15:2). The Hebrew library names the architecture directly. Sirach (Ecclesiasticus) 18:13 names the mercy that gathers: *the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock* — the shepherd-who-brings-again-his-flock the King walks at Luke 15:5 when *he layeth it on his shoulders, rejoicing.* 2 Esdras 13:40 names who is lost: *those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* — the scattered northern house, lost in the further country, *now when he shall begin to come* (2 Esdras 13:46). Luke 15:6''s *Rejoice with me; for I have found my sheep which was lost* names the joy when this lost is found. 2 Esdras 2:31 names the Father''s own promise: *remember your children that sleep, for I shall bring them out of the sides of the earth, and shew mercy to them: for I am merciful, says Yahuah (God) Almighty* — the bring-out-the-children-and-show-mercy promise the prodigal''s homecoming walks: *for this my son was dead, and is alive again; he was lost, and is found* (Luke 15:24). The lost found, the dead made alive, the scattered child gathered home with mercy — the wisdom-stream and the apocalyptic-stream both name the gathering the three parables rejoice over.',
       sv.verse_id, ev.verse_id, 'extras', 3493
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 4
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 15 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-12-the-rich-fool-who-knows-not-his-time-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 11:19 — *whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* The Hebrew library names the rich fool word-for-word; Luke 12:19''s *take thine ease, eat, drink, and be merry* walks the same architecture, and the two things the fool ignores — the unknown hour and the leaving-to-others — are exactly what the verdict names.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-the-rich-fool-who-knows-not-his-time-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 19
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 11 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 11:18 — *there is that waxeth rich by his wariness and pinching, and this is the portion of his reward.* The hollow-reward of the hoarder; Luke 12:20''s *Thou fool, this night thy soul shall be required of thee: then whose shall those things be?* lands the reckoning the wisdom-stream set up.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-the-rich-fool-who-knows-not-his-time-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 11 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 4:9 — *for you layest up a good treasure for thyself against the day of necessity.* The Hebrew library''s *lay up treasure against the day* phrasing inside the charge to give alms; Luke 12:33''s *provide yourselves bags which wax not old, a treasure in the heavens that faileth not* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 4:10 — *because that alms do deliver from death, and suffers not to come into darkness.* The protection-economy of the open hand; Luke 12:33''s *a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth* walks the same protection-against-loss architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 29:11 — *lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* The lay-up-treasure-by-the-commandments architecture; Luke 12:33''s heaven-bag that faileth not walks the same — the open-handed commandment-keeper''s treasure outlasts gold.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 29 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 29:12 — *shut up alms in your storehouses: and it shall deliver you from all affliction.* The Hebrew library''s *storehouse* image; Luke 12:33-34''s *treasure in the heavens... for where your treasure is, there will your heart be also* walks the same storehouse-of-treasure architecture at the heavenly level.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 29 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 4:36 — *O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* The face turned east to behold the gathering-joy; Luke 13:29''s come-from-east-and-west walks the same prophetic-gathering register.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 4:37 — *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The sent-away sons regathered from the quarters; Luke 13:29''s come-from-east-and-west names the same scattered children coming home — not strangers added.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 5:5 — *Arise, O Jerusalem... behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* The children led away of their enemies but brought home as children of the kingdom (Baruch 5:6); Luke 13:29''s gathering to sit down in the kingdom walks the same substance.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The gathering prayed as a petition for the twelve tribes; Luke 13:29''s come-from-the-four-quarters is the answer — the firstborn Yashar''el (Israel) whom Yahuah named (Sirach 36:12) gathered, not a substitute people installed.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 18:13 — *the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* The shepherd-who-brings-again-his-flock; Luke 15:5''s *he layeth it on his shoulders, rejoicing* walks the same bringing-again-the-lost substance.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 5
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 18 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 13:40 — *those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive.* The lost-of-the-house-of-Yashar''el (Israel) named; Luke 15:6''s *Rejoice with me; for I have found my sheep which was lost* names the recovery of exactly this lost — the scattered northern house regathered.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 40
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 2:31 — *remember your children that sleep, for I shall bring them out of the sides of the earth, and shew mercy to them: for I am merciful, says Yahuah (God) Almighty.* The bring-out-the-children-and-show-mercy promise; Luke 15:24''s *this my son was dead, and is alive again; he was lost, and is found* walks the same — the scattered child gathered home with mercy.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 2 AND tv.verse_number = 31
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
