-- ----- fragment: minion_2corinthians_13.sql (S229 2 Corinthians 13) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 13 (14 verses) — the FINAL chapter of the letter
--   (two or three witnesses / examine yourselves / the closing benediction).
-- Tag: 2c13 (temp view _s229_2c13_lookup).
-- Sort band: floor 7300, step 3 (7300, 7303 used; under 7325).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical = 'extras' (none here).
--
-- GOVERNING FRAME: Paul closes his second letter to the divided, afflicted assembly of
-- called-out ones at Corinth. He opens the closing visit on the Torah's own evidentiary
-- rule — *In the mouth of two or three witnesses shall every word be established* (13:1,
-- citing Deuteronomy 19:15, the rule Yahusha (Jesus) also re-spoke at Matthew 18:16). The
-- standard of judgment in the assembly is the Torah's standard, not abolished but carried
-- into the gathered body. He then turns the test inward — *examine yourselves, whether ye
-- be in the faith* (13:5) — the prophets' self-searching (Lamentations 3:40, Psalm 139:23)
-- and the same self-examination he had pressed on this same congregation at the table
-- (1 Corinthians 11:28). The chapter ends in the benediction *The grace of the Lord Yahusha
-- HaMashiach (Lord Jesus Christ), and the love of Elohim (God), and the communion of the
-- Ruach HaKodesh (Holy Spirit)* (13:14) — the Father the One, the Formed Son who bears the
-- divine name, the Spirit named together; NOT a co-equal-persons grammar and NOT a modalist
-- collapse. Christology of the Formed preserved.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     this third time I come; in the mouth of two or three witnesses every word established
--           Tanakh: Deuteronomy 19:15 (at the mouth of two witnesses, or three, shall the matter be established)
--           Extras: none warranted   NT: Matthew 18:16 (in the mouth of two or three witnesses every word may be established)
--   v.2-4   I will not spare; a proof of Messiah; crucified through weakness, liveth by the power of Elohim
--           Tanakh: none warranted (Christology carried in prose)   Extras: none warranted   NT: none warranted
--   v.5     examine yourselves, whether ye be in the faith; prove your own selves
--           Tanakh: Lamentations 3:40 (let us search and try our ways, and turn again to Yahuah),
--                   Psalm 139:23 (search me, O Elohim, and know my heart: try me, and know my thoughts)
--           Extras: none warranted   NT: 1 Corinthians 11:28 (let a man examine himself)
--   v.6-10  not reprobates; we can do nothing against the truth; your perfection; the power for edification
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.11    be perfect, be of one mind, live in peace; the Elohim of love and peace shall be with you
--           Tanakh: none warranted (pastoral charge; no load-bearing root)   Extras: none warranted   NT: none warranted
--   v.12-13 greet one another with an holy kiss; all the saints salute you
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.14    the grace of the Lord Yahusha HaMashiach, the love of Elohim, the communion of the Ruach HaKodesh
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--                   (the benediction names Father/Son/Spirit but QUOTES no prior verse; Christology
--                    carried in the apparatus prose, not bound to a citation — "none warranted")
--
-- THREADS (slug -> target libraries):
--   7300 2-corinthians-13-two-or-three-witnesses-shall-every-word-be-established-deuteronomy-19  (Tanakh + NT)
--   7303 2-corinthians-13-examine-yourselves-whether-ye-be-in-the-faith-lamentations-3           (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s229_2c13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-13-two-or-three-witnesses-shall-every-word-be-established-deuteronomy-19
  ('canon', '2-corinthians', 13, 1, 'canon', 'deuteronomy', 19, 15, 'free', E'*One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15). When Paul opens his third visit he reaches for the Torah''s own evidentiary rule: *In the mouth of two or three witnesses shall every word be established* (2 Corinthians 13:1). The standard by which a charge is proven in the assembly is the standard Yahuah (LORD) wrote in Deuteronomy — no single accuser, but a matter weighed at the mouth of two or three. Paul does not set the Torah aside in the gathered body of called-out ones; he carries its righteous procedure into it. His repeated coming to Corinth, his foretelling and his witness, are the established testimony the Torah requires before he acts.'),
  ('canon', '2-corinthians', 13, 1, 'canon', 'matthew', 18, 16, 'free', E'*But if he will not hear thee, then take with thee one or two more, that in the mouth of two or three witnesses every word may be established.* (Matthew 18:16). Yahusha (Jesus) himself re-spoke the Deuteronomy rule as the order for the assembly: a brother''s fault weighed *in the mouth of two or three witnesses.* Paul speaks the very same words at his coming — *In the mouth of two or three witnesses shall every word be established* (2 Corinthians 13:1). The Master who upheld the Torah''s witness-rule for his gathered ones is the One whose proof Paul says they seek (*ye seek a proof of Messiah (Christ) speaking in me,* 13:3); the apostle judges Corinth by the same Torah-standard his Master confirmed.'),
  -- thread: 2-corinthians-13-examine-yourselves-whether-ye-be-in-the-faith-lamentations-3
  ('canon', '2-corinthians', 13, 5, 'canon', 'lamentations', 3, 40, 'free', E'*Let us search and try our ways, and turn again to Yahuah (LORD).* (Lamentations 3:40). The prophet calls the afflicted people to turn the eye of judgment inward — *let us search and try our ways* — and so return to Yahuah (LORD). Paul presses the same searching upon Corinth: *Examine yourselves, whether ye be in the faith; prove your own selves* (2 Corinthians 13:5). Before they demand a proof of Messiah in him, they are to search themselves; the self-trial that turns a people back to Yahuah (LORD) is the self-trial Paul commands, *Know ye not your own selves, how that Yahusha HaMashiach (Jesus Christ) is in you?*'),
  ('canon', '2-corinthians', 13, 5, 'canon', 'psalms', 139, 23, 'free', E'*Search me, O Elohim (God), and know my heart: try me, and know my thoughts:* (Psalm 139:23). David lays his own heart open to the searching of Elohim (God) — *try me, and know my thoughts.* Paul turns the same searching on the assembly: *Examine yourselves, whether ye be in the faith; prove your own selves* (2 Corinthians 13:5). The proving the psalmist invites from Elohim (God) is the proving Paul bids the Corinthians do upon themselves, that they may know whether *Yahusha HaMashiach (Jesus Christ) is in you, except ye be reprobates.* The faith is tested not by accusing the apostle but by the honest searching of one''s own heart before Elohim (God).'),
  ('canon', '2-corinthians', 13, 5, 'canon', '1-corinthians', 11, 28, 'free', E'*But let a man examine himself, and so let him eat of that bread, and drink of that cup.* (1 Corinthians 11:28). Paul had already pressed self-examination upon this same congregation at the table — *let a man examine himself.* Now he widens it to the whole standing of the soul: *Examine yourselves, whether ye be in the faith; prove your own selves* (2 Corinthians 13:5). The man who must prove himself before he eats the bread is the man who must prove whether he is in the faith at all; the call to the Lord''s table and the call to examine the heart are one call to the same Corinthian assembly, that they not be found reprobates.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-13-two-or-three-witnesses-shall-every-word-be-established-deuteronomy-19',
       E'In the mouth of two or three witnesses shall every word be established (Deuteronomy 19)',
       E'Paul opens his final visit on the Torah''s own rule of evidence: *This is the third time I am coming to you. In the mouth of two or three witnesses shall every word be established* (2 Corinthians 13:1). The words are Moses'': *One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* (Deuteronomy 19:15). The standard by which a charge is proven in the assembly of called-out ones is the standard Yahuah (LORD) wrote in the Torah — no single accuser, but a matter weighed at the mouth of two or three. Paul does not lay the Torah aside in the gathered body; he carries its righteous procedure straight into it. And Yahusha (Jesus) had already re-spoken the same rule as the order for his assembly: *if he will not hear thee, then take with thee one or two more, that in the mouth of two or three witnesses every word may be established* (Matthew 18:16). The Master who upheld the witness-rule for his gathered ones is the One whose proof the Corinthians seek — *ye seek a proof of Messiah (Christ) speaking in me* (2 Corinthians 13:3). Paul''s repeated coming, his foretelling, his solemn warning *that, if I come again, I will not spare* (13:2) are the established testimony the Torah requires before judgment falls; he will judge Corinth by no other standard than the one Moses set and the Messiah confirmed.',
       sv.verse_id, ev.verse_id, 'free', 7300
  FROM _s229_2c13_lookup sv, _s229_2c13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-13-examine-yourselves-whether-ye-be-in-the-faith-lamentations-3',
       E'Examine yourselves, whether ye be in the faith (Lamentations 3, Psalm 139)',
       E'Having warned that the Torah weighs a matter at the mouth of two or three witnesses, Paul turns the eye of judgment inward upon the Corinthians themselves: *Examine yourselves, whether ye be in the faith; prove your own selves. Know ye not your own selves, how that Yahusha HaMashiach (Jesus Christ) is in you, except ye be reprobates?* (2 Corinthians 13:5). This searching is the prophets'' own. The afflicted people of Lamentations are called to it: *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40) — the self-trial that turns a people back to him. David invites it from Elohim (God) himself: *Search me, O Elohim (God), and know my heart: try me, and know my thoughts* (Psalm 139:23). And Paul had already pressed the very word on this same congregation at the table: *But let a man examine himself, and so let him eat of that bread, and drink of that cup* (1 Corinthians 11:28). The man who must prove himself before he eats is the man who must prove whether he is in the faith at all. Before they demand a proof of Messiah speaking in Paul, they are to prove themselves; the test of the faith is not the accusing of the apostle but the honest searching of one''s own heart before Elohim (God), that Yahusha HaMashiach (Jesus Christ) be found dwelling in them and they be no reprobates.',
       sv.verse_id, ev.verse_id, 'free', 7303
  FROM _s229_2c13_lookup sv, _s229_2c13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-13-two-or-three-witnesses-shall-every-word-be-established-deuteronomy-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 19:15 — *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* the Torah''s evidentiary rule Paul invokes at his coming: *In the mouth of two or three witnesses shall every word be established* (2 Corinthians 13:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c13_lookup sv, _s229_2c13_lookup tv
 WHERE t.slug='2-corinthians-13-two-or-three-witnesses-shall-every-word-be-established-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 18:16 — *in the mouth of two or three witnesses every word may be established* Yahusha (Jesus) re-speaking the Deuteronomy rule as the order for the assembly; Paul speaks the same words at his coming (2 Corinthians 13:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c13_lookup sv, _s229_2c13_lookup tv
 WHERE t.slug='2-corinthians-13-two-or-three-witnesses-shall-every-word-be-established-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-13-examine-yourselves-whether-ye-be-in-the-faith-lamentations-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 3:40 — *Let us search and try our ways, and turn again to Yahuah (LORD)* the prophet''s inward searching that turns a people back to him; *Examine yourselves, whether ye be in the faith; prove your own selves* (2 Corinthians 13:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c13_lookup sv, _s229_2c13_lookup tv
 WHERE t.slug='2-corinthians-13-examine-yourselves-whether-ye-be-in-the-faith-lamentations-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:23 — *Search me, O Elohim (God), and know my heart: try me, and know my thoughts* David''s heart laid open to the proving of Elohim (God); the proving Paul bids the assembly do upon itself (2 Corinthians 13:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c13_lookup sv, _s229_2c13_lookup tv
 WHERE t.slug='2-corinthians-13-examine-yourselves-whether-ye-be-in-the-faith-lamentations-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 11:28 — *let a man examine himself, and so let him eat of that bread* the self-examination Paul pressed on this same congregation at the table; widened now to the whole standing of the faith (2 Corinthians 13:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c13_lookup sv, _s229_2c13_lookup tv
 WHERE t.slug='2-corinthians-13-examine-yourselves-whether-ye-be-in-the-faith-lamentations-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
