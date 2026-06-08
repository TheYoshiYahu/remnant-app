-- =====================================================================
-- S212 minion — Luke 9-11 extras-library cross-references
-- =====================================================================
-- Range: Luke 9, Luke 10, Luke 11.
-- Tag: l0911  (temp view _s212_l0911_lookup)
-- sort_order band: 3460-3489.
-- Output: scratch_xref/minion_luke_09_11.sql
--
-- Adds the MISSING outside-canon (extras-library) cross-references for
-- the Luke 9-11 range. The existing Luke canon migration
-- (session185_luke_xref_members_and_threads.sql) already carries canon
-- threads at these chapters (the seventy sent out, the Good Samaritan,
-- Martha & Mary, the woes at the Pharisee's table, the Lord's Prayer,
-- the Beelzebub controversy, the single-eye); and the Luke 10:18 / Luke
-- 11:14 verses are already attached as CANON members to existing
-- threads. This fragment ADDS the framework-bearing extras-tier
-- connections those chapters warrant that were not yet member rows.
--
-- NEW threads created (2):
--   1. luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom
--        (sort 3460) — targets: 1 Enoch (enoch), Wisdom of Solomon (apocrypha)
--   2. luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach
--        (sort 3461) — targets: Sirach / Ecclesiasticus (apocrypha)
--
-- EXISTING thread complemented (no new thread — avoids duplicating the
-- Matt-12-anchored watcher-binding thread that already carries 1 Enoch
-- 10 / Jubilees 10 and to which Luke 11:14 is already a canon member):
--   - binding-of-the-watchers-typological-anchor-for-binding-the-strong-man
--        gains two Luke-11:22-source extras members (1 Enoch 10:4 Azazel
--        bound; Jubilees 10:11 the malignant ones bound). The strong-man
--        armed keeping his palace (Luke 11:21-22) is the binding-the-
--        strong-man substance the wisdom-stream named at the watcher-
--        leader register.
--
-- 8 new cross_references rows, all tier_required='extras'.
-- 8 new thread_members rows.
--
-- Chapters with NO extras add (and why):
--   - LUKE 9: the Transfiguration's Mosheh-and-Eliyahu-in-glory is
--     already extras-witnessed via the existing
--     `the-formless-father-and-the-formed-son-witnessed-in-ascension-of-isaiah`
--     thread anchored at Luke 9:28; the feeding-of-the-5000 and Kefa's
--     confession carry synoptic Matthew extras coverage. No additional
--     framework-bearing extras connection surfaces at the rigour bar.
--   - LUKE 11:33-34 (the single eye / the light of the body): already a
--     CANON member of the existing extras thread
--     `the-single-eye-of-issachar-and-the-evil-eye-of-sirach` (which
--     carries Testament of Issachar + Sirach 14/35). A Luke-anchored
--     duplicate would be redundant; no distinct framework-bearing add.
--
-- Every member-note quotes the verse IN FULL in italics with the
-- citation in parentheses (come-and-see), restores sacred names with
-- parentheticals, and passes the 12 Red Lines + 12-point checklist.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

CREATE TEMP VIEW _s212_l0911_lookup AS
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
-- Insert 8 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom
  ('canon', 'luke', 10, 18, 'enoch', '1-enoch', 6, 6,
   E'*And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* (1 Enoch 6:6) The Hebrew library names the watcher-descent — two hundred angels falling from heaven by their own oath on Hermon — as the origin-event of the unclean-spirit administration. Luke 10:18''s *I beheld Satan as lightning fall from heaven* (Luke 10:18) is the King naming the same fall the wisdom-stream had already chronicled: the seventy''s territory-by-territory undoing of the devils'' rule (Luke 10:17) is the working-out of the fall 1 Enoch traces to Yered''s (Jared''s) day.'),
  ('canon', 'luke', 10, 18, 'enoch', '1-enoch', 88, 1,
   E'*And I saw one of those four who had come forth first, and he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss: now that abyss was narrow and deep, and horrible and dark.* (1 Enoch 88:1) The animal-apocalypse vision names the fallen-star seized, bound hand and foot, and cast into the abyss — the same fallen-and-bound architecture the King names in seven words. *I beheld Satan as lightning fall from heaven* (Luke 10:18): the lightning-fall the King saw is the fall 1 Enoch shows ending in the binding-and-abyss, the destination of the watcher-administration the seventy are sent against.'),
  ('canon', 'luke', 10, 18, 'apocrypha', 'the-wisdom-of-solomon', 2, 24,
   E'*Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* (Wisdom of Solomon 2:24) The wisdom-stream names the devil as the envy-source through which death entered the world — the seed-war origin behind the fallen-power the King names at Luke 10:18. *I beheld Satan as lightning fall from heaven. Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy* (Luke 10:18-19): the enemy whose power the seventy are given authority over is the same devil whose envy Wisdom names as the door death came through; the authority-to-tread is the inaugurated reversal of his administration.'),

  -- Thread 2: luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach
  ('canon', 'luke', 11, 43, 'apocrypha', 'ecclesiasticus', 10, 13,
   E'*For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* (Sirach 10:13) The wisdom-stream names pride as the beginning of sin and the overthrow it brings. *Woe unto you, Pharisees! for ye love the uppermost seats in the synagogues, and greetings in the markets* (Luke 11:43): the love-of-the-uppermost-seats the King names is the pride Sirach had already diagnosed as sin''s beginning — the religious-status-architecture the woe falls on, named by the Hebrew library centuries before the Pharisee''s table.'),
  ('canon', 'luke', 11, 46, 'apocrypha', 'ecclesiasticus', 10, 12,
   E'*The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* (Sirach 10:12) The wisdom-stream names pride as the heart turned away from its Maker. *Woe unto you also, ye lawyers! for ye lade men with burdens grievous to be borne, and ye yourselves touch not the burdens with one of your fingers* (Luke 11:46): the burden-lading lawyers build their parallel-Torah on top of the Torah and refuse to bear it — the heart-turned-away-from-the-Maker Sirach names, walking itself out as the Judaizer-system that voids the commandment by addition while keeping the robe of the law.'),
  ('canon', 'luke', 11, 52, 'apocrypha', 'ecclesiasticus', 21, 14,
   E'*The inner parts of a fool are like a broken vessel, and he will hold no knowledge as long as he lives.* (Sirach 21:14) The wisdom-stream names the heart that holds no knowledge. *Woe unto you, lawyers! for ye have taken away the key of knowledge: ye entered not in yourselves, and them that were entering in ye hindered* (Luke 11:52): the lawyers who took away the key are the broken-vessel hearts Sirach names — they hold no knowledge themselves and so cannot open the door, and they hinder those who would enter. The key-of-knowledge taken away is the Torah-read-plainly the system replaced with its own fences.'),
  ('canon', 'luke', 11, 52, 'apocrypha', 'ecclesiasticus', 21, 15,
   E'*If a skilful man hear a wise word, he will commend it, and add to it: but as soon as one of no understanding heareth it, it displeaseth him, and he casteth it behind his back.* (Sirach 21:15) The wisdom-stream names the man-of-no-understanding who casts the wise word behind his back. *Ye have taken away the key of knowledge: ye entered not in yourselves, and them that were entering in ye hindered* (Luke 11:52): the lawyers'' taking-away-the-key is the casting-the-word-behind-the-back Sirach names — the leadership-substance that hears the Word and refuses it, then locks the door from the outside against those entering. The system-not-people diagnostic holds: the woe falls on the leadership-substance, not on the people it kept from the door.'),

  -- Existing thread complement: binding-of-the-watchers-typological-anchor-for-binding-the-strong-man
  ('canon', 'luke', 11, 22, 'enoch', '1-enoch', 10, 4,
   E'*And again Yahuah (God) said to Raphael: Bind Azazel hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dudael, and cast him therein.* (1 Enoch 10:4) The Hebrew library names the binding-of-the-watcher-leader Azazel — bound hand and foot, cast into the darkness. *When a stronger than he shall come upon him, and overcome him, he taketh from him all his armour wherein he trusted, and divideth his spoils* (Luke 11:22): the stronger-than-he who overcomes the armed strong man and divides the spoils is walking the inaugurated form of the binding-architecture the wisdom-stream named at the watcher-leader register; the full binding lands at Revelation 20:1-3''s millennial consummation.'),
  ('canon', 'luke', 11, 22, 'jubilees', 'jubilees', 10, 11,
   E'*And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* (Jubilees 10:11) The Hebrew library names the watchers-bound-with-a-tenth-permitted-to-operate architecture: nine-tenths bound in the place of condemnation, one-tenth left subject before Satan on the earth. *When a stronger than he shall come upon him, and overcome him, he taketh from him all his armour wherein he trusted, and divideth his spoils* (Luke 11:22): the strong man whose goods are spoiled is the partial-binding Jubilees names walking toward its completion — the King''s casting-out of the devil (Luke 11:14) is the inaugurated overcoming that culminates in the full binding the wisdom-stream foretold.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l0911_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l0911_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 2 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom',
       'Satan fallen as lightning — the watcher-fall in 1 Enoch and Wisdom of Solomon',
       E'Luke 10:18-19''s *I beheld Satan as lightning fall from heaven. Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy* names in seven words the fall the Hebrew library had already chronicled at length. The King speaks it as the seventy return with joy that *even the devils are subject unto us through thy name* (Luke 10:17) — the territory-by-territory undoing of the unclean-spirit administration is the working-out of the lightning-fall the King saw. 1 Enoch 6:6 traces the origin: *they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it* — the watcher-descent by their own oath. 1 Enoch 88:1 shows the destination: *he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss* — the fallen-star bound and abyss-sealed, the same fallen-and-bound architecture. Wisdom of Solomon 2:24 names the seed-war substance behind it: *through envy of the devil came death into the world* — the enemy whose power the seventy are given authority to tread on is the same devil whose envy was the door death came through. The wisdom-stream chronicled the fall, the binding, and the death-bringing envy; the King names the fall in seven words and hands the seventy the inaugurated authority over the administration the fall produced. (The Daniel 7:25 kingdoms-under-the-administration anchor and the Revelation 12:9 dragon-cast-out anchor are carried at the canon level; this thread adds the extras-library witness to the same watcher-fall.)',
       sv.verse_id, ev.verse_id, 'extras', 3460
  FROM _s212_l0911_lookup sv, _s212_l0911_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 10 AND ev.verse_number = 19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach',
       E'Taken away the key of knowledge — the corrupted-leadership architecture in Sirach',
       E'Luke 11:42-52''s woes at the Pharisee''s table walk the framework-major Judaizer diagnostic in front of the reader: the system that wears Torah''s robes and builds a parallel-Torah on top that contradicts the original. The Hebrew library''s wisdom-stream had already named the architecture. Sirach 10:12 names the root: *the beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker* — the heart-turned-away the King names at *woe unto you also, ye lawyers! for ye lade men with burdens grievous to be borne, and ye yourselves touch not the burdens with one of your fingers* (Luke 11:46). Sirach 10:13 names the fruit: *pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* — the love-of-the-uppermost-seats the King names at *woe unto you, Pharisees! for ye love the uppermost seats in the synagogues, and greetings in the markets* (Luke 11:43). And Sirach 21:14-15 names the key-of-knowledge inverse: *the inner parts of a fool are like a broken vessel, and he will hold no knowledge as long as he lives ... as soon as one of no understanding heareth it, it displeaseth him, and he casteth it behind his back* — the broken-vessel hearts that hold no knowledge and cast the wise word behind their backs are the lawyers the King names at *woe unto you, lawyers! for ye have taken away the key of knowledge: ye entered not in yourselves, and them that were entering in ye hindered* (Luke 11:52). The system-not-people posture is non-negotiable: the woe falls on the leadership-substance that took away the key and locked the door from the outside, NOT on the people it kept from the door. The contrary-to-Torah test of 1 Yochanan (John) 2:3-4 is the standard operating underneath: the key-of-knowledge taken away is the Torah-read-plainly the system replaced with its own fences. (The synoptic Matthew 23 anchors and the canon Tanakh-witness — Micah 6:8, Genesis 4:10, 2 Chronicles 24:21 — are carried at the canon level; this thread adds the Sirach wisdom-stream witness to the same diagnostic at the Luke woes.)',
       sv.verse_id, ev.verse_id, 'extras', 3461
  FROM _s212_l0911_lookup sv, _s212_l0911_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 42
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 11 AND ev.verse_number = 52
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 6:6 — *they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The watcher-descent by their own oath; Luke 10:18''s *I beheld Satan as lightning fall from heaven* names the same fall the wisdom-stream traced to Yered''s (Jared''s) day.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 6 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 88:1 — *he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss.* The fallen-star bound and abyss-sealed; the lightning-fall the King saw at Luke 10:18 is the fall 1 Enoch shows ending in the binding-and-abyss.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 88 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:24 — *through envy of the devil came death into the world: and they that do hold of his side do find it.* The seed-war substance behind the fallen-power; the enemy whose power the seventy tread on (Luke 10:19) is the same devil whose envy was the door death came through.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 24
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 10:12 — *the beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* The heart-turned-away root; Luke 11:46''s burden-lading lawyers walk the parallel-Torah-built-on-top the heart-turned-away produces.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 46
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 10 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 10:13 — *pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* The pride-as-sin''s-beginning fruit; Luke 11:43''s love-of-the-uppermost-seats is the religious-status pride Sirach diagnosed.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 43
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 10 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 21:14 — *the inner parts of a fool are like a broken vessel, and he will hold no knowledge as long as he lives.* The broken-vessel heart that holds no knowledge; Luke 11:52''s lawyers took away the key of knowledge because they hold none themselves.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 21 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 21:15 — *as soon as one of no understanding heareth it, it displeaseth him, and he casteth it behind his back.* The man-of-no-understanding casting the wise word behind his back; Luke 11:52''s taking-away-the-key is that casting-the-word-behind-the-back, then locking the door against those entering.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 21 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Existing thread complement: binding-of-the-watchers-typological-anchor-for-binding-the-strong-man
-- (Luke 11:22 strong-man-armed extras members added to the existing
--  Matt-12-anchored thread; sort_orders 20/21 sit after its existing members.)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 20, E'1 Enoch 10:4 — *Bind Azazel hand and foot, and cast him into the darkness ... and cast him therein.* The binding-of-the-watcher-leader Azazel; Luke 11:22''s *a stronger than he ... taketh from him all his armour wherein he trusted, and divideth his spoils* walks the inaugurated form of the binding-architecture the wisdom-stream named.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'binding-of-the-watchers-typological-anchor-for-binding-the-strong-man'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 22
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jubilees 10:11 — *all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The watchers-bound-with-a-tenth-permitted architecture; Luke 11:22''s spoiled strong man is the partial-binding walking toward its completion — the King''s casting-out (Luke 11:14) the inaugurated overcoming.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'binding-of-the-watchers-typological-anchor-for-binding-the-strong-man'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 22
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
