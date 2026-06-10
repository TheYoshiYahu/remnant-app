-- ----- fragment: minion_hebrews_05.sql (S222 Hebrews 5) -----
-- =====================================================================
-- S222 minion — HEBREWS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 5.  Tag: h05 (temp view _s222_h05_lookup).  Sort band: 7928, step 1 (<= 7934).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 5 introduces the high-priesthood of Messiah. Every high priest is
-- *taken from among men* and *called of Elohim (God), as was Aaron* (5:4) — the office is given,
-- never seized. So *Messiah (Christ) glorified not himself to be made an high priest; but he that
-- said unto him, Thou art my Son, to day have I begotten thee* (5:5) — the Father called and
-- installed the Son. And the order is named: *Thou art a priest for ever after the order of Melek
-- Tsadiq (Melchizedek)* (5:6,10). CHRISTOLOGY WATCHPOINT: the Son who *in the days of his flesh*
-- *offered up prayers and supplications with strong crying and tears* (5:7) and *though he were a
-- Son, yet learned he obedience by the things which he suffered* (5:8) is the Formed who took
-- flesh truly — he has a Father who called him, perfected him, and heard him; he is not a co-equal
-- second person and not the Father himself. MELEK TSADIQ WATCHPOINT: this chapter SETS UP chapter
-- 7; the full Genesis 14 tithe-and-blessing weave belongs to ch7. Here the thread introduces the
-- Psalm 110:4 priest-king order Hebrews actually quotes (5:6,10), with the Genesis 14:18 priest of
-- El Elyon as its root only — the centerpiece Melchizedek weave is reserved for ch7.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   every high priest taken from among men, called of Elohim as was Aaron
--           Tanakh: Psalm 2:7 (carried at v.5, the call)  Extras: none warranted  NT: none warranted
--   v.5     Messiah glorified not himself; Thou art my Son, to day have I begotten thee
--           Tanakh: Psalm 2:7 (quoted)  Extras: none warranted  NT: none warranted (Heb 1:5 same hand, carried in prose)
--   v.6,10  Thou art a priest for ever after the order of Melek Tsadiq
--           Tanakh: Psalm 110:4 (quoted), Genesis 14:18 (priest of El Elyon, root only)  Extras: deferred to ch7 (2 Enoch / Melchizedek tradition)  NT: none warranted (Heb 7 re-walks)
--   v.7-8   in the days of his flesh, strong crying and tears; learned obedience by suffering
--           Tanakh: none warranted  Extras: none warranted  NT: Luke 22:42-44 (the cup, the agony), Matthew 26:39 (not as I will)
--   v.9     being made perfect, the author of eternal salvation to them that obey him
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (carried at v.7-8)
--   v.11-14 milk vs strong meat, unskilful in the word of righteousness, the babe
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (no load-bearing pairing; left unwoven by design — see return note)
--
-- THREADS (slug -> target libraries):
--   7928 hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2          (Tanakh)
--   7929 hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110     (Tanakh)
--   7930 hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience  (NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2
  ('canon', 'hebrews', 5, 5, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). The high priest does not appoint himself — *no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). So the Son did not grasp the office: *Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The very word that installs him is the Father''s decree of Psalm 2 — the Father speaks, *Thou art my Son,* and the Son is the One spoken to. The Son has a Father who calls and installs him; he is the Formed answering the voice of the Formless, never the One who speaks the decree.'),
  ('canon', 'hebrews', 5, 4, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). The priesthood is a thing given, not seized — Aaron was called, and so was the Son, by the same decreeing voice: *Yahuah (LORD) hath said unto me, Thou art my Son.* The calling that makes the priest is the Father''s word over him; the office rests on being chosen, not on self-exaltation.'),
  -- thread: hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110
  ('canon', 'hebrews', 5, 6, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). Hebrews names the order plainly: *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6). This is no Levitical office, bound by descent and ended by death; it is the priesthood Yahuah swore by oath and *will not repent* — a priesthood *for ever.* The Son called *Thou art my Son* (Psalm 2:7) is the same One named *a priest for ever,* king and priest in one, after the order older than Aaron.'),
  ('canon', 'hebrews', 5, 10, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *Called of Elohim (God) an high priest after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:10). The calling and the order are repeated together: the Father called him, and called him to a priesthood not of Levi but *after the order of Melek Tsadiq.* The sworn, unrepented oath of the psalm stands behind the title — a priest *for ever,* whose office no death cuts off.'),
  ('canon', 'hebrews', 5, 6, 'canon', 'genesis', 14, 18, 'free', E'*And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* (Genesis 14:18). The order Hebrews names — *after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6) — reaches back to the priest-king who met Abram in the days of the patriarchs: king of Salem and *priest of the El Elyon (most high God),* a priesthood that stood before Aaron and outside Levi. Here the root is only named; the meeting in the valley, the bread and wine, the tithe and the blessing are unfolded where Hebrews takes them up at length.'),
  -- thread: hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience
  ('canon', 'hebrews', 5, 7, 'canon', 'luke', 22, 42, 'free', E'*Saying, Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done.* (Luke 22:42). *Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared* (Hebrews 5:7). The prayer Hebrews remembers is the one heard in the garden: the Son on his knees before the Father, asking that the cup pass, and yielding — *not my will, but thine, be done.* He prays *unto him that was able to save him from death;* he has a Father to whom he cries, and the cry is the surrender of his own will to the Father''s. This is the Formed who took flesh truly, not a will co-equal and identical to the Father''s but a Son submitting to the One who sent him.'),
  ('canon', 'hebrews', 5, 7, 'canon', 'luke', 22, 44, 'free', E'*And being in an agony he prayed more earnestly: and his sweat was as it were great drops of blood falling down to the ground.* (Luke 22:44). The *strong crying and tears* of Hebrews 5:7 are not figures of speech — Luke saw them: *being in an agony he prayed more earnestly,* his sweat *as it were great drops of blood.* The Son in the days of his flesh wept and bled in prayer before the Father who *was able to save him from death.* The high priest who intercedes for us first cried out himself, in real flesh, in real anguish.'),
  ('canon', 'hebrews', 5, 7, 'canon', 'matthew', 26, 39, 'free', E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* (Matthew 26:39). Hebrews says he *offered up prayers and supplications with strong crying and tears unto him that was able to save him from death* (Hebrews 5:7); Matthew shows him fallen on his face, crying *O my Father.* The Son addresses a Father distinct from himself and bends his own will to that Father''s — *not as I will, but as thou wilt.* It is by this very road — *though he were a Son, yet learned he obedience by the things which he suffered* (Hebrews 5:8) — that he was *made perfect* and *became the author of eternal salvation* (Hebrews 5:9).'),
  ('canon', 'hebrews', 5, 8, 'canon', 'matthew', 26, 39, 'free', E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* (Matthew 26:39). *Though he were a Son, yet learned he obedience by the things which he suffered* (Hebrews 5:8). The learning of obedience is exactly this moment: the Son with a cup before him he would rather not drink, yielding it — *not as I will, but as thou wilt.* Obedience learned by suffering is no pretence in one who could not have done otherwise; it is the real submission of the Formed, in flesh, to the will of the Father who sent him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2',
       E'Called of Elohim, as was Aaron — Thou art my Son (Psalm 2)',
       E'The priesthood is a thing given, never seized. *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). So too the Son did not grasp the office: *Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The word that installs him as priest is the Father''s decree from the second psalm: *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The Father speaks, *Thou art my Son,* and the Son is the One spoken to and called. This is the framework''s Christology in a single verse: the Son has a Father who calls and installs him — the Formed answering the voice of the Formless, never the One who speaks the decree, and never a self-appointed rival to the Father who appoints him.',
       sv.verse_id, ev.verse_id, 'free', 7928
  FROM _s222_h05_lookup sv, _s222_h05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110',
       E'A priest for ever after the order of Melek Tsadiq (Psalm 110)',
       E'Twice in this chapter Hebrews names the order of Messiah''s priesthood: *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6), and again, *Called of Elohim (God) an high priest after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:10). The line is lifted whole from the psalm: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). This is no Levitical office bound by descent and cut off by death — it is a priesthood Yahuah established by sworn oath and *will not repent,* a priesthood *for ever.* And the order reaches back past Aaron to the priest-king who met Abram: *Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18) — king and priest in one, standing before Levi and outside it. Here the chapter only names this order and lets the oath stand; the meeting in the king''s dale, the tithe, and the blessing are unfolded where Hebrews takes the priest-king up at length.',
       sv.verse_id, ev.verse_id, 'free', 7929
  FROM _s222_h05_lookup sv, _s222_h05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience',
       E'In the days of his flesh — strong crying and tears, obedience learned',
       E'*Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared* (Hebrews 5:7); *though he were a Son, yet learned he obedience by the things which he suffered* (Hebrews 5:8); *and being made perfect, he became the author of eternal salvation unto all them that obey him* (Hebrews 5:9). The prayer Hebrews remembers is the one prayed in the garden. *Saying, Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42); *and being in an agony he prayed more earnestly: and his sweat was as it were great drops of blood falling down to the ground* (Luke 22:44); *and he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39). The *strong crying and tears* were real — sweat like blood, a face to the ground, a cup he would rather not drink. And the One he cries to is *him that was able to save him from death,* a Father distinct from himself, whose will he bends his own will to receive. This is the Formed who took flesh truly: not a will co-equal and identical to the Father''s, but a Son who *learned obedience by the things which he suffered,* and so was made perfect — the author of eternal salvation, who first cried out himself before he became the high priest who intercedes for us.',
       sv.verse_id, ev.verse_id, 'free', 7930
  FROM _s222_h05_lookup sv, _s222_h05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee* the Father''s decree is the word that installs the Son as high priest (Hebrews 5:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son* the priesthood is called, not seized; the Son is called as Aaron was (Hebrews 5:4).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the sworn, unrepented oath behind the order Hebrews quotes (Hebrews 5:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent* the calling and the order repeated: an high priest for ever, not of Levi (Hebrews 5:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:18 — *Melek Tsadiq (Melchizedek) king of Salem … the priest of the El Elyon (most high God)* the priest-king root of the order, before Aaron and outside Levi (Hebrews 5:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 22:42 — *Father … not my will, but thine, be done* the garden prayer Hebrews remembers, the Son yielding to the Father (Hebrews 5:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 22:44 — *being in an agony … his sweat was as it were great drops of blood* the strong crying and tears were real, in real flesh (Hebrews 5:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 26:39 — *O my Father … not as I will, but as thou wilt* the Son addresses a Father distinct from himself and bends his will to his (Hebrews 5:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 26:39 — *not as I will, but as thou wilt* the very road by which *he learned obedience by the things which he suffered* (Hebrews 5:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
