-- =====================================================================
-- S216 minion — John 13–17 NT-to-NT cross-references
-- =====================================================================
-- Range:  JOHN 13, 14, 15, 16, 17 (the footwashing / new commandment /
--         love one another; I AM the way, the truth, and the life / he
--         that hath seen me hath seen the Father / the Comforter, the
--         Spirit of truth / I will not leave you comfortless; the true
--         vine / abide in me / the world''s hatred; the Spirit of truth
--         who reproves and guides / sorrow turned to joy / I have
--         overcome the world; the high-priestly prayer / that they all
--         may be one / glorify thy Son / the glory before the world was /
--         keep them from the evil one)
-- Tag:    j13_17   (temp view _s216_j13_17_lookup)
-- Sort band: 4230-4309
--
-- Six threads:
--   1. john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13
--        (sort 4230)  — targets: 1-john 3:11-16,4:7-11, 2-john 1:5-6, romans 13:8-10
--   2. john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians
--        (sort 4240)  — targets: colossians 1:15, hebrews 1:3, 2-corinthians 4:4,6
--   3. john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5
--        (sort 4250)  — targets: acts 2:33, romans 8:9-14,26-27, 1-john 4:6, 1-john 5:6
--   4. john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11
--        (sort 4260)  — targets: 1-john 2:24-28, romans 11:17-18,23-24,26
--   5. john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12
--        (sort 4270)  — targets: ephesians 4:3-6, 1-corinthians 12:12-13
--   6. john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5
--        (sort 4280)  — targets: philippians 2:5-11, colossians 1:15-17, revelation 5:12-13
--
-- 24 cross_reference rows, 24 thread_member rows, all tier='free'.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j13_17 tag).
CREATE TEMP VIEW _s216_j13_17_lookup AS
SELECT
    e.slug  AS edition_slug,
    b.slug  AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id    AS verse_id
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

-- =====================================================================
-- Thread 1: john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13',
  'The New Commandment — Love One Another — and Love as the Doing of Torah',
  E'*A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* (John 13:34)\n\nThe word *new* has been used to pitch this commandment against everything that came before it — as if Yahusha (Jesus) arrived to replace the Sinai commandments with one principle that cancels the rest. That reading is not what the text says, and 1 John names it explicitly as a deception: the commandment is old. *Brethren, I write no new commandment unto you, but an old commandment which ye had from the beginning. The old commandment is the word which ye have heard from the beginning.* (1 John 2:7) The *new* is its living embodiment in the Formed one who laid down his life for his friends — and its inscription now in the hearts of those who abide in him. What is new is not the content of the command; what is new is the measure: *as I have loved you.*\n\n*For this is the message that ye heard from the beginning, that we should love one another.* (1 John 3:11)\n\n*Hereby perceive we the love of Elohim (God), because he laid down his life for us: and we ought to lay down our lives for the brethren.* (1 John 3:16)\n\nThe same love-one-another commandment is walked out in 1 John through the test of 1 John 2:3–4 — *hereby we do know that we know him, if we keep his commandments* — and in Romans 13:8–10 it is set explicitly inside Torah, not over against it: *Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law ... Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:8,10) Love does not replace the commandments; love is the full doing of them — the heart given by the Ruach HaKodesh (Holy Spirit) moving the member toward the neighbor in the pattern the Torah already named. The commandment to love one another is at once old (from the beginning, from Sinai, from the Shema) and made new (measured now by the Lamb who laid down his life), and it is walked out as the keeping, not the abolishing, of what the Torah commanded.\n\n*And now I beseech thee, lady, not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another. And this is love, that we walk after his commandments.* (2 John 5–6)',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=13 AND verse_number=34),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=15 AND verse_number=17),
  'free'::content_tier,
  4230
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- 1 John 3:11
  ('canon', 'john', 13, 34,
   'canon', '1-john', 3, 11,
   E'*For this is the message that ye heard from the beginning, that we should love one another.* (1 John 3:11) The apostle names the love-one-another command as a message *from the beginning* — directly answering any reading that hears *new commandment* in John 13:34 as a replacement for what came before. The command is not new in substance; it is old, and 1 John grounds it in the same source: the word heard from the beginning.'),
  -- 1 John 3:16
  ('canon', 'john', 13, 34,
   'canon', '1-john', 3, 16,
   E'*Hereby perceive we the love of Elohim (God), because he laid down his life for us: and we ought to lay down our lives for the brethren.* (1 John 3:16) Yahusha''s (Jesus''s) own self-giving is named here as the measure of love among the brethren — the same *as I have loved you* of John 13:34. The standard is not a principle; it is the Lamb''s own act, and the apostle says we ought to walk it out in kind.'),
  -- 1 John 4:7-8
  ('canon', 'john', 15, 12,
   'canon', '1-john', 4, 7,
   E'*Beloved, let us love one another: for love is of Elohim (God); and every one that loveth is born of Elohim (God), and knoweth Elohim (God). He that loveth not knoweth not Elohim (God); for Elohim (God) is love.* (1 John 4:7–8) The love-one-another of John 15:12 — *This is my commandment, That ye love one another, as I have loved you* — is here grounded in the nature of the Most High himself. Love is not a replacement for the covenant; it is the outflow of the nature of the One who gave the covenant. Every one that loveth is born of him; every one that loveth not has not known him — which is the 1 John 2:3–4 test applied.'),
  -- 1 John 4:11
  ('canon', 'john', 15, 12,
   'canon', '1-john', 4, 11,
   E'*Beloved, if Elohim (God) so loved us, we ought also to love one another.* (1 John 4:11) The ought-language echoes John 15:12''s commandment form exactly: the Father''s love in sending the Son is the ground, and the responsive love-one-another is the walking out of that ground among the brethren. The indicative (he loved us) produces the imperative (we ought also to love).'),
  -- 2 John 1:5-6
  ('canon', 'john', 13, 34,
   'canon', '2-john', 1, 5,
   E'*And now I beseech thee, lady, not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another. And this is love, that we walk after his commandments.* (2 John 5–6) This is the most direct NT commentary on John 13:34''s *new commandment*: the commandment is not new, it is the one from the beginning, and its walking-out is the keeping of his commandments. Love is defined here as walking in the commandments — not as their replacement. The sentence cannot be read to mean love dissolved the Torah.'),
  -- Romans 13:8
  ('canon', 'john', 13, 34,
   'canon', 'romans', 13, 8,
   E'*Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.* (Romans 13:8) Paul names love-one-another as the fulfilling — the full doing — of the Torah, not its cancellation. The Torah commandments of vv.9 (*Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet*) are not swept away by love; they are *briefly comprehended in this saying,* walked out through it. Love is the heart moving toward the neighbor in the fullness of what Torah already required. John 13:34''s *love one another as I have loved you* is the same motion named from the Father''s side.'),
  -- Romans 13:10
  ('canon', 'john', 15, 17,
   'canon', 'romans', 13, 10,
   E'*Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:10) The last verse of the Pauline love-as-Torah passage answers permanently the reading that pits John 15:17''s *These things I command you, that ye love one another* against the commandments. Love does not work ill to the neighbor; the Torah''s commandments name in detail what working ill looks like and prohibit it. Love fulfills the Torah because the Torah has always been the instruction in how to love. The two are not in tension; love is the heart of Torah done rightly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 3 AND tv.verse_number = 11
        THEN E'1 John 3:11 — *the message ... from the beginning, that we should love one another* — names the love command as ancient, not novel, answering the misreading of John 13:34.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 3 AND tv.verse_number = 16
        THEN E'1 John 3:16 — *because he laid down his life for us* — names Yahusha''s (Jesus''s) own act as the measure of love among the brethren, grounding the *as I have loved you* of John 13:34 in his sacrifice.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 4 AND tv.verse_number = 7
        THEN E'1 John 4:7–8 — *love is of Elohim (God)* — grounds the love-one-another commandment of John 15:12 in the nature of the Most High himself, and applies the knowing-him test.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 4 AND tv.verse_number = 11
        THEN E'1 John 4:11 — *if Elohim (God) so loved us, we ought also to love one another* — echoes the ought-form of John 15:12''s commandment, grounding the imperative in the indicative of the Father''s love.'
      WHEN tv.book_slug = '2-john'
        THEN E'2 John 5–6 — *not a new commandment ... but that which we had from the beginning ... this is love, that we walk after his commandments* — the most direct NT commentary on John 13:34: love is the walking of the commandments, not their replacement.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 8
        THEN E'Romans 13:8 — *he that loveth another hath fulfilled the law* — Paul names love as the full doing of the Torah, precisely as John 13:34 gives the love-one-another as the new measure of the old command.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 10
        THEN E'Romans 13:10 — *love is the fulfilling of the law* — closes the Pauline passage and confirms that John 15:17''s commandment to love one another is Torah fulfilled, not Torah dissolved.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number IN (13,15) AND verse_number IN (34,12,17)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13'
   AND tv.book_slug IN ('1-john','2-john','romans')
   AND tv.chapter_number IN (3,4,1,13)
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 2: john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians',
  'He That Hath Seen Me Hath Seen the Father — The Formed Who Images the Formless',
  E'*Yahusha (Jesus) saith unto him, Have I been so long time with you, and yet hast thou not known me, Philip? he that hath seen me hath seen the Father; and how sayest thou then, Shew us the Father?* (John 14:9)\n\nPhilip asks for a separate sighting of the Father, as if the Father were a second figure behind or beyond the one speaking. Yahusha''s (Jesus''s) answer refuses the separation: to see him is to see the Father, because he is the Formed expression of the Formless source. The Father remains unseen — *No man hath seen Elohim (God) at any time* (1 John 4:12) — not because the Father is absent, but because the Formless does not appear. The Formed is what appears. The Formed is *the image of the invisible Elohim (God)* (Colossians 1:15) and *the brightness of his glory, and the express image of his person* (Hebrews 1:3). These three NT confessions say the same thing from three angles: when the Formed one is seen in flesh, the Formless source is seen in the only form in which the Formless source can be seen.\n\n*Who is the image of the invisible Elohim (God), the firstborn of every creature.* (Colossians 1:15)\n\n*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power.* (Hebrews 1:3)\n\n*In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them ... to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* (2 Corinthians 4:4,6)\n\nThe Formed is the image of the Formless. The Formless does not appear; the Formed does. When the Formed took on flesh, the face of Yahusha HaMashiach (Jesus Christ) became the place where the light of the knowledge of the glory of Elohim (God) shines. Philip''s request — *shew us the Father* — is answered by the forty chapters of visible, touchable, audible ministry that preceded the Upper Room discourse: every healing, every word, every act of the Formed one is the Formless one acting through the image he drew from himself before the world was.',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=14 AND verse_number=9),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=14 AND verse_number=9),
  'free'::content_tier,
  4240
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Colossians 1:15
  ('canon', 'john', 14, 9,
   'canon', 'colossians', 1, 15,
   E'*Who is the image of the invisible Elohim (God), the firstborn of every creature.* (Colossians 1:15) The Formed one named as *the image of the invisible Elohim (God)* — the one who can be seen as the visible expression of the one who cannot be seen. John 14:9''s *he that hath seen me hath seen the Father* is this same architecture: seeing the Formed is seeing the Formless in the only form in which the Formless appears. The invisible Elohim (God) is not absent; he is present through his image.'),
  -- Hebrews 1:3
  ('canon', 'john', 14, 9,
   'canon', 'hebrews', 1, 3,
   E'*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power.* (Hebrews 1:3) The Formed one as the *brightness* of the Father''s glory and the *express image* of his person — not a copy made later, but the radiance that proceeds from the source. John 14:9''s claim rests on this relation: the son is the express image of the Father''s person, so seeing the Son is seeing the Father expressed. The brightness is not the sun; but where the brightness shines, the sun''s own light is what shines.'),
  -- 2 Corinthians 4:4
  ('canon', 'john', 14, 9,
   'canon', '2-corinthians', 4, 4,
   E'*In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them.* (2 Corinthians 4:4) The adversary''s strategy is specifically to blind the mind to the light that shines in the face of the Messiah (Christ) — because that face is *the image of Elohim (God).* Seeing that face is seeing the Father. The blinding targets exactly what John 14:9 names: the recognition that the one standing before Philip is the Father''s image, and therefore the Father''s presence in visible form.'),
  -- 2 Corinthians 4:6
  ('canon', 'john', 14, 9,
   'canon', '2-corinthians', 4, 6,
   E'*For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* (2 Corinthians 4:6) The glory of Elohim (God) — the Father''s own glory — is known in the face of Yahusha HaMashiach (Jesus Christ). This is the same naming John 14:9 carries: the Father is not shown by a separate vision but by the face of the Son. The Creator who said *Let there be light* is the same one who shines the knowledge of his glory into hearts through that face.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'colossians'
        THEN E'Colossians 1:15 — *the image of the invisible Elohim (God)* — the Formed one as the visible expression of the Formless, the same architecture John 14:9 names: to see the Son is to see the Father expressed.'
      WHEN tv.book_slug = 'hebrews'
        THEN E'Hebrews 1:3 — *the brightness of his glory, the express image of his person* — the Formed proceeds from and images the Formless; seeing the brightness is seeing the light that radiates it, confirming John 14:9.'
      WHEN tv.book_slug = '2-corinthians' AND tv.verse_number = 4
        THEN E'2 Corinthians 4:4 — *Messiah (Christ), who is the image of Elohim (God)* — the adversary blinds minds precisely to this identification, because recognizing the Messiah''s face as the Father''s image is the whole claim of John 14:9.'
      WHEN tv.book_slug = '2-corinthians' AND tv.verse_number = 6
        THEN E'2 Corinthians 4:6 — *the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* — the Father''s glory known in the Son''s face, the most direct Pauline echo of John 14:9''s *he that hath seen me hath seen the Father.*'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id = (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=14 AND verse_number=9
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians'
   AND tv.book_slug IN ('colossians','hebrews','2-corinthians')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 3: john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5',
  'The Comforter, the Spirit of Truth — His Coming, His Witness, His Intercession',
  E'*And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever; Even the Spirit of truth; whom the world cannot receive, because it seeth him not, neither knoweth him: but ye know him; for he dwelleth with you, and shall be in you.* (John 14:16–17)\n\nThe promise of the Comforter — the Ruach HaKodesh (Holy Spirit) — is threaded across John 14, 15, and 16. He is called the Spirit of truth, sent from the Father in Yahusha''s (Jesus''s) name, proceeding from the Father, testifying of the Son, guiding into all truth. The rest of the NT names three specific dimensions of that promise kept:\n\nHis *coming*: Acts 2:33 shows the Father''s promise of the Ruach HaKodesh (Holy Spirit) poured out by the exalted Son — *Therefore being by the right hand of Elohim (God) exalted, and having received of the Father the promise of the Ruach HaKodesh (Holy Spirit), he hath shed forth this, which ye now see and hear.* The pouring-out is the kept word of John 14:16–17.\n\nHis *indwelling and leading*: Romans 8:9–14 names the Spirit of Elohim (God) dwelling in the members, the Spirit of Messiah (Christ), the Spirit who leads the sons of Elohim (God) — exactly what John 14:17 promises: *he dwelleth with you, and shall be in you.* And Romans 8:26–27 names the intercession the Comforter carries: *the Spirit itself maketh intercession for us with groanings which cannot be uttered* — the *another Comforter* of John 14:16, doing now inside the members what he promised to do.\n\nHis *witness and test*: *Hereby know we the spirit of truth, and the spirit of error* (1 John 4:6) — the discernment framework John 16:13 promised (*he will guide you into all truth*) is walking in the community. And *it is the Spirit that beareth witness, because the Spirit is truth* (1 John 5:6) — the Spirit''s testimony is the kept word of John 15:26: *he shall testify of me.*\n\n*But when the Comforter is come, whom I will send unto you from the Father, even the Spirit of truth, which proceedeth from the Father, he shall testify of me.* (John 15:26)',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=14 AND verse_number=16),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=16 AND verse_number=13),
  'free'::content_tier,
  4250
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Acts 2:33
  ('canon', 'john', 14, 16,
   'canon', 'acts', 2, 33,
   E'*Therefore being by the right hand of Elohim (God) exalted, and having received of the Father the promise of the Ruach HaKodesh (Holy Spirit), he hath shed forth this, which ye now see and hear.* (Acts 2:33) Peter at Pentecost names the pouring-out of the Ruach HaKodesh (Holy Spirit) as the kept word of John 14:16''s promise: the exalted Son received the Father''s promise of the Spirit and shed it forth. The *another Comforter* given by the Father at Yahusha''s (Jesus''s) prayer is now shed out from the right hand of the throne.'),
  -- Romans 8:9
  ('canon', 'john', 14, 17,
   'canon', 'romans', 8, 9,
   E'*But ye are not in the flesh, but in the Spirit, if so be that the Spirit of Elohim (God) dwell in you. Now if any man have not the Spirit of Messiah (Christ), he is none of his.* (Romans 8:9) The Spirit of Elohim (God) dwelling in the member is the kept word of John 14:17''s *he dwelleth with you, and shall be in you.* Paul names the same indwelling as the definition of belonging to the Messiah (Christ).'),
  -- Romans 8:14
  ('canon', 'john', 16, 13,
   'canon', 'romans', 8, 14,
   E'*For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God).* (Romans 8:14) John 16:13 promised the Spirit of truth would guide into all truth — Romans 8:14 names that guidance as the identifying mark of the sons of Elohim (God): to be led by the Spirit is to be his. The two verses name the same motion from different angles.'),
  -- Romans 8:26
  ('canon', 'john', 14, 16,
   'canon', 'romans', 8, 26,
   E'*Likewise the Spirit also helpeth our infirmities: for we know not what we should pray for as we ought: but the Spirit itself maketh intercession for us with groanings which cannot be uttered.* (Romans 8:26) The *another Comforter* of John 14:16 — one who stands alongside, aids, intercedes — is at work here: where the member cannot form the prayer, the Spirit carries it. The Comforter''s name is his function, and Romans 8:26 shows it kept.'),
  -- 1 John 4:6
  ('canon', 'john', 16, 13,
   'canon', '1-john', 4, 6,
   E'*We are of Elohim (God): he that knoweth Elohim (God) heareth us; he that is not of Elohim (God) heareth not us. Hereby know we the spirit of truth, and the spirit of error.* (1 John 4:6) The Spirit of truth who guides into all truth (John 16:13) gives the community the discernment frame 1 John 4:6 names: the spirit of truth and the spirit of error are distinguished by whether they hear the apostolic word. Guiding into all truth is also the guard against every spirit that does not confess the Messiah (Christ) come in the flesh.'),
  -- 1 John 5:6
  ('canon', 'john', 15, 26,
   'canon', '1-john', 5, 6,
   E'*This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth.* (1 John 5:6) John 15:26 promised the Comforter *shall testify of me.* Here the apostle names that kept testimony: the Spirit bears witness to the Son — not by water only, but by water and blood — because the Spirit is truth. The Comforter''s testifying is walking.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'acts'
        THEN E'Acts 2:33 — the exalted Son *shed forth* the Father''s promised Ruach HaKodesh (Holy Spirit) at Pentecost — the kept word of John 14:16''s *another Comforter.*'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 9
        THEN E'Romans 8:9 — *the Spirit of Elohim (God) dwell in you* — the indwelling kept word of John 14:17''s *he shall be in you.*'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 14
        THEN E'Romans 8:14 — *as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* — the guiding-into-all-truth of John 16:13 named as the sons'' defining mark.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 26
        THEN E'Romans 8:26 — *the Spirit itself maketh intercession for us* — the Comforter''s alongside-helping of John 14:16 walking in the member who cannot form the prayer.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 4
        THEN E'1 John 4:6 — *hereby know we the spirit of truth, and the spirit of error* — the discernment fruit of the Spirit who guides into all truth, promised at John 16:13.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 5
        THEN E'1 John 5:6 — *the Spirit that beareth witness, because the Spirit is truth* — the Comforter''s testimony of John 15:26 walking in the apostolic community.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number IN (14,15,16) AND verse_number IN (16,17,26,13)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5'
   AND tv.book_slug IN ('acts','romans','1-john')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 4: john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11',
  'The True Vine, the Abiding, and the Olive Root of Yashar''el — the Journey Home',
  E'*I am the true vine, and my Father is the husbandman ... Abide in me, and I in you.* (John 15:1,4)\n\nThe vine-and-branches discourse of John 15 is the abiding discourse: the branch that does not abide is cast out; the branch that abides bears much fruit; the condition for fruit is remaining in the vine. 1 John 2:24–28 walks this promise out in the community register: *Let that therefore abide in you, which ye have heard from the beginning. If that which ye have heard from the beginning shall remain in you, ye also shall continue in the Son, and in the Father* (1 John 2:24). Abiding is not a moment of decision sealed forever; it is the ongoing remaining in the word heard from the beginning — the Torah, the covenant instruction, the testimony of the Son.\n\n*And now, little children, abide in him; that, when he shall appear, we may have confidence, and not be ashamed before him at his coming.* (1 John 2:28)\n\nRomans 11:17–24 carries the same architecture in the olive-tree register. The olive tree is Yashar''el (Israel)''s covenant root, planted in Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob). Branches were broken off through unbelief; wild olive branches — the scattered seed of the covenant, grown wild through centuries of exile among the nations — are described as graffed among them and partaking of the root and fatness of the tree. This is not the grafting-in of outsiders from unrelated peoples by faith-confession; this is the re-joining of the covenant''s own scattered seed to the root their forefathers stood on. The warning runs in the same direction as John 15:6: *Be not highminded, but fear: For if Elohim (God) spared not the natural branches, take heed lest he also spare not thee* (Romans 11:20–21). And the hope runs in the same direction as John 15:4''s *abide in me*: *And they also, if they abide not still in unbelief, shall be graffed in: for Elohim (God) is able to graff them in again* (Romans 11:23). The abiding and the grafting travel together — both are the journey of the covenant''s own scattered seed coming home to the root they belong to.\n\n*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob.* (Romans 11:26)',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=15 AND verse_number=1),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=15 AND verse_number=6),
  'free'::content_tier,
  4260
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- 1 John 2:24
  ('canon', 'john', 15, 4,
   'canon', '1-john', 2, 24,
   E'*Let that therefore abide in you, which ye have heard from the beginning. If that which ye have heard from the beginning shall remain in you, ye also shall continue in the Son, and in the Father.* (1 John 2:24) The abiding of John 15:4 — *Abide in me, and I in you* — is here named as the remaining of the word heard from the beginning. To abide in the vine is to let the covenant word remain; continuance in the Son and the Father follows from that remaining. The abiding is not abstract; it is the word abiding.'),
  -- 1 John 2:28
  ('canon', 'john', 15, 4,
   'canon', '1-john', 2, 28,
   E'*And now, little children, abide in him; that, when he shall appear, we may have confidence, and not be ashamed before him at his coming.* (1 John 2:28) The apostle echoes John 15:4''s command in the same word — *abide* — and attaches to it the eschatological urgency: the branch that abides will stand before him at his coming unashamed; the branch that does not is the one cast forth of John 15:6. The abiding is the ongoing condition, not a past transaction.'),
  -- Romans 11:17
  ('canon', 'john', 15, 5,
   'canon', 'romans', 11, 17,
   E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree.* (Romans 11:17) The wild olive partaking of the root and fatness of the olive tree is the abiding-in-the-vine of John 15:5 in the olive register. The olive tree is Yashar''el (Israel)''s covenant root. The wild olive branches are the scattered seed of that covenant, grown wild through exile. They are not outsiders by origin; they are covenant seed who lost their branch-connection and are being brought back to the root they belong to.'),
  -- Romans 11:18
  ('canon', 'john', 15, 5,
   'canon', 'romans', 11, 18,
   E'*Boast not against the branches. But if thou boast, thou bearest not the root, but the root thee.* (Romans 11:18) The wild olive branch that partakes of the root does not sustain the root — the root sustains the branch. This is the same order John 15:5 names: *without me ye can do nothing.* The branch abiding in the vine does nothing of itself; the vine''s life is what flows through it. The root of the olive is prior and sovereign; the branch comes home to what was already there.'),
  -- Romans 11:23
  ('canon', 'john', 15, 6,
   'canon', 'romans', 11, 23,
   E'*And they also, if they abide not still in unbelief, shall be graffed in: for Elohim (God) is able to graff them in again.* (Romans 11:23) The condition for grafting in again is the abiding of John 15:4–6 spoken in the negative: if they abide not still in unbelief. The broken-off branch and the cast-forth branch of John 15:6 are in the same posture — disconnected from the root through unbelief. The Father''s power to graff them in again is the same power Yahusha (Jesus) names: the husbandman who purges the branch that it may bring forth more fruit.'),
  -- Romans 11:26
  ('canon', 'john', 15, 1,
   'canon', 'romans', 11, 26,
   E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob.* (Romans 11:26) The true vine of John 15:1 — the Formed one who is the covenant''s living root — is the one *out of Sion* who turns away ungodliness from Jacob. The vine discourse ends with the covenant body bearing fruit; Romans 11 ends with all Yashar''el (Israel) saved through the same Deliverer. The two passages are one promise: the covenant seed abiding in the vine is the covenant seed being gathered home.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = '1-john' AND tv.verse_number = 24
        THEN E'1 John 2:24 — *let that abide in you which ye heard from the beginning* — names the abiding of John 15:4 as the remaining of the covenant word; continuance in Son and Father follows.'
      WHEN tv.book_slug = '1-john' AND tv.verse_number = 28
        THEN E'1 John 2:28 — *abide in him, that when he shall appear, we may have confidence* — the same abide-command in eschatological register: the branch that abides stands unashamed at his coming.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 17
        THEN E'Romans 11:17 — *graffed in among them, and partakest of the root and fatness* — the olive''s abiding-in-the-root is John 15:5''s vine-abiding in the covenant register: the scattered seed rejoining the root they belong to.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 18
        THEN E'Romans 11:18 — *thou bearest not the root, but the root thee* — the vine''s sovereignty named in the olive register: *without me ye can do nothing* (John 15:5).'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 23
        THEN E'Romans 11:23 — *if they abide not still in unbelief, shall be graffed in again* — the abiding condition of John 15:4–6 in the olive register: the disconnection from the root is unbelief, and the power to re-graft belongs to the husbandman.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 26
        THEN E'Romans 11:26 — *all Yashar''el (Israel) shall be saved ... the Deliverer out of Sion* — the covenant completion that John 15:1''s true vine is the agent of: the vine and the Deliverer are the same.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=15 AND verse_number IN (1,4,5,6)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11'
   AND tv.book_slug IN ('1-john','romans')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 5: john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12',
  'That They All May Be One — the Unity of the Body in Ephesians 4 and 1 Corinthians 12',
  E'*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us.* (John 17:21)\n\nThe high-priestly prayer of John 17 asks three times for the oneness of those given to the Son: *that they may be one, as we are* (v.11); *that they all may be one; as thou, Father, art in me, and I in thee* (v.21); *that they may be made perfect in one* (v.23). The unity prayed for is modeled on the Formed-Formless relation — the deep oneness in which the Son is in the Father and the Father in the Son. It is not uniformity of practice or institutional merger; it is the unity of those who abide in the same vine, carry the same Spirit, share the same root.\n\nEphesians 4:3–6 names the keeping of that unity as a walking discipline: *Endeavouring to keep the unity of the Spirit in the bond of peace* — and then grounds it in the sevenfold oneness that is already the covenant community''s foundation: *There is one body, and one Spirit, even as ye are called in one hope of your calling; One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all, who is above all, and through all, and in you all.* (Ephesians 4:4–6) The one body, one Spirit, one Father is the same architecture John 17''s *as we are one* names: the community''s unity reflects and participates in the Formed-Formless oneness.\n\n*For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Messiah (Christ). For by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles, whether we be bond or free; and have been all made to drink into one Spirit.* (1 Corinthians 12:12–13)\n\nPaul''s body-of-Messiah (Christ) passage in 1 Corinthians 12 maps the same one-body-many-members reality John 17:21 prays for: the many are made one by the one Spirit, in the one Messiah (Christ), for the one body''s building. The scattered sheep gathered into one fold (John 10:16) and made perfect in one (John 17:23) is the same gathering the body-of-Messiah (Christ) language names in the epistle register.',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=11),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=23),
  'free'::content_tier,
  4270
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Ephesians 4:3
  ('canon', 'john', 17, 21,
   'canon', 'ephesians', 4, 3,
   E'*Endeavouring to keep the unity of the Spirit in the bond of peace.* (Ephesians 4:3) The unity John 17:21 prays for — *that they all may be one* — is here named as something already given by the Spirit and to be *kept* through active endeavour. The unity is not created by agreement; it is created by the one Spirit and maintained by those who walk in it. The Father''s answer to John 17:21 is the Spirit''s bond; the community''s task is not to manufacture unity but to guard it.'),
  -- Ephesians 4:4-6
  ('canon', 'john', 17, 21,
   'canon', 'ephesians', 4, 4,
   E'*There is one body, and one Spirit, even as ye are called in one hope of your calling; One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all, who is above all, and through all, and in you all.* (Ephesians 4:4–6) The sevenfold *one* of Ephesians 4 is the ontological ground of the unity John 17:21 prays for. *As thou, Father, art in me, and I in thee, that they also may be one in us* — the Father above all and through all and in all is the same Father who is *in* the Formed one and in whom the Formed one is. The community''s unity participates in this already-real oneness.'),
  -- 1 Corinthians 12:12
  ('canon', 'john', 17, 21,
   'canon', '1-corinthians', 12, 12,
   E'*For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Messiah (Christ).* (1 Corinthians 12:12) The many-made-one of John 17:21 — *that they all may be one* — is here given its body-of-Messiah (Christ) form: many members, one body, *so also is Messiah (Christ).* The gathering of the scattered sheep into one fold and one shepherd (John 10:16) and the prayer that they be made perfect in one (John 17:23) are the prophetic and petitionary registers of what Paul names in the ecclesial register: this is what the body of Messiah (Christ) is.'),
  -- 1 Corinthians 12:13
  ('canon', 'john', 17, 21,
   'canon', '1-corinthians', 12, 13,
   E'*For by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles, whether we be bond or free; and have been all made to drink into one Spirit.* (1 Corinthians 12:13) The one Spirit who is the agent of the one-body is the same Spirit by whom John 17:21''s *they may be one in us* is made real. The body is not one because its members agreed to be; it is one because one Spirit baptized them in and made them all drink of the one Spirit. The *Yahudim (Jews) or Gentiles* — in this context, both houses of the scattered covenant seed called out from among the nations — are made into one body by the one Spirit, precisely what the high-priestly prayer asked the Father for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'ephesians' AND tv.verse_number = 3
        THEN E'Ephesians 4:3 — *endeavouring to keep the unity of the Spirit* — the unity John 17:21 prays for is given by the Spirit and guarded by the community; it is kept, not created.'
      WHEN tv.book_slug = 'ephesians' AND tv.verse_number = 4
        THEN E'Ephesians 4:4–6 — *one body, one Spirit ... one Elohim (God) and Father of all* — the sevenfold ontological ground of John 17:21''s *that they may be one in us.*'
      WHEN tv.book_slug = '1-corinthians' AND tv.verse_number = 12
        THEN E'1 Corinthians 12:12 — *so also is Messiah (Christ)* — the many-made-one of John 17:21 in the body-of-Messiah (Christ) register: many members, one body.'
      WHEN tv.book_slug = '1-corinthians' AND tv.verse_number = 13
        THEN E'1 Corinthians 12:13 — *by one Spirit are we all baptized into one body* — the Spirit as the agent of the John 17:21 oneness, making one body of Yahudim (Jews) and Gentiles — the scattered covenant seed gathered.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id = (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=17 AND verse_number=21
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12'
   AND tv.book_slug IN ('ephesians','1-corinthians')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 6: john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5',
  'The Glory Before the World Was — Philippians 2, Colossians 1, and Revelation 5',
  E'*And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5)\n\n*Father, I will that they also, whom thou hast given me, be with me where I am; that they may behold my glory, which thou hast given me: for thou lovedst me before the foundation of the world.* (John 17:24)\n\nThe high-priestly prayer reaches back past the incarnation to a glory the Son held with the Father before the world was, and a love the Father bore the Son before the foundation of the world. This is not a prayer for something new; it is the Formed one asking the Father to restore in glorified form what was his before flesh was taken on. The NT carries three answering witnesses.\n\nPhilippians 2:5–11 names the before-and-after of the incarnation: the Formed one was in the form of Elohim (God) before he took on the form of a servant and was found in fashion as a man — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant* (Philippians 2:6–7). The glory prayed for in John 17:5 is the *form of Elohim (God)* that was voluntarily laid aside at the incarnation. The exaltation that follows the cross — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9) — is the Father''s answer to John 17:5''s prayer.\n\nColossians 1:15–17 names the pre-incarnate position: the Formed one as the image of the invisible Elohim (God), the firstborn of every creature, the one in whom and by whom and for whom all things were created, who is before all things, and by whom all things consist. The glory of John 17:5 — *the glory which I had with thee before the world was* — is this position: the Formed was before all things, by him all things consist, and the world was made through him.\n\n*Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* (Revelation 5:12)\n\nRevelation 5:12–13 shows the kept word of John 17:5''s prayer: the Lamb that was slain receives glory and honour from ten thousand times ten thousand before the throne. The glory the Formed one held before the world was is now given back in heavenly acclamation — and every creature under heaven joins it. The before-the-world-was glory and the post-resurrection glory are one and the same glory, from the Father, held before creation and restored after the cross.',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=5),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=24),
  'free'::content_tier,
  4280
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Philippians 2:6-7
  ('canon', 'john', 17, 5,
   'canon', 'philippians', 2, 6,
   E'*Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men.* (Philippians 2:6–7) The Formed one''s pre-incarnate position — *in the form of Elohim (God)* — is what John 17:5''s prayer asks to be restored: *the glory which I had with thee before the world was.* The emptying of that form at the incarnation is the voluntary laying aside of the before-the-world glory; the exaltation that follows the cross is its restoration.'),
  -- Philippians 2:9-11
  ('canon', 'john', 17, 5,
   'canon', 'philippians', 2, 9,
   E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth; And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:9–11) This is the Father''s kept answer to John 17:5 — *glorify thou me with thine own self with the glory which I had with thee before the world was.* The exaltation after the cross, the name above every name, the confession of every tongue — this is the glory restored in the Father''s own doing.'),
  -- Colossians 1:15-16
  ('canon', 'john', 17, 5,
   'canon', 'colossians', 1, 15,
   E'*Who is the image of the invisible Elohim (God), the firstborn of every creature: For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* (Colossians 1:15–16) The glory John 17:5 prays to have restored — *the glory which I had with thee before the world was* — is exactly the glory Colossians 1:15–16 names: the Formed one as the image of the invisible Elohim (God), the firstborn of every creature, the one by whom and for whom all things were made. This position, held before the world was, is what the prayer asks the Father to glorify him with again.'),
  -- Colossians 1:17
  ('canon', 'john', 17, 5,
   'canon', 'colossians', 1, 17,
   E'*And he is before all things, and by him all things consist.* (Colossians 1:17) The Formed one is before all things — before the world was — and all things hold together in him. John 17:5''s *before the world was* is Colossians 1:17''s *before all things.* The glory prayed for is not a new attainment; it is the restoration of the position the Formed one held before creation, in which he was already the sustainer of all that exists.'),
  -- Revelation 5:12
  ('canon', 'john', 17, 24,
   'canon', 'revelation', 5, 12,
   E'*Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* (Revelation 5:12) John 17:24 asks the Father that those given to the Son might behold his glory. Revelation 5:12 shows that glory in heavenly acclamation: ten thousand times ten thousand voicing the Lamb''s worthiness to receive glory. The glory the Son had with the Father before the foundation of the world (John 17:24) is here restored and proclaimed before the throne.'),
  -- Revelation 5:13
  ('canon', 'john', 17, 24,
   'canon', 'revelation', 5, 13,
   E'*And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13) The Father''s throne and the Lamb together receive the glory — the architecture of John 17:1''s *Father, the hour is come; glorify thy Son, that thy Son also may glorify thee* kept in its final form: the Son glorified before all creation, and that glory returning in praise to the Father on the throne. John 17:24''s *that they may behold my glory* is exactly what the Revelation''s great assembly beholds.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'philippians' AND tv.verse_number = 6
        THEN E'Philippians 2:6–7 — *being in the form of Elohim (God) ... made himself of no reputation* — the pre-incarnate glory of John 17:5 named as *the form of Elohim (God)* voluntarily laid aside at the incarnation.'
      WHEN tv.book_slug = 'philippians' AND tv.verse_number = 9
        THEN E'Philippians 2:9–11 — *highly exalted him, and given him a name above every name* — the Father''s kept answer to John 17:5''s prayer: the before-the-world glory restored in exaltation.'
      WHEN tv.book_slug = 'colossians' AND tv.verse_number = 15
        THEN E'Colossians 1:15–16 — *the firstborn of every creature: for by him were all things created* — the pre-world-creation position of John 17:5''s *before the world was,* the glory of the Formed before all things were made.'
      WHEN tv.book_slug = 'colossians' AND tv.verse_number = 17
        THEN E'Colossians 1:17 — *he is before all things, and by him all things consist* — the sustaining position that is John 17:5''s *before the world was* in its cosmic register.'
      WHEN tv.book_slug = 'revelation' AND tv.verse_number = 12
        THEN E'Revelation 5:12 — *worthy is the Lamb ... to receive ... honour, and glory* — the heavenly acclamation of the glory John 17:24 asked those given to the Son to behold.'
      WHEN tv.book_slug = 'revelation' AND tv.verse_number = 13
        THEN E'Revelation 5:13 — *glory and power be unto him that sitteth upon the throne, and unto the Lamb* — John 17:1''s mutual glorification (Father and Son) kept in its final cosmic form before every creature.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=17 AND verse_number IN (5,24)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5'
   AND tv.book_slug IN ('philippians','colossians','revelation')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
