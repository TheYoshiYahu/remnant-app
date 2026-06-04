-- =====================================================================
-- Session 183 migration — mark-anchored cross-reference threads + member-additions
-- =====================================================================
-- 15 NEW threads anchored in Mark (sort_order 1201-1215). 17 originally
-- proposed; A.2 (`divided-house-...`) REJECTED — Mark 3:23-27 reroutes to
-- existing `binding-of-the-watchers-typological-anchor-for-binding-the-strong-man`
-- (2 attachment rows). B.3 (`aramaic-preserved-words-...` meta-thread)
-- DROPPED per Yoshi Decision 1. C.1 slug locked as
-- `tehillim-110-1-davids-lord-formed-at-the-right-hand` per Yoshi Decision 2.
--
-- Total member rows: ~207 input rows expanded across 15 NEW-thread inserts
-- (76 rows), the A.2 reroute (2 rows), and the bulk member-additions to
-- existing threads (Mark 1-16, ~256 input rows in the bulk WITH-VALUES).
-- All threads tier='free'.
--
-- Extras-edition references (1 Enoch, Jubilees, 2 Esdras, 2 Baruch,
-- Ascension of Isaiah, Wisdom of Solomon, Sirach, Testaments XII, etc.)
-- are quoted verbatim inside summary_md but NOT inserted as member rows
-- here, because `_s183_mark_lookup` is canon-edition scoped. Per S181
-- pattern (john/romans/galatians/revelation migrations carry no extras
-- target rows even where the framework reading references extras). The
-- extras member rows are a future-migration concern.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session183_mark_xref_members_and_threads.sql
-- =====================================================================

\echo 'Session 183 mark migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction (canon edition only).
CREATE TEMP VIEW _s183_mark_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- ---------------------------------------------------------------------
-- Thread 1: unclean-spirits-recognize-the-holy-one-of-elohim (A.1, sort 1201)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'unclean-spirits-recognize-the-holy-one-of-elohim',
    E'Unclean spirits recognize the Holy One of Elohim before the people do',
    E'Twice in Mark 1-3 the unclean spirits cry out and name what the watching crowds cannot yet say — *thou art the Son of Elohim (God)* (Mark 3:11), *the Holy One of Elohim (God)* (Mark 1:24). The watchers'' offspring (1 Enoch 15-16''s bound demons) know exactly who stands in front of them, because they were there at the rebellion and they recognize the Formed one when he walks in. James 2:19''s *the devils also believe, and tremble* names the same diagnostic: the demons'' recognition is not the same as the sheep''s hearing. The Son of Adam silences them (*Hold thy peace,* Mark 1:25; *he straitly charged them that they should not make him known,* Mark 3:12) because the testimony of an unclean spirit is not the witness through which the kingdom is announced — that comes through the prophets, the apostles, and the sheep who hear his voice.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1201
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 1 AND sv.verse_number = 24
   AND ev.book_slug = 'mark' AND ev.chapter_number = 3 AND ev.verse_number = 12
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 1, 24, 'james', 2, 19, 1, E'The unclean spirit''s cry — *I know thee who thou art, the Holy One of Elohim (God)* — is the recognition James 2:19 names: *the devils also believe, and tremble*. The watchers'' bound offspring know the Formed one when he walks in; they recognize him before the people in the synagogue can name what they are watching. The recognition is not the same as the sheep''s hearing — the sheep hear and turn; the demons know and do not turn.'),
  ('mark', 1, 25, 'mark', 3, 11, 2, E'*Hold thy peace, and come out of him.* The Son of Adam silences the demon''s testimony because the kingdom is not announced through the unclean spirit''s mouth — it is announced through the prophets, the Son, the apostles, and the sheep who hear his voice. The silencing is the same pattern at Mark 1:34 and Mark 3:12.'),
  ('mark', 1, 34, 'mark', 1, 24, 3, E'*He... suffered not the devils to speak, because they knew him.* The pattern is consistent — the demons'' recognition is not the witness through which the kingdom is to be made known.'),
  ('mark', 3, 11, 'mark', 1, 24, 4, E'*Unclean spirits, when they saw him, fell down before him, and cried, saying, Thou art the Son of Elohim (God).* The pattern set at Mark 1:24 continues — the demons recognize and are silenced, because the kingdom is not announced through unclean mouths. The *they should not make him known* of Mark 3:12 is the same restraint.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:unclean-spirits-recognize-the-holy-one-of-elohim | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'unclean-spirits-recognize-the-holy-one-of-elohim'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:unclean-spirits-recognize-the-holy-one-of-elohim | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 2: sleeping-and-rising-as-the-seed-grows-of-itself (A.3, sort 1202)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'sleeping-and-rising-as-the-seed-grows-of-itself',
    E'The seed growing of itself — the husbandman sleeps and rises while the kingdom comes',
    E'Mark alone carries this parable. *So is the kingdom of Elohim (God), as if a man should cast seed into the ground; and should sleep, and rise night and day, and the seed should spring and grow up, he knoweth not how* (Mark 4:26-27). The seed-of-promise architecture from Bereshit (Genesis) 1:11-12 is the bedrock — the earth bringing forth seed *after his kind* by the word that was spoken at creation. The parable refuses the inherited Christian frame of human-effort-builds-the-kingdom: the kingdom comes by the Father''s appointed unfolding, on its own clock, until the harvest. *When the fruit is brought forth, immediately he putteth in the sickle, because the harvest is come* (Mark 4:29) is the same harvest the Father names through Yo''el (Joel) 3:13 — *put ye in the sickle, for the harvest is ripe* — and through Revelation 14:15.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1202
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 4 AND sv.verse_number = 26
   AND ev.book_slug = 'mark' AND ev.chapter_number = 4 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 4, 26, 'genesis', 1, 11, 1, E'*So is the kingdom of Elohim (God), as if a man should cast seed into the ground; and should sleep, and rise night and day, and the seed should spring and grow up, he knoweth not how.* The seed-of-promise architecture from Bereshit (Genesis) 1:11-12 — the earth bringing forth seed *after his kind* — is the bedrock. The parable refuses the human-effort-builds-the-kingdom frame: the kingdom comes by the Father''s appointed unfolding, until the harvest.'),
  ('mark', 4, 26, 'genesis', 1, 12, 2, E'*And the earth brought forth grass, and herb yielding seed after his kind, and the tree yielding fruit, whose seed was in itself, after his kind: and Elohim (God) saw that it was good.* The creation-pattern of seed-after-his-kind running by the Father''s word is the substance the Markan parable walks into the kingdom register.'),
  ('mark', 4, 29, 'joel', 3, 13, 3, E'*When the fruit is brought forth, immediately he putteth in the sickle, because the harvest is come.* The sickle-and-the-harvest names the same harvest Yo''el (Joel) 3:13 announces — *put ye in the sickle, for the harvest is ripe* — the appointed-hour-of-reaping the Father has set.'),
  ('mark', 4, 29, 'revelation', 14, 15, 4, E'*Thrust in thy sickle, and reap: for the time is come for thee to reap.* The Markan husbandman with the sickle in hand is the same Son of Adam at Revelation 14:14-16, the harvest-hour fulfilled at the appointed clock.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:sleeping-and-rising-as-the-seed-grows-of-itself | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'sleeping-and-rising-as-the-seed-grows-of-itself'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:sleeping-and-rising-as-the-seed-grows-of-itself | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 3: gadarene-demoniac-legion-and-the-eastern-territory-of-the-scattered (B.1, sort 1203)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'gadarene-demoniac-legion-and-the-eastern-territory-of-the-scattered',
    E'The Gadarene demoniac, legion cast into the swine, and the eastern territory of the scattered',
    E'The first encounter on the eastern shore of the sea — the Decapolis, the country of the Gadarenes — is the King crossing into the territory of the lost tribes of Reuben, Gad, and the half-tribe of Manasseh whose inheritance lay east of the Yarden (Jordan). *And they came over unto the other side of the sea, into the country of the Gadarenes* (Mark 5:1). A man no man could bind, dwelling among tombs, cutting himself with stones — the scattered seed under unclean-spirit administration in the very land Mosheh (Moses) had assigned the eastern tribes. The legion that begs not to be sent out of the country names itself: *we are many.* The swine they enter and the steep place into the sea is the Watcher-spirit architecture being undone in the territory of the scattered, and the delivered man becomes the first proclaimer in Decapolis — *Go home to thy friends, and tell them how great things Yahuah (the Lord) hath done for thee* (Mark 5:19) — a scattered-territory mission before the Twelve are even sent.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1203
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 1
   AND ev.book_slug = 'mark' AND ev.chapter_number = 5 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 5, 1, 'numbers', 32, 33, 1, E'The King crosses to the eastern shore — into the country of the Gadarenes, the territory the eastern tribes received from Mosheh (Moses). *Mosheh (Moses) gave unto them, even to the children of Gad, and to the children of Reuben, and unto half the tribe of Manasseh the son of Yoseph (Joseph), the kingdom of Sichon king of the Amorites, and the kingdom of Og king of Bashan.* The eastern inheritance carries the same scattered-seed weight as the rest of Yashar''el (Israel); the King''s first move on the eastern shore is to undo unclean-spirit administration in the very land Mosheh had assigned.'),
  ('mark', 5, 1, 'deuteronomy', 3, 12, 2, E'*And this land, which we possessed at that time, from Aroer, which is by the river Arnon, and half mount Gilead, and the cities thereof, gave I unto the Reubenites and to the Gadites.* The eastern-tribal inheritance under Mosheh''s (Moses''s) own hand; the country of the Gadarenes is Reuben-Gad-half-Manasseh territory.'),
  ('mark', 5, 1, 'joshua', 13, 8, 3, E'*With whom the Reubenites and the Gadites have received their inheritance, which Mosheh (Moses) gave them, beyond Yarden (Jordan) eastward.* The Joshua-record of the eastern-tribal land-grant carries the territory where the Gadarene man waits for the King to come.'),
  ('mark', 5, 13, 'leviticus', 11, 7, 4, E'*And the unclean spirits went out, and entered into the swine: and the herd ran violently down a steep place into the sea... and were choked in the sea.* The unclean-spirit class sent into the unclean-animal class and drowned in the sea reverses the Watcher-administration''s grip on the eastern territory in one motion. Swine-keeping in Yashar''eli (Israelite) inheritance-land is itself a sign of how far the people had drifted from the Torah''s clean / unclean instruction (Leviticus 11:7-8 names the swine unclean); the King''s deliverance undoes the spirits and exposes the trade in one move.'),
  ('mark', 5, 13, 'isaiah', 65, 4, 5, E'*Which remain among the graves, and lodge in the monuments, which eat swine''s flesh, and broth of abominable things is in their vessels.* Yeshayahu (Isaiah) names the swine-eating-among-the-tombs pattern as the diagnostic of the scattered drifting from Torah; the Gadarene man dwelling among the tombs in swine-keeping territory is the exact tableau.'),
  ('mark', 5, 19, 'psalms', 71, 19, 6, E'*Howbeit Yahusha (Jesus) suffered him not, but saith unto him, Go home to thy friends, and tell them how great things Yahuah (the Lord) hath done for thee, and hath had compassion on thee.* The delivered man becomes the first proclaimer in Decapolis — a scattered-territory mission entrusted to a single man before the Twelve are formally sent out. *Tell them how great things Yahuah hath done* is a Tehillim-register charge: *Thy righteousness also, O Elohim (God), is very high, who hast done great things: O Elohim (God), who is like unto thee!*'),
  ('mark', 5, 19, 'psalms', 126, 2, 7, E'*Then said they among the heathen, Yahuah (the LORD) hath done great things for them.* The Tehillim of the return-of-the-captives names the testimony-among-the-nations pattern the delivered Gadarene man walks into Decapolis.'),
  ('mark', 5, 20, 'john', 4, 39, 8, E'*And he departed, and began to publish in Decapolis how great things Yahusha (Jesus) had done for him: and all men did marvel.* The Decapolis-publishing pre-figures the gospel''s eastward reach to the scattered. The proclaimer the delivered man became is the same proclaimer-architecture Yochanan (John) carries in John 4:39 with the Samaritan woman: an outsider-deemed-outsider made first witness in territory the synagogue has not reached.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:gadarene-demoniac-legion-and-the-eastern-territory-of-the-scattered | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'gadarene-demoniac-legion-and-the-eastern-territory-of-the-scattered'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:gadarene-demoniac-legion-and-the-eastern-territory-of-the-scattered | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 4: talitha-cumi-and-the-twelve-year-resurrection-of-the-daughter-of-the-house (B.2, sort 1204)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'talitha-cumi-and-the-twelve-year-resurrection-of-the-daughter-of-the-house',
    E'Talitha cumi — the twelve-year daughter of the house raised from sleep',
    E'*And he took the damsel by the hand, and said unto her, Talitha cumi; which is, being interpreted, Damsel, I say unto thee, arise* (Mark 5:41). The Aramaic preserved on the page is the King''s own voice raising a daughter who has been twelve years on the earth — the same twelve years the woman with the issue of blood has been bleeding (Mark 5:25). Two daughters, one number. *The damsel is not dead, but sleepeth* (Mark 5:39) is the same word the prophets used of the covenant dead — *many that sleep in the dust of the earth shall awake* (Daniel 12:2). The twelve-year sleep of the daughter of the house of the ruler of the synagogue is a sign in miniature of the first resurrection — the worthy of the seed raised at the King''s own word, the language preserved in the tongue the people heard him speak.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1204
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 5 AND sv.verse_number = 39
   AND ev.book_slug = 'mark' AND ev.chapter_number = 5 AND ev.verse_number = 42
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 5, 39, 'daniel', 12, 2, 1, E'*And when he was come in, he saith unto them, Why make ye this ado, and weep? the damsel is not dead, but sleepeth.* *Sleep* is the prophetic-register word for the covenant dead awaiting the resurrection: *and many of them that sleep in the dust of the earth shall awake.* The crowd that laughs the King to scorn does not yet know what word he is using.'),
  ('mark', 5, 39, 'john', 11, 11, 2, E'*Our friend Lazaros (Lazarus) sleepeth; but I go, that I may awake him out of sleep.* The Markan *sleepeth* applied to the twelve-year daughter and the Yochanan (John) sleepeth applied to Lazaros are the same prophetic-register word for the covenant dead awaiting the resurrection-call. The raising at Mark 5 is the sign-in-miniature of the raising at John 11.'),
  ('mark', 5, 39, '1-thessalonians', 4, 14, 3, E'*Them also which sleep in Yahusha (Jesus) will Elohim (God) bring with him.* Paul carries forward the same sleep-and-resurrection vocabulary; the prophetic sleep-of-the-covenant-dead is the architecture the Markan daughter''s raising signs.'),
  ('mark', 5, 41, 'mark', 5, 25, 4, E'*And he took the damsel by the hand, and said unto her, Talitha cumi; which is, being interpreted, Damsel, I say unto thee, arise.* The Aramaic preserved on the page is the King''s own voice raising a daughter who has been twelve years on the earth — the same twelve years the woman with the issue had been bleeding (Mark 5:25 — *a certain woman, which had an issue of blood twelve years*). Two daughters, one number, two restorations in one chapter.'),
  ('mark', 5, 41, 'mark', 7, 34, 5, E'The Aramaic-preserved word of Mark 5:41 (*Talitha cumi*) pairs with the Aramaic-preserved word of Mark 7:34 (*Ephphatha*) — the King''s own voice kept on the page at the raising and at the opening.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:talitha-cumi-and-the-twelve-year-resurrection-of-the-daughter-of-the-house | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'talitha-cumi-and-the-twelve-year-resurrection-of-the-daughter-of-the-house'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:talitha-cumi-and-the-twelve-year-resurrection-of-the-daughter-of-the-house | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 5: ephphatha-be-opened-the-deaf-hearing-and-the-dumb-speaking-as-messianic-credential (B.4, sort 1205)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'ephphatha-be-opened-the-deaf-hearing-and-the-dumb-speaking-as-messianic-credential',
    E'*Ephphatha* — the deaf hearing and the dumb speaking as the messianic-age credential of Yeshayahu (Isaiah) 35',
    E'*And straightway his ears were opened, and the string of his tongue was loosed, and he spake plain* (Mark 7:35). The crowd''s verdict — *he hath done all things well: he maketh both the deaf to hear, and the dumb to speak* (Mark 7:37) — is a direct echo of the messianic-age catalog Yeshayahu (Isaiah) gave: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped. Then shall the lame man leap as an hart, and the tongue of the dumb sing* (Isaiah 35:5-6). The opening of the ear is the credential the King handed Yochanan''s (John''s) disciples a chapter earlier in Matthew 11:5 as the answer to *art thou he that should come?* — the answer the prophets had already written down for them to recognize.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1205
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 7 AND sv.verse_number = 34
   AND ev.book_slug = 'mark' AND ev.chapter_number = 7 AND ev.verse_number = 37
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 7, 34, 'mark', 5, 41, 1, E'*And looking up to heaven, he sighed, and saith unto him, Ephphatha, that is, Be opened.* The second Aramaic word Mark preserves on the page — the King''s own voice spoken over a deaf man, the original word kept so the reader hears what the witnesses heard, the translation given immediately so the meaning is not lost. The same pattern as *Talitha cumi* at 5:41.'),
  ('mark', 7, 35, 'isaiah', 35, 5, 2, E'*Ephphatha, that is, Be opened. And straightway his ears were opened, and the string of his tongue was loosed, and he spake plain.* The ear-opening and tongue-loosing are the messianic-age credentials Yeshayahu (Isaiah) 35:5-6 catalogued: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.*'),
  ('mark', 7, 35, 'isaiah', 35, 6, 3, E'*And the tongue of the dumb sing.* The King fulfills the catalog the prophet wrote; the dumb-speaking is the second half of the Yeshayahu (Isaiah) 35 messianic-age credential.'),
  ('mark', 7, 35, 'matthew', 11, 5, 4, E'*The blind receive their sight, and the lame walk, the lepers are cleansed, and the deaf hear, the dead are raised up, and the poor have the gospel preached to them.* The King handed Yochanan''s (John''s) disciples the Yeshayahu (Isaiah) 35 catalog as the answer to *art thou he that should come?* — the Mark 7 ear-opening is the catalog walked into a single moment.'),
  ('mark', 7, 37, 'genesis', 1, 31, 5, E'*And were beyond measure astonished, saying, He hath done all things well: he maketh both the deaf to hear, and the dumb to speak.* The crowd''s verdict is also a creation-echo: *and Elohim (God) saw every thing that he had made, and, behold, it was very good.* The King''s healing is creation-restoration; the works of his hands undo the curse on the body the way the original works of his hands made the body.'),
  ('mark', 7, 37, 'isaiah', 35, 5, 6, E'*He maketh both the deaf to hear, and the dumb to speak* — the crowd''s framework-honoring verdict echoes the Yeshayahu (Isaiah) 35:5-6 messianic-age catalog without naming the prophet; the witnesses recognize the substance.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:ephphatha-be-opened-the-deaf-hearing-and-the-dumb-speaking-as-messianic-credential | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'ephphatha-be-opened-the-deaf-hearing-and-the-dumb-speaking-as-messianic-credential'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:ephphatha-be-opened-the-deaf-hearing-and-the-dumb-speaking-as-messianic-credential | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 6: feeding-of-the-four-thousand-on-the-eastern-shore-and-the-scattered-territory-bread (B.5, sort 1206)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'feeding-of-the-four-thousand-on-the-eastern-shore-and-the-scattered-territory-bread',
    E'Feeding of the four thousand on the eastern shore — bread for the scattered territory',
    E'*I have compassion on the multitude, because they have now been with me three days, and have nothing to eat: and if I send them away fasting to their own houses, they will faint by the way: for divers of them came from far* (Mark 8:2-3). The four-thousand feeding happens on the eastern shore, in the region of Decapolis where the King had returned after the Tyre / Sidon journey — the same eastern-tribal territory of the Gadarene man delivered in Mark 5. *Came from far* is scattered-seed language. The seven loaves, the seven baskets gathered up, the four thousand: a second feeding in a second territory, distinct from the five-loaves / twelve-baskets / five-thousand feeding on the western shore. The same Bread of Life multiplied to satisfy the scattered in their own land of dispersion, with the seven of completion answering the twelve of the tribes.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1206
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 8 AND sv.verse_number = 1
   AND ev.book_slug = 'mark' AND ev.chapter_number = 8 AND ev.verse_number = 9
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 8, 1, 'mark', 5, 1, 1, E'*I have compassion on the multitude... for divers of them came from far.* The four-thousand feeding happens on the eastern shore in the region of Decapolis the King returned to after the Tyre / Sidon journey — the same eastern-tribal territory of the Gadarene man delivered in Mark 5. The compassion that moved him at 6:34 toward sheep-without-a-shepherd in the west moves him now toward the same in the east.'),
  ('mark', 8, 1, 'mark', 7, 31, 2, E'*And again, departing from the coasts of Tyre and Sidon, he came unto the sea of Galilee, through the midst of the coasts of Decapolis.* The geography is named — the eastern-Decapolis territory the four-thousand feeding takes place in.'),
  ('mark', 8, 1, 'isaiah', 49, 12, 3, E'*Behold, these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim.* *Came from far* (Mark 8:3) is direct Yeshayahu (Isaiah) 49 scattered-seed language; the multitude on the eastern shore is the prophetic gathering in seed-form.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:feeding-of-the-four-thousand-on-the-eastern-shore-and-the-scattered-territory-bread | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'feeding-of-the-four-thousand-on-the-eastern-shore-and-the-scattered-territory-bread'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:feeding-of-the-four-thousand-on-the-eastern-shore-and-the-scattered-territory-bread | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 7: mark-8-leaven-of-the-pharisees-and-of-herod-as-conjoined-political-religious-corruption (B.6, sort 1207)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'mark-8-leaven-of-the-pharisees-and-of-herod-as-conjoined-political-religious-corruption',
    E'The leaven of the Pharisees and the leaven of Herod — religious and political corruption named in one breath',
    E'*And he charged them, saying, Take heed, beware of the leaven of the Pharisees, and of the leaven of Herod* (Mark 8:15). Mark alone records the *and of Herod* clause where Matthew 16:6 has only *of the Pharisees and of the Sadducees.* The pairing is the architecture: the religious system that voids Torah by tradition (the Pharisees — Mark 7:13) standing alongside the political system that beheaded the prophet for naming its sin (Herod — Mark 6:17-29). The same warning Paul gives Galatia about *a little leaven leaveneth the whole lump* (Galatians 5:9 / 1 Corinthians 5:6). The disciples reasoning *because we have no bread* (Mark 8:16) shows the King the warning had not landed; the two feedings he immediately recites back to them (vv.19-20) prove the bread is not the question — the leaven is.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1207
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 8 AND sv.verse_number = 15
   AND ev.book_slug = 'mark' AND ev.chapter_number = 8 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 6, 17, 'leviticus', 18, 16, 1, E'*For Herod himself had sent forth and laid hold upon John, and bound him in prison for Herodias'' sake, his brother Philip''s wife: for he had married her.* The leaven-of-Herod the King names at Mark 8:15 has its load-bearing example here: a political system whose marriage is contrary-to-Torah (Vayikra (Leviticus) 18:16 — *thou shalt not uncover the nakedness of thy brother''s wife*) silences the prophet who named the sin.'),
  ('mark', 6, 18, 'leviticus', 20, 21, 2, E'*For John had said unto Herod, It is not lawful for thee to have thy brother''s wife.* The Torah-contrary marriage (Vayikra (Leviticus) 20:21 — *if a man shall take his brother''s wife, it is an unclean thing*) is what Yochanan (John) reproved; the cost of speaking Torah to power lands on the prophet''s head.'),
  ('mark', 8, 15, 'mark', 6, 17, 3, E'*And he charged them, saying, Take heed, beware of the leaven of the Pharisees, and of the leaven of Herod.* Mark alone records the *and of Herod* clause where Matthew 16:6 reads *Pharisees and Sadducees.* The pairing is the architecture: the religious system that voids Torah by tradition (Mark 7:13) stands alongside the political system that beheaded the prophet for naming its sin (Mark 6:17-29). Same lump, two corruptions, named in one breath.'),
  ('mark', 8, 15, 'mark', 7, 13, 4, E'*Making the word of Elohim (God) of none effect through your tradition.* The leaven-of-the-Pharisees at Mark 8:15 is the same tradition-voids-Torah architecture the King named at Mark 7:13; the *and of Herod* clause adds the political-system corruption alongside.'),
  ('mark', 8, 15, '1-corinthians', 5, 6, 5, E'*A little leaven leaveneth the whole lump.* Paul carries forward the same leaven-as-corruption substance the King names; the Pharisaic religious system and the Herodian political system are two lumps under the same warning.'),
  ('mark', 8, 15, 'galatians', 5, 9, 6, E'*A little leaven leaveneth the whole lump.* Paul to Galatia echoes the same warning the King gives the disciples in the boat — leaven-as-corruption travels small and ruins large.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:mark-8-leaven-of-the-pharisees-and-of-herod-as-conjoined-political-religious-corruption | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'mark-8-leaven-of-the-pharisees-and-of-herod-as-conjoined-political-religious-corruption'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:mark-8-leaven-of-the-pharisees-and-of-herod-as-conjoined-political-religious-corruption | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 8: tehillim-110-1-davids-lord-formed-at-the-right-hand (C.1, sort 1208) — slug locked per Decision 2
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'tehillim-110-1-davids-lord-formed-at-the-right-hand',
    E'Tehillim (Psalm) 110:1 — David''s Lord, the Formed at the right hand of the Formless',
    E'*David himself said by the Ruach HaKodesh (Holy Spirit), Yahuah (the LORD) said to my Lord, Sit thou on my right hand* (Mark 12:36) — the King hands the Tehillim (Psalm) 110:1 architecture to the temple-crowd: David called the Messiah *Lord*, which means the Davidic-Son is more than a son. The Formless speaks to the Formed; the Formed sits at the Formless''s right hand. This is the Formed-cloud-rider self-disclosure delivered by Yahusha''s own mouth in the days before the cross.\n\n*Yahuah (the LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1) The Tanakh-anchor is unmistakable. The first *Lord* is YHWH speaking; the second *Lord* (Adonai) is the one David addresses as his Sovereign. The Markan disclosure is the Father speaking to the Son at his right hand — the same architecture Peter walks at Pentecost (*Yahuah (the LORD) said unto my Lord,* Acts 2:34), the same architecture Hebrews carries (*sit on my right hand, until I make thine enemies thy footstool,* Hebrews 1:13), the same architecture Paul carries (*for he must reign, till he hath put all enemies under his feet,* 1 Corinthians 15:25).\n\nThe 1 Enoch Parables witness the same throne-architecture. The Elect One''s name was named before the Head of Days (1 Enoch 48:2-3); the Elect One sits on the throne of glory beside the Ancient of Days (1 Enoch 45:3, 49:2-4, 61:8, 62:2-5). The seat at the right hand is the seat of the Formed expression at the side of the Formless source — not two competing gods, not a single person in two poses, but the Formless and the Formed in their eternal relation, made visible in the canon''s most quoted Tanakh verse.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1208
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 35
   AND ev.book_slug = 'mark' AND ev.chapter_number = 12 AND ev.verse_number = 37
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 12, 36, 'psalms', 110, 1, 1, E'*Yahuah (the LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* The Tanakh-anchor: YHWH speaks to David''s Lord; David addresses the second one as Lord (Adonai). The Markan citation puts the Father speaking to the Son at his right hand in David''s own mouth.'),
  ('mark', 12, 36, 'matthew', 22, 44, 2, E'The Matthean parallel to the Markan Davidic-Lord challenge — *Yahuah (the LORD) said unto my Lord, Sit thou on my right hand, till I make thine enemies thy footstool* — same Tehillim (Psalm) 110:1 citation, same Father-Son architecture in the temple-courts.'),
  ('mark', 12, 36, 'luke', 20, 42, 3, E'The Lukan parallel — *David himself saith in the book of Tehillim (Psalms), Yahuah (the LORD) said unto my Lord, Sit thou on my right hand* — the three-synoptic witness to the King''s own disclosure of the Tehillim (Psalm) 110:1 architecture.'),
  ('mark', 12, 36, 'acts', 2, 34, 4, E'Peter at Pentecost: *Yahuah (the LORD) said unto my Lord, Sit thou on my right hand, until I make thy foes thy footstool.* The apostolic preaching opens with the same Tehillim (Psalm) 110:1 quotation; the resurrection and ascension are read as the Father seating the Son at his right hand.'),
  ('mark', 12, 36, 'hebrews', 1, 13, 5, E'*Sit on my right hand, until I make thine enemies thy footstool.* The Hebrews-author carries the same Tehillim (Psalm) 110:1 quotation as the Father''s word to the Son — never spoken to any angel, only to the Son.'),
  ('mark', 12, 36, '1-corinthians', 15, 25, 6, E'*For he must reign, till he hath put all enemies under his feet.* Paul walks the same footstool-imagery; the reign-until-enemies-are-footstool is the Tehillim (Psalm) 110:1 architecture in Pauline form.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:tehillim-110-1-davids-lord-formed-at-the-right-hand | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
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
-- Thread 9: formed-as-the-only-good-and-the-formless-as-the-source (C.2, sort 1209)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'formed-as-the-only-good-and-the-formless-as-the-source',
    E'*Why callest thou me good* — the Formed pointing to the Formless source',
    E'Mark 10:17-22 / Matthew 19:16-22 / Luke 18:18-22''s *why callest thou me good? there is none good but one, that is, Elohim (God)* is a Formed-and-Formless disclosure of a kind no inherited reading handles cleanly. Christian commentary collapses it two ways: the Arian collapse (Yahusha disclaims deity) and the Trinitarian collapse (Yahusha is testing whether the questioner means it). The framework reads it as a third reading entirely — Yahusha pointing past the Formed (himself) to the Formless source (the Father) from which the Formed proceeds, the eternal-submission structure visible in the same moment the questioner is being directed toward the commandments.\n\nThe King is not disclaiming his own deity; he is naming his own derivation. *My Father is greater than I* (John 14:28). *The Son can do nothing of himself, but what he seeth the Father do* (John 5:19). *I can of mine own self do nothing... I seek not mine own will, but the will of the Father which hath sent me* (John 5:30). The Formed perpetually points to the Formless source as the one good in the unique-source sense; the Formed is Yahuah but the Formless is the originating source. Distinction without division.\n\n*Then cometh the end, when he shall have delivered up the kingdom to Elohim (God), even the Father... And when all things shall be subdued unto him, then shall the Son also himself be subject unto him that put all things under him, that Elohim (God) may be all in all* (1 Corinthians 15:24, 28). Paul names the same eternal-submission shape Mark 10:18 carries — the Son perpetually deferring to the Father, the Formed perpetually expressing the Formless source. Not a created being (which would be the Arian collapse); not a co-equal-second-person-in-spatial-arrangement (which would be the Trinitarian collapse); the Formed expression of the Formless source, eternally derived, eternally submitting.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1209
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND ev.book_slug = 'mark' AND ev.chapter_number = 10 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 10, 18, 'john', 14, 28, 1, E'*Why callest thou me good? there is none good but one, that is, Elohim (God).* The King is pointing past the Formed (himself) to the Formless source (the Father) from whom all good proceeds — the same eternal-submission structure he names elsewhere: *My Father is greater than I.*'),
  ('mark', 10, 18, 'john', 5, 19, 2, E'*The Son can do nothing of himself, but what he seeth the Father do.* The Formed acts in derivation from the Formless source; Mark 10:18''s Formed-pointing-to-Formless reading is the same eternal-submission structure.'),
  ('mark', 10, 18, 'john', 5, 30, 3, E'*I can of mine own self do nothing... I seek not mine own will, but the will of the Father which hath sent me.* The same Formed-pointing-to-Formless architecture in Yochanan (John)''s register — the Son deferring to the Father in every action.'),
  ('mark', 10, 18, 'matthew', 19, 17, 4, E'The Matthean parallel — *why callest thou me good? there is none good but one, that is, Elohim (God): but if thou wilt enter into life, keep the commandments.* The same Formed-pointing-to-Formless disclosure paired with the Torah-keeping commission; the two clauses lock each other against both Arian and antinomian collapses.'),
  ('mark', 10, 18, 'luke', 18, 19, 5, E'The Lukan parallel — *why callest thou me good? none is good, save one, that is, Elohim (God).* Three-synoptic witness to the same disclosure; the consistent reading rules out the *one-gospel-departs-from-the-other* readings of inherited commentary.'),
  ('mark', 10, 18, '1-corinthians', 15, 28, 6, E'*Then shall the Son also himself be subject unto him that put all things under him, that Elohim (God) may be all in all.* Paul names the eternal-submission shape Mark 10:18 carries — the Son perpetually deferring to the Father, the Formed perpetually expressing the Formless source.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:formed-as-the-only-good-and-the-formless-as-the-source | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'formed-as-the-only-good-and-the-formless-as-the-source'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:formed-as-the-only-good-and-the-formless-as-the-source | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 10: abomination-of-desolation-daniel-9-and-12-standing-where-it-ought-not (D.1, sort 1210)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'abomination-of-desolation-daniel-9-and-12-standing-where-it-ought-not',
    E'The abomination of desolation — Daniel 9 / 11 / 12 standing where it ought not',
    E'The King names Daniel by name and points his hearers back to Daniel''s *abomination-of-desolation* prophecy. *But when ye shall see the abomination of desolation, spoken of by Daniel the prophet, standing where it ought not, (let him that readeth understand,) then let them that be in Yahudah (Judaea) flee to the mountains* (Mark 13:14). Daniel 9:27, 11:31, and 12:11 carry the line forward; the prophetic chain holds — Daniel saw it, the King names it, the reader who reads Daniel hears the warning. The let-him-that-readeth-understand clause is the King''s own pointer to the Daniel-text; the Olivet disciples are sent to the prophet for the framework of what the King has just compressed into one phrase.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1210
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 14
   AND ev.book_slug = 'mark' AND ev.chapter_number = 13 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 13, 14, 'daniel', 9, 27, 1, E'*And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate.* The Daniel 9:27 abomination-of-desolation prophecy is the source-text the King is pointing to.'),
  ('mark', 13, 14, 'daniel', 11, 31, 2, E'*And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The Daniel 11:31 line carries the same architecture into the time-of-the-king-of-the-north register.'),
  ('mark', 13, 14, 'daniel', 12, 11, 3, E'*And from the time that the daily sacrifice shall be taken away, and the abomination that maketh desolate set up, there shall be a thousand two hundred and ninety days.* The Daniel 12:11 measurement-clause completes the prophetic chain — the abomination set up, the days counted, the appointed end reached.'),
  ('mark', 13, 14, 'matthew', 24, 15, 4, E'*When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand).* The Matthean parallel to the Markan Olivet warning; the synoptic witness anchors the same Daniel-text in two gospels.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:abomination-of-desolation-daniel-9-and-12-standing-where-it-ought-not | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'abomination-of-desolation-daniel-9-and-12-standing-where-it-ought-not'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:abomination-of-desolation-daniel-9-and-12-standing-where-it-ought-not | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 11: no-man-knoweth-the-day-not-the-son-but-the-father-formed-submitting-to-the-formless (D.2, sort 1211)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'no-man-knoweth-the-day-not-the-son-but-the-father-formed-submitting-to-the-formless',
    E'*Neither the Son, but the Father* — the Formed submitting to the Formless in the limitation of incarnation',
    E'The Father-Son distinction land-marks here. *But of that day and that hour knoweth no man, no, not the angels which are in heaven, neither the Son, but the Father* (Mark 13:32). The Formed Son in his incarnate submission carries what the Formless Father carries in unrestricted source; the timing of the day belongs to the Father, and the Son in his earthly walk holds it as withheld. This is not Arian (the Son is not a created being); it is not Trinitarian co-equal collapse (the Father is not on the same plane as the Son). It is the Formless and the Formed, in their eternal relationship, expressed in this verse with the Formed Son walking in the limitation he took up when he took on flesh.\n\nThe unity-side of the same grid lives at John 10:30 (*I and my Father are one*) and at the unity-thread. This thread carries the distinction-side. Both sides hold together — the framework''s Formless / Formed grid does not flatten one into the other. The Son who is one with the Father holds the timing of the day as the Father''s alone. The unity and the distinction sit together; that is the architecture the framework reads in every Father-Son passage across the canon.\n\n*My Father is greater than I* (John 14:28). *Of that day and that hour knoweth no man... neither the Son, but the Father.* The two verses lock each other into the same shape: the Formed eternally derives from and defers to the Formless source. After the resurrection, Acts 1:7 carries the same deference forward — *it is not for you to know the times or the seasons, which the Father hath put in his own power* — the appointed-hour belongs to the Formless source even as the resurrected-and-ascended Son names the architecture for the apostles.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1211
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 32
   AND ev.book_slug = 'mark' AND ev.chapter_number = 13 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 13, 32, 'matthew', 24, 36, 1, E'*But of that day and hour knoweth no man, no, not the angels of heaven, but my Father only.* The Matthean parallel to the Markan distinction-disclosure; the synoptic witness holds.'),
  ('mark', 13, 32, 'john', 14, 28, 2, E'*My Father is greater than I.* The unity-disclosure (John 10:30) and the distinction-disclosure (Mark 13:32 / John 14:28) sit together — Yochanan (John) carries both; the Formless / Formed grid holds both at once.'),
  ('mark', 13, 32, 'acts', 1, 7, 3, E'*It is not for you to know the times or the seasons, which the Father hath put in his own power.* After the resurrection the same architecture stands: the appointed-hour belongs to the Formless source; the Formed Son names the architecture for the apostles without claiming the timing as his own.'),
  ('mark', 13, 32, 'revelation', 1, 1, 4, E'*The Revelation of Yahusha (Jesus) HaMashiach (Christ), which Elohim (God) gave unto him.* The unveiling-of-the-end the Son carries is given to him by the Father; the same eternal-submission shape Mark 13:32 names runs forward to the final book of the canon.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:no-man-knoweth-the-day-not-the-son-but-the-father-formed-submitting-to-the-formless | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'no-man-knoweth-the-day-not-the-son-but-the-father-formed-submitting-to-the-formless'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:no-man-knoweth-the-day-not-the-son-but-the-father-formed-submitting-to-the-formless | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 12: abba-father-the-formed-son-naming-the-formless-in-aramaic-tenderness (D.3, sort 1212)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'abba-father-the-formed-son-naming-the-formless-in-aramaic-tenderness',
    E'*Abba, Father* — the Formed Son naming the Formless in Aramaic tenderness',
    E'The only verse in the gospels where the *Abba* Aramaic and the Greek *patēr* both appear in the King''s own mouth — the Formed Son in the garden naming the Formless Father in covenant-child language. *And he said, Abba, Father, all things are possible unto thee; take away this cup from me: nevertheless not what I will, but what thou wilt* (Mark 14:36). Gethsemane is the load-bearing instance — the Son in the garden, sweat as drops of blood, naming the Formless in the inheritance-tongue. The cup is the Father''s cup; the will is the Father''s will; the Son submits not as a slave but as a son who has heard his Father all his life.\n\nRomans 8:15 and Galatians 4:6 carry the same Aramaic-Greek doublet — *the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15); *the Spirit of his Son into your hearts, crying, Abba, Father* (Galatians 4:6). Paul reads the same doublet as the Spirit-witnessed cry of the seed-of-promise to the source. The framework reading: this is not the inclusion-gospel grammar of *the intimate father-child relationship now available to anyone who confesses faith.* This is the children-by-paternal-blood hearing the Shepherd''s voice and answering in their inheritance-tongue. The seed-of-promise scattered through the nations cries Abba in the garden alongside the Son who taught the cry, because the Spirit of his Son is in their hearts.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1212
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 36
   AND ev.book_slug = 'mark' AND ev.chapter_number = 14 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 14, 36, 'romans', 8, 15, 1, E'*Ye have received the Spirit of adoption, whereby we cry, Abba, Father.* Paul reads the Mark 14:36 Aramaic-Greek doublet forward into the seed-of-promise''s Spirit-witnessed cry; the children scattered through the nations call the Formless source by the name the Son named him.'),
  ('mark', 14, 36, 'galatians', 4, 6, 2, E'*And because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father.* The Galatian witness to the same Abba-Father doublet — the Spirit of the Son is the cry inside the seed-of-promise scattered through the nations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:abba-father-the-formed-son-naming-the-formless-in-aramaic-tenderness | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'abba-father-the-formed-son-naming-the-formless-in-aramaic-tenderness'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:abba-father-the-formed-son-naming-the-formless-in-aramaic-tenderness | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 13: barabbas-as-the-substituted-prisoner-and-the-prefiguring-of-the-substitutionary-lamb (D.4, sort 1213)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'barabbas-as-the-substituted-prisoner-and-the-prefiguring-of-the-substitutionary-lamb',
    E'Bar-abba released — the substituted prisoner and the prefiguring of the substitutionary Lamb',
    E'The Barabbas-substitution episode is in all four gospels and carries a substantial typology — *bar-abba* (son-of-the-father), the insurrectionist-murderer, released; the true Son of the Father bound and delivered to be crucified. *But the chief priests moved the people, that he should rather release Barabbas unto them. And Pilate answered and said again unto them, What will ye then that I shall do unto him whom ye call the King of the Yahudim (Jews)? And they cried out again, Crucify him* (Mark 15:11-13).\n\nThe substitutionary typology runs through the whole episode — the guilty released, the innocent bound, the system choosing the false son over the true one. *He is despised and rejected of men; a man of sorrows, and acquainted with grief... he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:3, 5). The Yom-Kippur blood-substance (Leviticus 16) carries the two-goats architecture — one goat for Yahuah, one goat for Azazel into the wilderness; Barabbas is the unworthy partner the worthy Son substitutes for, the prefiguring of the substantial Lamb in the Pesach (Passover) architecture.\n\nThe name itself preserves the irony: *bar-abba* means *son of the father.* The crowd, given the choice between two sons-of-the-father, releases the murderer and crucifies the true Son. The system that has been wearing the Father''s name throughout the prophets'' lifetimes finally exposes itself by choosing the wrong son when both are placed in front of it. Same architecture every Yom Kippur: one goat lives, one goat dies; one carries the sins out, one bears the blood. The Markan witness preserves the substitution in its starkest form.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1213
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 15 AND sv.verse_number = 6
   AND ev.book_slug = 'mark' AND ev.chapter_number = 15 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 15, 7, 'matthew', 27, 16, 1, E'*And they had then a notable prisoner, called Barabbas.* The Matthean witness names the notable-prisoner status of the man chosen for release; both gospels carry the same substitution architecture.'),
  ('mark', 15, 11, 'isaiah', 53, 5, 2, E'*But the chief priests moved the people, that he should rather release Barabbas unto them.* The guilty released, the innocent bound — Yeshayahu (Isaiah) 53''s *he was wounded for our transgressions, he was bruised for our iniquities* walked out in real time as the system makes the substitution explicit.'),
  ('mark', 15, 11, 'isaiah', 53, 6, 3, E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (the LORD) hath laid on him the iniquity of us all.* The substitution principle Yeshayahu (Isaiah) named is the substitution episode the crowd enacts — the iniquity of Barabbas (and the iniquity of the crowd) laid on the Son of the Father.'),
  ('mark', 15, 11, 'leviticus', 16, 21, 4, E'*And Aharon (Aaron) shall lay both his hands upon the head of the live goat, and confess over him all the iniquities of the children of Yashar''el (Israel)... putting them upon the head of the goat, and shall send him away.* The Yom-Kippur two-goats architecture — one goat for Yahuah, one goat for Azazel — the prefiguring of the Barabbas-substitution at the cross.'),
  ('mark', 15, 13, 'luke', 23, 18, 5, E'*Away with this man, and release unto us Barabbas.* The Lukan parallel to the Markan crowd-cry; the four-gospel witness to the substitution preserves the architecture across all four accounts.'),
  ('mark', 15, 15, 'john', 18, 40, 6, E'*Then cried they all again, saying, Not this man, but Barabbas. Now Barabbas was a robber.* The Yochanan (John) witness names Barabbas as a robber; the Markan witness names him as one *who had committed murder in the insurrection* (15:7). All four gospels preserve the substitution and its irony.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:barabbas-as-the-substituted-prisoner-and-the-prefiguring-of-the-substitutionary-lamb | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'barabbas-as-the-substituted-prisoner-and-the-prefiguring-of-the-substitutionary-lamb'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:barabbas-as-the-substituted-prisoner-and-the-prefiguring-of-the-substitutionary-lamb | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 14: eloi-eloi-and-the-elijah-misidentification-pattern (D.5, sort 1214)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'eloi-eloi-and-the-elijah-misidentification-pattern',
    E'*Eloi, Eloi* misheard as *Elias* — the crowd''s deafness to the Tehillim 22 citation at the cross',
    E'The bystanders mishearing *Eloi* as *Elias* — the Markan and Matthean witnesses to the misidentification at the cross, the crowd''s deafness to the Tehillim 22 citation. *And some of them that stood by, when they heard it, said, Behold, he calleth Elias. And one ran and filled a spunge full of vinegar, and put it on a reed, and gave him to drink, saying, Let alone; let us see whether Elias will come to take him down* (Mark 15:35-36).\n\nThe very figure they expect to come and rescue (the Eliyahu (Elijah)-pattern precursor) had already come in Yochanan (John), and the King had already named him as such — *Eliyahu (Elijah) is indeed come, and they have done unto him whatsoever they listed* (Mark 9:13). The crowd is asking whether the prophet who already came (and was beheaded by the very Herod-system that delivered the King over) will return to rescue. The cosmic irony lands at every layer: they cannot hear the Tehillim (Psalm) 22 citation the King is speaking, they cannot recognize that the Eliyahu they wait for has already walked through the wilderness in front of the Lamb, they cannot read the appointed-hour they are inside of. Malachi 4:5-6''s *I will send you Eliyahu (Elijah) the prophet before the coming of the great and dreadful day of Yahuah (the LORD)* runs through the moment: the great and dreadful day has come, and the Eliyahu has already done his work, and the crowd at the foot of the cross is still waiting for him.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1214
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 15 AND sv.verse_number = 35
   AND ev.book_slug = 'mark' AND ev.chapter_number = 15 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 15, 35, 'matthew', 27, 47, 1, E'*Some of them that stood there, when they heard that, said, This man calleth for Elias.* The Matthean parallel to the Markan misidentification — the synoptic witness preserves the crowd''s deafness at the cross.'),
  ('mark', 15, 35, 'mark', 9, 13, 2, E'*Behold, he calleth Elias.* The very figure they expect to come and rescue had already come in Yochanan (John), and the King had already named him as such: *Eliyahu (Elijah) is indeed come, and they have done unto him whatsoever they listed.* The cosmic irony lands at the cross — the Eliyahu they wait for has already walked through.'),
  ('mark', 15, 36, 'malachi', 4, 5, 3, E'*Let alone; let us see whether Elias will come to take him down.* Malachi''s *I will send you Eliyahu (Elijah) the prophet before the coming of the great and dreadful day of Yahuah (the LORD)* runs through the moment: the great and dreadful day has come, and the Eliyahu has already done his work.'),
  ('mark', 15, 36, 'malachi', 4, 6, 4, E'*And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* The Eliyahu the crowd waits for had already turned hearts in Yochanan (John); the crowd that expects rescue cannot read what has already happened.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:eloi-eloi-and-the-elijah-misidentification-pattern | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'eloi-eloi-and-the-elijah-misidentification-pattern'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:eloi-eloi-and-the-elijah-misidentification-pattern | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 15: the-longer-ending-of-mark-and-the-disputed-textual-witness (D.6, sort 1215)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-longer-ending-of-mark-and-the-disputed-textual-witness',
    E'The longer ending of Mark — resurrection appearances, baptism formula, and the disputed textual witness',
    E'Mark 16:9-20 is the textually-disputed longer ending of the gospel. The earliest Greek codices (Sinaiticus, Vaticanus) end Mark at 16:8 with the women fleeing the tomb afraid; later witnesses carry the longer ending with the resurrection appearances, the Great Commission echo, the baptism formula, and the signs-following-them-that-believe catalog. This thread treats the longer ending as canon for the cross-reference work while flagging the textual situation honestly.\n\n*Now when Yahusha (Jesus) was risen early the first day of the week, he appeared first to Mary Magdalene, out of whom he had cast seven devils* (Mark 16:9). The first appearance to Mary Magdalene matches Yochanan (John) 20:11-18 in detail. *After that he appeared in another form unto two of them, as they walked, and went into the country* (Mark 16:12) — the Emmaus-pattern Luke 24:13-35 expands. *Afterward he appeared unto the eleven as they sat at meat* (Mark 16:14) — the Galilean appearance the Matthean Great Commission carries forward. *Go ye into all the world, and preach the gospel to every creature. He that believeth and is baptized shall be saved* (Mark 16:15-16) — the Markan Great Commission paired with the baptism-formula the Matthean carries in trinitarian register. *And these signs shall follow them that believe; In my name shall they cast out devils; they shall speak with new tongues; They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover* (Mark 16:17-18) — the signs-list the apostolic witness fulfills across Acts.\n\nThe ascension closes the longer ending: *So then after the Lord had spoken unto them, he was received up into heaven, and sat on the right hand of Elohim (God). And they went forth, and preached every where, the Lord working with them, and confirming the word with signs following. Amen* (Mark 16:19-20). The Tehillim (Psalm) 110:1 right-hand session is named explicitly; the Lord-working-with-them carries forward into the apostolic walking the gospel into all the territories of the scattered seed.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1215
  FROM _s183_mark_lookup sv, _s183_mark_lookup ev
 WHERE sv.book_slug = 'mark' AND sv.chapter_number = 16 AND sv.verse_number = 9
   AND ev.book_slug = 'mark' AND ev.chapter_number = 16 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 16, 9, 'john', 20, 17, 1, E'*Now when Yahusha (Jesus) was risen early the first day of the week, he appeared first to Mary Magdalene, out of whom he had cast seven devils.* The Yochanan (John) parallel narrates the same first-appearance to Mary in fuller detail.'),
  ('mark', 16, 9, 'luke', 8, 2, 2, E'*Mary called Magdalene, out of whom went seven devils* — the Lukan note on Mary''s deliverance pairs with the Markan longer-ending''s naming of her as the first witness of the resurrection.'),
  ('mark', 16, 12, 'luke', 24, 13, 3, E'*After that he appeared in another form unto two of them, as they walked, and went into the country.* The Lukan Emmaus narrative expands what Mark compresses — two disciples walking, the King appearing in another form, the recognition delayed until the breaking of bread.'),
  ('mark', 16, 17, 'acts', 2, 4, 4, E'*They shall speak with new tongues.* The Pentecost-tongues of Acts 2:4 fulfill the signs-list of the Markan longer ending; the apostolic witness walks the catalog.'),
  ('mark', 16, 17, 'luke', 10, 19, 5, E'*Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy.* The Lukan witness pairs with the Markan signs-list — the authority over serpents-and-deadly-things is the King''s own assignment to those who walk in his name.'),
  ('mark', 16, 18, 'acts', 28, 5, 6, E'*And he shook off the beast into the fire, and felt no harm.* Paul shaking off the viper at Melita walks the *they shall take up serpents* clause of the longer ending into the apostolic record.'),
  ('mark', 16, 19, 'psalms', 110, 1, 7, E'*He was received up into heaven, and sat on the right hand of Elohim (God).* The Tehillim (Psalm) 110:1 right-hand session is named explicitly — the Sanhedrin-trial answer (*ye shall see the Son of Adam sitting on the right hand of power,* Mark 14:62) walks into fulfillment at the ascension.'),
  ('mark', 16, 19, 'acts', 1, 9, 8, E'*And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight.* The Acts witness to the ascension carries the same architecture the Markan longer ending names — the Son received up into heaven.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-longer-ending-of-mark-and-the-disputed-textual-witness | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-longer-ending-of-mark-and-the-disputed-textual-witness'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-longer-ending-of-mark-and-the-disputed-textual-witness | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- A.2 REROUTE — Mark 3:23-27 attaches to existing
-- `binding-of-the-watchers-typological-anchor-for-binding-the-strong-man`
-- (the proposed NEW `divided-house...` thread was REJECTED per S183-V;
-- the existing thread already has 3 members anchored at Matthew 12:29 via
-- session142_matt_12_extras_cross_references.sql)
-- =====================================================================
WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('mark', 3, 23, 'matthew', 12, 26, 1, E'*How can Satan cast out Satan?... If Satan rise up against himself, and be divided, he cannot stand, but hath an end* (Mark 3:23-26). The divided-house diagnostic refuses the Beelzebub-accusation by exposing its incoherence; the Markan parallel to Matthew 12:26 walks the same logic before the binding-of-the-strong-man verdict.'),
  ('mark', 3, 27, 'matthew', 12, 29, 2, E'*No man can enter into a strong man''s house, and spoil his goods, except he will first bind the strong man; and then he will spoil his house.* The Markan parallel to Matthew 12:29''s binding-of-the-strong-man — the same architecture, 1 Enoch 10''s chaining of Azazel hand-and-foot and Jubilees 10''s binding of nine-tenths of the malignant spirits underlying both gospel-witnesses. The King''s ministry is the incursion that binds the strong-man so the captives can be released.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:binding-of-the-watchers-typological-anchor-for-binding-the-strong-man | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       3 + ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                       tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'binding-of-the-watchers-typological-anchor-for-binding-the-strong-man'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:binding-of-the-watchers-typological-anchor-for-binding-the-strong-man | %'
   AND sb.slug = 'mark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- BULK MEMBER-ADDITIONS TO EXISTING THREADS
-- =====================================================================
-- The drafter files identified ~131 additional Mark verse → target-verse
-- pairs whose thread_slug is an existing (non-S183-NEW) thread. Each
-- row below carries (thread_slug, mark_ch, mark_v, target_book, target_ch,
-- target_v, member_note). Per S181 discipline, extras-edition targets
-- (1 Enoch, Jubilees, etc.) are NOT inserted here — only canon-edition
-- targets resolve via `_s183_mark_lookup`. The framework reading quotes
-- the extras inline within member_note for the reader's eye, even when
-- the cross_reference row points to a canon target.
-- =====================================================================

WITH input(thread_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, member_note) AS (VALUES
  -- ===== Mark 1 =====
  ('gospel-promised-afore', 1, 1, 'romans', 1, 1, E'Mark opens with *the beginning of the gospel of Yahusha HaMashiach (Jesus Christ), the Son of Elohim (God)* — naming the gospel Paul says was *promised afore by his prophets in the holy scriptures, concerning his Son.* The gospel does not begin at Mark 1:1; Mark 1:1 is the *beginning* of the documented account of a gospel the prophets had been carrying for centuries.'),
  ('fulfill-as-prophecy-bringing-to-pass', 1, 2, 'malachi', 3, 1, E'Mark cites Mal''aki (Malachi) 3:1 — *Behold, I will send my messenger, and he shall prepare the way before me* — applying the messenger-prophecy to Yochanan (John). The Yahuah (Lord) *coming to his temple* of Mal''aki 3:1 is the same one whose paths Yochanan is preparing in Mark 1:3, naming Yahusha (Jesus) as Yahuah-coming-to-the-temple.'),
  ('yochanan-as-eliyahu-pattern-prophet', 1, 3, 'isaiah', 40, 3, E'The *voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord)* takes Yeshayahu (Isaiah) 40:3''s herald-of-Yahuah-coming-to-the-scattered and lands it on Yochanan (John). The Eliyahu (Elijah)-pattern prophet prepares the heart of the wilderness for the arrival of the King.'),
  ('yochanan-as-eliyahu-pattern-prophet', 1, 3, 'malachi', 4, 5, E'*Behold, I will send you Eliyahu (Elijah) the prophet before the coming of the great and dreadful day of Yahuah (the LORD).* The Eliyahu-pattern prophecy lands on Yochanan (John); the King names him explicitly as such at Mark 9:13.'),
  ('fulfill-as-prophecy-bringing-to-pass', 1, 8, 'joel', 2, 28, E'Yochanan (John) announces *he shall baptize you with the Ruach HaKodesh (Holy Spirit)* — the prophetic gift-of-Spirit Yo''el (Joel) named: *I will pour out my spirit upon all flesh.*'),
  ('fulfill-as-prophecy-bringing-to-pass', 1, 8, 'ezekiel', 36, 27, E'The Ruach-baptism the King brings is the Spirit-causing-Torah-keeping Yechezk''el (Ezekiel) framed — *I will put my spirit within you, and cause you to walk in my statutes.* The water-baptism Yochanan offered points forward to the Ruach-baptism the King brings.'),
  ('father-voice-naming-the-son-of-adam-at-the-investiture', 1, 11, 'psalms', 2, 7, E'The Father''s voice at the baptism — *Thou art my beloved Son, in whom I am well pleased* — echoes Tehillim (Psalm) 2:7''s enthronement-decree: *Thou art my Son; this day have I begotten thee.* The Formless naming the Formed at the moment of the public ministry''s beginning.'),
  ('father-voice-naming-the-son-of-adam-at-the-investiture', 1, 11, 'isaiah', 42, 1, E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth.* The Yeshayahu (Isaiah) 42:1 election-of-the-Servant carried into the Father''s voice at the Yarden (Jordan).'),
  ('gather-together-in-one-the-children-scattered-abroad', 1, 14, 'joshua', 19, 10, E'*Yahusha (Jesus) came into Galilee, preaching the gospel of the kingdom of Elohim (God).* Galilee was the territory of the scattered northern tribes — Naphtali, Zebulun, Asher (Yehoshua/Joshua 19) — and the gospel of the kingdom is announced first to the geography of the scattered seed.'),
  ('fulfill-as-prophecy-bringing-to-pass', 1, 15, 'daniel', 2, 44, E'*The time is fulfilled, and the kingdom of Elohim (God) is at hand.* Mark 1:15''s *time is fulfilled* maps onto Daniyel (Daniel) 2:44''s *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed.*'),
  ('fulfill-as-prophecy-bringing-to-pass', 1, 15, 'daniel', 9, 25, E'Daniyel (Daniel) 9:25-26''s seventy-weeks-from-the-going-forth-of-the-commandment-to-restore reaching its appointed hour; the King is naming the Father''s appointed clock as having struck.'),
  ('scattered-seed-gathering', 1, 17, 'jeremiah', 16, 16, E'*Come ye after me, and I will make you to become fishers of men.* The fishers-of-men commission picks up Yirmeyahu (Jeremiah) 16:16 directly — *Behold, I will send for many fishers, saith Yahuah (the LORD), and they shall fish them.* The four men by the sea of Galilee are being commissioned into the prophetic gathering-architecture.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 1, 22, 'mark', 7, 13, E'*He taught them as one that had authority, and not as the scribes.* The scribes taught by appeal to the chain of tradition Mark 7:13 names as the Pharisaic voiding of Torah — *making the word of Yahuah (God) of none effect through your tradition.* The King teaches with the authority of the Word himself.'),
  ('lost-sheep-mission-scope', 1, 38, 'matthew', 15, 24, E'*Let us go into the next towns, that I may preach there also: for therefore came I forth.* The *therefore came I forth* statement names the mission-scope as the gathering-of-the-lost-sheep Matthew 15:24 articulates directly — *I am not sent but unto the lost sheep of the house of Yashar''el (Israel).*'),
  ('lost-sheep-mission-scope', 1, 38, 'ezekiel', 34, 11, E'*I myself, even I, will both search my sheep, and seek them out.* The next-towns expansion is going where the sheep are; Yechezk''el (Ezekiel) 34''s shepherd-prophecy is the substance the King walks.'),
  ('messiah-as-torah-affirming-healer', 1, 40, 'leviticus', 14, 2, E'The leper''s cleansing leads directly to the Torah-affirming closure of Mark 1:44 — *shew thyself to the priest, and offer for thy cleansing those things which Mosheh (Moses) commanded.* The King''s healing does not abolish the Vayikra (Leviticus) 14 cleansing-protocol; it sends the healed man into it.'),
  ('messiah-as-torah-affirming-healer', 1, 44, 'leviticus', 14, 2, E'*Offer for thy cleansing those things which Mosheh (Moses) commanded, for a testimony unto them.* The King hands the cleansed leper into the Vayikra (Leviticus) 14 priestly protocol intact — Torah remains the testimony, not the thing-abolished.'),
  -- ===== Mark 2 =====
  ('son-of-adam-as-judge-and-ladder', 2, 5, 'daniel', 7, 13, E'*Son, thy sins be forgiven thee.* The Son of Adam forgiving sins on earth is the Daniyel (Daniel) 7:13-14 enthronement-authority exercised in the room — the dominion-and-glory-and-kingdom given to the *like the Son of Adam* coming-with-the-clouds.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 2, 7, 'isaiah', 43, 25, E'*Who can forgive sins but Elohim (God) only?* The scribes'' question states the framework''s diagnostic: the prerogative of sin-forgiveness belongs to Yahuah alone — *I, even I, am he that blotteth out thy transgressions for mine own sake.* The King''s exercise of that prerogative is the Formed one''s self-identification.'),
  ('son-of-adam-as-judge-and-ladder', 2, 10, 'daniel', 7, 13, E'*The Son of Adam hath power on earth to forgive sins.* The Daniyel (Daniel) 7 title is named explicitly — the one to whom the dominion was given, exercising that dominion in the room. The *on earth* localizes the heavenly enthronement of Daniyel 7:14 into the present moment.'),
  ('lost-sheep-mission-scope', 2, 14, 'ezekiel', 34, 16, E'*Follow me. And he arose and followed him.* Levi the publican at the receipt of custom is the kind of *sinner* the Pharisaic system had excluded — and the King calls him into the gathering-architecture. Yechezk''el (Ezekiel) 34:16''s *I will seek that which was lost, and bring again that which was driven away* is the Father''s voice in flesh going where the lost sheep sit.'),
  ('lost-sheep-mission-scope', 2, 17, 'ezekiel', 34, 4, E'*I came not to call the righteous, but sinners to repentance.* The mission scope is named in the same shape as Matthew 9:13 — the physician goes to the sick, the shepherd goes to the lost. Yechezk''el (Ezekiel) 34:4''s indictment of the shepherds who *strengthened not the diseased, neither healed that which was sick* names the failure the King is reversing in real time.'),
  ('bridegroom-messianic-identification', 2, 19, 'hosea', 2, 19, E'*Can the children of the bridechamber fast, while the bridegroom is with them?* The bridegroom self-identification ties Mark 2:19 into Hoshea (Hosea) 2:19-20''s *I will betroth thee unto me for ever.*'),
  ('bridegroom-messianic-identification', 2, 19, 'isaiah', 62, 5, E'*As the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* The Yahuah-as-husband-of-Yashar''el (Israel) substance the prophets carry is the Son''s claim in the room.'),
  ('new-heart', 2, 21, 'jeremiah', 31, 31, E'The new cloth on the old garment and the new wine in old wineskins name the Yirmeyahu (Jeremiah) 31:31-33 new-covenant grammar — *I will put my law in their inward parts, and write it in their hearts.* The new wine is not new-Torah; it is the same Torah relocated from stone-tablet-outside to heart-inside.'),
  ('new-heart', 2, 22, 'ezekiel', 36, 26, E'The old wineskin is the flesh-credential heart that cannot hold the Spirit-poured-out; the new wineskin is the Yechezk''el (Ezekiel) 36:26 *heart of flesh.*'),
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 2, 23, 'leviticus', 19, 9, E'*Behold, why do they on the sabbath day that which is not lawful?* The accusation is built on the Pharisaic fence — the tradition that named gleaning-as-you-walked as harvest-labor. The Torah of Vayikra (Leviticus) 19:9-10 explicitly preserved field-gleanings for the hungry; nothing in Torah forbade what the disciples did.'),
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 2, 23, 'deuteronomy', 23, 25, E'*When thou comest into the standing corn of thy neighbour, then thou mayest pluck the ears with thine hand.* Devarim (Deuteronomy) 23:25 explicitly permits what the disciples did; the accusation is fence-not-Torah.'),
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 2, 25, '1-samuel', 21, 1, E'The King answers with the David-at-Nob precedent — David and his men eating the shewbread when in need, and Yahuah''s house preserving the man over the ritual. The pattern is the same: mercy and life take precedence over the fence the system built around the rite.'),
  ('heart-torah-not-abolition', 2, 27, 'genesis', 2, 2, E'*The sabbath was made for man, and not man for the sabbath.* The Sabbath is the gift from the seventh-day rest of creation (Bereshit/Genesis 2:2-3) — given for man''s sake, written into the order of creation before any tribe was named. The verse does not abolish the Sabbath; it returns the Sabbath to its given purpose against the Pharisaic burden.'),
  ('heart-torah-not-abolition', 2, 27, 'exodus', 20, 8, E'*Remember the sabbath day, to keep it holy.* The Sinai-commandment standing under the Mark 2:27 saying; the day is the Father''s gift, not the Pharisees'' burden.'),
  ('son-of-adam-as-judge-and-ladder', 2, 28, 'daniel', 7, 13, E'*Therefore the Son of Adam is Yahuah (Lord) also of the sabbath.* The Daniyel (Daniel) 7 title carrying the *Yahuah even of the sabbath* claim — the Formed one naming himself as the one who gave the day at Bereshit (Genesis) 2 and at Sinai.'),
  -- ===== Mark 3 =====
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 3, 1, 'exodus', 20, 8, E'The withered-hand healing on the Sabbath asks *Is it lawful to do good on the sabbath days, or to do evil? to save life, or to kill?* and exposes the Pharisaic fence that called healing-on-the-Sabbath unlawful while leaving the man broken. The Torah''s Sabbath-command protects life and rest; the fence inverted the command into the prohibition of mercy.'),
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 3, 1, 'deuteronomy', 5, 12, E'*Keep the sabbath day to sanctify it.* The Devarim (Deuteronomy) re-naming of the Sabbath-commandment carries the same heart-of-Torah substance the King recovers against the Pharisaic fence.'),
  ('pharisaic-sadducean-system-as-judaizer-predecessor', 3, 6, 'john', 11, 47, E'*The Pharisees went forth, and straightway took counsel with the Herodians against him.* The Pharisee-Herodian alliance foreshadows the same flesh-credential-system-plus-political-power architecture the Galatian agitators and modern institutional Christianity both rest on.'),
  ('scattered-seed-gathering', 3, 7, 'ezekiel', 34, 13, E'The geography of Mark 3:7-8 is the gathering-map laid bare — *Galilee... Yahudah (Judaea)... Yerushalayim (Jerusalem)... Idumaea... beyond Yarden (Jordan)... Tyre and Sidon.* The Yechezk''el (Ezekiel) 34:13 *I will bring them out from the people, and gather them from the countries* is being shown in Mark 3.'),
  ('scattered-seed-gathering', 3, 8, 'isaiah', 11, 11, E'*He shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel).* Yeshayahu (Isaiah) 11:11-12''s gathering of the outcasts walks into the geography of Mark 3:7-8.'),
  ('twelve-apostles-twelve-tribes-restoration-architecture', 3, 14, 'ezekiel', 37, 15, E'*He ordained twelve, that they should be with him.* The number twelve is not coincidence; the twelve apostles correspond to the twelve tribes of the prophesied restoration (Yechezk''el (Ezekiel) 37:15-22''s two-sticks-becoming-one).'),
  ('twelve-apostles-twelve-tribes-restoration-architecture', 3, 14, 'revelation', 21, 12, E'*The wall of the city had twelve foundations, and in them the names of the twelve apostles of the Lamb.* The Revelation 21 New-Yerushalayim architecture names twelve foundations for the twelve apostles, twelve gates for the twelve tribes — the same architecture Mark 3:14 inaugurates.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 3, 22, 'mark', 7, 13, E'*The scribes which came down from Yerushalayim (Jerusalem) said, He hath Beelzebub.* The same Pharisaic system that voided Torah by tradition (Mark 7:13) now ascribes the Spirit-work to the unclean spirit.'),
  ('blasphemy-against-the-ruach-warning', 3, 28, '1-john', 5, 16, E'*He that shall blaspheme against the Ruach HaKodesh (Holy Spirit) hath never forgiveness.* The warning fits 1 Yochanan (John) 5:16-17''s *there is a sin unto death* — the hardened disposition that calls the Spirit-work unclean. The mercy is wide; the deliberate calling-of-the-Spirit-unclean is the door closing from the inside.'),
  ('kinship-redefinition-kingdom-family', 3, 33, 'hosea', 1, 10, E'*Whosoever shall do the will of Elohim (God), the same is my brother, and my sister, and mother.* The kingdom-family is defined by doing-the-Father''s-will, not by paternal blood claim alone. The kinship-redefinition is the post-Lo-Ammi naming Hoshea (Hosea) 1:10 promised — *ye are the sons of the living Elohim (God).*'),
  ('kinship-redefinition-kingdom-family', 3, 35, 'matthew', 7, 21, E'*Not every one that saith unto me, Lord, Lord, shall enter into the kingdom of heaven; but he that doeth the will of my Father.* The Matthean parallel of the doing-the-will-as-kingdom-membership architecture; same heart-Torah substance.'),
  -- ===== Mark 4 =====
  ('scattered-seed-gathering', 4, 1, 'ezekiel', 34, 13, E'*There was gathered unto him a great multitude.* The gathering-by-the-sea is the in-time enactment of Yechezk''el (Ezekiel) 34:13''s *I will bring them out from the people, and gather them from the countries.*'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 4, 3, 'john', 10, 26, E'The sower''s seed falling on four ground-types is the cause-and-effect-of-hearing architecture — the seed is the same in every case (the Word); the difference is the ground. Yochanan (John) 10:26-27''s *they believe not, because they are not of my sheep... my sheep hear my voice* names the same diagnostic the parable enacts.'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 4, 11, 'isaiah', 6, 9, E'*That seeing they may see, and not perceive.* Mark 4:11-12 cites Yeshayahu (Isaiah) 6:9-10 directly — *Hear ye indeed, but understand not; and see ye indeed, but perceive not.* The hearing-reveals-the-sheep architecture is named at Yeshayahu''s commissioning and lived out in Mark.'),
  ('wheat-and-tares-the-post-harvest-sifting-architecture', 4, 14, 'matthew', 13, 18, E'The four soils are not four salvation-stages but four reveal-patterns. The good ground bringing forth fruit names the wheat that survives both the harvest-separation (Matthew 13:30) and the post-harvest sifting.'),
  ('wheat-and-tares-the-post-harvest-sifting-architecture', 4, 14, 'ezekiel', 20, 37, E'*I will cause you to pass under the rod, and I will bring you into the bond of the covenant: and I will purge out from among you the rebels.* The post-harvest sifting Yechezk''el (Ezekiel) names is the architecture the soils-parable enacts.'),
  ('grace-and-the-opportunity-that-can-be-lost', 4, 17, 'hebrews', 6, 4, E'*They have no root in themselves, and so endure but for a time.* The stony-ground hearer received the Word with gladness and did not endure — naming the same warning Hebrews 6:4-6 carries. The gift was real; the persistence was not. The opportunity that can be lost is the post-Reformation truncation''s missing clause.'),
  ('grace-and-the-opportunity-that-can-be-lost', 4, 19, '1-timothy', 6, 9, E'*The cares of this world, and the deceitfulness of riches... choke the word.* The thorny-ground hearer''s loss matches 1 Timothy 6:9-10''s *they that will be rich fall into temptation and a snare.*'),
  ('i-know-thy-works-and-names-blotted-out', 4, 22, 'ecclesiastes', 12, 14, E'*There is nothing hid, which shall not be manifested.* The manifestation-at-the-end pattern names what Ecclesiastes 12:14 names — *for Elohim (God) shall bring every work into judgment, with every secret thing.*'),
  ('effort-over-accomplishment', 4, 24, 'proverbs', 24, 16, E'*With what measure ye mete, it shall be measured to you: and unto you that hear shall more be given.* The hearing-leads-to-more-hearing pattern is the effort-over-accomplishment substance — *a just man falleth seven times, and riseth up again* (Mishlei/Proverbs 24:16).'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 4, 25, 'revelation', 13, 8, E'*He that hath, to him shall be given.* Names get blotted out from the wheat; the tares never had names to begin with (Revelation 13:8 / 17:8 — *whose names are not written in the book of life of the Lamb slain from the foundation of the world*).'),
  ('gather-together-in-one-the-children-scattered-abroad', 4, 30, 'ezekiel', 17, 22, E'*The fowls of the air may lodge under the shadow of it.* The mustard-seed parable picks up Yechezk''el (Ezekiel) 17:22-23, where the great tree shelters the birds-of-every-wing. The kingdom-tree gathers in the scattered.'),
  ('gather-together-in-one-the-children-scattered-abroad', 4, 32, 'daniel', 4, 10, E'*The fowls of the air may lodge under the shadow of it.* The Daniyel (Daniel) 4:10-12 great-tree imagery that shelters the birds is the same architecture the mustard-seed parable walks — the small beginning becomes the sheltering canopy.'),
  ('walking-on-the-sea-formed-cloud-rider', 4, 35, 'psalms', 89, 9, E'The wind-and-sea-stilling of Mark 4:35-41 is the Yahuah-prerogative Tehillim (Psalm) 89:9 names — *Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them.*'),
  ('walking-on-the-sea-formed-cloud-rider', 4, 39, 'psalms', 107, 29, E'*He maketh the storm a calm, so that the waves thereof are still.* The Tehillim (Psalm) 107:29 sea-mastery is the substance the King carries in flesh.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 4, 39, 'job', 38, 8, E'*Peace, be still.* The rebuking-the-sea move is the Yahuah-self-identification — Iyov (Job) 38:8-11''s *Who shut up the sea with doors... and said, Hitherto shalt thou come, but no further.* The same voice that gave the sea its bounds at creation now gives it the same word on the deck.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 4, 41, 'habakkuk', 3, 8, E'*What manner of man is this, that even the wind and the sea obey him?* The disciples'' question rehearses the framework''s central identification: the one in the boat is the one Habaqquq (Habakkuk) 3:8 named — *thou didst ride upon thine horses and thy chariots of salvation.*'),
  -- ===== Mark 5 =====
  ('nature-of-god-formed-in-flesh', 5, 7, 'james', 2, 19, E'*Son of the El Elyon (most high God)* — the unclean spirit names what the religious leaders refused to name. The demons confess; the elders do not. *The devils also believe, and tremble* (James 2:19).'),
  ('nature-of-god-formed-in-flesh', 5, 7, 'genesis', 14, 18, E'*Son of the El Elyon* — the same Most-High naming the Melek-Tsadiq (Melchizedek) encounter at Bereshit (Genesis) 14:18-20 attached to. The Formed-in-flesh stands in front of the Watcher-rebellion administration that has held the man bound.'),
  ('son-of-david-messianic-recognition-by-marginalized', 5, 23, 'matthew', 9, 18, E'*My little daughter lieth at the point of death... come and lay thy hands on her, that she may be healed.* Jairus the ruler of the synagogue falls at the King''s feet — the synagogue official kneels in front of the One the system would shortly reject. The recognition crosses the line from marginalized to magistrate; the desperation is the same.'),
  ('son-of-david-messianic-recognition-by-marginalized', 5, 23, 'luke', 8, 41, E'The Lukan parallel of the synagogue-ruler''s desperation at Mark 5:23; the recognition-by-marginalized broadened to include desperation-from-magistrate.'),
  ('messiah-as-torah-affirming-healer', 5, 25, 'leviticus', 15, 25, E'*A certain woman, which had an issue of blood twelve years.* Vayikra (Leviticus) 15:25-30 names the woman''s flow as continually unclean — barred from synagogue, barred from contact, barred from worship. The Torah-defined uncleanness does not flow into the King when she touches the hem; cleanness flows out of him into her.'),
  ('messiah-as-torah-affirming-healer', 5, 25, 'numbers', 15, 38, E'*Behind, and touched his garment.* The fringe she reaches for is the Bamidbar (Numbers) 15:38-39 tzitzit of the King''s prayer-shawl — the Torah''s appointed reminder-fringe.'),
  ('messiah-as-torah-affirming-healer', 5, 25, 'jeremiah', 23, 6, E'The Torah''s clean / unclean architecture is fulfilled by a cleansing the Torah pointed toward — *and his name shall be called Yahuah-Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Yirmeyahu/Jeremiah 23:6).'),
  ('just-shall-live-by-his-faithfulness', 5, 34, 'habakkuk', 2, 4, E'*Daughter, thy faith hath made thee whole.* *Daughter* is the King naming her in the seed-of-promise. Her *emunah* (covenant trust) was the walking-out; the King names it explicitly. Trust in the Formed-in-flesh is the same trust Chavaqquq (Habakkuk) 2:4 named — *the just shall live by his faithfulness.*'),
  ('just-shall-live-by-his-faithfulness', 5, 34, 'psalms', 27, 13, E'*I had fainted, unless I had believed to see the goodness of Yahuah (the LORD) in the land of the living* — the Tehillim (Psalm) 27:13-14 trust-architecture the King is honoring in the woman.'),
  ('just-shall-live-by-his-faithfulness', 5, 34, 'isaiah', 7, 9, E'*If ye will not believe, surely ye shall not be established* — Yeshayahu (Isaiah) 7:9''s emunah-architecture in compressed form.'),
  ('just-shall-live-by-his-faithfulness', 5, 36, 'psalms', 27, 13, E'*Be not afraid, only believe.* The same charge of emunah given to the synagogue ruler now hearing his daughter is dead; the King hands him exactly what the woman was just commended for.'),
  -- ===== Mark 6 =====
  ('born-not-of-blood-flesh-credentialing-refused', 6, 3, 'john', 1, 11, E'*Is not this the carpenter, the son of Mary?* The Nazareth-kin reduce the Formed-in-flesh to his earthly genealogy. The same scandal Yochanan (John) 1:11 named: *he came unto his own, and his own received him not.*'),
  ('born-not-of-blood-flesh-credentialing-refused', 6, 3, 'isaiah', 53, 2, E'*And they were offended at him* — Yeshayahu (Isaiah) 53:2-3 named the despised-and-rejected pattern long before Nazareth lived it.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 4, 'jeremiah', 11, 21, E'*A prophet is not without honour, but in his own country.* The pattern of the prophet rejected at home runs from Mosheh (Moses) through Yirmeyahu (Jeremiah) 11:21 through Eliyahu (Elijah) and lands on Yochanan (John) in this very chapter.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 4, '1-kings', 19, 10, E'The Eliyahu (Elijah)-pattern carried at 1 Kings 19:10 — the prophet hunted by the king for naming the king''s sin; the same pattern lands on Yochanan.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 4, 'matthew', 13, 57, E'*A prophet is not without honour, save in his own country, and in his own house* — the Matthean parallel.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 4, 'luke', 4, 24, E'*No prophet is accepted in his own country* — the Lukan parallel.'),
  ('twelve-apostles-twelve-tribes-restoration-architecture', 6, 7, 'deuteronomy', 19, 15, E'*He sent them forth by two and two.* The Torah''s two-witness requirement (Devarim/Deuteronomy 19:15) walks into the apostolic sending. Twelve apostles for twelve tribes, sent in pairs.'),
  ('twelve-apostles-twelve-tribes-restoration-architecture', 6, 7, 'matthew', 10, 1, E'The Matthean parallel sending-of-the-twelve.'),
  ('twelve-apostles-twelve-tribes-restoration-architecture', 6, 7, 'revelation', 21, 12, E'The twelve foundations of New-Yerushalayim bearing the names of the twelve apostles of the Lamb.'),
  ('shake-the-dust-off-rejection-response', 6, 11, 'matthew', 10, 14, E'*Shake off the dust under your feet for a testimony against them.* The Matthean parallel; the prophetic-witness-act when the rejection lands.'),
  ('shake-the-dust-off-rejection-response', 6, 11, 'acts', 13, 51, E'Paul and Barnabas shake the dust off in Acts 13:51 — the apostolic walk of the same charge.'),
  ('shake-the-dust-off-rejection-response', 6, 11, 'john', 10, 27, E'*My sheep hear my voice.* Those who do not, the dust is shaken off — pearls before swine refused.'),
  ('shake-the-dust-off-rejection-response', 6, 11, 'matthew', 7, 6, E'*Give not that which is holy unto the dogs, neither cast ye your pearls before swine* — the same charge in compressed form.'),
  ('sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory', 6, 11, 'matthew', 11, 23, E'*It shall be more tolerable for Sodom and Gomorrha in the day of judgment, than for that city.* The day-of-judgment threshold lands the consequence on the city that refused the messengers.'),
  ('sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory', 6, 11, '2-peter', 2, 6, E'2 Peter 2:6''s Sodom-and-Gomorrha as the *ensample unto those that after should live ungodly* — the same judgment-pattern Mark 6 names.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 14, '1-kings', 21, 17, E'*That John the Baptist was risen from the dead.* Herod''s guilt-haunted confession: the king who beheaded the prophet sees the prophet''s pattern reproduced. The Achav (Ahab)-Navot (Naboth) parallel of 1 Kings 21:17 stands behind the conscience.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 14, 'mark', 9, 13, E'*Elias is indeed come, and they have done unto him whatsoever they listed* (Mark 9:13) — the King''s own naming of Yochanan-as-Eliyahu the chapter before.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 18, '1-kings', 21, 17, E'*It is not lawful for thee to have thy brother''s wife.* Yochanan (John) reproves the king the way Eliyahu (Elijah) reproved Achav (Ahab) for Navot''s vineyard. The reproof costs his head.'),
  ('eliyahu-pattern-prophet-martyrdom', 6, 18, '2-chronicles', 24, 20, E'The Zecharyah-stoned-between-temple-and-altar pattern (2 Chronicles 24:20-21) — the prophet killed for speaking Torah to power runs straight through to the King''s own death.'),
  ('wilderness-feeding-as-messianic-banquet-pre-figuration', 6, 30, 'numbers', 27, 17, E'*Moved with compassion toward them, because they were as sheep not having a shepherd.* Mosheh (Moses) used these words at Bamidbar (Numbers) 27:17 — sheep-without-a-shepherd.'),
  ('wilderness-feeding-as-messianic-banquet-pre-figuration', 6, 30, 'ezekiel', 34, 5, E'*Sheep without a shepherd* — the same diagnostic Yechezk''el (Ezekiel) 34:5-6 carries against the failed shepherds of Yashar''el.'),
  ('wilderness-feeding-as-messianic-banquet-pre-figuration', 6, 30, '1-kings', 22, 17, E'Micaiah''s vision of *all Yashar''el (Israel) scattered upon the hills, as sheep that have not a shepherd* (1 Kings 22:17) — the same shepherd-language carried forward.'),
  ('gathering-the-dispersed-with-much-mercy-in-2-baruch', 6, 34, 'ezekiel', 34, 11, E'*Because they were as sheep not having a shepherd.* The compassion that moves the King is the same mercy Yechezk''el (Ezekiel) 34:11-12 names — *I myself, even I, will both search my sheep, and seek them out.*'),
  ('bread-from-heaven-manna-and-the-formed', 6, 37, 'exodus', 16, 14, E'*And they did all eat, and were filled.* The wilderness-feeding is the same substance the manna of Shemot (Exodus) 16:14-15 prefigured; the Bread from heaven multiplied to satisfy the gathered.'),
  ('bread-from-heaven-manna-and-the-formed', 6, 37, 'deuteronomy', 8, 3, E'*Man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (the LORD)* (Devarim/Deuteronomy 8:3) — the wilderness-bread substance the King fulfills.'),
  ('bread-from-heaven-manna-and-the-formed', 6, 37, 'john', 6, 32, E'*Yahusha (Jesus) will name explicitly at John 6:32-35 — the Bread from heaven, the Formed-one as the substance the manna was a sign of.*'),
  ('bread-from-heaven-manna-and-the-formed', 6, 37, 'psalms', 78, 23, E'*He had commanded the clouds from above, and opened the doors of heaven, and had rained down manna upon them to eat, and had given them of the corn of heaven* (Tehillim/Psalm 78:23-25).'),
  ('wilderness-feeding-as-messianic-banquet-pre-figuration', 6, 37, '2-kings', 4, 42, E'Elisha''s twenty-loaves multiplication at 2 Kings 4:42-44 — the prophetic pattern of the wilderness-feeding the King fulfills in larger measure.'),
  ('wilderness-feeding-as-messianic-banquet-pre-figuration', 6, 37, 'ezekiel', 34, 14, E'*I will feed them in a good pasture* (Yechezk''el/Ezekiel 34:14) — the shepherd-feeding-the-flock substance the King walks.'),
  ('wilderness-feeding-as-messianic-banquet-pre-figuration', 6, 37, 'ezekiel', 34, 23, E'*And I will set up one shepherd over them, and he shall feed them, even my servant David* (Yechezk''el/Ezekiel 34:23) — the Davidic-shepherd prophecy the wilderness-feeding enacts.'),
  ('walking-on-the-sea-formed-cloud-rider', 6, 48, 'job', 9, 8, E'*Walking upon the sea, and would have passed by them.* The treading on the sea is the Formed cloud-rider''s own signature — *which alone spreadeth out the heavens, and treadeth upon the waves of the sea* (Iyov/Job 9:8).'),
  ('walking-on-the-sea-formed-cloud-rider', 6, 48, 'psalms', 77, 19, E'*Thy way is in the sea, and thy path in the great waters, and thy footsteps are not known* (Tehillim/Psalm 77:19).'),
  ('walking-on-the-sea-formed-cloud-rider', 6, 48, 'exodus', 33, 19, E'The *would have passed by them* echoes Yahuah''s passing-by Mosheh (Moses) at Shemot (Exodus) 33:19-22 — the theophanic pass-by of the One who treads the sea.'),
  ('walking-on-the-sea-formed-cloud-rider', 6, 48, '1-kings', 19, 11, E'The theophanic pass-by of Eliyahu (Elijah) at 1 Kings 19:11 — the same pattern carried into the fourth watch on the sea.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 6, 50, 'exodus', 3, 14, E'*It is I; be not afraid.* The *it is I* — *egō eimi* in the Greek — is the King''s own Ehyeh (I AM) self-identification spoken from the sea he is treading on. The Shemot (Exodus) 3:14 *Ehyeh asher Ehyeh* run together in one sentence.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 6, 50, 'isaiah', 43, 10, E'*That ye may know and believe me, and understand that I am he* — Yeshayahu (Isaiah) 43:10-13 *I am he* register; the same Tanakh-source the John 8:58 *I am* lands on.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 6, 50, 'isaiah', 41, 10, E'*Be not afraid* — the standard accompanying word when the Formed identifies himself across the canon (Yeshayahu/Isaiah 41:10).'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 6, 50, 'genesis', 15, 1, E'*Fear not, Abram: I am thy shield, and thy exceeding great reward* (Bereshit/Genesis 15:1) — the Formed-one''s first *fear not* to the patriarch carries the same self-identification register.'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 6, 52, 'isaiah', 6, 9, E'*For they considered not the miracle of the loaves: for their heart was hardened.* The hardening of the heart is the same diagnostic Yeshayahu (Isaiah) 6:9-10 gave the prophet.'),
  -- ===== Mark 7 =====
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 7, 3, 'leviticus', 22, 1, E'*Except they wash their hands oft, eat not, holding the tradition of the elders.* The hand-washing rules are nowhere in the Torah; they are Pharisaic fence-building around the priestly-purity requirements of Vayikra (Leviticus) 22 extended to all the people.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 7, 6, 'isaiah', 29, 13, E'*This people honoureth me with their lips, but their heart is far from me.* The King quotes Yeshayahu (Isaiah) 29:13 against the tradition-keepers. **Q15 OT-quotation KEEP flag** queued for S184.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 7, 8, 'deuteronomy', 4, 2, E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it.* The first blade of the Judaizer-architecture. The Torah''s own anti-adding clause stands behind the King''s rebuke.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 7, 8, 'deuteronomy', 12, 32, E'*What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* — the parallel anti-adding clause from Devarim (Deuteronomy) 12:32.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 7, 9, 'exodus', 20, 12, E'*Making the word of Elohim (God) of none effect through your tradition.* The load-bearing example: Corban releases sons from honoring parents — voiding the fifth commandment (Shemot/Exodus 20:12) by tradition.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 7, 9, 'deuteronomy', 5, 16, E'*Honour thy father and thy mother* — the Devarim (Deuteronomy) 5:16 re-naming of the fifth commandment the Corban tradition voided.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 7, 9, '1-john', 2, 3, E'*Hereby we do know that we know him, if we keep his commandments* — the 1 Yochanan (John) 2:3-4 contrary-to-Torah test; the diagnostic the Pharisaic tradition fails.'),
  ('honor-of-parents-fifth-commandment-the-corban-tradition-voids-in-sirach-and-tobit', 7, 10, 'exodus', 20, 12, E'*For Moses said, Honour thy father and thy mother.* The King quotes the positive command (Shemot/Exodus 20:12) the Pharisaic Corban tradition voids.'),
  ('honor-of-parents-fifth-commandment-the-corban-tradition-voids-in-sirach-and-tobit', 7, 10, 'exodus', 21, 17, E'*Whoso curseth father or mother, let him die the death* — Shemot (Exodus) 21:17''s penalty-register the King quotes against the Corban-voiding.'),
  ('heart-defilement-and-the-mouth-substance', 7, 14, 'jeremiah', 17, 9, E'*There is nothing from without a man, that entering into him can defile him.* The defilement at issue is heart-defilement; the diagnostic is Yirmeyahu (Jeremiah) 17:9''s *the heart is deceitful above all things.* NOT the abolition of Torah''s clean / unclean instruction.'),
  ('heart-defilement-and-the-mouth-substance', 7, 14, 'deuteronomy', 30, 6, E'*Yahuah Elohayka (the LORD thy God) will circumcise thine heart* (Devarim/Deuteronomy 30:6) — the heart-circumcision the Torah itself prophesied as the answer to defilement.'),
  ('oral-tradition-correction-not-torah-supersession', 7, 19, 'leviticus', 11, 1, E'*Purging all meats.* The parenthetical is grammatically the digestive system purging the foods that have already passed through it, not the King declaring unclean animals clean. The Vayikra (Leviticus) 11 categories stand untouched.'),
  ('oral-tradition-correction-not-torah-supersession', 7, 19, 'acts', 10, 14, E'Peter''s *Not so, Lord; for I have never eaten any thing that is common or unclean* (Acts 10:14) — confirms the Torah''s clean/unclean categories were still operative for the apostolic walk after the resurrection.'),
  ('heart-defilement-and-the-mouth-substance', 7, 21, 'exodus', 20, 13, E'*Out of the heart of men, proceed evil thoughts, adulteries, fornications, murders, thefts, covetousness.* The catalog runs through the second tablet of the Torah (Shemot/Exodus 20:13-17).'),
  ('heart-defilement-and-the-mouth-substance', 7, 21, 'jeremiah', 17, 9, E'*The heart is deceitful above all things, and desperately wicked* — the Yirmeyahu (Jeremiah) 17:9 diagnostic.'),
  ('heart-defilement-and-the-mouth-substance', 7, 21, 'ezekiel', 36, 26, E'The answer is the new heart of Yechezk''el (Ezekiel) 36:26 — *a new heart also will I give you.*'),
  ('canaanite-woman-master', 7, 24, 'matthew', 15, 21, E'The Markan parallel to the Matthean Canaanite-woman of Matthew 15:21-28. **Red Line #7 individual-mercy contrast case:** mercy granted, daughter healed; absorption into the seed-line not in view here.'),
  ('canaanite-woman-master', 7, 24, 'matthew', 15, 24, E'*I am not sent but unto the lost sheep of the house of Yashar''el (Israel)* (Matthew 15:24) — the King''s stated mission; the bread is for the children of the seed-of-promise, the daughter-of-the-nations receives mercy without being absorbed.'),
  ('canaanite-woman-master', 7, 28, 'matthew', 15, 27, E'*Yet the dogs under the table eat of the children''s crumbs.* The woman accepts the children-and-dogs framework the King handed her. Her wisdom is in receiving the framework, not arguing it away. **Q14 NT-Lord vocative flag** queued for S184: render as *Lord* (preserve).'),
  -- ===== Mark 8 =====
  ('bread-from-heaven-manna-and-the-formed', 8, 1, 'exodus', 16, 14, E'*Seven loaves... seven baskets... four thousand.* The second wilderness-feeding on the eastern shore — the Bread from heaven multiplied a second time. The Father has not left the eastern-scattered without bread.'),
  ('bread-from-heaven-manna-and-the-formed', 8, 1, 'john', 6, 32, E'The Bread from heaven, the Formed-one as the substance, multiplied for the gathered scattered.'),
  ('bread-from-heaven-manna-and-the-formed', 8, 1, 'psalms', 78, 23, E'*He had rained down manna upon them to eat, and had given them of the corn of heaven* (Tehillim/Psalm 78:23-25).'),
  ('sign-of-yonah-resurrection-credential', 8, 11, 'matthew', 12, 38, E'*The Pharisees... seeking of him a sign from heaven.* The Markan compressed version of Matthew 12:38-40 — the only sign given to the sign-seekers is the sign of Yonah (Jonah): three days in the heart of the earth, then risen.'),
  ('sign-of-yonah-resurrection-credential', 8, 11, 'matthew', 16, 1, E'The Matthew 16:1-4 parallel sign-seeking exchange.'),
  ('sign-of-yonah-resurrection-credential', 8, 11, 'jonah', 1, 17, E'*Yonah (Jonah) was in the belly of the fish three days and three nights* (Yonah 1:17) — the resurrection-credential Tanakh-substance.'),
  ('leaven-as-corruption-substance', 8, 15, 'exodus', 12, 15, E'*Beware of the leaven of the Pharisees, and of the leaven of Herod.* The leaven-as-corruption substance the Torah marks at the Pesach (Passover) preparation (Shemot/Exodus 12:15).'),
  ('leaven-as-corruption-substance', 8, 15, '1-corinthians', 5, 6, E'*A little leaven leaveneth the whole lump* — Paul''s invoking of the same leaven-as-corruption substance against the Corinthian compromise.'),
  ('leaven-as-corruption-substance', 8, 15, 'galatians', 5, 9, E'*A little leaven leaveneth the whole lump* — the same leaven-warning extended to Galatia.'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 8, 17, 'isaiah', 6, 9, E'*Why reason ye, because ye have no bread? perceive ye not yet, neither understand? have ye your heart yet hardened?* The King applies the Yeshayahu (Isaiah) 6:9-10 diagnostic to his own disciples.'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 8, 17, 'jeremiah', 5, 21, E'*Hear now this, O foolish people, and without understanding; which have eyes, and see not* (Yirmeyahu/Jeremiah 5:21).'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 8, 17, 'ezekiel', 12, 2, E'*They have ears to hear, and hear not: for they are a rebellious house* (Yechezk''el/Ezekiel 12:2).'),
  ('messiah-as-torah-affirming-healer', 8, 22, 'isaiah', 35, 5, E'*Then the eyes of the blind shall be opened* (Yeshayahu/Isaiah 35:5). The two-stage opening of the blind man''s eyes sits as a sign-in-miniature next to the Twelve''s two-stage understanding.'),
  ('messiah-as-torah-affirming-healer', 8, 22, 'isaiah', 42, 7, E'*To open the blind eyes* (Yeshayahu/Isaiah 42:7) — the Servant''s messianic credential walked out at Bethsaida.'),
  ('caesarea-philippi-confession-the-rock-the-keys-the-assembly', 8, 27, 'matthew', 16, 13, E'*Thou art the Messiah (Christ).* Mark''s compressed account of the Caesarea Philippi confession; Matthew 16:13-19 gives the rock / keys exchange.'),
  ('caesarea-philippi-confession-the-rock-the-keys-the-assembly', 8, 27, 'luke', 9, 18, E'The Lukan parallel of the Caesarea Philippi confession.'),
  ('caesarea-philippi-confession-the-rock-the-keys-the-assembly', 8, 27, 'john', 6, 69, E'*Thou art that Messiah (Christ), the Son of the living Elohim (God)* (Yochanan/John 6:69) — the Johannine parallel.'),
  ('first-passion-prediction-and-the-must-of-the-passion', 8, 31, 'isaiah', 53, 3, E'*The Son of Adam must suffer many things, and be rejected of the elders.* The *must* (Greek *dei*) carries the prophetic-Torah necessity Yeshayahu (Isaiah) 53:3-12''s suffering-servant passage had laid down.'),
  ('first-passion-prediction-and-the-must-of-the-passion', 8, 31, 'psalms', 22, 6, E'*I am a worm, and no man; a reproach of men, and despised of the people* (Tehillim/Psalm 22:6-8).'),
  ('first-passion-prediction-and-the-must-of-the-passion', 8, 31, 'zechariah', 12, 10, E'*They shall look upon me whom they have pierced* (Zecharyah/Zechariah 12:10).'),
  ('first-passion-prediction-and-the-must-of-the-passion', 8, 31, 'matthew', 16, 21, E'The Matthean parallel of the first passion prediction.'),
  ('son-of-adam-as-judge-and-ladder', 8, 31, 'genesis', 3, 15, E'*The Son of Adam must suffer many things... and be killed, and after three days rise again.* The seed of the woman that bruises the serpent''s head (Bereshit/Genesis 3:15) must first be bruised.'),
  ('son-of-adam-as-judge-and-ladder', 8, 31, 'daniel', 7, 13, E'The Daniyel (Daniel) 7:13-14 dominion-architecture carries the Son of Adam through the suffering and into the resurrection.'),
  ('son-of-adam-as-judge-and-ladder', 8, 31, 'psalms', 8, 4, E'*What is man, that thou art mindful of him? and the son of adam, that thou visitest him?* (Tehillim/Psalm 8:4).'),
  ('pharisaic-sadducean-system-as-judaizer-predecessor', 8, 33, 'mark', 7, 8, E'*Get thee behind me, Satan: for thou savourest not the things that be of Elohim (God), but the things that be of men.* The same diagnostic the King leveled at the Pharisees at 7:8.'),
  ('pharisaic-sadducean-system-as-judaizer-predecessor', 8, 33, 'matthew', 16, 23, E'The Matthean parallel of the same rebuke.'),
  ('take-up-the-cross-discipleship-cost', 8, 34, 'matthew', 10, 38, E'*Whosoever will come after me, let him deny himself, and take up his cross, and follow me.* The cross is the door home through the curse-system (Galatians 3:13).'),
  ('take-up-the-cross-discipleship-cost', 8, 34, 'matthew', 16, 24, E'The Matthean parallel of the take-up-the-cross charge.'),
  ('take-up-the-cross-discipleship-cost', 8, 34, 'luke', 9, 23, E'The Lukan parallel of the take-up-the-cross charge.'),
  ('take-up-the-cross-discipleship-cost', 8, 34, 'luke', 14, 27, E'*Whosoever doth not bear his cross, and come after me, cannot be my disciple* (Luke 14:27).'),
  ('effort-over-accomplishment', 8, 35, 'proverbs', 24, 16, E'*Whosoever will save his life shall lose it.* The Proverbs 24:16 *just falleth seven times and riseth up again* register names the same shape.'),
  ('effort-over-accomplishment', 8, 35, 'matthew', 10, 39, E'The Matthean parallel of the save-life-lose-life saying.'),
  ('effort-over-accomplishment', 8, 35, 'john', 12, 25, E'*He that loveth his life shall lose it; and he that hateth his life in this world shall keep it unto life eternal* (Yochanan/John 12:25).'),
  ('effort-over-accomplishment', 8, 36, 'matthew', 16, 26, E'*What shall it profit a man, if he shall gain the whole world, and lose his own soul?* The Matthean parallel.'),
  ('effort-over-accomplishment', 8, 36, 'luke', 9, 25, E'The Lukan parallel.'),
  ('effort-over-accomplishment', 8, 36, 'psalms', 49, 7, E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Tehillim/Psalm 49:7-9) — the wisdom-stream''s no-exchange-value naming.'),
  ('son-of-adam-as-judge-and-ladder', 8, 38, 'matthew', 10, 33, E'*Of him also shall the Son of Adam be ashamed, when he cometh in the glory of his Father.* Direct title-assignment (no kaph) of the post-resurrection return-in-glory.'),
  ('son-of-adam-as-judge-and-ladder', 8, 38, 'luke', 12, 9, E'The Lukan parallel of the ashamed-of-me / ashamed-of-him saying.'),
  ('son-of-adam-as-judge-and-ladder', 8, 38, '2-timothy', 2, 12, E'*If we deny him, he also will deny us* (2 Timothy 2:12).'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 8, 38, 'daniel', 7, 13, E'*When he cometh in the glory of his Father with the holy angels.* The Daniyel (Daniel) 7:13-14 Ancient-of-Days transfer-of-the-everlasting-kingdom architecture.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 8, 38, 'mark', 14, 62, E'Mark 14:62 — the same Son-of-Adam-coming-in-glory named under oath at the Sanhedrin trial; the disciples hear it here first.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 8, 38, 'matthew', 26, 64, E'The Matthean parallel of the same Sanhedrin-trial self-identification.'),
  -- ===== Mark 9 =====
  ('appointed-reign-on-the-earth-and-the-priestly-remnant', 9, 1, 'daniel', 7, 14, E'The kingdom-come-with-power the King names is the appointed-reign breaking-in, witnessed in seed-form in the transfiguration. *And there was given him dominion, and glory, and a kingdom* (Daniyel/Daniel 7:14).'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 9, 2, 'exodus', 24, 10, E'The shining raiment is the Formed-glory the Father covered when he wrapped himself in flesh — the same glory the seventy elders saw under his feet at Sinai (Shemot/Exodus 24:10).'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 9, 2, 'daniel', 7, 9, E'Daniyel (Daniel) 7:9''s *garment was white as snow* — the same Ancient-of-Days glory unveiled on the mountain.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 9, 2, 'daniel', 10, 6, E'Daniyel (Daniel) 10:6''s shining-glory vision — the same Formed-cloud-rider self-disclosure.'),
  ('eliyahu-pattern-prophet-martyrdom', 9, 4, '2-kings', 2, 11, E'*Mosheh (Moses) and Eliyahu (Elijah)... standing now with the One they testified of.* *Eliyahu (Elijah) went up by a whirlwind into heaven* (2 Kings 2:11-12).'),
  ('eliyahu-pattern-prophet-martyrdom', 9, 4, 'deuteronomy', 34, 5, E'Mosheh (Moses)''s death by Yahuah''s mouth at Devarim (Deuteronomy) 34:5-6 — the lawgiver translated, now standing on the mountain.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 9, 7, 'exodus', 24, 16, E'*The glory of Yahuah (the LORD) abode upon mount Sinai, and the cloud covered it six days* (Shemot/Exodus 24:16) — the same cloud that covered Sinai overshadows the mountain.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 9, 7, 'exodus', 40, 34, E'The cloud that filled the tabernacle (Shemot/Exodus 40:34-35).'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 9, 7, '1-kings', 8, 10, E'The cloud that filled the temple at Solomon''s dedication (1 Kings 8:10-11).'),
  ('father-voice-naming-the-son-of-adam-at-the-investiture', 9, 7, 'deuteronomy', 18, 15, E'*This is my beloved Son: hear him.* Devarim (Deuteronomy) 18:15-19''s prophet-like-Mosheh credential delivered by the Father himself.'),
  ('father-voice-naming-the-son-of-adam-at-the-investiture', 9, 7, 'psalms', 2, 7, E'*Thou art my Son; this day have I begotten thee* (Tehillim/Psalm 2:7).'),
  ('father-voice-naming-the-son-of-adam-at-the-investiture', 9, 7, 'isaiah', 42, 1, E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth* (Yeshayahu/Isaiah 42:1).'),
  ('first-passion-prediction-and-the-must-of-the-passion', 9, 9, 'isaiah', 53, 3, E'*The Son of Adam was risen from the dead.* The charge binds the transfiguration''s glory to the cross''s suffering — *despised and rejected of men* (Yeshayahu/Isaiah 53:3, 10).'),
  ('fulfill-as-prophecy-bringing-to-pass', 9, 11, 'malachi', 4, 5, E'*Elias verily cometh first, and restoreth all things.* The King points the disciples back to Mal''aki (Malachi) 4:5-6''s Eliyahu-pattern prophecy.'),
  ('yochanan-as-eliyahu-pattern-prophet', 9, 13, '1-kings', 19, 2, E'*Elias is indeed come, and they have done unto him whatsoever they listed.* The King identifies Yochanan (John) as the Eliyahu-pattern prophet sent before the dreadful day, killed by the same Yezevel (Jezebel)-spirit that hunted the first (1 Kings 19:2, 10).'),
  ('yochanan-as-eliyahu-pattern-prophet', 9, 13, 'malachi', 4, 5, E'*Behold, I will send you Eliyahu (Elijah) the prophet before the coming of the great and dreadful day of Yahuah (the LORD)* (Mal''aki/Malachi 4:5).'),
  ('eliyahu-pattern-prophet-martyrdom', 9, 13, '2-chronicles', 24, 20, E'The Zecharyah-stoned-in-the-temple-courts pattern (2 Chronicles 24:20-22).'),
  ('eliyahu-pattern-prophet-martyrdom', 9, 13, 'matthew', 23, 35, E'*Even unto the blood of Zecharyah (Zechariah), the son of Berechyah, whom ye slew between the temple and the altar* (Matthew 23:35).'),
  ('effort-over-accomplishment', 9, 24, 'proverbs', 24, 16, E'*Lord, I believe; help thou mine unbelief.* The father of the demon-possessed boy is not a man with a perfected faith — he is a man with effort. *A just man falleth seven times, and riseth up again* (Mishlei/Proverbs 24:16). **Q14 NT-Lord flag** queued for S184.'),
  ('effort-over-accomplishment', 9, 24, 'isaiah', 41, 10, E'*Fear thou not; for I am with thee* (Yeshayahu/Isaiah 41:10).'),
  ('son-of-adam-as-judge-and-ladder', 9, 29, 'daniel', 7, 9, E'*This kind can come forth by nothing, but by prayer and fasting* — the authority of the Son of Adam is exercised through the posture of dependence on the Father (Daniyel/Daniel 7:9, 13-14).'),
  ('first-passion-prediction-and-the-must-of-the-passion', 9, 31, 'isaiah', 53, 8, E'*The Son of Adam is delivered into the hands of men.* The second passion prediction — *he was taken from prison and from judgment* (Yeshayahu/Isaiah 53:8).'),
  ('first-passion-prediction-and-the-must-of-the-passion', 9, 31, 'zechariah', 13, 7, E'*Smite the shepherd, and the sheep shall be scattered* (Zecharyah/Zechariah 13:7).'),
  ('son-of-adam-as-judge-and-ladder', 9, 31, 'daniel', 7, 13, E'The Son of Adam who bears the everlasting dominion is the same who lays his life down. The lineage-name carries both the throne and the tree.'),
  ('son-of-adam-as-judge-and-ladder', 9, 31, 'isaiah', 53, 5, E'*He was wounded for our transgressions, he was bruised for our iniquities* (Yeshayahu/Isaiah 53:5-8).'),
  ('kinship-redefinition-kingdom-family', 9, 37, 'matthew', 12, 50, E'*Receiving one of these little children in the King''s name is receiving the King.* *Whosoever shall do the will of my Father which is in heaven, the same is my brother, and sister, and mother* (Matthew 12:50).'),
  ('kinship-redefinition-kingdom-family', 9, 37, 'john', 13, 20, E'*He that receiveth whomsoever I send receiveth me* (Yochanan/John 13:20).'),
  ('scattered-seed-gathering', 9, 38, 'john', 10, 16, E'*He that is not against us is on our part.* *Other sheep I have, which are not of this fold: them also I must bring* (Yochanan/John 10:16).'),
  ('scattered-seed-gathering', 9, 38, 'numbers', 11, 26, E'Bamidbar (Numbers) 11:26-29''s Eldad and Medad prophesying outside the camp — Mosheh''s *would Yahuah (God) that all Yahuah''s (the LORD''s) people were prophets* echoes through Mark 9:38.'),
  ('the-watcher-rebellion-as-the-stumbling-block-architecture-in-1-enoch', 9, 43, 'isaiah', 66, 24, E'*Where their worm dieth not, neither is their fire quenched* — Yeshayahu (Isaiah) 66:24 deployed against the Watcher-architecture.'),
  ('post-harvest-sifting', 9, 49, 'leviticus', 2, 13, E'*Every one shall be salted with fire, and every sacrifice shall be salted with salt.* *Neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering* (Vayikra/Leviticus 2:13).'),
  ('post-harvest-sifting', 9, 49, 'malachi', 3, 2, E'*Like a refiner''s fire, and like fullers'' soap* (Mal''aki/Malachi 3:2-3) — fire tries every life.'),
  -- ===== Mark 10 =====
  ('creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon', 10, 2, 'genesis', 1, 27, E'*From the beginning of the creation Elohim (God) made them male and female.* The King sends them back to Bereshit (Genesis) 1:27, refusing the divorce-question on Bereshit-and-Bereshit-2 ground.'),
  ('creation-ordinance-marriage-and-the-blessed-eunuch-in-jubilees-tobit-and-wisdom-of-solomon', 10, 2, 'genesis', 2, 22, E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Bereshit/Genesis 2:22-24).'),
  ('heart-torah-not-abolition', 10, 5, 'jeremiah', 31, 33, E'*For the hardness of your heart he wrote you this precept.* The heart-Torah Yirmeyahu (Jeremiah) 31:33 promises is the standard internalized.'),
  ('heart-torah-not-abolition', 10, 5, 'ezekiel', 36, 26, E'*A new heart also will I give you, and a new spirit will I put within you* (Yechezk''el/Ezekiel 36:26-27).'),
  ('the-seed-of-promise-is-singular-paternal', 10, 6, 'genesis', 2, 24, E'*They twain shall be one flesh.* The two-become-one of Bereshit (Genesis) 2:24 is the marriage-mechanism the framework reads forward as the seed-of-promise architecture.'),
  ('kinship-redefinition-kingdom-family', 10, 14, 'matthew', 18, 3, E'*Of such is the kingdom of Elohim (God).* The kingdom is entered as the gift it is, not as the rank one climbs to (Matthew 18:3-4).'),
  ('kinship-redefinition-kingdom-family', 10, 14, 'psalms', 131, 1, E'*Yahuah (LORD), my heart is not haughty* (Tehillim/Psalm 131:1-2) — the kingdom-posture.'),
  ('heart-torah-not-abolition', 10, 19, 'matthew', 19, 16, E'*If thou wilt enter into life, keep the commandments* (Matthew 19:16-17). Torah-keeping is still the answer; the pulpit that reads *not under law* as Torah''s abolition has not stood at this Markan moment.'),
  ('heart-torah-not-abolition', 10, 19, 'exodus', 20, 12, E'The King''s recital of the commandments — Shemot (Exodus) 20:12-16''s honour-father-mother, no-killing, no-stealing, no-adultery, no-false-witness — is load-bearing.'),
  ('heart-torah-not-abolition', 10, 19, 'deuteronomy', 5, 16, E'The Devarim (Deuteronomy) 5:16-20 re-naming of the same commandments the King is reciting.'),
  ('effort-over-accomplishment', 10, 21, 'proverbs', 24, 16, E'*One thing thou lackest.* The kingdom is entered not by counting accomplishment but by taking the next step in love. *A just man falleth seven times, and riseth up again* (Mishlei/Proverbs 24:16).'),
  ('kinship-redefinition-kingdom-family', 10, 28, 'matthew', 12, 50, E'*The hundredfold-now — houses, brethren, sisters, mothers, children, lands.* The kingdom-family is gathered around the doing of the Father''s will (Matthew 12:50).'),
  ('kinship-redefinition-kingdom-family', 10, 28, 'mark', 3, 35, E'The Mark 3:35 architecture repeated here in the hundredfold-now register.'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 10, 31, 'matthew', 22, 14, E'*Many that are first shall be last; and the last first.* *Many are called, but few are chosen* (Matthew 22:14).'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 10, 31, 'matthew', 19, 30, E'The Matthean parallel.'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 10, 31, 'luke', 13, 30, E'The Lukan parallel.'),
  ('first-passion-prediction-and-the-must-of-the-passion', 10, 32, 'isaiah', 53, 7, E'*The third passion prediction is the most explicit.* *He is brought as a lamb to the slaughter* (Yeshayahu/Isaiah 53:7).'),
  ('first-passion-prediction-and-the-must-of-the-passion', 10, 32, 'psalms', 22, 6, E'The Yerushalayim-arrival is the destination he has been walking toward since Caesarea Philippi (Tehillim/Psalm 22:6-8).'),
  ('the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees', 10, 35, 'isaiah', 51, 17, E'*The cup the King drinks is the cup of the Father''s wrath the prophets named.* *Awake, awake, stand up, O Yerushalayim... cup of his fury* (Yeshayahu/Isaiah 51:17, 22).'),
  ('the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach', 10, 45, 'isaiah', 53, 10, E'*The Son of Adam came... to give his life a ransom for many.* The Yeshayahu (Isaiah) 53 Suffering Servant — *he shall see of the travail of his soul* (53:10-12). NOT collapsed into strict penal-substitution.'),
  ('son-of-adam-as-judge-and-ladder', 10, 45, 'isaiah', 53, 11, E'*By his knowledge shall my righteous servant justify many; for he shall bear their iniquities.*'),
  ('son-of-adam-as-judge-and-ladder', 10, 45, 'daniel', 7, 13, E'The Daniyel (Daniel) 7:13-14 dominion-architecture carried into the ransom-saying.'),
  ('son-of-david-messianic-recognition-by-marginalized', 10, 46, 'jeremiah', 23, 5, E'*Thou Son of David, have mercy on me.* *I will raise unto David a righteous Branch* (Yirmeyahu/Jeremiah 23:5). **Q14 NT-Lord flag** at 10:51 queued for S184.'),
  ('son-of-david-messianic-recognition-by-marginalized', 10, 46, '2-samuel', 7, 12, E'2 Sh''mu''el (Samuel) 7:12-13''s Davidic seed-promise.'),
  ('son-of-david-messianic-recognition-by-marginalized', 10, 46, 'isaiah', 11, 1, E'*A rod out of the stem of Yishai (Jesse)* (Yeshayahu/Isaiah 11:1).'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 10, 52, 'john', 10, 27, E'*Thy faith hath made thee whole.* Bartimaeus was a son-of-Adam from before the foundation; his hearing was the revealing, not the creating. *My sheep hear my voice* (Yochanan/John 10:27).'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 10, 52, 'revelation', 13, 8, E'Revelation 13:8''s *names written before the foundation* — the hearing reveals the prior election.'),
  -- ===== Mark 11 =====
  ('davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees', 11, 1, 'zechariah', 9, 9, E'*Rejoice greatly, O daughter of Tsion (Zion)... behold, thy King cometh unto thee... lowly, and riding upon an ass* (Zecharyah/Zechariah 9:9).'),
  ('fulfill-as-prophecy-bringing-to-pass', 11, 1, 'zechariah', 9, 9, E'The King''s two-disciple errand for the colt is the deliberate enactment of Zecharyah''s prophecy.'),
  ('scattered-seed-gathering', 11, 9, 'psalms', 118, 25, E'*Hosanna; Blessed is he that cometh in the name of Yahuah (the LORD).* Tehillim (Psalm) 118:25-26. **Q15 OT-quotation KEEP flag** queued for S184.'),
  ('leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch', 11, 12, 'mark', 11, 20, E'The cursed fig tree — the prophetic-acted-parable judging the credentialed-without-fruit covenant body. The Mark 11:20-21 morning return shows the result.'),
  ('temple-cleansing-and-the-maccabean-rededication-architecture', 11, 15, 'psalms', 69, 9, E'*The zeal of thine house hath eaten me up* (Tehillim/Psalm 69:9).'),
  ('scattered-seed-gathering', 11, 17, 'isaiah', 56, 7, E'*My house shall be called of all nations the house of prayer.* The all-nations is the scattered seed scattered through every nation, returning to the mountain. (NOT collapsed into false-inclusion-gospel.)'),
  ('scattered-seed-gathering', 11, 17, 'jeremiah', 7, 11, E'*But ye have made it a den of thieves* — the Yirmeyahu (Jeremiah) 7:11 indictment.'),
  ('gather-together-in-one-the-children-scattered-abroad', 11, 17, 'john', 11, 52, E'*And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* (Yochanan/John 11:52).'),
  ('gather-together-in-one-the-children-scattered-abroad', 11, 17, 'isaiah', 56, 8, E'*Yet will I gather others to him, beside those that are gathered unto him* (Yeshayahu/Isaiah 56:8).'),
  ('effort-over-accomplishment', 11, 22, 'proverbs', 24, 16, E'*Have faith in Elohim (God).* The mountain-removing word is not formula but trust-walking (Mishlei/Proverbs 24:16).'),
  ('effort-over-accomplishment', 11, 22, 'isaiah', 41, 10, E'*Fear thou not; for I am with thee* (Yeshayahu/Isaiah 41:10).'),
  ('love-brings-torah-to-pass', 11, 25, 'leviticus', 19, 18, E'*Thou shalt love thy neighbour as thyself* (Vayikra/Leviticus 19:18). The Lord''s-prayer architecture is not a transaction but a heart-shape — heart-Torah walked.'),
  ('love-brings-torah-to-pass', 11, 25, 'matthew', 6, 14, E'*For if ye forgive men their trespasses, your heavenly Father will also forgive you* (Matthew 6:14-15).'),
  ('caesarea-philippi-confession-the-rock-the-keys-the-assembly', 11, 27, 'matthew', 16, 13, E'The chief priests'' authority-question is the same authority-architecture Caesarea Philippi named.'),
  ('caesarea-philippi-confession-the-rock-the-keys-the-assembly', 11, 27, 'matthew', 21, 23, E'The Matthean parallel of the temple-authority exchange.'),
  -- ===== Mark 12 =====
  ('wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning', 12, 1, 'isaiah', 5, 1, E'*The vineyard-parable is the King''s deliberate walking of Yeshayahu (Isaiah) 5''s vineyard-of-Yahuah-Tseva''ot into the courts of the second temple.* *The vineyard given to others* is the rod-sifting that purges the rebels from among the gathered tribes — not the pagan-replacement the inherited reading hears. *For the vineyard of Yahuah Tseva''ot (the LORD of hosts) is the house of Yashar''el (Israel)* (Yeshayahu/Isaiah 5:7).'),
  ('wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning', 12, 1, 'ezekiel', 20, 37, E'*I will cause you to pass under the rod, and I will bring you into the bond of the covenant* (Yechezk''el/Ezekiel 20:37-38) — the rod-sifting.'),
  ('sovereign-election-and-the-remnant-of-yashar-el', 12, 1, 'romans', 11, 5, E'*Yashar''el (Israel) hath not obtained that which he seeketh for; but the election hath obtained it* (Romans 11:5-7). The seed of Yashar''el is not displaced by the nations; the unfruitful husbandmen are sifted out, and the priestly remnant inherits.'),
  ('sovereign-election-and-the-remnant-of-yashar-el', 12, 1, 'isaiah', 10, 21, E'*The remnant shall return, even the remnant of Ya''aqov (Jacob)* (Yeshayahu/Isaiah 10:21-22).'),
  ('false-inclusion-rebuttal', 12, 1, 'romans', 11, 17, E'*The framework reading refuses the inherited pulpit''s vineyard-taken-from-the-Yahudim-and-given-to-the-Gentile-church collapse.* The vineyard is Yashar''el; the rod-sifting purges out the corrupt-shepherds; the nations are not the new husbandmen. *And so all Yashar''el shall be saved* (Romans 11:26).'),
  ('false-inclusion-rebuttal', 12, 1, 'jeremiah', 11, 16, E'*Yahuah (the LORD) called thy name, A green olive tree, fair, and of goodly fruit* (Yirmeyahu/Jeremiah 11:16-17).'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 12, 10, 'psalms', 118, 22, E'*The stone which the builders refused is become the head stone of the corner. This is Yahuah''s (the LORD''s) doing* (Tehillim/Psalm 118:22-23). Formed-cloud-rider self-identification by Tanakh-citation. **Q15 OT-quotation KEEP flag** queued for S184.'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 12, 10, 'isaiah', 28, 16, E'*Behold, I lay in Tsion (Zion) for a foundation a stone* (Yeshayahu/Isaiah 28:16).'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 12, 10, 'daniel', 2, 34, E'*Thou sawest till that a stone was cut out without hands* (Daniyel/Daniel 2:34-35).'),
  ('render-unto-caesar-and-the-image-of-elohim-stamped-on-man-in-sirach-and-wisdom-of-solomon', 12, 13, 'genesis', 1, 27, E'*Render to Caesar the things that are Caesar''s, and to Elohim (God) the things that are Elohim''s.* The Caesar''s-image-on-the-coin pays the Caesar; the Elohim-image-on-the-man (Bereshit/Genesis 1:27) owes the whole man to the Father. NOT antinomian state-loyalty teaching.'),
  ('natural-branches-asleep-grafted-again', 12, 26, 'exodus', 3, 6, E'*I am the Elohim (God) of Avraham (Abraham), and the Elohim (God) of Yitschaq (Isaac), and the Elohim (God) of Ya''aqov (Jacob).* The patriarchs are not annihilated but asleep, awaiting the resurrection.'),
  ('natural-branches-asleep-grafted-again', 12, 26, 'daniel', 12, 2, E'*And many of them that sleep in the dust of the earth shall awake* (Daniyel/Daniel 12:2).'),
  ('natural-branches-asleep-grafted-again', 12, 26, 'hebrews', 11, 13, E'Hebrews 11:13-16, 39-40''s witness that the patriarchs *all died in faith, not having received the promises*.'),
  ('love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon', 12, 28, 'deuteronomy', 6, 4, E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (the LORD our God) is one Yahuah (LORD)* (Devarim/Deuteronomy 6:4-5). The Greatest-Commandment answer quotes the Shema. **Q15 OT-quotation KEEP flag** queued for S184.'),
  ('love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon', 12, 28, 'leviticus', 19, 18, E'*Thou shalt love thy neighbour as thyself* (Vayikra/Leviticus 19:18).'),
  ('heart-torah-not-abolition', 12, 28, 'deuteronomy', 6, 4, E'Love-of-Yahuah and love-of-neighbor as the summation of the commandments, not their replacement.'),
  ('heart-torah-not-abolition', 12, 28, 'leviticus', 19, 18, E'The Torah''s own love-of-neighbor command as the second great commandment.'),
  ('heart-torah-not-abolition', 12, 28, 'jeremiah', 31, 33, E'*I will put my law in their inward parts, and write it in their hearts* (Yirmeyahu/Jeremiah 31:33).'),
  ('mercy-not-sacrifice-hosea-6-6-citation', 12, 32, 'hosea', 6, 6, E'*To love him with all the heart... is more than all whole burnt offerings and sacrifices.* The scribe''s recognition walks Hoshea (Hosea) 6:6.'),
  ('mercy-not-sacrifice-hosea-6-6-citation', 12, 32, '1-samuel', 15, 22, E'*To obey is better than sacrifice, and to hearken than the fat of rams* (1 Sh''mu''el/Samuel 15:22).'),
  ('mercy-not-sacrifice-hosea-6-6-citation', 12, 32, 'micah', 6, 6, E'Mikhah (Micah) 6:6-8''s *what doth Yahuah (the LORD) require of thee, but to do justly, and to love mercy.*'),
  ('i-am-statements-as-formed-cloud-rider-self-identification', 12, 35, 'psalms', 110, 1, E'*Yahuah (the LORD) said unto my Lord, Sit thou at my right hand* (Tehillim/Psalm 110:1). The Markan Davidic-Lord challenge is a Formed-cloud-rider self-identification by Tanakh-citation. **Q15 OT-quotation KEEP flag** queued for S184.'),
  ('the-pride-and-religious-status-architecture-in-sirach', 12, 38, 'matthew', 23, 5, E'*Beware of the scribes* — long-clothing, marketplace-salutations, chief-seats. The Matthean parallel of the same indictment.'),
  ('effort-over-accomplishment', 12, 41, 'proverbs', 24, 16, E'*The widow''s two mites and the rich-man''s much give the same Elohim (God) the more and the less by the same standard.* The widow''s effort is what is *more*.'),
  ('effort-over-accomplishment', 12, 41, '1-samuel', 16, 7, E'*Man looketh on the outward appearance, but Yahuah (the LORD) looketh on the heart* (1 Sh''mu''el/Samuel 16:7).'),
  -- ===== Mark 13 =====
  ('wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning', 13, 1, 'jeremiah', 26, 18, E'*The King walks out of the temple and pronounces its stones thrown down.* The prophetic future is not the rebuilt temple of inherited eschatology but the gathering of the twelve tribes coming home (Yirmeyahu/Jeremiah 26:18; Mikhah/Micah 3:12).'),
  ('wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning', 13, 1, 'micah', 3, 12, E'*Tsion (Zion) shall be plowed as a field* (Mikhah/Micah 3:12).'),
  ('wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning', 13, 1, 'matthew', 24, 1, E'The Matthean parallel of the temple-prediction.'),
  ('wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning', 13, 1, 'luke', 21, 5, E'The Lukan parallel.'),
  ('another-gospel-as-judaizer-flesh-credential', 13, 6, 'matthew', 24, 5, E'*Many shall come in my name... and shall deceive many.* The lie wears the Messiah''s name; the test is the same contrary-to-Torah question that exposes the lie in every age.'),
  ('another-gospel-as-judaizer-flesh-credential', 13, 6, 'luke', 21, 8, E'The Lukan parallel of the warning.'),
  ('another-gospel-as-judaizer-flesh-credential', 13, 6, '2-corinthians', 11, 4, E'*Another Yahusha (Jesus), whom we have not preached... another gospel* (2 Corinthians 11:4).'),
  ('another-gospel-as-judaizer-flesh-credential', 13, 6, 'galatians', 1, 6, E'*Removed... unto another gospel* (Galatians 1:6).'),
  ('the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras', 13, 8, 'matthew', 24, 6, E'*Nation against nation, and kingdom against kingdom.* The Matthean parallel of the signs-list.'),
  ('the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras', 13, 8, 'luke', 21, 9, E'The Lukan parallel of the signs-list.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 13, 10, 'matthew', 24, 14, E'*The gospel must first be published among all nations.* *Panta ta ethnē* as the territory-of-the-scattered-seed, not the categorical-three-categories audience.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 13, 10, 'matthew', 28, 19, E'Matthew 28:19''s Great Commission — same scope.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 13, 10, 'hosea', 1, 10, E'*Ye are the sons of the living Elohim* (Hoshea/Hosea 1:10) — the scattered seed addressed.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 13, 10, 'isaiah', 49, 6, E'*I will also give thee for a light to the Gentiles* (Yeshayahu/Isaiah 49:6).'),
  ('post-harvest-sifting', 13, 13, 'matthew', 24, 13, E'*He that shall endure unto the end, the same shall be saved.* The endurance-test — fruit, not profession; walking, not signing on.'),
  ('post-harvest-sifting', 13, 13, 'ezekiel', 20, 37, E'*I will purge out from among you the rebels* (Yechezk''el/Ezekiel 20:37-38).'),
  ('post-harvest-sifting', 13, 13, 'luke', 3, 17, E'*Whose fan is in his hand, and he will throughly purge his floor* (Luke 3:17).'),
  ('post-harvest-sifting', 13, 20, 'isaiah', 65, 8, E'*For the elect''s sake the days are shortened.* The elect were chosen before the foundation of the world (Yeshayahu/Isaiah 65:8-9).'),
  ('post-harvest-sifting', 13, 20, 'revelation', 13, 8, E'Revelation 13:8''s *names not written in the book of life of the Lamb slain from the foundation of the world* — election-precedes-hearing.'),
  ('i-know-thy-works-and-names-blotted-out', 13, 22, 'deuteronomy', 13, 1, E'*False Christs and false prophets... shew signs and wonders.* The signs and wonders do not vouch for the source (Devarim/Deuteronomy 13:1-5); the contrary-to-Torah test does.'),
  ('i-know-thy-works-and-names-blotted-out', 13, 22, 'revelation', 13, 13, E'Revelation 13:13-14''s signs-of-the-second-beast.'),
  ('i-know-thy-works-and-names-blotted-out', 13, 22, '2-thessalonians', 2, 9, E'2 Thessalonians 2:9''s *all power and signs and lying wonders*.'),
  ('trumpets-and-the-day-of-yahuah', 13, 24, 'joel', 2, 10, E'*The sun darkened, the moon failing her light, the stars falling.* The day-of-Yahuah cosmic-signs (Yo''el/Joel 2:10, 30-31).'),
  ('trumpets-and-the-day-of-yahuah', 13, 24, 'isaiah', 13, 10, E'*The stars of heaven and the constellations thereof shall not give their light* (Yeshayahu/Isaiah 13:10).'),
  ('trumpets-and-the-day-of-yahuah', 13, 24, 'isaiah', 34, 4, E'*All the host of heaven shall be dissolved* (Yeshayahu/Isaiah 34:4).'),
  ('like-the-son-of-adam-coming-with-the-clouds', 13, 26, 'daniel', 7, 13, E'*The Son of Adam coming in the clouds with great power and glory.* Direct-attribution cloud-rider line (no kaph). The Formed cloud-rider whom Daniyel (Daniel) 7:13-14 saw in vision is the King naming his own return.'),
  ('like-the-son-of-adam-coming-with-the-clouds', 13, 26, 'matthew', 24, 30, E'The Matthean parallel of the cloud-coming.'),
  ('like-the-son-of-adam-coming-with-the-clouds', 13, 26, 'revelation', 1, 7, E'*Behold, he cometh with clouds; and every eye shall see him* (Revelation 1:7).'),
  ('like-the-son-of-adam-coming-with-the-clouds', 13, 26, 'zechariah', 12, 10, E'*They shall look upon me whom they have pierced* (Zecharyah/Zechariah 12:10).'),
  ('wheat-and-tares-the-post-harvest-sifting-architecture', 13, 27, 'matthew', 13, 41, E'*The angels gather the elect from the four winds.* *The Son of Adam shall send forth his angels, and they shall gather out of his kingdom all things that offend* (Matthew 13:41-43).'),
  ('wheat-and-tares-the-post-harvest-sifting-architecture', 13, 27, 'ezekiel', 37, 21, E'*I will take the children of Yashar''el (Israel) from among the heathen* (Yechezk''el/Ezekiel 37:21).'),
  ('wheat-and-tares-the-post-harvest-sifting-architecture', 13, 27, 'deuteronomy', 30, 4, E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Devarim/Deuteronomy 30:4).'),
  ('heart-torah-not-abolition', 13, 31, 'matthew', 5, 18, E'*Heaven and earth shall pass — his words shall not.* *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* (Matthew 5:18).'),
  ('heart-torah-not-abolition', 13, 31, 'matthew', 24, 35, E'The Matthean parallel.'),
  ('heart-torah-not-abolition', 13, 31, 'isaiah', 40, 8, E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Yeshayahu/Isaiah 40:8).'),
  ('heart-torah-not-abolition', 13, 31, 'psalms', 119, 89, E'*For ever, O Yahuah (LORD), thy word is settled in heaven* (Tehillim/Psalm 119:89).'),
  ('i-and-my-father-are-one-formless-and-formed', 13, 32, 'john', 10, 30, E'*But of that day and that hour knoweth no man, no, not the angels, neither the Son, but the Father.* Read against the unity-side: the same Formed-Son who is one with the Father (Yochanan/John 10:30) holds the timing of the day as the Father''s alone.'),
  ('i-and-my-father-are-one-formless-and-formed', 13, 32, 'john', 14, 28, E'*My Father is greater than I* (Yochanan/John 14:28).'),
  ('i-and-my-father-are-one-formless-and-formed', 13, 32, '1-corinthians', 15, 24, E'1 Corinthians 15:24-28''s ultimate-submission-of-the-Son-to-the-Father.'),
  ('parable-of-the-talents-stewardship-and-the-unprofitable-servant-cast-into-outer-darkness', 13, 34, 'matthew', 24, 42, E'*Watch ye therefore: for ye know not when the master of the house cometh.* The watch-parable closes the Markan Olivet.'),
  ('parable-of-the-talents-stewardship-and-the-unprofitable-servant-cast-into-outer-darkness', 13, 34, 'matthew', 25, 14, E'The Matthean talents-parable parallel.'),
  ('parable-of-the-talents-stewardship-and-the-unprofitable-servant-cast-into-outer-darkness', 13, 34, 'luke', 12, 35, E'The Lukan watch-parable parallel.'),
  -- ===== Mark 14 =====
  ('the-betrayer-the-double-tongue-and-the-watch-against-temptation-in-sirach', 14, 1, 'psalms', 41, 9, E'*The chief priests seeking to take him by craft.* *Mine own familiar friend, in whom I trusted... hath lifted up his heel against me* (Tehillim/Psalm 41:9).'),
  ('bridegroom-messianic-identification', 14, 3, '1-samuel', 16, 13, E'*The anointing at Bethany — the woman pouring spikenard on the King''s head, anointing-substance the bridegroom-Messiah carries.* The king-anointing pattern from 1 Sh''mu''el (Samuel) 16:13.'),
  ('bridegroom-messianic-identification', 14, 3, 'matthew', 26, 6, E'The Matthean parallel of the Bethany anointing.'),
  ('bridegroom-messianic-identification', 14, 3, 'john', 12, 1, E'The Johannine parallel — Mary of Bethany anoints the King''s feet.'),
  ('thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment', 14, 10, 'zechariah', 11, 12, E'*Yahudah Iscariot going to the chief priests to betray the King for money.* *They weighed for my price thirty pieces of silver* (Zecharyah/Zechariah 11:12-13).'),
  ('thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment', 14, 10, 'matthew', 26, 14, E'The Matthean parallel of the betrayal-for-silver.'),
  ('thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment', 14, 10, 'john', 13, 2, E'*The devil having now put into the heart of Judas Iscariot* (Yochanan/John 13:2).'),
  ('pesach-lamb-fulfillment-substance-the-king-as-the-substantial-pesach-lamb', 14, 12, 'exodus', 12, 1, E'*The preparation of the Passover — the King ordering the meal he is about to fulfill as its substance* (Shemot/Exodus 12:1-14).'),
  ('the-betrayer-the-double-tongue-and-the-watch-against-temptation-in-sirach', 14, 18, 'psalms', 41, 9, E'*One of you which eateth with me shall betray me.* Tehillim (Psalm) 41:9 walked out in real time.'),
  ('last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament', 14, 22, 'jeremiah', 31, 31, E'*This is my blood of the new testament.* The new covenant of Yirmeyahu (Jeremiah) 31:31-34 carries its substance here — Torah written on the heart, made covenant in the blood of the Lamb.'),
  ('last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament', 14, 22, 'exodus', 24, 8, E'*Behold the blood of the covenant, which Yahuah (the LORD) hath made with you* (Shemot/Exodus 24:8).'),
  ('last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament', 14, 22, '1-corinthians', 11, 23, E'1 Corinthians 11:23-26''s Pauline tradition of the same supper-substance.'),
  ('appointed-reign-on-the-earth-and-the-priestly-remnant', 14, 25, 'revelation', 19, 9, E'*I will drink no more of the fruit of the vine, until that day that I drink it new in the kingdom of Elohim (God).* The marriage-supper of the Lamb (Revelation 19:9).'),
  ('appointed-reign-on-the-earth-and-the-priestly-remnant', 14, 25, 'isaiah', 25, 6, E'*A feast of fat things, a feast of wines on the lees* (Yeshayahu/Isaiah 25:6-8).'),
  ('false-inclusion-rebuttal', 14, 27, 'zechariah', 13, 7, E'*I will smite the shepherd, and the sheep shall be scattered.* The scattering-and-gathering architecture of the olive-tree reading lands here in compressed form (Zecharyah/Zechariah 13:7).'),
  ('false-inclusion-rebuttal', 14, 27, 'john', 16, 32, E'*Ye shall be scattered, every man to his own* (Yochanan/John 16:32).'),
  ('false-inclusion-rebuttal', 14, 27, 'ezekiel', 34, 5, E'Yechezk''el (Ezekiel) 34:5-6''s scattered-flock prophecy.'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 14, 32, 'hebrews', 5, 7, E'*The Formed Son''s submission to the Formless Father walked out in the garden.* *Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears* (Hebrews 5:7-9).'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 14, 32, 'isaiah', 51, 17, E'*Awake, awake, stand up, O Yerushalayim, which hast drunk at the hand of Yahuah the cup of his fury* (Yeshayahu/Isaiah 51:17, 22).'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 14, 32, 'jeremiah', 25, 15, E'Yirmeyahu (Jeremiah) 25:15-17''s cup-of-wrath the Father hands the nations.'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 14, 38, 'romans', 7, 18, E'*The spirit truly is ready, but the flesh is weak.* The body-spirit asymmetry the disciple walks under (Romans 7:18-25). The watch-and-pray charge is not abolished by the cross; it is the disciple''s standing rule.'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 14, 38, 'galatians', 5, 17, E'*The flesh lusteth against the Spirit, and the Spirit against the flesh* (Galatians 5:17).'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 14, 41, 'isaiah', 53, 6, E'*The hour is come; behold, the Son of Adam is betrayed into the hands of sinners.* *Yahuah (the LORD) hath laid on him the iniquity of us all* (Yeshayahu/Isaiah 53:6).'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 14, 43, 'zechariah', 13, 7, E'*The scriptures must be fulfilled.* Zecharyah (Zechariah) 13:7''s smiting of the shepherd; the disciples scattering is the script the King quoted moments before.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 14, 53, 'psalms', 110, 1, E'*I am: and ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* Mark 14:62 is direct-attribution (no kaph); the kaph-preservation rule applies at Daniyel (Daniel) 7:13 alone.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 14, 53, 'daniel', 7, 13, E'The Daniyel (Daniel) 7:13-14 cloud-rider architecture spoken at the high priest''s own question.'),
  ('like-the-son-of-adam-coming-with-the-clouds', 14, 62, 'daniel', 7, 13, E'*The Son of Adam coming in the clouds of heaven* — direct-attribution cloud-rider language naming the Daniyel (Daniel) 7:13 figure as himself.'),
  ('like-the-son-of-adam-coming-with-the-clouds', 14, 62, 'matthew', 26, 64, E'The Matthean parallel of the same Sanhedrin-trial cloud-rider self-identification.'),
  ('like-the-son-of-adam-coming-with-the-clouds', 14, 62, 'revelation', 1, 7, E'Revelation 1:7''s *behold, he cometh with clouds*.'),
  ('nature-of-god-formed-in-flesh', 14, 61, 'john', 10, 36, E'*Art thou the Messiah (Christ), the Son of the Blessed?* The Markan title pairing sits beside the Johannine *I said, I am the Son of Elohim (God)* (Yochanan/John 10:36).'),
  ('nature-of-god-formed-in-flesh', 14, 61, 'hebrews', 1, 1, E'Hebrews 1:1-3''s *brightness of his glory, and the express image of his person* — the Formed in the flesh, drawn from the Formless.'),
  ('effort-over-accomplishment', 14, 66, 'proverbs', 24, 16, E'*Peter''s threefold denial — the failure that does not annul the calling.* Effort over accomplishment — the falling-and-rising-again of Mishlei (Proverbs) 24:16.'),
  ('effort-over-accomplishment', 14, 66, 'john', 21, 15, E'*The same Peter the King names Cephas at the start is the same Peter the King restores at John 21* (Yochanan/John 21:15-19).'),
  -- ===== Mark 15 =====
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 1, 'isaiah', 53, 7, E'*The King silent before Pilate — Yeshayahu (Isaiah) 53:7 walked out, the lamb dumb before her shearers.*'),
  ('his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance', 15, 15, 'leviticus', 16, 21, E'*Pilate willing to content the people.* The Yom-Kippur blood-substance (Vayikra/Leviticus 16:21-22) reads through Mark''s compressed account.'),
  ('his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance', 15, 15, 'isaiah', 53, 5, E'*He was wounded for our transgressions* (Yeshayahu/Isaiah 53:5).'),
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 16, 'isaiah', 50, 6, E'*I gave my back to the smiters, and my cheeks to them that plucked off the hair* (Yeshayahu/Isaiah 50:6).'),
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 16, 'psalms', 22, 7, E'*All they that see me laugh me to scorn: they shoot out the lip, they shake the head* (Tehillim/Psalm 22:7).'),
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 22, 'psalms', 22, 18, E'*They parted his garments, casting lots upon them.* *They part my garments among them, and cast lots upon my vesture* (Tehillim/Psalm 22:18).'),
  ('yahusha-as-passover-lamb-bone-not-broken', 15, 24, 'exodus', 12, 46, E'*The substantial Passover lamb dying at the hour the typological lamb was sacrificed; the bone not broken* (Shemot/Exodus 12:46).'),
  ('yahusha-as-passover-lamb-bone-not-broken', 15, 24, 'psalms', 34, 20, E'*He keepeth all his bones: not one of them is broken* (Tehillim/Psalm 34:20).'),
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 27, 'isaiah', 53, 12, E'*He was numbered with the transgressors* — Yeshayahu (Isaiah) 53:12 walked out in the two thieves crucified beside him.'),
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 29, 'psalms', 22, 6, E'*They that passed by railed on him, wagging their heads* — Tehillim (Psalm) 22:7-8 fulfilled in real time.'),
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 29, 'lamentations', 2, 15, E'*All that pass by clap their hands at thee* (Eikha/Lamentations 2:15).'),
  ('the-day-of-the-most-high-cosmic-darkness-and-the-resurrection-of-the-righteous-in-2-esdras-and-2-baruch', 15, 33, 'amos', 8, 9, E'*Darkness over the whole land from the sixth hour unto the ninth.* *I will cause the sun to go down at noon, and I will darken the earth in the clear day* (Amos 8:9).'),
  ('eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance', 15, 34, 'psalms', 22, 1, E'*Eloi, Eloi, lama sabachthani* — Tehillim (Psalm) 22:1 cited as the opening of the whole psalm. The cry is not despair; it is the citation of the psalm whose ending is the vindication.'),
  ('eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance', 15, 34, 'psalms', 22, 24, E'Tehillim (Psalm) 22:24 — the vindication-arc the citation invokes.'),
  ('eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance', 15, 34, 'psalms', 22, 27, E'*All the ends of the world shall remember and turn unto Yahuah (the LORD)* (Tehillim/Psalm 22:27).'),
  ('eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance', 15, 34, 'psalms', 22, 31, E'*They shall come, and shall declare his righteousness unto a people that shall be born* (Tehillim/Psalm 22:31).'),
  ('substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', 15, 36, 'psalms', 69, 21, E'*The vinegar offered on a reed — Tehillim (Psalm) 69:21 fulfilled in real time.*'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 15, 37, 'john', 10, 18, E'*Yahusha cried with a loud voice, and gave up the ghost.* *No man taketh it from me, but I lay it down of myself* (Yochanan/John 10:18).'),
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 15, 37, 'luke', 23, 46, E'*Father, into thy hands I commend my spirit* (Luke 23:46).'),
  ('veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross', 15, 38, 'hebrews', 10, 19, E'*The veil of the temple was rent in twain from the top to the bottom.* The substantial access the typological Day of Atonement was always pointing to (Hebrews 10:19-22).'),
  ('veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross', 15, 38, 'exodus', 26, 31, E'The Shemot (Exodus) 26:31-33 tabernacle-veil architecture.'),
  ('nature-of-god-formed-in-flesh', 15, 39, 'matthew', 27, 54, E'*Truly this man was the Son of Elohim.* The centurion''s confession — the Father drew this one; the centurion heard, even at the cross. The Matthean parallel.'),
  ('nature-of-god-formed-in-flesh', 15, 39, 'luke', 23, 47, E'The Lukan parallel of the centurion''s confession.'),
  ('nature-of-god-formed-in-flesh', 15, 39, 'john', 19, 35, E'Yochanan (John) 19:35-37''s witness to the substantial cross-event.'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 15, 40, 'matthew', 27, 55, E'*Mary Magdalene, and Mary the mother of James the less and of Joses, and Salome.* The women at the cross — named here as witnesses of the crucifixion the same way they will be named as the first witnesses of the resurrection.'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 15, 40, 'luke', 23, 49, E'The Lukan parallel of the women at the cross.'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 15, 40, 'john', 19, 25, E'The Johannine parallel of the women at the cross.'),
  ('the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance', 15, 42, 'isaiah', 53, 9, E'*Yoseph (Joseph) of Arimathaea craving the body — the burial in the rich man''s tomb that fulfills Yeshayahu (Isaiah) 53:9.* *He made his grave with the wicked, and with the rich in his death.*'),
  ('the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance', 15, 42, 'psalms', 16, 10, E'*Thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Tehillim/Psalm 16:10).'),
  -- ===== Mark 16 =====
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 16, 1, 'matthew', 28, 1, E'*Mary Magdalene, and Mary the mother of James, and Salome.* The Markan women coming to anoint the body, finding the stone rolled away. The Matthean parallel.'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 16, 1, 'luke', 24, 1, E'The Lukan parallel of the women at the tomb.'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 16, 1, 'john', 20, 1, E'The Johannine parallel of Mary Magdalene at the tomb.'),
  ('the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance', 16, 5, 'psalms', 16, 10, E'*He is risen; he is not here.* Tehillim (Psalm) 16:10''s *thou wilt not leave my soul in hell* carries the resurrection-substance.'),
  ('the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance', 16, 5, 'psalms', 22, 22, E'Tehillim (Psalm) 22:22-24''s *in the midst of the congregation will I praise thee* — the post-resurrection vindication-arc.'),
  ('effort-over-accomplishment', 16, 7, 'proverbs', 24, 16, E'*Tell his disciples and Peter that he goeth before you into Galilee.* The angel''s specific naming of Peter — the falling disciple singled out for the restoration message. *A just man falleth seven times, and riseth up again* (Mishlei/Proverbs 24:16).'),
  ('effort-over-accomplishment', 16, 7, 'john', 21, 15, E'The resurrection word sent to the denying apostle by name (Yochanan/John 21:15-19).'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 16, 8, 'matthew', 28, 8, E'*And they went out quickly, and fled from the sepulchre; for they trembled and were amazed.* The fear is the faithful-witness fear of the resurrection-substance breaking into the world.'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 16, 9, 'john', 20, 11, E'*Mary Magdalene as the first to whom the risen King appeared.* The framework''s first-shall-be-last reversal walked out at the empty tomb (Yochanan/John 20:11-18).'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 16, 9, 'matthew', 28, 9, E'The Matthean parallel of the women meeting the risen King.'),
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 16, 9, 'luke', 8, 2, E'*Mary Magdalene, out of whom went seven devils* (Luke 8:2).'),
  ('effort-over-accomplishment', 16, 14, 'john', 21, 15, E'*The King upbraiding the eleven for their unbelief.* The rebuke and the commission together, one motion of the same patient Father — the same Peter restored at Yochanan (John) 21.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 16, 15, 'matthew', 28, 18, E'*Go ye into all the world, and preach the gospel to every creature.* The all-the-world scope is the territory-of-the-scattered-seed.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 16, 15, 'hosea', 1, 10, E'*Ye are the sons of the living Elohim (God)* (Hoshea/Hosea 1:10).'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 16, 15, 'isaiah', 49, 6, E'*I will also give thee for a light to the Gentiles* (Yeshayahu/Isaiah 49:6).'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 16, 15, 'john', 10, 27, E'*My sheep hear my voice* (Yochanan/John 10:27).'),
  ('trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid', 16, 16, 'matthew', 28, 19, E'*He that believeth and is baptized shall be saved.* The believing-and-being-baptized is the response of the seed-of-promise hearing the call.'),
  ('trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid', 16, 16, 'acts', 2, 38, E'Acts 2:38''s baptism-in-the-name-of-Yahusha.'),
  ('trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid', 16, 16, 'acts', 8, 16, E'Acts 8:16''s baptism-in-the-name pattern.'),
  ('trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid', 16, 16, 'romans', 6, 3, E'Romans 6:3-4''s baptism-into-his-death architecture.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 16, 16, 'john', 10, 27, E'*The believing that saves is the hearing-that-reveals.* The believing reveals the prior election; it does not create it.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 16, 16, 'romans', 8, 29, E'Romans 8:29-30''s foreknown-predestined-called-justified-glorified chain.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 16, 16, '1-peter', 1, 2, E'1 Peter 1:2''s *elect according to the foreknowledge of Elohim the Father*.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 16, 16, 'revelation', 13, 8, E'Revelation 13:8''s names-written-before-the-foundation.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 16, 19, 'psalms', 110, 1, E'*The King received up into heaven and sat on the right hand of Elohim* — Tehillim (Psalm) 110:1 fulfilled in the ascension. (NT-Lord rule: titular/self-naming of Yahusha here; source-mixed-case *Lord* preserved as *Lord* per S182 §7.)'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 16, 19, 'mark', 14, 62, E'The Sanhedrin asked who he claimed to be; the ascension answered the question in act (Mark 14:62 echo).'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 16, 19, 'acts', 1, 9, E'Acts 1:9-11''s ascension-cloud-witness.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 16, 19, 'acts', 7, 55, E'Acts 7:55-56''s Stephen seeing the Son of Adam standing at the right hand.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 16, 19, 'hebrews', 1, 3, E'Hebrews 1:3''s *sat down on the right hand of the Majesty on high*.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 16, 20, 'acts', 14, 3, E'*The disciples going forth, the Lord working with them.* The Markan ending names the apostolic walk that Acts opens into (Acts 14:3). (NT-Lord rule: titular for ascended Yahusha — *Lord* preserved per S182 §7.)'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 16, 20, 'acts', 19, 11, E'Acts 19:11-12''s signs-and-wonders confirming the apostolic word.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 16, 20, 'hebrews', 2, 3, E'Hebrews 2:3-4''s *Elohim (God) also bearing them witness, both with signs and wonders*.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:' || i.thread_slug || E' | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s183_mark_lookup sv ON sv.book_slug = 'mark' AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s183_mark_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link these cross_references rows to their existing threads.
-- We re-walk the input list inside the JOIN so each row attaches to the
-- correct existing thread by slug. sort_order is assigned via ROW_NUMBER
-- partitioned by thread_id, starting at 100 so we don't collide with
-- any existing member sort_orders in those threads.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       100 + ROW_NUMBER() OVER (PARTITION BY t.id
                                ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                         tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON x.note LIKE 'thread:' || t.slug || ' | %'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'mark'
   AND x.source = 'manual'
   AND t.sort_order NOT BETWEEN 1201 AND 1216
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 183 mark migration complete.'
