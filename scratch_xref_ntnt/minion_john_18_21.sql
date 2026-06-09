-- =====================================================================
-- S216 minion — John 18-19-20-21 NT-to-NT cross-references
-- =====================================================================
-- Range:  John 18, 19, 20, 21 (the arrest / "I am he" / Peter's denial /
--         before Pilate / my kingdom is not of this world / what is truth;
--         the scourging / Behold the man / the crucifixion / the seamless
--         garment / "It is finished" / the pierced side blood and water /
--         the bone not broken; the empty tomb / Mary at the garden / the
--         risen Lord / "received ye the Holy Spirit" / Thomas "My Lord and
--         my God"; the catch of fish / "feed my sheep" / the restoration of
--         Peter / the disciple who tarries).
-- Tag:    j18_21   (temp view: _s216_j18_21_lookup)
-- Sort band: 4310-4369
--
-- Nine NT-to-NT threads (SOURCE always a canon John 18/19/20/21 verse;
-- TARGET always a verse in another NT book):
--
--   Thread 4310: john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels
--       (sort 4310) — targets: matthew, mark, luke
--   Thread 4311: john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation
--       (sort 4311) — targets: philippians, luke, revelation
--   Thread 4312: john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke
--       (sort 4312) — targets: matthew, mark, luke
--   Thread 4313: john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews
--       (sort 4313) — targets: hebrews
--   Thread 4314: john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5
--       (sort 4314) — targets: 1-john
--   Thread 4315: john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1
--       (sort 4315) — targets: 1-corinthians, 1-peter
--   Thread 4316: john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15
--       (sort 4316) — targets: 1-corinthians
--   Thread 4317: john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt
--       (sort 4317) — targets: 1-corinthians, colossians, revelation
--   Thread 4318: john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13
--       (sort 4318) — targets: 1-peter, acts, hebrews
--
-- 36 cross_reference rows, 36 thread_member rows, all tier_required='free'.
-- Every target quoted IN FULL in italics with citation in parentheses
-- (come-and-see). Sacred names preserved as the canon pull carries them.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j18_21 tag).
CREATE TEMP VIEW _s216_j18_21_lookup AS
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

-- =====================================================================
-- Thread 4310: john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels',
    E'The arrest and Peter''s denial — John 18 and the synoptic passion parallels',
    E'John 18 opens in a garden at night. Judas arrives with a band of soldiers and officers from the chief priests. Yahusha (Jesus) goes out to meet them and speaks two words that knock them backward: *I am he* — the same predicate-less name he spoke from the burning bush, the same name that will fall upon the arresting party like thunder. All four passion accounts carry this moment; the synoptics and John together are the four witnesses the Torah required.\n\n*Yahusha (Jesus) therefore, knowing all things that should come upon him, went forth, and said unto them, Whom seek ye? They answered him, Yahusha (Jesus) of Nazareth. Yahusha (Jesus) saith unto them, I am he. And Judas also, which betrayed him, stood with them. As soon then as he had said unto them, I am he, they went backward, and fell to the ground.* (John 18:4-6)\n\nMatthew names the same arrest-moment with the same Judas-kiss and the same sword drawn by a disciple: *And, behold, one of them which were with Yahusha (Jesus) stretched out his hand, and drew his sword, and struck a servant of the high priest''s, and smote off his ear. Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* (Matthew 26:51-52)\n\nMark 14 and Luke 22 carry the same architecture. Each account stands as witness to the same event; no one of the four replaces the others. The four accounts together fulfill the mouth-of-two-or-three-witnesses standard the Torah requires for the establishing of any matter — and here the matter being established is the voluntary surrender of the Formed one at the hour the Father appointed.\n\nPeter''s three denials are carried identically across all four accounts. John 18:17, 25-27 name the three denials before the cock crew — the same sequence Matthew 26:69-75, Mark 14:66-72, and Luke 22:56-62 carry. Luke''s account alone adds the devastating detail: *And Yahuah (Lord) turned, and looked upon Peter* (Luke 22:61). The look that falls on Peter after the third denial is the look of the shepherd who knows the sheep. The denial does not end the sheep''s place in the flock; the restoration of John 21:15-17 is already embedded in the look.\n\nThe passion parallels are not redundancy. They are the four-witness establishment of the most load-bearing event in the canon: the Formed cloud-rider laying down his body at the hour the Father appointed, the cup the scattered seed would have drunk instead now on his lips, the arrest and the denial and the trial all moving toward the lifting-up the disciples had been warned about since John 3:14.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4310
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 4
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 18 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 18, 5,
   'canon', 'matthew', 26, 50,
   E'*And Yahusha (Jesus) said unto him, Friend, wherefore art thou come? Then came they, and laid hands on Yahusha (Jesus), and took him.* (Matthew 26:50). The same arrest-hour in Matthew: the betrayer''s kiss named as *friend*, then the hands laid on the Formed one who stepped out to meet them. John 18:4-6''s *I am he* and the falling backward happen in the same moment Matthew''s account names the taking. Both witnesses establish the voluntary surrender of the Formed one.'),
  ('canon', 'john', 18, 10,
   'canon', 'matthew', 26, 52,
   E'*Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* (Matthew 26:52). John 18:10-11 names Peter as the one who drew the sword and cut off the ear; Matthew 26:52 carries the same rebuke. The sword-rebuke is the Formed one refusing the way of the sword even in his own defense — the cup the Father gave him, not the sword, is what this moment requires.'),
  ('canon', 'john', 18, 17,
   'canon', 'mark', 14, 68,
   E'*But he denied, saying, I know not, neither understand I what thou sayest. And he went out into the porch; and the cock crew.* (Mark 14:68). The first denial in Mark''s account carries the same woman-at-the-door architecture John 18:17 names. The rooster''s crow that John 18:27 and Mark 14:72 both close the denial sequence with is the same prophetic clock-tick — the three denials completed before morning, exactly as Yahusha (Jesus) said.'),
  ('canon', 'john', 18, 27,
   'canon', 'luke', 22, 61,
   E'*And Yahuah (Lord) turned, and looked upon Peter. And Peter remembered the word of Yahuah (Lord), how he had said unto him, Before the cock crow, thou shalt deny me thrice.* (Luke 22:61). Luke''s account adds what the others do not: the look. John 18:27''s cock-crow closes the three denials; Luke 22:61 names the shepherd''s eyes that fell on Peter in that moment. The look is the look of the chief Shepherd who does not abandon the sheep who stumbles.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4311: john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation',
    E'My kingdom is not of this world — John 18:36 and the not-of-this-world kingdom register',
    E'Pilate asked whether Yahusha (Jesus) was a king. The answer Yahusha (Jesus) gave was not a denial of kingship but a precise naming of the kingdom''s source and nature: *My kingdom is not of this world: if my kingdom were of this world, then would my servants fight, that I should not be delivered to the Yahudim (Jews): but now is my kingdom not from hence.* (John 18:36) The Formed one is a king. The kingdom he rules is real. But it does not arise from the present-age power-structures the *kosmos* administers; it does not advance by the sword; it is not geographically bounded by any empire''s territory. Its citizens are scattered through all the nations, and the kingdom gathers them by the Shepherd''s voice, not by political force.\n\nPhilippians 3:20 places the same architecture in Paul''s register: *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* (Philippians 3:20). *Conversation* — the Greek *politeuma,* the colony''s citizenship-register — is in heaven. The citizens of the kingdom live among the nations; their citizenship is not of this world; they look for the King to come and complete the gathering.\n\nLuke 17:20-21 carries the same line from the Formed one''s own mouth: *And when he was demanded of the Pharisees, when the kingdom of Elohim (God) should come, he answered them and said, The kingdom of Elohim (God) cometh not with observation: Neither shall they say, Lo here! or, lo there! for, behold, the kingdom of Elohim (God) is among you.* (Luke 17:20-21). The kingdom is not visible to observation — it does not arrive with the flags and marching columns of a this-world power. It is already present among the scattered citizens wherever the Shepherd''s voice has gathered them.\n\nRevelation 11:15 names the moment when the not-of-this-world kingdom becomes the only kingdom: *The kingdoms of this world are become the kingdoms of our Yahuah (Lord), and of his Messiah (Christ); and he shall reign for ever and ever.* (Revelation 11:15). The not-of-this-world character of the kingdom now is not its permanent character forever — it is the character of the kingdom in the age of the gathering. At the seventh trumpet, the transfer happens: every *kosmos*-administration is absorbed into the kingdom of the Formed one and of the Father. What John 18:36 names as *not from hence* will become the only *hence* there is.\n\nThe kingdom is the news the scattered citizens are being gathered home to. The Formed one told Pilate what kind of king he was: the kind whose servants do not fight to defend him, because the hour was the Father''s appointed hour, and the cup was what that hour required.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4311
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 36
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 18 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 18, 36,
   'canon', 'philippians', 3, 20,
   E'*For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* (Philippians 3:20). The *politeuma* — the citizenship-colony — is in heaven: the same not-of-this-world sourcing of the kingdom John 18:36 names. The citizens of the not-of-this-world kingdom live scattered among the nations; their commonwealth is the kingdom of the Formed one, and they look for the King''s coming to complete what the gathering began.'),
  ('canon', 'john', 18, 36,
   'canon', 'luke', 17, 21,
   E'*Neither shall they say, Lo here! or, lo there! for, behold, the kingdom of Elohim (God) is among you.* (Luke 17:21). The Formed one''s own word to the Pharisees before the passion: the kingdom does not arrive with the observable flags of a this-world power. It is already present among the gathered wherever the Shepherd''s voice has reached them. John 18:36''s *not of this world* and Luke 17:21''s *not with observation* name the same kingdom from two directions.'),
  ('canon', 'john', 18, 36,
   'canon', 'revelation', 11, 15,
   E'*The kingdoms of this world are become the kingdoms of our Yahuah (Lord), and of his Messiah (Christ); and he shall reign for ever and ever.* (Revelation 11:15). The seventh trumpet sounds and every *kosmos*-administration transfers to the Formed one and the Father. What John 18:36 named as *not from hence* — the not-of-this-world kingdom — becomes the only kingdom there is. The scattering-and-gathering age ends; the reign begins.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4312: john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke',
    E'The seamless garment and the lots — John 19:23-24 and the passion parallels in Matthew, Mark, Luke',
    E'John 19:23-24 records a detail none of the synoptics name as precisely: the coat of the Formed one was woven in one piece from top to bottom — without seam. The soldiers chose not to tear it but to cast lots for it entire, so that the scripture would be fulfilled. All four accounts carry the parting of the garments; only John names the seamless character of the coat and makes the fulfillment-of-scripture notation explicit.\n\n*Then the soldiers, when they had crucified Yahusha (Jesus), took his garments, and made four parts, to every soldier a part; and also his coat: now the coat was without seam, woven from the top throughout. They said therefore among themselves, Let us not rend it, but cast lots for it, whose it shall be: that the scripture might be fulfilled, which saith, They parted my raiment among them, and for my vesture they did cast lots.* (John 19:23-24)\n\nMatthew 27:35, Mark 15:24, and Luke 23:34 all carry the casting of lots for the garments — the Psalm 22:18 fulfillment that the soldiers unwittingly enacted. The four passion accounts together establish the garment-lots as a historical fact witnessed from four angles. The seamlessness of the coat in John''s account adds the layer the synoptics do not: the coat woven from top to bottom without joining is the coat of the high priest, woven after the pattern of Exodus 28 — the one-piece garment of the one serving before Yahuah (the LORD) in the sanctuary.\n\n*And they crucified him, and parted his garments, casting lots: that it might be fulfilled which was spoken by the prophet, They parted my garments among them, and upon my vesture did they cast lots.* (Matthew 27:35). The fulfillment-of-scripture notation here in Matthew names the same Psalm 22:18 that John names — the soldiers'' act was prophetically scripted.\n\n*And they crucified him, and parted his garments, casting lots upon them, what every man should take.* (Mark 15:24)\n\n*And they parted his raiment, and cast lots.* (Luke 23:34)\n\nFour witnesses. One event. The coat woven whole, not torn. The high-priestly garment cast for by lot among the soldiers of Rome, who did not know what they were handling.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4312
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 24,
   'canon', 'matthew', 27, 35,
   E'*And they crucified him, and parted his garments, casting lots: that it might be fulfilled which was spoken by the prophet, They parted my garments among them, and upon my vesture did they cast lots.* (Matthew 27:35). Matthew names the Psalm 22 fulfillment explicitly, the same notation John 19:24 carries. The four accounts together establish the garment-division as the prophetically-scripted event it was.'),
  ('canon', 'john', 19, 24,
   'canon', 'mark', 15, 24,
   E'*And they crucified him, and parted his garments, casting lots upon them, what every man should take.* (Mark 15:24). Mark''s witness to the same event: the soldiers divide the garments by lot. John 19:23-24 adds the detail that the coat was seamless and woven whole — the high-priestly coat not torn but preserved by the lots the soldiers cast.'),
  ('canon', 'john', 19, 24,
   'canon', 'luke', 23, 34,
   E'*And they parted his raiment, and cast lots.* (Luke 23:34). Luke''s account of the same moment — the raiment parted, the lots cast. Three synoptic witnesses alongside John''s account, all four establishing the same act. The seamless garment John names is the coat Luke''s account does not name as seamless; read together, the four give the full weight of the event.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4313: john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews',
    E'It is finished — John 19:30 and the once-for-all offering in Hebrews',
    E'The last word the Formed one spoke from the cross was not a cry of defeat. It was the declaration of a completed transaction: *It is finished.* (John 19:30). The Greek *tetelestai* — a commercial term for a paid-in-full receipt, a craftsman''s word for a work brought to completion, a priest''s word for an offering fully accomplished. The Hebrews letter walks the same completion across its middle chapters: the annual repetition of the Yom Kippur offerings was a sign that the matter was not yet finished; the Formed one''s single offering accomplished what the annual offerings signaled but could not do.\n\n*When Yahusha (Jesus) therefore had received the vinegar, he said, It is finished: and he bowed his head, and gave up the ghost.* (John 19:30)\n\n*But this man, after he had offered one sacrifice for sins for ever, sat down on the right hand of Elohim (God).* (Hebrews 10:12). The sitting down is what makes the finishedness legible. The priests in the temple never sat; they stood because the work was never done. The Formed one sat because *It is finished* was true. Hebrews 10:12 is the NT register''s own gloss on *tetelestai*.\n\n*For by one offering he hath perfected for ever them that are sanctified.* (Hebrews 10:14). One offering. For ever. Perfected. Three words that restate *tetelestai* in the vocabulary of the Yom Kippur-completion architecture.\n\n*Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption.* (Hebrews 9:12). *Once* — the Hebrews emphasis on the single unrepeatable entry into the most holy place is the same emphasis *It is finished* carries from the cross. The veil was rent the moment the Formed one gave up the ghost; the way back into the presence was opened; the annual Yom Kippur repetition was superseded by the single entry that needs no repetition.\n\nThe completion the Formed one declared from the cross is the completion the Hebrews letter walks the scattered seed through: the high-priestly work is done; the blood of the everlasting covenant has been brought into the most holy place; the matter is finished. What remains is the gathering of those for whom it was finished — the scattered seed coming home to the sanctuary whose veil is now gone.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4313
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 30
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 30,
   'canon', 'hebrews', 10, 12,
   E'*But this man, after he had offered one sacrifice for sins for ever, sat down on the right hand of Elohim (God).* (Hebrews 10:12). The sitting-down is Hebrews'' rendering of *tetelestai* — the work is done; the priest sits because the offering is complete. The priests of the Levitical order never sat; the Formed one sat because *It is finished* was the truth the cross carried to completion.'),
  ('canon', 'john', 19, 30,
   'canon', 'hebrews', 10, 14,
   E'*For by one offering he hath perfected for ever them that are sanctified.* (Hebrews 10:14). One offering. For ever. Perfected. The same *tetelestai* of John 19:30 named in the vocabulary of the once-for-all Yom Kippur-completion architecture. The annual repetition that could never finish the work is over; the single offering of the Formed one has done what the annual cycle was pointing toward.'),
  ('canon', 'john', 19, 30,
   'canon', 'hebrews', 9, 12,
   E'*Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption.* (Hebrews 9:12). The *once* of Hebrews 9:12 is the *finished* of John 19:30 spoken in the high-priestly-entry register. The veil rent at the moment of *It is finished* was the sign that the blood had been brought into the most holy place by the High Priest who entered once, not annually, and obtained eternal redemption.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4314: john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5',
    E'Blood and water from the pierced side — John 19:34 and the triple witness in 1 John 5:6-8',
    E'When the soldier drove the spear into the side of the already-dead Formed one, what came out was blood and water together — not one, but both. John names himself as the eyewitness: *he that saw it bare record, and his record is true.* (John 19:35). The same Yochanan (John) who watched the blood and water flow from the pierced side wrote, decades later, a letter that returns to the same two fluids and names them as witnesses.\n\n*But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water. And he that saw it bare record, and his record is true: and he knoweth that he saith true, that ye might believe.* (John 19:34-35)\n\n*This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth. For there are three that bear record in heaven, the Father, the Word, and the Ruach HaKodesh (Holy Spirit): and these three are one. And there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one.* (1 John 5:6-8)\n\nThe Formed one *came by water and blood — not by water only, but by water and blood.* The emphasis is on the blood: those who taught that Yahusha (Jesus) was the Formed-one only in his spirit-presence — coming at the water of immersion and departing before the blood of the cross — are ruled out by the apostle''s own eyewitness testimony. He was there when the spear went in. He saw what came out. The Formed one came to the cross in body. The blood is real. The water is real. The two are inseparable.\n\nThe three earthly witnesses the apostle names — the Spirit, the water, and the blood — are the same three that converge in the account of the immersion (John 1:32-34: the Ruach HaKodesh descending, the water of immersion, the blood-line of the Lamb of Elohim) and the cross (John 19:34: the blood and water from the side, the Spirit given up in John 19:30). The Spirit, the water, and the blood agree in one testimony: the Formed one came in flesh, was immersed in water, and gave his blood. The eyewitness of the cross is the same hand that wrote the letter. The record is true.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4314
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 34
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 35
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 34,
   'canon', '1-john', 5, 6,
   E'*This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth.* (1 John 5:6). The apostle who watched the blood and water flow from the pierced side names the same two fluids as the earthly witness to the Formed one''s coming in flesh. *Not by water only, but by water and blood* rules out every teaching that the Formed one''s body was not genuinely present at the cross.'),
  ('canon', 'john', 19, 34,
   'canon', '1-john', 5, 8,
   E'*And there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one.* (1 John 5:8). The Spirit, the water, and the blood — the three earthly witnesses — name the three moments the Formed one''s presence in flesh was most legible: the immersion, the cross, and the outpouring of the Ruach HaKodesh (Holy Spirit) on the gathered. All three agree in one testimony: Yahusha HaMashiach (Jesus Christ) came in flesh, and the blood that came from his side was real blood.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4315: john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1',
    E'The bone not broken — John 19:36 and the Passover Lamb in 1 Corinthians 5 and 1 Peter 1',
    E'The soldiers who came to break the legs of those crucified found Yahusha (Jesus) already dead. They did not break his legs. John 19:36 names this as a fulfillment of scripture — *A bone of him shall not be broken* — pointing to the Passover lamb of Exodus 12:46 and Numbers 9:12. Paul and Peter, writing from within the apostolic tradition, read the same event through the same lens, and each names the Formed one as the Pesach (Passover) lamb whose blood marks the household of the gathered.\n\n*But when they came to Yahusha (Jesus), and saw that he was dead already, they brake not his legs... For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken.* (John 19:33, 36)\n\n*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us: Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* (1 Corinthians 5:7-8). Paul names the Formed one plainly as *our Passover* — the lamb slaughtered at the preparation of the Passover, whose bone was not broken, whose blood marks those who are gathered. The *keep the feast* that follows is not a suggestion that the Feast of Unleavened Bread is now spiritualized away — it is an invitation to walk the feast in its substance: the old leaven of malice and wickedness purged; the new lump unleavened before Yahuah (the LORD).\n\n*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers; But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot: Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* (1 Peter 1:18-20). The Lamb is named as *without blemish and without spot* — the precise Passover-lamb requirement of Exodus 12:5. The foreordination before the foundation of the world names the lamb''s appointment before the scatter that makes the blood necessary.\n\nThe bone-not-broken is not an accident of Roman procedure. It is the sign by which the Formed one''s body was kept according to the pattern of the Passover lamb — the sign that John''s eyewitness preserved, that Paul read as the announcement of the feast, and that Peter named as the blood that redeems from the vain tradition received from the fathers.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4315
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 36
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 36,
   'canon', '1-corinthians', 5, 7,
   E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us.* (1 Corinthians 5:7). Paul names the Formed one as *our Passover* — the Pesach lamb of Exodus 12 whose bone was not broken at John 19:36 is the same lamb Paul identifies here. The bone-not-broken sign names what the lamb was; Paul names what the lamb accomplished: the old leaven purged, the new lump unleavened.'),
  ('canon', 'john', 19, 36,
   'canon', '1-peter', 1, 19,
   E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot: Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* (1 Peter 1:19-20). The *without blemish and without spot* is the Passover-lamb specification of Exodus 12:5; Peter names the Formed one in the same register John 19:36''s bone-not-broken fulfillment points to. The lamb foreordained before the foundation of the world is the lamb whose bone was preserved intact on the cross.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4316: john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15',
    E'The resurrection appearances — John 20 and the gospel tradition in 1 Corinthians 15',
    E'John 20 carries three resurrection appearances on the first day and the eighth day: Mary at the garden, the disciples behind locked doors, and Thomas who was not present the first time. Paul, writing to the Corinthians roughly two decades after these events, delivers a tightly enumerated tradition of resurrection appearances — *I delivered unto you first of all that which I also received* — that names witnesses Paul did not invent and encounters John did not collapse.\n\n*And when he had so said, he shewed unto them his hands and his side. Then were the disciples glad, when they saw Yahuah (Lord). Then said Yahusha (Jesus) to them again, Peace be unto you: as my Father hath sent me, even so send I you.* (John 20:20-21)\n\n*For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures: And that he was seen of Cephas, then of the twelve: After that, he was seen of above five hundred brethren at once; of whom the greater part remain unto this present, but some are fallen asleep. After that, he was seen of James; then of all the apostles. And last of all he was seen of me also, as of one born out of due time.* (1 Corinthians 15:3-8)\n\nPaul''s enumeration sits in the same tradition John 20 carries. The appearance to *the twelve* (1 Corinthians 15:5) is the locked-doors appearance of John 20:19-23 — the night of the first day, Thomas absent, the Formed one standing in the midst and showing his hands and his side. The appearances John 20 records are not private visions; they are the first members of a list Paul is at pains to note as still-verifiable: *the greater part remain unto this present.* The risen body was seen. The appearances were real. The witnesses are named.\n\nThe gospel Paul *received* is the gospel anchored in the historical resurrection: *died for our sins according to the scriptures* — not a spiritual metaphor; *rose again the third day according to the scriptures* — not a later theological construction. The empty tomb and the resurrection appearances in John 20 are the historical ground under the gospel Paul received and delivered. Both the gospel and the historical ground are necessary: the resurrection without the gospel-interpretation is a historical oddity; the gospel without the resurrection is a falsehood. John 20 and 1 Corinthians 15 carry both together.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4316
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 20 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 20 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 20, 20,
   'canon', '1-corinthians', 15, 5,
   E'*And that he was seen of Cephas, then of the twelve.* (1 Corinthians 15:5). The appearance to *the twelve* is the locked-doors appearance John 20:19-23 records — the first-day evening, Thomas absent, the Formed one standing in the midst showing his hands and side. Paul''s enumeration in the tradition he received names the same event John''s eyewitness account preserves.'),
  ('canon', 'john', 20, 19,
   'canon', '1-corinthians', 15, 3,
   E'*For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures.* (1 Corinthians 15:3-4). The tradition Paul received — died, buried, rose the third day — is the historical ground under the appearances John 20 narrates. The empty tomb Mary saw, the linen clothes Peter examined, and the risen one who appeared to the disciples are the *rose again the third day* this tradition names.'),
  ('canon', 'john', 20, 29,
   'canon', '1-corinthians', 15, 6,
   E'*After that, he was seen of above five hundred brethren at once; of whom the greater part remain unto this present, but some are fallen asleep.* (1 Corinthians 15:6). Thomas blessed those who believe without seeing (John 20:29); Paul names the still-living witnesses of the post-resurrection appearances as the check on whether the testimony is fabricated. Both moves point in the same direction: the resurrection is a matter of historical testimony, not private spiritual experience.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4317: john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt',
    E'My Lord and my God — Thomas''s confession and the Formed-one identification in the NT',
    E'On the eighth day, Yahusha (Jesus) stood in the midst again and addressed Thomas directly. Thomas had set a precise condition: he needed to see the print of the nails and put his hand into the side. The Formed one met the condition without reproach and then asked for belief. Thomas''s answer was not a theological proposition about divine ontology. It was a confession wrung out of a man who had just touched the wounds of someone he had watched die: *My Lord and my Elohim (God).* (John 20:28)\n\nThe confession is the load-bearing moment of Formed-one Christology in the gospel. Thomas was not confused. He was not using hyperbole. He was not groping for vocabulary. He named what was standing in front of him: the one he had known as teacher and Lord was Yahuah (God) in flesh. The Formed drawn from the Formless — the one the prologue named as *the Word was Elohim (God)* (John 1:1) — had met Thomas''s condition and Thomas recognized what he was touching.\n\nThis is the identification the Spirit makes legible. Paul names the Spirit-ruled equation directly: *Wherefore I give you to understand, that no man speaking by the Spirit of Elohim (God) calleth Yahusha (Jesus) accursed: and that no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* (1 Corinthians 12:3). The confession *Yahusha (Jesus) is Yahuah (Lord)* is Spirit-revealed; no one arrives at it by argument alone. Thomas arrived at it by touch, by sight, by eight days of doubt resolved in a single moment — and the Ruach HaKodesh (Holy Spirit) made the identification legible.\n\nColossians 2:9 carries the same identification in the vocabulary of fullness: *For in him dwelleth all the fulness of the Godhead bodily.* (Colossians 2:9). All the fullness of the Godhead — not a portion, not a representation, not a mere reflection — dwells bodily in the Formed one. The Thomas moment is the tactile demonstration of this: the fullness that dwells bodily is present in a body that has wounds, a body Thomas''s hands could touch. The Formed one is not an abstraction. The Godhead dwelling bodily is not a metaphor.\n\nRevelation 1:8 places the same name on the same figure: *I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty.* (Revelation 1:8). The Almighty, the beginning and the ending — the Formed one addressing the seven assemblies from the throne he was exalted to after the resurrection Thomas witnessed. What Thomas named with his hands, the Revelation names in the voice that filled the Patmos shore.\n\nThe framework that holds Thomas''s confession without collapsing it: Yahusha (Jesus) is the Formed one drawn from the Formless — the expressed Word, the body the Formless source took on in flesh, the God of every OT theophany who walked in the garden and wrestled at the Yabbok. He is Yahuah (God) and he has a Father. The confession *my Lord and my Elohim (God)* is the right confession. It is not Trinitarian co-equal-persons grammar; it is not modalist collapse. It is the Formed one identified by the Spirit through the testimony of touch.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4317
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 20 AND sv.verse_number = 28
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 20 AND ev.verse_number = 28
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 20, 28,
   'canon', '1-corinthians', 12, 3,
   E'*Wherefore I give you to understand, that no man speaking by the Spirit of Elohim (God) calleth Yahusha (Jesus) accursed: and that no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* (1 Corinthians 12:3). The Spirit-revealed equation: Yahusha (Jesus) is Yahuah (Lord). This is the same identification Thomas made at John 20:28 — *my Lord and my Elohim (God)* — and Paul names the Spirit as the one who makes it legible. Thomas arrived by touch; the Spirit made it true in the utterance.'),
  ('canon', 'john', 20, 28,
   'canon', 'colossians', 2, 9,
   E'*For in him dwelleth all the fulness of the Godhead bodily.* (Colossians 2:9). All the fullness of the Godhead — not a portion, not a representation — dwells bodily in the Formed one. The *bodily* is what Thomas''s hands confirmed: the fullness that dwells bodily is present in a body with wounds that can be touched. Thomas''s confession *my Lord and my Elohim (God)* named precisely what Colossians 2:9 names in the vocabulary of fullness.'),
  ('canon', 'john', 20, 28,
   'canon', 'revelation', 1, 8,
   E'*I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty.* (Revelation 1:8). The Almighty, which is and which was and which is to come — the same Formed one Thomas named as *my Elohim (God)* now speaks from the throne of exaltation. What Thomas''s hands touched in the upper room, the Patmos seer heard from the cloud-rider whose voice is as the sound of many waters. Same one.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4318: john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13',
    E'Feed my sheep — John 21:15-17 and the shepherd of the scattered seed in 1 Peter 5, Acts 20, and Hebrews 13',
    E'The restoration of Peter is the last commissioned act of the risen Formed one in the fourth gospel. Three times he had denied; three times the Formed one asked *Lovest thou me?* Three times the same commission: *Feed my lambs. Feed my sheep. Feed my sheep.* The triple commission corresponds to the triple denial; the shame is not erased by the commission but is redeemed inside it. Kefa (Peter) who could not stand by a charcoal fire and confess is sent back to the same flock by the shores of Tiberias.\n\n*He saith unto him the third time, Simon, son of Jonas, lovest thou me? Peter was grieved because he said unto him the third time, Lovest thou me? And he said unto him, Yahuah (Lord), thou knowest all things; thou knowest that I love thee. Yahusha (Jesus) saith unto him, Feed my sheep.* (John 21:17)\n\nThe flock Kefa (Peter) is commissioned to feed is the same flock the NT letters name when they describe the shepherd-task. 1 Peter 5 carries the charge into the elder-instruction register: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind; Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock. And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* (1 Peter 5:2-4). The *chief Shepherd* who will appear is the same Formed one who commissioned Kefa (Peter) at Tiberias; the under-shepherds are not the source of the flock''s life but ensamples who point to the chief Shepherd.\n\nPaul''s charge to the elders of Ephesus in Acts 20 carries the same commission in the vocabulary of the scattered flock: *Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood. For I know this, that after my departing shall grievous wolves enter in among you, not sparing the flock.* (Acts 20:28-29). The Ruach HaKodesh (Holy Spirit) makes the overseers; the purchase-price is the Formed one''s blood; the threat is the wolves that do not spare the flock. The commission John 21 names as personal restoration and pastoral charge, Acts 20 names as the apostolic tradition to be guarded.\n\nHebrews 13:20 names the Formed one as the Great Shepherd in the language of the everlasting covenant: *Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant, Make you perfect in every good work to do his will.* (Hebrews 13:20-21). The great shepherd of the sheep, brought again from the dead — the same risen Formed one who stood on the shore of Tiberias and restored Kefa (Peter) to the shepherd-task. The blood of the everlasting covenant is what makes the restoration permanent and the commission authoritative.\n\nThe flock these three passages name is not a new institution established for Gentile believers from among all nations. It is the scattered seed of the house of Yashar''el (Israel) — the sheep the Formed one came to gather, the sheep his blood purchased, the sheep the chief Shepherd will appear to at his coming. The pastoral commission of John 21 is the continuation of the lost-sheep gathering that John 10:16 named when the Formed one said *other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The fold is one; the shepherd is one; the flock is the scattered seed coming home.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4318
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 21 AND sv.verse_number = 15
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 21 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 21, 15,
   'canon', '1-peter', 5, 2,
   E'*Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind.* (1 Peter 5:2). The elder-instruction Kefa (Peter) himself writes carries the same charge the Formed one gave him at Tiberias: *Feed my lambs. Feed my sheep.* The shepherd-task is not a title but a willing posture toward the flock the chief Shepherd purchased.'),
  ('canon', 'john', 21, 16,
   'canon', '1-peter', 5, 4,
   E'*And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* (1 Peter 5:4). The *chief Shepherd* who will appear is the same Formed one who restored Kefa (Peter) at Tiberias and commissioned *Feed my sheep*. The under-shepherd''s work is not the source of the flock''s life; it points toward the chief Shepherd whose appearing is the horizon the shepherd-task is held accountable to.'),
  ('canon', 'john', 21, 17,
   'canon', 'acts', 20, 28,
   E'*Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood.* (Acts 20:28). The Ruach HaKodesh (Holy Spirit) makes the overseers; the flock was purchased with the Formed one''s blood. Paul''s charge to the Ephesian elders carries the same architecture as John 21''s triple commission: the shepherd-task is not self-appointed, and the flock belongs to the one who bought it.'),
  ('canon', 'john', 21, 17,
   'canon', 'hebrews', 13, 20,
   E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant, Make you perfect in every good work to do his will.* (Hebrews 13:20-21). The great shepherd of the sheep, raised from the dead through the blood of the everlasting covenant — the same risen Formed one who stood on the shore of Tiberias and restored Kefa (Peter). The blood of the everlasting covenant is what makes the restoration and the commission permanent.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
