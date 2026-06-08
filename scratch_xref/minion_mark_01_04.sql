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
