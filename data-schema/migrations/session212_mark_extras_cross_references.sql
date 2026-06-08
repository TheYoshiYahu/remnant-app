-- =====================================================================
-- Session 212 — Mark extras-library (outside-canon) cross-references
-- =====================================================================
-- Fills the Mark gap identified at S212: the existing Mark xref
-- migration carried ZERO outside-canon member rows (extras were quoted in
-- summary_md only / never inserted). This migration adds the missing
-- edition-aware cross-references + framework threads connecting Mark
-- verses to the full restored library (Apocrypha, 1 Enoch, Jubilees,
-- Jasher, Testaments XII / Pseudepigrapha, etc.), per the S194 full-library
-- authoring requirement and the Come-and-See posture (quote in full,
-- stand-alone italics, curated + framework-bearing rows only).
--
-- Assembled from per-chapter-range minion fragments (S212 wave). Every
-- target tuple verified against the parsed editions (verify_fidelity.py:
-- 202/202 faithful; verify_offset.py clean). Sacred names restored;
-- son-of-man -> Son of Adam; English book-name slug fragments.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- Apply (from Yoshi's Mac Terminal):
--   python3 api/apply_migration.py data-schema/migrations/session212_mark_extras_cross_references.sql
-- =====================================================================

\echo 'Session 212 — Mark extras-library cross-references starting...'
BEGIN;

-- ----- fragment: minion_mark_01_04.sql -----
-- =====================================================================
-- S212 minion fragment — MARK 1-4 outside-canon (extras-library) cross-references
-- =====================================================================
-- Range:       Mark 1, 2, 3, 4
-- Tag:         m0104   (temp view _s212_m0104_lookup)
-- Sort band:   3200-3229
-- Output:      scratch_xref/minion_mark_01_04.sql
--
-- Mark, Luke, and John carry ZERO outside-canon cross-references; the
-- S183 mark migration QUOTES extras inside summary_md / member_note
-- (1 Enoch 15-16 the watchers' bound offspring; 1 Enoch 10's chaining
-- of Azazel; Jubilees 10's binding of nine-tenths of the malignant
-- spirits) but never inserted them as edition-aware member rows because
-- `_s183_mark_lookup` was canon-scoped. This fragment promotes those
-- quoted-but-unlinked extras into real member rows AND adds the framework-
-- bearing extras the chapters warrant. Every target tuple verified against
-- EXTRAS_INVENTORY.md.
--
-- THREE new extras-tier threads (sort 3200-3202):
--   3200  mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch
--           targets: enoch (1 Enoch 15:6-7, 15:11, 16:1, 19:1)
--           Mark 1:24 + Mark 3:11 — the unclean spirits recognize the
--           Holy One because they ARE the watchers' bound offspring of
--           1 Enoch 15-16, the evil spirits gone forth from the giants'
--           flesh, who recognize the Formed one and are silenced.
--   3201  mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees
--           targets: enoch (1 Enoch 10:4, 10:11-12), jubilees
--           (Jubilees 5:6, 10:7-8, 10:11)
--           Mark 3:27 — "bind the strong man" reads against the binding
--           of Azazel hand-and-foot (1 Enoch 10:4), the binding of
--           Semjaza and his associates (1 Enoch 10:11-12), the binding of
--           the watchers in the depths (Jubilees 5:6), and the Mastema-
--           negotiation that bound nine-tenths of the malignant spirits
--           (Jubilees 10:7-8, 11).
--   3202  mark-4-the-seed-sown-and-the-evil-seed-in-the-heart-of-adam-in-2-esdras
--           targets: apocrypha (2 Esdras 4:28-32, 8:41, 9:31-33)
--           Mark 4 the sower / secret of the kingdom — the evil seed sown
--           in the heart of Adam awaiting the time of threshing (2 Esdras
--           4:28-32), the husbandman's seed that does not all come up
--           (8:41), and the law sown that brings fruit only in those who
--           keep what was sown in them (9:31-33).
--
-- Chapters with NO extras add: Mark 2. The Mark 2 reading (Son of Adam
-- forgiving sins, the bridegroom, new wine in new wineskins, "the Sabbath
-- was made for man") is carried by canon anchors (Daniel 7, Jeremiah 31,
-- Ezekiel 36, Genesis 2, Exodus 20) in the S183 bulk member-additions;
-- no extras-library edition surfaces a framework-bearing connection at the
-- rigour this migration requires that is not already better served by the
-- canon threads. So Mark 2 carries no extras add here.
--
-- 12 cross_references rows, 12 member rows, all tier_required='extras'.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (edition-aware, scoped to this transaction).
CREATE TEMP VIEW _s212_m0104_lookup AS
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
-- Insert 12 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 3200: mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch
  ('canon', 'mark', 1, 24, 'enoch', '1-enoch', 15, 6,
   E'*And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* (1 Enoch 15:6-7 reads: *Evil spirits have proceeded from their bodies; because they are born from men and from the holy Watchers is their beginning and primal origin... And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth.*) The unclean spirit that cries in the synagogue — *I know thee who thou art, the Holy One of Elohim (God)* — is one of these: an evil spirit gone forth from the slain giants'' flesh, the watchers'' offspring under restraint. It recognizes the Formed one before the watching crowd can name him because it was there at the rebellion. The recognition is not the sheep''s hearing; the demons know and tremble, and the King silences them.'),
  ('canon', 'mark', 1, 24, 'enoch', '1-enoch', 15, 11,
   E'*From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement.* 1 Enoch 15:11 names the unclean spirit''s origin and its appointed end: the spirits gone forth from the giants destroy until the day of the great judgement. The demon''s own question at Mark 1:24 — *art thou come to destroy us?* — names that it knows its judgement-day is fixed; the watchers'' offspring recognize that the Holy One of Elohim is the one who holds the day of their consummation.'),
  ('canon', 'mark', 1, 24, 'enoch', '1-enoch', 16, 1,
   E'*And from the beginning thus have I been shown concerning you, and written concerning you... Say to them therefore: "You have no peace."* (1 Enoch 16:1, 16:4.) The watchers and the evil spirits gone forth from their giant-offspring *have no peace* — the sentence is written from the beginning. The unclean spirit''s cry *Let us alone; what have we to do with thee?* (Mark 1:24) is the no-peace condition speaking: it knows the Holy One''s coming is the disturbance of a peace it was never granted.'),
  ('canon', 'mark', 3, 11, 'enoch', '1-enoch', 19, 1,
   E'*Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* 1 Enoch 19:1 names the watcher-spirits and their appointed standing-place of judgement. At Mark 3:11 the unclean spirits *fell down before him, and cried, saying, Thou art the Son of Elohim (God)* — the watcher-administration recognizing the Judge before whom it must one day stand, falling down before the Formed one whose great-judgement-day is named in the Enochic library.'),

  -- Thread 3201: mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees
  ('canon', 'mark', 3, 27, 'enoch', '1-enoch', 10, 4,
   E'*And again Yahuah (God) said to Raphael: "Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein."* 1 Enoch 10:4-6 names the binding of Azazel hand-and-foot, cast into the desert-darkness, reserved *on the day of the great judgement* to be cast into the fire. Mark 3:27''s *no man can enter into a strong man''s house, and spoil his goods, except he will first bind the strong man; and then he will spoil his house* walks the same binding-architecture: the King''s ministry is the incursion that binds the strong-man so the captives can be released. The Enochic library supplies the typological anchor the gospel walks.'),
  ('canon', 'mark', 3, 27, 'enoch', '1-enoch', 10, 11,
   E'*And Yahuah (God) said unto Michael: "Go, bind Semjâzâ and his associates who have united themselves with women... bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation."* (1 Enoch 10:11-12.) The binding of Semjaza and the watchers in the valleys of the earth until the day of judgement is the same strong-man-bound architecture Mark 3:27 names. The spoiling of the strong-man''s house — the casting-out of devils the chapter is contesting — presupposes the binding the Enochic library already recorded.'),
  ('canon', 'mark', 3, 27, 'jubilees', 'jubilees', 5, 6,
   E'*And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* Jubilees 5:6 carries the same binding-of-the-watchers the Enochic library records — bound in the depths of the earth and kept separate. Mark 3:27''s binding of the strong-man before his house can be spoiled walks the architecture Jubilees names: the rebel-administration is held under restraint, and the King''s incursion is the spoiling that follows the binding.'),
  ('canon', 'mark', 3, 27, 'jubilees', 'jubilees', 10, 7,
   E'*And Yahuah our Elohim (the LORD our God) bade us to bind all. And the chief of the spirits, Mastêmâ, came and said: "Yahuah (God), Creator, let some of them remain before me... for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men."* (Jubilees 10:7-8.) Noah''s prayer brings the command to bind ALL the malignant spirits; Mastema''s negotiation leaves a remnant under restraint. Mark 3:27 names the strong-man whose house must be entered and spoiled — and the Beelzebub-accusation of Mark 3:22 mistakes the King''s spoiling of Mastema''s remnant for collusion with the prince of the devils. The binding the Father commanded is the architecture the strong-man-parable presupposes.'),
  ('canon', 'mark', 3, 27, 'jubilees', 'jubilees', 10, 11,
   E'*And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* Jubilees 10:11 names the binding of nine-tenths of the malignant spirits in the place of condemnation, with a tenth left under Satan''s administration on the earth — the strong-man''s remaining household. Mark 3:27''s binding-then-spoiling is the King''s incursion against that remnant: the strong man bound so his goods can be carried off, the captives of the tenth-part released.'),

  -- Thread 3202: mark-4-the-seed-sown-and-the-evil-seed-in-the-heart-of-adam-in-2-esdras
  ('canon', 'mark', 4, 15, 'apocrypha', '2-esdras', 4, 30,
   E'*For the grain of evil seed has been sown in the heart of Adam from the beginning, and how much ungodliness has it brought up to this time? and how much shall it yet bring forth until the time of threshing come?* 2 Esdras 4:30-31 names the evil-seed-sown-in-the-heart-of-Adam architecture. The sower''s seed by the way-side that *Satan cometh immediately, and taketh away* (Mark 4:15) and the soils that bring forth no fruit are the same diagnostic: the evil seed contests the good seed in the heart until the time of threshing. The Hebrew library names the two-seeds-in-the-heart the parable enacts in the four-soils.'),
  ('canon', 'mark', 4, 29, 'apocrypha', '2-esdras', 4, 28,
   E'*But as concerning the things of which you ask me, I will tell you; for the evil is sown, but the destruction thereof is not yet come.* (2 Esdras 4:28, with 4:32 — *And when the ears shall be cut down, which are without number, how great a floor shall they fill?*) The sown-evil awaits its appointed harvest-floor. Mark 4:29''s *when the fruit is brought forth, immediately he putteth in the sickle, because the harvest is come* names the same appointed threshing 2 Esdras 4 names: the seed grows of itself by the Father''s clock until the cutting-down of the ears, the harvest-floor of the age.'),
  ('canon', 'mark', 4, 20, 'apocrypha', '2-esdras', 9, 31,
   E'*For, behold, I sow my law in you, and it shall bring fruit in you, and you shall be honoured in it for ever. But our fathers, which received the law, kept it not... they that received it perished, because they kept not the thing that was sown in them.* (2 Esdras 9:31-33.) The law sown to bring fruit, and the fathers who perished because they kept not what was sown in them, is the same hearing-and-keeping diagnostic Mark 4:20 names: *such as hear the word, and receive it, and bring forth fruit, some thirtyfold, some sixty, and some an hundred.* The good ground is the heart that keeps the sown word; the Hebrew library names the law-sown-bringing-fruit the good-ground parable walks.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_m0104_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug      = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number   = i.src_v
  JOIN _s212_m0104_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug      = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number   = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 3 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch',
       E'The unclean spirits as the watchers'' bound offspring who recognize the Holy One — 1 Enoch',
       E'Twice in Mark 1-3 the unclean spirits cry out and name what the watching crowds cannot yet say — *I know thee who thou art, the Holy One of Elohim (God)* (Mark 1:24), *Thou art the Son of Elohim (God)* (Mark 3:11). The Enochic library names exactly who they are. 1 Enoch 15:6-7 — *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth... Evil spirits have proceeded from their bodies; because they are born from men and from the holy Watchers is their beginning and primal origin.* These are the watchers'' offspring: the spirits gone forth from the slain giants'' flesh. 1 Enoch 15:11 names their appointed end — *thus shall they destroy until the day of the consummation, the great judgement* — which is why the demon at Mark 1:24 asks *art thou come to destroy us?* It knows its judgement-day is fixed. 1 Enoch 16:1, 4 names their sentence — *Say to them therefore: "You have no peace"* — the no-peace condition speaking in the demon''s *Let us alone.* 1 Enoch 19:1 names the standing-place of their judgement — *here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The unclean spirits recognize the Formed one before the people do because they were there at the rebellion; the recognition is not the sheep''s hearing — the demons know and tremble, and the Son of Adam silences them, because the kingdom is not announced through unclean mouths.',
       sv.verse_id, ev.verse_id, 'extras', 3200
  FROM _s212_m0104_lookup sv, _s212_m0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 1 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 3 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees',
       E'Binding the strong man — the binding of Azazel and the watcher-spirits in 1 Enoch and Jubilees',
       E'*No man can enter into a strong man''s house, and spoil his goods, except he will first bind the strong man; and then he will spoil his house* (Mark 3:27). The binding-then-spoiling architecture the King names is the architecture the Enochic and Jubilees libraries already recorded. 1 Enoch 10:4-6 names the binding of Azazel — *Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert... and on the day of the great judgement he shall be cast into the fire.* 1 Enoch 10:11-12 names the binding of Semjaza and his associates — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation.* Jubilees 5:6 carries the same — *He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* Jubilees 10:7-8 names the Mastema-negotiation — the chief of the spirits asking that a remnant be left to him *to execute the power of my will on the sons of men* — and Jubilees 10:11 names the verdict — *all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The strong-man whose house the King enters and spoils is the bound watcher-administration and the tenth-part remnant under Satan; the Beelzebub-accusation of Mark 3:22 mistakes the King''s spoiling of that remnant for collusion with the prince of the devils. The King''s ministry is the incursion that binds the strong-man so the captives can be released — the typological anchor supplied by the libraries that name the binding.',
       sv.verse_id, ev.verse_id, 'extras', 3201
  FROM _s212_m0104_lookup sv, _s212_m0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 3 AND sv.verse_number = 27
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 3 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-4-the-seed-sown-and-the-evil-seed-in-the-heart-of-adam-in-2-esdras',
       E'The seed sown and the evil seed in the heart of Adam — 2 Esdras and the secret of the kingdom',
       E'Mark 4''s sower-and-soils and seed-growing-of-itself parables walk an architecture the Hebrew library''s 2 Esdras had already named at the verse-level. 2 Esdras 4:30-31 names the evil-seed-sown-in-the-heart-of-Adam — *for the grain of evil seed has been sown in the heart of Adam from the beginning, and how much ungodliness has it brought up to this time? and how much shall it yet bring forth until the time of threshing come?* The seed by the way-side that *Satan cometh immediately, and taketh away* (Mark 4:15) and the soils that bring forth no fruit enact the two-seeds-in-the-heart 2 Esdras names. 2 Esdras 4:28, 32 names the appointed harvest-floor — *the evil is sown, but the destruction thereof is not yet come... when the ears shall be cut down, which are without number, how great a floor shall they fill?* — the same appointed threshing Mark 4:29''s *immediately he putteth in the sickle, because the harvest is come* names: the seed grows of itself by the Father''s clock until the cutting-down of the ears. 2 Esdras 9:31-33 names the law-sown-bringing-fruit and the fathers who perished *because they kept not the thing that was sown in them* — the same hearing-and-keeping diagnostic Mark 4:20''s good ground enacts, *such as hear the word, and receive it, and bring forth fruit.* The Hebrew library names the seed-sown architecture the secret of the kingdom walks; the difference is never the seed (the Word is the same in every soil) but the ground that keeps it.',
       sv.verse_id, ev.verse_id, 'extras', 3202
  FROM _s212_m0104_lookup sv, _s212_m0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 4 AND sv.verse_number = 14
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 4 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 3200: mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:6-7 — *the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth.* The unclean spirit at Mark 1:24 is one of the watchers'' bound offspring; it recognizes the Holy One because it was there at the rebellion.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 1 AND sv.verse_number = 24
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:11 — *thus shall they destroy until the day of the consummation, the great judgement.* The demon''s *art thou come to destroy us?* (Mark 1:24) knows its judgement-day is fixed in the one standing before it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 1 AND sv.verse_number = 24
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 16:1, 4 — *Say to them therefore: "You have no peace."* The demon''s *Let us alone* (Mark 1:24) is the no-peace condition speaking; the Holy One''s coming is the disturbance of a peace never granted.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 1 AND sv.verse_number = 24
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 16 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 19:1 — *here shall they stand, till the day of the great judgement in which they shall be judged.* At Mark 3:11 the unclean spirits fall down and cry *Thou art the Son of Elohim (God)* — recognizing the Judge before whom they must one day stand.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-1-3-unclean-spirits-as-the-watchers-bound-offspring-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 3 AND sv.verse_number = 11
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 19 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3201: mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4-6 — *Bind Azâzêl hand and foot, and cast him into the darkness... and on the day of the great judgement he shall be cast into the fire.* The binding of Azazel is the typological anchor for Mark 3:27''s binding of the strong-man before his house is spoiled.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 3 AND sv.verse_number = 27
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:11-12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement.* The binding of Semjaza and the watchers is the same strong-man-bound architecture the King names at Mark 3:27.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 3 AND sv.verse_number = 27
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:6 — *He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* Jubilees carries the same binding-of-the-watchers the strong-man-parable presupposes.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 3 AND sv.verse_number = 27
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 5 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:7-8 — Mastema asks *let some of them remain before me... for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men.* The Beelzebub-accusation (Mark 3:22) mistakes the King''s spoiling of Mastema''s remnant for collusion with the prince of the devils.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 3 AND sv.verse_number = 27
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 10:11 — *all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The strong-man''s remaining household is the tenth-part remnant; Mark 3:27''s binding-then-spoiling is the King''s incursion against it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-3-binding-the-strong-man-as-the-binding-of-azazel-and-the-spirits-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 3 AND sv.verse_number = 27
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3202: mark-4-the-seed-sown-and-the-evil-seed-in-the-heart-of-adam-in-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 4:30-31 — *the grain of evil seed has been sown in the heart of Adam from the beginning... until the time of threshing come.* The way-side seed Satan takes away (Mark 4:15) and the barren soils enact the two-seeds-in-the-heart 2 Esdras names.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-4-the-seed-sown-and-the-evil-seed-in-the-heart-of-adam-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 4 AND sv.verse_number = 15
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 4 AND tv.verse_number = 30
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 4:28, 32 — *the evil is sown, but the destruction thereof is not yet come... when the ears shall be cut down... how great a floor shall they fill?* Mark 4:29''s *immediately he putteth in the sickle, because the harvest is come* names the same appointed threshing-floor of the age.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-4-the-seed-sown-and-the-evil-seed-in-the-heart-of-adam-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 4 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 4 AND tv.verse_number = 28
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 9:31-33 — *I sow my law in you, and it shall bring fruit in you... they that received it perished, because they kept not the thing that was sown in them.* The same hearing-and-keeping diagnostic Mark 4:20''s good ground enacts — the heart that keeps the sown word brings forth fruit.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0104_lookup sv, _s212_m0104_lookup tv
 WHERE t.slug = 'mark-4-the-seed-sown-and-the-evil-seed-in-the-heart-of-adam-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 4 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 9 AND tv.verse_number = 31
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_05_08.sql -----
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

-- ----- fragment: minion_mark_09_12.sql -----
-- =====================================================================
-- S212 minion — Mark 9-12 outside-canon (extras-library) cross-references
-- =====================================================================
-- Range:      Mark 9, 10, 11, 12
-- Tag:        m0912  (temp view _s212_m0912_lookup)
-- Sort band:  3260-3289
-- Output:     scratch_xref/minion_mark_09_12.sql
--
-- Mark, Luke, and John carry ZERO outside-canon cross-references at the
-- member-row level; the S183 canon migration quotes Tanakh anchors but
-- never inserts extras-library member rows. This fragment adds the
-- framework-bearing extras connections Mark 9-12 warrants, promoting the
-- Hebrew library's own witness onto the chapter cards.
--
-- Four new PROPOSED threads at tier_required='extras':
--   1. mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch   (sort 3260)
--        targets: apocrypha (Judith), enoch (1 Enoch)
--   2. mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach                    (sort 3261)
--        targets: apocrypha (Ecclesiasticus / Sirach)
--   3. mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras             (sort 3262)
--        targets: apocrypha (2 Esdras)
--   4. mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon  (sort 3263)
--        targets: apocrypha (Wisdom of Solomon)
--
-- 12 new cross_references rows, 12 thread_members rows, all tier_required='extras'.
--
-- Deliberately NOT duplicated (already covered elsewhere in the corpus):
--   * Mark 10:45 ransom-for-many — the extras thread
--     `the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach`
--     (S155, anchored Matt 20:28) already exists, and S183 already wires Mark 10:45
--     into it as a canon-side member (Isaiah 53:10). Adding a second Mark-anchored
--     ransom extras thread would duplicate the framework connection — skipped.
--   * Mark 12:17 render-unto-Caesar — `render-unto-caesar-and-the-image-of-elohim-stamped-
--     on-man-in-sirach-and-wisdom-of-solomon` (S155, Matt 22:21) already carries the
--     image-of-Elohim-stamped-on-man extras architecture with the same target verses.
--   * Mark 12:30-31 Shema / love of Yahuah and neighbour —
--     `love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon`
--     (S155, Matt 22:37) already covers the greatest-commandment extras stream.
--   * Mark 12:36 David's Lord — `tehillim-110-1-davids-lord-formed-at-the-right-hand`
--     already exists canon-side (S183). No framework-bearing extras add the chapter
--     warrants beyond what the canon thread carries.
--   Mark 11 (triumphal entry, fig tree, temple cleansing, wicked-husbandmen authority
--   question) surfaced no NEW framework-bearing extras connection at the rigour the
--   migration requires beyond the cursed-fig-tree link S183 already places onto the
--   existing `leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch`
--   thread (Mark 11:20). No Mark-11-anchored add.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named — m0912 tag).
CREATE TEMP VIEW _s212_m0912_lookup AS
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
  -- Thread 1: mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch
  ('canon', 'mark', 9, 48, 'apocrypha', 'judith', 16, 17,
   E'*Woe to the nations that rise up against my kindred! Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* Judith 16:17 names the fire-and-worms judgment register in the same breath the gospel uses at Mark 9:48 — *where their worm dieth not, and the fire is not quenched.* The Hebrew library''s victory-song already pairs the unquenched fire with the deathless worm and the everlasting feeling of it; the King reads the same Tanakh-rooted Gehenna-image (Isaiah 66:24) that Judith''s song carries. The day-of-judgment frame and the *weep for ever* duration are the architecture Mark 9:48 walks.'),
  ('canon', 'mark', 9, 48, 'enoch', '1-enoch', 22, 11,
   E'*And these places have been made for them until the day of their judgement and until their appointed period, till the great judgement comes upon them.* 1 Enoch 22:11 names the place where the spirits of the dead are set apart against the great judgement — the framework-honest holding of the dead until the day, the architecture behind Mark 9:43-48''s *hell* (Gehenna). 1 Enoch 22 carries the same two-compartment structure the King names elsewhere; the place of punishment Mark warns against is the place 1 Enoch had already mapped, not the inherited eternal-torment caricature.'),
  ('canon', 'mark', 9, 43, 'enoch', '1-enoch', 27, 2,
   E'*And there was a holy mountain, and under the mountain to the east there was a stream flowing, and to the south another stream.* 1 Enoch 27:1-3 places the accursed valley — the Hinnom-shaped place of punishment for the godless — beside the holy mountain, the very Ge-Hinnom topography the gospel''s *hell* (Gehenna) draws its name from. The King''s *cut it off ... than having two hands to go into hell* (Mark 9:43) walks the same place-of-judgment architecture 1 Enoch maps at the middle of the earth: the accursed valley appointed for the day of judgment.'),

  -- Thread 2: mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach
  ('canon', 'mark', 10, 21, 'apocrypha', 'ecclesiasticus', 31, 8,
   E'*Blessed is the rich that is found without blemish, and has not gone after gold.* Sirach (Ecclesiasticus) 31:8 names the rare-blessing of the rich-who-has-not-gone-after-gold — the exact test the rich young ruler fails at Mark 10:21-22. The King''s *one thing thou lackest: go thy way, sell whatsoever thou hast, and give to the poor* lays the wisdom-stream''s diagnostic bare: the man''s riches have his heart, and he goes away grieved *for he had great possessions.* The Hebrew library had already named the blessedness of the rich who is not held by his gold; the gospel names the man held.'),
  ('canon', 'mark', 10, 23, 'apocrypha', 'ecclesiasticus', 31, 5,
   E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* Sirach (Ecclesiasticus) 31:5 names the gold-love-disqualifies architecture directly. Mark 10:23''s *how hardly shall they that have riches enter into the kingdom of Elohim (God)!* walks the same architecture at the kingdom-entry level: the gold-lover the wisdom-stream says shall not be justified is the rich man the gospel says hardly enters the kingdom.'),
  ('canon', 'mark', 10, 24, 'apocrypha', 'ecclesiasticus', 31, 6,
   E'*Gold has been the ruin of many, and their destruction was present.* Sirach (Ecclesiasticus) 31:6 names the gold-as-ruin diagnostic. Mark 10:24''s clarifying word — *how hard is it for them that trust in riches to enter into the kingdom of Elohim (God)!* — lands the diagnostic exactly where the wisdom-stream lands it: not on the riches themselves but on the trust-in-riches that has been the ruin of many. The closed hand that trusts in gold is the heart the gospel warns cannot pass through the needle''s eye.'),
  ('canon', 'mark', 10, 25, 'apocrypha', 'ecclesiasticus', 31, 7,
   E'*It is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Sirach (Ecclesiasticus) 31:7 names gold-as-stumblingblock-for-those-who-sacrifice-to-it — wealth as an object of worship that captures its devotees. Mark 10:25''s *it is easier for a camel to go through the eye of a needle, than for a rich man to enter into the kingdom of Elohim (God)* walks the same architecture: the one taken by the gold he sacrifices to cannot pass into the kingdom while the gold holds him.'),

  -- Thread 3: mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras
  ('canon', 'mark', 12, 1, 'apocrypha', '2-esdras', 5, 23,
   E'*O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* 2 Esdras 5:23 names the one-chosen-vine architecture — Yahuah''s singular election of one vine out of all the trees of the earth, the wisdom-stream''s own naming of the vineyard the King plants in the parable of Mark 12:1. The vineyard *let out to husbandmen* is the one-only-vine 2 Esdras names: the covenant body Yashar''el (Israel), chosen out of all the peoples, set with hedge and tower and winefat, then entrusted to the keepers who fail it.'),
  ('canon', 'mark', 12, 9, 'apocrypha', '2-esdras', 5, 27,
   E'*And among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* 2 Esdras 5:27 names the one-chosen-people-given-the-law architecture the wicked-husbandmen parable presupposes — the vineyard is the one people loved and given the Torah. Mark 12:9''s *what shall therefore the lord of the vineyard do? he will come and destroy the husbandmen, and will give the vineyard unto others* turns on the same election: the vineyard belongs to the lord who chose it, not to the keepers; the keepers who slay the heir forfeit the stewardship, but the one-only-vine remains the lord''s own.'),
  ('canon', 'mark', 12, 9, 'apocrypha', '2-esdras', 5, 29,
   E'*And they which did gainsay your promises, and believed not your covenants, have trodden them down.* 2 Esdras 5:29 names the covenant-trodden-down by those who gainsay the promises — the wisdom-stream''s lament over the very failure the wicked husbandmen embody at Mark 12. The keepers who beat the servants, kill the heir, and seize the inheritance are those who gainsaid the promises and believed not the covenants; the lord''s coming to destroy them and give the vineyard to others (Mark 12:9) answers the 2 Esdras lament with the master''s own judgment.'),

  -- Thread 4: mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon
  ('canon', 'mark', 12, 27, 'apocrypha', 'the-wisdom-of-solomon', 3, 1,
   E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom of Solomon 3:1 names the souls-of-the-righteous-in-the-Father''s-hand architecture the King invokes at Mark 12:27 — *he is not the Elohim (God) of the dead, but the Elohim (God) of the living.* The patriarchs Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob) are alive to the Father because the souls of the righteous are held in his hand against the resurrection; the Sadducees who deny the resurrection know neither the scriptures nor the power of Elohim. The Hebrew library had already named the righteous as living in the Father''s hand; the gospel names the same in the bush-revelation.'),
  ('canon', 'mark', 12, 26, 'apocrypha', 'the-wisdom-of-solomon', 3, 4,
   E'*For though they be punished in the sight of men, yet is their hope full of immortality.* Wisdom of Solomon 3:4 names the hope-full-of-immortality the resurrection-argument of Mark 12:26 grounds itself in. The King reads the bush-revelation — *I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob* — as the Father''s standing relation to the living, not to the perished. The wisdom-stream had already named the righteous as carrying a hope full of immortality though they die in the sight of men; the gospel names the resurrection that hope reaches toward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_m0912_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_m0912_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch',
       'The worm dieth not and the place of punishment in Judith and 1 Enoch',
       E'Mark 9:43-48''s thrice-repeated warning — *it is better for thee to enter into life maimed, than having two hands to go into hell, into the fire that never shall be quenched: where their worm dieth not, and the fire is not quenched* — draws its image from Isaiah 66:24 (canon), and the Hebrew library carries the same architecture. Judith 16:17 pairs the deathless worm with the unquenched fire in the day-of-judgment register: *Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* 1 Enoch maps the place itself: 1 Enoch 22:11 names the holding of the spirits of the dead *until the day of their judgement and until their appointed period, till the great judgement comes upon them* — the framework-honest two-compartment Sheol behind the gospel''s *hell* (Gehenna), not the inherited eternal-torment caricature; 1 Enoch 27:1-3 places the accursed valley beside the holy mountain, the Ge-Hinnom topography the word Gehenna draws its name from. The King names the place of judgment the Hebrew library had already mapped: the deathless worm, the unquenched fire, the accursed valley appointed for the day.',
       sv.verse_id, ev.verse_id, 'extras', 3260
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 43
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 9 AND ev.verse_number = 48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach',
       'The rich young ruler and riches as snare in Sirach',
       E'Mark 10:17-25''s rich young ruler — who keeps the commandments from his youth yet goes away grieved at the one thing he lacks, *for he had great possessions* — and the King''s following word, *how hardly shall they that have riches enter into the kingdom of Elohim (God)! ... it is easier for a camel to go through the eye of a needle, than for a rich man to enter into the kingdom of Elohim (God),* walk an architecture the Hebrew library''s wisdom-stream had already named at the gold-as-snare level. Sirach (Ecclesiasticus) 31:8 names the rare blessing of the rich-who-is-not-held: *blessed is the rich that is found without blemish, and has not gone after gold.* Sirach 31:5 names the disqualification: *he that loves gold shall not be justified.* Sirach 31:6 names the ruin: *gold has been the ruin of many, and their destruction was present.* Sirach 31:7 names the worship-trap: *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* The diagnostic is not riches-as-such but the heart held by gold — the King''s clarifying word lands it exactly where the wisdom-stream lands it: *how hard is it for them that trust in riches.* The Hebrew library had already named the blessedness of the rich who is not held and the ruin of the one who is; the gospel names the man held, and names the impossibility-made-possible only with Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 3261
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 21
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 10 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras',
       'The wicked husbandmen and the one chosen vine in 2 Esdras',
       E'Mark 12:1-11''s parable of the wicked husbandmen — the vineyard *planted ... and set an hedge about it, and digged a place for the winefat, and built a tower, and let it out to husbandmen,* whose keepers beat the servants, kill the heir, and seize the inheritance until the lord *will come and destroy the husbandmen, and will give the vineyard unto others* — turns on the election of the vineyard the wisdom-stream had already named. 2 Esdras 5:23 names the one chosen vine: *of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* 2 Esdras 5:27 names the one chosen people given the law: *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* 2 Esdras 5:29 laments the covenant trodden down: *they which did gainsay your promises, and believed not your covenants, have trodden them down.* The vineyard is Yashar''el (Israel), the one-only-vine chosen out of all the trees and the one people given the Torah; the wicked husbandmen are the keepers who gainsay the promises and tread the covenant down, slaying the servants and the heir. The lord''s coming to destroy them and give the vineyard to others answers the 2 Esdras lament: the vineyard belongs to the lord who chose it, and the stewardship passes from the keepers who failed it — not the inheritance taken from the vine, but the keeping taken from the faithless keepers. The rejected stone become the head of the corner (Mark 12:10-11) is Yahuah''s own doing over the same chosen vine.',
       sv.verse_id, ev.verse_id, 'extras', 3262
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 12 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon',
       'The Elohim of the living and the souls of the righteous in Wisdom of Solomon',
       E'Mark 12:18-27''s resurrection-argument against the Sadducees — who say there is no resurrection — turns on the bush-revelation: *have ye not read in the book of Moses, how in the bush Elohim (God) spake unto him, saying, I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? He is not the Elohim (God) of the dead, but the Elohim (God) of the living.* The Hebrew library''s Wisdom of Solomon had already named the architecture the King reads. Wisdom 3:1 names the souls-of-the-righteous-in-the-Father''s-hand: *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom 3:4 names the hope-full-of-immortality the resurrection reaches toward: *though they be punished in the sight of men, yet is their hope full of immortality.* The patriarchs are alive to the Father because the souls of the righteous are held in his hand against the resurrection; the Sadducees err because they know neither the scriptures nor the power of Elohim. The wisdom-stream had already named the righteous as living in the Father''s hand and carrying a hope full of immortality; the gospel names the same in the bush-revelation, and names the resurrection that hope reaches toward.',
       sv.verse_id, ev.verse_id, 'extras', 3263
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 26
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 12 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judith 16:17 — *Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* The Hebrew library''s victory-song pairs the deathless worm with the unquenched fire in the day-of-judgment register; Mark 9:48''s *where their worm dieth not, and the fire is not quenched* walks the same Isaiah-66-rooted image.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 48
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'judith' AND tv.chapter_number = 16 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 27:1-3 — the accursed valley beside the holy mountain, the Ge-Hinnom topography the word *hell* (Gehenna) draws its name from; Mark 9:43''s *cut it off ... than having two hands to go into hell* walks the same place-of-judgment architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 43
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 27 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 22:11 — *these places have been made for them until the day of their judgement ... till the great judgement comes upon them.* The framework-honest two-compartment holding of the dead behind the gospel''s *hell* (Gehenna); Mark 9:48 names the place 1 Enoch had already mapped, not the inherited eternal-torment caricature.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 48
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 31:8 — *blessed is the rich that is found without blemish, and has not gone after gold.* The rare blessing of the rich-who-is-not-held; the rich young ruler of Mark 10:21-22 fails the test and goes away grieved *for he had great possessions.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 21
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 31:5 — *he that loves gold shall not be justified.* The gold-love-disqualifies architecture; Mark 10:23''s *how hardly shall they that have riches enter into the kingdom of Elohim (God)!* walks the same at the kingdom-entry level.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 23
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 31:6 — *gold has been the ruin of many, and their destruction was present.* The gold-as-ruin diagnostic; Mark 10:24''s clarifying *how hard is it for them that trust in riches* lands the diagnostic on the trust-in-riches, exactly where the wisdom-stream lands it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 31:7 — *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Wealth as an object of worship that captures its devotees; Mark 10:25''s camel-and-needle names the impossibility for the one taken by the gold he sacrifices to.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 25
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:23 — *of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* The one-chosen-vine architecture; the vineyard let out to husbandmen at Mark 12:1 is the one-only-vine Yashar''el (Israel), chosen out of all the trees.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 5:27 — *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law.* The one-chosen-people-given-the-law; Mark 12:9''s *the lord of the vineyard ... will give the vineyard unto others* turns on the same election — the vineyard belongs to the lord who chose it, the keeping passes from the keepers who failed.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 9
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 27
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 5:29 — *they which did gainsay your promises, and believed not your covenants, have trodden them down.* The covenant-trodden-down lament; the wicked husbandmen who slay the servants and the heir are the keepers who gainsaid the promises, and the lord''s judgment at Mark 12:9 answers the 2 Esdras lament.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 9
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 29
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 3:1 — *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The souls-of-the-righteous-in-the-Father''s-hand; Mark 12:27''s *he is not the Elohim (God) of the dead, but the Elohim (God) of the living* names the patriarchs alive to the Father who holds them against the resurrection.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:4 — *though they be punished in the sight of men, yet is their hope full of immortality.* The hope-full-of-immortality the resurrection reaches toward; Mark 12:26''s bush-revelation reads the Father''s standing relation to the living, not the perished.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 26
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_13_16.sql -----
-- =====================================================================
-- S212 minion fragment — Mark 13-16 outside-canon (extras) cross-references
-- =====================================================================
-- Range:    Mark 13, 14, 15, 16 (Olivet discourse / the gathering of the
--           elect from the four winds; the anointing at Bethany; the Last
--           Supper / the blood of the covenant; Gethsemane; the trial /
--           "I am" / "ye shall see the Son of Adam sitting on the right
--           hand of power"; Peter's denial; the crucifixion / "my Elohim
--           my Elohim why hast thou forsaken me" / the veil rent; the
--           resurrection).
-- Tag:      m1316   (temp view _s212_m1316_lookup)
-- Band:     sort_order 3290-3319
--
-- Mark already carries FULL canon coverage for this range in S183
-- (abomination-of-desolation, no-man-knoweth-the-day, like-the-son-of-
-- adam-coming-with-the-clouds at 13:26 & 14:62 [canon Daniel/Rev/Zech],
-- wheat-and-tares post-harvest sifting at 13:27 [canon Ezekiel/Deut],
-- abba-father at 14:36, last-supper / barabbas / his-blood-be / eli-eli /
-- veil-of-the-temple / sanhedrin-trial-Tehillim-110-and-Daniel-7 /
-- substantial-crucifixion / women-as-first-witnesses). Mark had ZERO
-- outside-canon member rows. This fragment ADDS three framework-bearing
-- extras threads that the existing Matthew extras threads carry only at
-- Matthew anchors (Matthew slugs are globally taken; these are NEW
-- Mark-prefixed slugs so they complement, never duplicate):
--
--   1. mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach   (sort 3290)
--        targets: apocrypha 2-esdras 13:39,40,47 ; baruch-with-the-letter-of-jeremiah 4:37 & 5:5 ; ecclesiasticus 36:11
--   2. mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables                              (sort 3291)
--        targets: enoch 1-enoch 46:1,3,4 ; 62:1,7,9
--   3. mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees               (sort 3292)
--        targets: apocrypha 1-maccabees 1:63 & 2:50 ; 2-maccabees 7:36
--
-- 15 cross_references rows (all tier_required='extras'); 15 thread_members.
--
-- Kaph note (Red Line #12): Mark 13:26 and 14:62 are DIRECT attribution
-- ("the Son of Adam coming in the clouds", "ye shall see the Son of Adam
-- sitting on the right hand of power") — NO kaph. The kaph-comparative
-- carve-out applies only to Daniel 7:13 / Revelation 1:13 / Revelation
-- 14:14, none of which is touched here. 1 Enoch 46-62 names the Son of
-- Adam as a title (the Elect One seated on the throne of glory) — this is
-- title-naming, NOT the kaph-comparative, and it harmonizes with the
-- direct-attribution Markan self-identification at 14:62. Thread 2 keeps
-- that distinction explicit.
--
-- No-add chapters: Mark 15 and Mark 16 warrant no NEW extras thread. The
-- crucifixion substance (Tehillim 22 citation, Yeshayahu 53, the veil
-- rent) and the resurrection-witness substance are already carried at
-- canon tier in S183, and the framework-bearing extras already in the
-- corpus for the veil (the-temple-veil-rent...-in-2-baruch-and-
-- testaments-xii) and the cup of suffering / vindication of the righteous
-- (the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-
-- of-solomon-and-2-maccabees) and the resurrection-substance are anchored
-- elsewhere; no distinct Mark 15/16 outside-canon connection rises to the
-- rigour the migration requires without re-treading those threads.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view. Same edition filter family as S135 / the brief.
CREATE TEMP VIEW _s212_m1316_lookup AS
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
-- Insert 14 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach
  ('canon', 'mark', 13, 27, 'apocrypha', '2-esdras', 13, 39,
   E'*And whereas you sawest that he gathered another peaceable multitude to him.* 2 Esdras (4 Ezra) 13:39 names the peaceable-multitude the Most High gathers to the man who ascends — and the verses that follow (13:40-47) identify them by name: the ten tribes of the house of Yashar''el (Israel) carried away captive. Mark 13:27''s *he shall send his angels, and shall gather together his elect from the four winds* walks the same architecture the Hebrew library had already named: the gathering is the homecoming of the scattered paternal-blood remnant, not the assembling of a self-selected community. The wisdom-stream names whom the gathering gathers.'),
  ('canon', 'mark', 13, 27, 'apocrypha', '2-esdras', 13, 40,
   E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* 2 Esdras (4 Ezra) 13:40 names the ten tribes of the house of Yashar''el (Israel) by the precise history of their scattering — the Assyrian captivity under Hoshea and Shalmaneser. Mark 13:27''s gathering *from the uttermost part of the earth to the uttermost part of heaven* is the answering-act to this scattering: the same tribes the Hebrew library traced into the further country are the elect the angels gather at the end.'),
  ('canon', 'mark', 13, 27, 'apocrypha', '2-esdras', 13, 47,
   E'*The Highest shall stay the springs of the stream again, that they may go through: therefore sawest you the multitude with peace.* 2 Esdras (4 Ezra) 13:47 names the return-passage the Most High opens for the ten tribes at the latter time — the same Most High who held the flood for them at the going-out holds it again for the coming-home. Mark 13:27''s gathering of the elect from the four winds is the gospel-form of this homecoming the wisdom-stream had already named: the scattered seed brought back by the act of the Most High, not by their own contriving.'),
  ('canon', 'mark', 13, 27, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37,
   E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* Baruch 4:37 names the four-quarters gathering directly — the sons who were sent away come *from the east to the west by the word of the Holy One.* Mark 13:27''s *gather together his elect from the four winds* walks the same Hebrew library architecture: the gathering is of those who were sent away (the scattered), and it is accomplished by the word of the Holy One — the Son of Adam who has just been named coming in the clouds (13:26).'),
  ('canon', 'mark', 13, 27, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5,
   E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch 5:5 names the gathering from the opposite quarter — *from the west to the east* — so that Baruch 4:37 and 5:5 together name the gathering from every direction, the four-winds substance Mark 13:27 carries. The children gathered are the scattered children of Yerushalayim (Jerusalem) brought home by the word of the Holy One; Mark''s *from the four winds, from the uttermost part of the earth* is the same paternal-blood ingathering at the end of the age.'),
  ('canon', 'mark', 13, 27, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 prays the gathering as the petition of the wisdom-stream — *gather all the tribes of Jacob together* — and names whom: not a believing remnant of any people, but *all the tribes of Jacob,* the twelve-tribe inheritance *as from the beginning.* Mark 13:27''s gathering of the elect from the four winds is the answered form of this prayer: the Son of Adam sends his angels to gather the very tribes the Hebrew library had been praying home.'),

  -- Thread 2: mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 46, 1,
   E'*And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels.* 1 Enoch 46:1 names the throne-room scene the King invokes under oath at Mark 14:62 — *ye shall see the Son of Adam sitting on the right hand of power.* The Parables of Enoch place the Son of Adam beside the Head of Days: the Formed beside the Formless source. Mark 14:62 is direct attribution (no kaph); 1 Enoch 46 names the Son of Adam as a title, the figure beside the Head of Days — title-naming, distinct from the kaph-comparative of Daniel 7:13 / Revelation 1:13 / Revelation 14:14. The two harmonize: the King names himself the one the Parables saw beside the Head of Days.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 46, 3,
   E'*This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* 1 Enoch 46:3 names the Son of Adam as the chosen one whose lot has the pre-eminence before Yahuah (God) of Spirits for ever. Mark 14:62''s *the Son of Adam sitting on the right hand of power* names the same pre-eminence-at-the-right-hand the Parables had already given the chosen Son of Adam. The wisdom-stream named the enthroned, chosen Son of Adam; the King names himself as that figure at the Sanhedrin''s own question.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 46, 4,
   E'*And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, and shall loosen the reins of the strong, and break the teeth of the sinners.* 1 Enoch 46:4 names the judging-act of the enthroned Son of Adam — he raises the kings and the mighty from their thrones. Mark 14:62''s *ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* carries the same architecture: the figure the Sanhedrin condemns is the figure who will raise the mighty from their seats. The wisdom-stream had already named the reversal — the condemned Son of Adam is the one enthroned to judge those who condemn him.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 62, 1,
   E'*And thus Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory, and he shall judge all the works of the holy in heaven above, and weigh their deeds in the balance.* 1 Enoch 62:1 names the seating directly — the Elect One *seated on the throne of His glory.* Mark 14:62''s *sitting on the right hand of power* walks the same enthronement the Parables had already named. The Hebrew library names the throne of glory the Son of Adam is seated upon; the King names himself seated at the right hand of power before the very court that thinks it judges him.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 62, 7,
   E'*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, and righteousness abides over him, and the righteousness of the Head of Days forsakes him not.* 1 Enoch 62:7 names the Son of Adam born unto righteousness, over whom the righteousness of the Head of Days never fails. Mark 14:62''s self-identification — *I am: and ye shall see the Son of Adam sitting on the right hand of power* — names the same figure the Parables named: the righteous one whom the Head of Days does not forsake, enthroned at the right hand. The title-naming of the Parables and the direct attribution of the King land on one figure.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 62, 9,
   E'*And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, and the strong from their thrones, and shall loosen the reins of the strong, and break the teeth of the sinners.* 1 Enoch 62:9 names again the judging-reversal of the enthroned Son of Adam — the kings and the mighty raised from their thrones before him. Mark 14:62''s *coming in the clouds of heaven* binds the enthronement to the return: the same Son of Adam seated at the right hand of power comes to judge those who condemned him. The wisdom-stream named the kings-and-mighty-cast-down architecture the King invokes at the trial.'),

  -- Thread 3: mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees
  ('canon', 'mark', 14, 24, 'apocrypha', '1-maccabees', 1, 63,
   E'*Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* 1 Maccabees 1:63 names the faithful who chose death rather than profane the holy covenant. Mark 14:24''s *this is my blood of the new testament, which is shed for many* names the covenant sealed in blood — the King''s own blood given for the covenant. The Hebrew library had named the faithful dying for the covenant; the King names the covenant itself sealed by the blood he is about to shed.'),
  ('canon', 'mark', 14, 24, 'apocrypha', '1-maccabees', 2, 50,
   E'*Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* 1 Maccabees 2:50 names Mattathias'' charge — give your lives for the covenant of your fathers. Mark 14:24''s *my blood of the new testament, which is shed for many* is the King giving his own life for the covenant, the substance the Hebrew library named at the martyr-register. The covenant the Maccabean faithful died for is the covenant the King seals in his blood shed for many — the blood-of-the-covenant architecture the wisdom-stream had already carried.'),
  ('canon', 'mark', 14, 24, 'apocrypha', '2-maccabees', 7, 36,
   E'*For our brothers, who now have suffered a short pain, are dead under the covenant of Yahuah (God) of everlasting life.* 2 Maccabees 7:36 names the brothers dead *under the covenant of Yahuah (God) of everlasting life* — the faithful-unto-death-for-the-covenant whose dying is held within the covenant of everlasting life. Mark 14:24''s blood *shed for many* is the covenant-of-everlasting-life sealed in the King''s blood; the Hebrew library named the everlasting-life covenant the martyrs died under, and the King names the blood that seals it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_m1316_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug      = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number   = i.src_v
  JOIN _s212_m1316_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug      = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number   = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 3 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach',
       E'The gathering of the elect from the four winds and the ten tribes in 2 Esdras, Baruch, and Sirach',
       E'Mark 13:27 — *and then shall he send his angels, and shall gather together his elect from the four winds, from the uttermost part of the earth to the uttermost part of heaven* — names the ingathering that answers the scattering. The canon anchors (Ezekiel 37:21, Deuteronomy 30:4) are carried at the free tier in S183; the Hebrew library names whom the gathering gathers. 2 Esdras (4 Ezra) 13:39-47 identifies the *peaceable multitude* the man-who-ascends gathers as the ten tribes of the house of Yashar''el (Israel): *those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* (13:40), and the Most High *shall stay the springs of the stream again, that they may go through* at the latter time (13:47) — the same act that held the flood at the going-out opens the passage at the coming-home. Baruch names the four-quarters gathering directly: *your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One* (4:37), and *behold your children gathered from the west to the east by the word of the Holy One* (5:5) — the two together naming the gathering from every direction, accomplished by the word of the Holy One (the Son of Adam just named coming in the clouds at 13:26). Sirach (Ecclesiasticus) 36:11 prays it as petition: *gather all the tribes of Jacob together, and inherit you them, as from the beginning* — not a believing remnant of any people, but all twelve tribes, the inheritance as from the beginning. The gathering of the elect from the four winds is the homecoming of the scattered paternal-blood remnant the prophets and the wisdom-stream named — accomplished by the act of the Most High, not by a self-selected community''s contriving.',
       sv.verse_id, ev.verse_id, 'extras', 3290
  FROM _s212_m1316_lookup sv, _s212_m1316_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 13 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables',
       E'The Son of Adam enthroned on the throne of glory in the Parables of Enoch',
       E'Mark 14:62 — the King''s answer under oath at the Sanhedrin: *I am: and ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* This is direct attribution — no kaph. (The kaph-comparative carve-out of Red Line #12 applies only to Daniel 7:13 / Revelation 1:13 / Revelation 14:14, none of which is in view here.) The Parables of Enoch name the same figure as a title, the Son of Adam beside the Head of Days: *with Him was another being whose countenance had the appearance of a man... this is the Son of Adam who hath righteousness, with whom dwelleth righteousness... whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever* (1 Enoch 46:1, 3), and *this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats* (46:4). 1 Enoch 62 names the seating directly: *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory* (62:1); *this is the Son of Adam who is born unto righteousness, and righteousness abides over him, and the righteousness of the Head of Days forsakes him not* (62:7); and again the judging-reversal — *this Son of Adam... shall raise up the kings and the mighty from their seats, and the strong from their thrones* (62:9). The Parables'' Son of Adam is title-naming, not the kaph-comparative — the named, chosen figure beside the Head of Days (the Formed beside the Formless source), seated on the throne of glory, who raises the mighty from their thrones. Mark 14:62''s direct self-identification lands on the same figure: the condemned one at the Sanhedrin''s bar is the enthroned Son of Adam who will raise the very court that condemns him from its seat. The wisdom-stream named the enthroned Son of Adam and the kings-and-mighty-cast-down reversal the King invokes at his trial.',
       sv.verse_id, ev.verse_id, 'extras', 3291
  FROM _s212_m1316_lookup sv, _s212_m1316_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 14 AND ev.verse_number = 62
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees',
       E'The blood of the covenant and the faithful unto death for the covenant in Maccabees',
       E'Mark 14:24 — *this is my blood of the new testament, which is shed for many.* The cup names the covenant sealed in blood. The Hebrew library''s Maccabean register names the faithful-unto-death-for-the-covenant the King''s own blood now fulfills. 1 Maccabees 1:63 names those who chose death rather than profane the covenant: *they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* 1 Maccabees 2:50 names Mattathias'' charge to his sons: *be you zealous for the law, and give your lives for the covenant of your fathers.* 2 Maccabees 7:36 names the brothers *dead under the covenant of Yahuah (God) of everlasting life* — the dying held within the everlasting-life covenant. The Maccabean faithful gave their lives for the covenant of their fathers; the King gives his own life for the covenant, and his blood shed for many is the covenant-of-everlasting-life the martyrs died under, now sealed. The blood-of-the-covenant the wisdom-stream carried at the martyr-register is the blood the King pours out at the Last Supper.',
       sv.verse_id, ev.verse_id, 'extras', 3292
  FROM _s212_m1316_lookup sv, _s212_m1316_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 14 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras (4 Ezra) 13:39 — *and whereas you sawest that he gathered another peaceable multitude to him.* The peaceable multitude the man-who-ascends gathers, named in the verses following as the ten tribes; Mark 13:27''s gathering of the elect from the four winds walks the same homecoming-of-the-scattered architecture.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 39
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras (4 Ezra) 13:40 — *those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive.* The wisdom-stream names the scattered by the precise history of the Assyrian captivity; Mark 13:27 gathers the same tribes home from the uttermost parts.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 40
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras (4 Ezra) 13:47 — *the Highest shall stay the springs of the stream again, that they may go through.* The Most High opens the return-passage for the ten tribes at the latter time; Mark 13:27''s gathering of the elect is the act of the Most High, not the scattered''s own contriving.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 47
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Baruch 4:37 — *lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The four-quarters gathering accomplished by the word of the Holy One; Mark 13:27''s *gather together his elect from the four winds* walks the same architecture, the gathering of those who were sent away.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 5:5 — *behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* The gathering from the opposite quarter; with 4:37 it names the gathering from every direction — the four-winds substance Mark 13:27 carries.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach (Ecclesiasticus) 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The gathering prayed as petition in the wisdom-stream, naming all twelve tribes; Mark 13:27''s gathering of the elect from the four winds is the answered form of the prayer.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 46:1 — *with Him was another being whose countenance had the appearance of a man... like one of the holy angels.* The Son of Adam beside the Head of Days (the Formed beside the Formless source); Mark 14:62''s direct attribution (*the Son of Adam sitting on the right hand of power*, no kaph) names himself the figure the Parables saw beside the Head of Days. Title-naming, distinct from the kaph-comparative of Daniel 7:13.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 46:3 — *this is the Son of Adam who hath righteousness... whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The chosen Son of Adam whose lot has the pre-eminence; Mark 14:62''s *sitting on the right hand of power* names the same pre-eminence-at-the-right-hand.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 46:4 — *this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats.* The judging-reversal of the enthroned Son of Adam; Mark 14:62''s *coming in the clouds of heaven* binds the enthronement to the judgment of those who condemn him.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:1 — *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory.* The seating named directly; Mark 14:62''s *sitting on the right hand of power* walks the same enthronement on the throne of glory.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 62:7 — *this is the Son of Adam who is born unto righteousness... and the righteousness of the Head of Days forsakes him not.* The righteous Son of Adam whom the Head of Days never forsakes; Mark 14:62''s *I am: and ye shall see the Son of Adam sitting on the right hand of power* names the same figure enthroned at the right hand.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 62:9 — *this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, and the strong from their thrones.* The kings-and-mighty-cast-down reversal named again; Mark 14:62''s enthroned-and-coming Son of Adam is the figure who raises the very court that condemns him from its seat.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:63 — *they chose rather to die, that they might not... profane the holy covenant: so then they died.* The faithful dying rather than profane the covenant; Mark 14:24''s *my blood of the new testament, which is shed for many* names the covenant itself sealed by the King''s own blood.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '1-maccabees' AND tv.chapter_number = 1 AND tv.verse_number = 63
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 2:50 — *be you zealous for the law, and give your lives for the covenant of your fathers.* Mattathias'' charge to give their lives for the covenant; Mark 14:24''s blood shed for many is the King giving his own life for the covenant the faithful died for.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '1-maccabees' AND tv.chapter_number = 2 AND tv.verse_number = 50
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:36 — *our brothers... are dead under the covenant of Yahuah (God) of everlasting life.* The martyrs dead under the covenant of everlasting life; Mark 14:24''s blood shed for many seals the covenant-of-everlasting-life the wisdom-stream named the faithful dying under.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-maccabees' AND tv.chapter_number = 7 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 212 — Mark extras-library cross-references complete.'
