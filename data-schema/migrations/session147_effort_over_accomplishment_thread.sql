-- =====================================================================
-- Session 147 migration — 2026-05-27
-- =====================================================================
-- Cross-reference thread 6 — effort-over-accomplishment.
-- The framework's reading of how grace and the sifting hold together
-- in scripture. The same God who said *not for your righteousness, but
-- for my own name's sake* (Ezekiel 36:22, Deuteronomy 9:5-6, Isaiah
-- 48:11) also said *depart from me, ye that work iniquity* (Matthew
-- 7:23), *whosoever hath sinned against me, him will I blot out of my
-- book* (Exodus 32:33), and *the righteous turneth away from his
-- righteousness... in his sin... he shall die* (Ezekiel 18:24).
--
-- The Reformation grabbed the name's-sake hand and dropped the
-- workers-of-lawlessness hand and produced a gospel where nothing
-- the believer does after the prayer matters. The rabbinic system
-- grabbed the lawlessness hand and dropped the name's-sake hand and
-- produced a gospel where the believer's accomplishment is the ground
-- of standing. The framework holds both — and the place they hold
-- together is the phrase Yoshi names as the diagnostic: **effort over
-- accomplishment.**
--
-- The just is not the man who never fell. *A just man falleth seven
-- times, and riseth up again* (Proverbs 24:16). The wicked is not the
-- man who failed to accomplish; the wicked is the man who *stopped his
-- ears* (Proverbs 28:9; Zechariah 7:11-12; Acts 7:57). What separates
-- them is not the verdict — *none worthy* has already fallen on every
-- flesh — but the heart's response to the fall.
--
-- This thread complements the existing thread set (post-harvest-sifting
-- at S73; grace-from-names-sake, new-heart, scattered-seed-gathering,
-- false-inclusion-rebuttal at S74; grace-and-the-opportunity-that-
-- can-be-lost at S110). It does not duplicate them. It adds the
-- falling-and-rising hinge (Proverbs 24:16), the stopped-ears
-- discriminator (Proverbs 28:9 / Zechariah 7:11-12 / Acts 7:57), the
-- hanging-heads sign (Ezekiel 36:31-32 / Job 42:5-6 / Isaiah 6:5 /
-- Daniel 9:5), and the end-declared-from-the-beginning seal (Isaiah
-- 46:9-10 / Isaiah 48:3 / Isaiah 41:21-22).
--
-- Anchor: Proverbs 24:16 + Ezekiel 36:31-32. The first is the just-vs-
-- wicked diagnostic in wisdom register; the second is the new heart's
-- hanging-head response in prophetic register. Together they name the
-- architecture this thread carries.
--
-- Tier: free. Yoshi's instruction at session 147 dialog: "available
-- upon all chapters for free tier and onward as a study aid."
--
-- Downstream surfaces also landed this session:
--   - Blog post 22 at ~/Desktop/Website/blog-posts-batch-1/22-the-
--     same-god-says-both.md and the matching HTML.
--   - Featured commentary at ~/Desktop/App/commentary/featured/the-
--     same-god-says-both.md (featured-tile-2 onboarding read).
--   - Teaching corpus concept 11 populated at ~/Desktop/Teaching
--     Corpus/concepts/11-grace-and-torah-held-together/.
--   - Chapter-mapping review doc at ~/Desktop/App/commentary/featured/
--     _the-same-god-says-both-CHAPTER-MAPPING.md.
--
-- This file seeds the canon pairs. The Apocrypha and Pseudepigrapha
-- pairs (2 Esdras 7:46-47 and 8:35, Wisdom of Solomon 13:8-9, Sirach
-- 8:5, Prayer of Manasseh, Baruch 1:15, 2 Baruch 48:42 and 54:19,
-- 1 Enoch 10:17, Jubilees 23:26) land in the companion migration
-- session147b_effort_over_accomplishment_extras.sql. Together the two
-- files seed the complete thread across canon + the four restored
-- extras editions ('apocrypha', 'enoch', 'jubilees',
-- 'pseudepigrapha-charles-vol2'). Apply 147 first, then 147b.
--
-- Schema: no DDL changes required. This migration only seeds rows
-- into cross_reference_threads, cross_references, and
-- cross_reference_thread_members. Idempotent: every INSERT carries
-- ON CONFLICT DO NOTHING. Re-running produces zero side effects
-- after the first apply.
--
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session147_effort_over_accomplishment_thread.sql
-- =====================================================================

\echo 'Session 147 migration starting — effort-over-accomplishment thread...'

BEGIN;

-- ---------------------------------------------------------------------
-- Verse-id lookup helper as a temporary view scoped to this txn.
-- Spans every canon book the thread cites.
-- ---------------------------------------------------------------------
CREATE TEMP VIEW _s147_verse_lookup AS
SELECT
    b.slug          AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id            AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books b    ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon'
   AND b.slug IN (
       -- Torah
       'exodus','leviticus','deuteronomy',
       -- Historical
       '1-kings',
       -- Wisdom
       'job','psalms','proverbs','ecclesiastes',
       -- Major prophets
       'isaiah','jeremiah','ezekiel','daniel',
       -- Minor prophets
       'hosea','micah','zechariah',
       -- Gospels and Acts
       'matthew','john','acts',
       -- Pauline letters
       'romans','galatians','ephesians',
       -- General letters
       'hebrews','james','1-john',
       -- Apocalypse
       'revelation'
   );

-- =====================================================================
-- THREAD 6: effort-over-accomplishment
-- =====================================================================
-- Anchor: Proverbs 24:16 — the just-vs-wicked diagnostic. Co-anchor on
-- Ezekiel 36:31-32 surfaces in the prose. The anchor field uses
-- Proverbs 24:16 (a single-verse range) because that verse is the
-- hinge phrase Yoshi names; the wider architecture surfaces inside
-- the summary.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (
    slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order
)
SELECT
    'effort-over-accomplishment',
    'Effort over accomplishment — the same God says both',
    E'The Reformation reader has been shaped to believe two thoughts cannot stand in the same paragraph. The same God who said *not for your righteousness do I do this, but for my own name''s sake* — also said *depart from me, ye that work iniquity, I never knew you.* The same God who said *for by grace are ye saved through faith* — also said *whosoever hath sinned against me, him will I blot out of my book.* The same God who said *I will give you a new heart* — also said *ye shall loathe yourselves in your own sight for your iniquities.*\n\nThe Reformation kept the *for my name''s sake* half and put a period where there should have been a colon. The rabbinic system kept the *depart from me* half and built a flesh-righteousness gospel. The framework holds both halves because scripture holds both halves. The place where they hold together is the phrase that names the diagnostic: **effort over accomplishment.**\n\n*"For a just man falleth seven times, and riseth up again: but the wicked shall fall into mischief."* (Proverbs 24:16)\n\nThe just is not the man who never fell. The wicked is not the man who failed to accomplish. What separates them is not the verdict — *none worthy* has already fallen on every flesh — but the heart''s response. The just rises. The wicked *stops his ears* (Proverbs 28:9; Zechariah 7:11-12; Acts 7:57). Open ears and a returning heart, even after seven falls, is the sign of life; stopped ears, even after a hundred sermons, is the sign of death.\n\nThe new heart''s signature response to grace is not the boast. It is the hanging head — *ye shall loathe yourselves in your own sight for your iniquities* (Ezekiel 36:31; 20:43; Job 42:5-6; Isaiah 6:5; Daniel 9:5). The Reformation gospel produces a head that holds itself up because it is *saved.* The rabbinic gospel produces a head that holds itself up because it is *righteous.* The framework''s new heart produces a head that goes lower the more it sees His mercy.\n\n*"Remember the former things of old: for I am El, and there is none else; I am Elohim (God), and there is none like me, Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure."* (Isaiah 46:9-10)\n\nThe whole architecture is sealed by the end the Father declared from the beginning. The end is the gathering — the twelve tribes home, the new heart given, the kingdom of priests, the Way restored. Every system that denies the gathering denies the end; every system that denies the end calls Him a liar; to call Him a liar is to reject the mercy that hangs on His name. The architecture stands or falls as one piece.\n\nCompanion threads: `grace-from-names-sake` carries the name''s-sake-mercy pillar; `new-heart` carries the Torah-internalized pillar; `post-harvest-sifting` carries the wheat-sifting pillar; `grace-and-the-opportunity-that-can-be-lost` carries the standing-can-be-forfeit warning at the Matt 6 anchor. This thread anchors the architecture at the Proverbs 24:16 hinge and adds the stopped-ears discriminator, the hanging-heads sign, and the end-declared seal.',
    sv.verse_id,
    sv.verse_id,
    'free'::content_tier,
    600
  FROM _s147_verse_lookup sv
 WHERE sv.book_slug = 'proverbs' AND sv.chapter_number = 24 AND sv.verse_number = 16
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Cross-reference pairs for thread 6.
-- ---------------------------------------------------------------------
WITH new_xrefs(source_book, source_chap, source_v, target_book, target_chap, target_v, sort_order, member_note) AS (
    VALUES
        -- The hinge — Proverbs 24:16 ↔ the rising witnesses
        ('proverbs',     24, 16, 'micah',         7,  8,  1, 'When I fall, I shall arise — the just-man-rises in prophetic register'),
        ('proverbs',     24, 16, 'psalms',       37, 24,  2, 'Though he fall, he shall not be utterly cast down — the catching hand'),
        ('proverbs',     24, 16, 'psalms',      145, 14,  3, 'Upholdeth all that fall, raiseth up all those that be bowed down'),
        ('proverbs',     24, 16, 'ezekiel',      36, 26,  4, 'The new heart is the heart that rises; falling is not the verdict, refusing to rise is'),
        ('proverbs',     24, 16, 'romans',       11, 32,  5, 'The just fall too — concluded all in unbelief, that he might have mercy upon all'),

        -- The anchor on the other side — Ezekiel 36 ↔ the hanging-head witnesses
        ('ezekiel',      36, 31, 'job',          42,  6,  6, 'I abhor myself — Job''s hanging head matches loathe-yourselves'),
        ('ezekiel',      36, 31, 'isaiah',        6,  5,  7, 'Woe is me, I am undone — the prophet''s hanging head in commissioning vision'),
        ('ezekiel',      36, 31, 'daniel',        9,  5,  8, 'Daniel''s confession of fathers'' sins matches the same posture'),
        ('ezekiel',      36, 31, 'ezekiel',      20, 43,  9, 'Companion passage within Ezekiel — the hanging head twice named'),
        ('ezekiel',      36, 27, 'proverbs',     24, 16, 10, 'The new heart causes the walking; the walking includes the rising after the fall'),

        -- The sifting — wheat blotted, not tares
        ('ezekiel',      18, 24, 'matthew',       7, 23, 11, 'Righteous turning away → I never knew you — same architecture, NT vocabulary'),
        ('ezekiel',      33, 13, 'ezekiel',      18, 24, 12, 'If he trust to his own righteousness, and commit iniquity — Ezekiel''s twin warning'),
        ('exodus',       32, 33, 'revelation',    3,  5, 13, 'Blotting principle anchored at Sinai → restated in NT — names blotted from wheat, not tares'),
        ('revelation',    3,  5, 'exodus',       32, 33, 14, 'The overcomer''s name preserved — Sinai''s blotting principle in NT register'),
        ('matthew',       7, 21, 'ezekiel',      36, 27, 15, 'Doing the will of the Father = walking in the statutes the new heart was given to walk'),
        ('matthew',       7, 23, 'ezekiel',      18, 24, 16, 'Depart from me ← the righteousness that turned away does not deliver'),
        ('matthew',       7, 23, 'revelation',    3,  5, 17, 'Depart from me / blot out his name — the post-harvest sifting of wheat'),

        -- The discriminator — stopped ears
        ('proverbs',     28,  9, 'zechariah',     7, 12, 18, 'Ear-turn-from-law → stopped-ears against the prophets — same heart, two registers'),
        ('proverbs',     28,  9, 'acts',          7, 57, 19, 'Ear-turn-from-law → NT narrative of stopped-ears at Stephen'),
        ('zechariah',     7, 11, 'acts',          7, 57, 20, 'The pattern of the fathers → the pattern at Stephen''s stoning'),
        ('zechariah',     7, 12, 'proverbs',     28,  9, 21, 'Stopped ears = ear-turn-from-law in wisdom register'),
        ('acts',          7, 57, 'zechariah',     7, 11, 22, 'The hearers continue the fathers'' refusal — Stephen names it and they confirm it'),
        ('hosea',         4,  6, 'proverbs',     28,  9, 23, 'Rejected knowledge = ear-turn-from-law — the wicked heart''s self-identification'),

        -- Hanging heads — the sign of the new heart
        ('job',          42,  6, 'ezekiel',      36, 31, 24, 'I abhor myself = ye shall loathe yourselves — same posture, two witnesses'),
        ('isaiah',        6,  5, 'ezekiel',      36, 31, 25, 'Woe is me = loathe yourselves — prophetic hanging head'),
        ('daniel',        9,  5, 'leviticus',    26, 40, 26, 'Daniel confessing fathers'' sins fulfills the Leviticus pattern'),
        ('daniel',        9,  5, 'ezekiel',      36, 31, 27, 'Daniel hangs his head — the new heart''s response in restoration prayer'),
        ('leviticus',    26, 40, 'daniel',        9,  5, 28, 'The Torah pattern of fathers''-confession lived in Daniel'),
        ('ezekiel',      20, 43, 'ezekiel',      36, 31, 29, 'Companion verse within Ezekiel — the hanging head twice named'),

        -- The end declared from the beginning — the seal
        ('isaiah',       46, 10, 'isaiah',       48,  3, 30, 'Declaring the end → I have declared the former things — same self-witness'),
        ('isaiah',       48,  3, 'isaiah',       46, 10, 31, 'Before it came to pass I shewed it thee — the declaration confirmed'),
        ('isaiah',       41, 22, 'isaiah',       46, 10, 32, 'Challenge to the gods → the Most High''s own answer'),
        ('isaiah',       46,  9, 'isaiah',       41, 21, 33, 'There is none else → produce your cause'),

        -- Name''s-sake mercy — complementary to thread 2
        ('psalms',       25, 11, 'isaiah',       48,  9, 34, 'For thy name''s sake (David) → for my name''s sake (Yahuah, Isaiah)'),
        ('isaiah',       48,  9, 'psalms',       25, 11, 35, 'For mine own sake → David''s prayer in the same posture'),

        -- Universal verdict — the leveling
        ('romans',        3, 10, 'psalms',       14,  1, 36, 'Paul quoting Psalm 14 — the leveling baseline'),
        ('romans',        3, 23, '1-kings',       8, 46, 37, 'All have sinned ← Solomon''s no man sinneth not'),
        ('romans',       11, 32, 'galatians',     3, 22, 38, 'Concluded all in unbelief ↔ concluded all under sin — same architecture, two letters'),
        ('1-kings',       8, 46, 'ecclesiastes',  7, 20, 39, 'No man sinneth not = no just man on earth that sinneth not'),
        ('ecclesiastes',  7, 20, 'romans',        3, 23, 40, 'Wisdom''s verdict → Paul''s NT restatement'),
        ('psalms',       14,  1, 'romans',        3, 10, 41, 'The fool said in his heart → none righteous, no, not one'),
        ('1-john',        1,  8, 'romans',        3, 23, 42, 'If we say we have no sin → all have sinned'),

        -- Universal witness — none without excuse
        ('romans',        1, 20, 'psalms',       19,  1, 43, 'Without excuse — the heavens declare the glory'),
        ('psalms',       19,  1, 'romans',        1, 20, 44, 'The witness given → the verdict pronounced'),
        ('romans',        2, 15, 'jeremiah',     31, 33, 45, 'Law written in hearts — the new-covenant interior witness'),
        ('acts',         17, 30, 'romans',        1, 20, 46, 'Winked at ignorance, now commands repent — the witness made plain'),

        -- James — faith without works is dead
        ('james',         2, 17, 'matthew',       7, 23, 47, 'Faith without works dead → workers of iniquity who claimed his name'),
        ('james',         2, 26, 'proverbs',     24, 16, 48, 'Faith without works dead = the heart that does not rise after the fall')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    sv.verse_id,
    tv.verse_id,
    'manual',
    'thread:effort-over-accomplishment | ' || nx.member_note,
    'free'::content_tier
  FROM new_xrefs nx
  JOIN _s147_verse_lookup sv
    ON sv.book_slug = nx.source_book
   AND sv.chapter_number = nx.source_chap
   AND sv.verse_number = nx.source_v
  JOIN _s147_verse_lookup tv
    ON tv.book_slug = nx.target_book
   AND tv.chapter_number = nx.target_chap
   AND tv.verse_number = nx.target_v
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link thread 6 members.
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (
        ORDER BY
            sb.canonical_order, sc.chapter_number, sv.verse_number,
            tb.canonical_order, tc.chapter_number, tv.verse_number
    ) AS sort_order,
    SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'effort-over-accomplishment'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:effort-over-accomplishment | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Sanity check — report the count of members landed.
-- ---------------------------------------------------------------------
DO $$
DECLARE
    member_count INT;
BEGIN
    SELECT COUNT(*) INTO member_count
      FROM cross_reference_thread_members m
      JOIN cross_reference_threads t ON t.id = m.thread_id
     WHERE t.slug = 'effort-over-accomplishment';
    RAISE NOTICE 'effort-over-accomplishment thread now has % members.', member_count;
END $$;

COMMIT;

\echo 'Session 147 migration complete.'
