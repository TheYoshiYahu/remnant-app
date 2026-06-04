-- =====================================================================
-- Session 194 migration — john 2, 7, 9, 16 chapter-anchored xref threads
-- =====================================================================
-- Fills the chapter-end-card gap for four John chapters that carried no
-- card: John 2 (Cana + temple cleansing), John 7 (Tabernacles + rivers
-- of living water), John 9 (the man born blind + light of the world),
-- John 16 (the Comforter + sorrow-to-joy + overcome the world).
--
-- Mirrors the session181 john pattern precisely: a transaction-scoped
-- canon-edition lookup view, one thread INSERT per NEW thread, the
-- WITH input(...) AS (VALUES ...) -> INSERT INTO cross_references
-- pattern, and a member-link block per thread. All threads anchor
-- WITHIN their own chapter; every member SOURCE verse stays home in
-- that john chapter; targets range the canon library.
--
-- Sort_order range 1101+ (session181 used 1001-1016). Slugs are unique
-- and do not collide with any session181 john slug.
--
-- All threads at tier='free'. Idempotent: every INSERT carries
-- ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session194_john_2_7_9_16_xref_threads.sql
--
-- NOTE on extras targets (canon-only lookup, per the S181/S183 pattern):
-- _s194_john_lookup is canon-edition scoped, exactly as every prior
-- John/Mark/Romans migration. Member rows whose target lands in an
-- extras edition (1 Enoch, Jubilees, Jasher, Adam-Eve Conflict,
-- Apocalypse of Abraham, Ascension of Isaiah, Apocrypha) do not resolve
-- against a canon-only view and are deferred to a future extras-targeted
-- migration, consistent with the standing pattern. The cross-library
-- framework substance is carried in the reader-facing summary_md prose
-- where it is load-bearing; the resolvable member rows are canon (Tanakh
-- + NT) pairings anchored in each john chapter.
-- =====================================================================

\echo 'Session 194 john 2/7/9/16 migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction.
CREATE TEMP VIEW _s194_john_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- =====================================================================
-- ===== JOHN 2 — water-to-wine at Cana + the temple cleansing =========
-- =====================================================================

-- ---------------------------------------------------------------------
-- Thread 1101: cana-new-wine-the-messianic-banquet-begun
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'cana-new-wine-the-messianic-banquet-begun',
    E'The water turned to wine — the messianic banquet begun at Cana',
    E'The first sign Yahusha (Jesus) works is not a healing and not a deliverance. It is the turning of water set aside for the purification-washings into wine at a wedding feast, and the gospel of John names it deliberately as *the beginning of miracles* that *manifested forth his glory.* The inherited reading treats it as a kindness to a host who ran short. The Tanakh''s own banquet-prophecies read it as the opening note of the gathering-feast the prophets promised — the day Yahuah (the LORD) spreads a table of fat things and well-refined wines for all the gathered, the day the mountains drop new wine because the captivity of his people is turned.\n\n*And the third day there was a marriage in Cana of Galilee ... and the mother of Yahusha (Jesus) was there ... When the ruler of the feast had tasted the water that was made wine ... the governor of the feast called the bridegroom, And saith unto him, Every man at the beginning doth set forth good wine; and when men have well drunk, then that which is worse: but thou hast kept the good wine until now.* (John 2:1, 9-10)\n\n*And in this mountain shall Yahuah Tseva''ot (the LORD of hosts) make unto all people a feast of fat things, a feast of wines on the lees, of fat things full of marrow, of wines on the lees well refined.* (Isaiah 25:6)\n\n*Behold, the days come, saith Yahuah (the LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt. And I will bring again the captivity of my people of Yashar''el (Israel).* (Amos 9:13-14)\n\nThe water Yahusha (Jesus) commands them to fill was the water of the *purifying of the Yahudim (Jews)* — the stone jars of the washing-tradition. The Formed one takes the vessel the tradition set aside for ceremonial water and fills it instead with the good wine the prophets promised for the wedding-day of the restoration. The good wine *kept until now* is the order of the ages: the sign at Cana is the firstfruit of the banquet, the down-payment on the feast Yeshayahu (Isaiah) 25 and Amos 9 set on the mountain when the captivity of the scattered is turned.\n\nThe setting is a marriage, and the gathering the prophets named is itself a marriage — Yahuah (the LORD) betrothing his divorced and scattered people back to himself, the bridegroom drawing home the bride. The Formed cloud-rider who appears here as the wine-maker at a wedding is the same one Hoshea (Hosea) names as the husband going out to win back the wife he had put away. The first sign sets the key the whole gospel will be played in: the gathering is a wedding, and the wine has begun to pour.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1101
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 1
   AND ev.book_slug = 'john' AND ev.chapter_number = 2 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 2, 9, 'isaiah', 25, 6, 1, E'*In this mountain shall Yahuah Tseva''ot (the LORD of hosts) make unto all people a feast of fat things, a feast of wines on the lees ... of wines on the lees well refined* — the gathering-feast the prophets promised, its *well refined* wine. The good wine kept until now at Cana is the firstfruit of this banquet of the restoration. (Isaiah 25:6)'),
  ('john', 2, 10, 'amos', 9, 13, 2, E'*The mountains shall drop sweet wine, and all the hills shall melt* — the day the captivity of Yashar''el (Israel) is turned and the new wine runs down the hills. *Thou hast kept the good wine until now* is this prophesied new wine of the gathering breaking in at a wedding. (Amos 9:13-14)'),
  ('john', 2, 3, 'jeremiah', 31, 12, 3, E'*They shall come and sing in the height of Tsion (Zion), and shall flow together to the goodness of Yahuah (the LORD), for wheat, and for wine, and for oil* — the new-covenant gathering that flows to the wine of Yahuah''s (the LORD''s) goodness. The shortfall of wine at the feast is answered by the One who is the goodness the scattered flow home to. (Jeremiah 31:12)'),
  ('john', 2, 11, 'joel', 2, 24, 4, E'*And the floors shall be full of wheat, and the fats shall overflow with wine and oil* — the overflow-of-wine the day of restoration brings. The first sign overflows six stone jars with wine; the glory manifested is the overflow the prophet named. (Joel 2:24-26)'),
  ('john', 2, 1, 'hosea', 2, 19, 5, E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness* — the marriage Yahuah (the LORD) makes with his scattered and divorced people. The first sign is set at a wedding because the gathering itself is the betrothal Hoshea (Hosea) names. (Hosea 2:19-20)'),
  ('john', 2, 9, 'song-of-solomon', 1, 2, 6, E'*For thy love is better than wine* — the bridegroom-and-bride love-song of the covenant. The wine at the wedding-feast is the lesser sign of the love the Song names as better than wine; the Formed bridegroom is the substance the song was singing toward. (Song of Solomon 1:2-4)'),
  ('john', 2, 4, 'john', 7, 30, 7, E'*Mine hour is not yet come* — the first of the gospel''s hour-markers; the hour that is not yet at Cana is the hour the whole gospel walks toward, the cup and the lifting-up. The mother is told the timing belongs to the Father, the same timing John 7:30 and 8:20 guard until it arrives. (John 7:30; 8:20)'),
  ('john', 2, 6, 'numbers', 19, 17, 8, E'*And for an unclean person they shall take of the ashes of the burnt heifer of purification for sin, and running water shall be put thereto in a vessel* — the purification-water tradition behind the *waterpots of stone, after the manner of the purifying of the Yahudim (Jews).* The Formed one fills the vessels of the washing-law with the wine of the wedding-feast. (Numbers 19:17-19)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:cana-new-wine-the-messianic-banquet-begun | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for cana-new-wine-the-messianic-banquet-begun.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'cana-new-wine-the-messianic-banquet-begun'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:cana-new-wine-the-messianic-banquet-begun | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1102: zeal-for-thine-house-the-temple-cleansed
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'zeal-for-thine-house-the-temple-cleansed',
    E'Zeal for thine house — the temple cleansed by its own Lord',
    E'Yahusha (Jesus) drives the money-changers and the cattle-sellers out of the temple courts with a scourge of cords, and the disciples remember a line from the Psalms — *the zeal of thine house hath eaten me up.* The inherited reading frames this as a moral protest against commercialism. The prophets read it as the Lord of the house returning suddenly to his own temple to purge it, the messenger of the covenant coming to refine and to cleanse the sons of Levi until an offering can again be brought in righteousness.\n\n*And the Yahudim (Jews)'' passover was at hand, and Yahusha (Jesus) went up to Yerushalayim (Jerusalem), And found in the temple those that sold oxen and sheep and doves, and the changers of money sitting: And when he had made a scourge of small cords, he drove them all out of the temple ... And said unto them that sold doves, Take these things hence; make not my Father''s house an house of merchandise. And his disciples remembered that it was written, The zeal of thine house hath eaten me up.* (John 2:13-17)\n\n*Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (the LORD), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant, whom ye delight in ... But who may abide the day of his coming? ... for he is like a refiner''s fire ... and he shall purify the sons of Levi.* (Malachi 3:1-3)\n\n*Is this house, which is called by my name, become a den of robbers in your eyes? Behold, even I have seen it, saith Yahuah (the LORD).* (Jeremiah 7:11)\n\nThe One driving out the traders is the One Malachi names as *Yahuah (the LORD), whom ye seek,* coming suddenly to his own temple. He calls it *my Father''s house* — the house is his by the relation no trader in the court understood. The zeal of Tehillim (Psalm) 69 that *hath eaten me up* is the same zeal that will carry him to the cup; the Psalm the disciples remember is a suffering-Psalm, and the cleansing of the house is bound from the first to the lifting-up that the house was always pointing toward.\n\nThe traders had made the court of the gathering — *an house of prayer for all people,* the very court where the scattered outcasts were to be brought home — into a place of merchandise. The Formed cloud-rider purges the merchandise out of the gathering-court so the court can be what the prophets said it would be: the house of prayer where the outcasts of Yashar''el (Israel) are received, not the marketplace of a credential-system. The cleansing is the messenger of the covenant refining his own house for the offering brought in righteousness.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1102
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND ev.book_slug = 'john' AND ev.chapter_number = 2 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 2, 17, 'psalms', 69, 9, 1, E'*For the zeal of thine house hath eaten me up; and the reproaches of them that reproached thee are fallen upon me* — the suffering-Psalm the disciples remember. The zeal that drives the cleansing is the zeal that bears the reproach to the cup; the cleansing and the passion are one motion in the same Psalm. (Psalm 69:9)'),
  ('john', 2, 16, 'malachi', 3, 1, 2, E'*Yahuah (the LORD), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant* — the Formed one coming suddenly to his own house. *Make not my Father''s house an house of merchandise* is the messenger of the covenant arriving at the temple that is his. (Malachi 3:1-3)'),
  ('john', 2, 16, 'jeremiah', 7, 11, 3, E'*Is this house, which is called by my name, become a den of robbers in your eyes?* — the prophetic indictment of the house turned into a robbers'' refuge. The merchandise in the court is the same desecration Yirmeyahu (Jeremiah) named, judged again by the One who owns the house. (Jeremiah 7:11)'),
  ('john', 2, 16, 'zechariah', 14, 21, 4, E'*And in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (the LORD of hosts)* — the *Canaanite* being the trader; the day of the gathering ends the merchandise in the holy house. The cleansing is the firstfruit of the day Zekharyah (Zechariah) named. (Zechariah 14:21)'),
  ('john', 2, 16, 'isaiah', 56, 7, 5, E'*Mine house shall be called an house of prayer for all people* — the court the traders had taken over was the very court appointed to receive the gathered outcasts of Yashar''el (Israel). The cleansing reclaims the house of prayer for the gathering it was built for. (Isaiah 56:7)'),
  ('john', 2, 14, 'zechariah', 14, 20, 6, E'*In that day shall there be upon the bells of the horses, HOLINESS UNTO YAHUAH (THE LORD)* — the day everything in the house, down to the cooking pots, is made holy. The oxen and sheep sold for profit in the court are the inversion the day of holiness reverses. (Zechariah 14:20-21)'),
  ('john', 2, 15, 'numbers', 25, 11, 7, E'*Pinchas (Phinehas), the son of El''azar ... hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake* — the zeal-for-the-holy-thing that turns away wrath. The scourge of cords is the same righteous zeal, now in the hand of the One the house belongs to. (Numbers 25:11-13)'),
  ('john', 2, 13, 'exodus', 12, 14, 8, E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (the LORD) ... by an ordinance for ever* — the Pesach (Passover) at hand frames the whole chapter; the cleansing of the house happens under the appointed feast the Formed one came to fulfill in his own body. (Exodus 12:14)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:zeal-for-thine-house-the-temple-cleansed | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for zeal-for-thine-house-the-temple-cleansed.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'zeal-for-thine-house-the-temple-cleansed'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:zeal-for-thine-house-the-temple-cleansed | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1103: destroy-this-temple-the-body-raised-in-three-days
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'destroy-this-temple-the-body-raised-in-three-days',
    E'Destroy this temple — the body as the true temple raised in three days',
    E'Asked for a sign that would justify the cleansing, Yahusha (Jesus) answers with a riddle the hearers take literally and the gospel-writer unfolds: *Destroy this temple, and in three days I will raise it up* — *but he spake of the temple of his body.* The inherited reading hears only a prediction of the resurrection. The framework hears the larger architecture: the Formed one in flesh is himself the true temple the stone house was always a shadow of, the place where Yahuah (the LORD) tabernacles among his people, and the third-day raising is the firstfruit-pattern the prophets had already written into the body of the gathered.\n\n*Yahusha (Jesus) answered and said unto them, Destroy this temple, and in three days I will raise it up. Then said the Yahudim (Jews), Forty and six years was this temple in building, and wilt thou rear it up in three days? But he spake of the temple of his body.* (John 2:19-21)\n\n*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2)\n\n*And let them make me a sanctuary; that I may dwell among them.* (Exodus 25:8)\n\nThe stone temple was the dwelling-place where the glory came down — the cloud that filled the tabernacle, the glory that filled Shelomoh''s (Solomon''s) house. The prologue of this same gospel had already said the Word *was made flesh, and dwelt among us* — *tabernacled* among us — and *we beheld his glory.* The body of the Formed one is the temple the stone house was prophesying: the glory no longer behind a veil in a building, but walking among the people in flesh. When he says *destroy this temple,* the sign he gives for his authority over the stone house is the raising of the true house — his own body — on the third day.\n\nThe third-day pattern is not invented at the empty tomb. Hoshea (Hosea) had written it over the scattered house: *in the third day he will raise us up, and we shall live in his sight.* The Formed one''s third-day raising is the head going first through what the body will follow him through — the firstfruits of them that slept, the down-payment on the resurrection of the gathered. The stone temple stood forty-six years in the building and would fall; the true temple, struck down, rises in three days and does not fall again. The sign over the cleansing is the resurrection, and the resurrection is the guarantee of the gathering the whole house was built to picture.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1103
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 19
   AND ev.book_slug = 'john' AND ev.chapter_number = 2 AND ev.verse_number = 22
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 2, 19, 'hosea', 6, 2, 1, E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* — the third-day raising written over the scattered house before the empty tomb. *In three days I will raise it up* is the Formed one walking the Hoshea (Hosea) 6 pattern first, as the head the body follows. (Hosea 6:2)'),
  ('john', 2, 21, 'exodus', 25, 8, 2, E'*And let them make me a sanctuary; that I may dwell among them* — the whole purpose of the temple was the dwelling of Yahuah (the LORD) among his people. *He spake of the temple of his body* names the body of the Formed one as the dwelling the stone sanctuary was a shadow of. (Exodus 25:8)'),
  ('john', 2, 21, 'exodus', 40, 34, 3, E'*Then a cloud covered the tent of the congregation, and the glory of Yahuah (the LORD) filled the tabernacle* — the glory came down and filled the dwelling. The body that is the true temple is where that glory now tabernacles, as the prologue said: *the Word was made flesh, and dwelt among us.* (Exodus 40:34-35)'),
  ('john', 2, 19, 'psalms', 16, 10, 4, E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* — the resurrection-Psalm the apostolic preaching reads as the third-day raising of the body that saw no corruption. The sign Yahusha (Jesus) gives is this Psalm''s promise kept in his own body. (Psalm 16:10)'),
  ('john', 2, 19, 'psalms', 118, 22, 5, E'*The stone which the builders refused is become the head stone of the corner* — the rejected-and-vindicated stone. The temple-builders who scoff at the three-day raising are the builders who refuse the stone; the raised body is the head of the corner of the true house. (Psalm 118:22-23)'),
  ('john', 2, 19, 'haggai', 2, 9, 6, E'*The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (the LORD of hosts): and in this place will I give peace* — the latter-house glory exceeding the former. The true temple raised in three days is the latter house whose glory is the Formed one himself, greater than the stone house in its forty-six years. (Haggai 2:9)'),
  ('john', 2, 21, 'ezekiel', 37, 27, 7, E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* — the gathering-prophecy ends with Yahuah (the LORD) tabernacling among the regathered twelve tribes. The body that is the temple is the down-payment on the dwelling Yechezkel (Ezekiel) 37 promised the gathered. (Ezekiel 37:26-27)'),
  ('john', 2, 22, 'isaiah', 53, 10, 8, E'*Yet it pleased Yahuah (the LORD) to bruise him ... he shall prolong his days, and the pleasure of Yahuah (the LORD) shall prosper in his hand* — the bruised servant who lives again afterward. *Destroy this temple* is the bruising; *in three days I will raise it up* is the prolonging of days the suffering-servant passage promised. (Isaiah 53:10-11)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:destroy-this-temple-the-body-raised-in-three-days | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for destroy-this-temple-the-body-raised-in-three-days.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'destroy-this-temple-the-body-raised-in-three-days'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:destroy-this-temple-the-body-raised-in-three-days | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- CHAPTER 2 COMPLETE

-- =====================================================================
-- ===== JOHN 7 — Feast of Tabernacles + rivers of living water ========
-- =====================================================================

-- ---------------------------------------------------------------------
-- Thread 1104: rivers-of-living-water-the-tabernacles-outpouring
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'rivers-of-living-water-the-tabernacles-outpouring',
    E'Rivers of living water — the Tabernacles outpouring of the Spirit',
    E'On the last and great day of the Feast of Tabernacles — the day the priest carried water from the pool of Shiloach (Siloam) and poured it out at the altar in the great water-drawing rite — Yahusha (Jesus) stands and cries, *If any man thirst, let him come unto me, and drink.* The inherited reading treats this as a general invitation. Read against the feast he is standing inside, and against the Tanakh''s living-water prophecies, it is the Formed one naming himself as the fountain the water-drawing rite was pointing at all along, and naming the Ruach HaKodesh (Holy Spirit) — not yet given because he was not yet glorified — as the rivers that would flow out of the gathered when the promised outpouring came.\n\n*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink. He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water. (But this spake he of the Ruach (Spirit), which they that believe on him should receive: for the Ruach HaKodesh (Holy Spirit) was not yet given; because that Yahusha (Jesus) was not yet glorified.)* (John 7:37-39)\n\n*For I will pour water upon him that is thirsty, and floods upon the dry ground: I will pour my spirit upon thy seed, and my blessing upon thine offspring.* (Isaiah 44:3)\n\n*And it shall be in that day, that living waters shall go out from Yerushalayim (Jerusalem) ... And Yahuah (the LORD) shall be king over all the earth.* (Zechariah 14:8-9)\n\nZekharyah (Zechariah) 14 — the very chapter that prophesies the living waters going out from Yerushalayim (Jerusalem) — is the chapter that commands the nations to keep the Feast of Tabernacles in the kingdom. The water-drawing rite was a yearly enactment of that prophecy. Yahusha (Jesus) waits for the last great day of that exact feast to stand and announce that the living waters Zekharyah (Zechariah) named are about to flow — and that the spring they flow from is himself. *He that scattered Yashar''el (Israel) will gather him* — and the gathered are watered with the Spirit poured on the thirsty, the floods on the dry ground, the Spirit on the seed and the blessing on the offspring of Yeshayahu (Isaiah) 44.\n\nThis is the new-heart promise in another image. The same Spirit Yechezkel (Ezekiel) 36 says will be put within the gathered to cause them to walk in the statutes is the river Yahusha (Jesus) names here. The outpouring does not lead away from the Torah; it writes the Torah on the heart. The Spirit who is the river is the same Spirit who spoke at Sinai. The feast that pictures the gathering of all the tribes into booths is the feast at which the Formed one announces the watering of the gathering — the rivers that flow out of the belly of everyone the Father draws home.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1104
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 7 AND sv.verse_number = 37
   AND ev.book_slug = 'john' AND ev.chapter_number = 7 AND ev.verse_number = 39
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 7, 38, 'isaiah', 44, 3, 1, E'*I will pour water upon him that is thirsty, and floods upon the dry ground: I will pour my spirit upon thy seed* — the outpouring on the thirsty seed. *Out of his belly shall flow rivers of living water* is the Spirit-on-the-seed of Yeshayahu (Isaiah) 44 named as the substance the gospel says he spoke of. (Isaiah 44:3-4)'),
  ('john', 7, 38, 'zechariah', 14, 8, 2, E'*And it shall be in that day, that living waters shall go out from Yerushalayim (Jerusalem)* — the day-of-the-kingdom living waters. He stands on the last great day of the very feast Zekharyah (Zechariah) 14 ties to these waters and announces them flowing now from himself. (Zechariah 14:8-9)'),
  ('john', 7, 37, 'isaiah', 55, 1, 3, E'*Ho, every one that thirsteth, come ye to the waters ... come, buy wine and milk without money and without price* — the prophetic thirst-invitation. *If any man thirst, let him come unto me, and drink* is the Formed one speaking Yeshayahu (Isaiah) 55''s own call with himself as the water. (Isaiah 55:1)'),
  ('john', 7, 37, 'isaiah', 12, 3, 4, E'*Therefore with joy shall ye draw water out of the wells of salvation* — the verse the Tabernacles water-drawing rite was built around. The drawing of water at the feast enacts this verse; Yahusha (Jesus) names himself as the well the drawing draws from. (Isaiah 12:3)'),
  ('john', 7, 38, 'ezekiel', 47, 1, 5, E'*Behold, waters issued out from under the threshold of the house eastward ... and the waters were risen, waters to swim in, a river that could not be passed over* — the river from the temple that heals everything it touches. The rivers of living water from the belly of the believer are the temple-river of Yechezkel (Ezekiel) 47, now flowing from the body that is the true temple. (Ezekiel 47:1-9)'),
  ('john', 7, 38, 'joel', 2, 28, 6, E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh* — the outpouring Yo''el (Joel) named. The Ruach HaKodesh (Holy Spirit) *not yet given* in John 7:39 is the Spirit of Yo''el (Joel) 2:28 awaiting the glorification before the floods could flow. (Joel 2:28-29)'),
  ('john', 7, 38, 'ezekiel', 36, 27, 7, E'*I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* — the new-heart Spirit who writes the Torah inward. The river that flows out of the gathered is the same Spirit who causes the walking in the statutes; the outpouring does not abolish the Torah, it internalizes it. (Ezekiel 36:27)'),
  ('john', 7, 37, 'psalms', 42, 1, 8, E'*As the hart panteth after the water brooks, so panteth my soul after thee, O Elohim (God). My soul thirsteth for Elohim (God), for the living El (God)* — the thirst the invitation answers. The thirst of the scattered soul for the living El (God) is the thirst Yahusha (Jesus) tells to come to him and drink. (Psalm 42:1-2)'),
  ('john', 7, 37, 'jeremiah', 2, 13, 9, E'*They have forsaken me the fountain of living waters, and hewed them out cisterns, broken cisterns, that can hold no water* — Yahuah (the LORD) names himself the fountain of living waters the people abandoned. *Come unto me, and drink* is the forsaken fountain standing in the temple court, calling the thirsty back. (Jeremiah 2:13)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:rivers-of-living-water-the-tabernacles-outpouring | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for rivers-of-living-water-the-tabernacles-outpouring.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'rivers-of-living-water-the-tabernacles-outpouring'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:rivers-of-living-water-the-tabernacles-outpouring | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1105: division-over-him-the-stone-of-stumbling
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'division-over-him-the-stone-of-stumbling',
    E'The division over him — the stone of stumbling sifts the crowd',
    E'The crowd at the feast cannot agree what he is. *Some said, He is a good man: others said, Nay; but he deceiveth the people.* *Many of the people believed on him* while others reached for stones; *there was a division among the people because of him.* The inherited reading treats this as a public-opinion split. The framework reads it as the stone of stumbling doing exactly the work the prophets said the stone would do — being a sanctuary to some and a stone of stumbling to others, dividing the same people into those who hear the shepherd''s voice and those who cannot, because the hearing reveals who was always a sheep.\n\n*So there was a division among the people because of him. And some of them would have taken him; but no man laid hands on him.* (John 7:43-44)\n\n*And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel), for a gin and for a snare to the inhabitants of Yerushalayim (Jerusalem).* (Isaiah 8:14)\n\n*But ye believe not, because ye are not of my sheep ... My sheep hear my voice, and I know them, and they follow me.* (John 10:26-27)\n\nThe same Formed one is a sanctuary and a stumbling-stone at once — and which one he is to a given hearer reveals what that hearer already was. *To both the houses of Yashar''el (Israel)* the stone is set; the division at the feast runs through the covenant people, not between Yahudim (Jews) and the nations. Yeshayahu (Isaiah) 8 names the stone as set for *both houses* — the recognized house of Yahudah (Judah) and the scattered house — and the dividing is the sifting of the gathered, the wheat from the chaff among those who claim the covenant.\n\nThe crowd reaches for categories the Tanakh hands them — *the Prophet* like Mosheh (Moses), the Messiah out of the seed of David from Bethlehem — and stumbles on the geography because they reason from the surface and not from the scripture. Those who believe believe because they hear; those who would stone him cannot hear, because the voice does not reveal them as sheep. The division is not a failure of his preaching. It is the stone doing what Yeshayahu (Isaiah) said the stone would do: a sanctuary to the gathered, a rock of offence to those whom the hearing does not reveal as his.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1105
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 7 AND sv.verse_number = 40
   AND ev.book_slug = 'john' AND ev.chapter_number = 7 AND ev.verse_number = 44
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 7, 43, 'isaiah', 8, 14, 1, E'*And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* — the stone set for both houses. The division at the feast is the stone of stumbling sifting the covenant people, a sanctuary to some and a rock of offence to others. (Isaiah 8:14)'),
  ('john', 7, 40, 'deuteronomy', 18, 18, 2, E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth* — the prophet-like-Mosheh (Moses) the crowd reaches for: *Of a truth this is the Prophet.* The expectation is right; the stumbling is over whether this man is the One. (Deuteronomy 18:18)'),
  ('john', 7, 42, 'micah', 5, 2, 3, E'*But thou, Beth-lehem Ephratah ... out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel)* — the Bethlehem-birth prophecy the crowd cites against him: *shall the Messiah (Christ) come out of Galilee?* They reason from where they think he is from and miss where he was born. (Micah 5:2)'),
  ('john', 7, 42, '2-samuel', 7, 12, 4, E'*I will set up thy seed after thee ... and I will stablish his kingdom* — the Davidic seed-promise behind *that the Messiah (Christ) cometh of the seed of David.* The crowd holds the right scripture and stumbles on the surface-fact of Galilee. (2 Samuel 7:12-13)'),
  ('john', 7, 41, 'psalms', 118, 22, 5, E'*The stone which the builders refused is become the head stone of the corner* — the rejected stone that becomes the cornerstone. The division at the feast is the builders beginning to refuse the stone the Father will make the head of the corner. (Psalm 118:22-23)'),
  ('john', 7, 40, 'isaiah', 28, 16, 6, E'*Behold, I lay in Tsion (Zion) for a foundation a stone, a tried stone, a precious corner stone ... he that believeth shall not make haste* — the foundation-stone laid in Tsion (Zion). The same stone that is a sure foundation to the believer is the stone the divided crowd stumbles on. (Isaiah 28:16)'),
  ('john', 7, 43, 'john', 10, 26, 7, E'*Ye believe not, because ye are not of my sheep ... My sheep hear my voice* — the cause-and-effect of hearing named in the good-shepherd discourse. The division because of him is the hearing revealing the sheep; belief does not create the sheep, it discloses them. (John 10:26-27)'),
  ('john', 7, 41, 'zechariah', 10, 6, 8, E'*And I will strengthen the house of Yahudah (Judah), and I will save the house of Yoseph (Joseph) ... for I am Yahuah (the LORD) their Elohim (God), and will hear them* — the two-house gathering. The crowd''s argument over his origin is set inside a feast about the gathering of both houses Zekharyah (Zechariah) names. (Zechariah 10:6)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:division-over-him-the-stone-of-stumbling | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for division-over-him-the-stone-of-stumbling.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'division-over-him-the-stone-of-stumbling'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:division-over-him-the-stone-of-stumbling | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1106: my-doctrine-is-not-mine-the-sent-one-and-the-torah
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'my-doctrine-is-not-mine-the-sent-one-and-the-torah',
    E'My doctrine is not mine — the sent one who upholds the Torah',
    E'Teaching in the temple at the feast, Yahusha (Jesus) makes two claims the inherited reading rarely holds together. He says his doctrine is not his own but the Father''s who sent him — the Formed Son speaking the words of the Formless source. And in the same breath he charges the crowd: *Did not Mosheh (Moses) give you the law, and yet none of you keepeth the law? Why go ye about to kill me?* The One the pulpit later casts as the abolisher of the Torah stands in the temple rebuking the people for *not keeping* the Torah, and grounds his own circumcision-on-the-Sabbath argument in the consistency of the Torah with itself.\n\n*Yahusha (Jesus) answered them, and said, My doctrine is not mine, but his that sent me. If any man will do his will, he shall know of the doctrine, whether it be of Elohim (God), or whether I speak of myself.* (John 7:16-17)\n\n*Did not Mosheh (Moses) give you the law, and yet none of you keepeth the law? Why go ye about to kill me? ... If a man on the sabbath day receive circumcision, that the law of Mosheh (Moses) should not be broken; are ye angry at me, because I have made a man every whit whole on the sabbath day? Judge not according to the appearance, but judge righteous judgment.* (John 7:19, 23-24)\n\nThe Formed one''s doctrine being *not his own but the Father''s* is the eternal architecture of the Formless and the Formed — the Son draws his word from the source, as the prophet Yahuah (the LORD) promised would *speak unto them all that I shall command him.* The submission is not a costume for the incarnation; it is the relation itself. *If any man will do his will, he shall know* reverses the inherited order: doing reveals knowing, obedience opens understanding — the same cause-and-effect the whole gospel runs on.\n\nAnd the Torah-charge is the demolition of the lie before the lie is invented. The man who supposedly came to nullify the Torah stands at the feast and says *none of you keepeth the law.* He defends a Sabbath-healing not by setting the Sabbath aside but by reasoning from inside the Torah — circumcision is performed on the eighth day even when it falls on the Sabbath, so that the Torah not be broken; how much more is the making of a whole man on the Sabbath the Torah''s own intent. He does not break the Sabbath; he reads it rightly against the fence the tradition built around it. *Judge righteous judgment* is the call to read the Torah by its substance and not by the surface the tradition mistook for it.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1106
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 7 AND sv.verse_number = 16
   AND ev.book_slug = 'john' AND ev.chapter_number = 7 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 7, 16, 'deuteronomy', 18, 18, 1, E'*I will put my words in his mouth; and he shall speak unto them all that I shall command him* — the prophet who speaks the words given him by Yahuah (the LORD). *My doctrine is not mine, but his that sent me* is the Formed Son speaking the Father''s words exactly as the prophet-like-Mosheh (Moses) was promised to. (Deuteronomy 18:18-19)'),
  ('john', 7, 19, 'exodus', 24, 12, 2, E'*And I will give thee tables of stone, and a law, and commandments which I have written; that thou mayest teach them* — the Torah Mosheh (Moses) was given to give. *Did not Mosheh (Moses) give you the law, and yet none of you keepeth the law?* names the people''s failure to keep the very Torah being charged against them. (Exodus 24:12)'),
  ('john', 7, 22, 'leviticus', 12, 3, 3, E'*And in the eighth day the flesh of his foreskin shall be circumcised* — the eighth-day circumcision command. His Sabbath-argument reasons from inside the Torah: the eighth day overrides the Sabbath for circumcision so the Torah not be broken; the healing of a whole man honors the same Torah. (Leviticus 12:3)'),
  ('john', 7, 22, 'genesis', 17, 12, 4, E'*And he that is eight days old shall be circumcised among you, every man child in your generations* — the Avrahamic circumcision-covenant that precedes Mosheh (Moses). *Mosheh (Moses) gave unto you circumcision; (not because it is of Mosheh (Moses), but of the fathers)* points back to this command to the fathers. (Genesis 17:12)'),
  ('john', 7, 24, 'deuteronomy', 1, 16, 5, E'*Hear the causes between your brethren, and judge righteously between every man and his brother* — the righteous-judgment standard of the Torah itself. *Judge not according to the appearance, but judge righteous judgment* calls the crowd back to the Torah''s own command to judge by substance, not surface. (Deuteronomy 1:16-17)'),
  ('john', 7, 17, 'psalms', 25, 14, 6, E'*The secret of Yahuah (the LORD) is with them that fear him; and he will shew them his covenant* — knowing is given to those who walk in the fear of Yahuah (the LORD). *If any man will do his will, he shall know of the doctrine* is the same order: the doing opens the knowing. (Psalm 25:14)'),
  ('john', 7, 18, 'isaiah', 42, 8, 7, E'*I am Yahuah (the LORD): that is my name: and my glory will I not give to another* — the One who seeks the glory of the Father, not his own. *He that seeketh his glory that sent him, the same is true, and no unrighteousness is in him* is the Formed one refusing to take to himself the glory that is the Father''s. (Isaiah 42:8)'),
  ('john', 7, 23, 'hosea', 6, 6, 8, E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* — the Torah''s own weighting of mercy over ritual. Making a man *every whit whole on the sabbath day* is the mercy the Torah desires; the tradition''s Sabbath-fence had inverted the weighting. (Hosea 6:6)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:my-doctrine-is-not-mine-the-sent-one-and-the-torah | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for my-doctrine-is-not-mine-the-sent-one-and-the-torah.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'my-doctrine-is-not-mine-the-sent-one-and-the-torah'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:my-doctrine-is-not-mine-the-sent-one-and-the-torah | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- CHAPTER 7 COMPLETE

-- =====================================================================
-- ===== JOHN 9 — the man born blind + I am the light of the world =====
-- =====================================================================

-- ---------------------------------------------------------------------
-- Thread 1107: light-of-the-world-opening-the-blind-eyes
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'light-of-the-world-opening-the-blind-eyes',
    E'I am the light of the world — the opening of blind eyes as messianic credential',
    E'Before he heals the man born blind, Yahusha (Jesus) says, *As long as I am in the world, I am the light of the world.* Then he makes clay of spit and earth, anoints the man''s eyes, and sends him to wash in the pool of Shiloach (Siloam) — *which is by interpretation, Sent.* The inherited reading takes the healing as a compassion-miracle with a sermon attached. The Tanakh reads the opening of blind eyes as a specific messianic credential — the very sign Yeshayahu (Isaiah) said would mark the Servant when he came, the proof the Coming One would offer the imprisoned and the dark.\n\n*When I am in the world, I am the light of the world. When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay, And said unto him, Go, wash in the pool of Shiloach (Siloam), (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* (John 9:5-7)\n\n*I Yahuah (the LORD) have called thee in righteousness ... and give thee for a covenant of the people, for a light of the nations; To open the blind eyes, to bring out the prisoners from the prison, and them that sit in darkness out of the prison house.* (Isaiah 42:6-7)\n\n*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5)\n\nThe man is sent to wash in the pool called *Sent* — and the Formed one is himself the Sent One, the one the Father sent, so that the man''s washing in *Sent* is a washing in what the Formed one is. The clay made of spit and ground echoes the forming of Adam from the dust; the One who formed the first man from the ground re-forms sight into the eyes that never had it, by the same hand that shaped the dust in the garden.\n\nThe opening of blind eyes is the credential Yeshayahu (Isaiah) 42 said would mark the Servant given *for a light of the nations* — and the *light of the world* statement names Yahusha (Jesus) as that Servant-light. This is the *I am the light of the world* of John 8 walked out in flesh on a particular blind man. The light that rises on Yashar''el (Israel) in the gathering-prophecy of Yeshayahu (Isaiah) 60 is the same light standing in front of a man who has never seen, about to give him the first sight of his life — a sign-in-miniature of the whole scattered house, sitting in the darkness of the exile, about to be brought out of the prison house into the light of the gathering.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1107
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 5
   AND ev.book_slug = 'john' AND ev.chapter_number = 9 AND ev.verse_number = 7
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 9, 7, 'isaiah', 42, 7, 1, E'*To open the blind eyes, to bring out the prisoners from the prison, and them that sit in darkness out of the prison house* — the Servant-credential of opening blind eyes. The healing of the man born blind is the very sign Yeshayahu (Isaiah) 42 said would mark the One given for a light of the nations. (Isaiah 42:6-7)'),
  ('john', 9, 5, 'isaiah', 35, 5, 2, E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* — the opening of blind eyes as the day-of-coming sign. *I am the light of the world* is spoken over the man whose opened eyes are this prophecy walked out. (Isaiah 35:5)'),
  ('john', 9, 5, 'isaiah', 60, 1, 3, E'*Arise, shine; for thy light is come, and the glory of Yahuah (the LORD) is risen upon thee* — the light that rises on Yashar''el (Israel) in the gathering. The *light of the world* standing before the blind man is the risen light of Yeshayahu (Isaiah) 60, giving sight to one as the firstfruit of the many. (Isaiah 60:1-3)'),
  ('john', 9, 6, 'genesis', 2, 7, 4, E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life* — the forming of Adam from the dust. The clay of spit and ground that gives the man sight is the same forming hand that shaped Adam from the earth, now re-forming what was never made whole. (Genesis 2:7)'),
  ('john', 9, 5, 'psalms', 27, 1, 5, E'*Yahuah (the LORD) is my light and my salvation; whom shall I fear?* — Yahuah (the LORD) named as the light. *I am the light of the world* lands the Tehillim (Psalm) 27 light-of-Yahuah on the Formed one in flesh. (Psalm 27:1)'),
  ('john', 9, 7, 'psalms', 146, 8, 6, E'*Yahuah (the LORD) openeth the eyes of the blind: Yahuah (the LORD) raiseth them that are bowed down* — the opening of the blind named as the work of Yahuah (the LORD) himself. The Formed one does in flesh what the Psalm assigns to Yahuah (the LORD). (Psalm 146:8)'),
  ('john', 9, 5, 'malachi', 4, 2, 7, E'*But unto you that fear my name shall the Sun of righteousness arise with healing in his wings* — the rising Sun of righteousness who brings healing. *The light of the world* is the Sun of righteousness Mal''aki (Malachi) named, rising with healing on the eyes of the blind. (Malachi 4:2)'),
  ('john', 9, 4, 'isaiah', 49, 6, 8, E'*I will also give thee for a light to the nations, that thou mayest be my salvation unto the end of the earth* — the Servant given as a light reaching to the end of the earth. *I must work the works of him that sent me* is the Sent One doing the light-bearing work Yeshayahu (Isaiah) 49 assigned him. (Isaiah 49:6)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:light-of-the-world-opening-the-blind-eyes | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for light-of-the-world-opening-the-blind-eyes.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'light-of-the-world-opening-the-blind-eyes'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:light-of-the-world-opening-the-blind-eyes | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1108: for-judgment-the-seeing-made-blind
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'for-judgment-the-seeing-made-blind',
    E'For judgment I am come — the seeing made blind, the blind made to see',
    E'The chapter closes on a reversal. The man who was blind from birth now sees and worships; the Pharisees who claim to see now stand condemned. *For judgment I am come into this world, that they which see not might see; and that they which see might be made blind.* The inherited reading hears a paradox. The framework hears the Yeshayahu (Isaiah) 6 commission running in reverse and the cause-and-effect of hearing exposed: the light that gives sight to the blind hardens those who insist they already see, because the insistence is the blindness, and the claiming of sight is the guilt that remains.\n\n*And Yahusha (Jesus) said, For judgment I am come into this world, that they which see not might see; and that they which see might be made blind. And some of the Pharisees which were with him heard these words, and said unto him, Are we blind also? Yahusha (Jesus) said unto them, If ye were blind, ye should have no sin: but now ye say, We see; therefore your sin remaineth.* (John 9:39-41)\n\n*Hear ye indeed, but understand not; and see ye indeed, but perceive not. Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed.* (Isaiah 6:9-10)\n\n*Bring forth the blind people that have eyes, and the deaf that have ears.* (Isaiah 43:8)\n\nThe man born blind is the picture of the scattered who knew they could not see and washed when they were sent — and came seeing. The Pharisees are the picture of the credentialed who hold the office, sit on Mosheh''s (Moses''s) seat, and are sure of their sight — and so cannot receive the light, because the light is received only by those who know they are in the dark. *If ye were blind, ye should have no sin* — the one who knows his blindness is the one the light can reach. *Now ye say, We see; therefore your sin remaineth* — the claim to sight is the bar.\n\nThis is the same diagnostic the framework reads through the gospel. Hearing reveals the sheep; here, seeing reveals the same thing from the other side. The light does not create the division; it discloses it. The credential-system — the same architecture that runs from the Pharisees through every flesh-credential gospel that came after — is sure it sees, and its certainty is the thing that shuts its own eyes. The man with no credential, washed in the pool called *Sent,* sees the One standing in front of him and worships. The judgment is not arbitrary; it is the light landing where it always lands, sight to the one who knew he was blind, blindness confirmed on the one who would not.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1108
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 39
   AND ev.book_slug = 'john' AND ev.chapter_number = 9 AND ev.verse_number = 41
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 9, 39, 'isaiah', 6, 9, 1, E'*Hear ye indeed, but understand not; and see ye indeed, but perceive not ... shut their eyes; lest they see with their eyes ... and convert, and be healed* — the hardening-commission. *That they which see might be made blind* is the Yeshayahu (Isaiah) 6 judgment landing on those who claim to see. (Isaiah 6:9-10)'),
  ('john', 9, 39, 'isaiah', 42, 18, 2, E'*Hear, ye deaf; and look, ye blind, that ye may see. Who is blind, but my servant? ... seeing many things, but thou observest not* — the blindness of the ones who hold the office. The Pharisees who say *we see* are the seeing-but-not-observing blind Yeshayahu (Isaiah) names. (Isaiah 42:18-20)'),
  ('john', 9, 40, 'jeremiah', 5, 21, 3, E'*Hear now this, O foolish people, and without understanding; which have eyes, and see not; which have ears, and hear not* — the eyes-that-see-not indictment. *Are we blind also?* is asked by the very ones who have eyes and see not. (Jeremiah 5:21)'),
  ('john', 9, 41, 'proverbs', 26, 12, 4, E'*Seest thou a man wise in his own conceit? there is more hope of a fool than of him* — the self-certain are further from sight than the one who knows nothing. *Now ye say, We see; therefore your sin remaineth* is the Mishlei (Proverbs) diagnosis: the conceit of sight is the bar. (Proverbs 26:12)'),
  ('john', 9, 39, 'isaiah', 29, 18, 5, E'*And in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity, and out of darkness* — the day-of-coming sight for the blind. The man born blind seeing is this day breaking in; the Pharisees made blind are its other edge. (Isaiah 29:18)'),
  ('john', 9, 41, 'isaiah', 5, 21, 6, E'*Woe unto them that are wise in their own eyes, and prudent in their own sight!* — the woe on self-sight. The Pharisees'' *we see* is the wise-in-their-own-eyes the prophet pronounces woe upon. (Isaiah 5:21)'),
  ('john', 9, 39, 'john', 5, 22, 7, E'*For the Father judgeth no man, but hath committed all judgment unto the Son* — the judgment given to the Formed Son. *For judgment I am come into this world* is the Son exercising the judgment the Father committed to him. (John 5:22-27)'),
  ('john', 9, 41, 'numbers', 15, 30, 8, E'*But the soul that doeth ought presumptuously ... reproacheth Yahuah (the LORD); and that soul shall be cut off* — the Torah''s weighting of the high-handed sin against the sin of ignorance. *If ye were blind, ye should have no sin* turns on the same distinction: the sin known and claimed is the sin that remains. (Numbers 15:27-31)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:for-judgment-the-seeing-made-blind | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for for-judgment-the-seeing-made-blind.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'for-judgment-the-seeing-made-blind'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:for-judgment-the-seeing-made-blind | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1109: cast-out-of-the-synagogue-the-shepherd-receives-the-outcast
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'cast-out-of-the-synagogue-the-shepherd-receives-the-outcast',
    E'Cast out of the synagogue — the shepherd seeks the one the system threw away',
    E'When the healed man will not deny the One who opened his eyes, the rulers *cast him out.* And the next thing the gospel records is the shepherd going to find him: *Yahusha (Jesus) heard that they had cast him out; and when he had found him, he said unto him, Dost thou believe on the Son of Elohim (God)?* The inherited reading sees a tender follow-up. The framework sees the whole architecture of the gathering in miniature — the credential-system expels the man who saw, and the Formed shepherd goes out and seeks the one the system threw away, exactly as the prophets said Yahuah (the LORD) himself would seek the driven-out and the cast-off sheep.\n\n*They answered and said unto him, Thou wast altogether born in sins, and dost thou teach us? And they cast him out. Yahusha (Jesus) heard that they had cast him out; and when he had found him, he said unto him, Dost thou believe on the Son of Elohim (God)? ... And he said, Lord, I believe. And he worshipped him.* (John 9:34-38)\n\n*I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken ... and will feed them in judgment.* (Ezekiel 34:16)\n\n*Hear the word of Yahuah (the LORD), ye that tremble at his word; Your brethren that hated you, that cast you out for my name''s sake, said, Let Yahuah (the LORD) be glorified: but he shall appear to your joy, and they shall be ashamed.* (Isaiah 66:5)\n\nThe synagogue-rulers had already agreed that anyone confessing him would be *put out of the synagogue.* The man is the first in the gospel to pay that price. And the instant he is cast out, the shepherd finds him — because the casting-out by the credential-system is the very moment the true shepherd''s seeking begins. Yechezkel (Ezekiel) 34 had named it: the false shepherds scatter and drive away the sheep, and Yahuah (the LORD) himself comes to seek the driven-away and gather them. The man thrown out of the system is gathered by the One the system rejected.\n\nThis is the cause-and-effect of hearing walked out in a single life. The man hears the shepherd''s voice, follows it through the loss of his standing in the synagogue, and is found and received. Yeshayahu (Isaiah) 66 names the pattern exactly: the brethren who *cast you out for my name''s sake* will be ashamed, and the cast-out will see him appear to their joy. The healed man worships — the only fitting response to the Formed one — and the worship is the seal of the gathering: the outcast of the system is home, received by the shepherd who went out to seek him.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1109
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 34
   AND ev.book_slug = 'john' AND ev.chapter_number = 9 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 9, 35, 'ezekiel', 34, 16, 1, E'*I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken* — Yahuah (the LORD) himself seeking the driven-away sheep. *When he had found him* is the shepherd of Yechezkel (Ezekiel) 34 going out after the one the synagogue drove out. (Ezekiel 34:16)'),
  ('john', 9, 34, 'ezekiel', 34, 4, 2, E'*The diseased have ye not strengthened ... but with force and with cruelty have ye ruled them* — the false shepherds who scatter and oppress the flock. The rulers who cast the man out are the cruel shepherds Yechezkel (Ezekiel) indicts; their casting-out is the scattering Yahuah (the LORD) answers by seeking. (Ezekiel 34:4-6)'),
  ('john', 9, 34, 'isaiah', 66, 5, 3, E'*Your brethren that hated you, that cast you out for my name''s sake ... but he shall appear to your joy, and they shall be ashamed* — the cast-out-for-his-name pattern. The man put out of the synagogue is cast out for his name''s sake, and the shepherd appears to his joy. (Isaiah 66:5)'),
  ('john', 9, 35, 'psalms', 27, 10, 4, E'*When my father and my mother forsake me, then Yahuah (the LORD) will take me up* — the forsaken taken up by Yahuah (the LORD). The man whose own community throws him out is taken up by the Formed one who finds him. (Psalm 27:10)'),
  ('john', 9, 38, 'psalms', 23, 1, 5, E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want* — the shepherd-Psalm. The man received by the shepherd who sought him is brought under the *Yahuah Ra''ah (The LORD is my shepherd)* in flesh. (Psalm 23:1)'),
  ('john', 9, 38, 'psalms', 95, 6, 6, E'*O come, let us worship and bow down: let us kneel before Yahuah (the LORD) our maker* — the worship due to Yahuah (the LORD) the maker. *He worshipped him* gives the Formed one the worship the Psalm directs to Yahuah (the LORD) the maker, because the Formed one is the maker who shaped the clay that gave him sight. (Psalm 95:6)'),
  ('john', 9, 35, 'micah', 4, 6, 7, E'*In that day, saith Yahuah (the LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted* — the gathering of the driven-out and the afflicted. The found man is the driven-out one Mikhah (Micah) says Yahuah (the LORD) assembles in that day. (Micah 4:6-7)'),
  ('john', 9, 36, 'jeremiah', 23, 2, 8, E'*Ye have scattered my flock, and driven them away, and have not visited them: behold, I will visit upon you the evil of your doings, saith Yahuah (the LORD)* — the shepherds judged for driving the flock away. The rulers who drove the man out fall under the visitation Yirmeyahu (Jeremiah) names; the shepherd who visits the man is the One they rejected. (Jeremiah 23:2)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:cast-out-of-the-synagogue-the-shepherd-receives-the-outcast | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for cast-out-of-the-synagogue-the-shepherd-receives-the-outcast.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'cast-out-of-the-synagogue-the-shepherd-receives-the-outcast'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:cast-out-of-the-synagogue-the-shepherd-receives-the-outcast | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- CHAPTER 9 COMPLETE

-- =====================================================================
-- ===== JOHN 16 — the Comforter + sorrow-to-joy + overcome the world ==
-- =====================================================================

-- ---------------------------------------------------------------------
-- Thread 1110: the-comforter-the-spirit-of-truth-who-leads-into-all-truth
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-comforter-the-spirit-of-truth-who-leads-into-all-truth',
    E'The Comforter, the Spirit of truth — the Sinai Spirit who leads into all truth',
    E'Yahusha (Jesus) promises the disciples the Comforter — *the Spirit of truth* — who will not come until he goes, and who, when he comes, *will guide you into all truth.* The inherited reading often treats the Spirit as the agent of a new dispensation that leaves the old behind. The framework reads the Comforter as the same Ruach HaKodesh (Holy Spirit) who spoke at Sinai, the Spirit Yahuah (the LORD) promised to put within the gathered to cause them to walk in the statutes — the One who writes the Torah on the heart, not the One who erases it. The Spirit of truth leads into all truth, and the Word the Father spoke is truth.\n\n*Nevertheless I tell you the truth; It is expedient for you that I go away: for if I go not away, the Comforter will not come unto you; but if I depart, I will send him unto you ... Howbeit when he, the Spirit of truth, is come, he will guide you into all truth: for he shall not speak of himself; but whatsoever he shall hear, that shall he speak.* (John 16:7, 13)\n\n*A new heart also will I give you, and a new spirit will I put within you ... And I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26-27)\n\n*And as for me, this is my covenant with them, saith Yahuah (the LORD); My Ruach (Spirit) that is upon thee, and my words which I have put in thy mouth, shall not depart out of thy mouth ... from henceforth and for ever.* (Isaiah 59:21)\n\nThe Spirit of truth *shall not speak of himself; but whatsoever he shall hear, that shall he speak* — the same submission-architecture the Formed Son walks. As the Son speaks the Father''s words, the Spirit speaks what he hears; the Formless source, the Formed Word, the Ruach HaKodesh (Holy Spirit) — the one name in which all are named — move in one accord, never against the Word the Father spoke. The Spirit Yo''el (Joel) said would be poured on all flesh, the Spirit Yeshayahu (Isaiah) 59 said would not depart from the mouth of the covenant-seed forever, is the Comforter coming after the glorification.\n\nThis is why the leading-into-all-truth does not lead away from the Torah. The Spirit who guides is the Spirit who spoke the Torah at Sinai. He does not contradict himself across the covenants. He convicts the world of sin and of righteousness and of judgment; he glorifies the Son; he takes the things of the Son and shows them to the gathered. Every motion of the Comforter is toward the Word, never away from it. The Comforter is the Sinai Spirit poured into the heart of the gathered — the new-heart promise of Yechezkel (Ezekiel) 36 arriving in person.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1110
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 16 AND sv.verse_number = 7
   AND ev.book_slug = 'john' AND ev.chapter_number = 16 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 16, 13, 'ezekiel', 36, 27, 1, E'*I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* — the Spirit given to cause the walking in the Torah. The Spirit of truth who *will guide you into all truth* is the Yechezkel (Ezekiel) 36 Spirit who internalizes the statutes, not a Spirit who abolishes them. (Ezekiel 36:27)'),
  ('john', 16, 13, 'isaiah', 59, 21, 2, E'*My Ruach (Spirit) that is upon thee, and my words which I have put in thy mouth, shall not depart out of thy mouth ... from henceforth and for ever* — the Spirit and the words bound together forever in the covenant-seed. The Spirit of truth carries the Father''s words, never departing from them. (Isaiah 59:21)'),
  ('john', 16, 7, 'joel', 2, 28, 3, E'*I will pour out my spirit upon all flesh ... and also upon the servants and upon the handmaids in those days will I pour out my spirit* — the promised outpouring after the appointed time. The Comforter sent after the departure is the Spirit of Yo''el (Joel) 2:28 poured on the gathered. (Joel 2:28-29)'),
  ('john', 16, 13, 'john', 17, 17, 4, E'*Sanctify them through thy truth: thy word is truth* — the Father''s word named as the truth itself. *He will guide you into all truth* leads into the Word the Father spoke, because that Word is what truth is. (John 17:17)'),
  ('john', 16, 8, 'isaiah', 11, 2, 5, E'*And the Ruach (Spirit) of Yahuah (the LORD) shall rest upon him, the Ruach (Spirit) of wisdom and understanding, the Ruach (Spirit) of counsel and might, the Ruach (Spirit) of knowledge and of the fear of Yahuah (the LORD)* — the sevenfold Spirit of Yahuah (the LORD). The Comforter who convicts the world of sin and righteousness and judgment is this same Spirit of Yahuah (the LORD) in his discerning work. (Isaiah 11:2)'),
  ('john', 16, 14, 'isaiah', 42, 1, 6, E'*Behold my servant, whom I uphold ... I have put my Ruach (Spirit) upon him: he shall bring forth judgment to the nations* — the Spirit upon the Servant. *He shall glorify me: for he shall receive of mine, and shall shew it unto you* is the Spirit taking the things of the Servant-Son and showing them to the gathered. (Isaiah 42:1)'),
  ('john', 16, 13, 'numbers', 11, 25, 7, E'*And Yahuah (the LORD) ... took of the Ruach (Spirit) that was upon him, and gave it unto the seventy elders: and ... when the Ruach (Spirit) rested upon them, they prophesied* — the same Sinai-wilderness Spirit resting on the elders. The Comforter is this Spirit, not a new and different one; the Spirit who led in the wilderness leads into all truth. (Numbers 11:25)'),
  ('john', 16, 7, 'psalms', 51, 11, 8, E'*Cast me not away from thy presence; and take not thy Ruach HaKodesh (Holy Spirit) from me* — David''s plea naming the Ruach HaKodesh (Holy Spirit) by name in the Tanakh. The Comforter Yahusha (Jesus) sends is the same Ruach HaKodesh (Holy Spirit) David feared to lose. (Psalm 51:11)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-comforter-the-spirit-of-truth-who-leads-into-all-truth | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for the-comforter-the-spirit-of-truth-who-leads-into-all-truth.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-comforter-the-spirit-of-truth-who-leads-into-all-truth'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-comforter-the-spirit-of-truth-who-leads-into-all-truth | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1111: your-sorrow-turned-into-joy-the-travail-then-the-birth
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'your-sorrow-turned-into-joy-the-travail-then-the-birth',
    E'Your sorrow shall be turned into joy — the travail, then the birth',
    E'Yahusha (Jesus) tells the disciples they will weep and the world will rejoice, but their sorrow will be turned into joy — and he reaches for the image the prophets had already made the signature of the day of restoration: a woman in travail. *A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world.* The inherited reading takes this as comfort for the disciples'' grief over the crucifixion. The framework hears the larger pattern: the birth-pangs of the day of Yahuah (the LORD), the travail of Tsion (Zion) that brings forth the gathered nation, the sorrow that is the labor and the joy that is the delivery.\n\n*And ye now therefore have sorrow: but I will see you again, and your heart shall rejoice, and your joy no man taketh from you.* (John 16:22)\n\n*Before she travailed, she brought forth; before her pain came, she was delivered of a man child. Who hath heard such a thing? ... shall a nation be born at once? for as soon as Tsion (Zion) travailed, she brought forth her children.* (Isaiah 66:7-8)\n\n*Weeping may endure for a night, but joy cometh in the morning.* (Psalm 30:5)\n\nThe travail-and-birth is the prophets'' own figure for the gathering. Yeshayahu (Isaiah) 66 asks whether a nation can be born at once and answers yes — as soon as Tsion (Zion) travailed, she brought forth her children. The sorrow of the disciples at the cross is the labor; the joy of the resurrection-morning, and beyond it the joy of the whole gathered nation brought forth, is the delivery. *Joy that a man is born into the world* — the man-child of the birth — is the joy no one can take, because the One delivered through the travail is the firstborn the whole body follows.\n\nThe pattern reaches past the disciples to the scattered house. The captivity of Tsion (Zion) being turned is the same sorrow-into-joy: *they that sow in tears shall reap in joy.* The exile is the long night of weeping; the gathering is the morning. The Formed one promises the disciples a joy that *no man taketh from you* — the secured joy of the restoration, the joy on the far side of the labor that the resurrection guarantees and the full gathering completes. The sorrow is real and the sorrow is temporary; the joy is the delivery the travail was always moving toward.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1111
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 16 AND sv.verse_number = 20
   AND ev.book_slug = 'john' AND ev.chapter_number = 16 AND ev.verse_number = 22
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 16, 21, 'isaiah', 66, 8, 1, E'*Shall a nation be born at once? for as soon as Tsion (Zion) travailed, she brought forth her children* — the travail of Tsion (Zion) that brings forth the gathered nation. The woman-in-travail figure is the prophets'' own image for the birth of the restored people; the disciples'' sorrow is the labor of that delivery. (Isaiah 66:7-8)'),
  ('john', 16, 20, 'psalms', 30, 5, 2, E'*For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning* — the night of weeping and the morning of joy. *Your sorrow shall be turned into joy* is the Tehillim (Psalm) 30 morning breaking after the night of the cross and of the exile. (Psalm 30:5)'),
  ('john', 16, 20, 'psalms', 126, 5, 3, E'*They that sow in tears shall reap in joy. He that goeth forth and weepeth, bearing precious seed, shall doubtless come again with rejoicing* — the sowing-in-tears, reaping-in-joy of the turned captivity. The sorrow-into-joy of the disciples is the same harvest-pattern of the gathering of Tsion (Zion). (Psalm 126:5-6)'),
  ('john', 16, 22, 'isaiah', 35, 10, 4, E'*And the ransomed of Yahuah (the LORD) shall return, and come to Tsion (Zion) with songs and everlasting joy upon their heads ... and sorrow and sighing shall flee away* — the everlasting joy of the returning ransomed. *Your joy no man taketh from you* is the everlasting joy Yeshayahu (Isaiah) 35 sets on the head of the gathered. (Isaiah 35:10)'),
  ('john', 16, 20, 'jeremiah', 31, 13, 5, E'*Then shall the virgin rejoice in the dance, both young men and old together: for I will turn their mourning into joy, and will comfort them, and make them rejoice from their sorrow* — the turning of mourning into joy in the new-covenant gathering. The promise to the disciples is the Yirmeyahu (Jeremiah) 31 turning of mourning into joy spoken close. (Jeremiah 31:13)'),
  ('john', 16, 21, 'micah', 4, 10, 6, E'*Be in pain, and labour to bring forth, O daughter of Tsion (Zion), like a woman in travail: for now shalt thou go forth out of the city ... there shalt thou be delivered* — the daughter of Tsion (Zion) in travail who is afterward delivered. The travail-then-deliverance figure carries the exile and the gathering Mikhah (Micah) names. (Micah 4:10)'),
  ('john', 16, 22, 'isaiah', 25, 8, 7, E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* — the wiping-away of tears at the feast on the mountain. The joy no man takes is the joy of the day death is swallowed up and the tears are wiped from every gathered face. (Isaiah 25:8)'),
  ('john', 16, 20, 'isaiah', 60, 20, 8, E'*Thy sun shall no more go down ... for Yahuah (the LORD) shall be thine everlasting light, and the days of thy mourning shall be ended* — the ending of the days of mourning in the gathered city. The sorrow turned to joy is the mourning-days ended that Yeshayahu (Isaiah) 60 promises the restored. (Isaiah 60:20)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:your-sorrow-turned-into-joy-the-travail-then-the-birth | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for your-sorrow-turned-into-joy-the-travail-then-the-birth.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'your-sorrow-turned-into-joy-the-travail-then-the-birth'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:your-sorrow-turned-into-joy-the-travail-then-the-birth | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 1112: i-have-overcome-the-world-peace-in-the-day-of-trouble
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'i-have-overcome-the-world-peace-in-the-day-of-trouble',
    E'I have overcome the world — peace held in the day of trouble',
    E'The discourse ends on a sentence the gospel hangs the whole tribulation on: *In the world ye shall have tribulation: but be of good cheer; I have overcome the world.* The inherited reading often hears it as a promise that the believer is now lifted out of trouble. The Formed one says the opposite and the better thing: the tribulation is real and remains — *in the world ye shall have tribulation* — and the peace is not the absence of the trouble but the overcoming held inside it. The same Father who opened the door home left the day of Ya''aqov''s (Jacob''s) trouble standing; the peace is the peace of the One who has already overcome, given to those still walking through the trouble.\n\n*These things I have spoken unto you, that in me ye might have peace. In the world ye shall have tribulation: but be of good cheer; I have overcome the world.* (John 16:33)\n\n*Alas! for that day is great, so that none is like it: it is even the time of Ya''aqov''s (Jacob''s) trouble; but he shall be saved out of it.* (Jeremiah 30:7)\n\n*Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.* (Isaiah 26:3)\n\nThe peace is *in me* — the peace of the One who has overcome, not the cancellation of the trouble the world still brings. *In the world ye shall have tribulation* is the plain word that the curse-system is still operative in this age, that the day of Ya''aqov''s (Jacob''s) trouble still stands ahead, that the scattered are still scattered until the gathering is complete. The overcoming is real and the trouble is real, and they stand together: the One who overcame the world holds his overcoming out to those who must still pass through the world''s tribulation, and *he shall be saved out of it* is the promise that the trouble is passed through, not removed.\n\nThis is the same architecture the whole framework reads. The cross opened the door home; it did not abolish the consequence-system or lift the believer out of the operation of the day. *Be of good cheer* is not a denial of the tribulation; it is the courage of those who walk the trouble holding the peace of the One who has already won. *Thou wilt keep him in perfect peace, whose mind is stayed on thee* — the perfect peace of Yeshayahu (Isaiah) 26 is the peace stayed on the Overcomer in the middle of the day of trouble. The world is overcome; the trouble in the world remains; the peace is held in the One who has overcome it, all the way through to the gathering on the other side.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1112
  FROM _s194_john_lookup sv, _s194_john_lookup ev
 WHERE sv.book_slug = 'john' AND sv.chapter_number = 16 AND sv.verse_number = 33
   AND ev.book_slug = 'john' AND ev.chapter_number = 16 AND ev.verse_number = 33
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('john', 16, 33, 'jeremiah', 30, 7, 1, E'*Alas! for that day is great, so that none is like it: it is even the time of Ya''aqov''s (Jacob''s) trouble; but he shall be saved out of it* — the day of Ya''aqov''s (Jacob''s) trouble that still stands ahead. *In the world ye shall have tribulation* names the trouble the gathered are saved out of, not lifted over. (Jeremiah 30:7)'),
  ('john', 16, 33, 'isaiah', 26, 3, 2, E'*Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee* — the perfect peace of the mind stayed on Yahuah (the LORD). *In me ye might have peace* is the peace held by trust in the Overcomer in the middle of the trouble. (Isaiah 26:3)'),
  ('john', 16, 33, 'psalms', 46, 1, 3, E'*Elohim (God) is our refuge and strength, a very present help in trouble. Therefore will not we fear, though the earth be removed* — the refuge held in the day the earth is shaken. *Be of good cheer* is the courage of those who have the very-present help in the trouble that remains. (Psalm 46:1-3)'),
  ('john', 16, 33, 'isaiah', 9, 6, 4, E'*And his name shall be called ... Sar Shalom (The Prince of Peace)* — the Prince of Peace himself. *That in me ye might have peace* is the peace of the One whose own name is Sar Shalom (the Prince of Peace), given to the gathered. (Isaiah 9:6)'),
  ('john', 16, 33, 'psalms', 60, 12, 5, E'*Through Elohim (God) we shall do valiantly: for he it is that shall tread down our enemies* — the victory that is Elohim''s (God''s) treading-down. *I have overcome the world* is the Formed one''s treading-down of the enemy, the victory the gathered share through him. (Psalm 60:12)'),
  ('john', 16, 33, 'daniel', 7, 14, 6, E'*And there was given him dominion, and glory, and a kingdom ... his dominion is an everlasting dominion, which shall not pass away* — the everlasting dominion given to the Son of Adam. *I have overcome the world* is the overcoming that secures the everlasting kingdom Daniyel (Daniel) 7 names as his alone. (Daniel 7:14)'),
  ('john', 16, 33, 'isaiah', 25, 8, 7, E'*He will swallow up death in victory* — the final overcoming of death. The world overcome at the cross is the firstfruit of the victory in which death itself is swallowed up at the gathering-feast. (Isaiah 25:8)'),
  ('john', 16, 33, 'psalms', 27, 1, 8, E'*Yahuah (the LORD) is my light and my salvation; whom shall I fear? Yahuah (the LORD) is the strength of my life; of whom shall I be afraid?* — the fearlessness grounded in Yahuah (the LORD). *Be of good cheer* is the same fearlessness, stayed on the Overcomer through the tribulation that remains. (Psalm 27:1)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:i-have-overcome-the-world-peace-in-the-day-of-trouble | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s194_john_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s194_john_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for i-have-overcome-the-world-peace-in-the-day-of-trouble.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'i-have-overcome-the-world-peace-in-the-day-of-trouble'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:i-have-overcome-the-world-peace-in-the-day-of-trouble | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- CHAPTER 16 COMPLETE

COMMIT;
\echo 'Session 194 john 2/7/9/16 migration complete.'

