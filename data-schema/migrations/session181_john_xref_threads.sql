-- =====================================================================
-- Session 181 migration — john-anchored cross-reference threads
-- =====================================================================
-- 16 threads with 171 member rows
-- Anchor: John book — companion to any pre-existing
-- john-anchored threads from S74 / S110+. All threads at tier='free'.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session181_john_xref_threads.sql
-- =====================================================================

\echo 'Session 181 john migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction.
CREATE TEMP VIEW _s181_john_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- ---------------------------------------------------------------------
-- Thread 1: i-am-statements-as-formed-cloud-rider-self-identification
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'i-am-statements-as-formed-cloud-rider-self-identification',
    E'The *I am* statements as Formed cloud-rider self-identification',
    E'The gospel of John strings seven *I am* statements through its body — the bread of life, the light of the world, the door, the good shepherd, the resurrection and the life, the way, the vine — and one anchoring *before Avraham (Abraham) was, I am* that ties the whole sequence to a single self-disclosure at Sinai. The inherited reading treats these as metaphor or as the Hellenistic philosophical *I am.* They are neither. They are the Formed one''s repeated self-identification as the same *I am* who spoke from the burning bush, the same Formed cloud-rider who appeared to the patriarchs, the same one Yeshayahu (Isaiah) heard say *I, even I, am he* through the gathering prophecies of chapters 41 through 46.\n\n*And Elohim (God) said unto Mosheh (Moses), I AM THAT I AM: and he said, Thus shalt thou say unto the children of Yashar''el (Israel), I AM hath sent me unto you.* (Exodus 3:14)\n\n*Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Before Avraham (Abraham) was, I am.* (John 8:58)\n\n*Ye are my witnesses, saith Yahuah (the LORD), and my servant whom I have chosen: that ye may know and believe me, and understand that I am he: before me there was no El (God) formed, neither shall there be after me. I, even I, am Yahuah (the LORD); and beside me there is no saviour.* (Isaiah 43:10-11)\n\nThe *I am* of John 8:58 is not a philosophical claim about timeless existence. It is the Formed one naming himself as the same Formed one who appeared in the bush, walked in the garden in the cool of the day, wrestled with Ya''aqov (Jacob) at the Yabbok, sat upon the throne high and lifted up in Yeshayahu''s (Isaiah''s) vision, and rode the cloud across the Tanakh''s theophanies. The Formless source — the Father — is not seen and not named in this register. The Formed Word is what the *I am* names. The men who picked up stones at the end of John 8 understood exactly what was being claimed; that is why they reached for the stones.\n\nThe seven thematic *I am* statements all carry the same weight. Each names a covenant function the Tanakh assigned to Yahuah (the LORD) himself, and each lands it on Yahusha (Jesus) as the Formed cloud-rider in flesh. The shepherd, the bread, the light, the door, the resurrection — these are Yahuah''s (the LORD''s) functions in the prophets, restored to the body that took them on at the incarnation.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1001
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND ev.book_slug = 'john' AND ev.chapter_number = 8 AND ev.verse_number = 58
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 8, 58, 'exodus', 3, 14, 1, E'*Before Avraham (Abraham) was, I am* is the Formed one''s self-naming as the same *I AM THAT I AM* who spoke from the burning bush. The Greek *egō eimi* without a predicate is the Septuagint''s rendering of the *Ehyeh* of Exodus 3:14 — Yahusha (Jesus) is not making a new claim; he is naming who he has always been.'),
  ('john', 8, 58, 'isaiah', 43, 10, 2, E'*That ye may know and believe me, and understand that I am he* — the Yeshayahu (Isaiah) 41-46 *I am he* register that Yahusha''s (Jesus''s) absolute *I am* in John 8 lands on. The Tanakh source for the predicate-less *I am* sits here, not in Greek philosophy.'),
  ('john', 8, 24, 'isaiah', 43, 10, 3, E'*If ye believe not that I am he, ye shall die in your sins* — *I am he* used here in exactly the Yeshayahu (Isaiah) 43:10 *I am he* construction; the believing-or-dying register names the eschatological weight of the Formed one''s self-disclosure.'),
  ('john', 6, 35, 'exodus', 16, 4, 4, E'*I am the bread of life* — Yahusha (Jesus) names himself as the substance the manna was prefiguring. The Tanakh''s bread-from-heaven was a sign; the Formed one in flesh is what the sign was pointing toward.'),
  ('john', 8, 12, 'isaiah', 60, 1, 5, E'*I am the light of the world* — the Formed one as the light that rises on Yashar''el (Israel) in Yeshayahu''s (Isaiah''s) gathering prophecy. *Arise, shine; for thy light is come, and the glory of Yahuah (the LORD) is risen upon thee* sits behind the John 8 declaration.'),
  ('john', 10, 9, 'psalms', 118, 20, 6, E'*I am the door* — the gate of Yahuah (the LORD) through which the righteous enter. The Tanakh''s *gate of Yahuah (the LORD), into which the righteous shall enter* is the same gate Yahusha (Jesus) names himself as.'),
  ('john', 10, 11, 'ezekiel', 34, 11, 7, E'*I am the good shepherd* — Yahuah (the LORD) himself searching out his sheep through the Yechezkel (Ezekiel) 34 shepherd-restoration. The Formed cloud-rider takes on the shepherd-function the Tanakh assigned to Yahuah (the LORD) directly.'),
  ('john', 10, 14, 'psalms', 23, 1, 8, E'*I am the good shepherd, and know my sheep* — *Yahuah Ra''ah (The LORD is my shepherd)* spoken by the same shepherd, now in flesh among his flock.'),
  ('john', 11, 25, 'daniel', 12, 2, 9, E'*I am the resurrection, and the life* — the resurrection promise of *many of them that sleep in the dust of the earth shall awake* lands on the Formed one as its agent.'),
  ('john', 14, 6, 'isaiah', 35, 8, 10, E'*I am the way, the truth, and the life* — *and an highway shall be there, and a way, and it shall be called The way of holiness* — the Yeshayahu (Isaiah) 35 *way* the redeemed walk on home is named by the Formed one as himself.'),
  ('john', 15, 1, 'isaiah', 5, 7, 11, E'*I am the true vine* — *the vineyard of Yahuah Tseva''ot (the LORD of hosts) is the house of Yashar''el (Israel)* — the Formed one names himself as the true vine that the failed-vineyard of Yeshayahu (Isaiah) 5 was prefiguring. The vine is the covenant body restored in him.'),
  ('john', 18, 5, 'exodus', 3, 14, 12, E'*Yahusha (Jesus) saith unto them, I am. As soon then as he had said unto them, I am, they went backward, and fell to the ground.* The arresting party falls backward at the predicate-less *egō eimi* — the same name that knocked the Yashar''eli (Israelite) elders down at Sinai. The Formed cloud-rider names himself once more, and the men sent to take him cannot stand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:i-am-statements-as-formed-cloud-rider-self-identification | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for i-am-statements-as-formed-cloud-rider-self-identification.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'i-am-statements-as-formed-cloud-rider-self-identification'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:i-am-statements-as-formed-cloud-rider-self-identification | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 2: word-made-flesh-formed-of-the-formless
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'word-made-flesh-formed-of-the-formless',
    E'The Word made flesh — the Formed expression of the Formless',
    E'The prologue of John lays the framework''s Formless-and-Formed reading of Yahuah (God) out in eighteen verses, against the opening of Genesis. The Formless source — the Father — is what no eye has seen and lived. The Formed Word — *with* Elohim (God) and *was* Elohim (God) — is the one through whom the heavens and the earth were spoken into being, the one who appeared to the patriarchs, the one who came in flesh as Yahusha (Jesus). The inherited Trinitarian reading collapses these distinctions into three co-equal persons in one substance; the Tanakh''s own architecture refuses the collapse.\n\n*In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God). The same was in the beginning with Elohim (God). All things were made by him; and without him was not any thing made that was made.* (John 1:1-3)\n\n*And he said, Thou canst not see my face: for there shall no man see me, and live.* (Exodus 33:20)\n\n*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* (John 1:18)\n\nThe pattern is consistent across the canon. The Formless never appears. The Formed is everywhere the Tanakh records a theophany — the angel of Yahuah (the LORD) at Mamre, the man at the Yabbok, the burning bush, the cloud at Sinai, the throne in the temple, the form like a son of Adam beside the Head of Days. The eighteen-verse prologue does not invent this; it names what the canon has been showing all along.\n\n*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power.* (Hebrews 1:3)\n\nThe Word made flesh is the Formed expression of the Formless source taking on a body. The submission of the Son to the Father, named through John''s gospel as *my Father is greater than I*, is not a temporary humility for the incarnation. It is the eternal architecture of the Formless and the Formed — the Son drawn from the Father, eternally proceeding from him and submitting to him, in flesh and before.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1002
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 1, 1, 'genesis', 1, 1, 1, E'*In the beginning* — the Septuagint''s *en archē* echoing *bereshit*; John signals at the first syllable that what follows is a creation-account in the same register as Genesis 1, with the Word as the agent through whom *Elohim (God) said.*'),
  ('john', 1, 3, 'genesis', 1, 3, 2, E'*And Elohim (God) said, Let there be light: and there was light* — the targumic tradition reads this as *the memra of Yahuah (the LORD) said.* John locks the same reading: the Word is the one through whom every created thing was made.'),
  ('john', 1, 3, 'psalms', 33, 6, 3, E'*By the word of Yahuah (the LORD) were the heavens made; and all the host of them by the breath of his mouth* — the Tanakh''s own naming of the Word as the creative agent.'),
  ('john', 1, 3, 'proverbs', 8, 22, 4, E'*Yahuah (the LORD) possessed me in the beginning of his way, before his works of old* — Wisdom personified speaking of her pre-existence and her presence at the creation, in the Tanakh''s own register. The Formed one as the eternal expression of the Formless.'),
  ('john', 1, 14, 'exodus', 33, 20, 5, E'*Thou canst not see my face: for there shall no man see me, and live* — the Formless source is what no eye sees. *The Word was made flesh, and dwelt among us* is the Formed cloud-rider taking on a body that can be seen and touched. The architecture the prologue rests on is here.'),
  ('john', 1, 14, 'exodus', 34, 6, 6, E'*Yahuah (the LORD), Yahuah (the LORD) El (God), merciful and gracious, longsuffering, and abundant in goodness and truth* — the *grace and truth* of John 1:14 is the *chesed v''emet* of Sinai''s self-disclosure. The Word made flesh is the Sinai-self-disclosure walking among his people.'),
  ('john', 1, 14, 'exodus', 40, 34, 7, E'*Then a cloud covered the tent of the congregation, and the glory of Yahuah (the LORD) filled the tabernacle* — *dwelt among us* in John 1:14 is the Greek *eskēnōsen*, *tabernacled among us.* The same glory that filled the wilderness tent now tabernacles in flesh.'),
  ('john', 1, 18, 'genesis', 18, 1, 8, E'*Yahuah (the LORD) appeared unto him in the plains of Mamre ... and, lo, three men stood by him* — the patriarchal theophany. *No man hath seen Elohim (God) at any time* names the Formless; Avraham (Abraham) sees the Formed. The two statements stand together.'),
  ('john', 1, 18, 'genesis', 32, 30, 9, E'*I have seen Elohim (God) face to face, and my life is preserved* — Ya''aqov (Jacob) at Peniel. The Formed one is what was wrestled with; the Formless is what Mosheh (Moses) could not see.'),
  ('john', 1, 18, 'isaiah', 6, 1, 10, E'*I saw also Yahuah (the LORD) sitting upon a throne, high and lifted up* — Yeshayahu (Isaiah) sees the Formed one on the throne. John 12:41 names this verse and says *these things said Yeshayahu (Isaiah), when he saw his glory, and spake of him* — locking the Yeshayahu (Isaiah) 6 vision as a vision of the Formed Word.'),
  ('john', 1, 1, '1-john', 1, 1, 11, E'*That which was from the beginning, which we have heard, which we have seen with our eyes ... of the Word of life* — the same prologue voice, naming the same Word that was in the beginning, now witnessed in flesh.'),
  ('john', 1, 18, '1-corinthians', 11, 3, 12, E'*The head of the Messiah (Christ) is Elohim (God)* — the eternal headship of the Father over the Son, preserved through and after the incarnation. The Formless source remains source; the Formed expression remains expression; the submission is the relation''s own architecture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:word-made-flesh-formed-of-the-formless | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for word-made-flesh-formed-of-the-formless.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'word-made-flesh-formed-of-the-formless'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:word-made-flesh-formed-of-the-formless | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 3: other-sheep-and-the-lost-house-of-yashar-el
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'other-sheep-and-the-lost-house-of-yashar-el',
    E'Other sheep, one fold — the lost house gathered in',
    E'The good shepherd discourse names *other sheep I have, which are not of this fold* — and the inherited reading flattens this into a categorical extension of the covenant to the nations. The Tanakh''s own shepherd-prophecies will not allow the flattening. Yahusha (Jesus) was sent to the lost sheep of the house of Yashar''el (Israel), and the *other sheep* who must be brought are the scattered seed of the northern house that the prophets named as a specific people Yahuah (the LORD) himself will go out and seek.\n\n*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* (John 10:16)\n\n*For thus saith Adonai Yahuah (the Lord GOD); Behold, I, even I, will both search my sheep, and seek them out. As a shepherd seeketh out his flock in the day that he is among his sheep that are scattered; so will I seek out my sheep, and will deliver them out of all places where they have been scattered in the cloudy and dark day.* (Ezekiel 34:11-12)\n\n*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land: and I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* (Ezekiel 37:21-22)\n\nThe two-stick prophecy of Yechezkel (Ezekiel) 37 is what *one fold, and one shepherd* names. The fold Yahusha (Jesus) is speaking from contains the recognized house of Yahudah (Judah). The other sheep are the scattered seed of the house of Yashar''el (Israel) — the northern tribes carried into the Assyrian dispersion, divorced through the prophets, living among the nations as the *Lo-Ammi* of Hoshea (Hosea) 1. The shepherd''s voice will reach them where they are scattered, and they will hear, because they were sheep from the foundation of the world. Hearing reveals what was always true; it does not create what was not.\n\nThe Yahudim (Jews) who heard the discourse understood the geography exactly. The fold they were in was the southern house. The other sheep were a specific other body — not the nations of Bereshit (Genesis) 1, but the northern house whose scattering and gathering the prophets had named in repeated specificity.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1003
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 16
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 10, 16, 'ezekiel', 34, 11, 1, E'*I, even I, will both search my sheep, and seek them out* — Yahuah (the LORD) himself as the shepherd who goes out to gather the scattered. *Other sheep I have* names the same flock the Tanakh shepherd is searching for.'),
  ('john', 10, 16, 'ezekiel', 34, 23, 2, E'*I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* — the Davidic-Messianic shepherd-restoration; Yahusha (Jesus) is the one shepherd of *one fold, one shepherd.*'),
  ('john', 10, 16, 'ezekiel', 37, 21, 3, E'*I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone* — the gathering from the nations the *other sheep* statement names in the discourse register.'),
  ('john', 10, 16, 'ezekiel', 37, 22, 4, E'*I will make them one nation in the land ... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* — *one fold, and one shepherd* is the two-houses-into-one prophecy spoken in shepherd-language.'),
  ('john', 10, 16, 'jeremiah', 23, 3, 5, E'*And I will gather the remnant of my flock out of all countries whither I have driven them, and will bring them again to their folds: and they shall be fruitful and increase* — the gathering of the scattered remnant the Yirmeyahu (Jeremiah) 23 shepherd-prophecy names; Yahusha (Jesus) is its agent.'),
  ('john', 10, 16, 'jeremiah', 50, 6, 6, E'*My people hath been lost sheep: their shepherds have caused them to go astray, they have turned them away on the mountains* — the lost-sheep diagnosis of the exile; the *other sheep* of the Father are these.'),
  ('john', 10, 16, 'isaiah', 56, 8, 7, E'*Adonai Yahuah (the Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him* — *yet will I gather others* read in the prophet''s own register: the outcasts of Yashar''el (Israel) are who is being gathered, and *others* of the same outcast body are still being gathered. The Tanakh source for *other sheep* sits here.'),
  ('john', 10, 16, 'hosea', 1, 10, 8, E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* — the Lo-Ammi-to-sons-of-the-living-Elohim restoration of the scattered house; the *other sheep* coming home in the prophet''s voice.'),
  ('john', 10, 16, 'hosea', 1, 11, 9, E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* — the *one head* is the *one shepherd*; the two houses become one fold.'),
  ('john', 10, 27, 'matthew', 15, 24, 10, E'*My sheep hear my voice* — Yahusha (Jesus) at the Canaanite-woman pericope says *I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* The same mission scope, named on both sides of his ministry.'),
  ('john', 11, 51, 'ezekiel', 37, 21, 11, E'*That Yahusha (Jesus) should die for that nation; and not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* — Qayafa''s (Caiaphas''s) unwitting prophecy names the gathering of the scattered children of Elohim (God), the Yechezkel (Ezekiel) 37 two-stick prophecy spoken by the high priest.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:other-sheep-and-the-lost-house-of-yashar-el | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for other-sheep-and-the-lost-house-of-yashar-el.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'other-sheep-and-the-lost-house-of-yashar-el'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:other-sheep-and-the-lost-house-of-yashar-el | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 4: my-sheep-hear-my-voice-hearing-reveals-not-creates
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'my-sheep-hear-my-voice-hearing-reveals-not-creates',
    E'My sheep hear my voice — hearing reveals what was true before the foundation',
    E'The good shepherd discourse contains a sentence the inherited reading cannot hold without rewriting it. *Ye believe not, because ye are not of my sheep.* The cause-and-effect is reversed from the gospel the modern pulpit preaches. The pulpit teaches *if you believe, you become a sheep.* The discourse teaches *if you are a sheep, you hear and believe.* The hearing is the revealing; the sheep-status is what is being revealed. The status precedes the response.\n\n*But ye believe not, because ye are not of my sheep, as I said unto you. My sheep hear my voice, and I know them, and they follow me: and I give unto them eternal life; and they shall never perish, neither shall any man pluck them out of my hand. My Father, which gave them me, is greater than all; and no man is able to pluck them out of my Father''s hand.* (John 10:26-29)\n\n*Yahuah (the LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee.* (Jeremiah 31:3)\n\n*And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* (Revelation 13:8)\n\nThe Father gave them to the Son. The Father gave them before the foundation of the world. Their names were written then. The hearing of the shepherd''s voice in time is the revealing of what was already true in the Father''s foreknowledge — not the moment in which the sheep-status was created by the act of believing. The gathering of the scattered seed is not the recruitment of volunteers from the categorical nations; it is the homecoming of those whose names were written in the Lamb''s book from the foundation.\n\nThis is why the gathering can be proclaimed broadly without the proclamation collapsing into a categorical invitation to all flesh. The proclamation goes out wherever the Father sends. Those who hear are revealed by their hearing to be sheep. Those who reject have the dust shaken off the foot, and the pearls are not cast before swine. The shepherd does not chase what was never his.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1004
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 25
   AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 10, 26, 'revelation', 13, 8, 1, E'*Ye believe not, because ye are not of my sheep* — the names were written from the foundation of the world; those whose names are not written cannot hear when the shepherd calls. The hearing reveals what the foundation-of-the-world enrollment already settled.'),
  ('john', 10, 27, 'jeremiah', 31, 3, 2, E'*I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* — the drawing precedes the coming. The everlasting-love is the *gave them me* of John 10:29 spoken in the prophet''s voice.'),
  ('john', 10, 27, 'ezekiel', 34, 11, 3, E'*I, even I, will both search my sheep, and seek them out* — the shepherd''s voice the sheep hear is the same shepherd Yechezkel (Ezekiel) names as the one who goes out searching.'),
  ('john', 10, 28, 'isaiah', 49, 15, 4, E'*Can a woman forget her sucking child, that she should not have compassion on the son of her womb? yea, they may forget, yet will I not forget thee* — the security of the sheep in the Father''s hand named in Yeshayahu''s (Isaiah''s) gathering-prophecy register.'),
  ('john', 10, 29, 'deuteronomy', 7, 7, 5, E'*Yahuah (the LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people: But because Yahuah (the LORD) loved you* — the love-not-the-merit. The Father''s *gave them me* sits on the same gratuitous-love substance.'),
  ('john', 6, 37, 'jeremiah', 31, 10, 6, E'*All that the Father giveth me shall come to me* — *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* The gathering is the Father''s act; the Son receives those the Father gives.'),
  ('john', 6, 44, 'hosea', 11, 4, 7, E'*No man can come to me, except the Father which hath sent me draw him* — *I drew them with cords of a man, with bands of love.* The drawing is the Father''s; the response in time is the revealing of the drawing.'),
  ('john', 6, 65, 'ezekiel', 36, 26, 8, E'*Therefore said I unto you, that no man can come unto me, except it were given unto him of my Father* — the coming requires the new heart. The new heart is given of the Father. The Spirit who is put within causes the walking in statutes; the same Spirit causes the hearing of the shepherd''s voice.'),
  ('john', 10, 27, 'matthew', 13, 11, 9, E'*Unto you it is given to know the mysteries of the kingdom of heaven, but to them it is not given* — the same cause-and-effect structure spoken in the parables-context. The hearing is given to the sheep.'),
  ('john', 17, 9, 'revelation', 17, 8, 10, E'*I pray for them: I pray not for the world, but for them which thou hast given me; for they are thine* — *whose names were not written in the book of life from the foundation of the world.* The two categories are the same two categories: those given by the Father from the foundation, and those not. The praying is for the first; the world the praying is not for is the second.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:my-sheep-hear-my-voice-hearing-reveals-not-creates | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for my-sheep-hear-my-voice-hearing-reveals-not-creates.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'my-sheep-hear-my-voice-hearing-reveals-not-creates'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:my-sheep-hear-my-voice-hearing-reveals-not-creates | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 5: born-from-above-new-heart-not-new-religion
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'born-from-above-new-heart-not-new-religion',
    E'Born from above — the new heart, not a new religion',
    E'The Nikodemos discourse is read in the inherited grammar as the founding-text of evangelical conversion theology — *you must be born again* read as the call to a one-time prayer that flips a person from unsaved to saved. The Tanakh source the discourse rests on says something different and sharper. *Born from above* — *gennēthē anōthen* in the Greek — is the new-heart promise of Yechezkel (Ezekiel) 36 and the new-covenant promise of Yirmeyahu (Jeremiah) 31, named in the language of birth because the change is that deep. The promise is Torah internalized, not Torah replaced. The new heart is the equipment for the walk, not the certificate that the walk no longer matters.\n\n*Yahusha (Jesus) answered and said unto him, Verily, verily, I say unto thee, Except a man be born again, he cannot see the kingdom of Elohim (God) ... Except a man be born of water and of the Ruach (Spirit), he cannot enter into the kingdom of Elohim (God).* (John 3:3, 5)\n\n*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26-27)\n\n*Behold, the days come, saith Yahuah (the LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah) ... I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:31, 33)\n\nNikodemos was a master of Yashar''el (Israel). Yahusha (Jesus) rebukes him for not knowing these passages — *art thou a master of Yashar''el (Israel), and knowest not these things?* The new birth is not new doctrine. It is the Tanakh promise breaking into time. The water-and-the-Spirit is the *I will sprinkle clean water upon you* and the *I will put my Ruach (Spirit) within you* of Yechezkel (Ezekiel) 36 spoken in shorthand. Born from above is the equipment-for-the-walk being given to those who are gathered. The walk it equips is the walk in the statutes the Spirit causes the heart to keep.\n\nThe Spirit who blows where he wills in John 3:8 is the same Spirit who spoke at Sinai. He does not lead in two directions. He does not write Torah on the heart in one chapter and abolish it in another. The new birth is the inside-version of what Sinai gave outside; the substance is the same; the surface is moved from stone to flesh.\n\nThe hearing of the new birth in time is the revealing of what was already true in the Father''s foreknowledge — not the moment in which sheep-status is created by saying a prayer. Hearing reveals; it does not create. *Elohim (God) so loved the world* is the love that sends the Formed one to gather the citizens of the kingdom from within the *kosmos;* belief is the response of those given; the response issues in covenant walking; grace returns the gathered to him and to his ways. The new birth equips the walk it always required.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1005
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 8
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 3, 3, 'ezekiel', 36, 26, 1, E'*Except a man be born again* — the new-heart-and-new-spirit promise of Yechezkel (Ezekiel) 36 named in birth-language. The change is that deep; the Tanakh source provides the substance.'),
  ('john', 3, 5, 'ezekiel', 36, 25, 2, E'*Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* — the *born of water* of John 3:5 is the Yechezkel (Ezekiel) 36 sprinkling spoken in birth-register.'),
  ('john', 3, 5, 'ezekiel', 36, 27, 3, E'*I will put my Ruach (Spirit) within you, and cause you to walk in my statutes* — the *born of the Spirit* of John 3:5 is the Spirit-given-for-Torah-walking; the walk in the statutes is the equipment the new birth supplies.'),
  ('john', 3, 5, 'jeremiah', 31, 33, 4, E'*I will put my law in their inward parts, and write it in their hearts* — the inward-parts and the heart are the surface the new birth moves the Torah onto. New surface; same Torah.'),
  ('john', 3, 8, 'ezekiel', 37, 9, 5, E'*Thus saith Adonai Yahuah (the Lord GOD); Come from the four winds, O breath, and breathe upon these slain, that they may live* — the wind of the Spirit blowing on the valley of dry bones. The Spirit who blows where he wills in John 3:8 is the same Ruach (Spirit) who blows the scattered seed back to life.'),
  ('john', 3, 10, 'ezekiel', 36, 26, 6, E'*Art thou a master of Yashar''el (Israel), and knowest not these things?* — Yahusha (Jesus) rebukes Nikodemos for not recognizing the Yechezkel (Ezekiel) and Yirmeyahu (Jeremiah) source he was being taught from. The new birth is not new revelation; it is the Tanakh promise breaking into time.'),
  ('john', 3, 14, 'numbers', 21, 9, 7, E'*And as Mosheh (Moses) lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up* — the lifted-up brazen serpent in the wilderness; whoever looked was healed. Yahusha (Jesus) names himself as the substance the Tanakh-sign was prefiguring. The seed-of-Adam restoration of the title carries here.'),
  ('john', 3, 16, 'deuteronomy', 7, 7, 8, E'*For Elohim (God) so loved the world* read against *Yahuah (the LORD) did not set his love upon you, nor choose you, because ye were more in number than any people ... But because Yahuah (the LORD) loved you* — the loving-not-the-merit, named in the prologue''s wider register at John 3:16. The love is the source; the giving is the means; the believing is the response of those given.'),
  ('john', 3, 36, 'habakkuk', 2, 4, 9, E'*He that believeth on the Son hath everlasting life: and he that believeth not the Son shall not see life; but the wrath of Elohim (God) abideth on him* — *the just shall live by his faith* in the prophet''s voice; the belief that issues in life is the belief the Tanakh names as the just-shall-live faith.'),
  ('john', 3, 5, 'hebrews', 8, 10, 10, E'*I will put my laws into their mind, and write them in their hearts* — the apostolic quotation of Yirmeyahu (Jeremiah) 31:33 applied to the new-covenant gathering; the new birth and the new covenant are the same arrival from two sides.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:born-from-above-new-heart-not-new-religion | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for born-from-above-new-heart-not-new-religion.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'born-from-above-new-heart-not-new-religion'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:born-from-above-new-heart-not-new-religion | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 6: salvation-is-of-the-yahudim-not-the-binary
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'salvation-is-of-the-yahudim-not-the-binary',
    E'*Salvation is of the Yahudim (Jews)* — read against the scattered-seed framework',
    E'The Shomeronite (Samaritan) woman at the well asks Yahusha (Jesus) the worship-location question — *our fathers worshipped in this mountain; and ye say, that in Yerushalayim (Jerusalem) is the place where men ought to worship.* His answer carries one of the most-misused sentences in the gospel: *salvation is of the Yahudim (Jews).* The inherited reading flattens it into a categorical claim that the saved are the Yahudim (Jews) and everyone else is added by faith-confession into the Yahudi (Jewish) category. The framework reads it differently. The Shomeronites are the remnant of the northern house — the scattered seed of Yashar''el (Israel) that the Assyrian dispersion absorbed and the Yahudim (Jews) of Yerushalayim (Jerusalem) refused to recognize. The discourse is the Formed shepherd telling a daughter of the northern house exactly where the gathering centers.\n\n*Ye worship ye know not what: we know what we worship: for salvation is of the Yahudim (Jews). But the hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him.* (John 4:22-23)\n\n*Behold, I will take the stick of Yoseph (Joseph), which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand.* (Ezekiel 37:19)\n\n*And it shall come to pass in that day, that Yahuah (the LORD) shall set his hand again the second time to recover the remnant of his people ... And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:11-12)\n\n*Salvation is of the Yahudim (Jews)* names the Davidic-Messianic line — the Messiah comes through Yahudah (Judah), the kingship promise sits on Yahudah''s (Judah''s) tribe, the temple stands in Yahudah''s (Judah''s) city. The northern house lost its claim to the centralized worship of Yahuah (the LORD) when it broke with the southern house at Yerov''am (Jeroboam) and set up the calves at Bethel and Dan. The two-stick prophecy of Yechezkel (Ezekiel) 37 names the restoration: Yoseph (Joseph)''s stick is joined to Yahudah''s (Judah''s) stick in the Messianic hand. The Shomeronite woman is being told her gathering goes through the Yahudi (Jewish) Messiah at the Yahudi (Jewish) city — not because the northern house is being absorbed into the southern one, but because the southern one carries the seed-line through which the gathering is being accomplished.\n\n*Spirit and in truth* completes the answer. The hour is coming when the geography of the temple is overtaken by the substance the temple was always pointing toward — the Father''s worship through the Formed Son, in the Ruach HaKodesh (Holy Spirit), accessible wherever the Father is sought. The Shomeronite is being gathered home through the Yahudah (Judah)-line Messiah, into a worship that crosses the geography her fathers and the southern fathers had argued about for centuries.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1006
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 22
   AND ev.book_slug = 'john' AND ev.chapter_number = 4 AND ev.verse_number = 22
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 4, 22, '2-kings', 17, 24, 1, E'*And the king of Assyria brought men from Bavel (Babylon), and from Kuth, and from Avva, and from Hamath, and from Sepharvayim, and placed them in the cities of Shomeron (Samaria) instead of the children of Yashar''el (Israel)* — the northern-house deportation and the Samaritan resettlement; the historical backdrop of the well-encounter.'),
  ('john', 4, 22, '2-kings', 17, 33, 2, E'*They feared Yahuah (the LORD), and served their own gods* — the syncretism of the remaining-and-resettled northern population; *ye worship ye know not what* names the same syncretism in the Formed one''s voice.'),
  ('john', 4, 22, 'genesis', 49, 10, 3, E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* — the Yahudah (Judah)-line sceptre carrying the Messianic promise; *salvation is of the Yahudim (Jews)* sits on this verse.'),
  ('john', 4, 22, 'isaiah', 2, 3, 4, E'*Out of Tsion (Zion) shall go forth the Torah, and the word of Yahuah (the LORD) from Yerushalayim (Jerusalem)* — the Yerushalayim (Jerusalem) centering of the gathering; the geography the well-discourse names.'),
  ('john', 4, 22, 'ezekiel', 37, 19, 5, E'*Behold, I will take the stick of Yoseph (Joseph), which is in the hand of Ephraim ... and will put them with him, even with the stick of Yahudah (Judah)* — the two-stick prophecy; the northern house''s recovery happens through joining to the Yahudah (Judah)-stick the Messiah carries.'),
  ('john', 4, 22, 'romans', 9, 5, 6, E'*Whose are the fathers, and of whom as concerning the flesh the Messiah (Christ) came* — the apostolic affirmation that the Messiah comes through the Yahudim (Jews); Paul writes what Yahusha (Jesus) said.'),
  ('john', 4, 23, 'malachi', 1, 11, 7, E'*For from the rising of the sun even unto the going down of the same my name shall be great among the nations* — the prophetic widening of the geography of true worship; *spirit and in truth* the substance of what *every place* will hold.'),
  ('john', 4, 23, 'isaiah', 56, 7, 8, E'*Even them will I bring to my holy mountain, and make them joyful in my house of prayer ... for mine house shall be called an house of prayer for all people* — the Yeshayahu (Isaiah) 56 stranger is the outcast of Yashar''el (Israel) brought back to the holy mountain; the gathering opens the worship to those who were locked out.'),
  ('john', 4, 42, 'genesis', 49, 10, 9, E'*We have heard him ourselves, and know that this is indeed the Messiah (Christ), the Saviour of the world* — the Shomeronites recognize the *Shiloh* of Bereshit (Genesis) 49 to whom *the gathering of the people* is. The northern-house remnant recognizes the Messiah from the Yahudah (Judah)-stick.'),
  ('john', 4, 25, 'deuteronomy', 18, 15, 10, E'*Yahuah (the LORD) thy Elohim (God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* — the Mosaic prophecy of the prophet-like-Mosheh (Moses); the Shomeronites held to the five books and were waiting for this prophet. *I know that Messiah cometh* names this expectation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:salvation-is-of-the-yahudim-not-the-binary | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for salvation-is-of-the-yahudim-not-the-binary.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'salvation-is-of-the-yahudim-not-the-binary'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:salvation-is-of-the-yahudim-not-the-binary | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 7: lifted-up-substance-brazen-serpent-to-crucifixion
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'lifted-up-substance-brazen-serpent-to-crucifixion',
    E'The lifted-up substance — from the brazen serpent to the tree',
    E'John builds a *lifted up* thread across the gospel. *As Mosheh (Moses) lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up.* *When ye have lifted up the Son of Adam, then shall ye know that I am he.* *And I, if I be lifted up from the earth, will draw all men unto me.* Three uses of the same verb across three discourses — and the substance is the brazen-serpent-healing of Bemidbar (Numbers) 21 applied to the cross. The looking-and-being-healed pattern of the wilderness sign is what the lifting-up of the Formed one on the tree completes.\n\n*And Mosheh (Moses) made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived.* (Numbers 21:9)\n\n*And as Mosheh (Moses) lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up: That whosoever believeth in him should not perish, but have eternal life.* (John 3:14-15)\n\n*Then said Yahusha (Jesus) unto them, When ye have lifted up the Son of Adam, then shall ye know that I am he, and that I do nothing of myself; but as my Father hath taught me, I speak these things.* (John 8:28)\n\n*And I, if I be lifted up from the earth, will draw all men unto me. This he said, signifying what death he should die.* (John 12:32-33)\n\nThe serpent on the pole bore the curse the people had walked into. The Formed one on the tree bore the curse the scattered seed had walked into. The healing in both cases was for those who looked. The cross did not abolish the curse-system the rebellion had triggered; it bore the curse, opened the door home, and called the bitten to look. The seed-of-Adam restoration of the title at John 3:14 is load-bearing — *the Son of Adam* is the lineage-name; the lifting-up is the body of the lineage taking the curse of the lineage onto himself.\n\nThe looking is what saves in the wilderness. The looking is what saves on the tree. The bitten who looked away died; the bitten who looked lived. The proclamation of the cross is the call to look. *He shall draw all men unto me* in John 12 is read in the gathering register — the lifted-up Formed one is the ensign of Yeshayahu (Isaiah) 11:12, the standard around which the outcasts of Yashar''el (Israel) and the dispersed of Yahudah (Judah) gather from the four corners. The drawing is the gathering of the scattered seed; the lifting-up is the visible signal that says *here.*\n\nThe *whosoever* of John 3:14-15 is the citizen of the kingdom whose name was written in the Lamb''s book from the foundation of the world; the lifting-up is the visible signal to him, and his hearing reveals what was already true. The drawing is not the recruitment of volunteers from the categorical nations; it is the homecoming of the seed. The looking that saves is the response of the new heart; the response issues in covenant walking; grace returns the gathered to him and to his ways.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1007
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 14
   AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 3, 14, 'numbers', 21, 9, 1, E'*And Mosheh (Moses) made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived* — the wilderness-sign Yahusha (Jesus) names as the type of his own lifting-up. The Son of Adam takes onto himself the curse of the seed of Adam.'),
  ('john', 3, 14, 'numbers', 21, 6, 2, E'*And Yahuah (the LORD) sent fiery serpents among the people, and they bit the people; and much people of Yashar''el (Israel) died* — the bite that the brazen serpent answered. The cross answers the bite of the seed-war that has run through the seed of Adam since the garden.'),
  ('john', 8, 28, 'isaiah', 52, 13, 3, E'*Behold, my servant shall deal prudently, he shall be exalted and extolled, and be very high* — the suffering-servant *lifted up* of Yeshayahu (Isaiah) 52-53; *when ye have lifted up the Son of Adam* is the verbal echo of the prophet''s *exalted.*'),
  ('john', 12, 32, 'isaiah', 11, 12, 4, E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* — the lifted-up Formed one as the gathering-ensign around which the scattered seed comes home; *I will draw all men unto me* spoken in the prophet''s gathering-of-the-outcasts register.'),
  ('john', 12, 32, 'deuteronomy', 21, 23, 5, E'*He that is hanged is accursed of Elohim (God)* — the curse-on-the-tree of the Devarim (Deuteronomy) judicial-law; the Formed one bears the curse of the seed by hanging on the tree, opening the door home.'),
  ('john', 12, 33, 'isaiah', 53, 5, 6, E'*He was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him* — the suffering-servant carrying the wounds of the scattered. *Signifying what death he should die* names the Yeshayahu (Isaiah) 53 death.'),
  ('john', 19, 37, 'zechariah', 12, 10, 7, E'*They shall look on me whom they pierced* — the pierced-one Zekharyah (Zechariah) names is the lifted-up Formed one of John 3:14, 8:28, 12:32. The looking that heals at the brazen serpent is the looking that heals at the cross.'),
  ('john', 12, 32, 'hosea', 11, 4, 9, E'*I drew them with cords of a man, with bands of love* — the drawing of the scattered seed; the lifted-up Formed one as the cord and the band by which the Father draws the children home.'),
  ('john', 8, 28, 'daniel', 7, 13, 10, E'*I beheld in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven* — the lifted-up Son of Adam on the tree is the same one Daniel saw coming on the clouds; the kaph-comparative preserved in the vision honors the incarnation that the lifting-up accomplishes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:lifted-up-substance-brazen-serpent-to-crucifixion | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for lifted-up-substance-brazen-serpent-to-crucifixion.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'lifted-up-substance-brazen-serpent-to-crucifixion'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:lifted-up-substance-brazen-serpent-to-crucifixion | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 8: yahusha-as-passover-lamb-bone-not-broken
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'yahusha-as-passover-lamb-bone-not-broken',
    E'Yahusha (Jesus) as the Passover lamb — bone not broken',
    E'John alone among the gospel-writers locks the timing of the crucifixion to the preparation of the Pesach (Passover) — Yahusha (Jesus) is delivered to be crucified at the hour the Pesach lambs are being slaughtered in the temple courts. The cross-detail John adds — that the soldiers did not break his legs because he was already dead — is named explicitly as the fulfillment of the Pesach-lamb commandment of Shemot (Exodus) 12. The whole architecture of the death is the Pesach architecture, and the Formed one is named as the lamb the Tanakh feast was always pointing toward.\n\n*And it was the preparation of the Pesach (Passover), and about the sixth hour: and he saith unto the Yahudim (Jews), Behold your King!* (John 19:14)\n\n*Then came the soldiers, and brake the legs of the first, and of the other which was crucified with him. But when they came to Yahusha (Jesus), and saw that he was dead already, they brake not his legs ... For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken.* (John 19:32-33, 36)\n\n*In one house shall it be eaten; thou shalt not carry forth ought of the flesh abroad out of the house; neither shall ye break a bone thereof.* (Exodus 12:46)\n\n*He keepeth all his bones: not one of them is broken.* (Psalm 34:20)\n\nThe Pesach lamb was selected on the tenth of Aviv, kept four days, and slaughtered at the appointed hour on the fourteenth. Its blood was struck on the lintel and the two side-posts; the destroying angel passed over the houses marked by the blood. Yahusha (Jesus) enters Yerushalayim (Jerusalem) on the tenth of Aviv, is tested in the temple courts the four days, and is delivered to be crucified at the hour the lambs are being slaughtered. The bone-not-broken commandment of Shemot (Exodus) 12:46 is preserved on his body even though every other body crucified that day had its legs broken to hasten death. The Tanakh sign is fulfilled on the body of the Formed one.\n\nThe Pesach is not abolished by this. It is filled with its substance. The same Tanakh-feast that taught the seed of Yashar''el (Israel) for fifteen centuries the architecture of redemption now lands on the body of the Messiah, whose blood marks the houses of the gathered against the dreadful day. The keeping of the Pesach by the seed who walk in the new covenant is the keeping of the memorial of what the lamb''s body accomplished on the cross — not the keeping of a thing abolished, but the keeping of a thing fulfilled, in the prophetic sense of being filled-full of the substance the sign always carried.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1008
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 14
   AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 1, 29, 'exodus', 12, 3, 1, E'*Behold the Lamb of Elohim (God), which taketh away the sin of the world* — *in the tenth day of this month they shall take to them every man a lamb.* Yochanan (John) the Witness names Yahusha (Jesus) as the lamb the Pesach selection ritual was prefiguring; the architecture is named at the front of the gospel.'),
  ('john', 1, 29, 'exodus', 12, 5, 2, E'*Your lamb shall be without blemish, a male of the first year* — the lamb-of-Elohim recognition lands on the Pesach-lamb specifications; the Formed one is the without-blemish male the feast required.'),
  ('john', 1, 29, 'isaiah', 53, 7, 3, E'*He is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* — the Yeshayahu (Isaiah) 53 suffering-servant as the lamb; Yochanan (John) the Witness''s *Lamb of Elohim (God)* draws on both the Pesach lamb and the suffering-servant lamb.'),
  ('john', 19, 14, 'exodus', 12, 6, 4, E'*And the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* — the appointed-hour killing of the Pesach lamb; John''s *about the sixth hour* on *the preparation of the Pesach* lands the crucifixion at the temple-court slaughter window.'),
  ('john', 19, 31, 'deuteronomy', 21, 23, 5, E'*His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day* — the Torah''s commandment for the hanged body; the Yahudim (Jews) asking that the bodies be removed before the Sabbath enforces the Torah-commandment.'),
  ('john', 19, 36, 'exodus', 12, 46, 6, E'*Neither shall ye break a bone thereof* — the Pesach-lamb bone-not-broken commandment fulfilled on the body of Yahusha (Jesus); the Tanakh sign is preserved on the body the soldiers found dead before they broke the legs.'),
  ('john', 19, 36, 'numbers', 9, 12, 7, E'*They shall leave none of it unto the morning, nor break any bone of it: according to all the ordinances of the Pesach (Passover) they shall keep it* — the second Tanakh-statement of the same commandment; the doubled witness in the Torah is preserved on the body.'),
  ('john', 19, 36, 'psalms', 34, 20, 8, E'*He keepeth all his bones: not one of them is broken* — the psalmist''s affirmation of the righteous one''s preservation; applied to the Formed one''s body as the lamb the Pesach prefigured.'),
  ('john', 19, 34, 'zechariah', 12, 10, 9, E'*They shall look upon me whom they pierced, and they shall mourn for him* — the piercing of the side and the issuing of blood and water; the Zekharyah (Zechariah) 12 pierced-one identification preserved in the spear-thrust.'),
  ('john', 19, 14, 'exodus', 12, 14, 10, E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (the LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* — the everlasting nature of the Pesach memorial; not abolished by the lamb''s death but filled with its substance. The memorial continues; the substance is named.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:yahusha-as-passover-lamb-bone-not-broken | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for yahusha-as-passover-lamb-bone-not-broken.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'yahusha-as-passover-lamb-bone-not-broken'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:yahusha-as-passover-lamb-bone-not-broken | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 9: bread-from-heaven-manna-and-the-formed
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'bread-from-heaven-manna-and-the-formed',
    E'Bread from heaven — the manna and the Formed one',
    E'The bread-from-heaven discourse in John 6 reads against Shemot (Exodus) 16 and Devarim (Deuteronomy) 8. The crowd that ate the loaves and fishes follows Yahusha (Jesus) across the lake and asks for a sign — what will you do, that we may see and believe? Their fathers ate manna in the wilderness, as it is written *he gave them bread from heaven to eat.* The Formed one''s answer takes the manna-tradition and lands it on his own body. The manna was the sign; the Formed one in flesh is what the sign was pointing toward.\n\n*Then Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Mosheh (Moses) gave you not that bread from heaven; but my Father giveth you the true bread from heaven. For the bread of Elohim (God) is he which cometh down from heaven, and giveth life unto the world ... I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* (John 6:32-33, 35)\n\n*Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day* (Exodus 16:4)\n\n*And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (the LORD) doth man live.* (Deuteronomy 8:3)\n\nThe Devarim (Deuteronomy) 8:3 reading of the manna names the substance: the bread itself is not the point; the *word that proceedeth out of the mouth of Yahuah (the LORD)* is what the bread was teaching the people to live by. The Formed one is the Word made flesh; the bread the wilderness ate was a sign pointing forward to the Word himself becoming food the body could take in. The eating-and-drinking discourse of John 6:53-58 is the same point pressed into shock-language: the Word made flesh is bread for the inward man; what the manna prefigured is now substance.\n\nThe crowd quarrels and many turn back. The hardness of the discourse is not in its difficulty as concept — it is in its refusal to let the manna remain mere food. The bread that the fathers ate in the wilderness fed them and they died; the bread that came down from heaven, if a man eat of it, he shall live forever. The Word made flesh, taken into the inward man through the believing-and-coming the discourse names, is the bread that endures unto everlasting life. The manna was the sign; the Formed one is the substance.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1009
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 32
   AND ev.book_slug = 'john' AND ev.chapter_number = 6 AND ev.verse_number = 58
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 6, 31, 'psalms', 78, 24, 1, E'*And had rained down manna upon them to eat, and had given them of the corn of heaven* — the verse the crowd quotes when they ask for a sign; the psalmist''s memorial of the wilderness manna.'),
  ('john', 6, 31, 'exodus', 16, 4, 2, E'*Then said Yahuah (the LORD) unto Mosheh (Moses), Behold, I will rain bread from heaven for you* — the Tanakh source of the manna-event; the wilderness sign the crowd is comparing the loaves-and-fishes to.'),
  ('john', 6, 31, 'exodus', 16, 15, 3, E'*And when the children of Yashar''el (Israel) saw it, they said one to another, It is manna: for they wist not what it was* — the not-knowing-what-it-was of the wilderness eaters; the Tanakh source of the substance-being-hidden-in-the-sign pattern.'),
  ('john', 6, 32, 'deuteronomy', 8, 3, 4, E'*Man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (the LORD) doth man live* — the Devarim (Deuteronomy) 8 reading of the manna''s substance; the Word the bread was teaching the people to live by. The Formed one''s *I am the bread of life* lands on this verse.'),
  ('john', 6, 33, 'proverbs', 30, 8, 5, E'*Feed me with food convenient for me* — the daily-bread tradition; the manna was rationed daily so the people would learn dependence. The Formed one as the bread of life is the daily-bread substance.'),
  ('john', 6, 35, 'isaiah', 55, 1, 6, E'*Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat* — the prophet''s invitation to the thirsting; *he that cometh to me shall never hunger; and he that believeth on me shall never thirst* sits on the same invitation in the Formed one''s voice.'),
  ('john', 6, 45, 'isaiah', 54, 13, 7, E'*And all thy children shall be taught of Yahuah (the LORD); and great shall be the peace of thy children* — the Yeshayahu (Isaiah) 54 promise the Formed one quotes; the gathering of the children taught directly by the Father is what *every man therefore that hath heard, and hath learned of the Father, cometh unto me* names.'),
  ('john', 6, 48, 'exodus', 16, 35, 8, E'*And the children of Yashar''el (Israel) did eat manna forty years, until they came to a land inhabited; they did eat manna, until they came unto the borders of the land of Kena''an (Canaan)* — the duration of the wilderness manna; the bread that fed the fathers and yet they died. The Formed one as the bread that endures unto everlasting life is the contrast the discourse builds.'),
  ('john', 6, 51, 'exodus', 12, 8, 9, E'*And they shall eat the flesh in that night, roast with fire, and unleavened bread* — the eating of the Pesach lamb''s flesh; the wilderness-Tanakh substance behind the *eat my flesh* of John 6:51-56. The Pesach architecture and the manna architecture both feed the *bread of life* discourse.'),
  ('john', 6, 58, 'numbers', 11, 7, 10, E'*And the manna was as coriander seed, and the colour thereof as the colour of bdellium* — the wilderness-description of the manna; the visual sign the Formed one supersedes by giving himself as the substance.'),
  ('john', 6, 53, 'daniel', 7, 13, 11, E'*Except ye eat the flesh of the Son of Adam, and drink his blood, ye have no life in you* — the seed-of-Adam restoration of the title; the eating-the-flesh discourse lands on the Daniel 7 *kbar enash* who is the Formed cloud-rider in flesh. The lineage-name and the eating-of-the-substance hold together.'),
  ('john', 6, 62, 'john', 3, 13, 12, E'*What and if ye shall see the Son of Adam ascend up where he was before?* read with *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* — the pre-existent Formed one''s descending-and-ascending; the Son of Adam who came down is the same Son of Adam who returns.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:bread-from-heaven-manna-and-the-formed | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for bread-from-heaven-manna-and-the-formed.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'bread-from-heaven-manna-and-the-formed'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:bread-from-heaven-manna-and-the-formed | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 10: i-and-my-father-are-one-formless-and-formed
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'i-and-my-father-are-one-formless-and-formed',
    E'*I and my Father are one* — the Formless and the Formed',
    E'The inherited Christian reading of *I and my Father are one* runs the verse through Nicene grammar — three co-equal persons in one divine substance — and the inherited Hebrew Roots reaction collapses the verse into modalism, the Father and Son as one undifferentiated being. Both readings miss what the verse says. The framework reads it through the Formless-and-Formed grid the canon''s own theophanies carry: the Father is the formless infinite source; the Son is the Formed expression of the Formless, drawn from the Father and eternally proceeding from him. The *oneness* is the oneness of source-and-expression, not the equality-of-persons-in-substance of the creed and not the modal-collapse of the reaction.\n\n*I and my Father are one.* (John 10:30)\n\n*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* (Deuteronomy 6:4)\n\n*Ye have heard how I said unto you, I go away, and come again unto you. If ye loved me, ye would rejoice, because I said, I go unto the Father: for my Father is greater than I.* (John 14:28)\n\nThe Shema is the source the *one* of John 10:30 sits on. Yahuah (the LORD) is one. Within that oneness, the Formless source has expressed himself in a Formed Word — distinct enough to be *with* the Formless, yet itself *is* the divine being, because it is the self-expression of the same divine being. The Word is not a second god. The Word is the Formed expression of the Formless divine being who is one.\n\nThe *my Father is greater than I* of John 14:28 is the eternal-submission-of-the-Formed-to-the-Formless preserved in the incarnation. The Nicene reading must spend centuries explaining this verse away, because three co-equal persons cannot stand in ordered relation. The framework reads it at face value: the Son is drawn from the Father, proceeds from the Father, submits to the Father — in flesh and before. The submission is not the diminishing of divinity. It is the form the divinity takes in the relation between source and expression.\n\n*If thou hadst known me, thou shouldest have known my Father also: and from henceforth ye know him, and have seen him.* (John 14:7)\n\nThe Formed one is the visible face of the invisible Father. To see the Formed is to see, in the only way creatures can see, the Father whose face cannot be seen. The Shema holds; the Father is the Formless source; the Son is the Formed expression; the Ruach HaKodesh (Holy Spirit) is the moving presence of Yahuah within both and the creation he speaks into being. One Yahuah (the LORD), revealed in Formless source and Formed expression and moving Spirit. Not three of the same kind of thing. Not one being wearing different hats. The relation is the divinity''s own architecture, eternal and ordered.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1010
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 30
   AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 10, 30, 'deuteronomy', 6, 4, 1, E'*Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* — the Shema; the *one* of John 10:30 sits on this oneness. The Formless source and the Formed expression are one Yahuah (the LORD), not two beings and not two persons co-equal in a substance.'),
  ('john', 10, 30, 'zechariah', 14, 9, 2, E'*And Yahuah (the LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* — the eschatological consummation of the oneness; the same oneness John 10:30 names.'),
  ('john', 14, 28, '1-corinthians', 11, 3, 3, E'*The head of the Messiah (Christ) is Elohim (God)* — the eternal headship of the Father over the Son; *my Father is greater than I* spoken in the apostolic register. The Formless source remains source; the Formed expression remains expression.'),
  ('john', 14, 28, '1-corinthians', 15, 28, 4, E'*Then shall the Son also himself be subject unto him that put all things under him, that Elohim (God) may be all in all* — the eschatological submission of the Son to the Father; the Trinity''s co-equal-persons frame cannot account for the eschatological submission; the Formless-and-Formed reading carries it natively.'),
  ('john', 14, 9, 'exodus', 33, 20, 5, E'*He that hath seen me hath seen the Father* read against *thou canst not see my face: for there shall no man see me, and live.* The Formless source is what no eye sees; the Formed one is the visible face through which the Father is seen. The two statements stand together.'),
  ('john', 14, 9, 'colossians', 1, 15, 6, E'*Who is the image of the invisible Elohim (God), the firstborn of every creature* — the apostolic locking of the visible-image / invisible-source architecture; the Formed one is the image of the Formless.'),
  ('john', 14, 9, 'hebrews', 1, 3, 7, E'*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* — the brightness-of-the-glory and the express-image as the Formed expression of the Formless source; the same architecture, named in the Hebrews prologue.'),
  ('john', 10, 30, 'genesis', 1, 26, 8, E'*And Elohim (God) said, Let us make man in our image, after our likeness* — the plural *us* of Genesis 1:26 is the Formless and the Formed in communication; the oneness contains the relation.'),
  ('john', 17, 21, 'deuteronomy', 6, 4, 9, E'*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us* — the oneness the gathered are brought into is the same oneness of the Formless and the Formed; the Shema''s oneness as the architecture of the gathered body.'),
  ('john', 17, 5, 'proverbs', 8, 23, 10, E'*Glorify thou me with thine own self with the glory which I had with thee before the world was* — the pre-existent glory of the Formed Word with the Formless source; *I was set up from everlasting, from the beginning, or ever the earth was* spoken in the wisdom-personified register echoes the Word''s pre-existence in his own voice.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:i-and-my-father-are-one-formless-and-formed | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for i-and-my-father-are-one-formless-and-formed.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'i-and-my-father-are-one-formless-and-formed'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:i-and-my-father-are-one-formless-and-formed | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 11: gather-together-in-one-the-children-scattered-abroad
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'gather-together-in-one-the-children-scattered-abroad',
    E'*Gather together in one the children that were scattered abroad*',
    E'The high priest Qayafa (Caiaphas) speaks an unwitting prophecy after the raising of Lazar (Lazarus). *It is expedient for us, that one man should die for the people, and that the whole nation perish not.* John adds an apostolic gloss naming the deeper meaning of the words Qayafa (Caiaphas) did not understand: Yahusha (Jesus) would die not for that nation only, but to gather together in one the children of Elohim (God) that were scattered abroad. The gathering-of-the-scattered-children is the twelve-tribe restoration the prophets had named in repeated specificity — the two-stick prophecy of Yechezkel (Ezekiel) 37, the assembly of the outcasts of Yeshayahu (Isaiah) 11, the *children of Yashar''el (Israel) gathered together* of Hoshea (Hosea) 1. The death of the Formed one is named as the means by which the gathering is accomplished.\n\n*And this spake he not of himself: but being high priest that year, he prophesied that Yahusha (Jesus) should die for that nation; And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad.* (John 11:51-52)\n\n*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land: and I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all.* (Ezekiel 37:21-22)\n\n*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12)\n\nThe *children of Elohim (God) that were scattered abroad* is not a categorical extension of the covenant to the nations. The phrase is the diaspora-of-the-scattered-seed, the *Lo-Ammi* of Hoshea (Hosea) 1 that the prophet immediately restores with *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* The children of Elohim (God) who are scattered abroad are the seed who lost their identity in the dispersion; the gathering is their homecoming through the death of the Formed one as the agent of the Father''s gathering hand.\n\nThe high priest, standing in the office that was supposed to recognize this, speaks the prophecy without knowing what he is saying. The apostle who writes the gospel makes the framework explicit. The death-for-the-nation has its inner architecture: it is the means by which the scattered children are gathered into one. The two-stick prophecy is named in the high priest''s mouth.\n\n*And it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)\n\nThe gathering is the destination of the journey the prophets named. The practice in the present age is broad proclamation, because the citizens of the kingdom are scattered through every nation and we cannot pick them out by sight. *My sheep hear my voice* (John 10:27) — the hearing is the revealing of what was already true. Those who hear and turn are revealed to be sheep, because they were sheep before the foundation of the world. Those who reject, we shake the dust off our feet (Matthew 10:14) and we do not cast our pearls before swine (Matthew 7:6). The pursuit ends where the rejection lands; the shepherd does not chase what was never his. Belief is the response of those given; the response issues in covenant walking; grace returns the gathered to him and to his ways.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1011
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 51
   AND ev.book_slug = 'john' AND ev.chapter_number = 11 AND ev.verse_number = 52
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 11, 52, 'ezekiel', 37, 21, 1, E'*I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side* — the gathering of the scattered children Qayafa (Caiaphas) unwittingly prophesies; the Tanakh source the apostolic gloss draws on.'),
  ('john', 11, 52, 'ezekiel', 37, 22, 2, E'*I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all* — *gather together in one* is the one-nation, one-king destination of the two-stick prophecy.'),
  ('john', 11, 52, 'isaiah', 11, 11, 3, E'*Yahuah (the LORD) shall set his hand again the second time to recover the remnant of his people* — the second-recovery the gathering names; the present-age proclamation of the gathering is the second-recovery in motion.'),
  ('john', 11, 52, 'isaiah', 11, 12, 4, E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* — the assembly of the outcasts; both houses, named, gathered.'),
  ('john', 11, 52, 'isaiah', 56, 8, 5, E'*Adonai Yahuah (the Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him* — the continuing gathering of the outcasts; *others* of the same body still being drawn home.'),
  ('john', 11, 52, 'hosea', 1, 10, 6, E'*In the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* — the *children of Elohim (God) that were scattered abroad* is the diaspora-of-the-Lo-Ammi being restored to *sons-of-the-living-Elohim* identity.'),
  ('john', 11, 52, 'hosea', 1, 11, 7, E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* — the *gather together in one* of John 11:52 is the *gathered together* of Hoshea (Hosea) 1:11; one head, one shepherd, one fold.'),
  ('john', 11, 52, 'jeremiah', 31, 10, 8, E'*He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* — the scattering-hand is the gathering-hand; the same Yahuah (the LORD) who scattered the seed is the one who gathers it home through the Formed one''s death.'),
  ('john', 10, 16, 'ezekiel', 37, 24, 9, E'*And David my servant shall be king over them; and they all shall have one shepherd* — the one-shepherd of the two-stick prophecy is the Davidic-Messianic shepherd Yahusha (Jesus) names himself as at John 10. The gathering and the shepherd-discourse name the same restoration from two sides.'),
  ('john', 11, 51, 'zechariah', 12, 10, 10, E'*And I will pour upon the house of David, and upon the inhabitants of Yerushalayim (Jerusalem), the Ruach (Spirit) of grace and of supplications: and they shall look upon me whom they pierced, and they shall mourn for him* — the Zekharyah (Zechariah) 12 pierced-one as the agent of the gathering; the high priest''s *one man should die* names the same death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:gather-together-in-one-the-children-scattered-abroad | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for gather-together-in-one-the-children-scattered-abroad.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'gather-together-in-one-the-children-scattered-abroad'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:gather-together-in-one-the-children-scattered-abroad | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 12: the-hour-and-the-cup-of-the-fathers-wrath
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-hour-and-the-cup-of-the-fathers-wrath',
    E'The hour, and the cup of the Father''s wrath',
    E'John builds a *the hour* refrain across the gospel — *mine hour is not yet come* at Qana (Cana), *mine hour is not yet come* through the early Yerushalayim (Jerusalem) discourses, *the hour is come* at the entry into the Pesach (Passover) week, *the cup which my Father hath given me, shall I not drink it?* at the arrest. The hour and the cup are not gospel-only language. The cup of Yahuah (the LORD)''s wrath is a Tanakh image with a specific architecture — the cup of staggering that the rebellious nations and the unfaithful house must drink, that Yashar''el (Israel) drank in her exile-judgment, that Yahusha (Jesus) drinks on behalf of the scattered seed at the hour the Father appointed.\n\n*Now is my soul troubled; and what shall I say? Father, save me from this hour: but for this cause came I unto this hour.* (John 12:27)\n\n*Then said Yahusha (Jesus) unto Kefa (Peter), Put up thy sword into the sheath: the cup which my Father hath given me, shall I not drink it?* (John 18:11)\n\n*For thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel) unto me; Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it.* (Jeremiah 25:15)\n\n*Awake, awake, stand up, O Yerushalayim (Jerusalem), which hast drunk at the hand of Yahuah (the LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling, and wrung them out. There is none to guide her among all the sons whom she hath brought forth ... Therefore hear now this, thou afflicted, and drunken, but not with wine: Thus saith thy Adonai Yahuah (Lord GOD), and thy Elohim (God) that pleadeth the cause of his people, Behold, I have taken out of thine hand the cup of trembling, even the dregs of the cup of my fury; thou shalt no more drink it again.* (Isaiah 51:17, 18, 21-22)\n\nThe cup the Formed one drinks at the hour the Father appointed is the cup of staggering that Yashar''el (Israel) had drunk in her exile-judgment — drunk to the dregs, with no son to guide her, until Yeshayahu (Isaiah) 51 names Yahuah (the LORD) taking the cup out of her hand. The Formed one drinks it on behalf of the scattered seed, so that the cup is removed from the body of the gathered. *I have taken out of thine hand the cup of trembling* is the Tanakh source of the Gethsemane cup that *this cause came I unto this hour* names.\n\nThe hour is not chronological coincidence. It is the appointed-time of the Father''s gathering hand acting through the Formed one''s drinking of the cup. The Tanakh-prophetic *day of Yahuah (the LORD)*, the *hour of darkness*, the cup of Yirmeyahu (Jeremiah) 25, the cup of Tehillim (Psalm) 75, the cup of Yeshayahu (Isaiah) 51 — all of these converge on the hour the Formed one drinks the cup so the scattered may be gathered without drinking it.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1012
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 11
   AND ev.book_slug = 'john' AND ev.chapter_number = 18 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 18, 11, 'jeremiah', 25, 15, 1, E'*Take the wine cup of this fury at my hand, and cause all the nations, to whom I send thee, to drink it* — the Yirmeyahu (Jeremiah) 25 cup of Yahuah''s (the LORD''s) fury; the Formed one drinks the cup the nations were to drink, on behalf of the scattered seed within the nations.'),
  ('john', 18, 11, 'isaiah', 51, 17, 2, E'*Awake, awake, stand up, O Yerushalayim (Jerusalem), which hast drunk at the hand of Yahuah (the LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling, and wrung them out* — the cup Yashar''el (Israel) drank in exile-judgment.'),
  ('john', 18, 11, 'isaiah', 51, 22, 3, E'*Thus saith thy Adonai Yahuah (Lord GOD), and thy Elohim (God) that pleadeth the cause of his people, Behold, I have taken out of thine hand the cup of trembling, even the dregs of the cup of my fury; thou shalt no more drink it again* — the Father takes the cup out of the people''s hand; the Formed one drinks it at Gethsemane so that *thou shalt no more drink it again* is fulfilled.'),
  ('john', 18, 11, 'psalms', 75, 8, 4, E'*For in the hand of Yahuah (the LORD) there is a cup, and the wine is red; it is full of mixture; and he poureth out of the same: but the dregs thereof, all the wicked of the earth shall wring them out, and drink them* — the cup-in-the-Father''s-hand of the psalmist; the cup the Formed one names at John 18:11 as *the cup which my Father hath given me.*'),
  ('john', 12, 27, 'psalms', 42, 5, 5, E'*Why art thou cast down, O my soul? and why art thou disquieted in me?* — the Gethsemane-anticipation in the Tanakh''s psalm-register; the troubled soul of the righteous facing the hour.'),
  ('john', 12, 27, 'psalms', 6, 3, 6, E'*My soul is also sore vexed: but thou, O Yahuah (the LORD), how long?* — *now is my soul troubled* sits on the psalmist''s same vexed-soul language.'),
  ('john', 12, 27, 'isaiah', 53, 10, 7, E'*Yet it pleased Yahuah (the LORD) to bruise him; he hath put him to grief* — the suffering-servant''s bruising at the Father''s hand; the substance of *for this cause came I unto this hour.*'),
  ('john', 12, 23, 'daniel', 7, 13, 8, E'*The hour is come, that the Son of Adam should be glorified* — the Son of Adam of Daniel 7 named as glorified at the hour the cup is drunk; the kaph-comparative preserved at Daniel 7:13 honors the incarnation that drinks the cup.'),
  ('john', 13, 1, 'exodus', 12, 11, 9, E'*Now before the feast of the Pesach (Passover), when Yahusha (Jesus) knew that his hour was come* — *it is Yahuah''s (the LORD''s) Pesach (Passover)* of the wilderness; the hour of the Formed one''s departure is the hour of the Pesach memorial.'),
  ('john', 18, 11, 'lamentations', 4, 21, 10, E'*The cup also shall pass through unto thee: thou shalt be drunken, and shalt make thyself naked* — the cup passing to the nations in the lamenter''s voice; the Formed one''s drinking interrupts the circuit so the gathered may be spared.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-hour-and-the-cup-of-the-fathers-wrath | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for the-hour-and-the-cup-of-the-fathers-wrath.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-hour-and-the-cup-of-the-fathers-wrath'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-hour-and-the-cup-of-the-fathers-wrath | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 13: kosmos-and-the-prayer-not-for-the-world
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'kosmos-and-the-prayer-not-for-the-world',
    E'The *kosmos* and the prayer not for the world',
    E'John 17 is the high-priestly prayer of the Formed one on the night of the arrest. Inside it sits a sentence the inherited reading struggles with: *I pray for them: I pray not for the world, but for them which thou hast given me; for they are thine.* The pulpit that runs the universal-love grammar through *Elohim (God) so loved the world* of John 3:16 cannot make room for a praying that excludes the world. The framework reads the two statements together without contradiction: the *kosmos* of John''s gospel is the present-age administration that lies in wickedness; the Father''s love acts toward the *kosmos* by sending the Formed one as the gathering-ensign for the scattered citizens of his kingdom who live within the *kosmos*; the praying is for those given to the Son by the Father, who are the gathered citizens themselves.\n\n*I pray for them: I pray not for the world, but for them which thou hast given me; for they are thine.* (John 17:9)\n\n*And we know that we are of Elohim (God), and the whole world lieth in wickedness.* (1 John 5:19)\n\n*Father, the hour is come; glorify thy Son, that thy Son also may glorify thee: As thou hast given him power over all flesh, that he should give eternal life to as many as thou hast given him.* (John 17:1-2)\n\nThe praying is for *as many as thou hast given him* — the same body the John 10:29 *my Father, which gave them me* names. The gathering of the scattered seed is the giving the Father is doing; the Formed one prays for those gathered, for those being gathered, and for those who will believe through the word of the gathered (John 17:20). The body the praying is for is the citizens of the kingdom — the scattered seed coming home through the Father''s drawing.\n\nThe *kosmos* the praying is not for is the present-age power-structure of the rulers of darkness, the principalities and powers, the kingdom-administrations under fallen administration. The praying is not for the *system* — it is for the citizens being drawn out of the system. The Father''s love for the world that John 3:16 names is the love that sends the Formed one to gather the scattered seed who live within the *kosmos*; the praying that excludes the *kosmos* at John 17:9 is the praying that does not pray for the perpetuation of the system from which the scattered are being drawn. The two statements describe one motion of one love operating in two directions.\n\nThe audience of the gathering-proclamation is the citizens of the kingdom, and we do not know them by sight. The proclamation goes out wherever the Father sends; those who hear are revealed by their hearing to be sheep. Belief is the response of those given; the response issues in covenant walking; grace returns the gathered to him and to his ways.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1013
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 17 AND sv.verse_number = 9
   AND ev.book_slug = 'john' AND ev.chapter_number = 17 AND ev.verse_number = 9
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 17, 9, '1-john', 5, 19, 1, E'*The whole world lieth in wickedness* — the *kosmos* of John''s gospel and epistles named as the present-age power-structure under fallen administration; the praying is not for the system but for the citizens being drawn out.'),
  ('john', 17, 9, 'daniel', 10, 13, 2, E'*The prince of the kingdom of Persia withstood me one and twenty days* — the principalities administering the world''s kingdoms in Daniel''s vision; the *kosmos* the praying excludes is the structure these principalities administer.'),
  ('john', 17, 9, 'ephesians', 6, 12, 3, E'*We wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world* — the apostolic naming of the present-age power-structure the *kosmos* of John 17:9 refers to.'),
  ('john', 17, 2, 'isaiah', 49, 6, 4, E'*And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Ya''aqov (Jacob), and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* — the Father''s giving of the servant for the raising-up of the tribes and the restoring of the preserved; the praying for the given is the praying for these.'),
  ('john', 17, 2, 'psalms', 2, 8, 5, E'*Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession* — the Father''s giving of the nations to the Son in the messianic-psalm register; *power over all flesh* the substance of this giving in John 17:2.'),
  ('john', 17, 11, 'numbers', 6, 24, 6, E'*Yahuah (the LORD) bless thee, and keep thee* — the keeping-language the Father is asked to apply to those given to the Son; the Aaronic-blessing substance preserved in the high-priestly prayer.'),
  ('john', 17, 12, 'psalms', 41, 9, 7, E'*Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* — *the son of perdition* of the betrayal-pericope; the Tanakh-source of the loss of the one who was never of the Father''s giving.'),
  ('john', 17, 14, 'psalms', 1, 1, 8, E'*Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* — the separation-from-the-counsel-of-the-ungodly that the *they are not of the world, even as I am not of the world* names.'),
  ('john', 17, 21, 'ezekiel', 37, 17, 9, E'*And join them one to another into one stick; and they shall become one in thine hand* — the two-stick joining is the architecture of the *they all may be one* prayer; the gathering of the seed into one body is the substance of the oneness asked for.'),
  ('john', 17, 24, 'psalms', 17, 15, 10, E'*As for me, I will behold thy face in righteousness: I shall be satisfied, when I awake, with thy likeness* — the eschatological seeing-of-the-glory the praying asks for the gathered; the resurrection-hope of the righteous in the Tanakh''s voice.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:kosmos-and-the-prayer-not-for-the-world | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for kosmos-and-the-prayer-not-for-the-world.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'kosmos-and-the-prayer-not-for-the-world'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:kosmos-and-the-prayer-not-for-the-world | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 14: yochanan-witness-pattern-faithful-witness-tradition
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'yochanan-witness-pattern-faithful-witness-tradition',
    E'The faithful-witness pattern — Yochanan (John) in the Daniel-Revelation register',
    E'The gospel of John closes with an editorial postscript naming the beloved disciple as the writing-witness: *this is the disciple which testifieth of these things, and wrote these things: and we know that his testimony is true.* The same Yochanan (John) hands the canon the Revelation, where he is named the writing-witness of the throne-vision and the seven assemblies. The witness-pattern Yochanan (John) embodies sits in a Tanakh-tradition the canon carries forward: Daniel writes the vision; Yechezkel (Ezekiel) eats the scroll; Yeshayahu (Isaiah) signs and seals the testimony. The framework reads the beloved disciple as the apostolic-prophet who closes the canon in the same witness-register the Tanakh opened.\n\n*This is the disciple which testifieth of these things, and wrote these things: and we know that his testimony is true.* (John 21:24)\n\n*And I John saw these things, and heard them. And when I had heard and seen, I fell down to worship before the feet of the angel which shewed me these things.* (Revelation 22:8)\n\n*Bind up the testimony, seal the law among my disciples.* (Isaiah 8:16)\n\n*I Daniel was grieved in my spirit in the midst of my body, and the visions of my head troubled me. I came near unto one of them that stood by, and asked him the truth of all this. So he told me, and made me know the interpretation of the things.* (Daniel 7:15-16)\n\nThe faithful witness writes what he sees. The seeing is not the seer''s invention — it is given. The recording is not the recorder''s authority — it is fidelity to what was shown. Yochanan (John) the apostle stands in the Daniel-tradition: the throne is shown; the visions are interpreted; the seer writes; the writing is preserved as the testimony for the gathered. The beloved disciple closes the canon at Patmos in the same posture the Tanakh-seers opened it.\n\nThe seven assemblies of Revelation 2-3 are addressed in the same voice the gospel of John has carried all along — the *I am* of the Formed one, walking among the lampstands, naming what is faithful and what is unfaithful in each gathering. The cyclical close of Revelation 11 and the throne-vision of Revelation 20 are the seer''s witness to the same end-arc the gospel of John has been pressing toward through the lifted-up discourses and the high-priestly prayer. The witness-tradition is one tradition; the seer who writes the gospel is the seer who writes the Apocalypse; both are testimony of the Formed Word, given through the same hand to the gathered for the same purpose.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1014
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 21 AND sv.verse_number = 24
   AND ev.book_slug = 'john' AND ev.chapter_number = 21 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 21, 24, 'revelation', 1, 2, 1, E'*Who bare record of the word of Elohim (God), and of the testimony of Yahusha HaMashiach (Jesus Christ), and of all things that he saw* — the same writing-witness voice; the gospel-postscript and the Apocalypse-prologue identify the witness in the same register.'),
  ('john', 21, 24, 'revelation', 22, 8, 2, E'*And I John saw these things, and heard them* — the Patmos seer naming himself in the first person at the close of the Apocalypse; the same Yochanan (John) the gospel postscript identifies.'),
  ('john', 19, 35, 'isaiah', 43, 10, 3, E'*And he that saw it bare record, and his record is true: and he knoweth that he saith true, that ye might believe* — *ye are my witnesses, saith Yahuah (the LORD)* — the witness-language of the prophet applied to the apostolic eyewitness at the cross.'),
  ('john', 21, 24, 'daniel', 7, 1, 4, E'*Daniel had a dream and visions of his head upon his bed: then he wrote the dream, and told the sum of the matters* — the seer writes what he sees; the Daniel-pattern of the witness-as-scribe carried into the apostolic seer.'),
  ('john', 21, 24, 'ezekiel', 2, 9, 5, E'*And when I looked, behold, an hand was sent unto me; and, lo, a roll of a book was therein* — the prophet receives the scroll he is to deliver; Yochanan (John) eats the little book at Revelation 10:9-10 in the same pattern.'),
  ('john', 21, 24, 'isaiah', 8, 16, 6, E'*Bind up the testimony, seal the law among my disciples* — the binding-of-the-testimony for preservation among the disciples; the gospel-postscript and the Revelation-seal close the canon in this register.'),
  ('john', 13, 23, 'daniel', 7, 9, 7, E'*Now there was leaning on Yahusha''s (Jesus''s) bosom one of his disciples, whom Yahusha (Jesus) loved* — the beloved-disciple who leans on the chest; the architecture of intimate witness in the throne-room of the King echoes the seer''s proximity to the Ancient of Days vision.'),
  ('john', 20, 30, 'habakkuk', 2, 2, 8, E'*And Yahuah (the LORD) answered me, and said, Write the vision, and make it plain upon tables, that he may run that readeth it* — the writing-down of what is shown so the reader may run with it; the gospel''s editorial purpose statement sits in this prophetic register.'),
  ('john', 21, 25, 'ecclesiastes', 12, 12, 9, E'*Of making many books there is no end* — the seer acknowledges the limits of the writing-down; *the world itself could not contain the books that should be written* sits in the same wisdom-tradition of the seer''s humility before the substance.'),
  ('revelation', 1, 7, 'zechariah', 12, 10, 10, E'*Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him* — the Patmos-seer locks the gospel''s pierced-one at John 19:37 to the Zekharyah (Zechariah) 12 cloud-coming; the same Yochanan (John) writes both, one witness across both books.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:yochanan-witness-pattern-faithful-witness-tradition | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for yochanan-witness-pattern-faithful-witness-tradition.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'yochanan-witness-pattern-faithful-witness-tradition'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:yochanan-witness-pattern-faithful-witness-tradition | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 15: born-not-of-blood-flesh-credentialing-refused
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'born-not-of-blood-flesh-credentialing-refused',
    E'Born not of blood — flesh-credentialing refused, paternal seed preserved',
    E'The prologue of John contains the verse the false-inclusion gospel reaches for first and the verse the rabbinic-flesh-descent-saves gospel reaches for last. *Born, not of blood, nor of the will of the flesh, nor of the will of man, but of Elohim (God).* The inherited Christian reading takes the verse as the abolition of paternal-seed-of-promise architecture — *blood doesn''t matter; only believing matters.* The rabbinic reading takes the same verse as a problem because flesh-descent is the gospel of the system. Both readings break on the verse. The framework reads it for what it actually says: the verse rules out flesh-credentialing as the mechanism of the new birth without erasing the paternal-seed-of-promise architecture through which the gathering runs.\n\n*He came unto his own, and his own received him not. But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name: Which were born, not of blood, nor of the will of the flesh, nor of the will of man, but of Elohim (God).* (John 1:11-13)\n\n*Neither, because they are the seed of Avraham (Abraham), are they all children: but, In Yitschaq (Isaac) shall thy seed be called. That is, They which are the children of the flesh, these are not the children of Elohim (God): but the children of the promise are counted for the seed.* (Romans 9:7-8)\n\n*Behold, the days come, saith Yahuah (the LORD), when I will sow the house of Yashar''el (Israel) and the house of Yahudah (Judah) with the seed of man, and with the seed of beast.* (Jeremiah 31:27)\n\nThe two readings the verse rules out are clear. *Not of blood* refuses the rabbinic-flesh-descent-saves gospel — being-a-Yahudi (Jew) by physical descent through Yahudah (Judah)''s line does not by itself confer sonship; the system Paul will dismantle through Romans 9 is named here in the prologue. *Not of the will of the flesh, nor of the will of man* refuses the Galatian-agitator gospel — circumcising-into-the-covenant by ritual conversion through the flesh-credential system is not what the new birth is. The mechanism of the new birth is the Father''s drawing: *born of Elohim (God).*\n\nWhat the verse does NOT do is collapse the paternal seed-of-promise architecture into nothing. The verse rules out flesh-credentialing as the doorway; it does not erase the seed-line through which the Father gathers. Romans 9:6-8 holds both pieces in the same breath: not all who descend from Yashar''el (Israel) are Yashar''el (Israel) — the rabbinic-descent gospel fails — and yet *the children of the promise are counted for the seed* — the seed-line itself is preserved as the architecture through which the promise runs. The new birth is the Father''s act on the seed; flesh-credentialing-as-the-doorway is what the verse rules out. The cause-and-effect is the framework''s: those who received him and believed were revealed by their receiving and believing to be the children Yahuah (the LORD) was already gathering; the receiving did not create the childship — it revealed what was already true in the Father''s foreknowledge.\n\nThe marriage-covenant absorption (Rachab into Salmon, Ruth into Boaz, the seven women of Isaiah 4:1) remains the one entry-mechanism for foreign-origin individuals into the seed-of-promise; the seed-line continues paternally; the new birth equips the gathered for the walk; the Father''s drawing is the means by which the scattered are brought home. The verse holds the framework''s whole architecture together in five words: *born of Elohim (God).*',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1015
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 11
   AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 1, 11, 'hosea', 1, 9, 1, E'*He came unto his own, and his own received him not* — the *Lo-Ammi* condition of Hoshea (Hosea) 1 named in the prologue''s reception-failure. The house his own ought to have been was the house in the *not my people* condition the prophet diagnosed.'),
  ('john', 1, 12, 'isaiah', 56, 5, 2, E'*Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name* — the receiving-the-name substance the *power to become the sons of Elohim (God)* lands on; the outcasts-of-Yashar''el (Israel) brought home into the name.'),
  ('john', 1, 13, 'romans', 9, 7, 3, E'*Neither, because they are the seed of Avraham (Abraham), are they all children: but, In Yitschaq (Isaac) shall thy seed be called* — the rabbinic-flesh-descent-saves gospel ruled out by both the prologue and Romans 9 in the same breath; the seed-architecture preserved through Yitschaq''s (Isaac''s) line is the promise-line.'),
  ('john', 1, 13, 'romans', 9, 8, 4, E'*They which are the children of the flesh, these are not the children of Elohim (God): but the children of the promise are counted for the seed* — the framework''s whole reading sits here. The seed-of-promise is the architecture; the flesh-credential is not the doorway; the children-of-promise are the gathered.'),
  ('john', 1, 13, 'genesis', 17, 7, 5, E'*And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be an Elohim (God) unto thee, and to thy seed after thee* — the everlasting-covenant established with the seed; the seed-line preserved through Avraham''s (Abraham''s) descendants is what the new birth equips for the walk.'),
  ('john', 1, 13, 'jeremiah', 31, 27, 6, E'*I will sow the house of Yashar''el (Israel) and the house of Yahudah (Judah) with the seed of man, and with the seed of beast* — the Father''s sowing-and-gathering of the two houses; the seed-architecture is the Father''s, not the flesh''s. *Born of Elohim (God)* sits on this sowing.'),
  ('john', 1, 13, 'deuteronomy', 7, 7, 7, E'*Yahuah (the LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people: But because Yahuah (the LORD) loved you* — the love-not-the-merit; the choice is the Father''s; the seed was chosen by the Father, not on the basis of any flesh-credential.'),
  ('john', 1, 13, 'galatians', 6, 15, 8, E'*For in HaMashiach Yahusha (Christ Jesus) neither circumcision availeth any thing, nor uncircumcision, but a new creature* — the Galatian-agitator gospel of flesh-credentialing through circumcision ruled out by Paul in the same register as the prologue''s *not of the will of the flesh.* The new creature is the new heart given to the gathered.'),
  ('john', 1, 13, 'ezekiel', 36, 26, 9, E'*A new heart also will I give you, and a new spirit will I put within you* — the new birth of the prologue is the new heart of Yechezkel (Ezekiel) 36; the Father''s act on the seed; the equipment for the Torah-walk the Spirit causes.'),
  ('john', 1, 13, '1-peter', 1, 23, 10, E'*Being born again, not of corruptible seed, but of incorruptible, by the word of Elohim (God), which liveth and abideth for ever* — the apostolic gloss in the same register; the new birth from the incorruptible seed of the Word; the seed-image preserved as the framework''s architecture.'),
  ('john', 1, 13, 'ruth', 4, 13, 11, E'*So Boaz took Ruth, and she was his wife: and when he went in unto her, Yahuah (the LORD) gave her conception* — the marriage-covenant absorption mechanism preserved in the Davidic line; Rachab and Ruth enter the seed-of-promise by marriage to a son-of-Yashar''el (Israel), not by flesh-credentialing. The verse rules out the doorway it rules out; it does not rule out the architecture.'),
  ('john', 1, 12, 'revelation', 13, 8, 12, E'*To them gave he power to become the sons of Elohim (God), even to them that believe on his name* read with *whose names are not written in the book of life of the Lamb slain from the foundation of the world* — those who believed were revealed by their believing to be the ones whose names were written; the receiving did not create the childship, it revealed it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:born-not-of-blood-flesh-credentialing-refused | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for born-not-of-blood-flesh-credentialing-refused.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'born-not-of-blood-flesh-credentialing-refused'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:born-not-of-blood-flesh-credentialing-refused | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 16: son-of-adam-as-judge-and-ladder
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'son-of-adam-as-judge-and-ladder',
    E'Son of Adam — the lineage-name as ladder, judgment, and ascent',
    E'John uses the *Son of Adam* title across his gospel in a register the other gospels do not match. He opens with the title at John 1:51 — *ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* He returns to the title at John 5:27 as the judgment-credential: *the Father hath given him authority to execute judgment also, because he is the Son of Adam.* He lands the title in John 6 as the substance the bread-from-heaven discourse rests on (6:53, 6:62), in John 12 as the lifted-up substance (12:23, 12:34), and in John 13 as the glorified one at the hour (13:31). The framework''s seed-of-Adam restoration of the title is load-bearing through all of these — the *son of Adam* names the lineage on which the framework''s whole architecture rests.\n\n*And he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* (John 1:51)\n\n*And hath given him authority to execute judgment also, because he is the Son of Adam.* (John 5:27)\n\n*And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it. And, behold, Yahuah (the LORD) stood above it.* (Genesis 28:12-13)\n\nThe ladder of Ya''aqov''s (Jacob''s) Bethel vision is the architecture John 1:51 names as fulfilled on the Formed one in flesh. The angels ascending and descending on the ladder ascend and descend on the Son of Adam — the body of the Formed one is the connection between heaven and earth that Ya''aqov (Jacob) saw in the dream. The lineage-name carries the substance: the Son of Adam is the seed of Adam through whom the heaven-earth connection is reopened, the ladder Ya''aqov (Jacob) saw is the body of the lineage taking on the office it always pointed toward.\n\nThe judgment-credential at John 5:27 carries the same lineage-weight. *Because he is the Son of Adam* — because he is of the seed, the judgment of the seed''s covenant is his to execute. Daniel 7:13''s *one like the Son of Adam* receives the everlasting kingdom from the Ancient of Days; the kaph-comparative honors the incarnation truth that the figure resembles mortal-man because he took on flesh, while remaining the Formed cloud-rider. John 5:27 lands the judgment-authority on the same Son of Adam whose body is the ladder, whose flesh is the bread, whose lifting-up is the gathering-ensign.\n\nThe eating-the-flesh discourse of John 6:53-58 names the lineage-name as the food the gathered take in. *Except ye eat the flesh of the Son of Adam, and drink his blood, ye have no life in you* — the seed-of-Adam is the substance the new birth incorporates; the body of the lineage becomes the food of the gathered body. John 6:62 returns to the title in the ascent: *what and if ye shall see the Son of Adam ascend up where he was before?* The pre-existent Formed one who descended is the same Son of Adam who ascends; the lineage-name is preserved through the descent, the incarnation, the death, the resurrection, and the ascent.\n\nJohn 12:23 names the hour: *the hour is come, that the Son of Adam should be glorified.* John 12:34 records the crowd''s question — *who is this Son of Adam?* — the title puzzles the hearers because the inherited reading had emptied the title of its lineage-weight; the Formed one carries it back to its Tanakh substance. John 13:31 lands the glorification at the table after Yehuda (Judas) goes out: *now is the Son of Adam glorified, and Elohim (God) is glorified in him.* The lineage-name is the throughline.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1016
  FROM _s181_john_lookup sv, _s181_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 51
   AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 51
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 1, 51, 'genesis', 28, 12, 1, E'*And behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it* — Ya''aqov''s (Jacob''s) Bethel ladder is the architecture the *angels of Elohim (God) ascending and descending upon the Son of Adam* names as fulfilled on the body of the Formed one in flesh.'),
  ('john', 1, 51, 'genesis', 28, 13, 2, E'*And, behold, Yahuah (the LORD) stood above it* — Yahuah (the LORD) above the ladder; the Son of Adam at the bottom-and-top of the connection between heaven and earth. The Formless source above; the Formed expression as the ladder; the seed-of-Adam as the substance.'),
  ('john', 5, 27, 'daniel', 7, 13, 3, E'*And behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of Days, and they brought him near before him* — the *like the Son of Adam* of Daniel 7:13 receives the kingdom from the Ancient of Days; John 5:27 lands the judgment-authority on the same Son of Adam. The lineage-name and the judgment-authority hold together.'),
  ('john', 5, 27, 'daniel', 7, 14, 4, E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* — the everlasting-kingdom of the *kbar enash* is the dominion-credential of the judgment John 5:27 names. The lineage-name carries the kingdom.'),
  ('john', 6, 53, 'daniel', 7, 13, 5, E'*Except ye eat the flesh of the Son of Adam, and drink his blood, ye have no life in you* — the eating-the-flesh discourse lands on the Daniel 7 *kbar enash* who is the Formed cloud-rider in flesh; the body of the lineage becomes the food of the gathered. The lineage-name and the eating-of-the-substance hold together.'),
  ('john', 6, 62, 'john', 3, 13, 6, E'*What and if ye shall see the Son of Adam ascend up where he was before?* read with *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* — the pre-existent Formed one''s descending-and-ascending; the Son of Adam who came down is the same Son of Adam who returns. The descent, the incarnation, the ascent — one body, one lineage-name.'),
  ('john', 12, 23, 'isaiah', 52, 13, 7, E'*The hour is come, that the Son of Adam should be glorified* read with *Behold, my servant shall deal prudently, he shall be exalted and extolled, and be very high* — the suffering-servant''s exaltation is the Son of Adam''s glorification at the hour. The lineage-name and the suffering-servant carry the same substance.'),
  ('john', 12, 34, 'psalms', 110, 1, 8, E'*Who is this Son of Adam?* — the crowd cannot reconcile the *lifted up* with their expectation of a Messiah who *abideth for ever*; Psalm 110:1''s *sit thou at my right hand, until I make thine enemies thy footstool* answers the question in the same psalm-tradition Yahusha (Jesus) himself cites at Matthew 22:44. The Son of Adam reigns; the lifting-up is the means.'),
  ('john', 13, 31, 'daniel', 7, 14, 9, E'*Now is the Son of Adam glorified, and Elohim (God) is glorified in him* — the glorification at the hour the Son of Adam goes to the cross is the same glorification of Daniel 7:14''s *given him dominion, and glory.* The hour and the kingdom-transfer are named together; the lineage-name and the glory hold.'),
  ('john', 5, 27, 'psalms', 8, 4, 11, E'*What is mortal man, that thou art mindful of him? and the son of Adam, that thou visitest him?* — the Psalm 8 *son of Adam* in the poetic-generic register; the verse Hebrews 2:6-8 cites of the Formed one''s authority over the works of the Father''s hands. The judgment-authority of John 5:27 sits in this same psalm-tradition.'),
  ('john', 6, 62, 'ezekiel', 1, 26, 12, E'*And upon the likeness of the throne was the likeness as the appearance of a man above upon it* — the *likeness of a man* / *kbar enash* on the throne in Yechezkel''s (Ezekiel''s) vision; the Son of Adam who ascends up where he was before is the same throne-figure the prophets saw. The lineage-name and the throne-figure are one.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:son-of-adam-as-judge-and-ladder | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for son-of-adam-as-judge-and-ladder.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'son-of-adam-as-judge-and-ladder'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:son-of-adam-as-judge-and-ladder | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 181 john migration complete.'