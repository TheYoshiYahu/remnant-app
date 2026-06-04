-- =====================================================================
-- Session 184 migration — right hand / face of / east comprehensive cluster
-- =====================================================================
-- 5 NEW threads + 17 existing-thread attachments
-- 127 member rows total across the cluster (110 in new threads + 17 attachments).
-- Anchor verses live on the thread record itself (anchor_verse_id_start/end);
-- they are not duplicated as self-referencing member rows (matching S181 pattern,
-- which excludes source = target via the WHERE sv.verse_id <> tv.verse_id clause).
-- Anchors span multiple books: exodus, acts, genesis, ezekiel, isaiah.
--
-- New threads (sort 1217-1221):
--   1217 yahuahs-right-hand-glorious-in-power-... (anchor Exodus 15:6)
--   1218 the-formed-acting-with-his-own-right-hand-... (anchor Acts 7:55-56)
--   1219 the-face-of-yahuah-... (anchor Genesis 32:30)
--   1220 the-east-as-the-direction-of-yahuahs-glory-... (anchor Ezekiel 43:1-4)
--   1221 counterfeit-right-hand-and-counterfeit-east-... (anchor Isaiah 44:20)
--
-- Existing-thread attachments add new member rows to:
--   tehillim-110-1-davids-lord-formed-at-the-right-hand (S183 spine, 6 rows)
--   sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth (2 rows)
--   gather-all-the-tribes-of-jacob-in-sirach-and-enoch (3 rows — anchor Matt 8:11 already on thread record; canonical parallels added)
--   like-the-son-of-adam-coming-with-the-clouds (1 row)
--   the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables (3 rows: Isa 43:5, Zech 8:7, Zech 8:8)
--   walking-on-the-sea-formed-cloud-rider (2 rows: Tehillim 77:19, Tehillim 77:20)
--   the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables (1 Enoch 55 — extras, not in canon edition; framework-only, skipped here)
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session184_right_hand_face_east_xref_threads.sql
-- =====================================================================

\echo 'Session 184 right-hand / face-of / east migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction (canon edition only).
-- Extras references (1 Enoch, Jubilees, Apocalypse of Abraham, Ascension of
-- Isaiah) named in the drafter framework readings are NOT inserted as member
-- rows here — they live in the verbatim summary_md text of each thread; they
-- do not resolve against the canon edition. Same discipline as the S181
-- John migration (extras-bearing summaries; no extras member rows).
CREATE TEMP VIEW _s184_cluster_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- ---------------------------------------------------------------------
-- Thread 1: yahuahs-right-hand-glorious-in-power-the-formed-as-the-acting-agency-of-the-formless
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'yahuahs-right-hand-glorious-in-power-the-formed-as-the-acting-agency-of-the-formless',
    E'Yahuah''s right hand glorious in power — the Formed as the acting agency of the Formless (FRAMEWORK-MAJOR)',
    E'*Thy right hand, O Yahuah (the LORD), is become glorious in power: thy right hand, O Yahuah (the LORD), hath dashed in pieces the enemy* (Exodus 15:6). The Christian default reads "right hand of Yahuah" as a second person sitting next to a first person — two thrones, two seats, two distinct spatial locations in heaven. The Hebrew text resists the default. At the Sea, Yahuah does not sit at his own right hand; **his right hand acts.** It dashes the enemy. It is exalted. It does valiantly. The right hand is the acting register — Yahuah''s own agency, his Formed expression doing the work of the Formless source. When Yeshayahu (Isaiah) names the right hand that held Mosheh (Moses) leading the people through the deep (Isaiah 63:12), or that founded the earth (48:13), or that holds the servant lest he be dismayed (41:10, 41:13), or that grasps Cyrus to subdue the nations (45:1), the prophet is not naming a separate person seated next to Yahuah. The prophet is naming Yahuah-acting — the Formed doing the will of the Formless. The Tehillim (Psalms) carry the same register: *the right hand of Yahuah doeth valiantly* (118:15-16), *the saving strength of his right hand* (20:6), *thy right hand shall hold me* (139:10). The Formless source does not change. The Formed expression acts. That acting register is what the Hebrew idiom calls *the right hand of Yahuah.* The framework reading dismantles the two-throne hierarchical picture (no second throne is needed when the right hand IS the acting Yahuah), the Trinitarian co-equal-spatial picture (no spatial geometry of distinct persons is needed when the right hand IS the Formed expression of the same Yahuah), and the modalist collapse (the Formed is genuinely distinct from the Formless in relationship — he acts while submitting — but he is not a separate being). Same one, different register. The Formed is Yahuah-acting. The Formless is Yahuah-source. The right hand is the idiom for Yahuah''s own acting agency, and the Formed is the agent.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1217
  FROM _s184_cluster_lookup sv, _s184_cluster_lookup ev
 WHERE sv.book_slug = 'exodus' AND sv.chapter_number = 15 AND sv.verse_number = 6
   AND ev.book_slug = 'exodus' AND ev.chapter_number = 15 AND ev.verse_number = 6
ON CONFLICT (slug) DO NOTHING;

-- Anchor (Exodus 15:6) is already recorded on the thread record itself as
-- anchor_verse_id_start; not duplicated as a member row (matches S181 pattern
-- where the anchor verse is not a self-referencing member). The drafter table
-- listed the anchor as a row for prose completeness; the SQL member rows omit
-- the self-ref and number from 1 = the first non-anchor target.
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('exodus', 15, 6, 'exodus', 15, 12, 1, E'*Thou stretchedst out thy right hand, the earth swallowed them* — the right hand stretches; the right hand performs the act. The acting register continues.'),
  ('exodus', 15, 6, 'deuteronomy', 33, 2, 2, E'*From his right hand went a fiery law for them* — the Torah itself proceeds from the right hand. The Formed-acting giving Torah at Sinai.'),
  ('exodus', 15, 6, 'psalms', 16, 8, 3, E'*I have set Yahuah always before me: because he is at my right hand, I shall not be moved.* David''s confession — Yahuah at the right hand of the worshipper is the acting-favor register, not spatial seating.'),
  ('exodus', 15, 6, 'psalms', 16, 11, 4, E'*In thy presence is fulness of joy; at thy right hand there are pleasures for evermore.* The right hand as the place of favor and joy — the acting register received.'),
  ('exodus', 15, 6, 'psalms', 17, 7, 5, E'*Shew thy marvellous lovingkindness, O thou that savest by thy right hand them which put their trust in thee.* The right hand as the saving agency.'),
  ('exodus', 15, 6, 'psalms', 18, 35, 6, E'*Thy right hand hath holden me up* — the right hand sustains.'),
  ('exodus', 15, 6, 'psalms', 20, 6, 7, E'*He will save him from his holy heaven with the saving strength of his right hand.* The right hand as deliverance-agency.'),
  ('exodus', 15, 6, 'psalms', 44, 3, 8, E'*Neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Right hand, arm, and countenance named together — three idioms for the same Formed-acting register.'),
  ('exodus', 15, 6, 'psalms', 48, 10, 9, E'*Thy right hand is full of righteousness.* The right hand as moral-agency, not spatial location.'),
  ('exodus', 15, 6, 'psalms', 60, 5, 10, E'*That thy beloved may be delivered; save with thy right hand, and hear me.*'),
  ('exodus', 15, 6, 'psalms', 63, 8, 11, E'*My soul followeth hard after thee: thy right hand upholdeth me.*'),
  ('exodus', 15, 6, 'psalms', 77, 10, 12, E'*I will remember the years of the right hand of the most High.* The right hand as the historical-acting register of El Elyon.'),
  ('exodus', 15, 6, 'psalms', 89, 13, 13, E'*Thou hast a mighty arm: strong is thy hand, and high is thy right hand.*'),
  ('exodus', 15, 6, 'psalms', 98, 1, 14, E'*His right hand, and his holy arm, hath gotten him the victory.* The Formed-acting as the One who wins the war on Yahuah''s own behalf.'),
  ('exodus', 15, 6, 'psalms', 118, 15, 15, E'*The right hand of Yahuah doeth valiantly.* Part of the triple repetition (118:15-16). The right hand as the active subject of the verbs — the agency.'),
  ('exodus', 15, 6, 'psalms', 118, 16, 16, E'*The right hand of Yahuah is exalted: the right hand of Yahuah doeth valiantly.* Completes the triple repetition; the right hand exalted and acting valiantly is named twice in a single verse.'),
  ('exodus', 15, 6, 'psalms', 139, 10, 17, E'*Even there shall thy hand lead me, and thy right hand shall hold me.*'),
  ('exodus', 15, 6, 'isaiah', 41, 10, 18, E'*I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The right hand as the agency of Yahuah''s help to the servant — the Formed-acting holding Yashar''el (Israel).'),
  ('exodus', 15, 6, 'isaiah', 41, 13, 19, E'*I Yahuah thy Elohim will hold thy right hand, saying unto thee, Fear not; I will help thee.* The Formed grasps the seed; the right hand acts on the seed.'),
  ('exodus', 15, 6, 'isaiah', 45, 1, 20, E'*Thus saith Yahuah to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him.* Yahuah holds Cyrus''s right hand — the Formed-acting reaches into the nations through a non-covenant instrument. The right hand here is the agency by which Yahuah accomplishes his judgment on Babel.'),
  ('exodus', 15, 6, 'isaiah', 48, 13, 21, E'*Mine hand also hath laid the foundation of the earth, and my right hand hath spanned the heavens.* The right hand as the creation-agency — the Formed-acting as the one through whom all things were made. Cross-witness to John 1:3 / Colossians 1:16.'),
  ('exodus', 15, 6, 'isaiah', 62, 8, 22, E'*Yahuah hath sworn by his right hand, and by the arm of his strength.* The right hand as the oath-anchor — Yahuah swears by his own acting agency, the Formed.'),
  ('exodus', 15, 6, 'isaiah', 63, 12, 23, E'*That led them by the right hand of Mosheh (Moses) with his glorious arm, dividing the water before them, to make himself an everlasting name?* The Formed-acting through Mosheh''s hand — Yahuah''s right hand and Mosheh''s right hand named in the same motion. The deliverance at the Sea remembered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:yahuahs-right-hand-glorious-in-power-the-formed-as-the-acting-agency-of-the-formless | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for yahuahs-right-hand-glorious-in-power-the-formed-as-the-acting-agency-of-the-formless.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'yahuahs-right-hand-glorious-in-power-the-formed-as-the-acting-agency-of-the-formless'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:yahuahs-right-hand-glorious-in-power-the-formed-as-the-acting-agency-of-the-formless | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 2: the-formed-acting-with-his-own-right-hand-stephen-vision-and-the-seven-stars-and-the-book-of-the-throne
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-formed-acting-with-his-own-right-hand-stephen-vision-and-the-seven-stars-and-the-book-of-the-throne',
    E'The Formed acting with his own right hand — Stephen''s vision, the seven stars, and the book of the throne (FRAMEWORK-MAJOR)',
    E'Tehillim (Psalms) 110:1''s *sit thou at my right hand* puts the Formed at the right hand of the Formless. But scripture does not stop there. The Formed has a right hand of his own. At Acts 7:56, Stephen sees the Son of Adam **standing** on the right hand of Elohim — the only New Testament register where the right-hand session is broken; Yahusha (Jesus) stands to witness the death of his servant. At Revelation 1:16-17, the Son of Adam *had in his right hand seven stars* — the assemblies are held in the Formed''s own right hand, the acting-favor register turned outward to his people. At Revelation 5:1, *I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals* — and at Revelation 5:7, the Lamb *came and took the book out of the right hand of him that sat upon the throne.* The Formed takes the scroll from the right hand of the One on the throne — and the Formed himself holds the seven stars in his own right hand. The Christian default reads these as proof of two-throne hierarchical seating (the Father on a throne with a scroll, the Son standing or sitting next to him, each spatially distinct). The framework reading dismantles the picture: the right hand is the acting register, and the Formed has his own acting register because he himself is the Formed expression of the Formless source. The Lamb''s right hand carrying the seven stars is the same agency-idiom the Hebrew Tanakh used of Yahuah''s own right hand — *thy right hand, O Yahuah, is become glorious in power.* Yahusha (Jesus) acts because he is the Formed-acting; he stands at Stephen''s death because the Formed grants honor to the faithful witness; he holds the assemblies in his right hand because the assemblies are the people the Formed gathers. Same idiom, same architecture: Yahuah-acting, now visible in flesh, now standing for his servant, now holding his people. The Trinitarian collapse reads three persons in a heavenly tableau; the modalist collapse reads one person in two poses; the framework reads one Formless source, one Formed expression, one acting register the Formed himself carries when he stands, when he holds, when he takes the scroll. The right hand belongs to him because the right hand IS the Formed expression. He cannot lack a right hand; he IS the right hand of the Father, and his own right hand acts for those whose names are written before the foundation of the world.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1218
  FROM _s184_cluster_lookup sv, _s184_cluster_lookup ev
 WHERE sv.book_slug = 'acts' AND sv.chapter_number = 7 AND sv.verse_number = 55
   AND ev.book_slug = 'acts' AND ev.chapter_number = 7 AND ev.verse_number = 56
ON CONFLICT (slug) DO NOTHING;

-- Anchor (Acts 7:55-56) recorded on the thread itself as the anchor range.
-- The second verse of the range (Acts 7:56) IS included as a member row
-- because it carries distinct content (the Son-of-Adam-standing self-naming);
-- the source verse for all rows is Acts 7:55 (the range start). Acts 7:55
-- itself is not duplicated as source=target.
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('acts', 7, 55, 'acts', 7, 56, 1, E'The anchor''s second verse. *I see the heavens opened, and the Son of Adam standing on the right hand of Elohim (God).* Stephen sees the Formed standing — the right-hand session is broken because the Formed honors the witness. Per S182 NT-Lord rule, both *theos* occurrences (v.55 *glory of God*; v.56 *right hand of God*) render as *Elohim (God)*, NOT as Yahuah at the second occurrence. The Tehillim 110:1 echo is carried by the *right hand* idiom itself. Apply son-of-Adam restoration (Red Line #12); named title, not kaph-comparative.'),
  ('acts', 7, 55, 'acts', 2, 33, 2, E'*Therefore being by the right hand of Yahuah exalted, and having received of the Father the promise of the Ruach HaKodesh (Holy Spirit), he hath shed forth this, which ye now see and hear.* Peter''s Shavuot witness — *by the right hand* (the Formed-acting agency that exalts him) or *to the right hand* (the position from which the Formed exalted reigns) — same architecture either way: the right hand is the register he IS.'),
  ('acts', 7, 55, 'acts', 5, 31, 4, E'*Him hath Elohim exalted with his right hand to be a Prince and a Saviour, for to give repentance to Yashar''el (Israel), and forgiveness of sins.* The right hand as the agency of exaltation — Elohim exalts the Formed with the Formed-acting register.'),
  ('acts', 7, 55, 'revelation', 1, 16, 5, E'*He had in his right hand seven stars.* The Formed''s own right hand holds the assemblies. The figure is the kaph-comparative *like the Son of Adam* (v.13); Red Line #12 preserves the comparative-and-the-named-Standard.'),
  ('acts', 7, 55, 'revelation', 1, 17, 6, E'*And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last.* The right hand of the Formed lays itself on Yochanan (John) — the same comforting register Isaiah 41:13 named (*I will hold thy right hand*). The Formed''s right hand and the Father''s right hand are the same right hand because the Formed IS Yahuah-acting.'),
  ('acts', 7, 55, 'revelation', 2, 1, 7, E'*These things saith he that holdeth the seven stars in his right hand, who walketh in the midst of the seven golden candlesticks.* The Formed-acting holds the seven assemblies in his right hand and walks among them.'),
  ('acts', 7, 55, 'revelation', 5, 1, 8, E'*I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals.* The scroll in the right hand of the throne-One — the Formed-acting register of the One on the throne. The One on the throne in this scene is the Formless source shown in the Formed''s own throne-vision register — the Formless is never seen directly, only the Formed shows what the Formless is.'),
  ('acts', 7, 55, 'revelation', 5, 7, 9, E'*He came and took the book out of the right hand of him that sat upon the throne.* The Formed takes from the Formless''s right hand — the agency moves from source to expression so the seals can be loosed.'),
  ('acts', 7, 55, 'revelation', 10, 5, 10, E'*The angel which I saw stand upon the sea and upon the earth lifted up his hand to heaven.* The right-hand-lifted-to-heaven oath posture — echoing Genesis 14:22, Daniel 12:7.'),
  ('acts', 7, 55, 'daniel', 12, 7, 11, E'*The man clothed in linen, which was upon the waters of the river, when he held up his right hand and his left hand unto heaven, and sware by him that liveth for ever.* The oath-hand. Two hands lifted — the doubled-witness register. The man-clothed-in-linen sits in kaph-comparative architecture related to Revelation 1:13.'),
  ('acts', 7, 55, 'genesis', 48, 14, 12, E'*Yashar''el (Israel) stretched out his right hand, and laid it upon Ephraim''s head, who was the younger, and his left hand upon Manasseh''s head.* The patriarchal-blessing right hand — the acting-favor register passes through the human patriarch''s hand by Yahuah''s direction. Ephraim gets the right-hand blessing. The seed-of-promise direction.'),
  ('acts', 7, 55, 'genesis', 48, 17, 13, E'*When Yoseph (Joseph) saw that his father laid his right hand upon the head of Ephraim, it displeased him: and he held up his father''s hand, to remove it from Ephraim''s head unto Manasseh''s head.* The right-hand-blessing dispute — the right hand carries the senior-portion.'),
  ('acts', 7, 55, 'genesis', 48, 18, 14, E'*And Yoseph (Joseph) said unto his father, Not so, my father: for this is the firstborn; put thy right hand upon his head.* Yashar''el corrects Yoseph: the right hand of the patriarch echoes the right hand of Yahuah — the acting-favor that does not follow flesh-order but Yahuah''s order.'),
  ('acts', 7, 55, 'mark', 16, 19, 15, E'*So then after the Lord had spoken unto them, he was received up into heaven, and sat on the right hand of Elohim (God).* The ascension-witness register. Apply S183-queued Mark 16:19 NT-Lord override (preserve as *Lord* titularly for the ascended Yahusha; not as *Yahuah*).'),
  ('acts', 7, 55, 'hebrews', 1, 3, 16, E'*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Formed-as-express-image (*charaktēr*) sits at the right hand — the brightness of the Formless source, the image of the Formless person, the One who upholds all by the Word of his own power. Pure Formless-and-Formed apologetic.'),
  ('acts', 7, 55, 'hebrews', 12, 2, 17, E'*Looking unto Yahusha the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of Elohim.* The endurance-and-exaltation arc — the Formed sits at the right hand because the journey through flesh is complete.'),
  ('acts', 7, 55, '1-peter', 3, 22, 18, E'*Who is gone into heaven, and is on the right hand of Elohim; angels and authorities and powers being made subject unto him.* The right-hand-session as the position from which the Formed reigns over all created hierarchy.'),
  ('acts', 7, 55, 'psalms', 80, 17, 19, E'*Let thy hand be upon the man of thy right hand, upon the son of Adam whom thou madest strong for thyself.* The Davidic-psalm anticipation of the Son-of-Adam at the right hand — the very idiom Tehillim 110:1 will name. Apply son-of-Adam restoration.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-formed-acting-with-his-own-right-hand-stephen-vision-and-the-seven-stars-and-the-book-of-the-throne | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for the-formed-acting-with-his-own-right-hand-stephen-vision-and-the-seven-stars-and-the-book-of-the-throne.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-formed-acting-with-his-own-right-hand-stephen-vision-and-the-seven-stars-and-the-book-of-the-throne'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-formed-acting-with-his-own-right-hand-stephen-vision-and-the-seven-stars-and-the-book-of-the-throne | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 3: the-face-of-yahuah-what-the-formed-shows-of-the-formless-source
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-face-of-yahuah-what-the-formed-shows-of-the-formless-source',
    E'The face of Yahuah — what the Formed shows of the Formless source (FRAMEWORK-MAJOR)',
    E'*And Ya''aqob (Jacob) called the name of the place Peniel: for I have seen Elohim (God) face to face, and my life is preserved* (Genesis 32:30). At Sinai, Yahuah tells Mosheh (Moses) *thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). The two verses are not in contradiction. Ya''aqob saw Elohim face to face and lived because the face he saw was the Formed — the visible expression of the Formless source. The Formless cannot be seen and lived; the Formed is what the Formless shows. The Christian default reads "face of Yahuah" three wrong ways: as a Trinitarian Father-face distinct from the Son''s face (two distinct visages in a heavenly tableau), as a modalist same-face-different-mood (one person turning toward and away from his people), or as poetic-figurative cover for a non-encounter (God doesn''t really have a face; the language is just devotion-language). The Hebrew idiom resists all three. *Yahuah make his face shine upon thee, and be gracious unto thee. Yahuah lift up his countenance upon thee, and give thee peace* (Numbers 6:25-26) — the Aaronic blessing puts the face-shining and the countenance-lifting on the worshipper as covenant-favor visible. *Seek ye my face. Thy face, Yahuah, will I seek* (Tehillim 27:8). *Make thy face to shine upon thy servant* (Tehillim 31:16). *Cause thy face to shine upon us* (Tehillim 80:3). The face is what the Formed shows. The Formed wrestled with Ya''aqob at the Yabboq; the Formed spoke to Mosheh face to face *as a man speaketh unto his friend* (Exodus 33:11) — and the same Mosheh, three verses later, was told he could not see Yahuah''s face and live. The Formed is what is seen; the Formless is the source from which the Formed proceeds. *And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4) closes the canon on the promise: the Formed will be seen, and the seed-of-promise will dwell in his sight forever. Hosea names the inverse — *I will go and return to my place, till they acknowledge their offence, and seek my face* (Hosea 5:15) — the withdrawn-face as the discipline-register; the Formed turns away when the seed strays, returns when the seed returns. Revelation 6:16 (*hide us from the face of him that sitteth on the throne*) and Revelation 20:11 (*from whose face the earth and the heaven fled away*) name the same face under judgment-register. The face that shines on the seed is the face that the wicked cannot stand to see. Same Formed. Different aspect of the encounter. The Trinitarian collapse splits the face between distinct co-equal persons — sometimes hidden as the Father''s face, sometimes revealed as the Son''s — and misses that the face IS what the Formless source shows through the Formed expression. There is no second face; there is one Formed who shows the Formless. The modalist collapse turns the face into the only face there is, with no Formless source behind it; the framework reads the face as the Formed showing the Formless — the visible-and-encountered register of the source that cannot be seen and lived.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1219
  FROM _s184_cluster_lookup sv, _s184_cluster_lookup ev
 WHERE sv.book_slug = 'genesis' AND sv.chapter_number = 32 AND sv.verse_number = 30
   AND ev.book_slug = 'genesis' AND ev.chapter_number = 32 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

-- Anchor (Genesis 32:30) recorded on the thread itself; not duplicated as a
-- self-referencing member row. Members begin at the first non-anchor target.
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('genesis', 32, 30, 'genesis', 16, 13, 1, E'*And she called the name of Yahuah that spake unto her, Thou Elohim seest me: for she said, Have I also here looked after him that seeth me?* Hagar names the visible-Yahuah at the well — Beer-lahai-roi (the well of the Living One who seeth me). The Formed encountered before Peniel.'),
  ('genesis', 32, 30, 'exodus', 24, 10, 3, E'*Then went up Mosheh, and Aharon, Nadab, and Abihu, and seventy of the elders of Yashar''el: and they saw the Elohim of Yashar''el ... and they did eat and drink.* The seventy see the Elohim of Yashar''el and live and eat — the Formed encountered communally at Sinai.'),
  ('genesis', 32, 30, 'exodus', 33, 11, 4, E'*And Yahuah spake unto Mosheh face to face, as a man speaketh unto his friend.* The Formed in conversation-register with Mosheh — the face-to-face the prophet receives.'),
  ('genesis', 32, 30, 'exodus', 33, 14, 5, E'*And he said, My presence (face) shall go with thee, and I will give thee rest.* The face-as-presence promised to lead Yashar''el — the Formed-going-before in the wilderness. The Hebrew *panai* (my face) is what English renders as *my presence.*'),
  ('genesis', 32, 30, 'exodus', 33, 20, 6, E'*Thou canst not see my face: for there shall no man see me, and live.* The Formless cannot be seen and lived. The same Yahuah who spoke face to face with Mosheh as a friend (v.11) names what cannot be seen as the source-aspect, not the expression-aspect. The Formless / Formed distinction in one chapter.'),
  ('genesis', 32, 30, 'exodus', 33, 22, 7, E'*And it shall come to pass, while my glory passeth by, that I will put thee in a clift of the rock, and will cover thee with my hand while I pass by.* The covering-hand and the passing-glory — what is allowed to be seen of the Formless''s passing-glory.'),
  ('genesis', 32, 30, 'exodus', 33, 23, 8, E'*And I will take away mine hand, and thou shalt see my back parts: but my face shall not be seen.* The back-parts and the face — what is allowed to be seen of the Formless''s passing-glory. The face-and-back distinction maps to the Formless / Formed architecture.'),
  ('genesis', 32, 30, 'numbers', 6, 25, 9, E'*Yahuah make his face shine upon thee, and be gracious unto thee.* The Aaronic blessing — the face shining as the covenant-favor register placed upon the seed.'),
  ('genesis', 32, 30, 'numbers', 6, 26, 10, E'*Yahuah lift up his countenance upon thee, and give thee peace.* The countenance-lifting as the covenant-favor register placed upon the seed. The Formed shows-favor.'),
  ('genesis', 32, 30, 'deuteronomy', 5, 4, 11, E'*Yahuah talked with you face to face in the mount out of the midst of the fire.* The Sinai theophany as face-to-face encounter — the Formed in fire.'),
  ('genesis', 32, 30, 'deuteronomy', 34, 10, 12, E'*And there arose not a prophet since in Yashar''el like unto Mosheh, whom Yahuah knew face to face.* The Mosheh-prophet credential — face-to-face encounter as the prophetic-marker.'),
  ('genesis', 32, 30, 'psalms', 4, 6, 13, E'*There be many that say, Who will shew us any good? Yahuah, lift thou up the light of thy countenance upon us.*'),
  ('genesis', 32, 30, 'psalms', 17, 15, 14, E'*As for me, I will behold thy face in righteousness: I shall be satisfied, when I awake, with thy likeness.* The face beheld at resurrection — the Formed seen in vindication.'),
  ('genesis', 32, 30, 'psalms', 24, 6, 15, E'*This is the generation of them that seek him, that seek thy face, O Ya''aqob (Jacob).* MT reading; the patriarchal-name address echoes the Peniel encounter — the same Ya''aqob who saw the face of Elohim and was renamed Yashar''el becomes the addressee of the face-seeking generation. Verifier-resolved (Q5): voice-skill above external sources; MT reading stands; LXX-corrected reading set aside.'),
  ('genesis', 32, 30, 'psalms', 27, 8, 16, E'*When thou saidst, Seek ye my face; my heart said unto thee, Thy face, Yahuah, will I seek.* The seek-his-face confession.'),
  ('genesis', 32, 30, 'psalms', 27, 9, 17, E'*Hide not thy face far from me; put not thy servant away in anger.* The prayer against the hidden-face — the inverse register of v.8.'),
  ('genesis', 32, 30, 'psalms', 31, 16, 18, E'*Make thy face to shine upon thy servant: save me for thy mercies'' sake.*'),
  ('genesis', 32, 30, 'psalms', 67, 1, 19, E'*Elohim be merciful unto us, and bless us; and cause his face to shine upon us.* The Aaronic-blessing echo carried into the Psalter.'),
  ('genesis', 32, 30, 'psalms', 80, 3, 20, E'*Turn us again, O Elohim, and cause thy face to shine; and we shall be saved.* The face-shining as the salvation-direction.'),
  ('genesis', 32, 30, 'psalms', 80, 7, 21, E'*Turn us again, O Elohim Tseva''oth, and cause thy face to shine; and we shall be saved.*'),
  ('genesis', 32, 30, 'psalms', 80, 19, 22, E'*Turn us again, O Yahuah Elohim Tseva''oth, cause thy face to shine; and we shall be saved.*'),
  ('genesis', 32, 30, 'psalms', 89, 14, 23, E'*Justice and judgment are the habitation of thy throne: mercy and truth shall go before thy face.* The throne-architecture: mercy and truth go *before the face* — the Formed''s face is the leading register of the throne.'),
  ('genesis', 32, 30, 'psalms', 89, 15, 24, E'*Blessed is the people that know the joyful sound: they shall walk, O Yahuah, in the light of thy countenance.*'),
  ('genesis', 32, 30, 'psalms', 105, 4, 25, E'*Seek Yahuah, and his strength: seek his face evermore.*'),
  ('genesis', 32, 30, 'hosea', 5, 15, 26, E'*I will go and return to my place, till they acknowledge their offence, and seek my face: in their affliction they will seek me early.* The hidden-face as discipline; the seek-his-face as the return-direction. The Formed withdraws and is sought.'),
  ('genesis', 32, 30, 'micah', 3, 4, 27, E'*Then shall they cry unto Yahuah, but he will not hear them: he will even hide his face from them at that time, as they have behaved themselves ill in their doings.* The hidden-face as judgment against the false-prophets and unjust rulers.'),
  ('genesis', 32, 30, 'john', 1, 18, 28, E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The exegesis of Exodus 33:20 — no man has seen the Formless; the Formed declares the Formless. Yochanan (John) reading Mosheh forward.'),
  ('genesis', 32, 30, 'john', 14, 9, 29, E'*He that hath seen me hath seen the Father.* The Formed''s face IS what the Father shows — Yahusha (Jesus) to Philip. The face-of-Yahuah reading made explicit.'),
  ('genesis', 32, 30, 'revelation', 6, 16, 30, E'*Said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb.* The face of the throne-One under judgment-register.'),
  ('genesis', 32, 30, 'revelation', 20, 11, 31, E'*I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* The face that the heaven and the earth cannot endure.'),
  ('genesis', 32, 30, 'revelation', 22, 4, 32, E'*And they shall see his face; and his name shall be in their foreheads.* The promise. The face of the Formed — the visible Yahuah — will be seen by the seed-of-promise in the new heavens and the new earth, where the Formless source and the Formed expression are no longer veiled to the people whom he has gathered home.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-face-of-yahuah-what-the-formed-shows-of-the-formless-source | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for the-face-of-yahuah-what-the-formed-shows-of-the-formless-source.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-face-of-yahuah-what-the-formed-shows-of-the-formless-source'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-face-of-yahuah-what-the-formed-shows-of-the-formless-source | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 4: the-east-as-the-direction-of-yahuahs-glory-rising-and-the-gathering-of-the-seed
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-east-as-the-direction-of-yahuahs-glory-rising-and-the-gathering-of-the-seed',
    E'The east as the direction of Yahuah''s glory rising and the gathering of the seed (FRAMEWORK-MAJOR)',
    E'*Afterward he brought me to the gate, even the gate that looketh toward the east: and, behold, the glory of the Elohim of Yashar''el came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:1-2). The east is the glory-direction. The Formed enters the temple from the east at Ezekiel 43; the Spirit had first brought the prophet to the east gate at 11:1; and at 11:23, *the glory of Yahuah went up from the midst of the city, and stood upon the mountain which is on the east side of the city* — the Mount of Olives — when the glory departed. The east gate is the prologue, the departure is eastward, and the return is from the east. The Christian default reads the east as a cardinal direction in the prophetic geography but rarely connects the canon''s east-references as a single architecture. The framework reads the east as the consistent vector of the Formed''s appearing: the garden was planted *eastward in Eden* (Genesis 2:8); the cherubim were placed *at the east of the garden* (Genesis 3:24); Avraham (Abraham) pitches his tent between Beth-El west and Ai east (Genesis 12:8); the camp of Yashar''el at the wilderness has Yahudah (Judah) on the east side toward the rising of the sun (Numbers 2:3); Ya''aqob''s (Jacob''s) ladder-promise sends his seed to the four cardinals including east (Genesis 28:14). The wise men come from the east (Matthew 2:1-2); *there shall come a star out of Ya''aqob* is Bil''am''s (Balaam''s) Tanakh anchor for the star-in-the-east (Numbers 24:17); the Son of Adam''s coming is *as the lightning cometh out of the east, and shineth even unto the west* (Matthew 24:27); the angel ascends *from the east, having the seal of the living Elohim* (Revelation 7:2); the new Yerushalayim (Jerusalem) has three gates on the east (Revelation 21:13). The gathering vector is east-and-west: *they shall come from the east, and from the west, and shall sit down with Avraham, and Yitschaq (Isaac), and Ya''aqob* (Matthew 8:11); *fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west* (Isaiah 43:5). The east is not a metaphor; it is the canon''s own way of naming the Formed''s arrival-vector and the seed''s return-vector. The lightning shines out of the east because the Formed comes from where his glory has always come from. The seed gathers from the east because that is where the seed was scattered — Hosea names the *east wind* judgment (13:15) that carried Ephraim into exile, the Assyrian and Babylonian dispersals, the scattering among the nations — and the return is the reverse direction. Same Formed, same architecture: the east is the direction of his rising, the direction of his coming, and the direction of his people''s return. The counterfeit cases — Babel''s eastward gathering, Lot''s eastward choice toward Sodom, the priests-with-backs-to-the-temple sun-worship — sit in Thread 5 as the inversion that proves the architecture by mimicking it.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1220
  FROM _s184_cluster_lookup sv, _s184_cluster_lookup ev
 WHERE sv.book_slug = 'ezekiel' AND sv.chapter_number = 43 AND sv.verse_number = 1
   AND ev.book_slug = 'ezekiel' AND ev.chapter_number = 43 AND ev.verse_number = 4
ON CONFLICT (slug) DO NOTHING;

-- Anchor (Ezekiel 43:1-4) recorded on the thread itself as the anchor range.
-- The other range verses (43:2, 43:4) ARE included as member rows because
-- each carries distinct content; source for all rows is Ezekiel 43:1 (the
-- range start). Ezekiel 43:1 itself is not duplicated as source=target.
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('ezekiel', 43, 1, 'ezekiel', 43, 2, 1, E'*The glory of the Elohim of Yashar''el came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory.* The glory returning from the east — the Formed re-entering the temple. The voice-like-many-waters echoes Revelation 1:15 (the same Formed, the same voice-register).'),
  ('ezekiel', 43, 1, 'ezekiel', 43, 4, 3, E'*And the glory of Yahuah came into the house by the way of the gate whose prospect is toward the east.* The east-gate as the Formed''s entrance-vector.'),
  ('ezekiel', 43, 1, 'ezekiel', 11, 1, 4, E'*Moreover the spirit lifted me up, and brought me unto the east gate of Yahuah''s house, which looketh eastward.* The east-gate prologue — the Spirit first brings the prophet to the east gate before the glory departs at 11:23. Architecture: the east-gate is named before the departure and before the return.'),
  ('ezekiel', 43, 1, 'ezekiel', 11, 23, 5, E'*And the glory of Yahuah went up from the midst of the city, and stood upon the mountain which is on the east side of the city.* The glory departs eastward to the Mount of Olives — the reverse motion of 43:1-4. The departure-and-return architecture.'),
  ('ezekiel', 43, 1, 'ezekiel', 47, 1, 6, E'*Afterward he brought me again unto the door of the house; and, behold, waters issued out from under the threshold of the house eastward.* The temple-waters flow east — the Formed-life flowing in the direction of his own glory''s rising.'),
  ('ezekiel', 43, 1, 'ezekiel', 47, 8, 7, E'*These waters issue out toward the east country, and go down into the desert, and go into the sea: which being brought forth into the sea, the waters shall be healed.* The east-waters as the healing-flow restoring the dead-sea register.'),
  ('ezekiel', 43, 1, 'genesis', 2, 8, 8, E'*And Yahuah Elohim planted a garden eastward in Eden; and there he put the Adam whom he had formed.* The garden''s eastward placement — Eden as the east-anchor of the first creation.'),
  ('ezekiel', 43, 1, 'genesis', 3, 24, 9, E'*So he drove out the Adam; and he placed at the east of the garden of Eden cherubim, and a flaming sword which turned every way, to keep the way of the tree of life.* The east of the garden as the guarded-direction — the way to the tree of life sealed off at the east entrance.'),
  ('ezekiel', 43, 1, 'genesis', 12, 8, 10, E'*And he removed from thence unto a mountain on the east of Beth-El, and pitched his tent, having Beth-El on the west, and Ai on the east, and there he builded an altar unto Yahuah, and called upon the name of Yahuah.* Avraham at the east-west axis with the altar in the middle. The patriarchal-witness on the directional architecture.'),
  ('ezekiel', 43, 1, 'genesis', 28, 14, 11, E'*And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south.* Ya''aqob''s ladder-promise: the seed spreads to the four cardinal directions including east. The spreading-east as the scattering-direction the prophets will later name.'),
  ('ezekiel', 43, 1, 'exodus', 14, 21, 12, E'*Yahuah caused the sea to go back by a strong east wind all that night, and made the sea dry land.* The east wind at the Sea — the Formed''s deliverance instrument. East as the wind-direction Yahuah uses against the pursuing enemy.'),
  ('ezekiel', 43, 1, 'numbers', 2, 3, 13, E'*On the east side toward the rising of the sun shall they of the standard of the camp of Yahudah (Judah) pitch.* The tribal-camp orientation — Yahudah on the east, the standard-of-the-leading-tribe at the east-side of the wilderness camp. The east as the lead-direction in covenant order.'),
  ('ezekiel', 43, 1, 'numbers', 24, 17, 14, E'*I shall see him, but not now: I shall behold him, but not nigh: there shall come a star out of Ya''aqob, and a Sceptre shall rise out of Yashar''el.* Bil''am''s prophecy. The star-out-of-Ya''aqob is the prophetic anchor for the star-in-the-east of Matthew 2:2; the eastward-rising is how the Formed''s arrival-vector is signed in the night sky. The Messianic-star register and the east-direction register name the same arrival from two angles.'),
  ('ezekiel', 43, 1, 'psalms', 50, 1, 15, E'*The mighty El, Elohim, Yahuah, hath spoken, and called the earth from the rising of the sun unto the going down thereof.* The east-to-west axis as the global proclamation-vector.'),
  ('ezekiel', 43, 1, 'psalms', 103, 12, 16, E'*As far as the east is from the west, so far hath he removed our transgressions from us.* The east-and-west pair as the maximal-distance idiom — the removal of transgression in cardinal-direction terms.'),
  ('ezekiel', 43, 1, 'psalms', 107, 3, 17, E'*And gathered them out of the lands, from the east, and from the west, from the north, and from the south.* The four-direction gathering — east and west as part of the seed-gathering vector.'),
  ('ezekiel', 43, 1, 'isaiah', 41, 2, 18, E'*Who raised up the righteous man from the east, called him to his foot, gave the nations before him?* The east as the rising-direction of the instrument Yahuah uses against Babel.'),
  ('ezekiel', 43, 1, 'isaiah', 43, 5, 19, E'*Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west.* The east-west gathering — the seed brought home along the cardinal vector. The Tanakh-anchor for Matthew 8:11.'),
  ('ezekiel', 43, 1, 'isaiah', 46, 11, 20, E'*Calling a ravenous bird from the east, the man that executeth my counsel from a far country.* The east as the direction from which Yahuah brings his counsel-instrument.'),
  ('ezekiel', 43, 1, 'hosea', 13, 15, 21, E'*Though he be fruitful among his brethren, an east wind shall come, the wind of Yahuah shall come up from the wilderness, and his spring shall become dry.* The east-wind as the judgment-instrument against Ephraim — the same east-direction the glory comes from carries the discipline against the unfaithful house.'),
  ('ezekiel', 43, 1, 'ezekiel', 20, 33, 22, E'*As I live, saith Adonai Yahuah, surely with a mighty hand, and with a stretched out arm, and with fury poured out, will I rule over you.* The post-harvest sifting in the wilderness of the people — the Formed shepherding the gathered seed through the rod again.'),
  ('ezekiel', 43, 1, 'ezekiel', 20, 38, 23, E'*And I will purge out from among you the rebels, and them that transgress against me.* The sifting-out architecture — east-of-Yarden register from the original wilderness, the gathered seed under the rod.'),
  ('ezekiel', 43, 1, 'zechariah', 8, 7, 24, E'*I will save my people from the east country, and from the west country.* The east-west gathering anchored in the Yerushalayim restoration.'),
  ('ezekiel', 43, 1, 'zechariah', 8, 8, 25, E'*And I will bring them, and they shall dwell in the midst of Yerushalayim (Jerusalem).* The destination of the east-west gathering — the Yerushalayim restoration completed.'),
  ('ezekiel', 43, 1, 'zechariah', 14, 4, 26, E'*And his feet shall stand in that day upon the mount of Olives, which is before Yerushalayim on the east.* The east-of-Yerushalayim Mount of Olives — the same mountain the glory departed to in Ezekiel 11:23, the same direction the glory returned from in Ezekiel 43, and now the place the Formed''s feet stand at the close.'),
  ('ezekiel', 43, 1, 'matthew', 2, 1, 27, E'*Wise men from the east to Yerushalayim.* The Magi-witness — the east-direction announces the Formed''s coming-in-flesh.'),
  ('ezekiel', 43, 1, 'matthew', 2, 2, 28, E'*We have seen his star in the east.* The star rises in the east as the sign of the Formed''s birth. Numbers 24:17 is the Tanakh anchor.'),
  ('ezekiel', 43, 1, 'matthew', 8, 11, 29, E'*Many shall come from the east and west, and shall sit down with Avraham, and Yitschaq (Isaac), and Ya''aqob (Jacob), in the kingdom of heaven.* The east-west gathering at the messianic-banquet — the Tanakh-Isaiah 43:5 promise made eschatologically explicit.'),
  ('ezekiel', 43, 1, 'matthew', 24, 27, 30, E'*As the lightning cometh out of the east, and shineth even unto the west; so shall also the coming of the Son of Adam be.* The Son-of-Adam''s coming is east-to-west — the same direction the glory rose from and returns from. Apply son-of-Adam restoration.'),
  ('ezekiel', 43, 1, 'luke', 13, 29, 31, E'*And they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim.* The four-direction gathering at the kingdom-table — the Matthew 8:11 promise widened to all four cardinals.'),
  ('ezekiel', 43, 1, 'revelation', 7, 2, 32, E'*And I saw another angel ascending from the east, having the seal of the living Elohim.* The seal-angel rises from the east — the sealing of the 144,000 of the tribes proceeds from the direction of the Formed''s glory.'),
  ('ezekiel', 43, 1, 'revelation', 16, 12, 33, E'*And the sixth angel poured out his vial upon the great river Euphrates; and the water thereof was dried up, that the way of the kings of the east might be prepared.* The text names a direction; the canon does not insist on a single interpretation of who the kings are. The east is the same direction the glory rises from (Ezek 43:1-4), the wise men came from (Matt 2:1-2), the Son of Adam''s coming runs (Matt 24:27), and the seal-angel ascends from (Rev 7:2). Verse held for future Revelation deep-dive; framework reading kept neutral-directional here.'),
  ('ezekiel', 43, 1, 'revelation', 21, 13, 34, E'*On the east three gates; on the north three gates; on the south three gates; and on the west three gates.* The new Yerushalayim has three east-gates — the cardinal directions integrated in the city''s architecture, with three gates each. The east is no longer the guarded direction (Genesis 3:24); it is the open-gate direction. The exclusion at the east of Eden is reversed at the east of the new Yerushalayim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-east-as-the-direction-of-yahuahs-glory-rising-and-the-gathering-of-the-seed | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for the-east-as-the-direction-of-yahuahs-glory-rising-and-the-gathering-of-the-seed.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-east-as-the-direction-of-yahuahs-glory-rising-and-the-gathering-of-the-seed'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-east-as-the-direction-of-yahuahs-glory-rising-and-the-gathering-of-the-seed | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 5: counterfeit-right-hand-and-counterfeit-east-the-inverted-register-against-yahuahs-acting-agency
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'counterfeit-right-hand-and-counterfeit-east-the-inverted-register-against-yahuahs-acting-agency',
    E'Counterfeit right hand and counterfeit east — the inverted register against Yahuah''s acting-agency and glory-direction (FRAMEWORK-MAJOR)',
    E'*He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* (Isaiah 44:20). The right hand is the acting register Yahuah claims for himself — the Formed expression doing the will of the Formless source. But the right hand can be inverted. The idolater''s right hand holds the lie he carved with his own hand. He cannot deliver his soul because the right hand of the idol is not the right hand of Yahuah; the idol''s right hand is empty motion against the Formed''s acting agency. The east is the glory-direction — where the garden was planted, where the cherubim stood guard, where the Formed enters the temple, where the Son of Adam''s coming runs. But the east can also be inverted. The Babel-direction is east (Genesis 11:2) — humanity gathering against Yahuah''s gathering at the very direction his glory rises from. Lot''s choice is east (Genesis 13:11) — the seed-of-promise family separating itself toward Sodom along the same vector the prophets call the glory''s path. Ezekiel sees twenty-five men with their backs to the temple of Yahuah, *and their faces toward the east; and they worshipped the sun toward the east* (Ezekiel 8:16) — the counterfeit east-worship at the very gate where Yahuah''s glory should be received. Same direction, opposite register. The framework names both. The right hand of Yahuah acts; the right hand of the idolater holds nothing. The east is the direction the Formed comes from; the east is the direction the counterfeit imitates. The architectural force is the contrast: the affirmation threads (right-hand acting in Thread 1, the Formed''s-own-right-hand in Thread 2, face-shining in Thread 3, east-glory-rising in Thread 4) read more sharply when read alongside this counterfeit register, because the Christian default collapses both registers into a generic "directional poetry" that misses the canon''s own distinction between Yahuah-acting and the system that mimics his acting. The Trinitarian / modalist / two-throne errors cannot work this contrast because they don''t see the right hand or the east as a register at all — they read them as spatial or figurative. The framework names the counterfeit because the framework names the affirmation. One Formless source, one Formed expression, one acting register, one glory-direction — and the counterfeit that tries to occupy the same idiom for the same effect, and cannot.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1221
  FROM _s184_cluster_lookup sv, _s184_cluster_lookup ev
 WHERE sv.book_slug = 'isaiah' AND sv.chapter_number = 44 AND sv.verse_number = 20
   AND ev.book_slug = 'isaiah' AND ev.chapter_number = 44 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

-- Anchor (Isaiah 44:20) recorded on the thread itself; not duplicated as a
-- self-referencing member row. Members begin at the first non-anchor target.
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('isaiah', 44, 20, 'genesis', 11, 2, 1, E'*And it came to pass, as they journeyed from the east, that they found a plain in the land of Shinar; and they dwelt there.* Babel''s eastward gathering at the very direction Yahuah''s glory rises from. The counterfeit-united-tongue project chooses the east-axis to imitate the direction the Formed comes from.'),
  ('isaiah', 44, 20, 'genesis', 13, 11, 3, E'*Then Lot chose him all the plain of Yarden (Jordan); and Lot journeyed east: and they separated themselves the one from the other.* Lot moves eastward toward Sodom — the seed-of-promise family separating itself toward the counterfeit cities along the same eastward vector the prophets will later call glory''s path.'),
  ('isaiah', 44, 20, 'ezekiel', 8, 16, 4, E'*Behold, at the door of the temple of Yahuah, between the porch and the altar, were about five and twenty men, with their backs toward the temple of Yahuah, and their faces toward the east; and they worshipped the sun toward the east.* The counterfeit east-worship inside the temple itself — twenty-five priests turning the right way to face the wrong source. The east here is not glory-direction; the east here is sun-worship-direction, with the temple of Yahuah at the priests'' backs. Same direction; opposite register.'),
  ('isaiah', 44, 20, 'habakkuk', 2, 18, 5, E'*What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* The prophet''s larger Tanakh-witness to Isaiah 44:20''s idiom — the carved-image cannot act, cannot deliver, cannot show the face. Cross-witness, optional.'),
  ('isaiah', 44, 20, 'habakkuk', 2, 19, 6, E'*Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* The counterfeit-right-hand and counterfeit-image register at the prophet-level — the idol cannot stand, cannot speak, cannot show the agency the right hand of Yahuah carries.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:counterfeit-right-hand-and-counterfeit-east-the-inverted-register-against-yahuahs-acting-agency | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for counterfeit-right-hand-and-counterfeit-east-the-inverted-register-against-yahuahs-acting-agency.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'counterfeit-right-hand-and-counterfeit-east-the-inverted-register-against-yahuahs-acting-agency'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:counterfeit-right-hand-and-counterfeit-east-the-inverted-register-against-yahuahs-acting-agency | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- EXISTING-THREAD ATTACHMENTS
-- =====================================================================
-- The block below adds new member rows to threads that already exist in
-- the library. No new threads are inserted; only cross_references rows
-- and the thread-member linkages.
-- =====================================================================

-- ---------------------------------------------------------------------
-- Attachments to tehillim-110-1-davids-lord-formed-at-the-right-hand (S183 locked spine)
-- Source verse for all 6 rows: Tehillim (Psalms) 110:1 (the thread's anchor).
-- ---------------------------------------------------------------------
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('psalms', 110, 1, 'hebrews', 8, 1, 1, E'*We have such an high priest, who is set on the right hand of the throne of the Majesty in the heavens* — the priestly-register of Tehillim 110:1''s session, extending the locked thread''s witness into the high-priest framework Hebrews develops.'),
  ('psalms', 110, 1, 'hebrews', 10, 12, 2, E'*But this man, after he had offered one sacrifice for sins for ever, sat down on the right hand of Elohim* — the once-for-all-offering completed leads to the right-hand-session. Direct Tehillim 110:1 echo.'),
  ('psalms', 110, 1, 'ephesians', 1, 20, 3, E'*Which he wrought in HaMashiach (Christ), when he raised him from the dead, and set him at his own right hand in the heavenly places* — Pauline witness to the Tehillim 110:1 enthronement.'),
  ('psalms', 110, 1, 'colossians', 3, 1, 4, E'*If ye then be risen with HaMashiach, seek those things which are above, where HaMashiach sitteth on the right hand of Elohim* — Pauline witness; the saints-rising-with-Christ language linked to the Tehillim 110:1 session.'),
  ('psalms', 110, 1, 'romans', 8, 34, 5, E'*It is HaMashiach that died, yea rather, that is risen again, who is even at the right hand of Elohim, who also maketh intercession for us* — the intercession-register at the right hand.'),
  ('psalms', 110, 1, 'psalms', 110, 5, 6, E'*Yahuah at thy right hand shall strike through kings in the day of his wrath* — within the anchor-psalm, the parallel inverse direction (Yahuah at *thy* right hand, not *thou at my right hand*); the right-hand idiom doubled to name the Formed''s-side-of-Yahuah and Yahuah''s-side-of-the-Formed registers as the same architecture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:tehillim-110-1-davids-lord-formed-at-the-right-hand | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       (SELECT COALESCE(MAX(m.sort_order), 0) FROM cross_reference_thread_members m WHERE m.thread_id = t.id)
         + ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                       tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'tehillim-110-1-davids-lord-formed-at-the-right-hand'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:tehillim-110-1-davids-lord-formed-at-the-right-hand | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Attachments to sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth
-- Source verse: Matthew 26:64 (the thread's anchor).
-- ---------------------------------------------------------------------
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('matthew', 26, 64, 'mark', 14, 62, 1, E'*Ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* — Markan parallel to Matthew 26:64, same Tehillim 110 + Daniel 7 combination. Apply son-of-Adam restoration (Red Line #12) and preserve the kaph-comparative for the cloud-coming.'),
  ('matthew', 26, 64, 'luke', 22, 69, 2, E'*Hereafter shall the Son of Adam sit on the right hand of the power of Elohim* — Lukan parallel to Matthew 26:64. Apply son-of-Adam restoration.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       (SELECT COALESCE(MAX(m.sort_order), 0) FROM cross_reference_thread_members m WHERE m.thread_id = t.id)
         + ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                       tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Attachments to gather-all-the-tribes-of-jacob-in-sirach-and-enoch
-- Source verse: Matthew 8:11 (the thread's anchor — currently parse-miss / 0 members).
-- Adding the anchor as a member row gives the thread its canonical anchor verse.
-- ---------------------------------------------------------------------
-- The anchor (Matthew 8:11) is the source for all three attachment rows.
-- The drafter table noted Matt 8:11 itself as a row to give the thread its
-- canonical anchor — but the thread already carries Matt 8:11 as its anchor
-- on the thread record; the canonical members are the three parallels
-- (Luke 13:29, Isaiah 43:5, Zech 8:7) which together populate the thread.
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('matthew', 8, 11, 'luke', 13, 29, 1, E'The four-direction gathering parallel — *they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim.*'),
  ('matthew', 8, 11, 'isaiah', 43, 5, 3, E'The Tanakh anchor for the east-west gathering — *I will bring thy seed from the east, and gather thee from the west.*'),
  ('matthew', 8, 11, 'zechariah', 8, 7, 4, E'*I will save my people from the east country, and from the west country.* The east-west gathering anchored in the Yerushalayim restoration.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:gather-all-the-tribes-of-jacob-in-sirach-and-enoch | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       (SELECT COALESCE(MAX(m.sort_order), 0) FROM cross_reference_thread_members m WHERE m.thread_id = t.id)
         + ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                       tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'gather-all-the-tribes-of-jacob-in-sirach-and-enoch'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:gather-all-the-tribes-of-jacob-in-sirach-and-enoch | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Attachment to like-the-son-of-adam-coming-with-the-clouds
-- Source verse: Revelation 1:7 (one of the thread's anchors).
-- ---------------------------------------------------------------------
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 1, 7, 'matthew', 24, 27, 1, E'*As the lightning cometh out of the east, and shineth even unto the west; so shall also the coming of the Son of Adam be* — the east-direction qualifier of the cloud-rider''s coming. Apply son-of-Adam restoration.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:like-the-son-of-adam-coming-with-the-clouds | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       (SELECT COALESCE(MAX(m.sort_order), 0) FROM cross_reference_thread_members m WHERE m.thread_id = t.id)
         + ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                       tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'like-the-son-of-adam-coming-with-the-clouds'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:like-the-son-of-adam-coming-with-the-clouds | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Attachments to the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables
-- Source verse: Matthew 24:27 (the thread's anchor; range Matt 24:27-31).
-- ---------------------------------------------------------------------
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('matthew', 24, 27, 'isaiah', 43, 5, 1, E'Tanakh witness to the four-winds gathering — *I will bring thy seed from the east, and gather thee from the west.*'),
  ('matthew', 24, 27, 'zechariah', 8, 7, 2, E'*I will save my people from the east country, and from the west country* — the east-west gathering with Yerushalayim as the destination.'),
  ('matthew', 24, 27, 'zechariah', 8, 8, 3, E'*And I will bring them, and they shall dwell in the midst of Yerushalayim (Jerusalem)* — completes the east-west gathering destination clause.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       (SELECT COALESCE(MAX(m.sort_order), 0) FROM cross_reference_thread_members m WHERE m.thread_id = t.id)
         + ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                       tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Attachment to walking-on-the-sea-formed-cloud-rider
-- Source verse: Matthew 14:25 (the thread's anchor in S110).
-- ---------------------------------------------------------------------
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('matthew', 14, 25, 'psalms', 77, 19, 1, E'*Thy way is in the sea, and thy path in the great waters, and thy footsteps are not known.* The Tanakh-substance for the right-hand-of-Mosheh-leading-through-the-sea register echoing Isaiah 63:12 — Tanakh witness to the walking-on-the-sea Formed-cloud-rider thread.'),
  ('matthew', 14, 25, 'psalms', 77, 20, 2, E'*Thou leddest thy people like a flock by the hand of Mosheh (Moses) and Aharon (Aaron).* The right-hand-of-Mosheh echoing Isaiah 63:12 — completes the Psalm 77:19-20 Tanakh witness to the walking-on-the-sea thread.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:walking-on-the-sea-formed-cloud-rider | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s184_cluster_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s184_cluster_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       (SELECT COALESCE(MAX(m.sort_order), 0) FROM cross_reference_thread_members m WHERE m.thread_id = t.id)
         + ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                       tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'walking-on-the-sea-formed-cloud-rider'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:walking-on-the-sea-formed-cloud-rider | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- NOTE on the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables:
-- The drafter table specifies adding 1 Enoch 55 (the Elect-One's seat-of-glory
-- and the day-of-judgment register). 1 Enoch is not in the canon edition,
-- so this row resolves to zero rows under the canon-only lookup view and is
-- skipped here intentionally — same discipline the S181 John migration used
-- for its extras references (framework readings carry the witness; member
-- rows live only when the target verse resolves in the canon edition).
-- ---------------------------------------------------------------------

COMMIT;
\echo 'Session 184 right-hand / face-of / east migration complete.'
