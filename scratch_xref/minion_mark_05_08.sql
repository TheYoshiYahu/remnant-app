-- =====================================================================
-- S212 minion — Mark 5-8 extras-library cross-references
-- =====================================================================
-- Range:    Mark 5, 6, 7, 8
-- Tag:      m0508  (temp view _s212_m0508_lookup)
-- Band:     sort_order 3230-3259
-- Output:   scratch_xref/minion_mark_05_08.sql
--
-- These rows ADD outside-canon (extras-library) cross-references to the
-- Mark 5-8 range. The existing canon migration
-- (session183_mark_xref_members_and_threads.sql) carries Mark's canon
-- threads (Tanakh / NT targets) but inserted ZERO extras-library member
-- rows. The themes below were quoted-or-gestured-at in Mark's reading
-- but never linked as edition-aware extras rows; this fragment promotes
-- the framework-bearing ones into real cross_references + threads.
--
-- Non-duplication check performed: the existing extras threads on these
-- themes (`spirits-from-the-giants-and-demons-partially-restrained`,
-- `honor-of-parents-fifth-commandment-the-corban-tradition-voids-in-
-- sirach-and-tobit`, `the-heart-the-source-of-evil-not-the-father-in-
-- sirach-and-wisdom-of-solomon`) are all anchored to Matthew / Luke
-- verses, NOT Mark. Mark's card renders per Mark source verse, so the
-- Mark-anchored threads below are new (new slugs, Mark anchors) and
-- complement rather than duplicate the Matthean coverage.
--
-- Three new PROPOSED threads at extras-tier:
--   1. mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees  (sort 3230)
--        targets: enoch (1 Enoch 15, 16, 19), jubilees (Jubilees 10)
--   2. mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach          (sort 3231)
--        targets: apocrypha (Sirach / Ecclesiasticus 3)
--   3. mark-7-defilement-from-within-the-heart-the-source-of-evil-in-sirach       (sort 3232)
--        targets: apocrypha (Sirach / Ecclesiasticus 15, 27)
--
-- 12 new cross_references rows; 12 thread_member rows. All tier_required
-- = 'extras'. Every member-note quotes the target verse in full in
-- italics with the citation in parentheses, Sacred Names restored.
--
-- Chapters with NO extras add, and why:
--   Mark 6 (Nazareth rejection, death of John the Baptist, feeding the
--     5000): the feeding's *sheep not having a shepherd* (6:34) and the
--     Torah-contrary Herodian marriage that beheads the prophet are
--     canon-anchored (Ezekiel 34 / Numbers 27:17; Leviticus 18:16, 20:21
--     — already in the canon migration). The Animal-Apocalypse
--     Lord-of-the-sheep material (1 Enoch 89-90) is already linked to the
--     Matthean feeding narratives; forcing a Mark duplicate adds no new
--     framework-bearing connection at the rigour required. No extras add.
--   Mark 7:24-30 (the Syrophoenician woman / *the children's bread*): an
--     INDIVIDUAL-MERCY-WITHOUT-ABSORPTION case (Red Line #7). The
--     directional-non-symmetry contrast cases (the Canaanite woman,
--     Naaman, the widow of Tsarephath, the centurion) are canon, and the
--     existing `nazareth-scroll ... individual-mercy-contrast-cases`
--     thread already carries them. No extras-library verse carries this
--     individual-mercy frame without risking the false-inclusion read
--     the Red Line guards against; no extras add here.
--   Mark 8 (feeding the 4000, leaven of the Pharisees and of Herod, *who
--     do men say that I am*): the eastern-shore four-thousand feeding and
--     the leaven pairing are canon-anchored in the existing migration
--     (Isaiah 49:12; Mark 6:17 / 7:13; 1 Corinthians 5:6; Galatians 5:9).
--     No framework-bearing extras connection beyond what canon already
--     carries. No extras add.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the m0508 tag).
CREATE TEMP VIEW _s212_m0508_lookup AS
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
-- Insert 11 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees
  ('canon', 'mark', 5, 9, 'enoch', '1-enoch', 15, 8,
   E'*And he asked him, What is thy name? And he answered, saying, My name is Legion: for we are many.* The unclean spirits that are *many* in one man are the evil spirits the Hebrew library names by origin: *As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* (1 Enoch 15:8) The earth-bound spirits are a multitude precisely because they proceeded from the slain giants; *Legion* is the gospel''s word for the same class 1 Enoch had already located on the earth.'),
  ('canon', 'mark', 5, 9, 'enoch', '1-enoch', 15, 9,
   E'*My name is Legion: for we are many.* 1 Enoch 15:9 names what the legion of unclean spirits does to the man among the tombs: *And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble: they take no food, but nevertheless hunger and thirst, and cause offences.* The afflicting, oppressing, self-destroying torment of the Gadarene man — crying and cutting himself with stones, night and day — is the work the Hebrew library attributes to the spirits of the giants.'),
  ('canon', 'mark', 5, 13, 'enoch', '1-enoch', 15, 11,
   E'*And the unclean spirits went out, and entered into the swine: and the herd ran violently down a steep place into the sea... and were choked in the sea.* The spirits the King casts out are the spirits the Hebrew library says *destroy without incurring judgement... until the day of the consummation, the great judgement* (1 Enoch 15:11). The drowning in the sea is not their final judgement — that waits for the day of the great judgement over the Watchers and the godless; it is the King displacing their administration of the eastern territory in one motion before the day appointed for their end.'),
  ('canon', 'mark', 5, 8, 'enoch', '1-enoch', 16, 1,
   E'*For he said unto him, Come out of the man, thou unclean spirit.* 1 Enoch 16:1 names the spirits the command addresses by their origin in the slain giants: *And from the beginning thus have I been shown concerning you, and written concerning you.* The unclean spirit is not a faceless force; the Hebrew library had recorded its lineage and its sentence — *Say to them therefore: "You have no peace."* (1 Enoch 16:4) — long before the King commanded it out of the man.'),
  ('canon', 'mark', 5, 10, 'jubilees', 'jubilees', 10, 1,
   E'*And he besought him much that he would not send them away out of the country.* The spirits beg to remain in the territory because remaining-to-lead-astray is their assigned work: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* (Jubilees 10:1) The Hebrew library names the demons'' purpose as leading-astray-and-destroying; the legion''s plea not to be cast out of the country is the plea not to lose the ground from which it does that work.'),
  ('canon', 'mark', 5, 13, 'jubilees', 'jubilees', 10, 8,
   E'*And forthwith Yahusha (Jesus) gave them leave.* That a remnant of these spirits operates on the earth at all is the Hebrew library''s own framework: *And the chief of the spirits, Mastêmâ, came and said... let some of them remain before me... And He said: "Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation."* (Jubilees 10:8) The legion is part of the tenth-part left to lead astray; the King encountering and casting them out is the partially-restrained-spirits framework walked into a single deliverance.'),
  ('canon', 'mark', 5, 15, 'enoch', '1-enoch', 19, 1,
   E'*And see him that was possessed with the devil, and had the legion, sitting, and clothed, and in his right mind: and they were afraid.* The man restored to his right mind is the reversal of what the Hebrew library says these spirits do: *their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement.* (1 Enoch 19:1) The leading-astray-into-demon-worship is undone in the one man, a sign-in-miniature of the judgement reserved for the spirits themselves.'),

  -- Thread 2: mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach
  ('canon', 'mark', 7, 10, 'apocrypha', 'ecclesiasticus', 3, 7,
   E'*For Moses said, Honour thy father and thy mother.* The commandment the corban tradition voids is the same the Hebrew library''s wisdom-stream binds to the fear of Yahuah: *He that fears Yahuah (God) will honour his father, and will do service to his parents, as to his masters.* (Sirach / Ecclesiasticus 3:7) Sirach makes honour-of-parents the test of the fear of Yahuah; the corban device, which lets a man withhold from his parents what he vows to the altar, is the exact severing of the two the wisdom-stream had joined.'),
  ('canon', 'mark', 7, 12, 'apocrypha', 'ecclesiasticus', 3, 8,
   E'*And ye suffer him no more to do ought for his father or his mother.* The tradition forbids the very service Sirach commands *in word and deed*: *Honour your father and mother both in word and deed, that a blessing may come upon you from them.* (Sirach / Ecclesiasticus 3:8) The corban ruling is honour in word only — a vow-formula that profits the system — while the deed of provision is forbidden; the Hebrew library had already named honour as word AND deed, so the tradition''s subtraction is exposed by the wisdom-stream''s own standard.'),
  ('canon', 'mark', 7, 13, 'apocrypha', 'ecclesiasticus', 3, 9,
   E'*Making the word of Elohim (God) of none effect through your tradition, which ye have delivered.* The tradition does not merely fail to bless; it brings the curse the wisdom-stream warns of: *For the blessing of the father establishes the houses of children; but the curse of the mother rooteth out foundations.* (Sirach / Ecclesiasticus 3:9) The man-made tradition that voids the fifth commandment forfeits the blessing and invites the uprooting; the King names the voiding, and the Hebrew library had already named the cost.'),

  -- Thread 3: mark-7-defilement-from-within-the-heart-the-source-of-evil-in-sirach
  ('canon', 'mark', 7, 20, 'apocrypha', 'ecclesiasticus', 15, 14,
   E'*And he said, That which cometh out of the man, that defileth the man.* The defilement proceeds from the man''s own heart because the man was made a free agent over his own counsel: *He himself made man from the beginning, and left him in the hand of his counsel.* (Sirach / Ecclesiasticus 15:14) The Hebrew library locates the source of evil in the man''s own choosing, not in what enters from without; the King names the same — the heart, not the unwashen hand, is where defilement begins.'),
  ('canon', 'mark', 7, 21, 'apocrypha', 'ecclesiasticus', 27, 6,
   E'*For from within, out of the heart of men, proceed evil thoughts, adulteries, fornications, murders.* What a man brings forth reveals the heart that bore it: *The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* (Sirach / Ecclesiasticus 27:6) The Hebrew library makes the utterance the disclosure of the heart''s tending; the King''s catalogue of what proceeds from within is the same diagnostic — the fruit declares the tree, and the heart''s contents declare the man.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_m0508_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_m0508_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 3 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees',
       'Legion and the evil spirits of the giants in 1 Enoch and Jubilees',
       E'Mark 5:1-20 sets the King against a man with an unclean spirit whose name is *Legion: for we are many* — a multitude of spirits afflicting a man among the tombs, begging not to be sent *out of the country.* The Hebrew library names what this multitude is and where it came from. 1 Enoch 15 traces the evil spirits to the slain giants born of the Watchers'' rebellion: *the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* — *and the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth* (1 Enoch 15:6, 15:8-9). They *destroy without incurring judgement... until the day of the consummation, the great judgement* (1 Enoch 15:11), and their sentence is already written: *You have no peace* (1 Enoch 16:4). 1 Enoch 19:1 names their work as leading mankind *astray into sacrificing to demons as gods,* held *till the day of the great judgement.* Jubilees 10 carries the same framework with the detail Mark''s narrative assumes: *the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them* (Jubilees 10:1), and after Noah''s prayer the chief of the spirits Mastêmâ obtains that *the tenth part of them remain before him, and let nine parts descend into the place of condemnation* (Jubilees 10:8). The legion is part of that tenth-part still permitted to operate; its plea not to be cast out of the country is the plea not to lose the ground from which it leads astray. The King''s casting-out is the partially-restrained-spirits framework walked into a single deliverance — the man restored to his right mind, the spirits displaced before the day appointed for their end.',
       sv.verse_id, ev.verse_id, 'extras', 3230
  FROM _s212_m0508_lookup sv, _s212_m0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 8
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 5 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach',
       'The corban tradition voids the fifth commandment — Sirach',
       E'Mark 7:6-13 is the framework''s central diagnostic in the King''s own mouth: the man-made tradition that voids the commandment of Elohim (God). The corban device is the load-bearing example — *if a man shall say to his father or mother, It is Corban, that is to say, a gift... he shall be free* — and the verdict is *Making the word of Elohim (God) of none effect through your tradition.* The commandment the device voids is the fifth — *Honour thy father and thy mother* — and the Hebrew library''s wisdom-stream had already bound that commandment to the fear of Yahuah and named the cost of withholding it. Sirach (Ecclesiasticus) 3:7 makes honour-of-parents the very test of the fear of Yahuah: *He that fears Yahuah (God) will honour his father, and will do service to his parents, as to his masters.* Sirach 3:8 binds honour to deed, not word only: *Honour your father and mother both in word and deed, that a blessing may come upon you from them* — the exact word-AND-deed the corban ruling severs, permitting honour in vow-formula while forbidding the deed of provision. Sirach 3:9 names the cost: *the blessing of the father establishes the houses of children; but the curse of the mother rooteth out foundations.* The tradition that voids the commandment forfeits the blessing and invites the uprooting. The same flesh-credentialing system that exalts the tradition of the elders over the word of Elohim is the Judaizer architecture the King names here and the apostolic letters confront later; the wisdom-stream had already exposed it by its own standard.',
       sv.verse_id, ev.verse_id, 'extras', 3231
  FROM _s212_m0508_lookup sv, _s212_m0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 9
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 7 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-7-defilement-from-within-the-heart-the-source-of-evil-in-sirach',
       'Defilement from within — the heart the source of evil in Sirach',
       E'Mark 7:14-23 turns the washing-of-hands dispute into the King''s teaching on the true seat of defilement: *There is nothing from without a man, that entering into him can defile him: but the things which come out of him, those are they that defile the man... For from within, out of the heart of men, proceed evil thoughts, adulteries, fornications, murders.* The Hebrew library''s wisdom-stream had already located the source of evil in the man''s own heart, never in what enters from without, and never in Elohim (God). Sirach (Ecclesiasticus) 15:11-12 forbids blaming the Most High: *Say not you, It is through Yahuah (God) that I fell away... Say not you, He has caused me to err: for he has no need of the sinful man.* Sirach 15:14 names why the source is the man''s own: *He himself made man from the beginning, and left him in the hand of his counsel* — the free agent answerable for what proceeds from his own heart. Sirach 27:6 makes the outward utterance the disclosure of the inward heart: *The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* The King''s catalogue of what proceeds from within is the same diagnostic the wisdom-stream carried — the heart, not the unwashen hand, is where defilement begins, and what comes out declares the heart that bore it.',
       sv.verse_id, ev.verse_id, 'extras', 3232
  FROM _s212_m0508_lookup sv, _s212_m0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 15
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 7 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* The earth-bound multitude the Hebrew library locates; *Legion: for we are many* (Mark 5:9) is the gospel''s word for the same class.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 9
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth.* The torment of the man among the tombs — crying, cutting himself with stones — is the work the Hebrew library attributes to the spirits of the giants.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 9
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 15:11 — the spirits *destroy without incurring judgement... until the day of the consummation, the great judgement.* The drowning in the sea is the King displacing their administration of the eastern territory, not their final judgement, which waits for the day appointed.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 13
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 16:1 — *And from the beginning thus have I been shown concerning you, and written concerning you.* The unclean spirit the King commands out (Mark 5:8) is no faceless force; the Hebrew library had recorded its lineage and its sentence — *You have no peace* (1 Enoch 16:4).'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 8
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 16 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 10:1 — *the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* The legion''s plea not to be sent *out of the country* (Mark 5:10) is the plea not to lose the ground from which it leads astray.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 10
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 10:8 — Mastêmâ obtains that *the tenth part of them remain before him, and let nine parts descend into the place of condemnation.* The legion is part of the tenth-part still permitted to operate; the King''s casting-out (Mark 5:13) is the partially-restrained-spirits framework walked into one deliverance.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 13
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 19:1 — the spirits *lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement.* The man restored *in his right mind* (Mark 5:15) is the leading-astray undone in one man, a sign of the judgement reserved for the spirits themselves.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-5-legion-and-the-evil-spirits-of-the-giants-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 15
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 19 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 3:7 — *He that fears Yahuah (God) will honour his father, and will do service to his parents, as to his masters.* The wisdom-stream makes honour-of-parents the test of the fear of Yahuah; the corban device (Mark 7:10) severs the two it had joined.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 3 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 3:8 — *Honour your father and mother both in word and deed, that a blessing may come upon you from them.* The word-AND-deed the corban ruling severs (Mark 7:12) — honour in vow-formula while the deed of provision is forbidden.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 12
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 3 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 3:9 — *the blessing of the father establishes the houses of children; but the curse of the mother rooteth out foundations.* The man-made tradition that voids the commandment (Mark 7:13) forfeits the blessing and invites the uprooting the wisdom-stream had already named.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 3 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: mark-7-defilement-from-within-the-heart-the-source-of-evil-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 15:14 — *He himself made man from the beginning, and left him in the hand of his counsel.* The Hebrew library locates the source of evil in the man''s own choosing; Mark 7:20''s *that which cometh out of the man, that defileth the man* names the same.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-7-defilement-from-within-the-heart-the-source-of-evil-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 15 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 27:6 — *The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* The outward utterance discloses the inward heart; Mark 7:21''s *from within, out of the heart of men, proceed evil thoughts* is the same diagnostic — the fruit declares the tree.'
  FROM cross_reference_threads t, cross_references x, _s212_m0508_lookup sv, _s212_m0508_lookup tv
 WHERE t.slug = 'mark-7-defilement-from-within-the-heart-the-source-of-evil-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 21
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 27 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
